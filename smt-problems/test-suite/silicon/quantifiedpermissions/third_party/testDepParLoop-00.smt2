(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:21:42
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr
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
; ---------- Ref__loop_main_54 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const len@2@01 Int)
(declare-const ar@3@01 Seq<$Ref>)
(declare-const br@4@01 Seq<$Ref>)
(declare-const cr@5@01 Seq<$Ref>)
(declare-const diz@6@01 $Ref)
(declare-const current_thread_id@7@01 Int)
(declare-const len@8@01 Int)
(declare-const ar@9@01 Seq<$Ref>)
(declare-const br@10@01 Seq<$Ref>)
(declare-const cr@11@01 Seq<$Ref>)
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
; [eval] 0 < len ==> |ar| == len
; [eval] 0 < len
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 len@8@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | 0 < len@8@01 | live]
; [else-branch: 0 | !(0 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | 0 < len@8@01]
(assert (< 0 len@8@01))
; [eval] |ar| == len
; [eval] |ar|
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(0 < len@8@01)]
(assert (not (< 0 len@8@01)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (< 0 len@8@01)) (< 0 len@8@01)))
(assert (=> (< 0 len@8@01) (= (Seq_length ar@9@01) len@8@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { ar[j], ar[k] } 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@13@01 Int)
(declare-const k@14@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 1 | !(0 <= j@13@01) | live]
; [else-branch: 1 | 0 <= j@13@01 | live]
(push) ; 4
; [then-branch: 1 | !(0 <= j@13@01)]
(assert (not (<= 0 j@13@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | 0 <= j@13@01]
(assert (<= 0 j@13@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 2 | !(j@13@01 < |ar@9@01|) | live]
; [else-branch: 2 | j@13@01 < |ar@9@01| | live]
(push) ; 6
; [then-branch: 2 | !(j@13@01 < |ar@9@01|)]
(assert (not (< j@13@01 (Seq_length ar@9@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | j@13@01 < |ar@9@01|]
(assert (< j@13@01 (Seq_length ar@9@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 3 | !(0 <= k@14@01) | live]
; [else-branch: 3 | 0 <= k@14@01 | live]
(push) ; 8
; [then-branch: 3 | !(0 <= k@14@01)]
(assert (not (<= 0 k@14@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 3 | 0 <= k@14@01]
(assert (<= 0 k@14@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 4 | !(k@14@01 < |ar@9@01|) | live]
; [else-branch: 4 | k@14@01 < |ar@9@01| | live]
(push) ; 10
; [then-branch: 4 | !(k@14@01 < |ar@9@01|)]
(assert (not (< k@14@01 (Seq_length ar@9@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 4 | k@14@01 < |ar@9@01|]
(assert (< k@14@01 (Seq_length ar@9@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@14@01 (Seq_length ar@9@01)) (not (< k@14@01 (Seq_length ar@9@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@14@01)
  (and
    (<= 0 k@14@01)
    (or (< k@14@01 (Seq_length ar@9@01)) (not (< k@14@01 (Seq_length ar@9@01)))))))
(assert (or (<= 0 k@14@01) (not (<= 0 k@14@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@13@01 (Seq_length ar@9@01))
  (and
    (< j@13@01 (Seq_length ar@9@01))
    (=>
      (<= 0 k@14@01)
      (and
        (<= 0 k@14@01)
        (or
          (< k@14@01 (Seq_length ar@9@01))
          (not (< k@14@01 (Seq_length ar@9@01))))))
    (or (<= 0 k@14@01) (not (<= 0 k@14@01))))))
(assert (or (< j@13@01 (Seq_length ar@9@01)) (not (< j@13@01 (Seq_length ar@9@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@13@01)
  (and
    (<= 0 j@13@01)
    (=>
      (< j@13@01 (Seq_length ar@9@01))
      (and
        (< j@13@01 (Seq_length ar@9@01))
        (=>
          (<= 0 k@14@01)
          (and
            (<= 0 k@14@01)
            (or
              (< k@14@01 (Seq_length ar@9@01))
              (not (< k@14@01 (Seq_length ar@9@01))))))
        (or (<= 0 k@14@01) (not (<= 0 k@14@01)))))
    (or (< j@13@01 (Seq_length ar@9@01)) (not (< j@13@01 (Seq_length ar@9@01)))))))
(assert (or (<= 0 j@13@01) (not (<= 0 j@13@01))))
(push) ; 3
; [then-branch: 5 | 0 <= j@13@01 && j@13@01 < |ar@9@01| && 0 <= k@14@01 && k@14@01 < |ar@9@01| && j@13@01 != k@14@01 | live]
; [else-branch: 5 | !(0 <= j@13@01 && j@13@01 < |ar@9@01| && 0 <= k@14@01 && k@14@01 < |ar@9@01| && j@13@01 != k@14@01) | live]
(push) ; 4
; [then-branch: 5 | 0 <= j@13@01 && j@13@01 < |ar@9@01| && 0 <= k@14@01 && k@14@01 < |ar@9@01| && j@13@01 != k@14@01]
(assert (and
  (<= 0 j@13@01)
  (and
    (< j@13@01 (Seq_length ar@9@01))
    (and
      (<= 0 k@14@01)
      (and (< k@14@01 (Seq_length ar@9@01)) (not (= j@13@01 k@14@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 5
(assert (not (>= j@13@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@14@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(0 <= j@13@01 && j@13@01 < |ar@9@01| && 0 <= k@14@01 && k@14@01 < |ar@9@01| && j@13@01 != k@14@01)]
(assert (not
  (and
    (<= 0 j@13@01)
    (and
      (< j@13@01 (Seq_length ar@9@01))
      (and
        (<= 0 k@14@01)
        (and (< k@14@01 (Seq_length ar@9@01)) (not (= j@13@01 k@14@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@13@01)
    (and
      (< j@13@01 (Seq_length ar@9@01))
      (and
        (<= 0 k@14@01)
        (and (< k@14@01 (Seq_length ar@9@01)) (not (= j@13@01 k@14@01))))))
  (and
    (<= 0 j@13@01)
    (< j@13@01 (Seq_length ar@9@01))
    (<= 0 k@14@01)
    (< k@14@01 (Seq_length ar@9@01))
    (not (= j@13@01 k@14@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@13@01)
      (and
        (< j@13@01 (Seq_length ar@9@01))
        (and
          (<= 0 k@14@01)
          (and (< k@14@01 (Seq_length ar@9@01)) (not (= j@13@01 k@14@01)))))))
  (and
    (<= 0 j@13@01)
    (and
      (< j@13@01 (Seq_length ar@9@01))
      (and
        (<= 0 k@14@01)
        (and (< k@14@01 (Seq_length ar@9@01)) (not (= j@13@01 k@14@01))))))))
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
          (< j@13@01 (Seq_length ar@9@01))
          (and
            (< j@13@01 (Seq_length ar@9@01))
            (=>
              (<= 0 k@14@01)
              (and
                (<= 0 k@14@01)
                (or
                  (< k@14@01 (Seq_length ar@9@01))
                  (not (< k@14@01 (Seq_length ar@9@01))))))
            (or (<= 0 k@14@01) (not (<= 0 k@14@01)))))
        (or
          (< j@13@01 (Seq_length ar@9@01))
          (not (< j@13@01 (Seq_length ar@9@01))))))
    (or (<= 0 j@13@01) (not (<= 0 j@13@01)))
    (=>
      (and
        (<= 0 j@13@01)
        (and
          (< j@13@01 (Seq_length ar@9@01))
          (and
            (<= 0 k@14@01)
            (and (< k@14@01 (Seq_length ar@9@01)) (not (= j@13@01 k@14@01))))))
      (and
        (<= 0 j@13@01)
        (< j@13@01 (Seq_length ar@9@01))
        (<= 0 k@14@01)
        (< k@14@01 (Seq_length ar@9@01))
        (not (= j@13@01 k@14@01))))
    (or
      (not
        (and
          (<= 0 j@13@01)
          (and
            (< j@13@01 (Seq_length ar@9@01))
            (and
              (<= 0 k@14@01)
              (and (< k@14@01 (Seq_length ar@9@01)) (not (= j@13@01 k@14@01)))))))
      (and
        (<= 0 j@13@01)
        (and
          (< j@13@01 (Seq_length ar@9@01))
          (and
            (<= 0 k@14@01)
            (and (< k@14@01 (Seq_length ar@9@01)) (not (= j@13@01 k@14@01))))))))
  :pattern ((Seq_index ar@9@01 j@13@01) (Seq_index ar@9@01 k@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@62@12@62@106-aux|)))
(assert (forall ((j@13@01 Int) (k@14@01 Int)) (!
  (=>
    (and
      (<= 0 j@13@01)
      (and
        (< j@13@01 (Seq_length ar@9@01))
        (and
          (<= 0 k@14@01)
          (and (< k@14@01 (Seq_length ar@9@01)) (not (= j@13@01 k@14@01))))))
    (not (= (Seq_index ar@9@01 j@13@01) (Seq_index ar@9@01 k@14@01))))
  :pattern ((Seq_index ar@9@01 j@13@01) (Seq_index ar@9@01 k@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@62@12@62@106|)))
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
(assert (and (<= 0 i@15@01) (< i@15@01 len@8@01)))
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@15@01 (Seq_length ar@9@01))))
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
  :pattern ((Seq_index ar@9@01 i@15@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@15@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@15@01) (< i1@15@01 len@8@01))
      (and (<= 0 i2@15@01) (< i2@15@01 len@8@01))
      (= (Seq_index ar@9@01 i1@15@01) (Seq_index ar@9@01 i2@15@01)))
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
      (= (inv@16@01 (Seq_index ar@9@01 i@15@01)) i@15@01)
      (img@17@01 (Seq_index ar@9@01 i@15@01))))
  :pattern ((Seq_index ar@9@01 i@15@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))
    (= (Seq_index ar@9@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 len@8@01))
    (not (= (Seq_index ar@9@01 i@15@01) $Ref.null)))
  :pattern ((Seq_index ar@9@01 i@15@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  $Snap.unit))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 len@8@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | 0 < len@8@01 | live]
; [else-branch: 7 | !(0 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | 0 < len@8@01]
(assert (< 0 len@8@01))
; [eval] |br| == len
; [eval] |br|
(pop) ; 3
(push) ; 3
; [else-branch: 7 | !(0 < len@8@01)]
(assert (not (< 0 len@8@01)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=> (< 0 len@8@01) (= (Seq_length br@10@01) len@8@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { br[j], br[k] } 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k])
(declare-const j@18@01 Int)
(declare-const k@19@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k]
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 8 | !(0 <= j@18@01) | live]
; [else-branch: 8 | 0 <= j@18@01 | live]
(push) ; 4
; [then-branch: 8 | !(0 <= j@18@01)]
(assert (not (<= 0 j@18@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | 0 <= j@18@01]
(assert (<= 0 j@18@01))
; [eval] j < |br|
; [eval] |br|
(push) ; 5
; [then-branch: 9 | !(j@18@01 < |br@10@01|) | live]
; [else-branch: 9 | j@18@01 < |br@10@01| | live]
(push) ; 6
; [then-branch: 9 | !(j@18@01 < |br@10@01|)]
(assert (not (< j@18@01 (Seq_length br@10@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | j@18@01 < |br@10@01|]
(assert (< j@18@01 (Seq_length br@10@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 10 | !(0 <= k@19@01) | live]
; [else-branch: 10 | 0 <= k@19@01 | live]
(push) ; 8
; [then-branch: 10 | !(0 <= k@19@01)]
(assert (not (<= 0 k@19@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 10 | 0 <= k@19@01]
(assert (<= 0 k@19@01))
; [eval] k < |br|
; [eval] |br|
(push) ; 9
; [then-branch: 11 | !(k@19@01 < |br@10@01|) | live]
; [else-branch: 11 | k@19@01 < |br@10@01| | live]
(push) ; 10
; [then-branch: 11 | !(k@19@01 < |br@10@01|)]
(assert (not (< k@19@01 (Seq_length br@10@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 11 | k@19@01 < |br@10@01|]
(assert (< k@19@01 (Seq_length br@10@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@19@01 (Seq_length br@10@01)) (not (< k@19@01 (Seq_length br@10@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@19@01)
  (and
    (<= 0 k@19@01)
    (or
      (< k@19@01 (Seq_length br@10@01))
      (not (< k@19@01 (Seq_length br@10@01)))))))
(assert (or (<= 0 k@19@01) (not (<= 0 k@19@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@18@01 (Seq_length br@10@01))
  (and
    (< j@18@01 (Seq_length br@10@01))
    (=>
      (<= 0 k@19@01)
      (and
        (<= 0 k@19@01)
        (or
          (< k@19@01 (Seq_length br@10@01))
          (not (< k@19@01 (Seq_length br@10@01))))))
    (or (<= 0 k@19@01) (not (<= 0 k@19@01))))))
(assert (or (< j@18@01 (Seq_length br@10@01)) (not (< j@18@01 (Seq_length br@10@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@18@01)
  (and
    (<= 0 j@18@01)
    (=>
      (< j@18@01 (Seq_length br@10@01))
      (and
        (< j@18@01 (Seq_length br@10@01))
        (=>
          (<= 0 k@19@01)
          (and
            (<= 0 k@19@01)
            (or
              (< k@19@01 (Seq_length br@10@01))
              (not (< k@19@01 (Seq_length br@10@01))))))
        (or (<= 0 k@19@01) (not (<= 0 k@19@01)))))
    (or
      (< j@18@01 (Seq_length br@10@01))
      (not (< j@18@01 (Seq_length br@10@01)))))))
(assert (or (<= 0 j@18@01) (not (<= 0 j@18@01))))
(push) ; 3
; [then-branch: 12 | 0 <= j@18@01 && j@18@01 < |br@10@01| && 0 <= k@19@01 && k@19@01 < |br@10@01| && j@18@01 != k@19@01 | live]
; [else-branch: 12 | !(0 <= j@18@01 && j@18@01 < |br@10@01| && 0 <= k@19@01 && k@19@01 < |br@10@01| && j@18@01 != k@19@01) | live]
(push) ; 4
; [then-branch: 12 | 0 <= j@18@01 && j@18@01 < |br@10@01| && 0 <= k@19@01 && k@19@01 < |br@10@01| && j@18@01 != k@19@01]
(assert (and
  (<= 0 j@18@01)
  (and
    (< j@18@01 (Seq_length br@10@01))
    (and
      (<= 0 k@19@01)
      (and (< k@19@01 (Seq_length br@10@01)) (not (= j@18@01 k@19@01)))))))
; [eval] br[j] != br[k]
; [eval] br[j]
(push) ; 5
(assert (not (>= j@18@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] br[k]
(push) ; 5
(assert (not (>= k@19@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 12 | !(0 <= j@18@01 && j@18@01 < |br@10@01| && 0 <= k@19@01 && k@19@01 < |br@10@01| && j@18@01 != k@19@01)]
(assert (not
  (and
    (<= 0 j@18@01)
    (and
      (< j@18@01 (Seq_length br@10@01))
      (and
        (<= 0 k@19@01)
        (and (< k@19@01 (Seq_length br@10@01)) (not (= j@18@01 k@19@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@18@01)
    (and
      (< j@18@01 (Seq_length br@10@01))
      (and
        (<= 0 k@19@01)
        (and (< k@19@01 (Seq_length br@10@01)) (not (= j@18@01 k@19@01))))))
  (and
    (<= 0 j@18@01)
    (< j@18@01 (Seq_length br@10@01))
    (<= 0 k@19@01)
    (< k@19@01 (Seq_length br@10@01))
    (not (= j@18@01 k@19@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@18@01)
      (and
        (< j@18@01 (Seq_length br@10@01))
        (and
          (<= 0 k@19@01)
          (and (< k@19@01 (Seq_length br@10@01)) (not (= j@18@01 k@19@01)))))))
  (and
    (<= 0 j@18@01)
    (and
      (< j@18@01 (Seq_length br@10@01))
      (and
        (<= 0 k@19@01)
        (and (< k@19@01 (Seq_length br@10@01)) (not (= j@18@01 k@19@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@18@01 Int) (k@19@01 Int)) (!
  (and
    (=>
      (<= 0 j@18@01)
      (and
        (<= 0 j@18@01)
        (=>
          (< j@18@01 (Seq_length br@10@01))
          (and
            (< j@18@01 (Seq_length br@10@01))
            (=>
              (<= 0 k@19@01)
              (and
                (<= 0 k@19@01)
                (or
                  (< k@19@01 (Seq_length br@10@01))
                  (not (< k@19@01 (Seq_length br@10@01))))))
            (or (<= 0 k@19@01) (not (<= 0 k@19@01)))))
        (or
          (< j@18@01 (Seq_length br@10@01))
          (not (< j@18@01 (Seq_length br@10@01))))))
    (or (<= 0 j@18@01) (not (<= 0 j@18@01)))
    (=>
      (and
        (<= 0 j@18@01)
        (and
          (< j@18@01 (Seq_length br@10@01))
          (and
            (<= 0 k@19@01)
            (and (< k@19@01 (Seq_length br@10@01)) (not (= j@18@01 k@19@01))))))
      (and
        (<= 0 j@18@01)
        (< j@18@01 (Seq_length br@10@01))
        (<= 0 k@19@01)
        (< k@19@01 (Seq_length br@10@01))
        (not (= j@18@01 k@19@01))))
    (or
      (not
        (and
          (<= 0 j@18@01)
          (and
            (< j@18@01 (Seq_length br@10@01))
            (and
              (<= 0 k@19@01)
              (and (< k@19@01 (Seq_length br@10@01)) (not (= j@18@01 k@19@01)))))))
      (and
        (<= 0 j@18@01)
        (and
          (< j@18@01 (Seq_length br@10@01))
          (and
            (<= 0 k@19@01)
            (and (< k@19@01 (Seq_length br@10@01)) (not (= j@18@01 k@19@01))))))))
  :pattern ((Seq_index br@10@01 j@18@01) (Seq_index br@10@01 k@19@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@65@12@65@106-aux|)))
(assert (forall ((j@18@01 Int) (k@19@01 Int)) (!
  (=>
    (and
      (<= 0 j@18@01)
      (and
        (< j@18@01 (Seq_length br@10@01))
        (and
          (<= 0 k@19@01)
          (and (< k@19@01 (Seq_length br@10@01)) (not (= j@18@01 k@19@01))))))
    (not (= (Seq_index br@10@01 j@18@01) (Seq_index br@10@01 k@19@01))))
  :pattern ((Seq_index br@10@01 j@18@01) (Seq_index br@10@01 k@19@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@65@12@65@106|)))
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
(assert (and (<= 0 i@20@01) (< i@20@01 len@8@01)))
; [eval] br[i]
(push) ; 3
(assert (not (>= i@20@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@20@01 (Seq_length br@10@01))))
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
    (and (<= 0 i@20@01) (< i@20@01 len@8@01))
    (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
  :pattern ((Seq_index br@10@01 i@20@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@20@01 Int) (i2@20@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@20@01) (< i1@20@01 len@8@01))
      (and (<= 0 i2@20@01) (< i2@20@01 len@8@01))
      (= (Seq_index br@10@01 i1@20@01) (Seq_index br@10@01 i2@20@01)))
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
    (and (<= 0 i@20@01) (< i@20@01 len@8@01))
    (and
      (= (inv@21@01 (Seq_index br@10@01 i@20@01)) i@20@01)
      (img@22@01 (Seq_index br@10@01 i@20@01))))
  :pattern ((Seq_index br@10@01 i@20@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@8@01)))
    (= (Seq_index br@10@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 0 i@20@01) (< i@20@01 len@8@01))
    (not (= (Seq_index br@10@01 i@20@01) $Ref.null)))
  :pattern ((Seq_index br@10@01 i@20@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@10@01 i@20@01) (Seq_index ar@9@01 i@15@01))
    (=
      (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@8@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
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
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 len@8@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | 0 < len@8@01 | live]
; [else-branch: 14 | !(0 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | 0 < len@8@01]
(assert (< 0 len@8@01))
; [eval] |cr| == len
; [eval] |cr|
(pop) ; 3
(push) ; 3
; [else-branch: 14 | !(0 < len@8@01)]
(assert (not (< 0 len@8@01)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=> (< 0 len@8@01) (= (Seq_length cr@11@01) len@8@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { cr[j], cr[k] } 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k])
(declare-const j@23@01 Int)
(declare-const k@24@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k]
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 15 | !(0 <= j@23@01) | live]
; [else-branch: 15 | 0 <= j@23@01 | live]
(push) ; 4
; [then-branch: 15 | !(0 <= j@23@01)]
(assert (not (<= 0 j@23@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | 0 <= j@23@01]
(assert (<= 0 j@23@01))
; [eval] j < |cr|
; [eval] |cr|
(push) ; 5
; [then-branch: 16 | !(j@23@01 < |cr@11@01|) | live]
; [else-branch: 16 | j@23@01 < |cr@11@01| | live]
(push) ; 6
; [then-branch: 16 | !(j@23@01 < |cr@11@01|)]
(assert (not (< j@23@01 (Seq_length cr@11@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | j@23@01 < |cr@11@01|]
(assert (< j@23@01 (Seq_length cr@11@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 17 | !(0 <= k@24@01) | live]
; [else-branch: 17 | 0 <= k@24@01 | live]
(push) ; 8
; [then-branch: 17 | !(0 <= k@24@01)]
(assert (not (<= 0 k@24@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | 0 <= k@24@01]
(assert (<= 0 k@24@01))
; [eval] k < |cr|
; [eval] |cr|
(push) ; 9
; [then-branch: 18 | !(k@24@01 < |cr@11@01|) | live]
; [else-branch: 18 | k@24@01 < |cr@11@01| | live]
(push) ; 10
; [then-branch: 18 | !(k@24@01 < |cr@11@01|)]
(assert (not (< k@24@01 (Seq_length cr@11@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 18 | k@24@01 < |cr@11@01|]
(assert (< k@24@01 (Seq_length cr@11@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@24@01 (Seq_length cr@11@01)) (not (< k@24@01 (Seq_length cr@11@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@24@01)
  (and
    (<= 0 k@24@01)
    (or
      (< k@24@01 (Seq_length cr@11@01))
      (not (< k@24@01 (Seq_length cr@11@01)))))))
(assert (or (<= 0 k@24@01) (not (<= 0 k@24@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@23@01 (Seq_length cr@11@01))
  (and
    (< j@23@01 (Seq_length cr@11@01))
    (=>
      (<= 0 k@24@01)
      (and
        (<= 0 k@24@01)
        (or
          (< k@24@01 (Seq_length cr@11@01))
          (not (< k@24@01 (Seq_length cr@11@01))))))
    (or (<= 0 k@24@01) (not (<= 0 k@24@01))))))
(assert (or (< j@23@01 (Seq_length cr@11@01)) (not (< j@23@01 (Seq_length cr@11@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@23@01)
  (and
    (<= 0 j@23@01)
    (=>
      (< j@23@01 (Seq_length cr@11@01))
      (and
        (< j@23@01 (Seq_length cr@11@01))
        (=>
          (<= 0 k@24@01)
          (and
            (<= 0 k@24@01)
            (or
              (< k@24@01 (Seq_length cr@11@01))
              (not (< k@24@01 (Seq_length cr@11@01))))))
        (or (<= 0 k@24@01) (not (<= 0 k@24@01)))))
    (or
      (< j@23@01 (Seq_length cr@11@01))
      (not (< j@23@01 (Seq_length cr@11@01)))))))
(assert (or (<= 0 j@23@01) (not (<= 0 j@23@01))))
(push) ; 3
; [then-branch: 19 | 0 <= j@23@01 && j@23@01 < |cr@11@01| && 0 <= k@24@01 && k@24@01 < |cr@11@01| && j@23@01 != k@24@01 | live]
; [else-branch: 19 | !(0 <= j@23@01 && j@23@01 < |cr@11@01| && 0 <= k@24@01 && k@24@01 < |cr@11@01| && j@23@01 != k@24@01) | live]
(push) ; 4
; [then-branch: 19 | 0 <= j@23@01 && j@23@01 < |cr@11@01| && 0 <= k@24@01 && k@24@01 < |cr@11@01| && j@23@01 != k@24@01]
(assert (and
  (<= 0 j@23@01)
  (and
    (< j@23@01 (Seq_length cr@11@01))
    (and
      (<= 0 k@24@01)
      (and (< k@24@01 (Seq_length cr@11@01)) (not (= j@23@01 k@24@01)))))))
; [eval] cr[j] != cr[k]
; [eval] cr[j]
(push) ; 5
(assert (not (>= j@23@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] cr[k]
(push) ; 5
(assert (not (>= k@24@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(0 <= j@23@01 && j@23@01 < |cr@11@01| && 0 <= k@24@01 && k@24@01 < |cr@11@01| && j@23@01 != k@24@01)]
(assert (not
  (and
    (<= 0 j@23@01)
    (and
      (< j@23@01 (Seq_length cr@11@01))
      (and
        (<= 0 k@24@01)
        (and (< k@24@01 (Seq_length cr@11@01)) (not (= j@23@01 k@24@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@23@01)
    (and
      (< j@23@01 (Seq_length cr@11@01))
      (and
        (<= 0 k@24@01)
        (and (< k@24@01 (Seq_length cr@11@01)) (not (= j@23@01 k@24@01))))))
  (and
    (<= 0 j@23@01)
    (< j@23@01 (Seq_length cr@11@01))
    (<= 0 k@24@01)
    (< k@24@01 (Seq_length cr@11@01))
    (not (= j@23@01 k@24@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@23@01)
      (and
        (< j@23@01 (Seq_length cr@11@01))
        (and
          (<= 0 k@24@01)
          (and (< k@24@01 (Seq_length cr@11@01)) (not (= j@23@01 k@24@01)))))))
  (and
    (<= 0 j@23@01)
    (and
      (< j@23@01 (Seq_length cr@11@01))
      (and
        (<= 0 k@24@01)
        (and (< k@24@01 (Seq_length cr@11@01)) (not (= j@23@01 k@24@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@23@01 Int) (k@24@01 Int)) (!
  (and
    (=>
      (<= 0 j@23@01)
      (and
        (<= 0 j@23@01)
        (=>
          (< j@23@01 (Seq_length cr@11@01))
          (and
            (< j@23@01 (Seq_length cr@11@01))
            (=>
              (<= 0 k@24@01)
              (and
                (<= 0 k@24@01)
                (or
                  (< k@24@01 (Seq_length cr@11@01))
                  (not (< k@24@01 (Seq_length cr@11@01))))))
            (or (<= 0 k@24@01) (not (<= 0 k@24@01)))))
        (or
          (< j@23@01 (Seq_length cr@11@01))
          (not (< j@23@01 (Seq_length cr@11@01))))))
    (or (<= 0 j@23@01) (not (<= 0 j@23@01)))
    (=>
      (and
        (<= 0 j@23@01)
        (and
          (< j@23@01 (Seq_length cr@11@01))
          (and
            (<= 0 k@24@01)
            (and (< k@24@01 (Seq_length cr@11@01)) (not (= j@23@01 k@24@01))))))
      (and
        (<= 0 j@23@01)
        (< j@23@01 (Seq_length cr@11@01))
        (<= 0 k@24@01)
        (< k@24@01 (Seq_length cr@11@01))
        (not (= j@23@01 k@24@01))))
    (or
      (not
        (and
          (<= 0 j@23@01)
          (and
            (< j@23@01 (Seq_length cr@11@01))
            (and
              (<= 0 k@24@01)
              (and (< k@24@01 (Seq_length cr@11@01)) (not (= j@23@01 k@24@01)))))))
      (and
        (<= 0 j@23@01)
        (and
          (< j@23@01 (Seq_length cr@11@01))
          (and
            (<= 0 k@24@01)
            (and (< k@24@01 (Seq_length cr@11@01)) (not (= j@23@01 k@24@01))))))))
  :pattern ((Seq_index cr@11@01 j@23@01) (Seq_index cr@11@01 k@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@68@12@68@106-aux|)))
(assert (forall ((j@23@01 Int) (k@24@01 Int)) (!
  (=>
    (and
      (<= 0 j@23@01)
      (and
        (< j@23@01 (Seq_length cr@11@01))
        (and
          (<= 0 k@24@01)
          (and (< k@24@01 (Seq_length cr@11@01)) (not (= j@23@01 k@24@01))))))
    (not (= (Seq_index cr@11@01 j@23@01) (Seq_index cr@11@01 k@24@01))))
  :pattern ((Seq_index cr@11@01 j@23@01) (Seq_index cr@11@01 k@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@68@12@68@106|)))
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
(assert (and (<= 0 i@25@01) (< i@25@01 len@8@01)))
; [eval] cr[i]
(push) ; 3
(assert (not (>= i@25@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@25@01 (Seq_length cr@11@01))))
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
    (and (<= 0 i@25@01) (< i@25@01 len@8@01))
    (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
  :pattern ((Seq_index cr@11@01 i@25@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@25@01 Int) (i2@25@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@25@01) (< i1@25@01 len@8@01))
      (and (<= 0 i2@25@01) (< i2@25@01 len@8@01))
      (= (Seq_index cr@11@01 i1@25@01) (Seq_index cr@11@01 i2@25@01)))
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
    (and (<= 0 i@25@01) (< i@25@01 len@8@01))
    (and
      (= (inv@26@01 (Seq_index cr@11@01 i@25@01)) i@25@01)
      (img@27@01 (Seq_index cr@11@01 i@25@01))))
  :pattern ((Seq_index cr@11@01 i@25@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@8@01)))
    (= (Seq_index cr@11@01 (inv@26@01 r)) r))
  :pattern ((inv@26@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 len@8@01))
    (not (= (Seq_index cr@11@01 i@25@01) $Ref.null)))
  :pattern ((Seq_index cr@11@01 i@25@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@11@01 i@25@01) (Seq_index br@10@01 i@20@01))
    (=
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@8@01)))
      (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) len@8@01)))))
  
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
    (= (Seq_index cr@11@01 i@25@01) (Seq_index ar@9@01 i@15@01))
    (=
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) len@8@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
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
; [eval] 0 < len ==> |ar| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@8@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | 0 < len@8@01 | live]
; [else-branch: 21 | !(0 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | 0 < len@8@01]
(assert (< 0 len@8@01))
; [eval] |ar| == len
; [eval] |ar|
(pop) ; 4
(push) ; 4
; [else-branch: 21 | !(0 < len@8@01)]
(assert (not (< 0 len@8@01)))
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
(assert (and (<= 0 i@29@01) (< i@29@01 len@8@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@29@01 (Seq_length ar@9@01))))
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
  :pattern ((Seq_index ar@9@01 i@29@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@29@01) (< i1@29@01 len@8@01))
      (and (<= 0 i2@29@01) (< i2@29@01 len@8@01))
      (= (Seq_index ar@9@01 i1@29@01) (Seq_index ar@9@01 i2@29@01)))
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
      (= (inv@30@01 (Seq_index ar@9@01 i@29@01)) i@29@01)
      (img@31@01 (Seq_index ar@9@01 i@29@01))))
  :pattern ((Seq_index ar@9@01 i@29@01))
  :qid |quant-u-58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
    (= (Seq_index ar@9@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 0 i@29@01) (< i@29@01 len@8@01))
    (not (= (Seq_index ar@9@01 i@29@01) $Ref.null)))
  :pattern ((Seq_index ar@9@01 i@29@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@28@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@28@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@28@01))) $Snap.unit))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@8@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | 0 < len@8@01 | live]
; [else-branch: 23 | !(0 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | 0 < len@8@01]
(assert (< 0 len@8@01))
; [eval] |br| == len
; [eval] |br|
(pop) ; 4
(push) ; 4
; [else-branch: 23 | !(0 < len@8@01)]
(assert (not (< 0 len@8@01)))
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
(assert (and (<= 0 i@32@01) (< i@32@01 len@8@01)))
; [eval] br[i]
(push) ; 4
(assert (not (>= i@32@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@32@01 (Seq_length br@10@01))))
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
    (and (<= 0 i@32@01) (< i@32@01 len@8@01))
    (or (<= 0 i@32@01) (not (<= 0 i@32@01))))
  :pattern ((Seq_index br@10@01 i@32@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@32@01 Int) (i2@32@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@32@01) (< i1@32@01 len@8@01))
      (and (<= 0 i2@32@01) (< i2@32@01 len@8@01))
      (= (Seq_index br@10@01 i1@32@01) (Seq_index br@10@01 i2@32@01)))
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
    (and (<= 0 i@32@01) (< i@32@01 len@8@01))
    (and
      (= (inv@33@01 (Seq_index br@10@01 i@32@01)) i@32@01)
      (img@34@01 (Seq_index br@10@01 i@32@01))))
  :pattern ((Seq_index br@10@01 i@32@01))
  :qid |quant-u-60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@8@01)))
    (= (Seq_index br@10@01 (inv@33@01 r)) r))
  :pattern ((inv@33@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 len@8@01))
    (not (= (Seq_index br@10@01 i@32@01) $Ref.null)))
  :pattern ((Seq_index br@10@01 i@32@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@10@01 i@32@01) (Seq_index ar@9@01 i@29@01))
    (=
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@8@01)))
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))))
  
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
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@8@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | 0 < len@8@01 | live]
; [else-branch: 25 | !(0 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | 0 < len@8@01]
(assert (< 0 len@8@01))
; [eval] |cr| == len
; [eval] |cr|
(pop) ; 4
(push) ; 4
; [else-branch: 25 | !(0 < len@8@01)]
(assert (not (< 0 len@8@01)))
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
(assert (and (<= 0 i@35@01) (< i@35@01 len@8@01)))
; [eval] cr[i]
(push) ; 4
(assert (not (>= i@35@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@35@01 (Seq_length cr@11@01))))
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
    (and (<= 0 i@35@01) (< i@35@01 len@8@01))
    (or (<= 0 i@35@01) (not (<= 0 i@35@01))))
  :pattern ((Seq_index cr@11@01 i@35@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@35@01 Int) (i2@35@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@35@01) (< i1@35@01 len@8@01))
      (and (<= 0 i2@35@01) (< i2@35@01 len@8@01))
      (= (Seq_index cr@11@01 i1@35@01) (Seq_index cr@11@01 i2@35@01)))
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
    (and (<= 0 i@35@01) (< i@35@01 len@8@01))
    (and
      (= (inv@36@01 (Seq_index cr@11@01 i@35@01)) i@35@01)
      (img@37@01 (Seq_index cr@11@01 i@35@01))))
  :pattern ((Seq_index cr@11@01 i@35@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@8@01)))
    (= (Seq_index cr@11@01 (inv@36@01 r)) r))
  :pattern ((inv@36@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and (<= 0 i@35@01) (< i@35@01 len@8@01))
    (not (= (Seq_index cr@11@01 i@35@01) $Ref.null)))
  :pattern ((Seq_index cr@11@01 i@35@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@11@01 i@35@01) (Seq_index br@10@01 i@32@01))
    (=
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@8@01)))
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@8@01)))))
  
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
    (= (Seq_index cr@11@01 i@35@01) (Seq_index ar@9@01 i@29@01))
    (=
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@8@01)))
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))))
  
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
(declare-const i@38@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (0 <= 0 ? 1 : 0) - 1 <= i && i < len - 1
; [eval] (0 <= 0 ? 1 : 0) - 1 <= i
; [eval] (0 <= 0 ? 1 : 0) - 1
; [eval] (0 <= 0 ? 1 : 0)
; [eval] 0 <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | True | live]
; [else-branch: 27 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 27 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
; [then-branch: 28 | !(0 <= i@38@01) | live]
; [else-branch: 28 | 0 <= i@38@01 | live]
(push) ; 5
; [then-branch: 28 | !(0 <= i@38@01)]
(assert (not (<= 0 i@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 28 | 0 <= i@38@01]
(assert (<= 0 i@38@01))
; [eval] i < len - 1
; [eval] len - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@38@01) (not (<= 0 i@38@01))))
(assert (and (<= 0 i@38@01) (< i@38@01 (- len@8@01 1))))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@38@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@38@01 (Seq_length ar@9@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@39@01 ($Ref) Int)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 (- len@8@01 1)))
    (or (<= 0 i@38@01) (not (<= 0 i@38@01))))
  :pattern ((Seq_index ar@9@01 i@38@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@38@01 Int) (i2@38@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@38@01) (< i1@38@01 (- len@8@01 1)))
      (and (<= 0 i2@38@01) (< i2@38@01 (- len@8@01 1)))
      (= (Seq_index ar@9@01 i1@38@01) (Seq_index ar@9@01 i2@38@01)))
    (= i1@38@01 i2@38@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 (- len@8@01 1)))
    (and
      (= (inv@39@01 (Seq_index ar@9@01 i@38@01)) i@38@01)
      (img@40@01 (Seq_index ar@9@01 i@38@01))))
  :pattern ((Seq_index ar@9@01 i@38@01))
  :qid |quant-u-67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@40@01 r)
      (and (<= 0 (inv@39@01 r)) (< (inv@39@01 r) (- len@8@01 1))))
    (= (Seq_index ar@9@01 (inv@39@01 r)) r))
  :pattern ((inv@39@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 (- len@8@01 1)))
    (not (= (Seq_index ar@9@01 i@38@01) $Ref.null)))
  :pattern ((Seq_index ar@9@01 i@38@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ar@9@01 i@38@01) (Seq_index cr@11@01 i@35@01))
    (=
      (and
        (img@40@01 r)
        (and (<= 0 (inv@39@01 r)) (< (inv@39@01 r) (- len@8@01 1))))
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) len@8@01)))))
  
  :qid |quant-u-68|))))
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
    (= (Seq_index ar@9@01 i@38@01) (Seq_index br@10@01 i@32@01))
    (=
      (and
        (img@40@01 r)
        (and (<= 0 (inv@39@01 r)) (< (inv@39@01 r) (- len@8@01 1))))
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) len@8@01)))))
  
  :qid |quant-u-69|))))
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
    (= (Seq_index ar@9@01 i@38@01) (Seq_index ar@9@01 i@29@01))
    (=
      (and
        (img@40@01 r)
        (and (<= 0 (inv@39@01 r)) (< (inv@39@01 r) (- len@8@01 1))))
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] 0 <= |ar| - 1 && |ar| - 1 < len
; [eval] 0 <= |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(set-option :timeout 0)
(push) ; 3
; [then-branch: 29 | !(0 <= |ar@9@01| - 1) | live]
; [else-branch: 29 | 0 <= |ar@9@01| - 1 | live]
(push) ; 4
; [then-branch: 29 | !(0 <= |ar@9@01| - 1)]
(assert (not (<= 0 (- (Seq_length ar@9@01) 1))))
(pop) ; 4
(push) ; 4
; [else-branch: 29 | 0 <= |ar@9@01| - 1]
(assert (<= 0 (- (Seq_length ar@9@01) 1)))
; [eval] |ar| - 1 < len
; [eval] |ar| - 1
; [eval] |ar|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 (- (Seq_length ar@9@01) 1)) (not (<= 0 (- (Seq_length ar@9@01) 1)))))
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and (<= 0 (- (Seq_length ar@9@01) 1)) (< (- (Seq_length ar@9@01) 1) len@8@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and (<= 0 (- (Seq_length ar@9@01) 1)) (< (- (Seq_length ar@9@01) 1) len@8@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | 0 <= |ar@9@01| - 1 && |ar@9@01| - 1 < len@8@01 | live]
; [else-branch: 30 | !(0 <= |ar@9@01| - 1 && |ar@9@01| - 1 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 30 | 0 <= |ar@9@01| - 1 && |ar@9@01| - 1 < len@8@01]
(assert (and (<= 0 (- (Seq_length ar@9@01) 1)) (< (- (Seq_length ar@9@01) 1) len@8@01)))
; [eval] ar[|ar| - 1]
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 4
(assert (not (>= (- (Seq_length ar@9@01) 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (- (Seq_length ar@9@01) 1) (Seq_length ar@9@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const sm@41@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@41@01  $FVF<Ref__Integer_value>) (Seq_index
    ar@9@01
    (- (Seq_length ar@9@01) 1)))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))
(assert (<=
  $Perm.No
  (ite
    (=
      (Seq_index ar@9@01 (- (Seq_length ar@9@01) 1))
      (Seq_index ar@9@01 (- (Seq_length ar@9@01) 1)))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (=
      (Seq_index ar@9@01 (- (Seq_length ar@9@01) 1))
      (Seq_index ar@9@01 (- (Seq_length ar@9@01) 1)))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    (Seq_index ar@9@01 (- (Seq_length ar@9@01) 1))
    (Seq_index ar@9@01 (- (Seq_length ar@9@01) 1)))
  (not (= (Seq_index ar@9@01 (- (Seq_length ar@9@01) 1)) $Ref.null))))
(pop) ; 3
(push) ; 3
; [else-branch: 30 | !(0 <= |ar@9@01| - 1 && |ar@9@01| - 1 < len@8@01)]
(assert (not
  (and (<= 0 (- (Seq_length ar@9@01) 1)) (< (- (Seq_length ar@9@01) 1) len@8@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))
  $Snap.unit))
(pop) ; 3
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__send_body_146 ----------
(declare-const diz@42@01 $Ref)
(declare-const current_thread_id@43@01 Int)
(declare-const ar@44@01 Seq<$Ref>)
(declare-const i@45@01 Int)
(declare-const diz@46@01 $Ref)
(declare-const current_thread_id@47@01 Int)
(declare-const ar@48@01 Seq<$Ref>)
(declare-const i@49@01 Int)
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
; [eval] 0 <= i
(assert (<= 0 i@49@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@50@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
  $Snap.unit))
; [eval] i < |ar|
; [eval] |ar|
(assert (< i@49@01 (Seq_length ar@48@01)))
; [eval] ar[i]
(push) ; 2
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@48@01 i@49@01) $Ref.null)))
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
; ---------- Ref__recv_body_148 ----------
(declare-const diz@51@01 $Ref)
(declare-const current_thread_id@52@01 Int)
(declare-const ar@53@01 Seq<$Ref>)
(declare-const i@54@01 Int)
(declare-const diz@55@01 $Ref)
(declare-const current_thread_id@56@01 Int)
(declare-const ar@57@01 Seq<$Ref>)
(declare-const i@58@01 Int)
(push) ; 1
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 ($Snap.combine ($Snap.first $t@59@01) ($Snap.second $t@59@01))))
(assert (= ($Snap.first $t@59@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@55@01 $Ref.null)))
(assert (=
  ($Snap.second $t@59@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@59@01))
    ($Snap.second ($Snap.second $t@59@01)))))
(assert (= ($Snap.first ($Snap.second $t@59@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@56@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@59@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@59@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@59@01))) $Snap.unit))
; [eval] 0 < i
(assert (< 0 i@58@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@59@01))) $Snap.unit))
; [eval] i <= |ar|
; [eval] |ar|
(assert (<= i@58@01 (Seq_length ar@57@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 3
(assert (not (>= (- i@58@01 1) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< (- i@58@01 1) (Seq_length ar@57@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@60@01 Int)
(assert (not (= (Seq_index ar@57@01 (- i@58@01 1)) $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_body_54 ----------
(declare-const diz@61@01 $Ref)
(declare-const current_thread_id@62@01 Int)
(declare-const len@63@01 Int)
(declare-const ar@64@01 Seq<$Ref>)
(declare-const br@65@01 Seq<$Ref>)
(declare-const i@66@01 Int)
(declare-const cr@67@01 Seq<$Ref>)
(declare-const diz@68@01 $Ref)
(declare-const current_thread_id@69@01 Int)
(declare-const len@70@01 Int)
(declare-const ar@71@01 Seq<$Ref>)
(declare-const br@72@01 Seq<$Ref>)
(declare-const i@73@01 Int)
(declare-const cr@74@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 ($Snap.combine ($Snap.first $t@75@01) ($Snap.second $t@75@01))))
(assert (= ($Snap.first $t@75@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@68@01 $Ref.null)))
(assert (=
  ($Snap.second $t@75@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@75@01))
    ($Snap.second ($Snap.second $t@75@01)))))
(assert (= ($Snap.first ($Snap.second $t@75@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@69@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@75@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@75@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@75@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@73@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@75@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@73@01 len@70@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))
  $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (= (Seq_length ar@71@01) len@70@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))))
; [eval] ar[i]
(push) ; 2
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@71@01 i@73@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (= (Seq_length br@72@01) len@70@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))))))
; [eval] br[i]
(push) ; 2
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@73@01 (Seq_length br@72@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 i@73@01) (Seq_index br@72@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index br@72@01 i@73@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
(assert (= (Seq_length cr@74@01) len@70@01))
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@73@01 (Seq_length cr@74@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) (Seq_index cr@74@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 i@73@01) (Seq_index cr@74@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index cr@74@01 i@73@01) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(assert (= ($Snap.first $t@76@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@76@01))
    ($Snap.second ($Snap.second $t@76@01)))))
(assert (= ($Snap.first ($Snap.second $t@76@01)) $Snap.unit))
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second $t@76@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@76@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@76@01))) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@76@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))
; [eval] br[i]
(push) ; 3
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@73@01 (Seq_length br@72@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 i@73@01) (Seq_index br@72@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))))
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@73@01 (Seq_length cr@74@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) (Seq_index cr@74@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 i@73@01) (Seq_index cr@74@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))))))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> i@73@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> i@73@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | i@73@01 > 0 | live]
; [else-branch: 31 | !(i@73@01 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 31 | i@73@01 > 0]
(assert (> i@73@01 0))
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 4
(assert (not (>= (- i@73@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (- i@73@01 1) (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index cr@74@01 i@73@01) (Seq_index ar@71@01 (- i@73@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) (Seq_index ar@71@01 (- i@73@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 i@73@01) (Seq_index ar@71@01 (- i@73@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) $Ref.null)))
; [eval] i == |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@73@01 (- (Seq_length ar@71@01) 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= i@73@01 (- (Seq_length ar@71@01) 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | i@73@01 == |ar@71@01| - 1 | live]
; [else-branch: 32 | i@73@01 != |ar@71@01| - 1 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 32 | i@73@01 == |ar@71@01| - 1]
(assert (= i@73@01 (- (Seq_length ar@71@01) 1)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))))))
(pop) ; 4
(push) ; 4
; [else-branch: 32 | i@73@01 != |ar@71@01| - 1]
(assert (not (= i@73@01 (- (Seq_length ar@71@01) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))
  $Snap.unit))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 31 | !(i@73@01 > 0)]
(assert (not (> i@73@01 0)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))
  $Snap.unit))
; [eval] i == |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@73@01 (- (Seq_length ar@71@01) 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= i@73@01 (- (Seq_length ar@71@01) 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | i@73@01 == |ar@71@01| - 1 | live]
; [else-branch: 33 | i@73@01 != |ar@71@01| - 1 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 33 | i@73@01 == |ar@71@01| - 1]
(assert (= i@73@01 (- (Seq_length ar@71@01) 1)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))))))
(pop) ; 4
(push) ; 4
; [else-branch: 33 | i@73@01 != |ar@71@01| - 1]
(assert (not (= i@73@01 (- (Seq_length ar@71@01) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))
  $Snap.unit))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@77@01 $Ref)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@78@01 Int)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@79@01 $Ref)
; [exec]
; var __flatten_9: Ref
(declare-const __flatten_9@80@01 $Ref)
; [exec]
; var __flatten_10: Int
(declare-const __flatten_10@81@01 Int)
; [exec]
; var __flatten_11: Ref
(declare-const __flatten_11@82@01 $Ref)
; [exec]
; __flatten_4 := ar[i]
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@83@01 $Ref)
(assert (= __flatten_4@83@01 (Seq_index ar@71@01 i@73@01)))
; [exec]
; __flatten_6 := br[i]
; [eval] br[i]
(push) ; 3
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@73@01 (Seq_length br@72@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@84@01 $Ref)
(assert (= __flatten_6@84@01 (Seq_index br@72@01 i@73@01)))
; [exec]
; __flatten_5 := __flatten_6.Ref__Integer_value + 1
; [eval] __flatten_6.Ref__Integer_value + 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index cr@74@01 i@73@01) __flatten_6@84@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) __flatten_6@84@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@85@01 Int)
(assert (=
  __flatten_5@85@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))))
    1)))
; [exec]
; __flatten_4.Ref__Integer_value := __flatten_5
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index cr@74@01 i@73@01) __flatten_4@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) __flatten_4@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 i@73@01) __flatten_4@83@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index cr@74@01 i@73@01) __flatten_4@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) __flatten_4@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_4@83@01 $Ref.null)))
; [eval] i < len - 1
; [eval] len - 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@73@01 (- len@70@01 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@73@01 (- len@70@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | i@73@01 < len@70@01 - 1 | live]
; [else-branch: 34 | !(i@73@01 < len@70@01 - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 34 | i@73@01 < len@70@01 - 1]
(assert (< i@73@01 (- len@70@01 1)))
; [exec]
; Ref__send_body_146(diz, current_thread_id, ar, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 <= i
; [eval] i < |ar|
; [eval] |ar|
(push) ; 4
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< i@73@01 (Seq_length ar@71@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] i > 0
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> i@73@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> i@73@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | i@73@01 > 0 | live]
; [else-branch: 35 | !(i@73@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | i@73@01 > 0]
(assert (> i@73@01 0))
; [exec]
; Ref__recv_body_148(diz, current_thread_id, ar, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 < i
(push) ; 5
(assert (not (< 0 i@73@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< 0 i@73@01))
; [eval] i <= |ar|
; [eval] |ar|
(push) ; 5
(assert (not (<= i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= i@73@01 (Seq_length ar@71@01)))
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 5
(assert (not (>= (- i@73@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (- i@73@01 1) (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $t@86@01 Int)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@74@01 i@73@01) (Seq_index ar@71@01 (- i@73@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) (Seq_index ar@71@01 (- i@73@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= __flatten_4@83@01 (Seq_index ar@71@01 (- i@73@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_9 := cr[i]
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length cr@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@87@01 $Ref)
(assert (= __flatten_9@87@01 (Seq_index cr@74@01 i@73@01)))
; [exec]
; __flatten_11 := ar[i - 1]
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 5
(assert (not (>= (- i@73@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (- i@73@01 1) (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_11@88@01 $Ref)
(assert (= __flatten_11@88@01 (Seq_index ar@71@01 (- i@73@01 1))))
; [exec]
; __flatten_10 := __flatten_11.Ref__Integer_value + 2
; [eval] __flatten_11.Ref__Integer_value + 2
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) __flatten_11@88@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_10@89@01 Int)
(assert (= __flatten_10@89@01 (+ $t@86@01 2)))
; [exec]
; __flatten_9.Ref__Integer_value := __flatten_10
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) __flatten_9@87@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@74@01 i@73@01) __flatten_9@87@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) __flatten_9@87@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) __flatten_9@87@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= __flatten_4@83@01 __flatten_9@87@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_9@87@01 $Ref.null)))
; [eval] 0 <= i
; [eval] i < len
; [eval] |ar| == len
; [eval] |ar|
; [eval] ar[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= __flatten_9@87@01 (Seq_index ar@71@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) (Seq_index ar@71@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) (Seq_index ar@71@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |br| == len
; [eval] |br|
; [eval] br[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length br@72@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |cr| == len
; [eval] |cr|
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length cr@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@73@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | i@73@01 > 0 | live]
; [else-branch: 36 | !(i@73@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 36 | i@73@01 > 0]
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 6
(assert (not (>= (- i@73@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (- i@73@01 1) (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] i == |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= i@73@01 (- (Seq_length ar@71@01) 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | i@73@01 == |ar@71@01| - 1 | dead]
; [else-branch: 37 | i@73@01 != |ar@71@01| - 1 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 37 | i@73@01 != |ar@71@01| - 1]
(assert (not (= i@73@01 (- (Seq_length ar@71@01) 1))))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 35 | !(i@73@01 > 0)]
(assert (not (> i@73@01 0)))
(pop) ; 4
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (> i@73@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> i@73@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | !(i@73@01 > 0) | live]
; [else-branch: 38 | i@73@01 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 38 | !(i@73@01 > 0)]
(assert (not (> i@73@01 0)))
; [eval] 0 <= i
; [eval] i < len
; [eval] |ar| == len
; [eval] |ar|
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@74@01 i@73@01) (Seq_index ar@71@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) (Seq_index ar@71@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |br| == len
; [eval] |br|
; [eval] br[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length br@72@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |cr| == len
; [eval] |cr|
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length cr@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] i > 0
; [then-branch: 39 | i@73@01 > 0 | dead]
; [else-branch: 39 | !(i@73@01 > 0) | live]
(push) ; 5
; [else-branch: 39 | !(i@73@01 > 0)]
; [eval] i == |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= i@73@01 (- (Seq_length ar@71@01) 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | i@73@01 == |ar@71@01| - 1 | dead]
; [else-branch: 40 | i@73@01 != |ar@71@01| - 1 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 40 | i@73@01 != |ar@71@01| - 1]
(assert (not (= i@73@01 (- (Seq_length ar@71@01) 1))))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 38 | i@73@01 > 0]
(assert (> i@73@01 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 34 | !(i@73@01 < len@70@01 - 1)]
(assert (not (< i@73@01 (- len@70@01 1))))
(pop) ; 3
; [eval] !(i < len - 1)
; [eval] i < len - 1
; [eval] len - 1
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@73@01 (- len@70@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@73@01 (- len@70@01 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | !(i@73@01 < len@70@01 - 1) | live]
; [else-branch: 41 | i@73@01 < len@70@01 - 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 41 | !(i@73@01 < len@70@01 - 1)]
(assert (not (< i@73@01 (- len@70@01 1))))
; [eval] i > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> i@73@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> i@73@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | i@73@01 > 0 | live]
; [else-branch: 42 | !(i@73@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 42 | i@73@01 > 0]
(assert (> i@73@01 0))
; [exec]
; Ref__recv_body_148(diz, current_thread_id, ar, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 < i
(push) ; 5
(assert (not (< 0 i@73@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< 0 i@73@01))
; [eval] i <= |ar|
; [eval] |ar|
(push) ; 5
(assert (not (<= i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= i@73@01 (Seq_length ar@71@01)))
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 5
(assert (not (>= (- i@73@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (- i@73@01 1) (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $t@90@01 Int)
(push) ; 5
(set-option :timeout 10)
(assert (not (= __flatten_4@83@01 (Seq_index ar@71@01 (- i@73@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@74@01 i@73@01) (Seq_index ar@71@01 (- i@73@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) (Seq_index ar@71@01 (- i@73@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_9 := cr[i]
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length cr@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@91@01 $Ref)
(assert (= __flatten_9@91@01 (Seq_index cr@74@01 i@73@01)))
; [exec]
; __flatten_11 := ar[i - 1]
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 5
(assert (not (>= (- i@73@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (- i@73@01 1) (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_11@92@01 $Ref)
(assert (= __flatten_11@92@01 (Seq_index ar@71@01 (- i@73@01 1))))
; [exec]
; __flatten_10 := __flatten_11.Ref__Integer_value + 2
; [eval] __flatten_11.Ref__Integer_value + 2
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) __flatten_11@92@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_10@93@01 Int)
(assert (= __flatten_10@93@01 (+ $t@90@01 2)))
; [exec]
; __flatten_9.Ref__Integer_value := __flatten_10
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) __flatten_9@91@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= __flatten_4@83@01 __flatten_9@91@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@74@01 i@73@01) __flatten_9@91@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) __flatten_9@91@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= __flatten_4@83@01 __flatten_9@91@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@72@01 i@73@01) __flatten_9@91@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_9@91@01 $Ref.null)))
; [eval] 0 <= i
; [eval] i < len
; [eval] |ar| == len
; [eval] |ar|
; [eval] ar[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= __flatten_9@91@01 (Seq_index ar@71@01 i@73@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@71@01 (- i@73@01 1)) (Seq_index ar@71@01 i@73@01))))
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
; [eval] |br| == len
; [eval] |br|
; [eval] br[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length br@72@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |cr| == len
; [eval] |cr|
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length cr@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@73@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | i@73@01 > 0 | live]
; [else-branch: 43 | !(i@73@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 43 | i@73@01 > 0]
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 6
(assert (not (>= (- i@73@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (- i@73@01 1) (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] i == |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= i@73@01 (- (Seq_length ar@71@01) 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= i@73@01 (- (Seq_length ar@71@01) 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | i@73@01 == |ar@71@01| - 1 | live]
; [else-branch: 44 | i@73@01 != |ar@71@01| - 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 44 | i@73@01 == |ar@71@01| - 1]
(assert (= i@73@01 (- (Seq_length ar@71@01) 1)))
; [eval] ar[i]
(push) ; 7
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 42 | !(i@73@01 > 0)]
(assert (not (> i@73@01 0)))
(pop) ; 4
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (> i@73@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> i@73@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | !(i@73@01 > 0) | live]
; [else-branch: 45 | i@73@01 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 45 | !(i@73@01 > 0)]
(assert (not (> i@73@01 0)))
; [eval] 0 <= i
; [eval] i < len
; [eval] |ar| == len
; [eval] |ar|
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |br| == len
; [eval] |br|
; [eval] br[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length br@72@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |cr| == len
; [eval] |cr|
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@73@01 (Seq_length cr@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] i > 0
; [then-branch: 46 | i@73@01 > 0 | dead]
; [else-branch: 46 | !(i@73@01 > 0) | live]
(push) ; 5
; [else-branch: 46 | !(i@73@01 > 0)]
; [eval] i == |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= i@73@01 (- (Seq_length ar@71@01) 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= i@73@01 (- (Seq_length ar@71@01) 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | i@73@01 == |ar@71@01| - 1 | live]
; [else-branch: 47 | i@73@01 != |ar@71@01| - 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 47 | i@73@01 == |ar@71@01| - 1]
(assert (= i@73@01 (- (Seq_length ar@71@01) 1)))
; [eval] ar[i]
(push) ; 7
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@73@01 (Seq_length ar@71@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 45 | i@73@01 > 0]
(assert (> i@73@01 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 41 | i@73@01 < len@70@01 - 1]
(assert (< i@73@01 (- len@70@01 1)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Ref__guard_check_S1_S2 ----------
(declare-const diz@94@01 $Ref)
(declare-const current_thread_id@95@01 Int)
(declare-const len@96@01 Int)
(declare-const ar@97@01 Seq<$Ref>)
(declare-const br@98@01 Seq<$Ref>)
(declare-const i@99@01 Int)
(declare-const cr@100@01 Seq<$Ref>)
(declare-const diz@101@01 $Ref)
(declare-const current_thread_id@102@01 Int)
(declare-const len@103@01 Int)
(declare-const ar@104@01 Seq<$Ref>)
(declare-const br@105@01 Seq<$Ref>)
(declare-const i@106@01 Int)
(declare-const cr@107@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@108@01 $Snap)
(assert (= $t@108@01 ($Snap.combine ($Snap.first $t@108@01) ($Snap.second $t@108@01))))
(assert (= ($Snap.first $t@108@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@101@01 $Ref.null)))
(assert (=
  ($Snap.second $t@108@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@108@01))
    ($Snap.second ($Snap.second $t@108@01)))))
(assert (= ($Snap.first ($Snap.second $t@108@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@102@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@108@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@108@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@108@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@108@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@106@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@108@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@108@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@108@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@106@01 len@103@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@106@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@109@01 $Snap)
(assert (= $t@109@01 ($Snap.combine ($Snap.first $t@109@01) ($Snap.second $t@109@01))))
(assert (= ($Snap.first $t@109@01) $Snap.unit))
; [eval] 1 <= i
(assert (<= 1 i@106@01))
(assert (= ($Snap.second $t@109@01) $Snap.unit))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
(assert (< (- i@106@01 1) (- len@103@01 1)))
(pop) ; 2
(push) ; 2
; [eval] 1 <= i
(push) ; 3
(assert (not (<= 1 i@106@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 i@106@01))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
(push) ; 3
(assert (not (< (- i@106@01 1) (- len@103@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (- i@106@01 1) (- len@103@01 1)))
(pop) ; 2
(pop) ; 1
; ---------- Ref__resource_check_S1_S2 ----------
(declare-const diz@110@01 $Ref)
(declare-const current_thread_id@111@01 Int)
(declare-const len@112@01 Int)
(declare-const ar@113@01 Seq<$Ref>)
(declare-const br@114@01 Seq<$Ref>)
(declare-const i@115@01 Int)
(declare-const cr@116@01 Seq<$Ref>)
(declare-const diz@117@01 $Ref)
(declare-const current_thread_id@118@01 Int)
(declare-const len@119@01 Int)
(declare-const ar@120@01 Seq<$Ref>)
(declare-const br@121@01 Seq<$Ref>)
(declare-const i@122@01 Int)
(declare-const cr@123@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@124@01 $Snap)
(assert (= $t@124@01 ($Snap.combine ($Snap.first $t@124@01) ($Snap.second $t@124@01))))
(assert (= ($Snap.first $t@124@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@117@01 $Ref.null)))
(assert (=
  ($Snap.second $t@124@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@124@01))
    ($Snap.second ($Snap.second $t@124@01)))))
(assert (= ($Snap.first ($Snap.second $t@124@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@118@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@124@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@124@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@124@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@122@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@124@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@122@01 len@119@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
  $Snap.unit))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
(assert (< (- i@122@01 1) (- len@119@01 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@122@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))))
  $Snap.unit))
; [eval] len <= |ar|
; [eval] |ar|
(assert (<= len@119@01 (Seq_length ar@120@01)))
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 2
(assert (not (>= (- i@122@01 1) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< (- i@122@01 1) (Seq_length ar@120@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@120@01 (- i@122@01 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@125@01 $Snap)
(assert (= $t@125@01 ($Snap.combine ($Snap.first $t@125@01) ($Snap.second $t@125@01))))
(assert (= ($Snap.first $t@125@01) $Snap.unit))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 3
(assert (not (>= (- i@122@01 1) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< (- i@122@01 1) (Seq_length ar@120@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(push) ; 2
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 3
(assert (not (>= (- i@122@01 1) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< (- i@122@01 1) (Seq_length ar@120@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__zero_array ----------
(declare-const diz@126@01 $Ref)
(declare-const current_thread_id@127@01 Int)
(declare-const ar@128@01 Seq<$Ref>)
(declare-const br@129@01 Seq<$Ref>)
(declare-const cr@130@01 Seq<$Ref>)
(declare-const len@131@01 Int)
(declare-const diz@132@01 $Ref)
(declare-const current_thread_id@133@01 Int)
(declare-const ar@134@01 Seq<$Ref>)
(declare-const br@135@01 Seq<$Ref>)
(declare-const cr@136@01 Seq<$Ref>)
(declare-const len@137@01 Int)
(push) ; 1
(declare-const $t@138@01 $Snap)
(assert (= $t@138@01 ($Snap.combine ($Snap.first $t@138@01) ($Snap.second $t@138@01))))
(assert (= ($Snap.first $t@138@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@132@01 $Ref.null)))
(assert (=
  ($Snap.second $t@138@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@138@01))
    ($Snap.second ($Snap.second $t@138@01)))))
(assert (= ($Snap.first ($Snap.second $t@138@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@133@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@138@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@138@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@138@01))) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (= (Seq_length ar@134@01) len@137@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@138@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { ar[j], ar[k] } 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@139@01 Int)
(declare-const k@140@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 48 | !(0 <= j@139@01) | live]
; [else-branch: 48 | 0 <= j@139@01 | live]
(push) ; 4
; [then-branch: 48 | !(0 <= j@139@01)]
(assert (not (<= 0 j@139@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 48 | 0 <= j@139@01]
(assert (<= 0 j@139@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 49 | !(j@139@01 < |ar@134@01|) | live]
; [else-branch: 49 | j@139@01 < |ar@134@01| | live]
(push) ; 6
; [then-branch: 49 | !(j@139@01 < |ar@134@01|)]
(assert (not (< j@139@01 (Seq_length ar@134@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 49 | j@139@01 < |ar@134@01|]
(assert (< j@139@01 (Seq_length ar@134@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 50 | !(0 <= k@140@01) | live]
; [else-branch: 50 | 0 <= k@140@01 | live]
(push) ; 8
; [then-branch: 50 | !(0 <= k@140@01)]
(assert (not (<= 0 k@140@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 50 | 0 <= k@140@01]
(assert (<= 0 k@140@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 51 | !(k@140@01 < |ar@134@01|) | live]
; [else-branch: 51 | k@140@01 < |ar@134@01| | live]
(push) ; 10
; [then-branch: 51 | !(k@140@01 < |ar@134@01|)]
(assert (not (< k@140@01 (Seq_length ar@134@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 51 | k@140@01 < |ar@134@01|]
(assert (< k@140@01 (Seq_length ar@134@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@140@01 (Seq_length ar@134@01))
  (not (< k@140@01 (Seq_length ar@134@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@140@01)
  (and
    (<= 0 k@140@01)
    (or
      (< k@140@01 (Seq_length ar@134@01))
      (not (< k@140@01 (Seq_length ar@134@01)))))))
(assert (or (<= 0 k@140@01) (not (<= 0 k@140@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@139@01 (Seq_length ar@134@01))
  (and
    (< j@139@01 (Seq_length ar@134@01))
    (=>
      (<= 0 k@140@01)
      (and
        (<= 0 k@140@01)
        (or
          (< k@140@01 (Seq_length ar@134@01))
          (not (< k@140@01 (Seq_length ar@134@01))))))
    (or (<= 0 k@140@01) (not (<= 0 k@140@01))))))
(assert (or
  (< j@139@01 (Seq_length ar@134@01))
  (not (< j@139@01 (Seq_length ar@134@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@139@01)
  (and
    (<= 0 j@139@01)
    (=>
      (< j@139@01 (Seq_length ar@134@01))
      (and
        (< j@139@01 (Seq_length ar@134@01))
        (=>
          (<= 0 k@140@01)
          (and
            (<= 0 k@140@01)
            (or
              (< k@140@01 (Seq_length ar@134@01))
              (not (< k@140@01 (Seq_length ar@134@01))))))
        (or (<= 0 k@140@01) (not (<= 0 k@140@01)))))
    (or
      (< j@139@01 (Seq_length ar@134@01))
      (not (< j@139@01 (Seq_length ar@134@01)))))))
(assert (or (<= 0 j@139@01) (not (<= 0 j@139@01))))
(push) ; 3
; [then-branch: 52 | 0 <= j@139@01 && j@139@01 < |ar@134@01| && 0 <= k@140@01 && k@140@01 < |ar@134@01| && j@139@01 != k@140@01 | live]
; [else-branch: 52 | !(0 <= j@139@01 && j@139@01 < |ar@134@01| && 0 <= k@140@01 && k@140@01 < |ar@134@01| && j@139@01 != k@140@01) | live]
(push) ; 4
; [then-branch: 52 | 0 <= j@139@01 && j@139@01 < |ar@134@01| && 0 <= k@140@01 && k@140@01 < |ar@134@01| && j@139@01 != k@140@01]
(assert (and
  (<= 0 j@139@01)
  (and
    (< j@139@01 (Seq_length ar@134@01))
    (and
      (<= 0 k@140@01)
      (and (< k@140@01 (Seq_length ar@134@01)) (not (= j@139@01 k@140@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 5
(assert (not (>= j@139@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@140@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 52 | !(0 <= j@139@01 && j@139@01 < |ar@134@01| && 0 <= k@140@01 && k@140@01 < |ar@134@01| && j@139@01 != k@140@01)]
(assert (not
  (and
    (<= 0 j@139@01)
    (and
      (< j@139@01 (Seq_length ar@134@01))
      (and
        (<= 0 k@140@01)
        (and (< k@140@01 (Seq_length ar@134@01)) (not (= j@139@01 k@140@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@139@01)
    (and
      (< j@139@01 (Seq_length ar@134@01))
      (and
        (<= 0 k@140@01)
        (and (< k@140@01 (Seq_length ar@134@01)) (not (= j@139@01 k@140@01))))))
  (and
    (<= 0 j@139@01)
    (< j@139@01 (Seq_length ar@134@01))
    (<= 0 k@140@01)
    (< k@140@01 (Seq_length ar@134@01))
    (not (= j@139@01 k@140@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@139@01)
      (and
        (< j@139@01 (Seq_length ar@134@01))
        (and
          (<= 0 k@140@01)
          (and (< k@140@01 (Seq_length ar@134@01)) (not (= j@139@01 k@140@01)))))))
  (and
    (<= 0 j@139@01)
    (and
      (< j@139@01 (Seq_length ar@134@01))
      (and
        (<= 0 k@140@01)
        (and (< k@140@01 (Seq_length ar@134@01)) (not (= j@139@01 k@140@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@139@01 Int) (k@140@01 Int)) (!
  (and
    (=>
      (<= 0 j@139@01)
      (and
        (<= 0 j@139@01)
        (=>
          (< j@139@01 (Seq_length ar@134@01))
          (and
            (< j@139@01 (Seq_length ar@134@01))
            (=>
              (<= 0 k@140@01)
              (and
                (<= 0 k@140@01)
                (or
                  (< k@140@01 (Seq_length ar@134@01))
                  (not (< k@140@01 (Seq_length ar@134@01))))))
            (or (<= 0 k@140@01) (not (<= 0 k@140@01)))))
        (or
          (< j@139@01 (Seq_length ar@134@01))
          (not (< j@139@01 (Seq_length ar@134@01))))))
    (or (<= 0 j@139@01) (not (<= 0 j@139@01)))
    (=>
      (and
        (<= 0 j@139@01)
        (and
          (< j@139@01 (Seq_length ar@134@01))
          (and
            (<= 0 k@140@01)
            (and (< k@140@01 (Seq_length ar@134@01)) (not (= j@139@01 k@140@01))))))
      (and
        (<= 0 j@139@01)
        (< j@139@01 (Seq_length ar@134@01))
        (<= 0 k@140@01)
        (< k@140@01 (Seq_length ar@134@01))
        (not (= j@139@01 k@140@01))))
    (or
      (not
        (and
          (<= 0 j@139@01)
          (and
            (< j@139@01 (Seq_length ar@134@01))
            (and
              (<= 0 k@140@01)
              (and
                (< k@140@01 (Seq_length ar@134@01))
                (not (= j@139@01 k@140@01)))))))
      (and
        (<= 0 j@139@01)
        (and
          (< j@139@01 (Seq_length ar@134@01))
          (and
            (<= 0 k@140@01)
            (and (< k@140@01 (Seq_length ar@134@01)) (not (= j@139@01 k@140@01))))))))
  :pattern ((Seq_index ar@134@01 j@139@01) (Seq_index ar@134@01 k@140@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@169@12@169@106-aux|)))
(assert (forall ((j@139@01 Int) (k@140@01 Int)) (!
  (=>
    (and
      (<= 0 j@139@01)
      (and
        (< j@139@01 (Seq_length ar@134@01))
        (and
          (<= 0 k@140@01)
          (and (< k@140@01 (Seq_length ar@134@01)) (not (= j@139@01 k@140@01))))))
    (not (= (Seq_index ar@134@01 j@139@01) (Seq_index ar@134@01 k@140@01))))
  :pattern ((Seq_index ar@134@01 j@139@01) (Seq_index ar@134@01 k@140@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@169@12@169@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))
(declare-const i@141@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 53 | !(0 <= i@141@01) | live]
; [else-branch: 53 | 0 <= i@141@01 | live]
(push) ; 4
; [then-branch: 53 | !(0 <= i@141@01)]
(assert (not (<= 0 i@141@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 53 | 0 <= i@141@01]
(assert (<= 0 i@141@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@141@01) (not (<= 0 i@141@01))))
(assert (and (<= 0 i@141@01) (< i@141@01 len@137@01)))
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@141@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@141@01 (Seq_length ar@134@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@142@01 ($Ref) Int)
(declare-fun img@143@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@141@01 Int)) (!
  (=>
    (and (<= 0 i@141@01) (< i@141@01 len@137@01))
    (or (<= 0 i@141@01) (not (<= 0 i@141@01))))
  :pattern ((Seq_index ar@134@01 i@141@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@141@01 Int) (i2@141@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@141@01) (< i1@141@01 len@137@01))
      (and (<= 0 i2@141@01) (< i2@141@01 len@137@01))
      (= (Seq_index ar@134@01 i1@141@01) (Seq_index ar@134@01 i2@141@01)))
    (= i1@141@01 i2@141@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@141@01 Int)) (!
  (=>
    (and (<= 0 i@141@01) (< i@141@01 len@137@01))
    (and
      (= (inv@142@01 (Seq_index ar@134@01 i@141@01)) i@141@01)
      (img@143@01 (Seq_index ar@134@01 i@141@01))))
  :pattern ((Seq_index ar@134@01 i@141@01))
  :qid |quant-u-72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@143@01 r)
      (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) len@137@01)))
    (= (Seq_index ar@134@01 (inv@142@01 r)) r))
  :pattern ((inv@142@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@141@01 Int)) (!
  (=>
    (and (<= 0 i@141@01) (< i@141@01 len@137@01))
    (not (= (Seq_index ar@134@01 i@141@01) $Ref.null)))
  :pattern ((Seq_index ar@134@01 i@141@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (= (Seq_length br@135@01) len@137@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { br[j], br[k] } 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k])
(declare-const j@144@01 Int)
(declare-const k@145@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k]
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 54 | !(0 <= j@144@01) | live]
; [else-branch: 54 | 0 <= j@144@01 | live]
(push) ; 4
; [then-branch: 54 | !(0 <= j@144@01)]
(assert (not (<= 0 j@144@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 54 | 0 <= j@144@01]
(assert (<= 0 j@144@01))
; [eval] j < |br|
; [eval] |br|
(push) ; 5
; [then-branch: 55 | !(j@144@01 < |br@135@01|) | live]
; [else-branch: 55 | j@144@01 < |br@135@01| | live]
(push) ; 6
; [then-branch: 55 | !(j@144@01 < |br@135@01|)]
(assert (not (< j@144@01 (Seq_length br@135@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 55 | j@144@01 < |br@135@01|]
(assert (< j@144@01 (Seq_length br@135@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 56 | !(0 <= k@145@01) | live]
; [else-branch: 56 | 0 <= k@145@01 | live]
(push) ; 8
; [then-branch: 56 | !(0 <= k@145@01)]
(assert (not (<= 0 k@145@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 56 | 0 <= k@145@01]
(assert (<= 0 k@145@01))
; [eval] k < |br|
; [eval] |br|
(push) ; 9
; [then-branch: 57 | !(k@145@01 < |br@135@01|) | live]
; [else-branch: 57 | k@145@01 < |br@135@01| | live]
(push) ; 10
; [then-branch: 57 | !(k@145@01 < |br@135@01|)]
(assert (not (< k@145@01 (Seq_length br@135@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 57 | k@145@01 < |br@135@01|]
(assert (< k@145@01 (Seq_length br@135@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@145@01 (Seq_length br@135@01))
  (not (< k@145@01 (Seq_length br@135@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@145@01)
  (and
    (<= 0 k@145@01)
    (or
      (< k@145@01 (Seq_length br@135@01))
      (not (< k@145@01 (Seq_length br@135@01)))))))
(assert (or (<= 0 k@145@01) (not (<= 0 k@145@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@144@01 (Seq_length br@135@01))
  (and
    (< j@144@01 (Seq_length br@135@01))
    (=>
      (<= 0 k@145@01)
      (and
        (<= 0 k@145@01)
        (or
          (< k@145@01 (Seq_length br@135@01))
          (not (< k@145@01 (Seq_length br@135@01))))))
    (or (<= 0 k@145@01) (not (<= 0 k@145@01))))))
(assert (or
  (< j@144@01 (Seq_length br@135@01))
  (not (< j@144@01 (Seq_length br@135@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@144@01)
  (and
    (<= 0 j@144@01)
    (=>
      (< j@144@01 (Seq_length br@135@01))
      (and
        (< j@144@01 (Seq_length br@135@01))
        (=>
          (<= 0 k@145@01)
          (and
            (<= 0 k@145@01)
            (or
              (< k@145@01 (Seq_length br@135@01))
              (not (< k@145@01 (Seq_length br@135@01))))))
        (or (<= 0 k@145@01) (not (<= 0 k@145@01)))))
    (or
      (< j@144@01 (Seq_length br@135@01))
      (not (< j@144@01 (Seq_length br@135@01)))))))
(assert (or (<= 0 j@144@01) (not (<= 0 j@144@01))))
(push) ; 3
; [then-branch: 58 | 0 <= j@144@01 && j@144@01 < |br@135@01| && 0 <= k@145@01 && k@145@01 < |br@135@01| && j@144@01 != k@145@01 | live]
; [else-branch: 58 | !(0 <= j@144@01 && j@144@01 < |br@135@01| && 0 <= k@145@01 && k@145@01 < |br@135@01| && j@144@01 != k@145@01) | live]
(push) ; 4
; [then-branch: 58 | 0 <= j@144@01 && j@144@01 < |br@135@01| && 0 <= k@145@01 && k@145@01 < |br@135@01| && j@144@01 != k@145@01]
(assert (and
  (<= 0 j@144@01)
  (and
    (< j@144@01 (Seq_length br@135@01))
    (and
      (<= 0 k@145@01)
      (and (< k@145@01 (Seq_length br@135@01)) (not (= j@144@01 k@145@01)))))))
; [eval] br[j] != br[k]
; [eval] br[j]
(push) ; 5
(assert (not (>= j@144@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] br[k]
(push) ; 5
(assert (not (>= k@145@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 58 | !(0 <= j@144@01 && j@144@01 < |br@135@01| && 0 <= k@145@01 && k@145@01 < |br@135@01| && j@144@01 != k@145@01)]
(assert (not
  (and
    (<= 0 j@144@01)
    (and
      (< j@144@01 (Seq_length br@135@01))
      (and
        (<= 0 k@145@01)
        (and (< k@145@01 (Seq_length br@135@01)) (not (= j@144@01 k@145@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@144@01)
    (and
      (< j@144@01 (Seq_length br@135@01))
      (and
        (<= 0 k@145@01)
        (and (< k@145@01 (Seq_length br@135@01)) (not (= j@144@01 k@145@01))))))
  (and
    (<= 0 j@144@01)
    (< j@144@01 (Seq_length br@135@01))
    (<= 0 k@145@01)
    (< k@145@01 (Seq_length br@135@01))
    (not (= j@144@01 k@145@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@144@01)
      (and
        (< j@144@01 (Seq_length br@135@01))
        (and
          (<= 0 k@145@01)
          (and (< k@145@01 (Seq_length br@135@01)) (not (= j@144@01 k@145@01)))))))
  (and
    (<= 0 j@144@01)
    (and
      (< j@144@01 (Seq_length br@135@01))
      (and
        (<= 0 k@145@01)
        (and (< k@145@01 (Seq_length br@135@01)) (not (= j@144@01 k@145@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@144@01 Int) (k@145@01 Int)) (!
  (and
    (=>
      (<= 0 j@144@01)
      (and
        (<= 0 j@144@01)
        (=>
          (< j@144@01 (Seq_length br@135@01))
          (and
            (< j@144@01 (Seq_length br@135@01))
            (=>
              (<= 0 k@145@01)
              (and
                (<= 0 k@145@01)
                (or
                  (< k@145@01 (Seq_length br@135@01))
                  (not (< k@145@01 (Seq_length br@135@01))))))
            (or (<= 0 k@145@01) (not (<= 0 k@145@01)))))
        (or
          (< j@144@01 (Seq_length br@135@01))
          (not (< j@144@01 (Seq_length br@135@01))))))
    (or (<= 0 j@144@01) (not (<= 0 j@144@01)))
    (=>
      (and
        (<= 0 j@144@01)
        (and
          (< j@144@01 (Seq_length br@135@01))
          (and
            (<= 0 k@145@01)
            (and (< k@145@01 (Seq_length br@135@01)) (not (= j@144@01 k@145@01))))))
      (and
        (<= 0 j@144@01)
        (< j@144@01 (Seq_length br@135@01))
        (<= 0 k@145@01)
        (< k@145@01 (Seq_length br@135@01))
        (not (= j@144@01 k@145@01))))
    (or
      (not
        (and
          (<= 0 j@144@01)
          (and
            (< j@144@01 (Seq_length br@135@01))
            (and
              (<= 0 k@145@01)
              (and
                (< k@145@01 (Seq_length br@135@01))
                (not (= j@144@01 k@145@01)))))))
      (and
        (<= 0 j@144@01)
        (and
          (< j@144@01 (Seq_length br@135@01))
          (and
            (<= 0 k@145@01)
            (and (< k@145@01 (Seq_length br@135@01)) (not (= j@144@01 k@145@01))))))))
  :pattern ((Seq_index br@135@01 j@144@01) (Seq_index br@135@01 k@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@172@12@172@106-aux|)))
(assert (forall ((j@144@01 Int) (k@145@01 Int)) (!
  (=>
    (and
      (<= 0 j@144@01)
      (and
        (< j@144@01 (Seq_length br@135@01))
        (and
          (<= 0 k@145@01)
          (and (< k@145@01 (Seq_length br@135@01)) (not (= j@144@01 k@145@01))))))
    (not (= (Seq_index br@135@01 j@144@01) (Seq_index br@135@01 k@145@01))))
  :pattern ((Seq_index br@135@01 j@144@01) (Seq_index br@135@01 k@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@172@12@172@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))))))
(declare-const i@146@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 59 | !(0 <= i@146@01) | live]
; [else-branch: 59 | 0 <= i@146@01 | live]
(push) ; 4
; [then-branch: 59 | !(0 <= i@146@01)]
(assert (not (<= 0 i@146@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 59 | 0 <= i@146@01]
(assert (<= 0 i@146@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@146@01) (not (<= 0 i@146@01))))
(assert (and (<= 0 i@146@01) (< i@146@01 len@137@01)))
; [eval] br[i]
(push) ; 3
(assert (not (>= i@146@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@146@01 (Seq_length br@135@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@147@01 ($Ref) Int)
(declare-fun img@148@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@146@01 Int)) (!
  (=>
    (and (<= 0 i@146@01) (< i@146@01 len@137@01))
    (or (<= 0 i@146@01) (not (<= 0 i@146@01))))
  :pattern ((Seq_index br@135@01 i@146@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@146@01 Int) (i2@146@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@146@01) (< i1@146@01 len@137@01))
      (and (<= 0 i2@146@01) (< i2@146@01 len@137@01))
      (= (Seq_index br@135@01 i1@146@01) (Seq_index br@135@01 i2@146@01)))
    (= i1@146@01 i2@146@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@146@01 Int)) (!
  (=>
    (and (<= 0 i@146@01) (< i@146@01 len@137@01))
    (and
      (= (inv@147@01 (Seq_index br@135@01 i@146@01)) i@146@01)
      (img@148@01 (Seq_index br@135@01 i@146@01))))
  :pattern ((Seq_index br@135@01 i@146@01))
  :qid |quant-u-74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@148@01 r)
      (and (<= 0 (inv@147@01 r)) (< (inv@147@01 r) len@137@01)))
    (= (Seq_index br@135@01 (inv@147@01 r)) r))
  :pattern ((inv@147@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@146@01 Int)) (!
  (=>
    (and (<= 0 i@146@01) (< i@146@01 len@137@01))
    (not (= (Seq_index br@135@01 i@146@01) $Ref.null)))
  :pattern ((Seq_index br@135@01 i@146@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@135@01 i@146@01) (Seq_index ar@134@01 i@141@01))
    (=
      (and
        (img@148@01 r)
        (and (<= 0 (inv@147@01 r)) (< (inv@147@01 r) len@137@01)))
      (and
        (img@143@01 r)
        (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) len@137@01)))))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
(assert (= (Seq_length cr@136@01) len@137@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { cr[j], cr[k] } 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k])
(declare-const j@149@01 Int)
(declare-const k@150@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k]
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 60 | !(0 <= j@149@01) | live]
; [else-branch: 60 | 0 <= j@149@01 | live]
(push) ; 4
; [then-branch: 60 | !(0 <= j@149@01)]
(assert (not (<= 0 j@149@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 60 | 0 <= j@149@01]
(assert (<= 0 j@149@01))
; [eval] j < |cr|
; [eval] |cr|
(push) ; 5
; [then-branch: 61 | !(j@149@01 < |cr@136@01|) | live]
; [else-branch: 61 | j@149@01 < |cr@136@01| | live]
(push) ; 6
; [then-branch: 61 | !(j@149@01 < |cr@136@01|)]
(assert (not (< j@149@01 (Seq_length cr@136@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 61 | j@149@01 < |cr@136@01|]
(assert (< j@149@01 (Seq_length cr@136@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 62 | !(0 <= k@150@01) | live]
; [else-branch: 62 | 0 <= k@150@01 | live]
(push) ; 8
; [then-branch: 62 | !(0 <= k@150@01)]
(assert (not (<= 0 k@150@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 62 | 0 <= k@150@01]
(assert (<= 0 k@150@01))
; [eval] k < |cr|
; [eval] |cr|
(push) ; 9
; [then-branch: 63 | !(k@150@01 < |cr@136@01|) | live]
; [else-branch: 63 | k@150@01 < |cr@136@01| | live]
(push) ; 10
; [then-branch: 63 | !(k@150@01 < |cr@136@01|)]
(assert (not (< k@150@01 (Seq_length cr@136@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 63 | k@150@01 < |cr@136@01|]
(assert (< k@150@01 (Seq_length cr@136@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@150@01 (Seq_length cr@136@01))
  (not (< k@150@01 (Seq_length cr@136@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@150@01)
  (and
    (<= 0 k@150@01)
    (or
      (< k@150@01 (Seq_length cr@136@01))
      (not (< k@150@01 (Seq_length cr@136@01)))))))
(assert (or (<= 0 k@150@01) (not (<= 0 k@150@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@149@01 (Seq_length cr@136@01))
  (and
    (< j@149@01 (Seq_length cr@136@01))
    (=>
      (<= 0 k@150@01)
      (and
        (<= 0 k@150@01)
        (or
          (< k@150@01 (Seq_length cr@136@01))
          (not (< k@150@01 (Seq_length cr@136@01))))))
    (or (<= 0 k@150@01) (not (<= 0 k@150@01))))))
(assert (or
  (< j@149@01 (Seq_length cr@136@01))
  (not (< j@149@01 (Seq_length cr@136@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@149@01)
  (and
    (<= 0 j@149@01)
    (=>
      (< j@149@01 (Seq_length cr@136@01))
      (and
        (< j@149@01 (Seq_length cr@136@01))
        (=>
          (<= 0 k@150@01)
          (and
            (<= 0 k@150@01)
            (or
              (< k@150@01 (Seq_length cr@136@01))
              (not (< k@150@01 (Seq_length cr@136@01))))))
        (or (<= 0 k@150@01) (not (<= 0 k@150@01)))))
    (or
      (< j@149@01 (Seq_length cr@136@01))
      (not (< j@149@01 (Seq_length cr@136@01)))))))
(assert (or (<= 0 j@149@01) (not (<= 0 j@149@01))))
(push) ; 3
; [then-branch: 64 | 0 <= j@149@01 && j@149@01 < |cr@136@01| && 0 <= k@150@01 && k@150@01 < |cr@136@01| && j@149@01 != k@150@01 | live]
; [else-branch: 64 | !(0 <= j@149@01 && j@149@01 < |cr@136@01| && 0 <= k@150@01 && k@150@01 < |cr@136@01| && j@149@01 != k@150@01) | live]
(push) ; 4
; [then-branch: 64 | 0 <= j@149@01 && j@149@01 < |cr@136@01| && 0 <= k@150@01 && k@150@01 < |cr@136@01| && j@149@01 != k@150@01]
(assert (and
  (<= 0 j@149@01)
  (and
    (< j@149@01 (Seq_length cr@136@01))
    (and
      (<= 0 k@150@01)
      (and (< k@150@01 (Seq_length cr@136@01)) (not (= j@149@01 k@150@01)))))))
; [eval] cr[j] != cr[k]
; [eval] cr[j]
(push) ; 5
(assert (not (>= j@149@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] cr[k]
(push) ; 5
(assert (not (>= k@150@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 64 | !(0 <= j@149@01 && j@149@01 < |cr@136@01| && 0 <= k@150@01 && k@150@01 < |cr@136@01| && j@149@01 != k@150@01)]
(assert (not
  (and
    (<= 0 j@149@01)
    (and
      (< j@149@01 (Seq_length cr@136@01))
      (and
        (<= 0 k@150@01)
        (and (< k@150@01 (Seq_length cr@136@01)) (not (= j@149@01 k@150@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@149@01)
    (and
      (< j@149@01 (Seq_length cr@136@01))
      (and
        (<= 0 k@150@01)
        (and (< k@150@01 (Seq_length cr@136@01)) (not (= j@149@01 k@150@01))))))
  (and
    (<= 0 j@149@01)
    (< j@149@01 (Seq_length cr@136@01))
    (<= 0 k@150@01)
    (< k@150@01 (Seq_length cr@136@01))
    (not (= j@149@01 k@150@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@149@01)
      (and
        (< j@149@01 (Seq_length cr@136@01))
        (and
          (<= 0 k@150@01)
          (and (< k@150@01 (Seq_length cr@136@01)) (not (= j@149@01 k@150@01)))))))
  (and
    (<= 0 j@149@01)
    (and
      (< j@149@01 (Seq_length cr@136@01))
      (and
        (<= 0 k@150@01)
        (and (< k@150@01 (Seq_length cr@136@01)) (not (= j@149@01 k@150@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@149@01 Int) (k@150@01 Int)) (!
  (and
    (=>
      (<= 0 j@149@01)
      (and
        (<= 0 j@149@01)
        (=>
          (< j@149@01 (Seq_length cr@136@01))
          (and
            (< j@149@01 (Seq_length cr@136@01))
            (=>
              (<= 0 k@150@01)
              (and
                (<= 0 k@150@01)
                (or
                  (< k@150@01 (Seq_length cr@136@01))
                  (not (< k@150@01 (Seq_length cr@136@01))))))
            (or (<= 0 k@150@01) (not (<= 0 k@150@01)))))
        (or
          (< j@149@01 (Seq_length cr@136@01))
          (not (< j@149@01 (Seq_length cr@136@01))))))
    (or (<= 0 j@149@01) (not (<= 0 j@149@01)))
    (=>
      (and
        (<= 0 j@149@01)
        (and
          (< j@149@01 (Seq_length cr@136@01))
          (and
            (<= 0 k@150@01)
            (and (< k@150@01 (Seq_length cr@136@01)) (not (= j@149@01 k@150@01))))))
      (and
        (<= 0 j@149@01)
        (< j@149@01 (Seq_length cr@136@01))
        (<= 0 k@150@01)
        (< k@150@01 (Seq_length cr@136@01))
        (not (= j@149@01 k@150@01))))
    (or
      (not
        (and
          (<= 0 j@149@01)
          (and
            (< j@149@01 (Seq_length cr@136@01))
            (and
              (<= 0 k@150@01)
              (and
                (< k@150@01 (Seq_length cr@136@01))
                (not (= j@149@01 k@150@01)))))))
      (and
        (<= 0 j@149@01)
        (and
          (< j@149@01 (Seq_length cr@136@01))
          (and
            (<= 0 k@150@01)
            (and (< k@150@01 (Seq_length cr@136@01)) (not (= j@149@01 k@150@01))))))))
  :pattern ((Seq_index cr@136@01 j@149@01) (Seq_index cr@136@01 k@150@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@175@12@175@106-aux|)))
(assert (forall ((j@149@01 Int) (k@150@01 Int)) (!
  (=>
    (and
      (<= 0 j@149@01)
      (and
        (< j@149@01 (Seq_length cr@136@01))
        (and
          (<= 0 k@150@01)
          (and (< k@150@01 (Seq_length cr@136@01)) (not (= j@149@01 k@150@01))))))
    (not (= (Seq_index cr@136@01 j@149@01) (Seq_index cr@136@01 k@150@01))))
  :pattern ((Seq_index cr@136@01 j@149@01) (Seq_index cr@136@01 k@150@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@175@12@175@106|)))
(declare-const i@151@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 65 | !(0 <= i@151@01) | live]
; [else-branch: 65 | 0 <= i@151@01 | live]
(push) ; 4
; [then-branch: 65 | !(0 <= i@151@01)]
(assert (not (<= 0 i@151@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 65 | 0 <= i@151@01]
(assert (<= 0 i@151@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@151@01) (not (<= 0 i@151@01))))
(assert (and (<= 0 i@151@01) (< i@151@01 len@137@01)))
; [eval] cr[i]
(push) ; 3
(assert (not (>= i@151@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@151@01 (Seq_length cr@136@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@152@01 ($Ref) Int)
(declare-fun img@153@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@151@01 Int)) (!
  (=>
    (and (<= 0 i@151@01) (< i@151@01 len@137@01))
    (or (<= 0 i@151@01) (not (<= 0 i@151@01))))
  :pattern ((Seq_index cr@136@01 i@151@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@151@01 Int) (i2@151@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@151@01) (< i1@151@01 len@137@01))
      (and (<= 0 i2@151@01) (< i2@151@01 len@137@01))
      (= (Seq_index cr@136@01 i1@151@01) (Seq_index cr@136@01 i2@151@01)))
    (= i1@151@01 i2@151@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@151@01 Int)) (!
  (=>
    (and (<= 0 i@151@01) (< i@151@01 len@137@01))
    (and
      (= (inv@152@01 (Seq_index cr@136@01 i@151@01)) i@151@01)
      (img@153@01 (Seq_index cr@136@01 i@151@01))))
  :pattern ((Seq_index cr@136@01 i@151@01))
  :qid |quant-u-77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@153@01 r)
      (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
    (= (Seq_index cr@136@01 (inv@152@01 r)) r))
  :pattern ((inv@152@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@151@01 Int)) (!
  (=>
    (and (<= 0 i@151@01) (< i@151@01 len@137@01))
    (not (= (Seq_index cr@136@01 i@151@01) $Ref.null)))
  :pattern ((Seq_index cr@136@01 i@151@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@136@01 i@151@01) (Seq_index br@135@01 i@146@01))
    (=
      (and
        (img@153@01 r)
        (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
      (and
        (img@148@01 r)
        (and (<= 0 (inv@147@01 r)) (< (inv@147@01 r) len@137@01)))))
  
  :qid |quant-u-78|))))
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
    (= (Seq_index cr@136@01 i@151@01) (Seq_index ar@134@01 i@141@01))
    (=
      (and
        (img@153@01 r)
        (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
      (and
        (img@143@01 r)
        (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) len@137@01)))))
  
  :qid |quant-u-79|))))
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
(declare-const $t@154@01 $Snap)
(assert (= $t@154@01 ($Snap.combine ($Snap.first $t@154@01) ($Snap.second $t@154@01))))
(assert (= ($Snap.first $t@154@01) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (=
  ($Snap.second $t@154@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@154@01))
    ($Snap.second ($Snap.second $t@154@01)))))
(declare-const i@155@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 66 | !(0 <= i@155@01) | live]
; [else-branch: 66 | 0 <= i@155@01 | live]
(push) ; 5
; [then-branch: 66 | !(0 <= i@155@01)]
(assert (not (<= 0 i@155@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 66 | 0 <= i@155@01]
(assert (<= 0 i@155@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@155@01) (not (<= 0 i@155@01))))
(assert (and (<= 0 i@155@01) (< i@155@01 len@137@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@155@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@155@01 (Seq_length ar@134@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@156@01 ($Ref) Int)
(declare-fun img@157@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@155@01 Int)) (!
  (=>
    (and (<= 0 i@155@01) (< i@155@01 len@137@01))
    (or (<= 0 i@155@01) (not (<= 0 i@155@01))))
  :pattern ((Seq_index ar@134@01 i@155@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@155@01 Int) (i2@155@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@155@01) (< i1@155@01 len@137@01))
      (and (<= 0 i2@155@01) (< i2@155@01 len@137@01))
      (= (Seq_index ar@134@01 i1@155@01) (Seq_index ar@134@01 i2@155@01)))
    (= i1@155@01 i2@155@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@155@01 Int)) (!
  (=>
    (and (<= 0 i@155@01) (< i@155@01 len@137@01))
    (and
      (= (inv@156@01 (Seq_index ar@134@01 i@155@01)) i@155@01)
      (img@157@01 (Seq_index ar@134@01 i@155@01))))
  :pattern ((Seq_index ar@134@01 i@155@01))
  :qid |quant-u-81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@157@01 r)
      (and (<= 0 (inv@156@01 r)) (< (inv@156@01 r) len@137@01)))
    (= (Seq_index ar@134@01 (inv@156@01 r)) r))
  :pattern ((inv@156@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@155@01 Int)) (!
  (=>
    (and (<= 0 i@155@01) (< i@155@01 len@137@01))
    (not (= (Seq_index ar@134@01 i@155@01) $Ref.null)))
  :pattern ((Seq_index ar@134@01 i@155@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@154@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@154@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@154@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@154@01))) $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@154@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@154@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@154@01)))))))
(declare-const i@158@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 67 | !(0 <= i@158@01) | live]
; [else-branch: 67 | 0 <= i@158@01 | live]
(push) ; 5
; [then-branch: 67 | !(0 <= i@158@01)]
(assert (not (<= 0 i@158@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 67 | 0 <= i@158@01]
(assert (<= 0 i@158@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@158@01) (not (<= 0 i@158@01))))
(assert (and (<= 0 i@158@01) (< i@158@01 len@137@01)))
; [eval] br[i]
(push) ; 4
(assert (not (>= i@158@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@158@01 (Seq_length br@135@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@159@01 ($Ref) Int)
(declare-fun img@160@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@158@01 Int)) (!
  (=>
    (and (<= 0 i@158@01) (< i@158@01 len@137@01))
    (or (<= 0 i@158@01) (not (<= 0 i@158@01))))
  :pattern ((Seq_index br@135@01 i@158@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@158@01 Int) (i2@158@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@158@01) (< i1@158@01 len@137@01))
      (and (<= 0 i2@158@01) (< i2@158@01 len@137@01))
      (= (Seq_index br@135@01 i1@158@01) (Seq_index br@135@01 i2@158@01)))
    (= i1@158@01 i2@158@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@158@01 Int)) (!
  (=>
    (and (<= 0 i@158@01) (< i@158@01 len@137@01))
    (and
      (= (inv@159@01 (Seq_index br@135@01 i@158@01)) i@158@01)
      (img@160@01 (Seq_index br@135@01 i@158@01))))
  :pattern ((Seq_index br@135@01 i@158@01))
  :qid |quant-u-83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@160@01 r)
      (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) len@137@01)))
    (= (Seq_index br@135@01 (inv@159@01 r)) r))
  :pattern ((inv@159@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@158@01 Int)) (!
  (=>
    (and (<= 0 i@158@01) (< i@158@01 len@137@01))
    (not (= (Seq_index br@135@01 i@158@01) $Ref.null)))
  :pattern ((Seq_index br@135@01 i@158@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@135@01 i@158@01) (Seq_index ar@134@01 i@155@01))
    (=
      (and
        (img@160@01 r)
        (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) len@137@01)))
      (and
        (img@157@01 r)
        (and (<= 0 (inv@156@01 r)) (< (inv@156@01 r) len@137@01)))))
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@154@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@154@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@154@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@154@01)))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
(declare-const i@161@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 68 | !(0 <= i@161@01) | live]
; [else-branch: 68 | 0 <= i@161@01 | live]
(push) ; 5
; [then-branch: 68 | !(0 <= i@161@01)]
(assert (not (<= 0 i@161@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 68 | 0 <= i@161@01]
(assert (<= 0 i@161@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@161@01) (not (<= 0 i@161@01))))
(assert (and (<= 0 i@161@01) (< i@161@01 len@137@01)))
; [eval] cr[i]
(push) ; 4
(assert (not (>= i@161@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@161@01 (Seq_length cr@136@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@162@01 ($Ref) Int)
(declare-fun img@163@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@161@01 Int)) (!
  (=>
    (and (<= 0 i@161@01) (< i@161@01 len@137@01))
    (or (<= 0 i@161@01) (not (<= 0 i@161@01))))
  :pattern ((Seq_index cr@136@01 i@161@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@161@01 Int) (i2@161@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@161@01) (< i1@161@01 len@137@01))
      (and (<= 0 i2@161@01) (< i2@161@01 len@137@01))
      (= (Seq_index cr@136@01 i1@161@01) (Seq_index cr@136@01 i2@161@01)))
    (= i1@161@01 i2@161@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@161@01 Int)) (!
  (=>
    (and (<= 0 i@161@01) (< i@161@01 len@137@01))
    (and
      (= (inv@162@01 (Seq_index cr@136@01 i@161@01)) i@161@01)
      (img@163@01 (Seq_index cr@136@01 i@161@01))))
  :pattern ((Seq_index cr@136@01 i@161@01))
  :qid |quant-u-86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@163@01 r)
      (and (<= 0 (inv@162@01 r)) (< (inv@162@01 r) len@137@01)))
    (= (Seq_index cr@136@01 (inv@162@01 r)) r))
  :pattern ((inv@162@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@161@01 Int)) (!
  (=>
    (and (<= 0 i@161@01) (< i@161@01 len@137@01))
    (not (= (Seq_index cr@136@01 i@161@01) $Ref.null)))
  :pattern ((Seq_index cr@136@01 i@161@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@136@01 i@161@01) (Seq_index br@135@01 i@158@01))
    (=
      (and
        (img@163@01 r)
        (and (<= 0 (inv@162@01 r)) (< (inv@162@01 r) len@137@01)))
      (and
        (img@160@01 r)
        (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) len@137@01)))))
  
  :qid |quant-u-87|))))
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
    (= (Seq_index cr@136@01 i@161@01) (Seq_index ar@134@01 i@155@01))
    (=
      (and
        (img@163@01 r)
        (and (<= 0 (inv@162@01 r)) (< (inv@162@01 r) len@137@01)))
      (and
        (img@157@01 r)
        (and (<= 0 (inv@156@01 r)) (< (inv@156@01 r) len@137@01)))))
  
  :qid |quant-u-88|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; assert |ar| == len
; [eval] |ar| == len
; [eval] |ar|
; [exec]
; assert |br| == len
; [eval] |br| == len
; [eval] |br|
; [exec]
; assert |cr| == len
; [eval] |cr| == len
; [eval] |cr|
; [exec]
; Ref__loop_main_54(diz, current_thread_id, len, ar, br, cr)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 < len ==> |ar| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@137@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@137@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 69 | 0 < len@137@01 | live]
; [else-branch: 69 | !(0 < len@137@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 69 | 0 < len@137@01]
(assert (< 0 len@137@01))
; [eval] |ar| == len
; [eval] |ar|
(pop) ; 4
(push) ; 4
; [else-branch: 69 | !(0 < len@137@01)]
(assert (not (< 0 len@137@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< 0 len@137@01)) (< 0 len@137@01)))
(push) ; 3
(assert (not (=> (< 0 len@137@01) (= (Seq_length ar@134@01) len@137@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@137@01) (= (Seq_length ar@134@01) len@137@01)))
; [eval] (forall j: Int, k: Int :: { ar[j], ar[k] } 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@164@01 Int)
(declare-const k@165@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 70 | !(0 <= j@164@01) | live]
; [else-branch: 70 | 0 <= j@164@01 | live]
(push) ; 5
; [then-branch: 70 | !(0 <= j@164@01)]
(assert (not (<= 0 j@164@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 70 | 0 <= j@164@01]
(assert (<= 0 j@164@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 6
; [then-branch: 71 | !(j@164@01 < |ar@134@01|) | live]
; [else-branch: 71 | j@164@01 < |ar@134@01| | live]
(push) ; 7
; [then-branch: 71 | !(j@164@01 < |ar@134@01|)]
(assert (not (< j@164@01 (Seq_length ar@134@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 71 | j@164@01 < |ar@134@01|]
(assert (< j@164@01 (Seq_length ar@134@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 72 | !(0 <= k@165@01) | live]
; [else-branch: 72 | 0 <= k@165@01 | live]
(push) ; 9
; [then-branch: 72 | !(0 <= k@165@01)]
(assert (not (<= 0 k@165@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 72 | 0 <= k@165@01]
(assert (<= 0 k@165@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 10
; [then-branch: 73 | !(k@165@01 < |ar@134@01|) | live]
; [else-branch: 73 | k@165@01 < |ar@134@01| | live]
(push) ; 11
; [then-branch: 73 | !(k@165@01 < |ar@134@01|)]
(assert (not (< k@165@01 (Seq_length ar@134@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 73 | k@165@01 < |ar@134@01|]
(assert (< k@165@01 (Seq_length ar@134@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@165@01 (Seq_length ar@134@01))
  (not (< k@165@01 (Seq_length ar@134@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@165@01)
  (and
    (<= 0 k@165@01)
    (or
      (< k@165@01 (Seq_length ar@134@01))
      (not (< k@165@01 (Seq_length ar@134@01)))))))
(assert (or (<= 0 k@165@01) (not (<= 0 k@165@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@164@01 (Seq_length ar@134@01))
  (and
    (< j@164@01 (Seq_length ar@134@01))
    (=>
      (<= 0 k@165@01)
      (and
        (<= 0 k@165@01)
        (or
          (< k@165@01 (Seq_length ar@134@01))
          (not (< k@165@01 (Seq_length ar@134@01))))))
    (or (<= 0 k@165@01) (not (<= 0 k@165@01))))))
(assert (or
  (< j@164@01 (Seq_length ar@134@01))
  (not (< j@164@01 (Seq_length ar@134@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@164@01)
  (and
    (<= 0 j@164@01)
    (=>
      (< j@164@01 (Seq_length ar@134@01))
      (and
        (< j@164@01 (Seq_length ar@134@01))
        (=>
          (<= 0 k@165@01)
          (and
            (<= 0 k@165@01)
            (or
              (< k@165@01 (Seq_length ar@134@01))
              (not (< k@165@01 (Seq_length ar@134@01))))))
        (or (<= 0 k@165@01) (not (<= 0 k@165@01)))))
    (or
      (< j@164@01 (Seq_length ar@134@01))
      (not (< j@164@01 (Seq_length ar@134@01)))))))
(assert (or (<= 0 j@164@01) (not (<= 0 j@164@01))))
(push) ; 4
; [then-branch: 74 | 0 <= j@164@01 && j@164@01 < |ar@134@01| && 0 <= k@165@01 && k@165@01 < |ar@134@01| && j@164@01 != k@165@01 | live]
; [else-branch: 74 | !(0 <= j@164@01 && j@164@01 < |ar@134@01| && 0 <= k@165@01 && k@165@01 < |ar@134@01| && j@164@01 != k@165@01) | live]
(push) ; 5
; [then-branch: 74 | 0 <= j@164@01 && j@164@01 < |ar@134@01| && 0 <= k@165@01 && k@165@01 < |ar@134@01| && j@164@01 != k@165@01]
(assert (and
  (<= 0 j@164@01)
  (and
    (< j@164@01 (Seq_length ar@134@01))
    (and
      (<= 0 k@165@01)
      (and (< k@165@01 (Seq_length ar@134@01)) (not (= j@164@01 k@165@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 6
(assert (not (>= j@164@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@165@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 74 | !(0 <= j@164@01 && j@164@01 < |ar@134@01| && 0 <= k@165@01 && k@165@01 < |ar@134@01| && j@164@01 != k@165@01)]
(assert (not
  (and
    (<= 0 j@164@01)
    (and
      (< j@164@01 (Seq_length ar@134@01))
      (and
        (<= 0 k@165@01)
        (and (< k@165@01 (Seq_length ar@134@01)) (not (= j@164@01 k@165@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@164@01)
    (and
      (< j@164@01 (Seq_length ar@134@01))
      (and
        (<= 0 k@165@01)
        (and (< k@165@01 (Seq_length ar@134@01)) (not (= j@164@01 k@165@01))))))
  (and
    (<= 0 j@164@01)
    (< j@164@01 (Seq_length ar@134@01))
    (<= 0 k@165@01)
    (< k@165@01 (Seq_length ar@134@01))
    (not (= j@164@01 k@165@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@164@01)
      (and
        (< j@164@01 (Seq_length ar@134@01))
        (and
          (<= 0 k@165@01)
          (and (< k@165@01 (Seq_length ar@134@01)) (not (= j@164@01 k@165@01)))))))
  (and
    (<= 0 j@164@01)
    (and
      (< j@164@01 (Seq_length ar@134@01))
      (and
        (<= 0 k@165@01)
        (and (< k@165@01 (Seq_length ar@134@01)) (not (= j@164@01 k@165@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@164@01 Int) (k@165@01 Int)) (!
  (and
    (=>
      (<= 0 j@164@01)
      (and
        (<= 0 j@164@01)
        (=>
          (< j@164@01 (Seq_length ar@134@01))
          (and
            (< j@164@01 (Seq_length ar@134@01))
            (=>
              (<= 0 k@165@01)
              (and
                (<= 0 k@165@01)
                (or
                  (< k@165@01 (Seq_length ar@134@01))
                  (not (< k@165@01 (Seq_length ar@134@01))))))
            (or (<= 0 k@165@01) (not (<= 0 k@165@01)))))
        (or
          (< j@164@01 (Seq_length ar@134@01))
          (not (< j@164@01 (Seq_length ar@134@01))))))
    (or (<= 0 j@164@01) (not (<= 0 j@164@01)))
    (=>
      (and
        (<= 0 j@164@01)
        (and
          (< j@164@01 (Seq_length ar@134@01))
          (and
            (<= 0 k@165@01)
            (and (< k@165@01 (Seq_length ar@134@01)) (not (= j@164@01 k@165@01))))))
      (and
        (<= 0 j@164@01)
        (< j@164@01 (Seq_length ar@134@01))
        (<= 0 k@165@01)
        (< k@165@01 (Seq_length ar@134@01))
        (not (= j@164@01 k@165@01))))
    (or
      (not
        (and
          (<= 0 j@164@01)
          (and
            (< j@164@01 (Seq_length ar@134@01))
            (and
              (<= 0 k@165@01)
              (and
                (< k@165@01 (Seq_length ar@134@01))
                (not (= j@164@01 k@165@01)))))))
      (and
        (<= 0 j@164@01)
        (and
          (< j@164@01 (Seq_length ar@134@01))
          (and
            (<= 0 k@165@01)
            (and (< k@165@01 (Seq_length ar@134@01)) (not (= j@164@01 k@165@01))))))))
  :pattern ((Seq_index ar@134@01 j@164@01) (Seq_index ar@134@01 k@165@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@62@12@62@106-aux|)))
(push) ; 3
(assert (not (forall ((j@164@01 Int) (k@165@01 Int)) (!
  (=>
    (and
      (<= 0 j@164@01)
      (and
        (< j@164@01 (Seq_length ar@134@01))
        (and
          (<= 0 k@165@01)
          (and (< k@165@01 (Seq_length ar@134@01)) (not (= j@164@01 k@165@01))))))
    (not (= (Seq_index ar@134@01 j@164@01) (Seq_index ar@134@01 k@165@01))))
  :pattern ((Seq_index ar@134@01 j@164@01) (Seq_index ar@134@01 k@165@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@62@12@62@106|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@164@01 Int) (k@165@01 Int)) (!
  (=>
    (and
      (<= 0 j@164@01)
      (and
        (< j@164@01 (Seq_length ar@134@01))
        (and
          (<= 0 k@165@01)
          (and (< k@165@01 (Seq_length ar@134@01)) (not (= j@164@01 k@165@01))))))
    (not (= (Seq_index ar@134@01 j@164@01) (Seq_index ar@134@01 k@165@01))))
  :pattern ((Seq_index ar@134@01 j@164@01) (Seq_index ar@134@01 k@165@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@62@12@62@106|)))
(declare-const i@166@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 75 | !(0 <= i@166@01) | live]
; [else-branch: 75 | 0 <= i@166@01 | live]
(push) ; 5
; [then-branch: 75 | !(0 <= i@166@01)]
(assert (not (<= 0 i@166@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 75 | 0 <= i@166@01]
(assert (<= 0 i@166@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@166@01) (not (<= 0 i@166@01))))
(assert (and (<= 0 i@166@01) (< i@166@01 len@137@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@166@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@166@01 (Seq_length ar@134@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@167@01 ($Ref) Int)
(declare-fun img@168@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@166@01 Int)) (!
  (=>
    (and (<= 0 i@166@01) (< i@166@01 len@137@01))
    (or (<= 0 i@166@01) (not (<= 0 i@166@01))))
  :pattern ((Seq_index ar@134@01 i@166@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@166@01 Int) (i2@166@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@166@01) (< i1@166@01 len@137@01))
      (and (<= 0 i2@166@01) (< i2@166@01 len@137@01))
      (= (Seq_index ar@134@01 i1@166@01) (Seq_index ar@134@01 i2@166@01)))
    (= i1@166@01 i2@166@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@166@01 Int)) (!
  (=>
    (and (<= 0 i@166@01) (< i@166@01 len@137@01))
    (and
      (= (inv@167@01 (Seq_index ar@134@01 i@166@01)) i@166@01)
      (img@168@01 (Seq_index ar@134@01 i@166@01))))
  :pattern ((Seq_index ar@134@01 i@166@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@168@01 r)
      (and (<= 0 (inv@167@01 r)) (< (inv@167@01 r) len@137@01)))
    (= (Seq_index ar@134@01 (inv@167@01 r)) r))
  :pattern ((inv@167@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@166@01 Int)) (!
  (= (Seq_index ar@134@01 i@166@01) (Seq_index br@135@01 i@166@01))
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@166@01 Int)) (!
  (= (Seq_index ar@134@01 i@166@01) (Seq_index cr@136@01 i@166@01))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@169@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@167@01 r)) (< (inv@167@01 r) len@137@01))
      (img@168@01 r)
      (= r (Seq_index ar@134@01 (inv@167@01 r))))
    ($Perm.min
      (ite
        (and
          (img@143@01 r)
          (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@170@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@167@01 r)) (< (inv@167@01 r) len@137@01))
      (img@168@01 r)
      (= r (Seq_index ar@134@01 (inv@167@01 r))))
    ($Perm.min
      (ite
        (and
          (img@148@01 r)
          (and (<= 0 (inv@147@01 r)) (< (inv@147@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@169@01 r)))
    $Perm.No))
(define-fun pTaken@171@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@167@01 r)) (< (inv@167@01 r) len@137@01))
      (img@168@01 r)
      (= r (Seq_index ar@134@01 (inv@167@01 r))))
    ($Perm.min
      (ite
        (and
          (img@153@01 r)
          (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@169@01 r)) (pTaken@170@01 r)))
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
          (img@143@01 r)
          (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@169@01 r))
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
      (and (<= 0 (inv@167@01 r)) (< (inv@167@01 r) len@137@01))
      (img@168@01 r)
      (= r (Seq_index ar@134@01 (inv@167@01 r))))
    (= (- $Perm.Write (pTaken@169@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@172@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@143@01 r)
      (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@172@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@172@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@148@01 r)
      (and (<= 0 (inv@147@01 r)) (< (inv@147@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@172@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@172@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@153@01 r)
      (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@172@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@172@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))) r))
  :qid |qp.fvfValDef2|)))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@137@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@137@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 76 | 0 < len@137@01 | live]
; [else-branch: 76 | !(0 < len@137@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 76 | 0 < len@137@01]
(assert (< 0 len@137@01))
; [eval] |br| == len
; [eval] |br|
(pop) ; 4
(push) ; 4
; [else-branch: 76 | !(0 < len@137@01)]
(assert (not (< 0 len@137@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> (< 0 len@137@01) (= (Seq_length br@135@01) len@137@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@137@01) (= (Seq_length br@135@01) len@137@01)))
; [eval] (forall j: Int, k: Int :: { br[j], br[k] } 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k])
(declare-const j@173@01 Int)
(declare-const k@174@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k]
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 77 | !(0 <= j@173@01) | live]
; [else-branch: 77 | 0 <= j@173@01 | live]
(push) ; 5
; [then-branch: 77 | !(0 <= j@173@01)]
(assert (not (<= 0 j@173@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 77 | 0 <= j@173@01]
(assert (<= 0 j@173@01))
; [eval] j < |br|
; [eval] |br|
(push) ; 6
; [then-branch: 78 | !(j@173@01 < |br@135@01|) | live]
; [else-branch: 78 | j@173@01 < |br@135@01| | live]
(push) ; 7
; [then-branch: 78 | !(j@173@01 < |br@135@01|)]
(assert (not (< j@173@01 (Seq_length br@135@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 78 | j@173@01 < |br@135@01|]
(assert (< j@173@01 (Seq_length br@135@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 79 | !(0 <= k@174@01) | live]
; [else-branch: 79 | 0 <= k@174@01 | live]
(push) ; 9
; [then-branch: 79 | !(0 <= k@174@01)]
(assert (not (<= 0 k@174@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 79 | 0 <= k@174@01]
(assert (<= 0 k@174@01))
; [eval] k < |br|
; [eval] |br|
(push) ; 10
; [then-branch: 80 | !(k@174@01 < |br@135@01|) | live]
; [else-branch: 80 | k@174@01 < |br@135@01| | live]
(push) ; 11
; [then-branch: 80 | !(k@174@01 < |br@135@01|)]
(assert (not (< k@174@01 (Seq_length br@135@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 80 | k@174@01 < |br@135@01|]
(assert (< k@174@01 (Seq_length br@135@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@174@01 (Seq_length br@135@01))
  (not (< k@174@01 (Seq_length br@135@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@174@01)
  (and
    (<= 0 k@174@01)
    (or
      (< k@174@01 (Seq_length br@135@01))
      (not (< k@174@01 (Seq_length br@135@01)))))))
(assert (or (<= 0 k@174@01) (not (<= 0 k@174@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@173@01 (Seq_length br@135@01))
  (and
    (< j@173@01 (Seq_length br@135@01))
    (=>
      (<= 0 k@174@01)
      (and
        (<= 0 k@174@01)
        (or
          (< k@174@01 (Seq_length br@135@01))
          (not (< k@174@01 (Seq_length br@135@01))))))
    (or (<= 0 k@174@01) (not (<= 0 k@174@01))))))
(assert (or
  (< j@173@01 (Seq_length br@135@01))
  (not (< j@173@01 (Seq_length br@135@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@173@01)
  (and
    (<= 0 j@173@01)
    (=>
      (< j@173@01 (Seq_length br@135@01))
      (and
        (< j@173@01 (Seq_length br@135@01))
        (=>
          (<= 0 k@174@01)
          (and
            (<= 0 k@174@01)
            (or
              (< k@174@01 (Seq_length br@135@01))
              (not (< k@174@01 (Seq_length br@135@01))))))
        (or (<= 0 k@174@01) (not (<= 0 k@174@01)))))
    (or
      (< j@173@01 (Seq_length br@135@01))
      (not (< j@173@01 (Seq_length br@135@01)))))))
(assert (or (<= 0 j@173@01) (not (<= 0 j@173@01))))
(push) ; 4
; [then-branch: 81 | 0 <= j@173@01 && j@173@01 < |br@135@01| && 0 <= k@174@01 && k@174@01 < |br@135@01| && j@173@01 != k@174@01 | live]
; [else-branch: 81 | !(0 <= j@173@01 && j@173@01 < |br@135@01| && 0 <= k@174@01 && k@174@01 < |br@135@01| && j@173@01 != k@174@01) | live]
(push) ; 5
; [then-branch: 81 | 0 <= j@173@01 && j@173@01 < |br@135@01| && 0 <= k@174@01 && k@174@01 < |br@135@01| && j@173@01 != k@174@01]
(assert (and
  (<= 0 j@173@01)
  (and
    (< j@173@01 (Seq_length br@135@01))
    (and
      (<= 0 k@174@01)
      (and (< k@174@01 (Seq_length br@135@01)) (not (= j@173@01 k@174@01)))))))
; [eval] br[j] != br[k]
; [eval] br[j]
(push) ; 6
(assert (not (>= j@173@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] br[k]
(push) ; 6
(assert (not (>= k@174@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 81 | !(0 <= j@173@01 && j@173@01 < |br@135@01| && 0 <= k@174@01 && k@174@01 < |br@135@01| && j@173@01 != k@174@01)]
(assert (not
  (and
    (<= 0 j@173@01)
    (and
      (< j@173@01 (Seq_length br@135@01))
      (and
        (<= 0 k@174@01)
        (and (< k@174@01 (Seq_length br@135@01)) (not (= j@173@01 k@174@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@173@01)
    (and
      (< j@173@01 (Seq_length br@135@01))
      (and
        (<= 0 k@174@01)
        (and (< k@174@01 (Seq_length br@135@01)) (not (= j@173@01 k@174@01))))))
  (and
    (<= 0 j@173@01)
    (< j@173@01 (Seq_length br@135@01))
    (<= 0 k@174@01)
    (< k@174@01 (Seq_length br@135@01))
    (not (= j@173@01 k@174@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@173@01)
      (and
        (< j@173@01 (Seq_length br@135@01))
        (and
          (<= 0 k@174@01)
          (and (< k@174@01 (Seq_length br@135@01)) (not (= j@173@01 k@174@01)))))))
  (and
    (<= 0 j@173@01)
    (and
      (< j@173@01 (Seq_length br@135@01))
      (and
        (<= 0 k@174@01)
        (and (< k@174@01 (Seq_length br@135@01)) (not (= j@173@01 k@174@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@173@01 Int) (k@174@01 Int)) (!
  (and
    (=>
      (<= 0 j@173@01)
      (and
        (<= 0 j@173@01)
        (=>
          (< j@173@01 (Seq_length br@135@01))
          (and
            (< j@173@01 (Seq_length br@135@01))
            (=>
              (<= 0 k@174@01)
              (and
                (<= 0 k@174@01)
                (or
                  (< k@174@01 (Seq_length br@135@01))
                  (not (< k@174@01 (Seq_length br@135@01))))))
            (or (<= 0 k@174@01) (not (<= 0 k@174@01)))))
        (or
          (< j@173@01 (Seq_length br@135@01))
          (not (< j@173@01 (Seq_length br@135@01))))))
    (or (<= 0 j@173@01) (not (<= 0 j@173@01)))
    (=>
      (and
        (<= 0 j@173@01)
        (and
          (< j@173@01 (Seq_length br@135@01))
          (and
            (<= 0 k@174@01)
            (and (< k@174@01 (Seq_length br@135@01)) (not (= j@173@01 k@174@01))))))
      (and
        (<= 0 j@173@01)
        (< j@173@01 (Seq_length br@135@01))
        (<= 0 k@174@01)
        (< k@174@01 (Seq_length br@135@01))
        (not (= j@173@01 k@174@01))))
    (or
      (not
        (and
          (<= 0 j@173@01)
          (and
            (< j@173@01 (Seq_length br@135@01))
            (and
              (<= 0 k@174@01)
              (and
                (< k@174@01 (Seq_length br@135@01))
                (not (= j@173@01 k@174@01)))))))
      (and
        (<= 0 j@173@01)
        (and
          (< j@173@01 (Seq_length br@135@01))
          (and
            (<= 0 k@174@01)
            (and (< k@174@01 (Seq_length br@135@01)) (not (= j@173@01 k@174@01))))))))
  :pattern ((Seq_index br@135@01 j@173@01) (Seq_index br@135@01 k@174@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@65@12@65@106-aux|)))
(push) ; 3
(assert (not (forall ((j@173@01 Int) (k@174@01 Int)) (!
  (=>
    (and
      (<= 0 j@173@01)
      (and
        (< j@173@01 (Seq_length br@135@01))
        (and
          (<= 0 k@174@01)
          (and (< k@174@01 (Seq_length br@135@01)) (not (= j@173@01 k@174@01))))))
    (not (= (Seq_index br@135@01 j@173@01) (Seq_index br@135@01 k@174@01))))
  :pattern ((Seq_index br@135@01 j@173@01) (Seq_index br@135@01 k@174@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@65@12@65@106|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@173@01 Int) (k@174@01 Int)) (!
  (=>
    (and
      (<= 0 j@173@01)
      (and
        (< j@173@01 (Seq_length br@135@01))
        (and
          (<= 0 k@174@01)
          (and (< k@174@01 (Seq_length br@135@01)) (not (= j@173@01 k@174@01))))))
    (not (= (Seq_index br@135@01 j@173@01) (Seq_index br@135@01 k@174@01))))
  :pattern ((Seq_index br@135@01 j@173@01) (Seq_index br@135@01 k@174@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@65@12@65@106|)))
(declare-const i@175@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 82 | !(0 <= i@175@01) | live]
; [else-branch: 82 | 0 <= i@175@01 | live]
(push) ; 5
; [then-branch: 82 | !(0 <= i@175@01)]
(assert (not (<= 0 i@175@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 82 | 0 <= i@175@01]
(assert (<= 0 i@175@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@175@01) (not (<= 0 i@175@01))))
(assert (and (<= 0 i@175@01) (< i@175@01 len@137@01)))
; [eval] br[i]
(push) ; 4
(assert (not (>= i@175@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@175@01 (Seq_length br@135@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@176@01 ($Ref) Int)
(declare-fun img@177@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@175@01 Int)) (!
  (=>
    (and (<= 0 i@175@01) (< i@175@01 len@137@01))
    (or (<= 0 i@175@01) (not (<= 0 i@175@01))))
  :pattern ((Seq_index br@135@01 i@175@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@175@01 Int) (i2@175@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@175@01) (< i1@175@01 len@137@01))
      (and (<= 0 i2@175@01) (< i2@175@01 len@137@01))
      (= (Seq_index br@135@01 i1@175@01) (Seq_index br@135@01 i2@175@01)))
    (= i1@175@01 i2@175@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@175@01 Int)) (!
  (=>
    (and (<= 0 i@175@01) (< i@175@01 len@137@01))
    (and
      (= (inv@176@01 (Seq_index br@135@01 i@175@01)) i@175@01)
      (img@177@01 (Seq_index br@135@01 i@175@01))))
  :pattern ((Seq_index br@135@01 i@175@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@177@01 r)
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) len@137@01)))
    (= (Seq_index br@135@01 (inv@176@01 r)) r))
  :pattern ((inv@176@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@175@01 Int)) (!
  (= (Seq_index br@135@01 i@175@01) (Seq_index cr@136@01 i@175@01))
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@178@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) len@137@01))
      (img@177@01 r)
      (= r (Seq_index br@135@01 (inv@176@01 r))))
    ($Perm.min
      (ite
        (and
          (img@148@01 r)
          (and (<= 0 (inv@147@01 r)) (< (inv@147@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@179@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) len@137@01))
      (img@177@01 r)
      (= r (Seq_index br@135@01 (inv@176@01 r))))
    ($Perm.min
      (ite
        (and
          (img@153@01 r)
          (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@178@01 r)))
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
          (img@148@01 r)
          (and (<= 0 (inv@147@01 r)) (< (inv@147@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@178@01 r))
    $Perm.No)
  
  :qid |quant-u-98|))))
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
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) len@137@01))
      (img@177@01 r)
      (= r (Seq_index br@135@01 (inv@176@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@178@01 r)) $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@180@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@153@01 r)
      (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@180@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@180@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@148@01 r)
      (and (<= 0 (inv@147@01 r)) (< (inv@147@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@180@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@180@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))) r))
  :qid |qp.fvfValDef4|)))
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@137@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@137@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 83 | 0 < len@137@01 | live]
; [else-branch: 83 | !(0 < len@137@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 83 | 0 < len@137@01]
(assert (< 0 len@137@01))
; [eval] |cr| == len
; [eval] |cr|
(pop) ; 4
(push) ; 4
; [else-branch: 83 | !(0 < len@137@01)]
(assert (not (< 0 len@137@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> (< 0 len@137@01) (= (Seq_length cr@136@01) len@137@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@137@01) (= (Seq_length cr@136@01) len@137@01)))
; [eval] (forall j: Int, k: Int :: { cr[j], cr[k] } 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k])
(declare-const j@181@01 Int)
(declare-const k@182@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k]
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 84 | !(0 <= j@181@01) | live]
; [else-branch: 84 | 0 <= j@181@01 | live]
(push) ; 5
; [then-branch: 84 | !(0 <= j@181@01)]
(assert (not (<= 0 j@181@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 84 | 0 <= j@181@01]
(assert (<= 0 j@181@01))
; [eval] j < |cr|
; [eval] |cr|
(push) ; 6
; [then-branch: 85 | !(j@181@01 < |cr@136@01|) | live]
; [else-branch: 85 | j@181@01 < |cr@136@01| | live]
(push) ; 7
; [then-branch: 85 | !(j@181@01 < |cr@136@01|)]
(assert (not (< j@181@01 (Seq_length cr@136@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 85 | j@181@01 < |cr@136@01|]
(assert (< j@181@01 (Seq_length cr@136@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 86 | !(0 <= k@182@01) | live]
; [else-branch: 86 | 0 <= k@182@01 | live]
(push) ; 9
; [then-branch: 86 | !(0 <= k@182@01)]
(assert (not (<= 0 k@182@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 86 | 0 <= k@182@01]
(assert (<= 0 k@182@01))
; [eval] k < |cr|
; [eval] |cr|
(push) ; 10
; [then-branch: 87 | !(k@182@01 < |cr@136@01|) | live]
; [else-branch: 87 | k@182@01 < |cr@136@01| | live]
(push) ; 11
; [then-branch: 87 | !(k@182@01 < |cr@136@01|)]
(assert (not (< k@182@01 (Seq_length cr@136@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 87 | k@182@01 < |cr@136@01|]
(assert (< k@182@01 (Seq_length cr@136@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@182@01 (Seq_length cr@136@01))
  (not (< k@182@01 (Seq_length cr@136@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@182@01)
  (and
    (<= 0 k@182@01)
    (or
      (< k@182@01 (Seq_length cr@136@01))
      (not (< k@182@01 (Seq_length cr@136@01)))))))
(assert (or (<= 0 k@182@01) (not (<= 0 k@182@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@181@01 (Seq_length cr@136@01))
  (and
    (< j@181@01 (Seq_length cr@136@01))
    (=>
      (<= 0 k@182@01)
      (and
        (<= 0 k@182@01)
        (or
          (< k@182@01 (Seq_length cr@136@01))
          (not (< k@182@01 (Seq_length cr@136@01))))))
    (or (<= 0 k@182@01) (not (<= 0 k@182@01))))))
(assert (or
  (< j@181@01 (Seq_length cr@136@01))
  (not (< j@181@01 (Seq_length cr@136@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@181@01)
  (and
    (<= 0 j@181@01)
    (=>
      (< j@181@01 (Seq_length cr@136@01))
      (and
        (< j@181@01 (Seq_length cr@136@01))
        (=>
          (<= 0 k@182@01)
          (and
            (<= 0 k@182@01)
            (or
              (< k@182@01 (Seq_length cr@136@01))
              (not (< k@182@01 (Seq_length cr@136@01))))))
        (or (<= 0 k@182@01) (not (<= 0 k@182@01)))))
    (or
      (< j@181@01 (Seq_length cr@136@01))
      (not (< j@181@01 (Seq_length cr@136@01)))))))
(assert (or (<= 0 j@181@01) (not (<= 0 j@181@01))))
(push) ; 4
; [then-branch: 88 | 0 <= j@181@01 && j@181@01 < |cr@136@01| && 0 <= k@182@01 && k@182@01 < |cr@136@01| && j@181@01 != k@182@01 | live]
; [else-branch: 88 | !(0 <= j@181@01 && j@181@01 < |cr@136@01| && 0 <= k@182@01 && k@182@01 < |cr@136@01| && j@181@01 != k@182@01) | live]
(push) ; 5
; [then-branch: 88 | 0 <= j@181@01 && j@181@01 < |cr@136@01| && 0 <= k@182@01 && k@182@01 < |cr@136@01| && j@181@01 != k@182@01]
(assert (and
  (<= 0 j@181@01)
  (and
    (< j@181@01 (Seq_length cr@136@01))
    (and
      (<= 0 k@182@01)
      (and (< k@182@01 (Seq_length cr@136@01)) (not (= j@181@01 k@182@01)))))))
; [eval] cr[j] != cr[k]
; [eval] cr[j]
(push) ; 6
(assert (not (>= j@181@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] cr[k]
(push) ; 6
(assert (not (>= k@182@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 88 | !(0 <= j@181@01 && j@181@01 < |cr@136@01| && 0 <= k@182@01 && k@182@01 < |cr@136@01| && j@181@01 != k@182@01)]
(assert (not
  (and
    (<= 0 j@181@01)
    (and
      (< j@181@01 (Seq_length cr@136@01))
      (and
        (<= 0 k@182@01)
        (and (< k@182@01 (Seq_length cr@136@01)) (not (= j@181@01 k@182@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@181@01)
    (and
      (< j@181@01 (Seq_length cr@136@01))
      (and
        (<= 0 k@182@01)
        (and (< k@182@01 (Seq_length cr@136@01)) (not (= j@181@01 k@182@01))))))
  (and
    (<= 0 j@181@01)
    (< j@181@01 (Seq_length cr@136@01))
    (<= 0 k@182@01)
    (< k@182@01 (Seq_length cr@136@01))
    (not (= j@181@01 k@182@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@181@01)
      (and
        (< j@181@01 (Seq_length cr@136@01))
        (and
          (<= 0 k@182@01)
          (and (< k@182@01 (Seq_length cr@136@01)) (not (= j@181@01 k@182@01)))))))
  (and
    (<= 0 j@181@01)
    (and
      (< j@181@01 (Seq_length cr@136@01))
      (and
        (<= 0 k@182@01)
        (and (< k@182@01 (Seq_length cr@136@01)) (not (= j@181@01 k@182@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@181@01 Int) (k@182@01 Int)) (!
  (and
    (=>
      (<= 0 j@181@01)
      (and
        (<= 0 j@181@01)
        (=>
          (< j@181@01 (Seq_length cr@136@01))
          (and
            (< j@181@01 (Seq_length cr@136@01))
            (=>
              (<= 0 k@182@01)
              (and
                (<= 0 k@182@01)
                (or
                  (< k@182@01 (Seq_length cr@136@01))
                  (not (< k@182@01 (Seq_length cr@136@01))))))
            (or (<= 0 k@182@01) (not (<= 0 k@182@01)))))
        (or
          (< j@181@01 (Seq_length cr@136@01))
          (not (< j@181@01 (Seq_length cr@136@01))))))
    (or (<= 0 j@181@01) (not (<= 0 j@181@01)))
    (=>
      (and
        (<= 0 j@181@01)
        (and
          (< j@181@01 (Seq_length cr@136@01))
          (and
            (<= 0 k@182@01)
            (and (< k@182@01 (Seq_length cr@136@01)) (not (= j@181@01 k@182@01))))))
      (and
        (<= 0 j@181@01)
        (< j@181@01 (Seq_length cr@136@01))
        (<= 0 k@182@01)
        (< k@182@01 (Seq_length cr@136@01))
        (not (= j@181@01 k@182@01))))
    (or
      (not
        (and
          (<= 0 j@181@01)
          (and
            (< j@181@01 (Seq_length cr@136@01))
            (and
              (<= 0 k@182@01)
              (and
                (< k@182@01 (Seq_length cr@136@01))
                (not (= j@181@01 k@182@01)))))))
      (and
        (<= 0 j@181@01)
        (and
          (< j@181@01 (Seq_length cr@136@01))
          (and
            (<= 0 k@182@01)
            (and (< k@182@01 (Seq_length cr@136@01)) (not (= j@181@01 k@182@01))))))))
  :pattern ((Seq_index cr@136@01 j@181@01) (Seq_index cr@136@01 k@182@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@68@12@68@106-aux|)))
(push) ; 3
(assert (not (forall ((j@181@01 Int) (k@182@01 Int)) (!
  (=>
    (and
      (<= 0 j@181@01)
      (and
        (< j@181@01 (Seq_length cr@136@01))
        (and
          (<= 0 k@182@01)
          (and (< k@182@01 (Seq_length cr@136@01)) (not (= j@181@01 k@182@01))))))
    (not (= (Seq_index cr@136@01 j@181@01) (Seq_index cr@136@01 k@182@01))))
  :pattern ((Seq_index cr@136@01 j@181@01) (Seq_index cr@136@01 k@182@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@68@12@68@106|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@181@01 Int) (k@182@01 Int)) (!
  (=>
    (and
      (<= 0 j@181@01)
      (and
        (< j@181@01 (Seq_length cr@136@01))
        (and
          (<= 0 k@182@01)
          (and (< k@182@01 (Seq_length cr@136@01)) (not (= j@181@01 k@182@01))))))
    (not (= (Seq_index cr@136@01 j@181@01) (Seq_index cr@136@01 k@182@01))))
  :pattern ((Seq_index cr@136@01 j@181@01) (Seq_index cr@136@01 k@182@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoop.vpr@68@12@68@106|)))
(declare-const i@183@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 89 | !(0 <= i@183@01) | live]
; [else-branch: 89 | 0 <= i@183@01 | live]
(push) ; 5
; [then-branch: 89 | !(0 <= i@183@01)]
(assert (not (<= 0 i@183@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 89 | 0 <= i@183@01]
(assert (<= 0 i@183@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@183@01) (not (<= 0 i@183@01))))
(assert (and (<= 0 i@183@01) (< i@183@01 len@137@01)))
; [eval] cr[i]
(push) ; 4
(assert (not (>= i@183@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@183@01 (Seq_length cr@136@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@184@01 ($Ref) Int)
(declare-fun img@185@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@183@01 Int)) (!
  (=>
    (and (<= 0 i@183@01) (< i@183@01 len@137@01))
    (or (<= 0 i@183@01) (not (<= 0 i@183@01))))
  :pattern ((Seq_index cr@136@01 i@183@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@183@01 Int) (i2@183@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@183@01) (< i1@183@01 len@137@01))
      (and (<= 0 i2@183@01) (< i2@183@01 len@137@01))
      (= (Seq_index cr@136@01 i1@183@01) (Seq_index cr@136@01 i2@183@01)))
    (= i1@183@01 i2@183@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@183@01 Int)) (!
  (=>
    (and (<= 0 i@183@01) (< i@183@01 len@137@01))
    (and
      (= (inv@184@01 (Seq_index cr@136@01 i@183@01)) i@183@01)
      (img@185@01 (Seq_index cr@136@01 i@183@01))))
  :pattern ((Seq_index cr@136@01 i@183@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@185@01 r)
      (and (<= 0 (inv@184@01 r)) (< (inv@184@01 r) len@137@01)))
    (= (Seq_index cr@136@01 (inv@184@01 r)) r))
  :pattern ((inv@184@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@186@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@184@01 r)) (< (inv@184@01 r) len@137@01))
      (img@185@01 r)
      (= r (Seq_index cr@136@01 (inv@184@01 r))))
    ($Perm.min
      (ite
        (and
          (img@153@01 r)
          (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
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
          (img@153@01 r)
          (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@186@01 r))
    $Perm.No)
  
  :qid |quant-u-102|))))
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
      (and (<= 0 (inv@184@01 r)) (< (inv@184@01 r) len@137@01))
      (img@185@01 r)
      (= r (Seq_index cr@136@01 (inv@184@01 r))))
    (= (- $Perm.Write (pTaken@186@01 r)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@187@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@153@01 r)
      (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@187@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@187@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))))))) r))
  :qid |qp.fvfValDef5|)))
(declare-const $t@188@01 $Snap)
(assert (= $t@188@01 ($Snap.combine ($Snap.first $t@188@01) ($Snap.second $t@188@01))))
(assert (= ($Snap.first $t@188@01) $Snap.unit))
; [eval] 0 < len ==> |ar| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@137@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@137@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 90 | 0 < len@137@01 | live]
; [else-branch: 90 | !(0 < len@137@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 90 | 0 < len@137@01]
(assert (< 0 len@137@01))
; [eval] |ar| == len
; [eval] |ar|
(pop) ; 4
(push) ; 4
; [else-branch: 90 | !(0 < len@137@01)]
(assert (not (< 0 len@137@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
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
; [then-branch: 91 | !(0 <= i@189@01) | live]
; [else-branch: 91 | 0 <= i@189@01 | live]
(push) ; 5
; [then-branch: 91 | !(0 <= i@189@01)]
(assert (not (<= 0 i@189@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 91 | 0 <= i@189@01]
(assert (<= 0 i@189@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@189@01) (not (<= 0 i@189@01))))
(assert (and (<= 0 i@189@01) (< i@189@01 len@137@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@189@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@189@01 (Seq_length ar@134@01))))
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
    (and (<= 0 i@189@01) (< i@189@01 len@137@01))
    (or (<= 0 i@189@01) (not (<= 0 i@189@01))))
  :pattern ((Seq_index ar@134@01 i@189@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@189@01 Int) (i2@189@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@189@01) (< i1@189@01 len@137@01))
      (and (<= 0 i2@189@01) (< i2@189@01 len@137@01))
      (= (Seq_index ar@134@01 i1@189@01) (Seq_index ar@134@01 i2@189@01)))
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
    (and (<= 0 i@189@01) (< i@189@01 len@137@01))
    (and
      (= (inv@190@01 (Seq_index ar@134@01 i@189@01)) i@189@01)
      (img@191@01 (Seq_index ar@134@01 i@189@01))))
  :pattern ((Seq_index ar@134@01 i@189@01))
  :qid |quant-u-105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@191@01 r)
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))
    (= (Seq_index ar@134@01 (inv@190@01 r)) r))
  :pattern ((inv@190@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@189@01 Int)) (!
  (=>
    (and (<= 0 i@189@01) (< i@189@01 len@137@01))
    (not (= (Seq_index ar@134@01 i@189@01) $Ref.null)))
  :pattern ((Seq_index ar@134@01 i@189@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@188@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@188@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@188@01))) $Snap.unit))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@137@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@137@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 92 | 0 < len@137@01 | live]
; [else-branch: 92 | !(0 < len@137@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 92 | 0 < len@137@01]
(assert (< 0 len@137@01))
; [eval] |br| == len
; [eval] |br|
(pop) ; 4
(push) ; 4
; [else-branch: 92 | !(0 < len@137@01)]
(assert (not (< 0 len@137@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
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
; [then-branch: 93 | !(0 <= i@192@01) | live]
; [else-branch: 93 | 0 <= i@192@01 | live]
(push) ; 5
; [then-branch: 93 | !(0 <= i@192@01)]
(assert (not (<= 0 i@192@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 93 | 0 <= i@192@01]
(assert (<= 0 i@192@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@192@01) (not (<= 0 i@192@01))))
(assert (and (<= 0 i@192@01) (< i@192@01 len@137@01)))
; [eval] br[i]
(push) ; 4
(assert (not (>= i@192@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@192@01 (Seq_length br@135@01))))
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
    (and (<= 0 i@192@01) (< i@192@01 len@137@01))
    (or (<= 0 i@192@01) (not (<= 0 i@192@01))))
  :pattern ((Seq_index br@135@01 i@192@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@192@01 Int) (i2@192@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@192@01) (< i1@192@01 len@137@01))
      (and (<= 0 i2@192@01) (< i2@192@01 len@137@01))
      (= (Seq_index br@135@01 i1@192@01) (Seq_index br@135@01 i2@192@01)))
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
    (and (<= 0 i@192@01) (< i@192@01 len@137@01))
    (and
      (= (inv@193@01 (Seq_index br@135@01 i@192@01)) i@192@01)
      (img@194@01 (Seq_index br@135@01 i@192@01))))
  :pattern ((Seq_index br@135@01 i@192@01))
  :qid |quant-u-107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@194@01 r)
      (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
    (= (Seq_index br@135@01 (inv@193@01 r)) r))
  :pattern ((inv@193@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@192@01 Int)) (!
  (=>
    (and (<= 0 i@192@01) (< i@192@01 len@137@01))
    (not (= (Seq_index br@135@01 i@192@01) $Ref.null)))
  :pattern ((Seq_index br@135@01 i@192@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@135@01 i@192@01) (Seq_index ar@134@01 i@189@01))
    (=
      (and
        (img@194@01 r)
        (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
      (and
        (img@191@01 r)
        (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))))
  
  :qid |quant-u-108|))))
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
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 len@137@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@137@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 94 | 0 < len@137@01 | live]
; [else-branch: 94 | !(0 < len@137@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 94 | 0 < len@137@01]
(assert (< 0 len@137@01))
; [eval] |cr| == len
; [eval] |cr|
(pop) ; 4
(push) ; 4
; [else-branch: 94 | !(0 < len@137@01)]
(assert (not (< 0 len@137@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))))
(declare-const i@195@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 95 | !(0 <= i@195@01) | live]
; [else-branch: 95 | 0 <= i@195@01 | live]
(push) ; 5
; [then-branch: 95 | !(0 <= i@195@01)]
(assert (not (<= 0 i@195@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 95 | 0 <= i@195@01]
(assert (<= 0 i@195@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@195@01) (not (<= 0 i@195@01))))
(assert (and (<= 0 i@195@01) (< i@195@01 len@137@01)))
; [eval] cr[i]
(push) ; 4
(assert (not (>= i@195@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@195@01 (Seq_length cr@136@01))))
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
    (and (<= 0 i@195@01) (< i@195@01 len@137@01))
    (or (<= 0 i@195@01) (not (<= 0 i@195@01))))
  :pattern ((Seq_index cr@136@01 i@195@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@195@01 Int) (i2@195@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@195@01) (< i1@195@01 len@137@01))
      (and (<= 0 i2@195@01) (< i2@195@01 len@137@01))
      (= (Seq_index cr@136@01 i1@195@01) (Seq_index cr@136@01 i2@195@01)))
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
    (and (<= 0 i@195@01) (< i@195@01 len@137@01))
    (and
      (= (inv@196@01 (Seq_index cr@136@01 i@195@01)) i@195@01)
      (img@197@01 (Seq_index cr@136@01 i@195@01))))
  :pattern ((Seq_index cr@136@01 i@195@01))
  :qid |quant-u-110|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@197@01 r)
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
    (= (Seq_index cr@136@01 (inv@196@01 r)) r))
  :pattern ((inv@196@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@195@01 Int)) (!
  (=>
    (and (<= 0 i@195@01) (< i@195@01 len@137@01))
    (not (= (Seq_index cr@136@01 i@195@01) $Ref.null)))
  :pattern ((Seq_index cr@136@01 i@195@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@136@01 i@195@01) (Seq_index br@135@01 i@192@01))
    (=
      (and
        (img@197@01 r)
        (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
      (and
        (img@194@01 r)
        (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))))
  
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
    (= (Seq_index cr@136@01 i@195@01) (Seq_index ar@134@01 i@189@01))
    (=
      (and
        (img@197@01 r)
        (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
      (and
        (img@191@01 r)
        (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))))
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))))))
(declare-const i@198@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (0 <= 0 ? 1 : 0) - 1 <= i && i < len - 1
; [eval] (0 <= 0 ? 1 : 0) - 1 <= i
; [eval] (0 <= 0 ? 1 : 0) - 1
; [eval] (0 <= 0 ? 1 : 0)
; [eval] 0 <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 96 | True | live]
; [else-branch: 96 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 96 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
; [then-branch: 97 | !(0 <= i@198@01) | live]
; [else-branch: 97 | 0 <= i@198@01 | live]
(push) ; 5
; [then-branch: 97 | !(0 <= i@198@01)]
(assert (not (<= 0 i@198@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 97 | 0 <= i@198@01]
(assert (<= 0 i@198@01))
; [eval] i < len - 1
; [eval] len - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@198@01) (not (<= 0 i@198@01))))
(assert (and (<= 0 i@198@01) (< i@198@01 (- len@137@01 1))))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@198@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@198@01 (Seq_length ar@134@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@199@01 ($Ref) Int)
(declare-fun img@200@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@198@01 Int)) (!
  (=>
    (and (<= 0 i@198@01) (< i@198@01 (- len@137@01 1)))
    (or (<= 0 i@198@01) (not (<= 0 i@198@01))))
  :pattern ((Seq_index ar@134@01 i@198@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@198@01 Int) (i2@198@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@198@01) (< i1@198@01 (- len@137@01 1)))
      (and (<= 0 i2@198@01) (< i2@198@01 (- len@137@01 1)))
      (= (Seq_index ar@134@01 i1@198@01) (Seq_index ar@134@01 i2@198@01)))
    (= i1@198@01 i2@198@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@198@01 Int)) (!
  (=>
    (and (<= 0 i@198@01) (< i@198@01 (- len@137@01 1)))
    (and
      (= (inv@199@01 (Seq_index ar@134@01 i@198@01)) i@198@01)
      (img@200@01 (Seq_index ar@134@01 i@198@01))))
  :pattern ((Seq_index ar@134@01 i@198@01))
  :qid |quant-u-114|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@200@01 r)
      (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
    (= (Seq_index ar@134@01 (inv@199@01 r)) r))
  :pattern ((inv@199@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@198@01 Int)) (!
  (=>
    (and (<= 0 i@198@01) (< i@198@01 (- len@137@01 1)))
    (not (= (Seq_index ar@134@01 i@198@01) $Ref.null)))
  :pattern ((Seq_index ar@134@01 i@198@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ar@134@01 i@198@01) (Seq_index cr@136@01 i@195@01))
    (=
      (and
        (img@200@01 r)
        (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
      (and
        (img@197@01 r)
        (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))))
  
  :qid |quant-u-115|))))
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
    (= (Seq_index ar@134@01 i@198@01) (Seq_index br@135@01 i@192@01))
    (=
      (and
        (img@200@01 r)
        (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
      (and
        (img@194@01 r)
        (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))))
  
  :qid |quant-u-116|))))
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
    (= (Seq_index ar@134@01 i@198@01) (Seq_index ar@134@01 i@189@01))
    (=
      (and
        (img@200@01 r)
        (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
      (and
        (img@191@01 r)
        (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))))
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] 0 <= |ar| - 1 && |ar| - 1 < len
; [eval] 0 <= |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(set-option :timeout 0)
(push) ; 3
; [then-branch: 98 | !(0 <= |ar@134@01| - 1) | live]
; [else-branch: 98 | 0 <= |ar@134@01| - 1 | live]
(push) ; 4
; [then-branch: 98 | !(0 <= |ar@134@01| - 1)]
(assert (not (<= 0 (- (Seq_length ar@134@01) 1))))
(pop) ; 4
(push) ; 4
; [else-branch: 98 | 0 <= |ar@134@01| - 1]
(assert (<= 0 (- (Seq_length ar@134@01) 1)))
; [eval] |ar| - 1 < len
; [eval] |ar| - 1
; [eval] |ar|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (<= 0 (- (Seq_length ar@134@01) 1))
  (not (<= 0 (- (Seq_length ar@134@01) 1)))))
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and
    (<= 0 (- (Seq_length ar@134@01) 1))
    (< (- (Seq_length ar@134@01) 1) len@137@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (<= 0 (- (Seq_length ar@134@01) 1))
  (< (- (Seq_length ar@134@01) 1) len@137@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 99 | 0 <= |ar@134@01| - 1 && |ar@134@01| - 1 < len@137@01 | live]
; [else-branch: 99 | !(0 <= |ar@134@01| - 1 && |ar@134@01| - 1 < len@137@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 99 | 0 <= |ar@134@01| - 1 && |ar@134@01| - 1 < len@137@01]
(assert (and
  (<= 0 (- (Seq_length ar@134@01) 1))
  (< (- (Seq_length ar@134@01) 1) len@137@01)))
; [eval] ar[|ar| - 1]
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 4
(assert (not (>= (- (Seq_length ar@134@01) 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (- (Seq_length ar@134@01) 1) (Seq_length ar@134@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const sm@201@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@201@01  $FVF<Ref__Integer_value>) (Seq_index
    ar@134@01
    (- (Seq_length ar@134@01) 1)))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))))))
(assert (<=
  $Perm.No
  (ite
    (=
      (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1))
      (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1)))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (=
      (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1))
      (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1)))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1))
    (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1)))
  (not (= (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1)) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |ar| == len
; [eval] |ar|
(declare-const i@202@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 100 | !(0 <= i@202@01) | live]
; [else-branch: 100 | 0 <= i@202@01 | live]
(push) ; 6
; [then-branch: 100 | !(0 <= i@202@01)]
(assert (not (<= 0 i@202@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 100 | 0 <= i@202@01]
(assert (<= 0 i@202@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@202@01) (not (<= 0 i@202@01))))
(assert (and (<= 0 i@202@01) (< i@202@01 len@137@01)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@202@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@202@01 (Seq_length ar@134@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@203@01 ($Ref) Int)
(declare-fun img@204@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@202@01 Int)) (!
  (=>
    (and (<= 0 i@202@01) (< i@202@01 len@137@01))
    (or (<= 0 i@202@01) (not (<= 0 i@202@01))))
  :pattern ((Seq_index ar@134@01 i@202@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@202@01 Int) (i2@202@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@202@01) (< i1@202@01 len@137@01))
      (and (<= 0 i2@202@01) (< i2@202@01 len@137@01))
      (= (Seq_index ar@134@01 i1@202@01) (Seq_index ar@134@01 i2@202@01)))
    (= i1@202@01 i2@202@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@202@01 Int)) (!
  (=>
    (and (<= 0 i@202@01) (< i@202@01 len@137@01))
    (and
      (= (inv@203@01 (Seq_index ar@134@01 i@202@01)) i@202@01)
      (img@204@01 (Seq_index ar@134@01 i@202@01))))
  :pattern ((Seq_index ar@134@01 i@202@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@204@01 r)
      (and (<= 0 (inv@203@01 r)) (< (inv@203@01 r) len@137@01)))
    (= (Seq_index ar@134@01 (inv@203@01 r)) r))
  :pattern ((inv@203@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@202@01 Int)) (!
  (= (Seq_index ar@134@01 i@202@01) (Seq_index br@135@01 i@202@01))
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@202@01 Int)) (!
  (= (Seq_index ar@134@01 i@202@01) (Seq_index cr@136@01 i@202@01))
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@205@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@203@01 r)) (< (inv@203@01 r) len@137@01))
      (img@204@01 r)
      (= r (Seq_index ar@134@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (and
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@206@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@203@01 r)) (< (inv@203@01 r) len@137@01))
      (img@204@01 r)
      (= r (Seq_index ar@134@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (and
          (img@200@01 r)
          (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@205@01 r)))
    $Perm.No))
(define-fun pTaken@207@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@203@01 r)) (< (inv@203@01 r) len@137@01))
      (img@204@01 r)
      (= r (Seq_index ar@134@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (= r (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- $Perm.Write (pTaken@205@01 r)) (pTaken@206@01 r)))
    $Perm.No))
(define-fun pTaken@208@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@203@01 r)) (< (inv@203@01 r) len@137@01))
      (img@204@01 r)
      (= r (Seq_index ar@134@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (and
          (img@194@01 r)
          (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@205@01 r)) (pTaken@206@01 r))
        (pTaken@207@01 r)))
    $Perm.No))
(define-fun pTaken@209@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@203@01 r)) (< (inv@203@01 r) len@137@01))
      (img@204@01 r)
      (= r (Seq_index ar@134@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (and
          (img@197@01 r)
          (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (- (- $Perm.Write (pTaken@205@01 r)) (pTaken@206@01 r))
          (pTaken@207@01 r))
        (pTaken@208@01 r)))
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
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@205@01 r))
    $Perm.No)
  
  :qid |quant-u-122|))))
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
      (and (<= 0 (inv@203@01 r)) (< (inv@203@01 r) len@137@01))
      (img@204@01 r)
      (= r (Seq_index ar@134@01 (inv@203@01 r))))
    (= (- $Perm.Write (pTaken@205@01 r)) $Perm.No))
  
  :qid |quant-u-123|))))
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
          (img@200@01 r)
          (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@206@01 r))
    $Perm.No)
  
  :qid |quant-u-124|))))
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
      (and (<= 0 (inv@203@01 r)) (< (inv@203@01 r) len@137@01))
      (img@204@01 r)
      (= r (Seq_index ar@134@01 (inv@203@01 r))))
    (= (- (- $Perm.Write (pTaken@205@01 r)) (pTaken@206@01 r)) $Perm.No))
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1))
        (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (pTaken@207@01 (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1))))
  $Perm.No)))
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
      (and (<= 0 (inv@203@01 r)) (< (inv@203@01 r) len@137@01))
      (img@204@01 r)
      (= r (Seq_index ar@134@01 (inv@203@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@205@01 r)) (pTaken@206@01 r))
        (pTaken@207@01 r))
      $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@210@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@191@01 r)
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@188@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@188@01))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@194@01 r)
      (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@197@01 r)
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@200@01 r)
      (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index ar@134@01 (- (Seq_length ar@134@01) 1)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@201@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@201@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef10|)))
; [eval] |br| == len
; [eval] |br|
(declare-const i@211@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 101 | !(0 <= i@211@01) | live]
; [else-branch: 101 | 0 <= i@211@01 | live]
(push) ; 6
; [then-branch: 101 | !(0 <= i@211@01)]
(assert (not (<= 0 i@211@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 101 | 0 <= i@211@01]
(assert (<= 0 i@211@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@211@01) (not (<= 0 i@211@01))))
(assert (and (<= 0 i@211@01) (< i@211@01 len@137@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@211@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@211@01 (Seq_length br@135@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@212@01 ($Ref) Int)
(declare-fun img@213@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@211@01 Int)) (!
  (=>
    (and (<= 0 i@211@01) (< i@211@01 len@137@01))
    (or (<= 0 i@211@01) (not (<= 0 i@211@01))))
  :pattern ((Seq_index br@135@01 i@211@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@211@01 Int) (i2@211@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@211@01) (< i1@211@01 len@137@01))
      (and (<= 0 i2@211@01) (< i2@211@01 len@137@01))
      (= (Seq_index br@135@01 i1@211@01) (Seq_index br@135@01 i2@211@01)))
    (= i1@211@01 i2@211@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@211@01 Int)) (!
  (=>
    (and (<= 0 i@211@01) (< i@211@01 len@137@01))
    (and
      (= (inv@212@01 (Seq_index br@135@01 i@211@01)) i@211@01)
      (img@213@01 (Seq_index br@135@01 i@211@01))))
  :pattern ((Seq_index br@135@01 i@211@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@213@01 r)
      (and (<= 0 (inv@212@01 r)) (< (inv@212@01 r) len@137@01)))
    (= (Seq_index br@135@01 (inv@212@01 r)) r))
  :pattern ((inv@212@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@211@01 Int)) (!
  (= (Seq_index br@135@01 i@211@01) (Seq_index cr@136@01 i@211@01))
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@214@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@212@01 r)) (< (inv@212@01 r) len@137@01))
      (img@213@01 r)
      (= r (Seq_index br@135@01 (inv@212@01 r))))
    ($Perm.min
      (ite
        (and
          (img@194@01 r)
          (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@215@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@212@01 r)) (< (inv@212@01 r) len@137@01))
      (img@213@01 r)
      (= r (Seq_index br@135@01 (inv@212@01 r))))
    ($Perm.min
      (ite
        (and
          (img@197@01 r)
          (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@214@01 r)))
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
          (img@194@01 r)
          (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@214@01 r))
    $Perm.No)
  
  :qid |quant-u-131|))))
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
      (and (<= 0 (inv@212@01 r)) (< (inv@212@01 r) len@137@01))
      (img@213@01 r)
      (= r (Seq_index br@135@01 (inv@212@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@214@01 r)) $Perm.No))
  
  :qid |quant-u-132|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@216@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@197@01 r)
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@216@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@216@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@194@01 r)
      (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@216@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@216@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r))
  :qid |qp.fvfValDef12|)))
; [eval] |cr| == len
; [eval] |cr|
(declare-const i@217@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 102 | !(0 <= i@217@01) | live]
; [else-branch: 102 | 0 <= i@217@01 | live]
(push) ; 6
; [then-branch: 102 | !(0 <= i@217@01)]
(assert (not (<= 0 i@217@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 102 | 0 <= i@217@01]
(assert (<= 0 i@217@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@217@01) (not (<= 0 i@217@01))))
(assert (and (<= 0 i@217@01) (< i@217@01 len@137@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@217@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@217@01 (Seq_length cr@136@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@218@01 ($Ref) Int)
(declare-fun img@219@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@217@01 Int)) (!
  (=>
    (and (<= 0 i@217@01) (< i@217@01 len@137@01))
    (or (<= 0 i@217@01) (not (<= 0 i@217@01))))
  :pattern ((Seq_index cr@136@01 i@217@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@217@01 Int) (i2@217@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@217@01) (< i1@217@01 len@137@01))
      (and (<= 0 i2@217@01) (< i2@217@01 len@137@01))
      (= (Seq_index cr@136@01 i1@217@01) (Seq_index cr@136@01 i2@217@01)))
    (= i1@217@01 i2@217@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@217@01 Int)) (!
  (=>
    (and (<= 0 i@217@01) (< i@217@01 len@137@01))
    (and
      (= (inv@218@01 (Seq_index cr@136@01 i@217@01)) i@217@01)
      (img@219@01 (Seq_index cr@136@01 i@217@01))))
  :pattern ((Seq_index cr@136@01 i@217@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@219@01 r)
      (and (<= 0 (inv@218@01 r)) (< (inv@218@01 r) len@137@01)))
    (= (Seq_index cr@136@01 (inv@218@01 r)) r))
  :pattern ((inv@218@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@220@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@218@01 r)) (< (inv@218@01 r) len@137@01))
      (img@219@01 r)
      (= r (Seq_index cr@136@01 (inv@218@01 r))))
    ($Perm.min
      (ite
        (and
          (img@197@01 r)
          (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
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
          (img@197@01 r)
          (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@220@01 r))
    $Perm.No)
  
  :qid |quant-u-135|))))
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
      (and (<= 0 (inv@218@01 r)) (< (inv@218@01 r) len@137@01))
      (img@219@01 r)
      (= r (Seq_index cr@136@01 (inv@218@01 r))))
    (= (- $Perm.Write (pTaken@220@01 r)) $Perm.No))
  
  :qid |quant-u-136|))))
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
      (img@197@01 r)
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r))
  :qid |qp.fvfValDef13|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 99 | !(0 <= |ar@134@01| - 1 && |ar@134@01| - 1 < len@137@01)]
(assert (not
  (and
    (<= 0 (- (Seq_length ar@134@01) 1))
    (< (- (Seq_length ar@134@01) 1) len@137@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |ar| == len
; [eval] |ar|
(declare-const i@222@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 103 | !(0 <= i@222@01) | live]
; [else-branch: 103 | 0 <= i@222@01 | live]
(push) ; 6
; [then-branch: 103 | !(0 <= i@222@01)]
(assert (not (<= 0 i@222@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 103 | 0 <= i@222@01]
(assert (<= 0 i@222@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@222@01) (not (<= 0 i@222@01))))
(assert (and (<= 0 i@222@01) (< i@222@01 len@137@01)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@222@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@222@01 (Seq_length ar@134@01))))
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
    (and (<= 0 i@222@01) (< i@222@01 len@137@01))
    (or (<= 0 i@222@01) (not (<= 0 i@222@01))))
  :pattern ((Seq_index ar@134@01 i@222@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@222@01 Int) (i2@222@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@222@01) (< i1@222@01 len@137@01))
      (and (<= 0 i2@222@01) (< i2@222@01 len@137@01))
      (= (Seq_index ar@134@01 i1@222@01) (Seq_index ar@134@01 i2@222@01)))
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
    (and (<= 0 i@222@01) (< i@222@01 len@137@01))
    (and
      (= (inv@223@01 (Seq_index ar@134@01 i@222@01)) i@222@01)
      (img@224@01 (Seq_index ar@134@01 i@222@01))))
  :pattern ((Seq_index ar@134@01 i@222@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@224@01 r)
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@137@01)))
    (= (Seq_index ar@134@01 (inv@223@01 r)) r))
  :pattern ((inv@223@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@222@01 Int)) (!
  (= (Seq_index ar@134@01 i@222@01) (Seq_index br@135@01 i@222@01))
  
  :qid |quant-u-138|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@222@01 Int)) (!
  (= (Seq_index ar@134@01 i@222@01) (Seq_index cr@136@01 i@222@01))
  
  :qid |quant-u-139|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@225@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@137@01))
      (img@224@01 r)
      (= r (Seq_index ar@134@01 (inv@223@01 r))))
    ($Perm.min
      (ite
        (and
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@226@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@137@01))
      (img@224@01 r)
      (= r (Seq_index ar@134@01 (inv@223@01 r))))
    ($Perm.min
      (ite
        (and
          (img@194@01 r)
          (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@225@01 r)))
    $Perm.No))
(define-fun pTaken@227@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@137@01))
      (img@224@01 r)
      (= r (Seq_index ar@134@01 (inv@223@01 r))))
    ($Perm.min
      (ite
        (and
          (img@197@01 r)
          (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@225@01 r)) (pTaken@226@01 r)))
    $Perm.No))
(define-fun pTaken@228@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@137@01))
      (img@224@01 r)
      (= r (Seq_index ar@134@01 (inv@223@01 r))))
    ($Perm.min
      (ite
        (and
          (img@200@01 r)
          (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@225@01 r)) (pTaken@226@01 r))
        (pTaken@227@01 r)))
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
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@225@01 r))
    $Perm.No)
  
  :qid |quant-u-141|))))
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
      (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) len@137@01))
      (img@224@01 r)
      (= r (Seq_index ar@134@01 (inv@223@01 r))))
    (= (- $Perm.Write (pTaken@225@01 r)) $Perm.No))
  
  :qid |quant-u-142|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@229@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@191@01 r)
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@188@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@188@01))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@194@01 r)
      (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@197@01 r)
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@200@01 r)
      (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))) r))
  :qid |qp.fvfValDef17|)))
; [eval] |br| == len
; [eval] |br|
(declare-const i@230@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 104 | !(0 <= i@230@01) | live]
; [else-branch: 104 | 0 <= i@230@01 | live]
(push) ; 6
; [then-branch: 104 | !(0 <= i@230@01)]
(assert (not (<= 0 i@230@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 104 | 0 <= i@230@01]
(assert (<= 0 i@230@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@230@01) (not (<= 0 i@230@01))))
(assert (and (<= 0 i@230@01) (< i@230@01 len@137@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@230@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@230@01 (Seq_length br@135@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@231@01 ($Ref) Int)
(declare-fun img@232@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@230@01 Int)) (!
  (=>
    (and (<= 0 i@230@01) (< i@230@01 len@137@01))
    (or (<= 0 i@230@01) (not (<= 0 i@230@01))))
  :pattern ((Seq_index br@135@01 i@230@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@230@01 Int) (i2@230@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@230@01) (< i1@230@01 len@137@01))
      (and (<= 0 i2@230@01) (< i2@230@01 len@137@01))
      (= (Seq_index br@135@01 i1@230@01) (Seq_index br@135@01 i2@230@01)))
    (= i1@230@01 i2@230@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@230@01 Int)) (!
  (=>
    (and (<= 0 i@230@01) (< i@230@01 len@137@01))
    (and
      (= (inv@231@01 (Seq_index br@135@01 i@230@01)) i@230@01)
      (img@232@01 (Seq_index br@135@01 i@230@01))))
  :pattern ((Seq_index br@135@01 i@230@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@232@01 r)
      (and (<= 0 (inv@231@01 r)) (< (inv@231@01 r) len@137@01)))
    (= (Seq_index br@135@01 (inv@231@01 r)) r))
  :pattern ((inv@231@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@230@01 Int)) (!
  (= (Seq_index br@135@01 i@230@01) (Seq_index ar@134@01 i@230@01))
  
  :qid |quant-u-144|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@230@01 Int)) (!
  (= (Seq_index br@135@01 i@230@01) (Seq_index cr@136@01 i@230@01))
  
  :qid |quant-u-145|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@233@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@231@01 r)) (< (inv@231@01 r) len@137@01))
      (img@232@01 r)
      (= r (Seq_index br@135@01 (inv@231@01 r))))
    ($Perm.min
      (ite
        (and
          (img@200@01 r)
          (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@234@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@231@01 r)) (< (inv@231@01 r) len@137@01))
      (img@232@01 r)
      (= r (Seq_index br@135@01 (inv@231@01 r))))
    ($Perm.min
      (ite
        (and
          (img@197@01 r)
          (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@233@01 r)))
    $Perm.No))
(define-fun pTaken@235@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@231@01 r)) (< (inv@231@01 r) len@137@01))
      (img@232@01 r)
      (= r (Seq_index br@135@01 (inv@231@01 r))))
    ($Perm.min
      (ite
        (and
          (img@194@01 r)
          (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@233@01 r)) (pTaken@234@01 r)))
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
          (img@200@01 r)
          (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@233@01 r))
    $Perm.No)
  
  :qid |quant-u-147|))))
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
      (and (<= 0 (inv@231@01 r)) (< (inv@231@01 r) len@137@01))
      (img@232@01 r)
      (= r (Seq_index br@135@01 (inv@231@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@233@01 r)) $Perm.No))
  
  :qid |quant-u-148|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@236@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@200@01 r)
      (and (<= 0 (inv@199@01 r)) (< (inv@199@01 r) (- len@137@01 1))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@236@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@236@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01)))))))) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@197@01 r)
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@236@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@236@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@194@01 r)
      (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@236@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@236@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r))
  :qid |qp.fvfValDef20|)))
; [eval] |cr| == len
; [eval] |cr|
(declare-const i@237@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 105 | !(0 <= i@237@01) | live]
; [else-branch: 105 | 0 <= i@237@01 | live]
(push) ; 6
; [then-branch: 105 | !(0 <= i@237@01)]
(assert (not (<= 0 i@237@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 105 | 0 <= i@237@01]
(assert (<= 0 i@237@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@237@01) (not (<= 0 i@237@01))))
(assert (and (<= 0 i@237@01) (< i@237@01 len@137@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@237@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@237@01 (Seq_length cr@136@01))))
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
    (and (<= 0 i@237@01) (< i@237@01 len@137@01))
    (or (<= 0 i@237@01) (not (<= 0 i@237@01))))
  :pattern ((Seq_index cr@136@01 i@237@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@237@01 Int) (i2@237@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@237@01) (< i1@237@01 len@137@01))
      (and (<= 0 i2@237@01) (< i2@237@01 len@137@01))
      (= (Seq_index cr@136@01 i1@237@01) (Seq_index cr@136@01 i2@237@01)))
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
    (and (<= 0 i@237@01) (< i@237@01 len@137@01))
    (and
      (= (inv@238@01 (Seq_index cr@136@01 i@237@01)) i@237@01)
      (img@239@01 (Seq_index cr@136@01 i@237@01))))
  :pattern ((Seq_index cr@136@01 i@237@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@239@01 r)
      (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@137@01)))
    (= (Seq_index cr@136@01 (inv@238@01 r)) r))
  :pattern ((inv@238@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@237@01 Int)) (!
  (= (Seq_index cr@136@01 i@237@01) (Seq_index br@135@01 i@237@01))
  
  :qid |quant-u-150|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@240@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@137@01))
      (img@239@01 r)
      (= r (Seq_index cr@136@01 (inv@238@01 r))))
    ($Perm.min
      (ite
        (and
          (img@194@01 r)
          (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@241@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@137@01))
      (img@239@01 r)
      (= r (Seq_index cr@136@01 (inv@238@01 r))))
    ($Perm.min
      (ite
        (and
          (img@197@01 r)
          (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@240@01 r)))
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
          (img@194@01 r)
          (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@240@01 r))
    $Perm.No)
  
  :qid |quant-u-152|))))
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
      (and (<= 0 (inv@238@01 r)) (< (inv@238@01 r) len@137@01))
      (img@239@01 r)
      (= r (Seq_index cr@136@01 (inv@238@01 r))))
    (= (- $Perm.Write (pTaken@240@01 r)) $Perm.No))
  
  :qid |quant-u-153|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@242@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@194@01 r)
      (and (<= 0 (inv@193@01 r)) (< (inv@193@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@242@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@242@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@188@01))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@197@01 r)
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) len@137@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@242@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@242@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@188@01))))))) r))
  :qid |qp.fvfValDef22|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
