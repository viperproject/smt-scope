(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:21:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr
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
(declare-fun count_array ($Snap Int Int Seq<$Ref> Int) Int)
(declare-fun count_array%limited ($Snap Int Int Seq<$Ref> Int) Int)
(declare-fun count_array%stateless (Int Int Seq<$Ref> Int) Bool)
(declare-fun count_array%precondition ($Snap Int Int Seq<$Ref> Int) Bool)
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
(declare-fun sum_square ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%limited ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%stateless (Int Int Int Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_square%precondition ($Snap Int Int Int Int Int Int Seq<$Ref>) Bool)
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
(declare-fun inv@40@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@41@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@45@00 () $Perm)
(declare-fun inv@46@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@47@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@48@00 ($Snap Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
(declare-fun $k@52@00 () $Perm)
(declare-fun inv@53@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@54@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@58@00 () $Perm)
(declare-fun inv@59@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@60@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@61@00 ($Snap Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@65@00 () $Perm)
(declare-fun inv@66@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@67@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@71@00 () $Perm)
(declare-fun inv@72@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@73@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@74@00 ($Snap Int Int Int Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@78@00 () $Perm)
(declare-fun inv@79@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@80@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@84@00 () $Perm)
(declare-fun inv@85@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@86@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@87@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
(assert (forall ((s@$ $Snap) (i@0@00 Int) (hi@1@00 Int) (ar@2@00 Seq<$Ref>) (v@3@00 Int)) (!
  (=
    (count_array%limited s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)
    (count_array s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :pattern ((count_array s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (hi@1@00 Int) (ar@2@00 Seq<$Ref>) (v@3@00 Int)) (!
  (count_array%stateless i@0@00 hi@1@00 ar@2@00 v@3@00)
  :pattern ((count_array%limited s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (hi@1@00 Int) (ar@2@00 Seq<$Ref>) (v@3@00 Int)) (!
  (and
    (forall ((k@38@00 Int)) (!
      (=>
        (and (and (<= 0 k@38@00) (< k@38@00 hi@1@00)) (< $Perm.No $k@39@00))
        (and
          (=
            (inv@40@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 (Seq_index
              ar@2@00
              k@38@00))
            k@38@00)
          (img@41@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 (Seq_index
            ar@2@00
            k@38@00))))
      :pattern ((Seq_index ar@2@00 k@38@00))
      :qid |quant-u-13|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@41@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r)
          (and
            (and
              (<= 0 (inv@40@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
              (< (inv@40@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r) hi@1@00))
            (< $Perm.No $k@39@00)))
        (= (Seq_index ar@2@00 (inv@40@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r)) r))
      :pattern ((inv@40@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@44@00 Int)) (!
      (=>
        (and (and (<= 0 k@44@00) (< k@44@00 hi@1@00)) (< $Perm.No $k@45@00))
        (and
          (=
            (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 (Seq_index
              ar@2@00
              k@44@00))
            k@44@00)
          (img@47@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 (Seq_index
            ar@2@00
            k@44@00))))
      :pattern ((Seq_index ar@2@00 k@44@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@47@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r)
          (and
            (and
              (<= 0 (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
              (< (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r) hi@1@00))
            (< $Perm.No $k@45@00)))
        (= (Seq_index ar@2@00 (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r)) r))
      :pattern ((inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)))
          (and
            (and
              (<= 0 (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
              (< (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r) hi@1@00))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
              (< (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r) hi@1@00))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))))
      :qid |qp.fvfDomDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
              (< (inv@46@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r) hi@1@00))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
          (ite
            (and
              (img@41@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r)
              (and
                (<= 0 (inv@40@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r))
                (< (inv@40@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00 r) hi@1@00)))
            (< $Perm.No $k@39@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@48@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@48@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef1|))
    ($Perm.isReadVar $k@39@00)
    ($Perm.isReadVar $k@45@00)
    (=>
      (count_array%precondition s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)
      (=
        (count_array s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)
        (ite
          (< i@0@00 hi@1@00)
          (+
            (ite
              (=
                ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
                  ar@2@00
                  i@0@00))
                v@3@00)
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
                    ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@48@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)))))) (+
              i@0@00
              1) hi@1@00 ar@2@00 v@3@00))
          0))))
  :pattern ((count_array s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (hi@1@00 Int) (ar@2@00 Seq<$Ref>) (v@3@00 Int)) (!
  (=>
    (count_array%precondition s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)
    (ite
      (< i@0@00 hi@1@00)
      (count_array%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@48@00 s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)))))) (+
        i@0@00
        1) hi@1@00 ar@2@00 v@3@00)
      true))
  :pattern ((count_array s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (hi@6@00 Int) (ar@7@00 Seq<Int>) (v@8@00 Int)) (!
  (=
    (count_list%limited s@$ i@5@00 hi@6@00 ar@7@00 v@8@00)
    (count_list s@$ i@5@00 hi@6@00 ar@7@00 v@8@00))
  :pattern ((count_list s@$ i@5@00 hi@6@00 ar@7@00 v@8@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (hi@6@00 Int) (ar@7@00 Seq<Int>) (v@8@00 Int)) (!
  (count_list%stateless i@5@00 hi@6@00 ar@7@00 v@8@00)
  :pattern ((count_list%limited s@$ i@5@00 hi@6@00 ar@7@00 v@8@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (hi@6@00 Int) (ar@7@00 Seq<Int>) (v@8@00 Int)) (!
  (=>
    (count_list%precondition s@$ i@5@00 hi@6@00 ar@7@00 v@8@00)
    (=
      (count_list s@$ i@5@00 hi@6@00 ar@7@00 v@8@00)
      (ite
        (< i@5@00 hi@6@00)
        (+
          (ite (= (Seq_index ar@7@00 i@5@00) v@8@00) 1 0)
          (count_list%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (+ i@5@00 1) hi@6@00 ar@7@00 v@8@00))
        0)))
  :pattern ((count_list s@$ i@5@00 hi@6@00 ar@7@00 v@8@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (hi@6@00 Int) (ar@7@00 Seq<Int>) (v@8@00 Int)) (!
  (=>
    (count_list%precondition s@$ i@5@00 hi@6@00 ar@7@00 v@8@00)
    (ite
      (< i@5@00 hi@6@00)
      (count_list%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit $Snap.unit)) (+ i@5@00 1) hi@6@00 ar@7@00 v@8@00)
      true))
  :pattern ((count_list s@$ i@5@00 hi@6@00 ar@7@00 v@8@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (i@10@00 Int) (hi@11@00 Int) (ar@12@00 Seq<Int>)) (!
  (=
    (sum_list%limited s@$ i@10@00 hi@11@00 ar@12@00)
    (sum_list s@$ i@10@00 hi@11@00 ar@12@00))
  :pattern ((sum_list s@$ i@10@00 hi@11@00 ar@12@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (i@10@00 Int) (hi@11@00 Int) (ar@12@00 Seq<Int>)) (!
  (sum_list%stateless i@10@00 hi@11@00 ar@12@00)
  :pattern ((sum_list%limited s@$ i@10@00 hi@11@00 ar@12@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (i@10@00 Int) (hi@11@00 Int) (ar@12@00 Seq<Int>)) (!
  (=>
    (sum_list%precondition s@$ i@10@00 hi@11@00 ar@12@00)
    (=
      (sum_list s@$ i@10@00 hi@11@00 ar@12@00)
      (ite
        (< i@10@00 hi@11@00)
        (+
          (Seq_index ar@12@00 i@10@00)
          (sum_list%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (+ i@10@00 1) hi@11@00 ar@12@00))
        0)))
  :pattern ((sum_list s@$ i@10@00 hi@11@00 ar@12@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (i@10@00 Int) (hi@11@00 Int) (ar@12@00 Seq<Int>)) (!
  (=>
    (sum_list%precondition s@$ i@10@00 hi@11@00 ar@12@00)
    (ite
      (< i@10@00 hi@11@00)
      (sum_list%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit $Snap.unit)) (+ i@10@00 1) hi@11@00 ar@12@00)
      true))
  :pattern ((sum_list s@$ i@10@00 hi@11@00 ar@12@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (lo@15@00 Int) (hi@16@00 Int) (ar@17@00 Seq<$Ref>)) (!
  (=
    (sum_array%limited s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00)
    (sum_array s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00))
  :pattern ((sum_array s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (lo@15@00 Int) (hi@16@00 Int) (ar@17@00 Seq<$Ref>)) (!
  (sum_array%stateless i@14@00 lo@15@00 hi@16@00 ar@17@00)
  :pattern ((sum_array%limited s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (lo@15@00 Int) (hi@16@00 Int) (ar@17@00 Seq<$Ref>)) (!
  (and
    (forall ((k@51@00 Int)) (!
      (=>
        (and
          (and (<= lo@15@00 k@51@00) (< k@51@00 hi@16@00))
          (< $Perm.No $k@52@00))
        (and
          (=
            (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 (Seq_index
              ar@17@00
              k@51@00))
            k@51@00)
          (img@54@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 (Seq_index
            ar@17@00
            k@51@00))))
      :pattern ((Seq_index ar@17@00 k@51@00))
      :qid |quant-u-25|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@54@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r)
          (and
            (and
              (<= lo@15@00 (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
              (< (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r) hi@16@00))
            (< $Perm.No $k@52@00)))
        (=
          (Seq_index
            ar@17@00
            (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
          r))
      :pattern ((inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@57@00 Int)) (!
      (=>
        (and
          (and (<= lo@15@00 k@57@00) (< k@57@00 hi@16@00))
          (< $Perm.No $k@58@00))
        (and
          (=
            (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 (Seq_index
              ar@17@00
              k@57@00))
            k@57@00)
          (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 (Seq_index
            ar@17@00
            k@57@00))))
      :pattern ((Seq_index ar@17@00 k@57@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r)
          (and
            (and
              (<= lo@15@00 (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
              (< (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r) hi@16@00))
            (< $Perm.No $k@58@00)))
        (=
          (Seq_index
            ar@17@00
            (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
          r))
      :pattern ((inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00)))
          (and
            (and
              (<= lo@15@00 (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
              (< (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r) hi@16@00))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r)))
        (=>
          (and
            (and
              (<= lo@15@00 (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
              (< (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r) hi@16@00))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00))))
      :qid |qp.fvfDomDef5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= lo@15@00 (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
              (< (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r) hi@16@00))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
          (ite
            (and
              (img@54@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r)
              (and
                (<=
                  lo@15@00
                  (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r))
                (< (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00 r) hi@16@00)))
            (< $Perm.No $k@52@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r))
      :qid |qp.fvfValDef4|))
    ($Perm.isReadVar $k@52@00)
    ($Perm.isReadVar $k@58@00)
    (=>
      (sum_array%precondition s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00)
      (=
        (sum_array s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00)
        (ite
          (< i@14@00 hi@16@00)
          (+
            ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) (Seq_index
              ar@17@00
              i@14@00))
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
                      ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00))))))) (+
              i@14@00
              1) lo@15@00 hi@16@00 ar@17@00))
          0))))
  :pattern ((sum_array s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (lo@15@00 Int) (hi@16@00 Int) (ar@17@00 Seq<$Ref>)) (!
  (=>
    (sum_array%precondition s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00)
    (ite
      (< i@14@00 hi@16@00)
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
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00))))))) (+
        i@14@00
        1) lo@15@00 hi@16@00 ar@17@00)
      true))
  :pattern ((sum_array s@$ i@14@00 lo@15@00 hi@16@00 ar@17@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (i@19@00 Int) (lo@20@00 Int) (hi@21@00 Int) (step@22@00 Int) (min@23@00 Int) (max@24@00 Int) (ar@25@00 Seq<$Ref>)) (!
  (=
    (sum_square%limited s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)
    (sum_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))
  :pattern ((sum_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (i@19@00 Int) (lo@20@00 Int) (hi@21@00 Int) (step@22@00 Int) (min@23@00 Int) (max@24@00 Int) (ar@25@00 Seq<$Ref>)) (!
  (sum_square%stateless i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)
  :pattern ((sum_square%limited s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (i@19@00 Int) (lo@20@00 Int) (hi@21@00 Int) (step@22@00 Int) (min@23@00 Int) (max@24@00 Int) (ar@25@00 Seq<$Ref>)) (!
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
            (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 (Seq_index
              ar@25@00
              k@64@00))
            k@64@00)
          (img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 (Seq_index
            ar@25@00
            k@64@00))))
      :pattern ((Seq_index ar@25@00 k@64@00))
      :qid |quant-u-33|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
          (and
            (and
              (<=
                min@23@00
                (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@65@00)))
        (=
          (Seq_index
            ar@25@00
            (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
          r))
      :pattern ((inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
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
            (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 (Seq_index
              ar@25@00
              k@70@00))
            k@70@00)
          (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 (Seq_index
            ar@25@00
            k@70@00))))
      :pattern ((Seq_index ar@25@00 k@70@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
          (and
            (and
              (<=
                min@23@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@71@00)))
        (=
          (Seq_index
            ar@25@00
            (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
          r))
      :pattern ((inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)))
          (and
            (and
              (<=
                min@23@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)))
        (=>
          (and
            (and
              (<=
                min@23@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))))
      :qid |qp.fvfDomDef8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@23@00
                (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
          (ite
            (and
              (img@67@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
              (and
                (<=
                  min@23@00
                  (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
                (and
                  (<
                    (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                    max@24@00)
                  (and
                    (<=
                      lo@20@00
                      (mod
                        (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                        step@22@00))
                    (<
                      (mod
                        (inv@66@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                        step@22@00)
                      hi@21@00)))))
            (< $Perm.No $k@65@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef7|))
    ($Perm.isReadVar $k@65@00)
    ($Perm.isReadVar $k@71@00)
    (=>
      (sum_square%precondition s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)
      (=
        (sum_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)
        (ite
          (< i@19@00 max@24@00)
          (+
            (ite
              (and
                (<= lo@20@00 (mod i@19@00 step@22@00))
                (< (mod i@19@00 step@22@00) hi@21@00))
              ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
                ar@25@00
                i@19@00))
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
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))))))))))) (+
              i@19@00
              1) lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))
          0))))
  :pattern ((sum_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (i@19@00 Int) (lo@20@00 Int) (hi@21@00 Int) (step@22@00 Int) (min@23@00 Int) (max@24@00 Int) (ar@25@00 Seq<$Ref>)) (!
  (=>
    (sum_square%precondition s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)
    (ite
      (< i@19@00 max@24@00)
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
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@74@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))))))))))) (+
        i@19@00
        1) lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)
      true))
  :pattern ((sum_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))
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
; ---------- Ref__loop_main_29 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const ar@2@01 Seq<$Ref>)
(declare-const N@3@01 Int)
(declare-const diz@4@01 $Ref)
(declare-const current_thread_id@5@01 Int)
(declare-const ar@6@01 Seq<$Ref>)
(declare-const N@7@01 Int)
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
; [eval] N > 0
(assert (> N@7@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) $Snap.unit))
; [eval] N <= |ar|
; [eval] |ar|
(assert (<= N@7@01 (Seq_length ar@6@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { ar[j], ar[k] } 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@9@01 Int)
(declare-const k@10@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 0 | !(0 <= j@9@01) | live]
; [else-branch: 0 | 0 <= j@9@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= j@9@01)]
(assert (not (<= 0 j@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= j@9@01]
(assert (<= 0 j@9@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 1 | !(j@9@01 < |ar@6@01|) | live]
; [else-branch: 1 | j@9@01 < |ar@6@01| | live]
(push) ; 6
; [then-branch: 1 | !(j@9@01 < |ar@6@01|)]
(assert (not (< j@9@01 (Seq_length ar@6@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | j@9@01 < |ar@6@01|]
(assert (< j@9@01 (Seq_length ar@6@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 2 | !(0 <= k@10@01) | live]
; [else-branch: 2 | 0 <= k@10@01 | live]
(push) ; 8
; [then-branch: 2 | !(0 <= k@10@01)]
(assert (not (<= 0 k@10@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | 0 <= k@10@01]
(assert (<= 0 k@10@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 3 | !(k@10@01 < |ar@6@01|) | live]
; [else-branch: 3 | k@10@01 < |ar@6@01| | live]
(push) ; 10
; [then-branch: 3 | !(k@10@01 < |ar@6@01|)]
(assert (not (< k@10@01 (Seq_length ar@6@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | k@10@01 < |ar@6@01|]
(assert (< k@10@01 (Seq_length ar@6@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@10@01 (Seq_length ar@6@01)) (not (< k@10@01 (Seq_length ar@6@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@10@01)
  (and
    (<= 0 k@10@01)
    (or (< k@10@01 (Seq_length ar@6@01)) (not (< k@10@01 (Seq_length ar@6@01)))))))
(assert (or (<= 0 k@10@01) (not (<= 0 k@10@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@9@01 (Seq_length ar@6@01))
  (and
    (< j@9@01 (Seq_length ar@6@01))
    (=>
      (<= 0 k@10@01)
      (and
        (<= 0 k@10@01)
        (or
          (< k@10@01 (Seq_length ar@6@01))
          (not (< k@10@01 (Seq_length ar@6@01))))))
    (or (<= 0 k@10@01) (not (<= 0 k@10@01))))))
(assert (or (< j@9@01 (Seq_length ar@6@01)) (not (< j@9@01 (Seq_length ar@6@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@9@01)
  (and
    (<= 0 j@9@01)
    (=>
      (< j@9@01 (Seq_length ar@6@01))
      (and
        (< j@9@01 (Seq_length ar@6@01))
        (=>
          (<= 0 k@10@01)
          (and
            (<= 0 k@10@01)
            (or
              (< k@10@01 (Seq_length ar@6@01))
              (not (< k@10@01 (Seq_length ar@6@01))))))
        (or (<= 0 k@10@01) (not (<= 0 k@10@01)))))
    (or (< j@9@01 (Seq_length ar@6@01)) (not (< j@9@01 (Seq_length ar@6@01)))))))
(assert (or (<= 0 j@9@01) (not (<= 0 j@9@01))))
(push) ; 3
; [then-branch: 4 | 0 <= j@9@01 && j@9@01 < |ar@6@01| && 0 <= k@10@01 && k@10@01 < |ar@6@01| && j@9@01 != k@10@01 | live]
; [else-branch: 4 | !(0 <= j@9@01 && j@9@01 < |ar@6@01| && 0 <= k@10@01 && k@10@01 < |ar@6@01| && j@9@01 != k@10@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= j@9@01 && j@9@01 < |ar@6@01| && 0 <= k@10@01 && k@10@01 < |ar@6@01| && j@9@01 != k@10@01]
(assert (and
  (<= 0 j@9@01)
  (and
    (< j@9@01 (Seq_length ar@6@01))
    (and
      (<= 0 k@10@01)
      (and (< k@10@01 (Seq_length ar@6@01)) (not (= j@9@01 k@10@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 5
(assert (not (>= j@9@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@10@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= j@9@01 && j@9@01 < |ar@6@01| && 0 <= k@10@01 && k@10@01 < |ar@6@01| && j@9@01 != k@10@01)]
(assert (not
  (and
    (<= 0 j@9@01)
    (and
      (< j@9@01 (Seq_length ar@6@01))
      (and
        (<= 0 k@10@01)
        (and (< k@10@01 (Seq_length ar@6@01)) (not (= j@9@01 k@10@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@9@01)
    (and
      (< j@9@01 (Seq_length ar@6@01))
      (and
        (<= 0 k@10@01)
        (and (< k@10@01 (Seq_length ar@6@01)) (not (= j@9@01 k@10@01))))))
  (and
    (<= 0 j@9@01)
    (< j@9@01 (Seq_length ar@6@01))
    (<= 0 k@10@01)
    (< k@10@01 (Seq_length ar@6@01))
    (not (= j@9@01 k@10@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@9@01)
      (and
        (< j@9@01 (Seq_length ar@6@01))
        (and
          (<= 0 k@10@01)
          (and (< k@10@01 (Seq_length ar@6@01)) (not (= j@9@01 k@10@01)))))))
  (and
    (<= 0 j@9@01)
    (and
      (< j@9@01 (Seq_length ar@6@01))
      (and
        (<= 0 k@10@01)
        (and (< k@10@01 (Seq_length ar@6@01)) (not (= j@9@01 k@10@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@9@01 Int) (k@10@01 Int)) (!
  (and
    (=>
      (<= 0 j@9@01)
      (and
        (<= 0 j@9@01)
        (=>
          (< j@9@01 (Seq_length ar@6@01))
          (and
            (< j@9@01 (Seq_length ar@6@01))
            (=>
              (<= 0 k@10@01)
              (and
                (<= 0 k@10@01)
                (or
                  (< k@10@01 (Seq_length ar@6@01))
                  (not (< k@10@01 (Seq_length ar@6@01))))))
            (or (<= 0 k@10@01) (not (<= 0 k@10@01)))))
        (or
          (< j@9@01 (Seq_length ar@6@01))
          (not (< j@9@01 (Seq_length ar@6@01))))))
    (or (<= 0 j@9@01) (not (<= 0 j@9@01)))
    (=>
      (and
        (<= 0 j@9@01)
        (and
          (< j@9@01 (Seq_length ar@6@01))
          (and
            (<= 0 k@10@01)
            (and (< k@10@01 (Seq_length ar@6@01)) (not (= j@9@01 k@10@01))))))
      (and
        (<= 0 j@9@01)
        (< j@9@01 (Seq_length ar@6@01))
        (<= 0 k@10@01)
        (< k@10@01 (Seq_length ar@6@01))
        (not (= j@9@01 k@10@01))))
    (or
      (not
        (and
          (<= 0 j@9@01)
          (and
            (< j@9@01 (Seq_length ar@6@01))
            (and
              (<= 0 k@10@01)
              (and (< k@10@01 (Seq_length ar@6@01)) (not (= j@9@01 k@10@01)))))))
      (and
        (<= 0 j@9@01)
        (and
          (< j@9@01 (Seq_length ar@6@01))
          (and
            (<= 0 k@10@01)
            (and (< k@10@01 (Seq_length ar@6@01)) (not (= j@9@01 k@10@01))))))))
  :pattern ((Seq_index ar@6@01 j@9@01) (Seq_index ar@6@01 k@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@66@12@66@106-aux|)))
(assert (forall ((j@9@01 Int) (k@10@01 Int)) (!
  (=>
    (and
      (<= 0 j@9@01)
      (and
        (< j@9@01 (Seq_length ar@6@01))
        (and
          (<= 0 k@10@01)
          (and (< k@10@01 (Seq_length ar@6@01)) (not (= j@9@01 k@10@01))))))
    (not (= (Seq_index ar@6@01 j@9@01) (Seq_index ar@6@01 k@10@01))))
  :pattern ((Seq_index ar@6@01 j@9@01) (Seq_index ar@6@01 k@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@66@12@66@106|)))
(declare-const i@11@01 Int)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 5 | !(0 <= i@11@01) | live]
; [else-branch: 5 | 0 <= i@11@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= i@11@01)]
(assert (not (<= 0 i@11@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= i@11@01]
(assert (<= 0 i@11@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
(assert (and (<= 0 i@11@01) (< i@11@01 N@7@01)))
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@11@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@11@01 (Seq_length ar@6@01))))
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
    (and (<= 0 i@11@01) (< i@11@01 N@7@01))
    (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
  :pattern ((Seq_index ar@6@01 i@11@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@11@01 Int) (i2@11@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@11@01) (< i1@11@01 N@7@01))
      (and (<= 0 i2@11@01) (< i2@11@01 N@7@01))
      (= (Seq_index ar@6@01 i1@11@01) (Seq_index ar@6@01 i2@11@01)))
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
    (and (<= 0 i@11@01) (< i@11@01 N@7@01))
    (and
      (= (inv@12@01 (Seq_index ar@6@01 i@11@01)) i@11@01)
      (img@13@01 (Seq_index ar@6@01 i@11@01))))
  :pattern ((Seq_index ar@6@01 i@11@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) N@7@01)))
    (= (Seq_index ar@6@01 (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 N@7@01))
    (not (= (Seq_index ar@6@01 i@11@01) $Ref.null)))
  :pattern ((Seq_index ar@6@01 i@11@01))
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
; [eval] N > 0
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(declare-const i@15@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 6 | !(0 <= i@15@01) | live]
; [else-branch: 6 | 0 <= i@15@01 | live]
(push) ; 5
; [then-branch: 6 | !(0 <= i@15@01)]
(assert (not (<= 0 i@15@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 <= i@15@01]
(assert (<= 0 i@15@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
(assert (and (<= 0 i@15@01) (< i@15@01 N@7@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@15@01 (Seq_length ar@6@01))))
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
    (and (<= 0 i@15@01) (< i@15@01 N@7@01))
    (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
  :pattern ((Seq_index ar@6@01 i@15@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@15@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@15@01) (< i1@15@01 N@7@01))
      (and (<= 0 i2@15@01) (< i2@15@01 N@7@01))
      (= (Seq_index ar@6@01 i1@15@01) (Seq_index ar@6@01 i2@15@01)))
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
    (and (<= 0 i@15@01) (< i@15@01 N@7@01))
    (and
      (= (inv@16@01 (Seq_index ar@6@01 i@15@01)) i@15@01)
      (img@17@01 (Seq_index ar@6@01 i@15@01))))
  :pattern ((Seq_index ar@6@01 i@15@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) N@7@01)))
    (= (Seq_index ar@6@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 N@7@01))
    (not (= (Seq_index ar@6@01 i@15@01) $Ref.null)))
  :pattern ((Seq_index ar@6@01 i@15@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@14@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@14@01))) $Snap.unit))
; [eval] diz.Ref__res == old(diz.Ref__res) + sum_array(0, 0, N, ar)
; [eval] old(diz.Ref__res) + sum_array(0, 0, N, ar)
; [eval] old(diz.Ref__res)
; [eval] sum_array(0, 0, N, ar)
(push) ; 3
; [eval] 0 <= lo
; [eval] lo <= i
; [eval] i <= hi
(push) ; 4
(assert (not (<= 0 N@7@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@7@01))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall j: Int, k: Int ::0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@18@01 Int)
(declare-const k@19@01 Int)
(push) ; 4
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 7 | !(0 <= j@18@01) | live]
; [else-branch: 7 | 0 <= j@18@01 | live]
(push) ; 6
; [then-branch: 7 | !(0 <= j@18@01)]
(assert (not (<= 0 j@18@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | 0 <= j@18@01]
(assert (<= 0 j@18@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 7
; [then-branch: 8 | !(j@18@01 < |ar@6@01|) | live]
; [else-branch: 8 | j@18@01 < |ar@6@01| | live]
(push) ; 8
; [then-branch: 8 | !(j@18@01 < |ar@6@01|)]
(assert (not (< j@18@01 (Seq_length ar@6@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | j@18@01 < |ar@6@01|]
(assert (< j@18@01 (Seq_length ar@6@01)))
; [eval] 0 <= k
(push) ; 9
; [then-branch: 9 | !(0 <= k@19@01) | live]
; [else-branch: 9 | 0 <= k@19@01 | live]
(push) ; 10
; [then-branch: 9 | !(0 <= k@19@01)]
(assert (not (<= 0 k@19@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | 0 <= k@19@01]
(assert (<= 0 k@19@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 11
; [then-branch: 10 | !(k@19@01 < |ar@6@01|) | live]
; [else-branch: 10 | k@19@01 < |ar@6@01| | live]
(push) ; 12
; [then-branch: 10 | !(k@19@01 < |ar@6@01|)]
(assert (not (< k@19@01 (Seq_length ar@6@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 10 | k@19@01 < |ar@6@01|]
(assert (< k@19@01 (Seq_length ar@6@01)))
; [eval] j != k
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< k@19@01 (Seq_length ar@6@01)) (not (< k@19@01 (Seq_length ar@6@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@19@01)
  (and
    (<= 0 k@19@01)
    (or (< k@19@01 (Seq_length ar@6@01)) (not (< k@19@01 (Seq_length ar@6@01)))))))
(assert (or (<= 0 k@19@01) (not (<= 0 k@19@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@18@01 (Seq_length ar@6@01))
  (and
    (< j@18@01 (Seq_length ar@6@01))
    (=>
      (<= 0 k@19@01)
      (and
        (<= 0 k@19@01)
        (or
          (< k@19@01 (Seq_length ar@6@01))
          (not (< k@19@01 (Seq_length ar@6@01))))))
    (or (<= 0 k@19@01) (not (<= 0 k@19@01))))))
(assert (or (< j@18@01 (Seq_length ar@6@01)) (not (< j@18@01 (Seq_length ar@6@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@18@01)
  (and
    (<= 0 j@18@01)
    (=>
      (< j@18@01 (Seq_length ar@6@01))
      (and
        (< j@18@01 (Seq_length ar@6@01))
        (=>
          (<= 0 k@19@01)
          (and
            (<= 0 k@19@01)
            (or
              (< k@19@01 (Seq_length ar@6@01))
              (not (< k@19@01 (Seq_length ar@6@01))))))
        (or (<= 0 k@19@01) (not (<= 0 k@19@01)))))
    (or (< j@18@01 (Seq_length ar@6@01)) (not (< j@18@01 (Seq_length ar@6@01)))))))
(assert (or (<= 0 j@18@01) (not (<= 0 j@18@01))))
(push) ; 5
; [then-branch: 11 | 0 <= j@18@01 && j@18@01 < |ar@6@01| && 0 <= k@19@01 && k@19@01 < |ar@6@01| && j@18@01 != k@19@01 | live]
; [else-branch: 11 | !(0 <= j@18@01 && j@18@01 < |ar@6@01| && 0 <= k@19@01 && k@19@01 < |ar@6@01| && j@18@01 != k@19@01) | live]
(push) ; 6
; [then-branch: 11 | 0 <= j@18@01 && j@18@01 < |ar@6@01| && 0 <= k@19@01 && k@19@01 < |ar@6@01| && j@18@01 != k@19@01]
(assert (and
  (<= 0 j@18@01)
  (and
    (< j@18@01 (Seq_length ar@6@01))
    (and
      (<= 0 k@19@01)
      (and (< k@19@01 (Seq_length ar@6@01)) (not (= j@18@01 k@19@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 7
(assert (not (>= j@18@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 7
(assert (not (>= k@19@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(0 <= j@18@01 && j@18@01 < |ar@6@01| && 0 <= k@19@01 && k@19@01 < |ar@6@01| && j@18@01 != k@19@01)]
(assert (not
  (and
    (<= 0 j@18@01)
    (and
      (< j@18@01 (Seq_length ar@6@01))
      (and
        (<= 0 k@19@01)
        (and (< k@19@01 (Seq_length ar@6@01)) (not (= j@18@01 k@19@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@18@01)
    (and
      (< j@18@01 (Seq_length ar@6@01))
      (and
        (<= 0 k@19@01)
        (and (< k@19@01 (Seq_length ar@6@01)) (not (= j@18@01 k@19@01))))))
  (and
    (<= 0 j@18@01)
    (< j@18@01 (Seq_length ar@6@01))
    (<= 0 k@19@01)
    (< k@19@01 (Seq_length ar@6@01))
    (not (= j@18@01 k@19@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@18@01)
      (and
        (< j@18@01 (Seq_length ar@6@01))
        (and
          (<= 0 k@19@01)
          (and (< k@19@01 (Seq_length ar@6@01)) (not (= j@18@01 k@19@01)))))))
  (and
    (<= 0 j@18@01)
    (and
      (< j@18@01 (Seq_length ar@6@01))
      (and
        (<= 0 k@19@01)
        (and (< k@19@01 (Seq_length ar@6@01)) (not (= j@18@01 k@19@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((j@18@01 Int) (k@19@01 Int)) (!
  (=>
    (and
      (<= 0 j@18@01)
      (and
        (< j@18@01 (Seq_length ar@6@01))
        (and
          (<= 0 k@19@01)
          (and (< k@19@01 (Seq_length ar@6@01)) (not (= j@18@01 k@19@01))))))
    (not (= (Seq_index ar@6@01 j@18@01) (Seq_index ar@6@01 k@19@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@18@01 Int) (k@19@01 Int)) (!
  (=>
    (and
      (<= 0 j@18@01)
      (and
        (< j@18@01 (Seq_length ar@6@01))
        (and
          (<= 0 k@19@01)
          (and (< k@19@01 (Seq_length ar@6@01)) (not (= j@18@01 k@19@01))))))
    (not (= (Seq_index ar@6@01 j@18@01) (Seq_index ar@6@01 k@19@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|)))
(declare-const k@20@01 Int)
(push) ; 4
; [eval] lo <= k && k < hi
; [eval] lo <= k
(push) ; 5
; [then-branch: 12 | !(0 <= k@20@01) | live]
; [else-branch: 12 | 0 <= k@20@01 | live]
(push) ; 6
; [then-branch: 12 | !(0 <= k@20@01)]
(assert (not (<= 0 k@20@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | 0 <= k@20@01]
(assert (<= 0 k@20@01))
; [eval] k < hi
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@20@01) (not (<= 0 k@20@01))))
(assert (and (<= 0 k@20@01) (< k@20@01 N@7@01)))
(declare-const $k@21@01 $Perm)
(assert ($Perm.isReadVar $k@21@01))
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@20@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@20@01 (Seq_length ar@6@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@22@01 ($Ref) Int)
(declare-fun img@23@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@21@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (<= 0 k@20@01) (< k@20@01 N@7@01))
    (or (<= 0 k@20@01) (not (<= 0 k@20@01))))
  :pattern ((Seq_index ar@6@01 k@20@01))
  :qid |Ref__Integer_value-aux|)))
(push) ; 4
(assert (not (forall ((k@20@01 Int)) (!
  (=>
    (and (<= 0 k@20@01) (< k@20@01 N@7@01))
    (or (= $k@21@01 $Perm.No) (< $Perm.No $k@21@01)))
  
  :qid |quant-u-52|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@20@01 Int) (k2@20@01 Int)) (!
  (=>
    (and
      (and (and (<= 0 k1@20@01) (< k1@20@01 N@7@01)) (< $Perm.No $k@21@01))
      (and (and (<= 0 k2@20@01) (< k2@20@01 N@7@01)) (< $Perm.No $k@21@01))
      (= (Seq_index ar@6@01 k1@20@01) (Seq_index ar@6@01 k2@20@01)))
    (= k1@20@01 k2@20@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (and (<= 0 k@20@01) (< k@20@01 N@7@01)) (< $Perm.No $k@21@01))
    (and
      (= (inv@22@01 (Seq_index ar@6@01 k@20@01)) k@20@01)
      (img@23@01 (Seq_index ar@6@01 k@20@01))))
  :pattern ((Seq_index ar@6@01 k@20@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (and
        (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
        (< $Perm.No $k@21@01)))
    (= (Seq_index ar@6@01 (inv@22@01 r)) r))
  :pattern ((inv@22@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@24@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
      (img@23@01 r)
      (= r (Seq_index ar@6@01 (inv@22@01 r))))
    ($Perm.min
      (ite
        (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) N@7@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      $k@21@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@21@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) N@7@01)))
          (/ (to_real 1) (to_real 4))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) N@7@01)))
      (<
        (ite
          (and
            (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
            (img@23@01 r)
            (= r (Seq_index ar@6@01 (inv@22@01 r))))
          $k@21@01
          $Perm.No)
        (/ (to_real 1) (to_real 4)))
      (<
        (ite
          (and
            (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
            (img@23@01 r)
            (= r (Seq_index ar@6@01 (inv@22@01 r))))
          $k@21@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@17@01 r))
  :pattern ((inv@16@01 r))
  :pattern ((img@23@01 r))
  :pattern ((Seq_index ar@6@01 (inv@22@01 r)))
  :qid |qp.srp0|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
      (img@23@01 r)
      (= r (Seq_index ar@6@01 (inv@22@01 r))))
    (= (- $k@21@01 (pTaken@24@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@25@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
        (< $Perm.No $k@21@01)
        (img@23@01 r)))
    (=>
      (and
        (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
        (< $Perm.No $k@21@01)
        (img@23@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef2|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
        (< $Perm.No $k@21@01)
        (img@23@01 r))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) N@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@14@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@14@01))) r))
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
          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@25@01  $FVF<Ref__Integer_value>))))))) 0 0 N@7@01 ar@6@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@21@01))
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (and (<= 0 k@20@01) (< k@20@01 N@7@01)) (< $Perm.No $k@21@01))
    (and
      (= (inv@22@01 (Seq_index ar@6@01 k@20@01)) k@20@01)
      (img@23@01 (Seq_index ar@6@01 k@20@01))))
  :pattern ((Seq_index ar@6@01 k@20@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (and
        (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
        (< $Perm.No $k@21@01)))
    (= (Seq_index ar@6@01 (inv@22@01 r)) r))
  :pattern ((inv@22@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
        (< $Perm.No $k@21@01)
        (img@23@01 r)))
    (=>
      (and
        (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
        (< $Perm.No $k@21@01)
        (img@23@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
        (< $Perm.No $k@21@01)
        (img@23@01 r))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) N@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@14@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@25@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@14@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (and
  (<= 0 N@7@01)
  (forall ((j@18@01 Int) (k@19@01 Int)) (!
    (=>
      (and
        (<= 0 j@18@01)
        (and
          (< j@18@01 (Seq_length ar@6@01))
          (and
            (<= 0 k@19@01)
            (and (< k@19@01 (Seq_length ar@6@01)) (not (= j@18@01 k@19@01))))))
      (not (= (Seq_index ar@6@01 j@18@01) (Seq_index ar@6@01 k@19@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|))
  (forall ((k@20@01 Int)) (!
    (=>
      (and (<= 0 k@20@01) (< k@20@01 N@7@01))
      (or (<= 0 k@20@01) (not (<= 0 k@20@01))))
    :pattern ((Seq_index ar@6@01 k@20@01))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@17@01 r)
              (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) N@7@01)))
            (/ (to_real 1) (to_real 4))
            $Perm.No)
          $Perm.No))
      (ite
        (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) N@7@01)))
        (<
          (ite
            (and
              (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
              (img@23@01 r)
              (= r (Seq_index ar@6@01 (inv@22@01 r))))
            $k@21@01
            $Perm.No)
          (/ (to_real 1) (to_real 4)))
        (<
          (ite
            (and
              (and (<= 0 (inv@22@01 r)) (< (inv@22@01 r) N@7@01))
              (img@23@01 r)
              (= r (Seq_index ar@6@01 (inv@22@01 r))))
            $k@21@01
            $Perm.No)
          $Perm.No)))
    :pattern ((img@17@01 r))
    :pattern ((inv@16@01 r))
    :pattern ((img@23@01 r))
    :pattern ((Seq_index ar@6@01 (inv@22@01 r)))
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
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@25@01  $FVF<Ref__Integer_value>))))))) 0 0 N@7@01 ar@6@01)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
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
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@25@01  $FVF<Ref__Integer_value>))))))) 0 0 N@7@01 ar@6@01))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_body_29 ----------
(declare-const diz@26@01 $Ref)
(declare-const current_thread_id@27@01 Int)
(declare-const ar@28@01 Seq<$Ref>)
(declare-const i@29@01 Int)
(declare-const N@30@01 Int)
(declare-const diz@31@01 $Ref)
(declare-const current_thread_id@32@01 Int)
(declare-const ar@33@01 Seq<$Ref>)
(declare-const i@34@01 Int)
(declare-const N@35@01 Int)
(push) ; 1
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.first $t@36@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@31@01 $Ref.null)))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(assert (= ($Snap.first ($Snap.second $t@36@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@32@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@36@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@36@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@36@01))) $Snap.unit))
; [eval] N > 0
(assert (> N@35@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@36@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
  $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@34@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
  $Snap.unit))
; [eval] i < N
(assert (< i@34@01 N@35@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
  $Snap.unit))
; [eval] N <= |ar|
; [eval] |ar|
(assert (<= N@35@01 (Seq_length ar@33@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
  $Snap.unit))
; [eval] diz.Ref__res == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
  0))
; [eval] ar[i]
(push) ; 2
(assert (not (>= i@34@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@34@01 (Seq_length ar@33@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@33@01 i@34@01) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(assert (= ($Snap.first $t@37@01) $Snap.unit))
; [eval] N > 0
(assert (=
  ($Snap.second $t@37@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@37@01))
    ($Snap.second ($Snap.second $t@37@01)))))
(assert (= ($Snap.first ($Snap.second $t@37@01)) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second ($Snap.second $t@37@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@37@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@37@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@37@01))) $Snap.unit))
; [eval] i < N
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@37@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@37@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@37@01)))))))
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@34@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@34@01 (Seq_length ar@33@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@37@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@37@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@37@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@37@01)))))
  $Snap.unit))
; [eval] diz.Ref__res == ar[i].Ref__Integer_value
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@34@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@34@01 (Seq_length ar@33@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@37@01))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@37@01)))))))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_3: Int
(declare-const __flatten_3@38@01 Int)
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@39@01 $Ref)
; [exec]
; __flatten_4 := ar[i]
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@34@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@34@01 (Seq_length ar@33@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@40@01 $Ref)
(assert (= __flatten_4@40@01 (Seq_index ar@33@01 i@34@01)))
; [exec]
; __flatten_3 := diz.Ref__res + __flatten_4.Ref__Integer_value
; [eval] diz.Ref__res + __flatten_4.Ref__Integer_value
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index ar@33@01 i@34@01) __flatten_4@40@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_3@41@01 Int)
(assert (=
  __flatten_3@41@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))))))
; [exec]
; diz.Ref__res := __flatten_3
; [eval] N > 0
; [eval] 0 <= i
; [eval] i < N
; [eval] ar[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@34@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@34@01 (Seq_length ar@33@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Ref__res == ar[i].Ref__Integer_value
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@34@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@34@01 (Seq_length ar@33@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  __flatten_3@41@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  __flatten_3@41@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))))))
(pop) ; 2
(pop) ; 1
; ---------- Ref__do_sum ----------
(declare-const diz@42@01 $Ref)
(declare-const current_thread_id@43@01 Int)
(declare-const N@44@01 Int)
(declare-const ar@45@01 Seq<$Ref>)
(declare-const diz@46@01 $Ref)
(declare-const current_thread_id@47@01 Int)
(declare-const N@48@01 Int)
(declare-const ar@49@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(assert (= ($Snap.first $t@50@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@46@01 $Ref.null)))
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(assert (= ($Snap.first ($Snap.second $t@50@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@47@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@50@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@50@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@50@01))) $Snap.unit))
; [eval] N > 0
(assert (> N@48@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@50@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
  $Snap.unit))
; [eval] N <= |ar|
; [eval] |ar|
(assert (<= N@48@01 (Seq_length ar@49@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { ar[j], ar[k] } 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@51@01 Int)
(declare-const k@52@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 13 | !(0 <= j@51@01) | live]
; [else-branch: 13 | 0 <= j@51@01 | live]
(push) ; 4
; [then-branch: 13 | !(0 <= j@51@01)]
(assert (not (<= 0 j@51@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 13 | 0 <= j@51@01]
(assert (<= 0 j@51@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 14 | !(j@51@01 < |ar@49@01|) | live]
; [else-branch: 14 | j@51@01 < |ar@49@01| | live]
(push) ; 6
; [then-branch: 14 | !(j@51@01 < |ar@49@01|)]
(assert (not (< j@51@01 (Seq_length ar@49@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | j@51@01 < |ar@49@01|]
(assert (< j@51@01 (Seq_length ar@49@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 15 | !(0 <= k@52@01) | live]
; [else-branch: 15 | 0 <= k@52@01 | live]
(push) ; 8
; [then-branch: 15 | !(0 <= k@52@01)]
(assert (not (<= 0 k@52@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 15 | 0 <= k@52@01]
(assert (<= 0 k@52@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 16 | !(k@52@01 < |ar@49@01|) | live]
; [else-branch: 16 | k@52@01 < |ar@49@01| | live]
(push) ; 10
; [then-branch: 16 | !(k@52@01 < |ar@49@01|)]
(assert (not (< k@52@01 (Seq_length ar@49@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 16 | k@52@01 < |ar@49@01|]
(assert (< k@52@01 (Seq_length ar@49@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@52@01 (Seq_length ar@49@01)) (not (< k@52@01 (Seq_length ar@49@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@52@01)
  (and
    (<= 0 k@52@01)
    (or
      (< k@52@01 (Seq_length ar@49@01))
      (not (< k@52@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 k@52@01) (not (<= 0 k@52@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@51@01 (Seq_length ar@49@01))
  (and
    (< j@51@01 (Seq_length ar@49@01))
    (=>
      (<= 0 k@52@01)
      (and
        (<= 0 k@52@01)
        (or
          (< k@52@01 (Seq_length ar@49@01))
          (not (< k@52@01 (Seq_length ar@49@01))))))
    (or (<= 0 k@52@01) (not (<= 0 k@52@01))))))
(assert (or (< j@51@01 (Seq_length ar@49@01)) (not (< j@51@01 (Seq_length ar@49@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@51@01)
  (and
    (<= 0 j@51@01)
    (=>
      (< j@51@01 (Seq_length ar@49@01))
      (and
        (< j@51@01 (Seq_length ar@49@01))
        (=>
          (<= 0 k@52@01)
          (and
            (<= 0 k@52@01)
            (or
              (< k@52@01 (Seq_length ar@49@01))
              (not (< k@52@01 (Seq_length ar@49@01))))))
        (or (<= 0 k@52@01) (not (<= 0 k@52@01)))))
    (or
      (< j@51@01 (Seq_length ar@49@01))
      (not (< j@51@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 j@51@01) (not (<= 0 j@51@01))))
(push) ; 3
; [then-branch: 17 | 0 <= j@51@01 && j@51@01 < |ar@49@01| && 0 <= k@52@01 && k@52@01 < |ar@49@01| && j@51@01 != k@52@01 | live]
; [else-branch: 17 | !(0 <= j@51@01 && j@51@01 < |ar@49@01| && 0 <= k@52@01 && k@52@01 < |ar@49@01| && j@51@01 != k@52@01) | live]
(push) ; 4
; [then-branch: 17 | 0 <= j@51@01 && j@51@01 < |ar@49@01| && 0 <= k@52@01 && k@52@01 < |ar@49@01| && j@51@01 != k@52@01]
(assert (and
  (<= 0 j@51@01)
  (and
    (< j@51@01 (Seq_length ar@49@01))
    (and
      (<= 0 k@52@01)
      (and (< k@52@01 (Seq_length ar@49@01)) (not (= j@51@01 k@52@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 5
(assert (not (>= j@51@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@52@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 17 | !(0 <= j@51@01 && j@51@01 < |ar@49@01| && 0 <= k@52@01 && k@52@01 < |ar@49@01| && j@51@01 != k@52@01)]
(assert (not
  (and
    (<= 0 j@51@01)
    (and
      (< j@51@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@52@01)
        (and (< k@52@01 (Seq_length ar@49@01)) (not (= j@51@01 k@52@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@51@01)
    (and
      (< j@51@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@52@01)
        (and (< k@52@01 (Seq_length ar@49@01)) (not (= j@51@01 k@52@01))))))
  (and
    (<= 0 j@51@01)
    (< j@51@01 (Seq_length ar@49@01))
    (<= 0 k@52@01)
    (< k@52@01 (Seq_length ar@49@01))
    (not (= j@51@01 k@52@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@51@01)
      (and
        (< j@51@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@52@01)
          (and (< k@52@01 (Seq_length ar@49@01)) (not (= j@51@01 k@52@01)))))))
  (and
    (<= 0 j@51@01)
    (and
      (< j@51@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@52@01)
        (and (< k@52@01 (Seq_length ar@49@01)) (not (= j@51@01 k@52@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@51@01 Int) (k@52@01 Int)) (!
  (and
    (=>
      (<= 0 j@51@01)
      (and
        (<= 0 j@51@01)
        (=>
          (< j@51@01 (Seq_length ar@49@01))
          (and
            (< j@51@01 (Seq_length ar@49@01))
            (=>
              (<= 0 k@52@01)
              (and
                (<= 0 k@52@01)
                (or
                  (< k@52@01 (Seq_length ar@49@01))
                  (not (< k@52@01 (Seq_length ar@49@01))))))
            (or (<= 0 k@52@01) (not (<= 0 k@52@01)))))
        (or
          (< j@51@01 (Seq_length ar@49@01))
          (not (< j@51@01 (Seq_length ar@49@01))))))
    (or (<= 0 j@51@01) (not (<= 0 j@51@01)))
    (=>
      (and
        (<= 0 j@51@01)
        (and
          (< j@51@01 (Seq_length ar@49@01))
          (and
            (<= 0 k@52@01)
            (and (< k@52@01 (Seq_length ar@49@01)) (not (= j@51@01 k@52@01))))))
      (and
        (<= 0 j@51@01)
        (< j@51@01 (Seq_length ar@49@01))
        (<= 0 k@52@01)
        (< k@52@01 (Seq_length ar@49@01))
        (not (= j@51@01 k@52@01))))
    (or
      (not
        (and
          (<= 0 j@51@01)
          (and
            (< j@51@01 (Seq_length ar@49@01))
            (and
              (<= 0 k@52@01)
              (and (< k@52@01 (Seq_length ar@49@01)) (not (= j@51@01 k@52@01)))))))
      (and
        (<= 0 j@51@01)
        (and
          (< j@51@01 (Seq_length ar@49@01))
          (and
            (<= 0 k@52@01)
            (and (< k@52@01 (Seq_length ar@49@01)) (not (= j@51@01 k@52@01))))))))
  :pattern ((Seq_index ar@49@01 j@51@01) (Seq_index ar@49@01 k@52@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@102@12@102@106-aux|)))
(assert (forall ((j@51@01 Int) (k@52@01 Int)) (!
  (=>
    (and
      (<= 0 j@51@01)
      (and
        (< j@51@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@52@01)
          (and (< k@52@01 (Seq_length ar@49@01)) (not (= j@51@01 k@52@01))))))
    (not (= (Seq_index ar@49@01 j@51@01) (Seq_index ar@49@01 k@52@01))))
  :pattern ((Seq_index ar@49@01 j@51@01) (Seq_index ar@49@01 k@52@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@102@12@102@106|)))
(declare-const k@53@01 Int)
(push) ; 2
; [eval] 0 <= k && k < N
; [eval] 0 <= k
(push) ; 3
; [then-branch: 18 | !(0 <= k@53@01) | live]
; [else-branch: 18 | 0 <= k@53@01 | live]
(push) ; 4
; [then-branch: 18 | !(0 <= k@53@01)]
(assert (not (<= 0 k@53@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 18 | 0 <= k@53@01]
(assert (<= 0 k@53@01))
; [eval] k < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@53@01) (not (<= 0 k@53@01))))
(assert (and (<= 0 k@53@01) (< k@53@01 N@48@01)))
; [eval] ar[k]
(push) ; 3
(assert (not (>= k@53@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@53@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@54@01 ($Ref) Int)
(declare-fun img@55@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@53@01 Int)) (!
  (=>
    (and (<= 0 k@53@01) (< k@53@01 N@48@01))
    (or (<= 0 k@53@01) (not (<= 0 k@53@01))))
  :pattern ((Seq_index ar@49@01 k@53@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@53@01 Int) (k2@53@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@53@01) (< k1@53@01 N@48@01))
      (and (<= 0 k2@53@01) (< k2@53@01 N@48@01))
      (= (Seq_index ar@49@01 k1@53@01) (Seq_index ar@49@01 k2@53@01)))
    (= k1@53@01 k2@53@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@53@01 Int)) (!
  (=>
    (and (<= 0 k@53@01) (< k@53@01 N@48@01))
    (and
      (= (inv@54@01 (Seq_index ar@49@01 k@53@01)) k@53@01)
      (img@55@01 (Seq_index ar@49@01 k@53@01))))
  :pattern ((Seq_index ar@49@01 k@53@01))
  :qid |quant-u-57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
    (= (Seq_index ar@49@01 (inv@54@01 r)) r))
  :pattern ((inv@54@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@53@01 Int)) (!
  (=>
    (and (<= 0 k@53@01) (< k@53@01 N@48@01))
    (not (= (Seq_index ar@49@01 k@53@01) $Ref.null)))
  :pattern ((Seq_index ar@49@01 k@53@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 ($Snap.combine ($Snap.first $t@56@01) ($Snap.second $t@56@01))))
(assert (= ($Snap.first $t@56@01) $Snap.unit))
; [eval] N > 0
(assert (=
  ($Snap.second $t@56@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@56@01))
    ($Snap.second ($Snap.second $t@56@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@56@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@56@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@56@01))))))
(declare-const k@57@01 Int)
(push) ; 3
; [eval] 0 <= k && k < N
; [eval] 0 <= k
(push) ; 4
; [then-branch: 19 | !(0 <= k@57@01) | live]
; [else-branch: 19 | 0 <= k@57@01 | live]
(push) ; 5
; [then-branch: 19 | !(0 <= k@57@01)]
(assert (not (<= 0 k@57@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | 0 <= k@57@01]
(assert (<= 0 k@57@01))
; [eval] k < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@57@01) (not (<= 0 k@57@01))))
(assert (and (<= 0 k@57@01) (< k@57@01 N@48@01)))
; [eval] ar[k]
(push) ; 4
(assert (not (>= k@57@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@57@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@58@01 ($Ref) Int)
(declare-fun img@59@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@57@01 Int)) (!
  (=>
    (and (<= 0 k@57@01) (< k@57@01 N@48@01))
    (or (<= 0 k@57@01) (not (<= 0 k@57@01))))
  :pattern ((Seq_index ar@49@01 k@57@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@57@01 Int) (k2@57@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@57@01) (< k1@57@01 N@48@01))
      (and (<= 0 k2@57@01) (< k2@57@01 N@48@01))
      (= (Seq_index ar@49@01 k1@57@01) (Seq_index ar@49@01 k2@57@01)))
    (= k1@57@01 k2@57@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@57@01 Int)) (!
  (=>
    (and (<= 0 k@57@01) (< k@57@01 N@48@01))
    (and
      (= (inv@58@01 (Seq_index ar@49@01 k@57@01)) k@57@01)
      (img@59@01 (Seq_index ar@49@01 k@57@01))))
  :pattern ((Seq_index ar@49@01 k@57@01))
  :qid |quant-u-59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@59@01 r) (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) N@48@01)))
    (= (Seq_index ar@49@01 (inv@58@01 r)) r))
  :pattern ((inv@58@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@57@01 Int)) (!
  (=>
    (and (<= 0 k@57@01) (< k@57@01 N@48@01))
    (not (= (Seq_index ar@49@01 k@57@01) $Ref.null)))
  :pattern ((Seq_index ar@49@01 k@57@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@56@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@56@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@56@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@56@01))))
  $Snap.unit))
; [eval] (forall k: Int :: { old(ar[k]) } 0 <= k && k < N ==> ar[k].Ref__Integer_value == old(ar[k].Ref__Integer_value))
(declare-const k@60@01 Int)
(push) ; 3
; [eval] 0 <= k && k < N ==> ar[k].Ref__Integer_value == old(ar[k].Ref__Integer_value)
; [eval] 0 <= k && k < N
; [eval] 0 <= k
(push) ; 4
; [then-branch: 20 | !(0 <= k@60@01) | live]
; [else-branch: 20 | 0 <= k@60@01 | live]
(push) ; 5
; [then-branch: 20 | !(0 <= k@60@01)]
(assert (not (<= 0 k@60@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | 0 <= k@60@01]
(assert (<= 0 k@60@01))
; [eval] k < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@60@01) (not (<= 0 k@60@01))))
(push) ; 4
; [then-branch: 21 | 0 <= k@60@01 && k@60@01 < N@48@01 | live]
; [else-branch: 21 | !(0 <= k@60@01 && k@60@01 < N@48@01) | live]
(push) ; 5
; [then-branch: 21 | 0 <= k@60@01 && k@60@01 < N@48@01]
(assert (and (<= 0 k@60@01) (< k@60@01 N@48@01)))
; [eval] ar[k].Ref__Integer_value == old(ar[k].Ref__Integer_value)
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@60@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@60@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@59@01 (Seq_index ar@49@01 k@60@01))
  (and
    (<= 0 (inv@58@01 (Seq_index ar@49@01 k@60@01)))
    (< (inv@58@01 (Seq_index ar@49@01 k@60@01)) N@48@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(ar[k].Ref__Integer_value)
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@60@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@60@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@55@01 (Seq_index ar@49@01 k@60@01))
  (and
    (<= 0 (inv@54@01 (Seq_index ar@49@01 k@60@01)))
    (< (inv@54@01 (Seq_index ar@49@01 k@60@01)) N@48@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 21 | !(0 <= k@60@01 && k@60@01 < N@48@01)]
(assert (not (and (<= 0 k@60@01) (< k@60@01 N@48@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 k@60@01) (< k@60@01 N@48@01)))
  (and (<= 0 k@60@01) (< k@60@01 N@48@01))))
; [eval] old(ar[k])
; [eval] ar[k]
(push) ; 4
(assert (not (>= k@60@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@60@01 Int)) (!
  (and
    (or (<= 0 k@60@01) (not (<= 0 k@60@01)))
    (or
      (not (and (<= 0 k@60@01) (< k@60@01 N@48@01)))
      (and (<= 0 k@60@01) (< k@60@01 N@48@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@107@12@107@112-aux|)))
(assert (forall ((k@60@01 Int)) (!
  (=>
    (and (<= 0 k@60@01) (< k@60@01 N@48@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@56@01)))) (Seq_index
        ar@49@01
        k@60@01))
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) (Seq_index
        ar@49@01
        k@60@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@107@12@107@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@56@01))))
  $Snap.unit))
; [eval] diz.Ref__res == sum_array(0, 0, N, ar)
; [eval] sum_array(0, 0, N, ar)
(push) ; 3
; [eval] 0 <= lo
; [eval] lo <= i
; [eval] i <= hi
(push) ; 4
(assert (not (<= 0 N@48@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@48@01))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall j: Int, k: Int ::0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@61@01 Int)
(declare-const k@62@01 Int)
(push) ; 4
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 22 | !(0 <= j@61@01) | live]
; [else-branch: 22 | 0 <= j@61@01 | live]
(push) ; 6
; [then-branch: 22 | !(0 <= j@61@01)]
(assert (not (<= 0 j@61@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | 0 <= j@61@01]
(assert (<= 0 j@61@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 7
; [then-branch: 23 | !(j@61@01 < |ar@49@01|) | live]
; [else-branch: 23 | j@61@01 < |ar@49@01| | live]
(push) ; 8
; [then-branch: 23 | !(j@61@01 < |ar@49@01|)]
(assert (not (< j@61@01 (Seq_length ar@49@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 23 | j@61@01 < |ar@49@01|]
(assert (< j@61@01 (Seq_length ar@49@01)))
; [eval] 0 <= k
(push) ; 9
; [then-branch: 24 | !(0 <= k@62@01) | live]
; [else-branch: 24 | 0 <= k@62@01 | live]
(push) ; 10
; [then-branch: 24 | !(0 <= k@62@01)]
(assert (not (<= 0 k@62@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 24 | 0 <= k@62@01]
(assert (<= 0 k@62@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 11
; [then-branch: 25 | !(k@62@01 < |ar@49@01|) | live]
; [else-branch: 25 | k@62@01 < |ar@49@01| | live]
(push) ; 12
; [then-branch: 25 | !(k@62@01 < |ar@49@01|)]
(assert (not (< k@62@01 (Seq_length ar@49@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 25 | k@62@01 < |ar@49@01|]
(assert (< k@62@01 (Seq_length ar@49@01)))
; [eval] j != k
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< k@62@01 (Seq_length ar@49@01)) (not (< k@62@01 (Seq_length ar@49@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@62@01)
  (and
    (<= 0 k@62@01)
    (or
      (< k@62@01 (Seq_length ar@49@01))
      (not (< k@62@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 k@62@01) (not (<= 0 k@62@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@61@01 (Seq_length ar@49@01))
  (and
    (< j@61@01 (Seq_length ar@49@01))
    (=>
      (<= 0 k@62@01)
      (and
        (<= 0 k@62@01)
        (or
          (< k@62@01 (Seq_length ar@49@01))
          (not (< k@62@01 (Seq_length ar@49@01))))))
    (or (<= 0 k@62@01) (not (<= 0 k@62@01))))))
(assert (or (< j@61@01 (Seq_length ar@49@01)) (not (< j@61@01 (Seq_length ar@49@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@61@01)
  (and
    (<= 0 j@61@01)
    (=>
      (< j@61@01 (Seq_length ar@49@01))
      (and
        (< j@61@01 (Seq_length ar@49@01))
        (=>
          (<= 0 k@62@01)
          (and
            (<= 0 k@62@01)
            (or
              (< k@62@01 (Seq_length ar@49@01))
              (not (< k@62@01 (Seq_length ar@49@01))))))
        (or (<= 0 k@62@01) (not (<= 0 k@62@01)))))
    (or
      (< j@61@01 (Seq_length ar@49@01))
      (not (< j@61@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 j@61@01) (not (<= 0 j@61@01))))
(push) ; 5
; [then-branch: 26 | 0 <= j@61@01 && j@61@01 < |ar@49@01| && 0 <= k@62@01 && k@62@01 < |ar@49@01| && j@61@01 != k@62@01 | live]
; [else-branch: 26 | !(0 <= j@61@01 && j@61@01 < |ar@49@01| && 0 <= k@62@01 && k@62@01 < |ar@49@01| && j@61@01 != k@62@01) | live]
(push) ; 6
; [then-branch: 26 | 0 <= j@61@01 && j@61@01 < |ar@49@01| && 0 <= k@62@01 && k@62@01 < |ar@49@01| && j@61@01 != k@62@01]
(assert (and
  (<= 0 j@61@01)
  (and
    (< j@61@01 (Seq_length ar@49@01))
    (and
      (<= 0 k@62@01)
      (and (< k@62@01 (Seq_length ar@49@01)) (not (= j@61@01 k@62@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 7
(assert (not (>= j@61@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 7
(assert (not (>= k@62@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 26 | !(0 <= j@61@01 && j@61@01 < |ar@49@01| && 0 <= k@62@01 && k@62@01 < |ar@49@01| && j@61@01 != k@62@01)]
(assert (not
  (and
    (<= 0 j@61@01)
    (and
      (< j@61@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@62@01)
        (and (< k@62@01 (Seq_length ar@49@01)) (not (= j@61@01 k@62@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@61@01)
    (and
      (< j@61@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@62@01)
        (and (< k@62@01 (Seq_length ar@49@01)) (not (= j@61@01 k@62@01))))))
  (and
    (<= 0 j@61@01)
    (< j@61@01 (Seq_length ar@49@01))
    (<= 0 k@62@01)
    (< k@62@01 (Seq_length ar@49@01))
    (not (= j@61@01 k@62@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@61@01)
      (and
        (< j@61@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@62@01)
          (and (< k@62@01 (Seq_length ar@49@01)) (not (= j@61@01 k@62@01)))))))
  (and
    (<= 0 j@61@01)
    (and
      (< j@61@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@62@01)
        (and (< k@62@01 (Seq_length ar@49@01)) (not (= j@61@01 k@62@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((j@61@01 Int) (k@62@01 Int)) (!
  (=>
    (and
      (<= 0 j@61@01)
      (and
        (< j@61@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@62@01)
          (and (< k@62@01 (Seq_length ar@49@01)) (not (= j@61@01 k@62@01))))))
    (not (= (Seq_index ar@49@01 j@61@01) (Seq_index ar@49@01 k@62@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@61@01 Int) (k@62@01 Int)) (!
  (=>
    (and
      (<= 0 j@61@01)
      (and
        (< j@61@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@62@01)
          (and (< k@62@01 (Seq_length ar@49@01)) (not (= j@61@01 k@62@01))))))
    (not (= (Seq_index ar@49@01 j@61@01) (Seq_index ar@49@01 k@62@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|)))
(declare-const k@63@01 Int)
(push) ; 4
; [eval] lo <= k && k < hi
; [eval] lo <= k
(push) ; 5
; [then-branch: 27 | !(0 <= k@63@01) | live]
; [else-branch: 27 | 0 <= k@63@01 | live]
(push) ; 6
; [then-branch: 27 | !(0 <= k@63@01)]
(assert (not (<= 0 k@63@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | 0 <= k@63@01]
(assert (<= 0 k@63@01))
; [eval] k < hi
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@63@01) (not (<= 0 k@63@01))))
(assert (and (<= 0 k@63@01) (< k@63@01 N@48@01)))
(declare-const $k@64@01 $Perm)
(assert ($Perm.isReadVar $k@64@01))
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@63@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@63@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@65@01 ($Ref) Int)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@64@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@63@01 Int)) (!
  (=>
    (and (<= 0 k@63@01) (< k@63@01 N@48@01))
    (or (<= 0 k@63@01) (not (<= 0 k@63@01))))
  :pattern ((Seq_index ar@49@01 k@63@01))
  :qid |Ref__Integer_value-aux|)))
(push) ; 4
(assert (not (forall ((k@63@01 Int)) (!
  (=>
    (and (<= 0 k@63@01) (< k@63@01 N@48@01))
    (or (= $k@64@01 $Perm.No) (< $Perm.No $k@64@01)))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@63@01 Int) (k2@63@01 Int)) (!
  (=>
    (and
      (and (and (<= 0 k1@63@01) (< k1@63@01 N@48@01)) (< $Perm.No $k@64@01))
      (and (and (<= 0 k2@63@01) (< k2@63@01 N@48@01)) (< $Perm.No $k@64@01))
      (= (Seq_index ar@49@01 k1@63@01) (Seq_index ar@49@01 k2@63@01)))
    (= k1@63@01 k2@63@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@63@01 Int)) (!
  (=>
    (and (and (<= 0 k@63@01) (< k@63@01 N@48@01)) (< $Perm.No $k@64@01))
    (and
      (= (inv@65@01 (Seq_index ar@49@01 k@63@01)) k@63@01)
      (img@66@01 (Seq_index ar@49@01 k@63@01))))
  :pattern ((Seq_index ar@49@01 k@63@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@01 r)
      (and
        (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
        (< $Perm.No $k@64@01)))
    (= (Seq_index ar@49@01 (inv@65@01 r)) r))
  :pattern ((inv@65@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@67@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
      (img@66@01 r)
      (= r (Seq_index ar@49@01 (inv@65@01 r))))
    ($Perm.min
      (ite
        (and (img@59@01 r) (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) N@48@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $k@64@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@64@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@59@01 r)
            (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) N@48@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@59@01 r) (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) N@48@01)))
      (<
        (ite
          (and
            (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
            (img@66@01 r)
            (= r (Seq_index ar@49@01 (inv@65@01 r))))
          $k@64@01
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      (<
        (ite
          (and
            (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
            (img@66@01 r)
            (= r (Seq_index ar@49@01 (inv@65@01 r))))
          $k@64@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@59@01 r))
  :pattern ((inv@58@01 r))
  :pattern ((img@66@01 r))
  :pattern ((Seq_index ar@49@01 (inv@65@01 r)))
  :qid |qp.srp3|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
      (img@66@01 r)
      (= r (Seq_index ar@49@01 (inv@65@01 r))))
    (= (- $k@64@01 (pTaken@67@01 r)) $Perm.No))
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@68@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
        (< $Perm.No $k@64@01)
        (img@66@01 r)))
    (=>
      (and
        (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
        (< $Perm.No $k@64@01)
        (img@66@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
        (< $Perm.No $k@64@01)
        (img@66@01 r))
      (and (img@59@01 r) (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) N@48@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@56@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@56@01)))) r))
  :qid |qp.fvfValDef4|)))
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
          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@68@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@64@01))
(assert (forall ((k@63@01 Int)) (!
  (=>
    (and (and (<= 0 k@63@01) (< k@63@01 N@48@01)) (< $Perm.No $k@64@01))
    (and
      (= (inv@65@01 (Seq_index ar@49@01 k@63@01)) k@63@01)
      (img@66@01 (Seq_index ar@49@01 k@63@01))))
  :pattern ((Seq_index ar@49@01 k@63@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@01 r)
      (and
        (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
        (< $Perm.No $k@64@01)))
    (= (Seq_index ar@49@01 (inv@65@01 r)) r))
  :pattern ((inv@65@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
        (< $Perm.No $k@64@01)
        (img@66@01 r)))
    (=>
      (and
        (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
        (< $Perm.No $k@64@01)
        (img@66@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
        (< $Perm.No $k@64@01)
        (img@66@01 r))
      (and (img@59@01 r) (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) N@48@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@56@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@68@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@56@01)))) r))
  :qid |qp.fvfValDef4|)))
(assert (and
  (<= 0 N@48@01)
  (forall ((j@61@01 Int) (k@62@01 Int)) (!
    (=>
      (and
        (<= 0 j@61@01)
        (and
          (< j@61@01 (Seq_length ar@49@01))
          (and
            (<= 0 k@62@01)
            (and (< k@62@01 (Seq_length ar@49@01)) (not (= j@61@01 k@62@01))))))
      (not (= (Seq_index ar@49@01 j@61@01) (Seq_index ar@49@01 k@62@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|))
  (forall ((k@63@01 Int)) (!
    (=>
      (and (<= 0 k@63@01) (< k@63@01 N@48@01))
      (or (<= 0 k@63@01) (not (<= 0 k@63@01))))
    :pattern ((Seq_index ar@49@01 k@63@01))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@59@01 r)
              (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) N@48@01)))
            (/ (to_real 1) (to_real 2))
            $Perm.No)
          $Perm.No))
      (ite
        (and (img@59@01 r) (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) N@48@01)))
        (<
          (ite
            (and
              (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
              (img@66@01 r)
              (= r (Seq_index ar@49@01 (inv@65@01 r))))
            $k@64@01
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        (<
          (ite
            (and
              (and (<= 0 (inv@65@01 r)) (< (inv@65@01 r) N@48@01))
              (img@66@01 r)
              (= r (Seq_index ar@49@01 (inv@65@01 r))))
            $k@64@01
            $Perm.No)
          $Perm.No)))
    :pattern ((img@59@01 r))
    :pattern ((inv@58@01 r))
    :pattern ((img@66@01 r))
    :pattern ((Seq_index ar@49@01 (inv@65@01 r)))
    :qid |qp.srp3|))
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
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@68@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@56@01)))
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
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@68@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@69@01 Int)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@70@01 Int)
; [exec]
; __flatten_1 := 0
; [exec]
; __flatten_5 := __flatten_1
; [exec]
; diz.Ref__res := __flatten_5
; [exec]
; Ref__loop_main_29(diz, current_thread_id, ar, N)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] N > 0
; [eval] N <= |ar|
; [eval] |ar|
; [eval] (forall j: Int, k: Int :: { ar[j], ar[k] } 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@71@01 Int)
(declare-const k@72@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 28 | !(0 <= j@71@01) | live]
; [else-branch: 28 | 0 <= j@71@01 | live]
(push) ; 5
; [then-branch: 28 | !(0 <= j@71@01)]
(assert (not (<= 0 j@71@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 28 | 0 <= j@71@01]
(assert (<= 0 j@71@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 6
; [then-branch: 29 | !(j@71@01 < |ar@49@01|) | live]
; [else-branch: 29 | j@71@01 < |ar@49@01| | live]
(push) ; 7
; [then-branch: 29 | !(j@71@01 < |ar@49@01|)]
(assert (not (< j@71@01 (Seq_length ar@49@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 29 | j@71@01 < |ar@49@01|]
(assert (< j@71@01 (Seq_length ar@49@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 30 | !(0 <= k@72@01) | live]
; [else-branch: 30 | 0 <= k@72@01 | live]
(push) ; 9
; [then-branch: 30 | !(0 <= k@72@01)]
(assert (not (<= 0 k@72@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 30 | 0 <= k@72@01]
(assert (<= 0 k@72@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 10
; [then-branch: 31 | !(k@72@01 < |ar@49@01|) | live]
; [else-branch: 31 | k@72@01 < |ar@49@01| | live]
(push) ; 11
; [then-branch: 31 | !(k@72@01 < |ar@49@01|)]
(assert (not (< k@72@01 (Seq_length ar@49@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 31 | k@72@01 < |ar@49@01|]
(assert (< k@72@01 (Seq_length ar@49@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@72@01 (Seq_length ar@49@01)) (not (< k@72@01 (Seq_length ar@49@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@72@01)
  (and
    (<= 0 k@72@01)
    (or
      (< k@72@01 (Seq_length ar@49@01))
      (not (< k@72@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 k@72@01) (not (<= 0 k@72@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@71@01 (Seq_length ar@49@01))
  (and
    (< j@71@01 (Seq_length ar@49@01))
    (=>
      (<= 0 k@72@01)
      (and
        (<= 0 k@72@01)
        (or
          (< k@72@01 (Seq_length ar@49@01))
          (not (< k@72@01 (Seq_length ar@49@01))))))
    (or (<= 0 k@72@01) (not (<= 0 k@72@01))))))
(assert (or (< j@71@01 (Seq_length ar@49@01)) (not (< j@71@01 (Seq_length ar@49@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@71@01)
  (and
    (<= 0 j@71@01)
    (=>
      (< j@71@01 (Seq_length ar@49@01))
      (and
        (< j@71@01 (Seq_length ar@49@01))
        (=>
          (<= 0 k@72@01)
          (and
            (<= 0 k@72@01)
            (or
              (< k@72@01 (Seq_length ar@49@01))
              (not (< k@72@01 (Seq_length ar@49@01))))))
        (or (<= 0 k@72@01) (not (<= 0 k@72@01)))))
    (or
      (< j@71@01 (Seq_length ar@49@01))
      (not (< j@71@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 j@71@01) (not (<= 0 j@71@01))))
(push) ; 4
; [then-branch: 32 | 0 <= j@71@01 && j@71@01 < |ar@49@01| && 0 <= k@72@01 && k@72@01 < |ar@49@01| && j@71@01 != k@72@01 | live]
; [else-branch: 32 | !(0 <= j@71@01 && j@71@01 < |ar@49@01| && 0 <= k@72@01 && k@72@01 < |ar@49@01| && j@71@01 != k@72@01) | live]
(push) ; 5
; [then-branch: 32 | 0 <= j@71@01 && j@71@01 < |ar@49@01| && 0 <= k@72@01 && k@72@01 < |ar@49@01| && j@71@01 != k@72@01]
(assert (and
  (<= 0 j@71@01)
  (and
    (< j@71@01 (Seq_length ar@49@01))
    (and
      (<= 0 k@72@01)
      (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 6
(assert (not (>= j@71@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@72@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 32 | !(0 <= j@71@01 && j@71@01 < |ar@49@01| && 0 <= k@72@01 && k@72@01 < |ar@49@01| && j@71@01 != k@72@01)]
(assert (not
  (and
    (<= 0 j@71@01)
    (and
      (< j@71@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@72@01)
        (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@71@01)
    (and
      (< j@71@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@72@01)
        (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01))))))
  (and
    (<= 0 j@71@01)
    (< j@71@01 (Seq_length ar@49@01))
    (<= 0 k@72@01)
    (< k@72@01 (Seq_length ar@49@01))
    (not (= j@71@01 k@72@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@71@01)
      (and
        (< j@71@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@72@01)
          (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01)))))))
  (and
    (<= 0 j@71@01)
    (and
      (< j@71@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@72@01)
        (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@71@01 Int) (k@72@01 Int)) (!
  (and
    (=>
      (<= 0 j@71@01)
      (and
        (<= 0 j@71@01)
        (=>
          (< j@71@01 (Seq_length ar@49@01))
          (and
            (< j@71@01 (Seq_length ar@49@01))
            (=>
              (<= 0 k@72@01)
              (and
                (<= 0 k@72@01)
                (or
                  (< k@72@01 (Seq_length ar@49@01))
                  (not (< k@72@01 (Seq_length ar@49@01))))))
            (or (<= 0 k@72@01) (not (<= 0 k@72@01)))))
        (or
          (< j@71@01 (Seq_length ar@49@01))
          (not (< j@71@01 (Seq_length ar@49@01))))))
    (or (<= 0 j@71@01) (not (<= 0 j@71@01)))
    (=>
      (and
        (<= 0 j@71@01)
        (and
          (< j@71@01 (Seq_length ar@49@01))
          (and
            (<= 0 k@72@01)
            (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01))))))
      (and
        (<= 0 j@71@01)
        (< j@71@01 (Seq_length ar@49@01))
        (<= 0 k@72@01)
        (< k@72@01 (Seq_length ar@49@01))
        (not (= j@71@01 k@72@01))))
    (or
      (not
        (and
          (<= 0 j@71@01)
          (and
            (< j@71@01 (Seq_length ar@49@01))
            (and
              (<= 0 k@72@01)
              (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01)))))))
      (and
        (<= 0 j@71@01)
        (and
          (< j@71@01 (Seq_length ar@49@01))
          (and
            (<= 0 k@72@01)
            (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01))))))))
  :pattern ((Seq_index ar@49@01 j@71@01) (Seq_index ar@49@01 k@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@66@12@66@106-aux|)))
(push) ; 3
(assert (not (forall ((j@71@01 Int) (k@72@01 Int)) (!
  (=>
    (and
      (<= 0 j@71@01)
      (and
        (< j@71@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@72@01)
          (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01))))))
    (not (= (Seq_index ar@49@01 j@71@01) (Seq_index ar@49@01 k@72@01))))
  :pattern ((Seq_index ar@49@01 j@71@01) (Seq_index ar@49@01 k@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@66@12@66@106|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@71@01 Int) (k@72@01 Int)) (!
  (=>
    (and
      (<= 0 j@71@01)
      (and
        (< j@71@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@72@01)
          (and (< k@72@01 (Seq_length ar@49@01)) (not (= j@71@01 k@72@01))))))
    (not (= (Seq_index ar@49@01 j@71@01) (Seq_index ar@49@01 k@72@01))))
  :pattern ((Seq_index ar@49@01 j@71@01) (Seq_index ar@49@01 k@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@66@12@66@106|)))
(declare-const i@73@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 33 | !(0 <= i@73@01) | live]
; [else-branch: 33 | 0 <= i@73@01 | live]
(push) ; 5
; [then-branch: 33 | !(0 <= i@73@01)]
(assert (not (<= 0 i@73@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | 0 <= i@73@01]
(assert (<= 0 i@73@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@73@01) (not (<= 0 i@73@01))))
(assert (and (<= 0 i@73@01) (< i@73@01 N@48@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@73@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@74@01 ($Ref) Int)
(declare-fun img@75@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and (<= 0 i@73@01) (< i@73@01 N@48@01))
    (or (<= 0 i@73@01) (not (<= 0 i@73@01))))
  :pattern ((Seq_index ar@49@01 i@73@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@73@01 Int) (i2@73@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@73@01) (< i1@73@01 N@48@01))
      (and (<= 0 i2@73@01) (< i2@73@01 N@48@01))
      (= (Seq_index ar@49@01 i1@73@01) (Seq_index ar@49@01 i2@73@01)))
    (= i1@73@01 i2@73@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and (<= 0 i@73@01) (< i@73@01 N@48@01))
    (and
      (= (inv@74@01 (Seq_index ar@49@01 i@73@01)) i@73@01)
      (img@75@01 (Seq_index ar@49@01 i@73@01))))
  :pattern ((Seq_index ar@49@01 i@73@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@75@01 r) (and (<= 0 (inv@74@01 r)) (< (inv@74@01 r) N@48@01)))
    (= (Seq_index ar@49@01 (inv@74@01 r)) r))
  :pattern ((inv@74@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@76@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@74@01 r)) (< (inv@74@01 r) N@48@01))
      (img@75@01 r)
      (= r (Seq_index ar@49@01 (inv@74@01 r))))
    ($Perm.min
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 4)))
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
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@76@01 r))
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
  (= (pTaken@76@01 r) $Perm.No)
  
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
      (and (<= 0 (inv@74@01 r)) (< (inv@74@01 r) N@48@01))
      (img@75@01 r)
      (= r (Seq_index ar@49@01 (inv@74@01 r))))
    (= (- (/ (to_real 1) (to_real 4)) (pTaken@76@01 r)) $Perm.No))
  
  :qid |quant-u-68|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@77@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@77@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@77@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r))
  :qid |qp.fvfValDef6|)))
(declare-const $t@78@01 $Snap)
(assert (= $t@78@01 ($Snap.combine ($Snap.first $t@78@01) ($Snap.second $t@78@01))))
(assert (= ($Snap.first $t@78@01) $Snap.unit))
; [eval] N > 0
(assert (=
  ($Snap.second $t@78@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@78@01))
    ($Snap.second ($Snap.second $t@78@01)))))
(declare-const i@79@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 34 | !(0 <= i@79@01) | live]
; [else-branch: 34 | 0 <= i@79@01 | live]
(push) ; 5
; [then-branch: 34 | !(0 <= i@79@01)]
(assert (not (<= 0 i@79@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 34 | 0 <= i@79@01]
(assert (<= 0 i@79@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@79@01) (not (<= 0 i@79@01))))
(assert (and (<= 0 i@79@01) (< i@79@01 N@48@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@79@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@79@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@80@01 ($Ref) Int)
(declare-fun img@81@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@79@01 Int)) (!
  (=>
    (and (<= 0 i@79@01) (< i@79@01 N@48@01))
    (or (<= 0 i@79@01) (not (<= 0 i@79@01))))
  :pattern ((Seq_index ar@49@01 i@79@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@79@01 Int) (i2@79@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@79@01) (< i1@79@01 N@48@01))
      (and (<= 0 i2@79@01) (< i2@79@01 N@48@01))
      (= (Seq_index ar@49@01 i1@79@01) (Seq_index ar@49@01 i2@79@01)))
    (= i1@79@01 i2@79@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@79@01 Int)) (!
  (=>
    (and (<= 0 i@79@01) (< i@79@01 N@48@01))
    (and
      (= (inv@80@01 (Seq_index ar@49@01 i@79@01)) i@79@01)
      (img@81@01 (Seq_index ar@49@01 i@79@01))))
  :pattern ((Seq_index ar@49@01 i@79@01))
  :qid |quant-u-70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
    (= (Seq_index ar@49@01 (inv@80@01 r)) r))
  :pattern ((inv@80@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@79@01 Int)) (!
  (=>
    (and (<= 0 i@79@01) (< i@79@01 N@48@01))
    (not (= (Seq_index ar@49@01 i@79@01) $Ref.null)))
  :pattern ((Seq_index ar@49@01 i@79@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ar@49@01 i@79@01) (Seq_index ar@49@01 k@53@01))
    (=
      (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
      (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))))
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@78@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@78@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@78@01))) $Snap.unit))
; [eval] diz.Ref__res == old(diz.Ref__res) + sum_array(0, 0, N, ar)
; [eval] old(diz.Ref__res) + sum_array(0, 0, N, ar)
; [eval] old(diz.Ref__res)
; [eval] sum_array(0, 0, N, ar)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= lo
; [eval] lo <= i
; [eval] i <= hi
(push) ; 4
(assert (not (<= 0 N@48@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@48@01))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall j: Int, k: Int ::0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@82@01 Int)
(declare-const k@83@01 Int)
(push) ; 4
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 35 | !(0 <= j@82@01) | live]
; [else-branch: 35 | 0 <= j@82@01 | live]
(push) ; 6
; [then-branch: 35 | !(0 <= j@82@01)]
(assert (not (<= 0 j@82@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 35 | 0 <= j@82@01]
(assert (<= 0 j@82@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 7
; [then-branch: 36 | !(j@82@01 < |ar@49@01|) | live]
; [else-branch: 36 | j@82@01 < |ar@49@01| | live]
(push) ; 8
; [then-branch: 36 | !(j@82@01 < |ar@49@01|)]
(assert (not (< j@82@01 (Seq_length ar@49@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 36 | j@82@01 < |ar@49@01|]
(assert (< j@82@01 (Seq_length ar@49@01)))
; [eval] 0 <= k
(push) ; 9
; [then-branch: 37 | !(0 <= k@83@01) | live]
; [else-branch: 37 | 0 <= k@83@01 | live]
(push) ; 10
; [then-branch: 37 | !(0 <= k@83@01)]
(assert (not (<= 0 k@83@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 37 | 0 <= k@83@01]
(assert (<= 0 k@83@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 11
; [then-branch: 38 | !(k@83@01 < |ar@49@01|) | live]
; [else-branch: 38 | k@83@01 < |ar@49@01| | live]
(push) ; 12
; [then-branch: 38 | !(k@83@01 < |ar@49@01|)]
(assert (not (< k@83@01 (Seq_length ar@49@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 38 | k@83@01 < |ar@49@01|]
(assert (< k@83@01 (Seq_length ar@49@01)))
; [eval] j != k
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< k@83@01 (Seq_length ar@49@01)) (not (< k@83@01 (Seq_length ar@49@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@83@01)
  (and
    (<= 0 k@83@01)
    (or
      (< k@83@01 (Seq_length ar@49@01))
      (not (< k@83@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 k@83@01) (not (<= 0 k@83@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@82@01 (Seq_length ar@49@01))
  (and
    (< j@82@01 (Seq_length ar@49@01))
    (=>
      (<= 0 k@83@01)
      (and
        (<= 0 k@83@01)
        (or
          (< k@83@01 (Seq_length ar@49@01))
          (not (< k@83@01 (Seq_length ar@49@01))))))
    (or (<= 0 k@83@01) (not (<= 0 k@83@01))))))
(assert (or (< j@82@01 (Seq_length ar@49@01)) (not (< j@82@01 (Seq_length ar@49@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@82@01)
  (and
    (<= 0 j@82@01)
    (=>
      (< j@82@01 (Seq_length ar@49@01))
      (and
        (< j@82@01 (Seq_length ar@49@01))
        (=>
          (<= 0 k@83@01)
          (and
            (<= 0 k@83@01)
            (or
              (< k@83@01 (Seq_length ar@49@01))
              (not (< k@83@01 (Seq_length ar@49@01))))))
        (or (<= 0 k@83@01) (not (<= 0 k@83@01)))))
    (or
      (< j@82@01 (Seq_length ar@49@01))
      (not (< j@82@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 j@82@01) (not (<= 0 j@82@01))))
(push) ; 5
; [then-branch: 39 | 0 <= j@82@01 && j@82@01 < |ar@49@01| && 0 <= k@83@01 && k@83@01 < |ar@49@01| && j@82@01 != k@83@01 | live]
; [else-branch: 39 | !(0 <= j@82@01 && j@82@01 < |ar@49@01| && 0 <= k@83@01 && k@83@01 < |ar@49@01| && j@82@01 != k@83@01) | live]
(push) ; 6
; [then-branch: 39 | 0 <= j@82@01 && j@82@01 < |ar@49@01| && 0 <= k@83@01 && k@83@01 < |ar@49@01| && j@82@01 != k@83@01]
(assert (and
  (<= 0 j@82@01)
  (and
    (< j@82@01 (Seq_length ar@49@01))
    (and
      (<= 0 k@83@01)
      (and (< k@83@01 (Seq_length ar@49@01)) (not (= j@82@01 k@83@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 7
(assert (not (>= j@82@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 7
(assert (not (>= k@83@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 39 | !(0 <= j@82@01 && j@82@01 < |ar@49@01| && 0 <= k@83@01 && k@83@01 < |ar@49@01| && j@82@01 != k@83@01)]
(assert (not
  (and
    (<= 0 j@82@01)
    (and
      (< j@82@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@83@01)
        (and (< k@83@01 (Seq_length ar@49@01)) (not (= j@82@01 k@83@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@82@01)
    (and
      (< j@82@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@83@01)
        (and (< k@83@01 (Seq_length ar@49@01)) (not (= j@82@01 k@83@01))))))
  (and
    (<= 0 j@82@01)
    (< j@82@01 (Seq_length ar@49@01))
    (<= 0 k@83@01)
    (< k@83@01 (Seq_length ar@49@01))
    (not (= j@82@01 k@83@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@82@01)
      (and
        (< j@82@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@83@01)
          (and (< k@83@01 (Seq_length ar@49@01)) (not (= j@82@01 k@83@01)))))))
  (and
    (<= 0 j@82@01)
    (and
      (< j@82@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@83@01)
        (and (< k@83@01 (Seq_length ar@49@01)) (not (= j@82@01 k@83@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((j@82@01 Int) (k@83@01 Int)) (!
  (=>
    (and
      (<= 0 j@82@01)
      (and
        (< j@82@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@83@01)
          (and (< k@83@01 (Seq_length ar@49@01)) (not (= j@82@01 k@83@01))))))
    (not (= (Seq_index ar@49@01 j@82@01) (Seq_index ar@49@01 k@83@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@82@01 Int) (k@83@01 Int)) (!
  (=>
    (and
      (<= 0 j@82@01)
      (and
        (< j@82@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@83@01)
          (and (< k@83@01 (Seq_length ar@49@01)) (not (= j@82@01 k@83@01))))))
    (not (= (Seq_index ar@49@01 j@82@01) (Seq_index ar@49@01 k@83@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|)))
(declare-const k@84@01 Int)
(push) ; 4
; [eval] lo <= k && k < hi
; [eval] lo <= k
(push) ; 5
; [then-branch: 40 | !(0 <= k@84@01) | live]
; [else-branch: 40 | 0 <= k@84@01 | live]
(push) ; 6
; [then-branch: 40 | !(0 <= k@84@01)]
(assert (not (<= 0 k@84@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 40 | 0 <= k@84@01]
(assert (<= 0 k@84@01))
; [eval] k < hi
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@84@01) (not (<= 0 k@84@01))))
(assert (and (<= 0 k@84@01) (< k@84@01 N@48@01)))
(declare-const $k@85@01 $Perm)
(assert ($Perm.isReadVar $k@85@01))
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@84@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@84@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@86@01 ($Ref) Int)
(declare-fun img@87@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@85@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@84@01 Int)) (!
  (=>
    (and (<= 0 k@84@01) (< k@84@01 N@48@01))
    (or (<= 0 k@84@01) (not (<= 0 k@84@01))))
  :pattern ((Seq_index ar@49@01 k@84@01))
  :qid |Ref__Integer_value-aux|)))
(push) ; 4
(assert (not (forall ((k@84@01 Int)) (!
  (=>
    (and (<= 0 k@84@01) (< k@84@01 N@48@01))
    (or (= $k@85@01 $Perm.No) (< $Perm.No $k@85@01)))
  
  :qid |quant-u-72|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@84@01 Int) (k2@84@01 Int)) (!
  (=>
    (and
      (and (and (<= 0 k1@84@01) (< k1@84@01 N@48@01)) (< $Perm.No $k@85@01))
      (and (and (<= 0 k2@84@01) (< k2@84@01 N@48@01)) (< $Perm.No $k@85@01))
      (= (Seq_index ar@49@01 k1@84@01) (Seq_index ar@49@01 k2@84@01)))
    (= k1@84@01 k2@84@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@84@01 Int)) (!
  (=>
    (and (and (<= 0 k@84@01) (< k@84@01 N@48@01)) (< $Perm.No $k@85@01))
    (and
      (= (inv@86@01 (Seq_index ar@49@01 k@84@01)) k@84@01)
      (img@87@01 (Seq_index ar@49@01 k@84@01))))
  :pattern ((Seq_index ar@49@01 k@84@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@87@01 r)
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)))
    (= (Seq_index ar@49@01 (inv@86@01 r)) r))
  :pattern ((inv@86@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@88@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
      (img@87@01 r)
      (= r (Seq_index ar@49@01 (inv@86@01 r))))
    ($Perm.min
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r))
        $Perm.No)
      $k@85@01)
    $Perm.No))
(define-fun pTaken@89@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
      (img@87@01 r)
      (= r (Seq_index ar@49@01 (inv@86@01 r))))
    ($Perm.min
      (ite
        (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- $k@85@01 (pTaken@88@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@85@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@55@01 r)
            (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
          (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
      (<
        (ite
          (and
            (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
            (img@87@01 r)
            (= r (Seq_index ar@49@01 (inv@86@01 r))))
          $k@85@01
          $Perm.No)
        (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
      (<
        (ite
          (and
            (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
            (img@87@01 r)
            (= r (Seq_index ar@49@01 (inv@86@01 r))))
          $k@85@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@55@01 r))
  :pattern ((inv@54@01 r))
  :pattern ((img@87@01 r))
  :pattern ((Seq_index ar@49@01 (inv@86@01 r)))
  :qid |qp.srp7|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
      (img@87@01 r)
      (= r (Seq_index ar@49@01 (inv@86@01 r))))
    (= (- $k@85@01 (pTaken@88@01 r)) $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@90@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)
        (img@87@01 r)))
    (=>
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)
        (img@87@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef10|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)
        (img@87@01 r))
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)
        (img@87@01 r))
      (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r))
  :qid |qp.fvfValDef9|)))
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
          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@90@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@85@01))
(assert (forall ((k@84@01 Int)) (!
  (=>
    (and (and (<= 0 k@84@01) (< k@84@01 N@48@01)) (< $Perm.No $k@85@01))
    (and
      (= (inv@86@01 (Seq_index ar@49@01 k@84@01)) k@84@01)
      (img@87@01 (Seq_index ar@49@01 k@84@01))))
  :pattern ((Seq_index ar@49@01 k@84@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@87@01 r)
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)))
    (= (Seq_index ar@49@01 (inv@86@01 r)) r))
  :pattern ((inv@86@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)
        (img@87@01 r)))
    (=>
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)
        (img@87@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)
        (img@87@01 r))
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
        (< $Perm.No $k@85@01)
        (img@87@01 r))
      (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r))
  :qid |qp.fvfValDef9|)))
(assert (and
  (<= 0 N@48@01)
  (forall ((j@82@01 Int) (k@83@01 Int)) (!
    (=>
      (and
        (<= 0 j@82@01)
        (and
          (< j@82@01 (Seq_length ar@49@01))
          (and
            (<= 0 k@83@01)
            (and (< k@83@01 (Seq_length ar@49@01)) (not (= j@82@01 k@83@01))))))
      (not (= (Seq_index ar@49@01 j@82@01) (Seq_index ar@49@01 k@83@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|))
  (forall ((k@84@01 Int)) (!
    (=>
      (and (<= 0 k@84@01) (< k@84@01 N@48@01))
      (or (<= 0 k@84@01) (not (<= 0 k@84@01))))
    :pattern ((Seq_index ar@49@01 k@84@01))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@55@01 r)
              (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
            (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r))
            $Perm.No)
          $Perm.No))
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (<
          (ite
            (and
              (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
              (img@87@01 r)
              (= r (Seq_index ar@49@01 (inv@86@01 r))))
            $k@85@01
            $Perm.No)
          (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
        (<
          (ite
            (and
              (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@48@01))
              (img@87@01 r)
              (= r (Seq_index ar@49@01 (inv@86@01 r))))
            $k@85@01
            $Perm.No)
          $Perm.No)))
    :pattern ((img@55@01 r))
    :pattern ((inv@54@01 r))
    :pattern ((img@87@01 r))
    :pattern ((Seq_index ar@49@01 (inv@86@01 r)))
    :qid |qp.srp7|))
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
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@90@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@78@01))))
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
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@90@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] N > 0
(declare-const k@91@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < N
; [eval] 0 <= k
(push) ; 4
; [then-branch: 41 | !(0 <= k@91@01) | live]
; [else-branch: 41 | 0 <= k@91@01 | live]
(push) ; 5
; [then-branch: 41 | !(0 <= k@91@01)]
(assert (not (<= 0 k@91@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 41 | 0 <= k@91@01]
(assert (<= 0 k@91@01))
; [eval] k < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@91@01) (not (<= 0 k@91@01))))
(assert (and (<= 0 k@91@01) (< k@91@01 N@48@01)))
; [eval] ar[k]
(push) ; 4
(assert (not (>= k@91@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@91@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@92@01 ($Ref) Int)
(declare-fun img@93@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@91@01 Int)) (!
  (=>
    (and (<= 0 k@91@01) (< k@91@01 N@48@01))
    (or (<= 0 k@91@01) (not (<= 0 k@91@01))))
  :pattern ((Seq_index ar@49@01 k@91@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@91@01 Int) (k2@91@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@91@01) (< k1@91@01 N@48@01))
      (and (<= 0 k2@91@01) (< k2@91@01 N@48@01))
      (= (Seq_index ar@49@01 k1@91@01) (Seq_index ar@49@01 k2@91@01)))
    (= k1@91@01 k2@91@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@91@01 Int)) (!
  (=>
    (and (<= 0 k@91@01) (< k@91@01 N@48@01))
    (and
      (= (inv@92@01 (Seq_index ar@49@01 k@91@01)) k@91@01)
      (img@93@01 (Seq_index ar@49@01 k@91@01))))
  :pattern ((Seq_index ar@49@01 k@91@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@48@01)))
    (= (Seq_index ar@49@01 (inv@92@01 r)) r))
  :pattern ((inv@92@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@94@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@48@01))
      (img@93@01 r)
      (= r (Seq_index ar@49@01 (inv@92@01 r))))
    ($Perm.min
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@95@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@48@01))
      (img@93@01 r)
      (= r (Seq_index ar@49@01 (inv@92@01 r))))
    ($Perm.min
      (ite
        (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@94@01 r)))
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
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r))
        $Perm.No)
      (pTaken@94@01 r))
    $Perm.No)
  
  :qid |quant-u-78|))))
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
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@48@01))
      (img@93@01 r)
      (= r (Seq_index ar@49@01 (inv@92@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@94@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (pTaken@95@01 r))
    $Perm.No)
  
  :qid |quant-u-80|))))
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
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@48@01))
      (img@93@01 r)
      (= r (Seq_index ar@49@01 (inv@92@01 r))))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@94@01 r)) (pTaken@95@01 r))
      $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@96@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r))
  :qid |qp.fvfValDef12|)))
; [eval] (forall k: Int :: { old(ar[k]) } 0 <= k && k < N ==> ar[k].Ref__Integer_value == old(ar[k].Ref__Integer_value))
(declare-const k@97@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < N ==> ar[k].Ref__Integer_value == old(ar[k].Ref__Integer_value)
; [eval] 0 <= k && k < N
; [eval] 0 <= k
(push) ; 4
; [then-branch: 42 | !(0 <= k@97@01) | live]
; [else-branch: 42 | 0 <= k@97@01 | live]
(push) ; 5
; [then-branch: 42 | !(0 <= k@97@01)]
(assert (not (<= 0 k@97@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 42 | 0 <= k@97@01]
(assert (<= 0 k@97@01))
; [eval] k < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@97@01) (not (<= 0 k@97@01))))
(push) ; 4
; [then-branch: 43 | 0 <= k@97@01 && k@97@01 < N@48@01 | live]
; [else-branch: 43 | !(0 <= k@97@01 && k@97@01 < N@48@01) | live]
(push) ; 5
; [then-branch: 43 | 0 <= k@97@01 && k@97@01 < N@48@01]
(assert (and (<= 0 k@97@01) (< k@97@01 N@48@01)))
; [eval] ar[k].Ref__Integer_value == old(ar[k].Ref__Integer_value)
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@97@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@97@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r))
    :qid |qp.fvfValDef12|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@55@01 (Seq_index ar@49@01 k@97@01))
        (and
          (<= 0 (inv@54@01 (Seq_index ar@49@01 k@97@01)))
          (< (inv@54@01 (Seq_index ar@49@01 k@97@01)) N@48@01)))
      (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 (Seq_index ar@49@01 k@97@01)))
      $Perm.No)
    (ite
      (and
        (img@81@01 (Seq_index ar@49@01 k@97@01))
        (and
          (<= 0 (inv@80@01 (Seq_index ar@49@01 k@97@01)))
          (< (inv@80@01 (Seq_index ar@49@01 k@97@01)) N@48@01)))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(ar[k].Ref__Integer_value)
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@97@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@97@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@55@01 (Seq_index ar@49@01 k@97@01))
  (and
    (<= 0 (inv@54@01 (Seq_index ar@49@01 k@97@01)))
    (< (inv@54@01 (Seq_index ar@49@01 k@97@01)) N@48@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 43 | !(0 <= k@97@01 && k@97@01 < N@48@01)]
(assert (not (and (<= 0 k@97@01) (< k@97@01 N@48@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r))
  :qid |qp.fvfValDef12|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@97@01) (< k@97@01 N@48@01)))
  (and (<= 0 k@97@01) (< k@97@01 N@48@01))))
; [eval] old(ar[k])
; [eval] ar[k]
(push) ; 4
(assert (not (>= k@97@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r))
  :qid |qp.fvfValDef12|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@97@01 Int)) (!
  (and
    (or (<= 0 k@97@01) (not (<= 0 k@97@01)))
    (or
      (not (and (<= 0 k@97@01) (< k@97@01 N@48@01)))
      (and (<= 0 k@97@01) (< k@97@01 N@48@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@107@12@107@112-aux|)))
(push) ; 3
(assert (not (forall ((k@97@01 Int)) (!
  (=>
    (and (<= 0 k@97@01) (< k@97@01 N@48@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@49@01
        k@97@01))
      ($FVF.lookup_Ref__Integer_value (as sm@77@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@49@01
        k@97@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@107@12@107@112|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@97@01 Int)) (!
  (=>
    (and (<= 0 k@97@01) (< k@97@01 N@48@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@49@01
        k@97@01))
      ($FVF.lookup_Ref__Integer_value (as sm@77@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@49@01
        k@97@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@107@12@107@112|)))
; [eval] diz.Ref__res == sum_array(0, 0, N, ar)
; [eval] sum_array(0, 0, N, ar)
(push) ; 3
; [eval] 0 <= lo
; [eval] lo <= i
; [eval] i <= hi
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall j: Int, k: Int ::0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@98@01 Int)
(declare-const k@99@01 Int)
(push) ; 4
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 44 | !(0 <= j@98@01) | live]
; [else-branch: 44 | 0 <= j@98@01 | live]
(push) ; 6
; [then-branch: 44 | !(0 <= j@98@01)]
(assert (not (<= 0 j@98@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 44 | 0 <= j@98@01]
(assert (<= 0 j@98@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 7
; [then-branch: 45 | !(j@98@01 < |ar@49@01|) | live]
; [else-branch: 45 | j@98@01 < |ar@49@01| | live]
(push) ; 8
; [then-branch: 45 | !(j@98@01 < |ar@49@01|)]
(assert (not (< j@98@01 (Seq_length ar@49@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 45 | j@98@01 < |ar@49@01|]
(assert (< j@98@01 (Seq_length ar@49@01)))
; [eval] 0 <= k
(push) ; 9
; [then-branch: 46 | !(0 <= k@99@01) | live]
; [else-branch: 46 | 0 <= k@99@01 | live]
(push) ; 10
; [then-branch: 46 | !(0 <= k@99@01)]
(assert (not (<= 0 k@99@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 46 | 0 <= k@99@01]
(assert (<= 0 k@99@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 11
; [then-branch: 47 | !(k@99@01 < |ar@49@01|) | live]
; [else-branch: 47 | k@99@01 < |ar@49@01| | live]
(push) ; 12
; [then-branch: 47 | !(k@99@01 < |ar@49@01|)]
(assert (not (< k@99@01 (Seq_length ar@49@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 47 | k@99@01 < |ar@49@01|]
(assert (< k@99@01 (Seq_length ar@49@01)))
; [eval] j != k
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< k@99@01 (Seq_length ar@49@01)) (not (< k@99@01 (Seq_length ar@49@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@99@01)
  (and
    (<= 0 k@99@01)
    (or
      (< k@99@01 (Seq_length ar@49@01))
      (not (< k@99@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 k@99@01) (not (<= 0 k@99@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@98@01 (Seq_length ar@49@01))
  (and
    (< j@98@01 (Seq_length ar@49@01))
    (=>
      (<= 0 k@99@01)
      (and
        (<= 0 k@99@01)
        (or
          (< k@99@01 (Seq_length ar@49@01))
          (not (< k@99@01 (Seq_length ar@49@01))))))
    (or (<= 0 k@99@01) (not (<= 0 k@99@01))))))
(assert (or (< j@98@01 (Seq_length ar@49@01)) (not (< j@98@01 (Seq_length ar@49@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@98@01)
  (and
    (<= 0 j@98@01)
    (=>
      (< j@98@01 (Seq_length ar@49@01))
      (and
        (< j@98@01 (Seq_length ar@49@01))
        (=>
          (<= 0 k@99@01)
          (and
            (<= 0 k@99@01)
            (or
              (< k@99@01 (Seq_length ar@49@01))
              (not (< k@99@01 (Seq_length ar@49@01))))))
        (or (<= 0 k@99@01) (not (<= 0 k@99@01)))))
    (or
      (< j@98@01 (Seq_length ar@49@01))
      (not (< j@98@01 (Seq_length ar@49@01)))))))
(assert (or (<= 0 j@98@01) (not (<= 0 j@98@01))))
(push) ; 5
; [then-branch: 48 | 0 <= j@98@01 && j@98@01 < |ar@49@01| && 0 <= k@99@01 && k@99@01 < |ar@49@01| && j@98@01 != k@99@01 | live]
; [else-branch: 48 | !(0 <= j@98@01 && j@98@01 < |ar@49@01| && 0 <= k@99@01 && k@99@01 < |ar@49@01| && j@98@01 != k@99@01) | live]
(push) ; 6
; [then-branch: 48 | 0 <= j@98@01 && j@98@01 < |ar@49@01| && 0 <= k@99@01 && k@99@01 < |ar@49@01| && j@98@01 != k@99@01]
(assert (and
  (<= 0 j@98@01)
  (and
    (< j@98@01 (Seq_length ar@49@01))
    (and
      (<= 0 k@99@01)
      (and (< k@99@01 (Seq_length ar@49@01)) (not (= j@98@01 k@99@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 7
(assert (not (>= j@98@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 7
(assert (not (>= k@99@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 48 | !(0 <= j@98@01 && j@98@01 < |ar@49@01| && 0 <= k@99@01 && k@99@01 < |ar@49@01| && j@98@01 != k@99@01)]
(assert (not
  (and
    (<= 0 j@98@01)
    (and
      (< j@98@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@99@01)
        (and (< k@99@01 (Seq_length ar@49@01)) (not (= j@98@01 k@99@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@98@01)
    (and
      (< j@98@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@99@01)
        (and (< k@99@01 (Seq_length ar@49@01)) (not (= j@98@01 k@99@01))))))
  (and
    (<= 0 j@98@01)
    (< j@98@01 (Seq_length ar@49@01))
    (<= 0 k@99@01)
    (< k@99@01 (Seq_length ar@49@01))
    (not (= j@98@01 k@99@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@98@01)
      (and
        (< j@98@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@99@01)
          (and (< k@99@01 (Seq_length ar@49@01)) (not (= j@98@01 k@99@01)))))))
  (and
    (<= 0 j@98@01)
    (and
      (< j@98@01 (Seq_length ar@49@01))
      (and
        (<= 0 k@99@01)
        (and (< k@99@01 (Seq_length ar@49@01)) (not (= j@98@01 k@99@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((j@98@01 Int) (k@99@01 Int)) (!
  (=>
    (and
      (<= 0 j@98@01)
      (and
        (< j@98@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@99@01)
          (and (< k@99@01 (Seq_length ar@49@01)) (not (= j@98@01 k@99@01))))))
    (not (= (Seq_index ar@49@01 j@98@01) (Seq_index ar@49@01 k@99@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@98@01 Int) (k@99@01 Int)) (!
  (=>
    (and
      (<= 0 j@98@01)
      (and
        (< j@98@01 (Seq_length ar@49@01))
        (and
          (<= 0 k@99@01)
          (and (< k@99@01 (Seq_length ar@49@01)) (not (= j@98@01 k@99@01))))))
    (not (= (Seq_index ar@49@01 j@98@01) (Seq_index ar@49@01 k@99@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|)))
(declare-const k@100@01 Int)
(push) ; 4
; [eval] lo <= k && k < hi
; [eval] lo <= k
(push) ; 5
; [then-branch: 49 | !(0 <= k@100@01) | live]
; [else-branch: 49 | 0 <= k@100@01 | live]
(push) ; 6
; [then-branch: 49 | !(0 <= k@100@01)]
(assert (not (<= 0 k@100@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 49 | 0 <= k@100@01]
(assert (<= 0 k@100@01))
; [eval] k < hi
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@100@01) (not (<= 0 k@100@01))))
(assert (and (<= 0 k@100@01) (< k@100@01 N@48@01)))
(declare-const $k@101@01 $Perm)
(assert ($Perm.isReadVar $k@101@01))
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@100@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@100@01 (Seq_length ar@49@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@102@01 ($Ref) Int)
(declare-fun img@103@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@101@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@100@01 Int)) (!
  (=>
    (and (<= 0 k@100@01) (< k@100@01 N@48@01))
    (or (<= 0 k@100@01) (not (<= 0 k@100@01))))
  :pattern ((Seq_index ar@49@01 k@100@01))
  :qid |Ref__Integer_value-aux|)))
(push) ; 4
(assert (not (forall ((k@100@01 Int)) (!
  (=>
    (and (<= 0 k@100@01) (< k@100@01 N@48@01))
    (or (= $k@101@01 $Perm.No) (< $Perm.No $k@101@01)))
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@100@01 Int) (k2@100@01 Int)) (!
  (=>
    (and
      (and (and (<= 0 k1@100@01) (< k1@100@01 N@48@01)) (< $Perm.No $k@101@01))
      (and (and (<= 0 k2@100@01) (< k2@100@01 N@48@01)) (< $Perm.No $k@101@01))
      (= (Seq_index ar@49@01 k1@100@01) (Seq_index ar@49@01 k2@100@01)))
    (= k1@100@01 k2@100@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@100@01 Int)) (!
  (=>
    (and (and (<= 0 k@100@01) (< k@100@01 N@48@01)) (< $Perm.No $k@101@01))
    (and
      (= (inv@102@01 (Seq_index ar@49@01 k@100@01)) k@100@01)
      (img@103@01 (Seq_index ar@49@01 k@100@01))))
  :pattern ((Seq_index ar@49@01 k@100@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@103@01 r)
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)))
    (= (Seq_index ar@49@01 (inv@102@01 r)) r))
  :pattern ((inv@102@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@104@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
      (img@103@01 r)
      (= r (Seq_index ar@49@01 (inv@102@01 r))))
    ($Perm.min
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r))
        $Perm.No)
      $k@101@01)
    $Perm.No))
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
      (img@103@01 r)
      (= r (Seq_index ar@49@01 (inv@102@01 r))))
    ($Perm.min
      (ite
        (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- $k@101@01 (pTaken@104@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@101@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@55@01 r)
            (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
          (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
      (<
        (ite
          (and
            (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
            (img@103@01 r)
            (= r (Seq_index ar@49@01 (inv@102@01 r))))
          $k@101@01
          $Perm.No)
        (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
      (<
        (ite
          (and
            (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
            (img@103@01 r)
            (= r (Seq_index ar@49@01 (inv@102@01 r))))
          $k@101@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@55@01 r))
  :pattern ((inv@54@01 r))
  :pattern ((img@103@01 r))
  :pattern ((Seq_index ar@49@01 (inv@102@01 r)))
  :qid |qp.srp13|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
      (img@103@01 r)
      (= r (Seq_index ar@49@01 (inv@102@01 r))))
    (= (- $k@101@01 (pTaken@104@01 r)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@106@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)
        (img@103@01 r)))
    (=>
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)
        (img@103@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef16|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)
        (img@103@01 r))
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)
        (img@103@01 r))
      (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r))
  :qid |qp.fvfValDef15|)))
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
          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@106@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@101@01))
(assert (forall ((k@100@01 Int)) (!
  (=>
    (and (and (<= 0 k@100@01) (< k@100@01 N@48@01)) (< $Perm.No $k@101@01))
    (and
      (= (inv@102@01 (Seq_index ar@49@01 k@100@01)) k@100@01)
      (img@103@01 (Seq_index ar@49@01 k@100@01))))
  :pattern ((Seq_index ar@49@01 k@100@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@103@01 r)
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)))
    (= (Seq_index ar@49@01 (inv@102@01 r)) r))
  :pattern ((inv@102@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)
        (img@103@01 r)))
    (=>
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)
        (img@103@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)
        (img@103@01 r))
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
        (< $Perm.No $k@101@01)
        (img@103@01 r))
      (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) N@48@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@78@01))) r))
  :qid |qp.fvfValDef15|)))
(assert (and
  (forall ((j@98@01 Int) (k@99@01 Int)) (!
    (=>
      (and
        (<= 0 j@98@01)
        (and
          (< j@98@01 (Seq_length ar@49@01))
          (and
            (<= 0 k@99@01)
            (and (< k@99@01 (Seq_length ar@49@01)) (not (= j@98@01 k@99@01))))))
      (not (= (Seq_index ar@49@01 j@98@01) (Seq_index ar@49@01 k@99@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/summation.vpr@18@12@18@106|))
  (forall ((k@100@01 Int)) (!
    (=>
      (and (<= 0 k@100@01) (< k@100@01 N@48@01))
      (or (<= 0 k@100@01) (not (<= 0 k@100@01))))
    :pattern ((Seq_index ar@49@01 k@100@01))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@55@01 r)
              (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
            (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r))
            $Perm.No)
          $Perm.No))
      (ite
        (and (img@55@01 r) (and (<= 0 (inv@54@01 r)) (< (inv@54@01 r) N@48@01)))
        (<
          (ite
            (and
              (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
              (img@103@01 r)
              (= r (Seq_index ar@49@01 (inv@102@01 r))))
            $k@101@01
            $Perm.No)
          (- (/ (to_real 1) (to_real 2)) (pTaken@76@01 r)))
        (<
          (ite
            (and
              (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@48@01))
              (img@103@01 r)
              (= r (Seq_index ar@49@01 (inv@102@01 r))))
            $k@101@01
            $Perm.No)
          $Perm.No)))
    :pattern ((img@55@01 r))
    :pattern ((inv@54@01 r))
    :pattern ((img@103@01 r))
    :pattern ((Seq_index ar@49@01 (inv@102@01 r)))
    :qid |qp.srp13|))
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
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@106@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@78@01))))
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
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@106@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@78@01))))
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
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@106@01  $FVF<Ref__Integer_value>))))))) 0 0 N@48@01 ar@49@01)))
(pop) ; 2
(pop) ; 1
