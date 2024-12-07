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
; ---------- FUNCTION count_list----------
(declare-fun i@0@00 () Int)
(declare-fun hi@1@00 () Int)
(declare-fun ar@2@00 () Seq<Int>)
(declare-fun v@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@0@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] i <= hi
(assert (<= i@0@00 hi@1@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] hi <= |ar|
; [eval] |ar|
(assert (<= hi@1@00 (Seq_length ar@2@00)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 i@0@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= i@0@00 hi@1@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (<= hi@1@00 (Seq_length ar@2@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i < hi ? (ar[i] == v ? 1 : 0) + count_list(i + 1, hi, ar, v) : 0)
; [eval] i < hi
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@0@00 hi@1@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@0@00 hi@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@0@00 < hi@1@00 | live]
; [else-branch: 0 | !(i@0@00 < hi@1@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | i@0@00 < hi@1@00]
(assert (< i@0@00 hi@1@00))
; [eval] (ar[i] == v ? 1 : 0) + count_list(i + 1, hi, ar, v)
; [eval] (ar[i] == v ? 1 : 0)
; [eval] ar[i] == v
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@0@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@0@00 (Seq_length ar@2@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (Seq_index ar@2@00 i@0@00) v@3@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@2@00 i@0@00) v@3@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | ar@2@00[i@0@00] == v@3@00 | live]
; [else-branch: 1 | ar@2@00[i@0@00] != v@3@00 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | ar@2@00[i@0@00] == v@3@00]
(assert (= (Seq_index ar@2@00 i@0@00) v@3@00))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | ar@2@00[i@0@00] != v@3@00]
(assert (not (= (Seq_index ar@2@00 i@0@00) v@3@00)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (Seq_index ar@2@00 i@0@00) v@3@00))
  (= (Seq_index ar@2@00 i@0@00) v@3@00)))
; [eval] count_list(i + 1, hi, ar, v)
; [eval] i + 1
(push) ; 4
; [eval] 0 <= i
(push) ; 5
(assert (not (<= 0 (+ i@0@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ i@0@00 1)))
; [eval] i <= hi
(push) ; 5
(assert (not (<= (+ i@0@00 1) hi@1@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@0@00 1) hi@1@00))
; [eval] hi <= |ar|
; [eval] |ar|
(assert (count_list%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (+ i@0@00 1) hi@1@00 ar@2@00 v@3@00))
(pop) ; 4
; Joined path conditions
(assert (and
  (<= 0 (+ i@0@00 1))
  (<= (+ i@0@00 1) hi@1@00)
  (count_list%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (+ i@0@00 1) hi@1@00 ar@2@00 v@3@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(i@0@00 < hi@1@00)]
(assert (not (< i@0@00 hi@1@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (< i@0@00 hi@1@00)
  (and
    (< i@0@00 hi@1@00)
    (or
      (not (= (Seq_index ar@2@00 i@0@00) v@3@00))
      (= (Seq_index ar@2@00 i@0@00) v@3@00))
    (<= 0 (+ i@0@00 1))
    (<= (+ i@0@00 1) hi@1@00)
    (count_list%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit $Snap.unit)) (+ i@0@00 1) hi@1@00 ar@2@00 v@3@00))))
; Joined path conditions
(assert (or (not (< i@0@00 hi@1@00)) (< i@0@00 hi@1@00)))
(assert (=
  result@4@00
  (ite
    (< i@0@00 hi@1@00)
    (+
      (ite (= (Seq_index ar@2@00 i@0@00) v@3@00) 1 0)
      (count_list ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit $Snap.unit)) (+ i@0@00 1) hi@1@00 ar@2@00 v@3@00))
    0)))
(pop) ; 1
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
; ---------- FUNCTION sum_list----------
(declare-fun i@5@00 () Int)
(declare-fun hi@6@00 () Int)
(declare-fun ar@7@00 () Seq<Int>)
(declare-fun result@8@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@5@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] i <= hi
(assert (<= i@5@00 hi@6@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] hi <= |ar|
; [eval] |ar|
(assert (<= hi@6@00 (Seq_length ar@7@00)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 i@5@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= i@5@00 hi@6@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (<= hi@6@00 (Seq_length ar@7@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i < hi ? ar[i] + sum_list(i + 1, hi, ar) : 0)
; [eval] i < hi
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@5@00 hi@6@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@5@00 hi@6@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | i@5@00 < hi@6@00 | live]
; [else-branch: 2 | !(i@5@00 < hi@6@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | i@5@00 < hi@6@00]
(assert (< i@5@00 hi@6@00))
; [eval] ar[i] + sum_list(i + 1, hi, ar)
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@5@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@5@00 (Seq_length ar@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] sum_list(i + 1, hi, ar)
; [eval] i + 1
(push) ; 4
; [eval] 0 <= i
(push) ; 5
(assert (not (<= 0 (+ i@5@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ i@5@00 1)))
; [eval] i <= hi
(push) ; 5
(assert (not (<= (+ i@5@00 1) hi@6@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@5@00 1) hi@6@00))
; [eval] hi <= |ar|
; [eval] |ar|
(assert (sum_list%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (+ i@5@00 1) hi@6@00 ar@7@00))
(pop) ; 4
; Joined path conditions
(assert (and
  (<= 0 (+ i@5@00 1))
  (<= (+ i@5@00 1) hi@6@00)
  (sum_list%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (+ i@5@00 1) hi@6@00 ar@7@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(i@5@00 < hi@6@00)]
(assert (not (< i@5@00 hi@6@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (< i@5@00 hi@6@00)
  (and
    (< i@5@00 hi@6@00)
    (<= 0 (+ i@5@00 1))
    (<= (+ i@5@00 1) hi@6@00)
    (sum_list%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit $Snap.unit)) (+ i@5@00 1) hi@6@00 ar@7@00))))
; Joined path conditions
(assert (or (not (< i@5@00 hi@6@00)) (< i@5@00 hi@6@00)))
(assert (=
  result@8@00
  (ite
    (< i@5@00 hi@6@00)
    (+
      (Seq_index ar@7@00 i@5@00)
      (sum_list ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)) (+
        i@5@00
        1) hi@6@00 ar@7@00))
    0)))
(pop) ; 1
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
; ---------- FUNCTION sum_array----------
(declare-fun i@9@00 () Int)
(declare-fun lo@10@00 () Int)
(declare-fun hi@11@00 () Int)
(declare-fun ar@12@00 () Seq<$Ref>)
(declare-fun result@13@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= lo
(assert (<= 0 lo@10@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] lo <= i
(assert (<= lo@10@00 i@9@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] i <= hi
(assert (<= i@9@00 hi@11@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] hi <= |ar|
; [eval] |ar|
(assert (<= hi@11@00 (Seq_length ar@12@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { ar[ix], ar[jx] } ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx])
(declare-const ix@36@00 Int)
(declare-const jx@37@00 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx]
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 3 | !(ix@36@00 >= 0) | live]
; [else-branch: 3 | ix@36@00 >= 0 | live]
(push) ; 4
; [then-branch: 3 | !(ix@36@00 >= 0)]
(assert (not (>= ix@36@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | ix@36@00 >= 0]
(assert (>= ix@36@00 0))
; [eval] ix < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 4 | !(ix@36@00 < |ar@12@00|) | live]
; [else-branch: 4 | ix@36@00 < |ar@12@00| | live]
(push) ; 6
; [then-branch: 4 | !(ix@36@00 < |ar@12@00|)]
(assert (not (< ix@36@00 (Seq_length ar@12@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | ix@36@00 < |ar@12@00|]
(assert (< ix@36@00 (Seq_length ar@12@00)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 5 | !(jx@37@00 >= 0) | live]
; [else-branch: 5 | jx@37@00 >= 0 | live]
(push) ; 8
; [then-branch: 5 | !(jx@37@00 >= 0)]
(assert (not (>= jx@37@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 5 | jx@37@00 >= 0]
(assert (>= jx@37@00 0))
; [eval] jx < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 6 | !(jx@37@00 < |ar@12@00|) | live]
; [else-branch: 6 | jx@37@00 < |ar@12@00| | live]
(push) ; 10
; [then-branch: 6 | !(jx@37@00 < |ar@12@00|)]
(assert (not (< jx@37@00 (Seq_length ar@12@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 6 | jx@37@00 < |ar@12@00|]
(assert (< jx@37@00 (Seq_length ar@12@00)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@37@00 (Seq_length ar@12@00)) (not (< jx@37@00 (Seq_length ar@12@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@37@00 0)
  (and
    (>= jx@37@00 0)
    (or
      (< jx@37@00 (Seq_length ar@12@00))
      (not (< jx@37@00 (Seq_length ar@12@00)))))))
(assert (or (>= jx@37@00 0) (not (>= jx@37@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@36@00 (Seq_length ar@12@00))
  (and
    (< ix@36@00 (Seq_length ar@12@00))
    (=>
      (>= jx@37@00 0)
      (and
        (>= jx@37@00 0)
        (or
          (< jx@37@00 (Seq_length ar@12@00))
          (not (< jx@37@00 (Seq_length ar@12@00))))))
    (or (>= jx@37@00 0) (not (>= jx@37@00 0))))))
(assert (or (< ix@36@00 (Seq_length ar@12@00)) (not (< ix@36@00 (Seq_length ar@12@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@36@00 0)
  (and
    (>= ix@36@00 0)
    (=>
      (< ix@36@00 (Seq_length ar@12@00))
      (and
        (< ix@36@00 (Seq_length ar@12@00))
        (=>
          (>= jx@37@00 0)
          (and
            (>= jx@37@00 0)
            (or
              (< jx@37@00 (Seq_length ar@12@00))
              (not (< jx@37@00 (Seq_length ar@12@00))))))
        (or (>= jx@37@00 0) (not (>= jx@37@00 0)))))
    (or
      (< ix@36@00 (Seq_length ar@12@00))
      (not (< ix@36@00 (Seq_length ar@12@00)))))))
(assert (or (>= ix@36@00 0) (not (>= ix@36@00 0))))
(push) ; 3
; [then-branch: 7 | ix@36@00 >= 0 && ix@36@00 < |ar@12@00| && jx@37@00 >= 0 && jx@37@00 < |ar@12@00| && ix@36@00 != jx@37@00 | live]
; [else-branch: 7 | !(ix@36@00 >= 0 && ix@36@00 < |ar@12@00| && jx@37@00 >= 0 && jx@37@00 < |ar@12@00| && ix@36@00 != jx@37@00) | live]
(push) ; 4
; [then-branch: 7 | ix@36@00 >= 0 && ix@36@00 < |ar@12@00| && jx@37@00 >= 0 && jx@37@00 < |ar@12@00| && ix@36@00 != jx@37@00]
(assert (and
  (>= ix@36@00 0)
  (and
    (< ix@36@00 (Seq_length ar@12@00))
    (and
      (>= jx@37@00 0)
      (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00)))))))
; [eval] ar[ix] != ar[jx]
; [eval] ar[ix]
; [eval] ar[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(ix@36@00 >= 0 && ix@36@00 < |ar@12@00| && jx@37@00 >= 0 && jx@37@00 < |ar@12@00| && ix@36@00 != jx@37@00)]
(assert (not
  (and
    (>= ix@36@00 0)
    (and
      (< ix@36@00 (Seq_length ar@12@00))
      (and
        (>= jx@37@00 0)
        (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@36@00 0)
    (and
      (< ix@36@00 (Seq_length ar@12@00))
      (and
        (>= jx@37@00 0)
        (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00))))))
  (and
    (>= ix@36@00 0)
    (< ix@36@00 (Seq_length ar@12@00))
    (>= jx@37@00 0)
    (< jx@37@00 (Seq_length ar@12@00))
    (not (= ix@36@00 jx@37@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@36@00 0)
      (and
        (< ix@36@00 (Seq_length ar@12@00))
        (and
          (>= jx@37@00 0)
          (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00)))))))
  (and
    (>= ix@36@00 0)
    (and
      (< ix@36@00 (Seq_length ar@12@00))
      (and
        (>= jx@37@00 0)
        (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@36@00 Int) (jx@37@00 Int)) (!
  (and
    (=>
      (>= ix@36@00 0)
      (and
        (>= ix@36@00 0)
        (=>
          (< ix@36@00 (Seq_length ar@12@00))
          (and
            (< ix@36@00 (Seq_length ar@12@00))
            (=>
              (>= jx@37@00 0)
              (and
                (>= jx@37@00 0)
                (or
                  (< jx@37@00 (Seq_length ar@12@00))
                  (not (< jx@37@00 (Seq_length ar@12@00))))))
            (or (>= jx@37@00 0) (not (>= jx@37@00 0)))))
        (or
          (< ix@36@00 (Seq_length ar@12@00))
          (not (< ix@36@00 (Seq_length ar@12@00))))))
    (or (>= ix@36@00 0) (not (>= ix@36@00 0)))
    (=>
      (and
        (>= ix@36@00 0)
        (and
          (< ix@36@00 (Seq_length ar@12@00))
          (and
            (>= jx@37@00 0)
            (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00))))))
      (and
        (>= ix@36@00 0)
        (< ix@36@00 (Seq_length ar@12@00))
        (>= jx@37@00 0)
        (< jx@37@00 (Seq_length ar@12@00))
        (not (= ix@36@00 jx@37@00))))
    (or
      (not
        (and
          (>= ix@36@00 0)
          (and
            (< ix@36@00 (Seq_length ar@12@00))
            (and
              (>= jx@37@00 0)
              (and
                (< jx@37@00 (Seq_length ar@12@00))
                (not (= ix@36@00 jx@37@00)))))))
      (and
        (>= ix@36@00 0)
        (and
          (< ix@36@00 (Seq_length ar@12@00))
          (and
            (>= jx@37@00 0)
            (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00))))))))
  :pattern ((Seq_index ar@12@00 ix@36@00) (Seq_index ar@12@00 jx@37@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@16@12@16@116-aux|)))
(assert (forall ((ix@36@00 Int) (jx@37@00 Int)) (!
  (=>
    (and
      (>= ix@36@00 0)
      (and
        (< ix@36@00 (Seq_length ar@12@00))
        (and
          (>= jx@37@00 0)
          (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00))))))
    (not (= (Seq_index ar@12@00 ix@36@00) (Seq_index ar@12@00 jx@37@00))))
  :pattern ((Seq_index ar@12@00 ix@36@00) (Seq_index ar@12@00 jx@37@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@16@12@16@116|)))
(declare-const k@38@00 Int)
(push) ; 2
; [eval] lo <= k && k < hi
; [eval] lo <= k
(push) ; 3
; [then-branch: 8 | !(lo@10@00 <= k@38@00) | live]
; [else-branch: 8 | lo@10@00 <= k@38@00 | live]
(push) ; 4
; [then-branch: 8 | !(lo@10@00 <= k@38@00)]
(assert (not (<= lo@10@00 k@38@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | lo@10@00 <= k@38@00]
(assert (<= lo@10@00 k@38@00))
; [eval] k < hi
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= lo@10@00 k@38@00) (not (<= lo@10@00 k@38@00))))
(assert (and (<= lo@10@00 k@38@00) (< k@38@00 hi@11@00)))
; [eval] ar[k]
(push) ; 3
(assert (not (>= k@38@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@38@00 (Seq_length ar@12@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@39@00 $Perm)
(assert ($Perm.isReadVar $k@39@00))
(pop) ; 2
(declare-fun inv@40@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@41@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@39@00))
; Nested auxiliary terms: non-globals
(assert (forall ((k@38@00 Int)) (!
  (=>
    (and (<= lo@10@00 k@38@00) (< k@38@00 hi@11@00))
    (or (<= lo@10@00 k@38@00) (not (<= lo@10@00 k@38@00))))
  :pattern ((Seq_index ar@12@00 k@38@00))
  :qid |Ref__Integer_value-aux|)))
(push) ; 2
(assert (not (forall ((k@38@00 Int)) (!
  (=>
    (and (<= lo@10@00 k@38@00) (< k@38@00 hi@11@00))
    (or (= $k@39@00 $Perm.No) (< $Perm.No $k@39@00)))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@38@00 Int) (k2@38@00 Int)) (!
  (=>
    (and
      (and
        (and (<= lo@10@00 k1@38@00) (< k1@38@00 hi@11@00))
        (< $Perm.No $k@39@00))
      (and
        (and (<= lo@10@00 k2@38@00) (< k2@38@00 hi@11@00))
        (< $Perm.No $k@39@00))
      (= (Seq_index ar@12@00 k1@38@00) (Seq_index ar@12@00 k2@38@00)))
    (= k1@38@00 k2@38@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@38@00 Int)) (!
  (=>
    (and (and (<= lo@10@00 k@38@00) (< k@38@00 hi@11@00)) (< $Perm.No $k@39@00))
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
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
      (and
        (and
          (<= lo@10@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          (< (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
        (< $Perm.No $k@39@00)))
    (=
      (Seq_index ar@12@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      r))
  :pattern ((inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((k@38@00 Int)) (!
  (<= $Perm.No $k@39@00)
  :pattern ((Seq_index ar@12@00 k@38@00))
  :qid |Ref__Integer_value-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((k@38@00 Int)) (!
  (<= $k@39@00 $Perm.Write)
  :pattern ((Seq_index ar@12@00 k@38@00))
  :qid |Ref__Integer_value-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((k@38@00 Int)) (!
  (=>
    (and (and (<= lo@10@00 k@38@00) (< k@38@00 hi@11@00)) (< $Perm.No $k@39@00))
    (not (= (Seq_index ar@12@00 k@38@00) $Ref.null)))
  :pattern ((Seq_index ar@12@00 k@38@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
      (and
        (and
          (<= lo@10@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          (< (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
        (< $Perm.No $k@39@00)))
    (=
      (Seq_index ar@12@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      r))
  :pattern ((inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((k@38@00 Int)) (!
  (=>
    (and (and (<= lo@10@00 k@38@00) (< k@38@00 hi@11@00)) (< $Perm.No $k@39@00))
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
  :qid |quant-u-17|)))
(assert (forall ((k@38@00 Int)) (!
  (<= $Perm.No $k@39@00)
  :pattern ((Seq_index ar@12@00 k@38@00))
  :qid |Ref__Integer_value-permAtLeastZero|)))
(assert (forall ((k@38@00 Int)) (!
  (<= $k@39@00 $Perm.Write)
  :pattern ((Seq_index ar@12@00 k@38@00))
  :qid |Ref__Integer_value-permAtMostOne|)))
(assert (forall ((k@38@00 Int)) (!
  (=>
    (and (and (<= lo@10@00 k@38@00) (< k@38@00 hi@11@00)) (< $Perm.No $k@39@00))
    (not (= (Seq_index ar@12@00 k@38@00) $Ref.null)))
  :pattern ((Seq_index ar@12@00 k@38@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert ($Perm.isReadVar $k@39@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 lo@10@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= lo@10@00 i@9@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= i@9@00 hi@11@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (<= hi@11@00 (Seq_length ar@12@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (forall ((ix@36@00 Int) (jx@37@00 Int)) (!
  (and
    (=>
      (>= ix@36@00 0)
      (and
        (>= ix@36@00 0)
        (=>
          (< ix@36@00 (Seq_length ar@12@00))
          (and
            (< ix@36@00 (Seq_length ar@12@00))
            (=>
              (>= jx@37@00 0)
              (and
                (>= jx@37@00 0)
                (or
                  (< jx@37@00 (Seq_length ar@12@00))
                  (not (< jx@37@00 (Seq_length ar@12@00))))))
            (or (>= jx@37@00 0) (not (>= jx@37@00 0)))))
        (or
          (< ix@36@00 (Seq_length ar@12@00))
          (not (< ix@36@00 (Seq_length ar@12@00))))))
    (or (>= ix@36@00 0) (not (>= ix@36@00 0)))
    (=>
      (and
        (>= ix@36@00 0)
        (and
          (< ix@36@00 (Seq_length ar@12@00))
          (and
            (>= jx@37@00 0)
            (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00))))))
      (and
        (>= ix@36@00 0)
        (< ix@36@00 (Seq_length ar@12@00))
        (>= jx@37@00 0)
        (< jx@37@00 (Seq_length ar@12@00))
        (not (= ix@36@00 jx@37@00))))
    (or
      (not
        (and
          (>= ix@36@00 0)
          (and
            (< ix@36@00 (Seq_length ar@12@00))
            (and
              (>= jx@37@00 0)
              (and
                (< jx@37@00 (Seq_length ar@12@00))
                (not (= ix@36@00 jx@37@00)))))))
      (and
        (>= ix@36@00 0)
        (and
          (< ix@36@00 (Seq_length ar@12@00))
          (and
            (>= jx@37@00 0)
            (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00))))))))
  :pattern ((Seq_index ar@12@00 ix@36@00) (Seq_index ar@12@00 jx@37@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@16@12@16@116-aux|)))
(assert (forall ((ix@36@00 Int) (jx@37@00 Int)) (!
  (=>
    (and
      (>= ix@36@00 0)
      (and
        (< ix@36@00 (Seq_length ar@12@00))
        (and
          (>= jx@37@00 0)
          (and (< jx@37@00 (Seq_length ar@12@00)) (not (= ix@36@00 jx@37@00))))))
    (not (= (Seq_index ar@12@00 ix@36@00) (Seq_index ar@12@00 jx@37@00))))
  :pattern ((Seq_index ar@12@00 ix@36@00) (Seq_index ar@12@00 jx@37@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@16@12@16@116|)))
(assert (forall ((k@38@00 Int)) (!
  (=>
    (and (<= lo@10@00 k@38@00) (< k@38@00 hi@11@00))
    (or (<= lo@10@00 k@38@00) (not (<= lo@10@00 k@38@00))))
  :pattern ((Seq_index ar@12@00 k@38@00))
  :qid |Ref__Integer_value-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i < hi ? ar[i].Ref__Integer_value + sum_array(i + 1, lo, hi, ar) : 0)
; [eval] i < hi
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@9@00 hi@11@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@9@00 hi@11@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | i@9@00 < hi@11@00 | live]
; [else-branch: 9 | !(i@9@00 < hi@11@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | i@9@00 < hi@11@00]
(assert (< i@9@00 hi@11@00))
; [eval] ar[i].Ref__Integer_value + sum_array(i + 1, lo, hi, ar)
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@9@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@9@00 (Seq_length ar@12@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (ite
  (and
    (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 (Seq_index ar@12@00 i@9@00))
    (and
      (<=
        lo@10@00
        (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 (Seq_index
          ar@12@00
          i@9@00)))
      (<
        (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 (Seq_index
          ar@12@00
          i@9@00))
        hi@11@00)))
  (< $Perm.No $k@39@00)
  false)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] sum_array(i + 1, lo, hi, ar)
; [eval] i + 1
(push) ; 4
; [eval] 0 <= lo
; [eval] lo <= i
(push) ; 5
(assert (not (<= lo@10@00 (+ i@9@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= lo@10@00 (+ i@9@00 1)))
; [eval] i <= hi
(push) ; 5
(assert (not (<= (+ i@9@00 1) hi@11@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@9@00 1) hi@11@00))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall ix: Int, jx: Int ::ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx])
(declare-const ix@42@00 Int)
(declare-const jx@43@00 Int)
(push) ; 5
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx]
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx)))
; [eval] ix >= 0
(push) ; 6
; [then-branch: 10 | !(ix@42@00 >= 0) | live]
; [else-branch: 10 | ix@42@00 >= 0 | live]
(push) ; 7
; [then-branch: 10 | !(ix@42@00 >= 0)]
(assert (not (>= ix@42@00 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | ix@42@00 >= 0]
(assert (>= ix@42@00 0))
; [eval] ix < |ar|
; [eval] |ar|
(push) ; 8
; [then-branch: 11 | !(ix@42@00 < |ar@12@00|) | live]
; [else-branch: 11 | ix@42@00 < |ar@12@00| | live]
(push) ; 9
; [then-branch: 11 | !(ix@42@00 < |ar@12@00|)]
(assert (not (< ix@42@00 (Seq_length ar@12@00))))
(pop) ; 9
(push) ; 9
; [else-branch: 11 | ix@42@00 < |ar@12@00|]
(assert (< ix@42@00 (Seq_length ar@12@00)))
; [eval] jx >= 0
(push) ; 10
; [then-branch: 12 | !(jx@43@00 >= 0) | live]
; [else-branch: 12 | jx@43@00 >= 0 | live]
(push) ; 11
; [then-branch: 12 | !(jx@43@00 >= 0)]
(assert (not (>= jx@43@00 0)))
(pop) ; 11
(push) ; 11
; [else-branch: 12 | jx@43@00 >= 0]
(assert (>= jx@43@00 0))
; [eval] jx < |ar|
; [eval] |ar|
(push) ; 12
; [then-branch: 13 | !(jx@43@00 < |ar@12@00|) | live]
; [else-branch: 13 | jx@43@00 < |ar@12@00| | live]
(push) ; 13
; [then-branch: 13 | !(jx@43@00 < |ar@12@00|)]
(assert (not (< jx@43@00 (Seq_length ar@12@00))))
(pop) ; 13
(push) ; 13
; [else-branch: 13 | jx@43@00 < |ar@12@00|]
(assert (< jx@43@00 (Seq_length ar@12@00)))
; [eval] ix != jx
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (< jx@43@00 (Seq_length ar@12@00)) (not (< jx@43@00 (Seq_length ar@12@00)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@43@00 0)
  (and
    (>= jx@43@00 0)
    (or
      (< jx@43@00 (Seq_length ar@12@00))
      (not (< jx@43@00 (Seq_length ar@12@00)))))))
(assert (or (>= jx@43@00 0) (not (>= jx@43@00 0))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@42@00 (Seq_length ar@12@00))
  (and
    (< ix@42@00 (Seq_length ar@12@00))
    (=>
      (>= jx@43@00 0)
      (and
        (>= jx@43@00 0)
        (or
          (< jx@43@00 (Seq_length ar@12@00))
          (not (< jx@43@00 (Seq_length ar@12@00))))))
    (or (>= jx@43@00 0) (not (>= jx@43@00 0))))))
(assert (or (< ix@42@00 (Seq_length ar@12@00)) (not (< ix@42@00 (Seq_length ar@12@00)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@42@00 0)
  (and
    (>= ix@42@00 0)
    (=>
      (< ix@42@00 (Seq_length ar@12@00))
      (and
        (< ix@42@00 (Seq_length ar@12@00))
        (=>
          (>= jx@43@00 0)
          (and
            (>= jx@43@00 0)
            (or
              (< jx@43@00 (Seq_length ar@12@00))
              (not (< jx@43@00 (Seq_length ar@12@00))))))
        (or (>= jx@43@00 0) (not (>= jx@43@00 0)))))
    (or
      (< ix@42@00 (Seq_length ar@12@00))
      (not (< ix@42@00 (Seq_length ar@12@00)))))))
(assert (or (>= ix@42@00 0) (not (>= ix@42@00 0))))
(push) ; 6
; [then-branch: 14 | ix@42@00 >= 0 && ix@42@00 < |ar@12@00| && jx@43@00 >= 0 && jx@43@00 < |ar@12@00| && ix@42@00 != jx@43@00 | live]
; [else-branch: 14 | !(ix@42@00 >= 0 && ix@42@00 < |ar@12@00| && jx@43@00 >= 0 && jx@43@00 < |ar@12@00| && ix@42@00 != jx@43@00) | live]
(push) ; 7
; [then-branch: 14 | ix@42@00 >= 0 && ix@42@00 < |ar@12@00| && jx@43@00 >= 0 && jx@43@00 < |ar@12@00| && ix@42@00 != jx@43@00]
(assert (and
  (>= ix@42@00 0)
  (and
    (< ix@42@00 (Seq_length ar@12@00))
    (and
      (>= jx@43@00 0)
      (and (< jx@43@00 (Seq_length ar@12@00)) (not (= ix@42@00 jx@43@00)))))))
; [eval] ar[ix] != ar[jx]
; [eval] ar[ix]
; [eval] ar[jx]
(pop) ; 7
(push) ; 7
; [else-branch: 14 | !(ix@42@00 >= 0 && ix@42@00 < |ar@12@00| && jx@43@00 >= 0 && jx@43@00 < |ar@12@00| && ix@42@00 != jx@43@00)]
(assert (not
  (and
    (>= ix@42@00 0)
    (and
      (< ix@42@00 (Seq_length ar@12@00))
      (and
        (>= jx@43@00 0)
        (and (< jx@43@00 (Seq_length ar@12@00)) (not (= ix@42@00 jx@43@00))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (>= ix@42@00 0)
    (and
      (< ix@42@00 (Seq_length ar@12@00))
      (and
        (>= jx@43@00 0)
        (and (< jx@43@00 (Seq_length ar@12@00)) (not (= ix@42@00 jx@43@00))))))
  (and
    (>= ix@42@00 0)
    (< ix@42@00 (Seq_length ar@12@00))
    (>= jx@43@00 0)
    (< jx@43@00 (Seq_length ar@12@00))
    (not (= ix@42@00 jx@43@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@42@00 0)
      (and
        (< ix@42@00 (Seq_length ar@12@00))
        (and
          (>= jx@43@00 0)
          (and (< jx@43@00 (Seq_length ar@12@00)) (not (= ix@42@00 jx@43@00)))))))
  (and
    (>= ix@42@00 0)
    (and
      (< ix@42@00 (Seq_length ar@12@00))
      (and
        (>= jx@43@00 0)
        (and (< jx@43@00 (Seq_length ar@12@00)) (not (= ix@42@00 jx@43@00))))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((ix@42@00 Int) (jx@43@00 Int)) (!
  (=>
    (and
      (>= ix@42@00 0)
      (and
        (< ix@42@00 (Seq_length ar@12@00))
        (and
          (>= jx@43@00 0)
          (and (< jx@43@00 (Seq_length ar@12@00)) (not (= ix@42@00 jx@43@00))))))
    (not (= (Seq_index ar@12@00 ix@42@00) (Seq_index ar@12@00 jx@43@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@16@12@16@116|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((ix@42@00 Int) (jx@43@00 Int)) (!
  (=>
    (and
      (>= ix@42@00 0)
      (and
        (< ix@42@00 (Seq_length ar@12@00))
        (and
          (>= jx@43@00 0)
          (and (< jx@43@00 (Seq_length ar@12@00)) (not (= ix@42@00 jx@43@00))))))
    (not (= (Seq_index ar@12@00 ix@42@00) (Seq_index ar@12@00 jx@43@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@16@12@16@116|)))
(declare-const k@44@00 Int)
(push) ; 5
; [eval] lo <= k && k < hi
; [eval] lo <= k
(push) ; 6
; [then-branch: 15 | !(lo@10@00 <= k@44@00) | live]
; [else-branch: 15 | lo@10@00 <= k@44@00 | live]
(push) ; 7
; [then-branch: 15 | !(lo@10@00 <= k@44@00)]
(assert (not (<= lo@10@00 k@44@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 15 | lo@10@00 <= k@44@00]
(assert (<= lo@10@00 k@44@00))
; [eval] k < hi
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= lo@10@00 k@44@00) (not (<= lo@10@00 k@44@00))))
(assert (and (<= lo@10@00 k@44@00) (< k@44@00 hi@11@00)))
(declare-const $k@45@00 $Perm)
(assert ($Perm.isReadVar $k@45@00))
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@44@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@44@00 (Seq_length ar@12@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@46@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@47@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@45@00))
; Nested auxiliary terms: non-globals
(assert (forall ((k@44@00 Int)) (!
  (=>
    (and (<= lo@10@00 k@44@00) (< k@44@00 hi@11@00))
    (or (<= lo@10@00 k@44@00) (not (<= lo@10@00 k@44@00))))
  :pattern ((Seq_index ar@12@00 k@44@00))
  :qid |Ref__Integer_value-aux|)))
(push) ; 5
(assert (not (forall ((k@44@00 Int)) (!
  (=>
    (and (<= lo@10@00 k@44@00) (< k@44@00 hi@11@00))
    (or (= $k@45@00 $Perm.No) (< $Perm.No $k@45@00)))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@44@00 Int) (k2@44@00 Int)) (!
  (=>
    (and
      (and
        (and (<= lo@10@00 k1@44@00) (< k1@44@00 hi@11@00))
        (< $Perm.No $k@45@00))
      (and
        (and (<= lo@10@00 k2@44@00) (< k2@44@00 hi@11@00))
        (< $Perm.No $k@45@00))
      (= (Seq_index ar@12@00 k1@44@00) (Seq_index ar@12@00 k2@44@00)))
    (= k1@44@00 k2@44@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@44@00 Int)) (!
  (=>
    (and (and (<= lo@10@00 k@44@00) (< k@44@00 hi@11@00)) (< $Perm.No $k@45@00))
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
      (and
        (and
          (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
        (< $Perm.No $k@45@00)))
    (=
      (Seq_index ar@12@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      r))
  :pattern ((inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@45@00
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
            (and
              (<= lo@10@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00)))
          $k@39@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
        (and
          (<= lo@10@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          (< (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00)))
      (<
        (ite
          (and
            (and
              (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
            (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
            (=
              r
              (Seq_index
                ar@12@00
                (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))))
          $k@45@00
          $Perm.No)
        $k@39@00)
      (<
        (ite
          (and
            (and
              (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
            (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
            (=
              r
              (Seq_index
                ar@12@00
                (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))))
          $k@45@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
  :pattern ((inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
  :pattern ((img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
  :pattern ((Seq_index
    ar@12@00
    (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)))
  :qid |qp.srp0|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
        (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
      (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
      (=
        r
        (Seq_index ar@12@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))))
    (=
      (-
        $k@45@00
        (ite
          (and
            (and
              (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
            (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
            (=
              r
              (Seq_index
                ar@12@00
                (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))))
          ($Perm.min
            (ite
              (and
                (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
                (and
                  (<=
                    lo@10@00
                    (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
                  (<
                    (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
                    hi@11@00)))
              $k@39@00
              $Perm.No)
            $k@45@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@48@00 ($Snap Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef2|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef1|)))
(assert (sum_array%precondition ($Snap.combine
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
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@45@00))
(assert (forall ((k@44@00 Int)) (!
  (=>
    (and (and (<= lo@10@00 k@44@00) (< k@44@00 hi@11@00)) (< $Perm.No $k@45@00))
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
      (and
        (and
          (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
        (< $Perm.No $k@45@00)))
    (=
      (Seq_index ar@12@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      r))
  :pattern ((inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef2|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef1|)))
(assert (and
  (<= lo@10@00 (+ i@9@00 1))
  (<= (+ i@9@00 1) hi@11@00)
  (forall ((ix@42@00 Int) (jx@43@00 Int)) (!
    (=>
      (and
        (>= ix@42@00 0)
        (and
          (< ix@42@00 (Seq_length ar@12@00))
          (and
            (>= jx@43@00 0)
            (and (< jx@43@00 (Seq_length ar@12@00)) (not (= ix@42@00 jx@43@00))))))
      (not (= (Seq_index ar@12@00 ix@42@00) (Seq_index ar@12@00 jx@43@00))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@16@12@16@116|))
  (forall ((k@44@00 Int)) (!
    (=>
      (and (<= lo@10@00 k@44@00) (< k@44@00 hi@11@00))
      (or (<= lo@10@00 k@44@00) (not (<= lo@10@00 k@44@00))))
    :pattern ((Seq_index ar@12@00 k@44@00))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
              (and
                (<= lo@10@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
                (< (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00)))
            $k@39@00
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
          (and
            (<= lo@10@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
            (< (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00)))
        (<
          (ite
            (and
              (and
                (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
                (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
              (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
              (=
                r
                (Seq_index
                  ar@12@00
                  (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))))
            $k@45@00
            $Perm.No)
          $k@39@00)
        (<
          (ite
            (and
              (and
                (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
                (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
              (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
              (=
                r
                (Seq_index
                  ar@12@00
                  (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))))
            $k@45@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
    :pattern ((inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
    :pattern ((img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
    :pattern ((Seq_index
      ar@12@00
      (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)))
    :qid |qp.srp0|))
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
    1) lo@10@00 hi@11@00 ar@12@00)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 9 | !(i@9@00 < hi@11@00)]
(assert (not (< i@9@00 hi@11@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@45@00))
(assert (forall ((k@44@00 Int)) (!
  (=>
    (and (and (<= lo@10@00 k@44@00) (< k@44@00 hi@11@00)) (< $Perm.No $k@45@00))
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
      (and
        (and
          (<= lo@10@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
          (< (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00))
        (< $Perm.No $k@45@00)))
    (=
      (Seq_index ar@12@00 (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      r))
  :pattern ((inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef2|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef1|)))
(assert (=>
  (< i@9@00 hi@11@00)
  (and
    (< i@9@00 hi@11@00)
    (<= lo@10@00 (+ i@9@00 1))
    (<= (+ i@9@00 1) hi@11@00)
    (forall ((ix@42@00 Int) (jx@43@00 Int)) (!
      (=>
        (and
          (>= ix@42@00 0)
          (and
            (< ix@42@00 (Seq_length ar@12@00))
            (and
              (>= jx@43@00 0)
              (and
                (< jx@43@00 (Seq_length ar@12@00))
                (not (= ix@42@00 jx@43@00))))))
        (not (= (Seq_index ar@12@00 ix@42@00) (Seq_index ar@12@00 jx@43@00))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@16@12@16@116|))
    (forall ((k@44@00 Int)) (!
      (=>
        (and (<= lo@10@00 k@44@00) (< k@44@00 hi@11@00))
        (or (<= lo@10@00 k@44@00) (not (<= lo@10@00 k@44@00))))
      :pattern ((Seq_index ar@12@00 k@44@00))
      :qid |Ref__Integer_value-aux|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
                (and
                  (<=
                    lo@10@00
                    (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
                  (<
                    (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
                    hi@11@00)))
              $k@39@00
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
            (and
              (<= lo@10@00 (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
              (< (inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r) hi@11@00)))
          (<
            (ite
              (and
                (and
                  (<=
                    lo@10@00
                    (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
                  (<
                    (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
                    hi@11@00))
                (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
                (=
                  r
                  (Seq_index
                    ar@12@00
                    (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))))
              $k@45@00
              $Perm.No)
            $k@39@00)
          (<
            (ite
              (and
                (and
                  (<=
                    lo@10@00
                    (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
                  (<
                    (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
                    hi@11@00))
                (img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)
                (=
                  r
                  (Seq_index
                    ar@12@00
                    (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))))
              $k@45@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@41@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      :pattern ((inv@40@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      :pattern ((img@47@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r))
      :pattern ((Seq_index
        ar@12@00
        (inv@46@00 s@$ i@9@00 lo@10@00 hi@11@00 ar@12@00 r)))
      :qid |qp.srp0|))
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
      1) lo@10@00 hi@11@00 ar@12@00))))
; Joined path conditions
(assert (or (not (< i@9@00 hi@11@00)) (< i@9@00 hi@11@00)))
(assert (=
  result@13@00
  (ite
    (< i@9@00 hi@11@00)
    (+
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) (Seq_index
        ar@12@00
        i@9@00))
      (sum_array ($Snap.combine
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
    0)))
(pop) ; 1
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
; ---------- FUNCTION count_array----------
(declare-fun i@14@00 () Int)
(declare-fun hi@15@00 () Int)
(declare-fun ar@16@00 () Seq<$Ref>)
(declare-fun v@17@00 () Int)
(declare-fun result@18@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@14@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] i <= hi
(assert (<= i@14@00 hi@15@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] hi <= |ar|
; [eval] |ar|
(assert (<= hi@15@00 (Seq_length ar@16@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { ar[ix], ar[jx] } ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx])
(declare-const ix@49@00 Int)
(declare-const jx@50@00 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx]
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 16 | !(ix@49@00 >= 0) | live]
; [else-branch: 16 | ix@49@00 >= 0 | live]
(push) ; 4
; [then-branch: 16 | !(ix@49@00 >= 0)]
(assert (not (>= ix@49@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | ix@49@00 >= 0]
(assert (>= ix@49@00 0))
; [eval] ix < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 17 | !(ix@49@00 < |ar@16@00|) | live]
; [else-branch: 17 | ix@49@00 < |ar@16@00| | live]
(push) ; 6
; [then-branch: 17 | !(ix@49@00 < |ar@16@00|)]
(assert (not (< ix@49@00 (Seq_length ar@16@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 17 | ix@49@00 < |ar@16@00|]
(assert (< ix@49@00 (Seq_length ar@16@00)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 18 | !(jx@50@00 >= 0) | live]
; [else-branch: 18 | jx@50@00 >= 0 | live]
(push) ; 8
; [then-branch: 18 | !(jx@50@00 >= 0)]
(assert (not (>= jx@50@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 18 | jx@50@00 >= 0]
(assert (>= jx@50@00 0))
; [eval] jx < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 19 | !(jx@50@00 < |ar@16@00|) | live]
; [else-branch: 19 | jx@50@00 < |ar@16@00| | live]
(push) ; 10
; [then-branch: 19 | !(jx@50@00 < |ar@16@00|)]
(assert (not (< jx@50@00 (Seq_length ar@16@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 19 | jx@50@00 < |ar@16@00|]
(assert (< jx@50@00 (Seq_length ar@16@00)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@50@00 (Seq_length ar@16@00)) (not (< jx@50@00 (Seq_length ar@16@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@50@00 0)
  (and
    (>= jx@50@00 0)
    (or
      (< jx@50@00 (Seq_length ar@16@00))
      (not (< jx@50@00 (Seq_length ar@16@00)))))))
(assert (or (>= jx@50@00 0) (not (>= jx@50@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@49@00 (Seq_length ar@16@00))
  (and
    (< ix@49@00 (Seq_length ar@16@00))
    (=>
      (>= jx@50@00 0)
      (and
        (>= jx@50@00 0)
        (or
          (< jx@50@00 (Seq_length ar@16@00))
          (not (< jx@50@00 (Seq_length ar@16@00))))))
    (or (>= jx@50@00 0) (not (>= jx@50@00 0))))))
(assert (or (< ix@49@00 (Seq_length ar@16@00)) (not (< ix@49@00 (Seq_length ar@16@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@49@00 0)
  (and
    (>= ix@49@00 0)
    (=>
      (< ix@49@00 (Seq_length ar@16@00))
      (and
        (< ix@49@00 (Seq_length ar@16@00))
        (=>
          (>= jx@50@00 0)
          (and
            (>= jx@50@00 0)
            (or
              (< jx@50@00 (Seq_length ar@16@00))
              (not (< jx@50@00 (Seq_length ar@16@00))))))
        (or (>= jx@50@00 0) (not (>= jx@50@00 0)))))
    (or
      (< ix@49@00 (Seq_length ar@16@00))
      (not (< ix@49@00 (Seq_length ar@16@00)))))))
(assert (or (>= ix@49@00 0) (not (>= ix@49@00 0))))
(push) ; 3
; [then-branch: 20 | ix@49@00 >= 0 && ix@49@00 < |ar@16@00| && jx@50@00 >= 0 && jx@50@00 < |ar@16@00| && ix@49@00 != jx@50@00 | live]
; [else-branch: 20 | !(ix@49@00 >= 0 && ix@49@00 < |ar@16@00| && jx@50@00 >= 0 && jx@50@00 < |ar@16@00| && ix@49@00 != jx@50@00) | live]
(push) ; 4
; [then-branch: 20 | ix@49@00 >= 0 && ix@49@00 < |ar@16@00| && jx@50@00 >= 0 && jx@50@00 < |ar@16@00| && ix@49@00 != jx@50@00]
(assert (and
  (>= ix@49@00 0)
  (and
    (< ix@49@00 (Seq_length ar@16@00))
    (and
      (>= jx@50@00 0)
      (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00)))))))
; [eval] ar[ix] != ar[jx]
; [eval] ar[ix]
; [eval] ar[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 20 | !(ix@49@00 >= 0 && ix@49@00 < |ar@16@00| && jx@50@00 >= 0 && jx@50@00 < |ar@16@00| && ix@49@00 != jx@50@00)]
(assert (not
  (and
    (>= ix@49@00 0)
    (and
      (< ix@49@00 (Seq_length ar@16@00))
      (and
        (>= jx@50@00 0)
        (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@49@00 0)
    (and
      (< ix@49@00 (Seq_length ar@16@00))
      (and
        (>= jx@50@00 0)
        (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00))))))
  (and
    (>= ix@49@00 0)
    (< ix@49@00 (Seq_length ar@16@00))
    (>= jx@50@00 0)
    (< jx@50@00 (Seq_length ar@16@00))
    (not (= ix@49@00 jx@50@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@49@00 0)
      (and
        (< ix@49@00 (Seq_length ar@16@00))
        (and
          (>= jx@50@00 0)
          (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00)))))))
  (and
    (>= ix@49@00 0)
    (and
      (< ix@49@00 (Seq_length ar@16@00))
      (and
        (>= jx@50@00 0)
        (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@49@00 Int) (jx@50@00 Int)) (!
  (and
    (=>
      (>= ix@49@00 0)
      (and
        (>= ix@49@00 0)
        (=>
          (< ix@49@00 (Seq_length ar@16@00))
          (and
            (< ix@49@00 (Seq_length ar@16@00))
            (=>
              (>= jx@50@00 0)
              (and
                (>= jx@50@00 0)
                (or
                  (< jx@50@00 (Seq_length ar@16@00))
                  (not (< jx@50@00 (Seq_length ar@16@00))))))
            (or (>= jx@50@00 0) (not (>= jx@50@00 0)))))
        (or
          (< ix@49@00 (Seq_length ar@16@00))
          (not (< ix@49@00 (Seq_length ar@16@00))))))
    (or (>= ix@49@00 0) (not (>= ix@49@00 0)))
    (=>
      (and
        (>= ix@49@00 0)
        (and
          (< ix@49@00 (Seq_length ar@16@00))
          (and
            (>= jx@50@00 0)
            (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00))))))
      (and
        (>= ix@49@00 0)
        (< ix@49@00 (Seq_length ar@16@00))
        (>= jx@50@00 0)
        (< jx@50@00 (Seq_length ar@16@00))
        (not (= ix@49@00 jx@50@00))))
    (or
      (not
        (and
          (>= ix@49@00 0)
          (and
            (< ix@49@00 (Seq_length ar@16@00))
            (and
              (>= jx@50@00 0)
              (and
                (< jx@50@00 (Seq_length ar@16@00))
                (not (= ix@49@00 jx@50@00)))))))
      (and
        (>= ix@49@00 0)
        (and
          (< ix@49@00 (Seq_length ar@16@00))
          (and
            (>= jx@50@00 0)
            (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00))))))))
  :pattern ((Seq_index ar@16@00 ix@49@00) (Seq_index ar@16@00 jx@50@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@52@12@52@116-aux|)))
(assert (forall ((ix@49@00 Int) (jx@50@00 Int)) (!
  (=>
    (and
      (>= ix@49@00 0)
      (and
        (< ix@49@00 (Seq_length ar@16@00))
        (and
          (>= jx@50@00 0)
          (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00))))))
    (not (= (Seq_index ar@16@00 ix@49@00) (Seq_index ar@16@00 jx@50@00))))
  :pattern ((Seq_index ar@16@00 ix@49@00) (Seq_index ar@16@00 jx@50@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@52@12@52@116|)))
(declare-const k@51@00 Int)
(push) ; 2
; [eval] 0 <= k && k < hi
; [eval] 0 <= k
(push) ; 3
; [then-branch: 21 | !(0 <= k@51@00) | live]
; [else-branch: 21 | 0 <= k@51@00 | live]
(push) ; 4
; [then-branch: 21 | !(0 <= k@51@00)]
(assert (not (<= 0 k@51@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 21 | 0 <= k@51@00]
(assert (<= 0 k@51@00))
; [eval] k < hi
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@51@00) (not (<= 0 k@51@00))))
(assert (and (<= 0 k@51@00) (< k@51@00 hi@15@00)))
; [eval] ar[k]
(push) ; 3
(assert (not (>= k@51@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@51@00 (Seq_length ar@16@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@52@00 $Perm)
(assert ($Perm.isReadVar $k@52@00))
(pop) ; 2
(declare-fun inv@53@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@54@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@52@00))
; Nested auxiliary terms: non-globals
(assert (forall ((k@51@00 Int)) (!
  (=>
    (and (<= 0 k@51@00) (< k@51@00 hi@15@00))
    (or (<= 0 k@51@00) (not (<= 0 k@51@00))))
  :pattern ((Seq_index ar@16@00 k@51@00))
  :qid |Ref__Integer_value-aux|)))
(push) ; 2
(assert (not (forall ((k@51@00 Int)) (!
  (=>
    (and (<= 0 k@51@00) (< k@51@00 hi@15@00))
    (or (= $k@52@00 $Perm.No) (< $Perm.No $k@52@00)))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@51@00 Int) (k2@51@00 Int)) (!
  (=>
    (and
      (and (and (<= 0 k1@51@00) (< k1@51@00 hi@15@00)) (< $Perm.No $k@52@00))
      (and (and (<= 0 k2@51@00) (< k2@51@00 hi@15@00)) (< $Perm.No $k@52@00))
      (= (Seq_index ar@16@00 k1@51@00) (Seq_index ar@16@00 k2@51@00)))
    (= k1@51@00 k2@51@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@51@00 Int)) (!
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
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
      (and
        (and
          (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (< (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
        (< $Perm.No $k@52@00)))
    (=
      (Seq_index ar@16@00 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      r))
  :pattern ((inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((k@51@00 Int)) (!
  (<= $Perm.No $k@52@00)
  :pattern ((Seq_index ar@16@00 k@51@00))
  :qid |Ref__Integer_value-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((k@51@00 Int)) (!
  (<= $k@52@00 $Perm.Write)
  :pattern ((Seq_index ar@16@00 k@51@00))
  :qid |Ref__Integer_value-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((k@51@00 Int)) (!
  (=>
    (and (and (<= 0 k@51@00) (< k@51@00 hi@15@00)) (< $Perm.No $k@52@00))
    (not (= (Seq_index ar@16@00 k@51@00) $Ref.null)))
  :pattern ((Seq_index ar@16@00 k@51@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
      (and
        (and
          (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (< (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
        (< $Perm.No $k@52@00)))
    (=
      (Seq_index ar@16@00 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      r))
  :pattern ((inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((k@51@00 Int)) (!
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
  :qid |quant-u-25|)))
(assert (forall ((k@51@00 Int)) (!
  (<= $Perm.No $k@52@00)
  :pattern ((Seq_index ar@16@00 k@51@00))
  :qid |Ref__Integer_value-permAtLeastZero|)))
(assert (forall ((k@51@00 Int)) (!
  (<= $k@52@00 $Perm.Write)
  :pattern ((Seq_index ar@16@00 k@51@00))
  :qid |Ref__Integer_value-permAtMostOne|)))
(assert (forall ((k@51@00 Int)) (!
  (=>
    (and (and (<= 0 k@51@00) (< k@51@00 hi@15@00)) (< $Perm.No $k@52@00))
    (not (= (Seq_index ar@16@00 k@51@00) $Ref.null)))
  :pattern ((Seq_index ar@16@00 k@51@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert ($Perm.isReadVar $k@52@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 i@14@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= i@14@00 hi@15@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= hi@15@00 (Seq_length ar@16@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (forall ((ix@49@00 Int) (jx@50@00 Int)) (!
  (and
    (=>
      (>= ix@49@00 0)
      (and
        (>= ix@49@00 0)
        (=>
          (< ix@49@00 (Seq_length ar@16@00))
          (and
            (< ix@49@00 (Seq_length ar@16@00))
            (=>
              (>= jx@50@00 0)
              (and
                (>= jx@50@00 0)
                (or
                  (< jx@50@00 (Seq_length ar@16@00))
                  (not (< jx@50@00 (Seq_length ar@16@00))))))
            (or (>= jx@50@00 0) (not (>= jx@50@00 0)))))
        (or
          (< ix@49@00 (Seq_length ar@16@00))
          (not (< ix@49@00 (Seq_length ar@16@00))))))
    (or (>= ix@49@00 0) (not (>= ix@49@00 0)))
    (=>
      (and
        (>= ix@49@00 0)
        (and
          (< ix@49@00 (Seq_length ar@16@00))
          (and
            (>= jx@50@00 0)
            (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00))))))
      (and
        (>= ix@49@00 0)
        (< ix@49@00 (Seq_length ar@16@00))
        (>= jx@50@00 0)
        (< jx@50@00 (Seq_length ar@16@00))
        (not (= ix@49@00 jx@50@00))))
    (or
      (not
        (and
          (>= ix@49@00 0)
          (and
            (< ix@49@00 (Seq_length ar@16@00))
            (and
              (>= jx@50@00 0)
              (and
                (< jx@50@00 (Seq_length ar@16@00))
                (not (= ix@49@00 jx@50@00)))))))
      (and
        (>= ix@49@00 0)
        (and
          (< ix@49@00 (Seq_length ar@16@00))
          (and
            (>= jx@50@00 0)
            (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00))))))))
  :pattern ((Seq_index ar@16@00 ix@49@00) (Seq_index ar@16@00 jx@50@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@52@12@52@116-aux|)))
(assert (forall ((ix@49@00 Int) (jx@50@00 Int)) (!
  (=>
    (and
      (>= ix@49@00 0)
      (and
        (< ix@49@00 (Seq_length ar@16@00))
        (and
          (>= jx@50@00 0)
          (and (< jx@50@00 (Seq_length ar@16@00)) (not (= ix@49@00 jx@50@00))))))
    (not (= (Seq_index ar@16@00 ix@49@00) (Seq_index ar@16@00 jx@50@00))))
  :pattern ((Seq_index ar@16@00 ix@49@00) (Seq_index ar@16@00 jx@50@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@52@12@52@116|)))
(assert (forall ((k@51@00 Int)) (!
  (=>
    (and (<= 0 k@51@00) (< k@51@00 hi@15@00))
    (or (<= 0 k@51@00) (not (<= 0 k@51@00))))
  :pattern ((Seq_index ar@16@00 k@51@00))
  :qid |Ref__Integer_value-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i < hi ? (ar[i].Ref__Integer_value == v ? 1 : 0) + count_array(i + 1, hi, ar, v) : 0)
; [eval] i < hi
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@14@00 hi@15@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@14@00 hi@15@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | i@14@00 < hi@15@00 | live]
; [else-branch: 22 | !(i@14@00 < hi@15@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 22 | i@14@00 < hi@15@00]
(assert (< i@14@00 hi@15@00))
; [eval] (ar[i].Ref__Integer_value == v ? 1 : 0) + count_array(i + 1, hi, ar, v)
; [eval] (ar[i].Ref__Integer_value == v ? 1 : 0)
; [eval] ar[i].Ref__Integer_value == v
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@14@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@14@00 (Seq_length ar@16@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (ite
  (and
    (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index ar@16@00 i@14@00))
    (and
      (<=
        0
        (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
          ar@16@00
          i@14@00)))
      (<
        (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
          ar@16@00
          i@14@00))
        hi@15@00)))
  (< $Perm.No $k@52@00)
  false)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
      ar@16@00
      i@14@00))
    v@17@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
    ar@16@00
    i@14@00))
  v@17@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | Lookup(Ref__Integer_value, Second:(Second:(Second:(Second:(s@$)))), ar@16@00[i@14@00]) == v@17@00 | live]
; [else-branch: 23 | Lookup(Ref__Integer_value, Second:(Second:(Second:(Second:(s@$)))), ar@16@00[i@14@00]) != v@17@00 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | Lookup(Ref__Integer_value, Second:(Second:(Second:(Second:(s@$)))), ar@16@00[i@14@00]) == v@17@00]
(assert (=
  ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
    ar@16@00
    i@14@00))
  v@17@00))
(pop) ; 5
(push) ; 5
; [else-branch: 23 | Lookup(Ref__Integer_value, Second:(Second:(Second:(Second:(s@$)))), ar@16@00[i@14@00]) != v@17@00]
(assert (not
  (=
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
      ar@16@00
      i@14@00))
    v@17@00)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
        ar@16@00
        i@14@00))
      v@17@00))
  (=
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
      ar@16@00
      i@14@00))
    v@17@00)))
; [eval] count_array(i + 1, hi, ar, v)
; [eval] i + 1
(push) ; 4
; [eval] 0 <= i
(push) ; 5
(assert (not (<= 0 (+ i@14@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ i@14@00 1)))
; [eval] i <= hi
(push) ; 5
(assert (not (<= (+ i@14@00 1) hi@15@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@14@00 1) hi@15@00))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall ix: Int, jx: Int ::ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx])
(declare-const ix@55@00 Int)
(declare-const jx@56@00 Int)
(push) ; 5
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx]
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx)))
; [eval] ix >= 0
(push) ; 6
; [then-branch: 24 | !(ix@55@00 >= 0) | live]
; [else-branch: 24 | ix@55@00 >= 0 | live]
(push) ; 7
; [then-branch: 24 | !(ix@55@00 >= 0)]
(assert (not (>= ix@55@00 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 24 | ix@55@00 >= 0]
(assert (>= ix@55@00 0))
; [eval] ix < |ar|
; [eval] |ar|
(push) ; 8
; [then-branch: 25 | !(ix@55@00 < |ar@16@00|) | live]
; [else-branch: 25 | ix@55@00 < |ar@16@00| | live]
(push) ; 9
; [then-branch: 25 | !(ix@55@00 < |ar@16@00|)]
(assert (not (< ix@55@00 (Seq_length ar@16@00))))
(pop) ; 9
(push) ; 9
; [else-branch: 25 | ix@55@00 < |ar@16@00|]
(assert (< ix@55@00 (Seq_length ar@16@00)))
; [eval] jx >= 0
(push) ; 10
; [then-branch: 26 | !(jx@56@00 >= 0) | live]
; [else-branch: 26 | jx@56@00 >= 0 | live]
(push) ; 11
; [then-branch: 26 | !(jx@56@00 >= 0)]
(assert (not (>= jx@56@00 0)))
(pop) ; 11
(push) ; 11
; [else-branch: 26 | jx@56@00 >= 0]
(assert (>= jx@56@00 0))
; [eval] jx < |ar|
; [eval] |ar|
(push) ; 12
; [then-branch: 27 | !(jx@56@00 < |ar@16@00|) | live]
; [else-branch: 27 | jx@56@00 < |ar@16@00| | live]
(push) ; 13
; [then-branch: 27 | !(jx@56@00 < |ar@16@00|)]
(assert (not (< jx@56@00 (Seq_length ar@16@00))))
(pop) ; 13
(push) ; 13
; [else-branch: 27 | jx@56@00 < |ar@16@00|]
(assert (< jx@56@00 (Seq_length ar@16@00)))
; [eval] ix != jx
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (< jx@56@00 (Seq_length ar@16@00)) (not (< jx@56@00 (Seq_length ar@16@00)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@56@00 0)
  (and
    (>= jx@56@00 0)
    (or
      (< jx@56@00 (Seq_length ar@16@00))
      (not (< jx@56@00 (Seq_length ar@16@00)))))))
(assert (or (>= jx@56@00 0) (not (>= jx@56@00 0))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@55@00 (Seq_length ar@16@00))
  (and
    (< ix@55@00 (Seq_length ar@16@00))
    (=>
      (>= jx@56@00 0)
      (and
        (>= jx@56@00 0)
        (or
          (< jx@56@00 (Seq_length ar@16@00))
          (not (< jx@56@00 (Seq_length ar@16@00))))))
    (or (>= jx@56@00 0) (not (>= jx@56@00 0))))))
(assert (or (< ix@55@00 (Seq_length ar@16@00)) (not (< ix@55@00 (Seq_length ar@16@00)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@55@00 0)
  (and
    (>= ix@55@00 0)
    (=>
      (< ix@55@00 (Seq_length ar@16@00))
      (and
        (< ix@55@00 (Seq_length ar@16@00))
        (=>
          (>= jx@56@00 0)
          (and
            (>= jx@56@00 0)
            (or
              (< jx@56@00 (Seq_length ar@16@00))
              (not (< jx@56@00 (Seq_length ar@16@00))))))
        (or (>= jx@56@00 0) (not (>= jx@56@00 0)))))
    (or
      (< ix@55@00 (Seq_length ar@16@00))
      (not (< ix@55@00 (Seq_length ar@16@00)))))))
(assert (or (>= ix@55@00 0) (not (>= ix@55@00 0))))
(push) ; 6
; [then-branch: 28 | ix@55@00 >= 0 && ix@55@00 < |ar@16@00| && jx@56@00 >= 0 && jx@56@00 < |ar@16@00| && ix@55@00 != jx@56@00 | live]
; [else-branch: 28 | !(ix@55@00 >= 0 && ix@55@00 < |ar@16@00| && jx@56@00 >= 0 && jx@56@00 < |ar@16@00| && ix@55@00 != jx@56@00) | live]
(push) ; 7
; [then-branch: 28 | ix@55@00 >= 0 && ix@55@00 < |ar@16@00| && jx@56@00 >= 0 && jx@56@00 < |ar@16@00| && ix@55@00 != jx@56@00]
(assert (and
  (>= ix@55@00 0)
  (and
    (< ix@55@00 (Seq_length ar@16@00))
    (and
      (>= jx@56@00 0)
      (and (< jx@56@00 (Seq_length ar@16@00)) (not (= ix@55@00 jx@56@00)))))))
; [eval] ar[ix] != ar[jx]
; [eval] ar[ix]
; [eval] ar[jx]
(pop) ; 7
(push) ; 7
; [else-branch: 28 | !(ix@55@00 >= 0 && ix@55@00 < |ar@16@00| && jx@56@00 >= 0 && jx@56@00 < |ar@16@00| && ix@55@00 != jx@56@00)]
(assert (not
  (and
    (>= ix@55@00 0)
    (and
      (< ix@55@00 (Seq_length ar@16@00))
      (and
        (>= jx@56@00 0)
        (and (< jx@56@00 (Seq_length ar@16@00)) (not (= ix@55@00 jx@56@00))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (>= ix@55@00 0)
    (and
      (< ix@55@00 (Seq_length ar@16@00))
      (and
        (>= jx@56@00 0)
        (and (< jx@56@00 (Seq_length ar@16@00)) (not (= ix@55@00 jx@56@00))))))
  (and
    (>= ix@55@00 0)
    (< ix@55@00 (Seq_length ar@16@00))
    (>= jx@56@00 0)
    (< jx@56@00 (Seq_length ar@16@00))
    (not (= ix@55@00 jx@56@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@55@00 0)
      (and
        (< ix@55@00 (Seq_length ar@16@00))
        (and
          (>= jx@56@00 0)
          (and (< jx@56@00 (Seq_length ar@16@00)) (not (= ix@55@00 jx@56@00)))))))
  (and
    (>= ix@55@00 0)
    (and
      (< ix@55@00 (Seq_length ar@16@00))
      (and
        (>= jx@56@00 0)
        (and (< jx@56@00 (Seq_length ar@16@00)) (not (= ix@55@00 jx@56@00))))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((ix@55@00 Int) (jx@56@00 Int)) (!
  (=>
    (and
      (>= ix@55@00 0)
      (and
        (< ix@55@00 (Seq_length ar@16@00))
        (and
          (>= jx@56@00 0)
          (and (< jx@56@00 (Seq_length ar@16@00)) (not (= ix@55@00 jx@56@00))))))
    (not (= (Seq_index ar@16@00 ix@55@00) (Seq_index ar@16@00 jx@56@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@52@12@52@116|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((ix@55@00 Int) (jx@56@00 Int)) (!
  (=>
    (and
      (>= ix@55@00 0)
      (and
        (< ix@55@00 (Seq_length ar@16@00))
        (and
          (>= jx@56@00 0)
          (and (< jx@56@00 (Seq_length ar@16@00)) (not (= ix@55@00 jx@56@00))))))
    (not (= (Seq_index ar@16@00 ix@55@00) (Seq_index ar@16@00 jx@56@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@52@12@52@116|)))
(declare-const k@57@00 Int)
(push) ; 5
; [eval] 0 <= k && k < hi
; [eval] 0 <= k
(push) ; 6
; [then-branch: 29 | !(0 <= k@57@00) | live]
; [else-branch: 29 | 0 <= k@57@00 | live]
(push) ; 7
; [then-branch: 29 | !(0 <= k@57@00)]
(assert (not (<= 0 k@57@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 29 | 0 <= k@57@00]
(assert (<= 0 k@57@00))
; [eval] k < hi
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@57@00) (not (<= 0 k@57@00))))
(assert (and (<= 0 k@57@00) (< k@57@00 hi@15@00)))
(declare-const $k@58@00 $Perm)
(assert ($Perm.isReadVar $k@58@00))
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@57@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@57@00 (Seq_length ar@16@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@59@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@60@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@58@00))
; Nested auxiliary terms: non-globals
(assert (forall ((k@57@00 Int)) (!
  (=>
    (and (<= 0 k@57@00) (< k@57@00 hi@15@00))
    (or (<= 0 k@57@00) (not (<= 0 k@57@00))))
  :pattern ((Seq_index ar@16@00 k@57@00))
  :qid |Ref__Integer_value-aux|)))
(push) ; 5
(assert (not (forall ((k@57@00 Int)) (!
  (=>
    (and (<= 0 k@57@00) (< k@57@00 hi@15@00))
    (or (= $k@58@00 $Perm.No) (< $Perm.No $k@58@00)))
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@57@00 Int) (k2@57@00 Int)) (!
  (=>
    (and
      (and (and (<= 0 k1@57@00) (< k1@57@00 hi@15@00)) (< $Perm.No $k@58@00))
      (and (and (<= 0 k2@57@00) (< k2@57@00 hi@15@00)) (< $Perm.No $k@58@00))
      (= (Seq_index ar@16@00 k1@57@00) (Seq_index ar@16@00 k2@57@00)))
    (= k1@57@00 k2@57@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@57@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
      (and
        (and
          (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
        (< $Perm.No $k@58@00)))
    (=
      (Seq_index ar@16@00 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      r))
  :pattern ((inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@58@00
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
            (and
              (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00)))
          $k@52@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
        (and
          (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (< (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00)))
      (<
        (ite
          (and
            (and
              (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
            (=
              r
              (Seq_index
                ar@16@00
                (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))))
          $k@58@00
          $Perm.No)
        $k@52@00)
      (<
        (ite
          (and
            (and
              (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
            (=
              r
              (Seq_index
                ar@16@00
                (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))))
          $k@58@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
  :pattern ((inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
  :pattern ((img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
  :pattern ((Seq_index
    ar@16@00
    (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)))
  :qid |qp.srp3|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
        (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
      (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
      (=
        r
        (Seq_index ar@16@00 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))))
    (=
      (-
        $k@58@00
        (ite
          (and
            (and
              (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
            (=
              r
              (Seq_index
                ar@16@00
                (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))))
          ($Perm.min
            (ite
              (and
                (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
                (and
                  (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
                  (<
                    (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
                    hi@15@00)))
              $k@52@00
              $Perm.No)
            $k@58@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@61@00 ($Snap Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef4|)))
(assert (count_array%precondition ($Snap.combine
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
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@58@00))
(assert (forall ((k@57@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
      (and
        (and
          (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
        (< $Perm.No $k@58@00)))
    (=
      (Seq_index ar@16@00 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      r))
  :pattern ((inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef4|)))
(assert (and
  (<= 0 (+ i@14@00 1))
  (<= (+ i@14@00 1) hi@15@00)
  (forall ((ix@55@00 Int) (jx@56@00 Int)) (!
    (=>
      (and
        (>= ix@55@00 0)
        (and
          (< ix@55@00 (Seq_length ar@16@00))
          (and
            (>= jx@56@00 0)
            (and (< jx@56@00 (Seq_length ar@16@00)) (not (= ix@55@00 jx@56@00))))))
      (not (= (Seq_index ar@16@00 ix@55@00) (Seq_index ar@16@00 jx@56@00))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@52@12@52@116|))
  (forall ((k@57@00 Int)) (!
    (=>
      (and (<= 0 k@57@00) (< k@57@00 hi@15@00))
      (or (<= 0 k@57@00) (not (<= 0 k@57@00))))
    :pattern ((Seq_index ar@16@00 k@57@00))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
              (and
                (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
                (< (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00)))
            $k@52@00
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
          (and
            (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
            (< (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00)))
        (<
          (ite
            (and
              (and
                (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
                (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
              (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
              (=
                r
                (Seq_index
                  ar@16@00
                  (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))))
            $k@58@00
            $Perm.No)
          $k@52@00)
        (<
          (ite
            (and
              (and
                (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
                (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
              (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
              (=
                r
                (Seq_index
                  ar@16@00
                  (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))))
            $k@58@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
    :pattern ((inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
    :pattern ((img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
    :pattern ((Seq_index
      ar@16@00
      (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)))
    :qid |qp.srp3|))
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
    1) hi@15@00 ar@16@00 v@17@00)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 22 | !(i@14@00 < hi@15@00)]
(assert (not (< i@14@00 hi@15@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@58@00))
(assert (forall ((k@57@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
      (and
        (and
          (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (< (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
        (< $Perm.No $k@58@00)))
    (=
      (Seq_index ar@16@00 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      r))
  :pattern ((inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef4|)))
(assert (=>
  (< i@14@00 hi@15@00)
  (and
    (< i@14@00 hi@15@00)
    (or
      (not
        (=
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
            ar@16@00
            i@14@00))
          v@17@00))
      (=
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
          ar@16@00
          i@14@00))
        v@17@00))
    (<= 0 (+ i@14@00 1))
    (<= (+ i@14@00 1) hi@15@00)
    (forall ((ix@55@00 Int) (jx@56@00 Int)) (!
      (=>
        (and
          (>= ix@55@00 0)
          (and
            (< ix@55@00 (Seq_length ar@16@00))
            (and
              (>= jx@56@00 0)
              (and
                (< jx@56@00 (Seq_length ar@16@00))
                (not (= ix@55@00 jx@56@00))))))
        (not (= (Seq_index ar@16@00 ix@55@00) (Seq_index ar@16@00 jx@56@00))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@52@12@52@116|))
    (forall ((k@57@00 Int)) (!
      (=>
        (and (<= 0 k@57@00) (< k@57@00 hi@15@00))
        (or (<= 0 k@57@00) (not (<= 0 k@57@00))))
      :pattern ((Seq_index ar@16@00 k@57@00))
      :qid |Ref__Integer_value-aux|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
                (and
                  (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
                  (<
                    (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
                    hi@15@00)))
              $k@52@00
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
            (and
              (<= 0 (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00)))
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
                  (<
                    (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
                    hi@15@00))
                (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
                (=
                  r
                  (Seq_index
                    ar@16@00
                    (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))))
              $k@58@00
              $Perm.No)
            $k@52@00)
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
                  (<
                    (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
                    hi@15@00))
                (img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
                (=
                  r
                  (Seq_index
                    ar@16@00
                    (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))))
              $k@58@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@54@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      :pattern ((inv@53@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      :pattern ((img@60@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      :pattern ((Seq_index
        ar@16@00
        (inv@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)))
      :qid |qp.srp3|))
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
      1) hi@15@00 ar@16@00 v@17@00))))
; Joined path conditions
(assert (or (not (< i@14@00 hi@15@00)) (< i@14@00 hi@15@00)))
(assert (=
  result@18@00
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
      (count_array ($Snap.combine
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
    0)))
(pop) ; 1
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
; ---------- FUNCTION count_square----------
(declare-fun i@19@00 () Int)
(declare-fun lo@20@00 () Int)
(declare-fun hi@21@00 () Int)
(declare-fun step@22@00 () Int)
(declare-fun min@23@00 () Int)
(declare-fun max@24@00 () Int)
(declare-fun ar@25@00 () Seq<$Ref>)
(declare-fun v@26@00 () Int)
(declare-fun result@27@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= lo
(assert (<= 0 lo@20@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] lo <= hi
(assert (<= lo@20@00 hi@21@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] hi <= step
(assert (<= hi@21@00 step@22@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] step > 0
(assert (> step@22@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 0 <= min
(assert (<= 0 min@23@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] min <= i
(assert (<= min@23@00 i@19@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] i <= max
(assert (<= i@19@00 max@24@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
; [eval] max <= |ar|
; [eval] |ar|
(assert (<= max@24@00 (Seq_length ar@25@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { ar[ix], ar[jx] } ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx])
(declare-const ix@62@00 Int)
(declare-const jx@63@00 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx]
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 30 | !(ix@62@00 >= 0) | live]
; [else-branch: 30 | ix@62@00 >= 0 | live]
(push) ; 4
; [then-branch: 30 | !(ix@62@00 >= 0)]
(assert (not (>= ix@62@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 30 | ix@62@00 >= 0]
(assert (>= ix@62@00 0))
; [eval] ix < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 31 | !(ix@62@00 < |ar@25@00|) | live]
; [else-branch: 31 | ix@62@00 < |ar@25@00| | live]
(push) ; 6
; [then-branch: 31 | !(ix@62@00 < |ar@25@00|)]
(assert (not (< ix@62@00 (Seq_length ar@25@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 31 | ix@62@00 < |ar@25@00|]
(assert (< ix@62@00 (Seq_length ar@25@00)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 32 | !(jx@63@00 >= 0) | live]
; [else-branch: 32 | jx@63@00 >= 0 | live]
(push) ; 8
; [then-branch: 32 | !(jx@63@00 >= 0)]
(assert (not (>= jx@63@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 32 | jx@63@00 >= 0]
(assert (>= jx@63@00 0))
; [eval] jx < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 33 | !(jx@63@00 < |ar@25@00|) | live]
; [else-branch: 33 | jx@63@00 < |ar@25@00| | live]
(push) ; 10
; [then-branch: 33 | !(jx@63@00 < |ar@25@00|)]
(assert (not (< jx@63@00 (Seq_length ar@25@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 33 | jx@63@00 < |ar@25@00|]
(assert (< jx@63@00 (Seq_length ar@25@00)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@63@00 (Seq_length ar@25@00)) (not (< jx@63@00 (Seq_length ar@25@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@63@00 0)
  (and
    (>= jx@63@00 0)
    (or
      (< jx@63@00 (Seq_length ar@25@00))
      (not (< jx@63@00 (Seq_length ar@25@00)))))))
(assert (or (>= jx@63@00 0) (not (>= jx@63@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@62@00 (Seq_length ar@25@00))
  (and
    (< ix@62@00 (Seq_length ar@25@00))
    (=>
      (>= jx@63@00 0)
      (and
        (>= jx@63@00 0)
        (or
          (< jx@63@00 (Seq_length ar@25@00))
          (not (< jx@63@00 (Seq_length ar@25@00))))))
    (or (>= jx@63@00 0) (not (>= jx@63@00 0))))))
(assert (or (< ix@62@00 (Seq_length ar@25@00)) (not (< ix@62@00 (Seq_length ar@25@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@62@00 0)
  (and
    (>= ix@62@00 0)
    (=>
      (< ix@62@00 (Seq_length ar@25@00))
      (and
        (< ix@62@00 (Seq_length ar@25@00))
        (=>
          (>= jx@63@00 0)
          (and
            (>= jx@63@00 0)
            (or
              (< jx@63@00 (Seq_length ar@25@00))
              (not (< jx@63@00 (Seq_length ar@25@00))))))
        (or (>= jx@63@00 0) (not (>= jx@63@00 0)))))
    (or
      (< ix@62@00 (Seq_length ar@25@00))
      (not (< ix@62@00 (Seq_length ar@25@00)))))))
(assert (or (>= ix@62@00 0) (not (>= ix@62@00 0))))
(push) ; 3
; [then-branch: 34 | ix@62@00 >= 0 && ix@62@00 < |ar@25@00| && jx@63@00 >= 0 && jx@63@00 < |ar@25@00| && ix@62@00 != jx@63@00 | live]
; [else-branch: 34 | !(ix@62@00 >= 0 && ix@62@00 < |ar@25@00| && jx@63@00 >= 0 && jx@63@00 < |ar@25@00| && ix@62@00 != jx@63@00) | live]
(push) ; 4
; [then-branch: 34 | ix@62@00 >= 0 && ix@62@00 < |ar@25@00| && jx@63@00 >= 0 && jx@63@00 < |ar@25@00| && ix@62@00 != jx@63@00]
(assert (and
  (>= ix@62@00 0)
  (and
    (< ix@62@00 (Seq_length ar@25@00))
    (and
      (>= jx@63@00 0)
      (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00)))))))
; [eval] ar[ix] != ar[jx]
; [eval] ar[ix]
; [eval] ar[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 34 | !(ix@62@00 >= 0 && ix@62@00 < |ar@25@00| && jx@63@00 >= 0 && jx@63@00 < |ar@25@00| && ix@62@00 != jx@63@00)]
(assert (not
  (and
    (>= ix@62@00 0)
    (and
      (< ix@62@00 (Seq_length ar@25@00))
      (and
        (>= jx@63@00 0)
        (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@62@00 0)
    (and
      (< ix@62@00 (Seq_length ar@25@00))
      (and
        (>= jx@63@00 0)
        (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00))))))
  (and
    (>= ix@62@00 0)
    (< ix@62@00 (Seq_length ar@25@00))
    (>= jx@63@00 0)
    (< jx@63@00 (Seq_length ar@25@00))
    (not (= ix@62@00 jx@63@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@62@00 0)
      (and
        (< ix@62@00 (Seq_length ar@25@00))
        (and
          (>= jx@63@00 0)
          (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00)))))))
  (and
    (>= ix@62@00 0)
    (and
      (< ix@62@00 (Seq_length ar@25@00))
      (and
        (>= jx@63@00 0)
        (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@62@00 Int) (jx@63@00 Int)) (!
  (and
    (=>
      (>= ix@62@00 0)
      (and
        (>= ix@62@00 0)
        (=>
          (< ix@62@00 (Seq_length ar@25@00))
          (and
            (< ix@62@00 (Seq_length ar@25@00))
            (=>
              (>= jx@63@00 0)
              (and
                (>= jx@63@00 0)
                (or
                  (< jx@63@00 (Seq_length ar@25@00))
                  (not (< jx@63@00 (Seq_length ar@25@00))))))
            (or (>= jx@63@00 0) (not (>= jx@63@00 0)))))
        (or
          (< ix@62@00 (Seq_length ar@25@00))
          (not (< ix@62@00 (Seq_length ar@25@00))))))
    (or (>= ix@62@00 0) (not (>= ix@62@00 0)))
    (=>
      (and
        (>= ix@62@00 0)
        (and
          (< ix@62@00 (Seq_length ar@25@00))
          (and
            (>= jx@63@00 0)
            (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00))))))
      (and
        (>= ix@62@00 0)
        (< ix@62@00 (Seq_length ar@25@00))
        (>= jx@63@00 0)
        (< jx@63@00 (Seq_length ar@25@00))
        (not (= ix@62@00 jx@63@00))))
    (or
      (not
        (and
          (>= ix@62@00 0)
          (and
            (< ix@62@00 (Seq_length ar@25@00))
            (and
              (>= jx@63@00 0)
              (and
                (< jx@63@00 (Seq_length ar@25@00))
                (not (= ix@62@00 jx@63@00)))))))
      (and
        (>= ix@62@00 0)
        (and
          (< ix@62@00 (Seq_length ar@25@00))
          (and
            (>= jx@63@00 0)
            (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00))))))))
  :pattern ((Seq_index ar@25@00 ix@62@00) (Seq_index ar@25@00 jx@63@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@36@12@36@116-aux|)))
(assert (forall ((ix@62@00 Int) (jx@63@00 Int)) (!
  (=>
    (and
      (>= ix@62@00 0)
      (and
        (< ix@62@00 (Seq_length ar@25@00))
        (and
          (>= jx@63@00 0)
          (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00))))))
    (not (= (Seq_index ar@25@00 ix@62@00) (Seq_index ar@25@00 jx@63@00))))
  :pattern ((Seq_index ar@25@00 ix@62@00) (Seq_index ar@25@00 jx@63@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@36@12@36@116|)))
(declare-const k@64@00 Int)
(push) ; 2
; [eval] min <= k && (k < max && (lo <= k % step && k % step < hi))
; [eval] min <= k
(push) ; 3
; [then-branch: 35 | !(min@23@00 <= k@64@00) | live]
; [else-branch: 35 | min@23@00 <= k@64@00 | live]
(push) ; 4
; [then-branch: 35 | !(min@23@00 <= k@64@00)]
(assert (not (<= min@23@00 k@64@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 35 | min@23@00 <= k@64@00]
(assert (<= min@23@00 k@64@00))
; [eval] k < max
(push) ; 5
; [then-branch: 36 | !(k@64@00 < max@24@00) | live]
; [else-branch: 36 | k@64@00 < max@24@00 | live]
(push) ; 6
; [then-branch: 36 | !(k@64@00 < max@24@00)]
(assert (not (< k@64@00 max@24@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 36 | k@64@00 < max@24@00]
(assert (< k@64@00 max@24@00))
; [eval] lo <= k % step
; [eval] k % step
(push) ; 7
(assert (not (not (= step@22@00 0))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 37 | !(lo@20@00 <= k@64@00 % step@22@00) | live]
; [else-branch: 37 | lo@20@00 <= k@64@00 % step@22@00 | live]
(push) ; 8
; [then-branch: 37 | !(lo@20@00 <= k@64@00 % step@22@00)]
(assert (not (<= lo@20@00 (mod k@64@00 step@22@00))))
(pop) ; 8
(push) ; 8
; [else-branch: 37 | lo@20@00 <= k@64@00 % step@22@00]
(assert (<= lo@20@00 (mod k@64@00 step@22@00)))
; [eval] k % step < hi
; [eval] k % step
(push) ; 9
(assert (not (not (= step@22@00 0))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (<= lo@20@00 (mod k@64@00 step@22@00))
  (not (<= lo@20@00 (mod k@64@00 step@22@00)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@64@00 max@24@00)
  (and
    (< k@64@00 max@24@00)
    (or
      (<= lo@20@00 (mod k@64@00 step@22@00))
      (not (<= lo@20@00 (mod k@64@00 step@22@00)))))))
(assert (or (< k@64@00 max@24@00) (not (< k@64@00 max@24@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= min@23@00 k@64@00)
  (and
    (<= min@23@00 k@64@00)
    (=>
      (< k@64@00 max@24@00)
      (and
        (< k@64@00 max@24@00)
        (or
          (<= lo@20@00 (mod k@64@00 step@22@00))
          (not (<= lo@20@00 (mod k@64@00 step@22@00))))))
    (or (< k@64@00 max@24@00) (not (< k@64@00 max@24@00))))))
(assert (or (<= min@23@00 k@64@00) (not (<= min@23@00 k@64@00))))
(assert (and
  (<= min@23@00 k@64@00)
  (and
    (< k@64@00 max@24@00)
    (and
      (<= lo@20@00 (mod k@64@00 step@22@00))
      (< (mod k@64@00 step@22@00) hi@21@00)))))
; [eval] ar[k]
(push) ; 3
(assert (not (>= k@64@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@64@00 (Seq_length ar@25@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@65@00 $Perm)
(assert ($Perm.isReadVar $k@65@00))
(pop) ; 2
(declare-fun inv@66@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@67@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@65@00))
; Nested auxiliary terms: non-globals
(assert (forall ((k@64@00 Int)) (!
  (=>
    (and
      (<= min@23@00 k@64@00)
      (and
        (< k@64@00 max@24@00)
        (and
          (<= lo@20@00 (mod k@64@00 step@22@00))
          (< (mod k@64@00 step@22@00) hi@21@00))))
    (and
      (=>
        (<= min@23@00 k@64@00)
        (and
          (<= min@23@00 k@64@00)
          (=>
            (< k@64@00 max@24@00)
            (and
              (< k@64@00 max@24@00)
              (or
                (<= lo@20@00 (mod k@64@00 step@22@00))
                (not (<= lo@20@00 (mod k@64@00 step@22@00))))))
          (or (< k@64@00 max@24@00) (not (< k@64@00 max@24@00)))))
      (or (<= min@23@00 k@64@00) (not (<= min@23@00 k@64@00)))))
  :pattern ((Seq_index ar@25@00 k@64@00))
  :qid |Ref__Integer_value-aux|)))
(push) ; 2
(assert (not (forall ((k@64@00 Int)) (!
  (=>
    (and
      (<= min@23@00 k@64@00)
      (and
        (< k@64@00 max@24@00)
        (and
          (<= lo@20@00 (mod k@64@00 step@22@00))
          (< (mod k@64@00 step@22@00) hi@21@00))))
    (or (= $k@65@00 $Perm.No) (< $Perm.No $k@65@00)))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@64@00 Int) (k2@64@00 Int)) (!
  (=>
    (and
      (and
        (and
          (<= min@23@00 k1@64@00)
          (and
            (< k1@64@00 max@24@00)
            (and
              (<= lo@20@00 (mod k1@64@00 step@22@00))
              (< (mod k1@64@00 step@22@00) hi@21@00))))
        (< $Perm.No $k@65@00))
      (and
        (and
          (<= min@23@00 k2@64@00)
          (and
            (< k2@64@00 max@24@00)
            (and
              (<= lo@20@00 (mod k2@64@00 step@22@00))
              (< (mod k2@64@00 step@22@00) hi@21@00))))
        (< $Perm.No $k@65@00))
      (= (Seq_index ar@25@00 k1@64@00) (Seq_index ar@25@00 k2@64@00)))
    (= k1@64@00 k2@64@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@64@00 Int)) (!
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
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((k@64@00 Int)) (!
  (<= $Perm.No $k@65@00)
  :pattern ((Seq_index ar@25@00 k@64@00))
  :qid |Ref__Integer_value-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((k@64@00 Int)) (!
  (<= $k@65@00 $Perm.Write)
  :pattern ((Seq_index ar@25@00 k@64@00))
  :qid |Ref__Integer_value-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((k@64@00 Int)) (!
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
    (not (= (Seq_index ar@25@00 k@64@00) $Ref.null)))
  :pattern ((Seq_index ar@25@00 k@64@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((k@64@00 Int)) (!
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
  :qid |quant-u-33|)))
(assert (forall ((k@64@00 Int)) (!
  (<= $Perm.No $k@65@00)
  :pattern ((Seq_index ar@25@00 k@64@00))
  :qid |Ref__Integer_value-permAtLeastZero|)))
(assert (forall ((k@64@00 Int)) (!
  (<= $k@65@00 $Perm.Write)
  :pattern ((Seq_index ar@25@00 k@64@00))
  :qid |Ref__Integer_value-permAtMostOne|)))
(assert (forall ((k@64@00 Int)) (!
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
    (not (= (Seq_index ar@25@00 k@64@00) $Ref.null)))
  :pattern ((Seq_index ar@25@00 k@64@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert ($Perm.isReadVar $k@65@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 lo@20@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= lo@20@00 hi@21@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= hi@21@00 step@22@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (> step@22@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (<= 0 min@23@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
(assert (<= min@23@00 i@19@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
(assert (<= i@19@00 max@24@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
(assert (<= max@24@00 (Seq_length ar@25@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
(assert (forall ((ix@62@00 Int) (jx@63@00 Int)) (!
  (and
    (=>
      (>= ix@62@00 0)
      (and
        (>= ix@62@00 0)
        (=>
          (< ix@62@00 (Seq_length ar@25@00))
          (and
            (< ix@62@00 (Seq_length ar@25@00))
            (=>
              (>= jx@63@00 0)
              (and
                (>= jx@63@00 0)
                (or
                  (< jx@63@00 (Seq_length ar@25@00))
                  (not (< jx@63@00 (Seq_length ar@25@00))))))
            (or (>= jx@63@00 0) (not (>= jx@63@00 0)))))
        (or
          (< ix@62@00 (Seq_length ar@25@00))
          (not (< ix@62@00 (Seq_length ar@25@00))))))
    (or (>= ix@62@00 0) (not (>= ix@62@00 0)))
    (=>
      (and
        (>= ix@62@00 0)
        (and
          (< ix@62@00 (Seq_length ar@25@00))
          (and
            (>= jx@63@00 0)
            (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00))))))
      (and
        (>= ix@62@00 0)
        (< ix@62@00 (Seq_length ar@25@00))
        (>= jx@63@00 0)
        (< jx@63@00 (Seq_length ar@25@00))
        (not (= ix@62@00 jx@63@00))))
    (or
      (not
        (and
          (>= ix@62@00 0)
          (and
            (< ix@62@00 (Seq_length ar@25@00))
            (and
              (>= jx@63@00 0)
              (and
                (< jx@63@00 (Seq_length ar@25@00))
                (not (= ix@62@00 jx@63@00)))))))
      (and
        (>= ix@62@00 0)
        (and
          (< ix@62@00 (Seq_length ar@25@00))
          (and
            (>= jx@63@00 0)
            (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00))))))))
  :pattern ((Seq_index ar@25@00 ix@62@00) (Seq_index ar@25@00 jx@63@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@36@12@36@116-aux|)))
(assert (forall ((ix@62@00 Int) (jx@63@00 Int)) (!
  (=>
    (and
      (>= ix@62@00 0)
      (and
        (< ix@62@00 (Seq_length ar@25@00))
        (and
          (>= jx@63@00 0)
          (and (< jx@63@00 (Seq_length ar@25@00)) (not (= ix@62@00 jx@63@00))))))
    (not (= (Seq_index ar@25@00 ix@62@00) (Seq_index ar@25@00 jx@63@00))))
  :pattern ((Seq_index ar@25@00 ix@62@00) (Seq_index ar@25@00 jx@63@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@36@12@36@116|)))
(assert (forall ((k@64@00 Int)) (!
  (=>
    (and
      (<= min@23@00 k@64@00)
      (and
        (< k@64@00 max@24@00)
        (and
          (<= lo@20@00 (mod k@64@00 step@22@00))
          (< (mod k@64@00 step@22@00) hi@21@00))))
    (and
      (=>
        (<= min@23@00 k@64@00)
        (and
          (<= min@23@00 k@64@00)
          (=>
            (< k@64@00 max@24@00)
            (and
              (< k@64@00 max@24@00)
              (or
                (<= lo@20@00 (mod k@64@00 step@22@00))
                (not (<= lo@20@00 (mod k@64@00 step@22@00))))))
          (or (< k@64@00 max@24@00) (not (< k@64@00 max@24@00)))))
      (or (<= min@23@00 k@64@00) (not (<= min@23@00 k@64@00)))))
  :pattern ((Seq_index ar@25@00 k@64@00))
  :qid |Ref__Integer_value-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i < max ? (lo <= i % step && (i % step < hi && ar[i].Ref__Integer_value == v) ? 1 : 0) + count_square(i + 1, lo, hi, step, min, max, ar, v) : 0)
; [eval] i < max
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@19@00 max@24@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@19@00 max@24@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | i@19@00 < max@24@00 | live]
; [else-branch: 38 | !(i@19@00 < max@24@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 38 | i@19@00 < max@24@00]
(assert (< i@19@00 max@24@00))
; [eval] (lo <= i % step && (i % step < hi && ar[i].Ref__Integer_value == v) ? 1 : 0) + count_square(i + 1, lo, hi, step, min, max, ar, v)
; [eval] (lo <= i % step && (i % step < hi && ar[i].Ref__Integer_value == v) ? 1 : 0)
; [eval] lo <= i % step && (i % step < hi && ar[i].Ref__Integer_value == v)
; [eval] lo <= i % step
; [eval] i % step
(push) ; 4
(assert (not (not (= step@22@00 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [then-branch: 39 | !(lo@20@00 <= i@19@00 % step@22@00) | live]
; [else-branch: 39 | lo@20@00 <= i@19@00 % step@22@00 | live]
(push) ; 5
; [then-branch: 39 | !(lo@20@00 <= i@19@00 % step@22@00)]
(assert (not (<= lo@20@00 (mod i@19@00 step@22@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | lo@20@00 <= i@19@00 % step@22@00]
(assert (<= lo@20@00 (mod i@19@00 step@22@00)))
; [eval] i % step < hi
; [eval] i % step
(push) ; 6
(assert (not (not (= step@22@00 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 40 | !(i@19@00 % step@22@00 < hi@21@00) | live]
; [else-branch: 40 | i@19@00 % step@22@00 < hi@21@00 | live]
(push) ; 7
; [then-branch: 40 | !(i@19@00 % step@22@00 < hi@21@00)]
(assert (not (< (mod i@19@00 step@22@00) hi@21@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 40 | i@19@00 % step@22@00 < hi@21@00]
(assert (< (mod i@19@00 step@22@00) hi@21@00))
; [eval] ar[i].Ref__Integer_value == v
; [eval] ar[i]
(push) ; 8
(assert (not (>= i@19@00 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< i@19@00 (Seq_length ar@25@00))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (ite
  (and
    (img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 (Seq_index
      ar@25@00
      i@19@00))
    (and
      (<=
        min@23@00
        (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 (Seq_index
          ar@25@00
          i@19@00)))
      (and
        (<
          (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 (Seq_index
            ar@25@00
            i@19@00))
          max@24@00)
        (and
          (<=
            lo@20@00
            (mod
              (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 (Seq_index
                ar@25@00
                i@19@00))
              step@22@00))
          (<
            (mod
              (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 (Seq_index
                ar@25@00
                i@19@00))
              step@22@00)
            hi@21@00)))))
  (< $Perm.No $k@65@00)
  false)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (< (mod i@19@00 step@22@00) hi@21@00)
  (not (< (mod i@19@00 step@22@00) hi@21@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= lo@20@00 (mod i@19@00 step@22@00))
  (and
    (<= lo@20@00 (mod i@19@00 step@22@00))
    (or
      (< (mod i@19@00 step@22@00) hi@21@00)
      (not (< (mod i@19@00 step@22@00) hi@21@00))))))
(assert (or
  (<= lo@20@00 (mod i@19@00 step@22@00))
  (not (<= lo@20@00 (mod i@19@00 step@22@00)))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (<= lo@20@00 (mod i@19@00 step@22@00))
    (and
      (< (mod i@19@00 step@22@00) hi@21@00)
      (=
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
          ar@25@00
          i@19@00))
        v@26@00))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<= lo@20@00 (mod i@19@00 step@22@00))
  (and
    (< (mod i@19@00 step@22@00) hi@21@00)
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
        ar@25@00
        i@19@00))
      v@26@00)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | lo@20@00 <= i@19@00 % step@22@00 && i@19@00 % step@22@00 < hi@21@00 && Lookup(Ref__Integer_value, Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(s@$))))))))), ar@25@00[i@19@00]) == v@26@00 | live]
; [else-branch: 41 | !(lo@20@00 <= i@19@00 % step@22@00 && i@19@00 % step@22@00 < hi@21@00 && Lookup(Ref__Integer_value, Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(s@$))))))))), ar@25@00[i@19@00]) == v@26@00) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 41 | lo@20@00 <= i@19@00 % step@22@00 && i@19@00 % step@22@00 < hi@21@00 && Lookup(Ref__Integer_value, Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(s@$))))))))), ar@25@00[i@19@00]) == v@26@00]
(assert (and
  (<= lo@20@00 (mod i@19@00 step@22@00))
  (and
    (< (mod i@19@00 step@22@00) hi@21@00)
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
        ar@25@00
        i@19@00))
      v@26@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 41 | !(lo@20@00 <= i@19@00 % step@22@00 && i@19@00 % step@22@00 < hi@21@00 && Lookup(Ref__Integer_value, Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(s@$))))))))), ar@25@00[i@19@00]) == v@26@00)]
(assert (not
  (and
    (<= lo@20@00 (mod i@19@00 step@22@00))
    (and
      (< (mod i@19@00 step@22@00) hi@21@00)
      (=
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
          ar@25@00
          i@19@00))
        v@26@00)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= lo@20@00 (mod i@19@00 step@22@00))
    (and
      (< (mod i@19@00 step@22@00) hi@21@00)
      (=
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
          ar@25@00
          i@19@00))
        v@26@00)))
  (and
    (<= lo@20@00 (mod i@19@00 step@22@00))
    (< (mod i@19@00 step@22@00) hi@21@00)
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
        ar@25@00
        i@19@00))
      v@26@00))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= lo@20@00 (mod i@19@00 step@22@00))
      (and
        (< (mod i@19@00 step@22@00) hi@21@00)
        (=
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
            ar@25@00
            i@19@00))
          v@26@00))))
  (and
    (<= lo@20@00 (mod i@19@00 step@22@00))
    (and
      (< (mod i@19@00 step@22@00) hi@21@00)
      (=
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
          ar@25@00
          i@19@00))
        v@26@00)))))
; [eval] count_square(i + 1, lo, hi, step, min, max, ar, v)
; [eval] i + 1
(push) ; 4
; [eval] 0 <= lo
; [eval] lo <= hi
; [eval] hi <= step
; [eval] step > 0
; [eval] 0 <= min
; [eval] min <= i
(push) ; 5
(assert (not (<= min@23@00 (+ i@19@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= min@23@00 (+ i@19@00 1)))
; [eval] i <= max
(push) ; 5
(assert (not (<= (+ i@19@00 1) max@24@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@19@00 1) max@24@00))
; [eval] max <= |ar|
; [eval] |ar|
; [eval] (forall ix: Int, jx: Int ::ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx])
(declare-const ix@68@00 Int)
(declare-const jx@69@00 Int)
(push) ; 5
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx]
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx)))
; [eval] ix >= 0
(push) ; 6
; [then-branch: 42 | !(ix@68@00 >= 0) | live]
; [else-branch: 42 | ix@68@00 >= 0 | live]
(push) ; 7
; [then-branch: 42 | !(ix@68@00 >= 0)]
(assert (not (>= ix@68@00 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 42 | ix@68@00 >= 0]
(assert (>= ix@68@00 0))
; [eval] ix < |ar|
; [eval] |ar|
(push) ; 8
; [then-branch: 43 | !(ix@68@00 < |ar@25@00|) | live]
; [else-branch: 43 | ix@68@00 < |ar@25@00| | live]
(push) ; 9
; [then-branch: 43 | !(ix@68@00 < |ar@25@00|)]
(assert (not (< ix@68@00 (Seq_length ar@25@00))))
(pop) ; 9
(push) ; 9
; [else-branch: 43 | ix@68@00 < |ar@25@00|]
(assert (< ix@68@00 (Seq_length ar@25@00)))
; [eval] jx >= 0
(push) ; 10
; [then-branch: 44 | !(jx@69@00 >= 0) | live]
; [else-branch: 44 | jx@69@00 >= 0 | live]
(push) ; 11
; [then-branch: 44 | !(jx@69@00 >= 0)]
(assert (not (>= jx@69@00 0)))
(pop) ; 11
(push) ; 11
; [else-branch: 44 | jx@69@00 >= 0]
(assert (>= jx@69@00 0))
; [eval] jx < |ar|
; [eval] |ar|
(push) ; 12
; [then-branch: 45 | !(jx@69@00 < |ar@25@00|) | live]
; [else-branch: 45 | jx@69@00 < |ar@25@00| | live]
(push) ; 13
; [then-branch: 45 | !(jx@69@00 < |ar@25@00|)]
(assert (not (< jx@69@00 (Seq_length ar@25@00))))
(pop) ; 13
(push) ; 13
; [else-branch: 45 | jx@69@00 < |ar@25@00|]
(assert (< jx@69@00 (Seq_length ar@25@00)))
; [eval] ix != jx
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (< jx@69@00 (Seq_length ar@25@00)) (not (< jx@69@00 (Seq_length ar@25@00)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@69@00 0)
  (and
    (>= jx@69@00 0)
    (or
      (< jx@69@00 (Seq_length ar@25@00))
      (not (< jx@69@00 (Seq_length ar@25@00)))))))
(assert (or (>= jx@69@00 0) (not (>= jx@69@00 0))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@68@00 (Seq_length ar@25@00))
  (and
    (< ix@68@00 (Seq_length ar@25@00))
    (=>
      (>= jx@69@00 0)
      (and
        (>= jx@69@00 0)
        (or
          (< jx@69@00 (Seq_length ar@25@00))
          (not (< jx@69@00 (Seq_length ar@25@00))))))
    (or (>= jx@69@00 0) (not (>= jx@69@00 0))))))
(assert (or (< ix@68@00 (Seq_length ar@25@00)) (not (< ix@68@00 (Seq_length ar@25@00)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@68@00 0)
  (and
    (>= ix@68@00 0)
    (=>
      (< ix@68@00 (Seq_length ar@25@00))
      (and
        (< ix@68@00 (Seq_length ar@25@00))
        (=>
          (>= jx@69@00 0)
          (and
            (>= jx@69@00 0)
            (or
              (< jx@69@00 (Seq_length ar@25@00))
              (not (< jx@69@00 (Seq_length ar@25@00))))))
        (or (>= jx@69@00 0) (not (>= jx@69@00 0)))))
    (or
      (< ix@68@00 (Seq_length ar@25@00))
      (not (< ix@68@00 (Seq_length ar@25@00)))))))
(assert (or (>= ix@68@00 0) (not (>= ix@68@00 0))))
(push) ; 6
; [then-branch: 46 | ix@68@00 >= 0 && ix@68@00 < |ar@25@00| && jx@69@00 >= 0 && jx@69@00 < |ar@25@00| && ix@68@00 != jx@69@00 | live]
; [else-branch: 46 | !(ix@68@00 >= 0 && ix@68@00 < |ar@25@00| && jx@69@00 >= 0 && jx@69@00 < |ar@25@00| && ix@68@00 != jx@69@00) | live]
(push) ; 7
; [then-branch: 46 | ix@68@00 >= 0 && ix@68@00 < |ar@25@00| && jx@69@00 >= 0 && jx@69@00 < |ar@25@00| && ix@68@00 != jx@69@00]
(assert (and
  (>= ix@68@00 0)
  (and
    (< ix@68@00 (Seq_length ar@25@00))
    (and
      (>= jx@69@00 0)
      (and (< jx@69@00 (Seq_length ar@25@00)) (not (= ix@68@00 jx@69@00)))))))
; [eval] ar[ix] != ar[jx]
; [eval] ar[ix]
; [eval] ar[jx]
(pop) ; 7
(push) ; 7
; [else-branch: 46 | !(ix@68@00 >= 0 && ix@68@00 < |ar@25@00| && jx@69@00 >= 0 && jx@69@00 < |ar@25@00| && ix@68@00 != jx@69@00)]
(assert (not
  (and
    (>= ix@68@00 0)
    (and
      (< ix@68@00 (Seq_length ar@25@00))
      (and
        (>= jx@69@00 0)
        (and (< jx@69@00 (Seq_length ar@25@00)) (not (= ix@68@00 jx@69@00))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (>= ix@68@00 0)
    (and
      (< ix@68@00 (Seq_length ar@25@00))
      (and
        (>= jx@69@00 0)
        (and (< jx@69@00 (Seq_length ar@25@00)) (not (= ix@68@00 jx@69@00))))))
  (and
    (>= ix@68@00 0)
    (< ix@68@00 (Seq_length ar@25@00))
    (>= jx@69@00 0)
    (< jx@69@00 (Seq_length ar@25@00))
    (not (= ix@68@00 jx@69@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@68@00 0)
      (and
        (< ix@68@00 (Seq_length ar@25@00))
        (and
          (>= jx@69@00 0)
          (and (< jx@69@00 (Seq_length ar@25@00)) (not (= ix@68@00 jx@69@00)))))))
  (and
    (>= ix@68@00 0)
    (and
      (< ix@68@00 (Seq_length ar@25@00))
      (and
        (>= jx@69@00 0)
        (and (< jx@69@00 (Seq_length ar@25@00)) (not (= ix@68@00 jx@69@00))))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((ix@68@00 Int) (jx@69@00 Int)) (!
  (=>
    (and
      (>= ix@68@00 0)
      (and
        (< ix@68@00 (Seq_length ar@25@00))
        (and
          (>= jx@69@00 0)
          (and (< jx@69@00 (Seq_length ar@25@00)) (not (= ix@68@00 jx@69@00))))))
    (not (= (Seq_index ar@25@00 ix@68@00) (Seq_index ar@25@00 jx@69@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@36@12@36@116|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((ix@68@00 Int) (jx@69@00 Int)) (!
  (=>
    (and
      (>= ix@68@00 0)
      (and
        (< ix@68@00 (Seq_length ar@25@00))
        (and
          (>= jx@69@00 0)
          (and (< jx@69@00 (Seq_length ar@25@00)) (not (= ix@68@00 jx@69@00))))))
    (not (= (Seq_index ar@25@00 ix@68@00) (Seq_index ar@25@00 jx@69@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@36@12@36@116|)))
(declare-const k@70@00 Int)
(push) ; 5
; [eval] min <= k && (k < max && (lo <= k % step && k % step < hi))
; [eval] min <= k
(push) ; 6
; [then-branch: 47 | !(min@23@00 <= k@70@00) | live]
; [else-branch: 47 | min@23@00 <= k@70@00 | live]
(push) ; 7
; [then-branch: 47 | !(min@23@00 <= k@70@00)]
(assert (not (<= min@23@00 k@70@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 47 | min@23@00 <= k@70@00]
(assert (<= min@23@00 k@70@00))
; [eval] k < max
(push) ; 8
; [then-branch: 48 | !(k@70@00 < max@24@00) | live]
; [else-branch: 48 | k@70@00 < max@24@00 | live]
(push) ; 9
; [then-branch: 48 | !(k@70@00 < max@24@00)]
(assert (not (< k@70@00 max@24@00)))
(pop) ; 9
(push) ; 9
; [else-branch: 48 | k@70@00 < max@24@00]
(assert (< k@70@00 max@24@00))
; [eval] lo <= k % step
; [eval] k % step
(push) ; 10
(assert (not (not (= step@22@00 0))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 49 | !(lo@20@00 <= k@70@00 % step@22@00) | live]
; [else-branch: 49 | lo@20@00 <= k@70@00 % step@22@00 | live]
(push) ; 11
; [then-branch: 49 | !(lo@20@00 <= k@70@00 % step@22@00)]
(assert (not (<= lo@20@00 (mod k@70@00 step@22@00))))
(pop) ; 11
(push) ; 11
; [else-branch: 49 | lo@20@00 <= k@70@00 % step@22@00]
(assert (<= lo@20@00 (mod k@70@00 step@22@00)))
; [eval] k % step < hi
; [eval] k % step
(push) ; 12
(assert (not (not (= step@22@00 0))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (<= lo@20@00 (mod k@70@00 step@22@00))
  (not (<= lo@20@00 (mod k@70@00 step@22@00)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@70@00 max@24@00)
  (and
    (< k@70@00 max@24@00)
    (or
      (<= lo@20@00 (mod k@70@00 step@22@00))
      (not (<= lo@20@00 (mod k@70@00 step@22@00)))))))
(assert (or (< k@70@00 max@24@00) (not (< k@70@00 max@24@00))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= min@23@00 k@70@00)
  (and
    (<= min@23@00 k@70@00)
    (=>
      (< k@70@00 max@24@00)
      (and
        (< k@70@00 max@24@00)
        (or
          (<= lo@20@00 (mod k@70@00 step@22@00))
          (not (<= lo@20@00 (mod k@70@00 step@22@00))))))
    (or (< k@70@00 max@24@00) (not (< k@70@00 max@24@00))))))
(assert (or (<= min@23@00 k@70@00) (not (<= min@23@00 k@70@00))))
(assert (and
  (<= min@23@00 k@70@00)
  (and
    (< k@70@00 max@24@00)
    (and
      (<= lo@20@00 (mod k@70@00 step@22@00))
      (< (mod k@70@00 step@22@00) hi@21@00)))))
(declare-const $k@71@00 $Perm)
(assert ($Perm.isReadVar $k@71@00))
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@70@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@70@00 (Seq_length ar@25@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@72@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@73@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@71@00))
; Nested auxiliary terms: non-globals
(assert (forall ((k@70@00 Int)) (!
  (=>
    (and
      (<= min@23@00 k@70@00)
      (and
        (< k@70@00 max@24@00)
        (and
          (<= lo@20@00 (mod k@70@00 step@22@00))
          (< (mod k@70@00 step@22@00) hi@21@00))))
    (and
      (=>
        (<= min@23@00 k@70@00)
        (and
          (<= min@23@00 k@70@00)
          (=>
            (< k@70@00 max@24@00)
            (and
              (< k@70@00 max@24@00)
              (or
                (<= lo@20@00 (mod k@70@00 step@22@00))
                (not (<= lo@20@00 (mod k@70@00 step@22@00))))))
          (or (< k@70@00 max@24@00) (not (< k@70@00 max@24@00)))))
      (or (<= min@23@00 k@70@00) (not (<= min@23@00 k@70@00)))))
  :pattern ((Seq_index ar@25@00 k@70@00))
  :qid |Ref__Integer_value-aux|)))
(push) ; 5
(assert (not (forall ((k@70@00 Int)) (!
  (=>
    (and
      (<= min@23@00 k@70@00)
      (and
        (< k@70@00 max@24@00)
        (and
          (<= lo@20@00 (mod k@70@00 step@22@00))
          (< (mod k@70@00 step@22@00) hi@21@00))))
    (or (= $k@71@00 $Perm.No) (< $Perm.No $k@71@00)))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@70@00 Int) (k2@70@00 Int)) (!
  (=>
    (and
      (and
        (and
          (<= min@23@00 k1@70@00)
          (and
            (< k1@70@00 max@24@00)
            (and
              (<= lo@20@00 (mod k1@70@00 step@22@00))
              (< (mod k1@70@00 step@22@00) hi@21@00))))
        (< $Perm.No $k@71@00))
      (and
        (and
          (<= min@23@00 k2@70@00)
          (and
            (< k2@70@00 max@24@00)
            (and
              (<= lo@20@00 (mod k2@70@00 step@22@00))
              (< (mod k2@70@00 step@22@00) hi@21@00))))
        (< $Perm.No $k@71@00))
      (= (Seq_index ar@25@00 k1@70@00) (Seq_index ar@25@00 k2@70@00)))
    (= k1@70@00 k2@70@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@70@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@71@00
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
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
          $k@65@00
          $Perm.No)
        $Perm.No))
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
      (<
        (ite
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
            (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
            (=
              r
              (Seq_index
                ar@25@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))))
          $k@71@00
          $Perm.No)
        $k@65@00)
      (<
        (ite
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
            (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
            (=
              r
              (Seq_index
                ar@25@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))))
          $k@71@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
  :pattern ((inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
  :pattern ((img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
  :pattern ((Seq_index
    ar@25@00
    (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)))
  :qid |qp.srp6|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
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
      (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
      (=
        r
        (Seq_index
          ar@25@00
          (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))))
    (=
      (-
        $k@71@00
        (ite
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
            (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
            (=
              r
              (Seq_index
                ar@25@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))))
          ($Perm.min
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
              $k@65@00
              $Perm.No)
            $k@71@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@74@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef8|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef7|)))
(assert (count_square%precondition ($Snap.combine
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
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@71@00))
(assert (forall ((k@70@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef8|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef7|)))
(assert (and
  (<= min@23@00 (+ i@19@00 1))
  (<= (+ i@19@00 1) max@24@00)
  (forall ((ix@68@00 Int) (jx@69@00 Int)) (!
    (=>
      (and
        (>= ix@68@00 0)
        (and
          (< ix@68@00 (Seq_length ar@25@00))
          (and
            (>= jx@69@00 0)
            (and (< jx@69@00 (Seq_length ar@25@00)) (not (= ix@68@00 jx@69@00))))))
      (not (= (Seq_index ar@25@00 ix@68@00) (Seq_index ar@25@00 jx@69@00))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@36@12@36@116|))
  (forall ((k@70@00 Int)) (!
    (=>
      (and
        (<= min@23@00 k@70@00)
        (and
          (< k@70@00 max@24@00)
          (and
            (<= lo@20@00 (mod k@70@00 step@22@00))
            (< (mod k@70@00 step@22@00) hi@21@00))))
      (and
        (=>
          (<= min@23@00 k@70@00)
          (and
            (<= min@23@00 k@70@00)
            (=>
              (< k@70@00 max@24@00)
              (and
                (< k@70@00 max@24@00)
                (or
                  (<= lo@20@00 (mod k@70@00 step@22@00))
                  (not (<= lo@20@00 (mod k@70@00 step@22@00))))))
            (or (< k@70@00 max@24@00) (not (< k@70@00 max@24@00)))))
        (or (<= min@23@00 k@70@00) (not (<= min@23@00 k@70@00)))))
    :pattern ((Seq_index ar@25@00 k@70@00))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
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
            $k@65@00
            $Perm.No)
          $Perm.No))
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
        (<
          (ite
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
              (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
              (=
                r
                (Seq_index
                  ar@25@00
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))))
            $k@71@00
            $Perm.No)
          $k@65@00)
        (<
          (ite
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
              (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
              (=
                r
                (Seq_index
                  ar@25@00
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))))
            $k@71@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
    :pattern ((inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
    :pattern ((img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
    :pattern ((Seq_index
      ar@25@00
      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)))
    :qid |qp.srp6|))
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
    1) lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 38 | !(i@19@00 < max@24@00)]
(assert (not (< i@19@00 max@24@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@71@00))
(assert (forall ((k@70@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef8|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef7|)))
(assert (=>
  (< i@19@00 max@24@00)
  (and
    (< i@19@00 max@24@00)
    (=>
      (<= lo@20@00 (mod i@19@00 step@22@00))
      (and
        (<= lo@20@00 (mod i@19@00 step@22@00))
        (or
          (< (mod i@19@00 step@22@00) hi@21@00)
          (not (< (mod i@19@00 step@22@00) hi@21@00)))))
    (or
      (<= lo@20@00 (mod i@19@00 step@22@00))
      (not (<= lo@20@00 (mod i@19@00 step@22@00))))
    (=>
      (and
        (<= lo@20@00 (mod i@19@00 step@22@00))
        (and
          (< (mod i@19@00 step@22@00) hi@21@00)
          (=
            ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
              ar@25@00
              i@19@00))
            v@26@00)))
      (and
        (<= lo@20@00 (mod i@19@00 step@22@00))
        (< (mod i@19@00 step@22@00) hi@21@00)
        (=
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
            ar@25@00
            i@19@00))
          v@26@00)))
    (or
      (not
        (and
          (<= lo@20@00 (mod i@19@00 step@22@00))
          (and
            (< (mod i@19@00 step@22@00) hi@21@00)
            (=
              ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
                ar@25@00
                i@19@00))
              v@26@00))))
      (and
        (<= lo@20@00 (mod i@19@00 step@22@00))
        (and
          (< (mod i@19@00 step@22@00) hi@21@00)
          (=
            ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
              ar@25@00
              i@19@00))
            v@26@00))))
    (<= min@23@00 (+ i@19@00 1))
    (<= (+ i@19@00 1) max@24@00)
    (forall ((ix@68@00 Int) (jx@69@00 Int)) (!
      (=>
        (and
          (>= ix@68@00 0)
          (and
            (< ix@68@00 (Seq_length ar@25@00))
            (and
              (>= jx@69@00 0)
              (and
                (< jx@69@00 (Seq_length ar@25@00))
                (not (= ix@68@00 jx@69@00))))))
        (not (= (Seq_index ar@25@00 ix@68@00) (Seq_index ar@25@00 jx@69@00))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@36@12@36@116|))
    (forall ((k@70@00 Int)) (!
      (=>
        (and
          (<= min@23@00 k@70@00)
          (and
            (< k@70@00 max@24@00)
            (and
              (<= lo@20@00 (mod k@70@00 step@22@00))
              (< (mod k@70@00 step@22@00) hi@21@00))))
        (and
          (=>
            (<= min@23@00 k@70@00)
            (and
              (<= min@23@00 k@70@00)
              (=>
                (< k@70@00 max@24@00)
                (and
                  (< k@70@00 max@24@00)
                  (or
                    (<= lo@20@00 (mod k@70@00 step@22@00))
                    (not (<= lo@20@00 (mod k@70@00 step@22@00))))))
              (or (< k@70@00 max@24@00) (not (< k@70@00 max@24@00)))))
          (or (<= min@23@00 k@70@00) (not (<= min@23@00 k@70@00)))))
      :pattern ((Seq_index ar@25@00 k@70@00))
      :qid |Ref__Integer_value-aux|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
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
              $k@65@00
              $Perm.No)
            $Perm.No))
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
          (<
            (ite
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
                (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                (=
                  r
                  (Seq_index
                    ar@25@00
                    (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))))
              $k@71@00
              $Perm.No)
            $k@65@00)
          (<
            (ite
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
                (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)
                (=
                  r
                  (Seq_index
                    ar@25@00
                    (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))))
              $k@71@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
      :pattern ((inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
      :pattern ((img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r))
      :pattern ((Seq_index
        ar@25@00
        (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00 r)))
      :qid |qp.srp6|))
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
      1) lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 v@26@00))))
; Joined path conditions
(assert (or (not (< i@19@00 max@24@00)) (< i@19@00 max@24@00)))
(assert (=
  result@27@00
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
      (count_square ($Snap.combine
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
    0)))
(pop) ; 1
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
; ---------- FUNCTION sum_square----------
(declare-fun i@28@00 () Int)
(declare-fun lo@29@00 () Int)
(declare-fun hi@30@00 () Int)
(declare-fun step@31@00 () Int)
(declare-fun min@32@00 () Int)
(declare-fun max@33@00 () Int)
(declare-fun ar@34@00 () Seq<$Ref>)
(declare-fun result@35@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= lo
(assert (<= 0 lo@29@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] lo <= hi
(assert (<= lo@29@00 hi@30@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] hi <= step
(assert (<= hi@30@00 step@31@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] step > 0
(assert (> step@31@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 0 <= min
(assert (<= 0 min@32@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] min <= i
(assert (<= min@32@00 i@28@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] i <= max
(assert (<= i@28@00 max@33@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
; [eval] max <= |ar|
; [eval] |ar|
(assert (<= max@33@00 (Seq_length ar@34@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { ar[ix], ar[jx] } ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx])
(declare-const ix@75@00 Int)
(declare-const jx@76@00 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx]
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 50 | !(ix@75@00 >= 0) | live]
; [else-branch: 50 | ix@75@00 >= 0 | live]
(push) ; 4
; [then-branch: 50 | !(ix@75@00 >= 0)]
(assert (not (>= ix@75@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 50 | ix@75@00 >= 0]
(assert (>= ix@75@00 0))
; [eval] ix < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 51 | !(ix@75@00 < |ar@34@00|) | live]
; [else-branch: 51 | ix@75@00 < |ar@34@00| | live]
(push) ; 6
; [then-branch: 51 | !(ix@75@00 < |ar@34@00|)]
(assert (not (< ix@75@00 (Seq_length ar@34@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 51 | ix@75@00 < |ar@34@00|]
(assert (< ix@75@00 (Seq_length ar@34@00)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 52 | !(jx@76@00 >= 0) | live]
; [else-branch: 52 | jx@76@00 >= 0 | live]
(push) ; 8
; [then-branch: 52 | !(jx@76@00 >= 0)]
(assert (not (>= jx@76@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 52 | jx@76@00 >= 0]
(assert (>= jx@76@00 0))
; [eval] jx < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 53 | !(jx@76@00 < |ar@34@00|) | live]
; [else-branch: 53 | jx@76@00 < |ar@34@00| | live]
(push) ; 10
; [then-branch: 53 | !(jx@76@00 < |ar@34@00|)]
(assert (not (< jx@76@00 (Seq_length ar@34@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 53 | jx@76@00 < |ar@34@00|]
(assert (< jx@76@00 (Seq_length ar@34@00)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@76@00 (Seq_length ar@34@00)) (not (< jx@76@00 (Seq_length ar@34@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@76@00 0)
  (and
    (>= jx@76@00 0)
    (or
      (< jx@76@00 (Seq_length ar@34@00))
      (not (< jx@76@00 (Seq_length ar@34@00)))))))
(assert (or (>= jx@76@00 0) (not (>= jx@76@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@75@00 (Seq_length ar@34@00))
  (and
    (< ix@75@00 (Seq_length ar@34@00))
    (=>
      (>= jx@76@00 0)
      (and
        (>= jx@76@00 0)
        (or
          (< jx@76@00 (Seq_length ar@34@00))
          (not (< jx@76@00 (Seq_length ar@34@00))))))
    (or (>= jx@76@00 0) (not (>= jx@76@00 0))))))
(assert (or (< ix@75@00 (Seq_length ar@34@00)) (not (< ix@75@00 (Seq_length ar@34@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@75@00 0)
  (and
    (>= ix@75@00 0)
    (=>
      (< ix@75@00 (Seq_length ar@34@00))
      (and
        (< ix@75@00 (Seq_length ar@34@00))
        (=>
          (>= jx@76@00 0)
          (and
            (>= jx@76@00 0)
            (or
              (< jx@76@00 (Seq_length ar@34@00))
              (not (< jx@76@00 (Seq_length ar@34@00))))))
        (or (>= jx@76@00 0) (not (>= jx@76@00 0)))))
    (or
      (< ix@75@00 (Seq_length ar@34@00))
      (not (< ix@75@00 (Seq_length ar@34@00)))))))
(assert (or (>= ix@75@00 0) (not (>= ix@75@00 0))))
(push) ; 3
; [then-branch: 54 | ix@75@00 >= 0 && ix@75@00 < |ar@34@00| && jx@76@00 >= 0 && jx@76@00 < |ar@34@00| && ix@75@00 != jx@76@00 | live]
; [else-branch: 54 | !(ix@75@00 >= 0 && ix@75@00 < |ar@34@00| && jx@76@00 >= 0 && jx@76@00 < |ar@34@00| && ix@75@00 != jx@76@00) | live]
(push) ; 4
; [then-branch: 54 | ix@75@00 >= 0 && ix@75@00 < |ar@34@00| && jx@76@00 >= 0 && jx@76@00 < |ar@34@00| && ix@75@00 != jx@76@00]
(assert (and
  (>= ix@75@00 0)
  (and
    (< ix@75@00 (Seq_length ar@34@00))
    (and
      (>= jx@76@00 0)
      (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00)))))))
; [eval] ar[ix] != ar[jx]
; [eval] ar[ix]
; [eval] ar[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 54 | !(ix@75@00 >= 0 && ix@75@00 < |ar@34@00| && jx@76@00 >= 0 && jx@76@00 < |ar@34@00| && ix@75@00 != jx@76@00)]
(assert (not
  (and
    (>= ix@75@00 0)
    (and
      (< ix@75@00 (Seq_length ar@34@00))
      (and
        (>= jx@76@00 0)
        (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@75@00 0)
    (and
      (< ix@75@00 (Seq_length ar@34@00))
      (and
        (>= jx@76@00 0)
        (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00))))))
  (and
    (>= ix@75@00 0)
    (< ix@75@00 (Seq_length ar@34@00))
    (>= jx@76@00 0)
    (< jx@76@00 (Seq_length ar@34@00))
    (not (= ix@75@00 jx@76@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@75@00 0)
      (and
        (< ix@75@00 (Seq_length ar@34@00))
        (and
          (>= jx@76@00 0)
          (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00)))))))
  (and
    (>= ix@75@00 0)
    (and
      (< ix@75@00 (Seq_length ar@34@00))
      (and
        (>= jx@76@00 0)
        (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@75@00 Int) (jx@76@00 Int)) (!
  (and
    (=>
      (>= ix@75@00 0)
      (and
        (>= ix@75@00 0)
        (=>
          (< ix@75@00 (Seq_length ar@34@00))
          (and
            (< ix@75@00 (Seq_length ar@34@00))
            (=>
              (>= jx@76@00 0)
              (and
                (>= jx@76@00 0)
                (or
                  (< jx@76@00 (Seq_length ar@34@00))
                  (not (< jx@76@00 (Seq_length ar@34@00))))))
            (or (>= jx@76@00 0) (not (>= jx@76@00 0)))))
        (or
          (< ix@75@00 (Seq_length ar@34@00))
          (not (< ix@75@00 (Seq_length ar@34@00))))))
    (or (>= ix@75@00 0) (not (>= ix@75@00 0)))
    (=>
      (and
        (>= ix@75@00 0)
        (and
          (< ix@75@00 (Seq_length ar@34@00))
          (and
            (>= jx@76@00 0)
            (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00))))))
      (and
        (>= ix@75@00 0)
        (< ix@75@00 (Seq_length ar@34@00))
        (>= jx@76@00 0)
        (< jx@76@00 (Seq_length ar@34@00))
        (not (= ix@75@00 jx@76@00))))
    (or
      (not
        (and
          (>= ix@75@00 0)
          (and
            (< ix@75@00 (Seq_length ar@34@00))
            (and
              (>= jx@76@00 0)
              (and
                (< jx@76@00 (Seq_length ar@34@00))
                (not (= ix@75@00 jx@76@00)))))))
      (and
        (>= ix@75@00 0)
        (and
          (< ix@75@00 (Seq_length ar@34@00))
          (and
            (>= jx@76@00 0)
            (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00))))))))
  :pattern ((Seq_index ar@34@00 ix@75@00) (Seq_index ar@34@00 jx@76@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@26@12@26@116-aux|)))
(assert (forall ((ix@75@00 Int) (jx@76@00 Int)) (!
  (=>
    (and
      (>= ix@75@00 0)
      (and
        (< ix@75@00 (Seq_length ar@34@00))
        (and
          (>= jx@76@00 0)
          (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00))))))
    (not (= (Seq_index ar@34@00 ix@75@00) (Seq_index ar@34@00 jx@76@00))))
  :pattern ((Seq_index ar@34@00 ix@75@00) (Seq_index ar@34@00 jx@76@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@26@12@26@116|)))
(declare-const k@77@00 Int)
(push) ; 2
; [eval] min <= k && (k < max && (lo <= k % step && k % step < hi))
; [eval] min <= k
(push) ; 3
; [then-branch: 55 | !(min@32@00 <= k@77@00) | live]
; [else-branch: 55 | min@32@00 <= k@77@00 | live]
(push) ; 4
; [then-branch: 55 | !(min@32@00 <= k@77@00)]
(assert (not (<= min@32@00 k@77@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 55 | min@32@00 <= k@77@00]
(assert (<= min@32@00 k@77@00))
; [eval] k < max
(push) ; 5
; [then-branch: 56 | !(k@77@00 < max@33@00) | live]
; [else-branch: 56 | k@77@00 < max@33@00 | live]
(push) ; 6
; [then-branch: 56 | !(k@77@00 < max@33@00)]
(assert (not (< k@77@00 max@33@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 56 | k@77@00 < max@33@00]
(assert (< k@77@00 max@33@00))
; [eval] lo <= k % step
; [eval] k % step
(push) ; 7
(assert (not (not (= step@31@00 0))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 57 | !(lo@29@00 <= k@77@00 % step@31@00) | live]
; [else-branch: 57 | lo@29@00 <= k@77@00 % step@31@00 | live]
(push) ; 8
; [then-branch: 57 | !(lo@29@00 <= k@77@00 % step@31@00)]
(assert (not (<= lo@29@00 (mod k@77@00 step@31@00))))
(pop) ; 8
(push) ; 8
; [else-branch: 57 | lo@29@00 <= k@77@00 % step@31@00]
(assert (<= lo@29@00 (mod k@77@00 step@31@00)))
; [eval] k % step < hi
; [eval] k % step
(push) ; 9
(assert (not (not (= step@31@00 0))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (<= lo@29@00 (mod k@77@00 step@31@00))
  (not (<= lo@29@00 (mod k@77@00 step@31@00)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@77@00 max@33@00)
  (and
    (< k@77@00 max@33@00)
    (or
      (<= lo@29@00 (mod k@77@00 step@31@00))
      (not (<= lo@29@00 (mod k@77@00 step@31@00)))))))
(assert (or (< k@77@00 max@33@00) (not (< k@77@00 max@33@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= min@32@00 k@77@00)
  (and
    (<= min@32@00 k@77@00)
    (=>
      (< k@77@00 max@33@00)
      (and
        (< k@77@00 max@33@00)
        (or
          (<= lo@29@00 (mod k@77@00 step@31@00))
          (not (<= lo@29@00 (mod k@77@00 step@31@00))))))
    (or (< k@77@00 max@33@00) (not (< k@77@00 max@33@00))))))
(assert (or (<= min@32@00 k@77@00) (not (<= min@32@00 k@77@00))))
(assert (and
  (<= min@32@00 k@77@00)
  (and
    (< k@77@00 max@33@00)
    (and
      (<= lo@29@00 (mod k@77@00 step@31@00))
      (< (mod k@77@00 step@31@00) hi@30@00)))))
; [eval] ar[k]
(push) ; 3
(assert (not (>= k@77@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@77@00 (Seq_length ar@34@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@78@00 $Perm)
(assert ($Perm.isReadVar $k@78@00))
(pop) ; 2
(declare-fun inv@79@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@80@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@78@00))
; Nested auxiliary terms: non-globals
(assert (forall ((k@77@00 Int)) (!
  (=>
    (and
      (<= min@32@00 k@77@00)
      (and
        (< k@77@00 max@33@00)
        (and
          (<= lo@29@00 (mod k@77@00 step@31@00))
          (< (mod k@77@00 step@31@00) hi@30@00))))
    (and
      (=>
        (<= min@32@00 k@77@00)
        (and
          (<= min@32@00 k@77@00)
          (=>
            (< k@77@00 max@33@00)
            (and
              (< k@77@00 max@33@00)
              (or
                (<= lo@29@00 (mod k@77@00 step@31@00))
                (not (<= lo@29@00 (mod k@77@00 step@31@00))))))
          (or (< k@77@00 max@33@00) (not (< k@77@00 max@33@00)))))
      (or (<= min@32@00 k@77@00) (not (<= min@32@00 k@77@00)))))
  :pattern ((Seq_index ar@34@00 k@77@00))
  :qid |Ref__Integer_value-aux|)))
(push) ; 2
(assert (not (forall ((k@77@00 Int)) (!
  (=>
    (and
      (<= min@32@00 k@77@00)
      (and
        (< k@77@00 max@33@00)
        (and
          (<= lo@29@00 (mod k@77@00 step@31@00))
          (< (mod k@77@00 step@31@00) hi@30@00))))
    (or (= $k@78@00 $Perm.No) (< $Perm.No $k@78@00)))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@77@00 Int) (k2@77@00 Int)) (!
  (=>
    (and
      (and
        (and
          (<= min@32@00 k1@77@00)
          (and
            (< k1@77@00 max@33@00)
            (and
              (<= lo@29@00 (mod k1@77@00 step@31@00))
              (< (mod k1@77@00 step@31@00) hi@30@00))))
        (< $Perm.No $k@78@00))
      (and
        (and
          (<= min@32@00 k2@77@00)
          (and
            (< k2@77@00 max@33@00)
            (and
              (<= lo@29@00 (mod k2@77@00 step@31@00))
              (< (mod k2@77@00 step@31@00) hi@30@00))))
        (< $Perm.No $k@78@00))
      (= (Seq_index ar@34@00 k1@77@00) (Seq_index ar@34@00 k2@77@00)))
    (= k1@77@00 k2@77@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@77@00 Int)) (!
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
  :qid |quant-u-41|)))
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((k@77@00 Int)) (!
  (<= $Perm.No $k@78@00)
  :pattern ((Seq_index ar@34@00 k@77@00))
  :qid |Ref__Integer_value-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((k@77@00 Int)) (!
  (<= $k@78@00 $Perm.Write)
  :pattern ((Seq_index ar@34@00 k@77@00))
  :qid |Ref__Integer_value-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((k@77@00 Int)) (!
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
    (not (= (Seq_index ar@34@00 k@77@00) $Ref.null)))
  :pattern ((Seq_index ar@34@00 k@77@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((k@77@00 Int)) (!
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
  :qid |quant-u-41|)))
(assert (forall ((k@77@00 Int)) (!
  (<= $Perm.No $k@78@00)
  :pattern ((Seq_index ar@34@00 k@77@00))
  :qid |Ref__Integer_value-permAtLeastZero|)))
(assert (forall ((k@77@00 Int)) (!
  (<= $k@78@00 $Perm.Write)
  :pattern ((Seq_index ar@34@00 k@77@00))
  :qid |Ref__Integer_value-permAtMostOne|)))
(assert (forall ((k@77@00 Int)) (!
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
    (not (= (Seq_index ar@34@00 k@77@00) $Ref.null)))
  :pattern ((Seq_index ar@34@00 k@77@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert ($Perm.isReadVar $k@78@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 lo@29@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= lo@29@00 hi@30@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= hi@30@00 step@31@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (> step@31@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (<= 0 min@32@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
(assert (<= min@32@00 i@28@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
(assert (<= i@28@00 max@33@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
(assert (<= max@33@00 (Seq_length ar@34@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
(assert (forall ((ix@75@00 Int) (jx@76@00 Int)) (!
  (and
    (=>
      (>= ix@75@00 0)
      (and
        (>= ix@75@00 0)
        (=>
          (< ix@75@00 (Seq_length ar@34@00))
          (and
            (< ix@75@00 (Seq_length ar@34@00))
            (=>
              (>= jx@76@00 0)
              (and
                (>= jx@76@00 0)
                (or
                  (< jx@76@00 (Seq_length ar@34@00))
                  (not (< jx@76@00 (Seq_length ar@34@00))))))
            (or (>= jx@76@00 0) (not (>= jx@76@00 0)))))
        (or
          (< ix@75@00 (Seq_length ar@34@00))
          (not (< ix@75@00 (Seq_length ar@34@00))))))
    (or (>= ix@75@00 0) (not (>= ix@75@00 0)))
    (=>
      (and
        (>= ix@75@00 0)
        (and
          (< ix@75@00 (Seq_length ar@34@00))
          (and
            (>= jx@76@00 0)
            (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00))))))
      (and
        (>= ix@75@00 0)
        (< ix@75@00 (Seq_length ar@34@00))
        (>= jx@76@00 0)
        (< jx@76@00 (Seq_length ar@34@00))
        (not (= ix@75@00 jx@76@00))))
    (or
      (not
        (and
          (>= ix@75@00 0)
          (and
            (< ix@75@00 (Seq_length ar@34@00))
            (and
              (>= jx@76@00 0)
              (and
                (< jx@76@00 (Seq_length ar@34@00))
                (not (= ix@75@00 jx@76@00)))))))
      (and
        (>= ix@75@00 0)
        (and
          (< ix@75@00 (Seq_length ar@34@00))
          (and
            (>= jx@76@00 0)
            (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00))))))))
  :pattern ((Seq_index ar@34@00 ix@75@00) (Seq_index ar@34@00 jx@76@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@26@12@26@116-aux|)))
(assert (forall ((ix@75@00 Int) (jx@76@00 Int)) (!
  (=>
    (and
      (>= ix@75@00 0)
      (and
        (< ix@75@00 (Seq_length ar@34@00))
        (and
          (>= jx@76@00 0)
          (and (< jx@76@00 (Seq_length ar@34@00)) (not (= ix@75@00 jx@76@00))))))
    (not (= (Seq_index ar@34@00 ix@75@00) (Seq_index ar@34@00 jx@76@00))))
  :pattern ((Seq_index ar@34@00 ix@75@00) (Seq_index ar@34@00 jx@76@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@26@12@26@116|)))
(assert (forall ((k@77@00 Int)) (!
  (=>
    (and
      (<= min@32@00 k@77@00)
      (and
        (< k@77@00 max@33@00)
        (and
          (<= lo@29@00 (mod k@77@00 step@31@00))
          (< (mod k@77@00 step@31@00) hi@30@00))))
    (and
      (=>
        (<= min@32@00 k@77@00)
        (and
          (<= min@32@00 k@77@00)
          (=>
            (< k@77@00 max@33@00)
            (and
              (< k@77@00 max@33@00)
              (or
                (<= lo@29@00 (mod k@77@00 step@31@00))
                (not (<= lo@29@00 (mod k@77@00 step@31@00))))))
          (or (< k@77@00 max@33@00) (not (< k@77@00 max@33@00)))))
      (or (<= min@32@00 k@77@00) (not (<= min@32@00 k@77@00)))))
  :pattern ((Seq_index ar@34@00 k@77@00))
  :qid |Ref__Integer_value-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i < max ? (lo <= i % step && i % step < hi ? ar[i].Ref__Integer_value : 0) + sum_square(i + 1, lo, hi, step, min, max, ar) : 0)
; [eval] i < max
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@28@00 max@33@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@28@00 max@33@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | i@28@00 < max@33@00 | live]
; [else-branch: 58 | !(i@28@00 < max@33@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 58 | i@28@00 < max@33@00]
(assert (< i@28@00 max@33@00))
; [eval] (lo <= i % step && i % step < hi ? ar[i].Ref__Integer_value : 0) + sum_square(i + 1, lo, hi, step, min, max, ar)
; [eval] (lo <= i % step && i % step < hi ? ar[i].Ref__Integer_value : 0)
; [eval] lo <= i % step && i % step < hi
; [eval] lo <= i % step
; [eval] i % step
(push) ; 4
(assert (not (not (= step@31@00 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [then-branch: 59 | !(lo@29@00 <= i@28@00 % step@31@00) | live]
; [else-branch: 59 | lo@29@00 <= i@28@00 % step@31@00 | live]
(push) ; 5
; [then-branch: 59 | !(lo@29@00 <= i@28@00 % step@31@00)]
(assert (not (<= lo@29@00 (mod i@28@00 step@31@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 59 | lo@29@00 <= i@28@00 % step@31@00]
(assert (<= lo@29@00 (mod i@28@00 step@31@00)))
; [eval] i % step < hi
; [eval] i % step
(push) ; 6
(assert (not (not (= step@31@00 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (<= lo@29@00 (mod i@28@00 step@31@00))
  (not (<= lo@29@00 (mod i@28@00 step@31@00)))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (<= lo@29@00 (mod i@28@00 step@31@00))
    (< (mod i@28@00 step@31@00) hi@30@00)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<= lo@29@00 (mod i@28@00 step@31@00))
  (< (mod i@28@00 step@31@00) hi@30@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 60 | lo@29@00 <= i@28@00 % step@31@00 && i@28@00 % step@31@00 < hi@30@00 | live]
; [else-branch: 60 | !(lo@29@00 <= i@28@00 % step@31@00 && i@28@00 % step@31@00 < hi@30@00) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 60 | lo@29@00 <= i@28@00 % step@31@00 && i@28@00 % step@31@00 < hi@30@00]
(assert (and
  (<= lo@29@00 (mod i@28@00 step@31@00))
  (< (mod i@28@00 step@31@00) hi@30@00)))
; [eval] ar[i]
(push) ; 6
(assert (not (>= i@28@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@28@00 (Seq_length ar@34@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (ite
  (and
    (img@80@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 (Seq_index
      ar@34@00
      i@28@00))
    (and
      (<=
        min@32@00
        (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 (Seq_index
          ar@34@00
          i@28@00)))
      (and
        (<
          (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 (Seq_index
            ar@34@00
            i@28@00))
          max@33@00)
        (and
          (<=
            lo@29@00
            (mod
              (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 (Seq_index
                ar@34@00
                i@28@00))
              step@31@00))
          (<
            (mod
              (inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 (Seq_index
                ar@34@00
                i@28@00))
              step@31@00)
            hi@30@00)))))
  (< $Perm.No $k@78@00)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 60 | !(lo@29@00 <= i@28@00 % step@31@00 && i@28@00 % step@31@00 < hi@30@00)]
(assert (not
  (and
    (<= lo@29@00 (mod i@28@00 step@31@00))
    (< (mod i@28@00 step@31@00) hi@30@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= lo@29@00 (mod i@28@00 step@31@00))
      (< (mod i@28@00 step@31@00) hi@30@00)))
  (and
    (<= lo@29@00 (mod i@28@00 step@31@00))
    (< (mod i@28@00 step@31@00) hi@30@00))))
; [eval] sum_square(i + 1, lo, hi, step, min, max, ar)
; [eval] i + 1
(push) ; 4
; [eval] 0 <= lo
; [eval] lo <= hi
; [eval] hi <= step
; [eval] step > 0
; [eval] 0 <= min
; [eval] min <= i
(push) ; 5
(assert (not (<= min@32@00 (+ i@28@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= min@32@00 (+ i@28@00 1)))
; [eval] i <= max
(push) ; 5
(assert (not (<= (+ i@28@00 1) max@33@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@28@00 1) max@33@00))
; [eval] max <= |ar|
; [eval] |ar|
; [eval] (forall ix: Int, jx: Int ::ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx])
(declare-const ix@81@00 Int)
(declare-const jx@82@00 Int)
(push) ; 5
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx))) ==> ar[ix] != ar[jx]
; [eval] ix >= 0 && (ix < |ar| && (jx >= 0 && (jx < |ar| && ix != jx)))
; [eval] ix >= 0
(push) ; 6
; [then-branch: 61 | !(ix@81@00 >= 0) | live]
; [else-branch: 61 | ix@81@00 >= 0 | live]
(push) ; 7
; [then-branch: 61 | !(ix@81@00 >= 0)]
(assert (not (>= ix@81@00 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 61 | ix@81@00 >= 0]
(assert (>= ix@81@00 0))
; [eval] ix < |ar|
; [eval] |ar|
(push) ; 8
; [then-branch: 62 | !(ix@81@00 < |ar@34@00|) | live]
; [else-branch: 62 | ix@81@00 < |ar@34@00| | live]
(push) ; 9
; [then-branch: 62 | !(ix@81@00 < |ar@34@00|)]
(assert (not (< ix@81@00 (Seq_length ar@34@00))))
(pop) ; 9
(push) ; 9
; [else-branch: 62 | ix@81@00 < |ar@34@00|]
(assert (< ix@81@00 (Seq_length ar@34@00)))
; [eval] jx >= 0
(push) ; 10
; [then-branch: 63 | !(jx@82@00 >= 0) | live]
; [else-branch: 63 | jx@82@00 >= 0 | live]
(push) ; 11
; [then-branch: 63 | !(jx@82@00 >= 0)]
(assert (not (>= jx@82@00 0)))
(pop) ; 11
(push) ; 11
; [else-branch: 63 | jx@82@00 >= 0]
(assert (>= jx@82@00 0))
; [eval] jx < |ar|
; [eval] |ar|
(push) ; 12
; [then-branch: 64 | !(jx@82@00 < |ar@34@00|) | live]
; [else-branch: 64 | jx@82@00 < |ar@34@00| | live]
(push) ; 13
; [then-branch: 64 | !(jx@82@00 < |ar@34@00|)]
(assert (not (< jx@82@00 (Seq_length ar@34@00))))
(pop) ; 13
(push) ; 13
; [else-branch: 64 | jx@82@00 < |ar@34@00|]
(assert (< jx@82@00 (Seq_length ar@34@00)))
; [eval] ix != jx
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (< jx@82@00 (Seq_length ar@34@00)) (not (< jx@82@00 (Seq_length ar@34@00)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@82@00 0)
  (and
    (>= jx@82@00 0)
    (or
      (< jx@82@00 (Seq_length ar@34@00))
      (not (< jx@82@00 (Seq_length ar@34@00)))))))
(assert (or (>= jx@82@00 0) (not (>= jx@82@00 0))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@81@00 (Seq_length ar@34@00))
  (and
    (< ix@81@00 (Seq_length ar@34@00))
    (=>
      (>= jx@82@00 0)
      (and
        (>= jx@82@00 0)
        (or
          (< jx@82@00 (Seq_length ar@34@00))
          (not (< jx@82@00 (Seq_length ar@34@00))))))
    (or (>= jx@82@00 0) (not (>= jx@82@00 0))))))
(assert (or (< ix@81@00 (Seq_length ar@34@00)) (not (< ix@81@00 (Seq_length ar@34@00)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@81@00 0)
  (and
    (>= ix@81@00 0)
    (=>
      (< ix@81@00 (Seq_length ar@34@00))
      (and
        (< ix@81@00 (Seq_length ar@34@00))
        (=>
          (>= jx@82@00 0)
          (and
            (>= jx@82@00 0)
            (or
              (< jx@82@00 (Seq_length ar@34@00))
              (not (< jx@82@00 (Seq_length ar@34@00))))))
        (or (>= jx@82@00 0) (not (>= jx@82@00 0)))))
    (or
      (< ix@81@00 (Seq_length ar@34@00))
      (not (< ix@81@00 (Seq_length ar@34@00)))))))
(assert (or (>= ix@81@00 0) (not (>= ix@81@00 0))))
(push) ; 6
; [then-branch: 65 | ix@81@00 >= 0 && ix@81@00 < |ar@34@00| && jx@82@00 >= 0 && jx@82@00 < |ar@34@00| && ix@81@00 != jx@82@00 | live]
; [else-branch: 65 | !(ix@81@00 >= 0 && ix@81@00 < |ar@34@00| && jx@82@00 >= 0 && jx@82@00 < |ar@34@00| && ix@81@00 != jx@82@00) | live]
(push) ; 7
; [then-branch: 65 | ix@81@00 >= 0 && ix@81@00 < |ar@34@00| && jx@82@00 >= 0 && jx@82@00 < |ar@34@00| && ix@81@00 != jx@82@00]
(assert (and
  (>= ix@81@00 0)
  (and
    (< ix@81@00 (Seq_length ar@34@00))
    (and
      (>= jx@82@00 0)
      (and (< jx@82@00 (Seq_length ar@34@00)) (not (= ix@81@00 jx@82@00)))))))
; [eval] ar[ix] != ar[jx]
; [eval] ar[ix]
; [eval] ar[jx]
(pop) ; 7
(push) ; 7
; [else-branch: 65 | !(ix@81@00 >= 0 && ix@81@00 < |ar@34@00| && jx@82@00 >= 0 && jx@82@00 < |ar@34@00| && ix@81@00 != jx@82@00)]
(assert (not
  (and
    (>= ix@81@00 0)
    (and
      (< ix@81@00 (Seq_length ar@34@00))
      (and
        (>= jx@82@00 0)
        (and (< jx@82@00 (Seq_length ar@34@00)) (not (= ix@81@00 jx@82@00))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (>= ix@81@00 0)
    (and
      (< ix@81@00 (Seq_length ar@34@00))
      (and
        (>= jx@82@00 0)
        (and (< jx@82@00 (Seq_length ar@34@00)) (not (= ix@81@00 jx@82@00))))))
  (and
    (>= ix@81@00 0)
    (< ix@81@00 (Seq_length ar@34@00))
    (>= jx@82@00 0)
    (< jx@82@00 (Seq_length ar@34@00))
    (not (= ix@81@00 jx@82@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@81@00 0)
      (and
        (< ix@81@00 (Seq_length ar@34@00))
        (and
          (>= jx@82@00 0)
          (and (< jx@82@00 (Seq_length ar@34@00)) (not (= ix@81@00 jx@82@00)))))))
  (and
    (>= ix@81@00 0)
    (and
      (< ix@81@00 (Seq_length ar@34@00))
      (and
        (>= jx@82@00 0)
        (and (< jx@82@00 (Seq_length ar@34@00)) (not (= ix@81@00 jx@82@00))))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((ix@81@00 Int) (jx@82@00 Int)) (!
  (=>
    (and
      (>= ix@81@00 0)
      (and
        (< ix@81@00 (Seq_length ar@34@00))
        (and
          (>= jx@82@00 0)
          (and (< jx@82@00 (Seq_length ar@34@00)) (not (= ix@81@00 jx@82@00))))))
    (not (= (Seq_index ar@34@00 ix@81@00) (Seq_index ar@34@00 jx@82@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@26@12@26@116|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((ix@81@00 Int) (jx@82@00 Int)) (!
  (=>
    (and
      (>= ix@81@00 0)
      (and
        (< ix@81@00 (Seq_length ar@34@00))
        (and
          (>= jx@82@00 0)
          (and (< jx@82@00 (Seq_length ar@34@00)) (not (= ix@81@00 jx@82@00))))))
    (not (= (Seq_index ar@34@00 ix@81@00) (Seq_index ar@34@00 jx@82@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@26@12@26@116|)))
(declare-const k@83@00 Int)
(push) ; 5
; [eval] min <= k && (k < max && (lo <= k % step && k % step < hi))
; [eval] min <= k
(push) ; 6
; [then-branch: 66 | !(min@32@00 <= k@83@00) | live]
; [else-branch: 66 | min@32@00 <= k@83@00 | live]
(push) ; 7
; [then-branch: 66 | !(min@32@00 <= k@83@00)]
(assert (not (<= min@32@00 k@83@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 66 | min@32@00 <= k@83@00]
(assert (<= min@32@00 k@83@00))
; [eval] k < max
(push) ; 8
; [then-branch: 67 | !(k@83@00 < max@33@00) | live]
; [else-branch: 67 | k@83@00 < max@33@00 | live]
(push) ; 9
; [then-branch: 67 | !(k@83@00 < max@33@00)]
(assert (not (< k@83@00 max@33@00)))
(pop) ; 9
(push) ; 9
; [else-branch: 67 | k@83@00 < max@33@00]
(assert (< k@83@00 max@33@00))
; [eval] lo <= k % step
; [eval] k % step
(push) ; 10
(assert (not (not (= step@31@00 0))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 68 | !(lo@29@00 <= k@83@00 % step@31@00) | live]
; [else-branch: 68 | lo@29@00 <= k@83@00 % step@31@00 | live]
(push) ; 11
; [then-branch: 68 | !(lo@29@00 <= k@83@00 % step@31@00)]
(assert (not (<= lo@29@00 (mod k@83@00 step@31@00))))
(pop) ; 11
(push) ; 11
; [else-branch: 68 | lo@29@00 <= k@83@00 % step@31@00]
(assert (<= lo@29@00 (mod k@83@00 step@31@00)))
; [eval] k % step < hi
; [eval] k % step
(push) ; 12
(assert (not (not (= step@31@00 0))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (<= lo@29@00 (mod k@83@00 step@31@00))
  (not (<= lo@29@00 (mod k@83@00 step@31@00)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@83@00 max@33@00)
  (and
    (< k@83@00 max@33@00)
    (or
      (<= lo@29@00 (mod k@83@00 step@31@00))
      (not (<= lo@29@00 (mod k@83@00 step@31@00)))))))
(assert (or (< k@83@00 max@33@00) (not (< k@83@00 max@33@00))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= min@32@00 k@83@00)
  (and
    (<= min@32@00 k@83@00)
    (=>
      (< k@83@00 max@33@00)
      (and
        (< k@83@00 max@33@00)
        (or
          (<= lo@29@00 (mod k@83@00 step@31@00))
          (not (<= lo@29@00 (mod k@83@00 step@31@00))))))
    (or (< k@83@00 max@33@00) (not (< k@83@00 max@33@00))))))
(assert (or (<= min@32@00 k@83@00) (not (<= min@32@00 k@83@00))))
(assert (and
  (<= min@32@00 k@83@00)
  (and
    (< k@83@00 max@33@00)
    (and
      (<= lo@29@00 (mod k@83@00 step@31@00))
      (< (mod k@83@00 step@31@00) hi@30@00)))))
(declare-const $k@84@00 $Perm)
(assert ($Perm.isReadVar $k@84@00))
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@83@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@83@00 (Seq_length ar@34@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@85@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@86@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@84@00))
; Nested auxiliary terms: non-globals
(assert (forall ((k@83@00 Int)) (!
  (=>
    (and
      (<= min@32@00 k@83@00)
      (and
        (< k@83@00 max@33@00)
        (and
          (<= lo@29@00 (mod k@83@00 step@31@00))
          (< (mod k@83@00 step@31@00) hi@30@00))))
    (and
      (=>
        (<= min@32@00 k@83@00)
        (and
          (<= min@32@00 k@83@00)
          (=>
            (< k@83@00 max@33@00)
            (and
              (< k@83@00 max@33@00)
              (or
                (<= lo@29@00 (mod k@83@00 step@31@00))
                (not (<= lo@29@00 (mod k@83@00 step@31@00))))))
          (or (< k@83@00 max@33@00) (not (< k@83@00 max@33@00)))))
      (or (<= min@32@00 k@83@00) (not (<= min@32@00 k@83@00)))))
  :pattern ((Seq_index ar@34@00 k@83@00))
  :qid |Ref__Integer_value-aux|)))
(push) ; 5
(assert (not (forall ((k@83@00 Int)) (!
  (=>
    (and
      (<= min@32@00 k@83@00)
      (and
        (< k@83@00 max@33@00)
        (and
          (<= lo@29@00 (mod k@83@00 step@31@00))
          (< (mod k@83@00 step@31@00) hi@30@00))))
    (or (= $k@84@00 $Perm.No) (< $Perm.No $k@84@00)))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@83@00 Int) (k2@83@00 Int)) (!
  (=>
    (and
      (and
        (and
          (<= min@32@00 k1@83@00)
          (and
            (< k1@83@00 max@33@00)
            (and
              (<= lo@29@00 (mod k1@83@00 step@31@00))
              (< (mod k1@83@00 step@31@00) hi@30@00))))
        (< $Perm.No $k@84@00))
      (and
        (and
          (<= min@32@00 k2@83@00)
          (and
            (< k2@83@00 max@33@00)
            (and
              (<= lo@29@00 (mod k2@83@00 step@31@00))
              (< (mod k2@83@00 step@31@00) hi@30@00))))
        (< $Perm.No $k@84@00))
      (= (Seq_index ar@34@00 k1@83@00) (Seq_index ar@34@00 k2@83@00)))
    (= k1@83@00 k2@83@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@83@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@84@00
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
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
          $k@78@00
          $Perm.No)
        $Perm.No))
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
      (<
        (ite
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
            (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
            (=
              r
              (Seq_index
                ar@34@00
                (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))))
          $k@84@00
          $Perm.No)
        $k@78@00)
      (<
        (ite
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
            (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
            (=
              r
              (Seq_index
                ar@34@00
                (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))))
          $k@84@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@80@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
  :pattern ((inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
  :pattern ((img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
  :pattern ((Seq_index
    ar@34@00
    (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)))
  :qid |qp.srp9|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
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
      (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
      (=
        r
        (Seq_index
          ar@34@00
          (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))))
    (=
      (-
        $k@84@00
        (ite
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
            (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
            (=
              r
              (Seq_index
                ar@34@00
                (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))))
          ($Perm.min
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
              $k@78@00
              $Perm.No)
            $k@84@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@87@00 ($Snap Int Int Int Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef11|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef10|)))
(assert (sum_square%precondition ($Snap.combine
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
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@84@00))
(assert (forall ((k@83@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef11|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef10|)))
(assert (and
  (<= min@32@00 (+ i@28@00 1))
  (<= (+ i@28@00 1) max@33@00)
  (forall ((ix@81@00 Int) (jx@82@00 Int)) (!
    (=>
      (and
        (>= ix@81@00 0)
        (and
          (< ix@81@00 (Seq_length ar@34@00))
          (and
            (>= jx@82@00 0)
            (and (< jx@82@00 (Seq_length ar@34@00)) (not (= ix@81@00 jx@82@00))))))
      (not (= (Seq_index ar@34@00 ix@81@00) (Seq_index ar@34@00 jx@82@00))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@26@12@26@116|))
  (forall ((k@83@00 Int)) (!
    (=>
      (and
        (<= min@32@00 k@83@00)
        (and
          (< k@83@00 max@33@00)
          (and
            (<= lo@29@00 (mod k@83@00 step@31@00))
            (< (mod k@83@00 step@31@00) hi@30@00))))
      (and
        (=>
          (<= min@32@00 k@83@00)
          (and
            (<= min@32@00 k@83@00)
            (=>
              (< k@83@00 max@33@00)
              (and
                (< k@83@00 max@33@00)
                (or
                  (<= lo@29@00 (mod k@83@00 step@31@00))
                  (not (<= lo@29@00 (mod k@83@00 step@31@00))))))
            (or (< k@83@00 max@33@00) (not (< k@83@00 max@33@00)))))
        (or (<= min@32@00 k@83@00) (not (<= min@32@00 k@83@00)))))
    :pattern ((Seq_index ar@34@00 k@83@00))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
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
            $k@78@00
            $Perm.No)
          $Perm.No))
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
        (<
          (ite
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
              (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
              (=
                r
                (Seq_index
                  ar@34@00
                  (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))))
            $k@84@00
            $Perm.No)
          $k@78@00)
        (<
          (ite
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
              (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
              (=
                r
                (Seq_index
                  ar@34@00
                  (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))))
            $k@84@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@80@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
    :pattern ((inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
    :pattern ((img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
    :pattern ((Seq_index
      ar@34@00
      (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)))
    :qid |qp.srp9|))
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
    1) lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 58 | !(i@28@00 < max@33@00)]
(assert (not (< i@28@00 max@33@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@84@00))
(assert (forall ((k@83@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef11|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef10|)))
(assert (=>
  (< i@28@00 max@33@00)
  (and
    (< i@28@00 max@33@00)
    (or
      (<= lo@29@00 (mod i@28@00 step@31@00))
      (not (<= lo@29@00 (mod i@28@00 step@31@00))))
    (or
      (not
        (and
          (<= lo@29@00 (mod i@28@00 step@31@00))
          (< (mod i@28@00 step@31@00) hi@30@00)))
      (and
        (<= lo@29@00 (mod i@28@00 step@31@00))
        (< (mod i@28@00 step@31@00) hi@30@00)))
    (<= min@32@00 (+ i@28@00 1))
    (<= (+ i@28@00 1) max@33@00)
    (forall ((ix@81@00 Int) (jx@82@00 Int)) (!
      (=>
        (and
          (>= ix@81@00 0)
          (and
            (< ix@81@00 (Seq_length ar@34@00))
            (and
              (>= jx@82@00 0)
              (and
                (< jx@82@00 (Seq_length ar@34@00))
                (not (= ix@81@00 jx@82@00))))))
        (not (= (Seq_index ar@34@00 ix@81@00) (Seq_index ar@34@00 jx@82@00))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_vector_add_c.vpr@26@12@26@116|))
    (forall ((k@83@00 Int)) (!
      (=>
        (and
          (<= min@32@00 k@83@00)
          (and
            (< k@83@00 max@33@00)
            (and
              (<= lo@29@00 (mod k@83@00 step@31@00))
              (< (mod k@83@00 step@31@00) hi@30@00))))
        (and
          (=>
            (<= min@32@00 k@83@00)
            (and
              (<= min@32@00 k@83@00)
              (=>
                (< k@83@00 max@33@00)
                (and
                  (< k@83@00 max@33@00)
                  (or
                    (<= lo@29@00 (mod k@83@00 step@31@00))
                    (not (<= lo@29@00 (mod k@83@00 step@31@00))))))
              (or (< k@83@00 max@33@00) (not (< k@83@00 max@33@00)))))
          (or (<= min@32@00 k@83@00) (not (<= min@32@00 k@83@00)))))
      :pattern ((Seq_index ar@34@00 k@83@00))
      :qid |Ref__Integer_value-aux|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
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
              $k@78@00
              $Perm.No)
            $Perm.No))
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
          (<
            (ite
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
                (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                (=
                  r
                  (Seq_index
                    ar@34@00
                    (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))))
              $k@84@00
              $Perm.No)
            $k@78@00)
          (<
            (ite
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
                (img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)
                (=
                  r
                  (Seq_index
                    ar@34@00
                    (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))))
              $k@84@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@80@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
      :pattern ((inv@79@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
      :pattern ((img@86@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r))
      :pattern ((Seq_index
        ar@34@00
        (inv@85@00 s@$ i@28@00 lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00 r)))
      :qid |qp.srp9|))
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
      1) lo@29@00 hi@30@00 step@31@00 min@32@00 max@33@00 ar@34@00))))
; Joined path conditions
(assert (or (not (< i@28@00 max@33@00)) (< i@28@00 max@33@00)))
(assert (=
  result@35@00
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
      (sum_square ($Snap.combine
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
    0)))
(pop) ; 1
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
