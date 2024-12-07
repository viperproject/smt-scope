(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:21:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@62@12@62@106-aux|)))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@62@12@62@106|)))
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
; [eval] 0 <= 0 && 0 < len
; [eval] 0 <= 0
(push) ; 2
; [then-branch: 7 | False | live]
; [else-branch: 7 | True | live]
(push) ; 3
; [then-branch: 7 | False]
(assert false)
(pop) ; 3
(push) ; 3
; [else-branch: 7 | True]
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
; [then-branch: 8 | 0 < len@8@01 | live]
; [else-branch: 8 | !(0 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 8 | 0 < len@8@01]
(assert (< 0 len@8@01))
; [eval] ar[0]
(push) ; 3
(assert (not (< 0 (Seq_length ar@9@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@18@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@18@01  $FVF<Ref__Integer_value>) (Seq_index
    ar@9@01
    0))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(assert (<=
  $Perm.No
  (ite
    (= (Seq_index ar@9@01 0) (Seq_index ar@9@01 0))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (= (Seq_index ar@9@01 0) (Seq_index ar@9@01 0))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (= (Seq_index ar@9@01 0) (Seq_index ar@9@01 0))
  (not (= (Seq_index ar@9@01 0) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(declare-const i@19@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] 1 <= i
(push) ; 4
; [then-branch: 9 | !(1 <= i@19@01) | live]
; [else-branch: 9 | 1 <= i@19@01 | live]
(push) ; 5
; [then-branch: 9 | !(1 <= i@19@01)]
(assert (not (<= 1 i@19@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | 1 <= i@19@01]
(assert (<= 1 i@19@01))
; [eval] i < (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] (|ar| - 1 < len ? |ar| - 1 : len)
; [eval] |ar| - 1 < len
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length ar@9@01) 1) len@8@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- (Seq_length ar@9@01) 1) len@8@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | |ar@9@01| - 1 < len@8@01 | live]
; [else-branch: 10 | !(|ar@9@01| - 1 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 10 | |ar@9@01| - 1 < len@8@01]
(assert (< (- (Seq_length ar@9@01) 1) len@8@01))
; [eval] |ar| - 1
; [eval] |ar|
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (< (- (Seq_length ar@9@01) 1) len@8@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (<= 1 i@19@01) (and (<= 1 i@19@01) (< (- (Seq_length ar@9@01) 1) len@8@01))))
(assert (or (<= 1 i@19@01) (not (<= 1 i@19@01))))
(assert (and (<= 1 i@19@01) (< i@19@01 (+ (- (Seq_length ar@9@01) 1) 1))))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@19@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@19@01 (Seq_length ar@9@01))))
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
    (and (<= 1 i@19@01) (< i@19@01 (+ (- (Seq_length ar@9@01) 1) 1)))
    (and
      (=>
        (<= 1 i@19@01)
        (and (<= 1 i@19@01) (< (- (Seq_length ar@9@01) 1) len@8@01)))
      (or (<= 1 i@19@01) (not (<= 1 i@19@01)))))
  :pattern ((Seq_index ar@9@01 i@19@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@19@01 Int) (i2@19@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@19@01) (< i1@19@01 (+ (- (Seq_length ar@9@01) 1) 1)))
      (and (<= 1 i2@19@01) (< i2@19@01 (+ (- (Seq_length ar@9@01) 1) 1)))
      (= (Seq_index ar@9@01 i1@19@01) (Seq_index ar@9@01 i2@19@01)))
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
    (and (<= 1 i@19@01) (< i@19@01 (+ (- (Seq_length ar@9@01) 1) 1)))
    (and
      (= (inv@20@01 (Seq_index ar@9@01 i@19@01)) i@19@01)
      (img@21@01 (Seq_index ar@9@01 i@19@01))))
  :pattern ((Seq_index ar@9@01 i@19@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and
        (<= 1 (inv@20@01 r))
        (< (inv@20@01 r) (+ (- (Seq_length ar@9@01) 1) 1))))
    (= (Seq_index ar@9@01 (inv@20@01 r)) r))
  :pattern ((inv@20@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 1 i@19@01) (< i@19@01 (+ (- (Seq_length ar@9@01) 1) 1)))
    (not (= (Seq_index ar@9@01 i@19@01) $Ref.null)))
  :pattern ((Seq_index ar@9@01 i@19@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ar@9@01 i@19@01) (Seq_index ar@9@01 i@15@01))
    (=
      (and
        (img@21@01 r)
        (and
          (<= 1 (inv@20@01 r))
          (< (inv@20@01 r) (+ (- (Seq_length ar@9@01) 1) 1))))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  $Snap.unit))
; [eval] 0 < len ==> |br| == len
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
; [then-branch: 11 | 0 < len@8@01 | live]
; [else-branch: 11 | !(0 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | 0 < len@8@01]
; [eval] |br| == len
; [eval] |br|
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> (< 0 len@8@01) (= (Seq_length br@10@01) len@8@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { br[j], br[k] } 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k])
(declare-const j@22@01 Int)
(declare-const k@23@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k]
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 12 | !(0 <= j@22@01) | live]
; [else-branch: 12 | 0 <= j@22@01 | live]
(push) ; 5
; [then-branch: 12 | !(0 <= j@22@01)]
(assert (not (<= 0 j@22@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | 0 <= j@22@01]
(assert (<= 0 j@22@01))
; [eval] j < |br|
; [eval] |br|
(push) ; 6
; [then-branch: 13 | !(j@22@01 < |br@10@01|) | live]
; [else-branch: 13 | j@22@01 < |br@10@01| | live]
(push) ; 7
; [then-branch: 13 | !(j@22@01 < |br@10@01|)]
(assert (not (< j@22@01 (Seq_length br@10@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | j@22@01 < |br@10@01|]
(assert (< j@22@01 (Seq_length br@10@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 14 | !(0 <= k@23@01) | live]
; [else-branch: 14 | 0 <= k@23@01 | live]
(push) ; 9
; [then-branch: 14 | !(0 <= k@23@01)]
(assert (not (<= 0 k@23@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 14 | 0 <= k@23@01]
(assert (<= 0 k@23@01))
; [eval] k < |br|
; [eval] |br|
(push) ; 10
; [then-branch: 15 | !(k@23@01 < |br@10@01|) | live]
; [else-branch: 15 | k@23@01 < |br@10@01| | live]
(push) ; 11
; [then-branch: 15 | !(k@23@01 < |br@10@01|)]
(assert (not (< k@23@01 (Seq_length br@10@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 15 | k@23@01 < |br@10@01|]
(assert (< k@23@01 (Seq_length br@10@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@23@01 (Seq_length br@10@01)) (not (< k@23@01 (Seq_length br@10@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@23@01)
  (and
    (<= 0 k@23@01)
    (or
      (< k@23@01 (Seq_length br@10@01))
      (not (< k@23@01 (Seq_length br@10@01)))))))
(assert (or (<= 0 k@23@01) (not (<= 0 k@23@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@22@01 (Seq_length br@10@01))
  (and
    (< j@22@01 (Seq_length br@10@01))
    (=>
      (<= 0 k@23@01)
      (and
        (<= 0 k@23@01)
        (or
          (< k@23@01 (Seq_length br@10@01))
          (not (< k@23@01 (Seq_length br@10@01))))))
    (or (<= 0 k@23@01) (not (<= 0 k@23@01))))))
(assert (or (< j@22@01 (Seq_length br@10@01)) (not (< j@22@01 (Seq_length br@10@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@22@01)
  (and
    (<= 0 j@22@01)
    (=>
      (< j@22@01 (Seq_length br@10@01))
      (and
        (< j@22@01 (Seq_length br@10@01))
        (=>
          (<= 0 k@23@01)
          (and
            (<= 0 k@23@01)
            (or
              (< k@23@01 (Seq_length br@10@01))
              (not (< k@23@01 (Seq_length br@10@01))))))
        (or (<= 0 k@23@01) (not (<= 0 k@23@01)))))
    (or
      (< j@22@01 (Seq_length br@10@01))
      (not (< j@22@01 (Seq_length br@10@01)))))))
(assert (or (<= 0 j@22@01) (not (<= 0 j@22@01))))
(push) ; 4
; [then-branch: 16 | 0 <= j@22@01 && j@22@01 < |br@10@01| && 0 <= k@23@01 && k@23@01 < |br@10@01| && j@22@01 != k@23@01 | live]
; [else-branch: 16 | !(0 <= j@22@01 && j@22@01 < |br@10@01| && 0 <= k@23@01 && k@23@01 < |br@10@01| && j@22@01 != k@23@01) | live]
(push) ; 5
; [then-branch: 16 | 0 <= j@22@01 && j@22@01 < |br@10@01| && 0 <= k@23@01 && k@23@01 < |br@10@01| && j@22@01 != k@23@01]
(assert (and
  (<= 0 j@22@01)
  (and
    (< j@22@01 (Seq_length br@10@01))
    (and
      (<= 0 k@23@01)
      (and (< k@23@01 (Seq_length br@10@01)) (not (= j@22@01 k@23@01)))))))
; [eval] br[j] != br[k]
; [eval] br[j]
(push) ; 6
(assert (not (>= j@22@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] br[k]
(push) ; 6
(assert (not (>= k@23@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 16 | !(0 <= j@22@01 && j@22@01 < |br@10@01| && 0 <= k@23@01 && k@23@01 < |br@10@01| && j@22@01 != k@23@01)]
(assert (not
  (and
    (<= 0 j@22@01)
    (and
      (< j@22@01 (Seq_length br@10@01))
      (and
        (<= 0 k@23@01)
        (and (< k@23@01 (Seq_length br@10@01)) (not (= j@22@01 k@23@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@22@01)
    (and
      (< j@22@01 (Seq_length br@10@01))
      (and
        (<= 0 k@23@01)
        (and (< k@23@01 (Seq_length br@10@01)) (not (= j@22@01 k@23@01))))))
  (and
    (<= 0 j@22@01)
    (< j@22@01 (Seq_length br@10@01))
    (<= 0 k@23@01)
    (< k@23@01 (Seq_length br@10@01))
    (not (= j@22@01 k@23@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@22@01)
      (and
        (< j@22@01 (Seq_length br@10@01))
        (and
          (<= 0 k@23@01)
          (and (< k@23@01 (Seq_length br@10@01)) (not (= j@22@01 k@23@01)))))))
  (and
    (<= 0 j@22@01)
    (and
      (< j@22@01 (Seq_length br@10@01))
      (and
        (<= 0 k@23@01)
        (and (< k@23@01 (Seq_length br@10@01)) (not (= j@22@01 k@23@01))))))))
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
          (< j@22@01 (Seq_length br@10@01))
          (and
            (< j@22@01 (Seq_length br@10@01))
            (=>
              (<= 0 k@23@01)
              (and
                (<= 0 k@23@01)
                (or
                  (< k@23@01 (Seq_length br@10@01))
                  (not (< k@23@01 (Seq_length br@10@01))))))
            (or (<= 0 k@23@01) (not (<= 0 k@23@01)))))
        (or
          (< j@22@01 (Seq_length br@10@01))
          (not (< j@22@01 (Seq_length br@10@01))))))
    (or (<= 0 j@22@01) (not (<= 0 j@22@01)))
    (=>
      (and
        (<= 0 j@22@01)
        (and
          (< j@22@01 (Seq_length br@10@01))
          (and
            (<= 0 k@23@01)
            (and (< k@23@01 (Seq_length br@10@01)) (not (= j@22@01 k@23@01))))))
      (and
        (<= 0 j@22@01)
        (< j@22@01 (Seq_length br@10@01))
        (<= 0 k@23@01)
        (< k@23@01 (Seq_length br@10@01))
        (not (= j@22@01 k@23@01))))
    (or
      (not
        (and
          (<= 0 j@22@01)
          (and
            (< j@22@01 (Seq_length br@10@01))
            (and
              (<= 0 k@23@01)
              (and (< k@23@01 (Seq_length br@10@01)) (not (= j@22@01 k@23@01)))))))
      (and
        (<= 0 j@22@01)
        (and
          (< j@22@01 (Seq_length br@10@01))
          (and
            (<= 0 k@23@01)
            (and (< k@23@01 (Seq_length br@10@01)) (not (= j@22@01 k@23@01))))))))
  :pattern ((Seq_index br@10@01 j@22@01) (Seq_index br@10@01 k@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106-aux|)))
(assert (forall ((j@22@01 Int) (k@23@01 Int)) (!
  (=>
    (and
      (<= 0 j@22@01)
      (and
        (< j@22@01 (Seq_length br@10@01))
        (and
          (<= 0 k@23@01)
          (and (< k@23@01 (Seq_length br@10@01)) (not (= j@22@01 k@23@01))))))
    (not (= (Seq_index br@10@01 j@22@01) (Seq_index br@10@01 k@23@01))))
  :pattern ((Seq_index br@10@01 j@22@01) (Seq_index br@10@01 k@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
(declare-const i@24@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 17 | !(0 <= i@24@01) | live]
; [else-branch: 17 | 0 <= i@24@01 | live]
(push) ; 5
; [then-branch: 17 | !(0 <= i@24@01)]
(assert (not (<= 0 i@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | 0 <= i@24@01]
(assert (<= 0 i@24@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@24@01) (not (<= 0 i@24@01))))
(assert (and (<= 0 i@24@01) (< i@24@01 len@8@01)))
; [eval] br[i]
(push) ; 4
(assert (not (>= i@24@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@24@01 (Seq_length br@10@01))))
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
  :pattern ((Seq_index br@10@01 i@24@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@24@01 Int) (i2@24@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@24@01) (< i1@24@01 len@8@01))
      (and (<= 0 i2@24@01) (< i2@24@01 len@8@01))
      (= (Seq_index br@10@01 i1@24@01) (Seq_index br@10@01 i2@24@01)))
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
      (= (inv@25@01 (Seq_index br@10@01 i@24@01)) i@24@01)
      (img@26@01 (Seq_index br@10@01 i@24@01))))
  :pattern ((Seq_index br@10@01 i@24@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
    (= (Seq_index br@10@01 (inv@25@01 r)) r))
  :pattern ((inv@25@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and (<= 0 i@24@01) (< i@24@01 len@8@01))
    (not (= (Seq_index br@10@01 i@24@01) $Ref.null)))
  :pattern ((Seq_index br@10@01 i@24@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@10@01 i@24@01) (Seq_index ar@9@01 i@19@01))
    (=
      (and (img@26@01 r) (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) len@8@01)))
      (and
        (img@21@01 r)
        (and
          (<= 1 (inv@20@01 r))
          (< (inv@20@01 r) (+ (- (Seq_length ar@9@01) 1) 1))))))
  
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
    (= (Seq_index br@10@01 i@24@01) (Seq_index ar@9@01 i@15@01))
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
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
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
; [then-branch: 18 | 0 < len@8@01 | live]
; [else-branch: 18 | !(0 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | 0 < len@8@01]
; [eval] |cr| == len
; [eval] |cr|
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> (< 0 len@8@01) (= (Seq_length cr@11@01) len@8@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { cr[j], cr[k] } 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k])
(declare-const j@27@01 Int)
(declare-const k@28@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k]
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 19 | !(0 <= j@27@01) | live]
; [else-branch: 19 | 0 <= j@27@01 | live]
(push) ; 5
; [then-branch: 19 | !(0 <= j@27@01)]
(assert (not (<= 0 j@27@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | 0 <= j@27@01]
(assert (<= 0 j@27@01))
; [eval] j < |cr|
; [eval] |cr|
(push) ; 6
; [then-branch: 20 | !(j@27@01 < |cr@11@01|) | live]
; [else-branch: 20 | j@27@01 < |cr@11@01| | live]
(push) ; 7
; [then-branch: 20 | !(j@27@01 < |cr@11@01|)]
(assert (not (< j@27@01 (Seq_length cr@11@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 20 | j@27@01 < |cr@11@01|]
(assert (< j@27@01 (Seq_length cr@11@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 21 | !(0 <= k@28@01) | live]
; [else-branch: 21 | 0 <= k@28@01 | live]
(push) ; 9
; [then-branch: 21 | !(0 <= k@28@01)]
(assert (not (<= 0 k@28@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 21 | 0 <= k@28@01]
(assert (<= 0 k@28@01))
; [eval] k < |cr|
; [eval] |cr|
(push) ; 10
; [then-branch: 22 | !(k@28@01 < |cr@11@01|) | live]
; [else-branch: 22 | k@28@01 < |cr@11@01| | live]
(push) ; 11
; [then-branch: 22 | !(k@28@01 < |cr@11@01|)]
(assert (not (< k@28@01 (Seq_length cr@11@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 22 | k@28@01 < |cr@11@01|]
(assert (< k@28@01 (Seq_length cr@11@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@28@01 (Seq_length cr@11@01)) (not (< k@28@01 (Seq_length cr@11@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@28@01)
  (and
    (<= 0 k@28@01)
    (or
      (< k@28@01 (Seq_length cr@11@01))
      (not (< k@28@01 (Seq_length cr@11@01)))))))
(assert (or (<= 0 k@28@01) (not (<= 0 k@28@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@27@01 (Seq_length cr@11@01))
  (and
    (< j@27@01 (Seq_length cr@11@01))
    (=>
      (<= 0 k@28@01)
      (and
        (<= 0 k@28@01)
        (or
          (< k@28@01 (Seq_length cr@11@01))
          (not (< k@28@01 (Seq_length cr@11@01))))))
    (or (<= 0 k@28@01) (not (<= 0 k@28@01))))))
(assert (or (< j@27@01 (Seq_length cr@11@01)) (not (< j@27@01 (Seq_length cr@11@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@27@01)
  (and
    (<= 0 j@27@01)
    (=>
      (< j@27@01 (Seq_length cr@11@01))
      (and
        (< j@27@01 (Seq_length cr@11@01))
        (=>
          (<= 0 k@28@01)
          (and
            (<= 0 k@28@01)
            (or
              (< k@28@01 (Seq_length cr@11@01))
              (not (< k@28@01 (Seq_length cr@11@01))))))
        (or (<= 0 k@28@01) (not (<= 0 k@28@01)))))
    (or
      (< j@27@01 (Seq_length cr@11@01))
      (not (< j@27@01 (Seq_length cr@11@01)))))))
(assert (or (<= 0 j@27@01) (not (<= 0 j@27@01))))
(push) ; 4
; [then-branch: 23 | 0 <= j@27@01 && j@27@01 < |cr@11@01| && 0 <= k@28@01 && k@28@01 < |cr@11@01| && j@27@01 != k@28@01 | live]
; [else-branch: 23 | !(0 <= j@27@01 && j@27@01 < |cr@11@01| && 0 <= k@28@01 && k@28@01 < |cr@11@01| && j@27@01 != k@28@01) | live]
(push) ; 5
; [then-branch: 23 | 0 <= j@27@01 && j@27@01 < |cr@11@01| && 0 <= k@28@01 && k@28@01 < |cr@11@01| && j@27@01 != k@28@01]
(assert (and
  (<= 0 j@27@01)
  (and
    (< j@27@01 (Seq_length cr@11@01))
    (and
      (<= 0 k@28@01)
      (and (< k@28@01 (Seq_length cr@11@01)) (not (= j@27@01 k@28@01)))))))
; [eval] cr[j] != cr[k]
; [eval] cr[j]
(push) ; 6
(assert (not (>= j@27@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] cr[k]
(push) ; 6
(assert (not (>= k@28@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(0 <= j@27@01 && j@27@01 < |cr@11@01| && 0 <= k@28@01 && k@28@01 < |cr@11@01| && j@27@01 != k@28@01)]
(assert (not
  (and
    (<= 0 j@27@01)
    (and
      (< j@27@01 (Seq_length cr@11@01))
      (and
        (<= 0 k@28@01)
        (and (< k@28@01 (Seq_length cr@11@01)) (not (= j@27@01 k@28@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@27@01)
    (and
      (< j@27@01 (Seq_length cr@11@01))
      (and
        (<= 0 k@28@01)
        (and (< k@28@01 (Seq_length cr@11@01)) (not (= j@27@01 k@28@01))))))
  (and
    (<= 0 j@27@01)
    (< j@27@01 (Seq_length cr@11@01))
    (<= 0 k@28@01)
    (< k@28@01 (Seq_length cr@11@01))
    (not (= j@27@01 k@28@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@27@01)
      (and
        (< j@27@01 (Seq_length cr@11@01))
        (and
          (<= 0 k@28@01)
          (and (< k@28@01 (Seq_length cr@11@01)) (not (= j@27@01 k@28@01)))))))
  (and
    (<= 0 j@27@01)
    (and
      (< j@27@01 (Seq_length cr@11@01))
      (and
        (<= 0 k@28@01)
        (and (< k@28@01 (Seq_length cr@11@01)) (not (= j@27@01 k@28@01))))))))
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
          (< j@27@01 (Seq_length cr@11@01))
          (and
            (< j@27@01 (Seq_length cr@11@01))
            (=>
              (<= 0 k@28@01)
              (and
                (<= 0 k@28@01)
                (or
                  (< k@28@01 (Seq_length cr@11@01))
                  (not (< k@28@01 (Seq_length cr@11@01))))))
            (or (<= 0 k@28@01) (not (<= 0 k@28@01)))))
        (or
          (< j@27@01 (Seq_length cr@11@01))
          (not (< j@27@01 (Seq_length cr@11@01))))))
    (or (<= 0 j@27@01) (not (<= 0 j@27@01)))
    (=>
      (and
        (<= 0 j@27@01)
        (and
          (< j@27@01 (Seq_length cr@11@01))
          (and
            (<= 0 k@28@01)
            (and (< k@28@01 (Seq_length cr@11@01)) (not (= j@27@01 k@28@01))))))
      (and
        (<= 0 j@27@01)
        (< j@27@01 (Seq_length cr@11@01))
        (<= 0 k@28@01)
        (< k@28@01 (Seq_length cr@11@01))
        (not (= j@27@01 k@28@01))))
    (or
      (not
        (and
          (<= 0 j@27@01)
          (and
            (< j@27@01 (Seq_length cr@11@01))
            (and
              (<= 0 k@28@01)
              (and (< k@28@01 (Seq_length cr@11@01)) (not (= j@27@01 k@28@01)))))))
      (and
        (<= 0 j@27@01)
        (and
          (< j@27@01 (Seq_length cr@11@01))
          (and
            (<= 0 k@28@01)
            (and (< k@28@01 (Seq_length cr@11@01)) (not (= j@27@01 k@28@01))))))))
  :pattern ((Seq_index cr@11@01 j@27@01) (Seq_index cr@11@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106-aux|)))
(assert (forall ((j@27@01 Int) (k@28@01 Int)) (!
  (=>
    (and
      (<= 0 j@27@01)
      (and
        (< j@27@01 (Seq_length cr@11@01))
        (and
          (<= 0 k@28@01)
          (and (< k@28@01 (Seq_length cr@11@01)) (not (= j@27@01 k@28@01))))))
    (not (= (Seq_index cr@11@01 j@27@01) (Seq_index cr@11@01 k@28@01))))
  :pattern ((Seq_index cr@11@01 j@27@01) (Seq_index cr@11@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106|)))
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
(assert (and (<= 0 i@29@01) (< i@29@01 len@8@01)))
; [eval] cr[i]
(push) ; 4
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@29@01 (Seq_length cr@11@01))))
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
  :pattern ((Seq_index cr@11@01 i@29@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@29@01) (< i1@29@01 len@8@01))
      (and (<= 0 i2@29@01) (< i2@29@01 len@8@01))
      (= (Seq_index cr@11@01 i1@29@01) (Seq_index cr@11@01 i2@29@01)))
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
      (= (inv@30@01 (Seq_index cr@11@01 i@29@01)) i@29@01)
      (img@31@01 (Seq_index cr@11@01 i@29@01))))
  :pattern ((Seq_index cr@11@01 i@29@01))
  :qid |quant-u-58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
    (= (Seq_index cr@11@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 0 i@29@01) (< i@29@01 len@8@01))
    (not (= (Seq_index cr@11@01 i@29@01) $Ref.null)))
  :pattern ((Seq_index cr@11@01 i@29@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@11@01 i@29@01) (Seq_index br@10@01 i@24@01))
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
    (= (Seq_index cr@11@01 i@29@01) (Seq_index ar@9@01 i@19@01))
    (=
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
      (and
        (img@21@01 r)
        (and
          (<= 1 (inv@20@01 r))
          (< (inv@20@01 r) (+ (- (Seq_length ar@9@01) 1) 1))))))
  
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
    (= (Seq_index cr@11@01 i@29@01) (Seq_index ar@9@01 i@15@01))
    (=
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) len@8@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
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
; [eval] 0 < len ==> |ar| == len
; [eval] 0 < len
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | 0 < len@8@01 | live]
; [else-branch: 25 | !(0 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | 0 < len@8@01]
; [eval] |ar| == len
; [eval] |ar|
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
(assert (and (<= 0 i@33@01) (< i@33@01 len@8@01)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@33@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@33@01 (Seq_length ar@9@01))))
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
    (and (<= 0 i@33@01) (< i@33@01 len@8@01))
    (or (<= 0 i@33@01) (not (<= 0 i@33@01))))
  :pattern ((Seq_index ar@9@01 i@33@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@33@01 Int) (i2@33@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@33@01) (< i1@33@01 len@8@01))
      (and (<= 0 i2@33@01) (< i2@33@01 len@8@01))
      (= (Seq_index ar@9@01 i1@33@01) (Seq_index ar@9@01 i2@33@01)))
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
    (and (<= 0 i@33@01) (< i@33@01 len@8@01))
    (and
      (= (inv@34@01 (Seq_index ar@9@01 i@33@01)) i@33@01)
      (img@35@01 (Seq_index ar@9@01 i@33@01))))
  :pattern ((Seq_index ar@9@01 i@33@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) len@8@01)))
    (= (Seq_index ar@9@01 (inv@34@01 r)) r))
  :pattern ((inv@34@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 len@8@01))
    (not (= (Seq_index ar@9@01 i@33@01) $Ref.null)))
  :pattern ((Seq_index ar@9@01 i@33@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@32@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@32@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@32@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@32@01))) $Snap.unit))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | 0 < len@8@01 | live]
; [else-branch: 27 | !(0 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 27 | 0 < len@8@01]
; [eval] |br| == len
; [eval] |br|
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
(assert (and (<= 0 i@36@01) (< i@36@01 len@8@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@36@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@36@01 (Seq_length br@10@01))))
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
    (and (<= 0 i@36@01) (< i@36@01 len@8@01))
    (or (<= 0 i@36@01) (not (<= 0 i@36@01))))
  :pattern ((Seq_index br@10@01 i@36@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@36@01 Int) (i2@36@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@36@01) (< i1@36@01 len@8@01))
      (and (<= 0 i2@36@01) (< i2@36@01 len@8@01))
      (= (Seq_index br@10@01 i1@36@01) (Seq_index br@10@01 i2@36@01)))
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
    (and (<= 0 i@36@01) (< i@36@01 len@8@01))
    (and
      (= (inv@37@01 (Seq_index br@10@01 i@36@01)) i@36@01)
      (img@38@01 (Seq_index br@10@01 i@36@01))))
  :pattern ((Seq_index br@10@01 i@36@01))
  :qid |quant-u-65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) len@8@01)))
    (= (Seq_index br@10@01 (inv@37@01 r)) r))
  :pattern ((inv@37@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 0 i@36@01) (< i@36@01 len@8@01))
    (not (= (Seq_index br@10@01 i@36@01) $Ref.null)))
  :pattern ((Seq_index br@10@01 i@36@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@10@01 i@36@01) (Seq_index ar@9@01 i@33@01))
    (=
      (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) len@8@01)))
      (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) len@8@01)))))
  
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
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@8@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | 0 < len@8@01 | live]
; [else-branch: 29 | !(0 < len@8@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 29 | 0 < len@8@01]
; [eval] |cr| == len
; [eval] |cr|
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
(assert (and (<= 0 i@39@01) (< i@39@01 len@8@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@39@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@39@01 (Seq_length cr@11@01))))
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
    (and (<= 0 i@39@01) (< i@39@01 len@8@01))
    (or (<= 0 i@39@01) (not (<= 0 i@39@01))))
  :pattern ((Seq_index cr@11@01 i@39@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@39@01 Int) (i2@39@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@39@01) (< i1@39@01 len@8@01))
      (and (<= 0 i2@39@01) (< i2@39@01 len@8@01))
      (= (Seq_index cr@11@01 i1@39@01) (Seq_index cr@11@01 i2@39@01)))
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
    (and (<= 0 i@39@01) (< i@39@01 len@8@01))
    (and
      (= (inv@40@01 (Seq_index cr@11@01 i@39@01)) i@39@01)
      (img@41@01 (Seq_index cr@11@01 i@39@01))))
  :pattern ((Seq_index cr@11@01 i@39@01))
  :qid |quant-u-68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) len@8@01)))
    (= (Seq_index cr@11@01 (inv@40@01 r)) r))
  :pattern ((inv@40@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@39@01 Int)) (!
  (=>
    (and (<= 0 i@39@01) (< i@39@01 len@8@01))
    (not (= (Seq_index cr@11@01 i@39@01) $Ref.null)))
  :pattern ((Seq_index cr@11@01 i@39@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@11@01 i@39@01) (Seq_index br@10@01 i@36@01))
    (=
      (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) len@8@01)))
      (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) len@8@01)))))
  
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
    (= (Seq_index cr@11@01 i@39@01) (Seq_index ar@9@01 i@33@01))
    (=
      (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) len@8@01)))
      (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) len@8@01)))))
  
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
; [else-branch: 8 | !(0 < len@8@01)]
(assert (not (< 0 len@8@01)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(declare-const i@42@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (|ar| - 1 < len ? |ar| - 1 : len) + 1
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
; [eval] i < (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] (|ar| - 1 < len ? |ar| - 1 : len)
; [eval] |ar| - 1 < len
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length ar@9@01) 1) len@8@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- (Seq_length ar@9@01) 1) len@8@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | |ar@9@01| - 1 < len@8@01 | live]
; [else-branch: 32 | !(|ar@9@01| - 1 < len@8@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 32 | |ar@9@01| - 1 < len@8@01]
(assert (< (- (Seq_length ar@9@01) 1) len@8@01))
; [eval] |ar| - 1
; [eval] |ar|
(pop) ; 7
(push) ; 7
; [else-branch: 32 | !(|ar@9@01| - 1 < len@8@01)]
(assert (not (< (- (Seq_length ar@9@01) 1) len@8@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< (- (Seq_length ar@9@01) 1) len@8@01))
  (< (- (Seq_length ar@9@01) 1) len@8@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@42@01)
  (and
    (<= 1 i@42@01)
    (or
      (not (< (- (Seq_length ar@9@01) 1) len@8@01))
      (< (- (Seq_length ar@9@01) 1) len@8@01)))))
(assert (or (<= 1 i@42@01) (not (<= 1 i@42@01))))
(assert (and
  (<= 1 i@42@01)
  (<
    i@42@01
    (+
      (ite
        (< (- (Seq_length ar@9@01) 1) len@8@01)
        (- (Seq_length ar@9@01) 1)
        len@8@01)
      1))))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@42@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@42@01 (Seq_length ar@9@01))))
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
            (< (- (Seq_length ar@9@01) 1) len@8@01)
            (- (Seq_length ar@9@01) 1)
            len@8@01)
          1)))
    (and
      (=>
        (<= 1 i@42@01)
        (and
          (<= 1 i@42@01)
          (or
            (not (< (- (Seq_length ar@9@01) 1) len@8@01))
            (< (- (Seq_length ar@9@01) 1) len@8@01))))
      (or (<= 1 i@42@01) (not (<= 1 i@42@01)))))
  :pattern ((Seq_index ar@9@01 i@42@01))
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
              (< (- (Seq_length ar@9@01) 1) len@8@01)
              (- (Seq_length ar@9@01) 1)
              len@8@01)
            1)))
      (and
        (<= 1 i2@42@01)
        (<
          i2@42@01
          (+
            (ite
              (< (- (Seq_length ar@9@01) 1) len@8@01)
              (- (Seq_length ar@9@01) 1)
              len@8@01)
            1)))
      (= (Seq_index ar@9@01 i1@42@01) (Seq_index ar@9@01 i2@42@01)))
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
            (< (- (Seq_length ar@9@01) 1) len@8@01)
            (- (Seq_length ar@9@01) 1)
            len@8@01)
          1)))
    (and
      (= (inv@43@01 (Seq_index ar@9@01 i@42@01)) i@42@01)
      (img@44@01 (Seq_index ar@9@01 i@42@01))))
  :pattern ((Seq_index ar@9@01 i@42@01))
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
              (< (- (Seq_length ar@9@01) 1) len@8@01)
              (- (Seq_length ar@9@01) 1)
              len@8@01)
            1))))
    (= (Seq_index ar@9@01 (inv@43@01 r)) r))
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
            (< (- (Seq_length ar@9@01) 1) len@8@01)
            (- (Seq_length ar@9@01) 1)
            len@8@01)
          1)))
    (not (= (Seq_index ar@9@01 i@42@01) $Ref.null)))
  :pattern ((Seq_index ar@9@01 i@42@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ar@9@01 i@42@01) (Seq_index ar@9@01 i@15@01))
    (=
      (and
        (img@44@01 r)
        (and
          (<= 1 (inv@43@01 r))
          (<
            (inv@43@01 r)
            (+
              (ite
                (< (- (Seq_length ar@9@01) 1) len@8@01)
                (- (Seq_length ar@9@01) 1)
                len@8@01)
              1))))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  $Snap.unit))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
; [then-branch: 33 | 0 < len@8@01 | dead]
; [else-branch: 33 | !(0 < len@8@01) | live]
(push) ; 4
; [else-branch: 33 | !(0 < len@8@01)]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { br[j], br[k] } 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k])
(declare-const j@45@01 Int)
(declare-const k@46@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k]
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 34 | !(0 <= j@45@01) | live]
; [else-branch: 34 | 0 <= j@45@01 | live]
(push) ; 5
; [then-branch: 34 | !(0 <= j@45@01)]
(assert (not (<= 0 j@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 34 | 0 <= j@45@01]
(assert (<= 0 j@45@01))
; [eval] j < |br|
; [eval] |br|
(push) ; 6
; [then-branch: 35 | !(j@45@01 < |br@10@01|) | live]
; [else-branch: 35 | j@45@01 < |br@10@01| | live]
(push) ; 7
; [then-branch: 35 | !(j@45@01 < |br@10@01|)]
(assert (not (< j@45@01 (Seq_length br@10@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 35 | j@45@01 < |br@10@01|]
(assert (< j@45@01 (Seq_length br@10@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 36 | !(0 <= k@46@01) | live]
; [else-branch: 36 | 0 <= k@46@01 | live]
(push) ; 9
; [then-branch: 36 | !(0 <= k@46@01)]
(assert (not (<= 0 k@46@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 36 | 0 <= k@46@01]
(assert (<= 0 k@46@01))
; [eval] k < |br|
; [eval] |br|
(push) ; 10
; [then-branch: 37 | !(k@46@01 < |br@10@01|) | live]
; [else-branch: 37 | k@46@01 < |br@10@01| | live]
(push) ; 11
; [then-branch: 37 | !(k@46@01 < |br@10@01|)]
(assert (not (< k@46@01 (Seq_length br@10@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 37 | k@46@01 < |br@10@01|]
(assert (< k@46@01 (Seq_length br@10@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@46@01 (Seq_length br@10@01)) (not (< k@46@01 (Seq_length br@10@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@46@01)
  (and
    (<= 0 k@46@01)
    (or
      (< k@46@01 (Seq_length br@10@01))
      (not (< k@46@01 (Seq_length br@10@01)))))))
(assert (or (<= 0 k@46@01) (not (<= 0 k@46@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@45@01 (Seq_length br@10@01))
  (and
    (< j@45@01 (Seq_length br@10@01))
    (=>
      (<= 0 k@46@01)
      (and
        (<= 0 k@46@01)
        (or
          (< k@46@01 (Seq_length br@10@01))
          (not (< k@46@01 (Seq_length br@10@01))))))
    (or (<= 0 k@46@01) (not (<= 0 k@46@01))))))
(assert (or (< j@45@01 (Seq_length br@10@01)) (not (< j@45@01 (Seq_length br@10@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@45@01)
  (and
    (<= 0 j@45@01)
    (=>
      (< j@45@01 (Seq_length br@10@01))
      (and
        (< j@45@01 (Seq_length br@10@01))
        (=>
          (<= 0 k@46@01)
          (and
            (<= 0 k@46@01)
            (or
              (< k@46@01 (Seq_length br@10@01))
              (not (< k@46@01 (Seq_length br@10@01))))))
        (or (<= 0 k@46@01) (not (<= 0 k@46@01)))))
    (or
      (< j@45@01 (Seq_length br@10@01))
      (not (< j@45@01 (Seq_length br@10@01)))))))
(assert (or (<= 0 j@45@01) (not (<= 0 j@45@01))))
(push) ; 4
; [then-branch: 38 | 0 <= j@45@01 && j@45@01 < |br@10@01| && 0 <= k@46@01 && k@46@01 < |br@10@01| && j@45@01 != k@46@01 | live]
; [else-branch: 38 | !(0 <= j@45@01 && j@45@01 < |br@10@01| && 0 <= k@46@01 && k@46@01 < |br@10@01| && j@45@01 != k@46@01) | live]
(push) ; 5
; [then-branch: 38 | 0 <= j@45@01 && j@45@01 < |br@10@01| && 0 <= k@46@01 && k@46@01 < |br@10@01| && j@45@01 != k@46@01]
(assert (and
  (<= 0 j@45@01)
  (and
    (< j@45@01 (Seq_length br@10@01))
    (and
      (<= 0 k@46@01)
      (and (< k@46@01 (Seq_length br@10@01)) (not (= j@45@01 k@46@01)))))))
; [eval] br[j] != br[k]
; [eval] br[j]
(push) ; 6
(assert (not (>= j@45@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] br[k]
(push) ; 6
(assert (not (>= k@46@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 38 | !(0 <= j@45@01 && j@45@01 < |br@10@01| && 0 <= k@46@01 && k@46@01 < |br@10@01| && j@45@01 != k@46@01)]
(assert (not
  (and
    (<= 0 j@45@01)
    (and
      (< j@45@01 (Seq_length br@10@01))
      (and
        (<= 0 k@46@01)
        (and (< k@46@01 (Seq_length br@10@01)) (not (= j@45@01 k@46@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@45@01)
    (and
      (< j@45@01 (Seq_length br@10@01))
      (and
        (<= 0 k@46@01)
        (and (< k@46@01 (Seq_length br@10@01)) (not (= j@45@01 k@46@01))))))
  (and
    (<= 0 j@45@01)
    (< j@45@01 (Seq_length br@10@01))
    (<= 0 k@46@01)
    (< k@46@01 (Seq_length br@10@01))
    (not (= j@45@01 k@46@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@45@01)
      (and
        (< j@45@01 (Seq_length br@10@01))
        (and
          (<= 0 k@46@01)
          (and (< k@46@01 (Seq_length br@10@01)) (not (= j@45@01 k@46@01)))))))
  (and
    (<= 0 j@45@01)
    (and
      (< j@45@01 (Seq_length br@10@01))
      (and
        (<= 0 k@46@01)
        (and (< k@46@01 (Seq_length br@10@01)) (not (= j@45@01 k@46@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@45@01 Int) (k@46@01 Int)) (!
  (and
    (=>
      (<= 0 j@45@01)
      (and
        (<= 0 j@45@01)
        (=>
          (< j@45@01 (Seq_length br@10@01))
          (and
            (< j@45@01 (Seq_length br@10@01))
            (=>
              (<= 0 k@46@01)
              (and
                (<= 0 k@46@01)
                (or
                  (< k@46@01 (Seq_length br@10@01))
                  (not (< k@46@01 (Seq_length br@10@01))))))
            (or (<= 0 k@46@01) (not (<= 0 k@46@01)))))
        (or
          (< j@45@01 (Seq_length br@10@01))
          (not (< j@45@01 (Seq_length br@10@01))))))
    (or (<= 0 j@45@01) (not (<= 0 j@45@01)))
    (=>
      (and
        (<= 0 j@45@01)
        (and
          (< j@45@01 (Seq_length br@10@01))
          (and
            (<= 0 k@46@01)
            (and (< k@46@01 (Seq_length br@10@01)) (not (= j@45@01 k@46@01))))))
      (and
        (<= 0 j@45@01)
        (< j@45@01 (Seq_length br@10@01))
        (<= 0 k@46@01)
        (< k@46@01 (Seq_length br@10@01))
        (not (= j@45@01 k@46@01))))
    (or
      (not
        (and
          (<= 0 j@45@01)
          (and
            (< j@45@01 (Seq_length br@10@01))
            (and
              (<= 0 k@46@01)
              (and (< k@46@01 (Seq_length br@10@01)) (not (= j@45@01 k@46@01)))))))
      (and
        (<= 0 j@45@01)
        (and
          (< j@45@01 (Seq_length br@10@01))
          (and
            (<= 0 k@46@01)
            (and (< k@46@01 (Seq_length br@10@01)) (not (= j@45@01 k@46@01))))))))
  :pattern ((Seq_index br@10@01 j@45@01) (Seq_index br@10@01 k@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106-aux|)))
(assert (forall ((j@45@01 Int) (k@46@01 Int)) (!
  (=>
    (and
      (<= 0 j@45@01)
      (and
        (< j@45@01 (Seq_length br@10@01))
        (and
          (<= 0 k@46@01)
          (and (< k@46@01 (Seq_length br@10@01)) (not (= j@45@01 k@46@01))))))
    (not (= (Seq_index br@10@01 j@45@01) (Seq_index br@10@01 k@46@01))))
  :pattern ((Seq_index br@10@01 j@45@01) (Seq_index br@10@01 k@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
(declare-const i@47@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 39 | !(0 <= i@47@01) | live]
; [else-branch: 39 | 0 <= i@47@01 | live]
(push) ; 5
; [then-branch: 39 | !(0 <= i@47@01)]
(assert (not (<= 0 i@47@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | 0 <= i@47@01]
(assert (<= 0 i@47@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@47@01) (not (<= 0 i@47@01))))
(assert (and (<= 0 i@47@01) (< i@47@01 len@8@01)))
; [eval] br[i]
(push) ; 4
(assert (not (>= i@47@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@47@01 (Seq_length br@10@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@48@01 ($Ref) Int)
(declare-fun img@49@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@47@01 Int)) (!
  (=>
    (and (<= 0 i@47@01) (< i@47@01 len@8@01))
    (or (<= 0 i@47@01) (not (<= 0 i@47@01))))
  :pattern ((Seq_index br@10@01 i@47@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@47@01 Int) (i2@47@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@47@01) (< i1@47@01 len@8@01))
      (and (<= 0 i2@47@01) (< i2@47@01 len@8@01))
      (= (Seq_index br@10@01 i1@47@01) (Seq_index br@10@01 i2@47@01)))
    (= i1@47@01 i2@47@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@47@01 Int)) (!
  (=>
    (and (<= 0 i@47@01) (< i@47@01 len@8@01))
    (and
      (= (inv@48@01 (Seq_index br@10@01 i@47@01)) i@47@01)
      (img@49@01 (Seq_index br@10@01 i@47@01))))
  :pattern ((Seq_index br@10@01 i@47@01))
  :qid |quant-u-75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@49@01 r) (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) len@8@01)))
    (= (Seq_index br@10@01 (inv@48@01 r)) r))
  :pattern ((inv@48@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@47@01 Int)) (!
  (=>
    (and (<= 0 i@47@01) (< i@47@01 len@8@01))
    (not (= (Seq_index br@10@01 i@47@01) $Ref.null)))
  :pattern ((Seq_index br@10@01 i@47@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@10@01 i@47@01) (Seq_index ar@9@01 i@42@01))
    (=
      (and (img@49@01 r) (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) len@8@01)))
      (and
        (img@44@01 r)
        (and
          (<= 1 (inv@43@01 r))
          (<
            (inv@43@01 r)
            (+
              (ite
                (< (- (Seq_length ar@9@01) 1) len@8@01)
                (- (Seq_length ar@9@01) 1)
                len@8@01)
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
    (= (Seq_index br@10@01 i@47@01) (Seq_index ar@9@01 i@15@01))
    (=
      (and (img@49@01 r) (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) len@8@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
  :qid |quant-u-77|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
  $Snap.unit))
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 3
; [then-branch: 40 | 0 < len@8@01 | dead]
; [else-branch: 40 | !(0 < len@8@01) | live]
(push) ; 4
; [else-branch: 40 | !(0 < len@8@01)]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { cr[j], cr[k] } 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k])
(declare-const j@50@01 Int)
(declare-const k@51@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k]
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 41 | !(0 <= j@50@01) | live]
; [else-branch: 41 | 0 <= j@50@01 | live]
(push) ; 5
; [then-branch: 41 | !(0 <= j@50@01)]
(assert (not (<= 0 j@50@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 41 | 0 <= j@50@01]
(assert (<= 0 j@50@01))
; [eval] j < |cr|
; [eval] |cr|
(push) ; 6
; [then-branch: 42 | !(j@50@01 < |cr@11@01|) | live]
; [else-branch: 42 | j@50@01 < |cr@11@01| | live]
(push) ; 7
; [then-branch: 42 | !(j@50@01 < |cr@11@01|)]
(assert (not (< j@50@01 (Seq_length cr@11@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 42 | j@50@01 < |cr@11@01|]
(assert (< j@50@01 (Seq_length cr@11@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 43 | !(0 <= k@51@01) | live]
; [else-branch: 43 | 0 <= k@51@01 | live]
(push) ; 9
; [then-branch: 43 | !(0 <= k@51@01)]
(assert (not (<= 0 k@51@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 43 | 0 <= k@51@01]
(assert (<= 0 k@51@01))
; [eval] k < |cr|
; [eval] |cr|
(push) ; 10
; [then-branch: 44 | !(k@51@01 < |cr@11@01|) | live]
; [else-branch: 44 | k@51@01 < |cr@11@01| | live]
(push) ; 11
; [then-branch: 44 | !(k@51@01 < |cr@11@01|)]
(assert (not (< k@51@01 (Seq_length cr@11@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 44 | k@51@01 < |cr@11@01|]
(assert (< k@51@01 (Seq_length cr@11@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@51@01 (Seq_length cr@11@01)) (not (< k@51@01 (Seq_length cr@11@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@51@01)
  (and
    (<= 0 k@51@01)
    (or
      (< k@51@01 (Seq_length cr@11@01))
      (not (< k@51@01 (Seq_length cr@11@01)))))))
(assert (or (<= 0 k@51@01) (not (<= 0 k@51@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@50@01 (Seq_length cr@11@01))
  (and
    (< j@50@01 (Seq_length cr@11@01))
    (=>
      (<= 0 k@51@01)
      (and
        (<= 0 k@51@01)
        (or
          (< k@51@01 (Seq_length cr@11@01))
          (not (< k@51@01 (Seq_length cr@11@01))))))
    (or (<= 0 k@51@01) (not (<= 0 k@51@01))))))
(assert (or (< j@50@01 (Seq_length cr@11@01)) (not (< j@50@01 (Seq_length cr@11@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@50@01)
  (and
    (<= 0 j@50@01)
    (=>
      (< j@50@01 (Seq_length cr@11@01))
      (and
        (< j@50@01 (Seq_length cr@11@01))
        (=>
          (<= 0 k@51@01)
          (and
            (<= 0 k@51@01)
            (or
              (< k@51@01 (Seq_length cr@11@01))
              (not (< k@51@01 (Seq_length cr@11@01))))))
        (or (<= 0 k@51@01) (not (<= 0 k@51@01)))))
    (or
      (< j@50@01 (Seq_length cr@11@01))
      (not (< j@50@01 (Seq_length cr@11@01)))))))
(assert (or (<= 0 j@50@01) (not (<= 0 j@50@01))))
(push) ; 4
; [then-branch: 45 | 0 <= j@50@01 && j@50@01 < |cr@11@01| && 0 <= k@51@01 && k@51@01 < |cr@11@01| && j@50@01 != k@51@01 | live]
; [else-branch: 45 | !(0 <= j@50@01 && j@50@01 < |cr@11@01| && 0 <= k@51@01 && k@51@01 < |cr@11@01| && j@50@01 != k@51@01) | live]
(push) ; 5
; [then-branch: 45 | 0 <= j@50@01 && j@50@01 < |cr@11@01| && 0 <= k@51@01 && k@51@01 < |cr@11@01| && j@50@01 != k@51@01]
(assert (and
  (<= 0 j@50@01)
  (and
    (< j@50@01 (Seq_length cr@11@01))
    (and
      (<= 0 k@51@01)
      (and (< k@51@01 (Seq_length cr@11@01)) (not (= j@50@01 k@51@01)))))))
; [eval] cr[j] != cr[k]
; [eval] cr[j]
(push) ; 6
(assert (not (>= j@50@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] cr[k]
(push) ; 6
(assert (not (>= k@51@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 45 | !(0 <= j@50@01 && j@50@01 < |cr@11@01| && 0 <= k@51@01 && k@51@01 < |cr@11@01| && j@50@01 != k@51@01)]
(assert (not
  (and
    (<= 0 j@50@01)
    (and
      (< j@50@01 (Seq_length cr@11@01))
      (and
        (<= 0 k@51@01)
        (and (< k@51@01 (Seq_length cr@11@01)) (not (= j@50@01 k@51@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@50@01)
    (and
      (< j@50@01 (Seq_length cr@11@01))
      (and
        (<= 0 k@51@01)
        (and (< k@51@01 (Seq_length cr@11@01)) (not (= j@50@01 k@51@01))))))
  (and
    (<= 0 j@50@01)
    (< j@50@01 (Seq_length cr@11@01))
    (<= 0 k@51@01)
    (< k@51@01 (Seq_length cr@11@01))
    (not (= j@50@01 k@51@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@50@01)
      (and
        (< j@50@01 (Seq_length cr@11@01))
        (and
          (<= 0 k@51@01)
          (and (< k@51@01 (Seq_length cr@11@01)) (not (= j@50@01 k@51@01)))))))
  (and
    (<= 0 j@50@01)
    (and
      (< j@50@01 (Seq_length cr@11@01))
      (and
        (<= 0 k@51@01)
        (and (< k@51@01 (Seq_length cr@11@01)) (not (= j@50@01 k@51@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@50@01 Int) (k@51@01 Int)) (!
  (and
    (=>
      (<= 0 j@50@01)
      (and
        (<= 0 j@50@01)
        (=>
          (< j@50@01 (Seq_length cr@11@01))
          (and
            (< j@50@01 (Seq_length cr@11@01))
            (=>
              (<= 0 k@51@01)
              (and
                (<= 0 k@51@01)
                (or
                  (< k@51@01 (Seq_length cr@11@01))
                  (not (< k@51@01 (Seq_length cr@11@01))))))
            (or (<= 0 k@51@01) (not (<= 0 k@51@01)))))
        (or
          (< j@50@01 (Seq_length cr@11@01))
          (not (< j@50@01 (Seq_length cr@11@01))))))
    (or (<= 0 j@50@01) (not (<= 0 j@50@01)))
    (=>
      (and
        (<= 0 j@50@01)
        (and
          (< j@50@01 (Seq_length cr@11@01))
          (and
            (<= 0 k@51@01)
            (and (< k@51@01 (Seq_length cr@11@01)) (not (= j@50@01 k@51@01))))))
      (and
        (<= 0 j@50@01)
        (< j@50@01 (Seq_length cr@11@01))
        (<= 0 k@51@01)
        (< k@51@01 (Seq_length cr@11@01))
        (not (= j@50@01 k@51@01))))
    (or
      (not
        (and
          (<= 0 j@50@01)
          (and
            (< j@50@01 (Seq_length cr@11@01))
            (and
              (<= 0 k@51@01)
              (and (< k@51@01 (Seq_length cr@11@01)) (not (= j@50@01 k@51@01)))))))
      (and
        (<= 0 j@50@01)
        (and
          (< j@50@01 (Seq_length cr@11@01))
          (and
            (<= 0 k@51@01)
            (and (< k@51@01 (Seq_length cr@11@01)) (not (= j@50@01 k@51@01))))))))
  :pattern ((Seq_index cr@11@01 j@50@01) (Seq_index cr@11@01 k@51@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106-aux|)))
(assert (forall ((j@50@01 Int) (k@51@01 Int)) (!
  (=>
    (and
      (<= 0 j@50@01)
      (and
        (< j@50@01 (Seq_length cr@11@01))
        (and
          (<= 0 k@51@01)
          (and (< k@51@01 (Seq_length cr@11@01)) (not (= j@50@01 k@51@01))))))
    (not (= (Seq_index cr@11@01 j@50@01) (Seq_index cr@11@01 k@51@01))))
  :pattern ((Seq_index cr@11@01 j@50@01) (Seq_index cr@11@01 k@51@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106|)))
(declare-const i@52@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 46 | !(0 <= i@52@01) | live]
; [else-branch: 46 | 0 <= i@52@01 | live]
(push) ; 5
; [then-branch: 46 | !(0 <= i@52@01)]
(assert (not (<= 0 i@52@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 46 | 0 <= i@52@01]
(assert (<= 0 i@52@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
(assert (and (<= 0 i@52@01) (< i@52@01 len@8@01)))
; [eval] cr[i]
(push) ; 4
(assert (not (>= i@52@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@52@01 (Seq_length cr@11@01))))
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
    (and (<= 0 i@52@01) (< i@52@01 len@8@01))
    (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
  :pattern ((Seq_index cr@11@01 i@52@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@52@01 Int) (i2@52@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@52@01) (< i1@52@01 len@8@01))
      (and (<= 0 i2@52@01) (< i2@52@01 len@8@01))
      (= (Seq_index cr@11@01 i1@52@01) (Seq_index cr@11@01 i2@52@01)))
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
    (and (<= 0 i@52@01) (< i@52@01 len@8@01))
    (and
      (= (inv@53@01 (Seq_index cr@11@01 i@52@01)) i@52@01)
      (img@54@01 (Seq_index cr@11@01 i@52@01))))
  :pattern ((Seq_index cr@11@01 i@52@01))
  :qid |quant-u-79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) len@8@01)))
    (= (Seq_index cr@11@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 len@8@01))
    (not (= (Seq_index cr@11@01 i@52@01) $Ref.null)))
  :pattern ((Seq_index cr@11@01 i@52@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@11@01 i@52@01) (Seq_index br@10@01 i@47@01))
    (=
      (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) len@8@01)))
      (and (img@49@01 r) (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) len@8@01)))))
  
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
    (= (Seq_index cr@11@01 i@52@01) (Seq_index ar@9@01 i@42@01))
    (=
      (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) len@8@01)))
      (and
        (img@44@01 r)
        (and
          (<= 1 (inv@43@01 r))
          (<
            (inv@43@01 r)
            (+
              (ite
                (< (- (Seq_length ar@9@01) 1) len@8@01)
                (- (Seq_length ar@9@01) 1)
                len@8@01)
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
    (= (Seq_index cr@11@01 i@52@01) (Seq_index ar@9@01 i@15@01))
    (=
      (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) len@8@01)))
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) len@8@01)))))
  
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
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(assert (= ($Snap.first $t@55@01) $Snap.unit))
; [eval] 0 < len ==> |ar| == len
; [eval] 0 < len
(push) ; 4
; [then-branch: 47 | 0 < len@8@01 | dead]
; [else-branch: 47 | !(0 < len@8@01) | live]
(push) ; 5
; [else-branch: 47 | !(0 < len@8@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second $t@55@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@55@01))
    ($Snap.second ($Snap.second $t@55@01)))))
(declare-const i@56@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 48 | !(0 <= i@56@01) | live]
; [else-branch: 48 | 0 <= i@56@01 | live]
(push) ; 6
; [then-branch: 48 | !(0 <= i@56@01)]
(assert (not (<= 0 i@56@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 48 | 0 <= i@56@01]
(assert (<= 0 i@56@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@56@01) (not (<= 0 i@56@01))))
(assert (and (<= 0 i@56@01) (< i@56@01 len@8@01)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@56@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@56@01 (Seq_length ar@9@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@57@01 ($Ref) Int)
(declare-fun img@58@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 len@8@01))
    (or (<= 0 i@56@01) (not (<= 0 i@56@01))))
  :pattern ((Seq_index ar@9@01 i@56@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@56@01 Int) (i2@56@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@56@01) (< i1@56@01 len@8@01))
      (and (<= 0 i2@56@01) (< i2@56@01 len@8@01))
      (= (Seq_index ar@9@01 i1@56@01) (Seq_index ar@9@01 i2@56@01)))
    (= i1@56@01 i2@56@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 len@8@01))
    (and
      (= (inv@57@01 (Seq_index ar@9@01 i@56@01)) i@56@01)
      (img@58@01 (Seq_index ar@9@01 i@56@01))))
  :pattern ((Seq_index ar@9@01 i@56@01))
  :qid |quant-u-84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))
    (= (Seq_index ar@9@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 len@8@01))
    (not (= (Seq_index ar@9@01 i@56@01) $Ref.null)))
  :pattern ((Seq_index ar@9@01 i@56@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@55@01))) $Snap.unit))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(push) ; 4
; [then-branch: 49 | 0 < len@8@01 | dead]
; [else-branch: 49 | !(0 < len@8@01) | live]
(push) ; 5
; [else-branch: 49 | !(0 < len@8@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@55@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
(declare-const i@59@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 50 | !(0 <= i@59@01) | live]
; [else-branch: 50 | 0 <= i@59@01 | live]
(push) ; 6
; [then-branch: 50 | !(0 <= i@59@01)]
(assert (not (<= 0 i@59@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 50 | 0 <= i@59@01]
(assert (<= 0 i@59@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@59@01) (not (<= 0 i@59@01))))
(assert (and (<= 0 i@59@01) (< i@59@01 len@8@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@59@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@59@01 (Seq_length br@10@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@60@01 ($Ref) Int)
(declare-fun img@61@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@59@01 Int)) (!
  (=>
    (and (<= 0 i@59@01) (< i@59@01 len@8@01))
    (or (<= 0 i@59@01) (not (<= 0 i@59@01))))
  :pattern ((Seq_index br@10@01 i@59@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@59@01 Int) (i2@59@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@59@01) (< i1@59@01 len@8@01))
      (and (<= 0 i2@59@01) (< i2@59@01 len@8@01))
      (= (Seq_index br@10@01 i1@59@01) (Seq_index br@10@01 i2@59@01)))
    (= i1@59@01 i2@59@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@59@01 Int)) (!
  (=>
    (and (<= 0 i@59@01) (< i@59@01 len@8@01))
    (and
      (= (inv@60@01 (Seq_index br@10@01 i@59@01)) i@59@01)
      (img@61@01 (Seq_index br@10@01 i@59@01))))
  :pattern ((Seq_index br@10@01 i@59@01))
  :qid |quant-u-86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@61@01 r) (and (<= 0 (inv@60@01 r)) (< (inv@60@01 r) len@8@01)))
    (= (Seq_index br@10@01 (inv@60@01 r)) r))
  :pattern ((inv@60@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@59@01 Int)) (!
  (=>
    (and (<= 0 i@59@01) (< i@59@01 len@8@01))
    (not (= (Seq_index br@10@01 i@59@01) $Ref.null)))
  :pattern ((Seq_index br@10@01 i@59@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@10@01 i@59@01) (Seq_index ar@9@01 i@56@01))
    (=
      (and (img@61@01 r) (and (<= 0 (inv@60@01 r)) (< (inv@60@01 r) len@8@01)))
      (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))))
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  $Snap.unit))
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 51 | 0 < len@8@01 | dead]
; [else-branch: 51 | !(0 < len@8@01) | live]
(push) ; 5
; [else-branch: 51 | !(0 < len@8@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(declare-const i@62@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 52 | !(0 <= i@62@01) | live]
; [else-branch: 52 | 0 <= i@62@01 | live]
(push) ; 6
; [then-branch: 52 | !(0 <= i@62@01)]
(assert (not (<= 0 i@62@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 52 | 0 <= i@62@01]
(assert (<= 0 i@62@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@62@01) (not (<= 0 i@62@01))))
(assert (and (<= 0 i@62@01) (< i@62@01 len@8@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@62@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@62@01 (Seq_length cr@11@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@63@01 ($Ref) Int)
(declare-fun img@64@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@62@01 Int)) (!
  (=>
    (and (<= 0 i@62@01) (< i@62@01 len@8@01))
    (or (<= 0 i@62@01) (not (<= 0 i@62@01))))
  :pattern ((Seq_index cr@11@01 i@62@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@62@01 Int) (i2@62@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@62@01) (< i1@62@01 len@8@01))
      (and (<= 0 i2@62@01) (< i2@62@01 len@8@01))
      (= (Seq_index cr@11@01 i1@62@01) (Seq_index cr@11@01 i2@62@01)))
    (= i1@62@01 i2@62@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@62@01 Int)) (!
  (=>
    (and (<= 0 i@62@01) (< i@62@01 len@8@01))
    (and
      (= (inv@63@01 (Seq_index cr@11@01 i@62@01)) i@62@01)
      (img@64@01 (Seq_index cr@11@01 i@62@01))))
  :pattern ((Seq_index cr@11@01 i@62@01))
  :qid |quant-u-89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@64@01 r) (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) len@8@01)))
    (= (Seq_index cr@11@01 (inv@63@01 r)) r))
  :pattern ((inv@63@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@62@01 Int)) (!
  (=>
    (and (<= 0 i@62@01) (< i@62@01 len@8@01))
    (not (= (Seq_index cr@11@01 i@62@01) $Ref.null)))
  :pattern ((Seq_index cr@11@01 i@62@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@11@01 i@62@01) (Seq_index br@10@01 i@59@01))
    (=
      (and (img@64@01 r) (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) len@8@01)))
      (and (img@61@01 r) (and (<= 0 (inv@60@01 r)) (< (inv@60@01 r) len@8@01)))))
  
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
    (= (Seq_index cr@11@01 i@62@01) (Seq_index ar@9@01 i@56@01))
    (=
      (and (img@64@01 r) (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) len@8@01)))
      (and (img@58@01 r) (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) len@8@01)))))
  
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
(declare-const diz@65@01 $Ref)
(declare-const current_thread_id@66@01 Int)
(declare-const ar@67@01 Seq<$Ref>)
(declare-const i@68@01 Int)
(declare-const diz@69@01 $Ref)
(declare-const current_thread_id@70@01 Int)
(declare-const ar@71@01 Seq<$Ref>)
(declare-const i@72@01 Int)
(push) ; 1
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 ($Snap.combine ($Snap.first $t@73@01) ($Snap.second $t@73@01))))
(assert (= ($Snap.first $t@73@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@69@01 $Ref.null)))
(assert (=
  ($Snap.second $t@73@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@73@01))
    ($Snap.second ($Snap.second $t@73@01)))))
(assert (= ($Snap.first ($Snap.second $t@73@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@70@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@73@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@73@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@73@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@73@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@72@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@73@01))) $Snap.unit))
; [eval] i < |ar|
; [eval] |ar|
(assert (< i@72@01 (Seq_length ar@71@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@72@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@74@01 Int)
(assert (not (= (Seq_index ar@71@01 i@72@01) $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__send_body_152 ----------
(declare-const diz@75@01 $Ref)
(declare-const current_thread_id@76@01 Int)
(declare-const ar@77@01 Seq<$Ref>)
(declare-const i@78@01 Int)
(declare-const diz@79@01 $Ref)
(declare-const current_thread_id@80@01 Int)
(declare-const ar@81@01 Seq<$Ref>)
(declare-const i@82@01 Int)
(push) ; 1
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 ($Snap.combine ($Snap.first $t@83@01) ($Snap.second $t@83@01))))
(assert (= ($Snap.first $t@83@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@79@01 $Ref.null)))
(assert (=
  ($Snap.second $t@83@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@83@01))
    ($Snap.second ($Snap.second $t@83@01)))))
(assert (= ($Snap.first ($Snap.second $t@83@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@80@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@83@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@83@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@83@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@83@01))) $Snap.unit))
; [eval] -1 <= i
; [eval] -1
(assert (<= (- 0 1) i@82@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@83@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@83@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@83@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@83@01))))
  $Snap.unit))
; [eval] i + 1 < |ar|
; [eval] i + 1
; [eval] |ar|
(assert (< (+ i@82@01 1) (Seq_length ar@81@01)))
; [eval] ar[i + 1]
; [eval] i + 1
(push) ; 2
(assert (not (>= (+ i@82@01 1) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@81@01 (+ i@82@01 1)) $Ref.null)))
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
(declare-const diz@84@01 $Ref)
(declare-const current_thread_id@85@01 Int)
(declare-const len@86@01 Int)
(declare-const ar@87@01 Seq<$Ref>)
(declare-const br@88@01 Seq<$Ref>)
(declare-const i@89@01 Int)
(declare-const cr@90@01 Seq<$Ref>)
(declare-const diz@91@01 $Ref)
(declare-const current_thread_id@92@01 Int)
(declare-const len@93@01 Int)
(declare-const ar@94@01 Seq<$Ref>)
(declare-const br@95@01 Seq<$Ref>)
(declare-const i@96@01 Int)
(declare-const cr@97@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@98@01 $Snap)
(assert (= $t@98@01 ($Snap.combine ($Snap.first $t@98@01) ($Snap.second $t@98@01))))
(assert (= ($Snap.first $t@98@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@91@01 $Ref.null)))
(assert (=
  ($Snap.second $t@98@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@98@01))
    ($Snap.second ($Snap.second $t@98@01)))))
(assert (= ($Snap.first ($Snap.second $t@98@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@92@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@98@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@98@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@98@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@96@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@98@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@98@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@98@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@96@01 len@93@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))
  $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (= (Seq_length ar@94@01) len@93@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
; [eval] ar[i]
(push) ; 2
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@94@01 i@96@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))
; [eval] i == 0
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= i@96@01 0))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= i@96@01 0)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | i@96@01 == 0 | live]
; [else-branch: 53 | i@96@01 != 0 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 53 | i@96@01 == 0]
(assert (= i@96@01 0))
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
; [eval] i < |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@96@01 (- (Seq_length ar@94@01) 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@96@01 (- (Seq_length ar@94@01) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | i@96@01 < |ar@94@01| - 1 | live]
; [else-branch: 54 | !(i@96@01 < |ar@94@01| - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 54 | i@96@01 < |ar@94@01| - 1]
(assert (< i@96@01 (- (Seq_length ar@94@01) 1)))
; [eval] ar[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@96@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@96@01 1) (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index ar@94@01 (+ i@96@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (= (Seq_length br@95@01) len@93@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))))
; [eval] br[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) (Seq_index br@95@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index br@95@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index br@95@01 i@96@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
(assert (= (Seq_length cr@97@01) len@93@01))
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@96@01 (Seq_length cr@97@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index cr@97@01 i@96@01) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@99@01 $Snap)
(assert (= $t@99@01 ($Snap.combine ($Snap.first $t@99@01) ($Snap.second $t@99@01))))
(assert (= ($Snap.first $t@99@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@99@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@99@01))
    ($Snap.second ($Snap.second $t@99@01)))))
(assert (= ($Snap.first ($Snap.second $t@99@01)) $Snap.unit))
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second $t@99@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@99@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@99@01))) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@99@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@99@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index br@95@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length cr@97@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
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
(declare-const __flatten_4@100@01 $Ref)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@101@01 Int)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@102@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@103@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@104@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@105@01 $Ref)
; [exec]
; __flatten_4 := ar[i]
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@106@01 $Ref)
(assert (= __flatten_4@106@01 (Seq_index ar@94@01 i@96@01)))
; [exec]
; __flatten_6 := br[i]
; [eval] br[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@107@01 $Ref)
(assert (= __flatten_6@107@01 (Seq_index br@95@01 i@96@01)))
; [exec]
; __flatten_5 := __flatten_6.Ref__Integer_value + 1
; [eval] __flatten_6.Ref__Integer_value + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_6@107@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_6@107@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@108@01 Int)
(assert (=
  __flatten_5@108@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
    1)))
; [exec]
; __flatten_4.Ref__Integer_value := __flatten_5
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_4@106@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_4@106@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) __flatten_4@106@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) __flatten_4@106@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_4@106@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_4@106@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) __flatten_4@106@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_4@106@01 $Ref.null)))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@96@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 55 | i@96@01 > 0 | dead]
; [else-branch: 55 | !(i@96@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 55 | !(i@96@01 > 0)]
(assert (not (> i@96@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@96@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@96@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 56 | !(i@96@01 > 0) | live]
; [else-branch: 56 | i@96@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 56 | !(i@96@01 > 0)]
(assert (not (> i@96@01 0)))
; [eval] i < len - 1
; [eval] len - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@96@01 (- len@93@01 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@96@01 (- len@93@01 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | i@96@01 < len@93@01 - 1 | live]
; [else-branch: 57 | !(i@96@01 < len@93@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 57 | i@96@01 < len@93@01 - 1]
(assert (< i@96@01 (- len@93@01 1)))
; [exec]
; __flatten_8 := cr[i]
; [eval] cr[i]
(push) ; 7
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@96@01 (Seq_length cr@97@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_8@109@01 $Ref)
(assert (= __flatten_8@109@01 (Seq_index cr@97@01 i@96@01)))
; [exec]
; __flatten_10 := ar[i + 1]
; [eval] ar[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@96@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@96@01 1) (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_10@110@01 $Ref)
(assert (= __flatten_10@110@01 (Seq_index ar@94@01 (+ i@96@01 1))))
; [exec]
; __flatten_9 := __flatten_10.Ref__Integer_value + 2
; [eval] __flatten_10.Ref__Integer_value + 2
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_4@106@01 __flatten_10@110@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_10@110@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_10@110@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) __flatten_10@110@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@111@01 Int)
(assert (=
  __flatten_9@111@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
    2)))
; [exec]
; __flatten_8.Ref__Integer_value := __flatten_9
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_4@106@01 __flatten_8@109@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_8@109@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_4@106@01 __flatten_8@109@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_8@109@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) __flatten_8@109@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_8@109@01 $Ref.null)))
; [exec]
; Ref__send_body_152(diz, current_thread_id, ar, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] -1 <= i
; [eval] -1
(set-option :timeout 0)
(push) ; 7
(assert (not (<= (- 0 1) i@96@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= (- 0 1) i@96@01))
; [eval] i + 1 < |ar|
; [eval] i + 1
; [eval] |ar|
(push) ; 7
(assert (not (< (+ i@96@01 1) (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< (+ i@96@01 1) (Seq_length ar@94@01)))
; [eval] ar[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@96@01 1) 0)))
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
; [eval] |ar| == len
; [eval] |ar|
; [eval] ar[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@109@01 (Seq_index ar@94@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |br| == len
; [eval] |br|
; [eval] br[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |cr| == len
; [eval] |cr|
; [eval] cr[i]
(push) ; 7
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@96@01 (Seq_length cr@97@01))))
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
(assert (not (< i@96@01 (- len@93@01 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | !(i@96@01 < len@93@01 - 1) | dead]
; [else-branch: 58 | i@96@01 < len@93@01 - 1 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 58 | i@96@01 < len@93@01 - 1]
(assert (< i@96@01 (- len@93@01 1)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 54 | !(i@96@01 < |ar@94@01| - 1)]
(assert (not (< i@96@01 (- (Seq_length ar@94@01) 1))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (= (Seq_length br@95@01) len@93@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))))
; [eval] br[i]
(push) ; 4
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index br@95@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index br@95@01 i@96@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
(assert (= (Seq_length cr@97@01) len@93@01))
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@96@01 (Seq_length cr@97@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index cr@97@01 i@96@01) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@112@01 $Snap)
(assert (= $t@112@01 ($Snap.combine ($Snap.first $t@112@01) ($Snap.second $t@112@01))))
(assert (= ($Snap.first $t@112@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@112@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@112@01))
    ($Snap.second ($Snap.second $t@112@01)))))
(assert (= ($Snap.first ($Snap.second $t@112@01)) $Snap.unit))
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second $t@112@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@112@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@112@01))) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@112@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@112@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index br@95@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length cr@97@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
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
(declare-const __flatten_4@113@01 $Ref)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@114@01 Int)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@115@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@116@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@117@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@118@01 $Ref)
; [exec]
; __flatten_4 := ar[i]
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@119@01 $Ref)
(assert (= __flatten_4@119@01 (Seq_index ar@94@01 i@96@01)))
; [exec]
; __flatten_6 := br[i]
; [eval] br[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@120@01 $Ref)
(assert (= __flatten_6@120@01 (Seq_index br@95@01 i@96@01)))
; [exec]
; __flatten_5 := __flatten_6.Ref__Integer_value + 1
; [eval] __flatten_6.Ref__Integer_value + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_6@120@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_6@120@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@121@01 Int)
(assert (=
  __flatten_5@121@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
    1)))
; [exec]
; __flatten_4.Ref__Integer_value := __flatten_5
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_4@119@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_4@119@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) __flatten_4@119@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_4@119@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_4@119@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_4@119@01 $Ref.null)))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@96@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 59 | i@96@01 > 0 | dead]
; [else-branch: 59 | !(i@96@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 59 | !(i@96@01 > 0)]
(assert (not (> i@96@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@96@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@96@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 60 | !(i@96@01 > 0) | live]
; [else-branch: 60 | i@96@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 60 | !(i@96@01 > 0)]
(assert (not (> i@96@01 0)))
; [eval] i < len - 1
; [eval] len - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@96@01 (- len@93@01 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 61 | i@96@01 < len@93@01 - 1 | dead]
; [else-branch: 61 | !(i@96@01 < len@93@01 - 1) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 61 | !(i@96@01 < len@93@01 - 1)]
(assert (not (< i@96@01 (- len@93@01 1))))
(pop) ; 6
; [eval] !(i < len - 1)
; [eval] i < len - 1
; [eval] len - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@96@01 (- len@93@01 1))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@96@01 (- len@93@01 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 62 | !(i@96@01 < len@93@01 - 1) | live]
; [else-branch: 62 | i@96@01 < len@93@01 - 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 62 | !(i@96@01 < len@93@01 - 1)]
(assert (not (< i@96@01 (- len@93@01 1))))
; [eval] 0 <= i
; [eval] i < len
; [eval] |ar| == len
; [eval] |ar|
; [eval] ar[i]
(push) ; 7
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |br| == len
; [eval] |br|
; [eval] br[i]
(push) ; 7
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |cr| == len
; [eval] |cr|
; [eval] cr[i]
(push) ; 7
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@96@01 (Seq_length cr@97@01))))
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
; [else-branch: 53 | i@96@01 != 0]
(assert (not (= i@96@01 0)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
; [eval] i < |ar| - 1
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@96@01 (- (Seq_length ar@94@01) 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@96@01 (- (Seq_length ar@94@01) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 63 | i@96@01 < |ar@94@01| - 1 | live]
; [else-branch: 63 | !(i@96@01 < |ar@94@01| - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 63 | i@96@01 < |ar@94@01| - 1]
(assert (< i@96@01 (- (Seq_length ar@94@01) 1)))
; [eval] ar[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@96@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@96@01 1) (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index ar@94@01 (+ i@96@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (= (Seq_length br@95@01) len@93@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))))
; [eval] br[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) (Seq_index br@95@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index br@95@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index br@95@01 i@96@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
(assert (= (Seq_length cr@97@01) len@93@01))
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@96@01 (Seq_length cr@97@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index cr@97@01 i@96@01) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@122@01 $Snap)
(assert (= $t@122@01 ($Snap.combine ($Snap.first $t@122@01) ($Snap.second $t@122@01))))
(assert (= ($Snap.first $t@122@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@122@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@122@01))
    ($Snap.second ($Snap.second $t@122@01)))))
(assert (= ($Snap.first ($Snap.second $t@122@01)) $Snap.unit))
; [eval] i < len
(assert (=
  ($Snap.second ($Snap.second $t@122@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@122@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@122@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@122@01))) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@122@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@122@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01)))))))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01)))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01)))))))))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index br@95@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@122@01)))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
; [eval] cr[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length cr@97@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) (Seq_index cr@97@01 i@96@01))))
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
(declare-const __flatten_4@123@01 $Ref)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@124@01 Int)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@125@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@126@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@127@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@128@01 $Ref)
; [exec]
; __flatten_4 := ar[i]
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length ar@94@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@129@01 $Ref)
(assert (= __flatten_4@129@01 (Seq_index ar@94@01 i@96@01)))
; [exec]
; __flatten_6 := br[i]
; [eval] br[i]
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@96@01 (Seq_length br@95@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@130@01 $Ref)
(assert (= __flatten_6@130@01 (Seq_index br@95@01 i@96@01)))
; [exec]
; __flatten_5 := __flatten_6.Ref__Integer_value + 1
; [eval] __flatten_6.Ref__Integer_value + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_6@130@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_6@130@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@131@01 Int)
(assert (=
  __flatten_5@131@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
    1)))
; [exec]
; __flatten_4.Ref__Integer_value := __flatten_5
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) __flatten_4@129@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) __flatten_4@129@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) __flatten_4@129@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) __flatten_4@129@01)))
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
(assert (not (= (Seq_index cr@97@01 i@96@01) (Seq_index br@95@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) (Seq_index ar@94@01 (+ i@96@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) (Seq_index ar@94@01 (+ i@96@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 (+ i@96@01 1)) (Seq_index ar@94@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index br@95@01 i@96@01) (Seq_index ar@94@01 i@96@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index cr@97@01 i@96@01) (Seq_index ar@94@01 i@96@01))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))))
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
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01))))))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@01)))))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index ar@94@01 i@96@01) (Seq_index cr@97@01 i@96@01)))
  (not (= (Seq_index ar@94@01 (+ i@96@01 1)) (Seq_index cr@97@01 i@96@01)))
  (not (= (Seq_index br@95@01 i@96@01) (Seq_index cr@97@01 i@96@01)))
  (and
    (not (= (Seq_index cr@97@01 i@96@01) (Seq_index ar@94@01 i@96@01)))
    (not (= (Seq_index cr@97@01 i@96@01) (Seq_index ar@94@01 (+ i@96@01 1))))
    (not (= (Seq_index cr@97@01 i@96@01) (Seq_index br@95@01 i@96@01))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index ar@94@01 i@96@01) __flatten_4@129@01)))
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
(declare-const diz@132@01 $Ref)
(declare-const current_thread_id@133@01 Int)
(declare-const len@134@01 Int)
(declare-const ar@135@01 Seq<$Ref>)
(declare-const br@136@01 Seq<$Ref>)
(declare-const i@137@01 Int)
(declare-const cr@138@01 Seq<$Ref>)
(declare-const diz@139@01 $Ref)
(declare-const current_thread_id@140@01 Int)
(declare-const len@141@01 Int)
(declare-const ar@142@01 Seq<$Ref>)
(declare-const br@143@01 Seq<$Ref>)
(declare-const i@144@01 Int)
(declare-const cr@145@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@146@01 $Snap)
(assert (= $t@146@01 ($Snap.combine ($Snap.first $t@146@01) ($Snap.second $t@146@01))))
(assert (= ($Snap.first $t@146@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@139@01 $Ref.null)))
(assert (=
  ($Snap.second $t@146@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@146@01))
    ($Snap.second ($Snap.second $t@146@01)))))
(assert (= ($Snap.first ($Snap.second $t@146@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@140@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@146@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@146@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@146@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@146@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@144@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@146@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@146@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@146@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@146@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@144@01 len@141@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@146@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@144@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@147@01 $Snap)
(assert (= $t@147@01 ($Snap.combine ($Snap.first $t@147@01) ($Snap.second $t@147@01))))
(assert (= ($Snap.first $t@147@01) $Snap.unit))
; [eval] 1 <= i
(assert (<= 1 i@144@01))
(assert (= ($Snap.second $t@147@01) $Snap.unit))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
(assert (< (- i@144@01 1) (- len@141@01 1)))
(pop) ; 2
(push) ; 2
; [eval] 1 <= i
(push) ; 3
(assert (not (<= 1 i@144@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 i@144@01))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
(push) ; 3
(assert (not (< (- i@144@01 1) (- len@141@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (- i@144@01 1) (- len@141@01 1)))
(pop) ; 2
(pop) ; 1
; ---------- Ref__resource_check_S2_S1 ----------
(declare-const diz@148@01 $Ref)
(declare-const current_thread_id@149@01 Int)
(declare-const len@150@01 Int)
(declare-const ar@151@01 Seq<$Ref>)
(declare-const br@152@01 Seq<$Ref>)
(declare-const i@153@01 Int)
(declare-const cr@154@01 Seq<$Ref>)
(declare-const diz@155@01 $Ref)
(declare-const current_thread_id@156@01 Int)
(declare-const len@157@01 Int)
(declare-const ar@158@01 Seq<$Ref>)
(declare-const br@159@01 Seq<$Ref>)
(declare-const i@160@01 Int)
(declare-const cr@161@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@162@01 $Snap)
(assert (= $t@162@01 ($Snap.combine ($Snap.first $t@162@01) ($Snap.second $t@162@01))))
(assert (= ($Snap.first $t@162@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@155@01 $Ref.null)))
(assert (=
  ($Snap.second $t@162@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@162@01))
    ($Snap.second ($Snap.second $t@162@01)))))
(assert (= ($Snap.first ($Snap.second $t@162@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@156@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@162@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@162@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@162@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@160@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@162@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@162@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@162@01))))
  $Snap.unit))
; [eval] i < len
(assert (< i@160@01 len@157@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))
  $Snap.unit))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
(assert (< (- i@160@01 1) (- len@157@01 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@160@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))
  $Snap.unit))
; [eval] len <= |ar|
; [eval] |ar|
(assert (<= len@157@01 (Seq_length ar@158@01)))
; [eval] ar[i - 1 + 1]
; [eval] i - 1 + 1
; [eval] i - 1
(push) ; 2
(assert (not (>= (+ (- i@160@01 1) 1) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< (+ (- i@160@01 1) 1) (Seq_length ar@158@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@158@01 (+ (- i@160@01 1) 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@163@01 $Snap)
(assert (= $t@163@01 ($Snap.combine ($Snap.first $t@163@01) ($Snap.second $t@163@01))))
(assert (= ($Snap.first $t@163@01) $Snap.unit))
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@160@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@160@01 (Seq_length ar@158@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index ar@158@01 i@160@01) $Ref.null)))
(pop) ; 2
(push) ; 2
; [eval] i - 1 < len - 1
; [eval] i - 1
; [eval] len - 1
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@160@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@160@01 (Seq_length ar@158@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index ar@158@01 (+ (- i@160@01 1) 1)) (Seq_index ar@158@01 i@160@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__zero_array ----------
(declare-const diz@164@01 $Ref)
(declare-const current_thread_id@165@01 Int)
(declare-const ar@166@01 Seq<$Ref>)
(declare-const br@167@01 Seq<$Ref>)
(declare-const cr@168@01 Seq<$Ref>)
(declare-const len@169@01 Int)
(declare-const diz@170@01 $Ref)
(declare-const current_thread_id@171@01 Int)
(declare-const ar@172@01 Seq<$Ref>)
(declare-const br@173@01 Seq<$Ref>)
(declare-const cr@174@01 Seq<$Ref>)
(declare-const len@175@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@176@01 $Snap)
(assert (= $t@176@01 ($Snap.combine ($Snap.first $t@176@01) ($Snap.second $t@176@01))))
(assert (= ($Snap.first $t@176@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@170@01 $Ref.null)))
(assert (=
  ($Snap.second $t@176@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@176@01))
    ($Snap.second ($Snap.second $t@176@01)))))
(assert (= ($Snap.first ($Snap.second $t@176@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@171@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@176@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@176@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@176@01))) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (= (Seq_length ar@172@01) len@175@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@176@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@176@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@176@01))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { ar[j], ar[k] } 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@177@01 Int)
(declare-const k@178@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 64 | !(0 <= j@177@01) | live]
; [else-branch: 64 | 0 <= j@177@01 | live]
(push) ; 4
; [then-branch: 64 | !(0 <= j@177@01)]
(assert (not (<= 0 j@177@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 64 | 0 <= j@177@01]
(assert (<= 0 j@177@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 65 | !(j@177@01 < |ar@172@01|) | live]
; [else-branch: 65 | j@177@01 < |ar@172@01| | live]
(push) ; 6
; [then-branch: 65 | !(j@177@01 < |ar@172@01|)]
(assert (not (< j@177@01 (Seq_length ar@172@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 65 | j@177@01 < |ar@172@01|]
(assert (< j@177@01 (Seq_length ar@172@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 66 | !(0 <= k@178@01) | live]
; [else-branch: 66 | 0 <= k@178@01 | live]
(push) ; 8
; [then-branch: 66 | !(0 <= k@178@01)]
(assert (not (<= 0 k@178@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 66 | 0 <= k@178@01]
(assert (<= 0 k@178@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 67 | !(k@178@01 < |ar@172@01|) | live]
; [else-branch: 67 | k@178@01 < |ar@172@01| | live]
(push) ; 10
; [then-branch: 67 | !(k@178@01 < |ar@172@01|)]
(assert (not (< k@178@01 (Seq_length ar@172@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 67 | k@178@01 < |ar@172@01|]
(assert (< k@178@01 (Seq_length ar@172@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@178@01 (Seq_length ar@172@01))
  (not (< k@178@01 (Seq_length ar@172@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@178@01)
  (and
    (<= 0 k@178@01)
    (or
      (< k@178@01 (Seq_length ar@172@01))
      (not (< k@178@01 (Seq_length ar@172@01)))))))
(assert (or (<= 0 k@178@01) (not (<= 0 k@178@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@177@01 (Seq_length ar@172@01))
  (and
    (< j@177@01 (Seq_length ar@172@01))
    (=>
      (<= 0 k@178@01)
      (and
        (<= 0 k@178@01)
        (or
          (< k@178@01 (Seq_length ar@172@01))
          (not (< k@178@01 (Seq_length ar@172@01))))))
    (or (<= 0 k@178@01) (not (<= 0 k@178@01))))))
(assert (or
  (< j@177@01 (Seq_length ar@172@01))
  (not (< j@177@01 (Seq_length ar@172@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@177@01)
  (and
    (<= 0 j@177@01)
    (=>
      (< j@177@01 (Seq_length ar@172@01))
      (and
        (< j@177@01 (Seq_length ar@172@01))
        (=>
          (<= 0 k@178@01)
          (and
            (<= 0 k@178@01)
            (or
              (< k@178@01 (Seq_length ar@172@01))
              (not (< k@178@01 (Seq_length ar@172@01))))))
        (or (<= 0 k@178@01) (not (<= 0 k@178@01)))))
    (or
      (< j@177@01 (Seq_length ar@172@01))
      (not (< j@177@01 (Seq_length ar@172@01)))))))
(assert (or (<= 0 j@177@01) (not (<= 0 j@177@01))))
(push) ; 3
; [then-branch: 68 | 0 <= j@177@01 && j@177@01 < |ar@172@01| && 0 <= k@178@01 && k@178@01 < |ar@172@01| && j@177@01 != k@178@01 | live]
; [else-branch: 68 | !(0 <= j@177@01 && j@177@01 < |ar@172@01| && 0 <= k@178@01 && k@178@01 < |ar@172@01| && j@177@01 != k@178@01) | live]
(push) ; 4
; [then-branch: 68 | 0 <= j@177@01 && j@177@01 < |ar@172@01| && 0 <= k@178@01 && k@178@01 < |ar@172@01| && j@177@01 != k@178@01]
(assert (and
  (<= 0 j@177@01)
  (and
    (< j@177@01 (Seq_length ar@172@01))
    (and
      (<= 0 k@178@01)
      (and (< k@178@01 (Seq_length ar@172@01)) (not (= j@177@01 k@178@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 5
(assert (not (>= j@177@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@178@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 68 | !(0 <= j@177@01 && j@177@01 < |ar@172@01| && 0 <= k@178@01 && k@178@01 < |ar@172@01| && j@177@01 != k@178@01)]
(assert (not
  (and
    (<= 0 j@177@01)
    (and
      (< j@177@01 (Seq_length ar@172@01))
      (and
        (<= 0 k@178@01)
        (and (< k@178@01 (Seq_length ar@172@01)) (not (= j@177@01 k@178@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@177@01)
    (and
      (< j@177@01 (Seq_length ar@172@01))
      (and
        (<= 0 k@178@01)
        (and (< k@178@01 (Seq_length ar@172@01)) (not (= j@177@01 k@178@01))))))
  (and
    (<= 0 j@177@01)
    (< j@177@01 (Seq_length ar@172@01))
    (<= 0 k@178@01)
    (< k@178@01 (Seq_length ar@172@01))
    (not (= j@177@01 k@178@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@177@01)
      (and
        (< j@177@01 (Seq_length ar@172@01))
        (and
          (<= 0 k@178@01)
          (and (< k@178@01 (Seq_length ar@172@01)) (not (= j@177@01 k@178@01)))))))
  (and
    (<= 0 j@177@01)
    (and
      (< j@177@01 (Seq_length ar@172@01))
      (and
        (<= 0 k@178@01)
        (and (< k@178@01 (Seq_length ar@172@01)) (not (= j@177@01 k@178@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@177@01 Int) (k@178@01 Int)) (!
  (and
    (=>
      (<= 0 j@177@01)
      (and
        (<= 0 j@177@01)
        (=>
          (< j@177@01 (Seq_length ar@172@01))
          (and
            (< j@177@01 (Seq_length ar@172@01))
            (=>
              (<= 0 k@178@01)
              (and
                (<= 0 k@178@01)
                (or
                  (< k@178@01 (Seq_length ar@172@01))
                  (not (< k@178@01 (Seq_length ar@172@01))))))
            (or (<= 0 k@178@01) (not (<= 0 k@178@01)))))
        (or
          (< j@177@01 (Seq_length ar@172@01))
          (not (< j@177@01 (Seq_length ar@172@01))))))
    (or (<= 0 j@177@01) (not (<= 0 j@177@01)))
    (=>
      (and
        (<= 0 j@177@01)
        (and
          (< j@177@01 (Seq_length ar@172@01))
          (and
            (<= 0 k@178@01)
            (and (< k@178@01 (Seq_length ar@172@01)) (not (= j@177@01 k@178@01))))))
      (and
        (<= 0 j@177@01)
        (< j@177@01 (Seq_length ar@172@01))
        (<= 0 k@178@01)
        (< k@178@01 (Seq_length ar@172@01))
        (not (= j@177@01 k@178@01))))
    (or
      (not
        (and
          (<= 0 j@177@01)
          (and
            (< j@177@01 (Seq_length ar@172@01))
            (and
              (<= 0 k@178@01)
              (and
                (< k@178@01 (Seq_length ar@172@01))
                (not (= j@177@01 k@178@01)))))))
      (and
        (<= 0 j@177@01)
        (and
          (< j@177@01 (Seq_length ar@172@01))
          (and
            (<= 0 k@178@01)
            (and (< k@178@01 (Seq_length ar@172@01)) (not (= j@177@01 k@178@01))))))))
  :pattern ((Seq_index ar@172@01 j@177@01) (Seq_index ar@172@01 k@178@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@171@12@171@106-aux|)))
(assert (forall ((j@177@01 Int) (k@178@01 Int)) (!
  (=>
    (and
      (<= 0 j@177@01)
      (and
        (< j@177@01 (Seq_length ar@172@01))
        (and
          (<= 0 k@178@01)
          (and (< k@178@01 (Seq_length ar@172@01)) (not (= j@177@01 k@178@01))))))
    (not (= (Seq_index ar@172@01 j@177@01) (Seq_index ar@172@01 k@178@01))))
  :pattern ((Seq_index ar@172@01 j@177@01) (Seq_index ar@172@01 k@178@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@171@12@171@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))
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
(assert (and (<= 0 i@179@01) (< i@179@01 len@175@01)))
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@179@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@179@01 (Seq_length ar@172@01))))
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
    (and (<= 0 i@179@01) (< i@179@01 len@175@01))
    (or (<= 0 i@179@01) (not (<= 0 i@179@01))))
  :pattern ((Seq_index ar@172@01 i@179@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@179@01 Int) (i2@179@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@179@01) (< i1@179@01 len@175@01))
      (and (<= 0 i2@179@01) (< i2@179@01 len@175@01))
      (= (Seq_index ar@172@01 i1@179@01) (Seq_index ar@172@01 i2@179@01)))
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
    (and (<= 0 i@179@01) (< i@179@01 len@175@01))
    (and
      (= (inv@180@01 (Seq_index ar@172@01 i@179@01)) i@179@01)
      (img@181@01 (Seq_index ar@172@01 i@179@01))))
  :pattern ((Seq_index ar@172@01 i@179@01))
  :qid |quant-u-93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@181@01 r)
      (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
    (= (Seq_index ar@172@01 (inv@180@01 r)) r))
  :pattern ((inv@180@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@179@01 Int)) (!
  (=>
    (and (<= 0 i@179@01) (< i@179@01 len@175@01))
    (not (= (Seq_index ar@172@01 i@179@01) $Ref.null)))
  :pattern ((Seq_index ar@172@01 i@179@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))
  $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (= (Seq_length br@173@01) len@175@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { br[j], br[k] } 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k])
(declare-const j@182@01 Int)
(declare-const k@183@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k]
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 70 | !(0 <= j@182@01) | live]
; [else-branch: 70 | 0 <= j@182@01 | live]
(push) ; 4
; [then-branch: 70 | !(0 <= j@182@01)]
(assert (not (<= 0 j@182@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 70 | 0 <= j@182@01]
(assert (<= 0 j@182@01))
; [eval] j < |br|
; [eval] |br|
(push) ; 5
; [then-branch: 71 | !(j@182@01 < |br@173@01|) | live]
; [else-branch: 71 | j@182@01 < |br@173@01| | live]
(push) ; 6
; [then-branch: 71 | !(j@182@01 < |br@173@01|)]
(assert (not (< j@182@01 (Seq_length br@173@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 71 | j@182@01 < |br@173@01|]
(assert (< j@182@01 (Seq_length br@173@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 72 | !(0 <= k@183@01) | live]
; [else-branch: 72 | 0 <= k@183@01 | live]
(push) ; 8
; [then-branch: 72 | !(0 <= k@183@01)]
(assert (not (<= 0 k@183@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 72 | 0 <= k@183@01]
(assert (<= 0 k@183@01))
; [eval] k < |br|
; [eval] |br|
(push) ; 9
; [then-branch: 73 | !(k@183@01 < |br@173@01|) | live]
; [else-branch: 73 | k@183@01 < |br@173@01| | live]
(push) ; 10
; [then-branch: 73 | !(k@183@01 < |br@173@01|)]
(assert (not (< k@183@01 (Seq_length br@173@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 73 | k@183@01 < |br@173@01|]
(assert (< k@183@01 (Seq_length br@173@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@183@01 (Seq_length br@173@01))
  (not (< k@183@01 (Seq_length br@173@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@183@01)
  (and
    (<= 0 k@183@01)
    (or
      (< k@183@01 (Seq_length br@173@01))
      (not (< k@183@01 (Seq_length br@173@01)))))))
(assert (or (<= 0 k@183@01) (not (<= 0 k@183@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@182@01 (Seq_length br@173@01))
  (and
    (< j@182@01 (Seq_length br@173@01))
    (=>
      (<= 0 k@183@01)
      (and
        (<= 0 k@183@01)
        (or
          (< k@183@01 (Seq_length br@173@01))
          (not (< k@183@01 (Seq_length br@173@01))))))
    (or (<= 0 k@183@01) (not (<= 0 k@183@01))))))
(assert (or
  (< j@182@01 (Seq_length br@173@01))
  (not (< j@182@01 (Seq_length br@173@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@182@01)
  (and
    (<= 0 j@182@01)
    (=>
      (< j@182@01 (Seq_length br@173@01))
      (and
        (< j@182@01 (Seq_length br@173@01))
        (=>
          (<= 0 k@183@01)
          (and
            (<= 0 k@183@01)
            (or
              (< k@183@01 (Seq_length br@173@01))
              (not (< k@183@01 (Seq_length br@173@01))))))
        (or (<= 0 k@183@01) (not (<= 0 k@183@01)))))
    (or
      (< j@182@01 (Seq_length br@173@01))
      (not (< j@182@01 (Seq_length br@173@01)))))))
(assert (or (<= 0 j@182@01) (not (<= 0 j@182@01))))
(push) ; 3
; [then-branch: 74 | 0 <= j@182@01 && j@182@01 < |br@173@01| && 0 <= k@183@01 && k@183@01 < |br@173@01| && j@182@01 != k@183@01 | live]
; [else-branch: 74 | !(0 <= j@182@01 && j@182@01 < |br@173@01| && 0 <= k@183@01 && k@183@01 < |br@173@01| && j@182@01 != k@183@01) | live]
(push) ; 4
; [then-branch: 74 | 0 <= j@182@01 && j@182@01 < |br@173@01| && 0 <= k@183@01 && k@183@01 < |br@173@01| && j@182@01 != k@183@01]
(assert (and
  (<= 0 j@182@01)
  (and
    (< j@182@01 (Seq_length br@173@01))
    (and
      (<= 0 k@183@01)
      (and (< k@183@01 (Seq_length br@173@01)) (not (= j@182@01 k@183@01)))))))
; [eval] br[j] != br[k]
; [eval] br[j]
(push) ; 5
(assert (not (>= j@182@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] br[k]
(push) ; 5
(assert (not (>= k@183@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 74 | !(0 <= j@182@01 && j@182@01 < |br@173@01| && 0 <= k@183@01 && k@183@01 < |br@173@01| && j@182@01 != k@183@01)]
(assert (not
  (and
    (<= 0 j@182@01)
    (and
      (< j@182@01 (Seq_length br@173@01))
      (and
        (<= 0 k@183@01)
        (and (< k@183@01 (Seq_length br@173@01)) (not (= j@182@01 k@183@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@182@01)
    (and
      (< j@182@01 (Seq_length br@173@01))
      (and
        (<= 0 k@183@01)
        (and (< k@183@01 (Seq_length br@173@01)) (not (= j@182@01 k@183@01))))))
  (and
    (<= 0 j@182@01)
    (< j@182@01 (Seq_length br@173@01))
    (<= 0 k@183@01)
    (< k@183@01 (Seq_length br@173@01))
    (not (= j@182@01 k@183@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@182@01)
      (and
        (< j@182@01 (Seq_length br@173@01))
        (and
          (<= 0 k@183@01)
          (and (< k@183@01 (Seq_length br@173@01)) (not (= j@182@01 k@183@01)))))))
  (and
    (<= 0 j@182@01)
    (and
      (< j@182@01 (Seq_length br@173@01))
      (and
        (<= 0 k@183@01)
        (and (< k@183@01 (Seq_length br@173@01)) (not (= j@182@01 k@183@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@182@01 Int) (k@183@01 Int)) (!
  (and
    (=>
      (<= 0 j@182@01)
      (and
        (<= 0 j@182@01)
        (=>
          (< j@182@01 (Seq_length br@173@01))
          (and
            (< j@182@01 (Seq_length br@173@01))
            (=>
              (<= 0 k@183@01)
              (and
                (<= 0 k@183@01)
                (or
                  (< k@183@01 (Seq_length br@173@01))
                  (not (< k@183@01 (Seq_length br@173@01))))))
            (or (<= 0 k@183@01) (not (<= 0 k@183@01)))))
        (or
          (< j@182@01 (Seq_length br@173@01))
          (not (< j@182@01 (Seq_length br@173@01))))))
    (or (<= 0 j@182@01) (not (<= 0 j@182@01)))
    (=>
      (and
        (<= 0 j@182@01)
        (and
          (< j@182@01 (Seq_length br@173@01))
          (and
            (<= 0 k@183@01)
            (and (< k@183@01 (Seq_length br@173@01)) (not (= j@182@01 k@183@01))))))
      (and
        (<= 0 j@182@01)
        (< j@182@01 (Seq_length br@173@01))
        (<= 0 k@183@01)
        (< k@183@01 (Seq_length br@173@01))
        (not (= j@182@01 k@183@01))))
    (or
      (not
        (and
          (<= 0 j@182@01)
          (and
            (< j@182@01 (Seq_length br@173@01))
            (and
              (<= 0 k@183@01)
              (and
                (< k@183@01 (Seq_length br@173@01))
                (not (= j@182@01 k@183@01)))))))
      (and
        (<= 0 j@182@01)
        (and
          (< j@182@01 (Seq_length br@173@01))
          (and
            (<= 0 k@183@01)
            (and (< k@183@01 (Seq_length br@173@01)) (not (= j@182@01 k@183@01))))))))
  :pattern ((Seq_index br@173@01 j@182@01) (Seq_index br@173@01 k@183@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@174@12@174@106-aux|)))
(assert (forall ((j@182@01 Int) (k@183@01 Int)) (!
  (=>
    (and
      (<= 0 j@182@01)
      (and
        (< j@182@01 (Seq_length br@173@01))
        (and
          (<= 0 k@183@01)
          (and (< k@183@01 (Seq_length br@173@01)) (not (= j@182@01 k@183@01))))))
    (not (= (Seq_index br@173@01 j@182@01) (Seq_index br@173@01 k@183@01))))
  :pattern ((Seq_index br@173@01 j@182@01) (Seq_index br@173@01 k@183@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@174@12@174@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))))
(declare-const i@184@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 75 | !(0 <= i@184@01) | live]
; [else-branch: 75 | 0 <= i@184@01 | live]
(push) ; 4
; [then-branch: 75 | !(0 <= i@184@01)]
(assert (not (<= 0 i@184@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 75 | 0 <= i@184@01]
(assert (<= 0 i@184@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@184@01) (not (<= 0 i@184@01))))
(assert (and (<= 0 i@184@01) (< i@184@01 len@175@01)))
; [eval] br[i]
(push) ; 3
(assert (not (>= i@184@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@184@01 (Seq_length br@173@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@185@01 ($Ref) Int)
(declare-fun img@186@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@184@01 Int)) (!
  (=>
    (and (<= 0 i@184@01) (< i@184@01 len@175@01))
    (or (<= 0 i@184@01) (not (<= 0 i@184@01))))
  :pattern ((Seq_index br@173@01 i@184@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@184@01 Int) (i2@184@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@184@01) (< i1@184@01 len@175@01))
      (and (<= 0 i2@184@01) (< i2@184@01 len@175@01))
      (= (Seq_index br@173@01 i1@184@01) (Seq_index br@173@01 i2@184@01)))
    (= i1@184@01 i2@184@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@184@01 Int)) (!
  (=>
    (and (<= 0 i@184@01) (< i@184@01 len@175@01))
    (and
      (= (inv@185@01 (Seq_index br@173@01 i@184@01)) i@184@01)
      (img@186@01 (Seq_index br@173@01 i@184@01))))
  :pattern ((Seq_index br@173@01 i@184@01))
  :qid |quant-u-95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@186@01 r)
      (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
    (= (Seq_index br@173@01 (inv@185@01 r)) r))
  :pattern ((inv@185@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@184@01 Int)) (!
  (=>
    (and (<= 0 i@184@01) (< i@184@01 len@175@01))
    (not (= (Seq_index br@173@01 i@184@01) $Ref.null)))
  :pattern ((Seq_index br@173@01 i@184@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@173@01 i@184@01) (Seq_index ar@172@01 i@179@01))
    (=
      (and
        (img@186@01 r)
        (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))))
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
(assert (= (Seq_length cr@174@01) len@175@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { cr[j], cr[k] } 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k])
(declare-const j@187@01 Int)
(declare-const k@188@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k]
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 76 | !(0 <= j@187@01) | live]
; [else-branch: 76 | 0 <= j@187@01 | live]
(push) ; 4
; [then-branch: 76 | !(0 <= j@187@01)]
(assert (not (<= 0 j@187@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 76 | 0 <= j@187@01]
(assert (<= 0 j@187@01))
; [eval] j < |cr|
; [eval] |cr|
(push) ; 5
; [then-branch: 77 | !(j@187@01 < |cr@174@01|) | live]
; [else-branch: 77 | j@187@01 < |cr@174@01| | live]
(push) ; 6
; [then-branch: 77 | !(j@187@01 < |cr@174@01|)]
(assert (not (< j@187@01 (Seq_length cr@174@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 77 | j@187@01 < |cr@174@01|]
(assert (< j@187@01 (Seq_length cr@174@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 78 | !(0 <= k@188@01) | live]
; [else-branch: 78 | 0 <= k@188@01 | live]
(push) ; 8
; [then-branch: 78 | !(0 <= k@188@01)]
(assert (not (<= 0 k@188@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 78 | 0 <= k@188@01]
(assert (<= 0 k@188@01))
; [eval] k < |cr|
; [eval] |cr|
(push) ; 9
; [then-branch: 79 | !(k@188@01 < |cr@174@01|) | live]
; [else-branch: 79 | k@188@01 < |cr@174@01| | live]
(push) ; 10
; [then-branch: 79 | !(k@188@01 < |cr@174@01|)]
(assert (not (< k@188@01 (Seq_length cr@174@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 79 | k@188@01 < |cr@174@01|]
(assert (< k@188@01 (Seq_length cr@174@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@188@01 (Seq_length cr@174@01))
  (not (< k@188@01 (Seq_length cr@174@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@188@01)
  (and
    (<= 0 k@188@01)
    (or
      (< k@188@01 (Seq_length cr@174@01))
      (not (< k@188@01 (Seq_length cr@174@01)))))))
(assert (or (<= 0 k@188@01) (not (<= 0 k@188@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@187@01 (Seq_length cr@174@01))
  (and
    (< j@187@01 (Seq_length cr@174@01))
    (=>
      (<= 0 k@188@01)
      (and
        (<= 0 k@188@01)
        (or
          (< k@188@01 (Seq_length cr@174@01))
          (not (< k@188@01 (Seq_length cr@174@01))))))
    (or (<= 0 k@188@01) (not (<= 0 k@188@01))))))
(assert (or
  (< j@187@01 (Seq_length cr@174@01))
  (not (< j@187@01 (Seq_length cr@174@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@187@01)
  (and
    (<= 0 j@187@01)
    (=>
      (< j@187@01 (Seq_length cr@174@01))
      (and
        (< j@187@01 (Seq_length cr@174@01))
        (=>
          (<= 0 k@188@01)
          (and
            (<= 0 k@188@01)
            (or
              (< k@188@01 (Seq_length cr@174@01))
              (not (< k@188@01 (Seq_length cr@174@01))))))
        (or (<= 0 k@188@01) (not (<= 0 k@188@01)))))
    (or
      (< j@187@01 (Seq_length cr@174@01))
      (not (< j@187@01 (Seq_length cr@174@01)))))))
(assert (or (<= 0 j@187@01) (not (<= 0 j@187@01))))
(push) ; 3
; [then-branch: 80 | 0 <= j@187@01 && j@187@01 < |cr@174@01| && 0 <= k@188@01 && k@188@01 < |cr@174@01| && j@187@01 != k@188@01 | live]
; [else-branch: 80 | !(0 <= j@187@01 && j@187@01 < |cr@174@01| && 0 <= k@188@01 && k@188@01 < |cr@174@01| && j@187@01 != k@188@01) | live]
(push) ; 4
; [then-branch: 80 | 0 <= j@187@01 && j@187@01 < |cr@174@01| && 0 <= k@188@01 && k@188@01 < |cr@174@01| && j@187@01 != k@188@01]
(assert (and
  (<= 0 j@187@01)
  (and
    (< j@187@01 (Seq_length cr@174@01))
    (and
      (<= 0 k@188@01)
      (and (< k@188@01 (Seq_length cr@174@01)) (not (= j@187@01 k@188@01)))))))
; [eval] cr[j] != cr[k]
; [eval] cr[j]
(push) ; 5
(assert (not (>= j@187@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] cr[k]
(push) ; 5
(assert (not (>= k@188@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 80 | !(0 <= j@187@01 && j@187@01 < |cr@174@01| && 0 <= k@188@01 && k@188@01 < |cr@174@01| && j@187@01 != k@188@01)]
(assert (not
  (and
    (<= 0 j@187@01)
    (and
      (< j@187@01 (Seq_length cr@174@01))
      (and
        (<= 0 k@188@01)
        (and (< k@188@01 (Seq_length cr@174@01)) (not (= j@187@01 k@188@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@187@01)
    (and
      (< j@187@01 (Seq_length cr@174@01))
      (and
        (<= 0 k@188@01)
        (and (< k@188@01 (Seq_length cr@174@01)) (not (= j@187@01 k@188@01))))))
  (and
    (<= 0 j@187@01)
    (< j@187@01 (Seq_length cr@174@01))
    (<= 0 k@188@01)
    (< k@188@01 (Seq_length cr@174@01))
    (not (= j@187@01 k@188@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@187@01)
      (and
        (< j@187@01 (Seq_length cr@174@01))
        (and
          (<= 0 k@188@01)
          (and (< k@188@01 (Seq_length cr@174@01)) (not (= j@187@01 k@188@01)))))))
  (and
    (<= 0 j@187@01)
    (and
      (< j@187@01 (Seq_length cr@174@01))
      (and
        (<= 0 k@188@01)
        (and (< k@188@01 (Seq_length cr@174@01)) (not (= j@187@01 k@188@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@187@01 Int) (k@188@01 Int)) (!
  (and
    (=>
      (<= 0 j@187@01)
      (and
        (<= 0 j@187@01)
        (=>
          (< j@187@01 (Seq_length cr@174@01))
          (and
            (< j@187@01 (Seq_length cr@174@01))
            (=>
              (<= 0 k@188@01)
              (and
                (<= 0 k@188@01)
                (or
                  (< k@188@01 (Seq_length cr@174@01))
                  (not (< k@188@01 (Seq_length cr@174@01))))))
            (or (<= 0 k@188@01) (not (<= 0 k@188@01)))))
        (or
          (< j@187@01 (Seq_length cr@174@01))
          (not (< j@187@01 (Seq_length cr@174@01))))))
    (or (<= 0 j@187@01) (not (<= 0 j@187@01)))
    (=>
      (and
        (<= 0 j@187@01)
        (and
          (< j@187@01 (Seq_length cr@174@01))
          (and
            (<= 0 k@188@01)
            (and (< k@188@01 (Seq_length cr@174@01)) (not (= j@187@01 k@188@01))))))
      (and
        (<= 0 j@187@01)
        (< j@187@01 (Seq_length cr@174@01))
        (<= 0 k@188@01)
        (< k@188@01 (Seq_length cr@174@01))
        (not (= j@187@01 k@188@01))))
    (or
      (not
        (and
          (<= 0 j@187@01)
          (and
            (< j@187@01 (Seq_length cr@174@01))
            (and
              (<= 0 k@188@01)
              (and
                (< k@188@01 (Seq_length cr@174@01))
                (not (= j@187@01 k@188@01)))))))
      (and
        (<= 0 j@187@01)
        (and
          (< j@187@01 (Seq_length cr@174@01))
          (and
            (<= 0 k@188@01)
            (and (< k@188@01 (Seq_length cr@174@01)) (not (= j@187@01 k@188@01))))))))
  :pattern ((Seq_index cr@174@01 j@187@01) (Seq_index cr@174@01 k@188@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@177@12@177@106-aux|)))
(assert (forall ((j@187@01 Int) (k@188@01 Int)) (!
  (=>
    (and
      (<= 0 j@187@01)
      (and
        (< j@187@01 (Seq_length cr@174@01))
        (and
          (<= 0 k@188@01)
          (and (< k@188@01 (Seq_length cr@174@01)) (not (= j@187@01 k@188@01))))))
    (not (= (Seq_index cr@174@01 j@187@01) (Seq_index cr@174@01 k@188@01))))
  :pattern ((Seq_index cr@174@01 j@187@01) (Seq_index cr@174@01 k@188@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@177@12@177@106|)))
(declare-const i@189@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 81 | !(0 <= i@189@01) | live]
; [else-branch: 81 | 0 <= i@189@01 | live]
(push) ; 4
; [then-branch: 81 | !(0 <= i@189@01)]
(assert (not (<= 0 i@189@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 81 | 0 <= i@189@01]
(assert (<= 0 i@189@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@189@01) (not (<= 0 i@189@01))))
(assert (and (<= 0 i@189@01) (< i@189@01 len@175@01)))
; [eval] cr[i]
(push) ; 3
(assert (not (>= i@189@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@189@01 (Seq_length cr@174@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@190@01 ($Ref) Int)
(declare-fun img@191@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@189@01 Int)) (!
  (=>
    (and (<= 0 i@189@01) (< i@189@01 len@175@01))
    (or (<= 0 i@189@01) (not (<= 0 i@189@01))))
  :pattern ((Seq_index cr@174@01 i@189@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@189@01 Int) (i2@189@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@189@01) (< i1@189@01 len@175@01))
      (and (<= 0 i2@189@01) (< i2@189@01 len@175@01))
      (= (Seq_index cr@174@01 i1@189@01) (Seq_index cr@174@01 i2@189@01)))
    (= i1@189@01 i2@189@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@189@01 Int)) (!
  (=>
    (and (<= 0 i@189@01) (< i@189@01 len@175@01))
    (and
      (= (inv@190@01 (Seq_index cr@174@01 i@189@01)) i@189@01)
      (img@191@01 (Seq_index cr@174@01 i@189@01))))
  :pattern ((Seq_index cr@174@01 i@189@01))
  :qid |quant-u-98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@191@01 r)
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
    (= (Seq_index cr@174@01 (inv@190@01 r)) r))
  :pattern ((inv@190@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@189@01 Int)) (!
  (=>
    (and (<= 0 i@189@01) (< i@189@01 len@175@01))
    (not (= (Seq_index cr@174@01 i@189@01) $Ref.null)))
  :pattern ((Seq_index cr@174@01 i@189@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@174@01 i@189@01) (Seq_index br@173@01 i@184@01))
    (=
      (and
        (img@191@01 r)
        (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
      (and
        (img@186@01 r)
        (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))))
  
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
    (= (Seq_index cr@174@01 i@189@01) (Seq_index ar@172@01 i@179@01))
    (=
      (and
        (img@191@01 r)
        (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))))
  
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
(declare-const $t@192@01 $Snap)
(assert (= $t@192@01 ($Snap.combine ($Snap.first $t@192@01) ($Snap.second $t@192@01))))
(assert (= ($Snap.first $t@192@01) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (=
  ($Snap.second $t@192@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@192@01))
    ($Snap.second ($Snap.second $t@192@01)))))
(declare-const i@193@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 82 | !(0 <= i@193@01) | live]
; [else-branch: 82 | 0 <= i@193@01 | live]
(push) ; 5
; [then-branch: 82 | !(0 <= i@193@01)]
(assert (not (<= 0 i@193@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 82 | 0 <= i@193@01]
(assert (<= 0 i@193@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@193@01) (not (<= 0 i@193@01))))
(assert (and (<= 0 i@193@01) (< i@193@01 len@175@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@193@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@193@01 (Seq_length ar@172@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@194@01 ($Ref) Int)
(declare-fun img@195@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@193@01 Int)) (!
  (=>
    (and (<= 0 i@193@01) (< i@193@01 len@175@01))
    (or (<= 0 i@193@01) (not (<= 0 i@193@01))))
  :pattern ((Seq_index ar@172@01 i@193@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@193@01 Int) (i2@193@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@193@01) (< i1@193@01 len@175@01))
      (and (<= 0 i2@193@01) (< i2@193@01 len@175@01))
      (= (Seq_index ar@172@01 i1@193@01) (Seq_index ar@172@01 i2@193@01)))
    (= i1@193@01 i2@193@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@193@01 Int)) (!
  (=>
    (and (<= 0 i@193@01) (< i@193@01 len@175@01))
    (and
      (= (inv@194@01 (Seq_index ar@172@01 i@193@01)) i@193@01)
      (img@195@01 (Seq_index ar@172@01 i@193@01))))
  :pattern ((Seq_index ar@172@01 i@193@01))
  :qid |quant-u-102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@195@01 r)
      (and (<= 0 (inv@194@01 r)) (< (inv@194@01 r) len@175@01)))
    (= (Seq_index ar@172@01 (inv@194@01 r)) r))
  :pattern ((inv@194@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@193@01 Int)) (!
  (=>
    (and (<= 0 i@193@01) (< i@193@01 len@175@01))
    (not (= (Seq_index ar@172@01 i@193@01) $Ref.null)))
  :pattern ((Seq_index ar@172@01 i@193@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@192@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@192@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@192@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@192@01))) $Snap.unit))
; [eval] |br| == len
; [eval] |br|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@192@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@192@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@192@01)))))))
(declare-const i@196@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 83 | !(0 <= i@196@01) | live]
; [else-branch: 83 | 0 <= i@196@01 | live]
(push) ; 5
; [then-branch: 83 | !(0 <= i@196@01)]
(assert (not (<= 0 i@196@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 83 | 0 <= i@196@01]
(assert (<= 0 i@196@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@196@01) (not (<= 0 i@196@01))))
(assert (and (<= 0 i@196@01) (< i@196@01 len@175@01)))
; [eval] br[i]
(push) ; 4
(assert (not (>= i@196@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@196@01 (Seq_length br@173@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@197@01 ($Ref) Int)
(declare-fun img@198@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@196@01 Int)) (!
  (=>
    (and (<= 0 i@196@01) (< i@196@01 len@175@01))
    (or (<= 0 i@196@01) (not (<= 0 i@196@01))))
  :pattern ((Seq_index br@173@01 i@196@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@196@01 Int) (i2@196@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@196@01) (< i1@196@01 len@175@01))
      (and (<= 0 i2@196@01) (< i2@196@01 len@175@01))
      (= (Seq_index br@173@01 i1@196@01) (Seq_index br@173@01 i2@196@01)))
    (= i1@196@01 i2@196@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@196@01 Int)) (!
  (=>
    (and (<= 0 i@196@01) (< i@196@01 len@175@01))
    (and
      (= (inv@197@01 (Seq_index br@173@01 i@196@01)) i@196@01)
      (img@198@01 (Seq_index br@173@01 i@196@01))))
  :pattern ((Seq_index br@173@01 i@196@01))
  :qid |quant-u-104|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@198@01 r)
      (and (<= 0 (inv@197@01 r)) (< (inv@197@01 r) len@175@01)))
    (= (Seq_index br@173@01 (inv@197@01 r)) r))
  :pattern ((inv@197@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@196@01 Int)) (!
  (=>
    (and (<= 0 i@196@01) (< i@196@01 len@175@01))
    (not (= (Seq_index br@173@01 i@196@01) $Ref.null)))
  :pattern ((Seq_index br@173@01 i@196@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@173@01 i@196@01) (Seq_index ar@172@01 i@193@01))
    (=
      (and
        (img@198@01 r)
        (and (<= 0 (inv@197@01 r)) (< (inv@197@01 r) len@175@01)))
      (and
        (img@195@01 r)
        (and (<= 0 (inv@194@01 r)) (< (inv@194@01 r) len@175@01)))))
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@192@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@192@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@192@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@192@01)))))
  $Snap.unit))
; [eval] |cr| == len
; [eval] |cr|
(declare-const i@199@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 4
; [then-branch: 84 | !(0 <= i@199@01) | live]
; [else-branch: 84 | 0 <= i@199@01 | live]
(push) ; 5
; [then-branch: 84 | !(0 <= i@199@01)]
(assert (not (<= 0 i@199@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 84 | 0 <= i@199@01]
(assert (<= 0 i@199@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@199@01) (not (<= 0 i@199@01))))
(assert (and (<= 0 i@199@01) (< i@199@01 len@175@01)))
; [eval] cr[i]
(push) ; 4
(assert (not (>= i@199@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@199@01 (Seq_length cr@174@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@200@01 ($Ref) Int)
(declare-fun img@201@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@199@01 Int)) (!
  (=>
    (and (<= 0 i@199@01) (< i@199@01 len@175@01))
    (or (<= 0 i@199@01) (not (<= 0 i@199@01))))
  :pattern ((Seq_index cr@174@01 i@199@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@199@01 Int) (i2@199@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@199@01) (< i1@199@01 len@175@01))
      (and (<= 0 i2@199@01) (< i2@199@01 len@175@01))
      (= (Seq_index cr@174@01 i1@199@01) (Seq_index cr@174@01 i2@199@01)))
    (= i1@199@01 i2@199@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@199@01 Int)) (!
  (=>
    (and (<= 0 i@199@01) (< i@199@01 len@175@01))
    (and
      (= (inv@200@01 (Seq_index cr@174@01 i@199@01)) i@199@01)
      (img@201@01 (Seq_index cr@174@01 i@199@01))))
  :pattern ((Seq_index cr@174@01 i@199@01))
  :qid |quant-u-107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@201@01 r)
      (and (<= 0 (inv@200@01 r)) (< (inv@200@01 r) len@175@01)))
    (= (Seq_index cr@174@01 (inv@200@01 r)) r))
  :pattern ((inv@200@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@199@01 Int)) (!
  (=>
    (and (<= 0 i@199@01) (< i@199@01 len@175@01))
    (not (= (Seq_index cr@174@01 i@199@01) $Ref.null)))
  :pattern ((Seq_index cr@174@01 i@199@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@174@01 i@199@01) (Seq_index br@173@01 i@196@01))
    (=
      (and
        (img@201@01 r)
        (and (<= 0 (inv@200@01 r)) (< (inv@200@01 r) len@175@01)))
      (and
        (img@198@01 r)
        (and (<= 0 (inv@197@01 r)) (< (inv@197@01 r) len@175@01)))))
  
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
    (= (Seq_index cr@174@01 i@199@01) (Seq_index ar@172@01 i@193@01))
    (=
      (and
        (img@201@01 r)
        (and (<= 0 (inv@200@01 r)) (< (inv@200@01 r) len@175@01)))
      (and
        (img@195@01 r)
        (and (<= 0 (inv@194@01 r)) (< (inv@194@01 r) len@175@01)))))
  
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
(assert (not (not (< 0 len@175@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 len@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 85 | 0 < len@175@01 | live]
; [else-branch: 85 | !(0 < len@175@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 85 | 0 < len@175@01]
(assert (< 0 len@175@01))
; [eval] |ar| == len
; [eval] |ar|
(pop) ; 4
(push) ; 4
; [else-branch: 85 | !(0 < len@175@01)]
(assert (not (< 0 len@175@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< 0 len@175@01)) (< 0 len@175@01)))
(push) ; 3
(assert (not (=> (< 0 len@175@01) (= (Seq_length ar@172@01) len@175@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@175@01) (= (Seq_length ar@172@01) len@175@01)))
; [eval] (forall j: Int, k: Int :: { ar[j], ar[k] } 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@202@01 Int)
(declare-const k@203@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 86 | !(0 <= j@202@01) | live]
; [else-branch: 86 | 0 <= j@202@01 | live]
(push) ; 5
; [then-branch: 86 | !(0 <= j@202@01)]
(assert (not (<= 0 j@202@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 86 | 0 <= j@202@01]
(assert (<= 0 j@202@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 6
; [then-branch: 87 | !(j@202@01 < |ar@172@01|) | live]
; [else-branch: 87 | j@202@01 < |ar@172@01| | live]
(push) ; 7
; [then-branch: 87 | !(j@202@01 < |ar@172@01|)]
(assert (not (< j@202@01 (Seq_length ar@172@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 87 | j@202@01 < |ar@172@01|]
(assert (< j@202@01 (Seq_length ar@172@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 88 | !(0 <= k@203@01) | live]
; [else-branch: 88 | 0 <= k@203@01 | live]
(push) ; 9
; [then-branch: 88 | !(0 <= k@203@01)]
(assert (not (<= 0 k@203@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 88 | 0 <= k@203@01]
(assert (<= 0 k@203@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 10
; [then-branch: 89 | !(k@203@01 < |ar@172@01|) | live]
; [else-branch: 89 | k@203@01 < |ar@172@01| | live]
(push) ; 11
; [then-branch: 89 | !(k@203@01 < |ar@172@01|)]
(assert (not (< k@203@01 (Seq_length ar@172@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 89 | k@203@01 < |ar@172@01|]
(assert (< k@203@01 (Seq_length ar@172@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@203@01 (Seq_length ar@172@01))
  (not (< k@203@01 (Seq_length ar@172@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@203@01)
  (and
    (<= 0 k@203@01)
    (or
      (< k@203@01 (Seq_length ar@172@01))
      (not (< k@203@01 (Seq_length ar@172@01)))))))
(assert (or (<= 0 k@203@01) (not (<= 0 k@203@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@202@01 (Seq_length ar@172@01))
  (and
    (< j@202@01 (Seq_length ar@172@01))
    (=>
      (<= 0 k@203@01)
      (and
        (<= 0 k@203@01)
        (or
          (< k@203@01 (Seq_length ar@172@01))
          (not (< k@203@01 (Seq_length ar@172@01))))))
    (or (<= 0 k@203@01) (not (<= 0 k@203@01))))))
(assert (or
  (< j@202@01 (Seq_length ar@172@01))
  (not (< j@202@01 (Seq_length ar@172@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@202@01)
  (and
    (<= 0 j@202@01)
    (=>
      (< j@202@01 (Seq_length ar@172@01))
      (and
        (< j@202@01 (Seq_length ar@172@01))
        (=>
          (<= 0 k@203@01)
          (and
            (<= 0 k@203@01)
            (or
              (< k@203@01 (Seq_length ar@172@01))
              (not (< k@203@01 (Seq_length ar@172@01))))))
        (or (<= 0 k@203@01) (not (<= 0 k@203@01)))))
    (or
      (< j@202@01 (Seq_length ar@172@01))
      (not (< j@202@01 (Seq_length ar@172@01)))))))
(assert (or (<= 0 j@202@01) (not (<= 0 j@202@01))))
(push) ; 4
; [then-branch: 90 | 0 <= j@202@01 && j@202@01 < |ar@172@01| && 0 <= k@203@01 && k@203@01 < |ar@172@01| && j@202@01 != k@203@01 | live]
; [else-branch: 90 | !(0 <= j@202@01 && j@202@01 < |ar@172@01| && 0 <= k@203@01 && k@203@01 < |ar@172@01| && j@202@01 != k@203@01) | live]
(push) ; 5
; [then-branch: 90 | 0 <= j@202@01 && j@202@01 < |ar@172@01| && 0 <= k@203@01 && k@203@01 < |ar@172@01| && j@202@01 != k@203@01]
(assert (and
  (<= 0 j@202@01)
  (and
    (< j@202@01 (Seq_length ar@172@01))
    (and
      (<= 0 k@203@01)
      (and (< k@203@01 (Seq_length ar@172@01)) (not (= j@202@01 k@203@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 6
(assert (not (>= j@202@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@203@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 90 | !(0 <= j@202@01 && j@202@01 < |ar@172@01| && 0 <= k@203@01 && k@203@01 < |ar@172@01| && j@202@01 != k@203@01)]
(assert (not
  (and
    (<= 0 j@202@01)
    (and
      (< j@202@01 (Seq_length ar@172@01))
      (and
        (<= 0 k@203@01)
        (and (< k@203@01 (Seq_length ar@172@01)) (not (= j@202@01 k@203@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@202@01)
    (and
      (< j@202@01 (Seq_length ar@172@01))
      (and
        (<= 0 k@203@01)
        (and (< k@203@01 (Seq_length ar@172@01)) (not (= j@202@01 k@203@01))))))
  (and
    (<= 0 j@202@01)
    (< j@202@01 (Seq_length ar@172@01))
    (<= 0 k@203@01)
    (< k@203@01 (Seq_length ar@172@01))
    (not (= j@202@01 k@203@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@202@01)
      (and
        (< j@202@01 (Seq_length ar@172@01))
        (and
          (<= 0 k@203@01)
          (and (< k@203@01 (Seq_length ar@172@01)) (not (= j@202@01 k@203@01)))))))
  (and
    (<= 0 j@202@01)
    (and
      (< j@202@01 (Seq_length ar@172@01))
      (and
        (<= 0 k@203@01)
        (and (< k@203@01 (Seq_length ar@172@01)) (not (= j@202@01 k@203@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@202@01 Int) (k@203@01 Int)) (!
  (and
    (=>
      (<= 0 j@202@01)
      (and
        (<= 0 j@202@01)
        (=>
          (< j@202@01 (Seq_length ar@172@01))
          (and
            (< j@202@01 (Seq_length ar@172@01))
            (=>
              (<= 0 k@203@01)
              (and
                (<= 0 k@203@01)
                (or
                  (< k@203@01 (Seq_length ar@172@01))
                  (not (< k@203@01 (Seq_length ar@172@01))))))
            (or (<= 0 k@203@01) (not (<= 0 k@203@01)))))
        (or
          (< j@202@01 (Seq_length ar@172@01))
          (not (< j@202@01 (Seq_length ar@172@01))))))
    (or (<= 0 j@202@01) (not (<= 0 j@202@01)))
    (=>
      (and
        (<= 0 j@202@01)
        (and
          (< j@202@01 (Seq_length ar@172@01))
          (and
            (<= 0 k@203@01)
            (and (< k@203@01 (Seq_length ar@172@01)) (not (= j@202@01 k@203@01))))))
      (and
        (<= 0 j@202@01)
        (< j@202@01 (Seq_length ar@172@01))
        (<= 0 k@203@01)
        (< k@203@01 (Seq_length ar@172@01))
        (not (= j@202@01 k@203@01))))
    (or
      (not
        (and
          (<= 0 j@202@01)
          (and
            (< j@202@01 (Seq_length ar@172@01))
            (and
              (<= 0 k@203@01)
              (and
                (< k@203@01 (Seq_length ar@172@01))
                (not (= j@202@01 k@203@01)))))))
      (and
        (<= 0 j@202@01)
        (and
          (< j@202@01 (Seq_length ar@172@01))
          (and
            (<= 0 k@203@01)
            (and (< k@203@01 (Seq_length ar@172@01)) (not (= j@202@01 k@203@01))))))))
  :pattern ((Seq_index ar@172@01 j@202@01) (Seq_index ar@172@01 k@203@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@62@12@62@106-aux|)))
(push) ; 3
(assert (not (forall ((j@202@01 Int) (k@203@01 Int)) (!
  (=>
    (and
      (<= 0 j@202@01)
      (and
        (< j@202@01 (Seq_length ar@172@01))
        (and
          (<= 0 k@203@01)
          (and (< k@203@01 (Seq_length ar@172@01)) (not (= j@202@01 k@203@01))))))
    (not (= (Seq_index ar@172@01 j@202@01) (Seq_index ar@172@01 k@203@01))))
  :pattern ((Seq_index ar@172@01 j@202@01) (Seq_index ar@172@01 k@203@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@62@12@62@106|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@202@01 Int) (k@203@01 Int)) (!
  (=>
    (and
      (<= 0 j@202@01)
      (and
        (< j@202@01 (Seq_length ar@172@01))
        (and
          (<= 0 k@203@01)
          (and (< k@203@01 (Seq_length ar@172@01)) (not (= j@202@01 k@203@01))))))
    (not (= (Seq_index ar@172@01 j@202@01) (Seq_index ar@172@01 k@203@01))))
  :pattern ((Seq_index ar@172@01 j@202@01) (Seq_index ar@172@01 k@203@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@62@12@62@106|)))
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
(assert (and (<= 0 i@204@01) (< i@204@01 len@175@01)))
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@204@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@204@01 (Seq_length ar@172@01))))
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
    (and (<= 0 i@204@01) (< i@204@01 len@175@01))
    (or (<= 0 i@204@01) (not (<= 0 i@204@01))))
  :pattern ((Seq_index ar@172@01 i@204@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@204@01 Int) (i2@204@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@204@01) (< i1@204@01 len@175@01))
      (and (<= 0 i2@204@01) (< i2@204@01 len@175@01))
      (= (Seq_index ar@172@01 i1@204@01) (Seq_index ar@172@01 i2@204@01)))
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
    (and (<= 0 i@204@01) (< i@204@01 len@175@01))
    (and
      (= (inv@205@01 (Seq_index ar@172@01 i@204@01)) i@204@01)
      (img@206@01 (Seq_index ar@172@01 i@204@01))))
  :pattern ((Seq_index ar@172@01 i@204@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@206@01 r)
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@175@01)))
    (= (Seq_index ar@172@01 (inv@205@01 r)) r))
  :pattern ((inv@205@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@204@01 Int)) (!
  (= (Seq_index ar@172@01 i@204@01) (Seq_index br@173@01 i@204@01))
  
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
  (= (Seq_index ar@172@01 i@204@01) (Seq_index cr@174@01 i@204@01))
  
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
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@175@01))
      (img@206@01 r)
      (= r (Seq_index ar@172@01 (inv@205@01 r))))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@208@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@175@01))
      (img@206@01 r)
      (= r (Seq_index ar@172@01 (inv@205@01 r))))
    ($Perm.min
      (ite
        (and
          (img@186@01 r)
          (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@207@01 r)))
    $Perm.No))
(define-fun pTaken@209@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@175@01))
      (img@206@01 r)
      (= r (Seq_index ar@172@01 (inv@205@01 r))))
    ($Perm.min
      (ite
        (and
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
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
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
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
      (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) len@175@01))
      (img@206@01 r)
      (= r (Seq_index ar@172@01 (inv@205@01 r))))
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
      (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@186@01 r)
      (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@191@01 r)
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@210@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r))
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
(assert (not (not (< 0 len@175@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 len@175@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 93 | 0 < len@175@01 | live]
; [else-branch: 93 | !(0 < len@175@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 93 | 0 < len@175@01]
(assert (< 0 len@175@01))
; [eval] ar[0]
(push) ; 4
(assert (not (< 0 (Seq_length ar@172@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@211@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ar@172@01 0))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
        (- $Perm.Write (pTaken@207@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@212@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ar@172@01 0))
    ($Perm.min
      (ite
        (and
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@211@01 r)))
    $Perm.No))
(define-fun pTaken@213@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ar@172@01 0))
    ($Perm.min
      (ite
        (and
          (img@186@01 r)
          (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
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
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
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
    (= r (Seq_index ar@172@01 0))
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
    (img@191@01 (Seq_index ar@172@01 0))
    (and
      (<= 0 (inv@190@01 (Seq_index ar@172@01 0)))
      (< (inv@190@01 (Seq_index ar@172@01 0)) len@175@01)))
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@214@01  $FVF<Ref__Integer_value>) (Seq_index
      ar@172@01
      0))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) (Seq_index
      ar@172@01
      0)))))
(assert (=>
  (and
    (img@186@01 (Seq_index ar@172@01 0))
    (and
      (<= 0 (inv@185@01 (Seq_index ar@172@01 0)))
      (< (inv@185@01 (Seq_index ar@172@01 0)) len@175@01)))
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@214@01  $FVF<Ref__Integer_value>) (Seq_index
      ar@172@01
      0))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) (Seq_index
      ar@172@01
      0)))))
(assert (=>
  (ite
    (and
      (img@181@01 (Seq_index ar@172@01 0))
      (and
        (<= 0 (inv@180@01 (Seq_index ar@172@01 0)))
        (< (inv@180@01 (Seq_index ar@172@01 0)) len@175@01)))
    (< $Perm.No (- $Perm.Write (pTaken@207@01 (Seq_index ar@172@01 0))))
    false)
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@214@01  $FVF<Ref__Integer_value>) (Seq_index
      ar@172@01
      0))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))) (Seq_index
      ar@172@01
      0)))))
(declare-const i@215@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 1 <= i && i < (|ar| - 1 < len ? |ar| - 1 : len) + 1
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
; [eval] i < (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] (|ar| - 1 < len ? |ar| - 1 : len)
; [eval] |ar| - 1 < len
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length ar@172@01) 1) len@175@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- (Seq_length ar@172@01) 1) len@175@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 95 | |ar@172@01| - 1 < len@175@01 | live]
; [else-branch: 95 | !(|ar@172@01| - 1 < len@175@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 95 | |ar@172@01| - 1 < len@175@01]
(assert (< (- (Seq_length ar@172@01) 1) len@175@01))
; [eval] |ar| - 1
; [eval] |ar|
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- (Seq_length ar@172@01) 1) len@175@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@215@01)
  (and (<= 1 i@215@01) (< (- (Seq_length ar@172@01) 1) len@175@01))))
(assert (or (<= 1 i@215@01) (not (<= 1 i@215@01))))
(assert (and (<= 1 i@215@01) (< i@215@01 (+ (- (Seq_length ar@172@01) 1) 1))))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@215@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@215@01 (Seq_length ar@172@01))))
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
    (and (<= 1 i@215@01) (< i@215@01 (+ (- (Seq_length ar@172@01) 1) 1)))
    (and
      (=>
        (<= 1 i@215@01)
        (and (<= 1 i@215@01) (< (- (Seq_length ar@172@01) 1) len@175@01)))
      (or (<= 1 i@215@01) (not (<= 1 i@215@01)))))
  :pattern ((Seq_index ar@172@01 i@215@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@215@01 Int) (i2@215@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@215@01) (< i1@215@01 (+ (- (Seq_length ar@172@01) 1) 1)))
      (and (<= 1 i2@215@01) (< i2@215@01 (+ (- (Seq_length ar@172@01) 1) 1)))
      (= (Seq_index ar@172@01 i1@215@01) (Seq_index ar@172@01 i2@215@01)))
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
    (and (<= 1 i@215@01) (< i@215@01 (+ (- (Seq_length ar@172@01) 1) 1)))
    (and
      (= (inv@216@01 (Seq_index ar@172@01 i@215@01)) i@215@01)
      (img@217@01 (Seq_index ar@172@01 i@215@01))))
  :pattern ((Seq_index ar@172@01 i@215@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@217@01 r)
      (and
        (<= 1 (inv@216@01 r))
        (< (inv@216@01 r) (+ (- (Seq_length ar@172@01) 1) 1))))
    (= (Seq_index ar@172@01 (inv@216@01 r)) r))
  :pattern ((inv@216@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@215@01 Int)) (!
  (= (Seq_index ar@172@01 i@215@01) (Seq_index br@173@01 i@215@01))
  
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
  (= (Seq_index ar@172@01 i@215@01) (Seq_index cr@174@01 i@215@01))
  
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
        (< (inv@216@01 r) (+ (- (Seq_length ar@172@01) 1) 1)))
      (img@217@01 r)
      (= r (Seq_index ar@172@01 (inv@216@01 r))))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
        (- (- $Perm.Write (pTaken@207@01 r)) (pTaken@211@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@219@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@216@01 r))
        (< (inv@216@01 r) (+ (- (Seq_length ar@172@01) 1) 1)))
      (img@217@01 r)
      (= r (Seq_index ar@172@01 (inv@216@01 r))))
    ($Perm.min
      (ite
        (and
          (img@186@01 r)
          (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@218@01 r)))
    $Perm.No))
(define-fun pTaken@220@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@216@01 r))
        (< (inv@216@01 r) (+ (- (Seq_length ar@172@01) 1) 1)))
      (img@217@01 r)
      (= r (Seq_index ar@172@01 (inv@216@01 r))))
    ($Perm.min
      (ite
        (and
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
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
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
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
        (< (inv@216@01 r) (+ (- (Seq_length ar@172@01) 1) 1)))
      (img@217@01 r)
      (= r (Seq_index ar@172@01 (inv@216@01 r))))
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
      (img@186@01 r)
      (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@191@01 r)
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
      (< $Perm.No (- (- $Perm.Write (pTaken@207@01 r)) (pTaken@211@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@221@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))) r))
  :qid |qp.fvfValDef8|)))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@175@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 96 | 0 < len@175@01 | live]
; [else-branch: 96 | !(0 < len@175@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 96 | 0 < len@175@01]
; [eval] |br| == len
; [eval] |br|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=> (< 0 len@175@01) (= (Seq_length br@173@01) len@175@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@175@01) (= (Seq_length br@173@01) len@175@01)))
; [eval] (forall j: Int, k: Int :: { br[j], br[k] } 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k])
(declare-const j@222@01 Int)
(declare-const k@223@01 Int)
(push) ; 4
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k]
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k)))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 97 | !(0 <= j@222@01) | live]
; [else-branch: 97 | 0 <= j@222@01 | live]
(push) ; 6
; [then-branch: 97 | !(0 <= j@222@01)]
(assert (not (<= 0 j@222@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 97 | 0 <= j@222@01]
(assert (<= 0 j@222@01))
; [eval] j < |br|
; [eval] |br|
(push) ; 7
; [then-branch: 98 | !(j@222@01 < |br@173@01|) | live]
; [else-branch: 98 | j@222@01 < |br@173@01| | live]
(push) ; 8
; [then-branch: 98 | !(j@222@01 < |br@173@01|)]
(assert (not (< j@222@01 (Seq_length br@173@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 98 | j@222@01 < |br@173@01|]
(assert (< j@222@01 (Seq_length br@173@01)))
; [eval] 0 <= k
(push) ; 9
; [then-branch: 99 | !(0 <= k@223@01) | live]
; [else-branch: 99 | 0 <= k@223@01 | live]
(push) ; 10
; [then-branch: 99 | !(0 <= k@223@01)]
(assert (not (<= 0 k@223@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 99 | 0 <= k@223@01]
(assert (<= 0 k@223@01))
; [eval] k < |br|
; [eval] |br|
(push) ; 11
; [then-branch: 100 | !(k@223@01 < |br@173@01|) | live]
; [else-branch: 100 | k@223@01 < |br@173@01| | live]
(push) ; 12
; [then-branch: 100 | !(k@223@01 < |br@173@01|)]
(assert (not (< k@223@01 (Seq_length br@173@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 100 | k@223@01 < |br@173@01|]
(assert (< k@223@01 (Seq_length br@173@01)))
; [eval] j != k
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@223@01 (Seq_length br@173@01))
  (not (< k@223@01 (Seq_length br@173@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@223@01)
  (and
    (<= 0 k@223@01)
    (or
      (< k@223@01 (Seq_length br@173@01))
      (not (< k@223@01 (Seq_length br@173@01)))))))
(assert (or (<= 0 k@223@01) (not (<= 0 k@223@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@222@01 (Seq_length br@173@01))
  (and
    (< j@222@01 (Seq_length br@173@01))
    (=>
      (<= 0 k@223@01)
      (and
        (<= 0 k@223@01)
        (or
          (< k@223@01 (Seq_length br@173@01))
          (not (< k@223@01 (Seq_length br@173@01))))))
    (or (<= 0 k@223@01) (not (<= 0 k@223@01))))))
(assert (or
  (< j@222@01 (Seq_length br@173@01))
  (not (< j@222@01 (Seq_length br@173@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@222@01)
  (and
    (<= 0 j@222@01)
    (=>
      (< j@222@01 (Seq_length br@173@01))
      (and
        (< j@222@01 (Seq_length br@173@01))
        (=>
          (<= 0 k@223@01)
          (and
            (<= 0 k@223@01)
            (or
              (< k@223@01 (Seq_length br@173@01))
              (not (< k@223@01 (Seq_length br@173@01))))))
        (or (<= 0 k@223@01) (not (<= 0 k@223@01)))))
    (or
      (< j@222@01 (Seq_length br@173@01))
      (not (< j@222@01 (Seq_length br@173@01)))))))
(assert (or (<= 0 j@222@01) (not (<= 0 j@222@01))))
(push) ; 5
; [then-branch: 101 | 0 <= j@222@01 && j@222@01 < |br@173@01| && 0 <= k@223@01 && k@223@01 < |br@173@01| && j@222@01 != k@223@01 | live]
; [else-branch: 101 | !(0 <= j@222@01 && j@222@01 < |br@173@01| && 0 <= k@223@01 && k@223@01 < |br@173@01| && j@222@01 != k@223@01) | live]
(push) ; 6
; [then-branch: 101 | 0 <= j@222@01 && j@222@01 < |br@173@01| && 0 <= k@223@01 && k@223@01 < |br@173@01| && j@222@01 != k@223@01]
(assert (and
  (<= 0 j@222@01)
  (and
    (< j@222@01 (Seq_length br@173@01))
    (and
      (<= 0 k@223@01)
      (and (< k@223@01 (Seq_length br@173@01)) (not (= j@222@01 k@223@01)))))))
; [eval] br[j] != br[k]
; [eval] br[j]
(push) ; 7
(assert (not (>= j@222@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] br[k]
(push) ; 7
(assert (not (>= k@223@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 101 | !(0 <= j@222@01 && j@222@01 < |br@173@01| && 0 <= k@223@01 && k@223@01 < |br@173@01| && j@222@01 != k@223@01)]
(assert (not
  (and
    (<= 0 j@222@01)
    (and
      (< j@222@01 (Seq_length br@173@01))
      (and
        (<= 0 k@223@01)
        (and (< k@223@01 (Seq_length br@173@01)) (not (= j@222@01 k@223@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@222@01)
    (and
      (< j@222@01 (Seq_length br@173@01))
      (and
        (<= 0 k@223@01)
        (and (< k@223@01 (Seq_length br@173@01)) (not (= j@222@01 k@223@01))))))
  (and
    (<= 0 j@222@01)
    (< j@222@01 (Seq_length br@173@01))
    (<= 0 k@223@01)
    (< k@223@01 (Seq_length br@173@01))
    (not (= j@222@01 k@223@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@222@01)
      (and
        (< j@222@01 (Seq_length br@173@01))
        (and
          (<= 0 k@223@01)
          (and (< k@223@01 (Seq_length br@173@01)) (not (= j@222@01 k@223@01)))))))
  (and
    (<= 0 j@222@01)
    (and
      (< j@222@01 (Seq_length br@173@01))
      (and
        (<= 0 k@223@01)
        (and (< k@223@01 (Seq_length br@173@01)) (not (= j@222@01 k@223@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@222@01 Int) (k@223@01 Int)) (!
  (and
    (=>
      (<= 0 j@222@01)
      (and
        (<= 0 j@222@01)
        (=>
          (< j@222@01 (Seq_length br@173@01))
          (and
            (< j@222@01 (Seq_length br@173@01))
            (=>
              (<= 0 k@223@01)
              (and
                (<= 0 k@223@01)
                (or
                  (< k@223@01 (Seq_length br@173@01))
                  (not (< k@223@01 (Seq_length br@173@01))))))
            (or (<= 0 k@223@01) (not (<= 0 k@223@01)))))
        (or
          (< j@222@01 (Seq_length br@173@01))
          (not (< j@222@01 (Seq_length br@173@01))))))
    (or (<= 0 j@222@01) (not (<= 0 j@222@01)))
    (=>
      (and
        (<= 0 j@222@01)
        (and
          (< j@222@01 (Seq_length br@173@01))
          (and
            (<= 0 k@223@01)
            (and (< k@223@01 (Seq_length br@173@01)) (not (= j@222@01 k@223@01))))))
      (and
        (<= 0 j@222@01)
        (< j@222@01 (Seq_length br@173@01))
        (<= 0 k@223@01)
        (< k@223@01 (Seq_length br@173@01))
        (not (= j@222@01 k@223@01))))
    (or
      (not
        (and
          (<= 0 j@222@01)
          (and
            (< j@222@01 (Seq_length br@173@01))
            (and
              (<= 0 k@223@01)
              (and
                (< k@223@01 (Seq_length br@173@01))
                (not (= j@222@01 k@223@01)))))))
      (and
        (<= 0 j@222@01)
        (and
          (< j@222@01 (Seq_length br@173@01))
          (and
            (<= 0 k@223@01)
            (and (< k@223@01 (Seq_length br@173@01)) (not (= j@222@01 k@223@01))))))))
  :pattern ((Seq_index br@173@01 j@222@01) (Seq_index br@173@01 k@223@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106-aux|)))
(push) ; 4
(assert (not (forall ((j@222@01 Int) (k@223@01 Int)) (!
  (=>
    (and
      (<= 0 j@222@01)
      (and
        (< j@222@01 (Seq_length br@173@01))
        (and
          (<= 0 k@223@01)
          (and (< k@223@01 (Seq_length br@173@01)) (not (= j@222@01 k@223@01))))))
    (not (= (Seq_index br@173@01 j@222@01) (Seq_index br@173@01 k@223@01))))
  :pattern ((Seq_index br@173@01 j@222@01) (Seq_index br@173@01 k@223@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@222@01 Int) (k@223@01 Int)) (!
  (=>
    (and
      (<= 0 j@222@01)
      (and
        (< j@222@01 (Seq_length br@173@01))
        (and
          (<= 0 k@223@01)
          (and (< k@223@01 (Seq_length br@173@01)) (not (= j@222@01 k@223@01))))))
    (not (= (Seq_index br@173@01 j@222@01) (Seq_index br@173@01 k@223@01))))
  :pattern ((Seq_index br@173@01 j@222@01) (Seq_index br@173@01 k@223@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106|)))
(declare-const i@224@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 102 | !(0 <= i@224@01) | live]
; [else-branch: 102 | 0 <= i@224@01 | live]
(push) ; 6
; [then-branch: 102 | !(0 <= i@224@01)]
(assert (not (<= 0 i@224@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 102 | 0 <= i@224@01]
(assert (<= 0 i@224@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@224@01) (not (<= 0 i@224@01))))
(assert (and (<= 0 i@224@01) (< i@224@01 len@175@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@224@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@224@01 (Seq_length br@173@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@225@01 ($Ref) Int)
(declare-fun img@226@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@224@01 Int)) (!
  (=>
    (and (<= 0 i@224@01) (< i@224@01 len@175@01))
    (or (<= 0 i@224@01) (not (<= 0 i@224@01))))
  :pattern ((Seq_index br@173@01 i@224@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@224@01 Int) (i2@224@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@224@01) (< i1@224@01 len@175@01))
      (and (<= 0 i2@224@01) (< i2@224@01 len@175@01))
      (= (Seq_index br@173@01 i1@224@01) (Seq_index br@173@01 i2@224@01)))
    (= i1@224@01 i2@224@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@224@01 Int)) (!
  (=>
    (and (<= 0 i@224@01) (< i@224@01 len@175@01))
    (and
      (= (inv@225@01 (Seq_index br@173@01 i@224@01)) i@224@01)
      (img@226@01 (Seq_index br@173@01 i@224@01))))
  :pattern ((Seq_index br@173@01 i@224@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@226@01 r)
      (and (<= 0 (inv@225@01 r)) (< (inv@225@01 r) len@175@01)))
    (= (Seq_index br@173@01 (inv@225@01 r)) r))
  :pattern ((inv@225@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@224@01 Int)) (!
  (= (Seq_index br@173@01 i@224@01) (Seq_index cr@174@01 i@224@01))
  
  :qid |quant-u-128|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@227@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@225@01 r)) (< (inv@225@01 r) len@175@01))
      (img@226@01 r)
      (= r (Seq_index br@173@01 (inv@225@01 r))))
    ($Perm.min
      (ite
        (and
          (img@186@01 r)
          (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@228@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@225@01 r)) (< (inv@225@01 r) len@175@01))
      (img@226@01 r)
      (= r (Seq_index br@173@01 (inv@225@01 r))))
    ($Perm.min
      (ite
        (and
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@227@01 r)))
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
          (img@186@01 r)
          (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@227@01 r))
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
      (and (<= 0 (inv@225@01 r)) (< (inv@225@01 r) len@175@01))
      (img@226@01 r)
      (= r (Seq_index br@173@01 (inv@225@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@227@01 r)) $Perm.No))
  
  :qid |quant-u-131|))))
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
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@186@01 r)
      (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@229@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r))
  :qid |qp.fvfValDef10|)))
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@175@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 103 | 0 < len@175@01 | live]
; [else-branch: 103 | !(0 < len@175@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 103 | 0 < len@175@01]
; [eval] |cr| == len
; [eval] |cr|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=> (< 0 len@175@01) (= (Seq_length cr@174@01) len@175@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (< 0 len@175@01) (= (Seq_length cr@174@01) len@175@01)))
; [eval] (forall j: Int, k: Int :: { cr[j], cr[k] } 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k])
(declare-const j@230@01 Int)
(declare-const k@231@01 Int)
(push) ; 4
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k]
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k)))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 104 | !(0 <= j@230@01) | live]
; [else-branch: 104 | 0 <= j@230@01 | live]
(push) ; 6
; [then-branch: 104 | !(0 <= j@230@01)]
(assert (not (<= 0 j@230@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 104 | 0 <= j@230@01]
(assert (<= 0 j@230@01))
; [eval] j < |cr|
; [eval] |cr|
(push) ; 7
; [then-branch: 105 | !(j@230@01 < |cr@174@01|) | live]
; [else-branch: 105 | j@230@01 < |cr@174@01| | live]
(push) ; 8
; [then-branch: 105 | !(j@230@01 < |cr@174@01|)]
(assert (not (< j@230@01 (Seq_length cr@174@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 105 | j@230@01 < |cr@174@01|]
(assert (< j@230@01 (Seq_length cr@174@01)))
; [eval] 0 <= k
(push) ; 9
; [then-branch: 106 | !(0 <= k@231@01) | live]
; [else-branch: 106 | 0 <= k@231@01 | live]
(push) ; 10
; [then-branch: 106 | !(0 <= k@231@01)]
(assert (not (<= 0 k@231@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 106 | 0 <= k@231@01]
(assert (<= 0 k@231@01))
; [eval] k < |cr|
; [eval] |cr|
(push) ; 11
; [then-branch: 107 | !(k@231@01 < |cr@174@01|) | live]
; [else-branch: 107 | k@231@01 < |cr@174@01| | live]
(push) ; 12
; [then-branch: 107 | !(k@231@01 < |cr@174@01|)]
(assert (not (< k@231@01 (Seq_length cr@174@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 107 | k@231@01 < |cr@174@01|]
(assert (< k@231@01 (Seq_length cr@174@01)))
; [eval] j != k
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@231@01 (Seq_length cr@174@01))
  (not (< k@231@01 (Seq_length cr@174@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@231@01)
  (and
    (<= 0 k@231@01)
    (or
      (< k@231@01 (Seq_length cr@174@01))
      (not (< k@231@01 (Seq_length cr@174@01)))))))
(assert (or (<= 0 k@231@01) (not (<= 0 k@231@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@230@01 (Seq_length cr@174@01))
  (and
    (< j@230@01 (Seq_length cr@174@01))
    (=>
      (<= 0 k@231@01)
      (and
        (<= 0 k@231@01)
        (or
          (< k@231@01 (Seq_length cr@174@01))
          (not (< k@231@01 (Seq_length cr@174@01))))))
    (or (<= 0 k@231@01) (not (<= 0 k@231@01))))))
(assert (or
  (< j@230@01 (Seq_length cr@174@01))
  (not (< j@230@01 (Seq_length cr@174@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@230@01)
  (and
    (<= 0 j@230@01)
    (=>
      (< j@230@01 (Seq_length cr@174@01))
      (and
        (< j@230@01 (Seq_length cr@174@01))
        (=>
          (<= 0 k@231@01)
          (and
            (<= 0 k@231@01)
            (or
              (< k@231@01 (Seq_length cr@174@01))
              (not (< k@231@01 (Seq_length cr@174@01))))))
        (or (<= 0 k@231@01) (not (<= 0 k@231@01)))))
    (or
      (< j@230@01 (Seq_length cr@174@01))
      (not (< j@230@01 (Seq_length cr@174@01)))))))
(assert (or (<= 0 j@230@01) (not (<= 0 j@230@01))))
(push) ; 5
; [then-branch: 108 | 0 <= j@230@01 && j@230@01 < |cr@174@01| && 0 <= k@231@01 && k@231@01 < |cr@174@01| && j@230@01 != k@231@01 | live]
; [else-branch: 108 | !(0 <= j@230@01 && j@230@01 < |cr@174@01| && 0 <= k@231@01 && k@231@01 < |cr@174@01| && j@230@01 != k@231@01) | live]
(push) ; 6
; [then-branch: 108 | 0 <= j@230@01 && j@230@01 < |cr@174@01| && 0 <= k@231@01 && k@231@01 < |cr@174@01| && j@230@01 != k@231@01]
(assert (and
  (<= 0 j@230@01)
  (and
    (< j@230@01 (Seq_length cr@174@01))
    (and
      (<= 0 k@231@01)
      (and (< k@231@01 (Seq_length cr@174@01)) (not (= j@230@01 k@231@01)))))))
; [eval] cr[j] != cr[k]
; [eval] cr[j]
(push) ; 7
(assert (not (>= j@230@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] cr[k]
(push) ; 7
(assert (not (>= k@231@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 108 | !(0 <= j@230@01 && j@230@01 < |cr@174@01| && 0 <= k@231@01 && k@231@01 < |cr@174@01| && j@230@01 != k@231@01)]
(assert (not
  (and
    (<= 0 j@230@01)
    (and
      (< j@230@01 (Seq_length cr@174@01))
      (and
        (<= 0 k@231@01)
        (and (< k@231@01 (Seq_length cr@174@01)) (not (= j@230@01 k@231@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@230@01)
    (and
      (< j@230@01 (Seq_length cr@174@01))
      (and
        (<= 0 k@231@01)
        (and (< k@231@01 (Seq_length cr@174@01)) (not (= j@230@01 k@231@01))))))
  (and
    (<= 0 j@230@01)
    (< j@230@01 (Seq_length cr@174@01))
    (<= 0 k@231@01)
    (< k@231@01 (Seq_length cr@174@01))
    (not (= j@230@01 k@231@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@230@01)
      (and
        (< j@230@01 (Seq_length cr@174@01))
        (and
          (<= 0 k@231@01)
          (and (< k@231@01 (Seq_length cr@174@01)) (not (= j@230@01 k@231@01)))))))
  (and
    (<= 0 j@230@01)
    (and
      (< j@230@01 (Seq_length cr@174@01))
      (and
        (<= 0 k@231@01)
        (and (< k@231@01 (Seq_length cr@174@01)) (not (= j@230@01 k@231@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@230@01 Int) (k@231@01 Int)) (!
  (and
    (=>
      (<= 0 j@230@01)
      (and
        (<= 0 j@230@01)
        (=>
          (< j@230@01 (Seq_length cr@174@01))
          (and
            (< j@230@01 (Seq_length cr@174@01))
            (=>
              (<= 0 k@231@01)
              (and
                (<= 0 k@231@01)
                (or
                  (< k@231@01 (Seq_length cr@174@01))
                  (not (< k@231@01 (Seq_length cr@174@01))))))
            (or (<= 0 k@231@01) (not (<= 0 k@231@01)))))
        (or
          (< j@230@01 (Seq_length cr@174@01))
          (not (< j@230@01 (Seq_length cr@174@01))))))
    (or (<= 0 j@230@01) (not (<= 0 j@230@01)))
    (=>
      (and
        (<= 0 j@230@01)
        (and
          (< j@230@01 (Seq_length cr@174@01))
          (and
            (<= 0 k@231@01)
            (and (< k@231@01 (Seq_length cr@174@01)) (not (= j@230@01 k@231@01))))))
      (and
        (<= 0 j@230@01)
        (< j@230@01 (Seq_length cr@174@01))
        (<= 0 k@231@01)
        (< k@231@01 (Seq_length cr@174@01))
        (not (= j@230@01 k@231@01))))
    (or
      (not
        (and
          (<= 0 j@230@01)
          (and
            (< j@230@01 (Seq_length cr@174@01))
            (and
              (<= 0 k@231@01)
              (and
                (< k@231@01 (Seq_length cr@174@01))
                (not (= j@230@01 k@231@01)))))))
      (and
        (<= 0 j@230@01)
        (and
          (< j@230@01 (Seq_length cr@174@01))
          (and
            (<= 0 k@231@01)
            (and (< k@231@01 (Seq_length cr@174@01)) (not (= j@230@01 k@231@01))))))))
  :pattern ((Seq_index cr@174@01 j@230@01) (Seq_index cr@174@01 k@231@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106-aux|)))
(push) ; 4
(assert (not (forall ((j@230@01 Int) (k@231@01 Int)) (!
  (=>
    (and
      (<= 0 j@230@01)
      (and
        (< j@230@01 (Seq_length cr@174@01))
        (and
          (<= 0 k@231@01)
          (and (< k@231@01 (Seq_length cr@174@01)) (not (= j@230@01 k@231@01))))))
    (not (= (Seq_index cr@174@01 j@230@01) (Seq_index cr@174@01 k@231@01))))
  :pattern ((Seq_index cr@174@01 j@230@01) (Seq_index cr@174@01 k@231@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@230@01 Int) (k@231@01 Int)) (!
  (=>
    (and
      (<= 0 j@230@01)
      (and
        (< j@230@01 (Seq_length cr@174@01))
        (and
          (<= 0 k@231@01)
          (and (< k@231@01 (Seq_length cr@174@01)) (not (= j@230@01 k@231@01))))))
    (not (= (Seq_index cr@174@01 j@230@01) (Seq_index cr@174@01 k@231@01))))
  :pattern ((Seq_index cr@174@01 j@230@01) (Seq_index cr@174@01 k@231@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106|)))
(declare-const i@232@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 109 | !(0 <= i@232@01) | live]
; [else-branch: 109 | 0 <= i@232@01 | live]
(push) ; 6
; [then-branch: 109 | !(0 <= i@232@01)]
(assert (not (<= 0 i@232@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 109 | 0 <= i@232@01]
(assert (<= 0 i@232@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@232@01) (not (<= 0 i@232@01))))
(assert (and (<= 0 i@232@01) (< i@232@01 len@175@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@232@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@232@01 (Seq_length cr@174@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@233@01 ($Ref) Int)
(declare-fun img@234@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@232@01 Int)) (!
  (=>
    (and (<= 0 i@232@01) (< i@232@01 len@175@01))
    (or (<= 0 i@232@01) (not (<= 0 i@232@01))))
  :pattern ((Seq_index cr@174@01 i@232@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@232@01 Int) (i2@232@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@232@01) (< i1@232@01 len@175@01))
      (and (<= 0 i2@232@01) (< i2@232@01 len@175@01))
      (= (Seq_index cr@174@01 i1@232@01) (Seq_index cr@174@01 i2@232@01)))
    (= i1@232@01 i2@232@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@232@01 Int)) (!
  (=>
    (and (<= 0 i@232@01) (< i@232@01 len@175@01))
    (and
      (= (inv@233@01 (Seq_index cr@174@01 i@232@01)) i@232@01)
      (img@234@01 (Seq_index cr@174@01 i@232@01))))
  :pattern ((Seq_index cr@174@01 i@232@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@234@01 r)
      (and (<= 0 (inv@233@01 r)) (< (inv@233@01 r) len@175@01)))
    (= (Seq_index cr@174@01 (inv@233@01 r)) r))
  :pattern ((inv@233@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@235@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@233@01 r)) (< (inv@233@01 r) len@175@01))
      (img@234@01 r)
      (= r (Seq_index cr@174@01 (inv@233@01 r))))
    ($Perm.min
      (ite
        (and
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
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
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@235@01 r))
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
      (and (<= 0 (inv@233@01 r)) (< (inv@233@01 r) len@175@01))
      (img@234@01 r)
      (= r (Seq_index cr@174@01 (inv@233@01 r))))
    (= (- $Perm.Write (pTaken@235@01 r)) $Perm.No))
  
  :qid |quant-u-135|))))
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
      (img@191@01 r)
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@236@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@236@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r))
  :qid |qp.fvfValDef11|)))
(declare-const $t@237@01 $Snap)
(assert (= $t@237@01 ($Snap.combine ($Snap.first $t@237@01) ($Snap.second $t@237@01))))
(assert (= ($Snap.first $t@237@01) $Snap.unit))
; [eval] 0 < len ==> |ar| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@175@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 110 | 0 < len@175@01 | live]
; [else-branch: 110 | !(0 < len@175@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 110 | 0 < len@175@01]
; [eval] |ar| == len
; [eval] |ar|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second $t@237@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@237@01))
    ($Snap.second ($Snap.second $t@237@01)))))
(declare-const i@238@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 111 | !(0 <= i@238@01) | live]
; [else-branch: 111 | 0 <= i@238@01 | live]
(push) ; 6
; [then-branch: 111 | !(0 <= i@238@01)]
(assert (not (<= 0 i@238@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 111 | 0 <= i@238@01]
(assert (<= 0 i@238@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@238@01) (not (<= 0 i@238@01))))
(assert (and (<= 0 i@238@01) (< i@238@01 len@175@01)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@238@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@238@01 (Seq_length ar@172@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@239@01 ($Ref) Int)
(declare-fun img@240@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@238@01 Int)) (!
  (=>
    (and (<= 0 i@238@01) (< i@238@01 len@175@01))
    (or (<= 0 i@238@01) (not (<= 0 i@238@01))))
  :pattern ((Seq_index ar@172@01 i@238@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@238@01 Int) (i2@238@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@238@01) (< i1@238@01 len@175@01))
      (and (<= 0 i2@238@01) (< i2@238@01 len@175@01))
      (= (Seq_index ar@172@01 i1@238@01) (Seq_index ar@172@01 i2@238@01)))
    (= i1@238@01 i2@238@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@238@01 Int)) (!
  (=>
    (and (<= 0 i@238@01) (< i@238@01 len@175@01))
    (and
      (= (inv@239@01 (Seq_index ar@172@01 i@238@01)) i@238@01)
      (img@240@01 (Seq_index ar@172@01 i@238@01))))
  :pattern ((Seq_index ar@172@01 i@238@01))
  :qid |quant-u-137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@240@01 r)
      (and (<= 0 (inv@239@01 r)) (< (inv@239@01 r) len@175@01)))
    (= (Seq_index ar@172@01 (inv@239@01 r)) r))
  :pattern ((inv@239@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@238@01 Int)) (!
  (=>
    (and (<= 0 i@238@01) (< i@238@01 len@175@01))
    (not (= (Seq_index ar@172@01 i@238@01) $Ref.null)))
  :pattern ((Seq_index ar@172@01 i@238@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@237@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@237@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@237@01))) $Snap.unit))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@175@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 112 | 0 < len@175@01 | live]
; [else-branch: 112 | !(0 < len@175@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 112 | 0 < len@175@01]
; [eval] |br| == len
; [eval] |br|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@237@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))))
(declare-const i@241@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 113 | !(0 <= i@241@01) | live]
; [else-branch: 113 | 0 <= i@241@01 | live]
(push) ; 6
; [then-branch: 113 | !(0 <= i@241@01)]
(assert (not (<= 0 i@241@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 113 | 0 <= i@241@01]
(assert (<= 0 i@241@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@241@01) (not (<= 0 i@241@01))))
(assert (and (<= 0 i@241@01) (< i@241@01 len@175@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@241@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@241@01 (Seq_length br@173@01))))
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
    (and (<= 0 i@241@01) (< i@241@01 len@175@01))
    (or (<= 0 i@241@01) (not (<= 0 i@241@01))))
  :pattern ((Seq_index br@173@01 i@241@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@241@01 Int) (i2@241@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@241@01) (< i1@241@01 len@175@01))
      (and (<= 0 i2@241@01) (< i2@241@01 len@175@01))
      (= (Seq_index br@173@01 i1@241@01) (Seq_index br@173@01 i2@241@01)))
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
    (and (<= 0 i@241@01) (< i@241@01 len@175@01))
    (and
      (= (inv@242@01 (Seq_index br@173@01 i@241@01)) i@241@01)
      (img@243@01 (Seq_index br@173@01 i@241@01))))
  :pattern ((Seq_index br@173@01 i@241@01))
  :qid |quant-u-139|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@243@01 r)
      (and (<= 0 (inv@242@01 r)) (< (inv@242@01 r) len@175@01)))
    (= (Seq_index br@173@01 (inv@242@01 r)) r))
  :pattern ((inv@242@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@241@01 Int)) (!
  (=>
    (and (<= 0 i@241@01) (< i@241@01 len@175@01))
    (not (= (Seq_index br@173@01 i@241@01) $Ref.null)))
  :pattern ((Seq_index br@173@01 i@241@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@173@01 i@241@01) (Seq_index ar@172@01 i@238@01))
    (=
      (and
        (img@243@01 r)
        (and (<= 0 (inv@242@01 r)) (< (inv@242@01 r) len@175@01)))
      (and
        (img@240@01 r)
        (and (<= 0 (inv@239@01 r)) (< (inv@239@01 r) len@175@01)))))
  
  :qid |quant-u-140|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))
  $Snap.unit))
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 len@175@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 114 | 0 < len@175@01 | live]
; [else-branch: 114 | !(0 < len@175@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 114 | 0 < len@175@01]
; [eval] |cr| == len
; [eval] |cr|
(pop) ; 5
(pop) ; 4
; Joined path conditions
(declare-const i@244@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 115 | !(0 <= i@244@01) | live]
; [else-branch: 115 | 0 <= i@244@01 | live]
(push) ; 6
; [then-branch: 115 | !(0 <= i@244@01)]
(assert (not (<= 0 i@244@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 115 | 0 <= i@244@01]
(assert (<= 0 i@244@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@244@01) (not (<= 0 i@244@01))))
(assert (and (<= 0 i@244@01) (< i@244@01 len@175@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@244@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@244@01 (Seq_length cr@174@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@245@01 ($Ref) Int)
(declare-fun img@246@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@244@01 Int)) (!
  (=>
    (and (<= 0 i@244@01) (< i@244@01 len@175@01))
    (or (<= 0 i@244@01) (not (<= 0 i@244@01))))
  :pattern ((Seq_index cr@174@01 i@244@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@244@01 Int) (i2@244@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@244@01) (< i1@244@01 len@175@01))
      (and (<= 0 i2@244@01) (< i2@244@01 len@175@01))
      (= (Seq_index cr@174@01 i1@244@01) (Seq_index cr@174@01 i2@244@01)))
    (= i1@244@01 i2@244@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@244@01 Int)) (!
  (=>
    (and (<= 0 i@244@01) (< i@244@01 len@175@01))
    (and
      (= (inv@245@01 (Seq_index cr@174@01 i@244@01)) i@244@01)
      (img@246@01 (Seq_index cr@174@01 i@244@01))))
  :pattern ((Seq_index cr@174@01 i@244@01))
  :qid |quant-u-142|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@246@01 r)
      (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
    (= (Seq_index cr@174@01 (inv@245@01 r)) r))
  :pattern ((inv@245@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@244@01 Int)) (!
  (=>
    (and (<= 0 i@244@01) (< i@244@01 len@175@01))
    (not (= (Seq_index cr@174@01 i@244@01) $Ref.null)))
  :pattern ((Seq_index cr@174@01 i@244@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@174@01 i@244@01) (Seq_index br@173@01 i@241@01))
    (=
      (and
        (img@246@01 r)
        (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
      (and
        (img@243@01 r)
        (and (<= 0 (inv@242@01 r)) (< (inv@242@01 r) len@175@01)))))
  
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
    (= (Seq_index cr@174@01 i@244@01) (Seq_index ar@172@01 i@238@01))
    (=
      (and
        (img@246@01 r)
        (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
      (and
        (img@240@01 r)
        (and (<= 0 (inv@239@01 r)) (< (inv@239@01 r) len@175@01)))))
  
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
; [eval] |ar| == len
; [eval] |ar|
(declare-const i@247@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 116 | !(0 <= i@247@01) | live]
; [else-branch: 116 | 0 <= i@247@01 | live]
(push) ; 6
; [then-branch: 116 | !(0 <= i@247@01)]
(assert (not (<= 0 i@247@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 116 | 0 <= i@247@01]
(assert (<= 0 i@247@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@247@01) (not (<= 0 i@247@01))))
(assert (and (<= 0 i@247@01) (< i@247@01 len@175@01)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@247@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@247@01 (Seq_length ar@172@01))))
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
    (and (<= 0 i@247@01) (< i@247@01 len@175@01))
    (or (<= 0 i@247@01) (not (<= 0 i@247@01))))
  :pattern ((Seq_index ar@172@01 i@247@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@247@01 Int) (i2@247@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@247@01) (< i1@247@01 len@175@01))
      (and (<= 0 i2@247@01) (< i2@247@01 len@175@01))
      (= (Seq_index ar@172@01 i1@247@01) (Seq_index ar@172@01 i2@247@01)))
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
    (and (<= 0 i@247@01) (< i@247@01 len@175@01))
    (and
      (= (inv@248@01 (Seq_index ar@172@01 i@247@01)) i@247@01)
      (img@249@01 (Seq_index ar@172@01 i@247@01))))
  :pattern ((Seq_index ar@172@01 i@247@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@249@01 r)
      (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) len@175@01)))
    (= (Seq_index ar@172@01 (inv@248@01 r)) r))
  :pattern ((inv@248@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@247@01 Int)) (!
  (= (Seq_index ar@172@01 i@247@01) (Seq_index br@173@01 i@247@01))
  
  :qid |quant-u-146|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@247@01 Int)) (!
  (= (Seq_index ar@172@01 i@247@01) (Seq_index cr@174@01 i@247@01))
  
  :qid |quant-u-147|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@250@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) len@175@01))
      (img@249@01 r)
      (= r (Seq_index ar@172@01 (inv@248@01 r))))
    ($Perm.min
      (ite
        (and
          (img@240@01 r)
          (and (<= 0 (inv@239@01 r)) (< (inv@239@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@251@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) len@175@01))
      (img@249@01 r)
      (= r (Seq_index ar@172@01 (inv@248@01 r))))
    ($Perm.min
      (ite
        (and
          (img@243@01 r)
          (and (<= 0 (inv@242@01 r)) (< (inv@242@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@250@01 r)))
    $Perm.No))
(define-fun pTaken@252@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) len@175@01))
      (img@249@01 r)
      (= r (Seq_index ar@172@01 (inv@248@01 r))))
    ($Perm.min
      (ite
        (and
          (img@246@01 r)
          (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@250@01 r)) (pTaken@251@01 r)))
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
          (img@240@01 r)
          (and (<= 0 (inv@239@01 r)) (< (inv@239@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@250@01 r))
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
      (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) len@175@01))
      (img@249@01 r)
      (= r (Seq_index ar@172@01 (inv@248@01 r))))
    (= (- $Perm.Write (pTaken@250@01 r)) $Perm.No))
  
  :qid |quant-u-150|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@253@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@240@01 r)
      (and (<= 0 (inv@239@01 r)) (< (inv@239@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@253@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@237@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@253@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@237@01))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@243@01 r)
      (and (<= 0 (inv@242@01 r)) (< (inv@242@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@253@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@253@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@246@01 r)
      (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@253@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@253@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))) r))
  :qid |qp.fvfValDef14|)))
; [eval] |br| == len
; [eval] |br|
(declare-const i@254@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 117 | !(0 <= i@254@01) | live]
; [else-branch: 117 | 0 <= i@254@01 | live]
(push) ; 6
; [then-branch: 117 | !(0 <= i@254@01)]
(assert (not (<= 0 i@254@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 117 | 0 <= i@254@01]
(assert (<= 0 i@254@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@254@01) (not (<= 0 i@254@01))))
(assert (and (<= 0 i@254@01) (< i@254@01 len@175@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@254@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@254@01 (Seq_length br@173@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@255@01 ($Ref) Int)
(declare-fun img@256@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@254@01 Int)) (!
  (=>
    (and (<= 0 i@254@01) (< i@254@01 len@175@01))
    (or (<= 0 i@254@01) (not (<= 0 i@254@01))))
  :pattern ((Seq_index br@173@01 i@254@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@254@01 Int) (i2@254@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@254@01) (< i1@254@01 len@175@01))
      (and (<= 0 i2@254@01) (< i2@254@01 len@175@01))
      (= (Seq_index br@173@01 i1@254@01) (Seq_index br@173@01 i2@254@01)))
    (= i1@254@01 i2@254@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@254@01 Int)) (!
  (=>
    (and (<= 0 i@254@01) (< i@254@01 len@175@01))
    (and
      (= (inv@255@01 (Seq_index br@173@01 i@254@01)) i@254@01)
      (img@256@01 (Seq_index br@173@01 i@254@01))))
  :pattern ((Seq_index br@173@01 i@254@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@256@01 r)
      (and (<= 0 (inv@255@01 r)) (< (inv@255@01 r) len@175@01)))
    (= (Seq_index br@173@01 (inv@255@01 r)) r))
  :pattern ((inv@255@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@254@01 Int)) (!
  (= (Seq_index br@173@01 i@254@01) (Seq_index cr@174@01 i@254@01))
  
  :qid |quant-u-152|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@257@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@255@01 r)) (< (inv@255@01 r) len@175@01))
      (img@256@01 r)
      (= r (Seq_index br@173@01 (inv@255@01 r))))
    ($Perm.min
      (ite
        (and
          (img@243@01 r)
          (and (<= 0 (inv@242@01 r)) (< (inv@242@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@258@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@255@01 r)) (< (inv@255@01 r) len@175@01))
      (img@256@01 r)
      (= r (Seq_index br@173@01 (inv@255@01 r))))
    ($Perm.min
      (ite
        (and
          (img@246@01 r)
          (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@257@01 r)))
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
          (img@243@01 r)
          (and (<= 0 (inv@242@01 r)) (< (inv@242@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@257@01 r))
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
      (and (<= 0 (inv@255@01 r)) (< (inv@255@01 r) len@175@01))
      (img@256@01 r)
      (= r (Seq_index br@173@01 (inv@255@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@257@01 r)) $Perm.No))
  
  :qid |quant-u-155|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@259@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@246@01 r)
      (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@259@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@259@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@243@01 r)
      (and (<= 0 (inv@242@01 r)) (< (inv@242@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@259@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@259@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01))))) r))
  :qid |qp.fvfValDef16|)))
; [eval] |cr| == len
; [eval] |cr|
(declare-const i@260@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 118 | !(0 <= i@260@01) | live]
; [else-branch: 118 | 0 <= i@260@01 | live]
(push) ; 6
; [then-branch: 118 | !(0 <= i@260@01)]
(assert (not (<= 0 i@260@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 118 | 0 <= i@260@01]
(assert (<= 0 i@260@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@260@01) (not (<= 0 i@260@01))))
(assert (and (<= 0 i@260@01) (< i@260@01 len@175@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@260@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@260@01 (Seq_length cr@174@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@261@01 ($Ref) Int)
(declare-fun img@262@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@260@01 Int)) (!
  (=>
    (and (<= 0 i@260@01) (< i@260@01 len@175@01))
    (or (<= 0 i@260@01) (not (<= 0 i@260@01))))
  :pattern ((Seq_index cr@174@01 i@260@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@260@01 Int) (i2@260@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@260@01) (< i1@260@01 len@175@01))
      (and (<= 0 i2@260@01) (< i2@260@01 len@175@01))
      (= (Seq_index cr@174@01 i1@260@01) (Seq_index cr@174@01 i2@260@01)))
    (= i1@260@01 i2@260@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@260@01 Int)) (!
  (=>
    (and (<= 0 i@260@01) (< i@260@01 len@175@01))
    (and
      (= (inv@261@01 (Seq_index cr@174@01 i@260@01)) i@260@01)
      (img@262@01 (Seq_index cr@174@01 i@260@01))))
  :pattern ((Seq_index cr@174@01 i@260@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@262@01 r)
      (and (<= 0 (inv@261@01 r)) (< (inv@261@01 r) len@175@01)))
    (= (Seq_index cr@174@01 (inv@261@01 r)) r))
  :pattern ((inv@261@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@263@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@261@01 r)) (< (inv@261@01 r) len@175@01))
      (img@262@01 r)
      (= r (Seq_index cr@174@01 (inv@261@01 r))))
    ($Perm.min
      (ite
        (and
          (img@246@01 r)
          (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
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
          (img@246@01 r)
          (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@263@01 r))
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
      (and (<= 0 (inv@261@01 r)) (< (inv@261@01 r) len@175@01))
      (img@262@01 r)
      (= r (Seq_index cr@174@01 (inv@261@01 r))))
    (= (- $Perm.Write (pTaken@263@01 r)) $Perm.No))
  
  :qid |quant-u-159|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@264@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@246@01 r)
      (and (<= 0 (inv@245@01 r)) (< (inv@245@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@264@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@264@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))) r))
  :qid |qp.fvfValDef17|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 93 | !(0 < len@175@01)]
(assert (not (< 0 len@175@01)))
(declare-const i@265@01 Int)
(push) ; 4
; [eval] 1 <= i && i < (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] 1 <= i
(push) ; 5
; [then-branch: 119 | !(1 <= i@265@01) | live]
; [else-branch: 119 | 1 <= i@265@01 | live]
(push) ; 6
; [then-branch: 119 | !(1 <= i@265@01)]
(assert (not (<= 1 i@265@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 119 | 1 <= i@265@01]
(assert (<= 1 i@265@01))
; [eval] i < (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] (|ar| - 1 < len ? |ar| - 1 : len) + 1
; [eval] (|ar| - 1 < len ? |ar| - 1 : len)
; [eval] |ar| - 1 < len
; [eval] |ar| - 1
; [eval] |ar|
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length ar@172@01) 1) len@175@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- (Seq_length ar@172@01) 1) len@175@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 120 | |ar@172@01| - 1 < len@175@01 | live]
; [else-branch: 120 | !(|ar@172@01| - 1 < len@175@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 120 | |ar@172@01| - 1 < len@175@01]
(assert (< (- (Seq_length ar@172@01) 1) len@175@01))
; [eval] |ar| - 1
; [eval] |ar|
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- (Seq_length ar@172@01) 1) len@175@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@265@01)
  (and (<= 1 i@265@01) (< (- (Seq_length ar@172@01) 1) len@175@01))))
(assert (or (<= 1 i@265@01) (not (<= 1 i@265@01))))
(assert (and (<= 1 i@265@01) (< i@265@01 (+ (- (Seq_length ar@172@01) 1) 1))))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@265@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@265@01 (Seq_length ar@172@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@266@01 ($Ref) Int)
(declare-fun img@267@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@265@01 Int)) (!
  (=>
    (and (<= 1 i@265@01) (< i@265@01 (+ (- (Seq_length ar@172@01) 1) 1)))
    (and
      (=>
        (<= 1 i@265@01)
        (and (<= 1 i@265@01) (< (- (Seq_length ar@172@01) 1) len@175@01)))
      (or (<= 1 i@265@01) (not (<= 1 i@265@01)))))
  :pattern ((Seq_index ar@172@01 i@265@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@265@01 Int) (i2@265@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@265@01) (< i1@265@01 (+ (- (Seq_length ar@172@01) 1) 1)))
      (and (<= 1 i2@265@01) (< i2@265@01 (+ (- (Seq_length ar@172@01) 1) 1)))
      (= (Seq_index ar@172@01 i1@265@01) (Seq_index ar@172@01 i2@265@01)))
    (= i1@265@01 i2@265@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@265@01 Int)) (!
  (=>
    (and (<= 1 i@265@01) (< i@265@01 (+ (- (Seq_length ar@172@01) 1) 1)))
    (and
      (= (inv@266@01 (Seq_index ar@172@01 i@265@01)) i@265@01)
      (img@267@01 (Seq_index ar@172@01 i@265@01))))
  :pattern ((Seq_index ar@172@01 i@265@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@267@01 r)
      (and
        (<= 1 (inv@266@01 r))
        (< (inv@266@01 r) (+ (- (Seq_length ar@172@01) 1) 1))))
    (= (Seq_index ar@172@01 (inv@266@01 r)) r))
  :pattern ((inv@266@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@265@01 Int)) (!
  (= (Seq_index ar@172@01 i@265@01) (Seq_index cr@174@01 i@265@01))
  
  :qid |quant-u-161|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@265@01 Int)) (!
  (= (Seq_index ar@172@01 i@265@01) (Seq_index br@173@01 i@265@01))
  
  :qid |quant-u-162|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@268@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@266@01 r))
        (< (inv@266@01 r) (+ (- (Seq_length ar@172@01) 1) 1)))
      (img@267@01 r)
      (= r (Seq_index ar@172@01 (inv@266@01 r))))
    ($Perm.min
      (ite
        (and
          (img@191@01 r)
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@269@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@266@01 r))
        (< (inv@266@01 r) (+ (- (Seq_length ar@172@01) 1) 1)))
      (img@267@01 r)
      (= r (Seq_index ar@172@01 (inv@266@01 r))))
    ($Perm.min
      (ite
        (and
          (img@186@01 r)
          (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@268@01 r)))
    $Perm.No))
(define-fun pTaken@270@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@266@01 r))
        (< (inv@266@01 r) (+ (- (Seq_length ar@172@01) 1) 1)))
      (img@267@01 r)
      (= r (Seq_index ar@172@01 (inv@266@01 r))))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
        (- $Perm.Write (pTaken@207@01 r))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@268@01 r)) (pTaken@269@01 r)))
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
          (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@268@01 r))
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
        (<= 1 (inv@266@01 r))
        (< (inv@266@01 r) (+ (- (Seq_length ar@172@01) 1) 1)))
      (img@267@01 r)
      (= r (Seq_index ar@172@01 (inv@266@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@268@01 r)) $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@271@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@191@01 r)
      (and (<= 0 (inv@190@01 r)) (< (inv@190@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@271@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@271@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@186@01 r)
      (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@271@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@271@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
      (< $Perm.No (- $Perm.Write (pTaken@207@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@271@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@271@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))) r))
  :qid |qp.fvfValDef20|)))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 121 | 0 < len@175@01 | dead]
; [else-branch: 121 | !(0 < len@175@01) | live]
(push) ; 5
; [else-branch: 121 | !(0 < len@175@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] (forall j: Int, k: Int :: { br[j], br[k] } 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k])
(declare-const j@272@01 Int)
(declare-const k@273@01 Int)
(push) ; 4
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k))) ==> br[j] != br[k]
; [eval] 0 <= j && (j < |br| && (0 <= k && (k < |br| && j != k)))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 122 | !(0 <= j@272@01) | live]
; [else-branch: 122 | 0 <= j@272@01 | live]
(push) ; 6
; [then-branch: 122 | !(0 <= j@272@01)]
(assert (not (<= 0 j@272@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 122 | 0 <= j@272@01]
(assert (<= 0 j@272@01))
; [eval] j < |br|
; [eval] |br|
(push) ; 7
; [then-branch: 123 | !(j@272@01 < |br@173@01|) | live]
; [else-branch: 123 | j@272@01 < |br@173@01| | live]
(push) ; 8
; [then-branch: 123 | !(j@272@01 < |br@173@01|)]
(assert (not (< j@272@01 (Seq_length br@173@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 123 | j@272@01 < |br@173@01|]
(assert (< j@272@01 (Seq_length br@173@01)))
; [eval] 0 <= k
(push) ; 9
; [then-branch: 124 | !(0 <= k@273@01) | live]
; [else-branch: 124 | 0 <= k@273@01 | live]
(push) ; 10
; [then-branch: 124 | !(0 <= k@273@01)]
(assert (not (<= 0 k@273@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 124 | 0 <= k@273@01]
(assert (<= 0 k@273@01))
; [eval] k < |br|
; [eval] |br|
(push) ; 11
; [then-branch: 125 | !(k@273@01 < |br@173@01|) | live]
; [else-branch: 125 | k@273@01 < |br@173@01| | live]
(push) ; 12
; [then-branch: 125 | !(k@273@01 < |br@173@01|)]
(assert (not (< k@273@01 (Seq_length br@173@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 125 | k@273@01 < |br@173@01|]
(assert (< k@273@01 (Seq_length br@173@01)))
; [eval] j != k
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@273@01 (Seq_length br@173@01))
  (not (< k@273@01 (Seq_length br@173@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@273@01)
  (and
    (<= 0 k@273@01)
    (or
      (< k@273@01 (Seq_length br@173@01))
      (not (< k@273@01 (Seq_length br@173@01)))))))
(assert (or (<= 0 k@273@01) (not (<= 0 k@273@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@272@01 (Seq_length br@173@01))
  (and
    (< j@272@01 (Seq_length br@173@01))
    (=>
      (<= 0 k@273@01)
      (and
        (<= 0 k@273@01)
        (or
          (< k@273@01 (Seq_length br@173@01))
          (not (< k@273@01 (Seq_length br@173@01))))))
    (or (<= 0 k@273@01) (not (<= 0 k@273@01))))))
(assert (or
  (< j@272@01 (Seq_length br@173@01))
  (not (< j@272@01 (Seq_length br@173@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@272@01)
  (and
    (<= 0 j@272@01)
    (=>
      (< j@272@01 (Seq_length br@173@01))
      (and
        (< j@272@01 (Seq_length br@173@01))
        (=>
          (<= 0 k@273@01)
          (and
            (<= 0 k@273@01)
            (or
              (< k@273@01 (Seq_length br@173@01))
              (not (< k@273@01 (Seq_length br@173@01))))))
        (or (<= 0 k@273@01) (not (<= 0 k@273@01)))))
    (or
      (< j@272@01 (Seq_length br@173@01))
      (not (< j@272@01 (Seq_length br@173@01)))))))
(assert (or (<= 0 j@272@01) (not (<= 0 j@272@01))))
(push) ; 5
; [then-branch: 126 | 0 <= j@272@01 && j@272@01 < |br@173@01| && 0 <= k@273@01 && k@273@01 < |br@173@01| && j@272@01 != k@273@01 | live]
; [else-branch: 126 | !(0 <= j@272@01 && j@272@01 < |br@173@01| && 0 <= k@273@01 && k@273@01 < |br@173@01| && j@272@01 != k@273@01) | live]
(push) ; 6
; [then-branch: 126 | 0 <= j@272@01 && j@272@01 < |br@173@01| && 0 <= k@273@01 && k@273@01 < |br@173@01| && j@272@01 != k@273@01]
(assert (and
  (<= 0 j@272@01)
  (and
    (< j@272@01 (Seq_length br@173@01))
    (and
      (<= 0 k@273@01)
      (and (< k@273@01 (Seq_length br@173@01)) (not (= j@272@01 k@273@01)))))))
; [eval] br[j] != br[k]
; [eval] br[j]
(push) ; 7
(assert (not (>= j@272@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] br[k]
(push) ; 7
(assert (not (>= k@273@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 126 | !(0 <= j@272@01 && j@272@01 < |br@173@01| && 0 <= k@273@01 && k@273@01 < |br@173@01| && j@272@01 != k@273@01)]
(assert (not
  (and
    (<= 0 j@272@01)
    (and
      (< j@272@01 (Seq_length br@173@01))
      (and
        (<= 0 k@273@01)
        (and (< k@273@01 (Seq_length br@173@01)) (not (= j@272@01 k@273@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@272@01)
    (and
      (< j@272@01 (Seq_length br@173@01))
      (and
        (<= 0 k@273@01)
        (and (< k@273@01 (Seq_length br@173@01)) (not (= j@272@01 k@273@01))))))
  (and
    (<= 0 j@272@01)
    (< j@272@01 (Seq_length br@173@01))
    (<= 0 k@273@01)
    (< k@273@01 (Seq_length br@173@01))
    (not (= j@272@01 k@273@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@272@01)
      (and
        (< j@272@01 (Seq_length br@173@01))
        (and
          (<= 0 k@273@01)
          (and (< k@273@01 (Seq_length br@173@01)) (not (= j@272@01 k@273@01)))))))
  (and
    (<= 0 j@272@01)
    (and
      (< j@272@01 (Seq_length br@173@01))
      (and
        (<= 0 k@273@01)
        (and (< k@273@01 (Seq_length br@173@01)) (not (= j@272@01 k@273@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@272@01 Int) (k@273@01 Int)) (!
  (and
    (=>
      (<= 0 j@272@01)
      (and
        (<= 0 j@272@01)
        (=>
          (< j@272@01 (Seq_length br@173@01))
          (and
            (< j@272@01 (Seq_length br@173@01))
            (=>
              (<= 0 k@273@01)
              (and
                (<= 0 k@273@01)
                (or
                  (< k@273@01 (Seq_length br@173@01))
                  (not (< k@273@01 (Seq_length br@173@01))))))
            (or (<= 0 k@273@01) (not (<= 0 k@273@01)))))
        (or
          (< j@272@01 (Seq_length br@173@01))
          (not (< j@272@01 (Seq_length br@173@01))))))
    (or (<= 0 j@272@01) (not (<= 0 j@272@01)))
    (=>
      (and
        (<= 0 j@272@01)
        (and
          (< j@272@01 (Seq_length br@173@01))
          (and
            (<= 0 k@273@01)
            (and (< k@273@01 (Seq_length br@173@01)) (not (= j@272@01 k@273@01))))))
      (and
        (<= 0 j@272@01)
        (< j@272@01 (Seq_length br@173@01))
        (<= 0 k@273@01)
        (< k@273@01 (Seq_length br@173@01))
        (not (= j@272@01 k@273@01))))
    (or
      (not
        (and
          (<= 0 j@272@01)
          (and
            (< j@272@01 (Seq_length br@173@01))
            (and
              (<= 0 k@273@01)
              (and
                (< k@273@01 (Seq_length br@173@01))
                (not (= j@272@01 k@273@01)))))))
      (and
        (<= 0 j@272@01)
        (and
          (< j@272@01 (Seq_length br@173@01))
          (and
            (<= 0 k@273@01)
            (and (< k@273@01 (Seq_length br@173@01)) (not (= j@272@01 k@273@01))))))))
  :pattern ((Seq_index br@173@01 j@272@01) (Seq_index br@173@01 k@273@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106-aux|)))
(push) ; 4
(assert (not (forall ((j@272@01 Int) (k@273@01 Int)) (!
  (=>
    (and
      (<= 0 j@272@01)
      (and
        (< j@272@01 (Seq_length br@173@01))
        (and
          (<= 0 k@273@01)
          (and (< k@273@01 (Seq_length br@173@01)) (not (= j@272@01 k@273@01))))))
    (not (= (Seq_index br@173@01 j@272@01) (Seq_index br@173@01 k@273@01))))
  :pattern ((Seq_index br@173@01 j@272@01) (Seq_index br@173@01 k@273@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@272@01 Int) (k@273@01 Int)) (!
  (=>
    (and
      (<= 0 j@272@01)
      (and
        (< j@272@01 (Seq_length br@173@01))
        (and
          (<= 0 k@273@01)
          (and (< k@273@01 (Seq_length br@173@01)) (not (= j@272@01 k@273@01))))))
    (not (= (Seq_index br@173@01 j@272@01) (Seq_index br@173@01 k@273@01))))
  :pattern ((Seq_index br@173@01 j@272@01) (Seq_index br@173@01 k@273@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@67@12@67@106|)))
(declare-const i@274@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 127 | !(0 <= i@274@01) | live]
; [else-branch: 127 | 0 <= i@274@01 | live]
(push) ; 6
; [then-branch: 127 | !(0 <= i@274@01)]
(assert (not (<= 0 i@274@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 127 | 0 <= i@274@01]
(assert (<= 0 i@274@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@274@01) (not (<= 0 i@274@01))))
(assert (and (<= 0 i@274@01) (< i@274@01 len@175@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@274@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@274@01 (Seq_length br@173@01))))
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
    (and (<= 0 i@274@01) (< i@274@01 len@175@01))
    (or (<= 0 i@274@01) (not (<= 0 i@274@01))))
  :pattern ((Seq_index br@173@01 i@274@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@274@01 Int) (i2@274@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@274@01) (< i1@274@01 len@175@01))
      (and (<= 0 i2@274@01) (< i2@274@01 len@175@01))
      (= (Seq_index br@173@01 i1@274@01) (Seq_index br@173@01 i2@274@01)))
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
    (and (<= 0 i@274@01) (< i@274@01 len@175@01))
    (and
      (= (inv@275@01 (Seq_index br@173@01 i@274@01)) i@274@01)
      (img@276@01 (Seq_index br@173@01 i@274@01))))
  :pattern ((Seq_index br@173@01 i@274@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@276@01 r)
      (and (<= 0 (inv@275@01 r)) (< (inv@275@01 r) len@175@01)))
    (= (Seq_index br@173@01 (inv@275@01 r)) r))
  :pattern ((inv@275@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@274@01 Int)) (!
  (= (Seq_index br@173@01 i@274@01) (Seq_index ar@172@01 i@274@01))
  
  :qid |quant-u-167|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@277@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@275@01 r)) (< (inv@275@01 r) len@175@01))
      (img@276@01 r)
      (= r (Seq_index br@173@01 (inv@275@01 r))))
    ($Perm.min
      (ite
        (and
          (img@181@01 r)
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
        (- $Perm.Write (pTaken@207@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@278@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@275@01 r)) (< (inv@275@01 r) len@175@01))
      (img@276@01 r)
      (= r (Seq_index br@173@01 (inv@275@01 r))))
    ($Perm.min
      (ite
        (and
          (img@186@01 r)
          (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@277@01 r)))
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
          (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
        (- $Perm.Write (pTaken@207@01 r))
        $Perm.No)
      (pTaken@277@01 r))
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
      (and (<= 0 (inv@275@01 r)) (< (inv@275@01 r) len@175@01))
      (img@276@01 r)
      (= r (Seq_index br@173@01 (inv@275@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@277@01 r)) $Perm.No))
  
  :qid |quant-u-170|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@279@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@181@01 r)
        (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) len@175@01)))
      (< $Perm.No (- $Perm.Write (pTaken@207@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@279@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@279@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@186@01 r)
      (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@279@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@279@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r))
  :qid |qp.fvfValDef22|)))
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 128 | 0 < len@175@01 | dead]
; [else-branch: 128 | !(0 < len@175@01) | live]
(push) ; 5
; [else-branch: 128 | !(0 < len@175@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] (forall j: Int, k: Int :: { cr[j], cr[k] } 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k])
(declare-const j@280@01 Int)
(declare-const k@281@01 Int)
(push) ; 4
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k))) ==> cr[j] != cr[k]
; [eval] 0 <= j && (j < |cr| && (0 <= k && (k < |cr| && j != k)))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 129 | !(0 <= j@280@01) | live]
; [else-branch: 129 | 0 <= j@280@01 | live]
(push) ; 6
; [then-branch: 129 | !(0 <= j@280@01)]
(assert (not (<= 0 j@280@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 129 | 0 <= j@280@01]
(assert (<= 0 j@280@01))
; [eval] j < |cr|
; [eval] |cr|
(push) ; 7
; [then-branch: 130 | !(j@280@01 < |cr@174@01|) | live]
; [else-branch: 130 | j@280@01 < |cr@174@01| | live]
(push) ; 8
; [then-branch: 130 | !(j@280@01 < |cr@174@01|)]
(assert (not (< j@280@01 (Seq_length cr@174@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 130 | j@280@01 < |cr@174@01|]
(assert (< j@280@01 (Seq_length cr@174@01)))
; [eval] 0 <= k
(push) ; 9
; [then-branch: 131 | !(0 <= k@281@01) | live]
; [else-branch: 131 | 0 <= k@281@01 | live]
(push) ; 10
; [then-branch: 131 | !(0 <= k@281@01)]
(assert (not (<= 0 k@281@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 131 | 0 <= k@281@01]
(assert (<= 0 k@281@01))
; [eval] k < |cr|
; [eval] |cr|
(push) ; 11
; [then-branch: 132 | !(k@281@01 < |cr@174@01|) | live]
; [else-branch: 132 | k@281@01 < |cr@174@01| | live]
(push) ; 12
; [then-branch: 132 | !(k@281@01 < |cr@174@01|)]
(assert (not (< k@281@01 (Seq_length cr@174@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 132 | k@281@01 < |cr@174@01|]
(assert (< k@281@01 (Seq_length cr@174@01)))
; [eval] j != k
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< k@281@01 (Seq_length cr@174@01))
  (not (< k@281@01 (Seq_length cr@174@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@281@01)
  (and
    (<= 0 k@281@01)
    (or
      (< k@281@01 (Seq_length cr@174@01))
      (not (< k@281@01 (Seq_length cr@174@01)))))))
(assert (or (<= 0 k@281@01) (not (<= 0 k@281@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@280@01 (Seq_length cr@174@01))
  (and
    (< j@280@01 (Seq_length cr@174@01))
    (=>
      (<= 0 k@281@01)
      (and
        (<= 0 k@281@01)
        (or
          (< k@281@01 (Seq_length cr@174@01))
          (not (< k@281@01 (Seq_length cr@174@01))))))
    (or (<= 0 k@281@01) (not (<= 0 k@281@01))))))
(assert (or
  (< j@280@01 (Seq_length cr@174@01))
  (not (< j@280@01 (Seq_length cr@174@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@280@01)
  (and
    (<= 0 j@280@01)
    (=>
      (< j@280@01 (Seq_length cr@174@01))
      (and
        (< j@280@01 (Seq_length cr@174@01))
        (=>
          (<= 0 k@281@01)
          (and
            (<= 0 k@281@01)
            (or
              (< k@281@01 (Seq_length cr@174@01))
              (not (< k@281@01 (Seq_length cr@174@01))))))
        (or (<= 0 k@281@01) (not (<= 0 k@281@01)))))
    (or
      (< j@280@01 (Seq_length cr@174@01))
      (not (< j@280@01 (Seq_length cr@174@01)))))))
(assert (or (<= 0 j@280@01) (not (<= 0 j@280@01))))
(push) ; 5
; [then-branch: 133 | 0 <= j@280@01 && j@280@01 < |cr@174@01| && 0 <= k@281@01 && k@281@01 < |cr@174@01| && j@280@01 != k@281@01 | live]
; [else-branch: 133 | !(0 <= j@280@01 && j@280@01 < |cr@174@01| && 0 <= k@281@01 && k@281@01 < |cr@174@01| && j@280@01 != k@281@01) | live]
(push) ; 6
; [then-branch: 133 | 0 <= j@280@01 && j@280@01 < |cr@174@01| && 0 <= k@281@01 && k@281@01 < |cr@174@01| && j@280@01 != k@281@01]
(assert (and
  (<= 0 j@280@01)
  (and
    (< j@280@01 (Seq_length cr@174@01))
    (and
      (<= 0 k@281@01)
      (and (< k@281@01 (Seq_length cr@174@01)) (not (= j@280@01 k@281@01)))))))
; [eval] cr[j] != cr[k]
; [eval] cr[j]
(push) ; 7
(assert (not (>= j@280@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] cr[k]
(push) ; 7
(assert (not (>= k@281@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 133 | !(0 <= j@280@01 && j@280@01 < |cr@174@01| && 0 <= k@281@01 && k@281@01 < |cr@174@01| && j@280@01 != k@281@01)]
(assert (not
  (and
    (<= 0 j@280@01)
    (and
      (< j@280@01 (Seq_length cr@174@01))
      (and
        (<= 0 k@281@01)
        (and (< k@281@01 (Seq_length cr@174@01)) (not (= j@280@01 k@281@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@280@01)
    (and
      (< j@280@01 (Seq_length cr@174@01))
      (and
        (<= 0 k@281@01)
        (and (< k@281@01 (Seq_length cr@174@01)) (not (= j@280@01 k@281@01))))))
  (and
    (<= 0 j@280@01)
    (< j@280@01 (Seq_length cr@174@01))
    (<= 0 k@281@01)
    (< k@281@01 (Seq_length cr@174@01))
    (not (= j@280@01 k@281@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@280@01)
      (and
        (< j@280@01 (Seq_length cr@174@01))
        (and
          (<= 0 k@281@01)
          (and (< k@281@01 (Seq_length cr@174@01)) (not (= j@280@01 k@281@01)))))))
  (and
    (<= 0 j@280@01)
    (and
      (< j@280@01 (Seq_length cr@174@01))
      (and
        (<= 0 k@281@01)
        (and (< k@281@01 (Seq_length cr@174@01)) (not (= j@280@01 k@281@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@280@01 Int) (k@281@01 Int)) (!
  (and
    (=>
      (<= 0 j@280@01)
      (and
        (<= 0 j@280@01)
        (=>
          (< j@280@01 (Seq_length cr@174@01))
          (and
            (< j@280@01 (Seq_length cr@174@01))
            (=>
              (<= 0 k@281@01)
              (and
                (<= 0 k@281@01)
                (or
                  (< k@281@01 (Seq_length cr@174@01))
                  (not (< k@281@01 (Seq_length cr@174@01))))))
            (or (<= 0 k@281@01) (not (<= 0 k@281@01)))))
        (or
          (< j@280@01 (Seq_length cr@174@01))
          (not (< j@280@01 (Seq_length cr@174@01))))))
    (or (<= 0 j@280@01) (not (<= 0 j@280@01)))
    (=>
      (and
        (<= 0 j@280@01)
        (and
          (< j@280@01 (Seq_length cr@174@01))
          (and
            (<= 0 k@281@01)
            (and (< k@281@01 (Seq_length cr@174@01)) (not (= j@280@01 k@281@01))))))
      (and
        (<= 0 j@280@01)
        (< j@280@01 (Seq_length cr@174@01))
        (<= 0 k@281@01)
        (< k@281@01 (Seq_length cr@174@01))
        (not (= j@280@01 k@281@01))))
    (or
      (not
        (and
          (<= 0 j@280@01)
          (and
            (< j@280@01 (Seq_length cr@174@01))
            (and
              (<= 0 k@281@01)
              (and
                (< k@281@01 (Seq_length cr@174@01))
                (not (= j@280@01 k@281@01)))))))
      (and
        (<= 0 j@280@01)
        (and
          (< j@280@01 (Seq_length cr@174@01))
          (and
            (<= 0 k@281@01)
            (and (< k@281@01 (Seq_length cr@174@01)) (not (= j@280@01 k@281@01))))))))
  :pattern ((Seq_index cr@174@01 j@280@01) (Seq_index cr@174@01 k@281@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106-aux|)))
(push) ; 4
(assert (not (forall ((j@280@01 Int) (k@281@01 Int)) (!
  (=>
    (and
      (<= 0 j@280@01)
      (and
        (< j@280@01 (Seq_length cr@174@01))
        (and
          (<= 0 k@281@01)
          (and (< k@281@01 (Seq_length cr@174@01)) (not (= j@280@01 k@281@01))))))
    (not (= (Seq_index cr@174@01 j@280@01) (Seq_index cr@174@01 k@281@01))))
  :pattern ((Seq_index cr@174@01 j@280@01) (Seq_index cr@174@01 k@281@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@280@01 Int) (k@281@01 Int)) (!
  (=>
    (and
      (<= 0 j@280@01)
      (and
        (< j@280@01 (Seq_length cr@174@01))
        (and
          (<= 0 k@281@01)
          (and (< k@281@01 (Seq_length cr@174@01)) (not (= j@280@01 k@281@01))))))
    (not (= (Seq_index cr@174@01 j@280@01) (Seq_index cr@174@01 k@281@01))))
  :pattern ((Seq_index cr@174@01 j@280@01) (Seq_index cr@174@01 k@281@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testDepParLoopBackE1.vpr@70@12@70@106|)))
(declare-const i@282@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 134 | !(0 <= i@282@01) | live]
; [else-branch: 134 | 0 <= i@282@01 | live]
(push) ; 6
; [then-branch: 134 | !(0 <= i@282@01)]
(assert (not (<= 0 i@282@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 134 | 0 <= i@282@01]
(assert (<= 0 i@282@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@282@01) (not (<= 0 i@282@01))))
(assert (and (<= 0 i@282@01) (< i@282@01 len@175@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@282@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@282@01 (Seq_length cr@174@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@283@01 ($Ref) Int)
(declare-fun img@284@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@282@01 Int)) (!
  (=>
    (and (<= 0 i@282@01) (< i@282@01 len@175@01))
    (or (<= 0 i@282@01) (not (<= 0 i@282@01))))
  :pattern ((Seq_index cr@174@01 i@282@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@282@01 Int) (i2@282@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@282@01) (< i1@282@01 len@175@01))
      (and (<= 0 i2@282@01) (< i2@282@01 len@175@01))
      (= (Seq_index cr@174@01 i1@282@01) (Seq_index cr@174@01 i2@282@01)))
    (= i1@282@01 i2@282@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@282@01 Int)) (!
  (=>
    (and (<= 0 i@282@01) (< i@282@01 len@175@01))
    (and
      (= (inv@283@01 (Seq_index cr@174@01 i@282@01)) i@282@01)
      (img@284@01 (Seq_index cr@174@01 i@282@01))))
  :pattern ((Seq_index cr@174@01 i@282@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@284@01 r)
      (and (<= 0 (inv@283@01 r)) (< (inv@283@01 r) len@175@01)))
    (= (Seq_index cr@174@01 (inv@283@01 r)) r))
  :pattern ((inv@283@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@282@01 Int)) (!
  (= (Seq_index cr@174@01 i@282@01) (Seq_index br@173@01 i@282@01))
  
  :qid |quant-u-172|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@285@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@283@01 r)) (< (inv@283@01 r) len@175@01))
      (img@284@01 r)
      (= r (Seq_index cr@174@01 (inv@283@01 r))))
    ($Perm.min
      (ite
        (and
          (img@186@01 r)
          (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
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
          (img@186@01 r)
          (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@285@01 r))
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
      (and (<= 0 (inv@283@01 r)) (< (inv@283@01 r) len@175@01))
      (img@284@01 r)
      (= r (Seq_index cr@174@01 (inv@283@01 r))))
    (= (- $Perm.Write (pTaken@285@01 r)) $Perm.No))
  
  :qid |quant-u-175|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@286@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@186@01 r)
      (and (<= 0 (inv@185@01 r)) (< (inv@185@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@286@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@286@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))) r))
  :qid |qp.fvfValDef23|)))
(declare-const $t@287@01 $Snap)
(assert (= $t@287@01 ($Snap.combine ($Snap.first $t@287@01) ($Snap.second $t@287@01))))
(assert (= ($Snap.first $t@287@01) $Snap.unit))
; [eval] 0 < len ==> |ar| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 135 | 0 < len@175@01 | dead]
; [else-branch: 135 | !(0 < len@175@01) | live]
(push) ; 5
; [else-branch: 135 | !(0 < len@175@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second $t@287@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@287@01))
    ($Snap.second ($Snap.second $t@287@01)))))
(declare-const i@288@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 136 | !(0 <= i@288@01) | live]
; [else-branch: 136 | 0 <= i@288@01 | live]
(push) ; 6
; [then-branch: 136 | !(0 <= i@288@01)]
(assert (not (<= 0 i@288@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 136 | 0 <= i@288@01]
(assert (<= 0 i@288@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@288@01) (not (<= 0 i@288@01))))
(assert (and (<= 0 i@288@01) (< i@288@01 len@175@01)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@288@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@288@01 (Seq_length ar@172@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@289@01 ($Ref) Int)
(declare-fun img@290@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@288@01 Int)) (!
  (=>
    (and (<= 0 i@288@01) (< i@288@01 len@175@01))
    (or (<= 0 i@288@01) (not (<= 0 i@288@01))))
  :pattern ((Seq_index ar@172@01 i@288@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@288@01 Int) (i2@288@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@288@01) (< i1@288@01 len@175@01))
      (and (<= 0 i2@288@01) (< i2@288@01 len@175@01))
      (= (Seq_index ar@172@01 i1@288@01) (Seq_index ar@172@01 i2@288@01)))
    (= i1@288@01 i2@288@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@288@01 Int)) (!
  (=>
    (and (<= 0 i@288@01) (< i@288@01 len@175@01))
    (and
      (= (inv@289@01 (Seq_index ar@172@01 i@288@01)) i@288@01)
      (img@290@01 (Seq_index ar@172@01 i@288@01))))
  :pattern ((Seq_index ar@172@01 i@288@01))
  :qid |quant-u-177|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@290@01 r)
      (and (<= 0 (inv@289@01 r)) (< (inv@289@01 r) len@175@01)))
    (= (Seq_index ar@172@01 (inv@289@01 r)) r))
  :pattern ((inv@289@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@288@01 Int)) (!
  (=>
    (and (<= 0 i@288@01) (< i@288@01 len@175@01))
    (not (= (Seq_index ar@172@01 i@288@01) $Ref.null)))
  :pattern ((Seq_index ar@172@01 i@288@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@287@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@287@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@287@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@287@01))) $Snap.unit))
; [eval] 0 < len ==> |br| == len
; [eval] 0 < len
(push) ; 4
; [then-branch: 137 | 0 < len@175@01 | dead]
; [else-branch: 137 | !(0 < len@175@01) | live]
(push) ; 5
; [else-branch: 137 | !(0 < len@175@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@287@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@287@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@287@01)))))))
(declare-const i@291@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 138 | !(0 <= i@291@01) | live]
; [else-branch: 138 | 0 <= i@291@01 | live]
(push) ; 6
; [then-branch: 138 | !(0 <= i@291@01)]
(assert (not (<= 0 i@291@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 138 | 0 <= i@291@01]
(assert (<= 0 i@291@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@291@01) (not (<= 0 i@291@01))))
(assert (and (<= 0 i@291@01) (< i@291@01 len@175@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@291@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@291@01 (Seq_length br@173@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@292@01 ($Ref) Int)
(declare-fun img@293@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@291@01 Int)) (!
  (=>
    (and (<= 0 i@291@01) (< i@291@01 len@175@01))
    (or (<= 0 i@291@01) (not (<= 0 i@291@01))))
  :pattern ((Seq_index br@173@01 i@291@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@291@01 Int) (i2@291@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@291@01) (< i1@291@01 len@175@01))
      (and (<= 0 i2@291@01) (< i2@291@01 len@175@01))
      (= (Seq_index br@173@01 i1@291@01) (Seq_index br@173@01 i2@291@01)))
    (= i1@291@01 i2@291@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@291@01 Int)) (!
  (=>
    (and (<= 0 i@291@01) (< i@291@01 len@175@01))
    (and
      (= (inv@292@01 (Seq_index br@173@01 i@291@01)) i@291@01)
      (img@293@01 (Seq_index br@173@01 i@291@01))))
  :pattern ((Seq_index br@173@01 i@291@01))
  :qid |quant-u-179|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@293@01 r)
      (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))
    (= (Seq_index br@173@01 (inv@292@01 r)) r))
  :pattern ((inv@292@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@291@01 Int)) (!
  (=>
    (and (<= 0 i@291@01) (< i@291@01 len@175@01))
    (not (= (Seq_index br@173@01 i@291@01) $Ref.null)))
  :pattern ((Seq_index br@173@01 i@291@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index br@173@01 i@291@01) (Seq_index ar@172@01 i@288@01))
    (=
      (and
        (img@293@01 r)
        (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))
      (and
        (img@290@01 r)
        (and (<= 0 (inv@289@01 r)) (< (inv@289@01 r) len@175@01)))))
  
  :qid |quant-u-180|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@287@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@287@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@287@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@287@01)))))
  $Snap.unit))
; [eval] 0 < len ==> |cr| == len
; [eval] 0 < len
(set-option :timeout 0)
(push) ; 4
; [then-branch: 139 | 0 < len@175@01 | dead]
; [else-branch: 139 | !(0 < len@175@01) | live]
(push) ; 5
; [else-branch: 139 | !(0 < len@175@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(declare-const i@294@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 140 | !(0 <= i@294@01) | live]
; [else-branch: 140 | 0 <= i@294@01 | live]
(push) ; 6
; [then-branch: 140 | !(0 <= i@294@01)]
(assert (not (<= 0 i@294@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 140 | 0 <= i@294@01]
(assert (<= 0 i@294@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@294@01) (not (<= 0 i@294@01))))
(assert (and (<= 0 i@294@01) (< i@294@01 len@175@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@294@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@294@01 (Seq_length cr@174@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@295@01 ($Ref) Int)
(declare-fun img@296@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@294@01 Int)) (!
  (=>
    (and (<= 0 i@294@01) (< i@294@01 len@175@01))
    (or (<= 0 i@294@01) (not (<= 0 i@294@01))))
  :pattern ((Seq_index cr@174@01 i@294@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@294@01 Int) (i2@294@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@294@01) (< i1@294@01 len@175@01))
      (and (<= 0 i2@294@01) (< i2@294@01 len@175@01))
      (= (Seq_index cr@174@01 i1@294@01) (Seq_index cr@174@01 i2@294@01)))
    (= i1@294@01 i2@294@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@294@01 Int)) (!
  (=>
    (and (<= 0 i@294@01) (< i@294@01 len@175@01))
    (and
      (= (inv@295@01 (Seq_index cr@174@01 i@294@01)) i@294@01)
      (img@296@01 (Seq_index cr@174@01 i@294@01))))
  :pattern ((Seq_index cr@174@01 i@294@01))
  :qid |quant-u-182|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@296@01 r)
      (and (<= 0 (inv@295@01 r)) (< (inv@295@01 r) len@175@01)))
    (= (Seq_index cr@174@01 (inv@295@01 r)) r))
  :pattern ((inv@295@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@294@01 Int)) (!
  (=>
    (and (<= 0 i@294@01) (< i@294@01 len@175@01))
    (not (= (Seq_index cr@174@01 i@294@01) $Ref.null)))
  :pattern ((Seq_index cr@174@01 i@294@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index cr@174@01 i@294@01) (Seq_index br@173@01 i@291@01))
    (=
      (and
        (img@296@01 r)
        (and (<= 0 (inv@295@01 r)) (< (inv@295@01 r) len@175@01)))
      (and
        (img@293@01 r)
        (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))))
  
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
    (= (Seq_index cr@174@01 i@294@01) (Seq_index ar@172@01 i@288@01))
    (=
      (and
        (img@296@01 r)
        (and (<= 0 (inv@295@01 r)) (< (inv@295@01 r) len@175@01)))
      (and
        (img@290@01 r)
        (and (<= 0 (inv@289@01 r)) (< (inv@289@01 r) len@175@01)))))
  
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
; [eval] |ar| == len
; [eval] |ar|
(declare-const i@297@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 141 | !(0 <= i@297@01) | live]
; [else-branch: 141 | 0 <= i@297@01 | live]
(push) ; 6
; [then-branch: 141 | !(0 <= i@297@01)]
(assert (not (<= 0 i@297@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 141 | 0 <= i@297@01]
(assert (<= 0 i@297@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@297@01) (not (<= 0 i@297@01))))
(assert (and (<= 0 i@297@01) (< i@297@01 len@175@01)))
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@297@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@297@01 (Seq_length ar@172@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@298@01 ($Ref) Int)
(declare-fun img@299@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@297@01 Int)) (!
  (=>
    (and (<= 0 i@297@01) (< i@297@01 len@175@01))
    (or (<= 0 i@297@01) (not (<= 0 i@297@01))))
  :pattern ((Seq_index ar@172@01 i@297@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@297@01 Int) (i2@297@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@297@01) (< i1@297@01 len@175@01))
      (and (<= 0 i2@297@01) (< i2@297@01 len@175@01))
      (= (Seq_index ar@172@01 i1@297@01) (Seq_index ar@172@01 i2@297@01)))
    (= i1@297@01 i2@297@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@297@01 Int)) (!
  (=>
    (and (<= 0 i@297@01) (< i@297@01 len@175@01))
    (and
      (= (inv@298@01 (Seq_index ar@172@01 i@297@01)) i@297@01)
      (img@299@01 (Seq_index ar@172@01 i@297@01))))
  :pattern ((Seq_index ar@172@01 i@297@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@299@01 r)
      (and (<= 0 (inv@298@01 r)) (< (inv@298@01 r) len@175@01)))
    (= (Seq_index ar@172@01 (inv@298@01 r)) r))
  :pattern ((inv@298@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@297@01 Int)) (!
  (= (Seq_index ar@172@01 i@297@01) (Seq_index br@173@01 i@297@01))
  
  :qid |quant-u-186|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@297@01 Int)) (!
  (= (Seq_index ar@172@01 i@297@01) (Seq_index cr@174@01 i@297@01))
  
  :qid |quant-u-187|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@300@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@298@01 r)) (< (inv@298@01 r) len@175@01))
      (img@299@01 r)
      (= r (Seq_index ar@172@01 (inv@298@01 r))))
    ($Perm.min
      (ite
        (and
          (img@290@01 r)
          (and (<= 0 (inv@289@01 r)) (< (inv@289@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@301@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@298@01 r)) (< (inv@298@01 r) len@175@01))
      (img@299@01 r)
      (= r (Seq_index ar@172@01 (inv@298@01 r))))
    ($Perm.min
      (ite
        (and
          (img@293@01 r)
          (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@300@01 r)))
    $Perm.No))
(define-fun pTaken@302@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@298@01 r)) (< (inv@298@01 r) len@175@01))
      (img@299@01 r)
      (= r (Seq_index ar@172@01 (inv@298@01 r))))
    ($Perm.min
      (ite
        (and
          (img@296@01 r)
          (and (<= 0 (inv@295@01 r)) (< (inv@295@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@300@01 r)) (pTaken@301@01 r)))
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
          (img@290@01 r)
          (and (<= 0 (inv@289@01 r)) (< (inv@289@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@300@01 r))
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
      (and (<= 0 (inv@298@01 r)) (< (inv@298@01 r) len@175@01))
      (img@299@01 r)
      (= r (Seq_index ar@172@01 (inv@298@01 r))))
    (= (- $Perm.Write (pTaken@300@01 r)) $Perm.No))
  
  :qid |quant-u-190|))))
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
    (and
      (img@290@01 r)
      (and (<= 0 (inv@289@01 r)) (< (inv@289@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@287@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@287@01))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@293@01 r)
      (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@287@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@287@01))))) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@296@01 r)
      (and (<= 0 (inv@295@01 r)) (< (inv@295@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@287@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@287@01)))))) r))
  :qid |qp.fvfValDef26|)))
; [eval] |br| == len
; [eval] |br|
(declare-const i@304@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 142 | !(0 <= i@304@01) | live]
; [else-branch: 142 | 0 <= i@304@01 | live]
(push) ; 6
; [then-branch: 142 | !(0 <= i@304@01)]
(assert (not (<= 0 i@304@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 142 | 0 <= i@304@01]
(assert (<= 0 i@304@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@304@01) (not (<= 0 i@304@01))))
(assert (and (<= 0 i@304@01) (< i@304@01 len@175@01)))
; [eval] br[i]
(push) ; 5
(assert (not (>= i@304@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@304@01 (Seq_length br@173@01))))
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
    (and (<= 0 i@304@01) (< i@304@01 len@175@01))
    (or (<= 0 i@304@01) (not (<= 0 i@304@01))))
  :pattern ((Seq_index br@173@01 i@304@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@304@01 Int) (i2@304@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@304@01) (< i1@304@01 len@175@01))
      (and (<= 0 i2@304@01) (< i2@304@01 len@175@01))
      (= (Seq_index br@173@01 i1@304@01) (Seq_index br@173@01 i2@304@01)))
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
    (and (<= 0 i@304@01) (< i@304@01 len@175@01))
    (and
      (= (inv@305@01 (Seq_index br@173@01 i@304@01)) i@304@01)
      (img@306@01 (Seq_index br@173@01 i@304@01))))
  :pattern ((Seq_index br@173@01 i@304@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@306@01 r)
      (and (<= 0 (inv@305@01 r)) (< (inv@305@01 r) len@175@01)))
    (= (Seq_index br@173@01 (inv@305@01 r)) r))
  :pattern ((inv@305@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@304@01 Int)) (!
  (= (Seq_index br@173@01 i@304@01) (Seq_index cr@174@01 i@304@01))
  
  :qid |quant-u-192|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@307@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@305@01 r)) (< (inv@305@01 r) len@175@01))
      (img@306@01 r)
      (= r (Seq_index br@173@01 (inv@305@01 r))))
    ($Perm.min
      (ite
        (and
          (img@296@01 r)
          (and (<= 0 (inv@295@01 r)) (< (inv@295@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@308@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@305@01 r)) (< (inv@305@01 r) len@175@01))
      (img@306@01 r)
      (= r (Seq_index br@173@01 (inv@305@01 r))))
    ($Perm.min
      (ite
        (and
          (img@293@01 r)
          (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@307@01 r)))
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
          (img@296@01 r)
          (and (<= 0 (inv@295@01 r)) (< (inv@295@01 r) len@175@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@307@01 r))
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
      (and (<= 0 (inv@305@01 r)) (< (inv@305@01 r) len@175@01))
      (img@306@01 r)
      (= r (Seq_index br@173@01 (inv@305@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@307@01 r)) $Perm.No))
  
  :qid |quant-u-195|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@309@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@296@01 r)
      (and (<= 0 (inv@295@01 r)) (< (inv@295@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@309@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@287@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@309@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@287@01)))))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@293@01 r)
      (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@309@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@287@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@309@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@287@01))))) r))
  :qid |qp.fvfValDef28|)))
; [eval] |cr| == len
; [eval] |cr|
(declare-const i@310@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 5
; [then-branch: 143 | !(0 <= i@310@01) | live]
; [else-branch: 143 | 0 <= i@310@01 | live]
(push) ; 6
; [then-branch: 143 | !(0 <= i@310@01)]
(assert (not (<= 0 i@310@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 143 | 0 <= i@310@01]
(assert (<= 0 i@310@01))
; [eval] i < len
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@310@01) (not (<= 0 i@310@01))))
(assert (and (<= 0 i@310@01) (< i@310@01 len@175@01)))
; [eval] cr[i]
(push) ; 5
(assert (not (>= i@310@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@310@01 (Seq_length cr@174@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@311@01 ($Ref) Int)
(declare-fun img@312@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@310@01 Int)) (!
  (=>
    (and (<= 0 i@310@01) (< i@310@01 len@175@01))
    (or (<= 0 i@310@01) (not (<= 0 i@310@01))))
  :pattern ((Seq_index cr@174@01 i@310@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@310@01 Int) (i2@310@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@310@01) (< i1@310@01 len@175@01))
      (and (<= 0 i2@310@01) (< i2@310@01 len@175@01))
      (= (Seq_index cr@174@01 i1@310@01) (Seq_index cr@174@01 i2@310@01)))
    (= i1@310@01 i2@310@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@310@01 Int)) (!
  (=>
    (and (<= 0 i@310@01) (< i@310@01 len@175@01))
    (and
      (= (inv@311@01 (Seq_index cr@174@01 i@310@01)) i@310@01)
      (img@312@01 (Seq_index cr@174@01 i@310@01))))
  :pattern ((Seq_index cr@174@01 i@310@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@312@01 r)
      (and (<= 0 (inv@311@01 r)) (< (inv@311@01 r) len@175@01)))
    (= (Seq_index cr@174@01 (inv@311@01 r)) r))
  :pattern ((inv@311@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@310@01 Int)) (!
  (= (Seq_index cr@174@01 i@310@01) (Seq_index br@173@01 i@310@01))
  
  :qid |quant-u-197|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@313@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@311@01 r)) (< (inv@311@01 r) len@175@01))
      (img@312@01 r)
      (= r (Seq_index cr@174@01 (inv@311@01 r))))
    ($Perm.min
      (ite
        (and
          (img@293@01 r)
          (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))
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
          (img@293@01 r)
          (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@313@01 r))
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
      (and (<= 0 (inv@311@01 r)) (< (inv@311@01 r) len@175@01))
      (img@312@01 r)
      (= r (Seq_index cr@174@01 (inv@311@01 r))))
    (= (- $Perm.Write (pTaken@313@01 r)) $Perm.No))
  
  :qid |quant-u-200|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@314@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@293@01 r)
      (and (<= 0 (inv@292@01 r)) (< (inv@292@01 r) len@175@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@314@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@287@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@314@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@287@01))))) r))
  :qid |qp.fvfValDef29|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
