(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:23:53
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr
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
; ---------- Ref__loop_main_22 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const len@2@01 Int)
(declare-const a@3@01 Seq<$Ref>)
(declare-const diz@4@01 $Ref)
(declare-const current_thread_id@5@01 Int)
(declare-const len@6@01 Int)
(declare-const a@7@01 Seq<$Ref>)
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
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@5@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 len@6@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 len@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | 0 < len@6@01 | live]
; [else-branch: 0 | !(0 < len@6@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | 0 < len@6@01]
(assert (< 0 len@6@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(0 < len@6@01)]
(assert (not (< 0 len@6@01)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (< 0 len@6@01)) (< 0 len@6@01)))
(assert (=> (< 0 len@6@01) (= (Seq_length a@7@01) len@6@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@9@01 Int)
(declare-const j@10@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 1 | !(k@9@01 >= 0) | live]
; [else-branch: 1 | k@9@01 >= 0 | live]
(push) ; 4
; [then-branch: 1 | !(k@9@01 >= 0)]
(assert (not (>= k@9@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | k@9@01 >= 0]
(assert (>= k@9@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 2 | !(k@9@01 < |a@7@01|) | live]
; [else-branch: 2 | k@9@01 < |a@7@01| | live]
(push) ; 6
; [then-branch: 2 | !(k@9@01 < |a@7@01|)]
(assert (not (< k@9@01 (Seq_length a@7@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | k@9@01 < |a@7@01|]
(assert (< k@9@01 (Seq_length a@7@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 3 | !(j@10@01 >= 0) | live]
; [else-branch: 3 | j@10@01 >= 0 | live]
(push) ; 8
; [then-branch: 3 | !(j@10@01 >= 0)]
(assert (not (>= j@10@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 3 | j@10@01 >= 0]
(assert (>= j@10@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 4 | !(j@10@01 < |a@7@01|) | live]
; [else-branch: 4 | j@10@01 < |a@7@01| | live]
(push) ; 10
; [then-branch: 4 | !(j@10@01 < |a@7@01|)]
(assert (not (< j@10@01 (Seq_length a@7@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 4 | j@10@01 < |a@7@01|]
(assert (< j@10@01 (Seq_length a@7@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@10@01 (Seq_length a@7@01)) (not (< j@10@01 (Seq_length a@7@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@10@01 0)
  (and
    (>= j@10@01 0)
    (or (< j@10@01 (Seq_length a@7@01)) (not (< j@10@01 (Seq_length a@7@01)))))))
(assert (or (>= j@10@01 0) (not (>= j@10@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@9@01 (Seq_length a@7@01))
  (and
    (< k@9@01 (Seq_length a@7@01))
    (=>
      (>= j@10@01 0)
      (and
        (>= j@10@01 0)
        (or
          (< j@10@01 (Seq_length a@7@01))
          (not (< j@10@01 (Seq_length a@7@01))))))
    (or (>= j@10@01 0) (not (>= j@10@01 0))))))
(assert (or (< k@9@01 (Seq_length a@7@01)) (not (< k@9@01 (Seq_length a@7@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@9@01 0)
  (and
    (>= k@9@01 0)
    (=>
      (< k@9@01 (Seq_length a@7@01))
      (and
        (< k@9@01 (Seq_length a@7@01))
        (=>
          (>= j@10@01 0)
          (and
            (>= j@10@01 0)
            (or
              (< j@10@01 (Seq_length a@7@01))
              (not (< j@10@01 (Seq_length a@7@01))))))
        (or (>= j@10@01 0) (not (>= j@10@01 0)))))
    (or (< k@9@01 (Seq_length a@7@01)) (not (< k@9@01 (Seq_length a@7@01)))))))
(assert (or (>= k@9@01 0) (not (>= k@9@01 0))))
(push) ; 3
; [then-branch: 5 | k@9@01 >= 0 && k@9@01 < |a@7@01| && j@10@01 >= 0 && j@10@01 < |a@7@01| && k@9@01 != j@10@01 | live]
; [else-branch: 5 | !(k@9@01 >= 0 && k@9@01 < |a@7@01| && j@10@01 >= 0 && j@10@01 < |a@7@01| && k@9@01 != j@10@01) | live]
(push) ; 4
; [then-branch: 5 | k@9@01 >= 0 && k@9@01 < |a@7@01| && j@10@01 >= 0 && j@10@01 < |a@7@01| && k@9@01 != j@10@01]
(assert (and
  (>= k@9@01 0)
  (and
    (< k@9@01 (Seq_length a@7@01))
    (and
      (>= j@10@01 0)
      (and (< j@10@01 (Seq_length a@7@01)) (not (= k@9@01 j@10@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(k@9@01 >= 0 && k@9@01 < |a@7@01| && j@10@01 >= 0 && j@10@01 < |a@7@01| && k@9@01 != j@10@01)]
(assert (not
  (and
    (>= k@9@01 0)
    (and
      (< k@9@01 (Seq_length a@7@01))
      (and
        (>= j@10@01 0)
        (and (< j@10@01 (Seq_length a@7@01)) (not (= k@9@01 j@10@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@9@01 0)
    (and
      (< k@9@01 (Seq_length a@7@01))
      (and
        (>= j@10@01 0)
        (and (< j@10@01 (Seq_length a@7@01)) (not (= k@9@01 j@10@01))))))
  (and
    (>= k@9@01 0)
    (< k@9@01 (Seq_length a@7@01))
    (>= j@10@01 0)
    (< j@10@01 (Seq_length a@7@01))
    (not (= k@9@01 j@10@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@9@01 0)
      (and
        (< k@9@01 (Seq_length a@7@01))
        (and
          (>= j@10@01 0)
          (and (< j@10@01 (Seq_length a@7@01)) (not (= k@9@01 j@10@01)))))))
  (and
    (>= k@9@01 0)
    (and
      (< k@9@01 (Seq_length a@7@01))
      (and
        (>= j@10@01 0)
        (and (< j@10@01 (Seq_length a@7@01)) (not (= k@9@01 j@10@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (>= k@9@01 0)
      (and
        (>= k@9@01 0)
        (=>
          (< k@9@01 (Seq_length a@7@01))
          (and
            (< k@9@01 (Seq_length a@7@01))
            (=>
              (>= j@10@01 0)
              (and
                (>= j@10@01 0)
                (or
                  (< j@10@01 (Seq_length a@7@01))
                  (not (< j@10@01 (Seq_length a@7@01))))))
            (or (>= j@10@01 0) (not (>= j@10@01 0)))))
        (or (< k@9@01 (Seq_length a@7@01)) (not (< k@9@01 (Seq_length a@7@01))))))
    (or (>= k@9@01 0) (not (>= k@9@01 0)))
    (=>
      (and
        (>= k@9@01 0)
        (and
          (< k@9@01 (Seq_length a@7@01))
          (and
            (>= j@10@01 0)
            (and (< j@10@01 (Seq_length a@7@01)) (not (= k@9@01 j@10@01))))))
      (and
        (>= k@9@01 0)
        (< k@9@01 (Seq_length a@7@01))
        (>= j@10@01 0)
        (< j@10@01 (Seq_length a@7@01))
        (not (= k@9@01 j@10@01))))
    (or
      (not
        (and
          (>= k@9@01 0)
          (and
            (< k@9@01 (Seq_length a@7@01))
            (and
              (>= j@10@01 0)
              (and (< j@10@01 (Seq_length a@7@01)) (not (= k@9@01 j@10@01)))))))
      (and
        (>= k@9@01 0)
        (and
          (< k@9@01 (Seq_length a@7@01))
          (and
            (>= j@10@01 0)
            (and (< j@10@01 (Seq_length a@7@01)) (not (= k@9@01 j@10@01))))))))
  :pattern ((Seq_index a@7@01 k@9@01) (Seq_index a@7@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@62@12@62@100-aux|)))
(assert (forall ((k@9@01 Int) (j@10@01 Int)) (!
  (=>
    (and
      (>= k@9@01 0)
      (and
        (< k@9@01 (Seq_length a@7@01))
        (and
          (>= j@10@01 0)
          (and (< j@10@01 (Seq_length a@7@01)) (not (= k@9@01 j@10@01))))))
    (not (= (Seq_index a@7@01 k@9@01) (Seq_index a@7@01 j@10@01))))
  :pattern ((Seq_index a@7@01 k@9@01) (Seq_index a@7@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@62@12@62@100|)))
(declare-const i@11@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 6 | !(0 <= i@11@01) | live]
; [else-branch: 6 | 0 <= i@11@01 | live]
(push) ; 4
; [then-branch: 6 | !(0 <= i@11@01)]
(assert (not (<= 0 i@11@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | 0 <= i@11@01]
(assert (<= 0 i@11@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
(assert (and (<= 0 i@11@01) (< i@11@01 len@6@01)))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@11@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@11@01 (Seq_length a@7@01))))
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
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 len@6@01))
    (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
  :pattern ((Seq_index a@7@01 i@11@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@11@01 Int) (i2@11@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@11@01) (< i1@11@01 len@6@01))
      (and (<= 0 i2@11@01) (< i2@11@01 len@6@01))
      (= (Seq_index a@7@01 i1@11@01) (Seq_index a@7@01 i2@11@01)))
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
    (and (<= 0 i@11@01) (< i@11@01 len@6@01))
    (and
      (= (inv@12@01 (Seq_index a@7@01 i@11@01)) i@11@01)
      (img@13@01 (Seq_index a@7@01 i@11@01))))
  :pattern ((Seq_index a@7@01 i@11@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) len@6@01)))
    (= (Seq_index a@7@01 (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 len@6@01))
    (not (= (Seq_index a@7@01 i@11@01) $Ref.null)))
  :pattern ((Seq_index a@7@01 i@11@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@6@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@6@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | 0 < len@6@01 | live]
; [else-branch: 7 | !(0 < len@6@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | 0 < len@6@01]
(assert (< 0 len@6@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(0 < len@6@01)]
(assert (not (< 0 len@6@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(declare-const i@15@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 8 | !(0 <= i@15@01) | live]
; [else-branch: 8 | 0 <= i@15@01 | live]
(push) ; 5
; [then-branch: 8 | !(0 <= i@15@01)]
(assert (not (<= 0 i@15@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | 0 <= i@15@01]
(assert (<= 0 i@15@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
(assert (and (<= 0 i@15@01) (< i@15@01 len@6@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@15@01 (Seq_length a@7@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@16@01 ($Ref) Int)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 len@6@01))
    (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
  :pattern ((Seq_index a@7@01 i@15@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@15@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@15@01) (< i1@15@01 len@6@01))
      (and (<= 0 i2@15@01) (< i2@15@01 len@6@01))
      (= (Seq_index a@7@01 i1@15@01) (Seq_index a@7@01 i2@15@01)))
    (= i1@15@01 i2@15@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 len@6@01))
    (and
      (= (inv@16@01 (Seq_index a@7@01 i@15@01)) i@15@01)
      (img@17@01 (Seq_index a@7@01 i@15@01))))
  :pattern ((Seq_index a@7@01 i@15@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@6@01)))
    (= (Seq_index a@7@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 len@6@01))
    (not (= (Seq_index a@7@01 i@15@01) $Ref.null)))
  :pattern ((Seq_index a@7@01 i@15@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@14@01)) $Snap.unit))
; [eval] (forall i: Int :: { old(a[i]) } 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value))
(declare-const i@18@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 9 | !(0 <= i@18@01) | live]
; [else-branch: 9 | 0 <= i@18@01 | live]
(push) ; 5
; [then-branch: 9 | !(0 <= i@18@01)]
(assert (not (<= 0 i@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | 0 <= i@18@01]
(assert (<= 0 i@18@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@18@01) (not (<= 0 i@18@01))))
(push) ; 4
; [then-branch: 10 | 0 <= i@18@01 && i@18@01 < len@6@01 | live]
; [else-branch: 10 | !(0 <= i@18@01 && i@18@01 < len@6@01) | live]
(push) ; 5
; [then-branch: 10 | 0 <= i@18@01 && i@18@01 < len@6@01]
(assert (and (<= 0 i@18@01) (< i@18@01 len@6@01)))
; [eval] a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 6
(assert (not (>= i@18@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@18@01 (Seq_length a@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@17@01 (Seq_index a@7@01 i@18@01))
  (and
    (<= 0 (inv@16@01 (Seq_index a@7@01 i@18@01)))
    (< (inv@16@01 (Seq_index a@7@01 i@18@01)) len@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 6
(assert (not (>= i@18@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@18@01 (Seq_length a@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@13@01 (Seq_index a@7@01 i@18@01))
  (and
    (<= 0 (inv@12@01 (Seq_index a@7@01 i@18@01)))
    (< (inv@12@01 (Seq_index a@7@01 i@18@01)) len@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(0 <= i@18@01 && i@18@01 < len@6@01)]
(assert (not (and (<= 0 i@18@01) (< i@18@01 len@6@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@18@01) (< i@18@01 len@6@01)))
  (and (<= 0 i@18@01) (< i@18@01 len@6@01))))
; [eval] old(a[i])
; [eval] a[i]
(push) ; 4
(assert (not (>= i@18@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@18@01 Int)) (!
  (and
    (or (<= 0 i@18@01) (not (<= 0 i@18@01)))
    (or
      (not (and (<= 0 i@18@01) (< i@18@01 len@6@01)))
      (and (<= 0 i@18@01) (< i@18@01 len@6@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@66@12@66@112-aux|)))
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (<= 0 i@18@01) (< i@18@01 len@6@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@14@01))) (Seq_index
        a@7@01
        i@18@01))
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))) (Seq_index
        a@7@01
        i@18@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@66@12@66@112|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_body_22 ----------
(declare-const diz@19@01 $Ref)
(declare-const current_thread_id@20@01 Int)
(declare-const len@21@01 Int)
(declare-const a@22@01 Seq<$Ref>)
(declare-const i@23@01 Int)
(declare-const diz@24@01 $Ref)
(declare-const current_thread_id@25@01 Int)
(declare-const len@26@01 Int)
(declare-const a@27@01 Seq<$Ref>)
(declare-const i@28@01 Int)
(push) ; 1
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(assert (= ($Snap.first $t@29@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@24@01 $Ref.null)))
(assert (=
  ($Snap.second $t@29@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@29@01))
    ($Snap.second ($Snap.second $t@29@01)))))
(assert (= ($Snap.first ($Snap.second $t@29@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@25@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@29@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@29@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@29@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@29@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@28@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@29@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@28@01 len@26@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01)))))
  $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@27@01) len@26@01))
; [eval] a[i]
(push) ; 2
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@28@01 (Seq_length a@27@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@27@01 i@28@01) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.first $t@30@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@30@01))
    ($Snap.second ($Snap.second $t@30@01)))))
(assert (= ($Snap.first ($Snap.second $t@30@01)) $Snap.unit))
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second $t@30@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@30@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@30@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@30@01))) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@30@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@30@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@30@01)))))))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@28@01 (Seq_length a@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@30@01))))
  $Snap.unit))
; [eval] a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 3
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@28@01 (Seq_length a@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 3
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@28@01 (Seq_length a@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@30@01)))))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01))))))))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@31@01 $Ref)
; [exec]
; var __flatten_3: Int
(declare-const __flatten_3@32@01 Int)
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@33@01 $Ref)
; [exec]
; __flatten_2 := a[i]
; [eval] a[i]
(push) ; 3
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@28@01 (Seq_length a@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_2@34@01 $Ref)
(assert (= __flatten_2@34@01 (Seq_index a@27@01 i@28@01)))
; [exec]
; __flatten_4 := a[i]
; [eval] a[i]
(push) ; 3
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@28@01 (Seq_length a@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@35@01 $Ref)
(assert (= __flatten_4@35@01 (Seq_index a@27@01 i@28@01)))
; [exec]
; __flatten_3 := __flatten_4.Ref__Integer_value
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@27@01 i@28@01) __flatten_4@35@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_3@36@01 Int)
(assert (=
  __flatten_3@36@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01))))))))
; [exec]
; __flatten_2.Ref__Integer_value := __flatten_3
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@27@01 i@28@01) __flatten_2@34@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_2@34@01 $Ref.null)))
; [eval] 0 <= i
; [eval] i < len
; [eval] |a| == len
; [eval] |a|
; [eval] a[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@28@01 (Seq_length a@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 3
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@28@01 (Seq_length a@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 3
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@28@01 (Seq_length a@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__example ----------
(declare-const diz@37@01 $Ref)
(declare-const current_thread_id@38@01 Int)
(declare-const a@39@01 Seq<$Ref>)
(declare-const len@40@01 Int)
(declare-const diz@41@01 $Ref)
(declare-const current_thread_id@42@01 Int)
(declare-const a@43@01 Seq<$Ref>)
(declare-const len@44@01 Int)
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
; [eval] |a| == len
; [eval] |a|
(assert (= (Seq_length a@43@01) len@44@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@45@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@46@01 Int)
(declare-const j@47@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 11 | !(k@46@01 >= 0) | live]
; [else-branch: 11 | k@46@01 >= 0 | live]
(push) ; 4
; [then-branch: 11 | !(k@46@01 >= 0)]
(assert (not (>= k@46@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | k@46@01 >= 0]
(assert (>= k@46@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 12 | !(k@46@01 < |a@43@01|) | live]
; [else-branch: 12 | k@46@01 < |a@43@01| | live]
(push) ; 6
; [then-branch: 12 | !(k@46@01 < |a@43@01|)]
(assert (not (< k@46@01 (Seq_length a@43@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | k@46@01 < |a@43@01|]
(assert (< k@46@01 (Seq_length a@43@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 13 | !(j@47@01 >= 0) | live]
; [else-branch: 13 | j@47@01 >= 0 | live]
(push) ; 8
; [then-branch: 13 | !(j@47@01 >= 0)]
(assert (not (>= j@47@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 13 | j@47@01 >= 0]
(assert (>= j@47@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 14 | !(j@47@01 < |a@43@01|) | live]
; [else-branch: 14 | j@47@01 < |a@43@01| | live]
(push) ; 10
; [then-branch: 14 | !(j@47@01 < |a@43@01|)]
(assert (not (< j@47@01 (Seq_length a@43@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 14 | j@47@01 < |a@43@01|]
(assert (< j@47@01 (Seq_length a@43@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@47@01 (Seq_length a@43@01)) (not (< j@47@01 (Seq_length a@43@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@47@01 0)
  (and
    (>= j@47@01 0)
    (or (< j@47@01 (Seq_length a@43@01)) (not (< j@47@01 (Seq_length a@43@01)))))))
(assert (or (>= j@47@01 0) (not (>= j@47@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@46@01 (Seq_length a@43@01))
  (and
    (< k@46@01 (Seq_length a@43@01))
    (=>
      (>= j@47@01 0)
      (and
        (>= j@47@01 0)
        (or
          (< j@47@01 (Seq_length a@43@01))
          (not (< j@47@01 (Seq_length a@43@01))))))
    (or (>= j@47@01 0) (not (>= j@47@01 0))))))
(assert (or (< k@46@01 (Seq_length a@43@01)) (not (< k@46@01 (Seq_length a@43@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@46@01 0)
  (and
    (>= k@46@01 0)
    (=>
      (< k@46@01 (Seq_length a@43@01))
      (and
        (< k@46@01 (Seq_length a@43@01))
        (=>
          (>= j@47@01 0)
          (and
            (>= j@47@01 0)
            (or
              (< j@47@01 (Seq_length a@43@01))
              (not (< j@47@01 (Seq_length a@43@01))))))
        (or (>= j@47@01 0) (not (>= j@47@01 0)))))
    (or (< k@46@01 (Seq_length a@43@01)) (not (< k@46@01 (Seq_length a@43@01)))))))
(assert (or (>= k@46@01 0) (not (>= k@46@01 0))))
(push) ; 3
; [then-branch: 15 | k@46@01 >= 0 && k@46@01 < |a@43@01| && j@47@01 >= 0 && j@47@01 < |a@43@01| && k@46@01 != j@47@01 | live]
; [else-branch: 15 | !(k@46@01 >= 0 && k@46@01 < |a@43@01| && j@47@01 >= 0 && j@47@01 < |a@43@01| && k@46@01 != j@47@01) | live]
(push) ; 4
; [then-branch: 15 | k@46@01 >= 0 && k@46@01 < |a@43@01| && j@47@01 >= 0 && j@47@01 < |a@43@01| && k@46@01 != j@47@01]
(assert (and
  (>= k@46@01 0)
  (and
    (< k@46@01 (Seq_length a@43@01))
    (and
      (>= j@47@01 0)
      (and (< j@47@01 (Seq_length a@43@01)) (not (= k@46@01 j@47@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 4
(push) ; 4
; [else-branch: 15 | !(k@46@01 >= 0 && k@46@01 < |a@43@01| && j@47@01 >= 0 && j@47@01 < |a@43@01| && k@46@01 != j@47@01)]
(assert (not
  (and
    (>= k@46@01 0)
    (and
      (< k@46@01 (Seq_length a@43@01))
      (and
        (>= j@47@01 0)
        (and (< j@47@01 (Seq_length a@43@01)) (not (= k@46@01 j@47@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@46@01 0)
    (and
      (< k@46@01 (Seq_length a@43@01))
      (and
        (>= j@47@01 0)
        (and (< j@47@01 (Seq_length a@43@01)) (not (= k@46@01 j@47@01))))))
  (and
    (>= k@46@01 0)
    (< k@46@01 (Seq_length a@43@01))
    (>= j@47@01 0)
    (< j@47@01 (Seq_length a@43@01))
    (not (= k@46@01 j@47@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@46@01 0)
      (and
        (< k@46@01 (Seq_length a@43@01))
        (and
          (>= j@47@01 0)
          (and (< j@47@01 (Seq_length a@43@01)) (not (= k@46@01 j@47@01)))))))
  (and
    (>= k@46@01 0)
    (and
      (< k@46@01 (Seq_length a@43@01))
      (and
        (>= j@47@01 0)
        (and (< j@47@01 (Seq_length a@43@01)) (not (= k@46@01 j@47@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@46@01 Int) (j@47@01 Int)) (!
  (and
    (=>
      (>= k@46@01 0)
      (and
        (>= k@46@01 0)
        (=>
          (< k@46@01 (Seq_length a@43@01))
          (and
            (< k@46@01 (Seq_length a@43@01))
            (=>
              (>= j@47@01 0)
              (and
                (>= j@47@01 0)
                (or
                  (< j@47@01 (Seq_length a@43@01))
                  (not (< j@47@01 (Seq_length a@43@01))))))
            (or (>= j@47@01 0) (not (>= j@47@01 0)))))
        (or
          (< k@46@01 (Seq_length a@43@01))
          (not (< k@46@01 (Seq_length a@43@01))))))
    (or (>= k@46@01 0) (not (>= k@46@01 0)))
    (=>
      (and
        (>= k@46@01 0)
        (and
          (< k@46@01 (Seq_length a@43@01))
          (and
            (>= j@47@01 0)
            (and (< j@47@01 (Seq_length a@43@01)) (not (= k@46@01 j@47@01))))))
      (and
        (>= k@46@01 0)
        (< k@46@01 (Seq_length a@43@01))
        (>= j@47@01 0)
        (< j@47@01 (Seq_length a@43@01))
        (not (= k@46@01 j@47@01))))
    (or
      (not
        (and
          (>= k@46@01 0)
          (and
            (< k@46@01 (Seq_length a@43@01))
            (and
              (>= j@47@01 0)
              (and (< j@47@01 (Seq_length a@43@01)) (not (= k@46@01 j@47@01)))))))
      (and
        (>= k@46@01 0)
        (and
          (< k@46@01 (Seq_length a@43@01))
          (and
            (>= j@47@01 0)
            (and (< j@47@01 (Seq_length a@43@01)) (not (= k@46@01 j@47@01))))))))
  :pattern ((Seq_index a@43@01 k@46@01) (Seq_index a@43@01 j@47@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@95@12@95@100-aux|)))
(assert (forall ((k@46@01 Int) (j@47@01 Int)) (!
  (=>
    (and
      (>= k@46@01 0)
      (and
        (< k@46@01 (Seq_length a@43@01))
        (and
          (>= j@47@01 0)
          (and (< j@47@01 (Seq_length a@43@01)) (not (= k@46@01 j@47@01))))))
    (not (= (Seq_index a@43@01 k@46@01) (Seq_index a@43@01 j@47@01))))
  :pattern ((Seq_index a@43@01 k@46@01) (Seq_index a@43@01 j@47@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@95@12@95@100|)))
(declare-const i@48@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 16 | !(0 <= i@48@01) | live]
; [else-branch: 16 | 0 <= i@48@01 | live]
(push) ; 4
; [then-branch: 16 | !(0 <= i@48@01)]
(assert (not (<= 0 i@48@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | 0 <= i@48@01]
(assert (<= 0 i@48@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@48@01) (not (<= 0 i@48@01))))
(assert (and (<= 0 i@48@01) (< i@48@01 len@44@01)))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@48@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@48@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@49@01 ($Ref) Int)
(declare-fun img@50@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and (<= 0 i@48@01) (< i@48@01 len@44@01))
    (or (<= 0 i@48@01) (not (<= 0 i@48@01))))
  :pattern ((Seq_index a@43@01 i@48@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@48@01 Int) (i2@48@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@48@01) (< i1@48@01 len@44@01))
      (and (<= 0 i2@48@01) (< i2@48@01 len@44@01))
      (= (Seq_index a@43@01 i1@48@01) (Seq_index a@43@01 i2@48@01)))
    (= i1@48@01 i2@48@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and (<= 0 i@48@01) (< i@48@01 len@44@01))
    (and
      (= (inv@49@01 (Seq_index a@43@01 i@48@01)) i@48@01)
      (img@50@01 (Seq_index a@43@01 i@48@01))))
  :pattern ((Seq_index a@43@01 i@48@01))
  :qid |quant-u-53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@50@01 r) (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) len@44@01)))
    (= (Seq_index a@43@01 (inv@49@01 r)) r))
  :pattern ((inv@49@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and (<= 0 i@48@01) (< i@48@01 len@44@01))
    (not (= (Seq_index a@43@01 i@48@01) $Ref.null)))
  :pattern ((Seq_index a@43@01 i@48@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (= ($Snap.first $t@51@01) $Snap.unit))
; [eval] |a| == len
; [eval] |a|
(assert (=
  ($Snap.second $t@51@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@51@01))
    ($Snap.second ($Snap.second $t@51@01)))))
(declare-const i@52@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 17 | !(0 <= i@52@01) | live]
; [else-branch: 17 | 0 <= i@52@01 | live]
(push) ; 5
; [then-branch: 17 | !(0 <= i@52@01)]
(assert (not (<= 0 i@52@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | 0 <= i@52@01]
(assert (<= 0 i@52@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
(assert (and (<= 0 i@52@01) (< i@52@01 len@44@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@52@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@52@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@53@01 ($Ref) Int)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 len@44@01))
    (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
  :pattern ((Seq_index a@43@01 i@52@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@52@01 Int) (i2@52@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@52@01) (< i1@52@01 len@44@01))
      (and (<= 0 i2@52@01) (< i2@52@01 len@44@01))
      (= (Seq_index a@43@01 i1@52@01) (Seq_index a@43@01 i2@52@01)))
    (= i1@52@01 i2@52@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 len@44@01))
    (and
      (= (inv@53@01 (Seq_index a@43@01 i@52@01)) i@52@01)
      (img@54@01 (Seq_index a@43@01 i@52@01))))
  :pattern ((Seq_index a@43@01 i@52@01))
  :qid |quant-u-55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) len@44@01)))
    (= (Seq_index a@43@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 len@44@01))
    (not (= (Seq_index a@43@01 i@52@01) $Ref.null)))
  :pattern ((Seq_index a@43@01 i@52@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@51@01)) $Snap.unit))
; [eval] (forall i: Int :: { old(a[i]) } 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value))
(declare-const i@55@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 18 | !(0 <= i@55@01) | live]
; [else-branch: 18 | 0 <= i@55@01 | live]
(push) ; 5
; [then-branch: 18 | !(0 <= i@55@01)]
(assert (not (<= 0 i@55@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | 0 <= i@55@01]
(assert (<= 0 i@55@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@55@01) (not (<= 0 i@55@01))))
(push) ; 4
; [then-branch: 19 | 0 <= i@55@01 && i@55@01 < len@44@01 | live]
; [else-branch: 19 | !(0 <= i@55@01 && i@55@01 < len@44@01) | live]
(push) ; 5
; [then-branch: 19 | 0 <= i@55@01 && i@55@01 < len@44@01]
(assert (and (<= 0 i@55@01) (< i@55@01 len@44@01)))
; [eval] a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 6
(assert (not (>= i@55@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@55@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@54@01 (Seq_index a@43@01 i@55@01))
  (and
    (<= 0 (inv@53@01 (Seq_index a@43@01 i@55@01)))
    (< (inv@53@01 (Seq_index a@43@01 i@55@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 6
(assert (not (>= i@55@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@55@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@50@01 (Seq_index a@43@01 i@55@01))
  (and
    (<= 0 (inv@49@01 (Seq_index a@43@01 i@55@01)))
    (< (inv@49@01 (Seq_index a@43@01 i@55@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 19 | !(0 <= i@55@01 && i@55@01 < len@44@01)]
(assert (not (and (<= 0 i@55@01) (< i@55@01 len@44@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@55@01) (< i@55@01 len@44@01)))
  (and (<= 0 i@55@01) (< i@55@01 len@44@01))))
; [eval] old(a[i])
; [eval] a[i]
(push) ; 4
(assert (not (>= i@55@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@55@01 Int)) (!
  (and
    (or (<= 0 i@55@01) (not (<= 0 i@55@01)))
    (or
      (not (and (<= 0 i@55@01) (< i@55@01 len@44@01)))
      (and (<= 0 i@55@01) (< i@55@01 len@44@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@99@12@99@112-aux|)))
(assert (forall ((i@55@01 Int)) (!
  (=>
    (and (<= 0 i@55@01) (< i@55@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@51@01))) (Seq_index
        a@43@01
        i@55@01))
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))) (Seq_index
        a@43@01
        i@55@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@99@12@99@112|)))
(pop) ; 2
(push) ; 2
; [exec]
; Ref__loop_main_22(diz, current_thread_id, len, a)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@44@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@44@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | 0 < len@44@01 | live]
; [else-branch: 20 | !(0 < len@44@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 20 | 0 < len@44@01]
(assert (< 0 len@44@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 4
(push) ; 4
; [else-branch: 20 | !(0 < len@44@01)]
(assert (not (< 0 len@44@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< 0 len@44@01)) (< 0 len@44@01)))
(push) ; 3
(assert (not (=> (< 0 len@44@01) (= (Seq_length a@43@01) len@44@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@44@01) (= (Seq_length a@43@01) len@44@01)))
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@56@01 Int)
(declare-const j@57@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 21 | !(k@56@01 >= 0) | live]
; [else-branch: 21 | k@56@01 >= 0 | live]
(push) ; 5
; [then-branch: 21 | !(k@56@01 >= 0)]
(assert (not (>= k@56@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | k@56@01 >= 0]
(assert (>= k@56@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 6
; [then-branch: 22 | !(k@56@01 < |a@43@01|) | live]
; [else-branch: 22 | k@56@01 < |a@43@01| | live]
(push) ; 7
; [then-branch: 22 | !(k@56@01 < |a@43@01|)]
(assert (not (< k@56@01 (Seq_length a@43@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 22 | k@56@01 < |a@43@01|]
(assert (< k@56@01 (Seq_length a@43@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 23 | !(j@57@01 >= 0) | live]
; [else-branch: 23 | j@57@01 >= 0 | live]
(push) ; 9
; [then-branch: 23 | !(j@57@01 >= 0)]
(assert (not (>= j@57@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 23 | j@57@01 >= 0]
(assert (>= j@57@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 10
; [then-branch: 24 | !(j@57@01 < |a@43@01|) | live]
; [else-branch: 24 | j@57@01 < |a@43@01| | live]
(push) ; 11
; [then-branch: 24 | !(j@57@01 < |a@43@01|)]
(assert (not (< j@57@01 (Seq_length a@43@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 24 | j@57@01 < |a@43@01|]
(assert (< j@57@01 (Seq_length a@43@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@57@01 (Seq_length a@43@01)) (not (< j@57@01 (Seq_length a@43@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@57@01 0)
  (and
    (>= j@57@01 0)
    (or (< j@57@01 (Seq_length a@43@01)) (not (< j@57@01 (Seq_length a@43@01)))))))
(assert (or (>= j@57@01 0) (not (>= j@57@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@56@01 (Seq_length a@43@01))
  (and
    (< k@56@01 (Seq_length a@43@01))
    (=>
      (>= j@57@01 0)
      (and
        (>= j@57@01 0)
        (or
          (< j@57@01 (Seq_length a@43@01))
          (not (< j@57@01 (Seq_length a@43@01))))))
    (or (>= j@57@01 0) (not (>= j@57@01 0))))))
(assert (or (< k@56@01 (Seq_length a@43@01)) (not (< k@56@01 (Seq_length a@43@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@56@01 0)
  (and
    (>= k@56@01 0)
    (=>
      (< k@56@01 (Seq_length a@43@01))
      (and
        (< k@56@01 (Seq_length a@43@01))
        (=>
          (>= j@57@01 0)
          (and
            (>= j@57@01 0)
            (or
              (< j@57@01 (Seq_length a@43@01))
              (not (< j@57@01 (Seq_length a@43@01))))))
        (or (>= j@57@01 0) (not (>= j@57@01 0)))))
    (or (< k@56@01 (Seq_length a@43@01)) (not (< k@56@01 (Seq_length a@43@01)))))))
(assert (or (>= k@56@01 0) (not (>= k@56@01 0))))
(push) ; 4
; [then-branch: 25 | k@56@01 >= 0 && k@56@01 < |a@43@01| && j@57@01 >= 0 && j@57@01 < |a@43@01| && k@56@01 != j@57@01 | live]
; [else-branch: 25 | !(k@56@01 >= 0 && k@56@01 < |a@43@01| && j@57@01 >= 0 && j@57@01 < |a@43@01| && k@56@01 != j@57@01) | live]
(push) ; 5
; [then-branch: 25 | k@56@01 >= 0 && k@56@01 < |a@43@01| && j@57@01 >= 0 && j@57@01 < |a@43@01| && k@56@01 != j@57@01]
(assert (and
  (>= k@56@01 0)
  (and
    (< k@56@01 (Seq_length a@43@01))
    (and
      (>= j@57@01 0)
      (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 5
(push) ; 5
; [else-branch: 25 | !(k@56@01 >= 0 && k@56@01 < |a@43@01| && j@57@01 >= 0 && j@57@01 < |a@43@01| && k@56@01 != j@57@01)]
(assert (not
  (and
    (>= k@56@01 0)
    (and
      (< k@56@01 (Seq_length a@43@01))
      (and
        (>= j@57@01 0)
        (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@56@01 0)
    (and
      (< k@56@01 (Seq_length a@43@01))
      (and
        (>= j@57@01 0)
        (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01))))))
  (and
    (>= k@56@01 0)
    (< k@56@01 (Seq_length a@43@01))
    (>= j@57@01 0)
    (< j@57@01 (Seq_length a@43@01))
    (not (= k@56@01 j@57@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@56@01 0)
      (and
        (< k@56@01 (Seq_length a@43@01))
        (and
          (>= j@57@01 0)
          (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01)))))))
  (and
    (>= k@56@01 0)
    (and
      (< k@56@01 (Seq_length a@43@01))
      (and
        (>= j@57@01 0)
        (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@56@01 Int) (j@57@01 Int)) (!
  (and
    (=>
      (>= k@56@01 0)
      (and
        (>= k@56@01 0)
        (=>
          (< k@56@01 (Seq_length a@43@01))
          (and
            (< k@56@01 (Seq_length a@43@01))
            (=>
              (>= j@57@01 0)
              (and
                (>= j@57@01 0)
                (or
                  (< j@57@01 (Seq_length a@43@01))
                  (not (< j@57@01 (Seq_length a@43@01))))))
            (or (>= j@57@01 0) (not (>= j@57@01 0)))))
        (or
          (< k@56@01 (Seq_length a@43@01))
          (not (< k@56@01 (Seq_length a@43@01))))))
    (or (>= k@56@01 0) (not (>= k@56@01 0)))
    (=>
      (and
        (>= k@56@01 0)
        (and
          (< k@56@01 (Seq_length a@43@01))
          (and
            (>= j@57@01 0)
            (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01))))))
      (and
        (>= k@56@01 0)
        (< k@56@01 (Seq_length a@43@01))
        (>= j@57@01 0)
        (< j@57@01 (Seq_length a@43@01))
        (not (= k@56@01 j@57@01))))
    (or
      (not
        (and
          (>= k@56@01 0)
          (and
            (< k@56@01 (Seq_length a@43@01))
            (and
              (>= j@57@01 0)
              (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01)))))))
      (and
        (>= k@56@01 0)
        (and
          (< k@56@01 (Seq_length a@43@01))
          (and
            (>= j@57@01 0)
            (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01))))))))
  :pattern ((Seq_index a@43@01 k@56@01) (Seq_index a@43@01 j@57@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@62@12@62@100-aux|)))
(push) ; 3
(assert (not (forall ((k@56@01 Int) (j@57@01 Int)) (!
  (=>
    (and
      (>= k@56@01 0)
      (and
        (< k@56@01 (Seq_length a@43@01))
        (and
          (>= j@57@01 0)
          (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01))))))
    (not (= (Seq_index a@43@01 k@56@01) (Seq_index a@43@01 j@57@01))))
  :pattern ((Seq_index a@43@01 k@56@01) (Seq_index a@43@01 j@57@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@62@12@62@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@56@01 Int) (j@57@01 Int)) (!
  (=>
    (and
      (>= k@56@01 0)
      (and
        (< k@56@01 (Seq_length a@43@01))
        (and
          (>= j@57@01 0)
          (and (< j@57@01 (Seq_length a@43@01)) (not (= k@56@01 j@57@01))))))
    (not (= (Seq_index a@43@01 k@56@01) (Seq_index a@43@01 j@57@01))))
  :pattern ((Seq_index a@43@01 k@56@01) (Seq_index a@43@01 j@57@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@62@12@62@100|)))
(declare-const i@58@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 26 | !(0 <= i@58@01) | live]
; [else-branch: 26 | 0 <= i@58@01 | live]
(push) ; 5
; [then-branch: 26 | !(0 <= i@58@01)]
(assert (not (<= 0 i@58@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | 0 <= i@58@01]
(assert (<= 0 i@58@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@58@01) (not (<= 0 i@58@01))))
(assert (and (<= 0 i@58@01) (< i@58@01 len@44@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@58@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@58@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@59@01 ($Ref) Int)
(declare-fun img@60@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@58@01 Int)) (!
  (=>
    (and (<= 0 i@58@01) (< i@58@01 len@44@01))
    (or (<= 0 i@58@01) (not (<= 0 i@58@01))))
  :pattern ((Seq_index a@43@01 i@58@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@58@01 Int) (i2@58@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@58@01) (< i1@58@01 len@44@01))
      (and (<= 0 i2@58@01) (< i2@58@01 len@44@01))
      (= (Seq_index a@43@01 i1@58@01) (Seq_index a@43@01 i2@58@01)))
    (= i1@58@01 i2@58@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@58@01 Int)) (!
  (=>
    (and (<= 0 i@58@01) (< i@58@01 len@44@01))
    (and
      (= (inv@59@01 (Seq_index a@43@01 i@58@01)) i@58@01)
      (img@60@01 (Seq_index a@43@01 i@58@01))))
  :pattern ((Seq_index a@43@01 i@58@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@60@01 r) (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) len@44@01)))
    (= (Seq_index a@43@01 (inv@59@01 r)) r))
  :pattern ((inv@59@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) len@44@01))
      (img@60@01 r)
      (= r (Seq_index a@43@01 (inv@59@01 r))))
    ($Perm.min
      (ite
        (and
          (img@50@01 r)
          (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) len@44@01)))
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@50@01 r)
          (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) len@44@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@61@01 r))
    $Perm.No)
  
  :qid |quant-u-58|))))
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
      (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) len@44@01))
      (img@60@01 r)
      (= r (Seq_index a@43@01 (inv@59@01 r))))
    (= (- $Perm.Write (pTaken@61@01 r)) $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@62@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@50@01 r) (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) len@44@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))) r))
  :qid |qp.fvfValDef0|)))
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 ($Snap.combine ($Snap.first $t@63@01) ($Snap.second $t@63@01))))
(assert (= ($Snap.first $t@63@01) $Snap.unit))
; [eval] 0 < len ==> |a| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@44@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@44@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | 0 < len@44@01 | live]
; [else-branch: 27 | !(0 < len@44@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 27 | 0 < len@44@01]
(assert (< 0 len@44@01))
; [eval] |a| == len
; [eval] |a|
(pop) ; 4
(push) ; 4
; [else-branch: 27 | !(0 < len@44@01)]
(assert (not (< 0 len@44@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=
  ($Snap.second $t@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@63@01))
    ($Snap.second ($Snap.second $t@63@01)))))
(declare-const i@64@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 28 | !(0 <= i@64@01) | live]
; [else-branch: 28 | 0 <= i@64@01 | live]
(push) ; 5
; [then-branch: 28 | !(0 <= i@64@01)]
(assert (not (<= 0 i@64@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 28 | 0 <= i@64@01]
(assert (<= 0 i@64@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@64@01) (not (<= 0 i@64@01))))
(assert (and (<= 0 i@64@01) (< i@64@01 len@44@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@64@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@64@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@65@01 ($Ref) Int)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@64@01 Int)) (!
  (=>
    (and (<= 0 i@64@01) (< i@64@01 len@44@01))
    (or (<= 0 i@64@01) (not (<= 0 i@64@01))))
  :pattern ((Seq_index a@43@01 i@64@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@64@01 Int) (i2@64@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@64@01) (< i1@64@01 len@44@01))
      (and (<= 0 i2@64@01) (< i2@64@01 len@44@01))
      (= (Seq_index a@43@01 i1@64@01) (Seq_index a@43@01 i2@64@01)))
    (= i1@64@01 i2@64@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@64@01 Int)) (!
  (=>
    (and (<= 0 i@64@01) (< i@64@01 len@44@01))
    (and
      (= (inv@65@01 (Seq_index a@43@01 i@64@01)) i@64@01)
      (img@66@01 (Seq_index a@43@01 i@64@01))))
  :pattern ((Seq_index a@43@01 i@64@01))
  :qid |quant-u-61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) len@44@01)))
    (= (Seq_index a@43@01 (inv@65@01 r)) r))
  :pattern ((inv@65@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@64@01 Int)) (!
  (=>
    (and (<= 0 i@64@01) (< i@64@01 len@44@01))
    (not (= (Seq_index a@43@01 i@64@01) $Ref.null)))
  :pattern ((Seq_index a@43@01 i@64@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@63@01)) $Snap.unit))
; [eval] (forall i: Int :: { old(a[i]) } 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value))
(declare-const i@67@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 29 | !(0 <= i@67@01) | live]
; [else-branch: 29 | 0 <= i@67@01 | live]
(push) ; 5
; [then-branch: 29 | !(0 <= i@67@01)]
(assert (not (<= 0 i@67@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 29 | 0 <= i@67@01]
(assert (<= 0 i@67@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@67@01) (not (<= 0 i@67@01))))
(push) ; 4
; [then-branch: 30 | 0 <= i@67@01 && i@67@01 < len@44@01 | live]
; [else-branch: 30 | !(0 <= i@67@01 && i@67@01 < len@44@01) | live]
(push) ; 5
; [then-branch: 30 | 0 <= i@67@01 && i@67@01 < len@44@01]
(assert (and (<= 0 i@67@01) (< i@67@01 len@44@01)))
; [eval] a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 6
(assert (not (>= i@67@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@67@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@66@01 (Seq_index a@43@01 i@67@01))
  (and
    (<= 0 (inv@65@01 (Seq_index a@43@01 i@67@01)))
    (< (inv@65@01 (Seq_index a@43@01 i@67@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 6
(assert (not (>= i@67@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@67@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@50@01 (Seq_index a@43@01 i@67@01))
  (and
    (<= 0 (inv@49@01 (Seq_index a@43@01 i@67@01)))
    (< (inv@49@01 (Seq_index a@43@01 i@67@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 30 | !(0 <= i@67@01 && i@67@01 < len@44@01)]
(assert (not (and (<= 0 i@67@01) (< i@67@01 len@44@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@67@01) (< i@67@01 len@44@01)))
  (and (<= 0 i@67@01) (< i@67@01 len@44@01))))
; [eval] old(a[i])
; [eval] a[i]
(push) ; 4
(assert (not (>= i@67@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@67@01 Int)) (!
  (and
    (or (<= 0 i@67@01) (not (<= 0 i@67@01)))
    (or
      (not (and (<= 0 i@67@01) (< i@67@01 len@44@01)))
      (and (<= 0 i@67@01) (< i@67@01 len@44@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@66@12@66@112-aux|)))
(assert (forall ((i@67@01 Int)) (!
  (=>
    (and (<= 0 i@67@01) (< i@67@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@63@01))) (Seq_index
        a@43@01
        i@67@01))
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@67@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@66@12@66@112|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] len > 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> len@44@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> len@44@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | len@44@01 > 0 | live]
; [else-branch: 31 | !(len@44@01 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 31 | len@44@01 > 0]
(assert (> len@44@01 0))
; [exec]
; assert acc(a[0].Ref__Integer_value, write)
; [eval] a[0]
(push) ; 4
(assert (not (< 0 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index a@43@01 0))
    ($Perm.min
      (ite
        (and
          (img@66@01 r)
          (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) len@44@01)))
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
          (img@66@01 r)
          (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) len@44@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@68@01 r))
    $Perm.No)
  
  :qid |quant-u-63|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@68@01 r) $Perm.No)
  
  :qid |quant-u-64|))))
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
  (=> (= r (Seq_index a@43@01 0)) (= (- $Perm.Write (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@69@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@66@01 (Seq_index a@43@01 0))
    (and
      (<= 0 (inv@65@01 (Seq_index a@43@01 0)))
      (< (inv@65@01 (Seq_index a@43@01 0)) len@44@01)))
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@69@01  $FVF<Ref__Integer_value>) (Seq_index
      a@43@01
      0))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@63@01))) (Seq_index
      a@43@01
      0)))))
; [exec]
; assert a[0].Ref__Integer_value == old(a[0].Ref__Integer_value)
; [eval] a[0].Ref__Integer_value == old(a[0].Ref__Integer_value)
; [eval] a[0]
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) len@44@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@69@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@63@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@69@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@63@01))) r))
  :qid |qp.fvfValDef1|)))
(push) ; 4
(assert (not (and
  (img@66@01 (Seq_index a@43@01 0))
  (and
    (<= 0 (inv@65@01 (Seq_index a@43@01 0)))
    (< (inv@65@01 (Seq_index a@43@01 0)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[0].Ref__Integer_value)
; [eval] a[0]
(push) ; 4
(assert (not (< 0 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (and
  (img@50@01 (Seq_index a@43@01 0))
  (and
    (<= 0 (inv@49@01 (Seq_index a@43@01 0)))
    (< (inv@49@01 (Seq_index a@43@01 0)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (=
  ($FVF.lookup_Ref__Integer_value (as sm@69@01  $FVF<Ref__Integer_value>) (Seq_index
    a@43@01
    0))
  ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
    a@43@01
    0)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@69@01  $FVF<Ref__Integer_value>) (Seq_index
    a@43@01
    0))
  ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
    a@43@01
    0))))
; [exec]
; assert (forall i: Int ::
;     { old(a[i]) }
;     0 <= i && i < len ==>
;     a[i].Ref__Integer_value == old(a[i].Ref__Integer_value))
; [eval] (forall i: Int :: { old(a[i]) } 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value))
(declare-const i@70@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 32 | !(0 <= i@70@01) | live]
; [else-branch: 32 | 0 <= i@70@01 | live]
(push) ; 6
; [then-branch: 32 | !(0 <= i@70@01)]
(assert (not (<= 0 i@70@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 32 | 0 <= i@70@01]
(assert (<= 0 i@70@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@70@01) (not (<= 0 i@70@01))))
(push) ; 5
; [then-branch: 33 | 0 <= i@70@01 && i@70@01 < len@44@01 | live]
; [else-branch: 33 | !(0 <= i@70@01 && i@70@01 < len@44@01) | live]
(push) ; 6
; [then-branch: 33 | 0 <= i@70@01 && i@70@01 < len@44@01]
(assert (and (<= 0 i@70@01) (< i@70@01 len@44@01)))
; [eval] a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@70@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@70@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@66@01 (Seq_index a@43@01 i@70@01))
  (and
    (<= 0 (inv@65@01 (Seq_index a@43@01 i@70@01)))
    (< (inv@65@01 (Seq_index a@43@01 i@70@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@70@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@70@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@50@01 (Seq_index a@43@01 i@70@01))
  (and
    (<= 0 (inv@49@01 (Seq_index a@43@01 i@70@01)))
    (< (inv@49@01 (Seq_index a@43@01 i@70@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 33 | !(0 <= i@70@01 && i@70@01 < len@44@01)]
(assert (not (and (<= 0 i@70@01) (< i@70@01 len@44@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@70@01) (< i@70@01 len@44@01)))
  (and (<= 0 i@70@01) (< i@70@01 len@44@01))))
; [eval] old(a[i])
; [eval] a[i]
(push) ; 5
(assert (not (>= i@70@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@70@01 Int)) (!
  (and
    (or (<= 0 i@70@01) (not (<= 0 i@70@01)))
    (or
      (not (and (<= 0 i@70@01) (< i@70@01 len@44@01)))
      (and (<= 0 i@70@01) (< i@70@01 len@44@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@106@11@106@111-aux|)))
(push) ; 4
(assert (not (forall ((i@70@01 Int)) (!
  (=>
    (and (<= 0 i@70@01) (< i@70@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@69@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@70@01))
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@70@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@106@11@106@111|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@70@01 Int)) (!
  (=>
    (and (<= 0 i@70@01) (< i@70@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@69@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@70@01))
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@70@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@106@11@106@111|)))
; [eval] |a| == len
; [eval] |a|
(declare-const i@71@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 34 | !(0 <= i@71@01) | live]
; [else-branch: 34 | 0 <= i@71@01 | live]
(push) ; 6
; [then-branch: 34 | !(0 <= i@71@01)]
(assert (not (<= 0 i@71@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 34 | 0 <= i@71@01]
(assert (<= 0 i@71@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@71@01) (not (<= 0 i@71@01))))
(assert (and (<= 0 i@71@01) (< i@71@01 len@44@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@71@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@71@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@72@01 ($Ref) Int)
(declare-fun img@73@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@71@01 Int)) (!
  (=>
    (and (<= 0 i@71@01) (< i@71@01 len@44@01))
    (or (<= 0 i@71@01) (not (<= 0 i@71@01))))
  :pattern ((Seq_index a@43@01 i@71@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@71@01 Int) (i2@71@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@71@01) (< i1@71@01 len@44@01))
      (and (<= 0 i2@71@01) (< i2@71@01 len@44@01))
      (= (Seq_index a@43@01 i1@71@01) (Seq_index a@43@01 i2@71@01)))
    (= i1@71@01 i2@71@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@71@01 Int)) (!
  (=>
    (and (<= 0 i@71@01) (< i@71@01 len@44@01))
    (and
      (= (inv@72@01 (Seq_index a@43@01 i@71@01)) i@71@01)
      (img@73@01 (Seq_index a@43@01 i@71@01))))
  :pattern ((Seq_index a@43@01 i@71@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@73@01 r) (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) len@44@01)))
    (= (Seq_index a@43@01 (inv@72@01 r)) r))
  :pattern ((inv@72@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@74@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) len@44@01))
      (img@73@01 r)
      (= r (Seq_index a@43@01 (inv@72@01 r))))
    ($Perm.min
      (ite
        (and
          (img@66@01 r)
          (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) len@44@01)))
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
          (img@66@01 r)
          (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) len@44@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@74@01 r))
    $Perm.No)
  
  :qid |quant-u-68|))))
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
      (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) len@44@01))
      (img@73@01 r)
      (= r (Seq_index a@43@01 (inv@72@01 r))))
    (= (- $Perm.Write (pTaken@74@01 r)) $Perm.No))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall i: Int :: { old(a[i]) } 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value))
(declare-const i@75@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 35 | !(0 <= i@75@01) | live]
; [else-branch: 35 | 0 <= i@75@01 | live]
(push) ; 6
; [then-branch: 35 | !(0 <= i@75@01)]
(assert (not (<= 0 i@75@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 35 | 0 <= i@75@01]
(assert (<= 0 i@75@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@75@01) (not (<= 0 i@75@01))))
(push) ; 5
; [then-branch: 36 | 0 <= i@75@01 && i@75@01 < len@44@01 | live]
; [else-branch: 36 | !(0 <= i@75@01 && i@75@01 < len@44@01) | live]
(push) ; 6
; [then-branch: 36 | 0 <= i@75@01 && i@75@01 < len@44@01]
(assert (and (<= 0 i@75@01) (< i@75@01 len@44@01)))
; [eval] a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@75@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@75@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@66@01 (Seq_index a@43@01 i@75@01))
  (and
    (<= 0 (inv@65@01 (Seq_index a@43@01 i@75@01)))
    (< (inv@65@01 (Seq_index a@43@01 i@75@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@75@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@75@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@50@01 (Seq_index a@43@01 i@75@01))
  (and
    (<= 0 (inv@49@01 (Seq_index a@43@01 i@75@01)))
    (< (inv@49@01 (Seq_index a@43@01 i@75@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 36 | !(0 <= i@75@01 && i@75@01 < len@44@01)]
(assert (not (and (<= 0 i@75@01) (< i@75@01 len@44@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@75@01) (< i@75@01 len@44@01)))
  (and (<= 0 i@75@01) (< i@75@01 len@44@01))))
; [eval] old(a[i])
; [eval] a[i]
(push) ; 5
(assert (not (>= i@75@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@75@01 Int)) (!
  (and
    (or (<= 0 i@75@01) (not (<= 0 i@75@01)))
    (or
      (not (and (<= 0 i@75@01) (< i@75@01 len@44@01)))
      (and (<= 0 i@75@01) (< i@75@01 len@44@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@99@12@99@112-aux|)))
(push) ; 4
(assert (not (forall ((i@75@01 Int)) (!
  (=>
    (and (<= 0 i@75@01) (< i@75@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@69@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@75@01))
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@75@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@99@12@99@112|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (<= 0 i@75@01) (< i@75@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@69@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@75@01))
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@75@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@99@12@99@112|)))
(pop) ; 3
(push) ; 3
; [else-branch: 31 | !(len@44@01 > 0)]
(assert (not (> len@44@01 0)))
(pop) ; 3
; [eval] !(len > 0)
; [eval] len > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (> len@44@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> len@44@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | !(len@44@01 > 0) | live]
; [else-branch: 37 | len@44@01 > 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 37 | !(len@44@01 > 0)]
(assert (not (> len@44@01 0)))
; [exec]
; assert (forall i: Int ::
;     { old(a[i]) }
;     0 <= i && i < len ==>
;     a[i].Ref__Integer_value == old(a[i].Ref__Integer_value))
; [eval] (forall i: Int :: { old(a[i]) } 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value))
(declare-const i@76@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 38 | !(0 <= i@76@01) | live]
; [else-branch: 38 | 0 <= i@76@01 | live]
(push) ; 6
; [then-branch: 38 | !(0 <= i@76@01)]
(assert (not (<= 0 i@76@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 38 | 0 <= i@76@01]
(assert (<= 0 i@76@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@76@01) (not (<= 0 i@76@01))))
(push) ; 5
; [then-branch: 39 | 0 <= i@76@01 && i@76@01 < len@44@01 | live]
; [else-branch: 39 | !(0 <= i@76@01 && i@76@01 < len@44@01) | live]
(push) ; 6
; [then-branch: 39 | 0 <= i@76@01 && i@76@01 < len@44@01]
(assert (and (<= 0 i@76@01) (< i@76@01 len@44@01)))
; [eval] a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@76@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@76@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@66@01 (Seq_index a@43@01 i@76@01))
  (and
    (<= 0 (inv@65@01 (Seq_index a@43@01 i@76@01)))
    (< (inv@65@01 (Seq_index a@43@01 i@76@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@76@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@76@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@50@01 (Seq_index a@43@01 i@76@01))
  (and
    (<= 0 (inv@49@01 (Seq_index a@43@01 i@76@01)))
    (< (inv@49@01 (Seq_index a@43@01 i@76@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 39 | !(0 <= i@76@01 && i@76@01 < len@44@01)]
(assert (not (and (<= 0 i@76@01) (< i@76@01 len@44@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@76@01) (< i@76@01 len@44@01)))
  (and (<= 0 i@76@01) (< i@76@01 len@44@01))))
; [eval] old(a[i])
; [eval] a[i]
(push) ; 5
(assert (not (>= i@76@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@76@01 Int)) (!
  (and
    (or (<= 0 i@76@01) (not (<= 0 i@76@01)))
    (or
      (not (and (<= 0 i@76@01) (< i@76@01 len@44@01)))
      (and (<= 0 i@76@01) (< i@76@01 len@44@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@106@11@106@111-aux|)))
(push) ; 4
(assert (not (forall ((i@76@01 Int)) (!
  (=>
    (and (<= 0 i@76@01) (< i@76@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@63@01))) (Seq_index
        a@43@01
        i@76@01))
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@76@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@106@11@106@111|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@76@01 Int)) (!
  (=>
    (and (<= 0 i@76@01) (< i@76@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@63@01))) (Seq_index
        a@43@01
        i@76@01))
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@76@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@106@11@106@111|)))
; [eval] |a| == len
; [eval] |a|
(declare-const i@77@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 40 | !(0 <= i@77@01) | live]
; [else-branch: 40 | 0 <= i@77@01 | live]
(push) ; 6
; [then-branch: 40 | !(0 <= i@77@01)]
(assert (not (<= 0 i@77@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 40 | 0 <= i@77@01]
(assert (<= 0 i@77@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@77@01) (not (<= 0 i@77@01))))
(assert (and (<= 0 i@77@01) (< i@77@01 len@44@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@77@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@77@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@78@01 ($Ref) Int)
(declare-fun img@79@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@77@01 Int)) (!
  (=>
    (and (<= 0 i@77@01) (< i@77@01 len@44@01))
    (or (<= 0 i@77@01) (not (<= 0 i@77@01))))
  :pattern ((Seq_index a@43@01 i@77@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@77@01 Int) (i2@77@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@77@01) (< i1@77@01 len@44@01))
      (and (<= 0 i2@77@01) (< i2@77@01 len@44@01))
      (= (Seq_index a@43@01 i1@77@01) (Seq_index a@43@01 i2@77@01)))
    (= i1@77@01 i2@77@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@77@01 Int)) (!
  (=>
    (and (<= 0 i@77@01) (< i@77@01 len@44@01))
    (and
      (= (inv@78@01 (Seq_index a@43@01 i@77@01)) i@77@01)
      (img@79@01 (Seq_index a@43@01 i@77@01))))
  :pattern ((Seq_index a@43@01 i@77@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@79@01 r) (and (<= 0 (inv@78@01 r)) (< (inv@78@01 r) len@44@01)))
    (= (Seq_index a@43@01 (inv@78@01 r)) r))
  :pattern ((inv@78@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@80@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@78@01 r)) (< (inv@78@01 r) len@44@01))
      (img@79@01 r)
      (= r (Seq_index a@43@01 (inv@78@01 r))))
    ($Perm.min
      (ite
        (and
          (img@66@01 r)
          (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) len@44@01)))
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
          (img@66@01 r)
          (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) len@44@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@80@01 r))
    $Perm.No)
  
  :qid |quant-u-72|))))
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
      (and (<= 0 (inv@78@01 r)) (< (inv@78@01 r) len@44@01))
      (img@79@01 r)
      (= r (Seq_index a@43@01 (inv@78@01 r))))
    (= (- $Perm.Write (pTaken@80@01 r)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@81@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) len@44@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@81@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@63@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@81@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@63@01))) r))
  :qid |qp.fvfValDef2|)))
; [eval] (forall i: Int :: { old(a[i]) } 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value))
(declare-const i@82@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len ==> a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 41 | !(0 <= i@82@01) | live]
; [else-branch: 41 | 0 <= i@82@01 | live]
(push) ; 6
; [then-branch: 41 | !(0 <= i@82@01)]
(assert (not (<= 0 i@82@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 41 | 0 <= i@82@01]
(assert (<= 0 i@82@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@82@01) (not (<= 0 i@82@01))))
(push) ; 5
; [then-branch: 42 | 0 <= i@82@01 && i@82@01 < len@44@01 | live]
; [else-branch: 42 | !(0 <= i@82@01 && i@82@01 < len@44@01) | live]
(push) ; 6
; [then-branch: 42 | 0 <= i@82@01 && i@82@01 < len@44@01]
(assert (and (<= 0 i@82@01) (< i@82@01 len@44@01)))
; [eval] a[i].Ref__Integer_value == old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@82@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@82@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@66@01 (Seq_index a@43@01 i@82@01))
  (and
    (<= 0 (inv@65@01 (Seq_index a@43@01 i@82@01)))
    (< (inv@65@01 (Seq_index a@43@01 i@82@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[i].Ref__Integer_value)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@82@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@82@01 (Seq_length a@43@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@50@01 (Seq_index a@43@01 i@82@01))
  (and
    (<= 0 (inv@49@01 (Seq_index a@43@01 i@82@01)))
    (< (inv@49@01 (Seq_index a@43@01 i@82@01)) len@44@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 42 | !(0 <= i@82@01 && i@82@01 < len@44@01)]
(assert (not (and (<= 0 i@82@01) (< i@82@01 len@44@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@82@01) (< i@82@01 len@44@01)))
  (and (<= 0 i@82@01) (< i@82@01 len@44@01))))
; [eval] old(a[i])
; [eval] a[i]
(push) ; 5
(assert (not (>= i@82@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@82@01 Int)) (!
  (and
    (or (<= 0 i@82@01) (not (<= 0 i@82@01)))
    (or
      (not (and (<= 0 i@82@01) (< i@82@01 len@44@01)))
      (and (<= 0 i@82@01) (< i@82@01 len@44@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@99@12@99@112-aux|)))
(push) ; 4
(assert (not (forall ((i@82@01 Int)) (!
  (=>
    (and (<= 0 i@82@01) (< i@82@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@81@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@82@01))
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@82@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@99@12@99@112|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@82@01 Int)) (!
  (=>
    (and (<= 0 i@82@01) (< i@82@01 len@44@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@81@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@82@01))
      ($FVF.lookup_Ref__Integer_value (as sm@62@01  $FVF<Ref__Integer_value>) (Seq_index
        a@43@01
        i@82@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_par_id.vpr@99@12@99@112|)))
(pop) ; 3
(push) ; 3
; [else-branch: 37 | len@44@01 > 0]
(assert (> len@44@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
