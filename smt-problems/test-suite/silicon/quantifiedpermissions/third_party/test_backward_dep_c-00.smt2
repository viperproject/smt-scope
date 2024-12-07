(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:22:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr
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
; ---------- Ref__loop_main_72 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const len@2@01 Int)
(declare-const b@3@01 Seq<$Ref>)
(declare-const a@4@01 Seq<$Ref>)
(declare-const c@5@01 Seq<$Ref>)
(declare-const diz@6@01 $Ref)
(declare-const current_thread_id@7@01 Int)
(declare-const len@8@01 Int)
(declare-const b@9@01 Seq<$Ref>)
(declare-const a@10@01 Seq<$Ref>)
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
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@10@01) len@8@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (= (Seq_length b@9@01) len@8@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (= (Seq_length c@11@01) len@8@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { a[j], a[k] } 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> a[j] != a[k])
(declare-const j@13@01 Int)
(declare-const k@14@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> a[j] != a[k]
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 0 | !(0 <= j@13@01) | live]
; [else-branch: 0 | 0 <= j@13@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= j@13@01)]
(assert (not (<= 0 j@13@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= j@13@01]
(assert (<= 0 j@13@01))
; [eval] j < len
(push) ; 5
; [then-branch: 1 | !(j@13@01 < len@8@01) | live]
; [else-branch: 1 | j@13@01 < len@8@01 | live]
(push) ; 6
; [then-branch: 1 | !(j@13@01 < len@8@01)]
(assert (not (< j@13@01 len@8@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | j@13@01 < len@8@01]
(assert (< j@13@01 len@8@01))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 2 | !(0 <= k@14@01) | live]
; [else-branch: 2 | 0 <= k@14@01 | live]
(push) ; 8
; [then-branch: 2 | !(0 <= k@14@01)]
(assert (not (<= 0 k@14@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | 0 <= k@14@01]
(assert (<= 0 k@14@01))
; [eval] k < len
(push) ; 9
; [then-branch: 3 | !(k@14@01 < len@8@01) | live]
; [else-branch: 3 | k@14@01 < len@8@01 | live]
(push) ; 10
; [then-branch: 3 | !(k@14@01 < len@8@01)]
(assert (not (< k@14@01 len@8@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | k@14@01 < len@8@01]
(assert (< k@14@01 len@8@01))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@14@01 len@8@01) (not (< k@14@01 len@8@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@14@01)
  (and (<= 0 k@14@01) (or (< k@14@01 len@8@01) (not (< k@14@01 len@8@01))))))
(assert (or (<= 0 k@14@01) (not (<= 0 k@14@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@13@01 len@8@01)
  (and
    (< j@13@01 len@8@01)
    (=>
      (<= 0 k@14@01)
      (and (<= 0 k@14@01) (or (< k@14@01 len@8@01) (not (< k@14@01 len@8@01)))))
    (or (<= 0 k@14@01) (not (<= 0 k@14@01))))))
(assert (or (< j@13@01 len@8@01) (not (< j@13@01 len@8@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@13@01)
  (and
    (<= 0 j@13@01)
    (=>
      (< j@13@01 len@8@01)
      (and
        (< j@13@01 len@8@01)
        (=>
          (<= 0 k@14@01)
          (and
            (<= 0 k@14@01)
            (or (< k@14@01 len@8@01) (not (< k@14@01 len@8@01)))))
        (or (<= 0 k@14@01) (not (<= 0 k@14@01)))))
    (or (< j@13@01 len@8@01) (not (< j@13@01 len@8@01))))))
(assert (or (<= 0 j@13@01) (not (<= 0 j@13@01))))
(push) ; 3
; [then-branch: 4 | 0 <= j@13@01 && j@13@01 < len@8@01 && 0 <= k@14@01 && k@14@01 < len@8@01 && j@13@01 != k@14@01 | live]
; [else-branch: 4 | !(0 <= j@13@01 && j@13@01 < len@8@01 && 0 <= k@14@01 && k@14@01 < len@8@01 && j@13@01 != k@14@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= j@13@01 && j@13@01 < len@8@01 && 0 <= k@14@01 && k@14@01 < len@8@01 && j@13@01 != k@14@01]
(assert (and
  (<= 0 j@13@01)
  (and
    (< j@13@01 len@8@01)
    (and (<= 0 k@14@01) (and (< k@14@01 len@8@01) (not (= j@13@01 k@14@01)))))))
; [eval] a[j] != a[k]
; [eval] a[j]
(push) ; 5
(assert (not (>= j@13@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@13@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] a[k]
(push) ; 5
(assert (not (>= k@14@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@14@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= j@13@01 && j@13@01 < len@8@01 && 0 <= k@14@01 && k@14@01 < len@8@01 && j@13@01 != k@14@01)]
(assert (not
  (and
    (<= 0 j@13@01)
    (and
      (< j@13@01 len@8@01)
      (and (<= 0 k@14@01) (and (< k@14@01 len@8@01) (not (= j@13@01 k@14@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@13@01)
    (and
      (< j@13@01 len@8@01)
      (and (<= 0 k@14@01) (and (< k@14@01 len@8@01) (not (= j@13@01 k@14@01))))))
  (and
    (<= 0 j@13@01)
    (< j@13@01 len@8@01)
    (<= 0 k@14@01)
    (< k@14@01 len@8@01)
    (not (= j@13@01 k@14@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@13@01)
      (and
        (< j@13@01 len@8@01)
        (and (<= 0 k@14@01) (and (< k@14@01 len@8@01) (not (= j@13@01 k@14@01)))))))
  (and
    (<= 0 j@13@01)
    (and
      (< j@13@01 len@8@01)
      (and (<= 0 k@14@01) (and (< k@14@01 len@8@01) (not (= j@13@01 k@14@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@13@01 Int) (k@14@01 Int)) (!
  (and
    (=>
      (<= 0 j@13@01)
      (and
        (<= 0 j@13@01)
        (=>
          (< j@13@01 len@8@01)
          (and
            (< j@13@01 len@8@01)
            (=>
              (<= 0 k@14@01)
              (and
                (<= 0 k@14@01)
                (or (< k@14@01 len@8@01) (not (< k@14@01 len@8@01)))))
            (or (<= 0 k@14@01) (not (<= 0 k@14@01)))))
        (or (< j@13@01 len@8@01) (not (< j@13@01 len@8@01)))))
    (or (<= 0 j@13@01) (not (<= 0 j@13@01)))
    (=>
      (and
        (<= 0 j@13@01)
        (and
          (< j@13@01 len@8@01)
          (and
            (<= 0 k@14@01)
            (and (< k@14@01 len@8@01) (not (= j@13@01 k@14@01))))))
      (and
        (<= 0 j@13@01)
        (< j@13@01 len@8@01)
        (<= 0 k@14@01)
        (< k@14@01 len@8@01)
        (not (= j@13@01 k@14@01))))
    (or
      (not
        (and
          (<= 0 j@13@01)
          (and
            (< j@13@01 len@8@01)
            (and
              (<= 0 k@14@01)
              (and (< k@14@01 len@8@01) (not (= j@13@01 k@14@01)))))))
      (and
        (<= 0 j@13@01)
        (and
          (< j@13@01 len@8@01)
          (and
            (<= 0 k@14@01)
            (and (< k@14@01 len@8@01) (not (= j@13@01 k@14@01))))))))
  :pattern ((Seq_index a@10@01 j@13@01) (Seq_index a@10@01 k@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@62@12@62@102-aux|)))
(assert (forall ((j@13@01 Int) (k@14@01 Int)) (!
  (=>
    (and
      (<= 0 j@13@01)
      (and
        (< j@13@01 len@8@01)
        (and (<= 0 k@14@01) (and (< k@14@01 len@8@01) (not (= j@13@01 k@14@01))))))
    (not (= (Seq_index a@10@01 j@13@01) (Seq_index a@10@01 k@14@01))))
  :pattern ((Seq_index a@10@01 j@13@01) (Seq_index a@10@01 k@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@62@12@62@102|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(declare-const i@15@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 5 | !(0 <= i@15@01) | live]
; [else-branch: 5 | 0 <= i@15@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= i@15@01)]
(assert (not (<= 0 i@15@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= i@15@01]
(assert (<= 0 i@15@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
(assert (and (<= 0 i@15@01) (< i@15@01 len@8@01)))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@15@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@16@01 ($Ref) Int)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 len@8@01))
    (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
  :pattern ((Seq_index a@10@01 i@15@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@15@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@15@01) (< i1@15@01 len@8@01))
      (and (<= 0 i2@15@01) (< i2@15@01 len@8@01))
      (= (Seq_index a@10@01 i1@15@01) (Seq_index a@10@01 i2@15@01)))
    (= i1@15@01 i2@15@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 len@8@01))
    (and
      (= (inv@16@01 (Seq_index a@10@01 i@15@01)) i@15@01)
      (img@17@01 (Seq_index a@10@01 i@15@01))))
  :pattern ((Seq_index a@10@01 i@15@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (= (Seq_index a@10@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 len@8@01))
    (not (= (Seq_index a@10@01 i@15@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@15@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
; [eval] 0 <= 0 && 0 < len
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
; [eval] 0 < len
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(push) ; 2
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< 0 len@8@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | 0 < len@8@01 | live]
; [else-branch: 7 | !(0 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 7 | 0 < len@8@01]
(assert (< 0 len@8@01))
; [eval] a[0]
(push) ; 3
(assert (not (< 0 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@18@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) (Seq_index
    a@10@01
    0))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
(assert (<=
  $Perm.No
  (ite
    (= (Seq_index a@10@01 0) (Seq_index a@10@01 0))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (= (Seq_index a@10@01 0) (Seq_index a@10@01 0))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (= (Seq_index a@10@01 0) (Seq_index a@10@01 0))
  (not (= (Seq_index a@10@01 0) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
(declare-const i@19@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (len - 1 < len ? len - 1 : len) + 1
; [eval] 1 <= i
(push) ; 4
; [then-branch: 8 | !(1 <= i@19@01) | live]
; [else-branch: 8 | 1 <= i@19@01 | live]
(push) ; 5
; [then-branch: 8 | !(1 <= i@19@01)]
(assert (not (<= 1 i@19@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | 1 <= i@19@01]
(assert (<= 1 i@19@01))
; [eval] i < (len - 1 < len ? len - 1 : len) + 1
; [eval] (len - 1 < len ? len - 1 : len) + 1
; [eval] (len - 1 < len ? len - 1 : len)
; [eval] len - 1 < len
; [eval] len - 1
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- len@8@01 1) len@8@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- len@8@01 1) len@8@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | len@8@01 - 1 < len@8@01 | live]
; [else-branch: 9 | !(len@8@01 - 1 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 9 | len@8@01 - 1 < len@8@01]
(assert (< (- len@8@01 1) len@8@01))
; [eval] len - 1
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (< (- len@8@01 1) len@8@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (<= 1 i@19@01) (and (<= 1 i@19@01) (< (- len@8@01 1) len@8@01))))
(assert (or (<= 1 i@19@01) (not (<= 1 i@19@01))))
(assert (and (<= 1 i@19@01) (< i@19@01 (+ (- len@8@01 1) 1))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@19@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@19@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@20@01 ($Ref) Int)
(declare-fun img@21@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 1 i@19@01) (< i@19@01 (+ (- len@8@01 1) 1)))
    (and
      (=> (<= 1 i@19@01) (and (<= 1 i@19@01) (< (- len@8@01 1) len@8@01)))
      (or (<= 1 i@19@01) (not (<= 1 i@19@01)))))
  :pattern ((Seq_index a@10@01 i@19@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@19@01 Int) (i2@19@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@19@01) (< i1@19@01 (+ (- len@8@01 1) 1)))
      (and (<= 1 i2@19@01) (< i2@19@01 (+ (- len@8@01 1) 1)))
      (= (Seq_index a@10@01 i1@19@01) (Seq_index a@10@01 i2@19@01)))
    (= i1@19@01 i2@19@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 1 i@19@01) (< i@19@01 (+ (- len@8@01 1) 1)))
    (and
      (= (inv@20@01 (Seq_index a@10@01 i@19@01)) i@19@01)
      (img@21@01 (Seq_index a@10@01 i@19@01))))
  :pattern ((Seq_index a@10@01 i@19@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
    (= (Seq_index a@10@01 (inv@20@01 r)) r))
  :pattern ((inv@20@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 1 i@19@01) (< i@19@01 (+ (- len@8@01 1) 1)))
    (not (= (Seq_index a@10@01 i@19@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@19@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@10@01 i@19@01) (Seq_index a@10@01 i@15@01))
    (=
      (and
        (img@21@01 r)
        (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 3
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
; [eval] (forall j: Int, k: Int :: { b[j], b[k] } 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> b[j] != b[k])
(declare-const j@22@01 Int)
(declare-const k@23@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> b[j] != b[k]
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 10 | !(0 <= j@22@01) | live]
; [else-branch: 10 | 0 <= j@22@01 | live]
(push) ; 5
; [then-branch: 10 | !(0 <= j@22@01)]
(assert (not (<= 0 j@22@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | 0 <= j@22@01]
(assert (<= 0 j@22@01))
; [eval] j < len
(push) ; 6
; [then-branch: 11 | !(j@22@01 < len@8@01) | live]
; [else-branch: 11 | j@22@01 < len@8@01 | live]
(push) ; 7
; [then-branch: 11 | !(j@22@01 < len@8@01)]
(assert (not (< j@22@01 len@8@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 11 | j@22@01 < len@8@01]
(assert (< j@22@01 len@8@01))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 12 | !(0 <= k@23@01) | live]
; [else-branch: 12 | 0 <= k@23@01 | live]
(push) ; 9
; [then-branch: 12 | !(0 <= k@23@01)]
(assert (not (<= 0 k@23@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 12 | 0 <= k@23@01]
(assert (<= 0 k@23@01))
; [eval] k < len
(push) ; 10
; [then-branch: 13 | !(k@23@01 < len@8@01) | live]
; [else-branch: 13 | k@23@01 < len@8@01 | live]
(push) ; 11
; [then-branch: 13 | !(k@23@01 < len@8@01)]
(assert (not (< k@23@01 len@8@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 13 | k@23@01 < len@8@01]
(assert (< k@23@01 len@8@01))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@23@01 len@8@01) (not (< k@23@01 len@8@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@23@01)
  (and (<= 0 k@23@01) (or (< k@23@01 len@8@01) (not (< k@23@01 len@8@01))))))
(assert (or (<= 0 k@23@01) (not (<= 0 k@23@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@22@01 len@8@01)
  (and
    (< j@22@01 len@8@01)
    (=>
      (<= 0 k@23@01)
      (and (<= 0 k@23@01) (or (< k@23@01 len@8@01) (not (< k@23@01 len@8@01)))))
    (or (<= 0 k@23@01) (not (<= 0 k@23@01))))))
(assert (or (< j@22@01 len@8@01) (not (< j@22@01 len@8@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@22@01)
  (and
    (<= 0 j@22@01)
    (=>
      (< j@22@01 len@8@01)
      (and
        (< j@22@01 len@8@01)
        (=>
          (<= 0 k@23@01)
          (and
            (<= 0 k@23@01)
            (or (< k@23@01 len@8@01) (not (< k@23@01 len@8@01)))))
        (or (<= 0 k@23@01) (not (<= 0 k@23@01)))))
    (or (< j@22@01 len@8@01) (not (< j@22@01 len@8@01))))))
(assert (or (<= 0 j@22@01) (not (<= 0 j@22@01))))
(push) ; 4
; [then-branch: 14 | 0 <= j@22@01 && j@22@01 < len@8@01 && 0 <= k@23@01 && k@23@01 < len@8@01 && j@22@01 != k@23@01 | live]
; [else-branch: 14 | !(0 <= j@22@01 && j@22@01 < len@8@01 && 0 <= k@23@01 && k@23@01 < len@8@01 && j@22@01 != k@23@01) | live]
(push) ; 5
; [then-branch: 14 | 0 <= j@22@01 && j@22@01 < len@8@01 && 0 <= k@23@01 && k@23@01 < len@8@01 && j@22@01 != k@23@01]
(assert (and
  (<= 0 j@22@01)
  (and
    (< j@22@01 len@8@01)
    (and (<= 0 k@23@01) (and (< k@23@01 len@8@01) (not (= j@22@01 k@23@01)))))))
; [eval] b[j] != b[k]
; [eval] b[j]
(push) ; 6
(assert (not (>= j@22@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@22@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] b[k]
(push) ; 6
(assert (not (>= k@23@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@23@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(0 <= j@22@01 && j@22@01 < len@8@01 && 0 <= k@23@01 && k@23@01 < len@8@01 && j@22@01 != k@23@01)]
(assert (not
  (and
    (<= 0 j@22@01)
    (and
      (< j@22@01 len@8@01)
      (and (<= 0 k@23@01) (and (< k@23@01 len@8@01) (not (= j@22@01 k@23@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@22@01)
    (and
      (< j@22@01 len@8@01)
      (and (<= 0 k@23@01) (and (< k@23@01 len@8@01) (not (= j@22@01 k@23@01))))))
  (and
    (<= 0 j@22@01)
    (< j@22@01 len@8@01)
    (<= 0 k@23@01)
    (< k@23@01 len@8@01)
    (not (= j@22@01 k@23@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@22@01)
      (and
        (< j@22@01 len@8@01)
        (and (<= 0 k@23@01) (and (< k@23@01 len@8@01) (not (= j@22@01 k@23@01)))))))
  (and
    (<= 0 j@22@01)
    (and
      (< j@22@01 len@8@01)
      (and (<= 0 k@23@01) (and (< k@23@01 len@8@01) (not (= j@22@01 k@23@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@22@01 Int) (k@23@01 Int)) (!
  (and
    (=>
      (<= 0 j@22@01)
      (and
        (<= 0 j@22@01)
        (=>
          (< j@22@01 len@8@01)
          (and
            (< j@22@01 len@8@01)
            (=>
              (<= 0 k@23@01)
              (and
                (<= 0 k@23@01)
                (or (< k@23@01 len@8@01) (not (< k@23@01 len@8@01)))))
            (or (<= 0 k@23@01) (not (<= 0 k@23@01)))))
        (or (< j@22@01 len@8@01) (not (< j@22@01 len@8@01)))))
    (or (<= 0 j@22@01) (not (<= 0 j@22@01)))
    (=>
      (and
        (<= 0 j@22@01)
        (and
          (< j@22@01 len@8@01)
          (and
            (<= 0 k@23@01)
            (and (< k@23@01 len@8@01) (not (= j@22@01 k@23@01))))))
      (and
        (<= 0 j@22@01)
        (< j@22@01 len@8@01)
        (<= 0 k@23@01)
        (< k@23@01 len@8@01)
        (not (= j@22@01 k@23@01))))
    (or
      (not
        (and
          (<= 0 j@22@01)
          (and
            (< j@22@01 len@8@01)
            (and
              (<= 0 k@23@01)
              (and (< k@23@01 len@8@01) (not (= j@22@01 k@23@01)))))))
      (and
        (<= 0 j@22@01)
        (and
          (< j@22@01 len@8@01)
          (and
            (<= 0 k@23@01)
            (and (< k@23@01 len@8@01) (not (= j@22@01 k@23@01))))))))
  :pattern ((Seq_index b@9@01 j@22@01) (Seq_index b@9@01 k@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@66@12@66@102-aux|)))
(assert (forall ((j@22@01 Int) (k@23@01 Int)) (!
  (=>
    (and
      (<= 0 j@22@01)
      (and
        (< j@22@01 len@8@01)
        (and (<= 0 k@23@01) (and (< k@23@01 len@8@01) (not (= j@22@01 k@23@01))))))
    (not (= (Seq_index b@9@01 j@22@01) (Seq_index b@9@01 k@23@01))))
  :pattern ((Seq_index b@9@01 j@22@01) (Seq_index b@9@01 k@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@66@12@66@102|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
(declare-const i@24@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 15 | !(0 <= i@24@01) | live]
; [else-branch: 15 | 0 <= i@24@01 | live]
(push) ; 5
; [then-branch: 15 | !(0 <= i@24@01)]
(assert (not (<= 0 i@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | 0 <= i@24@01]
(assert (<= 0 i@24@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@24@01) (not (<= 0 i@24@01))))
(assert (and (<= 0 i@24@01) (< i@24@01 len@8@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@24@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@24@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@25@01 ($Ref) Int)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and (<= 0 i@24@01) (< i@24@01 len@8@01))
    (or (<= 0 i@24@01) (not (<= 0 i@24@01))))
  :pattern ((Seq_index b@9@01 i@24@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@24@01 Int) (i2@24@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@24@01) (< i1@24@01 len@8@01))
      (and (<= 0 i2@24@01) (< i2@24@01 len@8@01))
      (= (Seq_index b@9@01 i1@24@01) (Seq_index b@9@01 i2@24@01)))
    (= i1@24@01 i2@24@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and (<= 0 i@24@01) (< i@24@01 len@8@01))
    (and
      (= (inv@25@01 (Seq_index b@9@01 i@24@01)) i@24@01)
      (img@26@01 (Seq_index b@9@01 i@24@01))))
  :pattern ((Seq_index b@9@01 i@24@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
    (= (Seq_index b@9@01 (inv@25@01 r)) r))
  :pattern ((inv@25@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and (<= 0 i@24@01) (< i@24@01 len@8@01))
    (not (= (Seq_index b@9@01 i@24@01) $Ref.null)))
  :pattern ((Seq_index b@9@01 i@24@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@9@01 i@24@01) (Seq_index a@10@01 i@19@01))
    (=
      (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
      (and
        (img@21@01 r)
        (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))))
  
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
  (and
    (= (Seq_index b@9@01 i@24@01) (Seq_index a@10@01 i@15@01))
    (=
      (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
  :qid |quant-u-56|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { c[j], c[k] } 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> c[j] != c[k])
(declare-const j@27@01 Int)
(declare-const k@28@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> c[j] != c[k]
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 16 | !(0 <= j@27@01) | live]
; [else-branch: 16 | 0 <= j@27@01 | live]
(push) ; 5
; [then-branch: 16 | !(0 <= j@27@01)]
(assert (not (<= 0 j@27@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | 0 <= j@27@01]
(assert (<= 0 j@27@01))
; [eval] j < len
(push) ; 6
; [then-branch: 17 | !(j@27@01 < len@8@01) | live]
; [else-branch: 17 | j@27@01 < len@8@01 | live]
(push) ; 7
; [then-branch: 17 | !(j@27@01 < len@8@01)]
(assert (not (< j@27@01 len@8@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 17 | j@27@01 < len@8@01]
(assert (< j@27@01 len@8@01))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 18 | !(0 <= k@28@01) | live]
; [else-branch: 18 | 0 <= k@28@01 | live]
(push) ; 9
; [then-branch: 18 | !(0 <= k@28@01)]
(assert (not (<= 0 k@28@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 18 | 0 <= k@28@01]
(assert (<= 0 k@28@01))
; [eval] k < len
(push) ; 10
; [then-branch: 19 | !(k@28@01 < len@8@01) | live]
; [else-branch: 19 | k@28@01 < len@8@01 | live]
(push) ; 11
; [then-branch: 19 | !(k@28@01 < len@8@01)]
(assert (not (< k@28@01 len@8@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 19 | k@28@01 < len@8@01]
(assert (< k@28@01 len@8@01))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@28@01 len@8@01) (not (< k@28@01 len@8@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@28@01)
  (and (<= 0 k@28@01) (or (< k@28@01 len@8@01) (not (< k@28@01 len@8@01))))))
(assert (or (<= 0 k@28@01) (not (<= 0 k@28@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@27@01 len@8@01)
  (and
    (< j@27@01 len@8@01)
    (=>
      (<= 0 k@28@01)
      (and (<= 0 k@28@01) (or (< k@28@01 len@8@01) (not (< k@28@01 len@8@01)))))
    (or (<= 0 k@28@01) (not (<= 0 k@28@01))))))
(assert (or (< j@27@01 len@8@01) (not (< j@27@01 len@8@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@27@01)
  (and
    (<= 0 j@27@01)
    (=>
      (< j@27@01 len@8@01)
      (and
        (< j@27@01 len@8@01)
        (=>
          (<= 0 k@28@01)
          (and
            (<= 0 k@28@01)
            (or (< k@28@01 len@8@01) (not (< k@28@01 len@8@01)))))
        (or (<= 0 k@28@01) (not (<= 0 k@28@01)))))
    (or (< j@27@01 len@8@01) (not (< j@27@01 len@8@01))))))
(assert (or (<= 0 j@27@01) (not (<= 0 j@27@01))))
(push) ; 4
; [then-branch: 20 | 0 <= j@27@01 && j@27@01 < len@8@01 && 0 <= k@28@01 && k@28@01 < len@8@01 && j@27@01 != k@28@01 | live]
; [else-branch: 20 | !(0 <= j@27@01 && j@27@01 < len@8@01 && 0 <= k@28@01 && k@28@01 < len@8@01 && j@27@01 != k@28@01) | live]
(push) ; 5
; [then-branch: 20 | 0 <= j@27@01 && j@27@01 < len@8@01 && 0 <= k@28@01 && k@28@01 < len@8@01 && j@27@01 != k@28@01]
(assert (and
  (<= 0 j@27@01)
  (and
    (< j@27@01 len@8@01)
    (and (<= 0 k@28@01) (and (< k@28@01 len@8@01) (not (= j@27@01 k@28@01)))))))
; [eval] c[j] != c[k]
; [eval] c[j]
(push) ; 6
(assert (not (>= j@27@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@27@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] c[k]
(push) ; 6
(assert (not (>= k@28@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@28@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(0 <= j@27@01 && j@27@01 < len@8@01 && 0 <= k@28@01 && k@28@01 < len@8@01 && j@27@01 != k@28@01)]
(assert (not
  (and
    (<= 0 j@27@01)
    (and
      (< j@27@01 len@8@01)
      (and (<= 0 k@28@01) (and (< k@28@01 len@8@01) (not (= j@27@01 k@28@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@27@01)
    (and
      (< j@27@01 len@8@01)
      (and (<= 0 k@28@01) (and (< k@28@01 len@8@01) (not (= j@27@01 k@28@01))))))
  (and
    (<= 0 j@27@01)
    (< j@27@01 len@8@01)
    (<= 0 k@28@01)
    (< k@28@01 len@8@01)
    (not (= j@27@01 k@28@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@27@01)
      (and
        (< j@27@01 len@8@01)
        (and (<= 0 k@28@01) (and (< k@28@01 len@8@01) (not (= j@27@01 k@28@01)))))))
  (and
    (<= 0 j@27@01)
    (and
      (< j@27@01 len@8@01)
      (and (<= 0 k@28@01) (and (< k@28@01 len@8@01) (not (= j@27@01 k@28@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@27@01 Int) (k@28@01 Int)) (!
  (and
    (=>
      (<= 0 j@27@01)
      (and
        (<= 0 j@27@01)
        (=>
          (< j@27@01 len@8@01)
          (and
            (< j@27@01 len@8@01)
            (=>
              (<= 0 k@28@01)
              (and
                (<= 0 k@28@01)
                (or (< k@28@01 len@8@01) (not (< k@28@01 len@8@01)))))
            (or (<= 0 k@28@01) (not (<= 0 k@28@01)))))
        (or (< j@27@01 len@8@01) (not (< j@27@01 len@8@01)))))
    (or (<= 0 j@27@01) (not (<= 0 j@27@01)))
    (=>
      (and
        (<= 0 j@27@01)
        (and
          (< j@27@01 len@8@01)
          (and
            (<= 0 k@28@01)
            (and (< k@28@01 len@8@01) (not (= j@27@01 k@28@01))))))
      (and
        (<= 0 j@27@01)
        (< j@27@01 len@8@01)
        (<= 0 k@28@01)
        (< k@28@01 len@8@01)
        (not (= j@27@01 k@28@01))))
    (or
      (not
        (and
          (<= 0 j@27@01)
          (and
            (< j@27@01 len@8@01)
            (and
              (<= 0 k@28@01)
              (and (< k@28@01 len@8@01) (not (= j@27@01 k@28@01)))))))
      (and
        (<= 0 j@27@01)
        (and
          (< j@27@01 len@8@01)
          (and
            (<= 0 k@28@01)
            (and (< k@28@01 len@8@01) (not (= j@27@01 k@28@01))))))))
  :pattern ((Seq_index c@11@01 j@27@01) (Seq_index c@11@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@68@12@68@102-aux|)))
(assert (forall ((j@27@01 Int) (k@28@01 Int)) (!
  (=>
    (and
      (<= 0 j@27@01)
      (and
        (< j@27@01 len@8@01)
        (and (<= 0 k@28@01) (and (< k@28@01 len@8@01) (not (= j@27@01 k@28@01))))))
    (not (= (Seq_index c@11@01 j@27@01) (Seq_index c@11@01 k@28@01))))
  :pattern ((Seq_index c@11@01 j@27@01) (Seq_index c@11@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@68@12@68@102|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))))
(declare-const i@29@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 21 | !(0 <= i@29@01) | live]
; [else-branch: 21 | 0 <= i@29@01 | live]
(push) ; 5
; [then-branch: 21 | !(0 <= i@29@01)]
(assert (not (<= 0 i@29@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | 0 <= i@29@01]
(assert (<= 0 i@29@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
(assert (and (<= 0 i@29@01) (< i@29@01 len@8@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@29@01 (Seq_length c@11@01))))
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
    (and (<= 0 i@29@01) (< i@29@01 len@8@01))
    (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
  :pattern ((Seq_index c@11@01 i@29@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@29@01) (< i1@29@01 len@8@01))
      (and (<= 0 i2@29@01) (< i2@29@01 len@8@01))
      (= (Seq_index c@11@01 i1@29@01) (Seq_index c@11@01 i2@29@01)))
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
    (and (<= 0 i@29@01) (< i@29@01 len@8@01))
    (and
      (= (inv@30@01 (Seq_index c@11@01 i@29@01)) i@29@01)
      (img@31@01 (Seq_index c@11@01 i@29@01))))
  :pattern ((Seq_index c@11@01 i@29@01))
  :qid |quant-u-58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
    (= (Seq_index c@11@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 0 i@29@01) (< i@29@01 len@8@01))
    (not (= (Seq_index c@11@01 i@29@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@29@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@29@01) (Seq_index b@9@01 i@24@01))
    (=
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
      (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))))
  
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
    (= (Seq_index c@11@01 i@29@01) (Seq_index a@10@01 i@19@01))
    (=
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
      (and
        (img@21@01 r)
        (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))))
  
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
    (= (Seq_index c@11@01 i@29@01) (Seq_index a@10@01 i@15@01))
    (=
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
  $Snap.unit))
; [eval] (forall __rw_i1: Int :: { a[__rw_i1] } true ==> 0 <= __rw_i1 - 1 && __rw_i1 - 1 < (len - 1 < len ? len - 1 : len) ==> a[__rw_i1].Ref__Integer_value == 0)
(declare-const __rw_i1@32@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> 0 <= __rw_i1 - 1 && __rw_i1 - 1 < (len - 1 < len ? len - 1 : len) ==> a[__rw_i1].Ref__Integer_value == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | True]
; [eval] 0 <= __rw_i1 - 1 && __rw_i1 - 1 < (len - 1 < len ? len - 1 : len) ==> a[__rw_i1].Ref__Integer_value == 0
; [eval] 0 <= __rw_i1 - 1 && __rw_i1 - 1 < (len - 1 < len ? len - 1 : len)
; [eval] 0 <= __rw_i1 - 1
; [eval] __rw_i1 - 1
(push) ; 6
; [then-branch: 23 | !(0 <= __rw_i1@32@01 - 1) | live]
; [else-branch: 23 | 0 <= __rw_i1@32@01 - 1 | live]
(push) ; 7
; [then-branch: 23 | !(0 <= __rw_i1@32@01 - 1)]
(assert (not (<= 0 (- __rw_i1@32@01 1))))
(pop) ; 7
(push) ; 7
; [else-branch: 23 | 0 <= __rw_i1@32@01 - 1]
(assert (<= 0 (- __rw_i1@32@01 1)))
; [eval] __rw_i1 - 1 < (len - 1 < len ? len - 1 : len)
; [eval] __rw_i1 - 1
; [eval] (len - 1 < len ? len - 1 : len)
; [eval] len - 1 < len
; [eval] len - 1
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (< (- len@8@01 1) len@8@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< (- len@8@01 1) len@8@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | len@8@01 - 1 < len@8@01 | live]
; [else-branch: 24 | !(len@8@01 - 1 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 24 | len@8@01 - 1 < len@8@01]
(assert (< (- len@8@01 1) len@8@01))
; [eval] len - 1
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (< (- len@8@01 1) len@8@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 (- __rw_i1@32@01 1))
  (and (<= 0 (- __rw_i1@32@01 1)) (< (- len@8@01 1) len@8@01))))
(assert (or (<= 0 (- __rw_i1@32@01 1)) (not (<= 0 (- __rw_i1@32@01 1)))))
(push) ; 6
; [then-branch: 25 | 0 <= __rw_i1@32@01 - 1 && __rw_i1@32@01 - 1 < len@8@01 - 1 | live]
; [else-branch: 25 | !(0 <= __rw_i1@32@01 - 1 && __rw_i1@32@01 - 1 < len@8@01 - 1) | live]
(push) ; 7
; [then-branch: 25 | 0 <= __rw_i1@32@01 - 1 && __rw_i1@32@01 - 1 < len@8@01 - 1]
(assert (and (<= 0 (- __rw_i1@32@01 1)) (< (- __rw_i1@32@01 1) (- len@8@01 1))))
; [eval] a[__rw_i1].Ref__Integer_value == 0
; [eval] a[__rw_i1]
(push) ; 8
(assert (not (>= __rw_i1@32@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< __rw_i1@32@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(declare-const sm@33@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index a@10@01 0))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@34@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@34@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite
              (and
                (img@17@01 r)
                (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
              (/ (to_real 1) (to_real 2))
              $Perm.No)
            (ite
              (= r (Seq_index a@10@01 0))
              (/ (to_real 1) (to_real 2))
              $Perm.No))
          (ite
            (and
              (img@21@01 r)
              (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
            (/ (to_real 1) (to_real 2))
            $Perm.No))
        (ite
          (and
            (img@26@01 r)
            (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(push) ; 8
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@34@01  $FPM) (Seq_index
    a@10@01
    __rw_i1@32@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 25 | !(0 <= __rw_i1@32@01 - 1 && __rw_i1@32@01 - 1 < len@8@01 - 1)]
(assert (not (and (<= 0 (- __rw_i1@32@01 1)) (< (- __rw_i1@32@01 1) (- len@8@01 1)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index a@10@01 0))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@34@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite
              (and
                (img@17@01 r)
                (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
              (/ (to_real 1) (to_real 2))
              $Perm.No)
            (ite
              (= r (Seq_index a@10@01 0))
              (/ (to_real 1) (to_real 2))
              $Perm.No))
          (ite
            (and
              (img@21@01 r)
              (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
            (/ (to_real 1) (to_real 2))
            $Perm.No))
        (ite
          (and
            (img@26@01 r)
            (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 (- __rw_i1@32@01 1)) (< (- __rw_i1@32@01 1) (- len@8@01 1))))
  (and (<= 0 (- __rw_i1@32@01 1)) (< (- __rw_i1@32@01 1) (- len@8@01 1)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index a@10@01 0))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@34@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite
              (and
                (img@17@01 r)
                (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
              (/ (to_real 1) (to_real 2))
              $Perm.No)
            (ite
              (= r (Seq_index a@10@01 0))
              (/ (to_real 1) (to_real 2))
              $Perm.No))
          (ite
            (and
              (img@21@01 r)
              (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
            (/ (to_real 1) (to_real 2))
            $Perm.No))
        (ite
          (and
            (img@26@01 r)
            (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (and
  (=>
    (<= 0 (- __rw_i1@32@01 1))
    (and (<= 0 (- __rw_i1@32@01 1)) (< (- len@8@01 1) len@8@01)))
  (or (<= 0 (- __rw_i1@32@01 1)) (not (<= 0 (- __rw_i1@32@01 1))))
  (or
    (not (and (<= 0 (- __rw_i1@32@01 1)) (< (- __rw_i1@32@01 1) (- len@8@01 1))))
    (and (<= 0 (- __rw_i1@32@01 1)) (< (- __rw_i1@32@01 1) (- len@8@01 1))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index a@10@01 0))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@34@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite
              (and
                (img@17@01 r)
                (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
              (/ (to_real 1) (to_real 2))
              $Perm.No)
            (ite
              (= r (Seq_index a@10@01 0))
              (/ (to_real 1) (to_real 2))
              $Perm.No))
          (ite
            (and
              (img@21@01 r)
              (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
            (/ (to_real 1) (to_real 2))
            $Perm.No))
        (ite
          (and
            (img@26@01 r)
            (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((__rw_i1@32@01 Int)) (!
  (and
    (=>
      (<= 0 (- __rw_i1@32@01 1))
      (and (<= 0 (- __rw_i1@32@01 1)) (< (- len@8@01 1) len@8@01)))
    (or (<= 0 (- __rw_i1@32@01 1)) (not (<= 0 (- __rw_i1@32@01 1))))
    (or
      (not
        (and (<= 0 (- __rw_i1@32@01 1)) (< (- __rw_i1@32@01 1) (- len@8@01 1))))
      (and (<= 0 (- __rw_i1@32@01 1)) (< (- __rw_i1@32@01 1) (- len@8@01 1)))))
  :pattern ((Seq_index a@10@01 __rw_i1@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@70@13@70@118-aux|)))
(assert (forall ((__rw_i1@32@01 Int)) (!
  (=>
    (and (<= 0 (- __rw_i1@32@01 1)) (< (- __rw_i1@32@01 1) (- len@8@01 1)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) (Seq_index
        a@10@01
        __rw_i1@32@01))
      0))
  :pattern ((Seq_index a@10@01 __rw_i1@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@70@13@70@118|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { b[i] } 0 <= i && i < len ==> b[i].Ref__Integer_value == i)
(declare-const i@35@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> b[i].Ref__Integer_value == i
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 26 | !(0 <= i@35@01) | live]
; [else-branch: 26 | 0 <= i@35@01 | live]
(push) ; 5
; [then-branch: 26 | !(0 <= i@35@01)]
(assert (not (<= 0 i@35@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | 0 <= i@35@01]
(assert (<= 0 i@35@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@35@01) (not (<= 0 i@35@01))))
(push) ; 4
; [then-branch: 27 | 0 <= i@35@01 && i@35@01 < len@8@01 | live]
; [else-branch: 27 | !(0 <= i@35@01 && i@35@01 < len@8@01) | live]
(push) ; 5
; [then-branch: 27 | 0 <= i@35@01 && i@35@01 < len@8@01]
(assert (and (<= 0 i@35@01) (< i@35@01 len@8@01)))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 6
(assert (not (>= i@35@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@35@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index a@10@01 0))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@21@01 r)
        (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
    :qid |qp.fvfValDef4|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (and
              (img@17@01 (Seq_index b@9@01 i@35@01))
              (and
                (<= 0 (inv@16@01 (Seq_index b@9@01 i@35@01)))
                (< (inv@16@01 (Seq_index b@9@01 i@35@01)) len@8@01)))
            (/ (to_real 1) (to_real 2))
            $Perm.No)
          (ite
            (= (Seq_index b@9@01 i@35@01) (Seq_index a@10@01 0))
            (/ (to_real 1) (to_real 2))
            $Perm.No))
        (ite
          (and
            (img@21@01 (Seq_index b@9@01 i@35@01))
            (and
              (<= 1 (inv@20@01 (Seq_index b@9@01 i@35@01)))
              (< (inv@20@01 (Seq_index b@9@01 i@35@01)) (+ (- len@8@01 1) 1))))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@26@01 (Seq_index b@9@01 i@35@01))
          (and
            (<= 0 (inv@25@01 (Seq_index b@9@01 i@35@01)))
            (< (inv@25@01 (Seq_index b@9@01 i@35@01)) len@8@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@31@01 (Seq_index b@9@01 i@35@01))
        (and
          (<= 0 (inv@30@01 (Seq_index b@9@01 i@35@01)))
          (< (inv@30@01 (Seq_index b@9@01 i@35@01)) len@8@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 27 | !(0 <= i@35@01 && i@35@01 < len@8@01)]
(assert (not (and (<= 0 i@35@01) (< i@35@01 len@8@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index a@10@01 0))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@35@01) (< i@35@01 len@8@01)))
  (and (<= 0 i@35@01) (< i@35@01 len@8@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index a@10@01 0))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 1 (inv@20@01 r)) (< (inv@20@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@35@01 Int)) (!
  (and
    (or (<= 0 i@35@01) (not (<= 0 i@35@01)))
    (or
      (not (and (<= 0 i@35@01) (< i@35@01 len@8@01)))
      (and (<= 0 i@35@01) (< i@35@01 len@8@01))))
  :pattern ((Seq_index b@9@01 i@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@71@13@71@86-aux|)))
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and (<= 0 i@35@01) (< i@35@01 len@8@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@33@01  $FVF<Ref__Integer_value>) (Seq_index
        b@9@01
        i@35@01))
      i@35@01))
  :pattern ((Seq_index b@9@01 i@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@71@13@71@86|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.first $t@36@01) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(assert (= ($Snap.first ($Snap.second $t@36@01)) $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second $t@36@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@36@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@36@01))) $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@36@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
(declare-const i@37@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 28 | !(0 <= i@37@01) | live]
; [else-branch: 28 | 0 <= i@37@01 | live]
(push) ; 6
; [then-branch: 28 | !(0 <= i@37@01)]
(assert (not (<= 0 i@37@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 28 | 0 <= i@37@01]
(assert (<= 0 i@37@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@37@01) (not (<= 0 i@37@01))))
(assert (and (<= 0 i@37@01) (< i@37@01 len@8@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@37@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@37@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@38@01 ($Ref) Int)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and (<= 0 i@37@01) (< i@37@01 len@8@01))
    (or (<= 0 i@37@01) (not (<= 0 i@37@01))))
  :pattern ((Seq_index a@10@01 i@37@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@37@01 Int) (i2@37@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@37@01) (< i1@37@01 len@8@01))
      (and (<= 0 i2@37@01) (< i2@37@01 len@8@01))
      (= (Seq_index a@10@01 i1@37@01) (Seq_index a@10@01 i2@37@01)))
    (= i1@37@01 i2@37@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and (<= 0 i@37@01) (< i@37@01 len@8@01))
    (and
      (= (inv@38@01 (Seq_index a@10@01 i@37@01)) i@37@01)
      (img@39@01 (Seq_index a@10@01 i@37@01))))
  :pattern ((Seq_index a@10@01 i@37@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
    (= (Seq_index a@10@01 (inv@38@01 r)) r))
  :pattern ((inv@38@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and (<= 0 i@37@01) (< i@37@01 len@8@01))
    (not (= (Seq_index a@10@01 i@37@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@37@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
(declare-const i@40@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 29 | !(0 <= i@40@01) | live]
; [else-branch: 29 | 0 <= i@40@01 | live]
(push) ; 6
; [then-branch: 29 | !(0 <= i@40@01)]
(assert (not (<= 0 i@40@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 29 | 0 <= i@40@01]
(assert (<= 0 i@40@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@40@01) (not (<= 0 i@40@01))))
(assert (and (<= 0 i@40@01) (< i@40@01 len@8@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@40@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@40@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@41@01 ($Ref) Int)
(declare-fun img@42@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@40@01 Int)) (!
  (=>
    (and (<= 0 i@40@01) (< i@40@01 len@8@01))
    (or (<= 0 i@40@01) (not (<= 0 i@40@01))))
  :pattern ((Seq_index b@9@01 i@40@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@40@01 Int) (i2@40@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@40@01) (< i1@40@01 len@8@01))
      (and (<= 0 i2@40@01) (< i2@40@01 len@8@01))
      (= (Seq_index b@9@01 i1@40@01) (Seq_index b@9@01 i2@40@01)))
    (= i1@40@01 i2@40@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@40@01 Int)) (!
  (=>
    (and (<= 0 i@40@01) (< i@40@01 len@8@01))
    (and
      (= (inv@41@01 (Seq_index b@9@01 i@40@01)) i@40@01)
      (img@42@01 (Seq_index b@9@01 i@40@01))))
  :pattern ((Seq_index b@9@01 i@40@01))
  :qid |quant-u-65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
    (= (Seq_index b@9@01 (inv@41@01 r)) r))
  :pattern ((inv@41@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@40@01 Int)) (!
  (=>
    (and (<= 0 i@40@01) (< i@40@01 len@8@01))
    (not (= (Seq_index b@9@01 i@40@01) $Ref.null)))
  :pattern ((Seq_index b@9@01 i@40@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@9@01 i@40@01) (Seq_index a@10@01 i@37@01))
    (=
      (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
      (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))))
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))))
(declare-const i@43@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 30 | !(0 <= i@43@01) | live]
; [else-branch: 30 | 0 <= i@43@01 | live]
(push) ; 6
; [then-branch: 30 | !(0 <= i@43@01)]
(assert (not (<= 0 i@43@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 30 | 0 <= i@43@01]
(assert (<= 0 i@43@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@43@01) (not (<= 0 i@43@01))))
(assert (and (<= 0 i@43@01) (< i@43@01 len@8@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@43@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@43@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@44@01 ($Ref) Int)
(declare-fun img@45@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@43@01 Int)) (!
  (=>
    (and (<= 0 i@43@01) (< i@43@01 len@8@01))
    (or (<= 0 i@43@01) (not (<= 0 i@43@01))))
  :pattern ((Seq_index c@11@01 i@43@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@43@01 Int) (i2@43@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@43@01) (< i1@43@01 len@8@01))
      (and (<= 0 i2@43@01) (< i2@43@01 len@8@01))
      (= (Seq_index c@11@01 i1@43@01) (Seq_index c@11@01 i2@43@01)))
    (= i1@43@01 i2@43@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@43@01 Int)) (!
  (=>
    (and (<= 0 i@43@01) (< i@43@01 len@8@01))
    (and
      (= (inv@44@01 (Seq_index c@11@01 i@43@01)) i@43@01)
      (img@45@01 (Seq_index c@11@01 i@43@01))))
  :pattern ((Seq_index c@11@01 i@43@01))
  :qid |quant-u-68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
    (= (Seq_index c@11@01 (inv@44@01 r)) r))
  :pattern ((inv@44@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@43@01 Int)) (!
  (=>
    (and (<= 0 i@43@01) (< i@43@01 len@8@01))
    (not (= (Seq_index c@11@01 i@43@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@43@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@43@01) (Seq_index b@9@01 i@40@01))
    (=
      (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
      (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))))
  
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
    (= (Seq_index c@11@01 i@43@01) (Seq_index a@10@01 i@37@01))
    (=
      (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
      (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
  $Snap.unit))
; [eval] (forall i: Int :: { a[i] } 0 <= i && i < len ==> a[i].Ref__Integer_value == i + 1)
(declare-const i@46@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == i + 1
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 31 | !(0 <= i@46@01) | live]
; [else-branch: 31 | 0 <= i@46@01 | live]
(push) ; 6
; [then-branch: 31 | !(0 <= i@46@01)]
(assert (not (<= 0 i@46@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 31 | 0 <= i@46@01]
(assert (<= 0 i@46@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@46@01) (not (<= 0 i@46@01))))
(push) ; 5
; [then-branch: 32 | 0 <= i@46@01 && i@46@01 < len@8@01 | live]
; [else-branch: 32 | !(0 <= i@46@01 && i@46@01 < len@8@01) | live]
(push) ; 6
; [then-branch: 32 | 0 <= i@46@01 && i@46@01 < len@8@01]
(assert (and (<= 0 i@46@01) (< i@46@01 len@8@01)))
; [eval] a[i].Ref__Integer_value == i + 1
; [eval] a[i]
(push) ; 7
(assert (not (>= i@46@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@46@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@47@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@48@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@48@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@39@01 r)
            (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@42@01 r)
            (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(push) ; 7
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@48@01  $FPM) (Seq_index a@10@01 i@46@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i + 1
(pop) ; 6
(push) ; 6
; [else-branch: 32 | !(0 <= i@46@01 && i@46@01 < len@8@01)]
(assert (not (and (<= 0 i@46@01) (< i@46@01 len@8@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@48@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@39@01 r)
            (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@42@01 r)
            (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@46@01) (< i@46@01 len@8@01)))
  (and (<= 0 i@46@01) (< i@46@01 len@8@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@48@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@39@01 r)
            (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@42@01 r)
            (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@46@01 Int)) (!
  (and
    (or (<= 0 i@46@01) (not (<= 0 i@46@01)))
    (or
      (not (and (<= 0 i@46@01) (< i@46@01 len@8@01)))
      (and (<= 0 i@46@01) (< i@46@01 len@8@01))))
  :pattern ((Seq_index a@10@01 i@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@76@12@76@89-aux|)))
(assert (forall ((i@46@01 Int)) (!
  (=>
    (and (<= 0 i@46@01) (< i@46@01 len@8@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) (Seq_index
        a@10@01
        i@46@01))
      (+ i@46@01 1)))
  :pattern ((Seq_index a@10@01 i@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@76@12@76@89|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { b[i] } 0 <= i && i < len ==> b[i].Ref__Integer_value == i)
(declare-const i@49@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len ==> b[i].Ref__Integer_value == i
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 33 | !(0 <= i@49@01) | live]
; [else-branch: 33 | 0 <= i@49@01 | live]
(push) ; 6
; [then-branch: 33 | !(0 <= i@49@01)]
(assert (not (<= 0 i@49@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 33 | 0 <= i@49@01]
(assert (<= 0 i@49@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@49@01) (not (<= 0 i@49@01))))
(push) ; 5
; [then-branch: 34 | 0 <= i@49@01 && i@49@01 < len@8@01 | live]
; [else-branch: 34 | !(0 <= i@49@01 && i@49@01 < len@8@01) | live]
(push) ; 6
; [then-branch: 34 | 0 <= i@49@01 && i@49@01 < len@8@01]
(assert (and (<= 0 i@49@01) (< i@49@01 len@8@01)))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 7
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@49@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r))
    :qid |qp.fvfValDef8|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@39@01 (Seq_index b@9@01 i@49@01))
          (and
            (<= 0 (inv@38@01 (Seq_index b@9@01 i@49@01)))
            (< (inv@38@01 (Seq_index b@9@01 i@49@01)) len@8@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@42@01 (Seq_index b@9@01 i@49@01))
          (and
            (<= 0 (inv@41@01 (Seq_index b@9@01 i@49@01)))
            (< (inv@41@01 (Seq_index b@9@01 i@49@01)) len@8@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@45@01 (Seq_index b@9@01 i@49@01))
        (and
          (<= 0 (inv@44@01 (Seq_index b@9@01 i@49@01)))
          (< (inv@44@01 (Seq_index b@9@01 i@49@01)) len@8@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 34 | !(0 <= i@49@01 && i@49@01 < len@8@01)]
(assert (not (and (<= 0 i@49@01) (< i@49@01 len@8@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r))
  :qid |qp.fvfValDef8|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@49@01) (< i@49@01 len@8@01)))
  (and (<= 0 i@49@01) (< i@49@01 len@8@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r))
  :qid |qp.fvfValDef8|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@49@01 Int)) (!
  (and
    (or (<= 0 i@49@01) (not (<= 0 i@49@01)))
    (or
      (not (and (<= 0 i@49@01) (< i@49@01 len@8@01)))
      (and (<= 0 i@49@01) (< i@49@01 len@8@01))))
  :pattern ((Seq_index b@9@01 i@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@77@12@77@85-aux|)))
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 len@8@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) (Seq_index
        b@9@01
        i@49@01))
      i@49@01))
  :pattern ((Seq_index b@9@01 i@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@77@12@77@85|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { c[i] } 0 <= i && i < (len - 1 < len ? len - 1 : len) ==> c[i].Ref__Integer_value == 2)
(declare-const i@50@01 Int)
(push) ; 4
; [eval] 0 <= i && i < (len - 1 < len ? len - 1 : len) ==> c[i].Ref__Integer_value == 2
; [eval] 0 <= i && i < (len - 1 < len ? len - 1 : len)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 35 | !(0 <= i@50@01) | live]
; [else-branch: 35 | 0 <= i@50@01 | live]
(push) ; 6
; [then-branch: 35 | !(0 <= i@50@01)]
(assert (not (<= 0 i@50@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 35 | 0 <= i@50@01]
(assert (<= 0 i@50@01))
; [eval] i < (len - 1 < len ? len - 1 : len)
; [eval] (len - 1 < len ? len - 1 : len)
; [eval] len - 1 < len
; [eval] len - 1
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- len@8@01 1) len@8@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- len@8@01 1) len@8@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | len@8@01 - 1 < len@8@01 | live]
; [else-branch: 36 | !(len@8@01 - 1 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 36 | len@8@01 - 1 < len@8@01]
(assert (< (- len@8@01 1) len@8@01))
; [eval] len - 1
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- len@8@01 1) len@8@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=> (<= 0 i@50@01) (and (<= 0 i@50@01) (< (- len@8@01 1) len@8@01))))
(assert (or (<= 0 i@50@01) (not (<= 0 i@50@01))))
(push) ; 5
; [then-branch: 37 | 0 <= i@50@01 && i@50@01 < len@8@01 - 1 | live]
; [else-branch: 37 | !(0 <= i@50@01 && i@50@01 < len@8@01 - 1) | live]
(push) ; 6
; [then-branch: 37 | 0 <= i@50@01 && i@50@01 < len@8@01 - 1]
(assert (and (<= 0 i@50@01) (< i@50@01 (- len@8@01 1))))
; [eval] c[i].Ref__Integer_value == 2
; [eval] c[i]
(push) ; 7
(assert (not (>= i@50@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@50@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r))
    :qid |qp.fvfValDef8|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@39@01 (Seq_index c@11@01 i@50@01))
          (and
            (<= 0 (inv@38@01 (Seq_index c@11@01 i@50@01)))
            (< (inv@38@01 (Seq_index c@11@01 i@50@01)) len@8@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@42@01 (Seq_index c@11@01 i@50@01))
          (and
            (<= 0 (inv@41@01 (Seq_index c@11@01 i@50@01)))
            (< (inv@41@01 (Seq_index c@11@01 i@50@01)) len@8@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@45@01 (Seq_index c@11@01 i@50@01))
        (and
          (<= 0 (inv@44@01 (Seq_index c@11@01 i@50@01)))
          (< (inv@44@01 (Seq_index c@11@01 i@50@01)) len@8@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 37 | !(0 <= i@50@01 && i@50@01 < len@8@01 - 1)]
(assert (not (and (<= 0 i@50@01) (< i@50@01 (- len@8@01 1)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r))
  :qid |qp.fvfValDef8|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@50@01) (< i@50@01 (- len@8@01 1))))
  (and (<= 0 i@50@01) (< i@50@01 (- len@8@01 1)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@45@01 r) (and (<= 0 (inv@44@01 r)) (< (inv@44@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))) r))
  :qid |qp.fvfValDef8|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@50@01 Int)) (!
  (and
    (=> (<= 0 i@50@01) (and (<= 0 i@50@01) (< (- len@8@01 1) len@8@01)))
    (or (<= 0 i@50@01) (not (<= 0 i@50@01)))
    (or
      (not (and (<= 0 i@50@01) (< i@50@01 (- len@8@01 1))))
      (and (<= 0 i@50@01) (< i@50@01 (- len@8@01 1)))))
  :pattern ((Seq_index c@11@01 i@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@78@12@78@113-aux|)))
(assert (forall ((i@50@01 Int)) (!
  (=>
    (and (<= 0 i@50@01) (< i@50@01 (- len@8@01 1)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@47@01  $FVF<Ref__Integer_value>) (Seq_index
        c@11@01
        i@50@01))
      2))
  :pattern ((Seq_index c@11@01 i@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@78@12@78@113|)))
(pop) ; 3
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 7 | !(0 < len@8@01)]
(assert (not (< 0 len@8@01)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
(declare-const i@51@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (len - 1 < len ? len - 1 : len) + 1
; [eval] 1 <= i
(push) ; 4
; [then-branch: 38 | !(1 <= i@51@01) | live]
; [else-branch: 38 | 1 <= i@51@01 | live]
(push) ; 5
; [then-branch: 38 | !(1 <= i@51@01)]
(assert (not (<= 1 i@51@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 38 | 1 <= i@51@01]
(assert (<= 1 i@51@01))
; [eval] i < (len - 1 < len ? len - 1 : len) + 1
; [eval] (len - 1 < len ? len - 1 : len) + 1
; [eval] (len - 1 < len ? len - 1 : len)
; [eval] len - 1 < len
; [eval] len - 1
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- len@8@01 1) len@8@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- len@8@01 1) len@8@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | len@8@01 - 1 < len@8@01 | live]
; [else-branch: 39 | !(len@8@01 - 1 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 39 | len@8@01 - 1 < len@8@01]
(assert (< (- len@8@01 1) len@8@01))
; [eval] len - 1
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (< (- len@8@01 1) len@8@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (<= 1 i@51@01) (and (<= 1 i@51@01) (< (- len@8@01 1) len@8@01))))
(assert (or (<= 1 i@51@01) (not (<= 1 i@51@01))))
(assert (and (<= 1 i@51@01) (< i@51@01 (+ (- len@8@01 1) 1))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@51@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@51@01 (Seq_length a@10@01))))
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
(assert (forall ((i@51@01 Int)) (!
  (=>
    (and (<= 1 i@51@01) (< i@51@01 (+ (- len@8@01 1) 1)))
    (and
      (=> (<= 1 i@51@01) (and (<= 1 i@51@01) (< (- len@8@01 1) len@8@01)))
      (or (<= 1 i@51@01) (not (<= 1 i@51@01)))))
  :pattern ((Seq_index a@10@01 i@51@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@51@01 Int) (i2@51@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@51@01) (< i1@51@01 (+ (- len@8@01 1) 1)))
      (and (<= 1 i2@51@01) (< i2@51@01 (+ (- len@8@01 1) 1)))
      (= (Seq_index a@10@01 i1@51@01) (Seq_index a@10@01 i2@51@01)))
    (= i1@51@01 i2@51@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@51@01 Int)) (!
  (=>
    (and (<= 1 i@51@01) (< i@51@01 (+ (- len@8@01 1) 1)))
    (and
      (= (inv@52@01 (Seq_index a@10@01 i@51@01)) i@51@01)
      (img@53@01 (Seq_index a@10@01 i@51@01))))
  :pattern ((Seq_index a@10@01 i@51@01))
  :qid |quant-u-72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
    (= (Seq_index a@10@01 (inv@52@01 r)) r))
  :pattern ((inv@52@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@51@01 Int)) (!
  (=>
    (and (<= 1 i@51@01) (< i@51@01 (+ (- len@8@01 1) 1)))
    (not (= (Seq_index a@10@01 i@51@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@51@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@10@01 i@51@01) (Seq_index a@10@01 i@15@01))
    (=
      (and
        (img@53@01 r)
        (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 3
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
; [eval] (forall j: Int, k: Int :: { b[j], b[k] } 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> b[j] != b[k])
(declare-const j@54@01 Int)
(declare-const k@55@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> b[j] != b[k]
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 40 | !(0 <= j@54@01) | live]
; [else-branch: 40 | 0 <= j@54@01 | live]
(push) ; 5
; [then-branch: 40 | !(0 <= j@54@01)]
(assert (not (<= 0 j@54@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 40 | 0 <= j@54@01]
(assert (<= 0 j@54@01))
; [eval] j < len
(push) ; 6
; [then-branch: 41 | !(j@54@01 < len@8@01) | live]
; [else-branch: 41 | j@54@01 < len@8@01 | live]
(push) ; 7
; [then-branch: 41 | !(j@54@01 < len@8@01)]
(assert (not (< j@54@01 len@8@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 41 | j@54@01 < len@8@01]
(assert (< j@54@01 len@8@01))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 42 | !(0 <= k@55@01) | live]
; [else-branch: 42 | 0 <= k@55@01 | live]
(push) ; 9
; [then-branch: 42 | !(0 <= k@55@01)]
(assert (not (<= 0 k@55@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 42 | 0 <= k@55@01]
(assert (<= 0 k@55@01))
; [eval] k < len
(push) ; 10
; [then-branch: 43 | !(k@55@01 < len@8@01) | live]
; [else-branch: 43 | k@55@01 < len@8@01 | live]
(push) ; 11
; [then-branch: 43 | !(k@55@01 < len@8@01)]
(assert (not (< k@55@01 len@8@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 43 | k@55@01 < len@8@01]
(assert (< k@55@01 len@8@01))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@55@01 len@8@01) (not (< k@55@01 len@8@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@55@01)
  (and (<= 0 k@55@01) (or (< k@55@01 len@8@01) (not (< k@55@01 len@8@01))))))
(assert (or (<= 0 k@55@01) (not (<= 0 k@55@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@54@01 len@8@01)
  (and
    (< j@54@01 len@8@01)
    (=>
      (<= 0 k@55@01)
      (and (<= 0 k@55@01) (or (< k@55@01 len@8@01) (not (< k@55@01 len@8@01)))))
    (or (<= 0 k@55@01) (not (<= 0 k@55@01))))))
(assert (or (< j@54@01 len@8@01) (not (< j@54@01 len@8@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@54@01)
  (and
    (<= 0 j@54@01)
    (=>
      (< j@54@01 len@8@01)
      (and
        (< j@54@01 len@8@01)
        (=>
          (<= 0 k@55@01)
          (and
            (<= 0 k@55@01)
            (or (< k@55@01 len@8@01) (not (< k@55@01 len@8@01)))))
        (or (<= 0 k@55@01) (not (<= 0 k@55@01)))))
    (or (< j@54@01 len@8@01) (not (< j@54@01 len@8@01))))))
(assert (or (<= 0 j@54@01) (not (<= 0 j@54@01))))
(push) ; 4
; [then-branch: 44 | 0 <= j@54@01 && j@54@01 < len@8@01 && 0 <= k@55@01 && k@55@01 < len@8@01 && j@54@01 != k@55@01 | live]
; [else-branch: 44 | !(0 <= j@54@01 && j@54@01 < len@8@01 && 0 <= k@55@01 && k@55@01 < len@8@01 && j@54@01 != k@55@01) | live]
(push) ; 5
; [then-branch: 44 | 0 <= j@54@01 && j@54@01 < len@8@01 && 0 <= k@55@01 && k@55@01 < len@8@01 && j@54@01 != k@55@01]
(assert (and
  (<= 0 j@54@01)
  (and
    (< j@54@01 len@8@01)
    (and (<= 0 k@55@01) (and (< k@55@01 len@8@01) (not (= j@54@01 k@55@01)))))))
; [eval] b[j] != b[k]
; [eval] b[j]
(push) ; 6
(assert (not (>= j@54@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@54@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] b[k]
(push) ; 6
(assert (not (>= k@55@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@55@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 44 | !(0 <= j@54@01 && j@54@01 < len@8@01 && 0 <= k@55@01 && k@55@01 < len@8@01 && j@54@01 != k@55@01)]
(assert (not
  (and
    (<= 0 j@54@01)
    (and
      (< j@54@01 len@8@01)
      (and (<= 0 k@55@01) (and (< k@55@01 len@8@01) (not (= j@54@01 k@55@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@54@01)
    (and
      (< j@54@01 len@8@01)
      (and (<= 0 k@55@01) (and (< k@55@01 len@8@01) (not (= j@54@01 k@55@01))))))
  (and
    (<= 0 j@54@01)
    (< j@54@01 len@8@01)
    (<= 0 k@55@01)
    (< k@55@01 len@8@01)
    (not (= j@54@01 k@55@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@54@01)
      (and
        (< j@54@01 len@8@01)
        (and (<= 0 k@55@01) (and (< k@55@01 len@8@01) (not (= j@54@01 k@55@01)))))))
  (and
    (<= 0 j@54@01)
    (and
      (< j@54@01 len@8@01)
      (and (<= 0 k@55@01) (and (< k@55@01 len@8@01) (not (= j@54@01 k@55@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@54@01 Int) (k@55@01 Int)) (!
  (and
    (=>
      (<= 0 j@54@01)
      (and
        (<= 0 j@54@01)
        (=>
          (< j@54@01 len@8@01)
          (and
            (< j@54@01 len@8@01)
            (=>
              (<= 0 k@55@01)
              (and
                (<= 0 k@55@01)
                (or (< k@55@01 len@8@01) (not (< k@55@01 len@8@01)))))
            (or (<= 0 k@55@01) (not (<= 0 k@55@01)))))
        (or (< j@54@01 len@8@01) (not (< j@54@01 len@8@01)))))
    (or (<= 0 j@54@01) (not (<= 0 j@54@01)))
    (=>
      (and
        (<= 0 j@54@01)
        (and
          (< j@54@01 len@8@01)
          (and
            (<= 0 k@55@01)
            (and (< k@55@01 len@8@01) (not (= j@54@01 k@55@01))))))
      (and
        (<= 0 j@54@01)
        (< j@54@01 len@8@01)
        (<= 0 k@55@01)
        (< k@55@01 len@8@01)
        (not (= j@54@01 k@55@01))))
    (or
      (not
        (and
          (<= 0 j@54@01)
          (and
            (< j@54@01 len@8@01)
            (and
              (<= 0 k@55@01)
              (and (< k@55@01 len@8@01) (not (= j@54@01 k@55@01)))))))
      (and
        (<= 0 j@54@01)
        (and
          (< j@54@01 len@8@01)
          (and
            (<= 0 k@55@01)
            (and (< k@55@01 len@8@01) (not (= j@54@01 k@55@01))))))))
  :pattern ((Seq_index b@9@01 j@54@01) (Seq_index b@9@01 k@55@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@66@12@66@102-aux|)))
(assert (forall ((j@54@01 Int) (k@55@01 Int)) (!
  (=>
    (and
      (<= 0 j@54@01)
      (and
        (< j@54@01 len@8@01)
        (and (<= 0 k@55@01) (and (< k@55@01 len@8@01) (not (= j@54@01 k@55@01))))))
    (not (= (Seq_index b@9@01 j@54@01) (Seq_index b@9@01 k@55@01))))
  :pattern ((Seq_index b@9@01 j@54@01) (Seq_index b@9@01 k@55@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@66@12@66@102|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
(declare-const i@56@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 45 | !(0 <= i@56@01) | live]
; [else-branch: 45 | 0 <= i@56@01 | live]
(push) ; 5
; [then-branch: 45 | !(0 <= i@56@01)]
(assert (not (<= 0 i@56@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 45 | 0 <= i@56@01]
(assert (<= 0 i@56@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@56@01) (not (<= 0 i@56@01))))
(assert (and (<= 0 i@56@01) (< i@56@01 len@8@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@56@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@56@01 (Seq_length b@9@01))))
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
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 len@8@01))
    (or (<= 0 i@56@01) (not (<= 0 i@56@01))))
  :pattern ((Seq_index b@9@01 i@56@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@56@01 Int) (i2@56@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@56@01) (< i1@56@01 len@8@01))
      (and (<= 0 i2@56@01) (< i2@56@01 len@8@01))
      (= (Seq_index b@9@01 i1@56@01) (Seq_index b@9@01 i2@56@01)))
    (= i1@56@01 i2@56@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 len@8@01))
    (and
      (= (inv@57@01 (Seq_index b@9@01 i@56@01)) i@56@01)
      (img@58@01 (Seq_index b@9@01 i@56@01))))
  :pattern ((Seq_index b@9@01 i@56@01))
  :qid |quant-u-75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
    (= (Seq_index b@9@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 len@8@01))
    (not (= (Seq_index b@9@01 i@56@01) $Ref.null)))
  :pattern ((Seq_index b@9@01 i@56@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@9@01 i@56@01) (Seq_index a@10@01 i@51@01))
    (=
      (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
      (and
        (img@53@01 r)
        (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))))
  
  :qid |quant-u-76|))))
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
    (= (Seq_index b@9@01 i@56@01) (Seq_index a@10@01 i@15@01))
    (=
      (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
  :qid |quant-u-77|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { c[j], c[k] } 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> c[j] != c[k])
(declare-const j@59@01 Int)
(declare-const k@60@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k))) ==> c[j] != c[k]
; [eval] 0 <= j && (j < len && (0 <= k && (k < len && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 46 | !(0 <= j@59@01) | live]
; [else-branch: 46 | 0 <= j@59@01 | live]
(push) ; 5
; [then-branch: 46 | !(0 <= j@59@01)]
(assert (not (<= 0 j@59@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 46 | 0 <= j@59@01]
(assert (<= 0 j@59@01))
; [eval] j < len
(push) ; 6
; [then-branch: 47 | !(j@59@01 < len@8@01) | live]
; [else-branch: 47 | j@59@01 < len@8@01 | live]
(push) ; 7
; [then-branch: 47 | !(j@59@01 < len@8@01)]
(assert (not (< j@59@01 len@8@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 47 | j@59@01 < len@8@01]
(assert (< j@59@01 len@8@01))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 48 | !(0 <= k@60@01) | live]
; [else-branch: 48 | 0 <= k@60@01 | live]
(push) ; 9
; [then-branch: 48 | !(0 <= k@60@01)]
(assert (not (<= 0 k@60@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 48 | 0 <= k@60@01]
(assert (<= 0 k@60@01))
; [eval] k < len
(push) ; 10
; [then-branch: 49 | !(k@60@01 < len@8@01) | live]
; [else-branch: 49 | k@60@01 < len@8@01 | live]
(push) ; 11
; [then-branch: 49 | !(k@60@01 < len@8@01)]
(assert (not (< k@60@01 len@8@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 49 | k@60@01 < len@8@01]
(assert (< k@60@01 len@8@01))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@60@01 len@8@01) (not (< k@60@01 len@8@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@60@01)
  (and (<= 0 k@60@01) (or (< k@60@01 len@8@01) (not (< k@60@01 len@8@01))))))
(assert (or (<= 0 k@60@01) (not (<= 0 k@60@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@59@01 len@8@01)
  (and
    (< j@59@01 len@8@01)
    (=>
      (<= 0 k@60@01)
      (and (<= 0 k@60@01) (or (< k@60@01 len@8@01) (not (< k@60@01 len@8@01)))))
    (or (<= 0 k@60@01) (not (<= 0 k@60@01))))))
(assert (or (< j@59@01 len@8@01) (not (< j@59@01 len@8@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@59@01)
  (and
    (<= 0 j@59@01)
    (=>
      (< j@59@01 len@8@01)
      (and
        (< j@59@01 len@8@01)
        (=>
          (<= 0 k@60@01)
          (and
            (<= 0 k@60@01)
            (or (< k@60@01 len@8@01) (not (< k@60@01 len@8@01)))))
        (or (<= 0 k@60@01) (not (<= 0 k@60@01)))))
    (or (< j@59@01 len@8@01) (not (< j@59@01 len@8@01))))))
(assert (or (<= 0 j@59@01) (not (<= 0 j@59@01))))
(push) ; 4
; [then-branch: 50 | 0 <= j@59@01 && j@59@01 < len@8@01 && 0 <= k@60@01 && k@60@01 < len@8@01 && j@59@01 != k@60@01 | live]
; [else-branch: 50 | !(0 <= j@59@01 && j@59@01 < len@8@01 && 0 <= k@60@01 && k@60@01 < len@8@01 && j@59@01 != k@60@01) | live]
(push) ; 5
; [then-branch: 50 | 0 <= j@59@01 && j@59@01 < len@8@01 && 0 <= k@60@01 && k@60@01 < len@8@01 && j@59@01 != k@60@01]
(assert (and
  (<= 0 j@59@01)
  (and
    (< j@59@01 len@8@01)
    (and (<= 0 k@60@01) (and (< k@60@01 len@8@01) (not (= j@59@01 k@60@01)))))))
; [eval] c[j] != c[k]
; [eval] c[j]
(push) ; 6
(assert (not (>= j@59@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@59@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] c[k]
(push) ; 6
(assert (not (>= k@60@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@60@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 50 | !(0 <= j@59@01 && j@59@01 < len@8@01 && 0 <= k@60@01 && k@60@01 < len@8@01 && j@59@01 != k@60@01)]
(assert (not
  (and
    (<= 0 j@59@01)
    (and
      (< j@59@01 len@8@01)
      (and (<= 0 k@60@01) (and (< k@60@01 len@8@01) (not (= j@59@01 k@60@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@59@01)
    (and
      (< j@59@01 len@8@01)
      (and (<= 0 k@60@01) (and (< k@60@01 len@8@01) (not (= j@59@01 k@60@01))))))
  (and
    (<= 0 j@59@01)
    (< j@59@01 len@8@01)
    (<= 0 k@60@01)
    (< k@60@01 len@8@01)
    (not (= j@59@01 k@60@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@59@01)
      (and
        (< j@59@01 len@8@01)
        (and (<= 0 k@60@01) (and (< k@60@01 len@8@01) (not (= j@59@01 k@60@01)))))))
  (and
    (<= 0 j@59@01)
    (and
      (< j@59@01 len@8@01)
      (and (<= 0 k@60@01) (and (< k@60@01 len@8@01) (not (= j@59@01 k@60@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@59@01 Int) (k@60@01 Int)) (!
  (and
    (=>
      (<= 0 j@59@01)
      (and
        (<= 0 j@59@01)
        (=>
          (< j@59@01 len@8@01)
          (and
            (< j@59@01 len@8@01)
            (=>
              (<= 0 k@60@01)
              (and
                (<= 0 k@60@01)
                (or (< k@60@01 len@8@01) (not (< k@60@01 len@8@01)))))
            (or (<= 0 k@60@01) (not (<= 0 k@60@01)))))
        (or (< j@59@01 len@8@01) (not (< j@59@01 len@8@01)))))
    (or (<= 0 j@59@01) (not (<= 0 j@59@01)))
    (=>
      (and
        (<= 0 j@59@01)
        (and
          (< j@59@01 len@8@01)
          (and
            (<= 0 k@60@01)
            (and (< k@60@01 len@8@01) (not (= j@59@01 k@60@01))))))
      (and
        (<= 0 j@59@01)
        (< j@59@01 len@8@01)
        (<= 0 k@60@01)
        (< k@60@01 len@8@01)
        (not (= j@59@01 k@60@01))))
    (or
      (not
        (and
          (<= 0 j@59@01)
          (and
            (< j@59@01 len@8@01)
            (and
              (<= 0 k@60@01)
              (and (< k@60@01 len@8@01) (not (= j@59@01 k@60@01)))))))
      (and
        (<= 0 j@59@01)
        (and
          (< j@59@01 len@8@01)
          (and
            (<= 0 k@60@01)
            (and (< k@60@01 len@8@01) (not (= j@59@01 k@60@01))))))))
  :pattern ((Seq_index c@11@01 j@59@01) (Seq_index c@11@01 k@60@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@68@12@68@102-aux|)))
(assert (forall ((j@59@01 Int) (k@60@01 Int)) (!
  (=>
    (and
      (<= 0 j@59@01)
      (and
        (< j@59@01 len@8@01)
        (and (<= 0 k@60@01) (and (< k@60@01 len@8@01) (not (= j@59@01 k@60@01))))))
    (not (= (Seq_index c@11@01 j@59@01) (Seq_index c@11@01 k@60@01))))
  :pattern ((Seq_index c@11@01 j@59@01) (Seq_index c@11@01 k@60@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@68@12@68@102|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))))
(declare-const i@61@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 51 | !(0 <= i@61@01) | live]
; [else-branch: 51 | 0 <= i@61@01 | live]
(push) ; 5
; [then-branch: 51 | !(0 <= i@61@01)]
(assert (not (<= 0 i@61@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 51 | 0 <= i@61@01]
(assert (<= 0 i@61@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@61@01) (not (<= 0 i@61@01))))
(assert (and (<= 0 i@61@01) (< i@61@01 len@8@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@61@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@61@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@62@01 ($Ref) Int)
(declare-fun img@63@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@61@01 Int)) (!
  (=>
    (and (<= 0 i@61@01) (< i@61@01 len@8@01))
    (or (<= 0 i@61@01) (not (<= 0 i@61@01))))
  :pattern ((Seq_index c@11@01 i@61@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@61@01 Int) (i2@61@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@61@01) (< i1@61@01 len@8@01))
      (and (<= 0 i2@61@01) (< i2@61@01 len@8@01))
      (= (Seq_index c@11@01 i1@61@01) (Seq_index c@11@01 i2@61@01)))
    (= i1@61@01 i2@61@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@61@01 Int)) (!
  (=>
    (and (<= 0 i@61@01) (< i@61@01 len@8@01))
    (and
      (= (inv@62@01 (Seq_index c@11@01 i@61@01)) i@61@01)
      (img@63@01 (Seq_index c@11@01 i@61@01))))
  :pattern ((Seq_index c@11@01 i@61@01))
  :qid |quant-u-79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
    (= (Seq_index c@11@01 (inv@62@01 r)) r))
  :pattern ((inv@62@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@61@01 Int)) (!
  (=>
    (and (<= 0 i@61@01) (< i@61@01 len@8@01))
    (not (= (Seq_index c@11@01 i@61@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@61@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@61@01) (Seq_index b@9@01 i@56@01))
    (=
      (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
      (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))))
  
  :qid |quant-u-80|))))
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
    (= (Seq_index c@11@01 i@61@01) (Seq_index a@10@01 i@51@01))
    (=
      (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
      (and
        (img@53@01 r)
        (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))))
  
  :qid |quant-u-81|))))
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
    (= (Seq_index c@11@01 i@61@01) (Seq_index a@10@01 i@15@01))
    (=
      (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
  $Snap.unit))
; [eval] (forall __rw_i1: Int :: { a[__rw_i1] } true ==> 0 <= __rw_i1 - 1 && __rw_i1 - 1 < (len - 1 < len ? len - 1 : len) ==> a[__rw_i1].Ref__Integer_value == 0)
(declare-const __rw_i1@64@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> 0 <= __rw_i1 - 1 && __rw_i1 - 1 < (len - 1 < len ? len - 1 : len) ==> a[__rw_i1].Ref__Integer_value == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | True | live]
; [else-branch: 52 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 52 | True]
; [eval] 0 <= __rw_i1 - 1 && __rw_i1 - 1 < (len - 1 < len ? len - 1 : len) ==> a[__rw_i1].Ref__Integer_value == 0
; [eval] 0 <= __rw_i1 - 1 && __rw_i1 - 1 < (len - 1 < len ? len - 1 : len)
; [eval] 0 <= __rw_i1 - 1
; [eval] __rw_i1 - 1
(push) ; 6
; [then-branch: 53 | !(0 <= __rw_i1@64@01 - 1) | live]
; [else-branch: 53 | 0 <= __rw_i1@64@01 - 1 | live]
(push) ; 7
; [then-branch: 53 | !(0 <= __rw_i1@64@01 - 1)]
(assert (not (<= 0 (- __rw_i1@64@01 1))))
(pop) ; 7
(push) ; 7
; [else-branch: 53 | 0 <= __rw_i1@64@01 - 1]
(assert (<= 0 (- __rw_i1@64@01 1)))
; [eval] __rw_i1 - 1 < (len - 1 < len ? len - 1 : len)
; [eval] __rw_i1 - 1
; [eval] (len - 1 < len ? len - 1 : len)
; [eval] len - 1 < len
; [eval] len - 1
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (< (- len@8@01 1) len@8@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< (- len@8@01 1) len@8@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | len@8@01 - 1 < len@8@01 | live]
; [else-branch: 54 | !(len@8@01 - 1 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 54 | len@8@01 - 1 < len@8@01]
(assert (< (- len@8@01 1) len@8@01))
; [eval] len - 1
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (< (- len@8@01 1) len@8@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 (- __rw_i1@64@01 1))
  (and (<= 0 (- __rw_i1@64@01 1)) (< (- len@8@01 1) len@8@01))))
(assert (or (<= 0 (- __rw_i1@64@01 1)) (not (<= 0 (- __rw_i1@64@01 1)))))
(push) ; 6
; [then-branch: 55 | 0 <= __rw_i1@64@01 - 1 && __rw_i1@64@01 - 1 < len@8@01 - 1 | live]
; [else-branch: 55 | !(0 <= __rw_i1@64@01 - 1 && __rw_i1@64@01 - 1 < len@8@01 - 1) | live]
(push) ; 7
; [then-branch: 55 | 0 <= __rw_i1@64@01 - 1 && __rw_i1@64@01 - 1 < len@8@01 - 1]
(assert (and (<= 0 (- __rw_i1@64@01 1)) (< (- __rw_i1@64@01 1) (- len@8@01 1))))
; [eval] a[__rw_i1].Ref__Integer_value == 0
; [eval] a[__rw_i1]
(push) ; 8
(assert (not (>= __rw_i1@64@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< __rw_i1@64@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(declare-const sm@65@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef13|)))
(declare-const pm@66@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@66@01  $FPM) r)
    (+
      (+
        (+
          (ite
            (and
              (img@17@01 r)
              (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
            (/ (to_real 1) (to_real 2))
            $Perm.No)
          (ite
            (and
              (img@53@01 r)
              (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
            (/ (to_real 1) (to_real 2))
            $Perm.No))
        (ite
          (and
            (img@58@01 r)
            (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@66@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(push) ; 8
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@66@01  $FPM) (Seq_index
    a@10@01
    __rw_i1@64@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 55 | !(0 <= __rw_i1@64@01 - 1 && __rw_i1@64@01 - 1 < len@8@01 - 1)]
(assert (not (and (<= 0 (- __rw_i1@64@01 1)) (< (- __rw_i1@64@01 1) (- len@8@01 1)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@66@01  $FPM) r)
    (+
      (+
        (+
          (ite
            (and
              (img@17@01 r)
              (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
            (/ (to_real 1) (to_real 2))
            $Perm.No)
          (ite
            (and
              (img@53@01 r)
              (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
            (/ (to_real 1) (to_real 2))
            $Perm.No))
        (ite
          (and
            (img@58@01 r)
            (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@66@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 (- __rw_i1@64@01 1)) (< (- __rw_i1@64@01 1) (- len@8@01 1))))
  (and (<= 0 (- __rw_i1@64@01 1)) (< (- __rw_i1@64@01 1) (- len@8@01 1)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@66@01  $FPM) r)
    (+
      (+
        (+
          (ite
            (and
              (img@17@01 r)
              (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
            (/ (to_real 1) (to_real 2))
            $Perm.No)
          (ite
            (and
              (img@53@01 r)
              (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
            (/ (to_real 1) (to_real 2))
            $Perm.No))
        (ite
          (and
            (img@58@01 r)
            (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@66@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(assert (and
  (=>
    (<= 0 (- __rw_i1@64@01 1))
    (and (<= 0 (- __rw_i1@64@01 1)) (< (- len@8@01 1) len@8@01)))
  (or (<= 0 (- __rw_i1@64@01 1)) (not (<= 0 (- __rw_i1@64@01 1))))
  (or
    (not (and (<= 0 (- __rw_i1@64@01 1)) (< (- __rw_i1@64@01 1) (- len@8@01 1))))
    (and (<= 0 (- __rw_i1@64@01 1)) (< (- __rw_i1@64@01 1) (- len@8@01 1))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@66@01  $FPM) r)
    (+
      (+
        (+
          (ite
            (and
              (img@17@01 r)
              (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
            (/ (to_real 1) (to_real 2))
            $Perm.No)
          (ite
            (and
              (img@53@01 r)
              (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
            (/ (to_real 1) (to_real 2))
            $Perm.No))
        (ite
          (and
            (img@58@01 r)
            (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@66@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((__rw_i1@64@01 Int)) (!
  (and
    (=>
      (<= 0 (- __rw_i1@64@01 1))
      (and (<= 0 (- __rw_i1@64@01 1)) (< (- len@8@01 1) len@8@01)))
    (or (<= 0 (- __rw_i1@64@01 1)) (not (<= 0 (- __rw_i1@64@01 1))))
    (or
      (not
        (and (<= 0 (- __rw_i1@64@01 1)) (< (- __rw_i1@64@01 1) (- len@8@01 1))))
      (and (<= 0 (- __rw_i1@64@01 1)) (< (- __rw_i1@64@01 1) (- len@8@01 1)))))
  :pattern ((Seq_index a@10@01 __rw_i1@64@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@70@13@70@118-aux|)))
(assert (forall ((__rw_i1@64@01 Int)) (!
  (=>
    (and (<= 0 (- __rw_i1@64@01 1)) (< (- __rw_i1@64@01 1) (- len@8@01 1)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) (Seq_index
        a@10@01
        __rw_i1@64@01))
      0))
  :pattern ((Seq_index a@10@01 __rw_i1@64@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@70@13@70@118|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { b[i] } 0 <= i && i < len ==> b[i].Ref__Integer_value == i)
(declare-const i@67@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> b[i].Ref__Integer_value == i
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 56 | !(0 <= i@67@01) | live]
; [else-branch: 56 | 0 <= i@67@01 | live]
(push) ; 5
; [then-branch: 56 | !(0 <= i@67@01)]
(assert (not (<= 0 i@67@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 56 | 0 <= i@67@01]
(assert (<= 0 i@67@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@67@01) (not (<= 0 i@67@01))))
(push) ; 4
; [then-branch: 57 | 0 <= i@67@01 && i@67@01 < len@8@01 | live]
; [else-branch: 57 | !(0 <= i@67@01 && i@67@01 < len@8@01) | live]
(push) ; 5
; [then-branch: 57 | 0 <= i@67@01 && i@67@01 < len@8@01]
(assert (and (<= 0 i@67@01) (< i@67@01 len@8@01)))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 6
(assert (not (>= i@67@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@67@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@53@01 r)
        (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
    :qid |qp.fvfValDef13|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (ite
          (and
            (img@17@01 (Seq_index b@9@01 i@67@01))
            (and
              (<= 0 (inv@16@01 (Seq_index b@9@01 i@67@01)))
              (< (inv@16@01 (Seq_index b@9@01 i@67@01)) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No)
        (ite
          (and
            (img@53@01 (Seq_index b@9@01 i@67@01))
            (and
              (<= 1 (inv@52@01 (Seq_index b@9@01 i@67@01)))
              (< (inv@52@01 (Seq_index b@9@01 i@67@01)) (+ (- len@8@01 1) 1))))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@58@01 (Seq_index b@9@01 i@67@01))
          (and
            (<= 0 (inv@57@01 (Seq_index b@9@01 i@67@01)))
            (< (inv@57@01 (Seq_index b@9@01 i@67@01)) len@8@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@63@01 (Seq_index b@9@01 i@67@01))
        (and
          (<= 0 (inv@62@01 (Seq_index b@9@01 i@67@01)))
          (< (inv@62@01 (Seq_index b@9@01 i@67@01)) len@8@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 57 | !(0 <= i@67@01 && i@67@01 < len@8@01)]
(assert (not (and (<= 0 i@67@01) (< i@67@01 len@8@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef13|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@67@01) (< i@67@01 len@8@01)))
  (and (<= 0 i@67@01) (< i@67@01 len@8@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and (<= 1 (inv@52@01 r)) (< (inv@52@01 r) (+ (- len@8@01 1) 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@63@01 r) (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))) r))
  :qid |qp.fvfValDef13|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@67@01 Int)) (!
  (and
    (or (<= 0 i@67@01) (not (<= 0 i@67@01)))
    (or
      (not (and (<= 0 i@67@01) (< i@67@01 len@8@01)))
      (and (<= 0 i@67@01) (< i@67@01 len@8@01))))
  :pattern ((Seq_index b@9@01 i@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@71@13@71@86-aux|)))
(assert (forall ((i@67@01 Int)) (!
  (=>
    (and (<= 0 i@67@01) (< i@67@01 len@8@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@65@01  $FVF<Ref__Integer_value>) (Seq_index
        b@9@01
        i@67@01))
      i@67@01))
  :pattern ((Seq_index b@9@01 i@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@71@13@71@86|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 ($Snap.combine ($Snap.first $t@68@01) ($Snap.second $t@68@01))))
(assert (= ($Snap.first $t@68@01) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second $t@68@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@68@01))
    ($Snap.second ($Snap.second $t@68@01)))))
(assert (= ($Snap.first ($Snap.second $t@68@01)) $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second $t@68@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@68@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@68@01))) $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@68@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))
(declare-const i@69@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 58 | !(0 <= i@69@01) | live]
; [else-branch: 58 | 0 <= i@69@01 | live]
(push) ; 6
; [then-branch: 58 | !(0 <= i@69@01)]
(assert (not (<= 0 i@69@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 58 | 0 <= i@69@01]
(assert (<= 0 i@69@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@69@01) (not (<= 0 i@69@01))))
(assert (and (<= 0 i@69@01) (< i@69@01 len@8@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@69@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@69@01 (Seq_length a@10@01))))
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
(assert (forall ((i@69@01 Int)) (!
  (=>
    (and (<= 0 i@69@01) (< i@69@01 len@8@01))
    (or (<= 0 i@69@01) (not (<= 0 i@69@01))))
  :pattern ((Seq_index a@10@01 i@69@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@69@01 Int) (i2@69@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@69@01) (< i1@69@01 len@8@01))
      (and (<= 0 i2@69@01) (< i2@69@01 len@8@01))
      (= (Seq_index a@10@01 i1@69@01) (Seq_index a@10@01 i2@69@01)))
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
    (and (<= 0 i@69@01) (< i@69@01 len@8@01))
    (and
      (= (inv@70@01 (Seq_index a@10@01 i@69@01)) i@69@01)
      (img@71@01 (Seq_index a@10@01 i@69@01))))
  :pattern ((Seq_index a@10@01 i@69@01))
  :qid |quant-u-84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
    (= (Seq_index a@10@01 (inv@70@01 r)) r))
  :pattern ((inv@70@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@69@01 Int)) (!
  (=>
    (and (<= 0 i@69@01) (< i@69@01 len@8@01))
    (not (= (Seq_index a@10@01 i@69@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@69@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))))
(declare-const i@72@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 59 | !(0 <= i@72@01) | live]
; [else-branch: 59 | 0 <= i@72@01 | live]
(push) ; 6
; [then-branch: 59 | !(0 <= i@72@01)]
(assert (not (<= 0 i@72@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 59 | 0 <= i@72@01]
(assert (<= 0 i@72@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@72@01) (not (<= 0 i@72@01))))
(assert (and (<= 0 i@72@01) (< i@72@01 len@8@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@72@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@72@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@73@01 ($Ref) Int)
(declare-fun img@74@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@72@01 Int)) (!
  (=>
    (and (<= 0 i@72@01) (< i@72@01 len@8@01))
    (or (<= 0 i@72@01) (not (<= 0 i@72@01))))
  :pattern ((Seq_index b@9@01 i@72@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@72@01 Int) (i2@72@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@72@01) (< i1@72@01 len@8@01))
      (and (<= 0 i2@72@01) (< i2@72@01 len@8@01))
      (= (Seq_index b@9@01 i1@72@01) (Seq_index b@9@01 i2@72@01)))
    (= i1@72@01 i2@72@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@72@01 Int)) (!
  (=>
    (and (<= 0 i@72@01) (< i@72@01 len@8@01))
    (and
      (= (inv@73@01 (Seq_index b@9@01 i@72@01)) i@72@01)
      (img@74@01 (Seq_index b@9@01 i@72@01))))
  :pattern ((Seq_index b@9@01 i@72@01))
  :qid |quant-u-86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
    (= (Seq_index b@9@01 (inv@73@01 r)) r))
  :pattern ((inv@73@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@72@01 Int)) (!
  (=>
    (and (<= 0 i@72@01) (< i@72@01 len@8@01))
    (not (= (Seq_index b@9@01 i@72@01) $Ref.null)))
  :pattern ((Seq_index b@9@01 i@72@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@9@01 i@72@01) (Seq_index a@10@01 i@69@01))
    (=
      (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
      (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))))
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))))
(declare-const i@75@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 60 | !(0 <= i@75@01) | live]
; [else-branch: 60 | 0 <= i@75@01 | live]
(push) ; 6
; [then-branch: 60 | !(0 <= i@75@01)]
(assert (not (<= 0 i@75@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 60 | 0 <= i@75@01]
(assert (<= 0 i@75@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@75@01) (not (<= 0 i@75@01))))
(assert (and (<= 0 i@75@01) (< i@75@01 len@8@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@75@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@75@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@76@01 ($Ref) Int)
(declare-fun img@77@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (<= 0 i@75@01) (< i@75@01 len@8@01))
    (or (<= 0 i@75@01) (not (<= 0 i@75@01))))
  :pattern ((Seq_index c@11@01 i@75@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@75@01 Int) (i2@75@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@75@01) (< i1@75@01 len@8@01))
      (and (<= 0 i2@75@01) (< i2@75@01 len@8@01))
      (= (Seq_index c@11@01 i1@75@01) (Seq_index c@11@01 i2@75@01)))
    (= i1@75@01 i2@75@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (<= 0 i@75@01) (< i@75@01 len@8@01))
    (and
      (= (inv@76@01 (Seq_index c@11@01 i@75@01)) i@75@01)
      (img@77@01 (Seq_index c@11@01 i@75@01))))
  :pattern ((Seq_index c@11@01 i@75@01))
  :qid |quant-u-89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
    (= (Seq_index c@11@01 (inv@76@01 r)) r))
  :pattern ((inv@76@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (<= 0 i@75@01) (< i@75@01 len@8@01))
    (not (= (Seq_index c@11@01 i@75@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@75@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@75@01) (Seq_index b@9@01 i@72@01))
    (=
      (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
      (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))))
  
  :qid |quant-u-90|))))
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
    (= (Seq_index c@11@01 i@75@01) (Seq_index a@10@01 i@69@01))
    (=
      (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
      (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))
  $Snap.unit))
; [eval] (forall i: Int :: { a[i] } 0 <= i && i < len ==> a[i].Ref__Integer_value == i + 1)
(declare-const i@78@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == i + 1
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 61 | !(0 <= i@78@01) | live]
; [else-branch: 61 | 0 <= i@78@01 | live]
(push) ; 6
; [then-branch: 61 | !(0 <= i@78@01)]
(assert (not (<= 0 i@78@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 61 | 0 <= i@78@01]
(assert (<= 0 i@78@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@78@01) (not (<= 0 i@78@01))))
(push) ; 5
; [then-branch: 62 | 0 <= i@78@01 && i@78@01 < len@8@01 | live]
; [else-branch: 62 | !(0 <= i@78@01 && i@78@01 < len@8@01) | live]
(push) ; 6
; [then-branch: 62 | 0 <= i@78@01 && i@78@01 < len@8@01]
(assert (and (<= 0 i@78@01) (< i@78@01 len@8@01)))
; [eval] a[i].Ref__Integer_value == i + 1
; [eval] a[i]
(push) ; 7
(assert (not (>= i@78@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@78@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@79@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@80@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@80@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@71@01 r)
            (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@74@01 r)
            (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(push) ; 7
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@80@01  $FPM) (Seq_index a@10@01 i@78@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i + 1
(pop) ; 6
(push) ; 6
; [else-branch: 62 | !(0 <= i@78@01 && i@78@01 < len@8@01)]
(assert (not (and (<= 0 i@78@01) (< i@78@01 len@8@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@80@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@71@01 r)
            (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@74@01 r)
            (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@78@01) (< i@78@01 len@8@01)))
  (and (<= 0 i@78@01) (< i@78@01 len@8@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@80@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@71@01 r)
            (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@74@01 r)
            (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@78@01 Int)) (!
  (and
    (or (<= 0 i@78@01) (not (<= 0 i@78@01)))
    (or
      (not (and (<= 0 i@78@01) (< i@78@01 len@8@01)))
      (and (<= 0 i@78@01) (< i@78@01 len@8@01))))
  :pattern ((Seq_index a@10@01 i@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@76@12@76@89-aux|)))
(assert (forall ((i@78@01 Int)) (!
  (=>
    (and (<= 0 i@78@01) (< i@78@01 len@8@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) (Seq_index
        a@10@01
        i@78@01))
      (+ i@78@01 1)))
  :pattern ((Seq_index a@10@01 i@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@76@12@76@89|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { b[i] } 0 <= i && i < len ==> b[i].Ref__Integer_value == i)
(declare-const i@81@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len ==> b[i].Ref__Integer_value == i
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 63 | !(0 <= i@81@01) | live]
; [else-branch: 63 | 0 <= i@81@01 | live]
(push) ; 6
; [then-branch: 63 | !(0 <= i@81@01)]
(assert (not (<= 0 i@81@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 63 | 0 <= i@81@01]
(assert (<= 0 i@81@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@81@01) (not (<= 0 i@81@01))))
(push) ; 5
; [then-branch: 64 | 0 <= i@81@01 && i@81@01 < len@8@01 | live]
; [else-branch: 64 | !(0 <= i@81@01 && i@81@01 < len@8@01) | live]
(push) ; 6
; [then-branch: 64 | 0 <= i@81@01 && i@81@01 < len@8@01]
(assert (and (<= 0 i@81@01) (< i@81@01 len@8@01)))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 7
(assert (not (>= i@81@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@81@01 (Seq_length b@9@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r))
    :qid |qp.fvfValDef15|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r))
    :qid |qp.fvfValDef17|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@71@01 (Seq_index b@9@01 i@81@01))
          (and
            (<= 0 (inv@70@01 (Seq_index b@9@01 i@81@01)))
            (< (inv@70@01 (Seq_index b@9@01 i@81@01)) len@8@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@74@01 (Seq_index b@9@01 i@81@01))
          (and
            (<= 0 (inv@73@01 (Seq_index b@9@01 i@81@01)))
            (< (inv@73@01 (Seq_index b@9@01 i@81@01)) len@8@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@77@01 (Seq_index b@9@01 i@81@01))
        (and
          (<= 0 (inv@76@01 (Seq_index b@9@01 i@81@01)))
          (< (inv@76@01 (Seq_index b@9@01 i@81@01)) len@8@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 64 | !(0 <= i@81@01 && i@81@01 < len@8@01)]
(assert (not (and (<= 0 i@81@01) (< i@81@01 len@8@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r))
  :qid |qp.fvfValDef17|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@81@01) (< i@81@01 len@8@01)))
  (and (<= 0 i@81@01) (< i@81@01 len@8@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r))
  :qid |qp.fvfValDef17|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@81@01 Int)) (!
  (and
    (or (<= 0 i@81@01) (not (<= 0 i@81@01)))
    (or
      (not (and (<= 0 i@81@01) (< i@81@01 len@8@01)))
      (and (<= 0 i@81@01) (< i@81@01 len@8@01))))
  :pattern ((Seq_index b@9@01 i@81@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@77@12@77@85-aux|)))
(assert (forall ((i@81@01 Int)) (!
  (=>
    (and (<= 0 i@81@01) (< i@81@01 len@8@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) (Seq_index
        b@9@01
        i@81@01))
      i@81@01))
  :pattern ((Seq_index b@9@01 i@81@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@77@12@77@85|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { c[i] } 0 <= i && i < (len - 1 < len ? len - 1 : len) ==> c[i].Ref__Integer_value == 2)
(declare-const i@82@01 Int)
(push) ; 4
; [eval] 0 <= i && i < (len - 1 < len ? len - 1 : len) ==> c[i].Ref__Integer_value == 2
; [eval] 0 <= i && i < (len - 1 < len ? len - 1 : len)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 65 | !(0 <= i@82@01) | live]
; [else-branch: 65 | 0 <= i@82@01 | live]
(push) ; 6
; [then-branch: 65 | !(0 <= i@82@01)]
(assert (not (<= 0 i@82@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 65 | 0 <= i@82@01]
(assert (<= 0 i@82@01))
; [eval] i < (len - 1 < len ? len - 1 : len)
; [eval] (len - 1 < len ? len - 1 : len)
; [eval] len - 1 < len
; [eval] len - 1
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- len@8@01 1) len@8@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- len@8@01 1) len@8@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 66 | len@8@01 - 1 < len@8@01 | live]
; [else-branch: 66 | !(len@8@01 - 1 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 66 | len@8@01 - 1 < len@8@01]
(assert (< (- len@8@01 1) len@8@01))
; [eval] len - 1
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- len@8@01 1) len@8@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=> (<= 0 i@82@01) (and (<= 0 i@82@01) (< (- len@8@01 1) len@8@01))))
(assert (or (<= 0 i@82@01) (not (<= 0 i@82@01))))
(push) ; 5
; [then-branch: 67 | 0 <= i@82@01 && i@82@01 < len@8@01 - 1 | live]
; [else-branch: 67 | !(0 <= i@82@01 && i@82@01 < len@8@01 - 1) | live]
(push) ; 6
; [then-branch: 67 | 0 <= i@82@01 && i@82@01 < len@8@01 - 1]
(assert (and (<= 0 i@82@01) (< i@82@01 (- len@8@01 1))))
; [eval] c[i].Ref__Integer_value == 2
; [eval] c[i]
(push) ; 7
(assert (not (>= i@82@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@82@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r))
    :qid |qp.fvfValDef15|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r))
    :qid |qp.fvfValDef17|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@71@01 (Seq_index c@11@01 i@82@01))
          (and
            (<= 0 (inv@70@01 (Seq_index c@11@01 i@82@01)))
            (< (inv@70@01 (Seq_index c@11@01 i@82@01)) len@8@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@74@01 (Seq_index c@11@01 i@82@01))
          (and
            (<= 0 (inv@73@01 (Seq_index c@11@01 i@82@01)))
            (< (inv@73@01 (Seq_index c@11@01 i@82@01)) len@8@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@77@01 (Seq_index c@11@01 i@82@01))
        (and
          (<= 0 (inv@76@01 (Seq_index c@11@01 i@82@01)))
          (< (inv@76@01 (Seq_index c@11@01 i@82@01)) len@8@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 67 | !(0 <= i@82@01 && i@82@01 < len@8@01 - 1)]
(assert (not (and (<= 0 i@82@01) (< i@82@01 (- len@8@01 1)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r))
  :qid |qp.fvfValDef17|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@82@01) (< i@82@01 (- len@8@01 1))))
  (and (<= 0 i@82@01) (< i@82@01 (- len@8@01 1)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@74@01 r) (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@77@01 r) (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) len@8@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))) r))
  :qid |qp.fvfValDef17|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@82@01 Int)) (!
  (and
    (=> (<= 0 i@82@01) (and (<= 0 i@82@01) (< (- len@8@01 1) len@8@01)))
    (or (<= 0 i@82@01) (not (<= 0 i@82@01)))
    (or
      (not (and (<= 0 i@82@01) (< i@82@01 (- len@8@01 1))))
      (and (<= 0 i@82@01) (< i@82@01 (- len@8@01 1)))))
  :pattern ((Seq_index c@11@01 i@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@78@12@78@113-aux|)))
(assert (forall ((i@82@01 Int)) (!
  (=>
    (and (<= 0 i@82@01) (< i@82@01 (- len@8@01 1)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@79@01  $FVF<Ref__Integer_value>) (Seq_index
        c@11@01
        i@82@01))
      2))
  :pattern ((Seq_index c@11@01 i@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_c.vpr@78@12@78@113|)))
(pop) ; 3
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Ref__recv_body_202 ----------
(declare-const diz@83@01 $Ref)
(declare-const current_thread_id@84@01 Int)
(declare-const len@85@01 Int)
(declare-const a@86@01 Seq<$Ref>)
(declare-const i@87@01 Int)
(declare-const diz@88@01 $Ref)
(declare-const current_thread_id@89@01 Int)
(declare-const len@90@01 Int)
(declare-const a@91@01 Seq<$Ref>)
(declare-const i@92@01 Int)
(push) ; 1
(declare-const $t@93@01 $Snap)
(assert (= $t@93@01 ($Snap.combine ($Snap.first $t@93@01) ($Snap.second $t@93@01))))
(assert (= ($Snap.first $t@93@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@88@01 $Ref.null)))
(assert (=
  ($Snap.second $t@93@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@93@01))
    ($Snap.second ($Snap.second $t@93@01)))))
(assert (= ($Snap.first ($Snap.second $t@93@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@89@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@93@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@93@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@93@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@93@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@92@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@93@01))) $Snap.unit))
; [eval] i < |a|
; [eval] |a|
(assert (< i@92@01 (Seq_length a@91@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 ($Snap.combine ($Snap.first $t@94@01) ($Snap.second $t@94@01))))
(assert (= ($Snap.first $t@94@01) $Snap.unit))
; [eval] i == i - 1 + 1
; [eval] i - 1 + 1
; [eval] i - 1
(assert (= i@92@01 (+ (- i@92@01 1) 1)))
(assert (=
  ($Snap.second $t@94@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@94@01))
    ($Snap.second ($Snap.second $t@94@01)))))
(assert (= ($Snap.first ($Snap.second $t@94@01)) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@91@01) len@90@01))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@91@01 i@92@01) $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__send_body_212 ----------
(declare-const diz@95@01 $Ref)
(declare-const current_thread_id@96@01 Int)
(declare-const len@97@01 Int)
(declare-const a@98@01 Seq<$Ref>)
(declare-const i@99@01 Int)
(declare-const diz@100@01 $Ref)
(declare-const current_thread_id@101@01 Int)
(declare-const len@102@01 Int)
(declare-const a@103@01 Seq<$Ref>)
(declare-const i@104@01 Int)
(push) ; 1
(declare-const $t@105@01 $Snap)
(assert (= $t@105@01 ($Snap.combine ($Snap.first $t@105@01) ($Snap.second $t@105@01))))
(assert (= ($Snap.first $t@105@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@100@01 $Ref.null)))
(assert (=
  ($Snap.second $t@105@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@105@01))
    ($Snap.second ($Snap.second $t@105@01)))))
(assert (= ($Snap.first ($Snap.second $t@105@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@101@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@105@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@105@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@105@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@105@01))) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@103@01) len@102@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@105@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@105@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@105@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@105@01))))
  $Snap.unit))
; [eval] -1 <= i
; [eval] -1
(assert (<= (- 0 1) i@104@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@105@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@105@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@105@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@105@01)))))
  $Snap.unit))
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(assert (< i@104@01 (- (Seq_length a@103@01) 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 2
(assert (not (>= (+ i@104@01 1) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< (+ i@104@01 1) (Seq_length a@103@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@103@01 (+ i@104@01 1)) $Ref.null)))
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
; ---------- Ref__loop_body_72 ----------
(declare-const diz@106@01 $Ref)
(declare-const current_thread_id@107@01 Int)
(declare-const b@108@01 Seq<$Ref>)
(declare-const len@109@01 Int)
(declare-const a@110@01 Seq<$Ref>)
(declare-const i@111@01 Int)
(declare-const c@112@01 Seq<$Ref>)
(declare-const diz@113@01 $Ref)
(declare-const current_thread_id@114@01 Int)
(declare-const b@115@01 Seq<$Ref>)
(declare-const len@116@01 Int)
(declare-const a@117@01 Seq<$Ref>)
(declare-const i@118@01 Int)
(declare-const c@119@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@120@01 $Snap)
(assert (= $t@120@01 ($Snap.combine ($Snap.first $t@120@01) ($Snap.second $t@120@01))))
(assert (= ($Snap.first $t@120@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@113@01 $Ref.null)))
(assert (=
  ($Snap.second $t@120@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@120@01))
    ($Snap.second ($Snap.second $t@120@01)))))
(assert (= ($Snap.first ($Snap.second $t@120@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@114@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@120@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@120@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@120@01))) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@117@01) len@116@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@120@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@120@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@120@01))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (= (Seq_length b@115@01) len@116@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (= (Seq_length c@119@01) len@116@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))
  $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@118@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))
  $Snap.unit))
; [eval] i < len
(assert (< i@118@01 len@116@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
; [eval] a[i]
(push) ; 2
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@117@01 i@118@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
; [eval] i == 0
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= i@118@01 0))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= i@118@01 0)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 68 | i@118@01 == 0 | live]
; [else-branch: 68 | i@118@01 != 0 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 68 | i@118@01 == 0]
(assert (= i@118@01 0))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
; [eval] i < len - 1
; [eval] len - 1
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@118@01 (- len@116@01 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@118@01 (- len@116@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 69 | i@118@01 < len@116@01 - 1 | live]
; [else-branch: 69 | !(i@118@01 < len@116@01 - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 69 | i@118@01 < len@116@01 - 1]
(assert (< i@118@01 (- len@116@01 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@118@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@118@01 1) (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index a@117@01 (+ i@118@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))))
; [eval] b[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) (Seq_index b@115@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index b@115@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index b@115@01 i@118@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index c@119@01 i@118@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
  $Snap.unit))
; [eval] i < len - 1 ==> a[i + 1].Ref__Integer_value == 0
; [eval] i < len - 1
; [eval] len - 1
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@118@01 (- len@116@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 70 | i@118@01 < len@116@01 - 1 | live]
; [else-branch: 70 | !(i@118@01 < len@116@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 70 | i@118@01 < len@116@01 - 1]
; [eval] a[i + 1].Ref__Integer_value == 0
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 6
(assert (not (>= (+ i@118@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ i@118@01 1) (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (< i@118@01 (- len@116@01 1))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
  $Snap.unit))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 4
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
  i@118@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@121@01 $Snap)
(assert (= $t@121@01 ($Snap.combine ($Snap.first $t@121@01) ($Snap.second $t@121@01))))
(assert (= ($Snap.first $t@121@01) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second $t@121@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@121@01))
    ($Snap.second ($Snap.second $t@121@01)))))
(assert (= ($Snap.first ($Snap.second $t@121@01)) $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second $t@121@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@121@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@121@01))) $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@121@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@121@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@121@01))))
  $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))
  $Snap.unit))
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index b@115@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))))))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))))
  $Snap.unit))
; [eval] a[i].Ref__Integer_value == i + 1
; [eval] a[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] i + 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))
  (+ i@118@01 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))))))
  $Snap.unit))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))))
  i@118@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01))))))))))
  $Snap.unit))
; [eval] i < len - 1 ==> c[i].Ref__Integer_value == 2
; [eval] i < len - 1
; [eval] len - 1
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@118@01 (- len@116@01 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 71 | i@118@01 < len@116@01 - 1 | live]
; [else-branch: 71 | !(i@118@01 < len@116@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 71 | i@118@01 < len@116@01 - 1]
; [eval] c[i].Ref__Integer_value == 2
; [eval] c[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (< i@118@01 (- len@116@01 1))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@121@01)))))))))
    2)))
(pop) ; 4
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@122@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@123@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@124@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@125@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@126@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@127@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@118@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 72 | i@118@01 > 0 | dead]
; [else-branch: 72 | !(i@118@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 72 | !(i@118@01 > 0)]
(assert (not (> i@118@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@118@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@118@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 73 | !(i@118@01 > 0) | live]
; [else-branch: 73 | i@118@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 73 | !(i@118@01 > 0)]
(assert (not (> i@118@01 0)))
; [exec]
; __flatten_5 := a[i]
; [eval] a[i]
(push) ; 6
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@128@01 $Ref)
(assert (= __flatten_5@128@01 (Seq_index a@117@01 i@118@01)))
; [exec]
; __flatten_7 := b[i]
; [eval] b[i]
(push) ; 6
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@129@01 $Ref)
(assert (= __flatten_7@129@01 (Seq_index b@115@01 i@118@01)))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value + 1
; [eval] __flatten_7.Ref__Integer_value + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_7@129@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_7@129@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@130@01 Int)
(assert (=
  __flatten_6@130@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
    1)))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_5@128@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_5@128@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) __flatten_5@128@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) __flatten_5@128@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_5@128@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_5@128@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) __flatten_5@128@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_5@128@01 $Ref.null)))
; [eval] i < len - 1
; [eval] len - 1
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@118@01 (- len@116@01 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 74 | i@118@01 < len@116@01 - 1 | live]
; [else-branch: 74 | !(i@118@01 < len@116@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 74 | i@118@01 < len@116@01 - 1]
; [exec]
; __flatten_8 := c[i]
; [eval] c[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_8@131@01 $Ref)
(assert (= __flatten_8@131@01 (Seq_index c@119@01 i@118@01)))
; [exec]
; __flatten_10 := a[i + 1]
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@118@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@118@01 1) (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_10@132@01 $Ref)
(assert (= __flatten_10@132@01 (Seq_index a@117@01 (+ i@118@01 1))))
; [exec]
; __flatten_9 := __flatten_10.Ref__Integer_value + 2
; [eval] __flatten_10.Ref__Integer_value + 2
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@128@01 __flatten_10@132@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_10@132@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_10@132@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) __flatten_10@132@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@133@01 Int)
(assert (=
  __flatten_9@133@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
    2)))
; [exec]
; __flatten_8.Ref__Integer_value := __flatten_9
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@128@01 __flatten_8@131@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_8@131@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@128@01 __flatten_8@131@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_8@131@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) __flatten_8@131@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_8@131@01 $Ref.null)))
; [exec]
; Ref__send_body_212(diz, current_thread_id, len, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] |a| == len
; [eval] |a|
; [eval] -1 <= i
; [eval] -1
(set-option :timeout 0)
(push) ; 7
(assert (not (<= (- 0 1) i@118@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= (- 0 1) i@118@01))
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 7
(assert (not (< i@118@01 (- (Seq_length a@117@01) 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@118@01 (- (Seq_length a@117@01) 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@118@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@118@01 1) (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |a| == len
; [eval] |a|
; [eval] |b| == len
; [eval] |b|
; [eval] |c| == len
; [eval] |c|
; [eval] 0 <= i
; [eval] i < len
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@131@01 (Seq_index a@117@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i].Ref__Integer_value == i + 1
; [eval] a[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@131@01 (Seq_index a@117@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i + 1
(set-option :timeout 0)
(push) ; 7
(assert (not (= __flatten_6@130@01 (+ i@118@01 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (= __flatten_6@130@01 (+ i@118@01 1)))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i < len - 1 ==> c[i].Ref__Integer_value == 2
; [eval] i < len - 1
; [eval] len - 1
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< i@118@01 (- len@116@01 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 75 | i@118@01 < len@116@01 - 1 | live]
; [else-branch: 75 | !(i@118@01 < len@116@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 75 | i@118@01 < len@116@01 - 1]
; [eval] c[i].Ref__Integer_value == 2
; [eval] c[i]
(push) ; 9
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (=> (< i@118@01 (- len@116@01 1)) (= __flatten_9@133@01 2))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=> (< i@118@01 (- len@116@01 1)) (= __flatten_9@133@01 2)))
(pop) ; 6
; [eval] !(i < len - 1)
; [eval] i < len - 1
; [eval] len - 1
; [then-branch: 76 | !(i@118@01 < len@116@01 - 1) | dead]
; [else-branch: 76 | i@118@01 < len@116@01 - 1 | live]
(push) ; 6
; [else-branch: 76 | i@118@01 < len@116@01 - 1]
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 69 | !(i@118@01 < len@116@01 - 1)]
(assert (not (< i@118@01 (- len@116@01 1))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index b@115@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index b@115@01 i@118@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index c@119@01 i@118@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
  $Snap.unit))
; [eval] i < len - 1 ==> a[i + 1].Ref__Integer_value == 0
; [eval] i < len - 1
; [eval] len - 1
(set-option :timeout 0)
(push) ; 4
; [then-branch: 77 | i@118@01 < len@116@01 - 1 | dead]
; [else-branch: 77 | !(i@118@01 < len@116@01 - 1) | live]
(push) ; 5
; [else-branch: 77 | !(i@118@01 < len@116@01 - 1)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
  $Snap.unit))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 4
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
  i@118@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@134@01 $Snap)
(assert (= $t@134@01 ($Snap.combine ($Snap.first $t@134@01) ($Snap.second $t@134@01))))
(assert (= ($Snap.first $t@134@01) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second $t@134@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@134@01))
    ($Snap.second ($Snap.second $t@134@01)))))
(assert (= ($Snap.first ($Snap.second $t@134@01)) $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second $t@134@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@134@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@134@01))) $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@134@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@134@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@134@01))))
  $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))
  $Snap.unit))
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index b@115@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))))))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))))
  $Snap.unit))
; [eval] a[i].Ref__Integer_value == i + 1
; [eval] a[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] i + 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
  (+ i@118@01 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))))
  $Snap.unit))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))
  i@118@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))))
  $Snap.unit))
; [eval] i < len - 1 ==> c[i].Ref__Integer_value == 2
; [eval] i < len - 1
; [eval] len - 1
(push) ; 5
; [then-branch: 78 | i@118@01 < len@116@01 - 1 | dead]
; [else-branch: 78 | !(i@118@01 < len@116@01 - 1) | live]
(push) ; 6
; [else-branch: 78 | !(i@118@01 < len@116@01 - 1)]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@135@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@136@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@137@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@138@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@139@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@140@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@118@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 79 | i@118@01 > 0 | dead]
; [else-branch: 79 | !(i@118@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 79 | !(i@118@01 > 0)]
(assert (not (> i@118@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@118@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@118@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 80 | !(i@118@01 > 0) | live]
; [else-branch: 80 | i@118@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 80 | !(i@118@01 > 0)]
(assert (not (> i@118@01 0)))
; [exec]
; __flatten_5 := a[i]
; [eval] a[i]
(push) ; 6
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@141@01 $Ref)
(assert (= __flatten_5@141@01 (Seq_index a@117@01 i@118@01)))
; [exec]
; __flatten_7 := b[i]
; [eval] b[i]
(push) ; 6
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@142@01 $Ref)
(assert (= __flatten_7@142@01 (Seq_index b@115@01 i@118@01)))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value + 1
; [eval] __flatten_7.Ref__Integer_value + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_7@142@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_7@142@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@143@01 Int)
(assert (=
  __flatten_6@143@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
    1)))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_5@141@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_5@141@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) __flatten_5@141@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_5@141@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_5@141@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_5@141@01 $Ref.null)))
; [eval] i < len - 1
; [eval] len - 1
; [then-branch: 81 | i@118@01 < len@116@01 - 1 | dead]
; [else-branch: 81 | !(i@118@01 < len@116@01 - 1) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 81 | !(i@118@01 < len@116@01 - 1)]
(pop) ; 6
; [eval] !(i < len - 1)
; [eval] i < len - 1
; [eval] len - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@118@01 (- len@116@01 1))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 82 | !(i@118@01 < len@116@01 - 1) | live]
; [else-branch: 82 | i@118@01 < len@116@01 - 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 82 | !(i@118@01 < len@116@01 - 1)]
; [eval] |a| == len
; [eval] |a|
; [eval] |b| == len
; [eval] |b|
; [eval] |c| == len
; [eval] |c|
; [eval] 0 <= i
; [eval] i < len
; [eval] a[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i].Ref__Integer_value == i + 1
; [eval] a[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i + 1
(push) ; 7
(assert (not (= __flatten_6@143@01 (+ i@118@01 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (= __flatten_6@143@01 (+ i@118@01 1)))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i < len - 1 ==> c[i].Ref__Integer_value == 2
; [eval] i < len - 1
; [eval] len - 1
(push) ; 7
; [then-branch: 83 | i@118@01 < len@116@01 - 1 | dead]
; [else-branch: 83 | !(i@118@01 < len@116@01 - 1) | live]
(push) ; 8
; [else-branch: 83 | !(i@118@01 < len@116@01 - 1)]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 68 | i@118@01 != 0]
(assert (not (= i@118@01 0)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
; [eval] i < len - 1
; [eval] len - 1
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@118@01 (- len@116@01 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@118@01 (- len@116@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 84 | i@118@01 < len@116@01 - 1 | live]
; [else-branch: 84 | !(i@118@01 < len@116@01 - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 84 | i@118@01 < len@116@01 - 1]
(assert (< i@118@01 (- len@116@01 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@118@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@118@01 1) (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index a@117@01 (+ i@118@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))))
; [eval] b[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) (Seq_index b@115@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index b@115@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index b@115@01 i@118@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index c@119@01 i@118@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
  $Snap.unit))
; [eval] i < len - 1 ==> a[i + 1].Ref__Integer_value == 0
; [eval] i < len - 1
; [eval] len - 1
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@118@01 (- len@116@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 85 | i@118@01 < len@116@01 - 1 | live]
; [else-branch: 85 | !(i@118@01 < len@116@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 85 | i@118@01 < len@116@01 - 1]
; [eval] a[i + 1].Ref__Integer_value == 0
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 6
(assert (not (>= (+ i@118@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ i@118@01 1) (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (< i@118@01 (- len@116@01 1))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))))
  $Snap.unit))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 4
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
  i@118@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@144@01 $Snap)
(assert (= $t@144@01 ($Snap.combine ($Snap.first $t@144@01) ($Snap.second $t@144@01))))
(assert (= ($Snap.first $t@144@01) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second $t@144@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@144@01))
    ($Snap.second ($Snap.second $t@144@01)))))
(assert (= ($Snap.first ($Snap.second $t@144@01)) $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second $t@144@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@144@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@144@01))) $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@144@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@144@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@144@01))))
  $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))
  $Snap.unit))
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index b@115@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))))))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) (Seq_index c@119@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))))
  $Snap.unit))
; [eval] a[i].Ref__Integer_value == i + 1
; [eval] a[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] i + 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))
  (+ i@118@01 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))))))
  $Snap.unit))
; [eval] b[i].Ref__Integer_value == i
; [eval] b[i]
(push) ; 5
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))))
  i@118@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01))))))))))
  $Snap.unit))
; [eval] i < len - 1 ==> c[i].Ref__Integer_value == 2
; [eval] i < len - 1
; [eval] len - 1
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@118@01 (- len@116@01 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 86 | i@118@01 < len@116@01 - 1 | live]
; [else-branch: 86 | !(i@118@01 < len@116@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 86 | i@118@01 < len@116@01 - 1]
; [eval] c[i].Ref__Integer_value == 2
; [eval] c[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (< i@118@01 (- len@116@01 1))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@144@01)))))))))
    2)))
(pop) ; 4
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@145@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@146@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@147@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@148@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@149@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@150@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@118@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@118@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 87 | i@118@01 > 0 | live]
; [else-branch: 87 | !(i@118@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 87 | i@118@01 > 0]
(assert (> i@118@01 0))
; [exec]
; Ref__recv_body_202(diz, current_thread_id, len, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 <= i
; [eval] i < |a|
; [eval] |a|
(push) ; 6
(assert (not (< i@118@01 (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@118@01 (Seq_length a@117@01)))
(declare-const $t@151@01 $Snap)
(assert (= $t@151@01 ($Snap.combine ($Snap.first $t@151@01) ($Snap.second $t@151@01))))
(assert (= ($Snap.first $t@151@01) $Snap.unit))
; [eval] i == i - 1 + 1
; [eval] i - 1 + 1
; [eval] i - 1
(assert (= i@118@01 (+ (- i@118@01 1) 1)))
(assert (=
  ($Snap.second $t@151@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@151@01))
    ($Snap.second ($Snap.second $t@151@01)))))
(assert (= ($Snap.first ($Snap.second $t@151@01)) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
; [eval] a[i]
(push) ; 6
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@151@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_5 := a[i]
; [eval] a[i]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@152@01 $Ref)
(assert (= __flatten_5@152@01 (Seq_index a@117@01 i@118@01)))
; [exec]
; __flatten_7 := b[i]
; [eval] b[i]
(push) ; 6
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@153@01 $Ref)
(assert (= __flatten_7@153@01 (Seq_index b@115@01 i@118@01)))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value + 1
; [eval] __flatten_7.Ref__Integer_value + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) __flatten_7@153@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_7@153@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_7@153@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@154@01 Int)
(assert (=
  __flatten_6@154@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01))))))))))))
    1)))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 i@118@01) __flatten_5@152@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_5@152@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_5@152@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) __flatten_5@152@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_5@152@01 $Ref.null)))
; [eval] i < len - 1
; [eval] len - 1
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@118@01 (- len@116@01 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 88 | i@118@01 < len@116@01 - 1 | live]
; [else-branch: 88 | !(i@118@01 < len@116@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 88 | i@118@01 < len@116@01 - 1]
; [exec]
; __flatten_8 := c[i]
; [eval] c[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_8@155@01 $Ref)
(assert (= __flatten_8@155@01 (Seq_index c@119@01 i@118@01)))
; [exec]
; __flatten_10 := a[i + 1]
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@118@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@118@01 1) (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_10@156@01 $Ref)
(assert (= __flatten_10@156@01 (Seq_index a@117@01 (+ i@118@01 1))))
; [exec]
; __flatten_9 := __flatten_10.Ref__Integer_value + 2
; [eval] __flatten_10.Ref__Integer_value + 2
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@152@01 __flatten_10@156@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_10@156@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_10@156@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) __flatten_10@156@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@157@01 Int)
(assert (=
  __flatten_9@157@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@120@01)))))))))))
    2)))
; [exec]
; __flatten_8.Ref__Integer_value := __flatten_9
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@152@01 __flatten_8@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@119@01 i@118@01) __flatten_8@155@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@152@01 __flatten_8@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@115@01 i@118@01) __flatten_8@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@117@01 (+ i@118@01 1)) __flatten_8@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_8@155@01 $Ref.null)))
; [exec]
; Ref__send_body_212(diz, current_thread_id, len, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] |a| == len
; [eval] |a|
; [eval] -1 <= i
; [eval] -1
(set-option :timeout 0)
(push) ; 7
(assert (not (<= (- 0 1) i@118@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= (- 0 1) i@118@01))
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 7
(assert (not (< i@118@01 (- (Seq_length a@117@01) 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@118@01 (- (Seq_length a@117@01) 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@118@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@118@01 1) (Seq_length a@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |a| == len
; [eval] |a|
; [eval] |b| == len
; [eval] |b|
; [eval] |c| == len
; [eval] |c|
; [eval] 0 <= i
; [eval] i < len
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@155@01 (Seq_index a@117@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length b@115@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length c@119@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i].Ref__Integer_value == i + 1
; [eval] a[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@155@01 (Seq_index a@117@01 i@118@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i + 1
; ---------- Ref__guard_check_S2_S1 ----------
(declare-const diz@158@01 $Ref)
(declare-const current_thread_id@159@01 Int)
(declare-const b@160@01 Seq<$Ref>)
(declare-const len@161@01 Int)
(declare-const a@162@01 Seq<$Ref>)
(declare-const i@163@01 Int)
(declare-const c@164@01 Seq<$Ref>)
(declare-const diz@165@01 $Ref)
(declare-const current_thread_id@166@01 Int)
(declare-const b@167@01 Seq<$Ref>)
(declare-const len@168@01 Int)
(declare-const a@169@01 Seq<$Ref>)
; ---------- Ref__resource_check_S2_S1 ----------
(declare-const diz@170@01 $Ref)
; ---------- Ref__example ----------
(declare-const diz@171@01 $Ref)
