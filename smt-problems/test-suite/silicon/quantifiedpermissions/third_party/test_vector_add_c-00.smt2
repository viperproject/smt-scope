(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:23:57
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr
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
(declare-fun sum_array ($Snap Int Int Int Seq<$Ref>) Int)
(declare-fun sum_array%limited ($Snap Int Int Int Seq<$Ref>) Int)
(declare-fun sum_array%stateless (Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_array%precondition ($Snap Int Int Int Seq<$Ref>) Bool)
(declare-fun count_array ($Snap Int Int Seq<$Ref> Int) Int)
(declare-fun count_array%limited ($Snap Int Int Seq<$Ref> Int) Int)
(declare-fun count_array%stateless (Int Int Seq<$Ref> Int) Bool)
(declare-fun count_array%precondition ($Snap Int Int Seq<$Ref> Int) Bool)
(declare-fun count_square ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Int)
(declare-fun count_square%limited ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Int)
(declare-fun count_square%stateless (Int Int Int Int Int Int Seq<$Ref> Int) Bool)
(declare-fun count_square%precondition ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Bool)
(declare-fun sum_square ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%limited ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%stateless (Int Int Int Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_square%precondition ($Snap Int Int Int Int Int Int Seq<$Ref>) Bool)
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
(declare-fun inv@40@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@41@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@45@00 () $Perm)
(declare-fun inv@46@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@47@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@48@00 ($Snap Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@52@00 () $Perm)
(declare-fun inv@53@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@54@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@58@00 () $Perm)
(declare-fun inv@59@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@60@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@61@00 ($Snap Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
(declare-fun $k@65@00 () $Perm)
(declare-fun inv@66@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@67@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@71@00 () $Perm)
(declare-fun inv@72@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@73@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@74@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
(declare-fun $k@78@00 () $Perm)
(declare-fun inv@79@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@80@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@84@00 () $Perm)
(declare-fun inv@85@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@86@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@87@00 ($Snap Int Int Int Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
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
(assert (forall ((s@$ $Snap) (i@9@00 Int) (lo@10@00 Int) (hi@11@00 Int) (ar@12@00 Seq<$Ref>)) (!
  (=
    (sum_array%limited s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00)
    (sum_array s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00))
  :pattern ((sum_array s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (lo@10@00 Int) (hi@11@00 Int) (ar@12@00 Seq<$Ref>)) (!
  (sum_array%stateless i@9@00 lo@10@00 hi@11@00 ar@12@00)
  :pattern ((sum_array%limited s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (lo@10@00 Int) (hi@11@00 Int) (ar@12@00 Seq<$Ref>)) (!
  (and
    (forall ((k@38@00 Int)) (!
      (=>
        (and
          (and (<= lo@10@00 k@38@00) (< k@38@00 hi@11@00))
          (< $Perm.No $k@39@00))
        (and
          (=
            (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 (Seq_index
              ar@12@00
              k@38@00))
            k@38@00)
          (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 (Seq_index
            ar@12@00
            k@38@00))))
      :pattern ((Seq_index ar@12@00 k@38@00))
      :qid |quant-u-17|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
          (and
            (and
              (<= lo@10@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
            (< $Perm.No $k@39@00)))
        (=
          (Seq_index
            ar@12@00
            (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          r))
      :pattern ((inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@44@00 Int)) (!
      (=>
        (and
          (and (<= lo@10@00 k@44@00) (< k@44@00 hi@11@00))
          (< $Perm.No $k@45@00))
        (and
          (=
            (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 (Seq_index
              ar@12@00
              k@44@00))
            k@44@00)
          (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 (Seq_index
            ar@12@00
            k@44@00))))
      :pattern ((Seq_index ar@12@00 k@44@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
          (and
            (and
              (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
            (< $Perm.No $k@45@00)))
        (=
          (Seq_index
            ar@12@00
            (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          r))
      :pattern ((inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00)))
          (and
            (and
              (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)))
        (=>
          (and
            (and
              (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00))))
      :qid |qp.fvfDomDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          (ite
            (and
              (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
              (and
                (<= lo@10@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
                (< (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00)))
            (< $Perm.No $k@39@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@48@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@48@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r))
      :qid |qp.fvfValDef1|))
    ($Perm.isReadVar $k@39@00)
    ($Perm.isReadVar $k@45@00)
    (=>
      (sum_array%precondition s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00)
      (=
        (sum_array s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00)
        (ite
          (< i@9@00 hi@11@00)
          (+
            ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) (Seq_index
              ar@12@00
              i@9@00))
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
                      ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@48@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00))))))) (+
              i@9@00
              1) lo@10@00 hi@11@00 ar@12@00))
          0))))
  :pattern ((sum_array s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (lo@10@00 Int) (hi@11@00 Int) (ar@12@00 Seq<$Ref>)) (!
  (=>
    (sum_array%precondition s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00)
    (ite
      (< i@9@00 hi@11@00)
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
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@48@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00))))))) (+
        i@9@00
        1) lo@10@00 hi@11@00 ar@12@00)
      true))
  :pattern ((sum_array s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (hi@15@00 Int) (ar@16@00 Seq<$Ref>) (v@17@00 Int)) (!
  (=
    (count_array%limited s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)
    (count_array s@$ i@14@00 hi@15@00 ar@16@00 v@17@00))
  :pattern ((count_array s@$ i@14@00 hi@15@00 ar@16@00 v@17@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (hi@15@00 Int) (ar@16@00 Seq<$Ref>) (v@17@00 Int)) (!
  (count_array%stateless i@14@00 hi@15@00 ar@16@00 v@17@00)
  :pattern ((count_array%limited s@$ i@14@00 hi@15@00 ar@16@00 v@17@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (hi@15@00 Int) (ar@16@00 Seq<$Ref>) (v@17@00 Int)) (!
  (and
    (forall ((k@51@00 Int)) (!
      (=>
        (and (and (<= 0 k@51@00) (< k@51@00 hi@15@00)) (< $Perm.No $k@52@00))
        (and
          (=
            (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
              ar@16@00
              k@51@00))
            k@51@00)
          (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
            ar@16@00
            k@51@00))))
      :pattern ((Seq_index ar@16@00 k@51@00))
      :qid |quant-u-25|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
          (and
            (and
              (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@52@00)))
        (=
          (Seq_index
            ar@16@00
            (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          r))
      :pattern ((inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@57@00 Int)) (!
      (=>
        (and (and (<= 0 k@57@00) (< k@57@00 hi@15@00)) (< $Perm.No $k@58@00))
        (and
          (=
            (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
              ar@16@00
              k@57@00))
            k@57@00)
          (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
            ar@16@00
            k@57@00))))
      :pattern ((Seq_index ar@16@00 k@57@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
          (and
            (and
              (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@58@00)))
        (=
          (Seq_index
            ar@16@00
            (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          r))
      :pattern ((inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)))
          (and
            (and
              (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00))))
      :qid |qp.fvfDomDef5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (ite
            (and
              (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
              (and
                (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
                (< (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00)))
            (< $Perm.No $k@52@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@61@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@61@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef4|))
    ($Perm.isReadVar $k@52@00)
    ($Perm.isReadVar $k@58@00)
    (=>
      (count_array%precondition s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)
      (=
        (count_array s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)
        (ite
          (< i@14@00 hi@15@00)
          (+
            (ite
              (=
                ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
                  ar@16@00
                  i@14@00))
                v@17@00)
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
                    ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@61@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)))))) (+
              i@14@00
              1) hi@15@00 ar@16@00 v@17@00))
          0))))
  :pattern ((count_array s@$ i@14@00 hi@15@00 ar@16@00 v@17@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (hi@15@00 Int) (ar@16@00 Seq<$Ref>) (v@17@00 Int)) (!
  (=>
    (count_array%precondition s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)
    (ite
      (< i@14@00 hi@15@00)
      (count_array%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@61@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)))))) (+
        i@14@00
        1) hi@15@00 ar@16@00 v@17@00)
      true))
  :pattern ((count_array s@$ i@14@00 hi@15@00 ar@16@00 v@17@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (i@19@00 Int) (lo@20@00 Int) (hi@21@00 Int) (step@22@00 Int) (min@23@00 Int) (max@24@00 Int) (ar@25@00 Seq<$Ref>) (v@26@00 Int)) (!
  (=
    (count_square%limited s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00)
    (count_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))
  :pattern ((count_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (i@19@00 Int) (lo@20@00 Int) (hi@21@00 Int) (step@22@00 Int) (min@23@00 Int) (max@24@00 Int) (ar@25@00 Seq<$Ref>) (v@26@00 Int)) (!
  (count_square%stateless i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00)
  :pattern ((count_square%limited s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (i@19@00 Int) (lo@20@00 Int) (hi@21@00 Int) (step@22@00 Int) (min@23@00 Int) (max@24@00 Int) (ar@25@00 Seq<$Ref>) (v@26@00 Int)) (!
  (and
    (forall ((k@64@00 Int)) (!
      (=>
        (and
          (and
            (<= min@23@00 k@64@00)
            (and
              (< k@64@00 max@24@00)
              (and
                (<= lo@20@00 (mod k@64@00 step@22@00))
                (< (mod k@64@00 step@22@00) hi@21@00))))
          (< $Perm.No $k@65@00))
        (and
          (=
            (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 (Seq_index
              ar@25@00
              k@64@00))
            k@64@00)
          (img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 (Seq_index
            ar@25@00
            k@64@00))))
      :pattern ((Seq_index ar@25@00 k@64@00))
      :qid |quant-u-33|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
          (and
            (and
              (<=
                min@23@00
                (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
              (and
                (<
                  (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@65@00)))
        (=
          (Seq_index
            ar@25@00
            (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
          r))
      :pattern ((inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@70@00 Int)) (!
      (=>
        (and
          (and
            (<= min@23@00 k@70@00)
            (and
              (< k@70@00 max@24@00)
              (and
                (<= lo@20@00 (mod k@70@00 step@22@00))
                (< (mod k@70@00 step@22@00) hi@21@00))))
          (< $Perm.No $k@71@00))
        (and
          (=
            (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 (Seq_index
              ar@25@00
              k@70@00))
            k@70@00)
          (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 (Seq_index
            ar@25@00
            k@70@00))))
      :pattern ((Seq_index ar@25@00 k@70@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
          (and
            (and
              (<=
                min@23@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@71@00)))
        (=
          (Seq_index
            ar@25@00
            (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
          r))
      :pattern ((inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00)))
          (and
            (and
              (<=
                min@23@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)))
        (=>
          (and
            (and
              (<=
                min@23@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))))
      :qid |qp.fvfDomDef8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@23@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
          (ite
            (and
              (img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
              (and
                (<=
                  min@23@00
                  (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
                (and
                  (<
                    (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                    max@24@00)
                  (and
                    (<=
                      lo@20@00
                      (mod
                        (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                        step@22@00))
                    (<
                      (mod
                        (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                        step@22@00)
                      hi@21@00)))))
            (< $Perm.No $k@65@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef7|))
    ($Perm.isReadVar $k@65@00)
    ($Perm.isReadVar $k@71@00)
    (=>
      (count_square%precondition s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00)
      (=
        (count_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00)
        (ite
          (< i@19@00 max@24@00)
          (+
            (ite
              (and
                (<= lo@20@00 (mod i@19@00 step@22@00))
                (and
                  (< (mod i@19@00 step@22@00) hi@21@00)
                  (=
                    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
                      ar@25@00
                      i@19@00))
                    v@26@00)))
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
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))))))))))) (+
              i@19@00
              1) lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))
          0))))
  :pattern ((count_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (i@19@00 Int) (lo@20@00 Int) (hi@21@00 Int) (step@22@00 Int) (min@23@00 Int) (max@24@00 Int) (ar@25@00 Seq<$Ref>) (v@26@00 Int)) (!
  (=>
    (count_square%precondition s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00)
    (ite
      (< i@19@00 max@24@00)
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
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))))))))))) (+
        i@19@00
        1) lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00)
      true))
  :pattern ((count_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (i@28@00 Int) (lo@29@00 Int) (hi@30@00 Int) (step@31@00 Int) (min@32@00 Int) (max@33@00 Int) (ar@34@00 Seq<$Ref>)) (!
  (=
    (sum_square%limited s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00)
    (sum_square s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))
  :pattern ((sum_square s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (i@28@00 Int) (lo@29@00 Int) (hi@30@00 Int) (step@31@00 Int) (min@32@00 Int) (max@33@00 Int) (ar@34@00 Seq<$Ref>)) (!
  (sum_square%stateless i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00)
  :pattern ((sum_square%limited s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (i@28@00 Int) (lo@29@00 Int) (hi@30@00 Int) (step@31@00 Int) (min@32@00 Int) (max@33@00 Int) (ar@34@00 Seq<$Ref>)) (!
  (and
    (forall ((k@77@00 Int)) (!
      (=>
        (and
          (and
            (<= min@32@00 k@77@00)
            (and
              (< k@77@00 max@33@00)
              (and
                (<= lo@29@00 (mod k@77@00 step@31@00))
                (< (mod k@77@00 step@31@00) hi@30@00))))
          (< $Perm.No $k@78@00))
        (and
          (=
            (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 (Seq_index
              ar@34@00
              k@77@00))
            k@77@00)
          (img@80@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 (Seq_index
            ar@34@00
            k@77@00))))
      :pattern ((Seq_index ar@34@00 k@77@00))
      :qid |quant-u-41|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@80@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
          (and
            (and
              (<=
                min@32@00
                (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
              (and
                (<
                  (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                  max@33@00)
                (and
                  (<=
                    lo@29@00
                    (mod
                      (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00))
                  (<
                    (mod
                      (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00)
                    hi@30@00))))
            (< $Perm.No $k@78@00)))
        (=
          (Seq_index
            ar@34@00
            (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
          r))
      :pattern ((inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@83@00 Int)) (!
      (=>
        (and
          (and
            (<= min@32@00 k@83@00)
            (and
              (< k@83@00 max@33@00)
              (and
                (<= lo@29@00 (mod k@83@00 step@31@00))
                (< (mod k@83@00 step@31@00) hi@30@00))))
          (< $Perm.No $k@84@00))
        (and
          (=
            (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 (Seq_index
              ar@34@00
              k@83@00))
            k@83@00)
          (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 (Seq_index
            ar@34@00
            k@83@00))))
      :pattern ((Seq_index ar@34@00 k@83@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
          (and
            (and
              (<=
                min@32@00
                (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
              (and
                (<
                  (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                  max@33@00)
                (and
                  (<=
                    lo@29@00
                    (mod
                      (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00))
                  (<
                    (mod
                      (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00)
                    hi@30@00))))
            (< $Perm.No $k@84@00)))
        (=
          (Seq_index
            ar@34@00
            (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
          r))
      :pattern ((inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@87@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00)))
          (and
            (and
              (<=
                min@32@00
                (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
              (and
                (<
                  (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                  max@33@00)
                (and
                  (<=
                    lo@29@00
                    (mod
                      (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00))
                  (<
                    (mod
                      (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00)
                    hi@30@00))))
            (< $Perm.No $k@84@00)
            (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)))
        (=>
          (and
            (and
              (<=
                min@32@00
                (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
              (and
                (<
                  (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                  max@33@00)
                (and
                  (<=
                    lo@29@00
                    (mod
                      (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00))
                  (<
                    (mod
                      (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00)
                    hi@30@00))))
            (< $Perm.No $k@84@00)
            (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@87@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@87@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))))
      :qid |qp.fvfDomDef11|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@32@00
                (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
              (and
                (<
                  (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                  max@33@00)
                (and
                  (<=
                    lo@29@00
                    (mod
                      (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00))
                  (<
                    (mod
                      (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                      step@31@00)
                    hi@30@00))))
            (< $Perm.No $k@84@00)
            (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
          (ite
            (and
              (img@80@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
              (and
                (<=
                  min@32@00
                  (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
                (and
                  (<
                    (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                    max@33@00)
                  (and
                    (<=
                      lo@29@00
                      (mod
                        (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                        step@31@00))
                    (<
                      (mod
                        (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                        step@31@00)
                      hi@30@00)))))
            (< $Perm.No $k@78@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@87@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@87@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef10|))
    ($Perm.isReadVar $k@78@00)
    ($Perm.isReadVar $k@84@00)
    (=>
      (sum_square%precondition s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00)
      (=
        (sum_square s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00)
        (ite
          (< i@28@00 max@33@00)
          (+
            (ite
              (and
                (<= lo@29@00 (mod i@28@00 step@31@00))
                (< (mod i@28@00 step@31@00) hi@30@00))
              ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
                ar@34@00
                i@28@00))
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
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@87@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))))))))))) (+
              i@28@00
              1) lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))
          0))))
  :pattern ((sum_square s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (i@28@00 Int) (lo@29@00 Int) (hi@30@00 Int) (step@31@00 Int) (min@32@00 Int) (max@33@00 Int) (ar@34@00 Seq<$Ref>)) (!
  (=>
    (sum_square%precondition s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00)
    (ite
      (< i@28@00 max@33@00)
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
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@87@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))))))))))) (+
        i@28@00
        1) lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00)
      true))
  :pattern ((sum_square s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))
  :qid |quant-u-47|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Ref__loop_main_69 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const b@2@01 Seq<$Ref>)
(declare-const len@3@01 Int)
(declare-const a@4@01 Seq<$Ref>)
(declare-const c@5@01 Seq<$Ref>)
(declare-const diz@6@01 $Ref)
(declare-const current_thread_id@7@01 Int)
(declare-const b@8@01 Seq<$Ref>)
(declare-const len@9@01 Int)
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
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 len@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | 0 < len@9@01 | live]
; [else-branch: 0 | !(0 < len@9@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | 0 < len@9@01]
(assert (< 0 len@9@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(0 < len@9@01)]
(assert (not (< 0 len@9@01)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (< 0 len@9@01)) (< 0 len@9@01)))
(assert (=> (< 0 len@9@01) (= (Seq_length a@10@01) len@9@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { a[ix], a[jx] } ix >= 0 && (ix < |a| && (jx >= 0 && (jx < |a| && ix != jx))) ==> a[ix] != a[jx])
(declare-const ix@13@01 Int)
(declare-const jx@14@01 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |a| && (jx >= 0 && (jx < |a| && ix != jx))) ==> a[ix] != a[jx]
; [eval] ix >= 0 && (ix < |a| && (jx >= 0 && (jx < |a| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 1 | !(ix@13@01 >= 0) | live]
; [else-branch: 1 | ix@13@01 >= 0 | live]
(push) ; 4
; [then-branch: 1 | !(ix@13@01 >= 0)]
(assert (not (>= ix@13@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | ix@13@01 >= 0]
(assert (>= ix@13@01 0))
; [eval] ix < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 2 | !(ix@13@01 < |a@10@01|) | live]
; [else-branch: 2 | ix@13@01 < |a@10@01| | live]
(push) ; 6
; [then-branch: 2 | !(ix@13@01 < |a@10@01|)]
(assert (not (< ix@13@01 (Seq_length a@10@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | ix@13@01 < |a@10@01|]
(assert (< ix@13@01 (Seq_length a@10@01)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 3 | !(jx@14@01 >= 0) | live]
; [else-branch: 3 | jx@14@01 >= 0 | live]
(push) ; 8
; [then-branch: 3 | !(jx@14@01 >= 0)]
(assert (not (>= jx@14@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 3 | jx@14@01 >= 0]
(assert (>= jx@14@01 0))
; [eval] jx < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 4 | !(jx@14@01 < |a@10@01|) | live]
; [else-branch: 4 | jx@14@01 < |a@10@01| | live]
(push) ; 10
; [then-branch: 4 | !(jx@14@01 < |a@10@01|)]
(assert (not (< jx@14@01 (Seq_length a@10@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 4 | jx@14@01 < |a@10@01|]
(assert (< jx@14@01 (Seq_length a@10@01)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@14@01 (Seq_length a@10@01)) (not (< jx@14@01 (Seq_length a@10@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@14@01 0)
  (and
    (>= jx@14@01 0)
    (or
      (< jx@14@01 (Seq_length a@10@01))
      (not (< jx@14@01 (Seq_length a@10@01)))))))
(assert (or (>= jx@14@01 0) (not (>= jx@14@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@13@01 (Seq_length a@10@01))
  (and
    (< ix@13@01 (Seq_length a@10@01))
    (=>
      (>= jx@14@01 0)
      (and
        (>= jx@14@01 0)
        (or
          (< jx@14@01 (Seq_length a@10@01))
          (not (< jx@14@01 (Seq_length a@10@01))))))
    (or (>= jx@14@01 0) (not (>= jx@14@01 0))))))
(assert (or (< ix@13@01 (Seq_length a@10@01)) (not (< ix@13@01 (Seq_length a@10@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@13@01 0)
  (and
    (>= ix@13@01 0)
    (=>
      (< ix@13@01 (Seq_length a@10@01))
      (and
        (< ix@13@01 (Seq_length a@10@01))
        (=>
          (>= jx@14@01 0)
          (and
            (>= jx@14@01 0)
            (or
              (< jx@14@01 (Seq_length a@10@01))
              (not (< jx@14@01 (Seq_length a@10@01))))))
        (or (>= jx@14@01 0) (not (>= jx@14@01 0)))))
    (or
      (< ix@13@01 (Seq_length a@10@01))
      (not (< ix@13@01 (Seq_length a@10@01)))))))
(assert (or (>= ix@13@01 0) (not (>= ix@13@01 0))))
(push) ; 3
; [then-branch: 5 | ix@13@01 >= 0 && ix@13@01 < |a@10@01| && jx@14@01 >= 0 && jx@14@01 < |a@10@01| && ix@13@01 != jx@14@01 | live]
; [else-branch: 5 | !(ix@13@01 >= 0 && ix@13@01 < |a@10@01| && jx@14@01 >= 0 && jx@14@01 < |a@10@01| && ix@13@01 != jx@14@01) | live]
(push) ; 4
; [then-branch: 5 | ix@13@01 >= 0 && ix@13@01 < |a@10@01| && jx@14@01 >= 0 && jx@14@01 < |a@10@01| && ix@13@01 != jx@14@01]
(assert (and
  (>= ix@13@01 0)
  (and
    (< ix@13@01 (Seq_length a@10@01))
    (and
      (>= jx@14@01 0)
      (and (< jx@14@01 (Seq_length a@10@01)) (not (= ix@13@01 jx@14@01)))))))
; [eval] a[ix] != a[jx]
; [eval] a[ix]
; [eval] a[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(ix@13@01 >= 0 && ix@13@01 < |a@10@01| && jx@14@01 >= 0 && jx@14@01 < |a@10@01| && ix@13@01 != jx@14@01)]
(assert (not
  (and
    (>= ix@13@01 0)
    (and
      (< ix@13@01 (Seq_length a@10@01))
      (and
        (>= jx@14@01 0)
        (and (< jx@14@01 (Seq_length a@10@01)) (not (= ix@13@01 jx@14@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@13@01 0)
    (and
      (< ix@13@01 (Seq_length a@10@01))
      (and
        (>= jx@14@01 0)
        (and (< jx@14@01 (Seq_length a@10@01)) (not (= ix@13@01 jx@14@01))))))
  (and
    (>= ix@13@01 0)
    (< ix@13@01 (Seq_length a@10@01))
    (>= jx@14@01 0)
    (< jx@14@01 (Seq_length a@10@01))
    (not (= ix@13@01 jx@14@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@13@01 0)
      (and
        (< ix@13@01 (Seq_length a@10@01))
        (and
          (>= jx@14@01 0)
          (and (< jx@14@01 (Seq_length a@10@01)) (not (= ix@13@01 jx@14@01)))))))
  (and
    (>= ix@13@01 0)
    (and
      (< ix@13@01 (Seq_length a@10@01))
      (and
        (>= jx@14@01 0)
        (and (< jx@14@01 (Seq_length a@10@01)) (not (= ix@13@01 jx@14@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@13@01 Int) (jx@14@01 Int)) (!
  (and
    (=>
      (>= ix@13@01 0)
      (and
        (>= ix@13@01 0)
        (=>
          (< ix@13@01 (Seq_length a@10@01))
          (and
            (< ix@13@01 (Seq_length a@10@01))
            (=>
              (>= jx@14@01 0)
              (and
                (>= jx@14@01 0)
                (or
                  (< jx@14@01 (Seq_length a@10@01))
                  (not (< jx@14@01 (Seq_length a@10@01))))))
            (or (>= jx@14@01 0) (not (>= jx@14@01 0)))))
        (or
          (< ix@13@01 (Seq_length a@10@01))
          (not (< ix@13@01 (Seq_length a@10@01))))))
    (or (>= ix@13@01 0) (not (>= ix@13@01 0)))
    (=>
      (and
        (>= ix@13@01 0)
        (and
          (< ix@13@01 (Seq_length a@10@01))
          (and
            (>= jx@14@01 0)
            (and (< jx@14@01 (Seq_length a@10@01)) (not (= ix@13@01 jx@14@01))))))
      (and
        (>= ix@13@01 0)
        (< ix@13@01 (Seq_length a@10@01))
        (>= jx@14@01 0)
        (< jx@14@01 (Seq_length a@10@01))
        (not (= ix@13@01 jx@14@01))))
    (or
      (not
        (and
          (>= ix@13@01 0)
          (and
            (< ix@13@01 (Seq_length a@10@01))
            (and
              (>= jx@14@01 0)
              (and (< jx@14@01 (Seq_length a@10@01)) (not (= ix@13@01 jx@14@01)))))))
      (and
        (>= ix@13@01 0)
        (and
          (< ix@13@01 (Seq_length a@10@01))
          (and
            (>= jx@14@01 0)
            (and (< jx@14@01 (Seq_length a@10@01)) (not (= ix@13@01 jx@14@01))))))))
  :pattern ((Seq_index a@10@01 ix@13@01) (Seq_index a@10@01 jx@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@62@12@62@112-aux|)))
(assert (forall ((ix@13@01 Int) (jx@14@01 Int)) (!
  (=>
    (and
      (>= ix@13@01 0)
      (and
        (< ix@13@01 (Seq_length a@10@01))
        (and
          (>= jx@14@01 0)
          (and (< jx@14@01 (Seq_length a@10@01)) (not (= ix@13@01 jx@14@01))))))
    (not (= (Seq_index a@10@01 ix@13@01) (Seq_index a@10@01 jx@14@01))))
  :pattern ((Seq_index a@10@01 ix@13@01) (Seq_index a@10@01 jx@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@62@12@62@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(declare-const i@15@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 6 | !(0 <= i@15@01) | live]
; [else-branch: 6 | 0 <= i@15@01 | live]
(push) ; 4
; [then-branch: 6 | !(0 <= i@15@01)]
(assert (not (<= 0 i@15@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | 0 <= i@15@01]
(assert (<= 0 i@15@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
(assert (and (<= 0 i@15@01) (< i@15@01 len@9@01)))
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
    (and (<= 0 i@15@01) (< i@15@01 len@9@01))
    (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
  :pattern ((Seq_index a@10@01 i@15@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@15@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@15@01) (< i1@15@01 len@9@01))
      (and (<= 0 i2@15@01) (< i2@15@01 len@9@01))
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
    (and (<= 0 i@15@01) (< i@15@01 len@9@01))
    (and
      (= (inv@16@01 (Seq_index a@10@01 i@15@01)) i@15@01)
      (img@17@01 (Seq_index a@10@01 i@15@01))))
  :pattern ((Seq_index a@10@01 i@15@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
    (= (Seq_index a@10@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 len@9@01))
    (not (= (Seq_index a@10@01 i@15@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@15@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  $Snap.unit))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 len@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | 0 < len@9@01 | live]
; [else-branch: 7 | !(0 < len@9@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | 0 < len@9@01]
(assert (< 0 len@9@01))
; [eval] |b| == len
; [eval] |b|
(pop) ; 3
(push) ; 3
; [else-branch: 7 | !(0 < len@9@01)]
(assert (not (< 0 len@9@01)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=> (< 0 len@9@01) (= (Seq_length b@8@01) len@9@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { b[ix], b[jx] } ix >= 0 && (ix < |b| && (jx >= 0 && (jx < |b| && ix != jx))) ==> b[ix] != b[jx])
(declare-const ix@18@01 Int)
(declare-const jx@19@01 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |b| && (jx >= 0 && (jx < |b| && ix != jx))) ==> b[ix] != b[jx]
; [eval] ix >= 0 && (ix < |b| && (jx >= 0 && (jx < |b| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 8 | !(ix@18@01 >= 0) | live]
; [else-branch: 8 | ix@18@01 >= 0 | live]
(push) ; 4
; [then-branch: 8 | !(ix@18@01 >= 0)]
(assert (not (>= ix@18@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | ix@18@01 >= 0]
(assert (>= ix@18@01 0))
; [eval] ix < |b|
; [eval] |b|
(push) ; 5
; [then-branch: 9 | !(ix@18@01 < |b@8@01|) | live]
; [else-branch: 9 | ix@18@01 < |b@8@01| | live]
(push) ; 6
; [then-branch: 9 | !(ix@18@01 < |b@8@01|)]
(assert (not (< ix@18@01 (Seq_length b@8@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | ix@18@01 < |b@8@01|]
(assert (< ix@18@01 (Seq_length b@8@01)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 10 | !(jx@19@01 >= 0) | live]
; [else-branch: 10 | jx@19@01 >= 0 | live]
(push) ; 8
; [then-branch: 10 | !(jx@19@01 >= 0)]
(assert (not (>= jx@19@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 10 | jx@19@01 >= 0]
(assert (>= jx@19@01 0))
; [eval] jx < |b|
; [eval] |b|
(push) ; 9
; [then-branch: 11 | !(jx@19@01 < |b@8@01|) | live]
; [else-branch: 11 | jx@19@01 < |b@8@01| | live]
(push) ; 10
; [then-branch: 11 | !(jx@19@01 < |b@8@01|)]
(assert (not (< jx@19@01 (Seq_length b@8@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 11 | jx@19@01 < |b@8@01|]
(assert (< jx@19@01 (Seq_length b@8@01)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@19@01 (Seq_length b@8@01)) (not (< jx@19@01 (Seq_length b@8@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@19@01 0)
  (and
    (>= jx@19@01 0)
    (or (< jx@19@01 (Seq_length b@8@01)) (not (< jx@19@01 (Seq_length b@8@01)))))))
(assert (or (>= jx@19@01 0) (not (>= jx@19@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@18@01 (Seq_length b@8@01))
  (and
    (< ix@18@01 (Seq_length b@8@01))
    (=>
      (>= jx@19@01 0)
      (and
        (>= jx@19@01 0)
        (or
          (< jx@19@01 (Seq_length b@8@01))
          (not (< jx@19@01 (Seq_length b@8@01))))))
    (or (>= jx@19@01 0) (not (>= jx@19@01 0))))))
(assert (or (< ix@18@01 (Seq_length b@8@01)) (not (< ix@18@01 (Seq_length b@8@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@18@01 0)
  (and
    (>= ix@18@01 0)
    (=>
      (< ix@18@01 (Seq_length b@8@01))
      (and
        (< ix@18@01 (Seq_length b@8@01))
        (=>
          (>= jx@19@01 0)
          (and
            (>= jx@19@01 0)
            (or
              (< jx@19@01 (Seq_length b@8@01))
              (not (< jx@19@01 (Seq_length b@8@01))))))
        (or (>= jx@19@01 0) (not (>= jx@19@01 0)))))
    (or (< ix@18@01 (Seq_length b@8@01)) (not (< ix@18@01 (Seq_length b@8@01)))))))
(assert (or (>= ix@18@01 0) (not (>= ix@18@01 0))))
(push) ; 3
; [then-branch: 12 | ix@18@01 >= 0 && ix@18@01 < |b@8@01| && jx@19@01 >= 0 && jx@19@01 < |b@8@01| && ix@18@01 != jx@19@01 | live]
; [else-branch: 12 | !(ix@18@01 >= 0 && ix@18@01 < |b@8@01| && jx@19@01 >= 0 && jx@19@01 < |b@8@01| && ix@18@01 != jx@19@01) | live]
(push) ; 4
; [then-branch: 12 | ix@18@01 >= 0 && ix@18@01 < |b@8@01| && jx@19@01 >= 0 && jx@19@01 < |b@8@01| && ix@18@01 != jx@19@01]
(assert (and
  (>= ix@18@01 0)
  (and
    (< ix@18@01 (Seq_length b@8@01))
    (and
      (>= jx@19@01 0)
      (and (< jx@19@01 (Seq_length b@8@01)) (not (= ix@18@01 jx@19@01)))))))
; [eval] b[ix] != b[jx]
; [eval] b[ix]
; [eval] b[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 12 | !(ix@18@01 >= 0 && ix@18@01 < |b@8@01| && jx@19@01 >= 0 && jx@19@01 < |b@8@01| && ix@18@01 != jx@19@01)]
(assert (not
  (and
    (>= ix@18@01 0)
    (and
      (< ix@18@01 (Seq_length b@8@01))
      (and
        (>= jx@19@01 0)
        (and (< jx@19@01 (Seq_length b@8@01)) (not (= ix@18@01 jx@19@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@18@01 0)
    (and
      (< ix@18@01 (Seq_length b@8@01))
      (and
        (>= jx@19@01 0)
        (and (< jx@19@01 (Seq_length b@8@01)) (not (= ix@18@01 jx@19@01))))))
  (and
    (>= ix@18@01 0)
    (< ix@18@01 (Seq_length b@8@01))
    (>= jx@19@01 0)
    (< jx@19@01 (Seq_length b@8@01))
    (not (= ix@18@01 jx@19@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@18@01 0)
      (and
        (< ix@18@01 (Seq_length b@8@01))
        (and
          (>= jx@19@01 0)
          (and (< jx@19@01 (Seq_length b@8@01)) (not (= ix@18@01 jx@19@01)))))))
  (and
    (>= ix@18@01 0)
    (and
      (< ix@18@01 (Seq_length b@8@01))
      (and
        (>= jx@19@01 0)
        (and (< jx@19@01 (Seq_length b@8@01)) (not (= ix@18@01 jx@19@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@18@01 Int) (jx@19@01 Int)) (!
  (and
    (=>
      (>= ix@18@01 0)
      (and
        (>= ix@18@01 0)
        (=>
          (< ix@18@01 (Seq_length b@8@01))
          (and
            (< ix@18@01 (Seq_length b@8@01))
            (=>
              (>= jx@19@01 0)
              (and
                (>= jx@19@01 0)
                (or
                  (< jx@19@01 (Seq_length b@8@01))
                  (not (< jx@19@01 (Seq_length b@8@01))))))
            (or (>= jx@19@01 0) (not (>= jx@19@01 0)))))
        (or
          (< ix@18@01 (Seq_length b@8@01))
          (not (< ix@18@01 (Seq_length b@8@01))))))
    (or (>= ix@18@01 0) (not (>= ix@18@01 0)))
    (=>
      (and
        (>= ix@18@01 0)
        (and
          (< ix@18@01 (Seq_length b@8@01))
          (and
            (>= jx@19@01 0)
            (and (< jx@19@01 (Seq_length b@8@01)) (not (= ix@18@01 jx@19@01))))))
      (and
        (>= ix@18@01 0)
        (< ix@18@01 (Seq_length b@8@01))
        (>= jx@19@01 0)
        (< jx@19@01 (Seq_length b@8@01))
        (not (= ix@18@01 jx@19@01))))
    (or
      (not
        (and
          (>= ix@18@01 0)
          (and
            (< ix@18@01 (Seq_length b@8@01))
            (and
              (>= jx@19@01 0)
              (and (< jx@19@01 (Seq_length b@8@01)) (not (= ix@18@01 jx@19@01)))))))
      (and
        (>= ix@18@01 0)
        (and
          (< ix@18@01 (Seq_length b@8@01))
          (and
            (>= jx@19@01 0)
            (and (< jx@19@01 (Seq_length b@8@01)) (not (= ix@18@01 jx@19@01))))))))
  :pattern ((Seq_index b@8@01 ix@18@01) (Seq_index b@8@01 jx@19@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@65@12@65@112-aux|)))
(assert (forall ((ix@18@01 Int) (jx@19@01 Int)) (!
  (=>
    (and
      (>= ix@18@01 0)
      (and
        (< ix@18@01 (Seq_length b@8@01))
        (and
          (>= jx@19@01 0)
          (and (< jx@19@01 (Seq_length b@8@01)) (not (= ix@18@01 jx@19@01))))))
    (not (= (Seq_index b@8@01 ix@18@01) (Seq_index b@8@01 jx@19@01))))
  :pattern ((Seq_index b@8@01 ix@18@01) (Seq_index b@8@01 jx@19@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@65@12@65@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
(declare-const i@20@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 13 | !(0 <= i@20@01) | live]
; [else-branch: 13 | 0 <= i@20@01 | live]
(push) ; 4
; [then-branch: 13 | !(0 <= i@20@01)]
(assert (not (<= 0 i@20@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 13 | 0 <= i@20@01]
(assert (<= 0 i@20@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
(assert (and (<= 0 i@20@01) (< i@20@01 len@9@01)))
; [eval] b[i]
(push) ; 3
(assert (not (>= i@20@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@20@01 (Seq_length b@8@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@21@01 ($Ref) Int)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 0 i@20@01) (< i@20@01 len@9@01))
    (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
  :pattern ((Seq_index b@8@01 i@20@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@20@01 Int) (i2@20@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@20@01) (< i1@20@01 len@9@01))
      (and (<= 0 i2@20@01) (< i2@20@01 len@9@01))
      (= (Seq_index b@8@01 i1@20@01) (Seq_index b@8@01 i2@20@01)))
    (= i1@20@01 i2@20@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 0 i@20@01) (< i@20@01 len@9@01))
    (and
      (= (inv@21@01 (Seq_index b@8@01 i@20@01)) i@20@01)
      (img@22@01 (Seq_index b@8@01 i@20@01))))
  :pattern ((Seq_index b@8@01 i@20@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
    (= (Seq_index b@8@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 0 i@20@01) (< i@20@01 len@9@01))
    (not (= (Seq_index b@8@01 i@20@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@20@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@20@01) (Seq_index a@10@01 i@15@01))
    (=
      (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
  $Snap.unit))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 len@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | 0 < len@9@01 | live]
; [else-branch: 14 | !(0 < len@9@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | 0 < len@9@01]
(assert (< 0 len@9@01))
; [eval] |c| == len
; [eval] |c|
(pop) ; 3
(push) ; 3
; [else-branch: 14 | !(0 < len@9@01)]
(assert (not (< 0 len@9@01)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=> (< 0 len@9@01) (= (Seq_length c@11@01) len@9@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { c[ix], c[jx] } ix >= 0 && (ix < |c| && (jx >= 0 && (jx < |c| && ix != jx))) ==> c[ix] != c[jx])
(declare-const ix@23@01 Int)
(declare-const jx@24@01 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |c| && (jx >= 0 && (jx < |c| && ix != jx))) ==> c[ix] != c[jx]
; [eval] ix >= 0 && (ix < |c| && (jx >= 0 && (jx < |c| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 15 | !(ix@23@01 >= 0) | live]
; [else-branch: 15 | ix@23@01 >= 0 | live]
(push) ; 4
; [then-branch: 15 | !(ix@23@01 >= 0)]
(assert (not (>= ix@23@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | ix@23@01 >= 0]
(assert (>= ix@23@01 0))
; [eval] ix < |c|
; [eval] |c|
(push) ; 5
; [then-branch: 16 | !(ix@23@01 < |c@11@01|) | live]
; [else-branch: 16 | ix@23@01 < |c@11@01| | live]
(push) ; 6
; [then-branch: 16 | !(ix@23@01 < |c@11@01|)]
(assert (not (< ix@23@01 (Seq_length c@11@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | ix@23@01 < |c@11@01|]
(assert (< ix@23@01 (Seq_length c@11@01)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 17 | !(jx@24@01 >= 0) | live]
; [else-branch: 17 | jx@24@01 >= 0 | live]
(push) ; 8
; [then-branch: 17 | !(jx@24@01 >= 0)]
(assert (not (>= jx@24@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | jx@24@01 >= 0]
(assert (>= jx@24@01 0))
; [eval] jx < |c|
; [eval] |c|
(push) ; 9
; [then-branch: 18 | !(jx@24@01 < |c@11@01|) | live]
; [else-branch: 18 | jx@24@01 < |c@11@01| | live]
(push) ; 10
; [then-branch: 18 | !(jx@24@01 < |c@11@01|)]
(assert (not (< jx@24@01 (Seq_length c@11@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 18 | jx@24@01 < |c@11@01|]
(assert (< jx@24@01 (Seq_length c@11@01)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@24@01 (Seq_length c@11@01)) (not (< jx@24@01 (Seq_length c@11@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@24@01 0)
  (and
    (>= jx@24@01 0)
    (or
      (< jx@24@01 (Seq_length c@11@01))
      (not (< jx@24@01 (Seq_length c@11@01)))))))
(assert (or (>= jx@24@01 0) (not (>= jx@24@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@23@01 (Seq_length c@11@01))
  (and
    (< ix@23@01 (Seq_length c@11@01))
    (=>
      (>= jx@24@01 0)
      (and
        (>= jx@24@01 0)
        (or
          (< jx@24@01 (Seq_length c@11@01))
          (not (< jx@24@01 (Seq_length c@11@01))))))
    (or (>= jx@24@01 0) (not (>= jx@24@01 0))))))
(assert (or (< ix@23@01 (Seq_length c@11@01)) (not (< ix@23@01 (Seq_length c@11@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@23@01 0)
  (and
    (>= ix@23@01 0)
    (=>
      (< ix@23@01 (Seq_length c@11@01))
      (and
        (< ix@23@01 (Seq_length c@11@01))
        (=>
          (>= jx@24@01 0)
          (and
            (>= jx@24@01 0)
            (or
              (< jx@24@01 (Seq_length c@11@01))
              (not (< jx@24@01 (Seq_length c@11@01))))))
        (or (>= jx@24@01 0) (not (>= jx@24@01 0)))))
    (or
      (< ix@23@01 (Seq_length c@11@01))
      (not (< ix@23@01 (Seq_length c@11@01)))))))
(assert (or (>= ix@23@01 0) (not (>= ix@23@01 0))))
(push) ; 3
; [then-branch: 19 | ix@23@01 >= 0 && ix@23@01 < |c@11@01| && jx@24@01 >= 0 && jx@24@01 < |c@11@01| && ix@23@01 != jx@24@01 | live]
; [else-branch: 19 | !(ix@23@01 >= 0 && ix@23@01 < |c@11@01| && jx@24@01 >= 0 && jx@24@01 < |c@11@01| && ix@23@01 != jx@24@01) | live]
(push) ; 4
; [then-branch: 19 | ix@23@01 >= 0 && ix@23@01 < |c@11@01| && jx@24@01 >= 0 && jx@24@01 < |c@11@01| && ix@23@01 != jx@24@01]
(assert (and
  (>= ix@23@01 0)
  (and
    (< ix@23@01 (Seq_length c@11@01))
    (and
      (>= jx@24@01 0)
      (and (< jx@24@01 (Seq_length c@11@01)) (not (= ix@23@01 jx@24@01)))))))
; [eval] c[ix] != c[jx]
; [eval] c[ix]
; [eval] c[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(ix@23@01 >= 0 && ix@23@01 < |c@11@01| && jx@24@01 >= 0 && jx@24@01 < |c@11@01| && ix@23@01 != jx@24@01)]
(assert (not
  (and
    (>= ix@23@01 0)
    (and
      (< ix@23@01 (Seq_length c@11@01))
      (and
        (>= jx@24@01 0)
        (and (< jx@24@01 (Seq_length c@11@01)) (not (= ix@23@01 jx@24@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@23@01 0)
    (and
      (< ix@23@01 (Seq_length c@11@01))
      (and
        (>= jx@24@01 0)
        (and (< jx@24@01 (Seq_length c@11@01)) (not (= ix@23@01 jx@24@01))))))
  (and
    (>= ix@23@01 0)
    (< ix@23@01 (Seq_length c@11@01))
    (>= jx@24@01 0)
    (< jx@24@01 (Seq_length c@11@01))
    (not (= ix@23@01 jx@24@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@23@01 0)
      (and
        (< ix@23@01 (Seq_length c@11@01))
        (and
          (>= jx@24@01 0)
          (and (< jx@24@01 (Seq_length c@11@01)) (not (= ix@23@01 jx@24@01)))))))
  (and
    (>= ix@23@01 0)
    (and
      (< ix@23@01 (Seq_length c@11@01))
      (and
        (>= jx@24@01 0)
        (and (< jx@24@01 (Seq_length c@11@01)) (not (= ix@23@01 jx@24@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@23@01 Int) (jx@24@01 Int)) (!
  (and
    (=>
      (>= ix@23@01 0)
      (and
        (>= ix@23@01 0)
        (=>
          (< ix@23@01 (Seq_length c@11@01))
          (and
            (< ix@23@01 (Seq_length c@11@01))
            (=>
              (>= jx@24@01 0)
              (and
                (>= jx@24@01 0)
                (or
                  (< jx@24@01 (Seq_length c@11@01))
                  (not (< jx@24@01 (Seq_length c@11@01))))))
            (or (>= jx@24@01 0) (not (>= jx@24@01 0)))))
        (or
          (< ix@23@01 (Seq_length c@11@01))
          (not (< ix@23@01 (Seq_length c@11@01))))))
    (or (>= ix@23@01 0) (not (>= ix@23@01 0)))
    (=>
      (and
        (>= ix@23@01 0)
        (and
          (< ix@23@01 (Seq_length c@11@01))
          (and
            (>= jx@24@01 0)
            (and (< jx@24@01 (Seq_length c@11@01)) (not (= ix@23@01 jx@24@01))))))
      (and
        (>= ix@23@01 0)
        (< ix@23@01 (Seq_length c@11@01))
        (>= jx@24@01 0)
        (< jx@24@01 (Seq_length c@11@01))
        (not (= ix@23@01 jx@24@01))))
    (or
      (not
        (and
          (>= ix@23@01 0)
          (and
            (< ix@23@01 (Seq_length c@11@01))
            (and
              (>= jx@24@01 0)
              (and (< jx@24@01 (Seq_length c@11@01)) (not (= ix@23@01 jx@24@01)))))))
      (and
        (>= ix@23@01 0)
        (and
          (< ix@23@01 (Seq_length c@11@01))
          (and
            (>= jx@24@01 0)
            (and (< jx@24@01 (Seq_length c@11@01)) (not (= ix@23@01 jx@24@01))))))))
  :pattern ((Seq_index c@11@01 ix@23@01) (Seq_index c@11@01 jx@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@68@12@68@112-aux|)))
(assert (forall ((ix@23@01 Int) (jx@24@01 Int)) (!
  (=>
    (and
      (>= ix@23@01 0)
      (and
        (< ix@23@01 (Seq_length c@11@01))
        (and
          (>= jx@24@01 0)
          (and (< jx@24@01 (Seq_length c@11@01)) (not (= ix@23@01 jx@24@01))))))
    (not (= (Seq_index c@11@01 ix@23@01) (Seq_index c@11@01 jx@24@01))))
  :pattern ((Seq_index c@11@01 ix@23@01) (Seq_index c@11@01 jx@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@68@12@68@112|)))
(declare-const i@25@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 20 | !(0 <= i@25@01) | live]
; [else-branch: 20 | 0 <= i@25@01 | live]
(push) ; 4
; [then-branch: 20 | !(0 <= i@25@01)]
(assert (not (<= 0 i@25@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 20 | 0 <= i@25@01]
(assert (<= 0 i@25@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
(assert (and (<= 0 i@25@01) (< i@25@01 len@9@01)))
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
    (and (<= 0 i@25@01) (< i@25@01 len@9@01))
    (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
  :pattern ((Seq_index c@11@01 i@25@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@25@01 Int) (i2@25@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@25@01) (< i1@25@01 len@9@01))
      (and (<= 0 i2@25@01) (< i2@25@01 len@9@01))
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
    (and (<= 0 i@25@01) (< i@25@01 len@9@01))
    (and
      (= (inv@26@01 (Seq_index c@11@01 i@25@01)) i@25@01)
      (img@27@01 (Seq_index c@11@01 i@25@01))))
  :pattern ((Seq_index c@11@01 i@25@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
    (= (Seq_index c@11@01 (inv@26@01 r)) r))
  :pattern ((inv@26@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 len@9@01))
    (not (= (Seq_index c@11@01 i@25@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@25@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@25@01) (Seq_index b@8@01 i@20@01))
    (=
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
      (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))))
  
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
    (= (Seq_index c@11@01 i@25@01) (Seq_index a@10@01 i@15@01))
    (=
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))))
  
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
(assert (= ($Snap.first $t@28@01) $Snap.unit))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@9@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | 0 < len@9@01 | live]
; [else-branch: 21 | !(0 < len@9@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | 0 < len@9@01]
(assert (< 0 len@9@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 4
(push) ; 4
; [else-branch: 21 | !(0 < len@9@01)]
(assert (not (< 0 len@9@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=
  ($Snap.second $t@28@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@28@01))
    ($Snap.second ($Snap.second $t@28@01)))))
(declare-const i@29@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 22 | !(0 <= i@29@01) | live]
; [else-branch: 22 | 0 <= i@29@01 | live]
(push) ; 5
; [then-branch: 22 | !(0 <= i@29@01)]
(assert (not (<= 0 i@29@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | 0 <= i@29@01]
(assert (<= 0 i@29@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
(assert (and (<= 0 i@29@01) (< i@29@01 len@9@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@29@01 (Seq_length a@10@01))))
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
    (and (<= 0 i@29@01) (< i@29@01 len@9@01))
    (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
  :pattern ((Seq_index a@10@01 i@29@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@29@01) (< i1@29@01 len@9@01))
      (and (<= 0 i2@29@01) (< i2@29@01 len@9@01))
      (= (Seq_index a@10@01 i1@29@01) (Seq_index a@10@01 i2@29@01)))
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
    (and (<= 0 i@29@01) (< i@29@01 len@9@01))
    (and
      (= (inv@30@01 (Seq_index a@10@01 i@29@01)) i@29@01)
      (img@31@01 (Seq_index a@10@01 i@29@01))))
  :pattern ((Seq_index a@10@01 i@29@01))
  :qid |quant-u-58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
    (= (Seq_index a@10@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 0 i@29@01) (< i@29@01 len@9@01))
    (not (= (Seq_index a@10@01 i@29@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@29@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@28@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@28@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@28@01))) $Snap.unit))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@9@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | 0 < len@9@01 | live]
; [else-branch: 23 | !(0 < len@9@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | 0 < len@9@01]
(assert (< 0 len@9@01))
; [eval] |b| == len
; [eval] |b|
(pop) ; 4
(push) ; 4
; [else-branch: 23 | !(0 < len@9@01)]
(assert (not (< 0 len@9@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@28@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))
(declare-const i@32@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 24 | !(0 <= i@32@01) | live]
; [else-branch: 24 | 0 <= i@32@01 | live]
(push) ; 5
; [then-branch: 24 | !(0 <= i@32@01)]
(assert (not (<= 0 i@32@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | 0 <= i@32@01]
(assert (<= 0 i@32@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@32@01) (not (<= 0 i@32@01))))
(assert (and (<= 0 i@32@01) (< i@32@01 len@9@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@32@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@32@01 (Seq_length b@8@01))))
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
    (and (<= 0 i@32@01) (< i@32@01 len@9@01))
    (or (<= 0 i@32@01) (not (<= 0 i@32@01))))
  :pattern ((Seq_index b@8@01 i@32@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@32@01 Int) (i2@32@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@32@01) (< i1@32@01 len@9@01))
      (and (<= 0 i2@32@01) (< i2@32@01 len@9@01))
      (= (Seq_index b@8@01 i1@32@01) (Seq_index b@8@01 i2@32@01)))
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
    (and (<= 0 i@32@01) (< i@32@01 len@9@01))
    (and
      (= (inv@33@01 (Seq_index b@8@01 i@32@01)) i@32@01)
      (img@34@01 (Seq_index b@8@01 i@32@01))))
  :pattern ((Seq_index b@8@01 i@32@01))
  :qid |quant-u-60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
    (= (Seq_index b@8@01 (inv@33@01 r)) r))
  :pattern ((inv@33@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 len@9@01))
    (not (= (Seq_index b@8@01 i@32@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@32@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@32@01) (Seq_index a@10@01 i@29@01))
    (=
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))))
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Snap.unit))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@9@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | 0 < len@9@01 | live]
; [else-branch: 25 | !(0 < len@9@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | 0 < len@9@01]
(assert (< 0 len@9@01))
; [eval] |c| == len
; [eval] |c|
(pop) ; 4
(push) ; 4
; [else-branch: 25 | !(0 < len@9@01)]
(assert (not (< 0 len@9@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))
(declare-const i@35@01 Int)
(push) ; 3
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
(assert (and (<= 0 i@35@01) (< i@35@01 len@9@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@35@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@35@01 (Seq_length c@11@01))))
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
    (and (<= 0 i@35@01) (< i@35@01 len@9@01))
    (or (<= 0 i@35@01) (not (<= 0 i@35@01))))
  :pattern ((Seq_index c@11@01 i@35@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@35@01 Int) (i2@35@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@35@01) (< i1@35@01 len@9@01))
      (and (<= 0 i2@35@01) (< i2@35@01 len@9@01))
      (= (Seq_index c@11@01 i1@35@01) (Seq_index c@11@01 i2@35@01)))
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
    (and (<= 0 i@35@01) (< i@35@01 len@9@01))
    (and
      (= (inv@36@01 (Seq_index c@11@01 i@35@01)) i@35@01)
      (img@37@01 (Seq_index c@11@01 i@35@01))))
  :pattern ((Seq_index c@11@01 i@35@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
    (= (Seq_index c@11@01 (inv@36@01 r)) r))
  :pattern ((inv@36@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and (<= 0 i@35@01) (< i@35@01 len@9@01))
    (not (= (Seq_index c@11@01 i@35@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@35@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@35@01) (Seq_index b@8@01 i@32@01))
    (=
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))))
  
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
    (= (Seq_index c@11@01 i@35@01) (Seq_index a@10@01 i@29@01))
    (=
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))))
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))
  $Snap.unit))
; [eval] (forall i: Int :: { old(b[i]) } 0 <= i && i < len ==> b[i].Ref__Integer_value == old(b[i].Ref__Integer_value))
(declare-const i@38@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len ==> b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 27 | !(0 <= i@38@01) | live]
; [else-branch: 27 | 0 <= i@38@01 | live]
(push) ; 5
; [then-branch: 27 | !(0 <= i@38@01)]
(assert (not (<= 0 i@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | 0 <= i@38@01]
(assert (<= 0 i@38@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@38@01) (not (<= 0 i@38@01))))
(push) ; 4
; [then-branch: 28 | 0 <= i@38@01 && i@38@01 < len@9@01 | live]
; [else-branch: 28 | !(0 <= i@38@01 && i@38@01 < len@9@01) | live]
(push) ; 5
; [then-branch: 28 | 0 <= i@38@01 && i@38@01 < len@9@01]
(assert (and (<= 0 i@38@01) (< i@38@01 len@9@01)))
; [eval] b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 6
(assert (not (>= i@38@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@38@01 (Seq_length b@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@39@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@40@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@40@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@31@01 r)
            (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@34@01 r)
            (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@40@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@40@01  $FPM) (Seq_index b@8@01 i@38@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 6
(assert (not (>= i@38@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@38@01 (Seq_length b@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@41@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@42@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@42@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@17@01 r)
            (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@22@01 r)
            (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@42@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@42@01  $FPM) (Seq_index b@8@01 i@38@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 28 | !(0 <= i@38@01 && i@38@01 < len@9@01)]
(assert (not (and (<= 0 i@38@01) (< i@38@01 len@9@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@40@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@31@01 r)
            (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@34@01 r)
            (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@40@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@42@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@17@01 r)
            (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@22@01 r)
            (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@42@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@38@01) (< i@38@01 len@9@01)))
  (and (<= 0 i@38@01) (< i@38@01 len@9@01))))
; [eval] old(b[i])
; [eval] b[i]
(push) ; 4
(assert (not (>= i@38@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@40@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@31@01 r)
            (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@34@01 r)
            (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@40@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@42@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@17@01 r)
            (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@22@01 r)
            (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@42@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@38@01 Int)) (!
  (and
    (or (<= 0 i@38@01) (not (<= 0 i@38@01)))
    (or
      (not (and (<= 0 i@38@01) (< i@38@01 len@9@01)))
      (and (<= 0 i@38@01) (< i@38@01 len@9@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@76@12@76@112-aux|)))
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 len@9@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) (Seq_index
        b@8@01
        i@38@01))
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) (Seq_index
        b@8@01
        i@38@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@76@12@76@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { old(c[i]) } 0 <= i && i < len ==> c[i].Ref__Integer_value == old(c[i].Ref__Integer_value))
(declare-const i@43@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 29 | !(0 <= i@43@01) | live]
; [else-branch: 29 | 0 <= i@43@01 | live]
(push) ; 5
; [then-branch: 29 | !(0 <= i@43@01)]
(assert (not (<= 0 i@43@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 29 | 0 <= i@43@01]
(assert (<= 0 i@43@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@43@01) (not (<= 0 i@43@01))))
(push) ; 4
; [then-branch: 30 | 0 <= i@43@01 && i@43@01 < len@9@01 | live]
; [else-branch: 30 | !(0 <= i@43@01 && i@43@01 < len@9@01) | live]
(push) ; 5
; [then-branch: 30 | 0 <= i@43@01 && i@43@01 < len@9@01]
(assert (and (<= 0 i@43@01) (< i@43@01 len@9@01)))
; [eval] c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@43@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@43@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@31@01 (Seq_index c@11@01 i@43@01))
          (and
            (<= 0 (inv@30@01 (Seq_index c@11@01 i@43@01)))
            (< (inv@30@01 (Seq_index c@11@01 i@43@01)) len@9@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@34@01 (Seq_index c@11@01 i@43@01))
          (and
            (<= 0 (inv@33@01 (Seq_index c@11@01 i@43@01)))
            (< (inv@33@01 (Seq_index c@11@01 i@43@01)) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@37@01 (Seq_index c@11@01 i@43@01))
        (and
          (<= 0 (inv@36@01 (Seq_index c@11@01 i@43@01)))
          (< (inv@36@01 (Seq_index c@11@01 i@43@01)) len@9@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@43@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@43@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@17@01 (Seq_index c@11@01 i@43@01))
          (and
            (<= 0 (inv@16@01 (Seq_index c@11@01 i@43@01)))
            (< (inv@16@01 (Seq_index c@11@01 i@43@01)) len@9@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@22@01 (Seq_index c@11@01 i@43@01))
          (and
            (<= 0 (inv@21@01 (Seq_index c@11@01 i@43@01)))
            (< (inv@21@01 (Seq_index c@11@01 i@43@01)) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@27@01 (Seq_index c@11@01 i@43@01))
        (and
          (<= 0 (inv@26@01 (Seq_index c@11@01 i@43@01)))
          (< (inv@26@01 (Seq_index c@11@01 i@43@01)) len@9@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 30 | !(0 <= i@43@01 && i@43@01 < len@9@01)]
(assert (not (and (<= 0 i@43@01) (< i@43@01 len@9@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r))
  :qid |qp.fvfValDef6|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@43@01) (< i@43@01 len@9@01)))
  (and (<= 0 i@43@01) (< i@43@01 len@9@01))))
; [eval] old(c[i])
; [eval] c[i]
(push) ; 4
(assert (not (>= i@43@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@43@01 Int)) (!
  (and
    (or (<= 0 i@43@01) (not (<= 0 i@43@01)))
    (or
      (not (and (<= 0 i@43@01) (< i@43@01 len@9@01)))
      (and (<= 0 i@43@01) (< i@43@01 len@9@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@77@12@77@112-aux|)))
(assert (forall ((i@43@01 Int)) (!
  (=>
    (and (<= 0 i@43@01) (< i@43@01 len@9@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) (Seq_index
        c@11@01
        i@43@01))
      ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) (Seq_index
        c@11@01
        i@43@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@77@12@77@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { a[i] } { b[i] } { c[i] } 0 <= i && i < len ==> a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value)
(declare-const i@44@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 31 | !(0 <= i@44@01) | live]
; [else-branch: 31 | 0 <= i@44@01 | live]
(push) ; 5
; [then-branch: 31 | !(0 <= i@44@01)]
(assert (not (<= 0 i@44@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 31 | 0 <= i@44@01]
(assert (<= 0 i@44@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@44@01) (not (<= 0 i@44@01))))
(push) ; 4
; [then-branch: 32 | 0 <= i@44@01 && i@44@01 < len@9@01 | live]
; [else-branch: 32 | !(0 <= i@44@01 && i@44@01 < len@9@01) | live]
(push) ; 5
; [then-branch: 32 | 0 <= i@44@01 && i@44@01 < len@9@01]
(assert (and (<= 0 i@44@01) (< i@44@01 len@9@01)))
; [eval] a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] a[i]
(push) ; 6
(assert (not (>= i@44@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@44@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@31@01 (Seq_index a@10@01 i@44@01))
          (and
            (<= 0 (inv@30@01 (Seq_index a@10@01 i@44@01)))
            (< (inv@30@01 (Seq_index a@10@01 i@44@01)) len@9@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@34@01 (Seq_index a@10@01 i@44@01))
          (and
            (<= 0 (inv@33@01 (Seq_index a@10@01 i@44@01)))
            (< (inv@33@01 (Seq_index a@10@01 i@44@01)) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@37@01 (Seq_index a@10@01 i@44@01))
        (and
          (<= 0 (inv@36@01 (Seq_index a@10@01 i@44@01)))
          (< (inv@36@01 (Seq_index a@10@01 i@44@01)) len@9@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] b[i]
(push) ; 6
(assert (not (>= i@44@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@44@01 (Seq_length b@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@31@01 (Seq_index b@8@01 i@44@01))
          (and
            (<= 0 (inv@30@01 (Seq_index b@8@01 i@44@01)))
            (< (inv@30@01 (Seq_index b@8@01 i@44@01)) len@9@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@34@01 (Seq_index b@8@01 i@44@01))
          (and
            (<= 0 (inv@33@01 (Seq_index b@8@01 i@44@01)))
            (< (inv@33@01 (Seq_index b@8@01 i@44@01)) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@37@01 (Seq_index b@8@01 i@44@01))
        (and
          (<= 0 (inv@36@01 (Seq_index b@8@01 i@44@01)))
          (< (inv@36@01 (Seq_index b@8@01 i@44@01)) len@9@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@44@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@44@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@31@01 (Seq_index c@11@01 i@44@01))
          (and
            (<= 0 (inv@30@01 (Seq_index c@11@01 i@44@01)))
            (< (inv@30@01 (Seq_index c@11@01 i@44@01)) len@9@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@34@01 (Seq_index c@11@01 i@44@01))
          (and
            (<= 0 (inv@33@01 (Seq_index c@11@01 i@44@01)))
            (< (inv@33@01 (Seq_index c@11@01 i@44@01)) len@9@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@37@01 (Seq_index c@11@01 i@44@01))
        (and
          (<= 0 (inv@36@01 (Seq_index c@11@01 i@44@01)))
          (< (inv@36@01 (Seq_index c@11@01 i@44@01)) len@9@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 32 | !(0 <= i@44@01 && i@44@01 < len@9@01)]
(assert (not (and (<= 0 i@44@01) (< i@44@01 len@9@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
  :qid |qp.fvfValDef2|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@44@01) (< i@44@01 len@9@01)))
  (and (<= 0 i@44@01) (< i@44@01 len@9@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@28@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@9@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@44@01 Int)) (!
  (and
    (or (<= 0 i@44@01) (not (<= 0 i@44@01)))
    (or
      (not (and (<= 0 i@44@01) (< i@44@01 len@9@01)))
      (and (<= 0 i@44@01) (< i@44@01 len@9@01))))
  :pattern ((Seq_index a@10@01 i@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@78@12@78@133-aux|)))
(assert (forall ((i@44@01 Int)) (!
  (and
    (or (<= 0 i@44@01) (not (<= 0 i@44@01)))
    (or
      (not (and (<= 0 i@44@01) (< i@44@01 len@9@01)))
      (and (<= 0 i@44@01) (< i@44@01 len@9@01))))
  :pattern ((Seq_index b@8@01 i@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@78@12@78@133-aux|)))
(assert (forall ((i@44@01 Int)) (!
  (and
    (or (<= 0 i@44@01) (not (<= 0 i@44@01)))
    (or
      (not (and (<= 0 i@44@01) (< i@44@01 len@9@01)))
      (and (<= 0 i@44@01) (< i@44@01 len@9@01))))
  :pattern ((Seq_index c@11@01 i@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@78@12@78@133-aux|)))
(assert (forall ((i@44@01 Int)) (!
  (=>
    (and (<= 0 i@44@01) (< i@44@01 len@9@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) (Seq_index
        a@10@01
        i@44@01))
      (+
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) (Seq_index
          b@8@01
          i@44@01))
        ($FVF.lookup_Ref__Integer_value (as sm@39@01  $FVF<Ref__Integer_value>) (Seq_index
          c@11@01
          i@44@01)))))
  :pattern ((Seq_index a@10@01 i@44@01))
  :pattern ((Seq_index b@8@01 i@44@01))
  :pattern ((Seq_index c@11@01 i@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@78@12@78@133|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_body_69 ----------
(declare-const diz@45@01 $Ref)
(declare-const current_thread_id@46@01 Int)
(declare-const len@47@01 Int)
(declare-const b@48@01 Seq<$Ref>)
(declare-const a@49@01 Seq<$Ref>)
(declare-const i@50@01 Int)
(declare-const c@51@01 Seq<$Ref>)
(declare-const diz@52@01 $Ref)
(declare-const current_thread_id@53@01 Int)
(declare-const len@54@01 Int)
(declare-const b@55@01 Seq<$Ref>)
(declare-const a@56@01 Seq<$Ref>)
(declare-const i@57@01 Int)
(declare-const c@58@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 ($Snap.combine ($Snap.first $t@59@01) ($Snap.second $t@59@01))))
(assert (= ($Snap.first $t@59@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@52@01 $Ref.null)))
(assert (=
  ($Snap.second $t@59@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@59@01))
    ($Snap.second ($Snap.second $t@59@01)))))
(assert (= ($Snap.first ($Snap.second $t@59@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@53@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@59@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@59@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@59@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@57@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@59@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@59@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@59@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@57@01 len@54@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))
  $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@56@01) len@54@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))
; [eval] a[i]
(push) ; 2
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@57@01 (Seq_length a@56@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@56@01 i@57@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (= (Seq_length b@55@01) len@54@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))))
; [eval] b[i]
(push) ; 2
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index a@56@01 i@57@01) (Seq_index b@55@01 i@57@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index b@55@01 i@57@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (= (Seq_length c@58@01) len@54@01))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index b@55@01 i@57@01) (Seq_index c@58@01 i@57@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index a@56@01 i@57@01) (Seq_index c@58@01 i@57@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index c@58@01 i@57@01) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@60@01 $Snap)
(assert (= $t@60@01 ($Snap.combine ($Snap.first $t@60@01) ($Snap.second $t@60@01))))
(assert (= ($Snap.first $t@60@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@60@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@60@01))
    ($Snap.second ($Snap.second $t@60@01)))))
(assert (= ($Snap.first ($Snap.second $t@60@01)) $Snap.unit))
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second $t@60@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@60@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@60@01))) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@60@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@60@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length a@56@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))))
; [eval] b[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@56@01 i@57@01) (Seq_index b@55@01 i@57@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))))))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index b@55@01 i@57@01) (Seq_index c@58@01 i@57@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@56@01 i@57@01) (Seq_index c@58@01 i@57@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))))
  $Snap.unit))
; [eval] b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] b[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))))))
  $Snap.unit))
; [eval] c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))))))
  $Snap.unit))
; [eval] a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] a[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length a@56@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] b[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@01))))))))))))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@61@01 $Ref)
; [exec]
; var __flatten_3: Int
(declare-const __flatten_3@62@01 Int)
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@63@01 $Ref)
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@64@01 $Ref)
; [exec]
; __flatten_2 := a[i]
; [eval] a[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length a@56@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_2@65@01 $Ref)
(assert (= __flatten_2@65@01 (Seq_index a@56@01 i@57@01)))
; [exec]
; __flatten_4 := b[i]
; [eval] b[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@66@01 $Ref)
(assert (= __flatten_4@66@01 (Seq_index b@55@01 i@57@01)))
; [exec]
; __flatten_5 := c[i]
; [eval] c[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@67@01 $Ref)
(assert (= __flatten_5@67@01 (Seq_index c@58@01 i@57@01)))
; [exec]
; __flatten_3 := __flatten_4.Ref__Integer_value +
;   __flatten_5.Ref__Integer_value
; [eval] __flatten_4.Ref__Integer_value + __flatten_5.Ref__Integer_value
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index c@58@01 i@57@01) __flatten_4@66@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index b@55@01 i@57@01) __flatten_4@66@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index c@58@01 i@57@01) __flatten_5@67@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_3@68@01 Int)
(assert (=
  __flatten_3@68@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))))))
; [exec]
; __flatten_2.Ref__Integer_value := __flatten_3
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index c@58@01 i@57@01) __flatten_2@65@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index b@55@01 i@57@01) __flatten_2@65@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@56@01 i@57@01) __flatten_2@65@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index c@58@01 i@57@01) __flatten_2@65@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index b@55@01 i@57@01) __flatten_2@65@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_2@65@01 $Ref.null)))
; [eval] 0 <= i
; [eval] i < len
; [eval] |a| == len
; [eval] |a|
; [eval] a[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length a@56@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] |b| == len
; [eval] |b|
; [eval] b[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] |c| == len
; [eval] |c|
; [eval] c[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] a[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length a@56@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] b[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 3
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@57@01 (Seq_length c@58@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__vector_add ----------
(declare-const diz@69@01 $Ref)
(declare-const current_thread_id@70@01 Int)
(declare-const a@71@01 Seq<$Ref>)
(declare-const b@72@01 Seq<$Ref>)
(declare-const c@73@01 Seq<$Ref>)
(declare-const len@74@01 Int)
(declare-const diz@75@01 $Ref)
(declare-const current_thread_id@76@01 Int)
(declare-const a@77@01 Seq<$Ref>)
(declare-const b@78@01 Seq<$Ref>)
(declare-const c@79@01 Seq<$Ref>)
(declare-const len@80@01 Int)
(push) ; 1
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 ($Snap.combine ($Snap.first $t@81@01) ($Snap.second $t@81@01))))
(assert (= ($Snap.first $t@81@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@75@01 $Ref.null)))
(assert (=
  ($Snap.second $t@81@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@81@01))
    ($Snap.second ($Snap.second $t@81@01)))))
(assert (= ($Snap.first ($Snap.second $t@81@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@76@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@81@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@81@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@81@01))) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@77@01) len@80@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@81@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))
  $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { a[ix], a[jx] } ix >= 0 && (ix < |a| && (jx >= 0 && (jx < |a| && ix != jx))) ==> a[ix] != a[jx])
(declare-const ix@82@01 Int)
(declare-const jx@83@01 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |a| && (jx >= 0 && (jx < |a| && ix != jx))) ==> a[ix] != a[jx]
; [eval] ix >= 0 && (ix < |a| && (jx >= 0 && (jx < |a| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 33 | !(ix@82@01 >= 0) | live]
; [else-branch: 33 | ix@82@01 >= 0 | live]
(push) ; 4
; [then-branch: 33 | !(ix@82@01 >= 0)]
(assert (not (>= ix@82@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 33 | ix@82@01 >= 0]
(assert (>= ix@82@01 0))
; [eval] ix < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 34 | !(ix@82@01 < |a@77@01|) | live]
; [else-branch: 34 | ix@82@01 < |a@77@01| | live]
(push) ; 6
; [then-branch: 34 | !(ix@82@01 < |a@77@01|)]
(assert (not (< ix@82@01 (Seq_length a@77@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 34 | ix@82@01 < |a@77@01|]
(assert (< ix@82@01 (Seq_length a@77@01)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 35 | !(jx@83@01 >= 0) | live]
; [else-branch: 35 | jx@83@01 >= 0 | live]
(push) ; 8
; [then-branch: 35 | !(jx@83@01 >= 0)]
(assert (not (>= jx@83@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 35 | jx@83@01 >= 0]
(assert (>= jx@83@01 0))
; [eval] jx < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 36 | !(jx@83@01 < |a@77@01|) | live]
; [else-branch: 36 | jx@83@01 < |a@77@01| | live]
(push) ; 10
; [then-branch: 36 | !(jx@83@01 < |a@77@01|)]
(assert (not (< jx@83@01 (Seq_length a@77@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 36 | jx@83@01 < |a@77@01|]
(assert (< jx@83@01 (Seq_length a@77@01)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@83@01 (Seq_length a@77@01)) (not (< jx@83@01 (Seq_length a@77@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@83@01 0)
  (and
    (>= jx@83@01 0)
    (or
      (< jx@83@01 (Seq_length a@77@01))
      (not (< jx@83@01 (Seq_length a@77@01)))))))
(assert (or (>= jx@83@01 0) (not (>= jx@83@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@82@01 (Seq_length a@77@01))
  (and
    (< ix@82@01 (Seq_length a@77@01))
    (=>
      (>= jx@83@01 0)
      (and
        (>= jx@83@01 0)
        (or
          (< jx@83@01 (Seq_length a@77@01))
          (not (< jx@83@01 (Seq_length a@77@01))))))
    (or (>= jx@83@01 0) (not (>= jx@83@01 0))))))
(assert (or (< ix@82@01 (Seq_length a@77@01)) (not (< ix@82@01 (Seq_length a@77@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@82@01 0)
  (and
    (>= ix@82@01 0)
    (=>
      (< ix@82@01 (Seq_length a@77@01))
      (and
        (< ix@82@01 (Seq_length a@77@01))
        (=>
          (>= jx@83@01 0)
          (and
            (>= jx@83@01 0)
            (or
              (< jx@83@01 (Seq_length a@77@01))
              (not (< jx@83@01 (Seq_length a@77@01))))))
        (or (>= jx@83@01 0) (not (>= jx@83@01 0)))))
    (or
      (< ix@82@01 (Seq_length a@77@01))
      (not (< ix@82@01 (Seq_length a@77@01)))))))
(assert (or (>= ix@82@01 0) (not (>= ix@82@01 0))))
(push) ; 3
; [then-branch: 37 | ix@82@01 >= 0 && ix@82@01 < |a@77@01| && jx@83@01 >= 0 && jx@83@01 < |a@77@01| && ix@82@01 != jx@83@01 | live]
; [else-branch: 37 | !(ix@82@01 >= 0 && ix@82@01 < |a@77@01| && jx@83@01 >= 0 && jx@83@01 < |a@77@01| && ix@82@01 != jx@83@01) | live]
(push) ; 4
; [then-branch: 37 | ix@82@01 >= 0 && ix@82@01 < |a@77@01| && jx@83@01 >= 0 && jx@83@01 < |a@77@01| && ix@82@01 != jx@83@01]
(assert (and
  (>= ix@82@01 0)
  (and
    (< ix@82@01 (Seq_length a@77@01))
    (and
      (>= jx@83@01 0)
      (and (< jx@83@01 (Seq_length a@77@01)) (not (= ix@82@01 jx@83@01)))))))
; [eval] a[ix] != a[jx]
; [eval] a[ix]
; [eval] a[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 37 | !(ix@82@01 >= 0 && ix@82@01 < |a@77@01| && jx@83@01 >= 0 && jx@83@01 < |a@77@01| && ix@82@01 != jx@83@01)]
(assert (not
  (and
    (>= ix@82@01 0)
    (and
      (< ix@82@01 (Seq_length a@77@01))
      (and
        (>= jx@83@01 0)
        (and (< jx@83@01 (Seq_length a@77@01)) (not (= ix@82@01 jx@83@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@82@01 0)
    (and
      (< ix@82@01 (Seq_length a@77@01))
      (and
        (>= jx@83@01 0)
        (and (< jx@83@01 (Seq_length a@77@01)) (not (= ix@82@01 jx@83@01))))))
  (and
    (>= ix@82@01 0)
    (< ix@82@01 (Seq_length a@77@01))
    (>= jx@83@01 0)
    (< jx@83@01 (Seq_length a@77@01))
    (not (= ix@82@01 jx@83@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@82@01 0)
      (and
        (< ix@82@01 (Seq_length a@77@01))
        (and
          (>= jx@83@01 0)
          (and (< jx@83@01 (Seq_length a@77@01)) (not (= ix@82@01 jx@83@01)))))))
  (and
    (>= ix@82@01 0)
    (and
      (< ix@82@01 (Seq_length a@77@01))
      (and
        (>= jx@83@01 0)
        (and (< jx@83@01 (Seq_length a@77@01)) (not (= ix@82@01 jx@83@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@82@01 Int) (jx@83@01 Int)) (!
  (and
    (=>
      (>= ix@82@01 0)
      (and
        (>= ix@82@01 0)
        (=>
          (< ix@82@01 (Seq_length a@77@01))
          (and
            (< ix@82@01 (Seq_length a@77@01))
            (=>
              (>= jx@83@01 0)
              (and
                (>= jx@83@01 0)
                (or
                  (< jx@83@01 (Seq_length a@77@01))
                  (not (< jx@83@01 (Seq_length a@77@01))))))
            (or (>= jx@83@01 0) (not (>= jx@83@01 0)))))
        (or
          (< ix@82@01 (Seq_length a@77@01))
          (not (< ix@82@01 (Seq_length a@77@01))))))
    (or (>= ix@82@01 0) (not (>= ix@82@01 0)))
    (=>
      (and
        (>= ix@82@01 0)
        (and
          (< ix@82@01 (Seq_length a@77@01))
          (and
            (>= jx@83@01 0)
            (and (< jx@83@01 (Seq_length a@77@01)) (not (= ix@82@01 jx@83@01))))))
      (and
        (>= ix@82@01 0)
        (< ix@82@01 (Seq_length a@77@01))
        (>= jx@83@01 0)
        (< jx@83@01 (Seq_length a@77@01))
        (not (= ix@82@01 jx@83@01))))
    (or
      (not
        (and
          (>= ix@82@01 0)
          (and
            (< ix@82@01 (Seq_length a@77@01))
            (and
              (>= jx@83@01 0)
              (and (< jx@83@01 (Seq_length a@77@01)) (not (= ix@82@01 jx@83@01)))))))
      (and
        (>= ix@82@01 0)
        (and
          (< ix@82@01 (Seq_length a@77@01))
          (and
            (>= jx@83@01 0)
            (and (< jx@83@01 (Seq_length a@77@01)) (not (= ix@82@01 jx@83@01))))))))
  :pattern ((Seq_index a@77@01 ix@82@01) (Seq_index a@77@01 jx@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@119@12@119@112-aux|)))
(assert (forall ((ix@82@01 Int) (jx@83@01 Int)) (!
  (=>
    (and
      (>= ix@82@01 0)
      (and
        (< ix@82@01 (Seq_length a@77@01))
        (and
          (>= jx@83@01 0)
          (and (< jx@83@01 (Seq_length a@77@01)) (not (= ix@82@01 jx@83@01))))))
    (not (= (Seq_index a@77@01 ix@82@01) (Seq_index a@77@01 jx@83@01))))
  :pattern ((Seq_index a@77@01 ix@82@01) (Seq_index a@77@01 jx@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@119@12@119@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))
(declare-const i@84@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 38 | !(0 <= i@84@01) | live]
; [else-branch: 38 | 0 <= i@84@01 | live]
(push) ; 4
; [then-branch: 38 | !(0 <= i@84@01)]
(assert (not (<= 0 i@84@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 38 | 0 <= i@84@01]
(assert (<= 0 i@84@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@84@01) (not (<= 0 i@84@01))))
(assert (and (<= 0 i@84@01) (< i@84@01 len@80@01)))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@84@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@84@01 (Seq_length a@77@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@85@01 ($Ref) Int)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@84@01 Int)) (!
  (=>
    (and (<= 0 i@84@01) (< i@84@01 len@80@01))
    (or (<= 0 i@84@01) (not (<= 0 i@84@01))))
  :pattern ((Seq_index a@77@01 i@84@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@84@01 Int) (i2@84@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@84@01) (< i1@84@01 len@80@01))
      (and (<= 0 i2@84@01) (< i2@84@01 len@80@01))
      (= (Seq_index a@77@01 i1@84@01) (Seq_index a@77@01 i2@84@01)))
    (= i1@84@01 i2@84@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@84@01 Int)) (!
  (=>
    (and (<= 0 i@84@01) (< i@84@01 len@80@01))
    (and
      (= (inv@85@01 (Seq_index a@77@01 i@84@01)) i@84@01)
      (img@86@01 (Seq_index a@77@01 i@84@01))))
  :pattern ((Seq_index a@77@01 i@84@01))
  :qid |quant-u-67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (= (Seq_index a@77@01 (inv@85@01 r)) r))
  :pattern ((inv@85@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@84@01 Int)) (!
  (=>
    (and (<= 0 i@84@01) (< i@84@01 len@80@01))
    (not (= (Seq_index a@77@01 i@84@01) $Ref.null)))
  :pattern ((Seq_index a@77@01 i@84@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (= (Seq_length b@78@01) len@80@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))
  $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { b[ix], b[jx] } ix >= 0 && (ix < |b| && (jx >= 0 && (jx < |b| && ix != jx))) ==> b[ix] != b[jx])
(declare-const ix@87@01 Int)
(declare-const jx@88@01 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |b| && (jx >= 0 && (jx < |b| && ix != jx))) ==> b[ix] != b[jx]
; [eval] ix >= 0 && (ix < |b| && (jx >= 0 && (jx < |b| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 39 | !(ix@87@01 >= 0) | live]
; [else-branch: 39 | ix@87@01 >= 0 | live]
(push) ; 4
; [then-branch: 39 | !(ix@87@01 >= 0)]
(assert (not (>= ix@87@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 39 | ix@87@01 >= 0]
(assert (>= ix@87@01 0))
; [eval] ix < |b|
; [eval] |b|
(push) ; 5
; [then-branch: 40 | !(ix@87@01 < |b@78@01|) | live]
; [else-branch: 40 | ix@87@01 < |b@78@01| | live]
(push) ; 6
; [then-branch: 40 | !(ix@87@01 < |b@78@01|)]
(assert (not (< ix@87@01 (Seq_length b@78@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 40 | ix@87@01 < |b@78@01|]
(assert (< ix@87@01 (Seq_length b@78@01)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 41 | !(jx@88@01 >= 0) | live]
; [else-branch: 41 | jx@88@01 >= 0 | live]
(push) ; 8
; [then-branch: 41 | !(jx@88@01 >= 0)]
(assert (not (>= jx@88@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 41 | jx@88@01 >= 0]
(assert (>= jx@88@01 0))
; [eval] jx < |b|
; [eval] |b|
(push) ; 9
; [then-branch: 42 | !(jx@88@01 < |b@78@01|) | live]
; [else-branch: 42 | jx@88@01 < |b@78@01| | live]
(push) ; 10
; [then-branch: 42 | !(jx@88@01 < |b@78@01|)]
(assert (not (< jx@88@01 (Seq_length b@78@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 42 | jx@88@01 < |b@78@01|]
(assert (< jx@88@01 (Seq_length b@78@01)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@88@01 (Seq_length b@78@01)) (not (< jx@88@01 (Seq_length b@78@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@88@01 0)
  (and
    (>= jx@88@01 0)
    (or
      (< jx@88@01 (Seq_length b@78@01))
      (not (< jx@88@01 (Seq_length b@78@01)))))))
(assert (or (>= jx@88@01 0) (not (>= jx@88@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@87@01 (Seq_length b@78@01))
  (and
    (< ix@87@01 (Seq_length b@78@01))
    (=>
      (>= jx@88@01 0)
      (and
        (>= jx@88@01 0)
        (or
          (< jx@88@01 (Seq_length b@78@01))
          (not (< jx@88@01 (Seq_length b@78@01))))))
    (or (>= jx@88@01 0) (not (>= jx@88@01 0))))))
(assert (or (< ix@87@01 (Seq_length b@78@01)) (not (< ix@87@01 (Seq_length b@78@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@87@01 0)
  (and
    (>= ix@87@01 0)
    (=>
      (< ix@87@01 (Seq_length b@78@01))
      (and
        (< ix@87@01 (Seq_length b@78@01))
        (=>
          (>= jx@88@01 0)
          (and
            (>= jx@88@01 0)
            (or
              (< jx@88@01 (Seq_length b@78@01))
              (not (< jx@88@01 (Seq_length b@78@01))))))
        (or (>= jx@88@01 0) (not (>= jx@88@01 0)))))
    (or
      (< ix@87@01 (Seq_length b@78@01))
      (not (< ix@87@01 (Seq_length b@78@01)))))))
(assert (or (>= ix@87@01 0) (not (>= ix@87@01 0))))
(push) ; 3
; [then-branch: 43 | ix@87@01 >= 0 && ix@87@01 < |b@78@01| && jx@88@01 >= 0 && jx@88@01 < |b@78@01| && ix@87@01 != jx@88@01 | live]
; [else-branch: 43 | !(ix@87@01 >= 0 && ix@87@01 < |b@78@01| && jx@88@01 >= 0 && jx@88@01 < |b@78@01| && ix@87@01 != jx@88@01) | live]
(push) ; 4
; [then-branch: 43 | ix@87@01 >= 0 && ix@87@01 < |b@78@01| && jx@88@01 >= 0 && jx@88@01 < |b@78@01| && ix@87@01 != jx@88@01]
(assert (and
  (>= ix@87@01 0)
  (and
    (< ix@87@01 (Seq_length b@78@01))
    (and
      (>= jx@88@01 0)
      (and (< jx@88@01 (Seq_length b@78@01)) (not (= ix@87@01 jx@88@01)))))))
; [eval] b[ix] != b[jx]
; [eval] b[ix]
; [eval] b[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 43 | !(ix@87@01 >= 0 && ix@87@01 < |b@78@01| && jx@88@01 >= 0 && jx@88@01 < |b@78@01| && ix@87@01 != jx@88@01)]
(assert (not
  (and
    (>= ix@87@01 0)
    (and
      (< ix@87@01 (Seq_length b@78@01))
      (and
        (>= jx@88@01 0)
        (and (< jx@88@01 (Seq_length b@78@01)) (not (= ix@87@01 jx@88@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@87@01 0)
    (and
      (< ix@87@01 (Seq_length b@78@01))
      (and
        (>= jx@88@01 0)
        (and (< jx@88@01 (Seq_length b@78@01)) (not (= ix@87@01 jx@88@01))))))
  (and
    (>= ix@87@01 0)
    (< ix@87@01 (Seq_length b@78@01))
    (>= jx@88@01 0)
    (< jx@88@01 (Seq_length b@78@01))
    (not (= ix@87@01 jx@88@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@87@01 0)
      (and
        (< ix@87@01 (Seq_length b@78@01))
        (and
          (>= jx@88@01 0)
          (and (< jx@88@01 (Seq_length b@78@01)) (not (= ix@87@01 jx@88@01)))))))
  (and
    (>= ix@87@01 0)
    (and
      (< ix@87@01 (Seq_length b@78@01))
      (and
        (>= jx@88@01 0)
        (and (< jx@88@01 (Seq_length b@78@01)) (not (= ix@87@01 jx@88@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@87@01 Int) (jx@88@01 Int)) (!
  (and
    (=>
      (>= ix@87@01 0)
      (and
        (>= ix@87@01 0)
        (=>
          (< ix@87@01 (Seq_length b@78@01))
          (and
            (< ix@87@01 (Seq_length b@78@01))
            (=>
              (>= jx@88@01 0)
              (and
                (>= jx@88@01 0)
                (or
                  (< jx@88@01 (Seq_length b@78@01))
                  (not (< jx@88@01 (Seq_length b@78@01))))))
            (or (>= jx@88@01 0) (not (>= jx@88@01 0)))))
        (or
          (< ix@87@01 (Seq_length b@78@01))
          (not (< ix@87@01 (Seq_length b@78@01))))))
    (or (>= ix@87@01 0) (not (>= ix@87@01 0)))
    (=>
      (and
        (>= ix@87@01 0)
        (and
          (< ix@87@01 (Seq_length b@78@01))
          (and
            (>= jx@88@01 0)
            (and (< jx@88@01 (Seq_length b@78@01)) (not (= ix@87@01 jx@88@01))))))
      (and
        (>= ix@87@01 0)
        (< ix@87@01 (Seq_length b@78@01))
        (>= jx@88@01 0)
        (< jx@88@01 (Seq_length b@78@01))
        (not (= ix@87@01 jx@88@01))))
    (or
      (not
        (and
          (>= ix@87@01 0)
          (and
            (< ix@87@01 (Seq_length b@78@01))
            (and
              (>= jx@88@01 0)
              (and (< jx@88@01 (Seq_length b@78@01)) (not (= ix@87@01 jx@88@01)))))))
      (and
        (>= ix@87@01 0)
        (and
          (< ix@87@01 (Seq_length b@78@01))
          (and
            (>= jx@88@01 0)
            (and (< jx@88@01 (Seq_length b@78@01)) (not (= ix@87@01 jx@88@01))))))))
  :pattern ((Seq_index b@78@01 ix@87@01) (Seq_index b@78@01 jx@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@122@12@122@112-aux|)))
(assert (forall ((ix@87@01 Int) (jx@88@01 Int)) (!
  (=>
    (and
      (>= ix@87@01 0)
      (and
        (< ix@87@01 (Seq_length b@78@01))
        (and
          (>= jx@88@01 0)
          (and (< jx@88@01 (Seq_length b@78@01)) (not (= ix@87@01 jx@88@01))))))
    (not (= (Seq_index b@78@01 ix@87@01) (Seq_index b@78@01 jx@88@01))))
  :pattern ((Seq_index b@78@01 ix@87@01) (Seq_index b@78@01 jx@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@122@12@122@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))))))
(declare-const i@89@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 44 | !(0 <= i@89@01) | live]
; [else-branch: 44 | 0 <= i@89@01 | live]
(push) ; 4
; [then-branch: 44 | !(0 <= i@89@01)]
(assert (not (<= 0 i@89@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 44 | 0 <= i@89@01]
(assert (<= 0 i@89@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@89@01) (not (<= 0 i@89@01))))
(assert (and (<= 0 i@89@01) (< i@89@01 len@80@01)))
; [eval] b[i]
(push) ; 3
(assert (not (>= i@89@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@89@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@90@01 ($Ref) Int)
(declare-fun img@91@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and (<= 0 i@89@01) (< i@89@01 len@80@01))
    (or (<= 0 i@89@01) (not (<= 0 i@89@01))))
  :pattern ((Seq_index b@78@01 i@89@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@89@01 Int) (i2@89@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@89@01) (< i1@89@01 len@80@01))
      (and (<= 0 i2@89@01) (< i2@89@01 len@80@01))
      (= (Seq_index b@78@01 i1@89@01) (Seq_index b@78@01 i2@89@01)))
    (= i1@89@01 i2@89@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and (<= 0 i@89@01) (< i@89@01 len@80@01))
    (and
      (= (inv@90@01 (Seq_index b@78@01 i@89@01)) i@89@01)
      (img@91@01 (Seq_index b@78@01 i@89@01))))
  :pattern ((Seq_index b@78@01 i@89@01))
  :qid |quant-u-69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (= (Seq_index b@78@01 (inv@90@01 r)) r))
  :pattern ((inv@90@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and (<= 0 i@89@01) (< i@89@01 len@80@01))
    (not (= (Seq_index b@78@01 i@89@01) $Ref.null)))
  :pattern ((Seq_index b@78@01 i@89@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@78@01 i@89@01) (Seq_index a@77@01 i@84@01))
    (=
      (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (= (Seq_length c@79@01) len@80@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))
  $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { c[ix], c[jx] } ix >= 0 && (ix < |c| && (jx >= 0 && (jx < |c| && ix != jx))) ==> c[ix] != c[jx])
(declare-const ix@92@01 Int)
(declare-const jx@93@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] ix >= 0 && (ix < |c| && (jx >= 0 && (jx < |c| && ix != jx))) ==> c[ix] != c[jx]
; [eval] ix >= 0 && (ix < |c| && (jx >= 0 && (jx < |c| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 45 | !(ix@92@01 >= 0) | live]
; [else-branch: 45 | ix@92@01 >= 0 | live]
(push) ; 4
; [then-branch: 45 | !(ix@92@01 >= 0)]
(assert (not (>= ix@92@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 45 | ix@92@01 >= 0]
(assert (>= ix@92@01 0))
; [eval] ix < |c|
; [eval] |c|
(push) ; 5
; [then-branch: 46 | !(ix@92@01 < |c@79@01|) | live]
; [else-branch: 46 | ix@92@01 < |c@79@01| | live]
(push) ; 6
; [then-branch: 46 | !(ix@92@01 < |c@79@01|)]
(assert (not (< ix@92@01 (Seq_length c@79@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 46 | ix@92@01 < |c@79@01|]
(assert (< ix@92@01 (Seq_length c@79@01)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 47 | !(jx@93@01 >= 0) | live]
; [else-branch: 47 | jx@93@01 >= 0 | live]
(push) ; 8
; [then-branch: 47 | !(jx@93@01 >= 0)]
(assert (not (>= jx@93@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 47 | jx@93@01 >= 0]
(assert (>= jx@93@01 0))
; [eval] jx < |c|
; [eval] |c|
(push) ; 9
; [then-branch: 48 | !(jx@93@01 < |c@79@01|) | live]
; [else-branch: 48 | jx@93@01 < |c@79@01| | live]
(push) ; 10
; [then-branch: 48 | !(jx@93@01 < |c@79@01|)]
(assert (not (< jx@93@01 (Seq_length c@79@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 48 | jx@93@01 < |c@79@01|]
(assert (< jx@93@01 (Seq_length c@79@01)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@93@01 (Seq_length c@79@01)) (not (< jx@93@01 (Seq_length c@79@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@93@01 0)
  (and
    (>= jx@93@01 0)
    (or
      (< jx@93@01 (Seq_length c@79@01))
      (not (< jx@93@01 (Seq_length c@79@01)))))))
(assert (or (>= jx@93@01 0) (not (>= jx@93@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@92@01 (Seq_length c@79@01))
  (and
    (< ix@92@01 (Seq_length c@79@01))
    (=>
      (>= jx@93@01 0)
      (and
        (>= jx@93@01 0)
        (or
          (< jx@93@01 (Seq_length c@79@01))
          (not (< jx@93@01 (Seq_length c@79@01))))))
    (or (>= jx@93@01 0) (not (>= jx@93@01 0))))))
(assert (or (< ix@92@01 (Seq_length c@79@01)) (not (< ix@92@01 (Seq_length c@79@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@92@01 0)
  (and
    (>= ix@92@01 0)
    (=>
      (< ix@92@01 (Seq_length c@79@01))
      (and
        (< ix@92@01 (Seq_length c@79@01))
        (=>
          (>= jx@93@01 0)
          (and
            (>= jx@93@01 0)
            (or
              (< jx@93@01 (Seq_length c@79@01))
              (not (< jx@93@01 (Seq_length c@79@01))))))
        (or (>= jx@93@01 0) (not (>= jx@93@01 0)))))
    (or
      (< ix@92@01 (Seq_length c@79@01))
      (not (< ix@92@01 (Seq_length c@79@01)))))))
(assert (or (>= ix@92@01 0) (not (>= ix@92@01 0))))
(push) ; 3
; [then-branch: 49 | ix@92@01 >= 0 && ix@92@01 < |c@79@01| && jx@93@01 >= 0 && jx@93@01 < |c@79@01| && ix@92@01 != jx@93@01 | live]
; [else-branch: 49 | !(ix@92@01 >= 0 && ix@92@01 < |c@79@01| && jx@93@01 >= 0 && jx@93@01 < |c@79@01| && ix@92@01 != jx@93@01) | live]
(push) ; 4
; [then-branch: 49 | ix@92@01 >= 0 && ix@92@01 < |c@79@01| && jx@93@01 >= 0 && jx@93@01 < |c@79@01| && ix@92@01 != jx@93@01]
(assert (and
  (>= ix@92@01 0)
  (and
    (< ix@92@01 (Seq_length c@79@01))
    (and
      (>= jx@93@01 0)
      (and (< jx@93@01 (Seq_length c@79@01)) (not (= ix@92@01 jx@93@01)))))))
; [eval] c[ix] != c[jx]
; [eval] c[ix]
; [eval] c[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 49 | !(ix@92@01 >= 0 && ix@92@01 < |c@79@01| && jx@93@01 >= 0 && jx@93@01 < |c@79@01| && ix@92@01 != jx@93@01)]
(assert (not
  (and
    (>= ix@92@01 0)
    (and
      (< ix@92@01 (Seq_length c@79@01))
      (and
        (>= jx@93@01 0)
        (and (< jx@93@01 (Seq_length c@79@01)) (not (= ix@92@01 jx@93@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@92@01 0)
    (and
      (< ix@92@01 (Seq_length c@79@01))
      (and
        (>= jx@93@01 0)
        (and (< jx@93@01 (Seq_length c@79@01)) (not (= ix@92@01 jx@93@01))))))
  (and
    (>= ix@92@01 0)
    (< ix@92@01 (Seq_length c@79@01))
    (>= jx@93@01 0)
    (< jx@93@01 (Seq_length c@79@01))
    (not (= ix@92@01 jx@93@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@92@01 0)
      (and
        (< ix@92@01 (Seq_length c@79@01))
        (and
          (>= jx@93@01 0)
          (and (< jx@93@01 (Seq_length c@79@01)) (not (= ix@92@01 jx@93@01)))))))
  (and
    (>= ix@92@01 0)
    (and
      (< ix@92@01 (Seq_length c@79@01))
      (and
        (>= jx@93@01 0)
        (and (< jx@93@01 (Seq_length c@79@01)) (not (= ix@92@01 jx@93@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@92@01 Int) (jx@93@01 Int)) (!
  (and
    (=>
      (>= ix@92@01 0)
      (and
        (>= ix@92@01 0)
        (=>
          (< ix@92@01 (Seq_length c@79@01))
          (and
            (< ix@92@01 (Seq_length c@79@01))
            (=>
              (>= jx@93@01 0)
              (and
                (>= jx@93@01 0)
                (or
                  (< jx@93@01 (Seq_length c@79@01))
                  (not (< jx@93@01 (Seq_length c@79@01))))))
            (or (>= jx@93@01 0) (not (>= jx@93@01 0)))))
        (or
          (< ix@92@01 (Seq_length c@79@01))
          (not (< ix@92@01 (Seq_length c@79@01))))))
    (or (>= ix@92@01 0) (not (>= ix@92@01 0)))
    (=>
      (and
        (>= ix@92@01 0)
        (and
          (< ix@92@01 (Seq_length c@79@01))
          (and
            (>= jx@93@01 0)
            (and (< jx@93@01 (Seq_length c@79@01)) (not (= ix@92@01 jx@93@01))))))
      (and
        (>= ix@92@01 0)
        (< ix@92@01 (Seq_length c@79@01))
        (>= jx@93@01 0)
        (< jx@93@01 (Seq_length c@79@01))
        (not (= ix@92@01 jx@93@01))))
    (or
      (not
        (and
          (>= ix@92@01 0)
          (and
            (< ix@92@01 (Seq_length c@79@01))
            (and
              (>= jx@93@01 0)
              (and (< jx@93@01 (Seq_length c@79@01)) (not (= ix@92@01 jx@93@01)))))))
      (and
        (>= ix@92@01 0)
        (and
          (< ix@92@01 (Seq_length c@79@01))
          (and
            (>= jx@93@01 0)
            (and (< jx@93@01 (Seq_length c@79@01)) (not (= ix@92@01 jx@93@01))))))))
  :pattern ((Seq_index c@79@01 ix@92@01) (Seq_index c@79@01 jx@93@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@125@12@125@112-aux|)))
(assert (forall ((ix@92@01 Int) (jx@93@01 Int)) (!
  (=>
    (and
      (>= ix@92@01 0)
      (and
        (< ix@92@01 (Seq_length c@79@01))
        (and
          (>= jx@93@01 0)
          (and (< jx@93@01 (Seq_length c@79@01)) (not (= ix@92@01 jx@93@01))))))
    (not (= (Seq_index c@79@01 ix@92@01) (Seq_index c@79@01 jx@93@01))))
  :pattern ((Seq_index c@79@01 ix@92@01) (Seq_index c@79@01 jx@93@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@125@12@125@112|)))
(declare-const i@94@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 50 | !(0 <= i@94@01) | live]
; [else-branch: 50 | 0 <= i@94@01 | live]
(push) ; 4
; [then-branch: 50 | !(0 <= i@94@01)]
(assert (not (<= 0 i@94@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 50 | 0 <= i@94@01]
(assert (<= 0 i@94@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@94@01) (not (<= 0 i@94@01))))
(assert (and (<= 0 i@94@01) (< i@94@01 len@80@01)))
; [eval] c[i]
(push) ; 3
(assert (not (>= i@94@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@94@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@95@01 ($Ref) Int)
(declare-fun img@96@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@94@01 Int)) (!
  (=>
    (and (<= 0 i@94@01) (< i@94@01 len@80@01))
    (or (<= 0 i@94@01) (not (<= 0 i@94@01))))
  :pattern ((Seq_index c@79@01 i@94@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@94@01 Int) (i2@94@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@94@01) (< i1@94@01 len@80@01))
      (and (<= 0 i2@94@01) (< i2@94@01 len@80@01))
      (= (Seq_index c@79@01 i1@94@01) (Seq_index c@79@01 i2@94@01)))
    (= i1@94@01 i2@94@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@94@01 Int)) (!
  (=>
    (and (<= 0 i@94@01) (< i@94@01 len@80@01))
    (and
      (= (inv@95@01 (Seq_index c@79@01 i@94@01)) i@94@01)
      (img@96@01 (Seq_index c@79@01 i@94@01))))
  :pattern ((Seq_index c@79@01 i@94@01))
  :qid |quant-u-72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (= (Seq_index c@79@01 (inv@95@01 r)) r))
  :pattern ((inv@95@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@94@01 Int)) (!
  (=>
    (and (<= 0 i@94@01) (< i@94@01 len@80@01))
    (not (= (Seq_index c@79@01 i@94@01) $Ref.null)))
  :pattern ((Seq_index c@79@01 i@94@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@79@01 i@94@01) (Seq_index b@78@01 i@89@01))
    (=
      (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
      (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))))
  
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
    (= (Seq_index c@79@01 i@94@01) (Seq_index a@77@01 i@84@01))
    (=
      (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))))
  
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
(declare-const $t@97@01 $Snap)
(assert (= $t@97@01 ($Snap.combine ($Snap.first $t@97@01) ($Snap.second $t@97@01))))
(assert (= ($Snap.first $t@97@01) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second $t@97@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@97@01))
    ($Snap.second ($Snap.second $t@97@01)))))
(declare-const i@98@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 51 | !(0 <= i@98@01) | live]
; [else-branch: 51 | 0 <= i@98@01 | live]
(push) ; 5
; [then-branch: 51 | !(0 <= i@98@01)]
(assert (not (<= 0 i@98@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 51 | 0 <= i@98@01]
(assert (<= 0 i@98@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@98@01) (not (<= 0 i@98@01))))
(assert (and (<= 0 i@98@01) (< i@98@01 len@80@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@98@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@98@01 (Seq_length a@77@01))))
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
    (and (<= 0 i@98@01) (< i@98@01 len@80@01))
    (or (<= 0 i@98@01) (not (<= 0 i@98@01))))
  :pattern ((Seq_index a@77@01 i@98@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@98@01 Int) (i2@98@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@98@01) (< i1@98@01 len@80@01))
      (and (<= 0 i2@98@01) (< i2@98@01 len@80@01))
      (= (Seq_index a@77@01 i1@98@01) (Seq_index a@77@01 i2@98@01)))
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
    (and (<= 0 i@98@01) (< i@98@01 len@80@01))
    (and
      (= (inv@99@01 (Seq_index a@77@01 i@98@01)) i@98@01)
      (img@100@01 (Seq_index a@77@01 i@98@01))))
  :pattern ((Seq_index a@77@01 i@98@01))
  :qid |quant-u-76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
    (= (Seq_index a@77@01 (inv@99@01 r)) r))
  :pattern ((inv@99@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@98@01 Int)) (!
  (=>
    (and (<= 0 i@98@01) (< i@98@01 len@80@01))
    (not (= (Seq_index a@77@01 i@98@01) $Ref.null)))
  :pattern ((Seq_index a@77@01 i@98@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@97@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@97@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@97@01))) $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@97@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))
(declare-const i@101@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 52 | !(0 <= i@101@01) | live]
; [else-branch: 52 | 0 <= i@101@01 | live]
(push) ; 5
; [then-branch: 52 | !(0 <= i@101@01)]
(assert (not (<= 0 i@101@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 52 | 0 <= i@101@01]
(assert (<= 0 i@101@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@101@01) (not (<= 0 i@101@01))))
(assert (and (<= 0 i@101@01) (< i@101@01 len@80@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@101@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@101@01 (Seq_length b@78@01))))
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
    (and (<= 0 i@101@01) (< i@101@01 len@80@01))
    (or (<= 0 i@101@01) (not (<= 0 i@101@01))))
  :pattern ((Seq_index b@78@01 i@101@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@101@01 Int) (i2@101@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@101@01) (< i1@101@01 len@80@01))
      (and (<= 0 i2@101@01) (< i2@101@01 len@80@01))
      (= (Seq_index b@78@01 i1@101@01) (Seq_index b@78@01 i2@101@01)))
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
    (and (<= 0 i@101@01) (< i@101@01 len@80@01))
    (and
      (= (inv@102@01 (Seq_index b@78@01 i@101@01)) i@101@01)
      (img@103@01 (Seq_index b@78@01 i@101@01))))
  :pattern ((Seq_index b@78@01 i@101@01))
  :qid |quant-u-78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
    (= (Seq_index b@78@01 (inv@102@01 r)) r))
  :pattern ((inv@102@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@101@01 Int)) (!
  (=>
    (and (<= 0 i@101@01) (< i@101@01 len@80@01))
    (not (= (Seq_index b@78@01 i@101@01) $Ref.null)))
  :pattern ((Seq_index b@78@01 i@101@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@78@01 i@101@01) (Seq_index a@77@01 i@98@01))
    (=
      (and
        (img@103@01 r)
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
      (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))))
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))))
(declare-const i@104@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 53 | !(0 <= i@104@01) | live]
; [else-branch: 53 | 0 <= i@104@01 | live]
(push) ; 5
; [then-branch: 53 | !(0 <= i@104@01)]
(assert (not (<= 0 i@104@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 53 | 0 <= i@104@01]
(assert (<= 0 i@104@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@104@01) (not (<= 0 i@104@01))))
(assert (and (<= 0 i@104@01) (< i@104@01 len@80@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@104@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@104@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@105@01 ($Ref) Int)
(declare-fun img@106@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@104@01 Int)) (!
  (=>
    (and (<= 0 i@104@01) (< i@104@01 len@80@01))
    (or (<= 0 i@104@01) (not (<= 0 i@104@01))))
  :pattern ((Seq_index c@79@01 i@104@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@104@01 Int) (i2@104@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@104@01) (< i1@104@01 len@80@01))
      (and (<= 0 i2@104@01) (< i2@104@01 len@80@01))
      (= (Seq_index c@79@01 i1@104@01) (Seq_index c@79@01 i2@104@01)))
    (= i1@104@01 i2@104@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@104@01 Int)) (!
  (=>
    (and (<= 0 i@104@01) (< i@104@01 len@80@01))
    (and
      (= (inv@105@01 (Seq_index c@79@01 i@104@01)) i@104@01)
      (img@106@01 (Seq_index c@79@01 i@104@01))))
  :pattern ((Seq_index c@79@01 i@104@01))
  :qid |quant-u-81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@01 r) (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
    (= (Seq_index c@79@01 (inv@105@01 r)) r))
  :pattern ((inv@105@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@104@01 Int)) (!
  (=>
    (and (<= 0 i@104@01) (< i@104@01 len@80@01))
    (not (= (Seq_index c@79@01 i@104@01) $Ref.null)))
  :pattern ((Seq_index c@79@01 i@104@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@79@01 i@104@01) (Seq_index b@78@01 i@101@01))
    (=
      (and
        (img@106@01 r)
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
      (and
        (img@103@01 r)
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))))
  
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
    (= (Seq_index c@79@01 i@104@01) (Seq_index a@77@01 i@98@01))
    (=
      (and
        (img@106@01 r)
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
      (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))))
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))
  $Snap.unit))
; [eval] (forall i: Int :: { a[i] } { b[i] } { c[i] } 0 <= i && i < len ==> a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value)
(declare-const i@107@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 54 | !(0 <= i@107@01) | live]
; [else-branch: 54 | 0 <= i@107@01 | live]
(push) ; 5
; [then-branch: 54 | !(0 <= i@107@01)]
(assert (not (<= 0 i@107@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 54 | 0 <= i@107@01]
(assert (<= 0 i@107@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@107@01) (not (<= 0 i@107@01))))
(push) ; 4
; [then-branch: 55 | 0 <= i@107@01 && i@107@01 < len@80@01 | live]
; [else-branch: 55 | !(0 <= i@107@01 && i@107@01 < len@80@01) | live]
(push) ; 5
; [then-branch: 55 | 0 <= i@107@01 && i@107@01 < len@80@01]
(assert (and (<= 0 i@107@01) (< i@107@01 len@80@01)))
; [eval] a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] a[i]
(push) ; 6
(assert (not (>= i@107@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@107@01 (Seq_length a@77@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@108@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@01 r) (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@109@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@100@01 r)
            (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@103@01 r)
            (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@106@01 r)
          (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) (Seq_index a@77@01 i@107@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] b[i]
(push) ; 6
(assert (not (>= i@107@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@107@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@103@01 r)
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@106@01 r)
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@100@01 (Seq_index b@78@01 i@107@01))
          (and
            (<= 0 (inv@99@01 (Seq_index b@78@01 i@107@01)))
            (< (inv@99@01 (Seq_index b@78@01 i@107@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@103@01 (Seq_index b@78@01 i@107@01))
          (and
            (<= 0 (inv@102@01 (Seq_index b@78@01 i@107@01)))
            (< (inv@102@01 (Seq_index b@78@01 i@107@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@106@01 (Seq_index b@78@01 i@107@01))
        (and
          (<= 0 (inv@105@01 (Seq_index b@78@01 i@107@01)))
          (< (inv@105@01 (Seq_index b@78@01 i@107@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@107@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@107@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@103@01 r)
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@106@01 r)
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@100@01 (Seq_index c@79@01 i@107@01))
          (and
            (<= 0 (inv@99@01 (Seq_index c@79@01 i@107@01)))
            (< (inv@99@01 (Seq_index c@79@01 i@107@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@103@01 (Seq_index c@79@01 i@107@01))
          (and
            (<= 0 (inv@102@01 (Seq_index c@79@01 i@107@01)))
            (< (inv@102@01 (Seq_index c@79@01 i@107@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@106@01 (Seq_index c@79@01 i@107@01))
        (and
          (<= 0 (inv@105@01 (Seq_index c@79@01 i@107@01)))
          (< (inv@105@01 (Seq_index c@79@01 i@107@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 55 | !(0 <= i@107@01 && i@107@01 < len@80@01)]
(assert (not (and (<= 0 i@107@01) (< i@107@01 len@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@01 r) (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@100@01 r)
            (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@103@01 r)
            (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@106@01 r)
          (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@107@01) (< i@107@01 len@80@01)))
  (and (<= 0 i@107@01) (< i@107@01 len@80@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@01 r) (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@100@01 r)
            (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@103@01 r)
            (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@106@01 r)
          (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@107@01 Int)) (!
  (and
    (or (<= 0 i@107@01) (not (<= 0 i@107@01)))
    (or
      (not (and (<= 0 i@107@01) (< i@107@01 len@80@01)))
      (and (<= 0 i@107@01) (< i@107@01 len@80@01))))
  :pattern ((Seq_index a@77@01 i@107@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@133@12@133@133-aux|)))
(assert (forall ((i@107@01 Int)) (!
  (and
    (or (<= 0 i@107@01) (not (<= 0 i@107@01)))
    (or
      (not (and (<= 0 i@107@01) (< i@107@01 len@80@01)))
      (and (<= 0 i@107@01) (< i@107@01 len@80@01))))
  :pattern ((Seq_index b@78@01 i@107@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@133@12@133@133-aux|)))
(assert (forall ((i@107@01 Int)) (!
  (and
    (or (<= 0 i@107@01) (not (<= 0 i@107@01)))
    (or
      (not (and (<= 0 i@107@01) (< i@107@01 len@80@01)))
      (and (<= 0 i@107@01) (< i@107@01 len@80@01))))
  :pattern ((Seq_index c@79@01 i@107@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@133@12@133@133-aux|)))
(assert (forall ((i@107@01 Int)) (!
  (=>
    (and (<= 0 i@107@01) (< i@107@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) (Seq_index
        a@77@01
        i@107@01))
      (+
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) (Seq_index
          b@78@01
          i@107@01))
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) (Seq_index
          c@79@01
          i@107@01)))))
  :pattern ((Seq_index a@77@01 i@107@01))
  :pattern ((Seq_index b@78@01 i@107@01))
  :pattern ((Seq_index c@79@01 i@107@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@133@12@133@133|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { old(b[i]) } 0 <= i && i < len ==> b[i].Ref__Integer_value == old(b[i].Ref__Integer_value))
(declare-const i@110@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 56 | !(0 <= i@110@01) | live]
; [else-branch: 56 | 0 <= i@110@01 | live]
(push) ; 5
; [then-branch: 56 | !(0 <= i@110@01)]
(assert (not (<= 0 i@110@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 56 | 0 <= i@110@01]
(assert (<= 0 i@110@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@110@01) (not (<= 0 i@110@01))))
(push) ; 4
; [then-branch: 57 | 0 <= i@110@01 && i@110@01 < len@80@01 | live]
; [else-branch: 57 | !(0 <= i@110@01 && i@110@01 < len@80@01) | live]
(push) ; 5
; [then-branch: 57 | 0 <= i@110@01 && i@110@01 < len@80@01]
(assert (and (<= 0 i@110@01) (< i@110@01 len@80@01)))
; [eval] b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 6
(assert (not (>= i@110@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@110@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@103@01 r)
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@106@01 r)
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@100@01 (Seq_index b@78@01 i@110@01))
          (and
            (<= 0 (inv@99@01 (Seq_index b@78@01 i@110@01)))
            (< (inv@99@01 (Seq_index b@78@01 i@110@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@103@01 (Seq_index b@78@01 i@110@01))
          (and
            (<= 0 (inv@102@01 (Seq_index b@78@01 i@110@01)))
            (< (inv@102@01 (Seq_index b@78@01 i@110@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@106@01 (Seq_index b@78@01 i@110@01))
        (and
          (<= 0 (inv@105@01 (Seq_index b@78@01 i@110@01)))
          (< (inv@105@01 (Seq_index b@78@01 i@110@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 6
(assert (not (>= i@110@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@110@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@111@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef14|)))
(declare-const pm@112@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@112@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@86@01 r)
            (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@91@01 r)
            (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@96@01 r)
          (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@112@01  $FPM) (Seq_index b@78@01 i@110@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 57 | !(0 <= i@110@01 && i@110@01 < len@80@01)]
(assert (not (and (<= 0 i@110@01) (< i@110@01 len@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@01 r) (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@112@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@86@01 r)
            (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@91@01 r)
            (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@96@01 r)
          (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@110@01) (< i@110@01 len@80@01)))
  (and (<= 0 i@110@01) (< i@110@01 len@80@01))))
; [eval] old(b[i])
; [eval] b[i]
(push) ; 4
(assert (not (>= i@110@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@01 r) (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@112@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@86@01 r)
            (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@91@01 r)
            (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@96@01 r)
          (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@110@01 Int)) (!
  (and
    (or (<= 0 i@110@01) (not (<= 0 i@110@01)))
    (or
      (not (and (<= 0 i@110@01) (< i@110@01 len@80@01)))
      (and (<= 0 i@110@01) (< i@110@01 len@80@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@134@12@134@112-aux|)))
(assert (forall ((i@110@01 Int)) (!
  (=>
    (and (<= 0 i@110@01) (< i@110@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) (Seq_index
        b@78@01
        i@110@01))
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) (Seq_index
        b@78@01
        i@110@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@134@12@134@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { old(c[i]) } 0 <= i && i < len ==> c[i].Ref__Integer_value == old(c[i].Ref__Integer_value))
(declare-const i@113@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 58 | !(0 <= i@113@01) | live]
; [else-branch: 58 | 0 <= i@113@01 | live]
(push) ; 5
; [then-branch: 58 | !(0 <= i@113@01)]
(assert (not (<= 0 i@113@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 58 | 0 <= i@113@01]
(assert (<= 0 i@113@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@113@01) (not (<= 0 i@113@01))))
(push) ; 4
; [then-branch: 59 | 0 <= i@113@01 && i@113@01 < len@80@01 | live]
; [else-branch: 59 | !(0 <= i@113@01 && i@113@01 < len@80@01) | live]
(push) ; 5
; [then-branch: 59 | 0 <= i@113@01 && i@113@01 < len@80@01]
(assert (and (<= 0 i@113@01) (< i@113@01 len@80@01)))
; [eval] c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@113@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@113@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@103@01 r)
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@106@01 r)
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@100@01 (Seq_index c@79@01 i@113@01))
          (and
            (<= 0 (inv@99@01 (Seq_index c@79@01 i@113@01)))
            (< (inv@99@01 (Seq_index c@79@01 i@113@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@103@01 (Seq_index c@79@01 i@113@01))
          (and
            (<= 0 (inv@102@01 (Seq_index c@79@01 i@113@01)))
            (< (inv@102@01 (Seq_index c@79@01 i@113@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@106@01 (Seq_index c@79@01 i@113@01))
        (and
          (<= 0 (inv@105@01 (Seq_index c@79@01 i@113@01)))
          (< (inv@105@01 (Seq_index c@79@01 i@113@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@113@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@113@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
    :qid |qp.fvfValDef14|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@86@01 (Seq_index c@79@01 i@113@01))
          (and
            (<= 0 (inv@85@01 (Seq_index c@79@01 i@113@01)))
            (< (inv@85@01 (Seq_index c@79@01 i@113@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@91@01 (Seq_index c@79@01 i@113@01))
          (and
            (<= 0 (inv@90@01 (Seq_index c@79@01 i@113@01)))
            (< (inv@90@01 (Seq_index c@79@01 i@113@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@96@01 (Seq_index c@79@01 i@113@01))
        (and
          (<= 0 (inv@95@01 (Seq_index c@79@01 i@113@01)))
          (< (inv@95@01 (Seq_index c@79@01 i@113@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 59 | !(0 <= i@113@01 && i@113@01 < len@80@01)]
(assert (not (and (<= 0 i@113@01) (< i@113@01 len@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@01 r) (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef14|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@113@01) (< i@113@01 len@80@01)))
  (and (<= 0 i@113@01) (< i@113@01 len@80@01))))
; [eval] old(c[i])
; [eval] c[i]
(push) ; 4
(assert (not (>= i@113@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@97@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@01 r) (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef14|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@113@01 Int)) (!
  (and
    (or (<= 0 i@113@01) (not (<= 0 i@113@01)))
    (or
      (not (and (<= 0 i@113@01) (< i@113@01 len@80@01)))
      (and (<= 0 i@113@01) (< i@113@01 len@80@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@135@12@135@112-aux|)))
(assert (forall ((i@113@01 Int)) (!
  (=>
    (and (<= 0 i@113@01) (< i@113@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) (Seq_index
        c@79@01
        i@113@01))
      ($FVF.lookup_Ref__Integer_value (as sm@111@01  $FVF<Ref__Integer_value>) (Seq_index
        c@79@01
        i@113@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@135@12@135@112|)))
(pop) ; 2
(push) ; 2
; [exec]
; Ref__loop_main_69(diz, current_thread_id, b, len, a, c)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@80@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@80@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 60 | 0 < len@80@01 | live]
; [else-branch: 60 | !(0 < len@80@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 60 | 0 < len@80@01]
(assert (< 0 len@80@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 4
(push) ; 4
; [else-branch: 60 | !(0 < len@80@01)]
(assert (not (< 0 len@80@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< 0 len@80@01)) (< 0 len@80@01)))
(push) ; 3
(assert (not (=> (< 0 len@80@01) (= (Seq_length a@77@01) len@80@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@80@01) (= (Seq_length a@77@01) len@80@01)))
; [eval] (forall ix: Int, jx: Int :: { a[ix], a[jx] } ix >= 0 && (ix < |a| && (jx >= 0 && (jx < |a| && ix != jx))) ==> a[ix] != a[jx])
(declare-const ix@114@01 Int)
(declare-const jx@115@01 Int)
(push) ; 3
; [eval] ix >= 0 && (ix < |a| && (jx >= 0 && (jx < |a| && ix != jx))) ==> a[ix] != a[jx]
; [eval] ix >= 0 && (ix < |a| && (jx >= 0 && (jx < |a| && ix != jx)))
; [eval] ix >= 0
(push) ; 4
; [then-branch: 61 | !(ix@114@01 >= 0) | live]
; [else-branch: 61 | ix@114@01 >= 0 | live]
(push) ; 5
; [then-branch: 61 | !(ix@114@01 >= 0)]
(assert (not (>= ix@114@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 61 | ix@114@01 >= 0]
(assert (>= ix@114@01 0))
; [eval] ix < |a|
; [eval] |a|
(push) ; 6
; [then-branch: 62 | !(ix@114@01 < |a@77@01|) | live]
; [else-branch: 62 | ix@114@01 < |a@77@01| | live]
(push) ; 7
; [then-branch: 62 | !(ix@114@01 < |a@77@01|)]
(assert (not (< ix@114@01 (Seq_length a@77@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 62 | ix@114@01 < |a@77@01|]
(assert (< ix@114@01 (Seq_length a@77@01)))
; [eval] jx >= 0
(push) ; 8
; [then-branch: 63 | !(jx@115@01 >= 0) | live]
; [else-branch: 63 | jx@115@01 >= 0 | live]
(push) ; 9
; [then-branch: 63 | !(jx@115@01 >= 0)]
(assert (not (>= jx@115@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 63 | jx@115@01 >= 0]
(assert (>= jx@115@01 0))
; [eval] jx < |a|
; [eval] |a|
(push) ; 10
; [then-branch: 64 | !(jx@115@01 < |a@77@01|) | live]
; [else-branch: 64 | jx@115@01 < |a@77@01| | live]
(push) ; 11
; [then-branch: 64 | !(jx@115@01 < |a@77@01|)]
(assert (not (< jx@115@01 (Seq_length a@77@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 64 | jx@115@01 < |a@77@01|]
(assert (< jx@115@01 (Seq_length a@77@01)))
; [eval] ix != jx
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< jx@115@01 (Seq_length a@77@01)) (not (< jx@115@01 (Seq_length a@77@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@115@01 0)
  (and
    (>= jx@115@01 0)
    (or
      (< jx@115@01 (Seq_length a@77@01))
      (not (< jx@115@01 (Seq_length a@77@01)))))))
(assert (or (>= jx@115@01 0) (not (>= jx@115@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@114@01 (Seq_length a@77@01))
  (and
    (< ix@114@01 (Seq_length a@77@01))
    (=>
      (>= jx@115@01 0)
      (and
        (>= jx@115@01 0)
        (or
          (< jx@115@01 (Seq_length a@77@01))
          (not (< jx@115@01 (Seq_length a@77@01))))))
    (or (>= jx@115@01 0) (not (>= jx@115@01 0))))))
(assert (or (< ix@114@01 (Seq_length a@77@01)) (not (< ix@114@01 (Seq_length a@77@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@114@01 0)
  (and
    (>= ix@114@01 0)
    (=>
      (< ix@114@01 (Seq_length a@77@01))
      (and
        (< ix@114@01 (Seq_length a@77@01))
        (=>
          (>= jx@115@01 0)
          (and
            (>= jx@115@01 0)
            (or
              (< jx@115@01 (Seq_length a@77@01))
              (not (< jx@115@01 (Seq_length a@77@01))))))
        (or (>= jx@115@01 0) (not (>= jx@115@01 0)))))
    (or
      (< ix@114@01 (Seq_length a@77@01))
      (not (< ix@114@01 (Seq_length a@77@01)))))))
(assert (or (>= ix@114@01 0) (not (>= ix@114@01 0))))
(push) ; 4
; [then-branch: 65 | ix@114@01 >= 0 && ix@114@01 < |a@77@01| && jx@115@01 >= 0 && jx@115@01 < |a@77@01| && ix@114@01 != jx@115@01 | live]
; [else-branch: 65 | !(ix@114@01 >= 0 && ix@114@01 < |a@77@01| && jx@115@01 >= 0 && jx@115@01 < |a@77@01| && ix@114@01 != jx@115@01) | live]
(push) ; 5
; [then-branch: 65 | ix@114@01 >= 0 && ix@114@01 < |a@77@01| && jx@115@01 >= 0 && jx@115@01 < |a@77@01| && ix@114@01 != jx@115@01]
(assert (and
  (>= ix@114@01 0)
  (and
    (< ix@114@01 (Seq_length a@77@01))
    (and
      (>= jx@115@01 0)
      (and (< jx@115@01 (Seq_length a@77@01)) (not (= ix@114@01 jx@115@01)))))))
; [eval] a[ix] != a[jx]
; [eval] a[ix]
; [eval] a[jx]
(pop) ; 5
(push) ; 5
; [else-branch: 65 | !(ix@114@01 >= 0 && ix@114@01 < |a@77@01| && jx@115@01 >= 0 && jx@115@01 < |a@77@01| && ix@114@01 != jx@115@01)]
(assert (not
  (and
    (>= ix@114@01 0)
    (and
      (< ix@114@01 (Seq_length a@77@01))
      (and
        (>= jx@115@01 0)
        (and (< jx@115@01 (Seq_length a@77@01)) (not (= ix@114@01 jx@115@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= ix@114@01 0)
    (and
      (< ix@114@01 (Seq_length a@77@01))
      (and
        (>= jx@115@01 0)
        (and (< jx@115@01 (Seq_length a@77@01)) (not (= ix@114@01 jx@115@01))))))
  (and
    (>= ix@114@01 0)
    (< ix@114@01 (Seq_length a@77@01))
    (>= jx@115@01 0)
    (< jx@115@01 (Seq_length a@77@01))
    (not (= ix@114@01 jx@115@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@114@01 0)
      (and
        (< ix@114@01 (Seq_length a@77@01))
        (and
          (>= jx@115@01 0)
          (and (< jx@115@01 (Seq_length a@77@01)) (not (= ix@114@01 jx@115@01)))))))
  (and
    (>= ix@114@01 0)
    (and
      (< ix@114@01 (Seq_length a@77@01))
      (and
        (>= jx@115@01 0)
        (and (< jx@115@01 (Seq_length a@77@01)) (not (= ix@114@01 jx@115@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@114@01 Int) (jx@115@01 Int)) (!
  (and
    (=>
      (>= ix@114@01 0)
      (and
        (>= ix@114@01 0)
        (=>
          (< ix@114@01 (Seq_length a@77@01))
          (and
            (< ix@114@01 (Seq_length a@77@01))
            (=>
              (>= jx@115@01 0)
              (and
                (>= jx@115@01 0)
                (or
                  (< jx@115@01 (Seq_length a@77@01))
                  (not (< jx@115@01 (Seq_length a@77@01))))))
            (or (>= jx@115@01 0) (not (>= jx@115@01 0)))))
        (or
          (< ix@114@01 (Seq_length a@77@01))
          (not (< ix@114@01 (Seq_length a@77@01))))))
    (or (>= ix@114@01 0) (not (>= ix@114@01 0)))
    (=>
      (and
        (>= ix@114@01 0)
        (and
          (< ix@114@01 (Seq_length a@77@01))
          (and
            (>= jx@115@01 0)
            (and
              (< jx@115@01 (Seq_length a@77@01))
              (not (= ix@114@01 jx@115@01))))))
      (and
        (>= ix@114@01 0)
        (< ix@114@01 (Seq_length a@77@01))
        (>= jx@115@01 0)
        (< jx@115@01 (Seq_length a@77@01))
        (not (= ix@114@01 jx@115@01))))
    (or
      (not
        (and
          (>= ix@114@01 0)
          (and
            (< ix@114@01 (Seq_length a@77@01))
            (and
              (>= jx@115@01 0)
              (and
                (< jx@115@01 (Seq_length a@77@01))
                (not (= ix@114@01 jx@115@01)))))))
      (and
        (>= ix@114@01 0)
        (and
          (< ix@114@01 (Seq_length a@77@01))
          (and
            (>= jx@115@01 0)
            (and
              (< jx@115@01 (Seq_length a@77@01))
              (not (= ix@114@01 jx@115@01))))))))
  :pattern ((Seq_index a@77@01 ix@114@01) (Seq_index a@77@01 jx@115@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@62@12@62@112-aux|)))
(push) ; 3
(assert (not (forall ((ix@114@01 Int) (jx@115@01 Int)) (!
  (=>
    (and
      (>= ix@114@01 0)
      (and
        (< ix@114@01 (Seq_length a@77@01))
        (and
          (>= jx@115@01 0)
          (and (< jx@115@01 (Seq_length a@77@01)) (not (= ix@114@01 jx@115@01))))))
    (not (= (Seq_index a@77@01 ix@114@01) (Seq_index a@77@01 jx@115@01))))
  :pattern ((Seq_index a@77@01 ix@114@01) (Seq_index a@77@01 jx@115@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@62@12@62@112|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((ix@114@01 Int) (jx@115@01 Int)) (!
  (=>
    (and
      (>= ix@114@01 0)
      (and
        (< ix@114@01 (Seq_length a@77@01))
        (and
          (>= jx@115@01 0)
          (and (< jx@115@01 (Seq_length a@77@01)) (not (= ix@114@01 jx@115@01))))))
    (not (= (Seq_index a@77@01 ix@114@01) (Seq_index a@77@01 jx@115@01))))
  :pattern ((Seq_index a@77@01 ix@114@01) (Seq_index a@77@01 jx@115@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@62@12@62@112|)))
(declare-const i@116@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 66 | !(0 <= i@116@01) | live]
; [else-branch: 66 | 0 <= i@116@01 | live]
(push) ; 5
; [then-branch: 66 | !(0 <= i@116@01)]
(assert (not (<= 0 i@116@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 66 | 0 <= i@116@01]
(assert (<= 0 i@116@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@116@01) (not (<= 0 i@116@01))))
(assert (and (<= 0 i@116@01) (< i@116@01 len@80@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@116@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@116@01 (Seq_length a@77@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@117@01 ($Ref) Int)
(declare-fun img@118@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@116@01 Int)) (!
  (=>
    (and (<= 0 i@116@01) (< i@116@01 len@80@01))
    (or (<= 0 i@116@01) (not (<= 0 i@116@01))))
  :pattern ((Seq_index a@77@01 i@116@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@116@01 Int) (i2@116@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@116@01) (< i1@116@01 len@80@01))
      (and (<= 0 i2@116@01) (< i2@116@01 len@80@01))
      (= (Seq_index a@77@01 i1@116@01) (Seq_index a@77@01 i2@116@01)))
    (= i1@116@01 i2@116@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@116@01 Int)) (!
  (=>
    (and (<= 0 i@116@01) (< i@116@01 len@80@01))
    (and
      (= (inv@117@01 (Seq_index a@77@01 i@116@01)) i@116@01)
      (img@118@01 (Seq_index a@77@01 i@116@01))))
  :pattern ((Seq_index a@77@01 i@116@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@118@01 r) (and (<= 0 (inv@117@01 r)) (< (inv@117@01 r) len@80@01)))
    (= (Seq_index a@77@01 (inv@117@01 r)) r))
  :pattern ((inv@117@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@116@01 Int)) (!
  (= (Seq_index a@77@01 i@116@01) (Seq_index b@78@01 i@116@01))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@116@01 Int)) (!
  (= (Seq_index a@77@01 i@116@01) (Seq_index c@79@01 i@116@01))
  
  :qid |quant-u-86|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@119@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@117@01 r)) (< (inv@117@01 r) len@80@01))
      (img@118@01 r)
      (= r (Seq_index a@77@01 (inv@117@01 r))))
    ($Perm.min
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@117@01 r)) (< (inv@117@01 r) len@80@01))
      (img@118@01 r)
      (= r (Seq_index a@77@01 (inv@117@01 r))))
    ($Perm.min
      (ite
        (and
          (img@91@01 r)
          (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@119@01 r)))
    $Perm.No))
(define-fun pTaken@121@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@117@01 r)) (< (inv@117@01 r) len@80@01))
      (img@118@01 r)
      (= r (Seq_index a@77@01 (inv@117@01 r))))
    ($Perm.min
      (ite
        (and
          (img@96@01 r)
          (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- $Perm.Write (pTaken@119@01 r)) (pTaken@120@01 r)))
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
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@119@01 r))
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
      (and (<= 0 (inv@117@01 r)) (< (inv@117@01 r) len@80@01))
      (img@118@01 r)
      (= r (Seq_index a@77@01 (inv@117@01 r))))
    (= (- $Perm.Write (pTaken@119@01 r)) $Perm.No))
  
  :qid |quant-u-89|))))
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
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@80@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@80@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 67 | 0 < len@80@01 | live]
; [else-branch: 67 | !(0 < len@80@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 67 | 0 < len@80@01]
(assert (< 0 len@80@01))
; [eval] |b| == len
; [eval] |b|
(pop) ; 4
(push) ; 4
; [else-branch: 67 | !(0 < len@80@01)]
(assert (not (< 0 len@80@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> (< 0 len@80@01) (= (Seq_length b@78@01) len@80@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@80@01) (= (Seq_length b@78@01) len@80@01)))
; [eval] (forall ix: Int, jx: Int :: { b[ix], b[jx] } ix >= 0 && (ix < |b| && (jx >= 0 && (jx < |b| && ix != jx))) ==> b[ix] != b[jx])
(declare-const ix@123@01 Int)
(declare-const jx@124@01 Int)
(push) ; 3
; [eval] ix >= 0 && (ix < |b| && (jx >= 0 && (jx < |b| && ix != jx))) ==> b[ix] != b[jx]
; [eval] ix >= 0 && (ix < |b| && (jx >= 0 && (jx < |b| && ix != jx)))
; [eval] ix >= 0
(push) ; 4
; [then-branch: 68 | !(ix@123@01 >= 0) | live]
; [else-branch: 68 | ix@123@01 >= 0 | live]
(push) ; 5
; [then-branch: 68 | !(ix@123@01 >= 0)]
(assert (not (>= ix@123@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 68 | ix@123@01 >= 0]
(assert (>= ix@123@01 0))
; [eval] ix < |b|
; [eval] |b|
(push) ; 6
; [then-branch: 69 | !(ix@123@01 < |b@78@01|) | live]
; [else-branch: 69 | ix@123@01 < |b@78@01| | live]
(push) ; 7
; [then-branch: 69 | !(ix@123@01 < |b@78@01|)]
(assert (not (< ix@123@01 (Seq_length b@78@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 69 | ix@123@01 < |b@78@01|]
(assert (< ix@123@01 (Seq_length b@78@01)))
; [eval] jx >= 0
(push) ; 8
; [then-branch: 70 | !(jx@124@01 >= 0) | live]
; [else-branch: 70 | jx@124@01 >= 0 | live]
(push) ; 9
; [then-branch: 70 | !(jx@124@01 >= 0)]
(assert (not (>= jx@124@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 70 | jx@124@01 >= 0]
(assert (>= jx@124@01 0))
; [eval] jx < |b|
; [eval] |b|
(push) ; 10
; [then-branch: 71 | !(jx@124@01 < |b@78@01|) | live]
; [else-branch: 71 | jx@124@01 < |b@78@01| | live]
(push) ; 11
; [then-branch: 71 | !(jx@124@01 < |b@78@01|)]
(assert (not (< jx@124@01 (Seq_length b@78@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 71 | jx@124@01 < |b@78@01|]
(assert (< jx@124@01 (Seq_length b@78@01)))
; [eval] ix != jx
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< jx@124@01 (Seq_length b@78@01)) (not (< jx@124@01 (Seq_length b@78@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@124@01 0)
  (and
    (>= jx@124@01 0)
    (or
      (< jx@124@01 (Seq_length b@78@01))
      (not (< jx@124@01 (Seq_length b@78@01)))))))
(assert (or (>= jx@124@01 0) (not (>= jx@124@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@123@01 (Seq_length b@78@01))
  (and
    (< ix@123@01 (Seq_length b@78@01))
    (=>
      (>= jx@124@01 0)
      (and
        (>= jx@124@01 0)
        (or
          (< jx@124@01 (Seq_length b@78@01))
          (not (< jx@124@01 (Seq_length b@78@01))))))
    (or (>= jx@124@01 0) (not (>= jx@124@01 0))))))
(assert (or (< ix@123@01 (Seq_length b@78@01)) (not (< ix@123@01 (Seq_length b@78@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@123@01 0)
  (and
    (>= ix@123@01 0)
    (=>
      (< ix@123@01 (Seq_length b@78@01))
      (and
        (< ix@123@01 (Seq_length b@78@01))
        (=>
          (>= jx@124@01 0)
          (and
            (>= jx@124@01 0)
            (or
              (< jx@124@01 (Seq_length b@78@01))
              (not (< jx@124@01 (Seq_length b@78@01))))))
        (or (>= jx@124@01 0) (not (>= jx@124@01 0)))))
    (or
      (< ix@123@01 (Seq_length b@78@01))
      (not (< ix@123@01 (Seq_length b@78@01)))))))
(assert (or (>= ix@123@01 0) (not (>= ix@123@01 0))))
(push) ; 4
; [then-branch: 72 | ix@123@01 >= 0 && ix@123@01 < |b@78@01| && jx@124@01 >= 0 && jx@124@01 < |b@78@01| && ix@123@01 != jx@124@01 | live]
; [else-branch: 72 | !(ix@123@01 >= 0 && ix@123@01 < |b@78@01| && jx@124@01 >= 0 && jx@124@01 < |b@78@01| && ix@123@01 != jx@124@01) | live]
(push) ; 5
; [then-branch: 72 | ix@123@01 >= 0 && ix@123@01 < |b@78@01| && jx@124@01 >= 0 && jx@124@01 < |b@78@01| && ix@123@01 != jx@124@01]
(assert (and
  (>= ix@123@01 0)
  (and
    (< ix@123@01 (Seq_length b@78@01))
    (and
      (>= jx@124@01 0)
      (and (< jx@124@01 (Seq_length b@78@01)) (not (= ix@123@01 jx@124@01)))))))
; [eval] b[ix] != b[jx]
; [eval] b[ix]
; [eval] b[jx]
(pop) ; 5
(push) ; 5
; [else-branch: 72 | !(ix@123@01 >= 0 && ix@123@01 < |b@78@01| && jx@124@01 >= 0 && jx@124@01 < |b@78@01| && ix@123@01 != jx@124@01)]
(assert (not
  (and
    (>= ix@123@01 0)
    (and
      (< ix@123@01 (Seq_length b@78@01))
      (and
        (>= jx@124@01 0)
        (and (< jx@124@01 (Seq_length b@78@01)) (not (= ix@123@01 jx@124@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= ix@123@01 0)
    (and
      (< ix@123@01 (Seq_length b@78@01))
      (and
        (>= jx@124@01 0)
        (and (< jx@124@01 (Seq_length b@78@01)) (not (= ix@123@01 jx@124@01))))))
  (and
    (>= ix@123@01 0)
    (< ix@123@01 (Seq_length b@78@01))
    (>= jx@124@01 0)
    (< jx@124@01 (Seq_length b@78@01))
    (not (= ix@123@01 jx@124@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@123@01 0)
      (and
        (< ix@123@01 (Seq_length b@78@01))
        (and
          (>= jx@124@01 0)
          (and (< jx@124@01 (Seq_length b@78@01)) (not (= ix@123@01 jx@124@01)))))))
  (and
    (>= ix@123@01 0)
    (and
      (< ix@123@01 (Seq_length b@78@01))
      (and
        (>= jx@124@01 0)
        (and (< jx@124@01 (Seq_length b@78@01)) (not (= ix@123@01 jx@124@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@123@01 Int) (jx@124@01 Int)) (!
  (and
    (=>
      (>= ix@123@01 0)
      (and
        (>= ix@123@01 0)
        (=>
          (< ix@123@01 (Seq_length b@78@01))
          (and
            (< ix@123@01 (Seq_length b@78@01))
            (=>
              (>= jx@124@01 0)
              (and
                (>= jx@124@01 0)
                (or
                  (< jx@124@01 (Seq_length b@78@01))
                  (not (< jx@124@01 (Seq_length b@78@01))))))
            (or (>= jx@124@01 0) (not (>= jx@124@01 0)))))
        (or
          (< ix@123@01 (Seq_length b@78@01))
          (not (< ix@123@01 (Seq_length b@78@01))))))
    (or (>= ix@123@01 0) (not (>= ix@123@01 0)))
    (=>
      (and
        (>= ix@123@01 0)
        (and
          (< ix@123@01 (Seq_length b@78@01))
          (and
            (>= jx@124@01 0)
            (and
              (< jx@124@01 (Seq_length b@78@01))
              (not (= ix@123@01 jx@124@01))))))
      (and
        (>= ix@123@01 0)
        (< ix@123@01 (Seq_length b@78@01))
        (>= jx@124@01 0)
        (< jx@124@01 (Seq_length b@78@01))
        (not (= ix@123@01 jx@124@01))))
    (or
      (not
        (and
          (>= ix@123@01 0)
          (and
            (< ix@123@01 (Seq_length b@78@01))
            (and
              (>= jx@124@01 0)
              (and
                (< jx@124@01 (Seq_length b@78@01))
                (not (= ix@123@01 jx@124@01)))))))
      (and
        (>= ix@123@01 0)
        (and
          (< ix@123@01 (Seq_length b@78@01))
          (and
            (>= jx@124@01 0)
            (and
              (< jx@124@01 (Seq_length b@78@01))
              (not (= ix@123@01 jx@124@01))))))))
  :pattern ((Seq_index b@78@01 ix@123@01) (Seq_index b@78@01 jx@124@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@65@12@65@112-aux|)))
(push) ; 3
(assert (not (forall ((ix@123@01 Int) (jx@124@01 Int)) (!
  (=>
    (and
      (>= ix@123@01 0)
      (and
        (< ix@123@01 (Seq_length b@78@01))
        (and
          (>= jx@124@01 0)
          (and (< jx@124@01 (Seq_length b@78@01)) (not (= ix@123@01 jx@124@01))))))
    (not (= (Seq_index b@78@01 ix@123@01) (Seq_index b@78@01 jx@124@01))))
  :pattern ((Seq_index b@78@01 ix@123@01) (Seq_index b@78@01 jx@124@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@65@12@65@112|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((ix@123@01 Int) (jx@124@01 Int)) (!
  (=>
    (and
      (>= ix@123@01 0)
      (and
        (< ix@123@01 (Seq_length b@78@01))
        (and
          (>= jx@124@01 0)
          (and (< jx@124@01 (Seq_length b@78@01)) (not (= ix@123@01 jx@124@01))))))
    (not (= (Seq_index b@78@01 ix@123@01) (Seq_index b@78@01 jx@124@01))))
  :pattern ((Seq_index b@78@01 ix@123@01) (Seq_index b@78@01 jx@124@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@65@12@65@112|)))
(declare-const i@125@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 73 | !(0 <= i@125@01) | live]
; [else-branch: 73 | 0 <= i@125@01 | live]
(push) ; 5
; [then-branch: 73 | !(0 <= i@125@01)]
(assert (not (<= 0 i@125@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 73 | 0 <= i@125@01]
(assert (<= 0 i@125@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@125@01) (not (<= 0 i@125@01))))
(assert (and (<= 0 i@125@01) (< i@125@01 len@80@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@125@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@125@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@126@01 ($Ref) Int)
(declare-fun img@127@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@125@01 Int)) (!
  (=>
    (and (<= 0 i@125@01) (< i@125@01 len@80@01))
    (or (<= 0 i@125@01) (not (<= 0 i@125@01))))
  :pattern ((Seq_index b@78@01 i@125@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@125@01 Int) (i2@125@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@125@01) (< i1@125@01 len@80@01))
      (and (<= 0 i2@125@01) (< i2@125@01 len@80@01))
      (= (Seq_index b@78@01 i1@125@01) (Seq_index b@78@01 i2@125@01)))
    (= i1@125@01 i2@125@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@125@01 Int)) (!
  (=>
    (and (<= 0 i@125@01) (< i@125@01 len@80@01))
    (and
      (= (inv@126@01 (Seq_index b@78@01 i@125@01)) i@125@01)
      (img@127@01 (Seq_index b@78@01 i@125@01))))
  :pattern ((Seq_index b@78@01 i@125@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@127@01 r) (and (<= 0 (inv@126@01 r)) (< (inv@126@01 r) len@80@01)))
    (= (Seq_index b@78@01 (inv@126@01 r)) r))
  :pattern ((inv@126@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@125@01 Int)) (!
  (= (Seq_index b@78@01 i@125@01) (Seq_index c@79@01 i@125@01))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@128@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@126@01 r)) (< (inv@126@01 r) len@80@01))
      (img@127@01 r)
      (= r (Seq_index b@78@01 (inv@126@01 r))))
    ($Perm.min
      (ite
        (and
          (img@91@01 r)
          (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@129@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@126@01 r)) (< (inv@126@01 r) len@80@01))
      (img@127@01 r)
      (= r (Seq_index b@78@01 (inv@126@01 r))))
    ($Perm.min
      (ite
        (and
          (img@96@01 r)
          (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@128@01 r)))
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
          (img@91@01 r)
          (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@128@01 r))
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
      (and (<= 0 (inv@126@01 r)) (< (inv@126@01 r) len@80@01))
      (img@127@01 r)
      (= r (Seq_index b@78@01 (inv@126@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@128@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@130@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@130@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@130@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@130@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@130@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef20|)))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@80@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@80@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 74 | 0 < len@80@01 | live]
; [else-branch: 74 | !(0 < len@80@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 74 | 0 < len@80@01]
(assert (< 0 len@80@01))
; [eval] |c| == len
; [eval] |c|
(pop) ; 4
(push) ; 4
; [else-branch: 74 | !(0 < len@80@01)]
(assert (not (< 0 len@80@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> (< 0 len@80@01) (= (Seq_length c@79@01) len@80@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@80@01) (= (Seq_length c@79@01) len@80@01)))
; [eval] (forall ix: Int, jx: Int :: { c[ix], c[jx] } ix >= 0 && (ix < |c| && (jx >= 0 && (jx < |c| && ix != jx))) ==> c[ix] != c[jx])
(declare-const ix@131@01 Int)
(declare-const jx@132@01 Int)
(push) ; 3
; [eval] ix >= 0 && (ix < |c| && (jx >= 0 && (jx < |c| && ix != jx))) ==> c[ix] != c[jx]
; [eval] ix >= 0 && (ix < |c| && (jx >= 0 && (jx < |c| && ix != jx)))
; [eval] ix >= 0
(push) ; 4
; [then-branch: 75 | !(ix@131@01 >= 0) | live]
; [else-branch: 75 | ix@131@01 >= 0 | live]
(push) ; 5
; [then-branch: 75 | !(ix@131@01 >= 0)]
(assert (not (>= ix@131@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 75 | ix@131@01 >= 0]
(assert (>= ix@131@01 0))
; [eval] ix < |c|
; [eval] |c|
(push) ; 6
; [then-branch: 76 | !(ix@131@01 < |c@79@01|) | live]
; [else-branch: 76 | ix@131@01 < |c@79@01| | live]
(push) ; 7
; [then-branch: 76 | !(ix@131@01 < |c@79@01|)]
(assert (not (< ix@131@01 (Seq_length c@79@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 76 | ix@131@01 < |c@79@01|]
(assert (< ix@131@01 (Seq_length c@79@01)))
; [eval] jx >= 0
(push) ; 8
; [then-branch: 77 | !(jx@132@01 >= 0) | live]
; [else-branch: 77 | jx@132@01 >= 0 | live]
(push) ; 9
; [then-branch: 77 | !(jx@132@01 >= 0)]
(assert (not (>= jx@132@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 77 | jx@132@01 >= 0]
(assert (>= jx@132@01 0))
; [eval] jx < |c|
; [eval] |c|
(push) ; 10
; [then-branch: 78 | !(jx@132@01 < |c@79@01|) | live]
; [else-branch: 78 | jx@132@01 < |c@79@01| | live]
(push) ; 11
; [then-branch: 78 | !(jx@132@01 < |c@79@01|)]
(assert (not (< jx@132@01 (Seq_length c@79@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 78 | jx@132@01 < |c@79@01|]
(assert (< jx@132@01 (Seq_length c@79@01)))
; [eval] ix != jx
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< jx@132@01 (Seq_length c@79@01)) (not (< jx@132@01 (Seq_length c@79@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@132@01 0)
  (and
    (>= jx@132@01 0)
    (or
      (< jx@132@01 (Seq_length c@79@01))
      (not (< jx@132@01 (Seq_length c@79@01)))))))
(assert (or (>= jx@132@01 0) (not (>= jx@132@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@131@01 (Seq_length c@79@01))
  (and
    (< ix@131@01 (Seq_length c@79@01))
    (=>
      (>= jx@132@01 0)
      (and
        (>= jx@132@01 0)
        (or
          (< jx@132@01 (Seq_length c@79@01))
          (not (< jx@132@01 (Seq_length c@79@01))))))
    (or (>= jx@132@01 0) (not (>= jx@132@01 0))))))
(assert (or (< ix@131@01 (Seq_length c@79@01)) (not (< ix@131@01 (Seq_length c@79@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@131@01 0)
  (and
    (>= ix@131@01 0)
    (=>
      (< ix@131@01 (Seq_length c@79@01))
      (and
        (< ix@131@01 (Seq_length c@79@01))
        (=>
          (>= jx@132@01 0)
          (and
            (>= jx@132@01 0)
            (or
              (< jx@132@01 (Seq_length c@79@01))
              (not (< jx@132@01 (Seq_length c@79@01))))))
        (or (>= jx@132@01 0) (not (>= jx@132@01 0)))))
    (or
      (< ix@131@01 (Seq_length c@79@01))
      (not (< ix@131@01 (Seq_length c@79@01)))))))
(assert (or (>= ix@131@01 0) (not (>= ix@131@01 0))))
(push) ; 4
; [then-branch: 79 | ix@131@01 >= 0 && ix@131@01 < |c@79@01| && jx@132@01 >= 0 && jx@132@01 < |c@79@01| && ix@131@01 != jx@132@01 | live]
; [else-branch: 79 | !(ix@131@01 >= 0 && ix@131@01 < |c@79@01| && jx@132@01 >= 0 && jx@132@01 < |c@79@01| && ix@131@01 != jx@132@01) | live]
(push) ; 5
; [then-branch: 79 | ix@131@01 >= 0 && ix@131@01 < |c@79@01| && jx@132@01 >= 0 && jx@132@01 < |c@79@01| && ix@131@01 != jx@132@01]
(assert (and
  (>= ix@131@01 0)
  (and
    (< ix@131@01 (Seq_length c@79@01))
    (and
      (>= jx@132@01 0)
      (and (< jx@132@01 (Seq_length c@79@01)) (not (= ix@131@01 jx@132@01)))))))
; [eval] c[ix] != c[jx]
; [eval] c[ix]
; [eval] c[jx]
(pop) ; 5
(push) ; 5
; [else-branch: 79 | !(ix@131@01 >= 0 && ix@131@01 < |c@79@01| && jx@132@01 >= 0 && jx@132@01 < |c@79@01| && ix@131@01 != jx@132@01)]
(assert (not
  (and
    (>= ix@131@01 0)
    (and
      (< ix@131@01 (Seq_length c@79@01))
      (and
        (>= jx@132@01 0)
        (and (< jx@132@01 (Seq_length c@79@01)) (not (= ix@131@01 jx@132@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= ix@131@01 0)
    (and
      (< ix@131@01 (Seq_length c@79@01))
      (and
        (>= jx@132@01 0)
        (and (< jx@132@01 (Seq_length c@79@01)) (not (= ix@131@01 jx@132@01))))))
  (and
    (>= ix@131@01 0)
    (< ix@131@01 (Seq_length c@79@01))
    (>= jx@132@01 0)
    (< jx@132@01 (Seq_length c@79@01))
    (not (= ix@131@01 jx@132@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@131@01 0)
      (and
        (< ix@131@01 (Seq_length c@79@01))
        (and
          (>= jx@132@01 0)
          (and (< jx@132@01 (Seq_length c@79@01)) (not (= ix@131@01 jx@132@01)))))))
  (and
    (>= ix@131@01 0)
    (and
      (< ix@131@01 (Seq_length c@79@01))
      (and
        (>= jx@132@01 0)
        (and (< jx@132@01 (Seq_length c@79@01)) (not (= ix@131@01 jx@132@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@131@01 Int) (jx@132@01 Int)) (!
  (and
    (=>
      (>= ix@131@01 0)
      (and
        (>= ix@131@01 0)
        (=>
          (< ix@131@01 (Seq_length c@79@01))
          (and
            (< ix@131@01 (Seq_length c@79@01))
            (=>
              (>= jx@132@01 0)
              (and
                (>= jx@132@01 0)
                (or
                  (< jx@132@01 (Seq_length c@79@01))
                  (not (< jx@132@01 (Seq_length c@79@01))))))
            (or (>= jx@132@01 0) (not (>= jx@132@01 0)))))
        (or
          (< ix@131@01 (Seq_length c@79@01))
          (not (< ix@131@01 (Seq_length c@79@01))))))
    (or (>= ix@131@01 0) (not (>= ix@131@01 0)))
    (=>
      (and
        (>= ix@131@01 0)
        (and
          (< ix@131@01 (Seq_length c@79@01))
          (and
            (>= jx@132@01 0)
            (and
              (< jx@132@01 (Seq_length c@79@01))
              (not (= ix@131@01 jx@132@01))))))
      (and
        (>= ix@131@01 0)
        (< ix@131@01 (Seq_length c@79@01))
        (>= jx@132@01 0)
        (< jx@132@01 (Seq_length c@79@01))
        (not (= ix@131@01 jx@132@01))))
    (or
      (not
        (and
          (>= ix@131@01 0)
          (and
            (< ix@131@01 (Seq_length c@79@01))
            (and
              (>= jx@132@01 0)
              (and
                (< jx@132@01 (Seq_length c@79@01))
                (not (= ix@131@01 jx@132@01)))))))
      (and
        (>= ix@131@01 0)
        (and
          (< ix@131@01 (Seq_length c@79@01))
          (and
            (>= jx@132@01 0)
            (and
              (< jx@132@01 (Seq_length c@79@01))
              (not (= ix@131@01 jx@132@01))))))))
  :pattern ((Seq_index c@79@01 ix@131@01) (Seq_index c@79@01 jx@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@68@12@68@112-aux|)))
(push) ; 3
(assert (not (forall ((ix@131@01 Int) (jx@132@01 Int)) (!
  (=>
    (and
      (>= ix@131@01 0)
      (and
        (< ix@131@01 (Seq_length c@79@01))
        (and
          (>= jx@132@01 0)
          (and (< jx@132@01 (Seq_length c@79@01)) (not (= ix@131@01 jx@132@01))))))
    (not (= (Seq_index c@79@01 ix@131@01) (Seq_index c@79@01 jx@132@01))))
  :pattern ((Seq_index c@79@01 ix@131@01) (Seq_index c@79@01 jx@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@68@12@68@112|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((ix@131@01 Int) (jx@132@01 Int)) (!
  (=>
    (and
      (>= ix@131@01 0)
      (and
        (< ix@131@01 (Seq_length c@79@01))
        (and
          (>= jx@132@01 0)
          (and (< jx@132@01 (Seq_length c@79@01)) (not (= ix@131@01 jx@132@01))))))
    (not (= (Seq_index c@79@01 ix@131@01) (Seq_index c@79@01 jx@132@01))))
  :pattern ((Seq_index c@79@01 ix@131@01) (Seq_index c@79@01 jx@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@68@12@68@112|)))
(declare-const i@133@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 80 | !(0 <= i@133@01) | live]
; [else-branch: 80 | 0 <= i@133@01 | live]
(push) ; 5
; [then-branch: 80 | !(0 <= i@133@01)]
(assert (not (<= 0 i@133@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 80 | 0 <= i@133@01]
(assert (<= 0 i@133@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@133@01) (not (<= 0 i@133@01))))
(assert (and (<= 0 i@133@01) (< i@133@01 len@80@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@133@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@133@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@134@01 ($Ref) Int)
(declare-fun img@135@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@133@01 Int)) (!
  (=>
    (and (<= 0 i@133@01) (< i@133@01 len@80@01))
    (or (<= 0 i@133@01) (not (<= 0 i@133@01))))
  :pattern ((Seq_index c@79@01 i@133@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@133@01 Int) (i2@133@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@133@01) (< i1@133@01 len@80@01))
      (and (<= 0 i2@133@01) (< i2@133@01 len@80@01))
      (= (Seq_index c@79@01 i1@133@01) (Seq_index c@79@01 i2@133@01)))
    (= i1@133@01 i2@133@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@133@01 Int)) (!
  (=>
    (and (<= 0 i@133@01) (< i@133@01 len@80@01))
    (and
      (= (inv@134@01 (Seq_index c@79@01 i@133@01)) i@133@01)
      (img@135@01 (Seq_index c@79@01 i@133@01))))
  :pattern ((Seq_index c@79@01 i@133@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) len@80@01)))
    (= (Seq_index c@79@01 (inv@134@01 r)) r))
  :pattern ((inv@134@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@136@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) len@80@01))
      (img@135@01 r)
      (= r (Seq_index c@79@01 (inv@134@01 r))))
    ($Perm.min
      (ite
        (and
          (img@96@01 r)
          (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
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
          (img@96@01 r)
          (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@136@01 r))
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
      (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) len@80@01))
      (img@135@01 r)
      (= r (Seq_index c@79@01 (inv@134@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@136@01 r)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@137@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@137@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@137@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef21|)))
(declare-const $t@138@01 $Snap)
(assert (= $t@138@01 ($Snap.combine ($Snap.first $t@138@01) ($Snap.second $t@138@01))))
(assert (= ($Snap.first $t@138@01) $Snap.unit))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@80@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@80@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 81 | 0 < len@80@01 | live]
; [else-branch: 81 | !(0 < len@80@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 81 | 0 < len@80@01]
(assert (< 0 len@80@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 4
(push) ; 4
; [else-branch: 81 | !(0 < len@80@01)]
(assert (not (< 0 len@80@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=
  ($Snap.second $t@138@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@138@01))
    ($Snap.second ($Snap.second $t@138@01)))))
(declare-const i@139@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 82 | !(0 <= i@139@01) | live]
; [else-branch: 82 | 0 <= i@139@01 | live]
(push) ; 5
; [then-branch: 82 | !(0 <= i@139@01)]
(assert (not (<= 0 i@139@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 82 | 0 <= i@139@01]
(assert (<= 0 i@139@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@139@01) (not (<= 0 i@139@01))))
(assert (and (<= 0 i@139@01) (< i@139@01 len@80@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@139@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@139@01 (Seq_length a@77@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@140@01 ($Ref) Int)
(declare-fun img@141@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@139@01 Int)) (!
  (=>
    (and (<= 0 i@139@01) (< i@139@01 len@80@01))
    (or (<= 0 i@139@01) (not (<= 0 i@139@01))))
  :pattern ((Seq_index a@77@01 i@139@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@139@01 Int) (i2@139@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@139@01) (< i1@139@01 len@80@01))
      (and (<= 0 i2@139@01) (< i2@139@01 len@80@01))
      (= (Seq_index a@77@01 i1@139@01) (Seq_index a@77@01 i2@139@01)))
    (= i1@139@01 i2@139@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@139@01 Int)) (!
  (=>
    (and (<= 0 i@139@01) (< i@139@01 len@80@01))
    (and
      (= (inv@140@01 (Seq_index a@77@01 i@139@01)) i@139@01)
      (img@141@01 (Seq_index a@77@01 i@139@01))))
  :pattern ((Seq_index a@77@01 i@139@01))
  :qid |quant-u-100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (= (Seq_index a@77@01 (inv@140@01 r)) r))
  :pattern ((inv@140@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@139@01 Int)) (!
  (=>
    (and (<= 0 i@139@01) (< i@139@01 len@80@01))
    (not (= (Seq_index a@77@01 i@139@01) $Ref.null)))
  :pattern ((Seq_index a@77@01 i@139@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@138@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@138@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@138@01))) $Snap.unit))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@80@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@80@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 83 | 0 < len@80@01 | live]
; [else-branch: 83 | !(0 < len@80@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 83 | 0 < len@80@01]
(assert (< 0 len@80@01))
; [eval] |b| == len
; [eval] |b|
(pop) ; 4
(push) ; 4
; [else-branch: 83 | !(0 < len@80@01)]
(assert (not (< 0 len@80@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@138@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))
(declare-const i@142@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 84 | !(0 <= i@142@01) | live]
; [else-branch: 84 | 0 <= i@142@01 | live]
(push) ; 5
; [then-branch: 84 | !(0 <= i@142@01)]
(assert (not (<= 0 i@142@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 84 | 0 <= i@142@01]
(assert (<= 0 i@142@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@142@01) (not (<= 0 i@142@01))))
(assert (and (<= 0 i@142@01) (< i@142@01 len@80@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@142@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@142@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@143@01 ($Ref) Int)
(declare-fun img@144@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@142@01 Int)) (!
  (=>
    (and (<= 0 i@142@01) (< i@142@01 len@80@01))
    (or (<= 0 i@142@01) (not (<= 0 i@142@01))))
  :pattern ((Seq_index b@78@01 i@142@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@142@01 Int) (i2@142@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@142@01) (< i1@142@01 len@80@01))
      (and (<= 0 i2@142@01) (< i2@142@01 len@80@01))
      (= (Seq_index b@78@01 i1@142@01) (Seq_index b@78@01 i2@142@01)))
    (= i1@142@01 i2@142@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@142@01 Int)) (!
  (=>
    (and (<= 0 i@142@01) (< i@142@01 len@80@01))
    (and
      (= (inv@143@01 (Seq_index b@78@01 i@142@01)) i@142@01)
      (img@144@01 (Seq_index b@78@01 i@142@01))))
  :pattern ((Seq_index b@78@01 i@142@01))
  :qid |quant-u-102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (= (Seq_index b@78@01 (inv@143@01 r)) r))
  :pattern ((inv@143@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@142@01 Int)) (!
  (=>
    (and (<= 0 i@142@01) (< i@142@01 len@80@01))
    (not (= (Seq_index b@78@01 i@142@01) $Ref.null)))
  :pattern ((Seq_index b@78@01 i@142@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@78@01 i@142@01) (Seq_index a@77@01 i@139@01))
    (=
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))
  $Snap.unit))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@80@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@80@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 85 | 0 < len@80@01 | live]
; [else-branch: 85 | !(0 < len@80@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 85 | 0 < len@80@01]
(assert (< 0 len@80@01))
; [eval] |c| == len
; [eval] |c|
(pop) ; 4
(push) ; 4
; [else-branch: 85 | !(0 < len@80@01)]
(assert (not (< 0 len@80@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))))
(declare-const i@145@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 86 | !(0 <= i@145@01) | live]
; [else-branch: 86 | 0 <= i@145@01 | live]
(push) ; 5
; [then-branch: 86 | !(0 <= i@145@01)]
(assert (not (<= 0 i@145@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 86 | 0 <= i@145@01]
(assert (<= 0 i@145@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@145@01) (not (<= 0 i@145@01))))
(assert (and (<= 0 i@145@01) (< i@145@01 len@80@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@145@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@145@01 (Seq_length c@79@01))))
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
    (and (<= 0 i@145@01) (< i@145@01 len@80@01))
    (or (<= 0 i@145@01) (not (<= 0 i@145@01))))
  :pattern ((Seq_index c@79@01 i@145@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@145@01 Int) (i2@145@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@145@01) (< i1@145@01 len@80@01))
      (and (<= 0 i2@145@01) (< i2@145@01 len@80@01))
      (= (Seq_index c@79@01 i1@145@01) (Seq_index c@79@01 i2@145@01)))
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
    (and (<= 0 i@145@01) (< i@145@01 len@80@01))
    (and
      (= (inv@146@01 (Seq_index c@79@01 i@145@01)) i@145@01)
      (img@147@01 (Seq_index c@79@01 i@145@01))))
  :pattern ((Seq_index c@79@01 i@145@01))
  :qid |quant-u-105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (= (Seq_index c@79@01 (inv@146@01 r)) r))
  :pattern ((inv@146@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@145@01 Int)) (!
  (=>
    (and (<= 0 i@145@01) (< i@145@01 len@80@01))
    (not (= (Seq_index c@79@01 i@145@01) $Ref.null)))
  :pattern ((Seq_index c@79@01 i@145@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@79@01 i@145@01) (Seq_index b@78@01 i@142@01))
    (=
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))))
  
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
    (= (Seq_index c@79@01 i@145@01) (Seq_index a@77@01 i@139@01))
    (=
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))))
  
  :qid |quant-u-107|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))
  $Snap.unit))
; [eval] (forall i: Int :: { old(b[i]) } 0 <= i && i < len ==> b[i].Ref__Integer_value == old(b[i].Ref__Integer_value))
(declare-const i@148@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len ==> b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 87 | !(0 <= i@148@01) | live]
; [else-branch: 87 | 0 <= i@148@01 | live]
(push) ; 5
; [then-branch: 87 | !(0 <= i@148@01)]
(assert (not (<= 0 i@148@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 87 | 0 <= i@148@01]
(assert (<= 0 i@148@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@148@01) (not (<= 0 i@148@01))))
(push) ; 4
; [then-branch: 88 | 0 <= i@148@01 && i@148@01 < len@80@01 | live]
; [else-branch: 88 | !(0 <= i@148@01 && i@148@01 < len@80@01) | live]
(push) ; 5
; [then-branch: 88 | 0 <= i@148@01 && i@148@01 < len@80@01]
(assert (and (<= 0 i@148@01) (< i@148@01 len@80@01)))
; [eval] b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 6
(assert (not (>= i@148@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@148@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@149@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
(declare-const pm@150@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@150@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@141@01 r)
            (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@144@01 r)
            (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@147@01 r)
          (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@150@01  $FPM) r))
  :qid |qp.resPrmSumDef25|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@150@01  $FPM) (Seq_index b@78@01 i@148@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 6
(assert (not (>= i@148@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@148@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
    :qid |qp.fvfValDef18|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@86@01 (Seq_index b@78@01 i@148@01))
          (and
            (<= 0 (inv@85@01 (Seq_index b@78@01 i@148@01)))
            (< (inv@85@01 (Seq_index b@78@01 i@148@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@91@01 (Seq_index b@78@01 i@148@01))
          (and
            (<= 0 (inv@90@01 (Seq_index b@78@01 i@148@01)))
            (< (inv@90@01 (Seq_index b@78@01 i@148@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@96@01 (Seq_index b@78@01 i@148@01))
        (and
          (<= 0 (inv@95@01 (Seq_index b@78@01 i@148@01)))
          (< (inv@95@01 (Seq_index b@78@01 i@148@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 88 | !(0 <= i@148@01 && i@148@01 < len@80@01)]
(assert (not (and (<= 0 i@148@01) (< i@148@01 len@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@150@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@141@01 r)
            (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@144@01 r)
            (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@147@01 r)
          (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@150@01  $FPM) r))
  :qid |qp.resPrmSumDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@148@01) (< i@148@01 len@80@01)))
  (and (<= 0 i@148@01) (< i@148@01 len@80@01))))
; [eval] old(b[i])
; [eval] b[i]
(push) ; 4
(assert (not (>= i@148@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@150@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@141@01 r)
            (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@144@01 r)
            (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and
          (img@147@01 r)
          (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@150@01  $FPM) r))
  :qid |qp.resPrmSumDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@148@01 Int)) (!
  (and
    (or (<= 0 i@148@01) (not (<= 0 i@148@01)))
    (or
      (not (and (<= 0 i@148@01) (< i@148@01 len@80@01)))
      (and (<= 0 i@148@01) (< i@148@01 len@80@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@76@12@76@112-aux|)))
(assert (forall ((i@148@01 Int)) (!
  (=>
    (and (<= 0 i@148@01) (< i@148@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
        b@78@01
        i@148@01))
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) (Seq_index
        b@78@01
        i@148@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@76@12@76@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { old(c[i]) } 0 <= i && i < len ==> c[i].Ref__Integer_value == old(c[i].Ref__Integer_value))
(declare-const i@151@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 89 | !(0 <= i@151@01) | live]
; [else-branch: 89 | 0 <= i@151@01 | live]
(push) ; 5
; [then-branch: 89 | !(0 <= i@151@01)]
(assert (not (<= 0 i@151@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 89 | 0 <= i@151@01]
(assert (<= 0 i@151@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@151@01) (not (<= 0 i@151@01))))
(push) ; 4
; [then-branch: 90 | 0 <= i@151@01 && i@151@01 < len@80@01 | live]
; [else-branch: 90 | !(0 <= i@151@01 && i@151@01 < len@80@01) | live]
(push) ; 5
; [then-branch: 90 | 0 <= i@151@01 && i@151@01 < len@80@01]
(assert (and (<= 0 i@151@01) (< i@151@01 len@80@01)))
; [eval] c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@151@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@151@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@141@01 (Seq_index c@79@01 i@151@01))
          (and
            (<= 0 (inv@140@01 (Seq_index c@79@01 i@151@01)))
            (< (inv@140@01 (Seq_index c@79@01 i@151@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@144@01 (Seq_index c@79@01 i@151@01))
          (and
            (<= 0 (inv@143@01 (Seq_index c@79@01 i@151@01)))
            (< (inv@143@01 (Seq_index c@79@01 i@151@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@147@01 (Seq_index c@79@01 i@151@01))
        (and
          (<= 0 (inv@146@01 (Seq_index c@79@01 i@151@01)))
          (< (inv@146@01 (Seq_index c@79@01 i@151@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@151@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@151@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
    :qid |qp.fvfValDef18|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@86@01 (Seq_index c@79@01 i@151@01))
          (and
            (<= 0 (inv@85@01 (Seq_index c@79@01 i@151@01)))
            (< (inv@85@01 (Seq_index c@79@01 i@151@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@91@01 (Seq_index c@79@01 i@151@01))
          (and
            (<= 0 (inv@90@01 (Seq_index c@79@01 i@151@01)))
            (< (inv@90@01 (Seq_index c@79@01 i@151@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@96@01 (Seq_index c@79@01 i@151@01))
        (and
          (<= 0 (inv@95@01 (Seq_index c@79@01 i@151@01)))
          (< (inv@95@01 (Seq_index c@79@01 i@151@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 90 | !(0 <= i@151@01 && i@151@01 < len@80@01)]
(assert (not (and (<= 0 i@151@01) (< i@151@01 len@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@151@01) (< i@151@01 len@80@01)))
  (and (<= 0 i@151@01) (< i@151@01 len@80@01))))
; [eval] old(c[i])
; [eval] c[i]
(push) ; 4
(assert (not (>= i@151@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@151@01 Int)) (!
  (and
    (or (<= 0 i@151@01) (not (<= 0 i@151@01)))
    (or
      (not (and (<= 0 i@151@01) (< i@151@01 len@80@01)))
      (and (<= 0 i@151@01) (< i@151@01 len@80@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@77@12@77@112-aux|)))
(assert (forall ((i@151@01 Int)) (!
  (=>
    (and (<= 0 i@151@01) (< i@151@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
        c@79@01
        i@151@01))
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) (Seq_index
        c@79@01
        i@151@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@77@12@77@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { a[i] } { b[i] } { c[i] } 0 <= i && i < len ==> a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value)
(declare-const i@152@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 91 | !(0 <= i@152@01) | live]
; [else-branch: 91 | 0 <= i@152@01 | live]
(push) ; 5
; [then-branch: 91 | !(0 <= i@152@01)]
(assert (not (<= 0 i@152@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 91 | 0 <= i@152@01]
(assert (<= 0 i@152@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@152@01) (not (<= 0 i@152@01))))
(push) ; 4
; [then-branch: 92 | 0 <= i@152@01 && i@152@01 < len@80@01 | live]
; [else-branch: 92 | !(0 <= i@152@01 && i@152@01 < len@80@01) | live]
(push) ; 5
; [then-branch: 92 | 0 <= i@152@01 && i@152@01 < len@80@01]
(assert (and (<= 0 i@152@01) (< i@152@01 len@80@01)))
; [eval] a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] a[i]
(push) ; 6
(assert (not (>= i@152@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@152@01 (Seq_length a@77@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@141@01 (Seq_index a@77@01 i@152@01))
          (and
            (<= 0 (inv@140@01 (Seq_index a@77@01 i@152@01)))
            (< (inv@140@01 (Seq_index a@77@01 i@152@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@144@01 (Seq_index a@77@01 i@152@01))
          (and
            (<= 0 (inv@143@01 (Seq_index a@77@01 i@152@01)))
            (< (inv@143@01 (Seq_index a@77@01 i@152@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@147@01 (Seq_index a@77@01 i@152@01))
        (and
          (<= 0 (inv@146@01 (Seq_index a@77@01 i@152@01)))
          (< (inv@146@01 (Seq_index a@77@01 i@152@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] b[i]
(push) ; 6
(assert (not (>= i@152@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@152@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@141@01 (Seq_index b@78@01 i@152@01))
          (and
            (<= 0 (inv@140@01 (Seq_index b@78@01 i@152@01)))
            (< (inv@140@01 (Seq_index b@78@01 i@152@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@144@01 (Seq_index b@78@01 i@152@01))
          (and
            (<= 0 (inv@143@01 (Seq_index b@78@01 i@152@01)))
            (< (inv@143@01 (Seq_index b@78@01 i@152@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@147@01 (Seq_index b@78@01 i@152@01))
        (and
          (<= 0 (inv@146@01 (Seq_index b@78@01 i@152@01)))
          (< (inv@146@01 (Seq_index b@78@01 i@152@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@152@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@152@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@141@01 (Seq_index c@79@01 i@152@01))
          (and
            (<= 0 (inv@140@01 (Seq_index c@79@01 i@152@01)))
            (< (inv@140@01 (Seq_index c@79@01 i@152@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@144@01 (Seq_index c@79@01 i@152@01))
          (and
            (<= 0 (inv@143@01 (Seq_index c@79@01 i@152@01)))
            (< (inv@143@01 (Seq_index c@79@01 i@152@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@147@01 (Seq_index c@79@01 i@152@01))
        (and
          (<= 0 (inv@146@01 (Seq_index c@79@01 i@152@01)))
          (< (inv@146@01 (Seq_index c@79@01 i@152@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 92 | !(0 <= i@152@01 && i@152@01 < len@80@01)]
(assert (not (and (<= 0 i@152@01) (< i@152@01 len@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@152@01) (< i@152@01 len@80@01)))
  (and (<= 0 i@152@01) (< i@152@01 len@80@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@152@01 Int)) (!
  (and
    (or (<= 0 i@152@01) (not (<= 0 i@152@01)))
    (or
      (not (and (<= 0 i@152@01) (< i@152@01 len@80@01)))
      (and (<= 0 i@152@01) (< i@152@01 len@80@01))))
  :pattern ((Seq_index a@77@01 i@152@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@78@12@78@133-aux|)))
(assert (forall ((i@152@01 Int)) (!
  (and
    (or (<= 0 i@152@01) (not (<= 0 i@152@01)))
    (or
      (not (and (<= 0 i@152@01) (< i@152@01 len@80@01)))
      (and (<= 0 i@152@01) (< i@152@01 len@80@01))))
  :pattern ((Seq_index b@78@01 i@152@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@78@12@78@133-aux|)))
(assert (forall ((i@152@01 Int)) (!
  (and
    (or (<= 0 i@152@01) (not (<= 0 i@152@01)))
    (or
      (not (and (<= 0 i@152@01) (< i@152@01 len@80@01)))
      (and (<= 0 i@152@01) (< i@152@01 len@80@01))))
  :pattern ((Seq_index c@79@01 i@152@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@78@12@78@133-aux|)))
(assert (forall ((i@152@01 Int)) (!
  (=>
    (and (<= 0 i@152@01) (< i@152@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
        a@77@01
        i@152@01))
      (+
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
          b@78@01
          i@152@01))
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
          c@79@01
          i@152@01)))))
  :pattern ((Seq_index a@77@01 i@152@01))
  :pattern ((Seq_index b@78@01 i@152@01))
  :pattern ((Seq_index c@79@01 i@152@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@78@12@78@133|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |a| == len
; [eval] |a|
(declare-const i@153@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 93 | !(0 <= i@153@01) | live]
; [else-branch: 93 | 0 <= i@153@01 | live]
(push) ; 5
; [then-branch: 93 | !(0 <= i@153@01)]
(assert (not (<= 0 i@153@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 93 | 0 <= i@153@01]
(assert (<= 0 i@153@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@153@01) (not (<= 0 i@153@01))))
(assert (and (<= 0 i@153@01) (< i@153@01 len@80@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@153@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@153@01 (Seq_length a@77@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@154@01 ($Ref) Int)
(declare-fun img@155@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@153@01 Int)) (!
  (=>
    (and (<= 0 i@153@01) (< i@153@01 len@80@01))
    (or (<= 0 i@153@01) (not (<= 0 i@153@01))))
  :pattern ((Seq_index a@77@01 i@153@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@153@01 Int) (i2@153@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@153@01) (< i1@153@01 len@80@01))
      (and (<= 0 i2@153@01) (< i2@153@01 len@80@01))
      (= (Seq_index a@77@01 i1@153@01) (Seq_index a@77@01 i2@153@01)))
    (= i1@153@01 i2@153@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@153@01 Int)) (!
  (=>
    (and (<= 0 i@153@01) (< i@153@01 len@80@01))
    (and
      (= (inv@154@01 (Seq_index a@77@01 i@153@01)) i@153@01)
      (img@155@01 (Seq_index a@77@01 i@153@01))))
  :pattern ((Seq_index a@77@01 i@153@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@155@01 r) (and (<= 0 (inv@154@01 r)) (< (inv@154@01 r) len@80@01)))
    (= (Seq_index a@77@01 (inv@154@01 r)) r))
  :pattern ((inv@154@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@153@01 Int)) (!
  (= (Seq_index a@77@01 i@153@01) (Seq_index b@78@01 i@153@01))
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@153@01 Int)) (!
  (= (Seq_index a@77@01 i@153@01) (Seq_index c@79@01 i@153@01))
  
  :qid |quant-u-110|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@156@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@154@01 r)) (< (inv@154@01 r) len@80@01))
      (img@155@01 r)
      (= r (Seq_index a@77@01 (inv@154@01 r))))
    ($Perm.min
      (ite
        (and
          (img@141@01 r)
          (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@157@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@154@01 r)) (< (inv@154@01 r) len@80@01))
      (img@155@01 r)
      (= r (Seq_index a@77@01 (inv@154@01 r))))
    ($Perm.min
      (ite
        (and
          (img@144@01 r)
          (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@156@01 r)))
    $Perm.No))
(define-fun pTaken@158@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@154@01 r)) (< (inv@154@01 r) len@80@01))
      (img@155@01 r)
      (= r (Seq_index a@77@01 (inv@154@01 r))))
    ($Perm.min
      (ite
        (and
          (img@147@01 r)
          (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- $Perm.Write (pTaken@156@01 r)) (pTaken@157@01 r)))
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
          (img@141@01 r)
          (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@156@01 r))
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
      (and (<= 0 (inv@154@01 r)) (< (inv@154@01 r) len@80@01))
      (img@155@01 r)
      (= r (Seq_index a@77@01 (inv@154@01 r))))
    (= (- $Perm.Write (pTaken@156@01 r)) $Perm.No))
  
  :qid |quant-u-113|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] |b| == len
; [eval] |b|
(declare-const i@159@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 94 | !(0 <= i@159@01) | live]
; [else-branch: 94 | 0 <= i@159@01 | live]
(push) ; 5
; [then-branch: 94 | !(0 <= i@159@01)]
(assert (not (<= 0 i@159@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 94 | 0 <= i@159@01]
(assert (<= 0 i@159@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@159@01) (not (<= 0 i@159@01))))
(assert (and (<= 0 i@159@01) (< i@159@01 len@80@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@159@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@159@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@160@01 ($Ref) Int)
(declare-fun img@161@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@159@01 Int)) (!
  (=>
    (and (<= 0 i@159@01) (< i@159@01 len@80@01))
    (or (<= 0 i@159@01) (not (<= 0 i@159@01))))
  :pattern ((Seq_index b@78@01 i@159@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@159@01 Int) (i2@159@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@159@01) (< i1@159@01 len@80@01))
      (and (<= 0 i2@159@01) (< i2@159@01 len@80@01))
      (= (Seq_index b@78@01 i1@159@01) (Seq_index b@78@01 i2@159@01)))
    (= i1@159@01 i2@159@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@159@01 Int)) (!
  (=>
    (and (<= 0 i@159@01) (< i@159@01 len@80@01))
    (and
      (= (inv@160@01 (Seq_index b@78@01 i@159@01)) i@159@01)
      (img@161@01 (Seq_index b@78@01 i@159@01))))
  :pattern ((Seq_index b@78@01 i@159@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@161@01 r) (and (<= 0 (inv@160@01 r)) (< (inv@160@01 r) len@80@01)))
    (= (Seq_index b@78@01 (inv@160@01 r)) r))
  :pattern ((inv@160@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@159@01 Int)) (!
  (= (Seq_index b@78@01 i@159@01) (Seq_index c@79@01 i@159@01))
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@162@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@160@01 r)) (< (inv@160@01 r) len@80@01))
      (img@161@01 r)
      (= r (Seq_index b@78@01 (inv@160@01 r))))
    ($Perm.min
      (ite
        (and
          (img@144@01 r)
          (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@163@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@160@01 r)) (< (inv@160@01 r) len@80@01))
      (img@161@01 r)
      (= r (Seq_index b@78@01 (inv@160@01 r))))
    ($Perm.min
      (ite
        (and
          (img@147@01 r)
          (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@162@01 r)))
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
          (img@144@01 r)
          (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@162@01 r))
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
      (and (<= 0 (inv@160@01 r)) (< (inv@160@01 r) len@80@01))
      (img@161@01 r)
      (= r (Seq_index b@78@01 (inv@160@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@162@01 r)) $Perm.No))
  
  :qid |quant-u-118|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@164@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@164@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@164@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@164@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@164@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef27|)))
; [eval] |c| == len
; [eval] |c|
(declare-const i@165@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 95 | !(0 <= i@165@01) | live]
; [else-branch: 95 | 0 <= i@165@01 | live]
(push) ; 5
; [then-branch: 95 | !(0 <= i@165@01)]
(assert (not (<= 0 i@165@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 95 | 0 <= i@165@01]
(assert (<= 0 i@165@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@165@01) (not (<= 0 i@165@01))))
(assert (and (<= 0 i@165@01) (< i@165@01 len@80@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@165@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@165@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@166@01 ($Ref) Int)
(declare-fun img@167@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@165@01 Int)) (!
  (=>
    (and (<= 0 i@165@01) (< i@165@01 len@80@01))
    (or (<= 0 i@165@01) (not (<= 0 i@165@01))))
  :pattern ((Seq_index c@79@01 i@165@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@165@01 Int) (i2@165@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@165@01) (< i1@165@01 len@80@01))
      (and (<= 0 i2@165@01) (< i2@165@01 len@80@01))
      (= (Seq_index c@79@01 i1@165@01) (Seq_index c@79@01 i2@165@01)))
    (= i1@165@01 i2@165@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@165@01 Int)) (!
  (=>
    (and (<= 0 i@165@01) (< i@165@01 len@80@01))
    (and
      (= (inv@166@01 (Seq_index c@79@01 i@165@01)) i@165@01)
      (img@167@01 (Seq_index c@79@01 i@165@01))))
  :pattern ((Seq_index c@79@01 i@165@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@167@01 r) (and (<= 0 (inv@166@01 r)) (< (inv@166@01 r) len@80@01)))
    (= (Seq_index c@79@01 (inv@166@01 r)) r))
  :pattern ((inv@166@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@168@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@166@01 r)) (< (inv@166@01 r) len@80@01))
      (img@167@01 r)
      (= r (Seq_index c@79@01 (inv@166@01 r))))
    ($Perm.min
      (ite
        (and
          (img@147@01 r)
          (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
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
          (img@147@01 r)
          (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@168@01 r))
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
      (and (<= 0 (inv@166@01 r)) (< (inv@166@01 r) len@80@01))
      (img@167@01 r)
      (= r (Seq_index c@79@01 (inv@166@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@168@01 r)) $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@169@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@169@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@169@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef28|)))
; [eval] (forall i: Int :: { a[i] } { b[i] } { c[i] } 0 <= i && i < len ==> a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value)
(declare-const i@170@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 96 | !(0 <= i@170@01) | live]
; [else-branch: 96 | 0 <= i@170@01 | live]
(push) ; 5
; [then-branch: 96 | !(0 <= i@170@01)]
(assert (not (<= 0 i@170@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 96 | 0 <= i@170@01]
(assert (<= 0 i@170@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@170@01) (not (<= 0 i@170@01))))
(push) ; 4
; [then-branch: 97 | 0 <= i@170@01 && i@170@01 < len@80@01 | live]
; [else-branch: 97 | !(0 <= i@170@01 && i@170@01 < len@80@01) | live]
(push) ; 5
; [then-branch: 97 | 0 <= i@170@01 && i@170@01 < len@80@01]
(assert (and (<= 0 i@170@01) (< i@170@01 len@80@01)))
; [eval] a[i].Ref__Integer_value == b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] a[i]
(push) ; 6
(assert (not (>= i@170@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@170@01 (Seq_length a@77@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@141@01 (Seq_index a@77@01 i@170@01))
          (and
            (<= 0 (inv@140@01 (Seq_index a@77@01 i@170@01)))
            (< (inv@140@01 (Seq_index a@77@01 i@170@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@144@01 (Seq_index a@77@01 i@170@01))
          (and
            (<= 0 (inv@143@01 (Seq_index a@77@01 i@170@01)))
            (< (inv@143@01 (Seq_index a@77@01 i@170@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@147@01 (Seq_index a@77@01 i@170@01))
        (and
          (<= 0 (inv@146@01 (Seq_index a@77@01 i@170@01)))
          (< (inv@146@01 (Seq_index a@77@01 i@170@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] b[i].Ref__Integer_value + c[i].Ref__Integer_value
; [eval] b[i]
(push) ; 6
(assert (not (>= i@170@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@170@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@141@01 (Seq_index b@78@01 i@170@01))
          (and
            (<= 0 (inv@140@01 (Seq_index b@78@01 i@170@01)))
            (< (inv@140@01 (Seq_index b@78@01 i@170@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@144@01 (Seq_index b@78@01 i@170@01))
          (and
            (<= 0 (inv@143@01 (Seq_index b@78@01 i@170@01)))
            (< (inv@143@01 (Seq_index b@78@01 i@170@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@147@01 (Seq_index b@78@01 i@170@01))
        (and
          (<= 0 (inv@146@01 (Seq_index b@78@01 i@170@01)))
          (< (inv@146@01 (Seq_index b@78@01 i@170@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@170@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@170@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@141@01 (Seq_index c@79@01 i@170@01))
          (and
            (<= 0 (inv@140@01 (Seq_index c@79@01 i@170@01)))
            (< (inv@140@01 (Seq_index c@79@01 i@170@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@144@01 (Seq_index c@79@01 i@170@01))
          (and
            (<= 0 (inv@143@01 (Seq_index c@79@01 i@170@01)))
            (< (inv@143@01 (Seq_index c@79@01 i@170@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@147@01 (Seq_index c@79@01 i@170@01))
        (and
          (<= 0 (inv@146@01 (Seq_index c@79@01 i@170@01)))
          (< (inv@146@01 (Seq_index c@79@01 i@170@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 97 | !(0 <= i@170@01 && i@170@01 < len@80@01)]
(assert (not (and (<= 0 i@170@01) (< i@170@01 len@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@170@01) (< i@170@01 len@80@01)))
  (and (<= 0 i@170@01) (< i@170@01 len@80@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@170@01 Int)) (!
  (and
    (or (<= 0 i@170@01) (not (<= 0 i@170@01)))
    (or
      (not (and (<= 0 i@170@01) (< i@170@01 len@80@01)))
      (and (<= 0 i@170@01) (< i@170@01 len@80@01))))
  :pattern ((Seq_index a@77@01 i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@133@12@133@133-aux|)))
(assert (forall ((i@170@01 Int)) (!
  (and
    (or (<= 0 i@170@01) (not (<= 0 i@170@01)))
    (or
      (not (and (<= 0 i@170@01) (< i@170@01 len@80@01)))
      (and (<= 0 i@170@01) (< i@170@01 len@80@01))))
  :pattern ((Seq_index b@78@01 i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@133@12@133@133-aux|)))
(assert (forall ((i@170@01 Int)) (!
  (and
    (or (<= 0 i@170@01) (not (<= 0 i@170@01)))
    (or
      (not (and (<= 0 i@170@01) (< i@170@01 len@80@01)))
      (and (<= 0 i@170@01) (< i@170@01 len@80@01))))
  :pattern ((Seq_index c@79@01 i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@133@12@133@133-aux|)))
(push) ; 3
(assert (not (forall ((i@170@01 Int)) (!
  (=>
    (and (<= 0 i@170@01) (< i@170@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
        a@77@01
        i@170@01))
      (+
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
          b@78@01
          i@170@01))
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
          c@79@01
          i@170@01)))))
  :pattern ((Seq_index a@77@01 i@170@01))
  :pattern ((Seq_index b@78@01 i@170@01))
  :pattern ((Seq_index c@79@01 i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@133@12@133@133|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@170@01 Int)) (!
  (=>
    (and (<= 0 i@170@01) (< i@170@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
        a@77@01
        i@170@01))
      (+
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
          b@78@01
          i@170@01))
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
          c@79@01
          i@170@01)))))
  :pattern ((Seq_index a@77@01 i@170@01))
  :pattern ((Seq_index b@78@01 i@170@01))
  :pattern ((Seq_index c@79@01 i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@133@12@133@133|)))
; [eval] (forall i: Int :: { old(b[i]) } 0 <= i && i < len ==> b[i].Ref__Integer_value == old(b[i].Ref__Integer_value))
(declare-const i@171@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 98 | !(0 <= i@171@01) | live]
; [else-branch: 98 | 0 <= i@171@01 | live]
(push) ; 5
; [then-branch: 98 | !(0 <= i@171@01)]
(assert (not (<= 0 i@171@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 98 | 0 <= i@171@01]
(assert (<= 0 i@171@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@171@01) (not (<= 0 i@171@01))))
(push) ; 4
; [then-branch: 99 | 0 <= i@171@01 && i@171@01 < len@80@01 | live]
; [else-branch: 99 | !(0 <= i@171@01 && i@171@01 < len@80@01) | live]
(push) ; 5
; [then-branch: 99 | 0 <= i@171@01 && i@171@01 < len@80@01]
(assert (and (<= 0 i@171@01) (< i@171@01 len@80@01)))
; [eval] b[i].Ref__Integer_value == old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 6
(assert (not (>= i@171@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@171@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@141@01 (Seq_index b@78@01 i@171@01))
          (and
            (<= 0 (inv@140@01 (Seq_index b@78@01 i@171@01)))
            (< (inv@140@01 (Seq_index b@78@01 i@171@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@144@01 (Seq_index b@78@01 i@171@01))
          (and
            (<= 0 (inv@143@01 (Seq_index b@78@01 i@171@01)))
            (< (inv@143@01 (Seq_index b@78@01 i@171@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@147@01 (Seq_index b@78@01 i@171@01))
        (and
          (<= 0 (inv@146@01 (Seq_index b@78@01 i@171@01)))
          (< (inv@146@01 (Seq_index b@78@01 i@171@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(b[i].Ref__Integer_value)
; [eval] b[i]
(push) ; 6
(assert (not (>= i@171@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@171@01 (Seq_length b@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
    :qid |qp.fvfValDef18|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@86@01 (Seq_index b@78@01 i@171@01))
          (and
            (<= 0 (inv@85@01 (Seq_index b@78@01 i@171@01)))
            (< (inv@85@01 (Seq_index b@78@01 i@171@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@91@01 (Seq_index b@78@01 i@171@01))
          (and
            (<= 0 (inv@90@01 (Seq_index b@78@01 i@171@01)))
            (< (inv@90@01 (Seq_index b@78@01 i@171@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@96@01 (Seq_index b@78@01 i@171@01))
        (and
          (<= 0 (inv@95@01 (Seq_index b@78@01 i@171@01)))
          (< (inv@95@01 (Seq_index b@78@01 i@171@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 99 | !(0 <= i@171@01 && i@171@01 < len@80@01)]
(assert (not (and (<= 0 i@171@01) (< i@171@01 len@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@171@01) (< i@171@01 len@80@01)))
  (and (<= 0 i@171@01) (< i@171@01 len@80@01))))
; [eval] old(b[i])
; [eval] b[i]
(push) ; 4
(assert (not (>= i@171@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@171@01 Int)) (!
  (and
    (or (<= 0 i@171@01) (not (<= 0 i@171@01)))
    (or
      (not (and (<= 0 i@171@01) (< i@171@01 len@80@01)))
      (and (<= 0 i@171@01) (< i@171@01 len@80@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@134@12@134@112-aux|)))
(push) ; 3
(assert (not (forall ((i@171@01 Int)) (!
  (=>
    (and (<= 0 i@171@01) (< i@171@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
        b@78@01
        i@171@01))
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) (Seq_index
        b@78@01
        i@171@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@134@12@134@112|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@171@01 Int)) (!
  (=>
    (and (<= 0 i@171@01) (< i@171@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
        b@78@01
        i@171@01))
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) (Seq_index
        b@78@01
        i@171@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@134@12@134@112|)))
; [eval] (forall i: Int :: { old(c[i]) } 0 <= i && i < len ==> c[i].Ref__Integer_value == old(c[i].Ref__Integer_value))
(declare-const i@172@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 100 | !(0 <= i@172@01) | live]
; [else-branch: 100 | 0 <= i@172@01 | live]
(push) ; 5
; [then-branch: 100 | !(0 <= i@172@01)]
(assert (not (<= 0 i@172@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 100 | 0 <= i@172@01]
(assert (<= 0 i@172@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@172@01) (not (<= 0 i@172@01))))
(push) ; 4
; [then-branch: 101 | 0 <= i@172@01 && i@172@01 < len@80@01 | live]
; [else-branch: 101 | !(0 <= i@172@01 && i@172@01 < len@80@01) | live]
(push) ; 5
; [then-branch: 101 | 0 <= i@172@01 && i@172@01 < len@80@01]
(assert (and (<= 0 i@172@01) (< i@172@01 len@80@01)))
; [eval] c[i].Ref__Integer_value == old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@172@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@172@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@141@01 r)
        (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@144@01 r)
        (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@147@01 r)
        (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@141@01 (Seq_index c@79@01 i@172@01))
          (and
            (<= 0 (inv@140@01 (Seq_index c@79@01 i@172@01)))
            (< (inv@140@01 (Seq_index c@79@01 i@172@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@144@01 (Seq_index c@79@01 i@172@01))
          (and
            (<= 0 (inv@143@01 (Seq_index c@79@01 i@172@01)))
            (< (inv@143@01 (Seq_index c@79@01 i@172@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@147@01 (Seq_index c@79@01 i@172@01))
        (and
          (<= 0 (inv@146@01 (Seq_index c@79@01 i@172@01)))
          (< (inv@146@01 (Seq_index c@79@01 i@172@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(c[i].Ref__Integer_value)
; [eval] c[i]
(push) ; 6
(assert (not (>= i@172@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@172@01 (Seq_length c@79@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
    :qid |qp.fvfValDef18|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@86@01 (Seq_index c@79@01 i@172@01))
          (and
            (<= 0 (inv@85@01 (Seq_index c@79@01 i@172@01)))
            (< (inv@85@01 (Seq_index c@79@01 i@172@01)) len@80@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@91@01 (Seq_index c@79@01 i@172@01))
          (and
            (<= 0 (inv@90@01 (Seq_index c@79@01 i@172@01)))
            (< (inv@90@01 (Seq_index c@79@01 i@172@01)) len@80@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@96@01 (Seq_index c@79@01 i@172@01))
        (and
          (<= 0 (inv@95@01 (Seq_index c@79@01 i@172@01)))
          (< (inv@95@01 (Seq_index c@79@01 i@172@01)) len@80@01)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 101 | !(0 <= i@172@01 && i@172@01 < len@80@01)]
(assert (not (and (<= 0 i@172@01) (< i@172@01 len@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@172@01) (< i@172@01 len@80@01)))
  (and (<= 0 i@172@01) (< i@172@01 len@80@01))))
; [eval] old(c[i])
; [eval] c[i]
(push) ; 4
(assert (not (>= i@172@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (and (<= 0 (inv@140@01 r)) (< (inv@140@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@138@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@144@01 r) (and (<= 0 (inv@143@01 r)) (< (inv@143@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@91@01 r) (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (and (<= 0 (inv@95@01 r)) (< (inv@95@01 r) len@80@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@172@01 Int)) (!
  (and
    (or (<= 0 i@172@01) (not (<= 0 i@172@01)))
    (or
      (not (and (<= 0 i@172@01) (< i@172@01 len@80@01)))
      (and (<= 0 i@172@01) (< i@172@01 len@80@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@135@12@135@112-aux|)))
(push) ; 3
(assert (not (forall ((i@172@01 Int)) (!
  (=>
    (and (<= 0 i@172@01) (< i@172@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
        c@79@01
        i@172@01))
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) (Seq_index
        c@79@01
        i@172@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@135@12@135@112|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@172@01 Int)) (!
  (=>
    (and (<= 0 i@172@01) (< i@172@01 len@80@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@149@01  $FVF<Ref__Integer_value>) (Seq_index
        c@79@01
        i@172@01))
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) (Seq_index
        c@79@01
        i@172@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@135@12@135@112|)))
(pop) ; 2
(pop) ; 1
