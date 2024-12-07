(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:23:08
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr
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
; ---------- Ref__loop_main_54 ----------
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
; [then-branch: 1 | !(k@13@01 < |a@10@01|) | live]
; [else-branch: 1 | k@13@01 < |a@10@01| | live]
(push) ; 6
; [then-branch: 1 | !(k@13@01 < |a@10@01|)]
(assert (not (< k@13@01 (Seq_length a@10@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | k@13@01 < |a@10@01|]
(assert (< k@13@01 (Seq_length a@10@01)))
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
; [then-branch: 3 | !(j@14@01 < |a@10@01|) | live]
; [else-branch: 3 | j@14@01 < |a@10@01| | live]
(push) ; 10
; [then-branch: 3 | !(j@14@01 < |a@10@01|)]
(assert (not (< j@14@01 (Seq_length a@10@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@14@01 < |a@10@01|]
(assert (< j@14@01 (Seq_length a@10@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@14@01 (Seq_length a@10@01)) (not (< j@14@01 (Seq_length a@10@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@14@01 0)
  (and
    (>= j@14@01 0)
    (or (< j@14@01 (Seq_length a@10@01)) (not (< j@14@01 (Seq_length a@10@01)))))))
(assert (or (>= j@14@01 0) (not (>= j@14@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@13@01 (Seq_length a@10@01))
  (and
    (< k@13@01 (Seq_length a@10@01))
    (=>
      (>= j@14@01 0)
      (and
        (>= j@14@01 0)
        (or
          (< j@14@01 (Seq_length a@10@01))
          (not (< j@14@01 (Seq_length a@10@01))))))
    (or (>= j@14@01 0) (not (>= j@14@01 0))))))
(assert (or (< k@13@01 (Seq_length a@10@01)) (not (< k@13@01 (Seq_length a@10@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@13@01 0)
  (and
    (>= k@13@01 0)
    (=>
      (< k@13@01 (Seq_length a@10@01))
      (and
        (< k@13@01 (Seq_length a@10@01))
        (=>
          (>= j@14@01 0)
          (and
            (>= j@14@01 0)
            (or
              (< j@14@01 (Seq_length a@10@01))
              (not (< j@14@01 (Seq_length a@10@01))))))
        (or (>= j@14@01 0) (not (>= j@14@01 0)))))
    (or (< k@13@01 (Seq_length a@10@01)) (not (< k@13@01 (Seq_length a@10@01)))))))
(assert (or (>= k@13@01 0) (not (>= k@13@01 0))))
(push) ; 3
; [then-branch: 4 | k@13@01 >= 0 && k@13@01 < |a@10@01| && j@14@01 >= 0 && j@14@01 < |a@10@01| && k@13@01 != j@14@01 | live]
; [else-branch: 4 | !(k@13@01 >= 0 && k@13@01 < |a@10@01| && j@14@01 >= 0 && j@14@01 < |a@10@01| && k@13@01 != j@14@01) | live]
(push) ; 4
; [then-branch: 4 | k@13@01 >= 0 && k@13@01 < |a@10@01| && j@14@01 >= 0 && j@14@01 < |a@10@01| && k@13@01 != j@14@01]
(assert (and
  (>= k@13@01 0)
  (and
    (< k@13@01 (Seq_length a@10@01))
    (and
      (>= j@14@01 0)
      (and (< j@14@01 (Seq_length a@10@01)) (not (= k@13@01 j@14@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(k@13@01 >= 0 && k@13@01 < |a@10@01| && j@14@01 >= 0 && j@14@01 < |a@10@01| && k@13@01 != j@14@01)]
(assert (not
  (and
    (>= k@13@01 0)
    (and
      (< k@13@01 (Seq_length a@10@01))
      (and
        (>= j@14@01 0)
        (and (< j@14@01 (Seq_length a@10@01)) (not (= k@13@01 j@14@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@13@01 0)
    (and
      (< k@13@01 (Seq_length a@10@01))
      (and
        (>= j@14@01 0)
        (and (< j@14@01 (Seq_length a@10@01)) (not (= k@13@01 j@14@01))))))
  (and
    (>= k@13@01 0)
    (< k@13@01 (Seq_length a@10@01))
    (>= j@14@01 0)
    (< j@14@01 (Seq_length a@10@01))
    (not (= k@13@01 j@14@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@13@01 0)
      (and
        (< k@13@01 (Seq_length a@10@01))
        (and
          (>= j@14@01 0)
          (and (< j@14@01 (Seq_length a@10@01)) (not (= k@13@01 j@14@01)))))))
  (and
    (>= k@13@01 0)
    (and
      (< k@13@01 (Seq_length a@10@01))
      (and
        (>= j@14@01 0)
        (and (< j@14@01 (Seq_length a@10@01)) (not (= k@13@01 j@14@01))))))))
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
          (< k@13@01 (Seq_length a@10@01))
          (and
            (< k@13@01 (Seq_length a@10@01))
            (=>
              (>= j@14@01 0)
              (and
                (>= j@14@01 0)
                (or
                  (< j@14@01 (Seq_length a@10@01))
                  (not (< j@14@01 (Seq_length a@10@01))))))
            (or (>= j@14@01 0) (not (>= j@14@01 0)))))
        (or
          (< k@13@01 (Seq_length a@10@01))
          (not (< k@13@01 (Seq_length a@10@01))))))
    (or (>= k@13@01 0) (not (>= k@13@01 0)))
    (=>
      (and
        (>= k@13@01 0)
        (and
          (< k@13@01 (Seq_length a@10@01))
          (and
            (>= j@14@01 0)
            (and (< j@14@01 (Seq_length a@10@01)) (not (= k@13@01 j@14@01))))))
      (and
        (>= k@13@01 0)
        (< k@13@01 (Seq_length a@10@01))
        (>= j@14@01 0)
        (< j@14@01 (Seq_length a@10@01))
        (not (= k@13@01 j@14@01))))
    (or
      (not
        (and
          (>= k@13@01 0)
          (and
            (< k@13@01 (Seq_length a@10@01))
            (and
              (>= j@14@01 0)
              (and (< j@14@01 (Seq_length a@10@01)) (not (= k@13@01 j@14@01)))))))
      (and
        (>= k@13@01 0)
        (and
          (< k@13@01 (Seq_length a@10@01))
          (and
            (>= j@14@01 0)
            (and (< j@14@01 (Seq_length a@10@01)) (not (= k@13@01 j@14@01))))))))
  :pattern ((Seq_index a@10@01 k@13@01) (Seq_index a@10@01 j@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@61@12@61@100-aux|)))
(assert (forall ((k@13@01 Int) (j@14@01 Int)) (!
  (=>
    (and
      (>= k@13@01 0)
      (and
        (< k@13@01 (Seq_length a@10@01))
        (and
          (>= j@14@01 0)
          (and (< j@14@01 (Seq_length a@10@01)) (not (= k@13@01 j@14@01))))))
    (not (= (Seq_index a@10@01 k@13@01) (Seq_index a@10@01 j@14@01))))
  :pattern ((Seq_index a@10@01 k@13@01) (Seq_index a@10@01 j@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@61@12@61@100|)))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@62@12@62@100-aux|)))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@62@12@62@100|)))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@63@12@63@100-aux|)))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@63@12@63@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  $Snap.unit))
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
; [then-branch: 15 | 0 < len@9@01 | live]
; [else-branch: 15 | !(0 < len@9@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | 0 < len@9@01]
(assert (< 0 len@9@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 3
(push) ; 3
; [else-branch: 15 | !(0 < len@9@01)]
(assert (not (< 0 len@9@01)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (< 0 len@9@01)) (< 0 len@9@01)))
(assert (=> (< 0 len@9@01) (= (Seq_length a@10@01) len@9@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(declare-const i@19@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 16 | !(0 <= i@19@01) | live]
; [else-branch: 16 | 0 <= i@19@01 | live]
(push) ; 4
; [then-branch: 16 | !(0 <= i@19@01)]
(assert (not (<= 0 i@19@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | 0 <= i@19@01]
(assert (<= 0 i@19@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
(assert (and (<= 0 i@19@01) (< i@19@01 len@9@01)))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@19@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@19@01 (Seq_length a@10@01))))
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
    (and (<= 0 i@19@01) (< i@19@01 len@9@01))
    (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
  :pattern ((Seq_index a@10@01 i@19@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@19@01 Int) (i2@19@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@19@01) (< i1@19@01 len@9@01))
      (and (<= 0 i2@19@01) (< i2@19@01 len@9@01))
      (= (Seq_index a@10@01 i1@19@01) (Seq_index a@10@01 i2@19@01)))
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
    (and (<= 0 i@19@01) (< i@19@01 len@9@01))
    (and
      (= (inv@20@01 (Seq_index a@10@01 i@19@01)) i@19@01)
      (img@21@01 (Seq_index a@10@01 i@19@01))))
  :pattern ((Seq_index a@10@01 i@19@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) len@9@01)))
    (= (Seq_index a@10@01 (inv@20@01 r)) r))
  :pattern ((inv@20@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 len@9@01))
    (not (= (Seq_index a@10@01 i@19@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@19@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
; [eval] 0 <= 0 && 0 < len
; [eval] 0 <= 0
(push) ; 2
; [then-branch: 17 | False | live]
; [else-branch: 17 | True | live]
(push) ; 3
; [then-branch: 17 | False]
(assert false)
(pop) ; 3
(push) ; 3
; [else-branch: 17 | True]
; [eval] 0 < len
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(push) ; 2
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< 0 len@9@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | 0 < len@9@01 | live]
; [else-branch: 18 | !(0 < len@9@01) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 18 | 0 < len@9@01]
(assert (< 0 len@9@01))
; [eval] a[0]
(push) ; 3
(assert (not (< 0 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@22@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@22@01  $FVF<Ref__Integer_value>) (Seq_index
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
(declare-const i@23@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] 1 <= i
(push) ; 4
; [then-branch: 19 | !(1 <= i@23@01) | live]
; [else-branch: 19 | 1 <= i@23@01 | live]
(push) ; 5
; [then-branch: 19 | !(1 <= i@23@01)]
(assert (not (<= 1 i@23@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | 1 <= i@23@01]
(assert (<= 1 i@23@01))
; [eval] i < (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] (|a| - 1 < len ? |a| - 1 : len)
; [eval] |a| - 1 < len
; [eval] |a| - 1
; [eval] |a|
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length a@10@01) 1) len@9@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- (Seq_length a@10@01) 1) len@9@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | |a@10@01| - 1 < len@9@01 | live]
; [else-branch: 20 | !(|a@10@01| - 1 < len@9@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 20 | |a@10@01| - 1 < len@9@01]
(assert (< (- (Seq_length a@10@01) 1) len@9@01))
; [eval] |a| - 1
; [eval] |a|
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (< (- (Seq_length a@10@01) 1) len@9@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (<= 1 i@23@01) (and (<= 1 i@23@01) (< (- (Seq_length a@10@01) 1) len@9@01))))
(assert (or (<= 1 i@23@01) (not (<= 1 i@23@01))))
(assert (and (<= 1 i@23@01) (< i@23@01 (+ (- (Seq_length a@10@01) 1) 1))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@23@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@23@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@24@01 ($Ref) Int)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 1 i@23@01) (< i@23@01 (+ (- (Seq_length a@10@01) 1) 1)))
    (and
      (=>
        (<= 1 i@23@01)
        (and (<= 1 i@23@01) (< (- (Seq_length a@10@01) 1) len@9@01)))
      (or (<= 1 i@23@01) (not (<= 1 i@23@01)))))
  :pattern ((Seq_index a@10@01 i@23@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@23@01 Int) (i2@23@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@23@01) (< i1@23@01 (+ (- (Seq_length a@10@01) 1) 1)))
      (and (<= 1 i2@23@01) (< i2@23@01 (+ (- (Seq_length a@10@01) 1) 1)))
      (= (Seq_index a@10@01 i1@23@01) (Seq_index a@10@01 i2@23@01)))
    (= i1@23@01 i2@23@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 1 i@23@01) (< i@23@01 (+ (- (Seq_length a@10@01) 1) 1)))
    (and
      (= (inv@24@01 (Seq_index a@10@01 i@23@01)) i@23@01)
      (img@25@01 (Seq_index a@10@01 i@23@01))))
  :pattern ((Seq_index a@10@01 i@23@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@01 r)
      (and
        (<= 1 (inv@24@01 r))
        (< (inv@24@01 r) (+ (- (Seq_length a@10@01) 1) 1))))
    (= (Seq_index a@10@01 (inv@24@01 r)) r))
  :pattern ((inv@24@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 1 i@23@01) (< i@23@01 (+ (- (Seq_length a@10@01) 1) 1)))
    (not (= (Seq_index a@10@01 i@23@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@23@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@10@01 i@23@01) (Seq_index a@10@01 i@19@01))
    (=
      (and
        (img@25@01 r)
        (and
          (<= 1 (inv@24@01 r))
          (< (inv@24@01 r) (+ (- (Seq_length a@10@01) 1) 1))))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) len@9@01)))))
  
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
; [eval] 0 < len ==> |b| == len
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
; [then-branch: 21 | 0 < len@9@01 | live]
; [else-branch: 21 | !(0 < len@9@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | 0 < len@9@01]
; [eval] |b| == len
; [eval] |b|
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> (< 0 len@9@01) (= (Seq_length b@8@01) len@9@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
(declare-const i@26@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 22 | !(0 <= i@26@01) | live]
; [else-branch: 22 | 0 <= i@26@01 | live]
(push) ; 5
; [then-branch: 22 | !(0 <= i@26@01)]
(assert (not (<= 0 i@26@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | 0 <= i@26@01]
(assert (<= 0 i@26@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@26@01) (not (<= 0 i@26@01))))
(assert (and (<= 0 i@26@01) (< i@26@01 len@9@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@26@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@26@01 (Seq_length b@8@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@27@01 ($Ref) Int)
(declare-fun img@28@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (<= 0 i@26@01) (< i@26@01 len@9@01))
    (or (<= 0 i@26@01) (not (<= 0 i@26@01))))
  :pattern ((Seq_index b@8@01 i@26@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@26@01 Int) (i2@26@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@26@01) (< i1@26@01 len@9@01))
      (and (<= 0 i2@26@01) (< i2@26@01 len@9@01))
      (= (Seq_index b@8@01 i1@26@01) (Seq_index b@8@01 i2@26@01)))
    (= i1@26@01 i2@26@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (<= 0 i@26@01) (< i@26@01 len@9@01))
    (and
      (= (inv@27@01 (Seq_index b@8@01 i@26@01)) i@26@01)
      (img@28@01 (Seq_index b@8@01 i@26@01))))
  :pattern ((Seq_index b@8@01 i@26@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@28@01 r) (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) len@9@01)))
    (= (Seq_index b@8@01 (inv@27@01 r)) r))
  :pattern ((inv@27@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (<= 0 i@26@01) (< i@26@01 len@9@01))
    (not (= (Seq_index b@8@01 i@26@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@26@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@26@01) (Seq_index a@10@01 i@23@01))
    (=
      (and (img@28@01 r) (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) len@9@01)))
      (and
        (img@25@01 r)
        (and
          (<= 1 (inv@24@01 r))
          (< (inv@24@01 r) (+ (- (Seq_length a@10@01) 1) 1))))))
  
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
    (= (Seq_index b@8@01 i@26@01) (Seq_index a@10@01 i@19@01))
    (=
      (and (img@28@01 r) (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) len@9@01)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) len@9@01)))))
  
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
; [then-branch: 23 | 0 < len@9@01 | live]
; [else-branch: 23 | !(0 < len@9@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | 0 < len@9@01]
; [eval] |c| == len
; [eval] |c|
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> (< 0 len@9@01) (= (Seq_length c@11@01) len@9@01)))
(declare-const i@29@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 24 | !(0 <= i@29@01) | live]
; [else-branch: 24 | 0 <= i@29@01 | live]
(push) ; 5
; [then-branch: 24 | !(0 <= i@29@01)]
(assert (not (<= 0 i@29@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | 0 <= i@29@01]
(assert (<= 0 i@29@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
(assert (and (<= 0 i@29@01) (< i@29@01 len@9@01)))
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
    (and (<= 0 i@29@01) (< i@29@01 len@9@01))
    (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
  :pattern ((Seq_index c@11@01 i@29@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@29@01) (< i1@29@01 len@9@01))
      (and (<= 0 i2@29@01) (< i2@29@01 len@9@01))
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
    (and (<= 0 i@29@01) (< i@29@01 len@9@01))
    (and
      (= (inv@30@01 (Seq_index c@11@01 i@29@01)) i@29@01)
      (img@31@01 (Seq_index c@11@01 i@29@01))))
  :pattern ((Seq_index c@11@01 i@29@01))
  :qid |quant-u-58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
    (= (Seq_index c@11@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 0 i@29@01) (< i@29@01 len@9@01))
    (not (= (Seq_index c@11@01 i@29@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@29@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@29@01) (Seq_index b@8@01 i@26@01))
    (=
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
      (and (img@28@01 r) (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) len@9@01)))))
  
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
    (= (Seq_index c@11@01 i@29@01) (Seq_index a@10@01 i@23@01))
    (=
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
      (and
        (img@25@01 r)
        (and
          (<= 1 (inv@24@01 r))
          (< (inv@24@01 r) (+ (- (Seq_length a@10@01) 1) 1))))))
  
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
    (= (Seq_index c@11@01 i@29@01) (Seq_index a@10@01 i@19@01))
    (=
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@9@01)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) len@9@01)))))
  
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
(assert (= ($Snap.first $t@32@01) $Snap.unit))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | 0 < len@9@01 | live]
; [else-branch: 25 | !(0 < len@9@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | 0 < len@9@01]
; [eval] |a| == len
; [eval] |a|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@32@01))
    ($Snap.second ($Snap.second $t@32@01)))))
(declare-const i@33@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 26 | !(0 <= i@33@01) | live]
; [else-branch: 26 | 0 <= i@33@01 | live]
(push) ; 6
; [then-branch: 26 | !(0 <= i@33@01)]
(assert (not (<= 0 i@33@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 26 | 0 <= i@33@01]
(assert (<= 0 i@33@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@33@01) (not (<= 0 i@33@01))))
(assert (and (<= 0 i@33@01) (< i@33@01 len@9@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@33@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@33@01 (Seq_length a@10@01))))
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
    (and (<= 0 i@33@01) (< i@33@01 len@9@01))
    (or (<= 0 i@33@01) (not (<= 0 i@33@01))))
  :pattern ((Seq_index a@10@01 i@33@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@33@01 Int) (i2@33@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@33@01) (< i1@33@01 len@9@01))
      (and (<= 0 i2@33@01) (< i2@33@01 len@9@01))
      (= (Seq_index a@10@01 i1@33@01) (Seq_index a@10@01 i2@33@01)))
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
    (and (<= 0 i@33@01) (< i@33@01 len@9@01))
    (and
      (= (inv@34@01 (Seq_index a@10@01 i@33@01)) i@33@01)
      (img@35@01 (Seq_index a@10@01 i@33@01))))
  :pattern ((Seq_index a@10@01 i@33@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) len@9@01)))
    (= (Seq_index a@10@01 (inv@34@01 r)) r))
  :pattern ((inv@34@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 len@9@01))
    (not (= (Seq_index a@10@01 i@33@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@33@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@32@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@32@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@32@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@32@01))) $Snap.unit))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | 0 < len@9@01 | live]
; [else-branch: 27 | !(0 < len@9@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 27 | 0 < len@9@01]
; [eval] |b| == len
; [eval] |b|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@32@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@32@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@32@01)))))))
(declare-const i@36@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 28 | !(0 <= i@36@01) | live]
; [else-branch: 28 | 0 <= i@36@01 | live]
(push) ; 6
; [then-branch: 28 | !(0 <= i@36@01)]
(assert (not (<= 0 i@36@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 28 | 0 <= i@36@01]
(assert (<= 0 i@36@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@36@01) (not (<= 0 i@36@01))))
(assert (and (<= 0 i@36@01) (< i@36@01 len@9@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@36@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@36@01 (Seq_length b@8@01))))
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
    (and (<= 0 i@36@01) (< i@36@01 len@9@01))
    (or (<= 0 i@36@01) (not (<= 0 i@36@01))))
  :pattern ((Seq_index b@8@01 i@36@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@36@01 Int) (i2@36@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@36@01) (< i1@36@01 len@9@01))
      (and (<= 0 i2@36@01) (< i2@36@01 len@9@01))
      (= (Seq_index b@8@01 i1@36@01) (Seq_index b@8@01 i2@36@01)))
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
    (and (<= 0 i@36@01) (< i@36@01 len@9@01))
    (and
      (= (inv@37@01 (Seq_index b@8@01 i@36@01)) i@36@01)
      (img@38@01 (Seq_index b@8@01 i@36@01))))
  :pattern ((Seq_index b@8@01 i@36@01))
  :qid |quant-u-65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) len@9@01)))
    (= (Seq_index b@8@01 (inv@37@01 r)) r))
  :pattern ((inv@37@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 0 i@36@01) (< i@36@01 len@9@01))
    (not (= (Seq_index b@8@01 i@36@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@36@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@36@01) (Seq_index a@10@01 i@33@01))
    (=
      (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) len@9@01)))
      (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) len@9@01)))))
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@32@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@32@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@32@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@32@01)))))
  $Snap.unit))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@9@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | 0 < len@9@01 | live]
; [else-branch: 29 | !(0 < len@9@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 29 | 0 < len@9@01]
; [eval] |c| == len
; [eval] |c|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(declare-const i@39@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 30 | !(0 <= i@39@01) | live]
; [else-branch: 30 | 0 <= i@39@01 | live]
(push) ; 6
; [then-branch: 30 | !(0 <= i@39@01)]
(assert (not (<= 0 i@39@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 30 | 0 <= i@39@01]
(assert (<= 0 i@39@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@39@01) (not (<= 0 i@39@01))))
(assert (and (<= 0 i@39@01) (< i@39@01 len@9@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@39@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@39@01 (Seq_length c@11@01))))
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
    (and (<= 0 i@39@01) (< i@39@01 len@9@01))
    (or (<= 0 i@39@01) (not (<= 0 i@39@01))))
  :pattern ((Seq_index c@11@01 i@39@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@39@01 Int) (i2@39@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@39@01) (< i1@39@01 len@9@01))
      (and (<= 0 i2@39@01) (< i2@39@01 len@9@01))
      (= (Seq_index c@11@01 i1@39@01) (Seq_index c@11@01 i2@39@01)))
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
    (and (<= 0 i@39@01) (< i@39@01 len@9@01))
    (and
      (= (inv@40@01 (Seq_index c@11@01 i@39@01)) i@39@01)
      (img@41@01 (Seq_index c@11@01 i@39@01))))
  :pattern ((Seq_index c@11@01 i@39@01))
  :qid |quant-u-68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) len@9@01)))
    (= (Seq_index c@11@01 (inv@40@01 r)) r))
  :pattern ((inv@40@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@39@01 Int)) (!
  (=>
    (and (<= 0 i@39@01) (< i@39@01 len@9@01))
    (not (= (Seq_index c@11@01 i@39@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@39@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@39@01) (Seq_index b@8@01 i@36@01))
    (=
      (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) len@9@01)))
      (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) len@9@01)))))
  
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
    (= (Seq_index c@11@01 i@39@01) (Seq_index a@10@01 i@33@01))
    (=
      (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) len@9@01)))
      (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) len@9@01)))))
  
  :qid |quant-u-70|))))
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
; [else-branch: 18 | !(0 < len@9@01)]
(assert (not (< 0 len@9@01)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
(declare-const i@42@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] 1 <= i
(push) ; 4
; [then-branch: 31 | !(1 <= i@42@01) | live]
; [else-branch: 31 | 1 <= i@42@01 | live]
(push) ; 5
; [then-branch: 31 | !(1 <= i@42@01)]
(assert (not (<= 1 i@42@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 31 | 1 <= i@42@01]
(assert (<= 1 i@42@01))
; [eval] i < (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] (|a| - 1 < len ? |a| - 1 : len)
; [eval] |a| - 1 < len
; [eval] |a| - 1
; [eval] |a|
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length a@10@01) 1) len@9@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- (Seq_length a@10@01) 1) len@9@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | |a@10@01| - 1 < len@9@01 | live]
; [else-branch: 32 | !(|a@10@01| - 1 < len@9@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 32 | |a@10@01| - 1 < len@9@01]
(assert (< (- (Seq_length a@10@01) 1) len@9@01))
; [eval] |a| - 1
; [eval] |a|
(pop) ; 7
(push) ; 7
; [else-branch: 32 | !(|a@10@01| - 1 < len@9@01)]
(assert (not (< (- (Seq_length a@10@01) 1) len@9@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< (- (Seq_length a@10@01) 1) len@9@01))
  (< (- (Seq_length a@10@01) 1) len@9@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@42@01)
  (and
    (<= 1 i@42@01)
    (or
      (not (< (- (Seq_length a@10@01) 1) len@9@01))
      (< (- (Seq_length a@10@01) 1) len@9@01)))))
(assert (or (<= 1 i@42@01) (not (<= 1 i@42@01))))
(assert (and
  (<= 1 i@42@01)
  (<
    i@42@01
    (+
      (ite
        (< (- (Seq_length a@10@01) 1) len@9@01)
        (- (Seq_length a@10@01) 1)
        len@9@01)
      1))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@42@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@42@01 (Seq_length a@10@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@43@01 ($Ref) Int)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and
      (<= 1 i@42@01)
      (<
        i@42@01
        (+
          (ite
            (< (- (Seq_length a@10@01) 1) len@9@01)
            (- (Seq_length a@10@01) 1)
            len@9@01)
          1)))
    (and
      (=>
        (<= 1 i@42@01)
        (and
          (<= 1 i@42@01)
          (or
            (not (< (- (Seq_length a@10@01) 1) len@9@01))
            (< (- (Seq_length a@10@01) 1) len@9@01))))
      (or (<= 1 i@42@01) (not (<= 1 i@42@01)))))
  :pattern ((Seq_index a@10@01 i@42@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@42@01 Int) (i2@42@01 Int)) (!
  (=>
    (and
      (and
        (<= 1 i1@42@01)
        (<
          i1@42@01
          (+
            (ite
              (< (- (Seq_length a@10@01) 1) len@9@01)
              (- (Seq_length a@10@01) 1)
              len@9@01)
            1)))
      (and
        (<= 1 i2@42@01)
        (<
          i2@42@01
          (+
            (ite
              (< (- (Seq_length a@10@01) 1) len@9@01)
              (- (Seq_length a@10@01) 1)
              len@9@01)
            1)))
      (= (Seq_index a@10@01 i1@42@01) (Seq_index a@10@01 i2@42@01)))
    (= i1@42@01 i2@42@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and
      (<= 1 i@42@01)
      (<
        i@42@01
        (+
          (ite
            (< (- (Seq_length a@10@01) 1) len@9@01)
            (- (Seq_length a@10@01) 1)
            len@9@01)
          1)))
    (and
      (= (inv@43@01 (Seq_index a@10@01 i@42@01)) i@42@01)
      (img@44@01 (Seq_index a@10@01 i@42@01))))
  :pattern ((Seq_index a@10@01 i@42@01))
  :qid |quant-u-72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@44@01 r)
      (and
        (<= 1 (inv@43@01 r))
        (<
          (inv@43@01 r)
          (+
            (ite
              (< (- (Seq_length a@10@01) 1) len@9@01)
              (- (Seq_length a@10@01) 1)
              len@9@01)
            1))))
    (= (Seq_index a@10@01 (inv@43@01 r)) r))
  :pattern ((inv@43@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and
      (<= 1 i@42@01)
      (<
        i@42@01
        (+
          (ite
            (< (- (Seq_length a@10@01) 1) len@9@01)
            (- (Seq_length a@10@01) 1)
            len@9@01)
          1)))
    (not (= (Seq_index a@10@01 i@42@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@42@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@10@01 i@42@01) (Seq_index a@10@01 i@19@01))
    (=
      (and
        (img@44@01 r)
        (and
          (<= 1 (inv@43@01 r))
          (<
            (inv@43@01 r)
            (+
              (ite
                (< (- (Seq_length a@10@01) 1) len@9@01)
                (- (Seq_length a@10@01) 1)
                len@9@01)
              1))))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) len@9@01)))))
  
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
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
; [then-branch: 33 | 0 < len@9@01 | dead]
; [else-branch: 33 | !(0 < len@9@01) | live]
(push) ; 4
; [else-branch: 33 | !(0 < len@9@01)]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
(declare-const i@45@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 34 | !(0 <= i@45@01) | live]
; [else-branch: 34 | 0 <= i@45@01 | live]
(push) ; 5
; [then-branch: 34 | !(0 <= i@45@01)]
(assert (not (<= 0 i@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 34 | 0 <= i@45@01]
(assert (<= 0 i@45@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@45@01) (not (<= 0 i@45@01))))
(assert (and (<= 0 i@45@01) (< i@45@01 len@9@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@45@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@45@01 (Seq_length b@8@01))))
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
    (and (<= 0 i@45@01) (< i@45@01 len@9@01))
    (or (<= 0 i@45@01) (not (<= 0 i@45@01))))
  :pattern ((Seq_index b@8@01 i@45@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@45@01 Int) (i2@45@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@45@01) (< i1@45@01 len@9@01))
      (and (<= 0 i2@45@01) (< i2@45@01 len@9@01))
      (= (Seq_index b@8@01 i1@45@01) (Seq_index b@8@01 i2@45@01)))
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
    (and (<= 0 i@45@01) (< i@45@01 len@9@01))
    (and
      (= (inv@46@01 (Seq_index b@8@01 i@45@01)) i@45@01)
      (img@47@01 (Seq_index b@8@01 i@45@01))))
  :pattern ((Seq_index b@8@01 i@45@01))
  :qid |quant-u-75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@47@01 r) (and (<= 0 (inv@46@01 r)) (< (inv@46@01 r) len@9@01)))
    (= (Seq_index b@8@01 (inv@46@01 r)) r))
  :pattern ((inv@46@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@45@01 Int)) (!
  (=>
    (and (<= 0 i@45@01) (< i@45@01 len@9@01))
    (not (= (Seq_index b@8@01 i@45@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@45@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@45@01) (Seq_index a@10@01 i@42@01))
    (=
      (and (img@47@01 r) (and (<= 0 (inv@46@01 r)) (< (inv@46@01 r) len@9@01)))
      (and
        (img@44@01 r)
        (and
          (<= 1 (inv@43@01 r))
          (<
            (inv@43@01 r)
            (+
              (ite
                (< (- (Seq_length a@10@01) 1) len@9@01)
                (- (Seq_length a@10@01) 1)
                len@9@01)
              1))))))
  
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
    (= (Seq_index b@8@01 i@45@01) (Seq_index a@10@01 i@19@01))
    (=
      (and (img@47@01 r) (and (<= 0 (inv@46@01 r)) (< (inv@46@01 r) len@9@01)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) len@9@01)))))
  
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
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
; [then-branch: 35 | 0 < len@9@01 | dead]
; [else-branch: 35 | !(0 < len@9@01) | live]
(push) ; 4
; [else-branch: 35 | !(0 < len@9@01)]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(declare-const i@48@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 36 | !(0 <= i@48@01) | live]
; [else-branch: 36 | 0 <= i@48@01 | live]
(push) ; 5
; [then-branch: 36 | !(0 <= i@48@01)]
(assert (not (<= 0 i@48@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | 0 <= i@48@01]
(assert (<= 0 i@48@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@48@01) (not (<= 0 i@48@01))))
(assert (and (<= 0 i@48@01) (< i@48@01 len@9@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@48@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@48@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@49@01 ($Ref) Int)
(declare-fun img@50@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and (<= 0 i@48@01) (< i@48@01 len@9@01))
    (or (<= 0 i@48@01) (not (<= 0 i@48@01))))
  :pattern ((Seq_index c@11@01 i@48@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@48@01 Int) (i2@48@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@48@01) (< i1@48@01 len@9@01))
      (and (<= 0 i2@48@01) (< i2@48@01 len@9@01))
      (= (Seq_index c@11@01 i1@48@01) (Seq_index c@11@01 i2@48@01)))
    (= i1@48@01 i2@48@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and (<= 0 i@48@01) (< i@48@01 len@9@01))
    (and
      (= (inv@49@01 (Seq_index c@11@01 i@48@01)) i@48@01)
      (img@50@01 (Seq_index c@11@01 i@48@01))))
  :pattern ((Seq_index c@11@01 i@48@01))
  :qid |quant-u-79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@50@01 r) (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) len@9@01)))
    (= (Seq_index c@11@01 (inv@49@01 r)) r))
  :pattern ((inv@49@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and (<= 0 i@48@01) (< i@48@01 len@9@01))
    (not (= (Seq_index c@11@01 i@48@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@48@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@48@01) (Seq_index b@8@01 i@45@01))
    (=
      (and (img@50@01 r) (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) len@9@01)))
      (and (img@47@01 r) (and (<= 0 (inv@46@01 r)) (< (inv@46@01 r) len@9@01)))))
  
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
    (= (Seq_index c@11@01 i@48@01) (Seq_index a@10@01 i@42@01))
    (=
      (and (img@50@01 r) (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) len@9@01)))
      (and
        (img@44@01 r)
        (and
          (<= 1 (inv@43@01 r))
          (<
            (inv@43@01 r)
            (+
              (ite
                (< (- (Seq_length a@10@01) 1) len@9@01)
                (- (Seq_length a@10@01) 1)
                len@9@01)
              1))))))
  
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
    (= (Seq_index c@11@01 i@48@01) (Seq_index a@10@01 i@19@01))
    (=
      (and (img@50@01 r) (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) len@9@01)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) len@9@01)))))
  
  :qid |quant-u-82|))))
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
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (= ($Snap.first $t@51@01) $Snap.unit))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(push) ; 4
; [then-branch: 37 | 0 < len@9@01 | dead]
; [else-branch: 37 | !(0 < len@9@01) | live]
(push) ; 5
; [else-branch: 37 | !(0 < len@9@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second $t@51@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@51@01))
    ($Snap.second ($Snap.second $t@51@01)))))
(declare-const i@52@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 38 | !(0 <= i@52@01) | live]
; [else-branch: 38 | 0 <= i@52@01 | live]
(push) ; 6
; [then-branch: 38 | !(0 <= i@52@01)]
(assert (not (<= 0 i@52@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 38 | 0 <= i@52@01]
(assert (<= 0 i@52@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
(assert (and (<= 0 i@52@01) (< i@52@01 len@9@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@52@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@52@01 (Seq_length a@10@01))))
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
    (and (<= 0 i@52@01) (< i@52@01 len@9@01))
    (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
  :pattern ((Seq_index a@10@01 i@52@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@52@01 Int) (i2@52@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@52@01) (< i1@52@01 len@9@01))
      (and (<= 0 i2@52@01) (< i2@52@01 len@9@01))
      (= (Seq_index a@10@01 i1@52@01) (Seq_index a@10@01 i2@52@01)))
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
    (and (<= 0 i@52@01) (< i@52@01 len@9@01))
    (and
      (= (inv@53@01 (Seq_index a@10@01 i@52@01)) i@52@01)
      (img@54@01 (Seq_index a@10@01 i@52@01))))
  :pattern ((Seq_index a@10@01 i@52@01))
  :qid |quant-u-84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) len@9@01)))
    (= (Seq_index a@10@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 len@9@01))
    (not (= (Seq_index a@10@01 i@52@01) $Ref.null)))
  :pattern ((Seq_index a@10@01 i@52@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@51@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@51@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@51@01))) $Snap.unit))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(push) ; 4
; [then-branch: 39 | 0 < len@9@01 | dead]
; [else-branch: 39 | !(0 < len@9@01) | live]
(push) ; 5
; [else-branch: 39 | !(0 < len@9@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@51@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
(declare-const i@55@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 40 | !(0 <= i@55@01) | live]
; [else-branch: 40 | 0 <= i@55@01 | live]
(push) ; 6
; [then-branch: 40 | !(0 <= i@55@01)]
(assert (not (<= 0 i@55@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 40 | 0 <= i@55@01]
(assert (<= 0 i@55@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@55@01) (not (<= 0 i@55@01))))
(assert (and (<= 0 i@55@01) (< i@55@01 len@9@01)))
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
    (and (<= 0 i@55@01) (< i@55@01 len@9@01))
    (or (<= 0 i@55@01) (not (<= 0 i@55@01))))
  :pattern ((Seq_index b@8@01 i@55@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@55@01 Int) (i2@55@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@55@01) (< i1@55@01 len@9@01))
      (and (<= 0 i2@55@01) (< i2@55@01 len@9@01))
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
    (and (<= 0 i@55@01) (< i@55@01 len@9@01))
    (and
      (= (inv@56@01 (Seq_index b@8@01 i@55@01)) i@55@01)
      (img@57@01 (Seq_index b@8@01 i@55@01))))
  :pattern ((Seq_index b@8@01 i@55@01))
  :qid |quant-u-86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@57@01 r) (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) len@9@01)))
    (= (Seq_index b@8@01 (inv@56@01 r)) r))
  :pattern ((inv@56@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@55@01 Int)) (!
  (=>
    (and (<= 0 i@55@01) (< i@55@01 len@9@01))
    (not (= (Seq_index b@8@01 i@55@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@55@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@55@01) (Seq_index a@10@01 i@52@01))
    (=
      (and (img@57@01 r) (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) len@9@01)))
      (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) len@9@01)))))
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  $Snap.unit))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 41 | 0 < len@9@01 | dead]
; [else-branch: 41 | !(0 < len@9@01) | live]
(push) ; 5
; [else-branch: 41 | !(0 < len@9@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(declare-const i@58@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 42 | !(0 <= i@58@01) | live]
; [else-branch: 42 | 0 <= i@58@01 | live]
(push) ; 6
; [then-branch: 42 | !(0 <= i@58@01)]
(assert (not (<= 0 i@58@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 42 | 0 <= i@58@01]
(assert (<= 0 i@58@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@58@01) (not (<= 0 i@58@01))))
(assert (and (<= 0 i@58@01) (< i@58@01 len@9@01)))
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
    (and (<= 0 i@58@01) (< i@58@01 len@9@01))
    (or (<= 0 i@58@01) (not (<= 0 i@58@01))))
  :pattern ((Seq_index c@11@01 i@58@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@58@01 Int) (i2@58@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@58@01) (< i1@58@01 len@9@01))
      (and (<= 0 i2@58@01) (< i2@58@01 len@9@01))
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
    (and (<= 0 i@58@01) (< i@58@01 len@9@01))
    (and
      (= (inv@59@01 (Seq_index c@11@01 i@58@01)) i@58@01)
      (img@60@01 (Seq_index c@11@01 i@58@01))))
  :pattern ((Seq_index c@11@01 i@58@01))
  :qid |quant-u-89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@60@01 r) (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) len@9@01)))
    (= (Seq_index c@11@01 (inv@59@01 r)) r))
  :pattern ((inv@59@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@58@01 Int)) (!
  (=>
    (and (<= 0 i@58@01) (< i@58@01 len@9@01))
    (not (= (Seq_index c@11@01 i@58@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@58@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@58@01) (Seq_index b@8@01 i@55@01))
    (=
      (and (img@60@01 r) (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) len@9@01)))
      (and (img@57@01 r) (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) len@9@01)))))
  
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
    (= (Seq_index c@11@01 i@58@01) (Seq_index a@10@01 i@52@01))
    (=
      (and (img@60@01 r) (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) len@9@01)))
      (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) len@9@01)))))
  
  :qid |quant-u-91|))))
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
; ---------- Ref__recv_body_145 ----------
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
; ---------- Ref__send_body_152 ----------
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
; ---------- Ref__loop_body_54 ----------
(declare-const diz@80@01 $Ref)
(declare-const current_thread_id@81@01 Int)
(declare-const len@82@01 Int)
(declare-const b@83@01 Seq<$Ref>)
(declare-const a@84@01 Seq<$Ref>)
(declare-const i@85@01 Int)
(declare-const c@86@01 Seq<$Ref>)
(declare-const diz@87@01 $Ref)
(declare-const current_thread_id@88@01 Int)
(declare-const len@89@01 Int)
(declare-const b@90@01 Seq<$Ref>)
(declare-const a@91@01 Seq<$Ref>)
(declare-const i@92@01 Int)
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
(assert (<= 0 i@92@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@94@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@92@01 len@89@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
  $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@91@01) len@89@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
; [eval] a[i]
(push) ; 2
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@91@01 i@92@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
; [eval] i == 0
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= i@92@01 0))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= i@92@01 0)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | i@92@01 == 0 | live]
; [else-branch: 43 | i@92@01 != 0 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 43 | i@92@01 == 0]
(assert (= i@92@01 0))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@92@01 (- (Seq_length a@91@01) 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@92@01 (- (Seq_length a@91@01) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | i@92@01 < |a@91@01| - 1 | live]
; [else-branch: 44 | !(i@92@01 < |a@91@01| - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 44 | i@92@01 < |a@91@01| - 1]
(assert (< i@92@01 (- (Seq_length a@91@01) 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@92@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@92@01 1) (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index a@91@01 (+ i@92@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (= (Seq_length b@90@01) len@89@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))
; [eval] b[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) (Seq_index b@90@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index b@90@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index b@90@01 i@92@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (= (Seq_length c@93@01) len@89@01))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@92@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index c@93@01 i@92@01) $Ref.null)))
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
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second $t@95@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@95@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@95@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@95@01))) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@95@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@95@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index b@90@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@96@01 $Ref)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@97@01 Int)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@98@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@99@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@100@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@101@01 $Ref)
; [exec]
; __flatten_4 := a[i]
; [eval] a[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@102@01 $Ref)
(assert (= __flatten_4@102@01 (Seq_index a@91@01 i@92@01)))
; [exec]
; __flatten_6 := b[i]
; [eval] b[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@103@01 $Ref)
(assert (= __flatten_6@103@01 (Seq_index b@90@01 i@92@01)))
; [exec]
; __flatten_5 := __flatten_6.Ref__Integer_value + 1
; [eval] __flatten_6.Ref__Integer_value + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_6@103@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_6@103@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@104@01 Int)
(assert (=
  __flatten_5@104@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    1)))
; [exec]
; __flatten_4.Ref__Integer_value := __flatten_5
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_4@102@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_4@102@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) __flatten_4@102@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) __flatten_4@102@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_4@102@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_4@102@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) __flatten_4@102@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_4@102@01 $Ref.null)))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@92@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | i@92@01 > 0 | dead]
; [else-branch: 45 | !(i@92@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 45 | !(i@92@01 > 0)]
(assert (not (> i@92@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@92@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@92@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | !(i@92@01 > 0) | live]
; [else-branch: 46 | i@92@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 46 | !(i@92@01 > 0)]
(assert (not (> i@92@01 0)))
; [eval] i < len - 1
; [eval] len - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@92@01 (- len@89@01 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@92@01 (- len@89@01 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | i@92@01 < len@89@01 - 1 | live]
; [else-branch: 47 | !(i@92@01 < len@89@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 47 | i@92@01 < len@89@01 - 1]
(assert (< i@92@01 (- len@89@01 1)))
; [exec]
; __flatten_8 := c[i]
; [eval] c[i]
(push) ; 7
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@92@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_8@105@01 $Ref)
(assert (= __flatten_8@105@01 (Seq_index c@93@01 i@92@01)))
; [exec]
; __flatten_10 := a[i + 1]
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@92@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@92@01 1) (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_10@106@01 $Ref)
(assert (= __flatten_10@106@01 (Seq_index a@91@01 (+ i@92@01 1))))
; [exec]
; __flatten_9 := __flatten_10.Ref__Integer_value + 2
; [eval] __flatten_10.Ref__Integer_value + 2
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_4@102@01 __flatten_10@106@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_10@106@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_10@106@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) __flatten_10@106@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@107@01 Int)
(assert (=
  __flatten_9@107@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
    2)))
; [exec]
; __flatten_8.Ref__Integer_value := __flatten_9
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_4@102@01 __flatten_8@105@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_8@105@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_4@102@01 __flatten_8@105@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_8@105@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) __flatten_8@105@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_8@105@01 $Ref.null)))
; [exec]
; Ref__send_body_152(diz, current_thread_id, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] -1 <= i
; [eval] -1
(set-option :timeout 0)
(push) ; 7
(assert (not (<= (- 0 1) i@92@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= (- 0 1) i@92@01))
; [eval] i + 1 < |a|
; [eval] i + 1
; [eval] |a|
(push) ; 7
(assert (not (< (+ i@92@01 1) (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< (+ i@92@01 1) (Seq_length a@91@01)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@92@01 1) 0)))
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
; [eval] i < len
; [eval] |a| == len
; [eval] |a|
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@105@01 (Seq_index a@91@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |b| == len
; [eval] |b|
; [eval] b[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |c| == len
; [eval] |c|
; [eval] c[i]
(push) ; 7
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@92@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; [eval] !(i < len - 1)
; [eval] i < len - 1
; [eval] len - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@92@01 (- len@89@01 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | !(i@92@01 < len@89@01 - 1) | dead]
; [else-branch: 48 | i@92@01 < len@89@01 - 1 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 48 | i@92@01 < len@89@01 - 1]
(assert (< i@92@01 (- len@89@01 1)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 44 | !(i@92@01 < |a@91@01| - 1)]
(assert (not (< i@92@01 (- (Seq_length a@91@01) 1))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (= (Seq_length b@90@01) len@89@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index b@90@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index b@90@01 i@92@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (= (Seq_length c@93@01) len@89@01))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@92@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index c@93@01 i@92@01) $Ref.null)))
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
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second $t@108@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@108@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@108@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@108@01))) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@108@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@108@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index b@90@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@109@01 $Ref)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@110@01 Int)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@111@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@112@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@113@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@114@01 $Ref)
; [exec]
; __flatten_4 := a[i]
; [eval] a[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@115@01 $Ref)
(assert (= __flatten_4@115@01 (Seq_index a@91@01 i@92@01)))
; [exec]
; __flatten_6 := b[i]
; [eval] b[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@116@01 $Ref)
(assert (= __flatten_6@116@01 (Seq_index b@90@01 i@92@01)))
; [exec]
; __flatten_5 := __flatten_6.Ref__Integer_value + 1
; [eval] __flatten_6.Ref__Integer_value + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_6@116@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_6@116@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@117@01 Int)
(assert (=
  __flatten_5@117@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    1)))
; [exec]
; __flatten_4.Ref__Integer_value := __flatten_5
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_4@115@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_4@115@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) __flatten_4@115@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_4@115@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_4@115@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_4@115@01 $Ref.null)))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@92@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | i@92@01 > 0 | dead]
; [else-branch: 49 | !(i@92@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 49 | !(i@92@01 > 0)]
(assert (not (> i@92@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@92@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@92@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | !(i@92@01 > 0) | live]
; [else-branch: 50 | i@92@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 50 | !(i@92@01 > 0)]
(assert (not (> i@92@01 0)))
; [eval] i < len - 1
; [eval] len - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@92@01 (- len@89@01 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 51 | i@92@01 < len@89@01 - 1 | dead]
; [else-branch: 51 | !(i@92@01 < len@89@01 - 1) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 51 | !(i@92@01 < len@89@01 - 1)]
(assert (not (< i@92@01 (- len@89@01 1))))
(pop) ; 6
; [eval] !(i < len - 1)
; [eval] i < len - 1
; [eval] len - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@92@01 (- len@89@01 1))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@92@01 (- len@89@01 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | !(i@92@01 < len@89@01 - 1) | live]
; [else-branch: 52 | i@92@01 < len@89@01 - 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 52 | !(i@92@01 < len@89@01 - 1)]
(assert (not (< i@92@01 (- len@89@01 1))))
; [eval] 0 <= i
; [eval] i < len
; [eval] |a| == len
; [eval] |a|
; [eval] a[i]
(push) ; 7
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |b| == len
; [eval] |b|
; [eval] b[i]
(push) ; 7
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |c| == len
; [eval] |c|
; [eval] c[i]
(push) ; 7
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@92@01 (Seq_length c@93@01))))
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
; [else-branch: 43 | i@92@01 != 0]
(assert (not (= i@92@01 0)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@92@01 (- (Seq_length a@91@01) 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@92@01 (- (Seq_length a@91@01) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | i@92@01 < |a@91@01| - 1 | live]
; [else-branch: 53 | !(i@92@01 < |a@91@01| - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 53 | i@92@01 < |a@91@01| - 1]
(assert (< i@92@01 (- (Seq_length a@91@01) 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@92@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@92@01 1) (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index a@91@01 (+ i@92@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (= (Seq_length b@90@01) len@89@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))
; [eval] b[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) (Seq_index b@90@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index b@90@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index b@90@01 i@92@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (= (Seq_length c@93@01) len@89@01))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@92@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index c@93@01 i@92@01) $Ref.null)))
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
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second $t@118@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@118@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@118@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@118@01))) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@118@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@118@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index b@90@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) (Seq_index c@93@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@119@01 $Ref)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@120@01 Int)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@121@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@122@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@123@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@124@01 $Ref)
; [exec]
; __flatten_4 := a[i]
; [eval] a[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length a@91@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@125@01 $Ref)
(assert (= __flatten_4@125@01 (Seq_index a@91@01 i@92@01)))
; [exec]
; __flatten_6 := b[i]
; [eval] b[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length b@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@126@01 $Ref)
(assert (= __flatten_6@126@01 (Seq_index b@90@01 i@92@01)))
; [exec]
; __flatten_5 := __flatten_6.Ref__Integer_value + 1
; [eval] __flatten_6.Ref__Integer_value + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_6@126@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_6@126@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@127@01 Int)
(assert (=
  __flatten_5@127@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    1)))
; [exec]
; __flatten_4.Ref__Integer_value := __flatten_5
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) __flatten_4@125@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) __flatten_4@125@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) __flatten_4@125@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) __flatten_4@125@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) (Seq_index b@90@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) (Seq_index a@91@01 (+ i@92@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) (Seq_index a@91@01 (+ i@92@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 (+ i@92@01 1)) (Seq_index a@91@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@90@01 i@92@01) (Seq_index a@91@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@92@01) (Seq_index a@91@01 i@92@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index a@91@01 i@92@01) (Seq_index c@93@01 i@92@01)))
  (not (= (Seq_index a@91@01 (+ i@92@01 1)) (Seq_index c@93@01 i@92@01)))
  (not (= (Seq_index b@90@01 i@92@01) (Seq_index c@93@01 i@92@01)))
  (and
    (not (= (Seq_index c@93@01 i@92@01) (Seq_index a@91@01 i@92@01)))
    (not (= (Seq_index c@93@01 i@92@01) (Seq_index a@91@01 (+ i@92@01 1))))
    (not (= (Seq_index c@93@01 i@92@01) (Seq_index b@90@01 i@92@01))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@91@01 i@92@01) __flatten_4@125@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Ref__guard_check_S2_S1 ----------
(declare-const diz@128@01 $Ref)
(declare-const current_thread_id@129@01 Int)
(declare-const len@130@01 Int)
(declare-const b@131@01 Seq<$Ref>)
(declare-const a@132@01 Seq<$Ref>)
(declare-const i@133@01 Int)
(declare-const c@134@01 Seq<$Ref>)
(declare-const diz@135@01 $Ref)
(declare-const current_thread_id@136@01 Int)
(declare-const len@137@01 Int)
(declare-const b@138@01 Seq<$Ref>)
(declare-const a@139@01 Seq<$Ref>)
(declare-const i@140@01 Int)
(declare-const c@141@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@142@01 $Snap)
(assert (= $t@142@01 ($Snap.combine ($Snap.first $t@142@01) ($Snap.second $t@142@01))))
(assert (= ($Snap.first $t@142@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@135@01 $Ref.null)))
(assert (=
  ($Snap.second $t@142@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@142@01))
    ($Snap.second ($Snap.second $t@142@01)))))
(assert (= ($Snap.first ($Snap.second $t@142@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@136@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@142@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@142@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@142@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@140@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@142@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@140@01 len@137@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@140@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@143@01 $Snap)
(assert (= $t@143@01 ($Snap.combine ($Snap.first $t@143@01) ($Snap.second $t@143@01))))
(assert (= ($Snap.first $t@143@01) $Snap.unit))
; [eval] 1 <= i
(assert (<= 1 i@140@01))
(assert (= ($Snap.second $t@143@01) $Snap.unit))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
(assert (< (- i@140@01 1) (- len@137@01 1)))
(pop) ; 2
(push) ; 2
; [eval] 1 <= i
(push) ; 3
(assert (not (<= 1 i@140@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 i@140@01))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
(push) ; 3
(assert (not (< (- i@140@01 1) (- len@137@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (- i@140@01 1) (- len@137@01 1)))
(pop) ; 2
(pop) ; 1
; ---------- Ref__resource_check_S2_S1 ----------
(declare-const diz@144@01 $Ref)
(declare-const current_thread_id@145@01 Int)
(declare-const len@146@01 Int)
(declare-const b@147@01 Seq<$Ref>)
(declare-const a@148@01 Seq<$Ref>)
(declare-const i@149@01 Int)
(declare-const c@150@01 Seq<$Ref>)
(declare-const diz@151@01 $Ref)
(declare-const current_thread_id@152@01 Int)
(declare-const len@153@01 Int)
(declare-const b@154@01 Seq<$Ref>)
(declare-const a@155@01 Seq<$Ref>)
(declare-const i@156@01 Int)
(declare-const c@157@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@158@01 $Snap)
(assert (= $t@158@01 ($Snap.combine ($Snap.first $t@158@01) ($Snap.second $t@158@01))))
(assert (= ($Snap.first $t@158@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@151@01 $Ref.null)))
(assert (=
  ($Snap.second $t@158@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@158@01))
    ($Snap.second ($Snap.second $t@158@01)))))
(assert (= ($Snap.first ($Snap.second $t@158@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@152@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@158@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@158@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@158@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@158@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@156@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@158@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@158@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@158@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@156@01 len@153@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01)))))
  $Snap.unit))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
(assert (< (- i@156@01 1) (- len@153@01 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01))))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@156@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@158@01)))))))
  $Snap.unit))
; [eval] len <= |a|
; [eval] |a|
(assert (<= len@153@01 (Seq_length a@155@01)))
; [eval] a[i - 1 + 1]
; [eval] i - 1 + 1
; [eval] i - 1
(push) ; 2
(assert (not (>= (+ (- i@156@01 1) 1) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< (+ (- i@156@01 1) 1) (Seq_length a@155@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@155@01 (+ (- i@156@01 1) 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@159@01 $Snap)
(assert (= $t@159@01 ($Snap.combine ($Snap.first $t@159@01) ($Snap.second $t@159@01))))
(assert (= ($Snap.first $t@159@01) $Snap.unit))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
; [eval] a[i]
(push) ; 3
(assert (not (>= i@156@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@156@01 (Seq_length a@155@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@155@01 i@156@01) $Ref.null)))
(pop) ; 2
(push) ; 2
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
; [eval] a[i]
(push) ; 3
(assert (not (>= i@156@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@156@01 (Seq_length a@155@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@155@01 (+ (- i@156@01 1) 1)) (Seq_index a@155@01 i@156@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__example ----------
(declare-const diz@160@01 $Ref)
(declare-const current_thread_id@161@01 Int)
(declare-const a@162@01 Seq<$Ref>)
(declare-const b@163@01 Seq<$Ref>)
(declare-const c@164@01 Seq<$Ref>)
(declare-const len@165@01 Int)
(declare-const diz@166@01 $Ref)
(declare-const current_thread_id@167@01 Int)
(declare-const a@168@01 Seq<$Ref>)
(declare-const b@169@01 Seq<$Ref>)
(declare-const c@170@01 Seq<$Ref>)
(declare-const len@171@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@172@01 $Snap)
(assert (= $t@172@01 ($Snap.combine ($Snap.first $t@172@01) ($Snap.second $t@172@01))))
(assert (= ($Snap.first $t@172@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@166@01 $Ref.null)))
(assert (=
  ($Snap.second $t@172@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@172@01))
    ($Snap.second ($Snap.second $t@172@01)))))
(assert (= ($Snap.first ($Snap.second $t@172@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@167@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@172@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@172@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@172@01))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@173@01 Int)
(declare-const j@174@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 54 | !(k@173@01 >= 0) | live]
; [else-branch: 54 | k@173@01 >= 0 | live]
(push) ; 4
; [then-branch: 54 | !(k@173@01 >= 0)]
(assert (not (>= k@173@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 54 | k@173@01 >= 0]
(assert (>= k@173@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 55 | !(k@173@01 < |a@168@01|) | live]
; [else-branch: 55 | k@173@01 < |a@168@01| | live]
(push) ; 6
; [then-branch: 55 | !(k@173@01 < |a@168@01|)]
(assert (not (< k@173@01 (Seq_length a@168@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 55 | k@173@01 < |a@168@01|]
(assert (< k@173@01 (Seq_length a@168@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 56 | !(j@174@01 >= 0) | live]
; [else-branch: 56 | j@174@01 >= 0 | live]
(push) ; 8
; [then-branch: 56 | !(j@174@01 >= 0)]
(assert (not (>= j@174@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 56 | j@174@01 >= 0]
(assert (>= j@174@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 57 | !(j@174@01 < |a@168@01|) | live]
; [else-branch: 57 | j@174@01 < |a@168@01| | live]
(push) ; 10
; [then-branch: 57 | !(j@174@01 < |a@168@01|)]
(assert (not (< j@174@01 (Seq_length a@168@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 57 | j@174@01 < |a@168@01|]
(assert (< j@174@01 (Seq_length a@168@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@174@01 (Seq_length a@168@01)) (not (< j@174@01 (Seq_length a@168@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@174@01 0)
  (and
    (>= j@174@01 0)
    (or
      (< j@174@01 (Seq_length a@168@01))
      (not (< j@174@01 (Seq_length a@168@01)))))))
(assert (or (>= j@174@01 0) (not (>= j@174@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@173@01 (Seq_length a@168@01))
  (and
    (< k@173@01 (Seq_length a@168@01))
    (=>
      (>= j@174@01 0)
      (and
        (>= j@174@01 0)
        (or
          (< j@174@01 (Seq_length a@168@01))
          (not (< j@174@01 (Seq_length a@168@01))))))
    (or (>= j@174@01 0) (not (>= j@174@01 0))))))
(assert (or (< k@173@01 (Seq_length a@168@01)) (not (< k@173@01 (Seq_length a@168@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@173@01 0)
  (and
    (>= k@173@01 0)
    (=>
      (< k@173@01 (Seq_length a@168@01))
      (and
        (< k@173@01 (Seq_length a@168@01))
        (=>
          (>= j@174@01 0)
          (and
            (>= j@174@01 0)
            (or
              (< j@174@01 (Seq_length a@168@01))
              (not (< j@174@01 (Seq_length a@168@01))))))
        (or (>= j@174@01 0) (not (>= j@174@01 0)))))
    (or
      (< k@173@01 (Seq_length a@168@01))
      (not (< k@173@01 (Seq_length a@168@01)))))))
(assert (or (>= k@173@01 0) (not (>= k@173@01 0))))
(push) ; 3
; [then-branch: 58 | k@173@01 >= 0 && k@173@01 < |a@168@01| && j@174@01 >= 0 && j@174@01 < |a@168@01| && k@173@01 != j@174@01 | live]
; [else-branch: 58 | !(k@173@01 >= 0 && k@173@01 < |a@168@01| && j@174@01 >= 0 && j@174@01 < |a@168@01| && k@173@01 != j@174@01) | live]
(push) ; 4
; [then-branch: 58 | k@173@01 >= 0 && k@173@01 < |a@168@01| && j@174@01 >= 0 && j@174@01 < |a@168@01| && k@173@01 != j@174@01]
(assert (and
  (>= k@173@01 0)
  (and
    (< k@173@01 (Seq_length a@168@01))
    (and
      (>= j@174@01 0)
      (and (< j@174@01 (Seq_length a@168@01)) (not (= k@173@01 j@174@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 4
(push) ; 4
; [else-branch: 58 | !(k@173@01 >= 0 && k@173@01 < |a@168@01| && j@174@01 >= 0 && j@174@01 < |a@168@01| && k@173@01 != j@174@01)]
(assert (not
  (and
    (>= k@173@01 0)
    (and
      (< k@173@01 (Seq_length a@168@01))
      (and
        (>= j@174@01 0)
        (and (< j@174@01 (Seq_length a@168@01)) (not (= k@173@01 j@174@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@173@01 0)
    (and
      (< k@173@01 (Seq_length a@168@01))
      (and
        (>= j@174@01 0)
        (and (< j@174@01 (Seq_length a@168@01)) (not (= k@173@01 j@174@01))))))
  (and
    (>= k@173@01 0)
    (< k@173@01 (Seq_length a@168@01))
    (>= j@174@01 0)
    (< j@174@01 (Seq_length a@168@01))
    (not (= k@173@01 j@174@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@173@01 0)
      (and
        (< k@173@01 (Seq_length a@168@01))
        (and
          (>= j@174@01 0)
          (and (< j@174@01 (Seq_length a@168@01)) (not (= k@173@01 j@174@01)))))))
  (and
    (>= k@173@01 0)
    (and
      (< k@173@01 (Seq_length a@168@01))
      (and
        (>= j@174@01 0)
        (and (< j@174@01 (Seq_length a@168@01)) (not (= k@173@01 j@174@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@173@01 Int) (j@174@01 Int)) (!
  (and
    (=>
      (>= k@173@01 0)
      (and
        (>= k@173@01 0)
        (=>
          (< k@173@01 (Seq_length a@168@01))
          (and
            (< k@173@01 (Seq_length a@168@01))
            (=>
              (>= j@174@01 0)
              (and
                (>= j@174@01 0)
                (or
                  (< j@174@01 (Seq_length a@168@01))
                  (not (< j@174@01 (Seq_length a@168@01))))))
            (or (>= j@174@01 0) (not (>= j@174@01 0)))))
        (or
          (< k@173@01 (Seq_length a@168@01))
          (not (< k@173@01 (Seq_length a@168@01))))))
    (or (>= k@173@01 0) (not (>= k@173@01 0)))
    (=>
      (and
        (>= k@173@01 0)
        (and
          (< k@173@01 (Seq_length a@168@01))
          (and
            (>= j@174@01 0)
            (and (< j@174@01 (Seq_length a@168@01)) (not (= k@173@01 j@174@01))))))
      (and
        (>= k@173@01 0)
        (< k@173@01 (Seq_length a@168@01))
        (>= j@174@01 0)
        (< j@174@01 (Seq_length a@168@01))
        (not (= k@173@01 j@174@01))))
    (or
      (not
        (and
          (>= k@173@01 0)
          (and
            (< k@173@01 (Seq_length a@168@01))
            (and
              (>= j@174@01 0)
              (and
                (< j@174@01 (Seq_length a@168@01))
                (not (= k@173@01 j@174@01)))))))
      (and
        (>= k@173@01 0)
        (and
          (< k@173@01 (Seq_length a@168@01))
          (and
            (>= j@174@01 0)
            (and (< j@174@01 (Seq_length a@168@01)) (not (= k@173@01 j@174@01))))))))
  :pattern ((Seq_index a@168@01 k@173@01) (Seq_index a@168@01 j@174@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@170@12@170@100-aux|)))
(assert (forall ((k@173@01 Int) (j@174@01 Int)) (!
  (=>
    (and
      (>= k@173@01 0)
      (and
        (< k@173@01 (Seq_length a@168@01))
        (and
          (>= j@174@01 0)
          (and (< j@174@01 (Seq_length a@168@01)) (not (= k@173@01 j@174@01))))))
    (not (= (Seq_index a@168@01 k@173@01) (Seq_index a@168@01 j@174@01))))
  :pattern ((Seq_index a@168@01 k@173@01) (Seq_index a@168@01 j@174@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@170@12@170@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@172@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@172@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@172@01))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { b[k], b[j] } k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j])
(declare-const k@175@01 Int)
(declare-const j@176@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j]
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 59 | !(k@175@01 >= 0) | live]
; [else-branch: 59 | k@175@01 >= 0 | live]
(push) ; 4
; [then-branch: 59 | !(k@175@01 >= 0)]
(assert (not (>= k@175@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 59 | k@175@01 >= 0]
(assert (>= k@175@01 0))
; [eval] k < |b|
; [eval] |b|
(push) ; 5
; [then-branch: 60 | !(k@175@01 < |b@169@01|) | live]
; [else-branch: 60 | k@175@01 < |b@169@01| | live]
(push) ; 6
; [then-branch: 60 | !(k@175@01 < |b@169@01|)]
(assert (not (< k@175@01 (Seq_length b@169@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 60 | k@175@01 < |b@169@01|]
(assert (< k@175@01 (Seq_length b@169@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 61 | !(j@176@01 >= 0) | live]
; [else-branch: 61 | j@176@01 >= 0 | live]
(push) ; 8
; [then-branch: 61 | !(j@176@01 >= 0)]
(assert (not (>= j@176@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 61 | j@176@01 >= 0]
(assert (>= j@176@01 0))
; [eval] j < |b|
; [eval] |b|
(push) ; 9
; [then-branch: 62 | !(j@176@01 < |b@169@01|) | live]
; [else-branch: 62 | j@176@01 < |b@169@01| | live]
(push) ; 10
; [then-branch: 62 | !(j@176@01 < |b@169@01|)]
(assert (not (< j@176@01 (Seq_length b@169@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 62 | j@176@01 < |b@169@01|]
(assert (< j@176@01 (Seq_length b@169@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@176@01 (Seq_length b@169@01)) (not (< j@176@01 (Seq_length b@169@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@176@01 0)
  (and
    (>= j@176@01 0)
    (or
      (< j@176@01 (Seq_length b@169@01))
      (not (< j@176@01 (Seq_length b@169@01)))))))
(assert (or (>= j@176@01 0) (not (>= j@176@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@175@01 (Seq_length b@169@01))
  (and
    (< k@175@01 (Seq_length b@169@01))
    (=>
      (>= j@176@01 0)
      (and
        (>= j@176@01 0)
        (or
          (< j@176@01 (Seq_length b@169@01))
          (not (< j@176@01 (Seq_length b@169@01))))))
    (or (>= j@176@01 0) (not (>= j@176@01 0))))))
(assert (or (< k@175@01 (Seq_length b@169@01)) (not (< k@175@01 (Seq_length b@169@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@175@01 0)
  (and
    (>= k@175@01 0)
    (=>
      (< k@175@01 (Seq_length b@169@01))
      (and
        (< k@175@01 (Seq_length b@169@01))
        (=>
          (>= j@176@01 0)
          (and
            (>= j@176@01 0)
            (or
              (< j@176@01 (Seq_length b@169@01))
              (not (< j@176@01 (Seq_length b@169@01))))))
        (or (>= j@176@01 0) (not (>= j@176@01 0)))))
    (or
      (< k@175@01 (Seq_length b@169@01))
      (not (< k@175@01 (Seq_length b@169@01)))))))
(assert (or (>= k@175@01 0) (not (>= k@175@01 0))))
(push) ; 3
; [then-branch: 63 | k@175@01 >= 0 && k@175@01 < |b@169@01| && j@176@01 >= 0 && j@176@01 < |b@169@01| && k@175@01 != j@176@01 | live]
; [else-branch: 63 | !(k@175@01 >= 0 && k@175@01 < |b@169@01| && j@176@01 >= 0 && j@176@01 < |b@169@01| && k@175@01 != j@176@01) | live]
(push) ; 4
; [then-branch: 63 | k@175@01 >= 0 && k@175@01 < |b@169@01| && j@176@01 >= 0 && j@176@01 < |b@169@01| && k@175@01 != j@176@01]
(assert (and
  (>= k@175@01 0)
  (and
    (< k@175@01 (Seq_length b@169@01))
    (and
      (>= j@176@01 0)
      (and (< j@176@01 (Seq_length b@169@01)) (not (= k@175@01 j@176@01)))))))
; [eval] b[k] != b[j]
; [eval] b[k]
; [eval] b[j]
(pop) ; 4
(push) ; 4
; [else-branch: 63 | !(k@175@01 >= 0 && k@175@01 < |b@169@01| && j@176@01 >= 0 && j@176@01 < |b@169@01| && k@175@01 != j@176@01)]
(assert (not
  (and
    (>= k@175@01 0)
    (and
      (< k@175@01 (Seq_length b@169@01))
      (and
        (>= j@176@01 0)
        (and (< j@176@01 (Seq_length b@169@01)) (not (= k@175@01 j@176@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@175@01 0)
    (and
      (< k@175@01 (Seq_length b@169@01))
      (and
        (>= j@176@01 0)
        (and (< j@176@01 (Seq_length b@169@01)) (not (= k@175@01 j@176@01))))))
  (and
    (>= k@175@01 0)
    (< k@175@01 (Seq_length b@169@01))
    (>= j@176@01 0)
    (< j@176@01 (Seq_length b@169@01))
    (not (= k@175@01 j@176@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@175@01 0)
      (and
        (< k@175@01 (Seq_length b@169@01))
        (and
          (>= j@176@01 0)
          (and (< j@176@01 (Seq_length b@169@01)) (not (= k@175@01 j@176@01)))))))
  (and
    (>= k@175@01 0)
    (and
      (< k@175@01 (Seq_length b@169@01))
      (and
        (>= j@176@01 0)
        (and (< j@176@01 (Seq_length b@169@01)) (not (= k@175@01 j@176@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@175@01 Int) (j@176@01 Int)) (!
  (and
    (=>
      (>= k@175@01 0)
      (and
        (>= k@175@01 0)
        (=>
          (< k@175@01 (Seq_length b@169@01))
          (and
            (< k@175@01 (Seq_length b@169@01))
            (=>
              (>= j@176@01 0)
              (and
                (>= j@176@01 0)
                (or
                  (< j@176@01 (Seq_length b@169@01))
                  (not (< j@176@01 (Seq_length b@169@01))))))
            (or (>= j@176@01 0) (not (>= j@176@01 0)))))
        (or
          (< k@175@01 (Seq_length b@169@01))
          (not (< k@175@01 (Seq_length b@169@01))))))
    (or (>= k@175@01 0) (not (>= k@175@01 0)))
    (=>
      (and
        (>= k@175@01 0)
        (and
          (< k@175@01 (Seq_length b@169@01))
          (and
            (>= j@176@01 0)
            (and (< j@176@01 (Seq_length b@169@01)) (not (= k@175@01 j@176@01))))))
      (and
        (>= k@175@01 0)
        (< k@175@01 (Seq_length b@169@01))
        (>= j@176@01 0)
        (< j@176@01 (Seq_length b@169@01))
        (not (= k@175@01 j@176@01))))
    (or
      (not
        (and
          (>= k@175@01 0)
          (and
            (< k@175@01 (Seq_length b@169@01))
            (and
              (>= j@176@01 0)
              (and
                (< j@176@01 (Seq_length b@169@01))
                (not (= k@175@01 j@176@01)))))))
      (and
        (>= k@175@01 0)
        (and
          (< k@175@01 (Seq_length b@169@01))
          (and
            (>= j@176@01 0)
            (and (< j@176@01 (Seq_length b@169@01)) (not (= k@175@01 j@176@01))))))))
  :pattern ((Seq_index b@169@01 k@175@01) (Seq_index b@169@01 j@176@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@171@12@171@100-aux|)))
(assert (forall ((k@175@01 Int) (j@176@01 Int)) (!
  (=>
    (and
      (>= k@175@01 0)
      (and
        (< k@175@01 (Seq_length b@169@01))
        (and
          (>= j@176@01 0)
          (and (< j@176@01 (Seq_length b@169@01)) (not (= k@175@01 j@176@01))))))
    (not (= (Seq_index b@169@01 k@175@01) (Seq_index b@169@01 j@176@01))))
  :pattern ((Seq_index b@169@01 k@175@01) (Seq_index b@169@01 j@176@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@171@12@171@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { c[k], c[j] } k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j])
(declare-const k@177@01 Int)
(declare-const j@178@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j]
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 64 | !(k@177@01 >= 0) | live]
; [else-branch: 64 | k@177@01 >= 0 | live]
(push) ; 4
; [then-branch: 64 | !(k@177@01 >= 0)]
(assert (not (>= k@177@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 64 | k@177@01 >= 0]
(assert (>= k@177@01 0))
; [eval] k < |c|
; [eval] |c|
(push) ; 5
; [then-branch: 65 | !(k@177@01 < |c@170@01|) | live]
; [else-branch: 65 | k@177@01 < |c@170@01| | live]
(push) ; 6
; [then-branch: 65 | !(k@177@01 < |c@170@01|)]
(assert (not (< k@177@01 (Seq_length c@170@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 65 | k@177@01 < |c@170@01|]
(assert (< k@177@01 (Seq_length c@170@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 66 | !(j@178@01 >= 0) | live]
; [else-branch: 66 | j@178@01 >= 0 | live]
(push) ; 8
; [then-branch: 66 | !(j@178@01 >= 0)]
(assert (not (>= j@178@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 66 | j@178@01 >= 0]
(assert (>= j@178@01 0))
; [eval] j < |c|
; [eval] |c|
(push) ; 9
; [then-branch: 67 | !(j@178@01 < |c@170@01|) | live]
; [else-branch: 67 | j@178@01 < |c@170@01| | live]
(push) ; 10
; [then-branch: 67 | !(j@178@01 < |c@170@01|)]
(assert (not (< j@178@01 (Seq_length c@170@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 67 | j@178@01 < |c@170@01|]
(assert (< j@178@01 (Seq_length c@170@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@178@01 (Seq_length c@170@01)) (not (< j@178@01 (Seq_length c@170@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@178@01 0)
  (and
    (>= j@178@01 0)
    (or
      (< j@178@01 (Seq_length c@170@01))
      (not (< j@178@01 (Seq_length c@170@01)))))))
(assert (or (>= j@178@01 0) (not (>= j@178@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@177@01 (Seq_length c@170@01))
  (and
    (< k@177@01 (Seq_length c@170@01))
    (=>
      (>= j@178@01 0)
      (and
        (>= j@178@01 0)
        (or
          (< j@178@01 (Seq_length c@170@01))
          (not (< j@178@01 (Seq_length c@170@01))))))
    (or (>= j@178@01 0) (not (>= j@178@01 0))))))
(assert (or (< k@177@01 (Seq_length c@170@01)) (not (< k@177@01 (Seq_length c@170@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@177@01 0)
  (and
    (>= k@177@01 0)
    (=>
      (< k@177@01 (Seq_length c@170@01))
      (and
        (< k@177@01 (Seq_length c@170@01))
        (=>
          (>= j@178@01 0)
          (and
            (>= j@178@01 0)
            (or
              (< j@178@01 (Seq_length c@170@01))
              (not (< j@178@01 (Seq_length c@170@01))))))
        (or (>= j@178@01 0) (not (>= j@178@01 0)))))
    (or
      (< k@177@01 (Seq_length c@170@01))
      (not (< k@177@01 (Seq_length c@170@01)))))))
(assert (or (>= k@177@01 0) (not (>= k@177@01 0))))
(push) ; 3
; [then-branch: 68 | k@177@01 >= 0 && k@177@01 < |c@170@01| && j@178@01 >= 0 && j@178@01 < |c@170@01| && k@177@01 != j@178@01 | live]
; [else-branch: 68 | !(k@177@01 >= 0 && k@177@01 < |c@170@01| && j@178@01 >= 0 && j@178@01 < |c@170@01| && k@177@01 != j@178@01) | live]
(push) ; 4
; [then-branch: 68 | k@177@01 >= 0 && k@177@01 < |c@170@01| && j@178@01 >= 0 && j@178@01 < |c@170@01| && k@177@01 != j@178@01]
(assert (and
  (>= k@177@01 0)
  (and
    (< k@177@01 (Seq_length c@170@01))
    (and
      (>= j@178@01 0)
      (and (< j@178@01 (Seq_length c@170@01)) (not (= k@177@01 j@178@01)))))))
; [eval] c[k] != c[j]
; [eval] c[k]
; [eval] c[j]
(pop) ; 4
(push) ; 4
; [else-branch: 68 | !(k@177@01 >= 0 && k@177@01 < |c@170@01| && j@178@01 >= 0 && j@178@01 < |c@170@01| && k@177@01 != j@178@01)]
(assert (not
  (and
    (>= k@177@01 0)
    (and
      (< k@177@01 (Seq_length c@170@01))
      (and
        (>= j@178@01 0)
        (and (< j@178@01 (Seq_length c@170@01)) (not (= k@177@01 j@178@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@177@01 0)
    (and
      (< k@177@01 (Seq_length c@170@01))
      (and
        (>= j@178@01 0)
        (and (< j@178@01 (Seq_length c@170@01)) (not (= k@177@01 j@178@01))))))
  (and
    (>= k@177@01 0)
    (< k@177@01 (Seq_length c@170@01))
    (>= j@178@01 0)
    (< j@178@01 (Seq_length c@170@01))
    (not (= k@177@01 j@178@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@177@01 0)
      (and
        (< k@177@01 (Seq_length c@170@01))
        (and
          (>= j@178@01 0)
          (and (< j@178@01 (Seq_length c@170@01)) (not (= k@177@01 j@178@01)))))))
  (and
    (>= k@177@01 0)
    (and
      (< k@177@01 (Seq_length c@170@01))
      (and
        (>= j@178@01 0)
        (and (< j@178@01 (Seq_length c@170@01)) (not (= k@177@01 j@178@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@177@01 Int) (j@178@01 Int)) (!
  (and
    (=>
      (>= k@177@01 0)
      (and
        (>= k@177@01 0)
        (=>
          (< k@177@01 (Seq_length c@170@01))
          (and
            (< k@177@01 (Seq_length c@170@01))
            (=>
              (>= j@178@01 0)
              (and
                (>= j@178@01 0)
                (or
                  (< j@178@01 (Seq_length c@170@01))
                  (not (< j@178@01 (Seq_length c@170@01))))))
            (or (>= j@178@01 0) (not (>= j@178@01 0)))))
        (or
          (< k@177@01 (Seq_length c@170@01))
          (not (< k@177@01 (Seq_length c@170@01))))))
    (or (>= k@177@01 0) (not (>= k@177@01 0)))
    (=>
      (and
        (>= k@177@01 0)
        (and
          (< k@177@01 (Seq_length c@170@01))
          (and
            (>= j@178@01 0)
            (and (< j@178@01 (Seq_length c@170@01)) (not (= k@177@01 j@178@01))))))
      (and
        (>= k@177@01 0)
        (< k@177@01 (Seq_length c@170@01))
        (>= j@178@01 0)
        (< j@178@01 (Seq_length c@170@01))
        (not (= k@177@01 j@178@01))))
    (or
      (not
        (and
          (>= k@177@01 0)
          (and
            (< k@177@01 (Seq_length c@170@01))
            (and
              (>= j@178@01 0)
              (and
                (< j@178@01 (Seq_length c@170@01))
                (not (= k@177@01 j@178@01)))))))
      (and
        (>= k@177@01 0)
        (and
          (< k@177@01 (Seq_length c@170@01))
          (and
            (>= j@178@01 0)
            (and (< j@178@01 (Seq_length c@170@01)) (not (= k@177@01 j@178@01))))))))
  :pattern ((Seq_index c@170@01 k@177@01) (Seq_index c@170@01 j@178@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@172@12@172@100-aux|)))
(assert (forall ((k@177@01 Int) (j@178@01 Int)) (!
  (=>
    (and
      (>= k@177@01 0)
      (and
        (< k@177@01 (Seq_length c@170@01))
        (and
          (>= j@178@01 0)
          (and (< j@178@01 (Seq_length c@170@01)) (not (= k@177@01 j@178@01))))))
    (not (= (Seq_index c@170@01 k@177@01) (Seq_index c@170@01 j@178@01))))
  :pattern ((Seq_index c@170@01 k@177@01) (Seq_index c@170@01 j@178@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@172@12@172@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))
  $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@168@01) len@171@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))
(declare-const i@179@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 69 | !(0 <= i@179@01) | live]
; [else-branch: 69 | 0 <= i@179@01 | live]
(push) ; 4
; [then-branch: 69 | !(0 <= i@179@01)]
(assert (not (<= 0 i@179@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 69 | 0 <= i@179@01]
(assert (<= 0 i@179@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@179@01) (not (<= 0 i@179@01))))
(assert (and (<= 0 i@179@01) (< i@179@01 len@171@01)))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@179@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@179@01 (Seq_length a@168@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@180@01 ($Ref) Int)
(declare-fun img@181@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@179@01 Int)) (!
  (=>
    (and (<= 0 i@179@01) (< i@179@01 len@171@01))
    (or (<= 0 i@179@01) (not (<= 0 i@179@01))))
  :pattern ((Seq_index a@168@01 i@179@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@179@01 Int) (i2@179@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@179@01) (< i1@179@01 len@171@01))
      (and (<= 0 i2@179@01) (< i2@179@01 len@171@01))
      (= (Seq_index a@168@01 i1@179@01) (Seq_index a@168@01 i2@179@01)))
    (= i1@179@01 i2@179@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@179@01 Int)) (!
  (=>
    (and (<= 0 i@179@01) (< i@179@01 len@171@01))
    (and
      (= (inv@180@01 (Seq_index a@168@01 i@179@01)) i@179@01)
      (img@181@01 (Seq_index a@168@01 i@179@01))))
  :pattern ((Seq_index a@168@01 i@179@01))
  :qid |quant-u-93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@181@01 r)
      (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
    (= (Seq_index a@168@01 (inv@180@01 r)) r))
  :pattern ((inv@180@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@179@01 Int)) (!
  (=>
    (and (<= 0 i@179@01) (< i@179@01 len@171@01))
    (not (= (Seq_index a@168@01 i@179@01) $Ref.null)))
  :pattern ((Seq_index a@168@01 i@179@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))
  $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (= (Seq_length b@169@01) len@171@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))))
(declare-const i@182@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 70 | !(0 <= i@182@01) | live]
; [else-branch: 70 | 0 <= i@182@01 | live]
(push) ; 4
; [then-branch: 70 | !(0 <= i@182@01)]
(assert (not (<= 0 i@182@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 70 | 0 <= i@182@01]
(assert (<= 0 i@182@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@182@01) (not (<= 0 i@182@01))))
(assert (and (<= 0 i@182@01) (< i@182@01 len@171@01)))
; [eval] b[i]
(push) ; 3
(assert (not (>= i@182@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@182@01 (Seq_length b@169@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@183@01 ($Ref) Int)
(declare-fun img@184@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@182@01 Int)) (!
  (=>
    (and (<= 0 i@182@01) (< i@182@01 len@171@01))
    (or (<= 0 i@182@01) (not (<= 0 i@182@01))))
  :pattern ((Seq_index b@169@01 i@182@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@182@01 Int) (i2@182@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@182@01) (< i1@182@01 len@171@01))
      (and (<= 0 i2@182@01) (< i2@182@01 len@171@01))
      (= (Seq_index b@169@01 i1@182@01) (Seq_index b@169@01 i2@182@01)))
    (= i1@182@01 i2@182@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@182@01 Int)) (!
  (=>
    (and (<= 0 i@182@01) (< i@182@01 len@171@01))
    (and
      (= (inv@183@01 (Seq_index b@169@01 i@182@01)) i@182@01)
      (img@184@01 (Seq_index b@169@01 i@182@01))))
  :pattern ((Seq_index b@169@01 i@182@01))
  :qid |quant-u-95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
    (= (Seq_index b@169@01 (inv@183@01 r)) r))
  :pattern ((inv@183@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@182@01 Int)) (!
  (=>
    (and (<= 0 i@182@01) (< i@182@01 len@171@01))
    (not (= (Seq_index b@169@01 i@182@01) $Ref.null)))
  :pattern ((Seq_index b@169@01 i@182@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@169@01 i@182@01) (Seq_index a@168@01 i@179@01))
    (=
      (and
        (img@184@01 r)
        (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))))
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(assert (= (Seq_length c@170@01) len@171@01))
(declare-const i@185@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 71 | !(0 <= i@185@01) | live]
; [else-branch: 71 | 0 <= i@185@01 | live]
(push) ; 4
; [then-branch: 71 | !(0 <= i@185@01)]
(assert (not (<= 0 i@185@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 71 | 0 <= i@185@01]
(assert (<= 0 i@185@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@185@01) (not (<= 0 i@185@01))))
(assert (and (<= 0 i@185@01) (< i@185@01 len@171@01)))
; [eval] c[i]
(push) ; 3
(assert (not (>= i@185@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@185@01 (Seq_length c@170@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@186@01 ($Ref) Int)
(declare-fun img@187@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@185@01 Int)) (!
  (=>
    (and (<= 0 i@185@01) (< i@185@01 len@171@01))
    (or (<= 0 i@185@01) (not (<= 0 i@185@01))))
  :pattern ((Seq_index c@170@01 i@185@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@185@01 Int) (i2@185@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@185@01) (< i1@185@01 len@171@01))
      (and (<= 0 i2@185@01) (< i2@185@01 len@171@01))
      (= (Seq_index c@170@01 i1@185@01) (Seq_index c@170@01 i2@185@01)))
    (= i1@185@01 i2@185@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@185@01 Int)) (!
  (=>
    (and (<= 0 i@185@01) (< i@185@01 len@171@01))
    (and
      (= (inv@186@01 (Seq_index c@170@01 i@185@01)) i@185@01)
      (img@187@01 (Seq_index c@170@01 i@185@01))))
  :pattern ((Seq_index c@170@01 i@185@01))
  :qid |quant-u-98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
    (= (Seq_index c@170@01 (inv@186@01 r)) r))
  :pattern ((inv@186@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@185@01 Int)) (!
  (=>
    (and (<= 0 i@185@01) (< i@185@01 len@171@01))
    (not (= (Seq_index c@170@01 i@185@01) $Ref.null)))
  :pattern ((Seq_index c@170@01 i@185@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@170@01 i@185@01) (Seq_index b@169@01 i@182@01))
    (=
      (and
        (img@187@01 r)
        (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
      (and
        (img@184@01 r)
        (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))))
  
  :qid |quant-u-99|))))
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
    (= (Seq_index c@170@01 i@185@01) (Seq_index a@168@01 i@179@01))
    (=
      (and
        (img@187@01 r)
        (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))))
  
  :qid |quant-u-100|))))
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
(declare-const $t@188@01 $Snap)
(assert (= $t@188@01 ($Snap.combine ($Snap.first $t@188@01) ($Snap.second $t@188@01))))
(assert (= ($Snap.first $t@188@01) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second $t@188@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@188@01))
    ($Snap.second ($Snap.second $t@188@01)))))
(declare-const i@189@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 72 | !(0 <= i@189@01) | live]
; [else-branch: 72 | 0 <= i@189@01 | live]
(push) ; 5
; [then-branch: 72 | !(0 <= i@189@01)]
(assert (not (<= 0 i@189@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 72 | 0 <= i@189@01]
(assert (<= 0 i@189@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@189@01) (not (<= 0 i@189@01))))
(assert (and (<= 0 i@189@01) (< i@189@01 len@171@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@189@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@189@01 (Seq_length a@168@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@190@01 ($Ref) Int)
(declare-fun img@191@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@189@01 Int)) (!
  (=>
    (and (<= 0 i@189@01) (< i@189@01 len@171@01))
    (or (<= 0 i@189@01) (not (<= 0 i@189@01))))
  :pattern ((Seq_index a@168@01 i@189@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@189@01 Int) (i2@189@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@189@01) (< i1@189@01 len@171@01))
      (and (<= 0 i2@189@01) (< i2@189@01 len@171@01))
      (= (Seq_index a@168@01 i1@189@01) (Seq_index a@168@01 i2@189@01)))
    (= i1@189@01 i2@189@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@189@01 Int)) (!
  (=>
    (and (<= 0 i@189@01) (< i@189@01 len@171@01))
    (and
      (= (inv@190@01 (Seq_index a@168@01 i@189@01)) i@189@01)
      (img@191@01 (Seq_index a@168@01 i@189@01))))
  :pattern ((Seq_index a@168@01 i@189@01))
  :qid |quant-u-102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@191@01 r)
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@171@01)))
    (= (Seq_index a@168@01 (inv@190@01 r)) r))
  :pattern ((inv@190@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@189@01 Int)) (!
  (=>
    (and (<= 0 i@189@01) (< i@189@01 len@171@01))
    (not (= (Seq_index a@168@01 i@189@01) $Ref.null)))
  :pattern ((Seq_index a@168@01 i@189@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@188@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@188@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@188@01))) $Snap.unit))
; [eval] |b| == len
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@188@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))
(declare-const i@192@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 73 | !(0 <= i@192@01) | live]
; [else-branch: 73 | 0 <= i@192@01 | live]
(push) ; 5
; [then-branch: 73 | !(0 <= i@192@01)]
(assert (not (<= 0 i@192@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 73 | 0 <= i@192@01]
(assert (<= 0 i@192@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@192@01) (not (<= 0 i@192@01))))
(assert (and (<= 0 i@192@01) (< i@192@01 len@171@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@192@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@192@01 (Seq_length b@169@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@193@01 ($Ref) Int)
(declare-fun img@194@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@192@01 Int)) (!
  (=>
    (and (<= 0 i@192@01) (< i@192@01 len@171@01))
    (or (<= 0 i@192@01) (not (<= 0 i@192@01))))
  :pattern ((Seq_index b@169@01 i@192@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@192@01 Int) (i2@192@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@192@01) (< i1@192@01 len@171@01))
      (and (<= 0 i2@192@01) (< i2@192@01 len@171@01))
      (= (Seq_index b@169@01 i1@192@01) (Seq_index b@169@01 i2@192@01)))
    (= i1@192@01 i2@192@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@192@01 Int)) (!
  (=>
    (and (<= 0 i@192@01) (< i@192@01 len@171@01))
    (and
      (= (inv@193@01 (Seq_index b@169@01 i@192@01)) i@192@01)
      (img@194@01 (Seq_index b@169@01 i@192@01))))
  :pattern ((Seq_index b@169@01 i@192@01))
  :qid |quant-u-104|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@194@01 r)
      (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@171@01)))
    (= (Seq_index b@169@01 (inv@193@01 r)) r))
  :pattern ((inv@193@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@192@01 Int)) (!
  (=>
    (and (<= 0 i@192@01) (< i@192@01 len@171@01))
    (not (= (Seq_index b@169@01 i@192@01) $Ref.null)))
  :pattern ((Seq_index b@169@01 i@192@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@169@01 i@192@01) (Seq_index a@168@01 i@189@01))
    (=
      (and
        (img@194@01 r)
        (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@171@01)))
      (and
        (img@191@01 r)
        (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@171@01)))))
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))
  $Snap.unit))
; [eval] |c| == len
; [eval] |c|
(declare-const i@195@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 74 | !(0 <= i@195@01) | live]
; [else-branch: 74 | 0 <= i@195@01 | live]
(push) ; 5
; [then-branch: 74 | !(0 <= i@195@01)]
(assert (not (<= 0 i@195@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 74 | 0 <= i@195@01]
(assert (<= 0 i@195@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@195@01) (not (<= 0 i@195@01))))
(assert (and (<= 0 i@195@01) (< i@195@01 len@171@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@195@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@195@01 (Seq_length c@170@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@196@01 ($Ref) Int)
(declare-fun img@197@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@195@01 Int)) (!
  (=>
    (and (<= 0 i@195@01) (< i@195@01 len@171@01))
    (or (<= 0 i@195@01) (not (<= 0 i@195@01))))
  :pattern ((Seq_index c@170@01 i@195@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@195@01 Int) (i2@195@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@195@01) (< i1@195@01 len@171@01))
      (and (<= 0 i2@195@01) (< i2@195@01 len@171@01))
      (= (Seq_index c@170@01 i1@195@01) (Seq_index c@170@01 i2@195@01)))
    (= i1@195@01 i2@195@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@195@01 Int)) (!
  (=>
    (and (<= 0 i@195@01) (< i@195@01 len@171@01))
    (and
      (= (inv@196@01 (Seq_index c@170@01 i@195@01)) i@195@01)
      (img@197@01 (Seq_index c@170@01 i@195@01))))
  :pattern ((Seq_index c@170@01 i@195@01))
  :qid |quant-u-107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@197@01 r)
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@171@01)))
    (= (Seq_index c@170@01 (inv@196@01 r)) r))
  :pattern ((inv@196@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@195@01 Int)) (!
  (=>
    (and (<= 0 i@195@01) (< i@195@01 len@171@01))
    (not (= (Seq_index c@170@01 i@195@01) $Ref.null)))
  :pattern ((Seq_index c@170@01 i@195@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@170@01 i@195@01) (Seq_index b@169@01 i@192@01))
    (=
      (and
        (img@197@01 r)
        (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@171@01)))
      (and
        (img@194@01 r)
        (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@171@01)))))
  
  :qid |quant-u-108|))))
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
    (= (Seq_index c@170@01 i@195@01) (Seq_index a@168@01 i@189@01))
    (=
      (and
        (img@197@01 r)
        (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@171@01)))
      (and
        (img@191@01 r)
        (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@171@01)))))
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; assert |a| == len
; [eval] |a| == len
; [eval] |a|
; [exec]
; assert |b| == len
; [eval] |b| == len
; [eval] |b|
; [exec]
; assert |c| == len
; [eval] |c| == len
; [eval] |c|
; [exec]
; Ref__loop_main_54(diz, current_thread_id, b, len, a, c)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@198@01 Int)
(declare-const j@199@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 75 | !(k@198@01 >= 0) | live]
; [else-branch: 75 | k@198@01 >= 0 | live]
(push) ; 5
; [then-branch: 75 | !(k@198@01 >= 0)]
(assert (not (>= k@198@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 75 | k@198@01 >= 0]
(assert (>= k@198@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 6
; [then-branch: 76 | !(k@198@01 < |a@168@01|) | live]
; [else-branch: 76 | k@198@01 < |a@168@01| | live]
(push) ; 7
; [then-branch: 76 | !(k@198@01 < |a@168@01|)]
(assert (not (< k@198@01 (Seq_length a@168@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 76 | k@198@01 < |a@168@01|]
(assert (< k@198@01 (Seq_length a@168@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 77 | !(j@199@01 >= 0) | live]
; [else-branch: 77 | j@199@01 >= 0 | live]
(push) ; 9
; [then-branch: 77 | !(j@199@01 >= 0)]
(assert (not (>= j@199@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 77 | j@199@01 >= 0]
(assert (>= j@199@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 10
; [then-branch: 78 | !(j@199@01 < |a@168@01|) | live]
; [else-branch: 78 | j@199@01 < |a@168@01| | live]
(push) ; 11
; [then-branch: 78 | !(j@199@01 < |a@168@01|)]
(assert (not (< j@199@01 (Seq_length a@168@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 78 | j@199@01 < |a@168@01|]
(assert (< j@199@01 (Seq_length a@168@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@199@01 (Seq_length a@168@01)) (not (< j@199@01 (Seq_length a@168@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@199@01 0)
  (and
    (>= j@199@01 0)
    (or
      (< j@199@01 (Seq_length a@168@01))
      (not (< j@199@01 (Seq_length a@168@01)))))))
(assert (or (>= j@199@01 0) (not (>= j@199@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@198@01 (Seq_length a@168@01))
  (and
    (< k@198@01 (Seq_length a@168@01))
    (=>
      (>= j@199@01 0)
      (and
        (>= j@199@01 0)
        (or
          (< j@199@01 (Seq_length a@168@01))
          (not (< j@199@01 (Seq_length a@168@01))))))
    (or (>= j@199@01 0) (not (>= j@199@01 0))))))
(assert (or (< k@198@01 (Seq_length a@168@01)) (not (< k@198@01 (Seq_length a@168@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@198@01 0)
  (and
    (>= k@198@01 0)
    (=>
      (< k@198@01 (Seq_length a@168@01))
      (and
        (< k@198@01 (Seq_length a@168@01))
        (=>
          (>= j@199@01 0)
          (and
            (>= j@199@01 0)
            (or
              (< j@199@01 (Seq_length a@168@01))
              (not (< j@199@01 (Seq_length a@168@01))))))
        (or (>= j@199@01 0) (not (>= j@199@01 0)))))
    (or
      (< k@198@01 (Seq_length a@168@01))
      (not (< k@198@01 (Seq_length a@168@01)))))))
(assert (or (>= k@198@01 0) (not (>= k@198@01 0))))
(push) ; 4
; [then-branch: 79 | k@198@01 >= 0 && k@198@01 < |a@168@01| && j@199@01 >= 0 && j@199@01 < |a@168@01| && k@198@01 != j@199@01 | live]
; [else-branch: 79 | !(k@198@01 >= 0 && k@198@01 < |a@168@01| && j@199@01 >= 0 && j@199@01 < |a@168@01| && k@198@01 != j@199@01) | live]
(push) ; 5
; [then-branch: 79 | k@198@01 >= 0 && k@198@01 < |a@168@01| && j@199@01 >= 0 && j@199@01 < |a@168@01| && k@198@01 != j@199@01]
(assert (and
  (>= k@198@01 0)
  (and
    (< k@198@01 (Seq_length a@168@01))
    (and
      (>= j@199@01 0)
      (and (< j@199@01 (Seq_length a@168@01)) (not (= k@198@01 j@199@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 5
(push) ; 5
; [else-branch: 79 | !(k@198@01 >= 0 && k@198@01 < |a@168@01| && j@199@01 >= 0 && j@199@01 < |a@168@01| && k@198@01 != j@199@01)]
(assert (not
  (and
    (>= k@198@01 0)
    (and
      (< k@198@01 (Seq_length a@168@01))
      (and
        (>= j@199@01 0)
        (and (< j@199@01 (Seq_length a@168@01)) (not (= k@198@01 j@199@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@198@01 0)
    (and
      (< k@198@01 (Seq_length a@168@01))
      (and
        (>= j@199@01 0)
        (and (< j@199@01 (Seq_length a@168@01)) (not (= k@198@01 j@199@01))))))
  (and
    (>= k@198@01 0)
    (< k@198@01 (Seq_length a@168@01))
    (>= j@199@01 0)
    (< j@199@01 (Seq_length a@168@01))
    (not (= k@198@01 j@199@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@198@01 0)
      (and
        (< k@198@01 (Seq_length a@168@01))
        (and
          (>= j@199@01 0)
          (and (< j@199@01 (Seq_length a@168@01)) (not (= k@198@01 j@199@01)))))))
  (and
    (>= k@198@01 0)
    (and
      (< k@198@01 (Seq_length a@168@01))
      (and
        (>= j@199@01 0)
        (and (< j@199@01 (Seq_length a@168@01)) (not (= k@198@01 j@199@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@198@01 Int) (j@199@01 Int)) (!
  (and
    (=>
      (>= k@198@01 0)
      (and
        (>= k@198@01 0)
        (=>
          (< k@198@01 (Seq_length a@168@01))
          (and
            (< k@198@01 (Seq_length a@168@01))
            (=>
              (>= j@199@01 0)
              (and
                (>= j@199@01 0)
                (or
                  (< j@199@01 (Seq_length a@168@01))
                  (not (< j@199@01 (Seq_length a@168@01))))))
            (or (>= j@199@01 0) (not (>= j@199@01 0)))))
        (or
          (< k@198@01 (Seq_length a@168@01))
          (not (< k@198@01 (Seq_length a@168@01))))))
    (or (>= k@198@01 0) (not (>= k@198@01 0)))
    (=>
      (and
        (>= k@198@01 0)
        (and
          (< k@198@01 (Seq_length a@168@01))
          (and
            (>= j@199@01 0)
            (and (< j@199@01 (Seq_length a@168@01)) (not (= k@198@01 j@199@01))))))
      (and
        (>= k@198@01 0)
        (< k@198@01 (Seq_length a@168@01))
        (>= j@199@01 0)
        (< j@199@01 (Seq_length a@168@01))
        (not (= k@198@01 j@199@01))))
    (or
      (not
        (and
          (>= k@198@01 0)
          (and
            (< k@198@01 (Seq_length a@168@01))
            (and
              (>= j@199@01 0)
              (and
                (< j@199@01 (Seq_length a@168@01))
                (not (= k@198@01 j@199@01)))))))
      (and
        (>= k@198@01 0)
        (and
          (< k@198@01 (Seq_length a@168@01))
          (and
            (>= j@199@01 0)
            (and (< j@199@01 (Seq_length a@168@01)) (not (= k@198@01 j@199@01))))))))
  :pattern ((Seq_index a@168@01 k@198@01) (Seq_index a@168@01 j@199@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@61@12@61@100-aux|)))
(push) ; 3
(assert (not (forall ((k@198@01 Int) (j@199@01 Int)) (!
  (=>
    (and
      (>= k@198@01 0)
      (and
        (< k@198@01 (Seq_length a@168@01))
        (and
          (>= j@199@01 0)
          (and (< j@199@01 (Seq_length a@168@01)) (not (= k@198@01 j@199@01))))))
    (not (= (Seq_index a@168@01 k@198@01) (Seq_index a@168@01 j@199@01))))
  :pattern ((Seq_index a@168@01 k@198@01) (Seq_index a@168@01 j@199@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@61@12@61@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@198@01 Int) (j@199@01 Int)) (!
  (=>
    (and
      (>= k@198@01 0)
      (and
        (< k@198@01 (Seq_length a@168@01))
        (and
          (>= j@199@01 0)
          (and (< j@199@01 (Seq_length a@168@01)) (not (= k@198@01 j@199@01))))))
    (not (= (Seq_index a@168@01 k@198@01) (Seq_index a@168@01 j@199@01))))
  :pattern ((Seq_index a@168@01 k@198@01) (Seq_index a@168@01 j@199@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@61@12@61@100|)))
; [eval] (forall k: Int, j: Int :: { b[k], b[j] } k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j])
(declare-const k@200@01 Int)
(declare-const j@201@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j]
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 80 | !(k@200@01 >= 0) | live]
; [else-branch: 80 | k@200@01 >= 0 | live]
(push) ; 5
; [then-branch: 80 | !(k@200@01 >= 0)]
(assert (not (>= k@200@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 80 | k@200@01 >= 0]
(assert (>= k@200@01 0))
; [eval] k < |b|
; [eval] |b|
(push) ; 6
; [then-branch: 81 | !(k@200@01 < |b@169@01|) | live]
; [else-branch: 81 | k@200@01 < |b@169@01| | live]
(push) ; 7
; [then-branch: 81 | !(k@200@01 < |b@169@01|)]
(assert (not (< k@200@01 (Seq_length b@169@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 81 | k@200@01 < |b@169@01|]
(assert (< k@200@01 (Seq_length b@169@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 82 | !(j@201@01 >= 0) | live]
; [else-branch: 82 | j@201@01 >= 0 | live]
(push) ; 9
; [then-branch: 82 | !(j@201@01 >= 0)]
(assert (not (>= j@201@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 82 | j@201@01 >= 0]
(assert (>= j@201@01 0))
; [eval] j < |b|
; [eval] |b|
(push) ; 10
; [then-branch: 83 | !(j@201@01 < |b@169@01|) | live]
; [else-branch: 83 | j@201@01 < |b@169@01| | live]
(push) ; 11
; [then-branch: 83 | !(j@201@01 < |b@169@01|)]
(assert (not (< j@201@01 (Seq_length b@169@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 83 | j@201@01 < |b@169@01|]
(assert (< j@201@01 (Seq_length b@169@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@201@01 (Seq_length b@169@01)) (not (< j@201@01 (Seq_length b@169@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@201@01 0)
  (and
    (>= j@201@01 0)
    (or
      (< j@201@01 (Seq_length b@169@01))
      (not (< j@201@01 (Seq_length b@169@01)))))))
(assert (or (>= j@201@01 0) (not (>= j@201@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@200@01 (Seq_length b@169@01))
  (and
    (< k@200@01 (Seq_length b@169@01))
    (=>
      (>= j@201@01 0)
      (and
        (>= j@201@01 0)
        (or
          (< j@201@01 (Seq_length b@169@01))
          (not (< j@201@01 (Seq_length b@169@01))))))
    (or (>= j@201@01 0) (not (>= j@201@01 0))))))
(assert (or (< k@200@01 (Seq_length b@169@01)) (not (< k@200@01 (Seq_length b@169@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@200@01 0)
  (and
    (>= k@200@01 0)
    (=>
      (< k@200@01 (Seq_length b@169@01))
      (and
        (< k@200@01 (Seq_length b@169@01))
        (=>
          (>= j@201@01 0)
          (and
            (>= j@201@01 0)
            (or
              (< j@201@01 (Seq_length b@169@01))
              (not (< j@201@01 (Seq_length b@169@01))))))
        (or (>= j@201@01 0) (not (>= j@201@01 0)))))
    (or
      (< k@200@01 (Seq_length b@169@01))
      (not (< k@200@01 (Seq_length b@169@01)))))))
(assert (or (>= k@200@01 0) (not (>= k@200@01 0))))
(push) ; 4
; [then-branch: 84 | k@200@01 >= 0 && k@200@01 < |b@169@01| && j@201@01 >= 0 && j@201@01 < |b@169@01| && k@200@01 != j@201@01 | live]
; [else-branch: 84 | !(k@200@01 >= 0 && k@200@01 < |b@169@01| && j@201@01 >= 0 && j@201@01 < |b@169@01| && k@200@01 != j@201@01) | live]
(push) ; 5
; [then-branch: 84 | k@200@01 >= 0 && k@200@01 < |b@169@01| && j@201@01 >= 0 && j@201@01 < |b@169@01| && k@200@01 != j@201@01]
(assert (and
  (>= k@200@01 0)
  (and
    (< k@200@01 (Seq_length b@169@01))
    (and
      (>= j@201@01 0)
      (and (< j@201@01 (Seq_length b@169@01)) (not (= k@200@01 j@201@01)))))))
; [eval] b[k] != b[j]
; [eval] b[k]
; [eval] b[j]
(pop) ; 5
(push) ; 5
; [else-branch: 84 | !(k@200@01 >= 0 && k@200@01 < |b@169@01| && j@201@01 >= 0 && j@201@01 < |b@169@01| && k@200@01 != j@201@01)]
(assert (not
  (and
    (>= k@200@01 0)
    (and
      (< k@200@01 (Seq_length b@169@01))
      (and
        (>= j@201@01 0)
        (and (< j@201@01 (Seq_length b@169@01)) (not (= k@200@01 j@201@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@200@01 0)
    (and
      (< k@200@01 (Seq_length b@169@01))
      (and
        (>= j@201@01 0)
        (and (< j@201@01 (Seq_length b@169@01)) (not (= k@200@01 j@201@01))))))
  (and
    (>= k@200@01 0)
    (< k@200@01 (Seq_length b@169@01))
    (>= j@201@01 0)
    (< j@201@01 (Seq_length b@169@01))
    (not (= k@200@01 j@201@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@200@01 0)
      (and
        (< k@200@01 (Seq_length b@169@01))
        (and
          (>= j@201@01 0)
          (and (< j@201@01 (Seq_length b@169@01)) (not (= k@200@01 j@201@01)))))))
  (and
    (>= k@200@01 0)
    (and
      (< k@200@01 (Seq_length b@169@01))
      (and
        (>= j@201@01 0)
        (and (< j@201@01 (Seq_length b@169@01)) (not (= k@200@01 j@201@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@200@01 Int) (j@201@01 Int)) (!
  (and
    (=>
      (>= k@200@01 0)
      (and
        (>= k@200@01 0)
        (=>
          (< k@200@01 (Seq_length b@169@01))
          (and
            (< k@200@01 (Seq_length b@169@01))
            (=>
              (>= j@201@01 0)
              (and
                (>= j@201@01 0)
                (or
                  (< j@201@01 (Seq_length b@169@01))
                  (not (< j@201@01 (Seq_length b@169@01))))))
            (or (>= j@201@01 0) (not (>= j@201@01 0)))))
        (or
          (< k@200@01 (Seq_length b@169@01))
          (not (< k@200@01 (Seq_length b@169@01))))))
    (or (>= k@200@01 0) (not (>= k@200@01 0)))
    (=>
      (and
        (>= k@200@01 0)
        (and
          (< k@200@01 (Seq_length b@169@01))
          (and
            (>= j@201@01 0)
            (and (< j@201@01 (Seq_length b@169@01)) (not (= k@200@01 j@201@01))))))
      (and
        (>= k@200@01 0)
        (< k@200@01 (Seq_length b@169@01))
        (>= j@201@01 0)
        (< j@201@01 (Seq_length b@169@01))
        (not (= k@200@01 j@201@01))))
    (or
      (not
        (and
          (>= k@200@01 0)
          (and
            (< k@200@01 (Seq_length b@169@01))
            (and
              (>= j@201@01 0)
              (and
                (< j@201@01 (Seq_length b@169@01))
                (not (= k@200@01 j@201@01)))))))
      (and
        (>= k@200@01 0)
        (and
          (< k@200@01 (Seq_length b@169@01))
          (and
            (>= j@201@01 0)
            (and (< j@201@01 (Seq_length b@169@01)) (not (= k@200@01 j@201@01))))))))
  :pattern ((Seq_index b@169@01 k@200@01) (Seq_index b@169@01 j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@62@12@62@100-aux|)))
(push) ; 3
(assert (not (forall ((k@200@01 Int) (j@201@01 Int)) (!
  (=>
    (and
      (>= k@200@01 0)
      (and
        (< k@200@01 (Seq_length b@169@01))
        (and
          (>= j@201@01 0)
          (and (< j@201@01 (Seq_length b@169@01)) (not (= k@200@01 j@201@01))))))
    (not (= (Seq_index b@169@01 k@200@01) (Seq_index b@169@01 j@201@01))))
  :pattern ((Seq_index b@169@01 k@200@01) (Seq_index b@169@01 j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@62@12@62@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@200@01 Int) (j@201@01 Int)) (!
  (=>
    (and
      (>= k@200@01 0)
      (and
        (< k@200@01 (Seq_length b@169@01))
        (and
          (>= j@201@01 0)
          (and (< j@201@01 (Seq_length b@169@01)) (not (= k@200@01 j@201@01))))))
    (not (= (Seq_index b@169@01 k@200@01) (Seq_index b@169@01 j@201@01))))
  :pattern ((Seq_index b@169@01 k@200@01) (Seq_index b@169@01 j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@62@12@62@100|)))
; [eval] (forall k: Int, j: Int :: { c[k], c[j] } k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j])
(declare-const k@202@01 Int)
(declare-const j@203@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j]
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 85 | !(k@202@01 >= 0) | live]
; [else-branch: 85 | k@202@01 >= 0 | live]
(push) ; 5
; [then-branch: 85 | !(k@202@01 >= 0)]
(assert (not (>= k@202@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 85 | k@202@01 >= 0]
(assert (>= k@202@01 0))
; [eval] k < |c|
; [eval] |c|
(push) ; 6
; [then-branch: 86 | !(k@202@01 < |c@170@01|) | live]
; [else-branch: 86 | k@202@01 < |c@170@01| | live]
(push) ; 7
; [then-branch: 86 | !(k@202@01 < |c@170@01|)]
(assert (not (< k@202@01 (Seq_length c@170@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 86 | k@202@01 < |c@170@01|]
(assert (< k@202@01 (Seq_length c@170@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 87 | !(j@203@01 >= 0) | live]
; [else-branch: 87 | j@203@01 >= 0 | live]
(push) ; 9
; [then-branch: 87 | !(j@203@01 >= 0)]
(assert (not (>= j@203@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 87 | j@203@01 >= 0]
(assert (>= j@203@01 0))
; [eval] j < |c|
; [eval] |c|
(push) ; 10
; [then-branch: 88 | !(j@203@01 < |c@170@01|) | live]
; [else-branch: 88 | j@203@01 < |c@170@01| | live]
(push) ; 11
; [then-branch: 88 | !(j@203@01 < |c@170@01|)]
(assert (not (< j@203@01 (Seq_length c@170@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 88 | j@203@01 < |c@170@01|]
(assert (< j@203@01 (Seq_length c@170@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@203@01 (Seq_length c@170@01)) (not (< j@203@01 (Seq_length c@170@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@203@01 0)
  (and
    (>= j@203@01 0)
    (or
      (< j@203@01 (Seq_length c@170@01))
      (not (< j@203@01 (Seq_length c@170@01)))))))
(assert (or (>= j@203@01 0) (not (>= j@203@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@202@01 (Seq_length c@170@01))
  (and
    (< k@202@01 (Seq_length c@170@01))
    (=>
      (>= j@203@01 0)
      (and
        (>= j@203@01 0)
        (or
          (< j@203@01 (Seq_length c@170@01))
          (not (< j@203@01 (Seq_length c@170@01))))))
    (or (>= j@203@01 0) (not (>= j@203@01 0))))))
(assert (or (< k@202@01 (Seq_length c@170@01)) (not (< k@202@01 (Seq_length c@170@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@202@01 0)
  (and
    (>= k@202@01 0)
    (=>
      (< k@202@01 (Seq_length c@170@01))
      (and
        (< k@202@01 (Seq_length c@170@01))
        (=>
          (>= j@203@01 0)
          (and
            (>= j@203@01 0)
            (or
              (< j@203@01 (Seq_length c@170@01))
              (not (< j@203@01 (Seq_length c@170@01))))))
        (or (>= j@203@01 0) (not (>= j@203@01 0)))))
    (or
      (< k@202@01 (Seq_length c@170@01))
      (not (< k@202@01 (Seq_length c@170@01)))))))
(assert (or (>= k@202@01 0) (not (>= k@202@01 0))))
(push) ; 4
; [then-branch: 89 | k@202@01 >= 0 && k@202@01 < |c@170@01| && j@203@01 >= 0 && j@203@01 < |c@170@01| && k@202@01 != j@203@01 | live]
; [else-branch: 89 | !(k@202@01 >= 0 && k@202@01 < |c@170@01| && j@203@01 >= 0 && j@203@01 < |c@170@01| && k@202@01 != j@203@01) | live]
(push) ; 5
; [then-branch: 89 | k@202@01 >= 0 && k@202@01 < |c@170@01| && j@203@01 >= 0 && j@203@01 < |c@170@01| && k@202@01 != j@203@01]
(assert (and
  (>= k@202@01 0)
  (and
    (< k@202@01 (Seq_length c@170@01))
    (and
      (>= j@203@01 0)
      (and (< j@203@01 (Seq_length c@170@01)) (not (= k@202@01 j@203@01)))))))
; [eval] c[k] != c[j]
; [eval] c[k]
; [eval] c[j]
(pop) ; 5
(push) ; 5
; [else-branch: 89 | !(k@202@01 >= 0 && k@202@01 < |c@170@01| && j@203@01 >= 0 && j@203@01 < |c@170@01| && k@202@01 != j@203@01)]
(assert (not
  (and
    (>= k@202@01 0)
    (and
      (< k@202@01 (Seq_length c@170@01))
      (and
        (>= j@203@01 0)
        (and (< j@203@01 (Seq_length c@170@01)) (not (= k@202@01 j@203@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@202@01 0)
    (and
      (< k@202@01 (Seq_length c@170@01))
      (and
        (>= j@203@01 0)
        (and (< j@203@01 (Seq_length c@170@01)) (not (= k@202@01 j@203@01))))))
  (and
    (>= k@202@01 0)
    (< k@202@01 (Seq_length c@170@01))
    (>= j@203@01 0)
    (< j@203@01 (Seq_length c@170@01))
    (not (= k@202@01 j@203@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@202@01 0)
      (and
        (< k@202@01 (Seq_length c@170@01))
        (and
          (>= j@203@01 0)
          (and (< j@203@01 (Seq_length c@170@01)) (not (= k@202@01 j@203@01)))))))
  (and
    (>= k@202@01 0)
    (and
      (< k@202@01 (Seq_length c@170@01))
      (and
        (>= j@203@01 0)
        (and (< j@203@01 (Seq_length c@170@01)) (not (= k@202@01 j@203@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@202@01 Int) (j@203@01 Int)) (!
  (and
    (=>
      (>= k@202@01 0)
      (and
        (>= k@202@01 0)
        (=>
          (< k@202@01 (Seq_length c@170@01))
          (and
            (< k@202@01 (Seq_length c@170@01))
            (=>
              (>= j@203@01 0)
              (and
                (>= j@203@01 0)
                (or
                  (< j@203@01 (Seq_length c@170@01))
                  (not (< j@203@01 (Seq_length c@170@01))))))
            (or (>= j@203@01 0) (not (>= j@203@01 0)))))
        (or
          (< k@202@01 (Seq_length c@170@01))
          (not (< k@202@01 (Seq_length c@170@01))))))
    (or (>= k@202@01 0) (not (>= k@202@01 0)))
    (=>
      (and
        (>= k@202@01 0)
        (and
          (< k@202@01 (Seq_length c@170@01))
          (and
            (>= j@203@01 0)
            (and (< j@203@01 (Seq_length c@170@01)) (not (= k@202@01 j@203@01))))))
      (and
        (>= k@202@01 0)
        (< k@202@01 (Seq_length c@170@01))
        (>= j@203@01 0)
        (< j@203@01 (Seq_length c@170@01))
        (not (= k@202@01 j@203@01))))
    (or
      (not
        (and
          (>= k@202@01 0)
          (and
            (< k@202@01 (Seq_length c@170@01))
            (and
              (>= j@203@01 0)
              (and
                (< j@203@01 (Seq_length c@170@01))
                (not (= k@202@01 j@203@01)))))))
      (and
        (>= k@202@01 0)
        (and
          (< k@202@01 (Seq_length c@170@01))
          (and
            (>= j@203@01 0)
            (and (< j@203@01 (Seq_length c@170@01)) (not (= k@202@01 j@203@01))))))))
  :pattern ((Seq_index c@170@01 k@202@01) (Seq_index c@170@01 j@203@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@63@12@63@100-aux|)))
(push) ; 3
(assert (not (forall ((k@202@01 Int) (j@203@01 Int)) (!
  (=>
    (and
      (>= k@202@01 0)
      (and
        (< k@202@01 (Seq_length c@170@01))
        (and
          (>= j@203@01 0)
          (and (< j@203@01 (Seq_length c@170@01)) (not (= k@202@01 j@203@01))))))
    (not (= (Seq_index c@170@01 k@202@01) (Seq_index c@170@01 j@203@01))))
  :pattern ((Seq_index c@170@01 k@202@01) (Seq_index c@170@01 j@203@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@63@12@63@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@202@01 Int) (j@203@01 Int)) (!
  (=>
    (and
      (>= k@202@01 0)
      (and
        (< k@202@01 (Seq_length c@170@01))
        (and
          (>= j@203@01 0)
          (and (< j@203@01 (Seq_length c@170@01)) (not (= k@202@01 j@203@01))))))
    (not (= (Seq_index c@170@01 k@202@01) (Seq_index c@170@01 j@203@01))))
  :pattern ((Seq_index c@170@01 k@202@01) (Seq_index c@170@01 j@203@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_e1_c.vpr@63@12@63@100|)))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@171@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 90 | 0 < len@171@01 | live]
; [else-branch: 90 | !(0 < len@171@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 90 | 0 < len@171@01]
(assert (< 0 len@171@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 4
(push) ; 4
; [else-branch: 90 | !(0 < len@171@01)]
(assert (not (< 0 len@171@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< 0 len@171@01)) (< 0 len@171@01)))
(push) ; 3
(assert (not (=> (< 0 len@171@01) (= (Seq_length a@168@01) len@171@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@171@01) (= (Seq_length a@168@01) len@171@01)))
(declare-const i@204@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 91 | !(0 <= i@204@01) | live]
; [else-branch: 91 | 0 <= i@204@01 | live]
(push) ; 5
; [then-branch: 91 | !(0 <= i@204@01)]
(assert (not (<= 0 i@204@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 91 | 0 <= i@204@01]
(assert (<= 0 i@204@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@204@01) (not (<= 0 i@204@01))))
(assert (and (<= 0 i@204@01) (< i@204@01 len@171@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@204@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@204@01 (Seq_length a@168@01))))
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
    (and (<= 0 i@204@01) (< i@204@01 len@171@01))
    (or (<= 0 i@204@01) (not (<= 0 i@204@01))))
  :pattern ((Seq_index a@168@01 i@204@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@204@01 Int) (i2@204@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@204@01) (< i1@204@01 len@171@01))
      (and (<= 0 i2@204@01) (< i2@204@01 len@171@01))
      (= (Seq_index a@168@01 i1@204@01) (Seq_index a@168@01 i2@204@01)))
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
    (and (<= 0 i@204@01) (< i@204@01 len@171@01))
    (and
      (= (inv@205@01 (Seq_index a@168@01 i@204@01)) i@204@01)
      (img@206@01 (Seq_index a@168@01 i@204@01))))
  :pattern ((Seq_index a@168@01 i@204@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@206@01 r)
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@171@01)))
    (= (Seq_index a@168@01 (inv@205@01 r)) r))
  :pattern ((inv@205@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@204@01 Int)) (!
  (= (Seq_index a@168@01 i@204@01) (Seq_index b@169@01 i@204@01))
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@204@01 Int)) (!
  (= (Seq_index a@168@01 i@204@01) (Seq_index c@170@01 i@204@01))
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@207@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@171@01))
      (img@206@01 r)
      (= r (Seq_index a@168@01 (inv@205@01 r))))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@208@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@171@01))
      (img@206@01 r)
      (= r (Seq_index a@168@01 (inv@205@01 r))))
    ($Perm.min
      (ite
        (and
          (img@184@01 r)
          (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@207@01 r)))
    $Perm.No))
(define-fun pTaken@209@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@171@01))
      (img@206@01 r)
      (= r (Seq_index a@168@01 (inv@205@01 r))))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@207@01 r)) (pTaken@208@01 r)))
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
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@207@01 r))
    $Perm.No)
  
  :qid |quant-u-114|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@207@01 r) $Perm.No)
  
  :qid |quant-u-115|))))
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
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@171@01))
      (img@206@01 r)
      (= r (Seq_index a@168@01 (inv@205@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@207@01 r)) $Perm.No))
  
  :qid |quant-u-116|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@210@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@181@01 r)
      (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r))
  :qid |qp.fvfValDef2|)))
; [eval] 0 <= 0 && 0 < len
; [eval] 0 <= 0
(set-option :timeout 0)
(push) ; 3
; [then-branch: 92 | False | live]
; [else-branch: 92 | True | live]
(push) ; 4
; [then-branch: 92 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 92 | True]
; [eval] 0 < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 len@171@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 len@171@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 93 | 0 < len@171@01 | live]
; [else-branch: 93 | !(0 < len@171@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 93 | 0 < len@171@01]
(assert (< 0 len@171@01))
; [eval] a[0]
(push) ; 4
(assert (not (< 0 (Seq_length a@168@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@211@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index a@168@01 0))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
        (- $Perm.Write (pTaken@207@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@212@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index a@168@01 0))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@211@01 r)))
    $Perm.No))
(define-fun pTaken@213@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index a@168@01 0))
    ($Perm.min
      (ite
        (and
          (img@184@01 r)
          (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@211@01 r)) (pTaken@212@01 r)))
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
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
        (- $Perm.Write (pTaken@207@01 r))
        $Perm.No)
      (pTaken@211@01 r))
    $Perm.No)
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@211@01 r) $Perm.No)
  
  :qid |quant-u-119|))))
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
    (= r (Seq_index a@168@01 0))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@211@01 r)) $Perm.No))
  
  :qid |quant-u-120|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@214@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@187@01 (Seq_index a@168@01 0))
    (and
      (<= 0 (inv@186@01 (Seq_index a@168@01 0)))
      (< (inv@186@01 (Seq_index a@168@01 0)) len@171@01)))
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@214@01  $FVF<Ref__Integer_value>) (Seq_index
      a@168@01
      0))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) (Seq_index
      a@168@01
      0)))))
(assert (=>
  (and
    (img@184@01 (Seq_index a@168@01 0))
    (and
      (<= 0 (inv@183@01 (Seq_index a@168@01 0)))
      (< (inv@183@01 (Seq_index a@168@01 0)) len@171@01)))
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@214@01  $FVF<Ref__Integer_value>) (Seq_index
      a@168@01
      0))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) (Seq_index
      a@168@01
      0)))))
(assert (=>
  (ite
    (and
      (img@181@01 (Seq_index a@168@01 0))
      (and
        (<= 0 (inv@180@01 (Seq_index a@168@01 0)))
        (< (inv@180@01 (Seq_index a@168@01 0)) len@171@01)))
    (< $Perm.No (- $Perm.Write (pTaken@207@01 (Seq_index a@168@01 0))))
    false)
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@214@01  $FVF<Ref__Integer_value>) (Seq_index
      a@168@01
      0))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))) (Seq_index
      a@168@01
      0)))))
(declare-const i@215@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 1 <= i && i < (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] 1 <= i
(push) ; 5
; [then-branch: 94 | !(1 <= i@215@01) | live]
; [else-branch: 94 | 1 <= i@215@01 | live]
(push) ; 6
; [then-branch: 94 | !(1 <= i@215@01)]
(assert (not (<= 1 i@215@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 94 | 1 <= i@215@01]
(assert (<= 1 i@215@01))
; [eval] i < (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] (|a| - 1 < len ? |a| - 1 : len)
; [eval] |a| - 1 < len
; [eval] |a| - 1
; [eval] |a|
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length a@168@01) 1) len@171@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- (Seq_length a@168@01) 1) len@171@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 95 | |a@168@01| - 1 < len@171@01 | live]
; [else-branch: 95 | !(|a@168@01| - 1 < len@171@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 95 | |a@168@01| - 1 < len@171@01]
(assert (< (- (Seq_length a@168@01) 1) len@171@01))
; [eval] |a| - 1
; [eval] |a|
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- (Seq_length a@168@01) 1) len@171@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@215@01)
  (and (<= 1 i@215@01) (< (- (Seq_length a@168@01) 1) len@171@01))))
(assert (or (<= 1 i@215@01) (not (<= 1 i@215@01))))
(assert (and (<= 1 i@215@01) (< i@215@01 (+ (- (Seq_length a@168@01) 1) 1))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@215@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@215@01 (Seq_length a@168@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@216@01 ($Ref) Int)
(declare-fun img@217@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@215@01 Int)) (!
  (=>
    (and (<= 1 i@215@01) (< i@215@01 (+ (- (Seq_length a@168@01) 1) 1)))
    (and
      (=>
        (<= 1 i@215@01)
        (and (<= 1 i@215@01) (< (- (Seq_length a@168@01) 1) len@171@01)))
      (or (<= 1 i@215@01) (not (<= 1 i@215@01)))))
  :pattern ((Seq_index a@168@01 i@215@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@215@01 Int) (i2@215@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@215@01) (< i1@215@01 (+ (- (Seq_length a@168@01) 1) 1)))
      (and (<= 1 i2@215@01) (< i2@215@01 (+ (- (Seq_length a@168@01) 1) 1)))
      (= (Seq_index a@168@01 i1@215@01) (Seq_index a@168@01 i2@215@01)))
    (= i1@215@01 i2@215@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@215@01 Int)) (!
  (=>
    (and (<= 1 i@215@01) (< i@215@01 (+ (- (Seq_length a@168@01) 1) 1)))
    (and
      (= (inv@216@01 (Seq_index a@168@01 i@215@01)) i@215@01)
      (img@217@01 (Seq_index a@168@01 i@215@01))))
  :pattern ((Seq_index a@168@01 i@215@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@217@01 r)
      (and
        (<= 1 (inv@216@01 r))
        (< (inv@216@01 r) (+ (- (Seq_length a@168@01) 1) 1))))
    (= (Seq_index a@168@01 (inv@216@01 r)) r))
  :pattern ((inv@216@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@215@01 Int)) (!
  (= (Seq_index a@168@01 i@215@01) (Seq_index b@169@01 i@215@01))
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@215@01 Int)) (!
  (= (Seq_index a@168@01 i@215@01) (Seq_index c@170@01 i@215@01))
  
  :qid |quant-u-123|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@218@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@216@01 r))
        (< (inv@216@01 r) (+ (- (Seq_length a@168@01) 1) 1)))
      (img@217@01 r)
      (= r (Seq_index a@168@01 (inv@216@01 r))))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
        (- (- $Perm.Write (pTaken@207@01 r)) (pTaken@211@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@219@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@216@01 r))
        (< (inv@216@01 r) (+ (- (Seq_length a@168@01) 1) 1)))
      (img@217@01 r)
      (= r (Seq_index a@168@01 (inv@216@01 r))))
    ($Perm.min
      (ite
        (and
          (img@184@01 r)
          (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@218@01 r)))
    $Perm.No))
(define-fun pTaken@220@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@216@01 r))
        (< (inv@216@01 r) (+ (- (Seq_length a@168@01) 1) 1)))
      (img@217@01 r)
      (= r (Seq_index a@168@01 (inv@216@01 r))))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@218@01 r)) (pTaken@219@01 r)))
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
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
        (- (- $Perm.Write (pTaken@207@01 r)) (pTaken@211@01 r))
        $Perm.No)
      (pTaken@218@01 r))
    $Perm.No)
  
  :qid |quant-u-125|))))
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
        (<= 1 (inv@216@01 r))
        (< (inv@216@01 r) (+ (- (Seq_length a@168@01) 1) 1)))
      (img@217@01 r)
      (= r (Seq_index a@168@01 (inv@216@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@218@01 r)) $Perm.No))
  
  :qid |quant-u-126|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@221@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
      (< $Perm.No (- (- $Perm.Write (pTaken@207@01 r)) (pTaken@211@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))) r))
  :qid |qp.fvfValDef8|)))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@171@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 96 | 0 < len@171@01 | live]
; [else-branch: 96 | !(0 < len@171@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 96 | 0 < len@171@01]
; [eval] |b| == len
; [eval] |b|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=> (< 0 len@171@01) (= (Seq_length b@169@01) len@171@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@171@01) (= (Seq_length b@169@01) len@171@01)))
(declare-const i@222@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 97 | !(0 <= i@222@01) | live]
; [else-branch: 97 | 0 <= i@222@01 | live]
(push) ; 6
; [then-branch: 97 | !(0 <= i@222@01)]
(assert (not (<= 0 i@222@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 97 | 0 <= i@222@01]
(assert (<= 0 i@222@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@222@01) (not (<= 0 i@222@01))))
(assert (and (<= 0 i@222@01) (< i@222@01 len@171@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@222@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@222@01 (Seq_length b@169@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@223@01 ($Ref) Int)
(declare-fun img@224@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@222@01 Int)) (!
  (=>
    (and (<= 0 i@222@01) (< i@222@01 len@171@01))
    (or (<= 0 i@222@01) (not (<= 0 i@222@01))))
  :pattern ((Seq_index b@169@01 i@222@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@222@01 Int) (i2@222@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@222@01) (< i1@222@01 len@171@01))
      (and (<= 0 i2@222@01) (< i2@222@01 len@171@01))
      (= (Seq_index b@169@01 i1@222@01) (Seq_index b@169@01 i2@222@01)))
    (= i1@222@01 i2@222@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@222@01 Int)) (!
  (=>
    (and (<= 0 i@222@01) (< i@222@01 len@171@01))
    (and
      (= (inv@223@01 (Seq_index b@169@01 i@222@01)) i@222@01)
      (img@224@01 (Seq_index b@169@01 i@222@01))))
  :pattern ((Seq_index b@169@01 i@222@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@224@01 r)
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@171@01)))
    (= (Seq_index b@169@01 (inv@223@01 r)) r))
  :pattern ((inv@223@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@222@01 Int)) (!
  (= (Seq_index b@169@01 i@222@01) (Seq_index c@170@01 i@222@01))
  
  :qid |quant-u-128|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@225@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@171@01))
      (img@224@01 r)
      (= r (Seq_index b@169@01 (inv@223@01 r))))
    ($Perm.min
      (ite
        (and
          (img@184@01 r)
          (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@226@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@171@01))
      (img@224@01 r)
      (= r (Seq_index b@169@01 (inv@223@01 r))))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@225@01 r)))
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
          (img@184@01 r)
          (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@225@01 r))
    $Perm.No)
  
  :qid |quant-u-130|))))
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
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@171@01))
      (img@224@01 r)
      (= r (Seq_index b@169@01 (inv@223@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@225@01 r)) $Perm.No))
  
  :qid |quant-u-131|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@227@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@227@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@227@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@227@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@227@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r))
  :qid |qp.fvfValDef10|)))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@171@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 98 | 0 < len@171@01 | live]
; [else-branch: 98 | !(0 < len@171@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 98 | 0 < len@171@01]
; [eval] |c| == len
; [eval] |c|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=> (< 0 len@171@01) (= (Seq_length c@170@01) len@171@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@171@01) (= (Seq_length c@170@01) len@171@01)))
(declare-const i@228@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 99 | !(0 <= i@228@01) | live]
; [else-branch: 99 | 0 <= i@228@01 | live]
(push) ; 6
; [then-branch: 99 | !(0 <= i@228@01)]
(assert (not (<= 0 i@228@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 99 | 0 <= i@228@01]
(assert (<= 0 i@228@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@228@01) (not (<= 0 i@228@01))))
(assert (and (<= 0 i@228@01) (< i@228@01 len@171@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@228@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@228@01 (Seq_length c@170@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@229@01 ($Ref) Int)
(declare-fun img@230@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@228@01 Int)) (!
  (=>
    (and (<= 0 i@228@01) (< i@228@01 len@171@01))
    (or (<= 0 i@228@01) (not (<= 0 i@228@01))))
  :pattern ((Seq_index c@170@01 i@228@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@228@01 Int) (i2@228@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@228@01) (< i1@228@01 len@171@01))
      (and (<= 0 i2@228@01) (< i2@228@01 len@171@01))
      (= (Seq_index c@170@01 i1@228@01) (Seq_index c@170@01 i2@228@01)))
    (= i1@228@01 i2@228@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@228@01 Int)) (!
  (=>
    (and (<= 0 i@228@01) (< i@228@01 len@171@01))
    (and
      (= (inv@229@01 (Seq_index c@170@01 i@228@01)) i@228@01)
      (img@230@01 (Seq_index c@170@01 i@228@01))))
  :pattern ((Seq_index c@170@01 i@228@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@230@01 r)
      (and (<= 0 (inv@229@01 r)) (< (inv@229@01 r) len@171@01)))
    (= (Seq_index c@170@01 (inv@229@01 r)) r))
  :pattern ((inv@229@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@231@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@229@01 r)) (< (inv@229@01 r) len@171@01))
      (img@230@01 r)
      (= r (Seq_index c@170@01 (inv@229@01 r))))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
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
          (img@187@01 r)
          (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@231@01 r))
    $Perm.No)
  
  :qid |quant-u-134|))))
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
      (and (<= 0 (inv@229@01 r)) (< (inv@229@01 r) len@171@01))
      (img@230@01 r)
      (= r (Seq_index c@170@01 (inv@229@01 r))))
    (= (- $Perm.Write (pTaken@231@01 r)) $Perm.No))
  
  :qid |quant-u-135|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@232@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@232@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@232@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r))
  :qid |qp.fvfValDef11|)))
(declare-const $t@233@01 $Snap)
(assert (= $t@233@01 ($Snap.combine ($Snap.first $t@233@01) ($Snap.second $t@233@01))))
(assert (= ($Snap.first $t@233@01) $Snap.unit))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@171@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 100 | 0 < len@171@01 | live]
; [else-branch: 100 | !(0 < len@171@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 100 | 0 < len@171@01]
; [eval] |a| == len
; [eval] |a|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second $t@233@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@233@01))
    ($Snap.second ($Snap.second $t@233@01)))))
(declare-const i@234@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 101 | !(0 <= i@234@01) | live]
; [else-branch: 101 | 0 <= i@234@01 | live]
(push) ; 6
; [then-branch: 101 | !(0 <= i@234@01)]
(assert (not (<= 0 i@234@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 101 | 0 <= i@234@01]
(assert (<= 0 i@234@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@234@01) (not (<= 0 i@234@01))))
(assert (and (<= 0 i@234@01) (< i@234@01 len@171@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@234@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@234@01 (Seq_length a@168@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@235@01 ($Ref) Int)
(declare-fun img@236@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@234@01 Int)) (!
  (=>
    (and (<= 0 i@234@01) (< i@234@01 len@171@01))
    (or (<= 0 i@234@01) (not (<= 0 i@234@01))))
  :pattern ((Seq_index a@168@01 i@234@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@234@01 Int) (i2@234@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@234@01) (< i1@234@01 len@171@01))
      (and (<= 0 i2@234@01) (< i2@234@01 len@171@01))
      (= (Seq_index a@168@01 i1@234@01) (Seq_index a@168@01 i2@234@01)))
    (= i1@234@01 i2@234@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@234@01 Int)) (!
  (=>
    (and (<= 0 i@234@01) (< i@234@01 len@171@01))
    (and
      (= (inv@235@01 (Seq_index a@168@01 i@234@01)) i@234@01)
      (img@236@01 (Seq_index a@168@01 i@234@01))))
  :pattern ((Seq_index a@168@01 i@234@01))
  :qid |quant-u-137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@236@01 r)
      (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) len@171@01)))
    (= (Seq_index a@168@01 (inv@235@01 r)) r))
  :pattern ((inv@235@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@234@01 Int)) (!
  (=>
    (and (<= 0 i@234@01) (< i@234@01 len@171@01))
    (not (= (Seq_index a@168@01 i@234@01) $Ref.null)))
  :pattern ((Seq_index a@168@01 i@234@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@233@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@233@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@233@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@233@01))) $Snap.unit))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@171@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 102 | 0 < len@171@01 | live]
; [else-branch: 102 | !(0 < len@171@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 102 | 0 < len@171@01]
; [eval] |b| == len
; [eval] |b|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@233@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@233@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01)))))))
(declare-const i@237@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 103 | !(0 <= i@237@01) | live]
; [else-branch: 103 | 0 <= i@237@01 | live]
(push) ; 6
; [then-branch: 103 | !(0 <= i@237@01)]
(assert (not (<= 0 i@237@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 103 | 0 <= i@237@01]
(assert (<= 0 i@237@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@237@01) (not (<= 0 i@237@01))))
(assert (and (<= 0 i@237@01) (< i@237@01 len@171@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@237@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@237@01 (Seq_length b@169@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@238@01 ($Ref) Int)
(declare-fun img@239@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@237@01 Int)) (!
  (=>
    (and (<= 0 i@237@01) (< i@237@01 len@171@01))
    (or (<= 0 i@237@01) (not (<= 0 i@237@01))))
  :pattern ((Seq_index b@169@01 i@237@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@237@01 Int) (i2@237@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@237@01) (< i1@237@01 len@171@01))
      (and (<= 0 i2@237@01) (< i2@237@01 len@171@01))
      (= (Seq_index b@169@01 i1@237@01) (Seq_index b@169@01 i2@237@01)))
    (= i1@237@01 i2@237@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@237@01 Int)) (!
  (=>
    (and (<= 0 i@237@01) (< i@237@01 len@171@01))
    (and
      (= (inv@238@01 (Seq_index b@169@01 i@237@01)) i@237@01)
      (img@239@01 (Seq_index b@169@01 i@237@01))))
  :pattern ((Seq_index b@169@01 i@237@01))
  :qid |quant-u-139|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@239@01 r)
      (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@171@01)))
    (= (Seq_index b@169@01 (inv@238@01 r)) r))
  :pattern ((inv@238@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@237@01 Int)) (!
  (=>
    (and (<= 0 i@237@01) (< i@237@01 len@171@01))
    (not (= (Seq_index b@169@01 i@237@01) $Ref.null)))
  :pattern ((Seq_index b@169@01 i@237@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@169@01 i@237@01) (Seq_index a@168@01 i@234@01))
    (=
      (and
        (img@239@01 r)
        (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@171@01)))
      (and
        (img@236@01 r)
        (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) len@171@01)))))
  
  :qid |quant-u-140|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01)))))
  $Snap.unit))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@171@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 104 | 0 < len@171@01 | live]
; [else-branch: 104 | !(0 < len@171@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 104 | 0 < len@171@01]
; [eval] |c| == len
; [eval] |c|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(declare-const i@240@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 105 | !(0 <= i@240@01) | live]
; [else-branch: 105 | 0 <= i@240@01 | live]
(push) ; 6
; [then-branch: 105 | !(0 <= i@240@01)]
(assert (not (<= 0 i@240@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 105 | 0 <= i@240@01]
(assert (<= 0 i@240@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@240@01) (not (<= 0 i@240@01))))
(assert (and (<= 0 i@240@01) (< i@240@01 len@171@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@240@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@240@01 (Seq_length c@170@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@241@01 ($Ref) Int)
(declare-fun img@242@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@240@01 Int)) (!
  (=>
    (and (<= 0 i@240@01) (< i@240@01 len@171@01))
    (or (<= 0 i@240@01) (not (<= 0 i@240@01))))
  :pattern ((Seq_index c@170@01 i@240@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@240@01 Int) (i2@240@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@240@01) (< i1@240@01 len@171@01))
      (and (<= 0 i2@240@01) (< i2@240@01 len@171@01))
      (= (Seq_index c@170@01 i1@240@01) (Seq_index c@170@01 i2@240@01)))
    (= i1@240@01 i2@240@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@240@01 Int)) (!
  (=>
    (and (<= 0 i@240@01) (< i@240@01 len@171@01))
    (and
      (= (inv@241@01 (Seq_index c@170@01 i@240@01)) i@240@01)
      (img@242@01 (Seq_index c@170@01 i@240@01))))
  :pattern ((Seq_index c@170@01 i@240@01))
  :qid |quant-u-142|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@242@01 r)
      (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
    (= (Seq_index c@170@01 (inv@241@01 r)) r))
  :pattern ((inv@241@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@240@01 Int)) (!
  (=>
    (and (<= 0 i@240@01) (< i@240@01 len@171@01))
    (not (= (Seq_index c@170@01 i@240@01) $Ref.null)))
  :pattern ((Seq_index c@170@01 i@240@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@170@01 i@240@01) (Seq_index b@169@01 i@237@01))
    (=
      (and
        (img@242@01 r)
        (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
      (and
        (img@239@01 r)
        (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@171@01)))))
  
  :qid |quant-u-143|))))
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
    (= (Seq_index c@170@01 i@240@01) (Seq_index a@168@01 i@234@01))
    (=
      (and
        (img@242@01 r)
        (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
      (and
        (img@236@01 r)
        (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) len@171@01)))))
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |a| == len
; [eval] |a|
(declare-const i@243@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 106 | !(0 <= i@243@01) | live]
; [else-branch: 106 | 0 <= i@243@01 | live]
(push) ; 6
; [then-branch: 106 | !(0 <= i@243@01)]
(assert (not (<= 0 i@243@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 106 | 0 <= i@243@01]
(assert (<= 0 i@243@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@243@01) (not (<= 0 i@243@01))))
(assert (and (<= 0 i@243@01) (< i@243@01 len@171@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@243@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@243@01 (Seq_length a@168@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@244@01 ($Ref) Int)
(declare-fun img@245@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@243@01 Int)) (!
  (=>
    (and (<= 0 i@243@01) (< i@243@01 len@171@01))
    (or (<= 0 i@243@01) (not (<= 0 i@243@01))))
  :pattern ((Seq_index a@168@01 i@243@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@243@01 Int) (i2@243@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@243@01) (< i1@243@01 len@171@01))
      (and (<= 0 i2@243@01) (< i2@243@01 len@171@01))
      (= (Seq_index a@168@01 i1@243@01) (Seq_index a@168@01 i2@243@01)))
    (= i1@243@01 i2@243@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@243@01 Int)) (!
  (=>
    (and (<= 0 i@243@01) (< i@243@01 len@171@01))
    (and
      (= (inv@244@01 (Seq_index a@168@01 i@243@01)) i@243@01)
      (img@245@01 (Seq_index a@168@01 i@243@01))))
  :pattern ((Seq_index a@168@01 i@243@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@245@01 r)
      (and (<= 0 (inv@244@01 r)) (< (inv@244@01 r) len@171@01)))
    (= (Seq_index a@168@01 (inv@244@01 r)) r))
  :pattern ((inv@244@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@243@01 Int)) (!
  (= (Seq_index a@168@01 i@243@01) (Seq_index b@169@01 i@243@01))
  
  :qid |quant-u-146|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@243@01 Int)) (!
  (= (Seq_index a@168@01 i@243@01) (Seq_index c@170@01 i@243@01))
  
  :qid |quant-u-147|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@246@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@244@01 r)) (< (inv@244@01 r) len@171@01))
      (img@245@01 r)
      (= r (Seq_index a@168@01 (inv@244@01 r))))
    ($Perm.min
      (ite
        (and
          (img@236@01 r)
          (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@247@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@244@01 r)) (< (inv@244@01 r) len@171@01))
      (img@245@01 r)
      (= r (Seq_index a@168@01 (inv@244@01 r))))
    ($Perm.min
      (ite
        (and
          (img@239@01 r)
          (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@246@01 r)))
    $Perm.No))
(define-fun pTaken@248@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@244@01 r)) (< (inv@244@01 r) len@171@01))
      (img@245@01 r)
      (= r (Seq_index a@168@01 (inv@244@01 r))))
    ($Perm.min
      (ite
        (and
          (img@242@01 r)
          (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@246@01 r)) (pTaken@247@01 r)))
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
          (img@236@01 r)
          (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@246@01 r))
    $Perm.No)
  
  :qid |quant-u-149|))))
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
      (and (<= 0 (inv@244@01 r)) (< (inv@244@01 r) len@171@01))
      (img@245@01 r)
      (= r (Seq_index a@168@01 (inv@244@01 r))))
    (= (- $Perm.Write (pTaken@246@01 r)) $Perm.No))
  
  :qid |quant-u-150|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@249@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@236@01 r)
      (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@249@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@233@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@249@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@233@01))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@239@01 r)
      (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@249@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@233@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@249@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@233@01))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@242@01 r)
      (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@249@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@249@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01)))))) r))
  :qid |qp.fvfValDef14|)))
; [eval] |b| == len
; [eval] |b|
(declare-const i@250@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 107 | !(0 <= i@250@01) | live]
; [else-branch: 107 | 0 <= i@250@01 | live]
(push) ; 6
; [then-branch: 107 | !(0 <= i@250@01)]
(assert (not (<= 0 i@250@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 107 | 0 <= i@250@01]
(assert (<= 0 i@250@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@250@01) (not (<= 0 i@250@01))))
(assert (and (<= 0 i@250@01) (< i@250@01 len@171@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@250@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@250@01 (Seq_length b@169@01))))
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
    (and (<= 0 i@250@01) (< i@250@01 len@171@01))
    (or (<= 0 i@250@01) (not (<= 0 i@250@01))))
  :pattern ((Seq_index b@169@01 i@250@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@250@01 Int) (i2@250@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@250@01) (< i1@250@01 len@171@01))
      (and (<= 0 i2@250@01) (< i2@250@01 len@171@01))
      (= (Seq_index b@169@01 i1@250@01) (Seq_index b@169@01 i2@250@01)))
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
    (and (<= 0 i@250@01) (< i@250@01 len@171@01))
    (and
      (= (inv@251@01 (Seq_index b@169@01 i@250@01)) i@250@01)
      (img@252@01 (Seq_index b@169@01 i@250@01))))
  :pattern ((Seq_index b@169@01 i@250@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@252@01 r)
      (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) len@171@01)))
    (= (Seq_index b@169@01 (inv@251@01 r)) r))
  :pattern ((inv@251@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@250@01 Int)) (!
  (= (Seq_index b@169@01 i@250@01) (Seq_index c@170@01 i@250@01))
  
  :qid |quant-u-152|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@253@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) len@171@01))
      (img@252@01 r)
      (= r (Seq_index b@169@01 (inv@251@01 r))))
    ($Perm.min
      (ite
        (and
          (img@239@01 r)
          (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@254@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) len@171@01))
      (img@252@01 r)
      (= r (Seq_index b@169@01 (inv@251@01 r))))
    ($Perm.min
      (ite
        (and
          (img@242@01 r)
          (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@253@01 r)))
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
          (img@239@01 r)
          (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@253@01 r))
    $Perm.No)
  
  :qid |quant-u-154|))))
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
      (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) len@171@01))
      (img@252@01 r)
      (= r (Seq_index b@169@01 (inv@251@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@253@01 r)) $Perm.No))
  
  :qid |quant-u-155|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@255@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@242@01 r)
      (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@255@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@255@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01)))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@239@01 r)
      (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@255@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@233@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@255@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@233@01))))) r))
  :qid |qp.fvfValDef16|)))
; [eval] |c| == len
; [eval] |c|
(declare-const i@256@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 108 | !(0 <= i@256@01) | live]
; [else-branch: 108 | 0 <= i@256@01 | live]
(push) ; 6
; [then-branch: 108 | !(0 <= i@256@01)]
(assert (not (<= 0 i@256@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 108 | 0 <= i@256@01]
(assert (<= 0 i@256@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@256@01) (not (<= 0 i@256@01))))
(assert (and (<= 0 i@256@01) (< i@256@01 len@171@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@256@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@256@01 (Seq_length c@170@01))))
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
    (and (<= 0 i@256@01) (< i@256@01 len@171@01))
    (or (<= 0 i@256@01) (not (<= 0 i@256@01))))
  :pattern ((Seq_index c@170@01 i@256@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@256@01 Int) (i2@256@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@256@01) (< i1@256@01 len@171@01))
      (and (<= 0 i2@256@01) (< i2@256@01 len@171@01))
      (= (Seq_index c@170@01 i1@256@01) (Seq_index c@170@01 i2@256@01)))
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
    (and (<= 0 i@256@01) (< i@256@01 len@171@01))
    (and
      (= (inv@257@01 (Seq_index c@170@01 i@256@01)) i@256@01)
      (img@258@01 (Seq_index c@170@01 i@256@01))))
  :pattern ((Seq_index c@170@01 i@256@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@258@01 r)
      (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) len@171@01)))
    (= (Seq_index c@170@01 (inv@257@01 r)) r))
  :pattern ((inv@257@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@259@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) len@171@01))
      (img@258@01 r)
      (= r (Seq_index c@170@01 (inv@257@01 r))))
    ($Perm.min
      (ite
        (and
          (img@242@01 r)
          (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
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
          (img@242@01 r)
          (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@259@01 r))
    $Perm.No)
  
  :qid |quant-u-158|))))
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
      (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) len@171@01))
      (img@258@01 r)
      (= r (Seq_index c@170@01 (inv@257@01 r))))
    (= (- $Perm.Write (pTaken@259@01 r)) $Perm.No))
  
  :qid |quant-u-159|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@260@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@242@01 r)
      (and (<= 0 (inv@241@01 r)) (< (inv@241@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@260@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@260@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@233@01)))))) r))
  :qid |qp.fvfValDef17|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 93 | !(0 < len@171@01)]
(assert (not (< 0 len@171@01)))
(declare-const i@261@01 Int)
(push) ; 4
; [eval] 1 <= i && i < (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] 1 <= i
(push) ; 5
; [then-branch: 109 | !(1 <= i@261@01) | live]
; [else-branch: 109 | 1 <= i@261@01 | live]
(push) ; 6
; [then-branch: 109 | !(1 <= i@261@01)]
(assert (not (<= 1 i@261@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 109 | 1 <= i@261@01]
(assert (<= 1 i@261@01))
; [eval] i < (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] (|a| - 1 < len ? |a| - 1 : len) + 1
; [eval] (|a| - 1 < len ? |a| - 1 : len)
; [eval] |a| - 1 < len
; [eval] |a| - 1
; [eval] |a|
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length a@168@01) 1) len@171@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- (Seq_length a@168@01) 1) len@171@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 110 | |a@168@01| - 1 < len@171@01 | live]
; [else-branch: 110 | !(|a@168@01| - 1 < len@171@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 110 | |a@168@01| - 1 < len@171@01]
(assert (< (- (Seq_length a@168@01) 1) len@171@01))
; [eval] |a| - 1
; [eval] |a|
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- (Seq_length a@168@01) 1) len@171@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@261@01)
  (and (<= 1 i@261@01) (< (- (Seq_length a@168@01) 1) len@171@01))))
(assert (or (<= 1 i@261@01) (not (<= 1 i@261@01))))
(assert (and (<= 1 i@261@01) (< i@261@01 (+ (- (Seq_length a@168@01) 1) 1))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@261@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@261@01 (Seq_length a@168@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@262@01 ($Ref) Int)
(declare-fun img@263@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@261@01 Int)) (!
  (=>
    (and (<= 1 i@261@01) (< i@261@01 (+ (- (Seq_length a@168@01) 1) 1)))
    (and
      (=>
        (<= 1 i@261@01)
        (and (<= 1 i@261@01) (< (- (Seq_length a@168@01) 1) len@171@01)))
      (or (<= 1 i@261@01) (not (<= 1 i@261@01)))))
  :pattern ((Seq_index a@168@01 i@261@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@261@01 Int) (i2@261@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@261@01) (< i1@261@01 (+ (- (Seq_length a@168@01) 1) 1)))
      (and (<= 1 i2@261@01) (< i2@261@01 (+ (- (Seq_length a@168@01) 1) 1)))
      (= (Seq_index a@168@01 i1@261@01) (Seq_index a@168@01 i2@261@01)))
    (= i1@261@01 i2@261@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@261@01 Int)) (!
  (=>
    (and (<= 1 i@261@01) (< i@261@01 (+ (- (Seq_length a@168@01) 1) 1)))
    (and
      (= (inv@262@01 (Seq_index a@168@01 i@261@01)) i@261@01)
      (img@263@01 (Seq_index a@168@01 i@261@01))))
  :pattern ((Seq_index a@168@01 i@261@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@263@01 r)
      (and
        (<= 1 (inv@262@01 r))
        (< (inv@262@01 r) (+ (- (Seq_length a@168@01) 1) 1))))
    (= (Seq_index a@168@01 (inv@262@01 r)) r))
  :pattern ((inv@262@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@261@01 Int)) (!
  (= (Seq_index a@168@01 i@261@01) (Seq_index c@170@01 i@261@01))
  
  :qid |quant-u-161|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@261@01 Int)) (!
  (= (Seq_index a@168@01 i@261@01) (Seq_index b@169@01 i@261@01))
  
  :qid |quant-u-162|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@264@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@262@01 r))
        (< (inv@262@01 r) (+ (- (Seq_length a@168@01) 1) 1)))
      (img@263@01 r)
      (= r (Seq_index a@168@01 (inv@262@01 r))))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@265@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@262@01 r))
        (< (inv@262@01 r) (+ (- (Seq_length a@168@01) 1) 1)))
      (img@263@01 r)
      (= r (Seq_index a@168@01 (inv@262@01 r))))
    ($Perm.min
      (ite
        (and
          (img@184@01 r)
          (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@264@01 r)))
    $Perm.No))
(define-fun pTaken@266@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@262@01 r))
        (< (inv@262@01 r) (+ (- (Seq_length a@168@01) 1) 1)))
      (img@263@01 r)
      (= r (Seq_index a@168@01 (inv@262@01 r))))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
        (- $Perm.Write (pTaken@207@01 r))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@264@01 r)) (pTaken@265@01 r)))
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
          (img@187@01 r)
          (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@264@01 r))
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
      (and
        (<= 1 (inv@262@01 r))
        (< (inv@262@01 r) (+ (- (Seq_length a@168@01) 1) 1)))
      (img@263@01 r)
      (= r (Seq_index a@168@01 (inv@262@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@264@01 r)) $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@267@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (and (<= 0 (inv@186@01 r)) (< (inv@186@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@267@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@267@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@267@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@267@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
      (< $Perm.No (- $Perm.Write (pTaken@207@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@267@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@267@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))) r))
  :qid |qp.fvfValDef20|)))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 111 | 0 < len@171@01 | dead]
; [else-branch: 111 | !(0 < len@171@01) | live]
(push) ; 5
; [else-branch: 111 | !(0 < len@171@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(declare-const i@268@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 112 | !(0 <= i@268@01) | live]
; [else-branch: 112 | 0 <= i@268@01 | live]
(push) ; 6
; [then-branch: 112 | !(0 <= i@268@01)]
(assert (not (<= 0 i@268@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 112 | 0 <= i@268@01]
(assert (<= 0 i@268@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@268@01) (not (<= 0 i@268@01))))
(assert (and (<= 0 i@268@01) (< i@268@01 len@171@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@268@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@268@01 (Seq_length b@169@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@269@01 ($Ref) Int)
(declare-fun img@270@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@268@01 Int)) (!
  (=>
    (and (<= 0 i@268@01) (< i@268@01 len@171@01))
    (or (<= 0 i@268@01) (not (<= 0 i@268@01))))
  :pattern ((Seq_index b@169@01 i@268@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@268@01 Int) (i2@268@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@268@01) (< i1@268@01 len@171@01))
      (and (<= 0 i2@268@01) (< i2@268@01 len@171@01))
      (= (Seq_index b@169@01 i1@268@01) (Seq_index b@169@01 i2@268@01)))
    (= i1@268@01 i2@268@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@268@01 Int)) (!
  (=>
    (and (<= 0 i@268@01) (< i@268@01 len@171@01))
    (and
      (= (inv@269@01 (Seq_index b@169@01 i@268@01)) i@268@01)
      (img@270@01 (Seq_index b@169@01 i@268@01))))
  :pattern ((Seq_index b@169@01 i@268@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@270@01 r)
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) len@171@01)))
    (= (Seq_index b@169@01 (inv@269@01 r)) r))
  :pattern ((inv@269@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@268@01 Int)) (!
  (= (Seq_index b@169@01 i@268@01) (Seq_index a@168@01 i@268@01))
  
  :qid |quant-u-167|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@271@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) len@171@01))
      (img@270@01 r)
      (= r (Seq_index b@169@01 (inv@269@01 r))))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
        (- $Perm.Write (pTaken@207@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@272@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) len@171@01))
      (img@270@01 r)
      (= r (Seq_index b@169@01 (inv@269@01 r))))
    ($Perm.min
      (ite
        (and
          (img@184@01 r)
          (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@271@01 r)))
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
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
        (- $Perm.Write (pTaken@207@01 r))
        $Perm.No)
      (pTaken@271@01 r))
    $Perm.No)
  
  :qid |quant-u-169|))))
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
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) len@171@01))
      (img@270@01 r)
      (= r (Seq_index b@169@01 (inv@269@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@271@01 r)) $Perm.No))
  
  :qid |quant-u-170|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@273@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@171@01)))
      (< $Perm.No (- $Perm.Write (pTaken@207@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@273@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@273@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@273@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@273@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r))
  :qid |qp.fvfValDef22|)))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 113 | 0 < len@171@01 | dead]
; [else-branch: 113 | !(0 < len@171@01) | live]
(push) ; 5
; [else-branch: 113 | !(0 < len@171@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(declare-const i@274@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 114 | !(0 <= i@274@01) | live]
; [else-branch: 114 | 0 <= i@274@01 | live]
(push) ; 6
; [then-branch: 114 | !(0 <= i@274@01)]
(assert (not (<= 0 i@274@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 114 | 0 <= i@274@01]
(assert (<= 0 i@274@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@274@01) (not (<= 0 i@274@01))))
(assert (and (<= 0 i@274@01) (< i@274@01 len@171@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@274@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@274@01 (Seq_length c@170@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@275@01 ($Ref) Int)
(declare-fun img@276@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@274@01 Int)) (!
  (=>
    (and (<= 0 i@274@01) (< i@274@01 len@171@01))
    (or (<= 0 i@274@01) (not (<= 0 i@274@01))))
  :pattern ((Seq_index c@170@01 i@274@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@274@01 Int) (i2@274@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@274@01) (< i1@274@01 len@171@01))
      (and (<= 0 i2@274@01) (< i2@274@01 len@171@01))
      (= (Seq_index c@170@01 i1@274@01) (Seq_index c@170@01 i2@274@01)))
    (= i1@274@01 i2@274@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@274@01 Int)) (!
  (=>
    (and (<= 0 i@274@01) (< i@274@01 len@171@01))
    (and
      (= (inv@275@01 (Seq_index c@170@01 i@274@01)) i@274@01)
      (img@276@01 (Seq_index c@170@01 i@274@01))))
  :pattern ((Seq_index c@170@01 i@274@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@276@01 r)
      (and (<= 0 (inv@275@01 r)) (< (inv@275@01 r) len@171@01)))
    (= (Seq_index c@170@01 (inv@275@01 r)) r))
  :pattern ((inv@275@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@274@01 Int)) (!
  (= (Seq_index c@170@01 i@274@01) (Seq_index b@169@01 i@274@01))
  
  :qid |quant-u-172|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@277@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@275@01 r)) (< (inv@275@01 r) len@171@01))
      (img@276@01 r)
      (= r (Seq_index c@170@01 (inv@275@01 r))))
    ($Perm.min
      (ite
        (and
          (img@184@01 r)
          (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
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
          (img@184@01 r)
          (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@277@01 r))
    $Perm.No)
  
  :qid |quant-u-174|))))
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
      (and (<= 0 (inv@275@01 r)) (< (inv@275@01 r) len@171@01))
      (img@276@01 r)
      (= r (Seq_index c@170@01 (inv@275@01 r))))
    (= (- $Perm.Write (pTaken@277@01 r)) $Perm.No))
  
  :qid |quant-u-175|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@278@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (and (<= 0 (inv@183@01 r)) (< (inv@183@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@278@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@278@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@172@01)))))))))) r))
  :qid |qp.fvfValDef23|)))
(declare-const $t@279@01 $Snap)
(assert (= $t@279@01 ($Snap.combine ($Snap.first $t@279@01) ($Snap.second $t@279@01))))
(assert (= ($Snap.first $t@279@01) $Snap.unit))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 115 | 0 < len@171@01 | dead]
; [else-branch: 115 | !(0 < len@171@01) | live]
(push) ; 5
; [else-branch: 115 | !(0 < len@171@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second $t@279@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@279@01))
    ($Snap.second ($Snap.second $t@279@01)))))
(declare-const i@280@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 116 | !(0 <= i@280@01) | live]
; [else-branch: 116 | 0 <= i@280@01 | live]
(push) ; 6
; [then-branch: 116 | !(0 <= i@280@01)]
(assert (not (<= 0 i@280@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 116 | 0 <= i@280@01]
(assert (<= 0 i@280@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@280@01) (not (<= 0 i@280@01))))
(assert (and (<= 0 i@280@01) (< i@280@01 len@171@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@280@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@280@01 (Seq_length a@168@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@281@01 ($Ref) Int)
(declare-fun img@282@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@280@01 Int)) (!
  (=>
    (and (<= 0 i@280@01) (< i@280@01 len@171@01))
    (or (<= 0 i@280@01) (not (<= 0 i@280@01))))
  :pattern ((Seq_index a@168@01 i@280@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@280@01 Int) (i2@280@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@280@01) (< i1@280@01 len@171@01))
      (and (<= 0 i2@280@01) (< i2@280@01 len@171@01))
      (= (Seq_index a@168@01 i1@280@01) (Seq_index a@168@01 i2@280@01)))
    (= i1@280@01 i2@280@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@280@01 Int)) (!
  (=>
    (and (<= 0 i@280@01) (< i@280@01 len@171@01))
    (and
      (= (inv@281@01 (Seq_index a@168@01 i@280@01)) i@280@01)
      (img@282@01 (Seq_index a@168@01 i@280@01))))
  :pattern ((Seq_index a@168@01 i@280@01))
  :qid |quant-u-177|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@282@01 r)
      (and (<= 0 (inv@281@01 r)) (< (inv@281@01 r) len@171@01)))
    (= (Seq_index a@168@01 (inv@281@01 r)) r))
  :pattern ((inv@281@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@280@01 Int)) (!
  (=>
    (and (<= 0 i@280@01) (< i@280@01 len@171@01))
    (not (= (Seq_index a@168@01 i@280@01) $Ref.null)))
  :pattern ((Seq_index a@168@01 i@280@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@279@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@279@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@279@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@279@01))) $Snap.unit))
; [eval] 0 < len ==> |b| == len
; [eval] 0 < len
(push) ; 4
; [then-branch: 117 | 0 < len@171@01 | dead]
; [else-branch: 117 | !(0 < len@171@01) | live]
(push) ; 5
; [else-branch: 117 | !(0 < len@171@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@279@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))))
(declare-const i@283@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 118 | !(0 <= i@283@01) | live]
; [else-branch: 118 | 0 <= i@283@01 | live]
(push) ; 6
; [then-branch: 118 | !(0 <= i@283@01)]
(assert (not (<= 0 i@283@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 118 | 0 <= i@283@01]
(assert (<= 0 i@283@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@283@01) (not (<= 0 i@283@01))))
(assert (and (<= 0 i@283@01) (< i@283@01 len@171@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@283@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@283@01 (Seq_length b@169@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@284@01 ($Ref) Int)
(declare-fun img@285@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@283@01 Int)) (!
  (=>
    (and (<= 0 i@283@01) (< i@283@01 len@171@01))
    (or (<= 0 i@283@01) (not (<= 0 i@283@01))))
  :pattern ((Seq_index b@169@01 i@283@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@283@01 Int) (i2@283@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@283@01) (< i1@283@01 len@171@01))
      (and (<= 0 i2@283@01) (< i2@283@01 len@171@01))
      (= (Seq_index b@169@01 i1@283@01) (Seq_index b@169@01 i2@283@01)))
    (= i1@283@01 i2@283@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@283@01 Int)) (!
  (=>
    (and (<= 0 i@283@01) (< i@283@01 len@171@01))
    (and
      (= (inv@284@01 (Seq_index b@169@01 i@283@01)) i@283@01)
      (img@285@01 (Seq_index b@169@01 i@283@01))))
  :pattern ((Seq_index b@169@01 i@283@01))
  :qid |quant-u-179|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@285@01 r)
      (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))
    (= (Seq_index b@169@01 (inv@284@01 r)) r))
  :pattern ((inv@284@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@283@01 Int)) (!
  (=>
    (and (<= 0 i@283@01) (< i@283@01 len@171@01))
    (not (= (Seq_index b@169@01 i@283@01) $Ref.null)))
  :pattern ((Seq_index b@169@01 i@283@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@169@01 i@283@01) (Seq_index a@168@01 i@280@01))
    (=
      (and
        (img@285@01 r)
        (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))
      (and
        (img@282@01 r)
        (and (<= 0 (inv@281@01 r)) (< (inv@281@01 r) len@171@01)))))
  
  :qid |quant-u-180|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))
  $Snap.unit))
; [eval] 0 < len ==> |c| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 119 | 0 < len@171@01 | dead]
; [else-branch: 119 | !(0 < len@171@01) | live]
(push) ; 5
; [else-branch: 119 | !(0 < len@171@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(declare-const i@286@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 120 | !(0 <= i@286@01) | live]
; [else-branch: 120 | 0 <= i@286@01 | live]
(push) ; 6
; [then-branch: 120 | !(0 <= i@286@01)]
(assert (not (<= 0 i@286@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 120 | 0 <= i@286@01]
(assert (<= 0 i@286@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@286@01) (not (<= 0 i@286@01))))
(assert (and (<= 0 i@286@01) (< i@286@01 len@171@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@286@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@286@01 (Seq_length c@170@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@287@01 ($Ref) Int)
(declare-fun img@288@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@286@01 Int)) (!
  (=>
    (and (<= 0 i@286@01) (< i@286@01 len@171@01))
    (or (<= 0 i@286@01) (not (<= 0 i@286@01))))
  :pattern ((Seq_index c@170@01 i@286@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@286@01 Int) (i2@286@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@286@01) (< i1@286@01 len@171@01))
      (and (<= 0 i2@286@01) (< i2@286@01 len@171@01))
      (= (Seq_index c@170@01 i1@286@01) (Seq_index c@170@01 i2@286@01)))
    (= i1@286@01 i2@286@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@286@01 Int)) (!
  (=>
    (and (<= 0 i@286@01) (< i@286@01 len@171@01))
    (and
      (= (inv@287@01 (Seq_index c@170@01 i@286@01)) i@286@01)
      (img@288@01 (Seq_index c@170@01 i@286@01))))
  :pattern ((Seq_index c@170@01 i@286@01))
  :qid |quant-u-182|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@288@01 r)
      (and (<= 0 (inv@287@01 r)) (< (inv@287@01 r) len@171@01)))
    (= (Seq_index c@170@01 (inv@287@01 r)) r))
  :pattern ((inv@287@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@286@01 Int)) (!
  (=>
    (and (<= 0 i@286@01) (< i@286@01 len@171@01))
    (not (= (Seq_index c@170@01 i@286@01) $Ref.null)))
  :pattern ((Seq_index c@170@01 i@286@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@170@01 i@286@01) (Seq_index b@169@01 i@283@01))
    (=
      (and
        (img@288@01 r)
        (and (<= 0 (inv@287@01 r)) (< (inv@287@01 r) len@171@01)))
      (and
        (img@285@01 r)
        (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))))
  
  :qid |quant-u-183|))))
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
    (= (Seq_index c@170@01 i@286@01) (Seq_index a@168@01 i@280@01))
    (=
      (and
        (img@288@01 r)
        (and (<= 0 (inv@287@01 r)) (< (inv@287@01 r) len@171@01)))
      (and
        (img@282@01 r)
        (and (<= 0 (inv@281@01 r)) (< (inv@281@01 r) len@171@01)))))
  
  :qid |quant-u-184|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |a| == len
; [eval] |a|
(declare-const i@289@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 121 | !(0 <= i@289@01) | live]
; [else-branch: 121 | 0 <= i@289@01 | live]
(push) ; 6
; [then-branch: 121 | !(0 <= i@289@01)]
(assert (not (<= 0 i@289@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 121 | 0 <= i@289@01]
(assert (<= 0 i@289@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@289@01) (not (<= 0 i@289@01))))
(assert (and (<= 0 i@289@01) (< i@289@01 len@171@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@289@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@289@01 (Seq_length a@168@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@290@01 ($Ref) Int)
(declare-fun img@291@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@289@01 Int)) (!
  (=>
    (and (<= 0 i@289@01) (< i@289@01 len@171@01))
    (or (<= 0 i@289@01) (not (<= 0 i@289@01))))
  :pattern ((Seq_index a@168@01 i@289@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@289@01 Int) (i2@289@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@289@01) (< i1@289@01 len@171@01))
      (and (<= 0 i2@289@01) (< i2@289@01 len@171@01))
      (= (Seq_index a@168@01 i1@289@01) (Seq_index a@168@01 i2@289@01)))
    (= i1@289@01 i2@289@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@289@01 Int)) (!
  (=>
    (and (<= 0 i@289@01) (< i@289@01 len@171@01))
    (and
      (= (inv@290@01 (Seq_index a@168@01 i@289@01)) i@289@01)
      (img@291@01 (Seq_index a@168@01 i@289@01))))
  :pattern ((Seq_index a@168@01 i@289@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@291@01 r)
      (and (<= 0 (inv@290@01 r)) (< (inv@290@01 r) len@171@01)))
    (= (Seq_index a@168@01 (inv@290@01 r)) r))
  :pattern ((inv@290@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@289@01 Int)) (!
  (= (Seq_index a@168@01 i@289@01) (Seq_index b@169@01 i@289@01))
  
  :qid |quant-u-186|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@289@01 Int)) (!
  (= (Seq_index a@168@01 i@289@01) (Seq_index c@170@01 i@289@01))
  
  :qid |quant-u-187|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@292@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@290@01 r)) (< (inv@290@01 r) len@171@01))
      (img@291@01 r)
      (= r (Seq_index a@168@01 (inv@290@01 r))))
    ($Perm.min
      (ite
        (and
          (img@282@01 r)
          (and (<= 0 (inv@281@01 r)) (< (inv@281@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@293@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@290@01 r)) (< (inv@290@01 r) len@171@01))
      (img@291@01 r)
      (= r (Seq_index a@168@01 (inv@290@01 r))))
    ($Perm.min
      (ite
        (and
          (img@285@01 r)
          (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@292@01 r)))
    $Perm.No))
(define-fun pTaken@294@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@290@01 r)) (< (inv@290@01 r) len@171@01))
      (img@291@01 r)
      (= r (Seq_index a@168@01 (inv@290@01 r))))
    ($Perm.min
      (ite
        (and
          (img@288@01 r)
          (and (<= 0 (inv@287@01 r)) (< (inv@287@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@292@01 r)) (pTaken@293@01 r)))
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
          (img@282@01 r)
          (and (<= 0 (inv@281@01 r)) (< (inv@281@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@292@01 r))
    $Perm.No)
  
  :qid |quant-u-189|))))
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
      (and (<= 0 (inv@290@01 r)) (< (inv@290@01 r) len@171@01))
      (img@291@01 r)
      (= r (Seq_index a@168@01 (inv@290@01 r))))
    (= (- $Perm.Write (pTaken@292@01 r)) $Perm.No))
  
  :qid |quant-u-190|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@295@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@282@01 r)
      (and (<= 0 (inv@281@01 r)) (< (inv@281@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@295@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@279@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@295@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@279@01))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@285@01 r)
      (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@295@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@295@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@288@01 r)
      (and (<= 0 (inv@287@01 r)) (< (inv@287@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@295@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@295@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))) r))
  :qid |qp.fvfValDef26|)))
; [eval] |b| == len
; [eval] |b|
(declare-const i@296@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 122 | !(0 <= i@296@01) | live]
; [else-branch: 122 | 0 <= i@296@01 | live]
(push) ; 6
; [then-branch: 122 | !(0 <= i@296@01)]
(assert (not (<= 0 i@296@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 122 | 0 <= i@296@01]
(assert (<= 0 i@296@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@296@01) (not (<= 0 i@296@01))))
(assert (and (<= 0 i@296@01) (< i@296@01 len@171@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@296@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@296@01 (Seq_length b@169@01))))
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
    (and (<= 0 i@296@01) (< i@296@01 len@171@01))
    (or (<= 0 i@296@01) (not (<= 0 i@296@01))))
  :pattern ((Seq_index b@169@01 i@296@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@296@01 Int) (i2@296@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@296@01) (< i1@296@01 len@171@01))
      (and (<= 0 i2@296@01) (< i2@296@01 len@171@01))
      (= (Seq_index b@169@01 i1@296@01) (Seq_index b@169@01 i2@296@01)))
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
    (and (<= 0 i@296@01) (< i@296@01 len@171@01))
    (and
      (= (inv@297@01 (Seq_index b@169@01 i@296@01)) i@296@01)
      (img@298@01 (Seq_index b@169@01 i@296@01))))
  :pattern ((Seq_index b@169@01 i@296@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@298@01 r)
      (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) len@171@01)))
    (= (Seq_index b@169@01 (inv@297@01 r)) r))
  :pattern ((inv@297@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@296@01 Int)) (!
  (= (Seq_index b@169@01 i@296@01) (Seq_index c@170@01 i@296@01))
  
  :qid |quant-u-192|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@299@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) len@171@01))
      (img@298@01 r)
      (= r (Seq_index b@169@01 (inv@297@01 r))))
    ($Perm.min
      (ite
        (and
          (img@288@01 r)
          (and (<= 0 (inv@287@01 r)) (< (inv@287@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@300@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) len@171@01))
      (img@298@01 r)
      (= r (Seq_index b@169@01 (inv@297@01 r))))
    ($Perm.min
      (ite
        (and
          (img@285@01 r)
          (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@299@01 r)))
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
          (img@288@01 r)
          (and (<= 0 (inv@287@01 r)) (< (inv@287@01 r) len@171@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@299@01 r))
    $Perm.No)
  
  :qid |quant-u-194|))))
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
      (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) len@171@01))
      (img@298@01 r)
      (= r (Seq_index b@169@01 (inv@297@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@299@01 r)) $Perm.No))
  
  :qid |quant-u-195|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@301@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@288@01 r)
      (and (<= 0 (inv@287@01 r)) (< (inv@287@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@301@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@301@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@285@01 r)
      (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@301@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@301@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))) r))
  :qid |qp.fvfValDef28|)))
; [eval] |c| == len
; [eval] |c|
(declare-const i@302@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 123 | !(0 <= i@302@01) | live]
; [else-branch: 123 | 0 <= i@302@01 | live]
(push) ; 6
; [then-branch: 123 | !(0 <= i@302@01)]
(assert (not (<= 0 i@302@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 123 | 0 <= i@302@01]
(assert (<= 0 i@302@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@302@01) (not (<= 0 i@302@01))))
(assert (and (<= 0 i@302@01) (< i@302@01 len@171@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@302@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@302@01 (Seq_length c@170@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@303@01 ($Ref) Int)
(declare-fun img@304@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@302@01 Int)) (!
  (=>
    (and (<= 0 i@302@01) (< i@302@01 len@171@01))
    (or (<= 0 i@302@01) (not (<= 0 i@302@01))))
  :pattern ((Seq_index c@170@01 i@302@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@302@01 Int) (i2@302@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@302@01) (< i1@302@01 len@171@01))
      (and (<= 0 i2@302@01) (< i2@302@01 len@171@01))
      (= (Seq_index c@170@01 i1@302@01) (Seq_index c@170@01 i2@302@01)))
    (= i1@302@01 i2@302@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@302@01 Int)) (!
  (=>
    (and (<= 0 i@302@01) (< i@302@01 len@171@01))
    (and
      (= (inv@303@01 (Seq_index c@170@01 i@302@01)) i@302@01)
      (img@304@01 (Seq_index c@170@01 i@302@01))))
  :pattern ((Seq_index c@170@01 i@302@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@304@01 r)
      (and (<= 0 (inv@303@01 r)) (< (inv@303@01 r) len@171@01)))
    (= (Seq_index c@170@01 (inv@303@01 r)) r))
  :pattern ((inv@303@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@302@01 Int)) (!
  (= (Seq_index c@170@01 i@302@01) (Seq_index b@169@01 i@302@01))
  
  :qid |quant-u-197|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@305@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@303@01 r)) (< (inv@303@01 r) len@171@01))
      (img@304@01 r)
      (= r (Seq_index c@170@01 (inv@303@01 r))))
    ($Perm.min
      (ite
        (and
          (img@285@01 r)
          (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
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
          (img@285@01 r)
          (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@305@01 r))
    $Perm.No)
  
  :qid |quant-u-199|))))
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
      (and (<= 0 (inv@303@01 r)) (< (inv@303@01 r) len@171@01))
      (img@304@01 r)
      (= r (Seq_index c@170@01 (inv@303@01 r))))
    (= (- $Perm.Write (pTaken@305@01 r)) $Perm.No))
  
  :qid |quant-u-200|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@306@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@285@01 r)
      (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) len@171@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@306@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@306@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))) r))
  :qid |qp.fvfValDef29|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
