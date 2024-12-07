(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:22:01
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr
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
(declare-fun sum_square ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%limited ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%stateless (Int Int Int Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_square%precondition ($Snap Int Int Int Int Int Int Seq<$Ref>) Bool)
(declare-fun count_square ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Int)
(declare-fun count_square%limited ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Int)
(declare-fun count_square%stateless (Int Int Int Int Int Int Seq<$Ref> Int) Bool)
(declare-fun count_square%precondition ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Bool)
(declare-fun Ref__multidim_index_2 ($Snap Int Int Int Int) Int)
(declare-fun Ref__multidim_index_2%limited ($Snap Int Int Int Int) Int)
(declare-fun Ref__multidim_index_2%stateless (Int Int Int Int) Bool)
(declare-fun Ref__multidim_index_2%precondition ($Snap Int Int Int Int) Bool)
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
(declare-fun $k@44@00 () $Perm)
(declare-fun inv@45@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@46@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@50@00 () $Perm)
(declare-fun inv@51@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@52@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@53@00 ($Snap Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@57@00 () $Perm)
(declare-fun inv@58@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@59@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@63@00 () $Perm)
(declare-fun inv@64@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@65@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@66@00 ($Snap Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
(declare-fun $k@70@00 () $Perm)
(declare-fun inv@71@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@72@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@76@00 () $Perm)
(declare-fun inv@77@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@78@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@79@00 ($Snap Int Int Int Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@83@00 () $Perm)
(declare-fun inv@84@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@85@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@89@00 () $Perm)
(declare-fun inv@90@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@91@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@92@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
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
  :qid |quant-u-14|)))
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
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (lo@6@00 Int) (hi@7@00 Int) (ar@8@00 Seq<$Ref>)) (!
  (=
    (sum_array%limited s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00)
    (sum_array s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00))
  :pattern ((sum_array s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (lo@6@00 Int) (hi@7@00 Int) (ar@8@00 Seq<$Ref>)) (!
  (sum_array%stateless i@5@00 lo@6@00 hi@7@00 ar@8@00)
  :pattern ((sum_array%limited s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (lo@6@00 Int) (hi@7@00 Int) (ar@8@00 Seq<$Ref>)) (!
  (and
    (forall ((k@43@00 Int)) (!
      (=>
        (and
          (and (<= lo@6@00 k@43@00) (< k@43@00 hi@7@00))
          (< $Perm.No $k@44@00))
        (and
          (=
            (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 (Seq_index
              ar@8@00
              k@43@00))
            k@43@00)
          (img@46@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 (Seq_index
            ar@8@00
            k@43@00))))
      :pattern ((Seq_index ar@8@00 k@43@00))
      :qid |quant-u-17|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@46@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r)
          (and
            (and
              (<= lo@6@00 (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
              (< (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r) hi@7@00))
            (< $Perm.No $k@44@00)))
        (=
          (Seq_index ar@8@00 (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
          r))
      :pattern ((inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@49@00 Int)) (!
      (=>
        (and
          (and (<= lo@6@00 k@49@00) (< k@49@00 hi@7@00))
          (< $Perm.No $k@50@00))
        (and
          (=
            (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 (Seq_index
              ar@8@00
              k@49@00))
            k@49@00)
          (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 (Seq_index
            ar@8@00
            k@49@00))))
      :pattern ((Seq_index ar@8@00 k@49@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r)
          (and
            (and
              (<= lo@6@00 (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
              (< (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r) hi@7@00))
            (< $Perm.No $k@50@00)))
        (=
          (Seq_index ar@8@00 (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
          r))
      :pattern ((inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00)))
          (and
            (and
              (<= lo@6@00 (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
              (< (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r) hi@7@00))
            (< $Perm.No $k@50@00)
            (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r)))
        (=>
          (and
            (and
              (<= lo@6@00 (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
              (< (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r) hi@7@00))
            (< $Perm.No $k@50@00)
            (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00))))
      :qid |qp.fvfDomDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= lo@6@00 (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
              (< (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r) hi@7@00))
            (< $Perm.No $k@50@00)
            (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
          (ite
            (and
              (img@46@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r)
              (and
                (<= lo@6@00 (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r))
                (< (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00 r) hi@7@00)))
            (< $Perm.No $k@44@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r))
      :qid |qp.fvfValDef1|))
    ($Perm.isReadVar $k@44@00)
    ($Perm.isReadVar $k@50@00)
    (=>
      (sum_array%precondition s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00)
      (=
        (sum_array s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00)
        (ite
          (< i@5@00 hi@7@00)
          (+
            ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) (Seq_index
              ar@8@00
              i@5@00))
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
                      ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00))))))) (+
              i@5@00
              1) lo@6@00 hi@7@00 ar@8@00))
          0))))
  :pattern ((sum_array s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (lo@6@00 Int) (hi@7@00 Int) (ar@8@00 Seq<$Ref>)) (!
  (=>
    (sum_array%precondition s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00)
    (ite
      (< i@5@00 hi@7@00)
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
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00))))))) (+
        i@5@00
        1) lo@6@00 hi@7@00 ar@8@00)
      true))
  :pattern ((sum_array s@$ i@5@00 lo@6@00 hi@7@00 ar@8@00))
  :qid |quant-u-23|)))
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
  :qid |quant-u-24|)))
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
  :qid |quant-u-25|)))
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
    (forall ((k@56@00 Int)) (!
      (=>
        (and (and (<= 0 k@56@00) (< k@56@00 hi@15@00)) (< $Perm.No $k@57@00))
        (and
          (=
            (inv@58@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
              ar@16@00
              k@56@00))
            k@56@00)
          (img@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
            ar@16@00
            k@56@00))))
      :pattern ((Seq_index ar@16@00 k@56@00))
      :qid |quant-u-27|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
          (and
            (and
              (<= 0 (inv@58@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@58@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@57@00)))
        (=
          (Seq_index
            ar@16@00
            (inv@58@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          r))
      :pattern ((inv@58@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@62@00 Int)) (!
      (=>
        (and (and (<= 0 k@62@00) (< k@62@00 hi@15@00)) (< $Perm.No $k@63@00))
        (and
          (=
            (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
              ar@16@00
              k@62@00))
            k@62@00)
          (img@65@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 (Seq_index
            ar@16@00
            k@62@00))))
      :pattern ((Seq_index ar@16@00 k@62@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@65@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
          (and
            (and
              (<= 0 (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@63@00)))
        (=
          (Seq_index
            ar@16@00
            (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          r))
      :pattern ((inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@66@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)))
          (and
            (and
              (<= 0 (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@63@00)
            (img@65@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@63@00)
            (img@65@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@66@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@66@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00))))
      :qid |qp.fvfDomDef5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
              (< (inv@64@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00))
            (< $Perm.No $k@63@00)
            (img@65@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
          (ite
            (and
              (img@59@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r)
              (and
                (<= 0 (inv@58@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r))
                (< (inv@58@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00 r) hi@15@00)))
            (< $Perm.No $k@57@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@66@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@66@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef4|))
    ($Perm.isReadVar $k@57@00)
    ($Perm.isReadVar $k@63@00)
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
                    ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@66@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)))))) (+
              i@14@00
              1) hi@15@00 ar@16@00 v@17@00))
          0))))
  :pattern ((count_array s@$ i@14@00 hi@15@00 ar@16@00 v@17@00))
  :qid |quant-u-32|)))
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
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@66@00 s@$ i@14@00 hi@15@00 ar@16@00 v@17@00)))))) (+
        i@14@00
        1) hi@15@00 ar@16@00 v@17@00)
      true))
  :pattern ((count_array s@$ i@14@00 hi@15@00 ar@16@00 v@17@00))
  :qid |quant-u-33|)))
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
    (forall ((k@69@00 Int)) (!
      (=>
        (and
          (and
            (<= min@23@00 k@69@00)
            (and
              (< k@69@00 max@24@00)
              (and
                (<= lo@20@00 (mod k@69@00 step@22@00))
                (< (mod k@69@00 step@22@00) hi@21@00))))
          (< $Perm.No $k@70@00))
        (and
          (=
            (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 (Seq_index
              ar@25@00
              k@69@00))
            k@69@00)
          (img@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 (Seq_index
            ar@25@00
            k@69@00))))
      :pattern ((Seq_index ar@25@00 k@69@00))
      :qid |quant-u-35|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
          (and
            (and
              (<=
                min@23@00
                (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@70@00)))
        (=
          (Seq_index
            ar@25@00
            (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
          r))
      :pattern ((inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@75@00 Int)) (!
      (=>
        (and
          (and
            (<= min@23@00 k@75@00)
            (and
              (< k@75@00 max@24@00)
              (and
                (<= lo@20@00 (mod k@75@00 step@22@00))
                (< (mod k@75@00 step@22@00) hi@21@00))))
          (< $Perm.No $k@76@00))
        (and
          (=
            (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 (Seq_index
              ar@25@00
              k@75@00))
            k@75@00)
          (img@78@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 (Seq_index
            ar@25@00
            k@75@00))))
      :pattern ((Seq_index ar@25@00 k@75@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@78@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
          (and
            (and
              (<=
                min@23@00
                (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@76@00)))
        (=
          (Seq_index
            ar@25@00
            (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
          r))
      :pattern ((inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@79@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)))
          (and
            (and
              (<=
                min@23@00
                (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@76@00)
            (img@78@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)))
        (=>
          (and
            (and
              (<=
                min@23@00
                (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@76@00)
            (img@78@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@79@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@79@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))))
      :qid |qp.fvfDomDef8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@23@00
                (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
              (and
                (<
                  (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                  max@24@00)
                (and
                  (<=
                    lo@20@00
                    (mod
                      (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00))
                  (<
                    (mod
                      (inv@77@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                      step@22@00)
                    hi@21@00))))
            (< $Perm.No $k@76@00)
            (img@78@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
          (ite
            (and
              (img@72@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
              (and
                (<=
                  min@23@00
                  (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r))
                (and
                  (<
                    (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                    max@24@00)
                  (and
                    (<=
                      lo@20@00
                      (mod
                        (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                        step@22@00))
                    (<
                      (mod
                        (inv@71@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00 r)
                        step@22@00)
                      hi@21@00)))))
            (< $Perm.No $k@70@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@79@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@79@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef7|))
    ($Perm.isReadVar $k@70@00)
    ($Perm.isReadVar $k@76@00)
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
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@79@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))))))))))) (+
              i@19@00
              1) lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))
          0))))
  :pattern ((sum_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))
  :qid |quant-u-40|)))
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
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@79@00 s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))))))))))) (+
        i@19@00
        1) lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00)
      true))
  :pattern ((sum_square s@$ i@19@00 lo@20@00 hi@21@00 step@22@00 min@23@00 max@24@00 ar@25@00))
  :qid |quant-u-41|)))
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
    (forall ((k@82@00 Int)) (!
      (=>
        (and
          (and
            (<= min@31@00 k@82@00)
            (and
              (< k@82@00 max@32@00)
              (and
                (<= lo@28@00 (mod k@82@00 step@30@00))
                (< (mod k@82@00 step@30@00) hi@29@00))))
          (< $Perm.No $k@83@00))
        (and
          (=
            (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 (Seq_index
              ar@33@00
              k@82@00))
            k@82@00)
          (img@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 (Seq_index
            ar@33@00
            k@82@00))))
      :pattern ((Seq_index ar@33@00 k@82@00))
      :qid |quant-u-43|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
          (and
            (and
              (<=
                min@31@00
                (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@83@00)))
        (=
          (Seq_index
            ar@33@00
            (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
          r))
      :pattern ((inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@88@00 Int)) (!
      (=>
        (and
          (and
            (<= min@31@00 k@88@00)
            (and
              (< k@88@00 max@32@00)
              (and
                (<= lo@28@00 (mod k@88@00 step@30@00))
                (< (mod k@88@00 step@30@00) hi@29@00))))
          (< $Perm.No $k@89@00))
        (and
          (=
            (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 (Seq_index
              ar@33@00
              k@88@00))
            k@88@00)
          (img@91@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 (Seq_index
            ar@33@00
            k@88@00))))
      :pattern ((Seq_index ar@33@00 k@88@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@91@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
          (and
            (and
              (<=
                min@31@00
                (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@89@00)))
        (=
          (Seq_index
            ar@33@00
            (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
          r))
      :pattern ((inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@92@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)))
          (and
            (and
              (<=
                min@31@00
                (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@89@00)
            (img@91@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)))
        (=>
          (and
            (and
              (<=
                min@31@00
                (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@89@00)
            (img@91@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@92@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@92@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))))
      :qid |qp.fvfDomDef11|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@31@00
                (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@90@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@89@00)
            (img@91@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
          (ite
            (and
              (img@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
              (and
                (<=
                  min@31@00
                  (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
                (and
                  (<
                    (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                    max@32@00)
                  (and
                    (<=
                      lo@28@00
                      (mod
                        (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                        step@30@00))
                    (<
                      (mod
                        (inv@84@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                        step@30@00)
                      hi@29@00)))))
            (< $Perm.No $k@83@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@92@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@92@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef10|))
    ($Perm.isReadVar $k@83@00)
    ($Perm.isReadVar $k@89@00)
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
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@92@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))))))))))) (+
              i@27@00
              1) lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))
          0))))
  :pattern ((count_square s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))
  :qid |quant-u-48|)))
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
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@92@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))))))))))) (+
        i@27@00
        1) lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)
      true))
  :pattern ((count_square s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))
  :qid |quant-u-49|)))
(assert (forall ((s@$ $Snap) (N0@36@00 Int) (N1@37@00 Int) (i0@38@00 Int) (i1@39@00 Int)) (!
  (=
    (Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00)
    (Ref__multidim_index_2 s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))
  :pattern ((Ref__multidim_index_2 s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (N0@36@00 Int) (N1@37@00 Int) (i0@38@00 Int) (i1@39@00 Int)) (!
  (Ref__multidim_index_2%stateless N0@36@00 N1@37@00 i0@38@00 i1@39@00)
  :pattern ((Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (N0@36@00 Int) (N1@37@00 Int) (i0@38@00 Int) (i1@39@00 Int)) (!
  (let ((result@40@00 (Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))) (=>
    (Ref__multidim_index_2%precondition s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00)
    (and
      (<= 0 result@40@00)
      (< result@40@00 (* N0@36@00 N1@37@00))
      (= result@40@00 (+ (* i0@38@00 N1@37@00) i1@39@00))
      (= (mod result@40@00 N1@37@00) i1@39@00)
      (< (mod result@40@00 N1@37@00) N0@36@00))))
  :pattern ((Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))
  :qid |quant-u-50|)))
(assert (forall ((s@$ $Snap) (N0@36@00 Int) (N1@37@00 Int) (i0@38@00 Int) (i1@39@00 Int)) (!
  (let ((result@40@00 (Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))) true)
  :pattern ((Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))
  :qid |quant-u-51|)))
(assert (forall ((s@$ $Snap) (N0@36@00 Int) (N1@37@00 Int) (i0@38@00 Int) (i1@39@00 Int)) (!
  (let ((result@40@00 (Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))) true)
  :pattern ((Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (N0@36@00 Int) (N1@37@00 Int) (i0@38@00 Int) (i1@39@00 Int)) (!
  (let ((result@40@00 (Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))) true)
  :pattern ((Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))
  :qid |quant-u-53|)))
(assert (forall ((s@$ $Snap) (N0@36@00 Int) (N1@37@00 Int) (i0@38@00 Int) (i1@39@00 Int)) (!
  (let ((result@40@00 (Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))) true)
  :pattern ((Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))
  :qid |quant-u-54|)))
(assert (forall ((s@$ $Snap) (N0@36@00 Int) (N1@37@00 Int) (i0@38@00 Int) (i1@39@00 Int)) (!
  (let ((result@40@00 (Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))) true)
  :pattern ((Ref__multidim_index_2%limited s@$ N0@36@00 N1@37@00 i0@38@00 i1@39@00))
  :qid |quant-u-55|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Ref__loop_main_76 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const P@2@01 Int)
(declare-const hist@3@01 Seq<$Ref>)
(declare-const diz@4@01 $Ref)
(declare-const current_thread_id@5@01 Int)
(declare-const P@6@01 Int)
(declare-const hist@7@01 Seq<$Ref>)
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
; [eval] P <= |hist|
; [eval] |hist|
(assert (<= P@6@01 (Seq_length hist@7@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) $Snap.unit))
; [eval] (forall j: Int, k: Int :: { hist[j], hist[k] } 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k])
(declare-const j@9@01 Int)
(declare-const k@10@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k]
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k)))
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
; [eval] j < P
(push) ; 5
; [then-branch: 1 | !(j@9@01 < P@6@01) | live]
; [else-branch: 1 | j@9@01 < P@6@01 | live]
(push) ; 6
; [then-branch: 1 | !(j@9@01 < P@6@01)]
(assert (not (< j@9@01 P@6@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | j@9@01 < P@6@01]
(assert (< j@9@01 P@6@01))
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
; [eval] k < P
(push) ; 9
; [then-branch: 3 | !(k@10@01 < P@6@01) | live]
; [else-branch: 3 | k@10@01 < P@6@01 | live]
(push) ; 10
; [then-branch: 3 | !(k@10@01 < P@6@01)]
(assert (not (< k@10@01 P@6@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | k@10@01 < P@6@01]
(assert (< k@10@01 P@6@01))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@10@01 P@6@01) (not (< k@10@01 P@6@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@10@01)
  (and (<= 0 k@10@01) (or (< k@10@01 P@6@01) (not (< k@10@01 P@6@01))))))
(assert (or (<= 0 k@10@01) (not (<= 0 k@10@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@9@01 P@6@01)
  (and
    (< j@9@01 P@6@01)
    (=>
      (<= 0 k@10@01)
      (and (<= 0 k@10@01) (or (< k@10@01 P@6@01) (not (< k@10@01 P@6@01)))))
    (or (<= 0 k@10@01) (not (<= 0 k@10@01))))))
(assert (or (< j@9@01 P@6@01) (not (< j@9@01 P@6@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@9@01)
  (and
    (<= 0 j@9@01)
    (=>
      (< j@9@01 P@6@01)
      (and
        (< j@9@01 P@6@01)
        (=>
          (<= 0 k@10@01)
          (and (<= 0 k@10@01) (or (< k@10@01 P@6@01) (not (< k@10@01 P@6@01)))))
        (or (<= 0 k@10@01) (not (<= 0 k@10@01)))))
    (or (< j@9@01 P@6@01) (not (< j@9@01 P@6@01))))))
(assert (or (<= 0 j@9@01) (not (<= 0 j@9@01))))
(push) ; 3
; [then-branch: 4 | 0 <= j@9@01 && j@9@01 < P@6@01 && 0 <= k@10@01 && k@10@01 < P@6@01 && j@9@01 != k@10@01 | live]
; [else-branch: 4 | !(0 <= j@9@01 && j@9@01 < P@6@01 && 0 <= k@10@01 && k@10@01 < P@6@01 && j@9@01 != k@10@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= j@9@01 && j@9@01 < P@6@01 && 0 <= k@10@01 && k@10@01 < P@6@01 && j@9@01 != k@10@01]
(assert (and
  (<= 0 j@9@01)
  (and
    (< j@9@01 P@6@01)
    (and (<= 0 k@10@01) (and (< k@10@01 P@6@01) (not (= j@9@01 k@10@01)))))))
; [eval] hist[j] != hist[k]
; [eval] hist[j]
(push) ; 5
(assert (not (>= j@9@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@9@01 (Seq_length hist@7@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] hist[k]
(push) ; 5
(assert (not (>= k@10@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@10@01 (Seq_length hist@7@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= j@9@01 && j@9@01 < P@6@01 && 0 <= k@10@01 && k@10@01 < P@6@01 && j@9@01 != k@10@01)]
(assert (not
  (and
    (<= 0 j@9@01)
    (and
      (< j@9@01 P@6@01)
      (and (<= 0 k@10@01) (and (< k@10@01 P@6@01) (not (= j@9@01 k@10@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@9@01)
    (and
      (< j@9@01 P@6@01)
      (and (<= 0 k@10@01) (and (< k@10@01 P@6@01) (not (= j@9@01 k@10@01))))))
  (and
    (<= 0 j@9@01)
    (< j@9@01 P@6@01)
    (<= 0 k@10@01)
    (< k@10@01 P@6@01)
    (not (= j@9@01 k@10@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@9@01)
      (and
        (< j@9@01 P@6@01)
        (and (<= 0 k@10@01) (and (< k@10@01 P@6@01) (not (= j@9@01 k@10@01)))))))
  (and
    (<= 0 j@9@01)
    (and
      (< j@9@01 P@6@01)
      (and (<= 0 k@10@01) (and (< k@10@01 P@6@01) (not (= j@9@01 k@10@01))))))))
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
          (< j@9@01 P@6@01)
          (and
            (< j@9@01 P@6@01)
            (=>
              (<= 0 k@10@01)
              (and
                (<= 0 k@10@01)
                (or (< k@10@01 P@6@01) (not (< k@10@01 P@6@01)))))
            (or (<= 0 k@10@01) (not (<= 0 k@10@01)))))
        (or (< j@9@01 P@6@01) (not (< j@9@01 P@6@01)))))
    (or (<= 0 j@9@01) (not (<= 0 j@9@01)))
    (=>
      (and
        (<= 0 j@9@01)
        (and
          (< j@9@01 P@6@01)
          (and (<= 0 k@10@01) (and (< k@10@01 P@6@01) (not (= j@9@01 k@10@01))))))
      (and
        (<= 0 j@9@01)
        (< j@9@01 P@6@01)
        (<= 0 k@10@01)
        (< k@10@01 P@6@01)
        (not (= j@9@01 k@10@01))))
    (or
      (not
        (and
          (<= 0 j@9@01)
          (and
            (< j@9@01 P@6@01)
            (and
              (<= 0 k@10@01)
              (and (< k@10@01 P@6@01) (not (= j@9@01 k@10@01)))))))
      (and
        (<= 0 j@9@01)
        (and
          (< j@9@01 P@6@01)
          (and (<= 0 k@10@01) (and (< k@10@01 P@6@01) (not (= j@9@01 k@10@01))))))))
  :pattern ((Seq_index hist@7@01 j@9@01) (Seq_index hist@7@01 k@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@76@12@76@104-aux|)))
(assert (forall ((j@9@01 Int) (k@10@01 Int)) (!
  (=>
    (and
      (<= 0 j@9@01)
      (and
        (< j@9@01 P@6@01)
        (and (<= 0 k@10@01) (and (< k@10@01 P@6@01) (not (= j@9@01 k@10@01))))))
    (not (= (Seq_index hist@7@01 j@9@01) (Seq_index hist@7@01 k@10@01))))
  :pattern ((Seq_index hist@7@01 j@9@01) (Seq_index hist@7@01 k@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@76@12@76@104|)))
(declare-const k@11@01 Int)
(push) ; 2
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 3
; [then-branch: 5 | !(0 <= k@11@01) | live]
; [else-branch: 5 | 0 <= k@11@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= k@11@01)]
(assert (not (<= 0 k@11@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= k@11@01]
(assert (<= 0 k@11@01))
; [eval] k < P
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@11@01) (not (<= 0 k@11@01))))
(assert (and (<= 0 k@11@01) (< k@11@01 P@6@01)))
; [eval] hist[k]
(push) ; 3
(assert (not (>= k@11@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@11@01 (Seq_length hist@7@01))))
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
(assert (forall ((k@11@01 Int)) (!
  (=>
    (and (<= 0 k@11@01) (< k@11@01 P@6@01))
    (or (<= 0 k@11@01) (not (<= 0 k@11@01))))
  :pattern ((Seq_index hist@7@01 k@11@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@11@01 Int) (k2@11@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@11@01) (< k1@11@01 P@6@01))
      (and (<= 0 k2@11@01) (< k2@11@01 P@6@01))
      (= (Seq_index hist@7@01 k1@11@01) (Seq_index hist@7@01 k2@11@01)))
    (= k1@11@01 k2@11@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@11@01 Int)) (!
  (=>
    (and (<= 0 k@11@01) (< k@11@01 P@6@01))
    (and
      (= (inv@12@01 (Seq_index hist@7@01 k@11@01)) k@11@01)
      (img@13@01 (Seq_index hist@7@01 k@11@01))))
  :pattern ((Seq_index hist@7@01 k@11@01))
  :qid |quant-u-57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) P@6@01)))
    (= (Seq_index hist@7@01 (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@11@01 Int)) (!
  (=>
    (and (<= 0 k@11@01) (< k@11@01 P@6@01))
    (not (= (Seq_index hist@7@01 k@11@01) $Ref.null)))
  :pattern ((Seq_index hist@7@01 k@11@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(declare-const k@15@01 Int)
(push) ; 3
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 6 | !(0 <= k@15@01) | live]
; [else-branch: 6 | 0 <= k@15@01 | live]
(push) ; 5
; [then-branch: 6 | !(0 <= k@15@01)]
(assert (not (<= 0 k@15@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 <= k@15@01]
(assert (<= 0 k@15@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@15@01) (not (<= 0 k@15@01))))
(assert (and (<= 0 k@15@01) (< k@15@01 P@6@01)))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@15@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@15@01 (Seq_length hist@7@01))))
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
(assert (forall ((k@15@01 Int)) (!
  (=>
    (and (<= 0 k@15@01) (< k@15@01 P@6@01))
    (or (<= 0 k@15@01) (not (<= 0 k@15@01))))
  :pattern ((Seq_index hist@7@01 k@15@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@15@01 Int) (k2@15@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@15@01) (< k1@15@01 P@6@01))
      (and (<= 0 k2@15@01) (< k2@15@01 P@6@01))
      (= (Seq_index hist@7@01 k1@15@01) (Seq_index hist@7@01 k2@15@01)))
    (= k1@15@01 k2@15@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@15@01 Int)) (!
  (=>
    (and (<= 0 k@15@01) (< k@15@01 P@6@01))
    (and
      (= (inv@16@01 (Seq_index hist@7@01 k@15@01)) k@15@01)
      (img@17@01 (Seq_index hist@7@01 k@15@01))))
  :pattern ((Seq_index hist@7@01 k@15@01))
  :qid |quant-u-59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) P@6@01)))
    (= (Seq_index hist@7@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@15@01 Int)) (!
  (=>
    (and (<= 0 k@15@01) (< k@15@01 P@6@01))
    (not (= (Seq_index hist@7@01 k@15@01) $Ref.null)))
  :pattern ((Seq_index hist@7@01 k@15@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (= ($Snap.second $t@14@01) $Snap.unit))
; [eval] (forall k: Int :: { hist[k] } 0 <= k && k < P ==> hist[k].Ref__Integer_value == 0)
(declare-const k@18@01 Int)
(push) ; 3
; [eval] 0 <= k && k < P ==> hist[k].Ref__Integer_value == 0
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 7 | !(0 <= k@18@01) | live]
; [else-branch: 7 | 0 <= k@18@01 | live]
(push) ; 5
; [then-branch: 7 | !(0 <= k@18@01)]
(assert (not (<= 0 k@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | 0 <= k@18@01]
(assert (<= 0 k@18@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@18@01) (not (<= 0 k@18@01))))
(push) ; 4
; [then-branch: 8 | 0 <= k@18@01 && k@18@01 < P@6@01 | live]
; [else-branch: 8 | !(0 <= k@18@01 && k@18@01 < P@6@01) | live]
(push) ; 5
; [then-branch: 8 | 0 <= k@18@01 && k@18@01 < P@6@01]
(assert (and (<= 0 k@18@01) (< k@18@01 P@6@01)))
; [eval] hist[k].Ref__Integer_value == 0
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@18@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@18@01 (Seq_length hist@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@17@01 (Seq_index hist@7@01 k@18@01))
  (and
    (<= 0 (inv@16@01 (Seq_index hist@7@01 k@18@01)))
    (< (inv@16@01 (Seq_index hist@7@01 k@18@01)) P@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(0 <= k@18@01 && k@18@01 < P@6@01)]
(assert (not (and (<= 0 k@18@01) (< k@18@01 P@6@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 k@18@01) (< k@18@01 P@6@01)))
  (and (<= 0 k@18@01) (< k@18@01 P@6@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@18@01 Int)) (!
  (and
    (or (<= 0 k@18@01) (not (<= 0 k@18@01)))
    (or
      (not (and (<= 0 k@18@01) (< k@18@01 P@6@01)))
      (and (<= 0 k@18@01) (< k@18@01 P@6@01))))
  :pattern ((Seq_index hist@7@01 k@18@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@79@12@79@86-aux|)))
(assert (forall ((k@18@01 Int)) (!
  (=>
    (and (<= 0 k@18@01) (< k@18@01 P@6@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@14@01)) (Seq_index
        hist@7@01
        k@18@01))
      0))
  :pattern ((Seq_index hist@7@01 k@18@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@79@12@79@86|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_body_76 ----------
(declare-const diz@19@01 $Ref)
(declare-const current_thread_id@20@01 Int)
(declare-const k@21@01 Int)
(declare-const P@22@01 Int)
(declare-const hist@23@01 Seq<$Ref>)
(declare-const diz@24@01 $Ref)
(declare-const current_thread_id@25@01 Int)
(declare-const k@26@01 Int)
(declare-const P@27@01 Int)
(declare-const hist@28@01 Seq<$Ref>)
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
; [eval] 0 <= k
(assert (<= 0 k@26@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@29@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))
  $Snap.unit))
; [eval] k < P
(assert (< k@26@01 P@27@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01)))))
  $Snap.unit))
; [eval] P <= |hist|
; [eval] |hist|
(assert (<= P@27@01 (Seq_length hist@28@01)))
; [eval] hist[k]
(push) ; 2
(assert (not (>= k@26@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< k@26@01 (Seq_length hist@28@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index hist@28@01 k@26@01) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.first $t@30@01) $Snap.unit))
; [eval] 0 <= k
(assert (=
  ($Snap.second $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@30@01))
    ($Snap.second ($Snap.second $t@30@01)))))
(assert (= ($Snap.first ($Snap.second $t@30@01)) $Snap.unit))
; [eval] k < P
(assert (=
  ($Snap.second ($Snap.second $t@30@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@30@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@30@01))))))
; [eval] hist[k]
(push) ; 3
(assert (not (>= k@26@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@26@01 (Seq_length hist@28@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@30@01))) $Snap.unit))
; [eval] hist[k].Ref__Integer_value == 0
; [eval] hist[k]
(push) ; 3
(assert (not (>= k@26@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@26@01 (Seq_length hist@28@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@30@01))))
  0))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@31@01 $Ref)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@32@01 Int)
; [exec]
; __flatten_4 := hist[k]
; [eval] hist[k]
(push) ; 3
(assert (not (>= k@26@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@26@01 (Seq_length hist@28@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@33@01 $Ref)
(assert (= __flatten_4@33@01 (Seq_index hist@28@01 k@26@01)))
; [exec]
; __flatten_5 := 0
; [exec]
; __flatten_4.Ref__Integer_value := __flatten_5
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index hist@28@01 k@26@01) __flatten_4@33@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_4@33@01 $Ref.null)))
; [eval] 0 <= k
; [eval] k < P
; [eval] hist[k]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= k@26@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@26@01 (Seq_length hist@28@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] hist[k].Ref__Integer_value == 0
; [eval] hist[k]
(push) ; 3
(assert (not (>= k@26@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@26@01 (Seq_length hist@28@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_main_96 ----------
(declare-const diz@34@01 $Ref)
(declare-const current_thread_id@35@01 Int)
(declare-const P@36@01 Int)
(declare-const N@37@01 Int)
(declare-const M@38@01 Int)
(declare-const matrix@39@01 Seq<$Ref>)
(declare-const hist@40@01 Seq<$Ref>)
(declare-const diz@41@01 $Ref)
(declare-const current_thread_id@42@01 Int)
(declare-const P@43@01 Int)
(declare-const N@44@01 Int)
(declare-const M@45@01 Int)
(declare-const matrix@46@01 Seq<$Ref>)
(declare-const hist@47@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(assert (= ($Snap.first $t@48@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@41@01 $Ref.null)))
(assert (=
  ($Snap.second $t@48@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@48@01))
    ($Snap.second ($Snap.second $t@48@01)))))
(assert (= ($Snap.first ($Snap.second $t@48@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@42@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@48@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@48@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@48@01))) $Snap.unit))
; [eval] M > 0
(assert (> M@45@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@48@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
  $Snap.unit))
; [eval] N > 0
(assert (> N@44@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))
  $Snap.unit))
; [eval] P > 0
(assert (> P@43@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))
  $Snap.unit))
; [eval] P <= |hist|
; [eval] |hist|
(assert (<= P@43@01 (Seq_length hist@47@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { hist[j], hist[k] } 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k])
(declare-const j@49@01 Int)
(declare-const k@50@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k]
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 9 | !(0 <= j@49@01) | live]
; [else-branch: 9 | 0 <= j@49@01 | live]
(push) ; 4
; [then-branch: 9 | !(0 <= j@49@01)]
(assert (not (<= 0 j@49@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | 0 <= j@49@01]
(assert (<= 0 j@49@01))
; [eval] j < P
(push) ; 5
; [then-branch: 10 | !(j@49@01 < P@43@01) | live]
; [else-branch: 10 | j@49@01 < P@43@01 | live]
(push) ; 6
; [then-branch: 10 | !(j@49@01 < P@43@01)]
(assert (not (< j@49@01 P@43@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | j@49@01 < P@43@01]
(assert (< j@49@01 P@43@01))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 11 | !(0 <= k@50@01) | live]
; [else-branch: 11 | 0 <= k@50@01 | live]
(push) ; 8
; [then-branch: 11 | !(0 <= k@50@01)]
(assert (not (<= 0 k@50@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 11 | 0 <= k@50@01]
(assert (<= 0 k@50@01))
; [eval] k < P
(push) ; 9
; [then-branch: 12 | !(k@50@01 < P@43@01) | live]
; [else-branch: 12 | k@50@01 < P@43@01 | live]
(push) ; 10
; [then-branch: 12 | !(k@50@01 < P@43@01)]
(assert (not (< k@50@01 P@43@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 12 | k@50@01 < P@43@01]
(assert (< k@50@01 P@43@01))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@50@01 P@43@01) (not (< k@50@01 P@43@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@50@01)
  (and (<= 0 k@50@01) (or (< k@50@01 P@43@01) (not (< k@50@01 P@43@01))))))
(assert (or (<= 0 k@50@01) (not (<= 0 k@50@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@49@01 P@43@01)
  (and
    (< j@49@01 P@43@01)
    (=>
      (<= 0 k@50@01)
      (and (<= 0 k@50@01) (or (< k@50@01 P@43@01) (not (< k@50@01 P@43@01)))))
    (or (<= 0 k@50@01) (not (<= 0 k@50@01))))))
(assert (or (< j@49@01 P@43@01) (not (< j@49@01 P@43@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@49@01)
  (and
    (<= 0 j@49@01)
    (=>
      (< j@49@01 P@43@01)
      (and
        (< j@49@01 P@43@01)
        (=>
          (<= 0 k@50@01)
          (and (<= 0 k@50@01) (or (< k@50@01 P@43@01) (not (< k@50@01 P@43@01)))))
        (or (<= 0 k@50@01) (not (<= 0 k@50@01)))))
    (or (< j@49@01 P@43@01) (not (< j@49@01 P@43@01))))))
(assert (or (<= 0 j@49@01) (not (<= 0 j@49@01))))
(push) ; 3
; [then-branch: 13 | 0 <= j@49@01 && j@49@01 < P@43@01 && 0 <= k@50@01 && k@50@01 < P@43@01 && j@49@01 != k@50@01 | live]
; [else-branch: 13 | !(0 <= j@49@01 && j@49@01 < P@43@01 && 0 <= k@50@01 && k@50@01 < P@43@01 && j@49@01 != k@50@01) | live]
(push) ; 4
; [then-branch: 13 | 0 <= j@49@01 && j@49@01 < P@43@01 && 0 <= k@50@01 && k@50@01 < P@43@01 && j@49@01 != k@50@01]
(assert (and
  (<= 0 j@49@01)
  (and
    (< j@49@01 P@43@01)
    (and (<= 0 k@50@01) (and (< k@50@01 P@43@01) (not (= j@49@01 k@50@01)))))))
; [eval] hist[j] != hist[k]
; [eval] hist[j]
(push) ; 5
(assert (not (>= j@49@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@49@01 (Seq_length hist@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] hist[k]
(push) ; 5
(assert (not (>= k@50@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@50@01 (Seq_length hist@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 13 | !(0 <= j@49@01 && j@49@01 < P@43@01 && 0 <= k@50@01 && k@50@01 < P@43@01 && j@49@01 != k@50@01)]
(assert (not
  (and
    (<= 0 j@49@01)
    (and
      (< j@49@01 P@43@01)
      (and (<= 0 k@50@01) (and (< k@50@01 P@43@01) (not (= j@49@01 k@50@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@49@01)
    (and
      (< j@49@01 P@43@01)
      (and (<= 0 k@50@01) (and (< k@50@01 P@43@01) (not (= j@49@01 k@50@01))))))
  (and
    (<= 0 j@49@01)
    (< j@49@01 P@43@01)
    (<= 0 k@50@01)
    (< k@50@01 P@43@01)
    (not (= j@49@01 k@50@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@49@01)
      (and
        (< j@49@01 P@43@01)
        (and (<= 0 k@50@01) (and (< k@50@01 P@43@01) (not (= j@49@01 k@50@01)))))))
  (and
    (<= 0 j@49@01)
    (and
      (< j@49@01 P@43@01)
      (and (<= 0 k@50@01) (and (< k@50@01 P@43@01) (not (= j@49@01 k@50@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@49@01 Int) (k@50@01 Int)) (!
  (and
    (=>
      (<= 0 j@49@01)
      (and
        (<= 0 j@49@01)
        (=>
          (< j@49@01 P@43@01)
          (and
            (< j@49@01 P@43@01)
            (=>
              (<= 0 k@50@01)
              (and
                (<= 0 k@50@01)
                (or (< k@50@01 P@43@01) (not (< k@50@01 P@43@01)))))
            (or (<= 0 k@50@01) (not (<= 0 k@50@01)))))
        (or (< j@49@01 P@43@01) (not (< j@49@01 P@43@01)))))
    (or (<= 0 j@49@01) (not (<= 0 j@49@01)))
    (=>
      (and
        (<= 0 j@49@01)
        (and
          (< j@49@01 P@43@01)
          (and
            (<= 0 k@50@01)
            (and (< k@50@01 P@43@01) (not (= j@49@01 k@50@01))))))
      (and
        (<= 0 j@49@01)
        (< j@49@01 P@43@01)
        (<= 0 k@50@01)
        (< k@50@01 P@43@01)
        (not (= j@49@01 k@50@01))))
    (or
      (not
        (and
          (<= 0 j@49@01)
          (and
            (< j@49@01 P@43@01)
            (and
              (<= 0 k@50@01)
              (and (< k@50@01 P@43@01) (not (= j@49@01 k@50@01)))))))
      (and
        (<= 0 j@49@01)
        (and
          (< j@49@01 P@43@01)
          (and
            (<= 0 k@50@01)
            (and (< k@50@01 P@43@01) (not (= j@49@01 k@50@01))))))))
  :pattern ((Seq_index hist@47@01 j@49@01) (Seq_index hist@47@01 k@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@106@12@106@104-aux|)))
(assert (forall ((j@49@01 Int) (k@50@01 Int)) (!
  (=>
    (and
      (<= 0 j@49@01)
      (and
        (< j@49@01 P@43@01)
        (and (<= 0 k@50@01) (and (< k@50@01 P@43@01) (not (= j@49@01 k@50@01))))))
    (not (= (Seq_index hist@47@01 j@49@01) (Seq_index hist@47@01 k@50@01))))
  :pattern ((Seq_index hist@47@01 j@49@01) (Seq_index hist@47@01 k@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@106@12@106@104|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))
(declare-const k@51@01 Int)
(push) ; 2
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 3
; [then-branch: 14 | !(0 <= k@51@01) | live]
; [else-branch: 14 | 0 <= k@51@01 | live]
(push) ; 4
; [then-branch: 14 | !(0 <= k@51@01)]
(assert (not (<= 0 k@51@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | 0 <= k@51@01]
(assert (<= 0 k@51@01))
; [eval] k < P
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@51@01) (not (<= 0 k@51@01))))
(assert (and (<= 0 k@51@01) (< k@51@01 P@43@01)))
; [eval] hist[k]
(push) ; 3
(assert (not (>= k@51@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@51@01 (Seq_length hist@47@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@52@01 ($Ref) Int)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@51@01 Int)) (!
  (=>
    (and (<= 0 k@51@01) (< k@51@01 P@43@01))
    (or (<= 0 k@51@01) (not (<= 0 k@51@01))))
  :pattern ((Seq_index hist@47@01 k@51@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@51@01 Int) (k2@51@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@51@01) (< k1@51@01 P@43@01))
      (and (<= 0 k2@51@01) (< k2@51@01 P@43@01))
      (= (Seq_index hist@47@01 k1@51@01) (Seq_index hist@47@01 k2@51@01)))
    (= k1@51@01 k2@51@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@51@01 Int)) (!
  (=>
    (and (<= 0 k@51@01) (< k@51@01 P@43@01))
    (and
      (= (inv@52@01 (Seq_index hist@47@01 k@51@01)) k@51@01)
      (img@53@01 (Seq_index hist@47@01 k@51@01))))
  :pattern ((Seq_index hist@47@01 k@51@01))
  :qid |quant-u-61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
    (= (Seq_index hist@47@01 (inv@52@01 r)) r))
  :pattern ((inv@52@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@51@01 Int)) (!
  (=>
    (and (<= 0 k@51@01) (< k@51@01 P@43@01))
    (not (= (Seq_index hist@47@01 k@51@01) $Ref.null)))
  :pattern ((Seq_index hist@47@01 k@51@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))
  $Snap.unit))
; [eval] M * N <= |matrix|
; [eval] M * N
; [eval] |matrix|
(assert (<= (* M@45@01 N@44@01) (Seq_length matrix@46@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { matrix[j], matrix[k] } 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> matrix[j] != matrix[k])
(declare-const j@54@01 Int)
(declare-const k@55@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> matrix[j] != matrix[k]
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 15 | !(0 <= j@54@01) | live]
; [else-branch: 15 | 0 <= j@54@01 | live]
(push) ; 4
; [then-branch: 15 | !(0 <= j@54@01)]
(assert (not (<= 0 j@54@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | 0 <= j@54@01]
(assert (<= 0 j@54@01))
; [eval] j < M * N
; [eval] M * N
(push) ; 5
; [then-branch: 16 | !(j@54@01 < M@45@01 * N@44@01) | live]
; [else-branch: 16 | j@54@01 < M@45@01 * N@44@01 | live]
(push) ; 6
; [then-branch: 16 | !(j@54@01 < M@45@01 * N@44@01)]
(assert (not (< j@54@01 (* M@45@01 N@44@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | j@54@01 < M@45@01 * N@44@01]
(assert (< j@54@01 (* M@45@01 N@44@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 17 | !(0 <= k@55@01) | live]
; [else-branch: 17 | 0 <= k@55@01 | live]
(push) ; 8
; [then-branch: 17 | !(0 <= k@55@01)]
(assert (not (<= 0 k@55@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | 0 <= k@55@01]
(assert (<= 0 k@55@01))
; [eval] k < M * N
; [eval] M * N
(push) ; 9
; [then-branch: 18 | !(k@55@01 < M@45@01 * N@44@01) | live]
; [else-branch: 18 | k@55@01 < M@45@01 * N@44@01 | live]
(push) ; 10
; [then-branch: 18 | !(k@55@01 < M@45@01 * N@44@01)]
(assert (not (< k@55@01 (* M@45@01 N@44@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 18 | k@55@01 < M@45@01 * N@44@01]
(assert (< k@55@01 (* M@45@01 N@44@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@55@01 (* M@45@01 N@44@01)) (not (< k@55@01 (* M@45@01 N@44@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@55@01)
  (and
    (<= 0 k@55@01)
    (or (< k@55@01 (* M@45@01 N@44@01)) (not (< k@55@01 (* M@45@01 N@44@01)))))))
(assert (or (<= 0 k@55@01) (not (<= 0 k@55@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@54@01 (* M@45@01 N@44@01))
  (and
    (< j@54@01 (* M@45@01 N@44@01))
    (=>
      (<= 0 k@55@01)
      (and
        (<= 0 k@55@01)
        (or
          (< k@55@01 (* M@45@01 N@44@01))
          (not (< k@55@01 (* M@45@01 N@44@01))))))
    (or (<= 0 k@55@01) (not (<= 0 k@55@01))))))
(assert (or (< j@54@01 (* M@45@01 N@44@01)) (not (< j@54@01 (* M@45@01 N@44@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@54@01)
  (and
    (<= 0 j@54@01)
    (=>
      (< j@54@01 (* M@45@01 N@44@01))
      (and
        (< j@54@01 (* M@45@01 N@44@01))
        (=>
          (<= 0 k@55@01)
          (and
            (<= 0 k@55@01)
            (or
              (< k@55@01 (* M@45@01 N@44@01))
              (not (< k@55@01 (* M@45@01 N@44@01))))))
        (or (<= 0 k@55@01) (not (<= 0 k@55@01)))))
    (or (< j@54@01 (* M@45@01 N@44@01)) (not (< j@54@01 (* M@45@01 N@44@01)))))))
(assert (or (<= 0 j@54@01) (not (<= 0 j@54@01))))
(push) ; 3
; [then-branch: 19 | 0 <= j@54@01 && j@54@01 < M@45@01 * N@44@01 && 0 <= k@55@01 && k@55@01 < M@45@01 * N@44@01 && j@54@01 != k@55@01 | live]
; [else-branch: 19 | !(0 <= j@54@01 && j@54@01 < M@45@01 * N@44@01 && 0 <= k@55@01 && k@55@01 < M@45@01 * N@44@01 && j@54@01 != k@55@01) | live]
(push) ; 4
; [then-branch: 19 | 0 <= j@54@01 && j@54@01 < M@45@01 * N@44@01 && 0 <= k@55@01 && k@55@01 < M@45@01 * N@44@01 && j@54@01 != k@55@01]
(assert (and
  (<= 0 j@54@01)
  (and
    (< j@54@01 (* M@45@01 N@44@01))
    (and
      (<= 0 k@55@01)
      (and (< k@55@01 (* M@45@01 N@44@01)) (not (= j@54@01 k@55@01)))))))
; [eval] matrix[j] != matrix[k]
; [eval] matrix[j]
(push) ; 5
(assert (not (>= j@54@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@54@01 (Seq_length matrix@46@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] matrix[k]
(push) ; 5
(assert (not (>= k@55@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@55@01 (Seq_length matrix@46@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(0 <= j@54@01 && j@54@01 < M@45@01 * N@44@01 && 0 <= k@55@01 && k@55@01 < M@45@01 * N@44@01 && j@54@01 != k@55@01)]
(assert (not
  (and
    (<= 0 j@54@01)
    (and
      (< j@54@01 (* M@45@01 N@44@01))
      (and
        (<= 0 k@55@01)
        (and (< k@55@01 (* M@45@01 N@44@01)) (not (= j@54@01 k@55@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@54@01)
    (and
      (< j@54@01 (* M@45@01 N@44@01))
      (and
        (<= 0 k@55@01)
        (and (< k@55@01 (* M@45@01 N@44@01)) (not (= j@54@01 k@55@01))))))
  (and
    (<= 0 j@54@01)
    (< j@54@01 (* M@45@01 N@44@01))
    (<= 0 k@55@01)
    (< k@55@01 (* M@45@01 N@44@01))
    (not (= j@54@01 k@55@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@54@01)
      (and
        (< j@54@01 (* M@45@01 N@44@01))
        (and
          (<= 0 k@55@01)
          (and (< k@55@01 (* M@45@01 N@44@01)) (not (= j@54@01 k@55@01)))))))
  (and
    (<= 0 j@54@01)
    (and
      (< j@54@01 (* M@45@01 N@44@01))
      (and
        (<= 0 k@55@01)
        (and (< k@55@01 (* M@45@01 N@44@01)) (not (= j@54@01 k@55@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@54@01 Int) (k@55@01 Int)) (!
  (and
    (=>
      (<= 0 j@54@01)
      (and
        (<= 0 j@54@01)
        (=>
          (< j@54@01 (* M@45@01 N@44@01))
          (and
            (< j@54@01 (* M@45@01 N@44@01))
            (=>
              (<= 0 k@55@01)
              (and
                (<= 0 k@55@01)
                (or
                  (< k@55@01 (* M@45@01 N@44@01))
                  (not (< k@55@01 (* M@45@01 N@44@01))))))
            (or (<= 0 k@55@01) (not (<= 0 k@55@01)))))
        (or
          (< j@54@01 (* M@45@01 N@44@01))
          (not (< j@54@01 (* M@45@01 N@44@01))))))
    (or (<= 0 j@54@01) (not (<= 0 j@54@01)))
    (=>
      (and
        (<= 0 j@54@01)
        (and
          (< j@54@01 (* M@45@01 N@44@01))
          (and
            (<= 0 k@55@01)
            (and (< k@55@01 (* M@45@01 N@44@01)) (not (= j@54@01 k@55@01))))))
      (and
        (<= 0 j@54@01)
        (< j@54@01 (* M@45@01 N@44@01))
        (<= 0 k@55@01)
        (< k@55@01 (* M@45@01 N@44@01))
        (not (= j@54@01 k@55@01))))
    (or
      (not
        (and
          (<= 0 j@54@01)
          (and
            (< j@54@01 (* M@45@01 N@44@01))
            (and
              (<= 0 k@55@01)
              (and (< k@55@01 (* M@45@01 N@44@01)) (not (= j@54@01 k@55@01)))))))
      (and
        (<= 0 j@54@01)
        (and
          (< j@54@01 (* M@45@01 N@44@01))
          (and
            (<= 0 k@55@01)
            (and (< k@55@01 (* M@45@01 N@44@01)) (not (= j@54@01 k@55@01))))))))
  :pattern ((Seq_index matrix@46@01 j@54@01) (Seq_index matrix@46@01 k@55@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@109@12@109@112-aux|)))
(assert (forall ((j@54@01 Int) (k@55@01 Int)) (!
  (=>
    (and
      (<= 0 j@54@01)
      (and
        (< j@54@01 (* M@45@01 N@44@01))
        (and
          (<= 0 k@55@01)
          (and (< k@55@01 (* M@45@01 N@44@01)) (not (= j@54@01 k@55@01))))))
    (not (= (Seq_index matrix@46@01 j@54@01) (Seq_index matrix@46@01 k@55@01))))
  :pattern ((Seq_index matrix@46@01 j@54@01) (Seq_index matrix@46@01 k@55@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@109@12@109@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))))))))
(declare-const j@56@01 Int)
(push) ; 2
; [eval] 0 <= j && j < M * N
; [eval] 0 <= j
(push) ; 3
; [then-branch: 20 | !(0 <= j@56@01) | live]
; [else-branch: 20 | 0 <= j@56@01 | live]
(push) ; 4
; [then-branch: 20 | !(0 <= j@56@01)]
(assert (not (<= 0 j@56@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 20 | 0 <= j@56@01]
(assert (<= 0 j@56@01))
; [eval] j < M * N
; [eval] M * N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@56@01) (not (<= 0 j@56@01))))
(assert (and (<= 0 j@56@01) (< j@56@01 (* M@45@01 N@44@01))))
; [eval] matrix[j]
(push) ; 3
(assert (not (>= j@56@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@56@01 (Seq_length matrix@46@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@57@01 ($Ref) Int)
(declare-fun img@58@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@56@01 Int)) (!
  (=>
    (and (<= 0 j@56@01) (< j@56@01 (* M@45@01 N@44@01)))
    (or (<= 0 j@56@01) (not (<= 0 j@56@01))))
  :pattern ((Seq_index matrix@46@01 j@56@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@56@01 Int) (j2@56@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@56@01) (< j1@56@01 (* M@45@01 N@44@01)))
      (and (<= 0 j2@56@01) (< j2@56@01 (* M@45@01 N@44@01)))
      (= (Seq_index matrix@46@01 j1@56@01) (Seq_index matrix@46@01 j2@56@01)))
    (= j1@56@01 j2@56@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@56@01 Int)) (!
  (=>
    (and (<= 0 j@56@01) (< j@56@01 (* M@45@01 N@44@01)))
    (and
      (= (inv@57@01 (Seq_index matrix@46@01 j@56@01)) j@56@01)
      (img@58@01 (Seq_index matrix@46@01 j@56@01))))
  :pattern ((Seq_index matrix@46@01 j@56@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
    (= (Seq_index matrix@46@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@56@01 Int)) (!
  (=>
    (and (<= 0 j@56@01) (< j@56@01 (* M@45@01 N@44@01)))
    (not (= (Seq_index matrix@46@01 j@56@01) $Ref.null)))
  :pattern ((Seq_index matrix@46@01 j@56@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@46@01 j@56@01) (Seq_index hist@47@01 k@51@01))
    (=
      (and
        (img@58@01 r)
        (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
      (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))))
  
  :qid |quant-u-64|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { Ref__multidim_index_2(M, N, i, j) } 0 <= i && (i < M && (0 <= j && j < N)) ==> Ref__multidim_index_2(M, N, i, j) < |matrix|)
(declare-const i@59@01 Int)
(declare-const j@60@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> Ref__multidim_index_2(M, N, i, j) < |matrix|
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 21 | !(0 <= i@59@01) | live]
; [else-branch: 21 | 0 <= i@59@01 | live]
(push) ; 4
; [then-branch: 21 | !(0 <= i@59@01)]
(assert (not (<= 0 i@59@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 21 | 0 <= i@59@01]
(assert (<= 0 i@59@01))
; [eval] i < M
(push) ; 5
; [then-branch: 22 | !(i@59@01 < M@45@01) | live]
; [else-branch: 22 | i@59@01 < M@45@01 | live]
(push) ; 6
; [then-branch: 22 | !(i@59@01 < M@45@01)]
(assert (not (< i@59@01 M@45@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | i@59@01 < M@45@01]
(assert (< i@59@01 M@45@01))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 23 | !(0 <= j@60@01) | live]
; [else-branch: 23 | 0 <= j@60@01 | live]
(push) ; 8
; [then-branch: 23 | !(0 <= j@60@01)]
(assert (not (<= 0 j@60@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 23 | 0 <= j@60@01]
(assert (<= 0 j@60@01))
; [eval] j < N
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@60@01) (not (<= 0 j@60@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@59@01 M@45@01)
  (and (< i@59@01 M@45@01) (or (<= 0 j@60@01) (not (<= 0 j@60@01))))))
(assert (or (< i@59@01 M@45@01) (not (< i@59@01 M@45@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@59@01)
  (and
    (<= 0 i@59@01)
    (=>
      (< i@59@01 M@45@01)
      (and (< i@59@01 M@45@01) (or (<= 0 j@60@01) (not (<= 0 j@60@01)))))
    (or (< i@59@01 M@45@01) (not (< i@59@01 M@45@01))))))
(assert (or (<= 0 i@59@01) (not (<= 0 i@59@01))))
(push) ; 3
; [then-branch: 24 | 0 <= i@59@01 && i@59@01 < M@45@01 && 0 <= j@60@01 && j@60@01 < N@44@01 | live]
; [else-branch: 24 | !(0 <= i@59@01 && i@59@01 < M@45@01 && 0 <= j@60@01 && j@60@01 < N@44@01) | live]
(push) ; 4
; [then-branch: 24 | 0 <= i@59@01 && i@59@01 < M@45@01 && 0 <= j@60@01 && j@60@01 < N@44@01]
(assert (and
  (<= 0 i@59@01)
  (and (< i@59@01 M@45@01) (and (<= 0 j@60@01) (< j@60@01 N@44@01)))))
; [eval] Ref__multidim_index_2(M, N, i, j) < |matrix|
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 5
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 6
(assert (not (<= 0 M@45@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@45@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 6
(assert (not (<= 0 N@44@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@44@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@59@01 j@60@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (<= 0 M@45@01)
  (<= 0 N@44@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@59@01 j@60@01)))
; [eval] |matrix|
(pop) ; 4
(push) ; 4
; [else-branch: 24 | !(0 <= i@59@01 && i@59@01 < M@45@01 && 0 <= j@60@01 && j@60@01 < N@44@01)]
(assert (not
  (and
    (<= 0 i@59@01)
    (and (< i@59@01 M@45@01) (and (<= 0 j@60@01) (< j@60@01 N@44@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@59@01)
    (and (< i@59@01 M@45@01) (and (<= 0 j@60@01) (< j@60@01 N@44@01))))
  (and
    (<= 0 i@59@01)
    (< i@59@01 M@45@01)
    (<= 0 j@60@01)
    (< j@60@01 N@44@01)
    (<= 0 M@45@01)
    (<= 0 N@44@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@59@01 j@60@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@59@01)
      (and (< i@59@01 M@45@01) (and (<= 0 j@60@01) (< j@60@01 N@44@01)))))
  (and
    (<= 0 i@59@01)
    (and (< i@59@01 M@45@01) (and (<= 0 j@60@01) (< j@60@01 N@44@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@59@01 Int) (j@60@01 Int)) (!
  (and
    (=>
      (<= 0 i@59@01)
      (and
        (<= 0 i@59@01)
        (=>
          (< i@59@01 M@45@01)
          (and (< i@59@01 M@45@01) (or (<= 0 j@60@01) (not (<= 0 j@60@01)))))
        (or (< i@59@01 M@45@01) (not (< i@59@01 M@45@01)))))
    (or (<= 0 i@59@01) (not (<= 0 i@59@01)))
    (=>
      (and
        (<= 0 i@59@01)
        (and (< i@59@01 M@45@01) (and (<= 0 j@60@01) (< j@60@01 N@44@01))))
      (and
        (<= 0 i@59@01)
        (< i@59@01 M@45@01)
        (<= 0 j@60@01)
        (< j@60@01 N@44@01)
        (<= 0 M@45@01)
        (<= 0 N@44@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@59@01 j@60@01)))
    (or
      (not
        (and
          (<= 0 i@59@01)
          (and (< i@59@01 M@45@01) (and (<= 0 j@60@01) (< j@60@01 N@44@01)))))
      (and
        (<= 0 i@59@01)
        (and (< i@59@01 M@45@01) (and (<= 0 j@60@01) (< j@60@01 N@44@01))))))
  :pattern ((Ref__multidim_index_2%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@59@01 j@60@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@111@13@111@129-aux|)))
(assert (forall ((i@59@01 Int) (j@60@01 Int)) (!
  (=>
    (and
      (<= 0 i@59@01)
      (and (< i@59@01 M@45@01) (and (<= 0 j@60@01) (< j@60@01 N@44@01))))
    (<
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@59@01 j@60@01)
      (Seq_length matrix@46@01)))
  :pattern ((Ref__multidim_index_2%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@59@01 j@60@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@111@13@111@129|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { matrix[Ref__multidim_index_2(M, N, i, j)] } 0 <= i && (i < M && (0 <= j && j < N)) ==> 0 <= matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value && matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value < P)
(declare-const i@61@01 Int)
(declare-const j@62@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> 0 <= matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value && matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value < P
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 25 | !(0 <= i@61@01) | live]
; [else-branch: 25 | 0 <= i@61@01 | live]
(push) ; 4
; [then-branch: 25 | !(0 <= i@61@01)]
(assert (not (<= 0 i@61@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 25 | 0 <= i@61@01]
(assert (<= 0 i@61@01))
; [eval] i < M
(push) ; 5
; [then-branch: 26 | !(i@61@01 < M@45@01) | live]
; [else-branch: 26 | i@61@01 < M@45@01 | live]
(push) ; 6
; [then-branch: 26 | !(i@61@01 < M@45@01)]
(assert (not (< i@61@01 M@45@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 26 | i@61@01 < M@45@01]
(assert (< i@61@01 M@45@01))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 27 | !(0 <= j@62@01) | live]
; [else-branch: 27 | 0 <= j@62@01 | live]
(push) ; 8
; [then-branch: 27 | !(0 <= j@62@01)]
(assert (not (<= 0 j@62@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 27 | 0 <= j@62@01]
(assert (<= 0 j@62@01))
; [eval] j < N
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@62@01) (not (<= 0 j@62@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@61@01 M@45@01)
  (and (< i@61@01 M@45@01) (or (<= 0 j@62@01) (not (<= 0 j@62@01))))))
(assert (or (< i@61@01 M@45@01) (not (< i@61@01 M@45@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@61@01)
  (and
    (<= 0 i@61@01)
    (=>
      (< i@61@01 M@45@01)
      (and (< i@61@01 M@45@01) (or (<= 0 j@62@01) (not (<= 0 j@62@01)))))
    (or (< i@61@01 M@45@01) (not (< i@61@01 M@45@01))))))
(assert (or (<= 0 i@61@01) (not (<= 0 i@61@01))))
(push) ; 3
; [then-branch: 28 | 0 <= i@61@01 && i@61@01 < M@45@01 && 0 <= j@62@01 && j@62@01 < N@44@01 | live]
; [else-branch: 28 | !(0 <= i@61@01 && i@61@01 < M@45@01 && 0 <= j@62@01 && j@62@01 < N@44@01) | live]
(push) ; 4
; [then-branch: 28 | 0 <= i@61@01 && i@61@01 < M@45@01 && 0 <= j@62@01 && j@62@01 < N@44@01]
(assert (and
  (<= 0 i@61@01)
  (and (< i@61@01 M@45@01) (and (<= 0 j@62@01) (< j@62@01 N@44@01)))))
; [eval] 0 <= matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value && matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value < P
; [eval] 0 <= matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 5
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 6
(assert (not (<= 0 M@45@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@45@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 6
(assert (not (<= 0 N@44@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@44@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (<= 0 M@45@01)
  (<= 0 N@44@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))
(push) ; 5
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)
  0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)
  (Seq_length matrix@46@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const sm@63@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@64@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@64@01  $FPM) r)
    (+
      (ite
        (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@58@01 r)
          (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(push) ; 5
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@64@01  $FPM) (Seq_index
    matrix@46@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 29 | !(0 <= Lookup(Ref__Integer_value, sm@63@01, matrix@46@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@45@01, N@44@01, i@61@01, j@62@01)])) | live]
; [else-branch: 29 | 0 <= Lookup(Ref__Integer_value, sm@63@01, matrix@46@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@45@01, N@44@01, i@61@01, j@62@01)]) | live]
(push) ; 6
; [then-branch: 29 | !(0 <= Lookup(Ref__Integer_value, sm@63@01, matrix@46@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@45@01, N@44@01, i@61@01, j@62@01)]))]
(assert (not
  (<=
    0
    ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@46@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))))))
(pop) ; 6
(push) ; 6
; [else-branch: 29 | 0 <= Lookup(Ref__Integer_value, sm@63@01, matrix@46@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@45@01, N@44@01, i@61@01, j@62@01)])]
(assert (<=
  0
  ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
    matrix@46@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))))
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value < P
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 7
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)
  0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)
  (Seq_length matrix@46@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@58@01 r)
        (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r))
    :qid |qp.fvfValDef1|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@53@01 (Seq_index
          matrix@46@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))
        (and
          (<=
            0
            (inv@52@01 (Seq_index
              matrix@46@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))))
          (<
            (inv@52@01 (Seq_index
              matrix@46@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))
            P@43@01)))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@58@01 (Seq_index
          matrix@46@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))
        (and
          (<=
            0
            (inv@57@01 (Seq_index
              matrix@46@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))))
          (<
            (inv@57@01 (Seq_index
              matrix@46@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))
            (* M@45@01 N@44@01))))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (or
  (<=
    0
    ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@46@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))))
  (not
    (<=
      0
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@46@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))))))
(pop) ; 4
(push) ; 4
; [else-branch: 28 | !(0 <= i@61@01 && i@61@01 < M@45@01 && 0 <= j@62@01 && j@62@01 < N@44@01)]
(assert (not
  (and
    (<= 0 i@61@01)
    (and (< i@61@01 M@45@01) (and (<= 0 j@62@01) (< j@62@01 N@44@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@64@01  $FPM) r)
    (+
      (ite
        (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@58@01 r)
          (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (=>
  (and
    (<= 0 i@61@01)
    (and (< i@61@01 M@45@01) (and (<= 0 j@62@01) (< j@62@01 N@44@01))))
  (and
    (<= 0 i@61@01)
    (< i@61@01 M@45@01)
    (<= 0 j@62@01)
    (< j@62@01 N@44@01)
    (<= 0 M@45@01)
    (<= 0 N@44@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)
    (or
      (<=
        0
        ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@46@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))))
      (not
        (<=
          0
          ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
            matrix@46@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@61@01)
      (and (< i@61@01 M@45@01) (and (<= 0 j@62@01) (< j@62@01 N@44@01)))))
  (and
    (<= 0 i@61@01)
    (and (< i@61@01 M@45@01) (and (<= 0 j@62@01) (< j@62@01 N@44@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@64@01  $FPM) r)
    (+
      (ite
        (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@58@01 r)
          (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@61@01 Int) (j@62@01 Int)) (!
  (and
    (=>
      (<= 0 i@61@01)
      (and
        (<= 0 i@61@01)
        (=>
          (< i@61@01 M@45@01)
          (and (< i@61@01 M@45@01) (or (<= 0 j@62@01) (not (<= 0 j@62@01)))))
        (or (< i@61@01 M@45@01) (not (< i@61@01 M@45@01)))))
    (or (<= 0 i@61@01) (not (<= 0 i@61@01)))
    (=>
      (and
        (<= 0 i@61@01)
        (and (< i@61@01 M@45@01) (and (<= 0 j@62@01) (< j@62@01 N@44@01))))
      (and
        (<= 0 i@61@01)
        (< i@61@01 M@45@01)
        (<= 0 j@62@01)
        (< j@62@01 N@44@01)
        (<= 0 M@45@01)
        (<= 0 N@44@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)
        (or
          (<=
            0
            ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
              matrix@46@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))))
          (not
            (<=
              0
              ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
                matrix@46@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))))))))
    (or
      (not
        (and
          (<= 0 i@61@01)
          (and (< i@61@01 M@45@01) (and (<= 0 j@62@01) (< j@62@01 N@44@01)))))
      (and
        (<= 0 i@61@01)
        (and (< i@61@01 M@45@01) (and (<= 0 j@62@01) (< j@62@01 N@44@01))))))
  :pattern ((Seq_index
    matrix@46@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@112@13@112@222-aux|)))
(assert (forall ((i@61@01 Int) (j@62@01 Int)) (!
  (=>
    (and
      (<= 0 i@61@01)
      (and (< i@61@01 M@45@01) (and (<= 0 j@62@01) (< j@62@01 N@44@01))))
    (and
      (<=
        0
        ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@46@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01))))
      (<
        ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@46@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))
        P@43@01)))
  :pattern ((Seq_index
    matrix@46@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@45@01 N@44@01 i@61@01 j@62@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@112@13@112@222|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 ($Snap.combine ($Snap.first $t@65@01) ($Snap.second $t@65@01))))
(assert (= ($Snap.first $t@65@01) $Snap.unit))
; [eval] M > 0
(assert (=
  ($Snap.second $t@65@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@65@01))
    ($Snap.second ($Snap.second $t@65@01)))))
(assert (= ($Snap.first ($Snap.second $t@65@01)) $Snap.unit))
; [eval] N > 0
(assert (=
  ($Snap.second ($Snap.second $t@65@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@65@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@65@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@65@01))) $Snap.unit))
; [eval] P > 0
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@65@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))))
(declare-const j@66@01 Int)
(push) ; 3
; [eval] 0 <= j && j < M * N
; [eval] 0 <= j
(push) ; 4
; [then-branch: 30 | !(0 <= j@66@01) | live]
; [else-branch: 30 | 0 <= j@66@01 | live]
(push) ; 5
; [then-branch: 30 | !(0 <= j@66@01)]
(assert (not (<= 0 j@66@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 30 | 0 <= j@66@01]
(assert (<= 0 j@66@01))
; [eval] j < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@66@01) (not (<= 0 j@66@01))))
(assert (and (<= 0 j@66@01) (< j@66@01 (* M@45@01 N@44@01))))
; [eval] matrix[j]
(push) ; 4
(assert (not (>= j@66@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@66@01 (Seq_length matrix@46@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@67@01 ($Ref) Int)
(declare-fun img@68@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@66@01 Int)) (!
  (=>
    (and (<= 0 j@66@01) (< j@66@01 (* M@45@01 N@44@01)))
    (or (<= 0 j@66@01) (not (<= 0 j@66@01))))
  :pattern ((Seq_index matrix@46@01 j@66@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@66@01 Int) (j2@66@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@66@01) (< j1@66@01 (* M@45@01 N@44@01)))
      (and (<= 0 j2@66@01) (< j2@66@01 (* M@45@01 N@44@01)))
      (= (Seq_index matrix@46@01 j1@66@01) (Seq_index matrix@46@01 j2@66@01)))
    (= j1@66@01 j2@66@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@66@01 Int)) (!
  (=>
    (and (<= 0 j@66@01) (< j@66@01 (* M@45@01 N@44@01)))
    (and
      (= (inv@67@01 (Seq_index matrix@46@01 j@66@01)) j@66@01)
      (img@68@01 (Seq_index matrix@46@01 j@66@01))))
  :pattern ((Seq_index matrix@46@01 j@66@01))
  :qid |quant-u-66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
    (= (Seq_index matrix@46@01 (inv@67@01 r)) r))
  :pattern ((inv@67@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@66@01 Int)) (!
  (=>
    (and (<= 0 j@66@01) (< j@66@01 (* M@45@01 N@44@01)))
    (not (= (Seq_index matrix@46@01 j@66@01) $Ref.null)))
  :pattern ((Seq_index matrix@46@01 j@66@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01))))))))
(declare-const k@69@01 Int)
(push) ; 3
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 31 | !(0 <= k@69@01) | live]
; [else-branch: 31 | 0 <= k@69@01 | live]
(push) ; 5
; [then-branch: 31 | !(0 <= k@69@01)]
(assert (not (<= 0 k@69@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 31 | 0 <= k@69@01]
(assert (<= 0 k@69@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@69@01) (not (<= 0 k@69@01))))
(assert (and (<= 0 k@69@01) (< k@69@01 P@43@01)))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@69@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@69@01 (Seq_length hist@47@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@70@01 ($Ref) Int)
(declare-fun img@71@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@69@01 Int)) (!
  (=>
    (and (<= 0 k@69@01) (< k@69@01 P@43@01))
    (or (<= 0 k@69@01) (not (<= 0 k@69@01))))
  :pattern ((Seq_index hist@47@01 k@69@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@69@01 Int) (k2@69@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@69@01) (< k1@69@01 P@43@01))
      (and (<= 0 k2@69@01) (< k2@69@01 P@43@01))
      (= (Seq_index hist@47@01 k1@69@01) (Seq_index hist@47@01 k2@69@01)))
    (= k1@69@01 k2@69@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@69@01 Int)) (!
  (=>
    (and (<= 0 k@69@01) (< k@69@01 P@43@01))
    (and
      (= (inv@70@01 (Seq_index hist@47@01 k@69@01)) k@69@01)
      (img@71@01 (Seq_index hist@47@01 k@69@01))))
  :pattern ((Seq_index hist@47@01 k@69@01))
  :qid |quant-u-68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01)))
    (= (Seq_index hist@47@01 (inv@70@01 r)) r))
  :pattern ((inv@70@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@69@01 Int)) (!
  (=>
    (and (<= 0 k@69@01) (< k@69@01 P@43@01))
    (not (= (Seq_index hist@47@01 k@69@01) $Ref.null)))
  :pattern ((Seq_index hist@47@01 k@69@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index hist@47@01 k@69@01) (Seq_index matrix@46@01 j@66@01))
    (=
      (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01)))
      (and
        (img@68@01 r)
        (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))))
  
  :qid |quant-u-69|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))
  $Snap.unit))
; [eval] (forall k: Int :: { old(hist[k]) } 0 <= k && k < P ==> hist[k].Ref__Integer_value == old(hist[k].Ref__Integer_value) + count_array(0, M * N, matrix, k))
(declare-const k@72@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < P ==> hist[k].Ref__Integer_value == old(hist[k].Ref__Integer_value) + count_array(0, M * N, matrix, k)
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 32 | !(0 <= k@72@01) | live]
; [else-branch: 32 | 0 <= k@72@01 | live]
(push) ; 5
; [then-branch: 32 | !(0 <= k@72@01)]
(assert (not (<= 0 k@72@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 32 | 0 <= k@72@01]
(assert (<= 0 k@72@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@72@01) (not (<= 0 k@72@01))))
(push) ; 4
; [then-branch: 33 | 0 <= k@72@01 && k@72@01 < P@43@01 | live]
; [else-branch: 33 | !(0 <= k@72@01 && k@72@01 < P@43@01) | live]
(push) ; 5
; [then-branch: 33 | 0 <= k@72@01 && k@72@01 < P@43@01]
(assert (and (<= 0 k@72@01) (< k@72@01 P@43@01)))
; [eval] hist[k].Ref__Integer_value == old(hist[k].Ref__Integer_value) + count_array(0, M * N, matrix, k)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@72@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@72@01 (Seq_length hist@47@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@73@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@74@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r)
    (+
      (ite
        (and
          (img@68@01 r)
          (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (ite
        (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) (Seq_index
    hist@47@01
    k@72@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(hist[k].Ref__Integer_value) + count_array(0, M * N, matrix, k)
; [eval] old(hist[k].Ref__Integer_value)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@72@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@72@01 (Seq_length hist@47@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@58@01 r)
        (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r))
    :qid |qp.fvfValDef1|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@53@01 (Seq_index hist@47@01 k@72@01))
        (and
          (<= 0 (inv@52@01 (Seq_index hist@47@01 k@72@01)))
          (< (inv@52@01 (Seq_index hist@47@01 k@72@01)) P@43@01)))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@58@01 (Seq_index hist@47@01 k@72@01))
        (and
          (<= 0 (inv@57@01 (Seq_index hist@47@01 k@72@01)))
          (< (inv@57@01 (Seq_index hist@47@01 k@72@01)) (* M@45@01 N@44@01))))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] count_array(0, M * N, matrix, k)
; [eval] M * N
(push) ; 6
; [eval] 0 <= i
; [eval] i <= hi
(push) ; 7
(assert (not (<= 0 (* M@45@01 N@44@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (* M@45@01 N@44@01)))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall j: Int, k: Int ::0 <= j && (j < hi && (0 <= k && (k < hi && j != k))) ==> ar[j] != ar[k])
(declare-const j@75@01 Int)
(declare-const k@76@01 Int)
(push) ; 7
; [eval] 0 <= j && (j < hi && (0 <= k && (k < hi && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < hi && (0 <= k && (k < hi && j != k)))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 34 | !(0 <= j@75@01) | live]
; [else-branch: 34 | 0 <= j@75@01 | live]
(push) ; 9
; [then-branch: 34 | !(0 <= j@75@01)]
(assert (not (<= 0 j@75@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 34 | 0 <= j@75@01]
(assert (<= 0 j@75@01))
; [eval] j < hi
(push) ; 10
; [then-branch: 35 | !(j@75@01 < M@45@01 * N@44@01) | live]
; [else-branch: 35 | j@75@01 < M@45@01 * N@44@01 | live]
(push) ; 11
; [then-branch: 35 | !(j@75@01 < M@45@01 * N@44@01)]
(assert (not (< j@75@01 (* M@45@01 N@44@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 35 | j@75@01 < M@45@01 * N@44@01]
(assert (< j@75@01 (* M@45@01 N@44@01)))
; [eval] 0 <= k
(push) ; 12
; [then-branch: 36 | !(0 <= k@76@01) | live]
; [else-branch: 36 | 0 <= k@76@01 | live]
(push) ; 13
; [then-branch: 36 | !(0 <= k@76@01)]
(assert (not (<= 0 k@76@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 36 | 0 <= k@76@01]
(assert (<= 0 k@76@01))
; [eval] k < hi
(push) ; 14
; [then-branch: 37 | !(k@76@01 < M@45@01 * N@44@01) | live]
; [else-branch: 37 | k@76@01 < M@45@01 * N@44@01 | live]
(push) ; 15
; [then-branch: 37 | !(k@76@01 < M@45@01 * N@44@01)]
(assert (not (< k@76@01 (* M@45@01 N@44@01))))
(pop) ; 15
(push) ; 15
; [else-branch: 37 | k@76@01 < M@45@01 * N@44@01]
(assert (< k@76@01 (* M@45@01 N@44@01)))
; [eval] j != k
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (< k@76@01 (* M@45@01 N@44@01)) (not (< k@76@01 (* M@45@01 N@44@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@76@01)
  (and
    (<= 0 k@76@01)
    (or (< k@76@01 (* M@45@01 N@44@01)) (not (< k@76@01 (* M@45@01 N@44@01)))))))
(assert (or (<= 0 k@76@01) (not (<= 0 k@76@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@75@01 (* M@45@01 N@44@01))
  (and
    (< j@75@01 (* M@45@01 N@44@01))
    (=>
      (<= 0 k@76@01)
      (and
        (<= 0 k@76@01)
        (or
          (< k@76@01 (* M@45@01 N@44@01))
          (not (< k@76@01 (* M@45@01 N@44@01))))))
    (or (<= 0 k@76@01) (not (<= 0 k@76@01))))))
(assert (or (< j@75@01 (* M@45@01 N@44@01)) (not (< j@75@01 (* M@45@01 N@44@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@75@01)
  (and
    (<= 0 j@75@01)
    (=>
      (< j@75@01 (* M@45@01 N@44@01))
      (and
        (< j@75@01 (* M@45@01 N@44@01))
        (=>
          (<= 0 k@76@01)
          (and
            (<= 0 k@76@01)
            (or
              (< k@76@01 (* M@45@01 N@44@01))
              (not (< k@76@01 (* M@45@01 N@44@01))))))
        (or (<= 0 k@76@01) (not (<= 0 k@76@01)))))
    (or (< j@75@01 (* M@45@01 N@44@01)) (not (< j@75@01 (* M@45@01 N@44@01)))))))
(assert (or (<= 0 j@75@01) (not (<= 0 j@75@01))))
(push) ; 8
; [then-branch: 38 | 0 <= j@75@01 && j@75@01 < M@45@01 * N@44@01 && 0 <= k@76@01 && k@76@01 < M@45@01 * N@44@01 && j@75@01 != k@76@01 | live]
; [else-branch: 38 | !(0 <= j@75@01 && j@75@01 < M@45@01 * N@44@01 && 0 <= k@76@01 && k@76@01 < M@45@01 * N@44@01 && j@75@01 != k@76@01) | live]
(push) ; 9
; [then-branch: 38 | 0 <= j@75@01 && j@75@01 < M@45@01 * N@44@01 && 0 <= k@76@01 && k@76@01 < M@45@01 * N@44@01 && j@75@01 != k@76@01]
(assert (and
  (<= 0 j@75@01)
  (and
    (< j@75@01 (* M@45@01 N@44@01))
    (and
      (<= 0 k@76@01)
      (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 10
(assert (not (>= j@75@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< j@75@01 (Seq_length matrix@46@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 10
(assert (not (>= k@76@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< k@76@01 (Seq_length matrix@46@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 38 | !(0 <= j@75@01 && j@75@01 < M@45@01 * N@44@01 && 0 <= k@76@01 && k@76@01 < M@45@01 * N@44@01 && j@75@01 != k@76@01)]
(assert (not
  (and
    (<= 0 j@75@01)
    (and
      (< j@75@01 (* M@45@01 N@44@01))
      (and
        (<= 0 k@76@01)
        (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@75@01)
    (and
      (< j@75@01 (* M@45@01 N@44@01))
      (and
        (<= 0 k@76@01)
        (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01))))))
  (and
    (<= 0 j@75@01)
    (< j@75@01 (* M@45@01 N@44@01))
    (<= 0 k@76@01)
    (< k@76@01 (* M@45@01 N@44@01))
    (not (= j@75@01 k@76@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@75@01)
      (and
        (< j@75@01 (* M@45@01 N@44@01))
        (and
          (<= 0 k@76@01)
          (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01)))))))
  (and
    (<= 0 j@75@01)
    (and
      (< j@75@01 (* M@45@01 N@44@01))
      (and
        (<= 0 k@76@01)
        (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01))))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 7
(assert (not (forall ((j@75@01 Int) (k@76@01 Int)) (!
  (=>
    (and
      (<= 0 j@75@01)
      (and
        (< j@75@01 (* M@45@01 N@44@01))
        (and
          (<= 0 k@76@01)
          (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01))))))
    (not (= (Seq_index matrix@46@01 j@75@01) (Seq_index matrix@46@01 k@76@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@75@01 Int) (k@76@01 Int)) (!
  (=>
    (and
      (<= 0 j@75@01)
      (and
        (< j@75@01 (* M@45@01 N@44@01))
        (and
          (<= 0 k@76@01)
          (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01))))))
    (not (= (Seq_index matrix@46@01 j@75@01) (Seq_index matrix@46@01 k@76@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|)))
(declare-const k@77@01 Int)
(push) ; 7
; [eval] 0 <= k && k < hi
; [eval] 0 <= k
(push) ; 8
; [then-branch: 39 | !(0 <= k@77@01) | live]
; [else-branch: 39 | 0 <= k@77@01 | live]
(push) ; 9
; [then-branch: 39 | !(0 <= k@77@01)]
(assert (not (<= 0 k@77@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 39 | 0 <= k@77@01]
(assert (<= 0 k@77@01))
; [eval] k < hi
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@77@01) (not (<= 0 k@77@01))))
(assert (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01))))
(declare-const $k@78@01 $Perm)
(assert ($Perm.isReadVar $k@78@01))
; [eval] ar[k]
(push) ; 8
(assert (not (>= k@77@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< k@77@01 (Seq_length matrix@46@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(declare-fun inv@79@01 ($Ref) Int)
(declare-fun img@80@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@78@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@77@01 Int)) (!
  (=>
    (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01)))
    (or (<= 0 k@77@01) (not (<= 0 k@77@01))))
  :pattern ((Seq_index matrix@46@01 k@77@01))
  :qid |Ref__Integer_value-aux|)))
(push) ; 7
(assert (not (forall ((k@77@01 Int)) (!
  (=>
    (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01)))
    (or (= $k@78@01 $Perm.No) (< $Perm.No $k@78@01)))
  
  :qid |quant-u-70|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((k1@77@01 Int) (k2@77@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 k1@77@01) (< k1@77@01 (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01))
      (and
        (and (<= 0 k2@77@01) (< k2@77@01 (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01))
      (= (Seq_index matrix@46@01 k1@77@01) (Seq_index matrix@46@01 k2@77@01)))
    (= k1@77@01 k2@77@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@77@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01)))
      (< $Perm.No $k@78@01))
    (and
      (= (inv@79@01 (Seq_index matrix@46@01 k@77@01)) k@77@01)
      (img@80@01 (Seq_index matrix@46@01 k@77@01))))
  :pattern ((Seq_index matrix@46@01 k@77@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@80@01 r)
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)))
    (= (Seq_index matrix@46@01 (inv@79@01 r)) r))
  :pattern ((inv@79@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((k@77@01 Int)) (!
  (= (Seq_index matrix@46@01 k@77@01) (Seq_index hist@47@01 k@77@01))
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@81@01 ((r $Ref) (k@72@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
      (img@80@01 r)
      (= r (Seq_index matrix@46@01 (inv@79@01 r))))
    ($Perm.min
      (ite
        (and
          (img@68@01 r)
          (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      $k@78@01)
    $Perm.No))
(define-fun pTaken@82@01 ((r $Ref) (k@72@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
      (img@80@01 r)
      (= r (Seq_index matrix@46@01 (inv@79@01 r))))
    ($Perm.min
      (ite
        (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01)))
        $Perm.Write
        $Perm.No)
      (- $k@78@01 (pTaken@81@01 r k@72@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@78@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@68@01 r)
            (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
          (/ (to_real 1) (to_real 4))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@68@01 r)
        (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
      (<
        (ite
          (and
            (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
            (img@80@01 r)
            (= r (Seq_index matrix@46@01 (inv@79@01 r))))
          $k@78@01
          $Perm.No)
        (/ (to_real 1) (to_real 4)))
      (<
        (ite
          (and
            (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
            (img@80@01 r)
            (= r (Seq_index matrix@46@01 (inv@79@01 r))))
          $k@78@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@68@01 r))
  :pattern ((inv@67@01 r))
  :pattern ((img@80@01 r))
  :pattern ((Seq_index matrix@46@01 (inv@79@01 r)))
  :qid |qp.srp6|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
      (img@80@01 r)
      (= r (Seq_index matrix@46@01 (inv@79@01 r))))
    (= (- $k@78@01 (pTaken@81@01 r k@72@01)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@83@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r)))
    (=>
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef9|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (and
        (img@68@01 r)
        (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (count_array%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@83@01  $FVF<Ref__Integer_value>)))))) 0 (*
  M@45@01
  N@44@01) matrix@46@01 k@72@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@78@01))
(assert (forall ((k@77@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01)))
      (< $Perm.No $k@78@01))
    (and
      (= (inv@79@01 (Seq_index matrix@46@01 k@77@01)) k@77@01)
      (img@80@01 (Seq_index matrix@46@01 k@77@01))))
  :pattern ((Seq_index matrix@46@01 k@77@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@80@01 r)
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)))
    (= (Seq_index matrix@46@01 (inv@79@01 r)) r))
  :pattern ((inv@79@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r)))
    (=>
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (and
        (img@68@01 r)
        (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (and
  (<= 0 (* M@45@01 N@44@01))
  (forall ((j@75@01 Int) (k@76@01 Int)) (!
    (=>
      (and
        (<= 0 j@75@01)
        (and
          (< j@75@01 (* M@45@01 N@44@01))
          (and
            (<= 0 k@76@01)
            (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01))))))
      (not (= (Seq_index matrix@46@01 j@75@01) (Seq_index matrix@46@01 k@76@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
  (forall ((k@77@01 Int)) (!
    (=>
      (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01)))
      (or (<= 0 k@77@01) (not (<= 0 k@77@01))))
    :pattern ((Seq_index matrix@46@01 k@77@01))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@68@01 r)
              (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
            (/ (to_real 1) (to_real 4))
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@68@01 r)
          (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
        (<
          (ite
            (and
              (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
              (img@80@01 r)
              (= r (Seq_index matrix@46@01 (inv@79@01 r))))
            $k@78@01
            $Perm.No)
          (/ (to_real 1) (to_real 4)))
        (<
          (ite
            (and
              (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
              (img@80@01 r)
              (= r (Seq_index matrix@46@01 (inv@79@01 r))))
            $k@78@01
            $Perm.No)
          $Perm.No)))
    :pattern ((img@68@01 r))
    :pattern ((inv@67@01 r))
    :pattern ((img@80@01 r))
    :pattern ((Seq_index matrix@46@01 (inv@79@01 r)))
    :qid |qp.srp6|))
  (count_array%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@83@01  $FVF<Ref__Integer_value>)))))) 0 (*
    M@45@01
    N@44@01) matrix@46@01 k@72@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 33 | !(0 <= k@72@01 && k@72@01 < P@43@01)]
(assert (not (and (<= 0 k@72@01) (< k@72@01 P@43@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r)
    (+
      (ite
        (and
          (img@68@01 r)
          (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (ite
        (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert ($Perm.isReadVar $k@78@01))
(assert (forall ((k@77@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01)))
      (< $Perm.No $k@78@01))
    (and
      (= (inv@79@01 (Seq_index matrix@46@01 k@77@01)) k@77@01)
      (img@80@01 (Seq_index matrix@46@01 k@77@01))))
  :pattern ((Seq_index matrix@46@01 k@77@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@80@01 r)
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)))
    (= (Seq_index matrix@46@01 (inv@79@01 r)) r))
  :pattern ((inv@79@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r)))
    (=>
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (and
        (img@68@01 r)
        (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (=>
  (and (<= 0 k@72@01) (< k@72@01 P@43@01))
  (and
    (<= 0 k@72@01)
    (< k@72@01 P@43@01)
    (<= 0 (* M@45@01 N@44@01))
    (forall ((j@75@01 Int) (k@76@01 Int)) (!
      (=>
        (and
          (<= 0 j@75@01)
          (and
            (< j@75@01 (* M@45@01 N@44@01))
            (and
              (<= 0 k@76@01)
              (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01))))))
        (not
          (= (Seq_index matrix@46@01 j@75@01) (Seq_index matrix@46@01 k@76@01))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
    (forall ((k@77@01 Int)) (!
      (=>
        (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01)))
        (or (<= 0 k@77@01) (not (<= 0 k@77@01))))
      :pattern ((Seq_index matrix@46@01 k@77@01))
      :qid |Ref__Integer_value-aux|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@68@01 r)
                (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
              (/ (to_real 1) (to_real 4))
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@68@01 r)
            (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
          (<
            (ite
              (and
                (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
                (img@80@01 r)
                (= r (Seq_index matrix@46@01 (inv@79@01 r))))
              $k@78@01
              $Perm.No)
            (/ (to_real 1) (to_real 4)))
          (<
            (ite
              (and
                (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
                (img@80@01 r)
                (= r (Seq_index matrix@46@01 (inv@79@01 r))))
              $k@78@01
              $Perm.No)
            $Perm.No)))
      :pattern ((img@68@01 r))
      :pattern ((inv@67@01 r))
      :pattern ((img@80@01 r))
      :pattern ((Seq_index matrix@46@01 (inv@79@01 r)))
      :qid |qp.srp6|))
    (count_array%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@83@01  $FVF<Ref__Integer_value>)))))) 0 (*
      M@45@01
      N@44@01) matrix@46@01 k@72@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@72@01) (< k@72@01 P@43@01)))
  (and (<= 0 k@72@01) (< k@72@01 P@43@01))))
; [eval] old(hist[k])
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@72@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r)
    (+
      (ite
        (and
          (img@68@01 r)
          (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (ite
        (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (and (<= 0 (inv@52@01 r)) (< (inv@52@01 r) P@43@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (* M@45@01 N@44@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert ($Perm.isReadVar $k@78@01))
(assert (forall ((k@77@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01)))
      (< $Perm.No $k@78@01))
    (and
      (= (inv@79@01 (Seq_index matrix@46@01 k@77@01)) k@77@01)
      (img@80@01 (Seq_index matrix@46@01 k@77@01))))
  :pattern ((Seq_index matrix@46@01 k@77@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@80@01 r)
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)))
    (= (Seq_index matrix@46@01 (inv@79@01 r)) r))
  :pattern ((inv@79@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r)))
    (=>
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (and
        (img@68@01 r)
        (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@65@01))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@79@01 r)) (< (inv@79@01 r) (* M@45@01 N@44@01)))
        (< $Perm.No $k@78@01)
        (img@80@01 r))
      (and (img@71@01 r) (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) P@43@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@83@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@65@01)))))) r))
  :qid |qp.fvfValDef8|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@72@01 Int)) (!
  (and
    (or (<= 0 k@72@01) (not (<= 0 k@72@01)))
    (=>
      (and (<= 0 k@72@01) (< k@72@01 P@43@01))
      (and
        (<= 0 k@72@01)
        (< k@72@01 P@43@01)
        (<= 0 (* M@45@01 N@44@01))
        (forall ((j@75@01 Int) (k@76@01 Int)) (!
          (=>
            (and
              (<= 0 j@75@01)
              (and
                (< j@75@01 (* M@45@01 N@44@01))
                (and
                  (<= 0 k@76@01)
                  (and (< k@76@01 (* M@45@01 N@44@01)) (not (= j@75@01 k@76@01))))))
            (not
              (=
                (Seq_index matrix@46@01 j@75@01)
                (Seq_index matrix@46@01 k@76@01))))
          
          :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
        (forall ((k@77@01 Int)) (!
          (=>
            (and (<= 0 k@77@01) (< k@77@01 (* M@45@01 N@44@01)))
            (or (<= 0 k@77@01) (not (<= 0 k@77@01))))
          :pattern ((Seq_index matrix@46@01 k@77@01))
          :qid |Ref__Integer_value-aux|))
        (forall ((r $Ref)) (!
          (=>
            (not
              (=
                (ite
                  (and
                    (img@68@01 r)
                    (and
                      (<= 0 (inv@67@01 r))
                      (< (inv@67@01 r) (* M@45@01 N@44@01))))
                  (/ (to_real 1) (to_real 4))
                  $Perm.No)
                $Perm.No))
            (ite
              (and
                (img@68@01 r)
                (and (<= 0 (inv@67@01 r)) (< (inv@67@01 r) (* M@45@01 N@44@01))))
              (<
                (ite
                  (and
                    (and
                      (<= 0 (inv@79@01 r))
                      (< (inv@79@01 r) (* M@45@01 N@44@01)))
                    (img@80@01 r)
                    (= r (Seq_index matrix@46@01 (inv@79@01 r))))
                  $k@78@01
                  $Perm.No)
                (/ (to_real 1) (to_real 4)))
              (<
                (ite
                  (and
                    (and
                      (<= 0 (inv@79@01 r))
                      (< (inv@79@01 r) (* M@45@01 N@44@01)))
                    (img@80@01 r)
                    (= r (Seq_index matrix@46@01 (inv@79@01 r))))
                  $k@78@01
                  $Perm.No)
                $Perm.No)))
          :pattern ((img@68@01 r))
          :pattern ((inv@67@01 r))
          :pattern ((img@80@01 r))
          :pattern ((Seq_index matrix@46@01 (inv@79@01 r)))
          :qid |qp.srp6|))
        (count_array%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@83@01  $FVF<Ref__Integer_value>)))))) 0 (*
          M@45@01
          N@44@01) matrix@46@01 k@72@01)))
    (or
      (not (and (<= 0 k@72@01) (< k@72@01 P@43@01)))
      (and (<= 0 k@72@01) (< k@72@01 P@43@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@116@12@116@151-aux|)))
(assert (forall ((k@72@01 Int)) (!
  (=>
    (and (<= 0 k@72@01) (< k@72@01 P@43@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        hist@47@01
        k@72@01))
      (+
        ($FVF.lookup_Ref__Integer_value (as sm@63@01  $FVF<Ref__Integer_value>) (Seq_index
          hist@47@01
          k@72@01))
        (count_array ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@83@01  $FVF<Ref__Integer_value>)))))) 0 (*
          M@45@01
          N@44@01) matrix@46@01 k@72@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@116@12@116@151|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_body_96 ----------
(declare-const diz@84@01 $Ref)
(declare-const current_thread_id@85@01 Int)
(declare-const matrix@86@01 Seq<$Ref>)
(declare-const j@87@01 Int)
(declare-const i@88@01 Int)
(declare-const P@89@01 Int)
(declare-const hist@90@01 Seq<$Ref>)
(declare-const N@91@01 Int)
(declare-const M@92@01 Int)
(declare-const diz@93@01 $Ref)
(declare-const current_thread_id@94@01 Int)
(declare-const matrix@95@01 Seq<$Ref>)
(declare-const j@96@01 Int)
(declare-const i@97@01 Int)
(declare-const P@98@01 Int)
(declare-const hist@99@01 Seq<$Ref>)
(declare-const N@100@01 Int)
(declare-const M@101@01 Int)
(push) ; 1
(declare-const $t@102@01 $Snap)
(assert (= $t@102@01 ($Snap.combine ($Snap.first $t@102@01) ($Snap.second $t@102@01))))
(assert (= ($Snap.first $t@102@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@93@01 $Ref.null)))
(assert (=
  ($Snap.second $t@102@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@102@01))
    ($Snap.second ($Snap.second $t@102@01)))))
(assert (= ($Snap.first ($Snap.second $t@102@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@94@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@102@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@102@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@102@01))) $Snap.unit))
; [eval] M > 0
(assert (> M@101@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@102@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@102@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@102@01))))
  $Snap.unit))
; [eval] N > 0
(assert (> N@100@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))
  $Snap.unit))
; [eval] P > 0
(assert (> P@98@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))
  $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@97@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))
  $Snap.unit))
; [eval] i < M
(assert (< i@97@01 M@101@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))
  $Snap.unit))
; [eval] 0 <= j
(assert (<= 0 j@96@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))
  $Snap.unit))
; [eval] j < N
(assert (< j@96@01 N@100@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))
  $Snap.unit))
; [eval] P <= |hist|
; [eval] |hist|
(assert (<= P@98@01 (Seq_length hist@99@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))
  $Snap.unit))
; [eval] (forall j1: Int, k: Int :: { hist[j1], hist[k] } 0 <= j1 && (j1 < P && (0 <= k && (k < P && j1 != k))) ==> hist[j1] != hist[k])
(declare-const j1@103@01 Int)
(declare-const k@104@01 Int)
(push) ; 2
; [eval] 0 <= j1 && (j1 < P && (0 <= k && (k < P && j1 != k))) ==> hist[j1] != hist[k]
; [eval] 0 <= j1 && (j1 < P && (0 <= k && (k < P && j1 != k)))
; [eval] 0 <= j1
(push) ; 3
; [then-branch: 40 | !(0 <= j1@103@01) | live]
; [else-branch: 40 | 0 <= j1@103@01 | live]
(push) ; 4
; [then-branch: 40 | !(0 <= j1@103@01)]
(assert (not (<= 0 j1@103@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 40 | 0 <= j1@103@01]
(assert (<= 0 j1@103@01))
; [eval] j1 < P
(push) ; 5
; [then-branch: 41 | !(j1@103@01 < P@98@01) | live]
; [else-branch: 41 | j1@103@01 < P@98@01 | live]
(push) ; 6
; [then-branch: 41 | !(j1@103@01 < P@98@01)]
(assert (not (< j1@103@01 P@98@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 41 | j1@103@01 < P@98@01]
(assert (< j1@103@01 P@98@01))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 42 | !(0 <= k@104@01) | live]
; [else-branch: 42 | 0 <= k@104@01 | live]
(push) ; 8
; [then-branch: 42 | !(0 <= k@104@01)]
(assert (not (<= 0 k@104@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 42 | 0 <= k@104@01]
(assert (<= 0 k@104@01))
; [eval] k < P
(push) ; 9
; [then-branch: 43 | !(k@104@01 < P@98@01) | live]
; [else-branch: 43 | k@104@01 < P@98@01 | live]
(push) ; 10
; [then-branch: 43 | !(k@104@01 < P@98@01)]
(assert (not (< k@104@01 P@98@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 43 | k@104@01 < P@98@01]
(assert (< k@104@01 P@98@01))
; [eval] j1 != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@104@01 P@98@01) (not (< k@104@01 P@98@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@104@01)
  (and (<= 0 k@104@01) (or (< k@104@01 P@98@01) (not (< k@104@01 P@98@01))))))
(assert (or (<= 0 k@104@01) (not (<= 0 k@104@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j1@103@01 P@98@01)
  (and
    (< j1@103@01 P@98@01)
    (=>
      (<= 0 k@104@01)
      (and (<= 0 k@104@01) (or (< k@104@01 P@98@01) (not (< k@104@01 P@98@01)))))
    (or (<= 0 k@104@01) (not (<= 0 k@104@01))))))
(assert (or (< j1@103@01 P@98@01) (not (< j1@103@01 P@98@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j1@103@01)
  (and
    (<= 0 j1@103@01)
    (=>
      (< j1@103@01 P@98@01)
      (and
        (< j1@103@01 P@98@01)
        (=>
          (<= 0 k@104@01)
          (and
            (<= 0 k@104@01)
            (or (< k@104@01 P@98@01) (not (< k@104@01 P@98@01)))))
        (or (<= 0 k@104@01) (not (<= 0 k@104@01)))))
    (or (< j1@103@01 P@98@01) (not (< j1@103@01 P@98@01))))))
(assert (or (<= 0 j1@103@01) (not (<= 0 j1@103@01))))
(push) ; 3
; [then-branch: 44 | 0 <= j1@103@01 && j1@103@01 < P@98@01 && 0 <= k@104@01 && k@104@01 < P@98@01 && j1@103@01 != k@104@01 | live]
; [else-branch: 44 | !(0 <= j1@103@01 && j1@103@01 < P@98@01 && 0 <= k@104@01 && k@104@01 < P@98@01 && j1@103@01 != k@104@01) | live]
(push) ; 4
; [then-branch: 44 | 0 <= j1@103@01 && j1@103@01 < P@98@01 && 0 <= k@104@01 && k@104@01 < P@98@01 && j1@103@01 != k@104@01]
(assert (and
  (<= 0 j1@103@01)
  (and
    (< j1@103@01 P@98@01)
    (and (<= 0 k@104@01) (and (< k@104@01 P@98@01) (not (= j1@103@01 k@104@01)))))))
; [eval] hist[j1] != hist[k]
; [eval] hist[j1]
(push) ; 5
(assert (not (>= j1@103@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j1@103@01 (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] hist[k]
(push) ; 5
(assert (not (>= k@104@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@104@01 (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 44 | !(0 <= j1@103@01 && j1@103@01 < P@98@01 && 0 <= k@104@01 && k@104@01 < P@98@01 && j1@103@01 != k@104@01)]
(assert (not
  (and
    (<= 0 j1@103@01)
    (and
      (< j1@103@01 P@98@01)
      (and
        (<= 0 k@104@01)
        (and (< k@104@01 P@98@01) (not (= j1@103@01 k@104@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j1@103@01)
    (and
      (< j1@103@01 P@98@01)
      (and
        (<= 0 k@104@01)
        (and (< k@104@01 P@98@01) (not (= j1@103@01 k@104@01))))))
  (and
    (<= 0 j1@103@01)
    (< j1@103@01 P@98@01)
    (<= 0 k@104@01)
    (< k@104@01 P@98@01)
    (not (= j1@103@01 k@104@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j1@103@01)
      (and
        (< j1@103@01 P@98@01)
        (and
          (<= 0 k@104@01)
          (and (< k@104@01 P@98@01) (not (= j1@103@01 k@104@01)))))))
  (and
    (<= 0 j1@103@01)
    (and
      (< j1@103@01 P@98@01)
      (and
        (<= 0 k@104@01)
        (and (< k@104@01 P@98@01) (not (= j1@103@01 k@104@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j1@103@01 Int) (k@104@01 Int)) (!
  (and
    (=>
      (<= 0 j1@103@01)
      (and
        (<= 0 j1@103@01)
        (=>
          (< j1@103@01 P@98@01)
          (and
            (< j1@103@01 P@98@01)
            (=>
              (<= 0 k@104@01)
              (and
                (<= 0 k@104@01)
                (or (< k@104@01 P@98@01) (not (< k@104@01 P@98@01)))))
            (or (<= 0 k@104@01) (not (<= 0 k@104@01)))))
        (or (< j1@103@01 P@98@01) (not (< j1@103@01 P@98@01)))))
    (or (<= 0 j1@103@01) (not (<= 0 j1@103@01)))
    (=>
      (and
        (<= 0 j1@103@01)
        (and
          (< j1@103@01 P@98@01)
          (and
            (<= 0 k@104@01)
            (and (< k@104@01 P@98@01) (not (= j1@103@01 k@104@01))))))
      (and
        (<= 0 j1@103@01)
        (< j1@103@01 P@98@01)
        (<= 0 k@104@01)
        (< k@104@01 P@98@01)
        (not (= j1@103@01 k@104@01))))
    (or
      (not
        (and
          (<= 0 j1@103@01)
          (and
            (< j1@103@01 P@98@01)
            (and
              (<= 0 k@104@01)
              (and (< k@104@01 P@98@01) (not (= j1@103@01 k@104@01)))))))
      (and
        (<= 0 j1@103@01)
        (and
          (< j1@103@01 P@98@01)
          (and
            (<= 0 k@104@01)
            (and (< k@104@01 P@98@01) (not (= j1@103@01 k@104@01))))))))
  :pattern ((Seq_index hist@99@01 j1@103@01) (Seq_index hist@99@01 k@104@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@127@12@127@109-aux|)))
(assert (forall ((j1@103@01 Int) (k@104@01 Int)) (!
  (=>
    (and
      (<= 0 j1@103@01)
      (and
        (< j1@103@01 P@98@01)
        (and
          (<= 0 k@104@01)
          (and (< k@104@01 P@98@01) (not (= j1@103@01 k@104@01))))))
    (not (= (Seq_index hist@99@01 j1@103@01) (Seq_index hist@99@01 k@104@01))))
  :pattern ((Seq_index hist@99@01 j1@103@01) (Seq_index hist@99@01 k@104@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@127@12@127@109|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))))))
(declare-const k@105@01 Int)
(push) ; 2
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 3
; [then-branch: 45 | !(0 <= k@105@01) | live]
; [else-branch: 45 | 0 <= k@105@01 | live]
(push) ; 4
; [then-branch: 45 | !(0 <= k@105@01)]
(assert (not (<= 0 k@105@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 45 | 0 <= k@105@01]
(assert (<= 0 k@105@01))
; [eval] k < P
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@105@01) (not (<= 0 k@105@01))))
(assert (and (<= 0 k@105@01) (< k@105@01 P@98@01)))
; [eval] hist[k]
(push) ; 3
(assert (not (>= k@105@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@105@01 (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@106@01 ($Ref) Int)
(declare-fun img@107@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@105@01 Int)) (!
  (=>
    (and (<= 0 k@105@01) (< k@105@01 P@98@01))
    (or (<= 0 k@105@01) (not (<= 0 k@105@01))))
  :pattern ((Seq_index hist@99@01 k@105@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@105@01 Int) (k2@105@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@105@01) (< k1@105@01 P@98@01))
      (and (<= 0 k2@105@01) (< k2@105@01 P@98@01))
      (= (Seq_index hist@99@01 k1@105@01) (Seq_index hist@99@01 k2@105@01)))
    (= k1@105@01 k2@105@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@105@01 Int)) (!
  (=>
    (and (<= 0 k@105@01) (< k@105@01 P@98@01))
    (and
      (= (inv@106@01 (Seq_index hist@99@01 k@105@01)) k@105@01)
      (img@107@01 (Seq_index hist@99@01 k@105@01))))
  :pattern ((Seq_index hist@99@01 k@105@01))
  :qid |quant-u-76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@107@01 r) (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
    (= (Seq_index hist@99@01 (inv@106@01 r)) r))
  :pattern ((inv@106@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@105@01 Int)) (!
  (=>
    (and (<= 0 k@105@01) (< k@105@01 P@98@01))
    (not (= (Seq_index hist@99@01 k@105@01) $Ref.null)))
  :pattern ((Seq_index hist@99@01 k@105@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))))
  $Snap.unit))
; [eval] (forall k: Int :: { hist[k] } 0 <= k && k < P ==> hist[k].Ref__Integer_value == 0)
(declare-const k@108@01 Int)
(push) ; 2
; [eval] 0 <= k && k < P ==> hist[k].Ref__Integer_value == 0
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 3
; [then-branch: 46 | !(0 <= k@108@01) | live]
; [else-branch: 46 | 0 <= k@108@01 | live]
(push) ; 4
; [then-branch: 46 | !(0 <= k@108@01)]
(assert (not (<= 0 k@108@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 46 | 0 <= k@108@01]
(assert (<= 0 k@108@01))
; [eval] k < P
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@108@01) (not (<= 0 k@108@01))))
(push) ; 3
; [then-branch: 47 | 0 <= k@108@01 && k@108@01 < P@98@01 | live]
; [else-branch: 47 | !(0 <= k@108@01 && k@108@01 < P@98@01) | live]
(push) ; 4
; [then-branch: 47 | 0 <= k@108@01 && k@108@01 < P@98@01]
(assert (and (<= 0 k@108@01) (< k@108@01 P@98@01)))
; [eval] hist[k].Ref__Integer_value == 0
; [eval] hist[k]
(push) ; 5
(assert (not (>= k@108@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@108@01 (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@107@01 (Seq_index hist@99@01 k@108@01))
  (and
    (<= 0 (inv@106@01 (Seq_index hist@99@01 k@108@01)))
    (< (inv@106@01 (Seq_index hist@99@01 k@108@01)) P@98@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 47 | !(0 <= k@108@01 && k@108@01 < P@98@01)]
(assert (not (and (<= 0 k@108@01) (< k@108@01 P@98@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 k@108@01) (< k@108@01 P@98@01)))
  (and (<= 0 k@108@01) (< k@108@01 P@98@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@108@01 Int)) (!
  (and
    (or (<= 0 k@108@01) (not (<= 0 k@108@01)))
    (or
      (not (and (<= 0 k@108@01) (< k@108@01 P@98@01)))
      (and (<= 0 k@108@01) (< k@108@01 P@98@01))))
  :pattern ((Seq_index hist@99@01 k@108@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@129@13@129@87-aux|)))
(assert (forall ((k@108@01 Int)) (!
  (=>
    (and (<= 0 k@108@01) (< k@108@01 P@98@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) (Seq_index
        hist@99@01
        k@108@01))
      0))
  :pattern ((Seq_index hist@99@01 k@108@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@129@13@129@87|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))
  $Snap.unit))
; [eval] Ref__multidim_index_2(M, N, i, j) < |matrix|
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 2
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 3
(assert (not (<= 0 M@101@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@101@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 3
(assert (not (<= 0 N@100@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@100@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (<= 0 M@101@01)
  (<= 0 N@100@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
; [eval] |matrix|
(assert (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)
  (Seq_length matrix@95@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))))))
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 2
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 2
; Joined path conditions
(push) ; 2
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)
  0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@109@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) (Seq_index
    matrix@95@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))))))
(assert (<=
  $Perm.No
  (ite
    (=
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    (/ (to_real 1) (to_real 4))
    $Perm.No)))
(assert (<=
  (ite
    (=
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    (/ (to_real 1) (to_real 4))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
    (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
  (not
    (=
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))))
  $Snap.unit))
; [eval] 0 <= matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 2
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 2
; Joined path conditions
(push) ; 2
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)
  0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@110@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@107@01 r) (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef11|)))
(declare-const pm@111@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@111@01  $FPM) r)
    (+
      (ite
        (and
          (img@107@01 r)
          (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (=
          r
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@111@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(push) ; 2
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@111@01  $FPM) (Seq_index
    matrix@95@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) (Seq_index
    matrix@95@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))))))
  $Snap.unit))
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value < P
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 2
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 2
; Joined path conditions
(push) ; 2
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)
  0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@107@01 r) (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef11|))))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@107@01 (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (and
          (<=
            0
            (inv@106@01 (Seq_index
              matrix@95@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))
          (<
            (inv@106@01 (Seq_index
              matrix@95@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
            P@98@01)))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<
  ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) (Seq_index
    matrix@95@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
  P@98@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@112@01 $Snap)
(assert (= $t@112@01 ($Snap.combine ($Snap.first $t@112@01) ($Snap.second $t@112@01))))
(assert (= ($Snap.first $t@112@01) $Snap.unit))
; [eval] M > 0
(assert (=
  ($Snap.second $t@112@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@112@01))
    ($Snap.second ($Snap.second $t@112@01)))))
(assert (= ($Snap.first ($Snap.second $t@112@01)) $Snap.unit))
; [eval] N > 0
(assert (=
  ($Snap.second ($Snap.second $t@112@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@112@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@112@01))) $Snap.unit))
; [eval] P > 0
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@112@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@112@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@112@01))))
  $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))
  $Snap.unit))
; [eval] i < M
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))
  $Snap.unit))
; [eval] 0 <= j
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))
  $Snap.unit))
; [eval] j < N
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))))
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 3
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@113@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@113@01  $FVF<Ref__Integer_value>) (Seq_index
    matrix@95@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01))))))))))))
(declare-const k@114@01 Int)
(push) ; 3
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 48 | !(0 <= k@114@01) | live]
; [else-branch: 48 | 0 <= k@114@01 | live]
(push) ; 5
; [then-branch: 48 | !(0 <= k@114@01)]
(assert (not (<= 0 k@114@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | 0 <= k@114@01]
(assert (<= 0 k@114@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@114@01) (not (<= 0 k@114@01))))
(assert (and (<= 0 k@114@01) (< k@114@01 P@98@01)))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@114@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@114@01 (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@115@01 ($Ref) Int)
(declare-fun img@116@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@114@01 Int)) (!
  (=>
    (and (<= 0 k@114@01) (< k@114@01 P@98@01))
    (or (<= 0 k@114@01) (not (<= 0 k@114@01))))
  :pattern ((Seq_index hist@99@01 k@114@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@114@01 Int) (k2@114@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@114@01) (< k1@114@01 P@98@01))
      (and (<= 0 k2@114@01) (< k2@114@01 P@98@01))
      (= (Seq_index hist@99@01 k1@114@01) (Seq_index hist@99@01 k2@114@01)))
    (= k1@114@01 k2@114@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@114@01 Int)) (!
  (=>
    (and (<= 0 k@114@01) (< k@114@01 P@98@01))
    (and
      (= (inv@115@01 (Seq_index hist@99@01 k@114@01)) k@114@01)
      (img@116@01 (Seq_index hist@99@01 k@114@01))))
  :pattern ((Seq_index hist@99@01 k@114@01))
  :qid |quant-u-78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@116@01 r) (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) P@98@01)))
    (= (Seq_index hist@99@01 (inv@115@01 r)) r))
  :pattern ((inv@115@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@114@01 Int)) (!
  (=>
    (and (<= 0 k@114@01) (< k@114@01 P@98@01))
    (not (= (Seq_index hist@99@01 k@114@01) $Ref.null)))
  :pattern ((Seq_index hist@99@01 k@114@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))
  $Snap.unit))
; [eval] (forall k: Int :: { hist[k] } 0 <= k && k < P ==> hist[k].Ref__Integer_value == (matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k ? 1 : 0))
(declare-const k@117@01 Int)
(push) ; 3
; [eval] 0 <= k && k < P ==> hist[k].Ref__Integer_value == (matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k ? 1 : 0)
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 49 | !(0 <= k@117@01) | live]
; [else-branch: 49 | 0 <= k@117@01 | live]
(push) ; 5
; [then-branch: 49 | !(0 <= k@117@01)]
(assert (not (<= 0 k@117@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 49 | 0 <= k@117@01]
(assert (<= 0 k@117@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@117@01) (not (<= 0 k@117@01))))
(push) ; 4
; [then-branch: 50 | 0 <= k@117@01 && k@117@01 < P@98@01 | live]
; [else-branch: 50 | !(0 <= k@117@01 && k@117@01 < P@98@01) | live]
(push) ; 5
; [then-branch: 50 | 0 <= k@117@01 && k@117@01 < P@98@01]
(assert (and (<= 0 k@117@01) (< k@117@01 P@98@01)))
; [eval] hist[k].Ref__Integer_value == (matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k ? 1 : 0)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@117@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@117@01 (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@118@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@113@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@113@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@116@01 r) (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) P@98@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))) r))
  :qid |qp.fvfValDef14|)))
(declare-const pm@119@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@119@01  $FPM) r)
    (+
      (ite
        (=
          r
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (ite
        (and
          (img@116@01 r)
          (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) P@98@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@119@01  $FPM) (Seq_index
    hist@99@01
    k@117@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] (matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k ? 1 : 0)
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)
  0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@113@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@113@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@116@01 r) (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) P@98@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))) r))
    :qid |qp.fvfValDef14|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (/ (to_real 1) (to_real 4))
      $Perm.No)
    (ite
      (and
        (img@116@01 (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (and
          (<=
            0
            (inv@115@01 (Seq_index
              matrix@95@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))
          (<
            (inv@115@01 (Seq_index
              matrix@95@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
            P@98@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 51 | Lookup(Ref__Integer_value, sm@118@01, matrix@95@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@101@01, N@100@01, i@97@01, j@96@01)]) == k@117@01 | live]
; [else-branch: 51 | Lookup(Ref__Integer_value, sm@118@01, matrix@95@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@101@01, N@100@01, i@97@01, j@96@01)]) != k@117@01 | live]
(push) ; 7
; [then-branch: 51 | Lookup(Ref__Integer_value, sm@118@01, matrix@95@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@101@01, N@100@01, i@97@01, j@96@01)]) == k@117@01]
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
    matrix@95@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
  k@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 51 | Lookup(Ref__Integer_value, sm@118@01, matrix@95@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@101@01, N@100@01, i@97@01, j@96@01)]) != k@117@01]
(assert (not
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    k@117@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      k@117@01))
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    k@117@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 50 | !(0 <= k@117@01 && k@117@01 < P@98@01)]
(assert (not (and (<= 0 k@117@01) (< k@117@01 P@98@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@113@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@113@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@116@01 r) (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) P@98@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@119@01  $FPM) r)
    (+
      (ite
        (=
          r
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (ite
        (and
          (img@116@01 r)
          (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) P@98@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(assert (=>
  (and (<= 0 k@117@01) (< k@117@01 P@98@01))
  (and
    (<= 0 k@117@01)
    (< k@117@01 P@98@01)
    (or
      (not
        (=
          ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
          k@117@01))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        k@117@01)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@117@01) (< k@117@01 P@98@01)))
  (and (<= 0 k@117@01) (< k@117@01 P@98@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@113@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@113@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@116@01 r) (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) P@98@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@112@01)))))))))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@119@01  $FPM) r)
    (+
      (ite
        (=
          r
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (ite
        (and
          (img@116@01 r)
          (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) P@98@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@117@01 Int)) (!
  (and
    (or (<= 0 k@117@01) (not (<= 0 k@117@01)))
    (=>
      (and (<= 0 k@117@01) (< k@117@01 P@98@01))
      (and
        (<= 0 k@117@01)
        (< k@117@01 P@98@01)
        (or
          (not
            (=
              ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
                matrix@95@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
              k@117@01))
          (=
            ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
              matrix@95@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
            k@117@01))))
    (or
      (not (and (<= 0 k@117@01) (< k@117@01 P@98@01)))
      (and (<= 0 k@117@01) (< k@117@01 P@98@01))))
  :pattern ((Seq_index hist@99@01 k@117@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@137@12@137@160-aux|)))
(assert (forall ((k@117@01 Int)) (!
  (=>
    (and (<= 0 k@117@01) (< k@117@01 P@98@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
        hist@99@01
        k@117@01))
      (ite
        (=
          ($FVF.lookup_Ref__Integer_value (as sm@118@01  $FVF<Ref__Integer_value>) (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
          k@117@01)
        1
        0)))
  :pattern ((Seq_index hist@99@01 k@117@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@137@12@137@160|)))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@120@01 Int)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@121@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@122@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@123@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@124@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@125@01 $Ref)
; [exec]
; var __flatten_11: Ref
(declare-const __flatten_11@126@01 $Ref)
; [exec]
; __flatten_6 := Ref__multidim_index_2(M, N, i, j)
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 3
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 3
; Joined path conditions
(declare-const __flatten_6@127@01 Int)
(assert (=
  __flatten_6@127@01
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
; [exec]
; __flatten_1 := __flatten_6
; [exec]
; __flatten_8 := matrix[__flatten_1]
; [eval] matrix[__flatten_1]
(push) ; 3
(assert (not (>= __flatten_6@127@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< __flatten_6@127@01 (Seq_length matrix@95@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_8@128@01 $Ref)
(assert (= __flatten_8@128@01 (Seq_index matrix@95@01 __flatten_6@127@01)))
; [exec]
; __flatten_7 := hist[__flatten_8.Ref__Integer_value]
; [eval] hist[__flatten_8.Ref__Integer_value]
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@107@01 r) (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef11|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@107@01 __flatten_8@128@01)
        (and
          (<= 0 (inv@106@01 __flatten_8@128@01))
          (< (inv@106@01 __flatten_8@128@01) P@98@01)))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        __flatten_8@128@01
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>=
  ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) __flatten_8@128@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) __flatten_8@128@01)
  (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@129@01 $Ref)
(assert (=
  __flatten_7@129@01
  (Seq_index
    hist@99@01
    ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) __flatten_8@128@01))))
; [exec]
; __flatten_11 := matrix[__flatten_1]
; [eval] matrix[__flatten_1]
(push) ; 3
(assert (not (>= __flatten_6@127@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< __flatten_6@127@01 (Seq_length matrix@95@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_11@130@01 $Ref)
(assert (= __flatten_11@130@01 (Seq_index matrix@95@01 __flatten_6@127@01)))
; [exec]
; __flatten_10 := hist[__flatten_11.Ref__Integer_value]
; [eval] hist[__flatten_11.Ref__Integer_value]
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@107@01 r) (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef11|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@107@01 __flatten_11@130@01)
        (and
          (<= 0 (inv@106@01 __flatten_11@130@01))
          (< (inv@106@01 __flatten_11@130@01) P@98@01)))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        __flatten_11@130@01
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>=
  ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) __flatten_11@130@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) __flatten_11@130@01)
  (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_10@131@01 $Ref)
(assert (=
  __flatten_10@131@01
  (Seq_index
    hist@99@01
    ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) __flatten_11@130@01))))
; [exec]
; __flatten_9 := __flatten_10.Ref__Integer_value + 1
; [eval] __flatten_10.Ref__Integer_value + 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@107@01 r) (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef11|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@107@01 __flatten_10@131@01)
        (and
          (<= 0 (inv@106@01 __flatten_10@131@01))
          (< (inv@106@01 __flatten_10@131@01) P@98@01)))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        __flatten_10@131@01
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@132@01 Int)
(assert (=
  __flatten_9@132@01
  (+
    ($FVF.lookup_Ref__Integer_value (as sm@110@01  $FVF<Ref__Integer_value>) __flatten_10@131@01)
    1)))
; [exec]
; __flatten_7.Ref__Integer_value := __flatten_9
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index
    matrix@95@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
  __flatten_7@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@133@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_7@129@01)
    ($Perm.min
      (ite
        (and
          (img@107@01 r)
          (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@134@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_7@129@01)
    ($Perm.min
      (ite
        (=
          r
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- $Perm.Write (pTaken@133@01 r)))
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
          (img@107@01 r)
          (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@133@01 r))
    $Perm.No)
  
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
  (= (pTaken@133@01 r) $Perm.No)
  
  :qid |quant-u-81|))))
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
  (=> (= r __flatten_7@129@01) (= (- $Perm.Write (pTaken@133@01 r)) $Perm.No))
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@135@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) __flatten_7@129@01)
  __flatten_9@132@01))
; [eval] M > 0
; [eval] N > 0
; [eval] P > 0
; [eval] 0 <= i
; [eval] i < M
; [eval] 0 <= j
; [eval] j < N
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@136@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (/ (to_real 1) (to_real 4)))
    $Perm.No))
(define-fun pTaken@137@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    ($Perm.min
      (ite (= r __flatten_7@129@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 4)) (pTaken@136@01 r)))
    $Perm.No))
(define-fun pTaken@138@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    ($Perm.min
      (ite
        (and
          (img@107@01 r)
          (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
        (- $Perm.Write (pTaken@133@01 r))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 4)) (pTaken@136@01 r)) (pTaken@137@01 r)))
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
(assert (not (=
  (-
    (ite
      (=
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (/ (to_real 1) (to_real 4))
      $Perm.No)
    (pTaken@136@01 (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))
  $Perm.No)))
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
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    (= (- (/ (to_real 1) (to_real 4)) (pTaken@136@01 r)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@139@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (=
    (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
    __flatten_7@129@01)
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    ($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))))
(assert (=>
  (=
    (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
    (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))))
(assert (=>
  (ite
    (and
      (img@107@01 (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (and
        (<=
          0
          (inv@106@01 (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))
        (<
          (inv@106@01 (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
          P@98@01)))
    (<
      $Perm.No
      (-
        $Perm.Write
        (pTaken@133@01 (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))))
    false)
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))))
(declare-const k@140@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 52 | !(0 <= k@140@01) | live]
; [else-branch: 52 | 0 <= k@140@01 | live]
(push) ; 5
; [then-branch: 52 | !(0 <= k@140@01)]
(assert (not (<= 0 k@140@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 52 | 0 <= k@140@01]
(assert (<= 0 k@140@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@140@01) (not (<= 0 k@140@01))))
(assert (and (<= 0 k@140@01) (< k@140@01 P@98@01)))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@140@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@140@01 (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@141@01 ($Ref) Int)
(declare-fun img@142@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@140@01 Int)) (!
  (=>
    (and (<= 0 k@140@01) (< k@140@01 P@98@01))
    (or (<= 0 k@140@01) (not (<= 0 k@140@01))))
  :pattern ((Seq_index hist@99@01 k@140@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@140@01 Int) (k2@140@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@140@01) (< k1@140@01 P@98@01))
      (and (<= 0 k2@140@01) (< k2@140@01 P@98@01))
      (= (Seq_index hist@99@01 k1@140@01) (Seq_index hist@99@01 k2@140@01)))
    (= k1@140@01 k2@140@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@140@01 Int)) (!
  (=>
    (and (<= 0 k@140@01) (< k@140@01 P@98@01))
    (and
      (= (inv@141@01 (Seq_index hist@99@01 k@140@01)) k@140@01)
      (img@142@01 (Seq_index hist@99@01 k@140@01))))
  :pattern ((Seq_index hist@99@01 k@140@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@142@01 r) (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) P@98@01)))
    (= (Seq_index hist@99@01 (inv@141@01 r)) r))
  :pattern ((inv@141@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@143@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) P@98@01))
      (img@142@01 r)
      (= r (Seq_index hist@99@01 (inv@141@01 r))))
    ($Perm.min
      (ite
        (and
          (img@107@01 r)
          (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
        (- $Perm.Write (pTaken@133@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@144@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) P@98@01))
      (img@142@01 r)
      (= r (Seq_index hist@99@01 (inv@141@01 r))))
    ($Perm.min
      (ite (= r __flatten_7@129@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@143@01 r)))
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
          (img@107@01 r)
          (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
        (- $Perm.Write (pTaken@133@01 r))
        $Perm.No)
      (pTaken@143@01 r))
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
      (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) P@98@01))
      (img@142@01 r)
      (= r (Seq_index hist@99@01 (inv@141@01 r))))
    (= (- $Perm.Write (pTaken@143@01 r)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@144@01 __flatten_7@129@01)) $Perm.No)))
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
      (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) P@98@01))
      (img@142@01 r)
      (= r (Seq_index hist@99@01 (inv@141@01 r))))
    (= (- (- $Perm.Write (pTaken@143@01 r)) (pTaken@144@01 r)) $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@145@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@107@01 r) (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
      (< $Perm.No (- $Perm.Write (pTaken@133@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@145@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@145@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_7@129@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@145@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@145@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
; [eval] (forall k: Int :: { hist[k] } 0 <= k && k < P ==> hist[k].Ref__Integer_value == (matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k ? 1 : 0))
(declare-const k@146@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < P ==> hist[k].Ref__Integer_value == (matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k ? 1 : 0)
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 53 | !(0 <= k@146@01) | live]
; [else-branch: 53 | 0 <= k@146@01 | live]
(push) ; 5
; [then-branch: 53 | !(0 <= k@146@01)]
(assert (not (<= 0 k@146@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 53 | 0 <= k@146@01]
(assert (<= 0 k@146@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@146@01) (not (<= 0 k@146@01))))
(push) ; 4
; [then-branch: 54 | 0 <= k@146@01 && k@146@01 < P@98@01 | live]
; [else-branch: 54 | !(0 <= k@146@01 && k@146@01 < P@98@01) | live]
(push) ; 5
; [then-branch: 54 | 0 <= k@146@01 && k@146@01 < P@98@01]
(assert (and (<= 0 k@146@01) (< k@146@01 P@98@01)))
; [eval] hist[k].Ref__Integer_value == (matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k ? 1 : 0)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@146@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@146@01 (Seq_length hist@99@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_7@129@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@107@01 r)
          (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
        (< $Perm.No (- $Perm.Write (pTaken@133@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
    :qid |qp.fvfValDef18|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (Seq_index hist@99@01 k@146@01) __flatten_7@129@01)
        $Perm.Write
        $Perm.No)
      (ite
        (=
          (Seq_index hist@99@01 k@146@01)
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No))
    (ite
      (and
        (img@107@01 (Seq_index hist@99@01 k@146@01))
        (and
          (<= 0 (inv@106@01 (Seq_index hist@99@01 k@146@01)))
          (< (inv@106@01 (Seq_index hist@99@01 k@146@01)) P@98@01)))
      (- $Perm.Write (pTaken@133@01 (Seq_index hist@99@01 k@146@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] (matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k ? 1 : 0)
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == k
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)
  0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_7@129@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@107@01 r)
          (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
        (< $Perm.No (- $Perm.Write (pTaken@133@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
    :qid |qp.fvfValDef18|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (=
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
          __flatten_7@129@01)
        $Perm.Write
        $Perm.No)
      (ite
        (=
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
          (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (/ (to_real 1) (to_real 4))
        $Perm.No))
    (ite
      (and
        (img@107@01 (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        (and
          (<=
            0
            (inv@106@01 (Seq_index
              matrix@95@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))
          (<
            (inv@106@01 (Seq_index
              matrix@95@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
            P@98@01)))
      (-
        $Perm.Write
        (pTaken@133@01 (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 55 | Lookup(Ref__Integer_value, sm@139@01, matrix@95@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@101@01, N@100@01, i@97@01, j@96@01)]) == k@146@01 | live]
; [else-branch: 55 | Lookup(Ref__Integer_value, sm@139@01, matrix@95@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@101@01, N@100@01, i@97@01, j@96@01)]) != k@146@01 | live]
(push) ; 7
; [then-branch: 55 | Lookup(Ref__Integer_value, sm@139@01, matrix@95@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@101@01, N@100@01, i@97@01, j@96@01)]) == k@146@01]
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
    matrix@95@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
  k@146@01))
(pop) ; 7
(push) ; 7
; [else-branch: 55 | Lookup(Ref__Integer_value, sm@139@01, matrix@95@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@101@01, N@100@01, i@97@01, j@96@01)]) != k@146@01]
(assert (not
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    k@146@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
      k@146@01))
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@95@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    k@146@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 54 | !(0 <= k@146@01 && k@146@01 < P@98@01)]
(assert (not (and (<= 0 k@146@01) (< k@146@01 P@98@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_7@129@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@107@01 r) (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
      (< $Perm.No (- $Perm.Write (pTaken@133@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
  :qid |qp.fvfValDef18|)))
(assert (=>
  (and (<= 0 k@146@01) (< k@146@01 P@98@01))
  (and
    (<= 0 k@146@01)
    (< k@146@01 P@98@01)
    (or
      (not
        (=
          ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
          k@146@01))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@95@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
        k@146@01)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@146@01) (< k@146@01 P@98@01)))
  (and (<= 0 k@146@01) (< k@146@01 P@98@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_7@129@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@135@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        matrix@95@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@107@01 r) (and (<= 0 (inv@106@01 r)) (< (inv@106@01 r) P@98@01)))
      (< $Perm.No (- $Perm.Write (pTaken@133@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))))))))) r))
  :qid |qp.fvfValDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@146@01 Int)) (!
  (and
    (or (<= 0 k@146@01) (not (<= 0 k@146@01)))
    (=>
      (and (<= 0 k@146@01) (< k@146@01 P@98@01))
      (and
        (<= 0 k@146@01)
        (< k@146@01 P@98@01)
        (or
          (not
            (=
              ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
                matrix@95@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
              k@146@01))
          (=
            ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
              matrix@95@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
            k@146@01))))
    (or
      (not (and (<= 0 k@146@01) (< k@146@01 P@98@01)))
      (and (<= 0 k@146@01) (< k@146@01 P@98@01))))
  :pattern ((Seq_index hist@99@01 k@146@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@137@12@137@160-aux|)))
(assert (forall ((k@146@01 Int)) (!
  (=>
    (and (<= 0 k@146@01) (< k@146@01 P@98@01))
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
  :pattern ((Seq_index hist@99@01 k@146@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@137@12@137@160_precondition|)))
(push) ; 3
(assert (not (forall ((k@146@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 k@146@01) (< k@146@01 P@98@01))
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01))
      (and (<= 0 k@146@01) (< k@146@01 P@98@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
        hist@99@01
        k@146@01))
      (ite
        (=
          ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
          k@146@01)
        1
        0)))
  :pattern ((Seq_index hist@99@01 k@146@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@137@12@137@160|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@146@01 Int)) (!
  (=>
    (and (<= 0 k@146@01) (< k@146@01 P@98@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
        hist@99@01
        k@146@01))
      (ite
        (=
          ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) (Seq_index
            matrix@95@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@101@01 N@100@01 i@97@01 j@96@01)))
          k@146@01)
        1
        0)))
  :pattern ((Seq_index hist@99@01 k@146@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@137@12@137@160|)))
(pop) ; 2
(pop) ; 1
; ---------- Ref__histogram ----------
(declare-const diz@147@01 $Ref)
(declare-const current_thread_id@148@01 Int)
(declare-const M@149@01 Int)
(declare-const N@150@01 Int)
(declare-const matrix@151@01 Seq<$Ref>)
(declare-const P@152@01 Int)
(declare-const hist@153@01 Seq<$Ref>)
(declare-const diz@154@01 $Ref)
(declare-const current_thread_id@155@01 Int)
(declare-const M@156@01 Int)
(declare-const N@157@01 Int)
(declare-const matrix@158@01 Seq<$Ref>)
(declare-const P@159@01 Int)
(declare-const hist@160@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@161@01 $Snap)
(assert (= $t@161@01 ($Snap.combine ($Snap.first $t@161@01) ($Snap.second $t@161@01))))
(assert (= ($Snap.first $t@161@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@154@01 $Ref.null)))
(assert (=
  ($Snap.second $t@161@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@161@01))
    ($Snap.second ($Snap.second $t@161@01)))))
(assert (= ($Snap.first ($Snap.second $t@161@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@155@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@161@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@161@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@161@01))) $Snap.unit))
; [eval] M > 0
(assert (> M@156@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@161@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@161@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@161@01))))
  $Snap.unit))
; [eval] N > 0
(assert (> N@157@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))
  $Snap.unit))
; [eval] P > 0
(assert (> P@159@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))
  $Snap.unit))
; [eval] M * N <= |matrix|
; [eval] M * N
; [eval] |matrix|
(assert (<= (* M@156@01 N@157@01) (Seq_length matrix@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { matrix[j], matrix[k] } 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> matrix[j] != matrix[k])
(declare-const j@162@01 Int)
(declare-const k@163@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> matrix[j] != matrix[k]
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 56 | !(0 <= j@162@01) | live]
; [else-branch: 56 | 0 <= j@162@01 | live]
(push) ; 4
; [then-branch: 56 | !(0 <= j@162@01)]
(assert (not (<= 0 j@162@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 56 | 0 <= j@162@01]
(assert (<= 0 j@162@01))
; [eval] j < M * N
; [eval] M * N
(push) ; 5
; [then-branch: 57 | !(j@162@01 < M@156@01 * N@157@01) | live]
; [else-branch: 57 | j@162@01 < M@156@01 * N@157@01 | live]
(push) ; 6
; [then-branch: 57 | !(j@162@01 < M@156@01 * N@157@01)]
(assert (not (< j@162@01 (* M@156@01 N@157@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 57 | j@162@01 < M@156@01 * N@157@01]
(assert (< j@162@01 (* M@156@01 N@157@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 58 | !(0 <= k@163@01) | live]
; [else-branch: 58 | 0 <= k@163@01 | live]
(push) ; 8
; [then-branch: 58 | !(0 <= k@163@01)]
(assert (not (<= 0 k@163@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 58 | 0 <= k@163@01]
(assert (<= 0 k@163@01))
; [eval] k < M * N
; [eval] M * N
(push) ; 9
; [then-branch: 59 | !(k@163@01 < M@156@01 * N@157@01) | live]
; [else-branch: 59 | k@163@01 < M@156@01 * N@157@01 | live]
(push) ; 10
; [then-branch: 59 | !(k@163@01 < M@156@01 * N@157@01)]
(assert (not (< k@163@01 (* M@156@01 N@157@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 59 | k@163@01 < M@156@01 * N@157@01]
(assert (< k@163@01 (* M@156@01 N@157@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@163@01 (* M@156@01 N@157@01)) (not (< k@163@01 (* M@156@01 N@157@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@163@01)
  (and
    (<= 0 k@163@01)
    (or
      (< k@163@01 (* M@156@01 N@157@01))
      (not (< k@163@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 k@163@01) (not (<= 0 k@163@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@162@01 (* M@156@01 N@157@01))
  (and
    (< j@162@01 (* M@156@01 N@157@01))
    (=>
      (<= 0 k@163@01)
      (and
        (<= 0 k@163@01)
        (or
          (< k@163@01 (* M@156@01 N@157@01))
          (not (< k@163@01 (* M@156@01 N@157@01))))))
    (or (<= 0 k@163@01) (not (<= 0 k@163@01))))))
(assert (or (< j@162@01 (* M@156@01 N@157@01)) (not (< j@162@01 (* M@156@01 N@157@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@162@01)
  (and
    (<= 0 j@162@01)
    (=>
      (< j@162@01 (* M@156@01 N@157@01))
      (and
        (< j@162@01 (* M@156@01 N@157@01))
        (=>
          (<= 0 k@163@01)
          (and
            (<= 0 k@163@01)
            (or
              (< k@163@01 (* M@156@01 N@157@01))
              (not (< k@163@01 (* M@156@01 N@157@01))))))
        (or (<= 0 k@163@01) (not (<= 0 k@163@01)))))
    (or
      (< j@162@01 (* M@156@01 N@157@01))
      (not (< j@162@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 j@162@01) (not (<= 0 j@162@01))))
(push) ; 3
; [then-branch: 60 | 0 <= j@162@01 && j@162@01 < M@156@01 * N@157@01 && 0 <= k@163@01 && k@163@01 < M@156@01 * N@157@01 && j@162@01 != k@163@01 | live]
; [else-branch: 60 | !(0 <= j@162@01 && j@162@01 < M@156@01 * N@157@01 && 0 <= k@163@01 && k@163@01 < M@156@01 * N@157@01 && j@162@01 != k@163@01) | live]
(push) ; 4
; [then-branch: 60 | 0 <= j@162@01 && j@162@01 < M@156@01 * N@157@01 && 0 <= k@163@01 && k@163@01 < M@156@01 * N@157@01 && j@162@01 != k@163@01]
(assert (and
  (<= 0 j@162@01)
  (and
    (< j@162@01 (* M@156@01 N@157@01))
    (and
      (<= 0 k@163@01)
      (and (< k@163@01 (* M@156@01 N@157@01)) (not (= j@162@01 k@163@01)))))))
; [eval] matrix[j] != matrix[k]
; [eval] matrix[j]
(push) ; 5
(assert (not (>= j@162@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@162@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] matrix[k]
(push) ; 5
(assert (not (>= k@163@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@163@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 60 | !(0 <= j@162@01 && j@162@01 < M@156@01 * N@157@01 && 0 <= k@163@01 && k@163@01 < M@156@01 * N@157@01 && j@162@01 != k@163@01)]
(assert (not
  (and
    (<= 0 j@162@01)
    (and
      (< j@162@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@163@01)
        (and (< k@163@01 (* M@156@01 N@157@01)) (not (= j@162@01 k@163@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@162@01)
    (and
      (< j@162@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@163@01)
        (and (< k@163@01 (* M@156@01 N@157@01)) (not (= j@162@01 k@163@01))))))
  (and
    (<= 0 j@162@01)
    (< j@162@01 (* M@156@01 N@157@01))
    (<= 0 k@163@01)
    (< k@163@01 (* M@156@01 N@157@01))
    (not (= j@162@01 k@163@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@162@01)
      (and
        (< j@162@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@163@01)
          (and (< k@163@01 (* M@156@01 N@157@01)) (not (= j@162@01 k@163@01)))))))
  (and
    (<= 0 j@162@01)
    (and
      (< j@162@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@163@01)
        (and (< k@163@01 (* M@156@01 N@157@01)) (not (= j@162@01 k@163@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@162@01 Int) (k@163@01 Int)) (!
  (and
    (=>
      (<= 0 j@162@01)
      (and
        (<= 0 j@162@01)
        (=>
          (< j@162@01 (* M@156@01 N@157@01))
          (and
            (< j@162@01 (* M@156@01 N@157@01))
            (=>
              (<= 0 k@163@01)
              (and
                (<= 0 k@163@01)
                (or
                  (< k@163@01 (* M@156@01 N@157@01))
                  (not (< k@163@01 (* M@156@01 N@157@01))))))
            (or (<= 0 k@163@01) (not (<= 0 k@163@01)))))
        (or
          (< j@162@01 (* M@156@01 N@157@01))
          (not (< j@162@01 (* M@156@01 N@157@01))))))
    (or (<= 0 j@162@01) (not (<= 0 j@162@01)))
    (=>
      (and
        (<= 0 j@162@01)
        (and
          (< j@162@01 (* M@156@01 N@157@01))
          (and
            (<= 0 k@163@01)
            (and (< k@163@01 (* M@156@01 N@157@01)) (not (= j@162@01 k@163@01))))))
      (and
        (<= 0 j@162@01)
        (< j@162@01 (* M@156@01 N@157@01))
        (<= 0 k@163@01)
        (< k@163@01 (* M@156@01 N@157@01))
        (not (= j@162@01 k@163@01))))
    (or
      (not
        (and
          (<= 0 j@162@01)
          (and
            (< j@162@01 (* M@156@01 N@157@01))
            (and
              (<= 0 k@163@01)
              (and
                (< k@163@01 (* M@156@01 N@157@01))
                (not (= j@162@01 k@163@01)))))))
      (and
        (<= 0 j@162@01)
        (and
          (< j@162@01 (* M@156@01 N@157@01))
          (and
            (<= 0 k@163@01)
            (and (< k@163@01 (* M@156@01 N@157@01)) (not (= j@162@01 k@163@01))))))))
  :pattern ((Seq_index matrix@158@01 j@162@01) (Seq_index matrix@158@01 k@163@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@161@12@161@112-aux|)))
(assert (forall ((j@162@01 Int) (k@163@01 Int)) (!
  (=>
    (and
      (<= 0 j@162@01)
      (and
        (< j@162@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@163@01)
          (and (< k@163@01 (* M@156@01 N@157@01)) (not (= j@162@01 k@163@01))))))
    (not
      (= (Seq_index matrix@158@01 j@162@01) (Seq_index matrix@158@01 k@163@01))))
  :pattern ((Seq_index matrix@158@01 j@162@01) (Seq_index matrix@158@01 k@163@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@161@12@161@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))
(declare-const j1@164@01 Int)
(push) ; 2
; [eval] 0 <= j1 && j1 < M * N
; [eval] 0 <= j1
(push) ; 3
; [then-branch: 61 | !(0 <= j1@164@01) | live]
; [else-branch: 61 | 0 <= j1@164@01 | live]
(push) ; 4
; [then-branch: 61 | !(0 <= j1@164@01)]
(assert (not (<= 0 j1@164@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 61 | 0 <= j1@164@01]
(assert (<= 0 j1@164@01))
; [eval] j1 < M * N
; [eval] M * N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@164@01) (not (<= 0 j1@164@01))))
(assert (and (<= 0 j1@164@01) (< j1@164@01 (* M@156@01 N@157@01))))
; [eval] matrix[j1]
(push) ; 3
(assert (not (>= j1@164@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j1@164@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@165@01 ($Ref) Int)
(declare-fun img@166@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j1@164@01 Int)) (!
  (=>
    (and (<= 0 j1@164@01) (< j1@164@01 (* M@156@01 N@157@01)))
    (or (<= 0 j1@164@01) (not (<= 0 j1@164@01))))
  :pattern ((Seq_index matrix@158@01 j1@164@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j11@164@01 Int) (j12@164@01 Int)) (!
  (=>
    (and
      (and (<= 0 j11@164@01) (< j11@164@01 (* M@156@01 N@157@01)))
      (and (<= 0 j12@164@01) (< j12@164@01 (* M@156@01 N@157@01)))
      (=
        (Seq_index matrix@158@01 j11@164@01)
        (Seq_index matrix@158@01 j12@164@01)))
    (= j11@164@01 j12@164@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j1@164@01 Int)) (!
  (=>
    (and (<= 0 j1@164@01) (< j1@164@01 (* M@156@01 N@157@01)))
    (and
      (= (inv@165@01 (Seq_index matrix@158@01 j1@164@01)) j1@164@01)
      (img@166@01 (Seq_index matrix@158@01 j1@164@01))))
  :pattern ((Seq_index matrix@158@01 j1@164@01))
  :qid |quant-u-93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (= (Seq_index matrix@158@01 (inv@165@01 r)) r))
  :pattern ((inv@165@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j1@164@01 Int)) (!
  (=>
    (and (<= 0 j1@164@01) (< j1@164@01 (* M@156@01 N@157@01)))
    (not (= (Seq_index matrix@158@01 j1@164@01) $Ref.null)))
  :pattern ((Seq_index matrix@158@01 j1@164@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))
  $Snap.unit))
; [eval] (forall i1: Int, j1: Int :: { matrix[Ref__multidim_index_2(M, N, i1, j1)] } 0 <= i1 && (i1 < M && (0 <= j1 && j1 < N)) ==> 0 <= matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value && matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value < P)
(declare-const i1@167@01 Int)
(declare-const j1@168@01 Int)
(push) ; 2
; [eval] 0 <= i1 && (i1 < M && (0 <= j1 && j1 < N)) ==> 0 <= matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value && matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value < P
; [eval] 0 <= i1 && (i1 < M && (0 <= j1 && j1 < N))
; [eval] 0 <= i1
(push) ; 3
; [then-branch: 62 | !(0 <= i1@167@01) | live]
; [else-branch: 62 | 0 <= i1@167@01 | live]
(push) ; 4
; [then-branch: 62 | !(0 <= i1@167@01)]
(assert (not (<= 0 i1@167@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 62 | 0 <= i1@167@01]
(assert (<= 0 i1@167@01))
; [eval] i1 < M
(push) ; 5
; [then-branch: 63 | !(i1@167@01 < M@156@01) | live]
; [else-branch: 63 | i1@167@01 < M@156@01 | live]
(push) ; 6
; [then-branch: 63 | !(i1@167@01 < M@156@01)]
(assert (not (< i1@167@01 M@156@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 63 | i1@167@01 < M@156@01]
(assert (< i1@167@01 M@156@01))
; [eval] 0 <= j1
(push) ; 7
; [then-branch: 64 | !(0 <= j1@168@01) | live]
; [else-branch: 64 | 0 <= j1@168@01 | live]
(push) ; 8
; [then-branch: 64 | !(0 <= j1@168@01)]
(assert (not (<= 0 j1@168@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 64 | 0 <= j1@168@01]
(assert (<= 0 j1@168@01))
; [eval] j1 < N
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@168@01) (not (<= 0 j1@168@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i1@167@01 M@156@01)
  (and (< i1@167@01 M@156@01) (or (<= 0 j1@168@01) (not (<= 0 j1@168@01))))))
(assert (or (< i1@167@01 M@156@01) (not (< i1@167@01 M@156@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i1@167@01)
  (and
    (<= 0 i1@167@01)
    (=>
      (< i1@167@01 M@156@01)
      (and (< i1@167@01 M@156@01) (or (<= 0 j1@168@01) (not (<= 0 j1@168@01)))))
    (or (< i1@167@01 M@156@01) (not (< i1@167@01 M@156@01))))))
(assert (or (<= 0 i1@167@01) (not (<= 0 i1@167@01))))
(push) ; 3
; [then-branch: 65 | 0 <= i1@167@01 && i1@167@01 < M@156@01 && 0 <= j1@168@01 && j1@168@01 < N@157@01 | live]
; [else-branch: 65 | !(0 <= i1@167@01 && i1@167@01 < M@156@01 && 0 <= j1@168@01 && j1@168@01 < N@157@01) | live]
(push) ; 4
; [then-branch: 65 | 0 <= i1@167@01 && i1@167@01 < M@156@01 && 0 <= j1@168@01 && j1@168@01 < N@157@01]
(assert (and
  (<= 0 i1@167@01)
  (and (< i1@167@01 M@156@01) (and (<= 0 j1@168@01) (< j1@168@01 N@157@01)))))
; [eval] 0 <= matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value && matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value < P
; [eval] 0 <= matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)]
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 5
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 6
(assert (not (<= 0 M@156@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@156@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 6
(assert (not (<= 0 N@157@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@157@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (<= 0 M@156@01)
  (<= 0 N@157@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))
(push) ; 5
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)
  0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)
  (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@166@01 (Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))
  (and
    (<=
      0
      (inv@165@01 (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01))))
    (<
      (inv@165@01 (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))
      (* M@156@01 N@157@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 66 | !(0 <= Lookup(Ref__Integer_value, First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@161@01)))))))), matrix@158@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@156@01, N@157@01, i1@167@01, j1@168@01)])) | live]
; [else-branch: 66 | 0 <= Lookup(Ref__Integer_value, First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@161@01)))))))), matrix@158@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@156@01, N@157@01, i1@167@01, j1@168@01)]) | live]
(push) ; 6
; [then-branch: 66 | !(0 <= Lookup(Ref__Integer_value, First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@161@01)))))))), matrix@158@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@156@01, N@157@01, i1@167@01, j1@168@01)]))]
(assert (not
  (<=
    0
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
      matrix@158@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01))))))
(pop) ; 6
(push) ; 6
; [else-branch: 66 | 0 <= Lookup(Ref__Integer_value, First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@161@01)))))))), matrix@158@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@156@01, N@157@01, i1@167@01, j1@168@01)])]
(assert (<=
  0
  ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))))
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value < P
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)]
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 7
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)
  0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)
  (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@166@01 (Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))
  (and
    (<=
      0
      (inv@165@01 (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01))))
    (<
      (inv@165@01 (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))
      (* M@156@01 N@157@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    0
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
      matrix@158@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01))))
  (not
    (<=
      0
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))))))
(pop) ; 4
(push) ; 4
; [else-branch: 65 | !(0 <= i1@167@01 && i1@167@01 < M@156@01 && 0 <= j1@168@01 && j1@168@01 < N@157@01)]
(assert (not
  (and
    (<= 0 i1@167@01)
    (and (< i1@167@01 M@156@01) (and (<= 0 j1@168@01) (< j1@168@01 N@157@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i1@167@01)
    (and (< i1@167@01 M@156@01) (and (<= 0 j1@168@01) (< j1@168@01 N@157@01))))
  (and
    (<= 0 i1@167@01)
    (< i1@167@01 M@156@01)
    (<= 0 j1@168@01)
    (< j1@168@01 N@157@01)
    (<= 0 M@156@01)
    (<= 0 N@157@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)
    (or
      (<=
        0
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01))))
      (not
        (<=
          0
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
            matrix@158@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i1@167@01)
      (and (< i1@167@01 M@156@01) (and (<= 0 j1@168@01) (< j1@168@01 N@157@01)))))
  (and
    (<= 0 i1@167@01)
    (and (< i1@167@01 M@156@01) (and (<= 0 j1@168@01) (< j1@168@01 N@157@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@167@01 Int) (j1@168@01 Int)) (!
  (and
    (=>
      (<= 0 i1@167@01)
      (and
        (<= 0 i1@167@01)
        (=>
          (< i1@167@01 M@156@01)
          (and
            (< i1@167@01 M@156@01)
            (or (<= 0 j1@168@01) (not (<= 0 j1@168@01)))))
        (or (< i1@167@01 M@156@01) (not (< i1@167@01 M@156@01)))))
    (or (<= 0 i1@167@01) (not (<= 0 i1@167@01)))
    (=>
      (and
        (<= 0 i1@167@01)
        (and
          (< i1@167@01 M@156@01)
          (and (<= 0 j1@168@01) (< j1@168@01 N@157@01))))
      (and
        (<= 0 i1@167@01)
        (< i1@167@01 M@156@01)
        (<= 0 j1@168@01)
        (< j1@168@01 N@157@01)
        (<= 0 M@156@01)
        (<= 0 N@157@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)
        (or
          (<=
            0
            ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01))))
          (not
            (<=
              0
              ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
                matrix@158@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01))))))))
    (or
      (not
        (and
          (<= 0 i1@167@01)
          (and
            (< i1@167@01 M@156@01)
            (and (<= 0 j1@168@01) (< j1@168@01 N@157@01)))))
      (and
        (<= 0 i1@167@01)
        (and
          (< i1@167@01 M@156@01)
          (and (<= 0 j1@168@01) (< j1@168@01 N@157@01))))))
  :pattern ((Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@163@13@163@232-aux|)))
(assert (forall ((i1@167@01 Int) (j1@168@01 Int)) (!
  (=>
    (and
      (<= 0 i1@167@01)
      (and (< i1@167@01 M@156@01) (and (<= 0 j1@168@01) (< j1@168@01 N@157@01))))
    (and
      (<=
        0
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01))))
      (<
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))
        P@159@01)))
  :pattern ((Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@167@01 j1@168@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@163@13@163@232|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))
  $Snap.unit))
; [eval] P <= |hist|
; [eval] |hist|
(assert (<= P@159@01 (Seq_length hist@160@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { hist[j], hist[k] } 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k])
(declare-const j@169@01 Int)
(declare-const k@170@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k]
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 67 | !(0 <= j@169@01) | live]
; [else-branch: 67 | 0 <= j@169@01 | live]
(push) ; 4
; [then-branch: 67 | !(0 <= j@169@01)]
(assert (not (<= 0 j@169@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 67 | 0 <= j@169@01]
(assert (<= 0 j@169@01))
; [eval] j < P
(push) ; 5
; [then-branch: 68 | !(j@169@01 < P@159@01) | live]
; [else-branch: 68 | j@169@01 < P@159@01 | live]
(push) ; 6
; [then-branch: 68 | !(j@169@01 < P@159@01)]
(assert (not (< j@169@01 P@159@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 68 | j@169@01 < P@159@01]
(assert (< j@169@01 P@159@01))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 69 | !(0 <= k@170@01) | live]
; [else-branch: 69 | 0 <= k@170@01 | live]
(push) ; 8
; [then-branch: 69 | !(0 <= k@170@01)]
(assert (not (<= 0 k@170@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 69 | 0 <= k@170@01]
(assert (<= 0 k@170@01))
; [eval] k < P
(push) ; 9
; [then-branch: 70 | !(k@170@01 < P@159@01) | live]
; [else-branch: 70 | k@170@01 < P@159@01 | live]
(push) ; 10
; [then-branch: 70 | !(k@170@01 < P@159@01)]
(assert (not (< k@170@01 P@159@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 70 | k@170@01 < P@159@01]
(assert (< k@170@01 P@159@01))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@170@01 P@159@01) (not (< k@170@01 P@159@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@170@01)
  (and (<= 0 k@170@01) (or (< k@170@01 P@159@01) (not (< k@170@01 P@159@01))))))
(assert (or (<= 0 k@170@01) (not (<= 0 k@170@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@169@01 P@159@01)
  (and
    (< j@169@01 P@159@01)
    (=>
      (<= 0 k@170@01)
      (and
        (<= 0 k@170@01)
        (or (< k@170@01 P@159@01) (not (< k@170@01 P@159@01)))))
    (or (<= 0 k@170@01) (not (<= 0 k@170@01))))))
(assert (or (< j@169@01 P@159@01) (not (< j@169@01 P@159@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@169@01)
  (and
    (<= 0 j@169@01)
    (=>
      (< j@169@01 P@159@01)
      (and
        (< j@169@01 P@159@01)
        (=>
          (<= 0 k@170@01)
          (and
            (<= 0 k@170@01)
            (or (< k@170@01 P@159@01) (not (< k@170@01 P@159@01)))))
        (or (<= 0 k@170@01) (not (<= 0 k@170@01)))))
    (or (< j@169@01 P@159@01) (not (< j@169@01 P@159@01))))))
(assert (or (<= 0 j@169@01) (not (<= 0 j@169@01))))
(push) ; 3
; [then-branch: 71 | 0 <= j@169@01 && j@169@01 < P@159@01 && 0 <= k@170@01 && k@170@01 < P@159@01 && j@169@01 != k@170@01 | live]
; [else-branch: 71 | !(0 <= j@169@01 && j@169@01 < P@159@01 && 0 <= k@170@01 && k@170@01 < P@159@01 && j@169@01 != k@170@01) | live]
(push) ; 4
; [then-branch: 71 | 0 <= j@169@01 && j@169@01 < P@159@01 && 0 <= k@170@01 && k@170@01 < P@159@01 && j@169@01 != k@170@01]
(assert (and
  (<= 0 j@169@01)
  (and
    (< j@169@01 P@159@01)
    (and (<= 0 k@170@01) (and (< k@170@01 P@159@01) (not (= j@169@01 k@170@01)))))))
; [eval] hist[j] != hist[k]
; [eval] hist[j]
(push) ; 5
(assert (not (>= j@169@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@169@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] hist[k]
(push) ; 5
(assert (not (>= k@170@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@170@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 71 | !(0 <= j@169@01 && j@169@01 < P@159@01 && 0 <= k@170@01 && k@170@01 < P@159@01 && j@169@01 != k@170@01)]
(assert (not
  (and
    (<= 0 j@169@01)
    (and
      (< j@169@01 P@159@01)
      (and
        (<= 0 k@170@01)
        (and (< k@170@01 P@159@01) (not (= j@169@01 k@170@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@169@01)
    (and
      (< j@169@01 P@159@01)
      (and
        (<= 0 k@170@01)
        (and (< k@170@01 P@159@01) (not (= j@169@01 k@170@01))))))
  (and
    (<= 0 j@169@01)
    (< j@169@01 P@159@01)
    (<= 0 k@170@01)
    (< k@170@01 P@159@01)
    (not (= j@169@01 k@170@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@169@01)
      (and
        (< j@169@01 P@159@01)
        (and
          (<= 0 k@170@01)
          (and (< k@170@01 P@159@01) (not (= j@169@01 k@170@01)))))))
  (and
    (<= 0 j@169@01)
    (and
      (< j@169@01 P@159@01)
      (and
        (<= 0 k@170@01)
        (and (< k@170@01 P@159@01) (not (= j@169@01 k@170@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@169@01 Int) (k@170@01 Int)) (!
  (and
    (=>
      (<= 0 j@169@01)
      (and
        (<= 0 j@169@01)
        (=>
          (< j@169@01 P@159@01)
          (and
            (< j@169@01 P@159@01)
            (=>
              (<= 0 k@170@01)
              (and
                (<= 0 k@170@01)
                (or (< k@170@01 P@159@01) (not (< k@170@01 P@159@01)))))
            (or (<= 0 k@170@01) (not (<= 0 k@170@01)))))
        (or (< j@169@01 P@159@01) (not (< j@169@01 P@159@01)))))
    (or (<= 0 j@169@01) (not (<= 0 j@169@01)))
    (=>
      (and
        (<= 0 j@169@01)
        (and
          (< j@169@01 P@159@01)
          (and
            (<= 0 k@170@01)
            (and (< k@170@01 P@159@01) (not (= j@169@01 k@170@01))))))
      (and
        (<= 0 j@169@01)
        (< j@169@01 P@159@01)
        (<= 0 k@170@01)
        (< k@170@01 P@159@01)
        (not (= j@169@01 k@170@01))))
    (or
      (not
        (and
          (<= 0 j@169@01)
          (and
            (< j@169@01 P@159@01)
            (and
              (<= 0 k@170@01)
              (and (< k@170@01 P@159@01) (not (= j@169@01 k@170@01)))))))
      (and
        (<= 0 j@169@01)
        (and
          (< j@169@01 P@159@01)
          (and
            (<= 0 k@170@01)
            (and (< k@170@01 P@159@01) (not (= j@169@01 k@170@01))))))))
  :pattern ((Seq_index hist@160@01 j@169@01) (Seq_index hist@160@01 k@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@165@12@165@104-aux|)))
(assert (forall ((j@169@01 Int) (k@170@01 Int)) (!
  (=>
    (and
      (<= 0 j@169@01)
      (and
        (< j@169@01 P@159@01)
        (and
          (<= 0 k@170@01)
          (and (< k@170@01 P@159@01) (not (= j@169@01 k@170@01))))))
    (not (= (Seq_index hist@160@01 j@169@01) (Seq_index hist@160@01 k@170@01))))
  :pattern ((Seq_index hist@160@01 j@169@01) (Seq_index hist@160@01 k@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@165@12@165@104|)))
(declare-const i1@171@01 Int)
(push) ; 2
; [eval] 0 <= i1 && i1 < P
; [eval] 0 <= i1
(push) ; 3
; [then-branch: 72 | !(0 <= i1@171@01) | live]
; [else-branch: 72 | 0 <= i1@171@01 | live]
(push) ; 4
; [then-branch: 72 | !(0 <= i1@171@01)]
(assert (not (<= 0 i1@171@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 72 | 0 <= i1@171@01]
(assert (<= 0 i1@171@01))
; [eval] i1 < P
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i1@171@01) (not (<= 0 i1@171@01))))
(assert (and (<= 0 i1@171@01) (< i1@171@01 P@159@01)))
; [eval] hist[i1]
(push) ; 3
(assert (not (>= i1@171@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i1@171@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@172@01 ($Ref) Int)
(declare-fun img@173@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i1@171@01 Int)) (!
  (=>
    (and (<= 0 i1@171@01) (< i1@171@01 P@159@01))
    (or (<= 0 i1@171@01) (not (<= 0 i1@171@01))))
  :pattern ((Seq_index hist@160@01 i1@171@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i11@171@01 Int) (i12@171@01 Int)) (!
  (=>
    (and
      (and (<= 0 i11@171@01) (< i11@171@01 P@159@01))
      (and (<= 0 i12@171@01) (< i12@171@01 P@159@01))
      (= (Seq_index hist@160@01 i11@171@01) (Seq_index hist@160@01 i12@171@01)))
    (= i11@171@01 i12@171@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i1@171@01 Int)) (!
  (=>
    (and (<= 0 i1@171@01) (< i1@171@01 P@159@01))
    (and
      (= (inv@172@01 (Seq_index hist@160@01 i1@171@01)) i1@171@01)
      (img@173@01 (Seq_index hist@160@01 i1@171@01))))
  :pattern ((Seq_index hist@160@01 i1@171@01))
  :qid |quant-u-95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@173@01 r) (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
    (= (Seq_index hist@160@01 (inv@172@01 r)) r))
  :pattern ((inv@172@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i1@171@01 Int)) (!
  (=>
    (and (<= 0 i1@171@01) (< i1@171@01 P@159@01))
    (not (= (Seq_index hist@160@01 i1@171@01) $Ref.null)))
  :pattern ((Seq_index hist@160@01 i1@171@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index hist@160@01 i1@171@01) (Seq_index matrix@158@01 j1@164@01))
    (=
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))))
  
  :qid |quant-u-96|))))
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
(declare-const $t@174@01 $Snap)
(assert (= $t@174@01 ($Snap.combine ($Snap.first $t@174@01) ($Snap.second $t@174@01))))
(declare-const j1@175@01 Int)
(push) ; 3
; [eval] 0 <= j1 && j1 < M * N
; [eval] 0 <= j1
(push) ; 4
; [then-branch: 73 | !(0 <= j1@175@01) | live]
; [else-branch: 73 | 0 <= j1@175@01 | live]
(push) ; 5
; [then-branch: 73 | !(0 <= j1@175@01)]
(assert (not (<= 0 j1@175@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 73 | 0 <= j1@175@01]
(assert (<= 0 j1@175@01))
; [eval] j1 < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@175@01) (not (<= 0 j1@175@01))))
(assert (and (<= 0 j1@175@01) (< j1@175@01 (* M@156@01 N@157@01))))
; [eval] matrix[j1]
(push) ; 4
(assert (not (>= j1@175@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j1@175@01 (Seq_length matrix@158@01))))
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
(assert (forall ((j1@175@01 Int)) (!
  (=>
    (and (<= 0 j1@175@01) (< j1@175@01 (* M@156@01 N@157@01)))
    (or (<= 0 j1@175@01) (not (<= 0 j1@175@01))))
  :pattern ((Seq_index matrix@158@01 j1@175@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j11@175@01 Int) (j12@175@01 Int)) (!
  (=>
    (and
      (and (<= 0 j11@175@01) (< j11@175@01 (* M@156@01 N@157@01)))
      (and (<= 0 j12@175@01) (< j12@175@01 (* M@156@01 N@157@01)))
      (=
        (Seq_index matrix@158@01 j11@175@01)
        (Seq_index matrix@158@01 j12@175@01)))
    (= j11@175@01 j12@175@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j1@175@01 Int)) (!
  (=>
    (and (<= 0 j1@175@01) (< j1@175@01 (* M@156@01 N@157@01)))
    (and
      (= (inv@176@01 (Seq_index matrix@158@01 j1@175@01)) j1@175@01)
      (img@177@01 (Seq_index matrix@158@01 j1@175@01))))
  :pattern ((Seq_index matrix@158@01 j1@175@01))
  :qid |quant-u-98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@177@01 r)
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
    (= (Seq_index matrix@158@01 (inv@176@01 r)) r))
  :pattern ((inv@176@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j1@175@01 Int)) (!
  (=>
    (and (<= 0 j1@175@01) (< j1@175@01 (* M@156@01 N@157@01)))
    (not (= (Seq_index matrix@158@01 j1@175@01) $Ref.null)))
  :pattern ((Seq_index matrix@158@01 j1@175@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@174@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@174@01))
    ($Snap.second ($Snap.second $t@174@01)))))
(declare-const i1@178@01 Int)
(push) ; 3
; [eval] 0 <= i1 && i1 < P
; [eval] 0 <= i1
(push) ; 4
; [then-branch: 74 | !(0 <= i1@178@01) | live]
; [else-branch: 74 | 0 <= i1@178@01 | live]
(push) ; 5
; [then-branch: 74 | !(0 <= i1@178@01)]
(assert (not (<= 0 i1@178@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 74 | 0 <= i1@178@01]
(assert (<= 0 i1@178@01))
; [eval] i1 < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i1@178@01) (not (<= 0 i1@178@01))))
(assert (and (<= 0 i1@178@01) (< i1@178@01 P@159@01)))
; [eval] hist[i1]
(push) ; 4
(assert (not (>= i1@178@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i1@178@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@179@01 ($Ref) Int)
(declare-fun img@180@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i1@178@01 Int)) (!
  (=>
    (and (<= 0 i1@178@01) (< i1@178@01 P@159@01))
    (or (<= 0 i1@178@01) (not (<= 0 i1@178@01))))
  :pattern ((Seq_index hist@160@01 i1@178@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i11@178@01 Int) (i12@178@01 Int)) (!
  (=>
    (and
      (and (<= 0 i11@178@01) (< i11@178@01 P@159@01))
      (and (<= 0 i12@178@01) (< i12@178@01 P@159@01))
      (= (Seq_index hist@160@01 i11@178@01) (Seq_index hist@160@01 i12@178@01)))
    (= i11@178@01 i12@178@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i1@178@01 Int)) (!
  (=>
    (and (<= 0 i1@178@01) (< i1@178@01 P@159@01))
    (and
      (= (inv@179@01 (Seq_index hist@160@01 i1@178@01)) i1@178@01)
      (img@180@01 (Seq_index hist@160@01 i1@178@01))))
  :pattern ((Seq_index hist@160@01 i1@178@01))
  :qid |quant-u-100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@180@01 r) (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
    (= (Seq_index hist@160@01 (inv@179@01 r)) r))
  :pattern ((inv@179@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i1@178@01 Int)) (!
  (=>
    (and (<= 0 i1@178@01) (< i1@178@01 P@159@01))
    (not (= (Seq_index hist@160@01 i1@178@01) $Ref.null)))
  :pattern ((Seq_index hist@160@01 i1@178@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index hist@160@01 i1@178@01) (Seq_index matrix@158@01 j1@175@01))
    (=
      (and
        (img@180@01 r)
        (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
      (and
        (img@177@01 r)
        (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))))
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@174@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@174@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@174@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@174@01))) $Snap.unit))
; [eval] (forall k: Int :: { hist[k] } 0 <= k && k < P ==> hist[k].Ref__Integer_value == count_array(0, M * N, matrix, k))
(declare-const k@181@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < P ==> hist[k].Ref__Integer_value == count_array(0, M * N, matrix, k)
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 75 | !(0 <= k@181@01) | live]
; [else-branch: 75 | 0 <= k@181@01 | live]
(push) ; 5
; [then-branch: 75 | !(0 <= k@181@01)]
(assert (not (<= 0 k@181@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 75 | 0 <= k@181@01]
(assert (<= 0 k@181@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@181@01) (not (<= 0 k@181@01))))
(push) ; 4
; [then-branch: 76 | 0 <= k@181@01 && k@181@01 < P@159@01 | live]
; [else-branch: 76 | !(0 <= k@181@01 && k@181@01 < P@159@01) | live]
(push) ; 5
; [then-branch: 76 | 0 <= k@181@01 && k@181@01 < P@159@01]
(assert (and (<= 0 k@181@01) (< k@181@01 P@159@01)))
; [eval] hist[k].Ref__Integer_value == count_array(0, M * N, matrix, k)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@181@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@181@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@182@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@177@01 r)
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@180@01 r) (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef22|)))
(declare-const pm@183@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@183@01  $FPM) r)
    (+
      (ite
        (and
          (img@177@01 r)
          (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@180@01 r)
          (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@183@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@183@01  $FPM) (Seq_index
    hist@160@01
    k@181@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] count_array(0, M * N, matrix, k)
; [eval] M * N
(push) ; 6
; [eval] 0 <= i
; [eval] i <= hi
(push) ; 7
(assert (not (<= 0 (* M@156@01 N@157@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (* M@156@01 N@157@01)))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall j: Int, k: Int ::0 <= j && (j < hi && (0 <= k && (k < hi && j != k))) ==> ar[j] != ar[k])
(declare-const j@184@01 Int)
(declare-const k@185@01 Int)
(push) ; 7
; [eval] 0 <= j && (j < hi && (0 <= k && (k < hi && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < hi && (0 <= k && (k < hi && j != k)))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 77 | !(0 <= j@184@01) | live]
; [else-branch: 77 | 0 <= j@184@01 | live]
(push) ; 9
; [then-branch: 77 | !(0 <= j@184@01)]
(assert (not (<= 0 j@184@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 77 | 0 <= j@184@01]
(assert (<= 0 j@184@01))
; [eval] j < hi
(push) ; 10
; [then-branch: 78 | !(j@184@01 < M@156@01 * N@157@01) | live]
; [else-branch: 78 | j@184@01 < M@156@01 * N@157@01 | live]
(push) ; 11
; [then-branch: 78 | !(j@184@01 < M@156@01 * N@157@01)]
(assert (not (< j@184@01 (* M@156@01 N@157@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 78 | j@184@01 < M@156@01 * N@157@01]
(assert (< j@184@01 (* M@156@01 N@157@01)))
; [eval] 0 <= k
(push) ; 12
; [then-branch: 79 | !(0 <= k@185@01) | live]
; [else-branch: 79 | 0 <= k@185@01 | live]
(push) ; 13
; [then-branch: 79 | !(0 <= k@185@01)]
(assert (not (<= 0 k@185@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 79 | 0 <= k@185@01]
(assert (<= 0 k@185@01))
; [eval] k < hi
(push) ; 14
; [then-branch: 80 | !(k@185@01 < M@156@01 * N@157@01) | live]
; [else-branch: 80 | k@185@01 < M@156@01 * N@157@01 | live]
(push) ; 15
; [then-branch: 80 | !(k@185@01 < M@156@01 * N@157@01)]
(assert (not (< k@185@01 (* M@156@01 N@157@01))))
(pop) ; 15
(push) ; 15
; [else-branch: 80 | k@185@01 < M@156@01 * N@157@01]
(assert (< k@185@01 (* M@156@01 N@157@01)))
; [eval] j != k
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (< k@185@01 (* M@156@01 N@157@01)) (not (< k@185@01 (* M@156@01 N@157@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@185@01)
  (and
    (<= 0 k@185@01)
    (or
      (< k@185@01 (* M@156@01 N@157@01))
      (not (< k@185@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 k@185@01) (not (<= 0 k@185@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@184@01 (* M@156@01 N@157@01))
  (and
    (< j@184@01 (* M@156@01 N@157@01))
    (=>
      (<= 0 k@185@01)
      (and
        (<= 0 k@185@01)
        (or
          (< k@185@01 (* M@156@01 N@157@01))
          (not (< k@185@01 (* M@156@01 N@157@01))))))
    (or (<= 0 k@185@01) (not (<= 0 k@185@01))))))
(assert (or (< j@184@01 (* M@156@01 N@157@01)) (not (< j@184@01 (* M@156@01 N@157@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@184@01)
  (and
    (<= 0 j@184@01)
    (=>
      (< j@184@01 (* M@156@01 N@157@01))
      (and
        (< j@184@01 (* M@156@01 N@157@01))
        (=>
          (<= 0 k@185@01)
          (and
            (<= 0 k@185@01)
            (or
              (< k@185@01 (* M@156@01 N@157@01))
              (not (< k@185@01 (* M@156@01 N@157@01))))))
        (or (<= 0 k@185@01) (not (<= 0 k@185@01)))))
    (or
      (< j@184@01 (* M@156@01 N@157@01))
      (not (< j@184@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 j@184@01) (not (<= 0 j@184@01))))
(push) ; 8
; [then-branch: 81 | 0 <= j@184@01 && j@184@01 < M@156@01 * N@157@01 && 0 <= k@185@01 && k@185@01 < M@156@01 * N@157@01 && j@184@01 != k@185@01 | live]
; [else-branch: 81 | !(0 <= j@184@01 && j@184@01 < M@156@01 * N@157@01 && 0 <= k@185@01 && k@185@01 < M@156@01 * N@157@01 && j@184@01 != k@185@01) | live]
(push) ; 9
; [then-branch: 81 | 0 <= j@184@01 && j@184@01 < M@156@01 * N@157@01 && 0 <= k@185@01 && k@185@01 < M@156@01 * N@157@01 && j@184@01 != k@185@01]
(assert (and
  (<= 0 j@184@01)
  (and
    (< j@184@01 (* M@156@01 N@157@01))
    (and
      (<= 0 k@185@01)
      (and (< k@185@01 (* M@156@01 N@157@01)) (not (= j@184@01 k@185@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 10
(assert (not (>= j@184@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< j@184@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 10
(assert (not (>= k@185@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< k@185@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 81 | !(0 <= j@184@01 && j@184@01 < M@156@01 * N@157@01 && 0 <= k@185@01 && k@185@01 < M@156@01 * N@157@01 && j@184@01 != k@185@01)]
(assert (not
  (and
    (<= 0 j@184@01)
    (and
      (< j@184@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@185@01)
        (and (< k@185@01 (* M@156@01 N@157@01)) (not (= j@184@01 k@185@01))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@184@01)
    (and
      (< j@184@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@185@01)
        (and (< k@185@01 (* M@156@01 N@157@01)) (not (= j@184@01 k@185@01))))))
  (and
    (<= 0 j@184@01)
    (< j@184@01 (* M@156@01 N@157@01))
    (<= 0 k@185@01)
    (< k@185@01 (* M@156@01 N@157@01))
    (not (= j@184@01 k@185@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@184@01)
      (and
        (< j@184@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@185@01)
          (and (< k@185@01 (* M@156@01 N@157@01)) (not (= j@184@01 k@185@01)))))))
  (and
    (<= 0 j@184@01)
    (and
      (< j@184@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@185@01)
        (and (< k@185@01 (* M@156@01 N@157@01)) (not (= j@184@01 k@185@01))))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 7
(assert (not (forall ((j@184@01 Int) (k@185@01 Int)) (!
  (=>
    (and
      (<= 0 j@184@01)
      (and
        (< j@184@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@185@01)
          (and (< k@185@01 (* M@156@01 N@157@01)) (not (= j@184@01 k@185@01))))))
    (not
      (= (Seq_index matrix@158@01 j@184@01) (Seq_index matrix@158@01 k@185@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@184@01 Int) (k@185@01 Int)) (!
  (=>
    (and
      (<= 0 j@184@01)
      (and
        (< j@184@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@185@01)
          (and (< k@185@01 (* M@156@01 N@157@01)) (not (= j@184@01 k@185@01))))))
    (not
      (= (Seq_index matrix@158@01 j@184@01) (Seq_index matrix@158@01 k@185@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|)))
(declare-const k@186@01 Int)
(push) ; 7
; [eval] 0 <= k && k < hi
; [eval] 0 <= k
(push) ; 8
; [then-branch: 82 | !(0 <= k@186@01) | live]
; [else-branch: 82 | 0 <= k@186@01 | live]
(push) ; 9
; [then-branch: 82 | !(0 <= k@186@01)]
(assert (not (<= 0 k@186@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 82 | 0 <= k@186@01]
(assert (<= 0 k@186@01))
; [eval] k < hi
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@186@01) (not (<= 0 k@186@01))))
(assert (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01))))
(declare-const $k@187@01 $Perm)
(assert ($Perm.isReadVar $k@187@01))
; [eval] ar[k]
(push) ; 8
(assert (not (>= k@186@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< k@186@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(declare-fun inv@188@01 ($Ref) Int)
(declare-fun img@189@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@187@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@186@01 Int)) (!
  (=>
    (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01)))
    (or (<= 0 k@186@01) (not (<= 0 k@186@01))))
  :pattern ((Seq_index matrix@158@01 k@186@01))
  :qid |Ref__Integer_value-aux|)))
(push) ; 7
(assert (not (forall ((k@186@01 Int)) (!
  (=>
    (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01)))
    (or (= $k@187@01 $Perm.No) (< $Perm.No $k@187@01)))
  
  :qid |quant-u-102|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((k1@186@01 Int) (k2@186@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 k1@186@01) (< k1@186@01 (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01))
      (and
        (and (<= 0 k2@186@01) (< k2@186@01 (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01))
      (= (Seq_index matrix@158@01 k1@186@01) (Seq_index matrix@158@01 k2@186@01)))
    (= k1@186@01 k2@186@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@186@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@187@01))
    (and
      (= (inv@188@01 (Seq_index matrix@158@01 k@186@01)) k@186@01)
      (img@189@01 (Seq_index matrix@158@01 k@186@01))))
  :pattern ((Seq_index matrix@158@01 k@186@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@189@01 r)
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)))
    (= (Seq_index matrix@158@01 (inv@188@01 r)) r))
  :pattern ((inv@188@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((k@186@01 Int)) (!
  (= (Seq_index matrix@158@01 k@186@01) (Seq_index hist@160@01 k@186@01))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@190@01 ((r $Ref) (k@181@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
      (img@189@01 r)
      (= r (Seq_index matrix@158@01 (inv@188@01 r))))
    ($Perm.min
      (ite
        (and
          (img@177@01 r)
          (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $k@187@01)
    $Perm.No))
(define-fun pTaken@191@01 ((r $Ref) (k@181@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
      (img@189@01 r)
      (= r (Seq_index matrix@158@01 (inv@188@01 r))))
    ($Perm.min
      (ite
        (and
          (img@180@01 r)
          (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)
      (- $k@187@01 (pTaken@190@01 r k@181@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@187@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@177@01 r)
            (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
          (/ (to_real 1) (to_real 2))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@177@01 r)
        (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
      (<
        (ite
          (and
            (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
            (img@189@01 r)
            (= r (Seq_index matrix@158@01 (inv@188@01 r))))
          $k@187@01
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      (<
        (ite
          (and
            (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
            (img@189@01 r)
            (= r (Seq_index matrix@158@01 (inv@188@01 r))))
          $k@187@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@177@01 r))
  :pattern ((inv@176@01 r))
  :pattern ((img@189@01 r))
  :pattern ((Seq_index matrix@158@01 (inv@188@01 r)))
  :qid |qp.srp24|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
      (img@189@01 r)
      (= r (Seq_index matrix@158@01 (inv@188@01 r))))
    (= (- $k@187@01 (pTaken@190@01 r k@181@01)) $Perm.No))
  
  :qid |quant-u-106|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@192@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r)))
    (=>
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef27|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (and
        (img@177@01 r)
        (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (and
        (img@180@01 r)
        (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef26|)))
(assert (count_array%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@192@01  $FVF<Ref__Integer_value>)))))) 0 (*
  M@156@01
  N@157@01) matrix@158@01 k@181@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@187@01))
(assert (forall ((k@186@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@187@01))
    (and
      (= (inv@188@01 (Seq_index matrix@158@01 k@186@01)) k@186@01)
      (img@189@01 (Seq_index matrix@158@01 k@186@01))))
  :pattern ((Seq_index matrix@158@01 k@186@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@189@01 r)
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)))
    (= (Seq_index matrix@158@01 (inv@188@01 r)) r))
  :pattern ((inv@188@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r)))
    (=>
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (and
        (img@177@01 r)
        (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (and
        (img@180@01 r)
        (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef26|)))
(assert (and
  (<= 0 (* M@156@01 N@157@01))
  (forall ((j@184@01 Int) (k@185@01 Int)) (!
    (=>
      (and
        (<= 0 j@184@01)
        (and
          (< j@184@01 (* M@156@01 N@157@01))
          (and
            (<= 0 k@185@01)
            (and (< k@185@01 (* M@156@01 N@157@01)) (not (= j@184@01 k@185@01))))))
      (not
        (= (Seq_index matrix@158@01 j@184@01) (Seq_index matrix@158@01 k@185@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
  (forall ((k@186@01 Int)) (!
    (=>
      (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01)))
      (or (<= 0 k@186@01) (not (<= 0 k@186@01))))
    :pattern ((Seq_index matrix@158@01 k@186@01))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@177@01 r)
              (and
                (<= 0 (inv@176@01 r))
                (< (inv@176@01 r) (* M@156@01 N@157@01))))
            (/ (to_real 1) (to_real 2))
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@177@01 r)
          (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
        (<
          (ite
            (and
              (and
                (<= 0 (inv@188@01 r))
                (< (inv@188@01 r) (* M@156@01 N@157@01)))
              (img@189@01 r)
              (= r (Seq_index matrix@158@01 (inv@188@01 r))))
            $k@187@01
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        (<
          (ite
            (and
              (and
                (<= 0 (inv@188@01 r))
                (< (inv@188@01 r) (* M@156@01 N@157@01)))
              (img@189@01 r)
              (= r (Seq_index matrix@158@01 (inv@188@01 r))))
            $k@187@01
            $Perm.No)
          $Perm.No)))
    :pattern ((img@177@01 r))
    :pattern ((inv@176@01 r))
    :pattern ((img@189@01 r))
    :pattern ((Seq_index matrix@158@01 (inv@188@01 r)))
    :qid |qp.srp24|))
  (count_array%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@192@01  $FVF<Ref__Integer_value>)))))) 0 (*
    M@156@01
    N@157@01) matrix@158@01 k@181@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 76 | !(0 <= k@181@01 && k@181@01 < P@159@01)]
(assert (not (and (<= 0 k@181@01) (< k@181@01 P@159@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@177@01 r)
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@180@01 r) (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@183@01  $FPM) r)
    (+
      (ite
        (and
          (img@177@01 r)
          (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@180@01 r)
          (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@183@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert ($Perm.isReadVar $k@187@01))
(assert (forall ((k@186@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@187@01))
    (and
      (= (inv@188@01 (Seq_index matrix@158@01 k@186@01)) k@186@01)
      (img@189@01 (Seq_index matrix@158@01 k@186@01))))
  :pattern ((Seq_index matrix@158@01 k@186@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@189@01 r)
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)))
    (= (Seq_index matrix@158@01 (inv@188@01 r)) r))
  :pattern ((inv@188@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r)))
    (=>
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (and
        (img@177@01 r)
        (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (and
        (img@180@01 r)
        (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef26|)))
(assert (=>
  (and (<= 0 k@181@01) (< k@181@01 P@159@01))
  (and
    (<= 0 k@181@01)
    (< k@181@01 P@159@01)
    (<= 0 (* M@156@01 N@157@01))
    (forall ((j@184@01 Int) (k@185@01 Int)) (!
      (=>
        (and
          (<= 0 j@184@01)
          (and
            (< j@184@01 (* M@156@01 N@157@01))
            (and
              (<= 0 k@185@01)
              (and
                (< k@185@01 (* M@156@01 N@157@01))
                (not (= j@184@01 k@185@01))))))
        (not
          (=
            (Seq_index matrix@158@01 j@184@01)
            (Seq_index matrix@158@01 k@185@01))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
    (forall ((k@186@01 Int)) (!
      (=>
        (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01)))
        (or (<= 0 k@186@01) (not (<= 0 k@186@01))))
      :pattern ((Seq_index matrix@158@01 k@186@01))
      :qid |Ref__Integer_value-aux|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@177@01 r)
                (and
                  (<= 0 (inv@176@01 r))
                  (< (inv@176@01 r) (* M@156@01 N@157@01))))
              (/ (to_real 1) (to_real 2))
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@177@01 r)
            (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@188@01 r))
                  (< (inv@188@01 r) (* M@156@01 N@157@01)))
                (img@189@01 r)
                (= r (Seq_index matrix@158@01 (inv@188@01 r))))
              $k@187@01
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@188@01 r))
                  (< (inv@188@01 r) (* M@156@01 N@157@01)))
                (img@189@01 r)
                (= r (Seq_index matrix@158@01 (inv@188@01 r))))
              $k@187@01
              $Perm.No)
            $Perm.No)))
      :pattern ((img@177@01 r))
      :pattern ((inv@176@01 r))
      :pattern ((img@189@01 r))
      :pattern ((Seq_index matrix@158@01 (inv@188@01 r)))
      :qid |qp.srp24|))
    (count_array%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@192@01  $FVF<Ref__Integer_value>)))))) 0 (*
      M@156@01
      N@157@01) matrix@158@01 k@181@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@181@01) (< k@181@01 P@159@01)))
  (and (<= 0 k@181@01) (< k@181@01 P@159@01))))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@181@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@177@01 r)
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@180@01 r) (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@183@01  $FPM) r)
    (+
      (ite
        (and
          (img@177@01 r)
          (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@180@01 r)
          (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@183@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert ($Perm.isReadVar $k@187@01))
(assert (forall ((k@186@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@187@01))
    (and
      (= (inv@188@01 (Seq_index matrix@158@01 k@186@01)) k@186@01)
      (img@189@01 (Seq_index matrix@158@01 k@186@01))))
  :pattern ((Seq_index matrix@158@01 k@186@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@189@01 r)
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)))
    (= (Seq_index matrix@158@01 (inv@188@01 r)) r))
  :pattern ((inv@188@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r)))
    (=>
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (and
        (img@177@01 r)
        (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@188@01 r)) (< (inv@188@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@187@01)
        (img@189@01 r))
      (and
        (img@180@01 r)
        (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@192@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef26|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@181@01 Int)) (!
  (and
    (or (<= 0 k@181@01) (not (<= 0 k@181@01)))
    (=>
      (and (<= 0 k@181@01) (< k@181@01 P@159@01))
      (and
        (<= 0 k@181@01)
        (< k@181@01 P@159@01)
        (<= 0 (* M@156@01 N@157@01))
        (forall ((j@184@01 Int) (k@185@01 Int)) (!
          (=>
            (and
              (<= 0 j@184@01)
              (and
                (< j@184@01 (* M@156@01 N@157@01))
                (and
                  (<= 0 k@185@01)
                  (and
                    (< k@185@01 (* M@156@01 N@157@01))
                    (not (= j@184@01 k@185@01))))))
            (not
              (=
                (Seq_index matrix@158@01 j@184@01)
                (Seq_index matrix@158@01 k@185@01))))
          
          :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
        (forall ((k@186@01 Int)) (!
          (=>
            (and (<= 0 k@186@01) (< k@186@01 (* M@156@01 N@157@01)))
            (or (<= 0 k@186@01) (not (<= 0 k@186@01))))
          :pattern ((Seq_index matrix@158@01 k@186@01))
          :qid |Ref__Integer_value-aux|))
        (forall ((r $Ref)) (!
          (=>
            (not
              (=
                (ite
                  (and
                    (img@177@01 r)
                    (and
                      (<= 0 (inv@176@01 r))
                      (< (inv@176@01 r) (* M@156@01 N@157@01))))
                  (/ (to_real 1) (to_real 2))
                  $Perm.No)
                $Perm.No))
            (ite
              (and
                (img@177@01 r)
                (and
                  (<= 0 (inv@176@01 r))
                  (< (inv@176@01 r) (* M@156@01 N@157@01))))
              (<
                (ite
                  (and
                    (and
                      (<= 0 (inv@188@01 r))
                      (< (inv@188@01 r) (* M@156@01 N@157@01)))
                    (img@189@01 r)
                    (= r (Seq_index matrix@158@01 (inv@188@01 r))))
                  $k@187@01
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              (<
                (ite
                  (and
                    (and
                      (<= 0 (inv@188@01 r))
                      (< (inv@188@01 r) (* M@156@01 N@157@01)))
                    (img@189@01 r)
                    (= r (Seq_index matrix@158@01 (inv@188@01 r))))
                  $k@187@01
                  $Perm.No)
                $Perm.No)))
          :pattern ((img@177@01 r))
          :pattern ((inv@176@01 r))
          :pattern ((img@189@01 r))
          :pattern ((Seq_index matrix@158@01 (inv@188@01 r)))
          :qid |qp.srp24|))
        (count_array%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@192@01  $FVF<Ref__Integer_value>)))))) 0 (*
          M@156@01
          N@157@01) matrix@158@01 k@181@01)))
    (or
      (not (and (<= 0 k@181@01) (< k@181@01 P@159@01)))
      (and (<= 0 k@181@01) (< k@181@01 P@159@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@170@12@170@117-aux|)))
(assert (forall ((k@181@01 Int)) (!
  (=>
    (and (<= 0 k@181@01) (< k@181@01 P@159@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@182@01  $FVF<Ref__Integer_value>) (Seq_index
        hist@160@01
        k@181@01))
      (count_array ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@192@01  $FVF<Ref__Integer_value>)))))) 0 (*
        M@156@01
        N@157@01) matrix@158@01 k@181@01)))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@170@12@170@117|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@174@01))) $Snap.unit))
; [eval] (forall i1: Int, j1: Int :: { old(Ref__multidim_index_2(M, N, i1, j1)) } { old(matrix[Ref__multidim_index_2(M, N, i1, j1)]) } 0 <= i1 && (i1 < M && (0 <= j1 && j1 < N)) ==> matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value == old(matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value))
(declare-const i1@193@01 Int)
(declare-const j1@194@01 Int)
(push) ; 3
; [eval] 0 <= i1 && (i1 < M && (0 <= j1 && j1 < N)) ==> matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value == old(matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value)
; [eval] 0 <= i1 && (i1 < M && (0 <= j1 && j1 < N))
; [eval] 0 <= i1
(push) ; 4
; [then-branch: 83 | !(0 <= i1@193@01) | live]
; [else-branch: 83 | 0 <= i1@193@01 | live]
(push) ; 5
; [then-branch: 83 | !(0 <= i1@193@01)]
(assert (not (<= 0 i1@193@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 83 | 0 <= i1@193@01]
(assert (<= 0 i1@193@01))
; [eval] i1 < M
(push) ; 6
; [then-branch: 84 | !(i1@193@01 < M@156@01) | live]
; [else-branch: 84 | i1@193@01 < M@156@01 | live]
(push) ; 7
; [then-branch: 84 | !(i1@193@01 < M@156@01)]
(assert (not (< i1@193@01 M@156@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 84 | i1@193@01 < M@156@01]
(assert (< i1@193@01 M@156@01))
; [eval] 0 <= j1
(push) ; 8
; [then-branch: 85 | !(0 <= j1@194@01) | live]
; [else-branch: 85 | 0 <= j1@194@01 | live]
(push) ; 9
; [then-branch: 85 | !(0 <= j1@194@01)]
(assert (not (<= 0 j1@194@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 85 | 0 <= j1@194@01]
(assert (<= 0 j1@194@01))
; [eval] j1 < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@194@01) (not (<= 0 j1@194@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i1@193@01 M@156@01)
  (and (< i1@193@01 M@156@01) (or (<= 0 j1@194@01) (not (<= 0 j1@194@01))))))
(assert (or (< i1@193@01 M@156@01) (not (< i1@193@01 M@156@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i1@193@01)
  (and
    (<= 0 i1@193@01)
    (=>
      (< i1@193@01 M@156@01)
      (and (< i1@193@01 M@156@01) (or (<= 0 j1@194@01) (not (<= 0 j1@194@01)))))
    (or (< i1@193@01 M@156@01) (not (< i1@193@01 M@156@01))))))
(assert (or (<= 0 i1@193@01) (not (<= 0 i1@193@01))))
(push) ; 4
; [then-branch: 86 | 0 <= i1@193@01 && i1@193@01 < M@156@01 && 0 <= j1@194@01 && j1@194@01 < N@157@01 | live]
; [else-branch: 86 | !(0 <= i1@193@01 && i1@193@01 < M@156@01 && 0 <= j1@194@01 && j1@194@01 < N@157@01) | live]
(push) ; 5
; [then-branch: 86 | 0 <= i1@193@01 && i1@193@01 < M@156@01 && 0 <= j1@194@01 && j1@194@01 < N@157@01]
(assert (and
  (<= 0 i1@193@01)
  (and (< i1@193@01 M@156@01) (and (<= 0 j1@194@01) (< j1@194@01 N@157@01)))))
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value == old(matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value)
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)]
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 M@156@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@156@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 N@157@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@157@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 M@156@01)
  (<= 0 N@157@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01)))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01)
  0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01)
  (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@195@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@177@01 r)
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@180@01 r) (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef29|)))
(declare-const pm@196@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@196@01  $FPM) r)
    (+
      (ite
        (and
          (img@177@01 r)
          (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@180@01 r)
          (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@196@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@196@01  $FPM) (Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value)
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)]
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01)
  0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01)
  (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@197@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@173@01 r) (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r))
  :qid |qp.fvfValDef32|)))
(declare-const pm@198@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@173@01 r)
          (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) (Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 86 | !(0 <= i1@193@01 && i1@193@01 < M@156@01 && 0 <= j1@194@01 && j1@194@01 < N@157@01)]
(assert (not
  (and
    (<= 0 i1@193@01)
    (and (< i1@193@01 M@156@01) (and (<= 0 j1@194@01) (< j1@194@01 N@157@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@177@01 r)
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@180@01 r) (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@196@01  $FPM) r)
    (+
      (ite
        (and
          (img@177@01 r)
          (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@180@01 r)
          (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@196@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@173@01 r) (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@173@01 r)
          (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
(assert (=>
  (and
    (<= 0 i1@193@01)
    (and (< i1@193@01 M@156@01) (and (<= 0 j1@194@01) (< j1@194@01 N@157@01))))
  (and
    (<= 0 i1@193@01)
    (< i1@193@01 M@156@01)
    (<= 0 j1@194@01)
    (< j1@194@01 N@157@01)
    (<= 0 M@156@01)
    (<= 0 N@157@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i1@193@01)
      (and (< i1@193@01 M@156@01) (and (<= 0 j1@194@01) (< j1@194@01 N@157@01)))))
  (and
    (<= 0 i1@193@01)
    (and (< i1@193@01 M@156@01) (and (<= 0 j1@194@01) (< j1@194@01 N@157@01))))))
; [eval] old(Ref__multidim_index_2(M, N, i1, j1))
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 4
; [eval] 0 <= i0
(push) ; 5
(assert (not (<= 0 i1@193@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-107|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r) $Perm.Write)
  :pattern ((inv@165@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r) $Perm.Write)
  :pattern ((inv@172@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@193@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-108|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
; Assume upper permission bound for field Ref__Integer_value
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@193@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
; Assume upper permission bound for field Ref__Integer_value
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@193@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; [eval] old(matrix[Ref__multidim_index_2(M, N, i1, j1)])
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)]
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 4
; [eval] 0 <= i0
(push) ; 5
(assert (not (<= 0 i1@193@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-110|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r) $Perm.Write)
  :pattern ((inv@165@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r) $Perm.Write)
  :pattern ((inv@172@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@193@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
; Assume upper permission bound for field Ref__Integer_value
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@193@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
; Assume upper permission bound for field Ref__Integer_value
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@193@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@177@01 r)
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@174@01)) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@180@01 r) (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@174@01))) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@196@01  $FPM) r)
    (+
      (ite
        (and
          (img@177@01 r)
          (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@180@01 r)
          (and (<= 0 (inv@179@01 r)) (< (inv@179@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@196@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@173@01 r) (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@173@01 r)
          (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@198@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@193@01 Int) (j1@194@01 Int)) (!
  (and
    (=>
      (<= 0 i1@193@01)
      (and
        (<= 0 i1@193@01)
        (=>
          (< i1@193@01 M@156@01)
          (and
            (< i1@193@01 M@156@01)
            (or (<= 0 j1@194@01) (not (<= 0 j1@194@01)))))
        (or (< i1@193@01 M@156@01) (not (< i1@193@01 M@156@01)))))
    (or (<= 0 i1@193@01) (not (<= 0 i1@193@01)))
    (=>
      (and
        (<= 0 i1@193@01)
        (and
          (< i1@193@01 M@156@01)
          (and (<= 0 j1@194@01) (< j1@194@01 N@157@01))))
      (and
        (<= 0 i1@193@01)
        (< i1@193@01 M@156@01)
        (<= 0 j1@194@01)
        (< j1@194@01 N@157@01)
        (<= 0 M@156@01)
        (<= 0 N@157@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01)))
    (or
      (not
        (and
          (<= 0 i1@193@01)
          (and
            (< i1@193@01 M@156@01)
            (and (<= 0 j1@194@01) (< j1@194@01 N@157@01)))))
      (and
        (<= 0 i1@193@01)
        (and
          (< i1@193@01 M@156@01)
          (and (<= 0 j1@194@01) (< j1@194@01 N@157@01))))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@171@12@171@225-aux|)))
(assert (forall ((i1@193@01 Int) (j1@194@01 Int)) (!
  (=>
    (and
      (<= 0 i1@193@01)
      (and (< i1@193@01 M@156@01) (and (<= 0 j1@194@01) (< j1@194@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@195@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@197@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@193@01 j1@194@01)))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@171@12@171@225|)))
(pop) ; 2
(push) ; 2
; [exec]
; Ref__loop_main_76(diz, current_thread_id, P, hist)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] P <= |hist|
; [eval] |hist|
; [eval] (forall j: Int, k: Int :: { hist[j], hist[k] } 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k])
(declare-const j@199@01 Int)
(declare-const k@200@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k]
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 87 | !(0 <= j@199@01) | live]
; [else-branch: 87 | 0 <= j@199@01 | live]
(push) ; 5
; [then-branch: 87 | !(0 <= j@199@01)]
(assert (not (<= 0 j@199@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 87 | 0 <= j@199@01]
(assert (<= 0 j@199@01))
; [eval] j < P
(push) ; 6
; [then-branch: 88 | !(j@199@01 < P@159@01) | live]
; [else-branch: 88 | j@199@01 < P@159@01 | live]
(push) ; 7
; [then-branch: 88 | !(j@199@01 < P@159@01)]
(assert (not (< j@199@01 P@159@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 88 | j@199@01 < P@159@01]
(assert (< j@199@01 P@159@01))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 89 | !(0 <= k@200@01) | live]
; [else-branch: 89 | 0 <= k@200@01 | live]
(push) ; 9
; [then-branch: 89 | !(0 <= k@200@01)]
(assert (not (<= 0 k@200@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 89 | 0 <= k@200@01]
(assert (<= 0 k@200@01))
; [eval] k < P
(push) ; 10
; [then-branch: 90 | !(k@200@01 < P@159@01) | live]
; [else-branch: 90 | k@200@01 < P@159@01 | live]
(push) ; 11
; [then-branch: 90 | !(k@200@01 < P@159@01)]
(assert (not (< k@200@01 P@159@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 90 | k@200@01 < P@159@01]
(assert (< k@200@01 P@159@01))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@200@01 P@159@01) (not (< k@200@01 P@159@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@200@01)
  (and (<= 0 k@200@01) (or (< k@200@01 P@159@01) (not (< k@200@01 P@159@01))))))
(assert (or (<= 0 k@200@01) (not (<= 0 k@200@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@199@01 P@159@01)
  (and
    (< j@199@01 P@159@01)
    (=>
      (<= 0 k@200@01)
      (and
        (<= 0 k@200@01)
        (or (< k@200@01 P@159@01) (not (< k@200@01 P@159@01)))))
    (or (<= 0 k@200@01) (not (<= 0 k@200@01))))))
(assert (or (< j@199@01 P@159@01) (not (< j@199@01 P@159@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@199@01)
  (and
    (<= 0 j@199@01)
    (=>
      (< j@199@01 P@159@01)
      (and
        (< j@199@01 P@159@01)
        (=>
          (<= 0 k@200@01)
          (and
            (<= 0 k@200@01)
            (or (< k@200@01 P@159@01) (not (< k@200@01 P@159@01)))))
        (or (<= 0 k@200@01) (not (<= 0 k@200@01)))))
    (or (< j@199@01 P@159@01) (not (< j@199@01 P@159@01))))))
(assert (or (<= 0 j@199@01) (not (<= 0 j@199@01))))
(push) ; 4
; [then-branch: 91 | 0 <= j@199@01 && j@199@01 < P@159@01 && 0 <= k@200@01 && k@200@01 < P@159@01 && j@199@01 != k@200@01 | live]
; [else-branch: 91 | !(0 <= j@199@01 && j@199@01 < P@159@01 && 0 <= k@200@01 && k@200@01 < P@159@01 && j@199@01 != k@200@01) | live]
(push) ; 5
; [then-branch: 91 | 0 <= j@199@01 && j@199@01 < P@159@01 && 0 <= k@200@01 && k@200@01 < P@159@01 && j@199@01 != k@200@01]
(assert (and
  (<= 0 j@199@01)
  (and
    (< j@199@01 P@159@01)
    (and (<= 0 k@200@01) (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01)))))))
; [eval] hist[j] != hist[k]
; [eval] hist[j]
(push) ; 6
(assert (not (>= j@199@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@199@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@200@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@200@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 91 | !(0 <= j@199@01 && j@199@01 < P@159@01 && 0 <= k@200@01 && k@200@01 < P@159@01 && j@199@01 != k@200@01)]
(assert (not
  (and
    (<= 0 j@199@01)
    (and
      (< j@199@01 P@159@01)
      (and
        (<= 0 k@200@01)
        (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@199@01)
    (and
      (< j@199@01 P@159@01)
      (and
        (<= 0 k@200@01)
        (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01))))))
  (and
    (<= 0 j@199@01)
    (< j@199@01 P@159@01)
    (<= 0 k@200@01)
    (< k@200@01 P@159@01)
    (not (= j@199@01 k@200@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@199@01)
      (and
        (< j@199@01 P@159@01)
        (and
          (<= 0 k@200@01)
          (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01)))))))
  (and
    (<= 0 j@199@01)
    (and
      (< j@199@01 P@159@01)
      (and
        (<= 0 k@200@01)
        (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@199@01 Int) (k@200@01 Int)) (!
  (and
    (=>
      (<= 0 j@199@01)
      (and
        (<= 0 j@199@01)
        (=>
          (< j@199@01 P@159@01)
          (and
            (< j@199@01 P@159@01)
            (=>
              (<= 0 k@200@01)
              (and
                (<= 0 k@200@01)
                (or (< k@200@01 P@159@01) (not (< k@200@01 P@159@01)))))
            (or (<= 0 k@200@01) (not (<= 0 k@200@01)))))
        (or (< j@199@01 P@159@01) (not (< j@199@01 P@159@01)))))
    (or (<= 0 j@199@01) (not (<= 0 j@199@01)))
    (=>
      (and
        (<= 0 j@199@01)
        (and
          (< j@199@01 P@159@01)
          (and
            (<= 0 k@200@01)
            (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01))))))
      (and
        (<= 0 j@199@01)
        (< j@199@01 P@159@01)
        (<= 0 k@200@01)
        (< k@200@01 P@159@01)
        (not (= j@199@01 k@200@01))))
    (or
      (not
        (and
          (<= 0 j@199@01)
          (and
            (< j@199@01 P@159@01)
            (and
              (<= 0 k@200@01)
              (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01)))))))
      (and
        (<= 0 j@199@01)
        (and
          (< j@199@01 P@159@01)
          (and
            (<= 0 k@200@01)
            (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01))))))))
  :pattern ((Seq_index hist@160@01 j@199@01) (Seq_index hist@160@01 k@200@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@76@12@76@104-aux|)))
(push) ; 3
(assert (not (forall ((j@199@01 Int) (k@200@01 Int)) (!
  (=>
    (and
      (<= 0 j@199@01)
      (and
        (< j@199@01 P@159@01)
        (and
          (<= 0 k@200@01)
          (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01))))))
    (not (= (Seq_index hist@160@01 j@199@01) (Seq_index hist@160@01 k@200@01))))
  :pattern ((Seq_index hist@160@01 j@199@01) (Seq_index hist@160@01 k@200@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@76@12@76@104|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@199@01 Int) (k@200@01 Int)) (!
  (=>
    (and
      (<= 0 j@199@01)
      (and
        (< j@199@01 P@159@01)
        (and
          (<= 0 k@200@01)
          (and (< k@200@01 P@159@01) (not (= j@199@01 k@200@01))))))
    (not (= (Seq_index hist@160@01 j@199@01) (Seq_index hist@160@01 k@200@01))))
  :pattern ((Seq_index hist@160@01 j@199@01) (Seq_index hist@160@01 k@200@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@76@12@76@104|)))
(declare-const k@201@01 Int)
(push) ; 3
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 92 | !(0 <= k@201@01) | live]
; [else-branch: 92 | 0 <= k@201@01 | live]
(push) ; 5
; [then-branch: 92 | !(0 <= k@201@01)]
(assert (not (<= 0 k@201@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 92 | 0 <= k@201@01]
(assert (<= 0 k@201@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@201@01) (not (<= 0 k@201@01))))
(assert (and (<= 0 k@201@01) (< k@201@01 P@159@01)))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@201@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@201@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@202@01 ($Ref) Int)
(declare-fun img@203@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@201@01 Int)) (!
  (=>
    (and (<= 0 k@201@01) (< k@201@01 P@159@01))
    (or (<= 0 k@201@01) (not (<= 0 k@201@01))))
  :pattern ((Seq_index hist@160@01 k@201@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@201@01 Int) (k2@201@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@201@01) (< k1@201@01 P@159@01))
      (and (<= 0 k2@201@01) (< k2@201@01 P@159@01))
      (= (Seq_index hist@160@01 k1@201@01) (Seq_index hist@160@01 k2@201@01)))
    (= k1@201@01 k2@201@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@201@01 Int)) (!
  (=>
    (and (<= 0 k@201@01) (< k@201@01 P@159@01))
    (and
      (= (inv@202@01 (Seq_index hist@160@01 k@201@01)) k@201@01)
      (img@203@01 (Seq_index hist@160@01 k@201@01))))
  :pattern ((Seq_index hist@160@01 k@201@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@203@01 r) (and (<= 0 (inv@202@01 r)) (< (inv@202@01 r) P@159@01)))
    (= (Seq_index hist@160@01 (inv@202@01 r)) r))
  :pattern ((inv@202@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((k@201@01 Int)) (!
  (= (Seq_index hist@160@01 k@201@01) (Seq_index matrix@158@01 k@201@01))
  
  :qid |quant-u-114|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@204@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@202@01 r)) (< (inv@202@01 r) P@159@01))
      (img@203@01 r)
      (= r (Seq_index hist@160@01 (inv@202@01 r))))
    ($Perm.min
      (ite
        (and
          (img@173@01 r)
          (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@205@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@202@01 r)) (< (inv@202@01 r) P@159@01))
      (img@203@01 r)
      (= r (Seq_index hist@160@01 (inv@202@01 r))))
    ($Perm.min
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@204@01 r)))
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
          (img@173@01 r)
          (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@204@01 r))
    $Perm.No)
  
  :qid |quant-u-116|))))
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
      (and (<= 0 (inv@202@01 r)) (< (inv@202@01 r) P@159@01))
      (img@203@01 r)
      (= r (Seq_index hist@160@01 (inv@202@01 r))))
    (= (- $Perm.Write (pTaken@204@01 r)) $Perm.No))
  
  :qid |quant-u-117|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@206@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@173@01 r) (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r))
  :qid |qp.fvfValDef35|)))
(declare-const $t@207@01 $Snap)
(assert (= $t@207@01 ($Snap.combine ($Snap.first $t@207@01) ($Snap.second $t@207@01))))
(declare-const k@208@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 93 | !(0 <= k@208@01) | live]
; [else-branch: 93 | 0 <= k@208@01 | live]
(push) ; 5
; [then-branch: 93 | !(0 <= k@208@01)]
(assert (not (<= 0 k@208@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 93 | 0 <= k@208@01]
(assert (<= 0 k@208@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@208@01) (not (<= 0 k@208@01))))
(assert (and (<= 0 k@208@01) (< k@208@01 P@159@01)))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@208@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@208@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@209@01 ($Ref) Int)
(declare-fun img@210@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@208@01 Int)) (!
  (=>
    (and (<= 0 k@208@01) (< k@208@01 P@159@01))
    (or (<= 0 k@208@01) (not (<= 0 k@208@01))))
  :pattern ((Seq_index hist@160@01 k@208@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@208@01 Int) (k2@208@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@208@01) (< k1@208@01 P@159@01))
      (and (<= 0 k2@208@01) (< k2@208@01 P@159@01))
      (= (Seq_index hist@160@01 k1@208@01) (Seq_index hist@160@01 k2@208@01)))
    (= k1@208@01 k2@208@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@208@01 Int)) (!
  (=>
    (and (<= 0 k@208@01) (< k@208@01 P@159@01))
    (and
      (= (inv@209@01 (Seq_index hist@160@01 k@208@01)) k@208@01)
      (img@210@01 (Seq_index hist@160@01 k@208@01))))
  :pattern ((Seq_index hist@160@01 k@208@01))
  :qid |quant-u-119|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@210@01 r) (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
    (= (Seq_index hist@160@01 (inv@209@01 r)) r))
  :pattern ((inv@209@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@208@01 Int)) (!
  (=>
    (and (<= 0 k@208@01) (< k@208@01 P@159@01))
    (not (= (Seq_index hist@160@01 k@208@01) $Ref.null)))
  :pattern ((Seq_index hist@160@01 k@208@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index hist@160@01 k@208@01) (Seq_index matrix@158@01 j1@164@01))
    (=
      (and
        (img@210@01 r)
        (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))))
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@207@01) $Snap.unit))
; [eval] (forall k: Int :: { hist[k] } 0 <= k && k < P ==> hist[k].Ref__Integer_value == 0)
(declare-const k@211@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < P ==> hist[k].Ref__Integer_value == 0
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 94 | !(0 <= k@211@01) | live]
; [else-branch: 94 | 0 <= k@211@01 | live]
(push) ; 5
; [then-branch: 94 | !(0 <= k@211@01)]
(assert (not (<= 0 k@211@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 94 | 0 <= k@211@01]
(assert (<= 0 k@211@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@211@01) (not (<= 0 k@211@01))))
(push) ; 4
; [then-branch: 95 | 0 <= k@211@01 && k@211@01 < P@159@01 | live]
; [else-branch: 95 | !(0 <= k@211@01 && k@211@01 < P@159@01) | live]
(push) ; 5
; [then-branch: 95 | 0 <= k@211@01 && k@211@01 < P@159@01]
(assert (and (<= 0 k@211@01) (< k@211@01 P@159@01)))
; [eval] hist[k].Ref__Integer_value == 0
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@211@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@211@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@212@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@210@01 r) (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
  :qid |qp.fvfValDef37|)))
(declare-const pm@213@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@213@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@210@01 r)
          (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@213@01  $FPM) r))
  :qid |qp.resPrmSumDef38|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@213@01  $FPM) (Seq_index
    hist@160@01
    k@211@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 95 | !(0 <= k@211@01 && k@211@01 < P@159@01)]
(assert (not (and (<= 0 k@211@01) (< k@211@01 P@159@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@210@01 r) (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@213@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@210@01 r)
          (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@213@01  $FPM) r))
  :qid |qp.resPrmSumDef38|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@211@01) (< k@211@01 P@159@01)))
  (and (<= 0 k@211@01) (< k@211@01 P@159@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@210@01 r) (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@213@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@210@01 r)
          (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@213@01  $FPM) r))
  :qid |qp.resPrmSumDef38|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@211@01 Int)) (!
  (and
    (or (<= 0 k@211@01) (not (<= 0 k@211@01)))
    (or
      (not (and (<= 0 k@211@01) (< k@211@01 P@159@01)))
      (and (<= 0 k@211@01) (< k@211@01 P@159@01))))
  :pattern ((Seq_index hist@160@01 k@211@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@79@12@79@86-aux|)))
(assert (forall ((k@211@01 Int)) (!
  (=>
    (and (<= 0 k@211@01) (< k@211@01 P@159@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
        hist@160@01
        k@211@01))
      0))
  :pattern ((Seq_index hist@160@01 k@211@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@79@12@79@86|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; Ref__loop_main_96(diz, current_thread_id, P, N, M, matrix, hist)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] M > 0
; [eval] N > 0
; [eval] P > 0
; [eval] P <= |hist|
; [eval] |hist|
; [eval] (forall j: Int, k: Int :: { hist[j], hist[k] } 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k])
(declare-const j@214@01 Int)
(declare-const k@215@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k))) ==> hist[j] != hist[k]
; [eval] 0 <= j && (j < P && (0 <= k && (k < P && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 96 | !(0 <= j@214@01) | live]
; [else-branch: 96 | 0 <= j@214@01 | live]
(push) ; 5
; [then-branch: 96 | !(0 <= j@214@01)]
(assert (not (<= 0 j@214@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 96 | 0 <= j@214@01]
(assert (<= 0 j@214@01))
; [eval] j < P
(push) ; 6
; [then-branch: 97 | !(j@214@01 < P@159@01) | live]
; [else-branch: 97 | j@214@01 < P@159@01 | live]
(push) ; 7
; [then-branch: 97 | !(j@214@01 < P@159@01)]
(assert (not (< j@214@01 P@159@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 97 | j@214@01 < P@159@01]
(assert (< j@214@01 P@159@01))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 98 | !(0 <= k@215@01) | live]
; [else-branch: 98 | 0 <= k@215@01 | live]
(push) ; 9
; [then-branch: 98 | !(0 <= k@215@01)]
(assert (not (<= 0 k@215@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 98 | 0 <= k@215@01]
(assert (<= 0 k@215@01))
; [eval] k < P
(push) ; 10
; [then-branch: 99 | !(k@215@01 < P@159@01) | live]
; [else-branch: 99 | k@215@01 < P@159@01 | live]
(push) ; 11
; [then-branch: 99 | !(k@215@01 < P@159@01)]
(assert (not (< k@215@01 P@159@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 99 | k@215@01 < P@159@01]
(assert (< k@215@01 P@159@01))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@215@01 P@159@01) (not (< k@215@01 P@159@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@215@01)
  (and (<= 0 k@215@01) (or (< k@215@01 P@159@01) (not (< k@215@01 P@159@01))))))
(assert (or (<= 0 k@215@01) (not (<= 0 k@215@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@214@01 P@159@01)
  (and
    (< j@214@01 P@159@01)
    (=>
      (<= 0 k@215@01)
      (and
        (<= 0 k@215@01)
        (or (< k@215@01 P@159@01) (not (< k@215@01 P@159@01)))))
    (or (<= 0 k@215@01) (not (<= 0 k@215@01))))))
(assert (or (< j@214@01 P@159@01) (not (< j@214@01 P@159@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@214@01)
  (and
    (<= 0 j@214@01)
    (=>
      (< j@214@01 P@159@01)
      (and
        (< j@214@01 P@159@01)
        (=>
          (<= 0 k@215@01)
          (and
            (<= 0 k@215@01)
            (or (< k@215@01 P@159@01) (not (< k@215@01 P@159@01)))))
        (or (<= 0 k@215@01) (not (<= 0 k@215@01)))))
    (or (< j@214@01 P@159@01) (not (< j@214@01 P@159@01))))))
(assert (or (<= 0 j@214@01) (not (<= 0 j@214@01))))
(push) ; 4
; [then-branch: 100 | 0 <= j@214@01 && j@214@01 < P@159@01 && 0 <= k@215@01 && k@215@01 < P@159@01 && j@214@01 != k@215@01 | live]
; [else-branch: 100 | !(0 <= j@214@01 && j@214@01 < P@159@01 && 0 <= k@215@01 && k@215@01 < P@159@01 && j@214@01 != k@215@01) | live]
(push) ; 5
; [then-branch: 100 | 0 <= j@214@01 && j@214@01 < P@159@01 && 0 <= k@215@01 && k@215@01 < P@159@01 && j@214@01 != k@215@01]
(assert (and
  (<= 0 j@214@01)
  (and
    (< j@214@01 P@159@01)
    (and (<= 0 k@215@01) (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01)))))))
; [eval] hist[j] != hist[k]
; [eval] hist[j]
(push) ; 6
(assert (not (>= j@214@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@214@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@215@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@215@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 100 | !(0 <= j@214@01 && j@214@01 < P@159@01 && 0 <= k@215@01 && k@215@01 < P@159@01 && j@214@01 != k@215@01)]
(assert (not
  (and
    (<= 0 j@214@01)
    (and
      (< j@214@01 P@159@01)
      (and
        (<= 0 k@215@01)
        (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@214@01)
    (and
      (< j@214@01 P@159@01)
      (and
        (<= 0 k@215@01)
        (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01))))))
  (and
    (<= 0 j@214@01)
    (< j@214@01 P@159@01)
    (<= 0 k@215@01)
    (< k@215@01 P@159@01)
    (not (= j@214@01 k@215@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@214@01)
      (and
        (< j@214@01 P@159@01)
        (and
          (<= 0 k@215@01)
          (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01)))))))
  (and
    (<= 0 j@214@01)
    (and
      (< j@214@01 P@159@01)
      (and
        (<= 0 k@215@01)
        (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@214@01 Int) (k@215@01 Int)) (!
  (and
    (=>
      (<= 0 j@214@01)
      (and
        (<= 0 j@214@01)
        (=>
          (< j@214@01 P@159@01)
          (and
            (< j@214@01 P@159@01)
            (=>
              (<= 0 k@215@01)
              (and
                (<= 0 k@215@01)
                (or (< k@215@01 P@159@01) (not (< k@215@01 P@159@01)))))
            (or (<= 0 k@215@01) (not (<= 0 k@215@01)))))
        (or (< j@214@01 P@159@01) (not (< j@214@01 P@159@01)))))
    (or (<= 0 j@214@01) (not (<= 0 j@214@01)))
    (=>
      (and
        (<= 0 j@214@01)
        (and
          (< j@214@01 P@159@01)
          (and
            (<= 0 k@215@01)
            (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01))))))
      (and
        (<= 0 j@214@01)
        (< j@214@01 P@159@01)
        (<= 0 k@215@01)
        (< k@215@01 P@159@01)
        (not (= j@214@01 k@215@01))))
    (or
      (not
        (and
          (<= 0 j@214@01)
          (and
            (< j@214@01 P@159@01)
            (and
              (<= 0 k@215@01)
              (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01)))))))
      (and
        (<= 0 j@214@01)
        (and
          (< j@214@01 P@159@01)
          (and
            (<= 0 k@215@01)
            (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01))))))))
  :pattern ((Seq_index hist@160@01 j@214@01) (Seq_index hist@160@01 k@215@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@106@12@106@104-aux|)))
(push) ; 3
(assert (not (forall ((j@214@01 Int) (k@215@01 Int)) (!
  (=>
    (and
      (<= 0 j@214@01)
      (and
        (< j@214@01 P@159@01)
        (and
          (<= 0 k@215@01)
          (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01))))))
    (not (= (Seq_index hist@160@01 j@214@01) (Seq_index hist@160@01 k@215@01))))
  :pattern ((Seq_index hist@160@01 j@214@01) (Seq_index hist@160@01 k@215@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@106@12@106@104|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@214@01 Int) (k@215@01 Int)) (!
  (=>
    (and
      (<= 0 j@214@01)
      (and
        (< j@214@01 P@159@01)
        (and
          (<= 0 k@215@01)
          (and (< k@215@01 P@159@01) (not (= j@214@01 k@215@01))))))
    (not (= (Seq_index hist@160@01 j@214@01) (Seq_index hist@160@01 k@215@01))))
  :pattern ((Seq_index hist@160@01 j@214@01) (Seq_index hist@160@01 k@215@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@106@12@106@104|)))
(declare-const k@216@01 Int)
(push) ; 3
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 101 | !(0 <= k@216@01) | live]
; [else-branch: 101 | 0 <= k@216@01 | live]
(push) ; 5
; [then-branch: 101 | !(0 <= k@216@01)]
(assert (not (<= 0 k@216@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 101 | 0 <= k@216@01]
(assert (<= 0 k@216@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@216@01) (not (<= 0 k@216@01))))
(assert (and (<= 0 k@216@01) (< k@216@01 P@159@01)))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@216@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@216@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@217@01 ($Ref) Int)
(declare-fun img@218@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@216@01 Int)) (!
  (=>
    (and (<= 0 k@216@01) (< k@216@01 P@159@01))
    (or (<= 0 k@216@01) (not (<= 0 k@216@01))))
  :pattern ((Seq_index hist@160@01 k@216@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@216@01 Int) (k2@216@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@216@01) (< k1@216@01 P@159@01))
      (and (<= 0 k2@216@01) (< k2@216@01 P@159@01))
      (= (Seq_index hist@160@01 k1@216@01) (Seq_index hist@160@01 k2@216@01)))
    (= k1@216@01 k2@216@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@216@01 Int)) (!
  (=>
    (and (<= 0 k@216@01) (< k@216@01 P@159@01))
    (and
      (= (inv@217@01 (Seq_index hist@160@01 k@216@01)) k@216@01)
      (img@218@01 (Seq_index hist@160@01 k@216@01))))
  :pattern ((Seq_index hist@160@01 k@216@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@218@01 r) (and (<= 0 (inv@217@01 r)) (< (inv@217@01 r) P@159@01)))
    (= (Seq_index hist@160@01 (inv@217@01 r)) r))
  :pattern ((inv@217@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((k@216@01 Int)) (!
  (= (Seq_index hist@160@01 k@216@01) (Seq_index matrix@158@01 k@216@01))
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@219@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@217@01 r)) (< (inv@217@01 r) P@159@01))
      (img@218@01 r)
      (= r (Seq_index hist@160@01 (inv@217@01 r))))
    ($Perm.min
      (ite
        (and
          (img@210@01 r)
          (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@220@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@217@01 r)) (< (inv@217@01 r) P@159@01))
      (img@218@01 r)
      (= r (Seq_index hist@160@01 (inv@217@01 r))))
    ($Perm.min
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@219@01 r)))
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
          (img@210@01 r)
          (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@219@01 r))
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
      (and (<= 0 (inv@217@01 r)) (< (inv@217@01 r) P@159@01))
      (img@218@01 r)
      (= r (Seq_index hist@160@01 (inv@217@01 r))))
    (= (- $Perm.Write (pTaken@219@01 r)) $Perm.No))
  
  :qid |quant-u-125|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] M * N <= |matrix|
; [eval] M * N
; [eval] |matrix|
; [eval] (forall j: Int, k: Int :: { matrix[j], matrix[k] } 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> matrix[j] != matrix[k])
(declare-const j@221@01 Int)
(declare-const k@222@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> matrix[j] != matrix[k]
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 102 | !(0 <= j@221@01) | live]
; [else-branch: 102 | 0 <= j@221@01 | live]
(push) ; 5
; [then-branch: 102 | !(0 <= j@221@01)]
(assert (not (<= 0 j@221@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 102 | 0 <= j@221@01]
(assert (<= 0 j@221@01))
; [eval] j < M * N
; [eval] M * N
(push) ; 6
; [then-branch: 103 | !(j@221@01 < M@156@01 * N@157@01) | live]
; [else-branch: 103 | j@221@01 < M@156@01 * N@157@01 | live]
(push) ; 7
; [then-branch: 103 | !(j@221@01 < M@156@01 * N@157@01)]
(assert (not (< j@221@01 (* M@156@01 N@157@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 103 | j@221@01 < M@156@01 * N@157@01]
(assert (< j@221@01 (* M@156@01 N@157@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 104 | !(0 <= k@222@01) | live]
; [else-branch: 104 | 0 <= k@222@01 | live]
(push) ; 9
; [then-branch: 104 | !(0 <= k@222@01)]
(assert (not (<= 0 k@222@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 104 | 0 <= k@222@01]
(assert (<= 0 k@222@01))
; [eval] k < M * N
; [eval] M * N
(push) ; 10
; [then-branch: 105 | !(k@222@01 < M@156@01 * N@157@01) | live]
; [else-branch: 105 | k@222@01 < M@156@01 * N@157@01 | live]
(push) ; 11
; [then-branch: 105 | !(k@222@01 < M@156@01 * N@157@01)]
(assert (not (< k@222@01 (* M@156@01 N@157@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 105 | k@222@01 < M@156@01 * N@157@01]
(assert (< k@222@01 (* M@156@01 N@157@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@222@01 (* M@156@01 N@157@01)) (not (< k@222@01 (* M@156@01 N@157@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@222@01)
  (and
    (<= 0 k@222@01)
    (or
      (< k@222@01 (* M@156@01 N@157@01))
      (not (< k@222@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 k@222@01) (not (<= 0 k@222@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@221@01 (* M@156@01 N@157@01))
  (and
    (< j@221@01 (* M@156@01 N@157@01))
    (=>
      (<= 0 k@222@01)
      (and
        (<= 0 k@222@01)
        (or
          (< k@222@01 (* M@156@01 N@157@01))
          (not (< k@222@01 (* M@156@01 N@157@01))))))
    (or (<= 0 k@222@01) (not (<= 0 k@222@01))))))
(assert (or (< j@221@01 (* M@156@01 N@157@01)) (not (< j@221@01 (* M@156@01 N@157@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@221@01)
  (and
    (<= 0 j@221@01)
    (=>
      (< j@221@01 (* M@156@01 N@157@01))
      (and
        (< j@221@01 (* M@156@01 N@157@01))
        (=>
          (<= 0 k@222@01)
          (and
            (<= 0 k@222@01)
            (or
              (< k@222@01 (* M@156@01 N@157@01))
              (not (< k@222@01 (* M@156@01 N@157@01))))))
        (or (<= 0 k@222@01) (not (<= 0 k@222@01)))))
    (or
      (< j@221@01 (* M@156@01 N@157@01))
      (not (< j@221@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 j@221@01) (not (<= 0 j@221@01))))
(push) ; 4
; [then-branch: 106 | 0 <= j@221@01 && j@221@01 < M@156@01 * N@157@01 && 0 <= k@222@01 && k@222@01 < M@156@01 * N@157@01 && j@221@01 != k@222@01 | live]
; [else-branch: 106 | !(0 <= j@221@01 && j@221@01 < M@156@01 * N@157@01 && 0 <= k@222@01 && k@222@01 < M@156@01 * N@157@01 && j@221@01 != k@222@01) | live]
(push) ; 5
; [then-branch: 106 | 0 <= j@221@01 && j@221@01 < M@156@01 * N@157@01 && 0 <= k@222@01 && k@222@01 < M@156@01 * N@157@01 && j@221@01 != k@222@01]
(assert (and
  (<= 0 j@221@01)
  (and
    (< j@221@01 (* M@156@01 N@157@01))
    (and
      (<= 0 k@222@01)
      (and (< k@222@01 (* M@156@01 N@157@01)) (not (= j@221@01 k@222@01)))))))
; [eval] matrix[j] != matrix[k]
; [eval] matrix[j]
(push) ; 6
(assert (not (>= j@221@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@221@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] matrix[k]
(push) ; 6
(assert (not (>= k@222@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@222@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 106 | !(0 <= j@221@01 && j@221@01 < M@156@01 * N@157@01 && 0 <= k@222@01 && k@222@01 < M@156@01 * N@157@01 && j@221@01 != k@222@01)]
(assert (not
  (and
    (<= 0 j@221@01)
    (and
      (< j@221@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@222@01)
        (and (< k@222@01 (* M@156@01 N@157@01)) (not (= j@221@01 k@222@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@221@01)
    (and
      (< j@221@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@222@01)
        (and (< k@222@01 (* M@156@01 N@157@01)) (not (= j@221@01 k@222@01))))))
  (and
    (<= 0 j@221@01)
    (< j@221@01 (* M@156@01 N@157@01))
    (<= 0 k@222@01)
    (< k@222@01 (* M@156@01 N@157@01))
    (not (= j@221@01 k@222@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@221@01)
      (and
        (< j@221@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@222@01)
          (and (< k@222@01 (* M@156@01 N@157@01)) (not (= j@221@01 k@222@01)))))))
  (and
    (<= 0 j@221@01)
    (and
      (< j@221@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@222@01)
        (and (< k@222@01 (* M@156@01 N@157@01)) (not (= j@221@01 k@222@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@221@01 Int) (k@222@01 Int)) (!
  (and
    (=>
      (<= 0 j@221@01)
      (and
        (<= 0 j@221@01)
        (=>
          (< j@221@01 (* M@156@01 N@157@01))
          (and
            (< j@221@01 (* M@156@01 N@157@01))
            (=>
              (<= 0 k@222@01)
              (and
                (<= 0 k@222@01)
                (or
                  (< k@222@01 (* M@156@01 N@157@01))
                  (not (< k@222@01 (* M@156@01 N@157@01))))))
            (or (<= 0 k@222@01) (not (<= 0 k@222@01)))))
        (or
          (< j@221@01 (* M@156@01 N@157@01))
          (not (< j@221@01 (* M@156@01 N@157@01))))))
    (or (<= 0 j@221@01) (not (<= 0 j@221@01)))
    (=>
      (and
        (<= 0 j@221@01)
        (and
          (< j@221@01 (* M@156@01 N@157@01))
          (and
            (<= 0 k@222@01)
            (and (< k@222@01 (* M@156@01 N@157@01)) (not (= j@221@01 k@222@01))))))
      (and
        (<= 0 j@221@01)
        (< j@221@01 (* M@156@01 N@157@01))
        (<= 0 k@222@01)
        (< k@222@01 (* M@156@01 N@157@01))
        (not (= j@221@01 k@222@01))))
    (or
      (not
        (and
          (<= 0 j@221@01)
          (and
            (< j@221@01 (* M@156@01 N@157@01))
            (and
              (<= 0 k@222@01)
              (and
                (< k@222@01 (* M@156@01 N@157@01))
                (not (= j@221@01 k@222@01)))))))
      (and
        (<= 0 j@221@01)
        (and
          (< j@221@01 (* M@156@01 N@157@01))
          (and
            (<= 0 k@222@01)
            (and (< k@222@01 (* M@156@01 N@157@01)) (not (= j@221@01 k@222@01))))))))
  :pattern ((Seq_index matrix@158@01 j@221@01) (Seq_index matrix@158@01 k@222@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@109@12@109@112-aux|)))
(push) ; 3
(assert (not (forall ((j@221@01 Int) (k@222@01 Int)) (!
  (=>
    (and
      (<= 0 j@221@01)
      (and
        (< j@221@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@222@01)
          (and (< k@222@01 (* M@156@01 N@157@01)) (not (= j@221@01 k@222@01))))))
    (not
      (= (Seq_index matrix@158@01 j@221@01) (Seq_index matrix@158@01 k@222@01))))
  :pattern ((Seq_index matrix@158@01 j@221@01) (Seq_index matrix@158@01 k@222@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@109@12@109@112|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@221@01 Int) (k@222@01 Int)) (!
  (=>
    (and
      (<= 0 j@221@01)
      (and
        (< j@221@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@222@01)
          (and (< k@222@01 (* M@156@01 N@157@01)) (not (= j@221@01 k@222@01))))))
    (not
      (= (Seq_index matrix@158@01 j@221@01) (Seq_index matrix@158@01 k@222@01))))
  :pattern ((Seq_index matrix@158@01 j@221@01) (Seq_index matrix@158@01 k@222@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@109@12@109@112|)))
(declare-const j@223@01 Int)
(push) ; 3
; [eval] 0 <= j && j < M * N
; [eval] 0 <= j
(push) ; 4
; [then-branch: 107 | !(0 <= j@223@01) | live]
; [else-branch: 107 | 0 <= j@223@01 | live]
(push) ; 5
; [then-branch: 107 | !(0 <= j@223@01)]
(assert (not (<= 0 j@223@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 107 | 0 <= j@223@01]
(assert (<= 0 j@223@01))
; [eval] j < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@223@01) (not (<= 0 j@223@01))))
(assert (and (<= 0 j@223@01) (< j@223@01 (* M@156@01 N@157@01))))
; [eval] matrix[j]
(push) ; 4
(assert (not (>= j@223@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@223@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@224@01 ($Ref) Int)
(declare-fun img@225@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@223@01 Int)) (!
  (=>
    (and (<= 0 j@223@01) (< j@223@01 (* M@156@01 N@157@01)))
    (or (<= 0 j@223@01) (not (<= 0 j@223@01))))
  :pattern ((Seq_index matrix@158@01 j@223@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@223@01 Int) (j2@223@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@223@01) (< j1@223@01 (* M@156@01 N@157@01)))
      (and (<= 0 j2@223@01) (< j2@223@01 (* M@156@01 N@157@01)))
      (= (Seq_index matrix@158@01 j1@223@01) (Seq_index matrix@158@01 j2@223@01)))
    (= j1@223@01 j2@223@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@223@01 Int)) (!
  (=>
    (and (<= 0 j@223@01) (< j@223@01 (* M@156@01 N@157@01)))
    (and
      (= (inv@224@01 (Seq_index matrix@158@01 j@223@01)) j@223@01)
      (img@225@01 (Seq_index matrix@158@01 j@223@01))))
  :pattern ((Seq_index matrix@158@01 j@223@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@225@01 r)
      (and (<= 0 (inv@224@01 r)) (< (inv@224@01 r) (* M@156@01 N@157@01))))
    (= (Seq_index matrix@158@01 (inv@224@01 r)) r))
  :pattern ((inv@224@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@226@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@224@01 r)) (< (inv@224@01 r) (* M@156@01 N@157@01)))
      (img@225@01 r)
      (= r (Seq_index matrix@158@01 (inv@224@01 r))))
    ($Perm.min
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
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
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@226@01 r))
    $Perm.No)
  
  :qid |quant-u-128|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@226@01 r) $Perm.No)
  
  :qid |quant-u-129|))))
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
      (and (<= 0 (inv@224@01 r)) (< (inv@224@01 r) (* M@156@01 N@157@01)))
      (img@225@01 r)
      (= r (Seq_index matrix@158@01 (inv@224@01 r))))
    (= (- (/ (to_real 1) (to_real 4)) (pTaken@226@01 r)) $Perm.No))
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@227@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@227@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@227@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef39|)))
; [eval] (forall i: Int, j: Int :: { Ref__multidim_index_2(M, N, i, j) } 0 <= i && (i < M && (0 <= j && j < N)) ==> Ref__multidim_index_2(M, N, i, j) < |matrix|)
(declare-const i@228@01 Int)
(declare-const j@229@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> Ref__multidim_index_2(M, N, i, j) < |matrix|
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 108 | !(0 <= i@228@01) | live]
; [else-branch: 108 | 0 <= i@228@01 | live]
(push) ; 5
; [then-branch: 108 | !(0 <= i@228@01)]
(assert (not (<= 0 i@228@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 108 | 0 <= i@228@01]
(assert (<= 0 i@228@01))
; [eval] i < M
(push) ; 6
; [then-branch: 109 | !(i@228@01 < M@156@01) | live]
; [else-branch: 109 | i@228@01 < M@156@01 | live]
(push) ; 7
; [then-branch: 109 | !(i@228@01 < M@156@01)]
(assert (not (< i@228@01 M@156@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 109 | i@228@01 < M@156@01]
(assert (< i@228@01 M@156@01))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 110 | !(0 <= j@229@01) | live]
; [else-branch: 110 | 0 <= j@229@01 | live]
(push) ; 9
; [then-branch: 110 | !(0 <= j@229@01)]
(assert (not (<= 0 j@229@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 110 | 0 <= j@229@01]
(assert (<= 0 j@229@01))
; [eval] j < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@229@01) (not (<= 0 j@229@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@228@01 M@156@01)
  (and (< i@228@01 M@156@01) (or (<= 0 j@229@01) (not (<= 0 j@229@01))))))
(assert (or (< i@228@01 M@156@01) (not (< i@228@01 M@156@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@228@01)
  (and
    (<= 0 i@228@01)
    (=>
      (< i@228@01 M@156@01)
      (and (< i@228@01 M@156@01) (or (<= 0 j@229@01) (not (<= 0 j@229@01)))))
    (or (< i@228@01 M@156@01) (not (< i@228@01 M@156@01))))))
(assert (or (<= 0 i@228@01) (not (<= 0 i@228@01))))
(push) ; 4
; [then-branch: 111 | 0 <= i@228@01 && i@228@01 < M@156@01 && 0 <= j@229@01 && j@229@01 < N@157@01 | live]
; [else-branch: 111 | !(0 <= i@228@01 && i@228@01 < M@156@01 && 0 <= j@229@01 && j@229@01 < N@157@01) | live]
(push) ; 5
; [then-branch: 111 | 0 <= i@228@01 && i@228@01 < M@156@01 && 0 <= j@229@01 && j@229@01 < N@157@01]
(assert (and
  (<= 0 i@228@01)
  (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01)))))
; [eval] Ref__multidim_index_2(M, N, i, j) < |matrix|
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 M@156@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@156@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 N@157@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@157@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 M@156@01)
  (<= 0 N@157@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01)))
; [eval] |matrix|
(pop) ; 5
(push) ; 5
; [else-branch: 111 | !(0 <= i@228@01 && i@228@01 < M@156@01 && 0 <= j@229@01 && j@229@01 < N@157@01)]
(assert (not
  (and
    (<= 0 i@228@01)
    (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@228@01)
    (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01))))
  (and
    (<= 0 i@228@01)
    (< i@228@01 M@156@01)
    (<= 0 j@229@01)
    (< j@229@01 N@157@01)
    (<= 0 M@156@01)
    (<= 0 N@157@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@228@01)
      (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01)))))
  (and
    (<= 0 i@228@01)
    (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@228@01 Int) (j@229@01 Int)) (!
  (and
    (=>
      (<= 0 i@228@01)
      (and
        (<= 0 i@228@01)
        (=>
          (< i@228@01 M@156@01)
          (and (< i@228@01 M@156@01) (or (<= 0 j@229@01) (not (<= 0 j@229@01)))))
        (or (< i@228@01 M@156@01) (not (< i@228@01 M@156@01)))))
    (or (<= 0 i@228@01) (not (<= 0 i@228@01)))
    (=>
      (and
        (<= 0 i@228@01)
        (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01))))
      (and
        (<= 0 i@228@01)
        (< i@228@01 M@156@01)
        (<= 0 j@229@01)
        (< j@229@01 N@157@01)
        (<= 0 M@156@01)
        (<= 0 N@157@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01)))
    (or
      (not
        (and
          (<= 0 i@228@01)
          (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01)))))
      (and
        (<= 0 i@228@01)
        (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01))))))
  :pattern ((Ref__multidim_index_2%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@111@13@111@129-aux|)))
(assert (forall ((i@228@01 Int) (j@229@01 Int)) (!
  (=>
    (and
      (<= 0 i@228@01)
      (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01))))
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01))
  :pattern ((Ref__multidim_index_2%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@111@13@111@129_precondition|)))
(push) ; 3
(assert (not (forall ((i@228@01 Int) (j@229@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 i@228@01)
          (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01))))
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01))
      (and
        (<= 0 i@228@01)
        (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01)))))
    (<
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01)
      (Seq_length matrix@158@01)))
  :pattern ((Ref__multidim_index_2%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@111@13@111@129|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@228@01 Int) (j@229@01 Int)) (!
  (=>
    (and
      (<= 0 i@228@01)
      (and (< i@228@01 M@156@01) (and (<= 0 j@229@01) (< j@229@01 N@157@01))))
    (<
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01)
      (Seq_length matrix@158@01)))
  :pattern ((Ref__multidim_index_2%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@228@01 j@229@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@111@13@111@129|)))
; [eval] (forall i: Int, j: Int :: { matrix[Ref__multidim_index_2(M, N, i, j)] } 0 <= i && (i < M && (0 <= j && j < N)) ==> 0 <= matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value && matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value < P)
(declare-const i@230@01 Int)
(declare-const j@231@01 Int)
(push) ; 3
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> 0 <= matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value && matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value < P
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 112 | !(0 <= i@230@01) | live]
; [else-branch: 112 | 0 <= i@230@01 | live]
(push) ; 5
; [then-branch: 112 | !(0 <= i@230@01)]
(assert (not (<= 0 i@230@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 112 | 0 <= i@230@01]
(assert (<= 0 i@230@01))
; [eval] i < M
(push) ; 6
; [then-branch: 113 | !(i@230@01 < M@156@01) | live]
; [else-branch: 113 | i@230@01 < M@156@01 | live]
(push) ; 7
; [then-branch: 113 | !(i@230@01 < M@156@01)]
(assert (not (< i@230@01 M@156@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 113 | i@230@01 < M@156@01]
(assert (< i@230@01 M@156@01))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 114 | !(0 <= j@231@01) | live]
; [else-branch: 114 | 0 <= j@231@01 | live]
(push) ; 9
; [then-branch: 114 | !(0 <= j@231@01)]
(assert (not (<= 0 j@231@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 114 | 0 <= j@231@01]
(assert (<= 0 j@231@01))
; [eval] j < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@231@01) (not (<= 0 j@231@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@230@01 M@156@01)
  (and (< i@230@01 M@156@01) (or (<= 0 j@231@01) (not (<= 0 j@231@01))))))
(assert (or (< i@230@01 M@156@01) (not (< i@230@01 M@156@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@230@01)
  (and
    (<= 0 i@230@01)
    (=>
      (< i@230@01 M@156@01)
      (and (< i@230@01 M@156@01) (or (<= 0 j@231@01) (not (<= 0 j@231@01)))))
    (or (< i@230@01 M@156@01) (not (< i@230@01 M@156@01))))))
(assert (or (<= 0 i@230@01) (not (<= 0 i@230@01))))
(push) ; 4
; [then-branch: 115 | 0 <= i@230@01 && i@230@01 < M@156@01 && 0 <= j@231@01 && j@231@01 < N@157@01 | live]
; [else-branch: 115 | !(0 <= i@230@01 && i@230@01 < M@156@01 && 0 <= j@231@01 && j@231@01 < N@157@01) | live]
(push) ; 5
; [then-branch: 115 | 0 <= i@230@01 && i@230@01 < M@156@01 && 0 <= j@231@01 && j@231@01 < N@157@01]
(assert (and
  (<= 0 i@230@01)
  (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01)))))
; [eval] 0 <= matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value && matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value < P
; [eval] 0 <= matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 M@156@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@156@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 N@157@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@157@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 M@156@01)
  (<= 0 N@157@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)
  0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)
  (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
    :qid |qp.fvfValDef36|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@210@01 r)
        (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
    :qid |qp.fvfValDef37|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@166@01 (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
        (and
          (<=
            0
            (inv@165@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
          (<
            (inv@165@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
            (* M@156@01 N@157@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@210@01 (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
        (and
          (<=
            0
            (inv@209@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
          (<
            (inv@209@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
            P@159@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 116 | !(0 <= Lookup(Ref__Integer_value, sm@212@01, matrix@158@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@156@01, N@157@01, i@230@01, j@231@01)])) | live]
; [else-branch: 116 | 0 <= Lookup(Ref__Integer_value, sm@212@01, matrix@158@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@156@01, N@157@01, i@230@01, j@231@01)]) | live]
(push) ; 7
; [then-branch: 116 | !(0 <= Lookup(Ref__Integer_value, sm@212@01, matrix@158@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@156@01, N@157@01, i@230@01, j@231@01)]))]
(assert (not
  (<=
    0
    ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@158@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))))
(pop) ; 7
(push) ; 7
; [else-branch: 116 | 0 <= Lookup(Ref__Integer_value, sm@212@01, matrix@158@01[Ref__multidim_index_2((_, (_, (_, (_, (_, _))))), M@156@01, N@157@01, i@230@01, j@231@01)])]
(assert (<=
  0
  ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))))
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value < P
; [eval] matrix[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 8
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)
  0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)
  (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
    :qid |qp.fvfValDef36|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@210@01 r)
        (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
    :qid |qp.fvfValDef37|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@166@01 (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
        (and
          (<=
            0
            (inv@165@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
          (<
            (inv@165@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
            (* M@156@01 N@157@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@210@01 (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
        (and
          (<=
            0
            (inv@209@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
          (<
            (inv@209@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
            P@159@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@210@01 r) (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
  :qid |qp.fvfValDef37|)))
(assert (or
  (<=
    0
    ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
      matrix@158@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
  (not
    (<=
      0
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))))))
(pop) ; 5
(push) ; 5
; [else-branch: 115 | !(0 <= i@230@01 && i@230@01 < M@156@01 && 0 <= j@231@01 && j@231@01 < N@157@01)]
(assert (not
  (and
    (<= 0 i@230@01)
    (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@210@01 r) (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
  :qid |qp.fvfValDef37|)))
(assert (=>
  (and
    (<= 0 i@230@01)
    (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01))))
  (and
    (<= 0 i@230@01)
    (< i@230@01 M@156@01)
    (<= 0 j@231@01)
    (< j@231@01 N@157@01)
    (<= 0 M@156@01)
    (<= 0 N@157@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)
    (or
      (<=
        0
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
      (not
        (<=
          0
          ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
            matrix@158@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@230@01)
      (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01)))))
  (and
    (<= 0 i@230@01)
    (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@210@01 r) (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
  :qid |qp.fvfValDef37|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@230@01 Int) (j@231@01 Int)) (!
  (and
    (=>
      (<= 0 i@230@01)
      (and
        (<= 0 i@230@01)
        (=>
          (< i@230@01 M@156@01)
          (and (< i@230@01 M@156@01) (or (<= 0 j@231@01) (not (<= 0 j@231@01)))))
        (or (< i@230@01 M@156@01) (not (< i@230@01 M@156@01)))))
    (or (<= 0 i@230@01) (not (<= 0 i@230@01)))
    (=>
      (and
        (<= 0 i@230@01)
        (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01))))
      (and
        (<= 0 i@230@01)
        (< i@230@01 M@156@01)
        (<= 0 j@231@01)
        (< j@231@01 N@157@01)
        (<= 0 M@156@01)
        (<= 0 N@157@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)
        (or
          (<=
            0
            ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
          (not
            (<=
              0
              ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
                matrix@158@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))))))
    (or
      (not
        (and
          (<= 0 i@230@01)
          (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01)))))
      (and
        (<= 0 i@230@01)
        (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01))))))
  :pattern ((Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@112@13@112@222-aux|)))
(assert (forall ((i@230@01 Int) (j@231@01 Int)) (!
  (=>
    (and
      (<= 0 i@230@01)
      (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01))))
    (and
      (Ref__multidim_index_2%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)
      (=>
        (<=
          0
          ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
            matrix@158@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
  :pattern ((Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@112@13@112@222_precondition|)))
(push) ; 3
(assert (not (forall ((i@230@01 Int) (j@231@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 i@230@01)
          (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01))))
        (and
          (Ref__multidim_index_2%precondition ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)
          (=>
            (<=
              0
              ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
                matrix@158@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
            (Ref__multidim_index_2%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
      (and
        (<= 0 i@230@01)
        (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01)))))
    (and
      (<=
        0
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
      (<
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
        P@159@01)))
  :pattern ((Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@112@13@112@222|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@230@01 Int) (j@231@01 Int)) (!
  (=>
    (and
      (<= 0 i@230@01)
      (and (< i@230@01 M@156@01) (and (<= 0 j@231@01) (< j@231@01 N@157@01))))
    (and
      (<=
        0
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01))))
      (<
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
        P@159@01)))
  :pattern ((Seq_index
    matrix@158@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i@230@01 j@231@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@112@13@112@222|)))
(declare-const $t@232@01 $Snap)
(assert (= $t@232@01 ($Snap.combine ($Snap.first $t@232@01) ($Snap.second $t@232@01))))
(assert (= ($Snap.first $t@232@01) $Snap.unit))
; [eval] M > 0
(assert (=
  ($Snap.second $t@232@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@232@01))
    ($Snap.second ($Snap.second $t@232@01)))))
(assert (= ($Snap.first ($Snap.second $t@232@01)) $Snap.unit))
; [eval] N > 0
(assert (=
  ($Snap.second ($Snap.second $t@232@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@232@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@232@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@232@01))) $Snap.unit))
; [eval] P > 0
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@232@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))))
(declare-const j@233@01 Int)
(push) ; 3
; [eval] 0 <= j && j < M * N
; [eval] 0 <= j
(push) ; 4
; [then-branch: 117 | !(0 <= j@233@01) | live]
; [else-branch: 117 | 0 <= j@233@01 | live]
(push) ; 5
; [then-branch: 117 | !(0 <= j@233@01)]
(assert (not (<= 0 j@233@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 117 | 0 <= j@233@01]
(assert (<= 0 j@233@01))
; [eval] j < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@233@01) (not (<= 0 j@233@01))))
(assert (and (<= 0 j@233@01) (< j@233@01 (* M@156@01 N@157@01))))
; [eval] matrix[j]
(push) ; 4
(assert (not (>= j@233@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@233@01 (Seq_length matrix@158@01))))
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
(assert (forall ((j@233@01 Int)) (!
  (=>
    (and (<= 0 j@233@01) (< j@233@01 (* M@156@01 N@157@01)))
    (or (<= 0 j@233@01) (not (<= 0 j@233@01))))
  :pattern ((Seq_index matrix@158@01 j@233@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@233@01 Int) (j2@233@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@233@01) (< j1@233@01 (* M@156@01 N@157@01)))
      (and (<= 0 j2@233@01) (< j2@233@01 (* M@156@01 N@157@01)))
      (= (Seq_index matrix@158@01 j1@233@01) (Seq_index matrix@158@01 j2@233@01)))
    (= j1@233@01 j2@233@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@233@01 Int)) (!
  (=>
    (and (<= 0 j@233@01) (< j@233@01 (* M@156@01 N@157@01)))
    (and
      (= (inv@234@01 (Seq_index matrix@158@01 j@233@01)) j@233@01)
      (img@235@01 (Seq_index matrix@158@01 j@233@01))))
  :pattern ((Seq_index matrix@158@01 j@233@01))
  :qid |quant-u-132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@235@01 r)
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
    (= (Seq_index matrix@158@01 (inv@234@01 r)) r))
  :pattern ((inv@234@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@233@01 Int)) (!
  (=>
    (and (<= 0 j@233@01) (< j@233@01 (* M@156@01 N@157@01)))
    (not (= (Seq_index matrix@158@01 j@233@01) $Ref.null)))
  :pattern ((Seq_index matrix@158@01 j@233@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j@233@01) (Seq_index matrix@158@01 j1@164@01))
    (=
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))))
  
  :qid |quant-u-133|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01))))))))
(declare-const k@236@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 118 | !(0 <= k@236@01) | live]
; [else-branch: 118 | 0 <= k@236@01 | live]
(push) ; 5
; [then-branch: 118 | !(0 <= k@236@01)]
(assert (not (<= 0 k@236@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 118 | 0 <= k@236@01]
(assert (<= 0 k@236@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@236@01) (not (<= 0 k@236@01))))
(assert (and (<= 0 k@236@01) (< k@236@01 P@159@01)))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@236@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@236@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@237@01 ($Ref) Int)
(declare-fun img@238@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@236@01 Int)) (!
  (=>
    (and (<= 0 k@236@01) (< k@236@01 P@159@01))
    (or (<= 0 k@236@01) (not (<= 0 k@236@01))))
  :pattern ((Seq_index hist@160@01 k@236@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@236@01 Int) (k2@236@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@236@01) (< k1@236@01 P@159@01))
      (and (<= 0 k2@236@01) (< k2@236@01 P@159@01))
      (= (Seq_index hist@160@01 k1@236@01) (Seq_index hist@160@01 k2@236@01)))
    (= k1@236@01 k2@236@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@236@01 Int)) (!
  (=>
    (and (<= 0 k@236@01) (< k@236@01 P@159@01))
    (and
      (= (inv@237@01 (Seq_index hist@160@01 k@236@01)) k@236@01)
      (img@238@01 (Seq_index hist@160@01 k@236@01))))
  :pattern ((Seq_index hist@160@01 k@236@01))
  :qid |quant-u-135|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (= (Seq_index hist@160@01 (inv@237@01 r)) r))
  :pattern ((inv@237@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@236@01 Int)) (!
  (=>
    (and (<= 0 k@236@01) (< k@236@01 P@159@01))
    (not (= (Seq_index hist@160@01 k@236@01) $Ref.null)))
  :pattern ((Seq_index hist@160@01 k@236@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index hist@160@01 k@236@01) (Seq_index matrix@158@01 j@233@01))
    (=
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))))
  
  :qid |quant-u-136|))))
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
    (= (Seq_index hist@160@01 k@236@01) (Seq_index matrix@158@01 j1@164@01))
    (=
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))
  $Snap.unit))
; [eval] (forall k: Int :: { old(hist[k]) } 0 <= k && k < P ==> hist[k].Ref__Integer_value == old(hist[k].Ref__Integer_value) + count_array(0, M * N, matrix, k))
(declare-const k@239@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < P ==> hist[k].Ref__Integer_value == old(hist[k].Ref__Integer_value) + count_array(0, M * N, matrix, k)
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 119 | !(0 <= k@239@01) | live]
; [else-branch: 119 | 0 <= k@239@01 | live]
(push) ; 5
; [then-branch: 119 | !(0 <= k@239@01)]
(assert (not (<= 0 k@239@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 119 | 0 <= k@239@01]
(assert (<= 0 k@239@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@239@01) (not (<= 0 k@239@01))))
(push) ; 4
; [then-branch: 120 | 0 <= k@239@01 && k@239@01 < P@159@01 | live]
; [else-branch: 120 | !(0 <= k@239@01 && k@239@01 < P@159@01) | live]
(push) ; 5
; [then-branch: 120 | 0 <= k@239@01 && k@239@01 < P@159@01]
(assert (and (<= 0 k@239@01) (< k@239@01 P@159@01)))
; [eval] hist[k].Ref__Integer_value == old(hist[k].Ref__Integer_value) + count_array(0, M * N, matrix, k)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@239@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@239@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@240@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@235@01 r)
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef42|)))
(declare-const pm@241@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@241@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@166@01 r)
            (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
          (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
          $Perm.No)
        (ite
          (and
            (img@235@01 r)
            (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
          (/ (to_real 1) (to_real 4))
          $Perm.No))
      (ite
        (and
          (img@238@01 r)
          (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@241@01  $FPM) r))
  :qid |qp.resPrmSumDef43|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@241@01  $FPM) (Seq_index
    hist@160@01
    k@239@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(hist[k].Ref__Integer_value) + count_array(0, M * N, matrix, k)
; [eval] old(hist[k].Ref__Integer_value)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@239@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@239@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
    :qid |qp.fvfValDef36|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@210@01 r)
        (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
    :qid |qp.fvfValDef37|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@166@01 (Seq_index hist@160@01 k@239@01))
        (and
          (<= 0 (inv@165@01 (Seq_index hist@160@01 k@239@01)))
          (< (inv@165@01 (Seq_index hist@160@01 k@239@01)) (* M@156@01 N@157@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@210@01 (Seq_index hist@160@01 k@239@01))
        (and
          (<= 0 (inv@209@01 (Seq_index hist@160@01 k@239@01)))
          (< (inv@209@01 (Seq_index hist@160@01 k@239@01)) P@159@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] count_array(0, M * N, matrix, k)
; [eval] M * N
(push) ; 6
; [eval] 0 <= i
; [eval] i <= hi
(push) ; 7
(assert (not (<= 0 (* M@156@01 N@157@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (* M@156@01 N@157@01)))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall j: Int, k: Int ::0 <= j && (j < hi && (0 <= k && (k < hi && j != k))) ==> ar[j] != ar[k])
(declare-const j@242@01 Int)
(declare-const k@243@01 Int)
(push) ; 7
; [eval] 0 <= j && (j < hi && (0 <= k && (k < hi && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < hi && (0 <= k && (k < hi && j != k)))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 121 | !(0 <= j@242@01) | live]
; [else-branch: 121 | 0 <= j@242@01 | live]
(push) ; 9
; [then-branch: 121 | !(0 <= j@242@01)]
(assert (not (<= 0 j@242@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 121 | 0 <= j@242@01]
(assert (<= 0 j@242@01))
; [eval] j < hi
(push) ; 10
; [then-branch: 122 | !(j@242@01 < M@156@01 * N@157@01) | live]
; [else-branch: 122 | j@242@01 < M@156@01 * N@157@01 | live]
(push) ; 11
; [then-branch: 122 | !(j@242@01 < M@156@01 * N@157@01)]
(assert (not (< j@242@01 (* M@156@01 N@157@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 122 | j@242@01 < M@156@01 * N@157@01]
(assert (< j@242@01 (* M@156@01 N@157@01)))
; [eval] 0 <= k
(push) ; 12
; [then-branch: 123 | !(0 <= k@243@01) | live]
; [else-branch: 123 | 0 <= k@243@01 | live]
(push) ; 13
; [then-branch: 123 | !(0 <= k@243@01)]
(assert (not (<= 0 k@243@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 123 | 0 <= k@243@01]
(assert (<= 0 k@243@01))
; [eval] k < hi
(push) ; 14
; [then-branch: 124 | !(k@243@01 < M@156@01 * N@157@01) | live]
; [else-branch: 124 | k@243@01 < M@156@01 * N@157@01 | live]
(push) ; 15
; [then-branch: 124 | !(k@243@01 < M@156@01 * N@157@01)]
(assert (not (< k@243@01 (* M@156@01 N@157@01))))
(pop) ; 15
(push) ; 15
; [else-branch: 124 | k@243@01 < M@156@01 * N@157@01]
(assert (< k@243@01 (* M@156@01 N@157@01)))
; [eval] j != k
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (< k@243@01 (* M@156@01 N@157@01)) (not (< k@243@01 (* M@156@01 N@157@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@243@01)
  (and
    (<= 0 k@243@01)
    (or
      (< k@243@01 (* M@156@01 N@157@01))
      (not (< k@243@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 k@243@01) (not (<= 0 k@243@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@242@01 (* M@156@01 N@157@01))
  (and
    (< j@242@01 (* M@156@01 N@157@01))
    (=>
      (<= 0 k@243@01)
      (and
        (<= 0 k@243@01)
        (or
          (< k@243@01 (* M@156@01 N@157@01))
          (not (< k@243@01 (* M@156@01 N@157@01))))))
    (or (<= 0 k@243@01) (not (<= 0 k@243@01))))))
(assert (or (< j@242@01 (* M@156@01 N@157@01)) (not (< j@242@01 (* M@156@01 N@157@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@242@01)
  (and
    (<= 0 j@242@01)
    (=>
      (< j@242@01 (* M@156@01 N@157@01))
      (and
        (< j@242@01 (* M@156@01 N@157@01))
        (=>
          (<= 0 k@243@01)
          (and
            (<= 0 k@243@01)
            (or
              (< k@243@01 (* M@156@01 N@157@01))
              (not (< k@243@01 (* M@156@01 N@157@01))))))
        (or (<= 0 k@243@01) (not (<= 0 k@243@01)))))
    (or
      (< j@242@01 (* M@156@01 N@157@01))
      (not (< j@242@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 j@242@01) (not (<= 0 j@242@01))))
(push) ; 8
; [then-branch: 125 | 0 <= j@242@01 && j@242@01 < M@156@01 * N@157@01 && 0 <= k@243@01 && k@243@01 < M@156@01 * N@157@01 && j@242@01 != k@243@01 | live]
; [else-branch: 125 | !(0 <= j@242@01 && j@242@01 < M@156@01 * N@157@01 && 0 <= k@243@01 && k@243@01 < M@156@01 * N@157@01 && j@242@01 != k@243@01) | live]
(push) ; 9
; [then-branch: 125 | 0 <= j@242@01 && j@242@01 < M@156@01 * N@157@01 && 0 <= k@243@01 && k@243@01 < M@156@01 * N@157@01 && j@242@01 != k@243@01]
(assert (and
  (<= 0 j@242@01)
  (and
    (< j@242@01 (* M@156@01 N@157@01))
    (and
      (<= 0 k@243@01)
      (and (< k@243@01 (* M@156@01 N@157@01)) (not (= j@242@01 k@243@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 10
(assert (not (>= j@242@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< j@242@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 10
(assert (not (>= k@243@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< k@243@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 125 | !(0 <= j@242@01 && j@242@01 < M@156@01 * N@157@01 && 0 <= k@243@01 && k@243@01 < M@156@01 * N@157@01 && j@242@01 != k@243@01)]
(assert (not
  (and
    (<= 0 j@242@01)
    (and
      (< j@242@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@243@01)
        (and (< k@243@01 (* M@156@01 N@157@01)) (not (= j@242@01 k@243@01))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@242@01)
    (and
      (< j@242@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@243@01)
        (and (< k@243@01 (* M@156@01 N@157@01)) (not (= j@242@01 k@243@01))))))
  (and
    (<= 0 j@242@01)
    (< j@242@01 (* M@156@01 N@157@01))
    (<= 0 k@243@01)
    (< k@243@01 (* M@156@01 N@157@01))
    (not (= j@242@01 k@243@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@242@01)
      (and
        (< j@242@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@243@01)
          (and (< k@243@01 (* M@156@01 N@157@01)) (not (= j@242@01 k@243@01)))))))
  (and
    (<= 0 j@242@01)
    (and
      (< j@242@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@243@01)
        (and (< k@243@01 (* M@156@01 N@157@01)) (not (= j@242@01 k@243@01))))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 7
(assert (not (forall ((j@242@01 Int) (k@243@01 Int)) (!
  (=>
    (and
      (<= 0 j@242@01)
      (and
        (< j@242@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@243@01)
          (and (< k@243@01 (* M@156@01 N@157@01)) (not (= j@242@01 k@243@01))))))
    (not
      (= (Seq_index matrix@158@01 j@242@01) (Seq_index matrix@158@01 k@243@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@242@01 Int) (k@243@01 Int)) (!
  (=>
    (and
      (<= 0 j@242@01)
      (and
        (< j@242@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@243@01)
          (and (< k@243@01 (* M@156@01 N@157@01)) (not (= j@242@01 k@243@01))))))
    (not
      (= (Seq_index matrix@158@01 j@242@01) (Seq_index matrix@158@01 k@243@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|)))
(declare-const k@244@01 Int)
(push) ; 7
; [eval] 0 <= k && k < hi
; [eval] 0 <= k
(push) ; 8
; [then-branch: 126 | !(0 <= k@244@01) | live]
; [else-branch: 126 | 0 <= k@244@01 | live]
(push) ; 9
; [then-branch: 126 | !(0 <= k@244@01)]
(assert (not (<= 0 k@244@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 126 | 0 <= k@244@01]
(assert (<= 0 k@244@01))
; [eval] k < hi
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@244@01) (not (<= 0 k@244@01))))
(assert (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01))))
(declare-const $k@245@01 $Perm)
(assert ($Perm.isReadVar $k@245@01))
; [eval] ar[k]
(push) ; 8
(assert (not (>= k@244@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< k@244@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(declare-fun inv@246@01 ($Ref) Int)
(declare-fun img@247@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@245@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@244@01 Int)) (!
  (=>
    (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01)))
    (or (<= 0 k@244@01) (not (<= 0 k@244@01))))
  :pattern ((Seq_index matrix@158@01 k@244@01))
  :qid |Ref__Integer_value-aux|)))
(push) ; 7
(assert (not (forall ((k@244@01 Int)) (!
  (=>
    (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01)))
    (or (= $k@245@01 $Perm.No) (< $Perm.No $k@245@01)))
  
  :qid |quant-u-138|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((k1@244@01 Int) (k2@244@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 k1@244@01) (< k1@244@01 (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01))
      (and
        (and (<= 0 k2@244@01) (< k2@244@01 (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01))
      (= (Seq_index matrix@158@01 k1@244@01) (Seq_index matrix@158@01 k2@244@01)))
    (= k1@244@01 k2@244@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@244@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@245@01))
    (and
      (= (inv@246@01 (Seq_index matrix@158@01 k@244@01)) k@244@01)
      (img@247@01 (Seq_index matrix@158@01 k@244@01))))
  :pattern ((Seq_index matrix@158@01 k@244@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@247@01 r)
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)))
    (= (Seq_index matrix@158@01 (inv@246@01 r)) r))
  :pattern ((inv@246@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((k@244@01 Int)) (!
  (= (Seq_index matrix@158@01 k@244@01) (Seq_index hist@160@01 k@244@01))
  
  :qid |quant-u-139|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@248@01 ((r $Ref) (k@239@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
      (img@247@01 r)
      (= r (Seq_index matrix@158@01 (inv@246@01 r))))
    ($Perm.min
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
        $Perm.No)
      $k@245@01)
    $Perm.No))
(define-fun pTaken@249@01 ((r $Ref) (k@239@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
      (img@247@01 r)
      (= r (Seq_index matrix@158@01 (inv@246@01 r))))
    ($Perm.min
      (ite
        (and
          (img@235@01 r)
          (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- $k@245@01 (pTaken@248@01 r k@239@01)))
    $Perm.No))
(define-fun pTaken@250@01 ((r $Ref) (k@239@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
      (img@247@01 r)
      (= r (Seq_index matrix@158@01 (inv@246@01 r))))
    ($Perm.min
      (ite
        (and
          (img@238@01 r)
          (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)
      (- (- $k@245@01 (pTaken@248@01 r k@239@01)) (pTaken@249@01 r k@239@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@245@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@166@01 r)
            (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
          (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (<
        (ite
          (and
            (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
            (img@247@01 r)
            (= r (Seq_index matrix@158@01 (inv@246@01 r))))
          $k@245@01
          $Perm.No)
        (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      (<
        (ite
          (and
            (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
            (img@247@01 r)
            (= r (Seq_index matrix@158@01 (inv@246@01 r))))
          $k@245@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@166@01 r))
  :pattern ((inv@165@01 r))
  :pattern ((img@247@01 r))
  :pattern ((Seq_index matrix@158@01 (inv@246@01 r)))
  :qid |qp.srp44|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
      (img@247@01 r)
      (= r (Seq_index matrix@158@01 (inv@246@01 r))))
    (= (- $k@245@01 (pTaken@248@01 r k@239@01)) $Perm.No))
  
  :qid |quant-u-142|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@251@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r)))
    (=>
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef48|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef47|)))
(assert (count_array%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@251@01  $FVF<Ref__Integer_value>)))))) 0 (*
  M@156@01
  N@157@01) matrix@158@01 k@239@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@245@01))
(assert (forall ((k@244@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@245@01))
    (and
      (= (inv@246@01 (Seq_index matrix@158@01 k@244@01)) k@244@01)
      (img@247@01 (Seq_index matrix@158@01 k@244@01))))
  :pattern ((Seq_index matrix@158@01 k@244@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@247@01 r)
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)))
    (= (Seq_index matrix@158@01 (inv@246@01 r)) r))
  :pattern ((inv@246@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r)))
    (=>
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef47|)))
(assert (and
  (<= 0 (* M@156@01 N@157@01))
  (forall ((j@242@01 Int) (k@243@01 Int)) (!
    (=>
      (and
        (<= 0 j@242@01)
        (and
          (< j@242@01 (* M@156@01 N@157@01))
          (and
            (<= 0 k@243@01)
            (and (< k@243@01 (* M@156@01 N@157@01)) (not (= j@242@01 k@243@01))))))
      (not
        (= (Seq_index matrix@158@01 j@242@01) (Seq_index matrix@158@01 k@243@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
  (forall ((k@244@01 Int)) (!
    (=>
      (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01)))
      (or (<= 0 k@244@01) (not (<= 0 k@244@01))))
    :pattern ((Seq_index matrix@158@01 k@244@01))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@166@01 r)
              (and
                (<= 0 (inv@165@01 r))
                (< (inv@165@01 r) (* M@156@01 N@157@01))))
            (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (<
          (ite
            (and
              (and
                (<= 0 (inv@246@01 r))
                (< (inv@246@01 r) (* M@156@01 N@157@01)))
              (img@247@01 r)
              (= r (Seq_index matrix@158@01 (inv@246@01 r))))
            $k@245@01
            $Perm.No)
          (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        (<
          (ite
            (and
              (and
                (<= 0 (inv@246@01 r))
                (< (inv@246@01 r) (* M@156@01 N@157@01)))
              (img@247@01 r)
              (= r (Seq_index matrix@158@01 (inv@246@01 r))))
            $k@245@01
            $Perm.No)
          $Perm.No)))
    :pattern ((img@166@01 r))
    :pattern ((inv@165@01 r))
    :pattern ((img@247@01 r))
    :pattern ((Seq_index matrix@158@01 (inv@246@01 r)))
    :qid |qp.srp44|))
  (count_array%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@251@01  $FVF<Ref__Integer_value>)))))) 0 (*
    M@156@01
    N@157@01) matrix@158@01 k@239@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 120 | !(0 <= k@239@01 && k@239@01 < P@159@01)]
(assert (not (and (<= 0 k@239@01) (< k@239@01 P@159@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@235@01 r)
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@241@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@166@01 r)
            (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
          (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
          $Perm.No)
        (ite
          (and
            (img@235@01 r)
            (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
          (/ (to_real 1) (to_real 4))
          $Perm.No))
      (ite
        (and
          (img@238@01 r)
          (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@241@01  $FPM) r))
  :qid |qp.resPrmSumDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@210@01 r) (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
  :qid |qp.fvfValDef37|)))
(assert ($Perm.isReadVar $k@245@01))
(assert (forall ((k@244@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@245@01))
    (and
      (= (inv@246@01 (Seq_index matrix@158@01 k@244@01)) k@244@01)
      (img@247@01 (Seq_index matrix@158@01 k@244@01))))
  :pattern ((Seq_index matrix@158@01 k@244@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@247@01 r)
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)))
    (= (Seq_index matrix@158@01 (inv@246@01 r)) r))
  :pattern ((inv@246@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r)))
    (=>
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef47|)))
(assert (=>
  (and (<= 0 k@239@01) (< k@239@01 P@159@01))
  (and
    (<= 0 k@239@01)
    (< k@239@01 P@159@01)
    (<= 0 (* M@156@01 N@157@01))
    (forall ((j@242@01 Int) (k@243@01 Int)) (!
      (=>
        (and
          (<= 0 j@242@01)
          (and
            (< j@242@01 (* M@156@01 N@157@01))
            (and
              (<= 0 k@243@01)
              (and
                (< k@243@01 (* M@156@01 N@157@01))
                (not (= j@242@01 k@243@01))))))
        (not
          (=
            (Seq_index matrix@158@01 j@242@01)
            (Seq_index matrix@158@01 k@243@01))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
    (forall ((k@244@01 Int)) (!
      (=>
        (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01)))
        (or (<= 0 k@244@01) (not (<= 0 k@244@01))))
      :pattern ((Seq_index matrix@158@01 k@244@01))
      :qid |Ref__Integer_value-aux|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@166@01 r)
                (and
                  (<= 0 (inv@165@01 r))
                  (< (inv@165@01 r) (* M@156@01 N@157@01))))
              (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@166@01 r)
            (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@246@01 r))
                  (< (inv@246@01 r) (* M@156@01 N@157@01)))
                (img@247@01 r)
                (= r (Seq_index matrix@158@01 (inv@246@01 r))))
              $k@245@01
              $Perm.No)
            (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@246@01 r))
                  (< (inv@246@01 r) (* M@156@01 N@157@01)))
                (img@247@01 r)
                (= r (Seq_index matrix@158@01 (inv@246@01 r))))
              $k@245@01
              $Perm.No)
            $Perm.No)))
      :pattern ((img@166@01 r))
      :pattern ((inv@165@01 r))
      :pattern ((img@247@01 r))
      :pattern ((Seq_index matrix@158@01 (inv@246@01 r)))
      :qid |qp.srp44|))
    (count_array%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@251@01  $FVF<Ref__Integer_value>)))))) 0 (*
      M@156@01
      N@157@01) matrix@158@01 k@239@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@239@01) (< k@239@01 P@159@01)))
  (and (<= 0 k@239@01) (< k@239@01 P@159@01))))
; [eval] old(hist[k])
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@239@01 0)))
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
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@235@01 r)
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@241@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@166@01 r)
            (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
          (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
          $Perm.No)
        (ite
          (and
            (img@235@01 r)
            (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
          (/ (to_real 1) (to_real 4))
          $Perm.No))
      (ite
        (and
          (img@238@01 r)
          (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@241@01  $FPM) r))
  :qid |qp.resPrmSumDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@210@01 r) (and (<= 0 (inv@209@01 r)) (< (inv@209@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@207@01)) r))
  :qid |qp.fvfValDef37|)))
(assert ($Perm.isReadVar $k@245@01))
(assert (forall ((k@244@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@245@01))
    (and
      (= (inv@246@01 (Seq_index matrix@158@01 k@244@01)) k@244@01)
      (img@247@01 (Seq_index matrix@158@01 k@244@01))))
  :pattern ((Seq_index matrix@158@01 k@244@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@247@01 r)
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)))
    (= (Seq_index matrix@158@01 (inv@246@01 r)) r))
  :pattern ((inv@246@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r)))
    (=>
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@246@01 r)) (< (inv@246@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@245@01)
        (img@247@01 r))
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@251@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef47|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@239@01 Int)) (!
  (and
    (or (<= 0 k@239@01) (not (<= 0 k@239@01)))
    (=>
      (and (<= 0 k@239@01) (< k@239@01 P@159@01))
      (and
        (<= 0 k@239@01)
        (< k@239@01 P@159@01)
        (<= 0 (* M@156@01 N@157@01))
        (forall ((j@242@01 Int) (k@243@01 Int)) (!
          (=>
            (and
              (<= 0 j@242@01)
              (and
                (< j@242@01 (* M@156@01 N@157@01))
                (and
                  (<= 0 k@243@01)
                  (and
                    (< k@243@01 (* M@156@01 N@157@01))
                    (not (= j@242@01 k@243@01))))))
            (not
              (=
                (Seq_index matrix@158@01 j@242@01)
                (Seq_index matrix@158@01 k@243@01))))
          
          :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
        (forall ((k@244@01 Int)) (!
          (=>
            (and (<= 0 k@244@01) (< k@244@01 (* M@156@01 N@157@01)))
            (or (<= 0 k@244@01) (not (<= 0 k@244@01))))
          :pattern ((Seq_index matrix@158@01 k@244@01))
          :qid |Ref__Integer_value-aux|))
        (forall ((r $Ref)) (!
          (=>
            (not
              (=
                (ite
                  (and
                    (img@166@01 r)
                    (and
                      (<= 0 (inv@165@01 r))
                      (< (inv@165@01 r) (* M@156@01 N@157@01))))
                  (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
                  $Perm.No)
                $Perm.No))
            (ite
              (and
                (img@166@01 r)
                (and
                  (<= 0 (inv@165@01 r))
                  (< (inv@165@01 r) (* M@156@01 N@157@01))))
              (<
                (ite
                  (and
                    (and
                      (<= 0 (inv@246@01 r))
                      (< (inv@246@01 r) (* M@156@01 N@157@01)))
                    (img@247@01 r)
                    (= r (Seq_index matrix@158@01 (inv@246@01 r))))
                  $k@245@01
                  $Perm.No)
                (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
              (<
                (ite
                  (and
                    (and
                      (<= 0 (inv@246@01 r))
                      (< (inv@246@01 r) (* M@156@01 N@157@01)))
                    (img@247@01 r)
                    (= r (Seq_index matrix@158@01 (inv@246@01 r))))
                  $k@245@01
                  $Perm.No)
                $Perm.No)))
          :pattern ((img@166@01 r))
          :pattern ((inv@165@01 r))
          :pattern ((img@247@01 r))
          :pattern ((Seq_index matrix@158@01 (inv@246@01 r)))
          :qid |qp.srp44|))
        (count_array%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@251@01  $FVF<Ref__Integer_value>)))))) 0 (*
          M@156@01
          N@157@01) matrix@158@01 k@239@01)))
    (or
      (not (and (<= 0 k@239@01) (< k@239@01 P@159@01)))
      (and (<= 0 k@239@01) (< k@239@01 P@159@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@116@12@116@151-aux|)))
(assert (forall ((k@239@01 Int)) (!
  (=>
    (and (<= 0 k@239@01) (< k@239@01 P@159@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) (Seq_index
        hist@160@01
        k@239@01))
      (+
        ($FVF.lookup_Ref__Integer_value (as sm@212@01  $FVF<Ref__Integer_value>) (Seq_index
          hist@160@01
          k@239@01))
        (count_array ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@251@01  $FVF<Ref__Integer_value>)))))) 0 (*
          M@156@01
          N@157@01) matrix@158@01 k@239@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@116@12@116@151|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const j1@252@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j1 && j1 < M * N
; [eval] 0 <= j1
(push) ; 4
; [then-branch: 127 | !(0 <= j1@252@01) | live]
; [else-branch: 127 | 0 <= j1@252@01 | live]
(push) ; 5
; [then-branch: 127 | !(0 <= j1@252@01)]
(assert (not (<= 0 j1@252@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 127 | 0 <= j1@252@01]
(assert (<= 0 j1@252@01))
; [eval] j1 < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@252@01) (not (<= 0 j1@252@01))))
(assert (and (<= 0 j1@252@01) (< j1@252@01 (* M@156@01 N@157@01))))
; [eval] matrix[j1]
(push) ; 4
(assert (not (>= j1@252@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j1@252@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@253@01 ($Ref) Int)
(declare-fun img@254@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j1@252@01 Int)) (!
  (=>
    (and (<= 0 j1@252@01) (< j1@252@01 (* M@156@01 N@157@01)))
    (or (<= 0 j1@252@01) (not (<= 0 j1@252@01))))
  :pattern ((Seq_index matrix@158@01 j1@252@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j11@252@01 Int) (j12@252@01 Int)) (!
  (=>
    (and
      (and (<= 0 j11@252@01) (< j11@252@01 (* M@156@01 N@157@01)))
      (and (<= 0 j12@252@01) (< j12@252@01 (* M@156@01 N@157@01)))
      (=
        (Seq_index matrix@158@01 j11@252@01)
        (Seq_index matrix@158@01 j12@252@01)))
    (= j11@252@01 j12@252@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j1@252@01 Int)) (!
  (=>
    (and (<= 0 j1@252@01) (< j1@252@01 (* M@156@01 N@157@01)))
    (and
      (= (inv@253@01 (Seq_index matrix@158@01 j1@252@01)) j1@252@01)
      (img@254@01 (Seq_index matrix@158@01 j1@252@01))))
  :pattern ((Seq_index matrix@158@01 j1@252@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@254@01 r)
      (and (<= 0 (inv@253@01 r)) (< (inv@253@01 r) (* M@156@01 N@157@01))))
    (= (Seq_index matrix@158@01 (inv@253@01 r)) r))
  :pattern ((inv@253@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((j1@252@01 Int)) (!
  (= (Seq_index matrix@158@01 j1@252@01) (Seq_index hist@160@01 j1@252@01))
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@255@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@253@01 r)) (< (inv@253@01 r) (* M@156@01 N@157@01)))
      (img@254@01 r)
      (= r (Seq_index matrix@158@01 (inv@253@01 r))))
    ($Perm.min
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@256@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@253@01 r)) (< (inv@253@01 r) (* M@156@01 N@157@01)))
      (img@254@01 r)
      (= r (Seq_index matrix@158@01 (inv@253@01 r))))
    ($Perm.min
      (ite
        (and
          (img@235@01 r)
          (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@255@01 r)))
    $Perm.No))
(define-fun pTaken@257@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@253@01 r)) (< (inv@253@01 r) (* M@156@01 N@157@01)))
      (img@254@01 r)
      (= r (Seq_index matrix@158@01 (inv@253@01 r))))
    ($Perm.min
      (ite
        (and
          (img@238@01 r)
          (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@255@01 r)) (pTaken@256@01 r)))
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
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
        $Perm.No)
      (pTaken@255@01 r))
    $Perm.No)
  
  :qid |quant-u-146|))))
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
      (and (<= 0 (inv@253@01 r)) (< (inv@253@01 r) (* M@156@01 N@157@01)))
      (img@254@01 r)
      (= r (Seq_index matrix@158@01 (inv@253@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@255@01 r)) $Perm.No))
  
  :qid |quant-u-147|))))
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
        (and
          (img@235@01 r)
          (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (pTaken@256@01 r))
    $Perm.No)
  
  :qid |quant-u-148|))))
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
      (and (<= 0 (inv@253@01 r)) (< (inv@253@01 r) (* M@156@01 N@157@01)))
      (img@254@01 r)
      (= r (Seq_index matrix@158@01 (inv@253@01 r))))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@255@01 r)) (pTaken@256@01 r))
      $Perm.No))
  
  :qid |quant-u-149|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@258@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@235@01 r)
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef51|)))
(declare-const i1@259@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i1 && i1 < P
; [eval] 0 <= i1
(push) ; 4
; [then-branch: 128 | !(0 <= i1@259@01) | live]
; [else-branch: 128 | 0 <= i1@259@01 | live]
(push) ; 5
; [then-branch: 128 | !(0 <= i1@259@01)]
(assert (not (<= 0 i1@259@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 128 | 0 <= i1@259@01]
(assert (<= 0 i1@259@01))
; [eval] i1 < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i1@259@01) (not (<= 0 i1@259@01))))
(assert (and (<= 0 i1@259@01) (< i1@259@01 P@159@01)))
; [eval] hist[i1]
(push) ; 4
(assert (not (>= i1@259@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i1@259@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@260@01 ($Ref) Int)
(declare-fun img@261@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i1@259@01 Int)) (!
  (=>
    (and (<= 0 i1@259@01) (< i1@259@01 P@159@01))
    (or (<= 0 i1@259@01) (not (<= 0 i1@259@01))))
  :pattern ((Seq_index hist@160@01 i1@259@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i11@259@01 Int) (i12@259@01 Int)) (!
  (=>
    (and
      (and (<= 0 i11@259@01) (< i11@259@01 P@159@01))
      (and (<= 0 i12@259@01) (< i12@259@01 P@159@01))
      (= (Seq_index hist@160@01 i11@259@01) (Seq_index hist@160@01 i12@259@01)))
    (= i11@259@01 i12@259@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i1@259@01 Int)) (!
  (=>
    (and (<= 0 i1@259@01) (< i1@259@01 P@159@01))
    (and
      (= (inv@260@01 (Seq_index hist@160@01 i1@259@01)) i1@259@01)
      (img@261@01 (Seq_index hist@160@01 i1@259@01))))
  :pattern ((Seq_index hist@160@01 i1@259@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@261@01 r) (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) P@159@01)))
    (= (Seq_index hist@160@01 (inv@260@01 r)) r))
  :pattern ((inv@260@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@262@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) P@159@01))
      (img@261@01 r)
      (= r (Seq_index hist@160@01 (inv@260@01 r))))
    ($Perm.min
      (ite
        (and
          (img@238@01 r)
          (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
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
          (img@238@01 r)
          (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@262@01 r))
    $Perm.No)
  
  :qid |quant-u-152|))))
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
      (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) P@159@01))
      (img@261@01 r)
      (= r (Seq_index hist@160@01 (inv@260@01 r))))
    (= (- $Perm.Write (pTaken@262@01 r)) $Perm.No))
  
  :qid |quant-u-153|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@263@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@263@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@263@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef52|)))
; [eval] (forall k: Int :: { hist[k] } 0 <= k && k < P ==> hist[k].Ref__Integer_value == count_array(0, M * N, matrix, k))
(declare-const k@264@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < P ==> hist[k].Ref__Integer_value == count_array(0, M * N, matrix, k)
; [eval] 0 <= k && k < P
; [eval] 0 <= k
(push) ; 4
; [then-branch: 129 | !(0 <= k@264@01) | live]
; [else-branch: 129 | 0 <= k@264@01 | live]
(push) ; 5
; [then-branch: 129 | !(0 <= k@264@01)]
(assert (not (<= 0 k@264@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 129 | 0 <= k@264@01]
(assert (<= 0 k@264@01))
; [eval] k < P
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@264@01) (not (<= 0 k@264@01))))
(push) ; 4
; [then-branch: 130 | 0 <= k@264@01 && k@264@01 < P@159@01 | live]
; [else-branch: 130 | !(0 <= k@264@01 && k@264@01 < P@159@01) | live]
(push) ; 5
; [then-branch: 130 | 0 <= k@264@01 && k@264@01 < P@159@01]
(assert (and (<= 0 k@264@01) (< k@264@01 P@159@01)))
; [eval] hist[k].Ref__Integer_value == count_array(0, M * N, matrix, k)
; [eval] hist[k]
(push) ; 6
(assert (not (>= k@264@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@264@01 (Seq_length hist@160@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
    :qid |qp.fvfValDef49|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
    :qid |qp.fvfValDef50|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
    :qid |qp.fvfValDef51|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@166@01 (Seq_index hist@160@01 k@264@01))
          (and
            (<= 0 (inv@165@01 (Seq_index hist@160@01 k@264@01)))
            (<
              (inv@165@01 (Seq_index hist@160@01 k@264@01))
              (* M@156@01 N@157@01))))
        (-
          (/ (to_real 1) (to_real 2))
          (pTaken@226@01 (Seq_index hist@160@01 k@264@01)))
        $Perm.No)
      (ite
        (and
          (img@235@01 (Seq_index hist@160@01 k@264@01))
          (and
            (<= 0 (inv@234@01 (Seq_index hist@160@01 k@264@01)))
            (<
              (inv@234@01 (Seq_index hist@160@01 k@264@01))
              (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No))
    (ite
      (and
        (img@238@01 (Seq_index hist@160@01 k@264@01))
        (and
          (<= 0 (inv@237@01 (Seq_index hist@160@01 k@264@01)))
          (< (inv@237@01 (Seq_index hist@160@01 k@264@01)) P@159@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] count_array(0, M * N, matrix, k)
; [eval] M * N
(push) ; 6
; [eval] 0 <= i
; [eval] i <= hi
(push) ; 7
(assert (not (<= 0 (* M@156@01 N@157@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (* M@156@01 N@157@01)))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall j: Int, k: Int ::0 <= j && (j < hi && (0 <= k && (k < hi && j != k))) ==> ar[j] != ar[k])
(declare-const j@265@01 Int)
(declare-const k@266@01 Int)
(push) ; 7
; [eval] 0 <= j && (j < hi && (0 <= k && (k < hi && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < hi && (0 <= k && (k < hi && j != k)))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 131 | !(0 <= j@265@01) | live]
; [else-branch: 131 | 0 <= j@265@01 | live]
(push) ; 9
; [then-branch: 131 | !(0 <= j@265@01)]
(assert (not (<= 0 j@265@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 131 | 0 <= j@265@01]
(assert (<= 0 j@265@01))
; [eval] j < hi
(push) ; 10
; [then-branch: 132 | !(j@265@01 < M@156@01 * N@157@01) | live]
; [else-branch: 132 | j@265@01 < M@156@01 * N@157@01 | live]
(push) ; 11
; [then-branch: 132 | !(j@265@01 < M@156@01 * N@157@01)]
(assert (not (< j@265@01 (* M@156@01 N@157@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 132 | j@265@01 < M@156@01 * N@157@01]
(assert (< j@265@01 (* M@156@01 N@157@01)))
; [eval] 0 <= k
(push) ; 12
; [then-branch: 133 | !(0 <= k@266@01) | live]
; [else-branch: 133 | 0 <= k@266@01 | live]
(push) ; 13
; [then-branch: 133 | !(0 <= k@266@01)]
(assert (not (<= 0 k@266@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 133 | 0 <= k@266@01]
(assert (<= 0 k@266@01))
; [eval] k < hi
(push) ; 14
; [then-branch: 134 | !(k@266@01 < M@156@01 * N@157@01) | live]
; [else-branch: 134 | k@266@01 < M@156@01 * N@157@01 | live]
(push) ; 15
; [then-branch: 134 | !(k@266@01 < M@156@01 * N@157@01)]
(assert (not (< k@266@01 (* M@156@01 N@157@01))))
(pop) ; 15
(push) ; 15
; [else-branch: 134 | k@266@01 < M@156@01 * N@157@01]
(assert (< k@266@01 (* M@156@01 N@157@01)))
; [eval] j != k
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (< k@266@01 (* M@156@01 N@157@01)) (not (< k@266@01 (* M@156@01 N@157@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@266@01)
  (and
    (<= 0 k@266@01)
    (or
      (< k@266@01 (* M@156@01 N@157@01))
      (not (< k@266@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 k@266@01) (not (<= 0 k@266@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@265@01 (* M@156@01 N@157@01))
  (and
    (< j@265@01 (* M@156@01 N@157@01))
    (=>
      (<= 0 k@266@01)
      (and
        (<= 0 k@266@01)
        (or
          (< k@266@01 (* M@156@01 N@157@01))
          (not (< k@266@01 (* M@156@01 N@157@01))))))
    (or (<= 0 k@266@01) (not (<= 0 k@266@01))))))
(assert (or (< j@265@01 (* M@156@01 N@157@01)) (not (< j@265@01 (* M@156@01 N@157@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@265@01)
  (and
    (<= 0 j@265@01)
    (=>
      (< j@265@01 (* M@156@01 N@157@01))
      (and
        (< j@265@01 (* M@156@01 N@157@01))
        (=>
          (<= 0 k@266@01)
          (and
            (<= 0 k@266@01)
            (or
              (< k@266@01 (* M@156@01 N@157@01))
              (not (< k@266@01 (* M@156@01 N@157@01))))))
        (or (<= 0 k@266@01) (not (<= 0 k@266@01)))))
    (or
      (< j@265@01 (* M@156@01 N@157@01))
      (not (< j@265@01 (* M@156@01 N@157@01)))))))
(assert (or (<= 0 j@265@01) (not (<= 0 j@265@01))))
(push) ; 8
; [then-branch: 135 | 0 <= j@265@01 && j@265@01 < M@156@01 * N@157@01 && 0 <= k@266@01 && k@266@01 < M@156@01 * N@157@01 && j@265@01 != k@266@01 | live]
; [else-branch: 135 | !(0 <= j@265@01 && j@265@01 < M@156@01 * N@157@01 && 0 <= k@266@01 && k@266@01 < M@156@01 * N@157@01 && j@265@01 != k@266@01) | live]
(push) ; 9
; [then-branch: 135 | 0 <= j@265@01 && j@265@01 < M@156@01 * N@157@01 && 0 <= k@266@01 && k@266@01 < M@156@01 * N@157@01 && j@265@01 != k@266@01]
(assert (and
  (<= 0 j@265@01)
  (and
    (< j@265@01 (* M@156@01 N@157@01))
    (and
      (<= 0 k@266@01)
      (and (< k@266@01 (* M@156@01 N@157@01)) (not (= j@265@01 k@266@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 10
(assert (not (>= j@265@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< j@265@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 10
(assert (not (>= k@266@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< k@266@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 135 | !(0 <= j@265@01 && j@265@01 < M@156@01 * N@157@01 && 0 <= k@266@01 && k@266@01 < M@156@01 * N@157@01 && j@265@01 != k@266@01)]
(assert (not
  (and
    (<= 0 j@265@01)
    (and
      (< j@265@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@266@01)
        (and (< k@266@01 (* M@156@01 N@157@01)) (not (= j@265@01 k@266@01))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@265@01)
    (and
      (< j@265@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@266@01)
        (and (< k@266@01 (* M@156@01 N@157@01)) (not (= j@265@01 k@266@01))))))
  (and
    (<= 0 j@265@01)
    (< j@265@01 (* M@156@01 N@157@01))
    (<= 0 k@266@01)
    (< k@266@01 (* M@156@01 N@157@01))
    (not (= j@265@01 k@266@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@265@01)
      (and
        (< j@265@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@266@01)
          (and (< k@266@01 (* M@156@01 N@157@01)) (not (= j@265@01 k@266@01)))))))
  (and
    (<= 0 j@265@01)
    (and
      (< j@265@01 (* M@156@01 N@157@01))
      (and
        (<= 0 k@266@01)
        (and (< k@266@01 (* M@156@01 N@157@01)) (not (= j@265@01 k@266@01))))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 7
(assert (not (forall ((j@265@01 Int) (k@266@01 Int)) (!
  (=>
    (and
      (<= 0 j@265@01)
      (and
        (< j@265@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@266@01)
          (and (< k@266@01 (* M@156@01 N@157@01)) (not (= j@265@01 k@266@01))))))
    (not
      (= (Seq_index matrix@158@01 j@265@01) (Seq_index matrix@158@01 k@266@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@265@01 Int) (k@266@01 Int)) (!
  (=>
    (and
      (<= 0 j@265@01)
      (and
        (< j@265@01 (* M@156@01 N@157@01))
        (and
          (<= 0 k@266@01)
          (and (< k@266@01 (* M@156@01 N@157@01)) (not (= j@265@01 k@266@01))))))
    (not
      (= (Seq_index matrix@158@01 j@265@01) (Seq_index matrix@158@01 k@266@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|)))
(declare-const k@267@01 Int)
(push) ; 7
; [eval] 0 <= k && k < hi
; [eval] 0 <= k
(push) ; 8
; [then-branch: 136 | !(0 <= k@267@01) | live]
; [else-branch: 136 | 0 <= k@267@01 | live]
(push) ; 9
; [then-branch: 136 | !(0 <= k@267@01)]
(assert (not (<= 0 k@267@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 136 | 0 <= k@267@01]
(assert (<= 0 k@267@01))
; [eval] k < hi
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@267@01) (not (<= 0 k@267@01))))
(assert (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01))))
(declare-const $k@268@01 $Perm)
(assert ($Perm.isReadVar $k@268@01))
; [eval] ar[k]
(push) ; 8
(assert (not (>= k@267@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< k@267@01 (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(declare-fun inv@269@01 ($Ref) Int)
(declare-fun img@270@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@268@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@267@01 Int)) (!
  (=>
    (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01)))
    (or (<= 0 k@267@01) (not (<= 0 k@267@01))))
  :pattern ((Seq_index matrix@158@01 k@267@01))
  :qid |Ref__Integer_value-aux|)))
(push) ; 7
(assert (not (forall ((k@267@01 Int)) (!
  (=>
    (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01)))
    (or (= $k@268@01 $Perm.No) (< $Perm.No $k@268@01)))
  
  :qid |quant-u-154|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((k1@267@01 Int) (k2@267@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 k1@267@01) (< k1@267@01 (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01))
      (and
        (and (<= 0 k2@267@01) (< k2@267@01 (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01))
      (= (Seq_index matrix@158@01 k1@267@01) (Seq_index matrix@158@01 k2@267@01)))
    (= k1@267@01 k2@267@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@267@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@268@01))
    (and
      (= (inv@269@01 (Seq_index matrix@158@01 k@267@01)) k@267@01)
      (img@270@01 (Seq_index matrix@158@01 k@267@01))))
  :pattern ((Seq_index matrix@158@01 k@267@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@270@01 r)
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)))
    (= (Seq_index matrix@158@01 (inv@269@01 r)) r))
  :pattern ((inv@269@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((k@267@01 Int)) (!
  (= (Seq_index matrix@158@01 k@267@01) (Seq_index hist@160@01 k@267@01))
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@271@01 ((r $Ref) (k@264@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
      (img@270@01 r)
      (= r (Seq_index matrix@158@01 (inv@269@01 r))))
    ($Perm.min
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
        $Perm.No)
      $k@268@01)
    $Perm.No))
(define-fun pTaken@272@01 ((r $Ref) (k@264@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
      (img@270@01 r)
      (= r (Seq_index matrix@158@01 (inv@269@01 r))))
    ($Perm.min
      (ite
        (and
          (img@235@01 r)
          (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- $k@268@01 (pTaken@271@01 r k@264@01)))
    $Perm.No))
(define-fun pTaken@273@01 ((r $Ref) (k@264@01 Int)) $Perm
  (ite
    (and
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
      (img@270@01 r)
      (= r (Seq_index matrix@158@01 (inv@269@01 r))))
    ($Perm.min
      (ite
        (and
          (img@238@01 r)
          (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)
      (- (- $k@268@01 (pTaken@271@01 r k@264@01)) (pTaken@272@01 r k@264@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@268@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@166@01 r)
            (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
          (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (<
        (ite
          (and
            (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
            (img@270@01 r)
            (= r (Seq_index matrix@158@01 (inv@269@01 r))))
          $k@268@01
          $Perm.No)
        (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      (<
        (ite
          (and
            (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
            (img@270@01 r)
            (= r (Seq_index matrix@158@01 (inv@269@01 r))))
          $k@268@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@166@01 r))
  :pattern ((inv@165@01 r))
  :pattern ((img@270@01 r))
  :pattern ((Seq_index matrix@158@01 (inv@269@01 r)))
  :qid |qp.srp53|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
      (img@270@01 r)
      (= r (Seq_index matrix@158@01 (inv@269@01 r))))
    (= (- $k@268@01 (pTaken@271@01 r k@264@01)) $Perm.No))
  
  :qid |quant-u-158|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@274@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r)))
    (=>
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef57|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef56|)))
(assert (count_array%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@274@01  $FVF<Ref__Integer_value>)))))) 0 (*
  M@156@01
  N@157@01) matrix@158@01 k@264@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@268@01))
(assert (forall ((k@267@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@268@01))
    (and
      (= (inv@269@01 (Seq_index matrix@158@01 k@267@01)) k@267@01)
      (img@270@01 (Seq_index matrix@158@01 k@267@01))))
  :pattern ((Seq_index matrix@158@01 k@267@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@270@01 r)
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)))
    (= (Seq_index matrix@158@01 (inv@269@01 r)) r))
  :pattern ((inv@269@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r)))
    (=>
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef56|)))
(assert (and
  (<= 0 (* M@156@01 N@157@01))
  (forall ((j@265@01 Int) (k@266@01 Int)) (!
    (=>
      (and
        (<= 0 j@265@01)
        (and
          (< j@265@01 (* M@156@01 N@157@01))
          (and
            (<= 0 k@266@01)
            (and (< k@266@01 (* M@156@01 N@157@01)) (not (= j@265@01 k@266@01))))))
      (not
        (= (Seq_index matrix@158@01 j@265@01) (Seq_index matrix@158@01 k@266@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
  (forall ((k@267@01 Int)) (!
    (=>
      (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01)))
      (or (<= 0 k@267@01) (not (<= 0 k@267@01))))
    :pattern ((Seq_index matrix@158@01 k@267@01))
    :qid |Ref__Integer_value-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@166@01 r)
              (and
                (<= 0 (inv@165@01 r))
                (< (inv@165@01 r) (* M@156@01 N@157@01))))
            (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (<
          (ite
            (and
              (and
                (<= 0 (inv@269@01 r))
                (< (inv@269@01 r) (* M@156@01 N@157@01)))
              (img@270@01 r)
              (= r (Seq_index matrix@158@01 (inv@269@01 r))))
            $k@268@01
            $Perm.No)
          (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        (<
          (ite
            (and
              (and
                (<= 0 (inv@269@01 r))
                (< (inv@269@01 r) (* M@156@01 N@157@01)))
              (img@270@01 r)
              (= r (Seq_index matrix@158@01 (inv@269@01 r))))
            $k@268@01
            $Perm.No)
          $Perm.No)))
    :pattern ((img@166@01 r))
    :pattern ((inv@165@01 r))
    :pattern ((img@270@01 r))
    :pattern ((Seq_index matrix@158@01 (inv@269@01 r)))
    :qid |qp.srp53|))
  (count_array%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@274@01  $FVF<Ref__Integer_value>)))))) 0 (*
    M@156@01
    N@157@01) matrix@158@01 k@264@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 130 | !(0 <= k@264@01 && k@264@01 < P@159@01)]
(assert (not (and (<= 0 k@264@01) (< k@264@01 P@159@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@235@01 r)
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef51|)))
(assert ($Perm.isReadVar $k@268@01))
(assert (forall ((k@267@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@268@01))
    (and
      (= (inv@269@01 (Seq_index matrix@158@01 k@267@01)) k@267@01)
      (img@270@01 (Seq_index matrix@158@01 k@267@01))))
  :pattern ((Seq_index matrix@158@01 k@267@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@270@01 r)
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)))
    (= (Seq_index matrix@158@01 (inv@269@01 r)) r))
  :pattern ((inv@269@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r)))
    (=>
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef56|)))
(assert (=>
  (and (<= 0 k@264@01) (< k@264@01 P@159@01))
  (and
    (<= 0 k@264@01)
    (< k@264@01 P@159@01)
    (<= 0 (* M@156@01 N@157@01))
    (forall ((j@265@01 Int) (k@266@01 Int)) (!
      (=>
        (and
          (<= 0 j@265@01)
          (and
            (< j@265@01 (* M@156@01 N@157@01))
            (and
              (<= 0 k@266@01)
              (and
                (< k@266@01 (* M@156@01 N@157@01))
                (not (= j@265@01 k@266@01))))))
        (not
          (=
            (Seq_index matrix@158@01 j@265@01)
            (Seq_index matrix@158@01 k@266@01))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
    (forall ((k@267@01 Int)) (!
      (=>
        (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01)))
        (or (<= 0 k@267@01) (not (<= 0 k@267@01))))
      :pattern ((Seq_index matrix@158@01 k@267@01))
      :qid |Ref__Integer_value-aux|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@166@01 r)
                (and
                  (<= 0 (inv@165@01 r))
                  (< (inv@165@01 r) (* M@156@01 N@157@01))))
              (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@166@01 r)
            (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@269@01 r))
                  (< (inv@269@01 r) (* M@156@01 N@157@01)))
                (img@270@01 r)
                (= r (Seq_index matrix@158@01 (inv@269@01 r))))
              $k@268@01
              $Perm.No)
            (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@269@01 r))
                  (< (inv@269@01 r) (* M@156@01 N@157@01)))
                (img@270@01 r)
                (= r (Seq_index matrix@158@01 (inv@269@01 r))))
              $k@268@01
              $Perm.No)
            $Perm.No)))
      :pattern ((img@166@01 r))
      :pattern ((inv@165@01 r))
      :pattern ((img@270@01 r))
      :pattern ((Seq_index matrix@158@01 (inv@269@01 r)))
      :qid |qp.srp53|))
    (count_array%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@274@01  $FVF<Ref__Integer_value>)))))) 0 (*
      M@156@01
      N@157@01) matrix@158@01 k@264@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@264@01) (< k@264@01 P@159@01)))
  (and (<= 0 k@264@01) (< k@264@01 P@159@01))))
; [eval] hist[k]
(push) ; 4
(assert (not (>= k@264@01 0)))
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
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@235@01 r)
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef51|)))
(assert ($Perm.isReadVar $k@268@01))
(assert (forall ((k@267@01 Int)) (!
  (=>
    (and
      (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01)))
      (< $Perm.No $k@268@01))
    (and
      (= (inv@269@01 (Seq_index matrix@158@01 k@267@01)) k@267@01)
      (img@270@01 (Seq_index matrix@158@01 k@267@01))))
  :pattern ((Seq_index matrix@158@01 k@267@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@270@01 r)
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)))
    (= (Seq_index matrix@158@01 (inv@269@01 r)) r))
  :pattern ((inv@269@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>)))
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r)))
    (=>
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>))))
  :qid |qp.fvfDomDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) (* M@156@01 N@157@01)))
        (< $Perm.No $k@268@01)
        (img@270@01 r))
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@274@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef56|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@264@01 Int)) (!
  (and
    (or (<= 0 k@264@01) (not (<= 0 k@264@01)))
    (=>
      (and (<= 0 k@264@01) (< k@264@01 P@159@01))
      (and
        (<= 0 k@264@01)
        (< k@264@01 P@159@01)
        (<= 0 (* M@156@01 N@157@01))
        (forall ((j@265@01 Int) (k@266@01 Int)) (!
          (=>
            (and
              (<= 0 j@265@01)
              (and
                (< j@265@01 (* M@156@01 N@157@01))
                (and
                  (<= 0 k@266@01)
                  (and
                    (< k@266@01 (* M@156@01 N@157@01))
                    (not (= j@265@01 k@266@01))))))
            (not
              (=
                (Seq_index matrix@158@01 j@265@01)
                (Seq_index matrix@158@01 k@266@01))))
          
          :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@66@12@66@102|))
        (forall ((k@267@01 Int)) (!
          (=>
            (and (<= 0 k@267@01) (< k@267@01 (* M@156@01 N@157@01)))
            (or (<= 0 k@267@01) (not (<= 0 k@267@01))))
          :pattern ((Seq_index matrix@158@01 k@267@01))
          :qid |Ref__Integer_value-aux|))
        (forall ((r $Ref)) (!
          (=>
            (not
              (=
                (ite
                  (and
                    (img@166@01 r)
                    (and
                      (<= 0 (inv@165@01 r))
                      (< (inv@165@01 r) (* M@156@01 N@157@01))))
                  (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r))
                  $Perm.No)
                $Perm.No))
            (ite
              (and
                (img@166@01 r)
                (and
                  (<= 0 (inv@165@01 r))
                  (< (inv@165@01 r) (* M@156@01 N@157@01))))
              (<
                (ite
                  (and
                    (and
                      (<= 0 (inv@269@01 r))
                      (< (inv@269@01 r) (* M@156@01 N@157@01)))
                    (img@270@01 r)
                    (= r (Seq_index matrix@158@01 (inv@269@01 r))))
                  $k@268@01
                  $Perm.No)
                (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
              (<
                (ite
                  (and
                    (and
                      (<= 0 (inv@269@01 r))
                      (< (inv@269@01 r) (* M@156@01 N@157@01)))
                    (img@270@01 r)
                    (= r (Seq_index matrix@158@01 (inv@269@01 r))))
                  $k@268@01
                  $Perm.No)
                $Perm.No)))
          :pattern ((img@166@01 r))
          :pattern ((inv@165@01 r))
          :pattern ((img@270@01 r))
          :pattern ((Seq_index matrix@158@01 (inv@269@01 r)))
          :qid |qp.srp53|))
        (count_array%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@274@01  $FVF<Ref__Integer_value>)))))) 0 (*
          M@156@01
          N@157@01) matrix@158@01 k@264@01)))
    (or
      (not (and (<= 0 k@264@01) (< k@264@01 P@159@01)))
      (and (<= 0 k@264@01) (< k@264@01 P@159@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@170@12@170@117-aux|)))
(assert (forall ((k@264@01 Int)) (!
  (=>
    (and (<= 0 k@264@01) (< k@264@01 P@159@01))
    (count_array%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@274@01  $FVF<Ref__Integer_value>)))))) 0 (*
      M@156@01
      N@157@01) matrix@158@01 k@264@01))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@170@12@170@117_precondition|)))
(push) ; 3
(assert (not (forall ((k@264@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 k@264@01) (< k@264@01 P@159@01))
        (count_array%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@274@01  $FVF<Ref__Integer_value>)))))) 0 (*
          M@156@01
          N@157@01) matrix@158@01 k@264@01))
      (and (<= 0 k@264@01) (< k@264@01 P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) (Seq_index
        hist@160@01
        k@264@01))
      (count_array ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@274@01  $FVF<Ref__Integer_value>)))))) 0 (*
        M@156@01
        N@157@01) matrix@158@01 k@264@01)))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@170@12@170@117|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@264@01 Int)) (!
  (=>
    (and (<= 0 k@264@01) (< k@264@01 P@159@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) (Seq_index
        hist@160@01
        k@264@01))
      (count_array ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (as sm@274@01  $FVF<Ref__Integer_value>)))))) 0 (*
        M@156@01
        N@157@01) matrix@158@01 k@264@01)))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@170@12@170@117|)))
; [eval] (forall i1: Int, j1: Int :: { old(Ref__multidim_index_2(M, N, i1, j1)) } { old(matrix[Ref__multidim_index_2(M, N, i1, j1)]) } 0 <= i1 && (i1 < M && (0 <= j1 && j1 < N)) ==> matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value == old(matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value))
(declare-const i1@275@01 Int)
(declare-const j1@276@01 Int)
(push) ; 3
; [eval] 0 <= i1 && (i1 < M && (0 <= j1 && j1 < N)) ==> matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value == old(matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value)
; [eval] 0 <= i1 && (i1 < M && (0 <= j1 && j1 < N))
; [eval] 0 <= i1
(push) ; 4
; [then-branch: 137 | !(0 <= i1@275@01) | live]
; [else-branch: 137 | 0 <= i1@275@01 | live]
(push) ; 5
; [then-branch: 137 | !(0 <= i1@275@01)]
(assert (not (<= 0 i1@275@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 137 | 0 <= i1@275@01]
(assert (<= 0 i1@275@01))
; [eval] i1 < M
(push) ; 6
; [then-branch: 138 | !(i1@275@01 < M@156@01) | live]
; [else-branch: 138 | i1@275@01 < M@156@01 | live]
(push) ; 7
; [then-branch: 138 | !(i1@275@01 < M@156@01)]
(assert (not (< i1@275@01 M@156@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 138 | i1@275@01 < M@156@01]
(assert (< i1@275@01 M@156@01))
; [eval] 0 <= j1
(push) ; 8
; [then-branch: 139 | !(0 <= j1@276@01) | live]
; [else-branch: 139 | 0 <= j1@276@01 | live]
(push) ; 9
; [then-branch: 139 | !(0 <= j1@276@01)]
(assert (not (<= 0 j1@276@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 139 | 0 <= j1@276@01]
(assert (<= 0 j1@276@01))
; [eval] j1 < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@276@01) (not (<= 0 j1@276@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i1@275@01 M@156@01)
  (and (< i1@275@01 M@156@01) (or (<= 0 j1@276@01) (not (<= 0 j1@276@01))))))
(assert (or (< i1@275@01 M@156@01) (not (< i1@275@01 M@156@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i1@275@01)
  (and
    (<= 0 i1@275@01)
    (=>
      (< i1@275@01 M@156@01)
      (and (< i1@275@01 M@156@01) (or (<= 0 j1@276@01) (not (<= 0 j1@276@01)))))
    (or (< i1@275@01 M@156@01) (not (< i1@275@01 M@156@01))))))
(assert (or (<= 0 i1@275@01) (not (<= 0 i1@275@01))))
(push) ; 4
; [then-branch: 140 | 0 <= i1@275@01 && i1@275@01 < M@156@01 && 0 <= j1@276@01 && j1@276@01 < N@157@01 | live]
; [else-branch: 140 | !(0 <= i1@275@01 && i1@275@01 < M@156@01 && 0 <= j1@276@01 && j1@276@01 < N@157@01) | live]
(push) ; 5
; [then-branch: 140 | 0 <= i1@275@01 && i1@275@01 < M@156@01 && 0 <= j1@276@01 && j1@276@01 < N@157@01]
(assert (and
  (<= 0 i1@275@01)
  (and (< i1@275@01 M@156@01) (and (<= 0 j1@276@01) (< j1@276@01 N@157@01)))))
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value == old(matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value)
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)]
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 M@156@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@156@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 N@157@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@157@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 M@156@01)
  (<= 0 N@157@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)
  0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)
  (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
    :qid |qp.fvfValDef49|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@235@01 r)
        (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
    :qid |qp.fvfValDef50|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@238@01 r)
        (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
    :qid |qp.fvfValDef51|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@166@01 (Seq_index
            matrix@158@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
          (and
            (<=
              0
              (inv@165@01 (Seq_index
                matrix@158@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))))
            (<
              (inv@165@01 (Seq_index
                matrix@158@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
              (* M@156@01 N@157@01))))
        (-
          (/ (to_real 1) (to_real 2))
          (pTaken@226@01 (Seq_index
            matrix@158@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))))
        $Perm.No)
      (ite
        (and
          (img@235@01 (Seq_index
            matrix@158@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
          (and
            (<=
              0
              (inv@234@01 (Seq_index
                matrix@158@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))))
            (<
              (inv@234@01 (Seq_index
                matrix@158@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
              (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No))
    (ite
      (and
        (img@238@01 (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
        (and
          (<=
            0
            (inv@237@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))))
          (<
            (inv@237@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
            P@159@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(matrix[Ref__multidim_index_2(M, N, i1, j1)].Ref__Integer_value)
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)]
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)
  0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)
  (Seq_length matrix@158@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
    :qid |qp.fvfValDef34|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r))
    :qid |qp.fvfValDef35|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@166@01 (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
        (and
          (<=
            0
            (inv@165@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))))
          (<
            (inv@165@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
            (* M@156@01 N@157@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@173@01 (Seq_index
          matrix@158@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
        (and
          (<=
            0
            (inv@172@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))))
          (<
            (inv@172@01 (Seq_index
              matrix@158@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
            P@159@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 140 | !(0 <= i1@275@01 && i1@275@01 < M@156@01 && 0 <= j1@276@01 && j1@276@01 < N@157@01)]
(assert (not
  (and
    (<= 0 i1@275@01)
    (and (< i1@275@01 M@156@01) (and (<= 0 j1@276@01) (< j1@276@01 N@157@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@235@01 r)
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@173@01 r) (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r))
  :qid |qp.fvfValDef35|)))
(assert (=>
  (and
    (<= 0 i1@275@01)
    (and (< i1@275@01 M@156@01) (and (<= 0 j1@276@01) (< j1@276@01 N@157@01))))
  (and
    (<= 0 i1@275@01)
    (< i1@275@01 M@156@01)
    (<= 0 j1@276@01)
    (< j1@276@01 N@157@01)
    (<= 0 M@156@01)
    (<= 0 N@157@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i1@275@01)
      (and (< i1@275@01 M@156@01) (and (<= 0 j1@276@01) (< j1@276@01 N@157@01)))))
  (and
    (<= 0 i1@275@01)
    (and (< i1@275@01 M@156@01) (and (<= 0 j1@276@01) (< j1@276@01 N@157@01))))))
; [eval] old(Ref__multidim_index_2(M, N, i1, j1))
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 4
; [eval] 0 <= i0
(push) ; 5
(assert (not (<= 0 i1@275@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-159|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@277@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@277@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@173@01 r)
          (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@277@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@277@01  $FPM) r) $Perm.Write)
  :pattern ((inv@165@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@277@01  $FPM) r) $Perm.Write)
  :pattern ((inv@172@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@275@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-160|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@278@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@278@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@173@01 r)
          (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@278@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@278@01  $FPM) r) $Perm.Write)
  :pattern ((inv@165@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@278@01  $FPM) r) $Perm.Write)
  :pattern ((inv@172@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@275@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-161|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
; Assume upper permission bound for field Ref__Integer_value
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@275@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; [eval] old(matrix[Ref__multidim_index_2(M, N, i1, j1)])
; [eval] matrix[Ref__multidim_index_2(M, N, i1, j1)]
; [eval] Ref__multidim_index_2(M, N, i1, j1)
(push) ; 4
; [eval] 0 <= i0
(push) ; 5
(assert (not (<= 0 i1@275@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-162|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@279@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@279@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@173@01 r)
          (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@279@01  $FPM) r))
  :qid |qp.resPrmSumDef60|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@279@01  $FPM) r) $Perm.Write)
  :pattern ((inv@165@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@279@01  $FPM) r) $Perm.Write)
  :pattern ((inv@172@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@275@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-163|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@280@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@280@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@173@01 r)
          (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@280@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@280@01  $FPM) r) $Perm.Write)
  :pattern ((inv@165@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@280@01  $FPM) r) $Perm.Write)
  :pattern ((inv@172@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@275@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index matrix@158@01 j1@164@01) (Seq_index hist@160@01 i1@171@01))
    (=
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (and
        (img@173@01 r)
        (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))))
  
  :qid |quant-u-164|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
; Assume upper permission bound for field Ref__Integer_value
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i1@275@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@166@01 r)
        (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@235@01 r)
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@232@01))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@238@01 r) (and (<= 0 (inv@237@01 r)) (< (inv@237@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@232@01)))))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 0 (inv@165@01 r)) (< (inv@165@01 r) (* M@156@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@173@01 r) (and (<= 0 (inv@172@01 r)) (< (inv@172@01 r) P@159@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))) r))
  :qid |qp.fvfValDef35|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@275@01 Int) (j1@276@01 Int)) (!
  (and
    (=>
      (<= 0 i1@275@01)
      (and
        (<= 0 i1@275@01)
        (=>
          (< i1@275@01 M@156@01)
          (and
            (< i1@275@01 M@156@01)
            (or (<= 0 j1@276@01) (not (<= 0 j1@276@01)))))
        (or (< i1@275@01 M@156@01) (not (< i1@275@01 M@156@01)))))
    (or (<= 0 i1@275@01) (not (<= 0 i1@275@01)))
    (=>
      (and
        (<= 0 i1@275@01)
        (and
          (< i1@275@01 M@156@01)
          (and (<= 0 j1@276@01) (< j1@276@01 N@157@01))))
      (and
        (<= 0 i1@275@01)
        (< i1@275@01 M@156@01)
        (<= 0 j1@276@01)
        (< j1@276@01 N@157@01)
        (<= 0 M@156@01)
        (<= 0 N@157@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
    (or
      (not
        (and
          (<= 0 i1@275@01)
          (and
            (< i1@275@01 M@156@01)
            (and (<= 0 j1@276@01) (< j1@276@01 N@157@01)))))
      (and
        (<= 0 i1@275@01)
        (and
          (< i1@275@01 M@156@01)
          (and (<= 0 j1@276@01) (< j1@276@01 N@157@01))))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@171@12@171@225-aux|)))
(assert (forall ((i1@275@01 Int) (j1@276@01 Int)) (!
  (=>
    (and
      (<= 0 i1@275@01)
      (and (< i1@275@01 M@156@01) (and (<= 0 j1@276@01) (< j1@276@01 N@157@01))))
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@171@12@171@225_precondition|)))
(push) ; 3
(assert (not (forall ((i1@275@01 Int) (j1@276@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 i1@275@01)
          (and
            (< i1@275@01 M@156@01)
            (and (<= 0 j1@276@01) (< j1@276@01 N@157@01))))
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01))
      (and
        (<= 0 i1@275@01)
        (and
          (< i1@275@01 M@156@01)
          (and (<= 0 j1@276@01) (< j1@276@01 N@157@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@171@12@171@225|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@275@01 Int) (j1@276@01 Int)) (!
  (=>
    (and
      (<= 0 i1@275@01)
      (and (< i1@275@01 M@156@01) (and (<= 0 j1@276@01) (< j1@276@01 N@157@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@258@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@206@01  $FVF<Ref__Integer_value>) (Seq_index
        matrix@158@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@156@01 N@157@01 i1@275@01 j1@276@01)))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testHistogram.vpr@171@12@171@225|)))
(pop) ; 2
(pop) ; 1
