(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:22:22
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr
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
(declare-fun inv@45@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@46@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@50@00 () $Perm)
(declare-fun inv@51@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@52@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@53@00 ($Snap Int Int Int Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@57@00 () $Perm)
(declare-fun inv@58@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@59@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@63@00 () $Perm)
(declare-fun inv@64@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@65@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@66@00 ($Snap Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@70@00 () $Perm)
(declare-fun inv@71@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@72@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@76@00 () $Perm)
(declare-fun inv@77@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@78@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@79@00 ($Snap Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
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
    (forall ((k@43@00 Int)) (!
      (=>
        (and
          (and
            (<= min@9@00 k@43@00)
            (and
              (< k@43@00 max@10@00)
              (and
                (<= lo@6@00 (mod k@43@00 step@8@00))
                (< (mod k@43@00 step@8@00) hi@7@00))))
          (< $Perm.No $k@44@00))
        (and
          (=
            (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 (Seq_index
              ar@11@00
              k@43@00))
            k@43@00)
          (img@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 (Seq_index
            ar@11@00
            k@43@00))))
      :pattern ((Seq_index ar@11@00 k@43@00))
      :qid |quant-u-17|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
          (and
            (and
              (<=
                min@9@00
                (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@44@00)))
        (=
          (Seq_index
            ar@11@00
            (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
          r))
      :pattern ((inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@49@00 Int)) (!
      (=>
        (and
          (and
            (<= min@9@00 k@49@00)
            (and
              (< k@49@00 max@10@00)
              (and
                (<= lo@6@00 (mod k@49@00 step@8@00))
                (< (mod k@49@00 step@8@00) hi@7@00))))
          (< $Perm.No $k@50@00))
        (and
          (=
            (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 (Seq_index
              ar@11@00
              k@49@00))
            k@49@00)
          (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 (Seq_index
            ar@11@00
            k@49@00))))
      :pattern ((Seq_index ar@11@00 k@49@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
          (and
            (and
              (<=
                min@9@00
                (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@50@00)))
        (=
          (Seq_index
            ar@11@00
            (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
          r))
      :pattern ((inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)))
          (and
            (and
              (<=
                min@9@00
                (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@50@00)
            (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)))
        (=>
          (and
            (and
              (<=
                min@9@00
                (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@50@00)
            (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))))
      :qid |qp.fvfDomDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@9@00
                (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@51@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@50@00)
            (img@52@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
          (ite
            (and
              (img@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
              (and
                (<=
                  min@9@00
                  (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
                (and
                  (<
                    (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                    max@10@00)
                  (and
                    (<=
                      lo@6@00
                      (mod
                        (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                        step@8@00))
                    (<
                      (mod
                        (inv@45@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                        step@8@00)
                      hi@7@00)))))
            (< $Perm.No $k@44@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef1|))
    ($Perm.isReadVar $k@44@00)
    ($Perm.isReadVar $k@50@00)
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
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))))))))))) (+
              i@5@00
              1) lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))
          0))))
  :pattern ((sum_square s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))
  :qid |quant-u-22|)))
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
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@53@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))))))))))) (+
        i@5@00
        1) lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)
      true))
  :pattern ((sum_square s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))
  :qid |quant-u-23|)))
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
    (forall ((k@56@00 Int)) (!
      (=>
        (and
          (and (<= lo@14@00 k@56@00) (< k@56@00 hi@15@00))
          (< $Perm.No $k@57@00))
        (and
          (=
            (inv@58@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 (Seq_index
              ar@16@00
              k@56@00))
            k@56@00)
          (img@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 (Seq_index
            ar@16@00
            k@56@00))))
      :pattern ((Seq_index ar@16@00 k@56@00))
      :qid |quant-u-25|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r)
          (and
            (and
              (<= lo@14@00 (inv@58@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@58@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@57@00)))
        (=
          (Seq_index
            ar@16@00
            (inv@58@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
          r))
      :pattern ((inv@58@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@62@00 Int)) (!
      (=>
        (and
          (and (<= lo@14@00 k@62@00) (< k@62@00 hi@15@00))
          (< $Perm.No $k@63@00))
        (and
          (=
            (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 (Seq_index
              ar@16@00
              k@62@00))
            k@62@00)
          (img@65@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 (Seq_index
            ar@16@00
            k@62@00))))
      :pattern ((Seq_index ar@16@00 k@62@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@65@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r)
          (and
            (and
              (<= lo@14@00 (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@63@00)))
        (=
          (Seq_index
            ar@16@00
            (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
          r))
      :pattern ((inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@66@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00)))
          (and
            (and
              (<= lo@14@00 (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@63@00)
            (img@65@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r)))
        (=>
          (and
            (and
              (<= lo@14@00 (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@63@00)
            (img@65@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@66@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@66@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))))
      :qid |qp.fvfDomDef5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= lo@14@00 (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@64@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@63@00)
            (img@65@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
          (ite
            (and
              (img@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r)
              (and
                (<=
                  lo@14@00
                  (inv@58@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
                (< (inv@58@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00)))
            (< $Perm.No $k@57@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@66@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@66@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r))
      :qid |qp.fvfValDef4|))
    ($Perm.isReadVar $k@57@00)
    ($Perm.isReadVar $k@63@00)
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
                      ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@66@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))))))) (+
              i@13@00
              1) lo@14@00 hi@15@00 ar@16@00))
          0))))
  :pattern ((sum_array s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))
  :qid |quant-u-30|)))
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
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@66@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))))))) (+
        i@13@00
        1) lo@14@00 hi@15@00 ar@16@00)
      true))
  :pattern ((sum_array s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))
  :qid |quant-u-31|)))
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
  :qid |quant-u-32|)))
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
  :qid |quant-u-33|)))
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
    (forall ((k@69@00 Int)) (!
      (=>
        (and (and (<= 0 k@69@00) (< k@69@00 hi@23@00)) (< $Perm.No $k@70@00))
        (and
          (=
            (inv@71@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 (Seq_index
              ar@24@00
              k@69@00))
            k@69@00)
          (img@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 (Seq_index
            ar@24@00
            k@69@00))))
      :pattern ((Seq_index ar@24@00 k@69@00))
      :qid |quant-u-35|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r)
          (and
            (and
              (<= 0 (inv@71@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@71@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@70@00)))
        (=
          (Seq_index
            ar@24@00
            (inv@71@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
          r))
      :pattern ((inv@71@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@75@00 Int)) (!
      (=>
        (and (and (<= 0 k@75@00) (< k@75@00 hi@23@00)) (< $Perm.No $k@76@00))
        (and
          (=
            (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 (Seq_index
              ar@24@00
              k@75@00))
            k@75@00)
          (img@78@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 (Seq_index
            ar@24@00
            k@75@00))))
      :pattern ((Seq_index ar@24@00 k@75@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@78@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r)
          (and
            (and
              (<= 0 (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@76@00)))
        (=
          (Seq_index
            ar@24@00
            (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
          r))
      :pattern ((inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@79@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)))
          (and
            (and
              (<= 0 (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@76@00)
            (img@78@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@76@00)
            (img@78@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@79@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@79@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00))))
      :qid |qp.fvfDomDef8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@77@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@76@00)
            (img@78@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
          (ite
            (and
              (img@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r)
              (and
                (<= 0 (inv@71@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
                (< (inv@71@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00)))
            (< $Perm.No $k@70@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@79@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@79@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef7|))
    ($Perm.isReadVar $k@70@00)
    ($Perm.isReadVar $k@76@00)
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
                    ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@79@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)))))) (+
              i@22@00
              1) hi@23@00 ar@24@00 v@25@00))
          0))))
  :pattern ((count_array s@$ i@22@00 hi@23@00 ar@24@00 v@25@00))
  :qid |quant-u-40|)))
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
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@79@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)))))) (+
        i@22@00
        1) hi@23@00 ar@24@00 v@25@00)
      true))
  :pattern ((count_array s@$ i@22@00 hi@23@00 ar@24@00 v@25@00))
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
; ---------- Ref__loop_main_68 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const N@2@01 Int)
(declare-const M@3@01 Int)
(declare-const inp@4@01 Seq<$Ref>)
(declare-const out@5@01 Seq<$Ref>)
(declare-const diz@6@01 $Ref)
(declare-const current_thread_id@7@01 Int)
(declare-const N@8@01 Int)
(declare-const M@9@01 Int)
(declare-const inp@10@01 Seq<$Ref>)
(declare-const out@11@01 Seq<$Ref>)
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
; [eval] M * N <= |out|
; [eval] M * N
; [eval] |out|
(assert (<= (* M@9@01 N@8@01) (Seq_length out@11@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { out[j], out[k] } 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> out[j] != out[k])
(declare-const j@13@01 Int)
(declare-const k@14@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> out[j] != out[k]
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k)))
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
; [eval] j < M * N
; [eval] M * N
(push) ; 5
; [then-branch: 1 | !(j@13@01 < M@9@01 * N@8@01) | live]
; [else-branch: 1 | j@13@01 < M@9@01 * N@8@01 | live]
(push) ; 6
; [then-branch: 1 | !(j@13@01 < M@9@01 * N@8@01)]
(assert (not (< j@13@01 (* M@9@01 N@8@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | j@13@01 < M@9@01 * N@8@01]
(assert (< j@13@01 (* M@9@01 N@8@01)))
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
; [eval] k < M * N
; [eval] M * N
(push) ; 9
; [then-branch: 3 | !(k@14@01 < M@9@01 * N@8@01) | live]
; [else-branch: 3 | k@14@01 < M@9@01 * N@8@01 | live]
(push) ; 10
; [then-branch: 3 | !(k@14@01 < M@9@01 * N@8@01)]
(assert (not (< k@14@01 (* M@9@01 N@8@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | k@14@01 < M@9@01 * N@8@01]
(assert (< k@14@01 (* M@9@01 N@8@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@14@01 (* M@9@01 N@8@01)) (not (< k@14@01 (* M@9@01 N@8@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@14@01)
  (and
    (<= 0 k@14@01)
    (or (< k@14@01 (* M@9@01 N@8@01)) (not (< k@14@01 (* M@9@01 N@8@01)))))))
(assert (or (<= 0 k@14@01) (not (<= 0 k@14@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@13@01 (* M@9@01 N@8@01))
  (and
    (< j@13@01 (* M@9@01 N@8@01))
    (=>
      (<= 0 k@14@01)
      (and
        (<= 0 k@14@01)
        (or (< k@14@01 (* M@9@01 N@8@01)) (not (< k@14@01 (* M@9@01 N@8@01))))))
    (or (<= 0 k@14@01) (not (<= 0 k@14@01))))))
(assert (or (< j@13@01 (* M@9@01 N@8@01)) (not (< j@13@01 (* M@9@01 N@8@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@13@01)
  (and
    (<= 0 j@13@01)
    (=>
      (< j@13@01 (* M@9@01 N@8@01))
      (and
        (< j@13@01 (* M@9@01 N@8@01))
        (=>
          (<= 0 k@14@01)
          (and
            (<= 0 k@14@01)
            (or
              (< k@14@01 (* M@9@01 N@8@01))
              (not (< k@14@01 (* M@9@01 N@8@01))))))
        (or (<= 0 k@14@01) (not (<= 0 k@14@01)))))
    (or (< j@13@01 (* M@9@01 N@8@01)) (not (< j@13@01 (* M@9@01 N@8@01)))))))
(assert (or (<= 0 j@13@01) (not (<= 0 j@13@01))))
(push) ; 3
; [then-branch: 4 | 0 <= j@13@01 && j@13@01 < M@9@01 * N@8@01 && 0 <= k@14@01 && k@14@01 < M@9@01 * N@8@01 && j@13@01 != k@14@01 | live]
; [else-branch: 4 | !(0 <= j@13@01 && j@13@01 < M@9@01 * N@8@01 && 0 <= k@14@01 && k@14@01 < M@9@01 * N@8@01 && j@13@01 != k@14@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= j@13@01 && j@13@01 < M@9@01 * N@8@01 && 0 <= k@14@01 && k@14@01 < M@9@01 * N@8@01 && j@13@01 != k@14@01]
(assert (and
  (<= 0 j@13@01)
  (and
    (< j@13@01 (* M@9@01 N@8@01))
    (and
      (<= 0 k@14@01)
      (and (< k@14@01 (* M@9@01 N@8@01)) (not (= j@13@01 k@14@01)))))))
; [eval] out[j] != out[k]
; [eval] out[j]
(push) ; 5
(assert (not (>= j@13@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@13@01 (Seq_length out@11@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] out[k]
(push) ; 5
(assert (not (>= k@14@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@14@01 (Seq_length out@11@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= j@13@01 && j@13@01 < M@9@01 * N@8@01 && 0 <= k@14@01 && k@14@01 < M@9@01 * N@8@01 && j@13@01 != k@14@01)]
(assert (not
  (and
    (<= 0 j@13@01)
    (and
      (< j@13@01 (* M@9@01 N@8@01))
      (and
        (<= 0 k@14@01)
        (and (< k@14@01 (* M@9@01 N@8@01)) (not (= j@13@01 k@14@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@13@01)
    (and
      (< j@13@01 (* M@9@01 N@8@01))
      (and
        (<= 0 k@14@01)
        (and (< k@14@01 (* M@9@01 N@8@01)) (not (= j@13@01 k@14@01))))))
  (and
    (<= 0 j@13@01)
    (< j@13@01 (* M@9@01 N@8@01))
    (<= 0 k@14@01)
    (< k@14@01 (* M@9@01 N@8@01))
    (not (= j@13@01 k@14@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@13@01)
      (and
        (< j@13@01 (* M@9@01 N@8@01))
        (and
          (<= 0 k@14@01)
          (and (< k@14@01 (* M@9@01 N@8@01)) (not (= j@13@01 k@14@01)))))))
  (and
    (<= 0 j@13@01)
    (and
      (< j@13@01 (* M@9@01 N@8@01))
      (and
        (<= 0 k@14@01)
        (and (< k@14@01 (* M@9@01 N@8@01)) (not (= j@13@01 k@14@01))))))))
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
          (< j@13@01 (* M@9@01 N@8@01))
          (and
            (< j@13@01 (* M@9@01 N@8@01))
            (=>
              (<= 0 k@14@01)
              (and
                (<= 0 k@14@01)
                (or
                  (< k@14@01 (* M@9@01 N@8@01))
                  (not (< k@14@01 (* M@9@01 N@8@01))))))
            (or (<= 0 k@14@01) (not (<= 0 k@14@01)))))
        (or (< j@13@01 (* M@9@01 N@8@01)) (not (< j@13@01 (* M@9@01 N@8@01))))))
    (or (<= 0 j@13@01) (not (<= 0 j@13@01)))
    (=>
      (and
        (<= 0 j@13@01)
        (and
          (< j@13@01 (* M@9@01 N@8@01))
          (and
            (<= 0 k@14@01)
            (and (< k@14@01 (* M@9@01 N@8@01)) (not (= j@13@01 k@14@01))))))
      (and
        (<= 0 j@13@01)
        (< j@13@01 (* M@9@01 N@8@01))
        (<= 0 k@14@01)
        (< k@14@01 (* M@9@01 N@8@01))
        (not (= j@13@01 k@14@01))))
    (or
      (not
        (and
          (<= 0 j@13@01)
          (and
            (< j@13@01 (* M@9@01 N@8@01))
            (and
              (<= 0 k@14@01)
              (and (< k@14@01 (* M@9@01 N@8@01)) (not (= j@13@01 k@14@01)))))))
      (and
        (<= 0 j@13@01)
        (and
          (< j@13@01 (* M@9@01 N@8@01))
          (and
            (<= 0 k@14@01)
            (and (< k@14@01 (* M@9@01 N@8@01)) (not (= j@13@01 k@14@01))))))))
  :pattern ((Seq_index out@11@01 j@13@01) (Seq_index out@11@01 k@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@76@12@76@106-aux|)))
(assert (forall ((j@13@01 Int) (k@14@01 Int)) (!
  (=>
    (and
      (<= 0 j@13@01)
      (and
        (< j@13@01 (* M@9@01 N@8@01))
        (and
          (<= 0 k@14@01)
          (and (< k@14@01 (* M@9@01 N@8@01)) (not (= j@13@01 k@14@01))))))
    (not (= (Seq_index out@11@01 j@13@01) (Seq_index out@11@01 k@14@01))))
  :pattern ((Seq_index out@11@01 j@13@01) (Seq_index out@11@01 k@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@76@12@76@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(declare-const j@15@01 Int)
(push) ; 2
; [eval] 0 <= j && j < M * N
; [eval] 0 <= j
(push) ; 3
; [then-branch: 5 | !(0 <= j@15@01) | live]
; [else-branch: 5 | 0 <= j@15@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= j@15@01)]
(assert (not (<= 0 j@15@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= j@15@01]
(assert (<= 0 j@15@01))
; [eval] j < M * N
; [eval] M * N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@15@01) (not (<= 0 j@15@01))))
(assert (and (<= 0 j@15@01) (< j@15@01 (* M@9@01 N@8@01))))
; [eval] out[j]
(push) ; 3
(assert (not (>= j@15@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@15@01 (Seq_length out@11@01))))
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
(assert (forall ((j@15@01 Int)) (!
  (=>
    (and (<= 0 j@15@01) (< j@15@01 (* M@9@01 N@8@01)))
    (or (<= 0 j@15@01) (not (<= 0 j@15@01))))
  :pattern ((Seq_index out@11@01 j@15@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@15@01 Int) (j2@15@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@15@01) (< j1@15@01 (* M@9@01 N@8@01)))
      (and (<= 0 j2@15@01) (< j2@15@01 (* M@9@01 N@8@01)))
      (= (Seq_index out@11@01 j1@15@01) (Seq_index out@11@01 j2@15@01)))
    (= j1@15@01 j2@15@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@15@01 Int)) (!
  (=>
    (and (<= 0 j@15@01) (< j@15@01 (* M@9@01 N@8@01)))
    (and
      (= (inv@16@01 (Seq_index out@11@01 j@15@01)) j@15@01)
      (img@17@01 (Seq_index out@11@01 j@15@01))))
  :pattern ((Seq_index out@11@01 j@15@01))
  :qid |quant-u-57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@01 r)
      (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) (* M@9@01 N@8@01))))
    (= (Seq_index out@11@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@15@01 Int)) (!
  (=>
    (and (<= 0 j@15@01) (< j@15@01 (* M@9@01 N@8@01)))
    (not (= (Seq_index out@11@01 j@15@01) $Ref.null)))
  :pattern ((Seq_index out@11@01 j@15@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  $Snap.unit))
; [eval] N * M <= |inp|
; [eval] N * M
; [eval] |inp|
(assert (<= (* N@8@01 M@9@01) (Seq_length inp@10@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { inp[j], inp[k] } 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> inp[j] != inp[k])
(declare-const j@18@01 Int)
(declare-const k@19@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> inp[j] != inp[k]
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 6 | !(0 <= j@18@01) | live]
; [else-branch: 6 | 0 <= j@18@01 | live]
(push) ; 4
; [then-branch: 6 | !(0 <= j@18@01)]
(assert (not (<= 0 j@18@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | 0 <= j@18@01]
(assert (<= 0 j@18@01))
; [eval] j < M * N
; [eval] M * N
(push) ; 5
; [then-branch: 7 | !(j@18@01 < M@9@01 * N@8@01) | live]
; [else-branch: 7 | j@18@01 < M@9@01 * N@8@01 | live]
(push) ; 6
; [then-branch: 7 | !(j@18@01 < M@9@01 * N@8@01)]
(assert (not (< j@18@01 (* M@9@01 N@8@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | j@18@01 < M@9@01 * N@8@01]
(assert (< j@18@01 (* M@9@01 N@8@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 8 | !(0 <= k@19@01) | live]
; [else-branch: 8 | 0 <= k@19@01 | live]
(push) ; 8
; [then-branch: 8 | !(0 <= k@19@01)]
(assert (not (<= 0 k@19@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | 0 <= k@19@01]
(assert (<= 0 k@19@01))
; [eval] k < M * N
; [eval] M * N
(push) ; 9
; [then-branch: 9 | !(k@19@01 < M@9@01 * N@8@01) | live]
; [else-branch: 9 | k@19@01 < M@9@01 * N@8@01 | live]
(push) ; 10
; [then-branch: 9 | !(k@19@01 < M@9@01 * N@8@01)]
(assert (not (< k@19@01 (* M@9@01 N@8@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | k@19@01 < M@9@01 * N@8@01]
(assert (< k@19@01 (* M@9@01 N@8@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@19@01 (* M@9@01 N@8@01)) (not (< k@19@01 (* M@9@01 N@8@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@19@01)
  (and
    (<= 0 k@19@01)
    (or (< k@19@01 (* M@9@01 N@8@01)) (not (< k@19@01 (* M@9@01 N@8@01)))))))
(assert (or (<= 0 k@19@01) (not (<= 0 k@19@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@18@01 (* M@9@01 N@8@01))
  (and
    (< j@18@01 (* M@9@01 N@8@01))
    (=>
      (<= 0 k@19@01)
      (and
        (<= 0 k@19@01)
        (or (< k@19@01 (* M@9@01 N@8@01)) (not (< k@19@01 (* M@9@01 N@8@01))))))
    (or (<= 0 k@19@01) (not (<= 0 k@19@01))))))
(assert (or (< j@18@01 (* M@9@01 N@8@01)) (not (< j@18@01 (* M@9@01 N@8@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@18@01)
  (and
    (<= 0 j@18@01)
    (=>
      (< j@18@01 (* M@9@01 N@8@01))
      (and
        (< j@18@01 (* M@9@01 N@8@01))
        (=>
          (<= 0 k@19@01)
          (and
            (<= 0 k@19@01)
            (or
              (< k@19@01 (* M@9@01 N@8@01))
              (not (< k@19@01 (* M@9@01 N@8@01))))))
        (or (<= 0 k@19@01) (not (<= 0 k@19@01)))))
    (or (< j@18@01 (* M@9@01 N@8@01)) (not (< j@18@01 (* M@9@01 N@8@01)))))))
(assert (or (<= 0 j@18@01) (not (<= 0 j@18@01))))
(push) ; 3
; [then-branch: 10 | 0 <= j@18@01 && j@18@01 < M@9@01 * N@8@01 && 0 <= k@19@01 && k@19@01 < M@9@01 * N@8@01 && j@18@01 != k@19@01 | live]
; [else-branch: 10 | !(0 <= j@18@01 && j@18@01 < M@9@01 * N@8@01 && 0 <= k@19@01 && k@19@01 < M@9@01 * N@8@01 && j@18@01 != k@19@01) | live]
(push) ; 4
; [then-branch: 10 | 0 <= j@18@01 && j@18@01 < M@9@01 * N@8@01 && 0 <= k@19@01 && k@19@01 < M@9@01 * N@8@01 && j@18@01 != k@19@01]
(assert (and
  (<= 0 j@18@01)
  (and
    (< j@18@01 (* M@9@01 N@8@01))
    (and
      (<= 0 k@19@01)
      (and (< k@19@01 (* M@9@01 N@8@01)) (not (= j@18@01 k@19@01)))))))
; [eval] inp[j] != inp[k]
; [eval] inp[j]
(push) ; 5
(assert (not (>= j@18@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@18@01 (Seq_length inp@10@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] inp[k]
(push) ; 5
(assert (not (>= k@19@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@19@01 (Seq_length inp@10@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(0 <= j@18@01 && j@18@01 < M@9@01 * N@8@01 && 0 <= k@19@01 && k@19@01 < M@9@01 * N@8@01 && j@18@01 != k@19@01)]
(assert (not
  (and
    (<= 0 j@18@01)
    (and
      (< j@18@01 (* M@9@01 N@8@01))
      (and
        (<= 0 k@19@01)
        (and (< k@19@01 (* M@9@01 N@8@01)) (not (= j@18@01 k@19@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@18@01)
    (and
      (< j@18@01 (* M@9@01 N@8@01))
      (and
        (<= 0 k@19@01)
        (and (< k@19@01 (* M@9@01 N@8@01)) (not (= j@18@01 k@19@01))))))
  (and
    (<= 0 j@18@01)
    (< j@18@01 (* M@9@01 N@8@01))
    (<= 0 k@19@01)
    (< k@19@01 (* M@9@01 N@8@01))
    (not (= j@18@01 k@19@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@18@01)
      (and
        (< j@18@01 (* M@9@01 N@8@01))
        (and
          (<= 0 k@19@01)
          (and (< k@19@01 (* M@9@01 N@8@01)) (not (= j@18@01 k@19@01)))))))
  (and
    (<= 0 j@18@01)
    (and
      (< j@18@01 (* M@9@01 N@8@01))
      (and
        (<= 0 k@19@01)
        (and (< k@19@01 (* M@9@01 N@8@01)) (not (= j@18@01 k@19@01))))))))
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
          (< j@18@01 (* M@9@01 N@8@01))
          (and
            (< j@18@01 (* M@9@01 N@8@01))
            (=>
              (<= 0 k@19@01)
              (and
                (<= 0 k@19@01)
                (or
                  (< k@19@01 (* M@9@01 N@8@01))
                  (not (< k@19@01 (* M@9@01 N@8@01))))))
            (or (<= 0 k@19@01) (not (<= 0 k@19@01)))))
        (or (< j@18@01 (* M@9@01 N@8@01)) (not (< j@18@01 (* M@9@01 N@8@01))))))
    (or (<= 0 j@18@01) (not (<= 0 j@18@01)))
    (=>
      (and
        (<= 0 j@18@01)
        (and
          (< j@18@01 (* M@9@01 N@8@01))
          (and
            (<= 0 k@19@01)
            (and (< k@19@01 (* M@9@01 N@8@01)) (not (= j@18@01 k@19@01))))))
      (and
        (<= 0 j@18@01)
        (< j@18@01 (* M@9@01 N@8@01))
        (<= 0 k@19@01)
        (< k@19@01 (* M@9@01 N@8@01))
        (not (= j@18@01 k@19@01))))
    (or
      (not
        (and
          (<= 0 j@18@01)
          (and
            (< j@18@01 (* M@9@01 N@8@01))
            (and
              (<= 0 k@19@01)
              (and (< k@19@01 (* M@9@01 N@8@01)) (not (= j@18@01 k@19@01)))))))
      (and
        (<= 0 j@18@01)
        (and
          (< j@18@01 (* M@9@01 N@8@01))
          (and
            (<= 0 k@19@01)
            (and (< k@19@01 (* M@9@01 N@8@01)) (not (= j@18@01 k@19@01))))))))
  :pattern ((Seq_index inp@10@01 j@18@01) (Seq_index inp@10@01 k@19@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@79@12@79@106-aux|)))
(assert (forall ((j@18@01 Int) (k@19@01 Int)) (!
  (=>
    (and
      (<= 0 j@18@01)
      (and
        (< j@18@01 (* M@9@01 N@8@01))
        (and
          (<= 0 k@19@01)
          (and (< k@19@01 (* M@9@01 N@8@01)) (not (= j@18@01 k@19@01))))))
    (not (= (Seq_index inp@10@01 j@18@01) (Seq_index inp@10@01 k@19@01))))
  :pattern ((Seq_index inp@10@01 j@18@01) (Seq_index inp@10@01 k@19@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@79@12@79@106|)))
(declare-const i@20@01 Int)
(push) ; 2
; [eval] 0 <= i && i < N * M
; [eval] 0 <= i
(push) ; 3
; [then-branch: 11 | !(0 <= i@20@01) | live]
; [else-branch: 11 | 0 <= i@20@01 | live]
(push) ; 4
; [then-branch: 11 | !(0 <= i@20@01)]
(assert (not (<= 0 i@20@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | 0 <= i@20@01]
(assert (<= 0 i@20@01))
; [eval] i < N * M
; [eval] N * M
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
(assert (and (<= 0 i@20@01) (< i@20@01 (* N@8@01 M@9@01))))
; [eval] inp[i]
(push) ; 3
(assert (not (>= i@20@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@20@01 (Seq_length inp@10@01))))
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
    (and (<= 0 i@20@01) (< i@20@01 (* N@8@01 M@9@01)))
    (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
  :pattern ((Seq_index inp@10@01 i@20@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@20@01 Int) (i2@20@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@20@01) (< i1@20@01 (* N@8@01 M@9@01)))
      (and (<= 0 i2@20@01) (< i2@20@01 (* N@8@01 M@9@01)))
      (= (Seq_index inp@10@01 i1@20@01) (Seq_index inp@10@01 i2@20@01)))
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
    (and (<= 0 i@20@01) (< i@20@01 (* N@8@01 M@9@01)))
    (and
      (= (inv@21@01 (Seq_index inp@10@01 i@20@01)) i@20@01)
      (img@22@01 (Seq_index inp@10@01 i@20@01))))
  :pattern ((Seq_index inp@10@01 i@20@01))
  :qid |quant-u-59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@01 r)
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (* N@8@01 M@9@01))))
    (= (Seq_index inp@10@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 0 i@20@01) (< i@20@01 (* N@8@01 M@9@01)))
    (not (= (Seq_index inp@10@01 i@20@01) $Ref.null)))
  :pattern ((Seq_index inp@10@01 i@20@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index inp@10@01 i@20@01) (Seq_index out@11@01 j@15@01))
    (=
      (and
        (img@22@01 r)
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (* N@8@01 M@9@01))))
      (and
        (img@17@01 r)
        (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) (* M@9@01 N@8@01))))))
  
  :qid |quant-u-60|))))
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
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(declare-const j@24@01 Int)
(push) ; 3
; [eval] 0 <= j && j < M * N
; [eval] 0 <= j
(push) ; 4
; [then-branch: 12 | !(0 <= j@24@01) | live]
; [else-branch: 12 | 0 <= j@24@01 | live]
(push) ; 5
; [then-branch: 12 | !(0 <= j@24@01)]
(assert (not (<= 0 j@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | 0 <= j@24@01]
(assert (<= 0 j@24@01))
; [eval] j < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@24@01) (not (<= 0 j@24@01))))
(assert (and (<= 0 j@24@01) (< j@24@01 (* M@9@01 N@8@01))))
; [eval] out[j]
(push) ; 4
(assert (not (>= j@24@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@24@01 (Seq_length out@11@01))))
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
(assert (forall ((j@24@01 Int)) (!
  (=>
    (and (<= 0 j@24@01) (< j@24@01 (* M@9@01 N@8@01)))
    (or (<= 0 j@24@01) (not (<= 0 j@24@01))))
  :pattern ((Seq_index out@11@01 j@24@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@24@01 Int) (j2@24@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@24@01) (< j1@24@01 (* M@9@01 N@8@01)))
      (and (<= 0 j2@24@01) (< j2@24@01 (* M@9@01 N@8@01)))
      (= (Seq_index out@11@01 j1@24@01) (Seq_index out@11@01 j2@24@01)))
    (= j1@24@01 j2@24@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@24@01 Int)) (!
  (=>
    (and (<= 0 j@24@01) (< j@24@01 (* M@9@01 N@8@01)))
    (and
      (= (inv@25@01 (Seq_index out@11@01 j@24@01)) j@24@01)
      (img@26@01 (Seq_index out@11@01 j@24@01))))
  :pattern ((Seq_index out@11@01 j@24@01))
  :qid |quant-u-62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@26@01 r)
      (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (* M@9@01 N@8@01))))
    (= (Seq_index out@11@01 (inv@25@01 r)) r))
  :pattern ((inv@25@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@24@01 Int)) (!
  (=>
    (and (<= 0 j@24@01) (< j@24@01 (* M@9@01 N@8@01)))
    (not (= (Seq_index out@11@01 j@24@01) $Ref.null)))
  :pattern ((Seq_index out@11@01 j@24@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(declare-const i@27@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N * M
; [eval] 0 <= i
(push) ; 4
; [then-branch: 13 | !(0 <= i@27@01) | live]
; [else-branch: 13 | 0 <= i@27@01 | live]
(push) ; 5
; [then-branch: 13 | !(0 <= i@27@01)]
(assert (not (<= 0 i@27@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | 0 <= i@27@01]
(assert (<= 0 i@27@01))
; [eval] i < N * M
; [eval] N * M
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@27@01) (not (<= 0 i@27@01))))
(assert (and (<= 0 i@27@01) (< i@27@01 (* N@8@01 M@9@01))))
; [eval] inp[i]
(push) ; 4
(assert (not (>= i@27@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@27@01 (Seq_length inp@10@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@28@01 ($Ref) Int)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (* N@8@01 M@9@01)))
    (or (<= 0 i@27@01) (not (<= 0 i@27@01))))
  :pattern ((Seq_index inp@10@01 i@27@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@27@01 Int) (i2@27@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@27@01) (< i1@27@01 (* N@8@01 M@9@01)))
      (and (<= 0 i2@27@01) (< i2@27@01 (* N@8@01 M@9@01)))
      (= (Seq_index inp@10@01 i1@27@01) (Seq_index inp@10@01 i2@27@01)))
    (= i1@27@01 i2@27@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (* N@8@01 M@9@01)))
    (and
      (= (inv@28@01 (Seq_index inp@10@01 i@27@01)) i@27@01)
      (img@29@01 (Seq_index inp@10@01 i@27@01))))
  :pattern ((Seq_index inp@10@01 i@27@01))
  :qid |quant-u-64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@01 r)
      (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (* N@8@01 M@9@01))))
    (= (Seq_index inp@10@01 (inv@28@01 r)) r))
  :pattern ((inv@28@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (* N@8@01 M@9@01)))
    (not (= (Seq_index inp@10@01 i@27@01) $Ref.null)))
  :pattern ((Seq_index inp@10@01 i@27@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index inp@10@01 i@27@01) (Seq_index out@11@01 j@24@01))
    (=
      (and
        (img@29@01 r)
        (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (* N@8@01 M@9@01))))
      (and
        (img@26@01 r)
        (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (* M@9@01 N@8@01))))))
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@23@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { out[Ref__multidim_index_2(M, N, i, j)] } { inp[Ref__multidim_index_2(N, M, j, i)] } 0 <= i && (i < M && (0 <= j && j < N)) ==> out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
(declare-const i@30@01 Int)
(declare-const j@31@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 14 | !(0 <= i@30@01) | live]
; [else-branch: 14 | 0 <= i@30@01 | live]
(push) ; 5
; [then-branch: 14 | !(0 <= i@30@01)]
(assert (not (<= 0 i@30@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | 0 <= i@30@01]
(assert (<= 0 i@30@01))
; [eval] i < M
(push) ; 6
; [then-branch: 15 | !(i@30@01 < M@9@01) | live]
; [else-branch: 15 | i@30@01 < M@9@01 | live]
(push) ; 7
; [then-branch: 15 | !(i@30@01 < M@9@01)]
(assert (not (< i@30@01 M@9@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 15 | i@30@01 < M@9@01]
(assert (< i@30@01 M@9@01))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 16 | !(0 <= j@31@01) | live]
; [else-branch: 16 | 0 <= j@31@01 | live]
(push) ; 9
; [then-branch: 16 | !(0 <= j@31@01)]
(assert (not (<= 0 j@31@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 16 | 0 <= j@31@01]
(assert (<= 0 j@31@01))
; [eval] j < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@31@01) (not (<= 0 j@31@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@30@01 M@9@01)
  (and (< i@30@01 M@9@01) (or (<= 0 j@31@01) (not (<= 0 j@31@01))))))
(assert (or (< i@30@01 M@9@01) (not (< i@30@01 M@9@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@30@01)
  (and
    (<= 0 i@30@01)
    (=>
      (< i@30@01 M@9@01)
      (and (< i@30@01 M@9@01) (or (<= 0 j@31@01) (not (<= 0 j@31@01)))))
    (or (< i@30@01 M@9@01) (not (< i@30@01 M@9@01))))))
(assert (or (<= 0 i@30@01) (not (<= 0 i@30@01))))
(push) ; 4
; [then-branch: 17 | 0 <= i@30@01 && i@30@01 < M@9@01 && 0 <= j@31@01 && j@31@01 < N@8@01 | live]
; [else-branch: 17 | !(0 <= i@30@01 && i@30@01 < M@9@01 && 0 <= j@31@01 && j@31@01 < N@8@01) | live]
(push) ; 5
; [then-branch: 17 | 0 <= i@30@01 && i@30@01 < M@9@01 && 0 <= j@31@01 && j@31@01 < N@8@01]
(assert (and
  (<= 0 i@30@01)
  (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01)))))
; [eval] out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] out[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 M@9@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@9@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 N@8@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@8@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 M@9@01)
  (<= 0 N@8@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01)))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01)
  (Seq_length out@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@32@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@26@01 r)
      (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (* M@9@01 N@8@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@23@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@23@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@01 r)
      (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (* N@8@01 M@9@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@23@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@23@01))) r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@33@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@33@01  $FPM) r)
    (+
      (ite
        (and
          (img@26@01 r)
          (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (* M@9@01 N@8@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@29@01 r)
          (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (* N@8@01 M@9@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@33@01  $FPM) (Seq_index
    out@11@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01))
(pop) ; 6
; Joined path conditions
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)
  (Seq_length inp@10@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@26@01 r)
        (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (* M@9@01 N@8@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@23@01)) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@23@01)) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@29@01 r)
        (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (* N@8@01 M@9@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@23@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@23@01))) r))
    :qid |qp.fvfValDef1|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@26@01 (Seq_index
          inp@10@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)))
        (and
          (<=
            0
            (inv@25@01 (Seq_index
              inp@10@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01))))
          (<
            (inv@25@01 (Seq_index
              inp@10@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)))
            (* M@9@01 N@8@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@29@01 (Seq_index
          inp@10@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)))
        (and
          (<=
            0
            (inv@28@01 (Seq_index
              inp@10@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01))))
          (<
            (inv@28@01 (Seq_index
              inp@10@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)))
            (* N@8@01 M@9@01))))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(0 <= i@30@01 && i@30@01 < M@9@01 && 0 <= j@31@01 && j@31@01 < N@8@01)]
(assert (not
  (and
    (<= 0 i@30@01)
    (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@26@01 r)
      (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (* M@9@01 N@8@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@23@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@23@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@01 r)
      (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (* N@8@01 M@9@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@23@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@23@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@33@01  $FPM) r)
    (+
      (ite
        (and
          (img@26@01 r)
          (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (* M@9@01 N@8@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@29@01 r)
          (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (* N@8@01 M@9@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (=>
  (and
    (<= 0 i@30@01)
    (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01))))
  (and
    (<= 0 i@30@01)
    (< i@30@01 M@9@01)
    (<= 0 j@31@01)
    (< j@31@01 N@8@01)
    (<= 0 M@9@01)
    (<= 0 N@8@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@30@01)
      (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01)))))
  (and
    (<= 0 i@30@01)
    (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@26@01 r)
      (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (* M@9@01 N@8@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@23@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@23@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@01 r)
      (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (* N@8@01 M@9@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@23@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@23@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@33@01  $FPM) r)
    (+
      (ite
        (and
          (img@26@01 r)
          (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (* M@9@01 N@8@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@29@01 r)
          (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (* N@8@01 M@9@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@30@01 Int) (j@31@01 Int)) (!
  (and
    (=>
      (<= 0 i@30@01)
      (and
        (<= 0 i@30@01)
        (=>
          (< i@30@01 M@9@01)
          (and (< i@30@01 M@9@01) (or (<= 0 j@31@01) (not (<= 0 j@31@01)))))
        (or (< i@30@01 M@9@01) (not (< i@30@01 M@9@01)))))
    (or (<= 0 i@30@01) (not (<= 0 i@30@01)))
    (=>
      (and
        (<= 0 i@30@01)
        (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01))))
      (and
        (<= 0 i@30@01)
        (< i@30@01 M@9@01)
        (<= 0 j@31@01)
        (< j@31@01 N@8@01)
        (<= 0 M@9@01)
        (<= 0 N@8@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)))
    (or
      (not
        (and
          (<= 0 i@30@01)
          (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01)))))
      (and
        (<= 0 i@30@01)
        (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01))))))
  :pattern ((Seq_index
    out@11@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@83@12@83@204-aux|)))
(assert (forall ((i@30@01 Int) (j@31@01 Int)) (!
  (and
    (=>
      (<= 0 i@30@01)
      (and
        (<= 0 i@30@01)
        (=>
          (< i@30@01 M@9@01)
          (and (< i@30@01 M@9@01) (or (<= 0 j@31@01) (not (<= 0 j@31@01)))))
        (or (< i@30@01 M@9@01) (not (< i@30@01 M@9@01)))))
    (or (<= 0 i@30@01) (not (<= 0 i@30@01)))
    (=>
      (and
        (<= 0 i@30@01)
        (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01))))
      (and
        (<= 0 i@30@01)
        (< i@30@01 M@9@01)
        (<= 0 j@31@01)
        (< j@31@01 N@8@01)
        (<= 0 M@9@01)
        (<= 0 N@8@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)))
    (or
      (not
        (and
          (<= 0 i@30@01)
          (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01)))))
      (and
        (<= 0 i@30@01)
        (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01))))))
  :pattern ((Seq_index
    inp@10@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@83@12@83@204-aux|)))
(assert (forall ((i@30@01 Int) (j@31@01 Int)) (!
  (=>
    (and
      (<= 0 i@30@01)
      (and (< i@30@01 M@9@01) (and (<= 0 j@31@01) (< j@31@01 N@8@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) (Seq_index
        out@11@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@32@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@10@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)))))
  :pattern ((Seq_index
    out@11@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@9@01 N@8@01 i@30@01 j@31@01)))
  :pattern ((Seq_index
    inp@10@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@8@01 M@9@01 j@31@01 i@30@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@83@12@83@204|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_body_68 ----------
(declare-const diz@34@01 $Ref)
(declare-const current_thread_id@35@01 Int)
(declare-const j@36@01 Int)
(declare-const out@37@01 Seq<$Ref>)
(declare-const i@38@01 Int)
(declare-const inp@39@01 Seq<$Ref>)
(declare-const N@40@01 Int)
(declare-const M@41@01 Int)
(declare-const diz@42@01 $Ref)
(declare-const current_thread_id@43@01 Int)
(declare-const j@44@01 Int)
(declare-const out@45@01 Seq<$Ref>)
(declare-const i@46@01 Int)
(declare-const inp@47@01 Seq<$Ref>)
(declare-const N@48@01 Int)
(declare-const M@49@01 Int)
(push) ; 1
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(assert (= ($Snap.first $t@50@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@42@01 $Ref.null)))
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(assert (= ($Snap.first ($Snap.second $t@50@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@43@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@50@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@50@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@50@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@46@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@50@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
  $Snap.unit))
; [eval] i < M
(assert (< i@46@01 M@49@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
  $Snap.unit))
; [eval] 0 <= j
(assert (<= 0 j@44@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
  $Snap.unit))
; [eval] j < N
(assert (< j@44@01 N@48@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
  $Snap.unit))
; [eval] Ref__multidim_index_2(M, N, i, j) < |out|
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 2
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 3
(assert (not (<= 0 M@49@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@49@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 3
(assert (not (<= 0 N@48@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@48@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (<= 0 M@49@01)
  (<= 0 N@48@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)))
; [eval] |out|
(assert (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)
  (Seq_length out@45@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))))))
; [eval] out[Ref__multidim_index_2(M, N, i, j)]
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)
  0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    (Seq_index
      out@45@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))))
  $Snap.unit))
; [eval] Ref__multidim_index_2(N, M, j, i) < |inp|
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 2
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01))
(pop) ; 2
; Joined path conditions
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01))
; [eval] |inp|
(assert (<
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01)
  (Seq_length inp@47@01)))
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01)
  0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  (Seq_index
    out@45@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01))
  (Seq_index
    inp@47@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    (Seq_index
      inp@47@01
      (Ref__multidim_index_2 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01))
    $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (= ($Snap.first $t@51@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@51@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@51@01))
    ($Snap.second ($Snap.second $t@51@01)))))
(assert (= ($Snap.first ($Snap.second $t@51@01)) $Snap.unit))
; [eval] i < M
(assert (=
  ($Snap.second ($Snap.second $t@51@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@51@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@51@01))) $Snap.unit))
; [eval] 0 <= j
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@51@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
  $Snap.unit))
; [eval] j < N
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))))
; [eval] out[Ref__multidim_index_2(M, N, i, j)]
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index
    out@45@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01))
  (Seq_index
    inp@47@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
  $Snap.unit))
; [eval] out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] out[Ref__multidim_index_2(M, N, i, j)]
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@52@01 Int)
; [exec]
; var __flatten_2: Int
(declare-const __flatten_2@53@01 Int)
; [exec]
; var __flatten_4: Int
(declare-const __flatten_4@54@01 Int)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@55@01 Int)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@56@01 $Ref)
; [exec]
; var __flatten_7: Int
(declare-const __flatten_7@57@01 Int)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@58@01 $Ref)
; [exec]
; __flatten_4 := Ref__multidim_index_2(M, N, i, j)
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
(declare-const __flatten_4@59@01 Int)
(assert (=
  __flatten_4@59@01
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)))
; [exec]
; __flatten_1 := __flatten_4
; [exec]
; __flatten_5 := Ref__multidim_index_2(N, M, j, i)
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 3
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(pop) ; 3
; Joined path conditions
(declare-const __flatten_5@60@01 Int)
(assert (=
  __flatten_5@60@01
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01)))
; [exec]
; __flatten_2 := __flatten_5
; [exec]
; __flatten_6 := out[__flatten_1]
; [eval] out[__flatten_1]
(push) ; 3
(assert (not (>= __flatten_4@59@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< __flatten_4@59@01 (Seq_length out@45@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@61@01 $Ref)
(assert (= __flatten_6@61@01 (Seq_index out@45@01 __flatten_4@59@01)))
; [exec]
; __flatten_8 := inp[__flatten_2]
; [eval] inp[__flatten_2]
(push) ; 3
(assert (not (>= __flatten_5@60@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< __flatten_5@60@01 (Seq_length inp@47@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_8@62@01 $Ref)
(assert (= __flatten_8@62@01 (Seq_index inp@47@01 __flatten_5@60@01)))
; [exec]
; __flatten_7 := __flatten_8.Ref__Integer_value
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index
    inp@47@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01))
  __flatten_8@62@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@63@01 Int)
(assert (=
  __flatten_7@63@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))))))
; [exec]
; __flatten_6.Ref__Integer_value := __flatten_7
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index
    inp@47@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01))
  __flatten_6@61@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index
    out@45@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01))
  __flatten_6@61@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index
    inp@47@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01))
  __flatten_6@61@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_6@61@01 $Ref.null)))
; [eval] 0 <= i
; [eval] i < M
; [eval] 0 <= j
; [eval] j < N
; [eval] out[Ref__multidim_index_2(M, N, i, j)]
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  __flatten_6@61@01
  (Seq_index
    out@45@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] out[Ref__multidim_index_2(M, N, i, j)]
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  __flatten_6@61@01
  (Seq_index
    out@45@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@49@01 N@48@01 i@46@01 j@44@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@48@01 M@49@01 j@44@01 i@46@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__transpose ----------
(declare-const diz@64@01 $Ref)
(declare-const current_thread_id@65@01 Int)
(declare-const M@66@01 Int)
(declare-const N@67@01 Int)
(declare-const out@68@01 Seq<$Ref>)
(declare-const inp@69@01 Seq<$Ref>)
(declare-const diz@70@01 $Ref)
(declare-const current_thread_id@71@01 Int)
(declare-const M@72@01 Int)
(declare-const N@73@01 Int)
(declare-const out@74@01 Seq<$Ref>)
(declare-const inp@75@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(assert (= ($Snap.first $t@76@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@70@01 $Ref.null)))
(assert (=
  ($Snap.second $t@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@76@01))
    ($Snap.second ($Snap.second $t@76@01)))))
(assert (= ($Snap.first ($Snap.second $t@76@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@71@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@76@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@76@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@76@01))) $Snap.unit))
; [eval] M > 0
(assert (> M@72@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@76@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
  $Snap.unit))
; [eval] N > 0
(assert (> N@73@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
  $Snap.unit))
; [eval] M * N <= |out|
; [eval] M * N
; [eval] |out|
(assert (<= (* M@72@01 N@73@01) (Seq_length out@74@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { out[j], out[k] } 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> out[j] != out[k])
(declare-const j@77@01 Int)
(declare-const k@78@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> out[j] != out[k]
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 18 | !(0 <= j@77@01) | live]
; [else-branch: 18 | 0 <= j@77@01 | live]
(push) ; 4
; [then-branch: 18 | !(0 <= j@77@01)]
(assert (not (<= 0 j@77@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 18 | 0 <= j@77@01]
(assert (<= 0 j@77@01))
; [eval] j < M * N
; [eval] M * N
(push) ; 5
; [then-branch: 19 | !(j@77@01 < M@72@01 * N@73@01) | live]
; [else-branch: 19 | j@77@01 < M@72@01 * N@73@01 | live]
(push) ; 6
; [then-branch: 19 | !(j@77@01 < M@72@01 * N@73@01)]
(assert (not (< j@77@01 (* M@72@01 N@73@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 19 | j@77@01 < M@72@01 * N@73@01]
(assert (< j@77@01 (* M@72@01 N@73@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 20 | !(0 <= k@78@01) | live]
; [else-branch: 20 | 0 <= k@78@01 | live]
(push) ; 8
; [then-branch: 20 | !(0 <= k@78@01)]
(assert (not (<= 0 k@78@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 20 | 0 <= k@78@01]
(assert (<= 0 k@78@01))
; [eval] k < M * N
; [eval] M * N
(push) ; 9
; [then-branch: 21 | !(k@78@01 < M@72@01 * N@73@01) | live]
; [else-branch: 21 | k@78@01 < M@72@01 * N@73@01 | live]
(push) ; 10
; [then-branch: 21 | !(k@78@01 < M@72@01 * N@73@01)]
(assert (not (< k@78@01 (* M@72@01 N@73@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 21 | k@78@01 < M@72@01 * N@73@01]
(assert (< k@78@01 (* M@72@01 N@73@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@78@01 (* M@72@01 N@73@01)) (not (< k@78@01 (* M@72@01 N@73@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@78@01)
  (and
    (<= 0 k@78@01)
    (or (< k@78@01 (* M@72@01 N@73@01)) (not (< k@78@01 (* M@72@01 N@73@01)))))))
(assert (or (<= 0 k@78@01) (not (<= 0 k@78@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@77@01 (* M@72@01 N@73@01))
  (and
    (< j@77@01 (* M@72@01 N@73@01))
    (=>
      (<= 0 k@78@01)
      (and
        (<= 0 k@78@01)
        (or
          (< k@78@01 (* M@72@01 N@73@01))
          (not (< k@78@01 (* M@72@01 N@73@01))))))
    (or (<= 0 k@78@01) (not (<= 0 k@78@01))))))
(assert (or (< j@77@01 (* M@72@01 N@73@01)) (not (< j@77@01 (* M@72@01 N@73@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@77@01)
  (and
    (<= 0 j@77@01)
    (=>
      (< j@77@01 (* M@72@01 N@73@01))
      (and
        (< j@77@01 (* M@72@01 N@73@01))
        (=>
          (<= 0 k@78@01)
          (and
            (<= 0 k@78@01)
            (or
              (< k@78@01 (* M@72@01 N@73@01))
              (not (< k@78@01 (* M@72@01 N@73@01))))))
        (or (<= 0 k@78@01) (not (<= 0 k@78@01)))))
    (or (< j@77@01 (* M@72@01 N@73@01)) (not (< j@77@01 (* M@72@01 N@73@01)))))))
(assert (or (<= 0 j@77@01) (not (<= 0 j@77@01))))
(push) ; 3
; [then-branch: 22 | 0 <= j@77@01 && j@77@01 < M@72@01 * N@73@01 && 0 <= k@78@01 && k@78@01 < M@72@01 * N@73@01 && j@77@01 != k@78@01 | live]
; [else-branch: 22 | !(0 <= j@77@01 && j@77@01 < M@72@01 * N@73@01 && 0 <= k@78@01 && k@78@01 < M@72@01 * N@73@01 && j@77@01 != k@78@01) | live]
(push) ; 4
; [then-branch: 22 | 0 <= j@77@01 && j@77@01 < M@72@01 * N@73@01 && 0 <= k@78@01 && k@78@01 < M@72@01 * N@73@01 && j@77@01 != k@78@01]
(assert (and
  (<= 0 j@77@01)
  (and
    (< j@77@01 (* M@72@01 N@73@01))
    (and
      (<= 0 k@78@01)
      (and (< k@78@01 (* M@72@01 N@73@01)) (not (= j@77@01 k@78@01)))))))
; [eval] out[j] != out[k]
; [eval] out[j]
(push) ; 5
(assert (not (>= j@77@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@77@01 (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] out[k]
(push) ; 5
(assert (not (>= k@78@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@78@01 (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 22 | !(0 <= j@77@01 && j@77@01 < M@72@01 * N@73@01 && 0 <= k@78@01 && k@78@01 < M@72@01 * N@73@01 && j@77@01 != k@78@01)]
(assert (not
  (and
    (<= 0 j@77@01)
    (and
      (< j@77@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@78@01)
        (and (< k@78@01 (* M@72@01 N@73@01)) (not (= j@77@01 k@78@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@77@01)
    (and
      (< j@77@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@78@01)
        (and (< k@78@01 (* M@72@01 N@73@01)) (not (= j@77@01 k@78@01))))))
  (and
    (<= 0 j@77@01)
    (< j@77@01 (* M@72@01 N@73@01))
    (<= 0 k@78@01)
    (< k@78@01 (* M@72@01 N@73@01))
    (not (= j@77@01 k@78@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@77@01)
      (and
        (< j@77@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@78@01)
          (and (< k@78@01 (* M@72@01 N@73@01)) (not (= j@77@01 k@78@01)))))))
  (and
    (<= 0 j@77@01)
    (and
      (< j@77@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@78@01)
        (and (< k@78@01 (* M@72@01 N@73@01)) (not (= j@77@01 k@78@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@77@01 Int) (k@78@01 Int)) (!
  (and
    (=>
      (<= 0 j@77@01)
      (and
        (<= 0 j@77@01)
        (=>
          (< j@77@01 (* M@72@01 N@73@01))
          (and
            (< j@77@01 (* M@72@01 N@73@01))
            (=>
              (<= 0 k@78@01)
              (and
                (<= 0 k@78@01)
                (or
                  (< k@78@01 (* M@72@01 N@73@01))
                  (not (< k@78@01 (* M@72@01 N@73@01))))))
            (or (<= 0 k@78@01) (not (<= 0 k@78@01)))))
        (or
          (< j@77@01 (* M@72@01 N@73@01))
          (not (< j@77@01 (* M@72@01 N@73@01))))))
    (or (<= 0 j@77@01) (not (<= 0 j@77@01)))
    (=>
      (and
        (<= 0 j@77@01)
        (and
          (< j@77@01 (* M@72@01 N@73@01))
          (and
            (<= 0 k@78@01)
            (and (< k@78@01 (* M@72@01 N@73@01)) (not (= j@77@01 k@78@01))))))
      (and
        (<= 0 j@77@01)
        (< j@77@01 (* M@72@01 N@73@01))
        (<= 0 k@78@01)
        (< k@78@01 (* M@72@01 N@73@01))
        (not (= j@77@01 k@78@01))))
    (or
      (not
        (and
          (<= 0 j@77@01)
          (and
            (< j@77@01 (* M@72@01 N@73@01))
            (and
              (<= 0 k@78@01)
              (and (< k@78@01 (* M@72@01 N@73@01)) (not (= j@77@01 k@78@01)))))))
      (and
        (<= 0 j@77@01)
        (and
          (< j@77@01 (* M@72@01 N@73@01))
          (and
            (<= 0 k@78@01)
            (and (< k@78@01 (* M@72@01 N@73@01)) (not (= j@77@01 k@78@01))))))))
  :pattern ((Seq_index out@74@01 j@77@01) (Seq_index out@74@01 k@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@123@12@123@106-aux|)))
(assert (forall ((j@77@01 Int) (k@78@01 Int)) (!
  (=>
    (and
      (<= 0 j@77@01)
      (and
        (< j@77@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@78@01)
          (and (< k@78@01 (* M@72@01 N@73@01)) (not (= j@77@01 k@78@01))))))
    (not (= (Seq_index out@74@01 j@77@01) (Seq_index out@74@01 k@78@01))))
  :pattern ((Seq_index out@74@01 j@77@01) (Seq_index out@74@01 k@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@123@12@123@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))))
(declare-const j1@79@01 Int)
(push) ; 2
; [eval] 0 <= j1 && j1 < M * N
; [eval] 0 <= j1
(push) ; 3
; [then-branch: 23 | !(0 <= j1@79@01) | live]
; [else-branch: 23 | 0 <= j1@79@01 | live]
(push) ; 4
; [then-branch: 23 | !(0 <= j1@79@01)]
(assert (not (<= 0 j1@79@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 23 | 0 <= j1@79@01]
(assert (<= 0 j1@79@01))
; [eval] j1 < M * N
; [eval] M * N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@79@01) (not (<= 0 j1@79@01))))
(assert (and (<= 0 j1@79@01) (< j1@79@01 (* M@72@01 N@73@01))))
; [eval] out[j1]
(push) ; 3
(assert (not (>= j1@79@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j1@79@01 (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@80@01 ($Ref) Int)
(declare-fun img@81@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j1@79@01 Int)) (!
  (=>
    (and (<= 0 j1@79@01) (< j1@79@01 (* M@72@01 N@73@01)))
    (or (<= 0 j1@79@01) (not (<= 0 j1@79@01))))
  :pattern ((Seq_index out@74@01 j1@79@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j11@79@01 Int) (j12@79@01 Int)) (!
  (=>
    (and
      (and (<= 0 j11@79@01) (< j11@79@01 (* M@72@01 N@73@01)))
      (and (<= 0 j12@79@01) (< j12@79@01 (* M@72@01 N@73@01)))
      (= (Seq_index out@74@01 j11@79@01) (Seq_index out@74@01 j12@79@01)))
    (= j11@79@01 j12@79@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j1@79@01 Int)) (!
  (=>
    (and (<= 0 j1@79@01) (< j1@79@01 (* M@72@01 N@73@01)))
    (and
      (= (inv@80@01 (Seq_index out@74@01 j1@79@01)) j1@79@01)
      (img@81@01 (Seq_index out@74@01 j1@79@01))))
  :pattern ((Seq_index out@74@01 j1@79@01))
  :qid |quant-u-67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
    (= (Seq_index out@74@01 (inv@80@01 r)) r))
  :pattern ((inv@80@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j1@79@01 Int)) (!
  (=>
    (and (<= 0 j1@79@01) (< j1@79@01 (* M@72@01 N@73@01)))
    (not (= (Seq_index out@74@01 j1@79@01) $Ref.null)))
  :pattern ((Seq_index out@74@01 j1@79@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))
  $Snap.unit))
; [eval] N * M <= |inp|
; [eval] N * M
; [eval] |inp|
(assert (<= (* N@73@01 M@72@01) (Seq_length inp@75@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))
  $Snap.unit))
; [eval] (forall j: Int, k: Int :: { inp[j], inp[k] } 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> inp[j] != inp[k])
(declare-const j@82@01 Int)
(declare-const k@83@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> inp[j] != inp[k]
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 24 | !(0 <= j@82@01) | live]
; [else-branch: 24 | 0 <= j@82@01 | live]
(push) ; 4
; [then-branch: 24 | !(0 <= j@82@01)]
(assert (not (<= 0 j@82@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 24 | 0 <= j@82@01]
(assert (<= 0 j@82@01))
; [eval] j < M * N
; [eval] M * N
(push) ; 5
; [then-branch: 25 | !(j@82@01 < M@72@01 * N@73@01) | live]
; [else-branch: 25 | j@82@01 < M@72@01 * N@73@01 | live]
(push) ; 6
; [then-branch: 25 | !(j@82@01 < M@72@01 * N@73@01)]
(assert (not (< j@82@01 (* M@72@01 N@73@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 25 | j@82@01 < M@72@01 * N@73@01]
(assert (< j@82@01 (* M@72@01 N@73@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 26 | !(0 <= k@83@01) | live]
; [else-branch: 26 | 0 <= k@83@01 | live]
(push) ; 8
; [then-branch: 26 | !(0 <= k@83@01)]
(assert (not (<= 0 k@83@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 26 | 0 <= k@83@01]
(assert (<= 0 k@83@01))
; [eval] k < M * N
; [eval] M * N
(push) ; 9
; [then-branch: 27 | !(k@83@01 < M@72@01 * N@73@01) | live]
; [else-branch: 27 | k@83@01 < M@72@01 * N@73@01 | live]
(push) ; 10
; [then-branch: 27 | !(k@83@01 < M@72@01 * N@73@01)]
(assert (not (< k@83@01 (* M@72@01 N@73@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 27 | k@83@01 < M@72@01 * N@73@01]
(assert (< k@83@01 (* M@72@01 N@73@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@83@01 (* M@72@01 N@73@01)) (not (< k@83@01 (* M@72@01 N@73@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@83@01)
  (and
    (<= 0 k@83@01)
    (or (< k@83@01 (* M@72@01 N@73@01)) (not (< k@83@01 (* M@72@01 N@73@01)))))))
(assert (or (<= 0 k@83@01) (not (<= 0 k@83@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@82@01 (* M@72@01 N@73@01))
  (and
    (< j@82@01 (* M@72@01 N@73@01))
    (=>
      (<= 0 k@83@01)
      (and
        (<= 0 k@83@01)
        (or
          (< k@83@01 (* M@72@01 N@73@01))
          (not (< k@83@01 (* M@72@01 N@73@01))))))
    (or (<= 0 k@83@01) (not (<= 0 k@83@01))))))
(assert (or (< j@82@01 (* M@72@01 N@73@01)) (not (< j@82@01 (* M@72@01 N@73@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@82@01)
  (and
    (<= 0 j@82@01)
    (=>
      (< j@82@01 (* M@72@01 N@73@01))
      (and
        (< j@82@01 (* M@72@01 N@73@01))
        (=>
          (<= 0 k@83@01)
          (and
            (<= 0 k@83@01)
            (or
              (< k@83@01 (* M@72@01 N@73@01))
              (not (< k@83@01 (* M@72@01 N@73@01))))))
        (or (<= 0 k@83@01) (not (<= 0 k@83@01)))))
    (or (< j@82@01 (* M@72@01 N@73@01)) (not (< j@82@01 (* M@72@01 N@73@01)))))))
(assert (or (<= 0 j@82@01) (not (<= 0 j@82@01))))
(push) ; 3
; [then-branch: 28 | 0 <= j@82@01 && j@82@01 < M@72@01 * N@73@01 && 0 <= k@83@01 && k@83@01 < M@72@01 * N@73@01 && j@82@01 != k@83@01 | live]
; [else-branch: 28 | !(0 <= j@82@01 && j@82@01 < M@72@01 * N@73@01 && 0 <= k@83@01 && k@83@01 < M@72@01 * N@73@01 && j@82@01 != k@83@01) | live]
(push) ; 4
; [then-branch: 28 | 0 <= j@82@01 && j@82@01 < M@72@01 * N@73@01 && 0 <= k@83@01 && k@83@01 < M@72@01 * N@73@01 && j@82@01 != k@83@01]
(assert (and
  (<= 0 j@82@01)
  (and
    (< j@82@01 (* M@72@01 N@73@01))
    (and
      (<= 0 k@83@01)
      (and (< k@83@01 (* M@72@01 N@73@01)) (not (= j@82@01 k@83@01)))))))
; [eval] inp[j] != inp[k]
; [eval] inp[j]
(push) ; 5
(assert (not (>= j@82@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@82@01 (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] inp[k]
(push) ; 5
(assert (not (>= k@83@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@83@01 (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 28 | !(0 <= j@82@01 && j@82@01 < M@72@01 * N@73@01 && 0 <= k@83@01 && k@83@01 < M@72@01 * N@73@01 && j@82@01 != k@83@01)]
(assert (not
  (and
    (<= 0 j@82@01)
    (and
      (< j@82@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@83@01)
        (and (< k@83@01 (* M@72@01 N@73@01)) (not (= j@82@01 k@83@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@82@01)
    (and
      (< j@82@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@83@01)
        (and (< k@83@01 (* M@72@01 N@73@01)) (not (= j@82@01 k@83@01))))))
  (and
    (<= 0 j@82@01)
    (< j@82@01 (* M@72@01 N@73@01))
    (<= 0 k@83@01)
    (< k@83@01 (* M@72@01 N@73@01))
    (not (= j@82@01 k@83@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@82@01)
      (and
        (< j@82@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@83@01)
          (and (< k@83@01 (* M@72@01 N@73@01)) (not (= j@82@01 k@83@01)))))))
  (and
    (<= 0 j@82@01)
    (and
      (< j@82@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@83@01)
        (and (< k@83@01 (* M@72@01 N@73@01)) (not (= j@82@01 k@83@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@82@01 Int) (k@83@01 Int)) (!
  (and
    (=>
      (<= 0 j@82@01)
      (and
        (<= 0 j@82@01)
        (=>
          (< j@82@01 (* M@72@01 N@73@01))
          (and
            (< j@82@01 (* M@72@01 N@73@01))
            (=>
              (<= 0 k@83@01)
              (and
                (<= 0 k@83@01)
                (or
                  (< k@83@01 (* M@72@01 N@73@01))
                  (not (< k@83@01 (* M@72@01 N@73@01))))))
            (or (<= 0 k@83@01) (not (<= 0 k@83@01)))))
        (or
          (< j@82@01 (* M@72@01 N@73@01))
          (not (< j@82@01 (* M@72@01 N@73@01))))))
    (or (<= 0 j@82@01) (not (<= 0 j@82@01)))
    (=>
      (and
        (<= 0 j@82@01)
        (and
          (< j@82@01 (* M@72@01 N@73@01))
          (and
            (<= 0 k@83@01)
            (and (< k@83@01 (* M@72@01 N@73@01)) (not (= j@82@01 k@83@01))))))
      (and
        (<= 0 j@82@01)
        (< j@82@01 (* M@72@01 N@73@01))
        (<= 0 k@83@01)
        (< k@83@01 (* M@72@01 N@73@01))
        (not (= j@82@01 k@83@01))))
    (or
      (not
        (and
          (<= 0 j@82@01)
          (and
            (< j@82@01 (* M@72@01 N@73@01))
            (and
              (<= 0 k@83@01)
              (and (< k@83@01 (* M@72@01 N@73@01)) (not (= j@82@01 k@83@01)))))))
      (and
        (<= 0 j@82@01)
        (and
          (< j@82@01 (* M@72@01 N@73@01))
          (and
            (<= 0 k@83@01)
            (and (< k@83@01 (* M@72@01 N@73@01)) (not (= j@82@01 k@83@01))))))))
  :pattern ((Seq_index inp@75@01 j@82@01) (Seq_index inp@75@01 k@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@126@12@126@106-aux|)))
(assert (forall ((j@82@01 Int) (k@83@01 Int)) (!
  (=>
    (and
      (<= 0 j@82@01)
      (and
        (< j@82@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@83@01)
          (and (< k@83@01 (* M@72@01 N@73@01)) (not (= j@82@01 k@83@01))))))
    (not (= (Seq_index inp@75@01 j@82@01) (Seq_index inp@75@01 k@83@01))))
  :pattern ((Seq_index inp@75@01 j@82@01) (Seq_index inp@75@01 k@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@126@12@126@106|)))
(declare-const j1@84@01 Int)
(push) ; 2
; [eval] 0 <= j1 && j1 < N * M
; [eval] 0 <= j1
(push) ; 3
; [then-branch: 29 | !(0 <= j1@84@01) | live]
; [else-branch: 29 | 0 <= j1@84@01 | live]
(push) ; 4
; [then-branch: 29 | !(0 <= j1@84@01)]
(assert (not (<= 0 j1@84@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 29 | 0 <= j1@84@01]
(assert (<= 0 j1@84@01))
; [eval] j1 < N * M
; [eval] N * M
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@84@01) (not (<= 0 j1@84@01))))
(assert (and (<= 0 j1@84@01) (< j1@84@01 (* N@73@01 M@72@01))))
; [eval] inp[j1]
(push) ; 3
(assert (not (>= j1@84@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j1@84@01 (Seq_length inp@75@01))))
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
(assert (forall ((j1@84@01 Int)) (!
  (=>
    (and (<= 0 j1@84@01) (< j1@84@01 (* N@73@01 M@72@01)))
    (or (<= 0 j1@84@01) (not (<= 0 j1@84@01))))
  :pattern ((Seq_index inp@75@01 j1@84@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j11@84@01 Int) (j12@84@01 Int)) (!
  (=>
    (and
      (and (<= 0 j11@84@01) (< j11@84@01 (* N@73@01 M@72@01)))
      (and (<= 0 j12@84@01) (< j12@84@01 (* N@73@01 M@72@01)))
      (= (Seq_index inp@75@01 j11@84@01) (Seq_index inp@75@01 j12@84@01)))
    (= j11@84@01 j12@84@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j1@84@01 Int)) (!
  (=>
    (and (<= 0 j1@84@01) (< j1@84@01 (* N@73@01 M@72@01)))
    (and
      (= (inv@85@01 (Seq_index inp@75@01 j1@84@01)) j1@84@01)
      (img@86@01 (Seq_index inp@75@01 j1@84@01))))
  :pattern ((Seq_index inp@75@01 j1@84@01))
  :qid |quant-u-69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
    (= (Seq_index inp@75@01 (inv@85@01 r)) r))
  :pattern ((inv@85@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j1@84@01 Int)) (!
  (=>
    (and (<= 0 j1@84@01) (< j1@84@01 (* N@73@01 M@72@01)))
    (not (= (Seq_index inp@75@01 j1@84@01) $Ref.null)))
  :pattern ((Seq_index inp@75@01 j1@84@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index inp@75@01 j1@84@01) (Seq_index out@74@01 j1@79@01))
    (=
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))))
  
  :qid |quant-u-70|))))
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
(declare-const $t@87@01 $Snap)
(assert (= $t@87@01 ($Snap.combine ($Snap.first $t@87@01) ($Snap.second $t@87@01))))
(assert (= ($Snap.first $t@87@01) $Snap.unit))
; [eval] M > 0
(assert (=
  ($Snap.second $t@87@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@87@01))
    ($Snap.second ($Snap.second $t@87@01)))))
(assert (= ($Snap.first ($Snap.second $t@87@01)) $Snap.unit))
; [eval] N > 0
(assert (=
  ($Snap.second ($Snap.second $t@87@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@87@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@87@01))))))
(declare-const j1@88@01 Int)
(push) ; 3
; [eval] 0 <= j1 && j1 < M * N
; [eval] 0 <= j1
(push) ; 4
; [then-branch: 30 | !(0 <= j1@88@01) | live]
; [else-branch: 30 | 0 <= j1@88@01 | live]
(push) ; 5
; [then-branch: 30 | !(0 <= j1@88@01)]
(assert (not (<= 0 j1@88@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 30 | 0 <= j1@88@01]
(assert (<= 0 j1@88@01))
; [eval] j1 < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@88@01) (not (<= 0 j1@88@01))))
(assert (and (<= 0 j1@88@01) (< j1@88@01 (* M@72@01 N@73@01))))
; [eval] out[j1]
(push) ; 4
(assert (not (>= j1@88@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j1@88@01 (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@89@01 ($Ref) Int)
(declare-fun img@90@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j1@88@01 Int)) (!
  (=>
    (and (<= 0 j1@88@01) (< j1@88@01 (* M@72@01 N@73@01)))
    (or (<= 0 j1@88@01) (not (<= 0 j1@88@01))))
  :pattern ((Seq_index out@74@01 j1@88@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j11@88@01 Int) (j12@88@01 Int)) (!
  (=>
    (and
      (and (<= 0 j11@88@01) (< j11@88@01 (* M@72@01 N@73@01)))
      (and (<= 0 j12@88@01) (< j12@88@01 (* M@72@01 N@73@01)))
      (= (Seq_index out@74@01 j11@88@01) (Seq_index out@74@01 j12@88@01)))
    (= j11@88@01 j12@88@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j1@88@01 Int)) (!
  (=>
    (and (<= 0 j1@88@01) (< j1@88@01 (* M@72@01 N@73@01)))
    (and
      (= (inv@89@01 (Seq_index out@74@01 j1@88@01)) j1@88@01)
      (img@90@01 (Seq_index out@74@01 j1@88@01))))
  :pattern ((Seq_index out@74@01 j1@88@01))
  :qid |quant-u-72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@01 r)
      (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
    (= (Seq_index out@74@01 (inv@89@01 r)) r))
  :pattern ((inv@89@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j1@88@01 Int)) (!
  (=>
    (and (<= 0 j1@88@01) (< j1@88@01 (* M@72@01 N@73@01)))
    (not (= (Seq_index out@74@01 j1@88@01) $Ref.null)))
  :pattern ((Seq_index out@74@01 j1@88@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@87@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01)))))))
(declare-const j1@91@01 Int)
(push) ; 3
; [eval] 0 <= j1 && j1 < N * M
; [eval] 0 <= j1
(push) ; 4
; [then-branch: 31 | !(0 <= j1@91@01) | live]
; [else-branch: 31 | 0 <= j1@91@01 | live]
(push) ; 5
; [then-branch: 31 | !(0 <= j1@91@01)]
(assert (not (<= 0 j1@91@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 31 | 0 <= j1@91@01]
(assert (<= 0 j1@91@01))
; [eval] j1 < N * M
; [eval] N * M
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@91@01) (not (<= 0 j1@91@01))))
(assert (and (<= 0 j1@91@01) (< j1@91@01 (* N@73@01 M@72@01))))
; [eval] inp[j1]
(push) ; 4
(assert (not (>= j1@91@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j1@91@01 (Seq_length inp@75@01))))
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
(assert (forall ((j1@91@01 Int)) (!
  (=>
    (and (<= 0 j1@91@01) (< j1@91@01 (* N@73@01 M@72@01)))
    (or (<= 0 j1@91@01) (not (<= 0 j1@91@01))))
  :pattern ((Seq_index inp@75@01 j1@91@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j11@91@01 Int) (j12@91@01 Int)) (!
  (=>
    (and
      (and (<= 0 j11@91@01) (< j11@91@01 (* N@73@01 M@72@01)))
      (and (<= 0 j12@91@01) (< j12@91@01 (* N@73@01 M@72@01)))
      (= (Seq_index inp@75@01 j11@91@01) (Seq_index inp@75@01 j12@91@01)))
    (= j11@91@01 j12@91@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j1@91@01 Int)) (!
  (=>
    (and (<= 0 j1@91@01) (< j1@91@01 (* N@73@01 M@72@01)))
    (and
      (= (inv@92@01 (Seq_index inp@75@01 j1@91@01)) j1@91@01)
      (img@93@01 (Seq_index inp@75@01 j1@91@01))))
  :pattern ((Seq_index inp@75@01 j1@91@01))
  :qid |quant-u-74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
    (= (Seq_index inp@75@01 (inv@92@01 r)) r))
  :pattern ((inv@92@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j1@91@01 Int)) (!
  (=>
    (and (<= 0 j1@91@01) (< j1@91@01 (* N@73@01 M@72@01)))
    (not (= (Seq_index inp@75@01 j1@91@01) $Ref.null)))
  :pattern ((Seq_index inp@75@01 j1@91@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index inp@75@01 j1@91@01) (Seq_index out@74@01 j1@88@01))
    (=
      (and
        (img@93@01 r)
        (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
      (and
        (img@90@01 r)
        (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01)))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { out[Ref__multidim_index_2(M, N, i, j)] } { inp[Ref__multidim_index_2(N, M, j, i)] } 0 <= i && (i < M && (0 <= j && j < N)) ==> out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
(declare-const i@94@01 Int)
(declare-const j@95@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 32 | !(0 <= i@94@01) | live]
; [else-branch: 32 | 0 <= i@94@01 | live]
(push) ; 5
; [then-branch: 32 | !(0 <= i@94@01)]
(assert (not (<= 0 i@94@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 32 | 0 <= i@94@01]
(assert (<= 0 i@94@01))
; [eval] i < M
(push) ; 6
; [then-branch: 33 | !(i@94@01 < M@72@01) | live]
; [else-branch: 33 | i@94@01 < M@72@01 | live]
(push) ; 7
; [then-branch: 33 | !(i@94@01 < M@72@01)]
(assert (not (< i@94@01 M@72@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 33 | i@94@01 < M@72@01]
(assert (< i@94@01 M@72@01))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 34 | !(0 <= j@95@01) | live]
; [else-branch: 34 | 0 <= j@95@01 | live]
(push) ; 9
; [then-branch: 34 | !(0 <= j@95@01)]
(assert (not (<= 0 j@95@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 34 | 0 <= j@95@01]
(assert (<= 0 j@95@01))
; [eval] j < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@95@01) (not (<= 0 j@95@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@94@01 M@72@01)
  (and (< i@94@01 M@72@01) (or (<= 0 j@95@01) (not (<= 0 j@95@01))))))
(assert (or (< i@94@01 M@72@01) (not (< i@94@01 M@72@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@94@01)
  (and
    (<= 0 i@94@01)
    (=>
      (< i@94@01 M@72@01)
      (and (< i@94@01 M@72@01) (or (<= 0 j@95@01) (not (<= 0 j@95@01)))))
    (or (< i@94@01 M@72@01) (not (< i@94@01 M@72@01))))))
(assert (or (<= 0 i@94@01) (not (<= 0 i@94@01))))
(push) ; 4
; [then-branch: 35 | 0 <= i@94@01 && i@94@01 < M@72@01 && 0 <= j@95@01 && j@95@01 < N@73@01 | live]
; [else-branch: 35 | !(0 <= i@94@01 && i@94@01 < M@72@01 && 0 <= j@95@01 && j@95@01 < N@73@01) | live]
(push) ; 5
; [then-branch: 35 | 0 <= i@94@01 && i@94@01 < M@72@01 && 0 <= j@95@01 && j@95@01 < N@73@01]
(assert (and
  (<= 0 i@94@01)
  (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01)))))
; [eval] out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] out[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 M@72@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@72@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 N@73@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@73@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 M@72@01)
  (<= 0 N@73@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01)))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01)
  (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@96@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@01 r)
      (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@97@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@97@01  $FPM) r)
    (+
      (ite
        (and
          (img@90@01 r)
          (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@93@01 r)
          (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@97@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@97@01  $FPM) (Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01))
(pop) ; 6
; Joined path conditions
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)
  (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@90@01 r)
        (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@93@01 r)
        (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
    :qid |qp.fvfValDef4|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@90@01 (Seq_index
          inp@75@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)))
        (and
          (<=
            0
            (inv@89@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01))))
          (<
            (inv@89@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)))
            (* M@72@01 N@73@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@93@01 (Seq_index
          inp@75@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)))
        (and
          (<=
            0
            (inv@92@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01))))
          (<
            (inv@92@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)))
            (* N@73@01 M@72@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 35 | !(0 <= i@94@01 && i@94@01 < M@72@01 && 0 <= j@95@01 && j@95@01 < N@73@01)]
(assert (not
  (and
    (<= 0 i@94@01)
    (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@01 r)
      (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@97@01  $FPM) r)
    (+
      (ite
        (and
          (img@90@01 r)
          (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@93@01 r)
          (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@97@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (=>
  (and
    (<= 0 i@94@01)
    (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01))))
  (and
    (<= 0 i@94@01)
    (< i@94@01 M@72@01)
    (<= 0 j@95@01)
    (< j@95@01 N@73@01)
    (<= 0 M@72@01)
    (<= 0 N@73@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@94@01)
      (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01)))))
  (and
    (<= 0 i@94@01)
    (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@01 r)
      (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@97@01  $FPM) r)
    (+
      (ite
        (and
          (img@90@01 r)
          (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@93@01 r)
          (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@97@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@94@01 Int) (j@95@01 Int)) (!
  (and
    (=>
      (<= 0 i@94@01)
      (and
        (<= 0 i@94@01)
        (=>
          (< i@94@01 M@72@01)
          (and (< i@94@01 M@72@01) (or (<= 0 j@95@01) (not (<= 0 j@95@01)))))
        (or (< i@94@01 M@72@01) (not (< i@94@01 M@72@01)))))
    (or (<= 0 i@94@01) (not (<= 0 i@94@01)))
    (=>
      (and
        (<= 0 i@94@01)
        (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01))))
      (and
        (<= 0 i@94@01)
        (< i@94@01 M@72@01)
        (<= 0 j@95@01)
        (< j@95@01 N@73@01)
        (<= 0 M@72@01)
        (<= 0 N@73@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)))
    (or
      (not
        (and
          (<= 0 i@94@01)
          (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01)))))
      (and
        (<= 0 i@94@01)
        (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01))))))
  :pattern ((Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@131@12@131@204-aux|)))
(assert (forall ((i@94@01 Int) (j@95@01 Int)) (!
  (and
    (=>
      (<= 0 i@94@01)
      (and
        (<= 0 i@94@01)
        (=>
          (< i@94@01 M@72@01)
          (and (< i@94@01 M@72@01) (or (<= 0 j@95@01) (not (<= 0 j@95@01)))))
        (or (< i@94@01 M@72@01) (not (< i@94@01 M@72@01)))))
    (or (<= 0 i@94@01) (not (<= 0 i@94@01)))
    (=>
      (and
        (<= 0 i@94@01)
        (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01))))
      (and
        (<= 0 i@94@01)
        (< i@94@01 M@72@01)
        (<= 0 j@95@01)
        (< j@95@01 N@73@01)
        (<= 0 M@72@01)
        (<= 0 N@73@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)))
    (or
      (not
        (and
          (<= 0 i@94@01)
          (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01)))))
      (and
        (<= 0 i@94@01)
        (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01))))))
  :pattern ((Seq_index
    inp@75@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@131@12@131@204-aux|)))
(assert (forall ((i@94@01 Int) (j@95@01 Int)) (!
  (=>
    (and
      (<= 0 i@94@01)
      (and (< i@94@01 M@72@01) (and (<= 0 j@95@01) (< j@95@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) (Seq_index
        out@74@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)))))
  :pattern ((Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@94@01 j@95@01)))
  :pattern ((Seq_index
    inp@75@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@95@01 i@94@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@131@12@131@204|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01)))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { old(Ref__multidim_index_2(N, M, j, i)) } { old(inp[Ref__multidim_index_2(N, M, j, i)]) } 0 <= i && (i < M && (0 <= j && j < N)) ==> inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value == old(inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value))
(declare-const i@98@01 Int)
(declare-const j@99@01 Int)
(push) ; 3
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value == old(inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 36 | !(0 <= i@98@01) | live]
; [else-branch: 36 | 0 <= i@98@01 | live]
(push) ; 5
; [then-branch: 36 | !(0 <= i@98@01)]
(assert (not (<= 0 i@98@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | 0 <= i@98@01]
(assert (<= 0 i@98@01))
; [eval] i < M
(push) ; 6
; [then-branch: 37 | !(i@98@01 < M@72@01) | live]
; [else-branch: 37 | i@98@01 < M@72@01 | live]
(push) ; 7
; [then-branch: 37 | !(i@98@01 < M@72@01)]
(assert (not (< i@98@01 M@72@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 37 | i@98@01 < M@72@01]
(assert (< i@98@01 M@72@01))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 38 | !(0 <= j@99@01) | live]
; [else-branch: 38 | 0 <= j@99@01 | live]
(push) ; 9
; [then-branch: 38 | !(0 <= j@99@01)]
(assert (not (<= 0 j@99@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 38 | 0 <= j@99@01]
(assert (<= 0 j@99@01))
; [eval] j < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@99@01) (not (<= 0 j@99@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@98@01 M@72@01)
  (and (< i@98@01 M@72@01) (or (<= 0 j@99@01) (not (<= 0 j@99@01))))))
(assert (or (< i@98@01 M@72@01) (not (< i@98@01 M@72@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@98@01)
  (and
    (<= 0 i@98@01)
    (=>
      (< i@98@01 M@72@01)
      (and (< i@98@01 M@72@01) (or (<= 0 j@99@01) (not (<= 0 j@99@01)))))
    (or (< i@98@01 M@72@01) (not (< i@98@01 M@72@01))))))
(assert (or (<= 0 i@98@01) (not (<= 0 i@98@01))))
(push) ; 4
; [then-branch: 39 | 0 <= i@98@01 && i@98@01 < M@72@01 && 0 <= j@99@01 && j@99@01 < N@73@01 | live]
; [else-branch: 39 | !(0 <= i@98@01 && i@98@01 < M@72@01 && 0 <= j@99@01 && j@99@01 < N@73@01) | live]
(push) ; 5
; [then-branch: 39 | 0 <= i@98@01 && i@98@01 < M@72@01 && 0 <= j@99@01 && j@99@01 < N@73@01]
(assert (and
  (<= 0 i@98@01)
  (and (< i@98@01 M@72@01) (and (<= 0 j@99@01) (< j@99@01 N@73@01)))))
; [eval] inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value == old(inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 N@73@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@73@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 M@72@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@72@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 N@73@01)
  (<= 0 M@72@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)
  (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@90@01 r)
        (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@93@01 r)
        (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
    :qid |qp.fvfValDef4|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@90@01 (Seq_index
          inp@75@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)))
        (and
          (<=
            0
            (inv@89@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01))))
          (<
            (inv@89@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)))
            (* M@72@01 N@73@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@93@01 (Seq_index
          inp@75@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)))
        (and
          (<=
            0
            (inv@92@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01))))
          (<
            (inv@92@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)))
            (* N@73@01 M@72@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)
  (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@100@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef7|)))
(declare-const pm@101@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r)
    (+
      (ite
        (and
          (img@81@01 r)
          (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) (Seq_index
    inp@75@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 39 | !(0 <= i@98@01 && i@98@01 < M@72@01 && 0 <= j@99@01 && j@99@01 < N@73@01)]
(assert (not
  (and
    (<= 0 i@98@01)
    (and (< i@98@01 M@72@01) (and (<= 0 j@99@01) (< j@99@01 N@73@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@01 r)
      (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r)
    (+
      (ite
        (and
          (img@81@01 r)
          (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (=>
  (and
    (<= 0 i@98@01)
    (and (< i@98@01 M@72@01) (and (<= 0 j@99@01) (< j@99@01 N@73@01))))
  (and
    (<= 0 i@98@01)
    (< i@98@01 M@72@01)
    (<= 0 j@99@01)
    (< j@99@01 N@73@01)
    (<= 0 N@73@01)
    (<= 0 M@72@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@98@01)
      (and (< i@98@01 M@72@01) (and (<= 0 j@99@01) (< j@99@01 N@73@01)))))
  (and
    (<= 0 i@98@01)
    (and (< i@98@01 M@72@01) (and (<= 0 j@99@01) (< j@99@01 N@73@01))))))
; [eval] old(Ref__multidim_index_2(N, M, j, i))
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 4
; [eval] 0 <= i0
(push) ; 5
(assert (not (<= 0 j@99@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-76|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r) $Perm.Write)
  :pattern ((inv@80@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r) $Perm.Write)
  :pattern ((inv@85@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 j@99@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-77|))))
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
(assert (not (<= 0 j@99@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-78|))))
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
(assert (not (<= 0 j@99@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; [eval] old(inp[Ref__multidim_index_2(N, M, j, i)])
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 4
; [eval] 0 <= i0
(push) ; 5
(assert (not (<= 0 j@99@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r) $Perm.Write)
  :pattern ((inv@80@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r) $Perm.Write)
  :pattern ((inv@85@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 j@99@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-80|))))
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
(assert (not (<= 0 j@99@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-81|))))
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
(assert (not (<= 0 j@99@01)))
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
      (img@90@01 r)
      (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@87@01)))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r)
    (+
      (ite
        (and
          (img@81@01 r)
          (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (and
    (=>
      (<= 0 i@98@01)
      (and
        (<= 0 i@98@01)
        (=>
          (< i@98@01 M@72@01)
          (and (< i@98@01 M@72@01) (or (<= 0 j@99@01) (not (<= 0 j@99@01)))))
        (or (< i@98@01 M@72@01) (not (< i@98@01 M@72@01)))))
    (or (<= 0 i@98@01) (not (<= 0 i@98@01)))
    (=>
      (and
        (<= 0 i@98@01)
        (and (< i@98@01 M@72@01) (and (<= 0 j@99@01) (< j@99@01 N@73@01))))
      (and
        (<= 0 i@98@01)
        (< i@98@01 M@72@01)
        (<= 0 j@99@01)
        (< j@99@01 N@73@01)
        (<= 0 N@73@01)
        (<= 0 M@72@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)))
    (or
      (not
        (and
          (<= 0 i@98@01)
          (and (< i@98@01 M@72@01) (and (<= 0 j@99@01) (< j@99@01 N@73@01)))))
      (and
        (<= 0 i@98@01)
        (and (< i@98@01 M@72@01) (and (<= 0 j@99@01) (< j@99@01 N@73@01))))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@132@12@132@209-aux|)))
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (=>
    (and
      (<= 0 i@98@01)
      (and (< i@98@01 M@72@01) (and (<= 0 j@99@01) (< j@99@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@96@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@100@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@99@01 i@98@01)))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@132@12@132@209|)))
(pop) ; 2
(push) ; 2
; [exec]
; Ref__loop_main_68(diz, current_thread_id, N, M, inp, out)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] M * N <= |out|
; [eval] M * N
; [eval] |out|
; [eval] (forall j: Int, k: Int :: { out[j], out[k] } 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> out[j] != out[k])
(declare-const j@102@01 Int)
(declare-const k@103@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> out[j] != out[k]
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 40 | !(0 <= j@102@01) | live]
; [else-branch: 40 | 0 <= j@102@01 | live]
(push) ; 5
; [then-branch: 40 | !(0 <= j@102@01)]
(assert (not (<= 0 j@102@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 40 | 0 <= j@102@01]
(assert (<= 0 j@102@01))
; [eval] j < M * N
; [eval] M * N
(push) ; 6
; [then-branch: 41 | !(j@102@01 < M@72@01 * N@73@01) | live]
; [else-branch: 41 | j@102@01 < M@72@01 * N@73@01 | live]
(push) ; 7
; [then-branch: 41 | !(j@102@01 < M@72@01 * N@73@01)]
(assert (not (< j@102@01 (* M@72@01 N@73@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 41 | j@102@01 < M@72@01 * N@73@01]
(assert (< j@102@01 (* M@72@01 N@73@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 42 | !(0 <= k@103@01) | live]
; [else-branch: 42 | 0 <= k@103@01 | live]
(push) ; 9
; [then-branch: 42 | !(0 <= k@103@01)]
(assert (not (<= 0 k@103@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 42 | 0 <= k@103@01]
(assert (<= 0 k@103@01))
; [eval] k < M * N
; [eval] M * N
(push) ; 10
; [then-branch: 43 | !(k@103@01 < M@72@01 * N@73@01) | live]
; [else-branch: 43 | k@103@01 < M@72@01 * N@73@01 | live]
(push) ; 11
; [then-branch: 43 | !(k@103@01 < M@72@01 * N@73@01)]
(assert (not (< k@103@01 (* M@72@01 N@73@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 43 | k@103@01 < M@72@01 * N@73@01]
(assert (< k@103@01 (* M@72@01 N@73@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@103@01 (* M@72@01 N@73@01)) (not (< k@103@01 (* M@72@01 N@73@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@103@01)
  (and
    (<= 0 k@103@01)
    (or (< k@103@01 (* M@72@01 N@73@01)) (not (< k@103@01 (* M@72@01 N@73@01)))))))
(assert (or (<= 0 k@103@01) (not (<= 0 k@103@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@102@01 (* M@72@01 N@73@01))
  (and
    (< j@102@01 (* M@72@01 N@73@01))
    (=>
      (<= 0 k@103@01)
      (and
        (<= 0 k@103@01)
        (or
          (< k@103@01 (* M@72@01 N@73@01))
          (not (< k@103@01 (* M@72@01 N@73@01))))))
    (or (<= 0 k@103@01) (not (<= 0 k@103@01))))))
(assert (or (< j@102@01 (* M@72@01 N@73@01)) (not (< j@102@01 (* M@72@01 N@73@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@102@01)
  (and
    (<= 0 j@102@01)
    (=>
      (< j@102@01 (* M@72@01 N@73@01))
      (and
        (< j@102@01 (* M@72@01 N@73@01))
        (=>
          (<= 0 k@103@01)
          (and
            (<= 0 k@103@01)
            (or
              (< k@103@01 (* M@72@01 N@73@01))
              (not (< k@103@01 (* M@72@01 N@73@01))))))
        (or (<= 0 k@103@01) (not (<= 0 k@103@01)))))
    (or (< j@102@01 (* M@72@01 N@73@01)) (not (< j@102@01 (* M@72@01 N@73@01)))))))
(assert (or (<= 0 j@102@01) (not (<= 0 j@102@01))))
(push) ; 4
; [then-branch: 44 | 0 <= j@102@01 && j@102@01 < M@72@01 * N@73@01 && 0 <= k@103@01 && k@103@01 < M@72@01 * N@73@01 && j@102@01 != k@103@01 | live]
; [else-branch: 44 | !(0 <= j@102@01 && j@102@01 < M@72@01 * N@73@01 && 0 <= k@103@01 && k@103@01 < M@72@01 * N@73@01 && j@102@01 != k@103@01) | live]
(push) ; 5
; [then-branch: 44 | 0 <= j@102@01 && j@102@01 < M@72@01 * N@73@01 && 0 <= k@103@01 && k@103@01 < M@72@01 * N@73@01 && j@102@01 != k@103@01]
(assert (and
  (<= 0 j@102@01)
  (and
    (< j@102@01 (* M@72@01 N@73@01))
    (and
      (<= 0 k@103@01)
      (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01)))))))
; [eval] out[j] != out[k]
; [eval] out[j]
(push) ; 6
(assert (not (>= j@102@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@102@01 (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] out[k]
(push) ; 6
(assert (not (>= k@103@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@103@01 (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 44 | !(0 <= j@102@01 && j@102@01 < M@72@01 * N@73@01 && 0 <= k@103@01 && k@103@01 < M@72@01 * N@73@01 && j@102@01 != k@103@01)]
(assert (not
  (and
    (<= 0 j@102@01)
    (and
      (< j@102@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@103@01)
        (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@102@01)
    (and
      (< j@102@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@103@01)
        (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01))))))
  (and
    (<= 0 j@102@01)
    (< j@102@01 (* M@72@01 N@73@01))
    (<= 0 k@103@01)
    (< k@103@01 (* M@72@01 N@73@01))
    (not (= j@102@01 k@103@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@102@01)
      (and
        (< j@102@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@103@01)
          (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01)))))))
  (and
    (<= 0 j@102@01)
    (and
      (< j@102@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@103@01)
        (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@102@01 Int) (k@103@01 Int)) (!
  (and
    (=>
      (<= 0 j@102@01)
      (and
        (<= 0 j@102@01)
        (=>
          (< j@102@01 (* M@72@01 N@73@01))
          (and
            (< j@102@01 (* M@72@01 N@73@01))
            (=>
              (<= 0 k@103@01)
              (and
                (<= 0 k@103@01)
                (or
                  (< k@103@01 (* M@72@01 N@73@01))
                  (not (< k@103@01 (* M@72@01 N@73@01))))))
            (or (<= 0 k@103@01) (not (<= 0 k@103@01)))))
        (or
          (< j@102@01 (* M@72@01 N@73@01))
          (not (< j@102@01 (* M@72@01 N@73@01))))))
    (or (<= 0 j@102@01) (not (<= 0 j@102@01)))
    (=>
      (and
        (<= 0 j@102@01)
        (and
          (< j@102@01 (* M@72@01 N@73@01))
          (and
            (<= 0 k@103@01)
            (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01))))))
      (and
        (<= 0 j@102@01)
        (< j@102@01 (* M@72@01 N@73@01))
        (<= 0 k@103@01)
        (< k@103@01 (* M@72@01 N@73@01))
        (not (= j@102@01 k@103@01))))
    (or
      (not
        (and
          (<= 0 j@102@01)
          (and
            (< j@102@01 (* M@72@01 N@73@01))
            (and
              (<= 0 k@103@01)
              (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01)))))))
      (and
        (<= 0 j@102@01)
        (and
          (< j@102@01 (* M@72@01 N@73@01))
          (and
            (<= 0 k@103@01)
            (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01))))))))
  :pattern ((Seq_index out@74@01 j@102@01) (Seq_index out@74@01 k@103@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@76@12@76@106-aux|)))
(push) ; 3
(assert (not (forall ((j@102@01 Int) (k@103@01 Int)) (!
  (=>
    (and
      (<= 0 j@102@01)
      (and
        (< j@102@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@103@01)
          (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01))))))
    (not (= (Seq_index out@74@01 j@102@01) (Seq_index out@74@01 k@103@01))))
  :pattern ((Seq_index out@74@01 j@102@01) (Seq_index out@74@01 k@103@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@76@12@76@106|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@102@01 Int) (k@103@01 Int)) (!
  (=>
    (and
      (<= 0 j@102@01)
      (and
        (< j@102@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@103@01)
          (and (< k@103@01 (* M@72@01 N@73@01)) (not (= j@102@01 k@103@01))))))
    (not (= (Seq_index out@74@01 j@102@01) (Seq_index out@74@01 k@103@01))))
  :pattern ((Seq_index out@74@01 j@102@01) (Seq_index out@74@01 k@103@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@76@12@76@106|)))
(declare-const j@104@01 Int)
(push) ; 3
; [eval] 0 <= j && j < M * N
; [eval] 0 <= j
(push) ; 4
; [then-branch: 45 | !(0 <= j@104@01) | live]
; [else-branch: 45 | 0 <= j@104@01 | live]
(push) ; 5
; [then-branch: 45 | !(0 <= j@104@01)]
(assert (not (<= 0 j@104@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 45 | 0 <= j@104@01]
(assert (<= 0 j@104@01))
; [eval] j < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@104@01) (not (<= 0 j@104@01))))
(assert (and (<= 0 j@104@01) (< j@104@01 (* M@72@01 N@73@01))))
; [eval] out[j]
(push) ; 4
(assert (not (>= j@104@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@104@01 (Seq_length out@74@01))))
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
(assert (forall ((j@104@01 Int)) (!
  (=>
    (and (<= 0 j@104@01) (< j@104@01 (* M@72@01 N@73@01)))
    (or (<= 0 j@104@01) (not (<= 0 j@104@01))))
  :pattern ((Seq_index out@74@01 j@104@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@104@01 Int) (j2@104@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@104@01) (< j1@104@01 (* M@72@01 N@73@01)))
      (and (<= 0 j2@104@01) (< j2@104@01 (* M@72@01 N@73@01)))
      (= (Seq_index out@74@01 j1@104@01) (Seq_index out@74@01 j2@104@01)))
    (= j1@104@01 j2@104@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@104@01 Int)) (!
  (=>
    (and (<= 0 j@104@01) (< j@104@01 (* M@72@01 N@73@01)))
    (and
      (= (inv@105@01 (Seq_index out@74@01 j@104@01)) j@104@01)
      (img@106@01 (Seq_index out@74@01 j@104@01))))
  :pattern ((Seq_index out@74@01 j@104@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@106@01 r)
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (* M@72@01 N@73@01))))
    (= (Seq_index out@74@01 (inv@105@01 r)) r))
  :pattern ((inv@105@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((j@104@01 Int)) (!
  (= (Seq_index out@74@01 j@104@01) (Seq_index inp@75@01 j@104@01))
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@107@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (* M@72@01 N@73@01)))
      (img@106@01 r)
      (= r (Seq_index out@74@01 (inv@105@01 r))))
    ($Perm.min
      (ite
        (and
          (img@81@01 r)
          (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@108@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (* M@72@01 N@73@01)))
      (img@106@01 r)
      (= r (Seq_index out@74@01 (inv@105@01 r))))
    ($Perm.min
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@107@01 r)))
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
          (img@81@01 r)
          (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@107@01 r))
    $Perm.No)
  
  :qid |quant-u-85|))))
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
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (* M@72@01 N@73@01)))
      (img@106@01 r)
      (= r (Seq_index out@74@01 (inv@105@01 r))))
    (= (- $Perm.Write (pTaken@107@01 r)) $Perm.No))
  
  :qid |quant-u-86|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@109@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef10|)))
; [eval] N * M <= |inp|
; [eval] N * M
; [eval] |inp|
; [eval] (forall j: Int, k: Int :: { inp[j], inp[k] } 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> inp[j] != inp[k])
(declare-const j@110@01 Int)
(declare-const k@111@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k))) ==> inp[j] != inp[k]
; [eval] 0 <= j && (j < M * N && (0 <= k && (k < M * N && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 46 | !(0 <= j@110@01) | live]
; [else-branch: 46 | 0 <= j@110@01 | live]
(push) ; 5
; [then-branch: 46 | !(0 <= j@110@01)]
(assert (not (<= 0 j@110@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 46 | 0 <= j@110@01]
(assert (<= 0 j@110@01))
; [eval] j < M * N
; [eval] M * N
(push) ; 6
; [then-branch: 47 | !(j@110@01 < M@72@01 * N@73@01) | live]
; [else-branch: 47 | j@110@01 < M@72@01 * N@73@01 | live]
(push) ; 7
; [then-branch: 47 | !(j@110@01 < M@72@01 * N@73@01)]
(assert (not (< j@110@01 (* M@72@01 N@73@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 47 | j@110@01 < M@72@01 * N@73@01]
(assert (< j@110@01 (* M@72@01 N@73@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 48 | !(0 <= k@111@01) | live]
; [else-branch: 48 | 0 <= k@111@01 | live]
(push) ; 9
; [then-branch: 48 | !(0 <= k@111@01)]
(assert (not (<= 0 k@111@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 48 | 0 <= k@111@01]
(assert (<= 0 k@111@01))
; [eval] k < M * N
; [eval] M * N
(push) ; 10
; [then-branch: 49 | !(k@111@01 < M@72@01 * N@73@01) | live]
; [else-branch: 49 | k@111@01 < M@72@01 * N@73@01 | live]
(push) ; 11
; [then-branch: 49 | !(k@111@01 < M@72@01 * N@73@01)]
(assert (not (< k@111@01 (* M@72@01 N@73@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 49 | k@111@01 < M@72@01 * N@73@01]
(assert (< k@111@01 (* M@72@01 N@73@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@111@01 (* M@72@01 N@73@01)) (not (< k@111@01 (* M@72@01 N@73@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@111@01)
  (and
    (<= 0 k@111@01)
    (or (< k@111@01 (* M@72@01 N@73@01)) (not (< k@111@01 (* M@72@01 N@73@01)))))))
(assert (or (<= 0 k@111@01) (not (<= 0 k@111@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@110@01 (* M@72@01 N@73@01))
  (and
    (< j@110@01 (* M@72@01 N@73@01))
    (=>
      (<= 0 k@111@01)
      (and
        (<= 0 k@111@01)
        (or
          (< k@111@01 (* M@72@01 N@73@01))
          (not (< k@111@01 (* M@72@01 N@73@01))))))
    (or (<= 0 k@111@01) (not (<= 0 k@111@01))))))
(assert (or (< j@110@01 (* M@72@01 N@73@01)) (not (< j@110@01 (* M@72@01 N@73@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@110@01)
  (and
    (<= 0 j@110@01)
    (=>
      (< j@110@01 (* M@72@01 N@73@01))
      (and
        (< j@110@01 (* M@72@01 N@73@01))
        (=>
          (<= 0 k@111@01)
          (and
            (<= 0 k@111@01)
            (or
              (< k@111@01 (* M@72@01 N@73@01))
              (not (< k@111@01 (* M@72@01 N@73@01))))))
        (or (<= 0 k@111@01) (not (<= 0 k@111@01)))))
    (or (< j@110@01 (* M@72@01 N@73@01)) (not (< j@110@01 (* M@72@01 N@73@01)))))))
(assert (or (<= 0 j@110@01) (not (<= 0 j@110@01))))
(push) ; 4
; [then-branch: 50 | 0 <= j@110@01 && j@110@01 < M@72@01 * N@73@01 && 0 <= k@111@01 && k@111@01 < M@72@01 * N@73@01 && j@110@01 != k@111@01 | live]
; [else-branch: 50 | !(0 <= j@110@01 && j@110@01 < M@72@01 * N@73@01 && 0 <= k@111@01 && k@111@01 < M@72@01 * N@73@01 && j@110@01 != k@111@01) | live]
(push) ; 5
; [then-branch: 50 | 0 <= j@110@01 && j@110@01 < M@72@01 * N@73@01 && 0 <= k@111@01 && k@111@01 < M@72@01 * N@73@01 && j@110@01 != k@111@01]
(assert (and
  (<= 0 j@110@01)
  (and
    (< j@110@01 (* M@72@01 N@73@01))
    (and
      (<= 0 k@111@01)
      (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01)))))))
; [eval] inp[j] != inp[k]
; [eval] inp[j]
(push) ; 6
(assert (not (>= j@110@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@110@01 (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] inp[k]
(push) ; 6
(assert (not (>= k@111@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@111@01 (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 50 | !(0 <= j@110@01 && j@110@01 < M@72@01 * N@73@01 && 0 <= k@111@01 && k@111@01 < M@72@01 * N@73@01 && j@110@01 != k@111@01)]
(assert (not
  (and
    (<= 0 j@110@01)
    (and
      (< j@110@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@111@01)
        (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@110@01)
    (and
      (< j@110@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@111@01)
        (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01))))))
  (and
    (<= 0 j@110@01)
    (< j@110@01 (* M@72@01 N@73@01))
    (<= 0 k@111@01)
    (< k@111@01 (* M@72@01 N@73@01))
    (not (= j@110@01 k@111@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@110@01)
      (and
        (< j@110@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@111@01)
          (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01)))))))
  (and
    (<= 0 j@110@01)
    (and
      (< j@110@01 (* M@72@01 N@73@01))
      (and
        (<= 0 k@111@01)
        (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@110@01 Int) (k@111@01 Int)) (!
  (and
    (=>
      (<= 0 j@110@01)
      (and
        (<= 0 j@110@01)
        (=>
          (< j@110@01 (* M@72@01 N@73@01))
          (and
            (< j@110@01 (* M@72@01 N@73@01))
            (=>
              (<= 0 k@111@01)
              (and
                (<= 0 k@111@01)
                (or
                  (< k@111@01 (* M@72@01 N@73@01))
                  (not (< k@111@01 (* M@72@01 N@73@01))))))
            (or (<= 0 k@111@01) (not (<= 0 k@111@01)))))
        (or
          (< j@110@01 (* M@72@01 N@73@01))
          (not (< j@110@01 (* M@72@01 N@73@01))))))
    (or (<= 0 j@110@01) (not (<= 0 j@110@01)))
    (=>
      (and
        (<= 0 j@110@01)
        (and
          (< j@110@01 (* M@72@01 N@73@01))
          (and
            (<= 0 k@111@01)
            (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01))))))
      (and
        (<= 0 j@110@01)
        (< j@110@01 (* M@72@01 N@73@01))
        (<= 0 k@111@01)
        (< k@111@01 (* M@72@01 N@73@01))
        (not (= j@110@01 k@111@01))))
    (or
      (not
        (and
          (<= 0 j@110@01)
          (and
            (< j@110@01 (* M@72@01 N@73@01))
            (and
              (<= 0 k@111@01)
              (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01)))))))
      (and
        (<= 0 j@110@01)
        (and
          (< j@110@01 (* M@72@01 N@73@01))
          (and
            (<= 0 k@111@01)
            (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01))))))))
  :pattern ((Seq_index inp@75@01 j@110@01) (Seq_index inp@75@01 k@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@79@12@79@106-aux|)))
(push) ; 3
(assert (not (forall ((j@110@01 Int) (k@111@01 Int)) (!
  (=>
    (and
      (<= 0 j@110@01)
      (and
        (< j@110@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@111@01)
          (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01))))))
    (not (= (Seq_index inp@75@01 j@110@01) (Seq_index inp@75@01 k@111@01))))
  :pattern ((Seq_index inp@75@01 j@110@01) (Seq_index inp@75@01 k@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@79@12@79@106|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@110@01 Int) (k@111@01 Int)) (!
  (=>
    (and
      (<= 0 j@110@01)
      (and
        (< j@110@01 (* M@72@01 N@73@01))
        (and
          (<= 0 k@111@01)
          (and (< k@111@01 (* M@72@01 N@73@01)) (not (= j@110@01 k@111@01))))))
    (not (= (Seq_index inp@75@01 j@110@01) (Seq_index inp@75@01 k@111@01))))
  :pattern ((Seq_index inp@75@01 j@110@01) (Seq_index inp@75@01 k@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@79@12@79@106|)))
(declare-const i@112@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N * M
; [eval] 0 <= i
(push) ; 4
; [then-branch: 51 | !(0 <= i@112@01) | live]
; [else-branch: 51 | 0 <= i@112@01 | live]
(push) ; 5
; [then-branch: 51 | !(0 <= i@112@01)]
(assert (not (<= 0 i@112@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 51 | 0 <= i@112@01]
(assert (<= 0 i@112@01))
; [eval] i < N * M
; [eval] N * M
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@112@01) (not (<= 0 i@112@01))))
(assert (and (<= 0 i@112@01) (< i@112@01 (* N@73@01 M@72@01))))
; [eval] inp[i]
(push) ; 4
(assert (not (>= i@112@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@112@01 (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@113@01 ($Ref) Int)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@112@01 Int)) (!
  (=>
    (and (<= 0 i@112@01) (< i@112@01 (* N@73@01 M@72@01)))
    (or (<= 0 i@112@01) (not (<= 0 i@112@01))))
  :pattern ((Seq_index inp@75@01 i@112@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@112@01 Int) (i2@112@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@112@01) (< i1@112@01 (* N@73@01 M@72@01)))
      (and (<= 0 i2@112@01) (< i2@112@01 (* N@73@01 M@72@01)))
      (= (Seq_index inp@75@01 i1@112@01) (Seq_index inp@75@01 i2@112@01)))
    (= i1@112@01 i2@112@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@112@01 Int)) (!
  (=>
    (and (<= 0 i@112@01) (< i@112@01 (* N@73@01 M@72@01)))
    (and
      (= (inv@113@01 (Seq_index inp@75@01 i@112@01)) i@112@01)
      (img@114@01 (Seq_index inp@75@01 i@112@01))))
  :pattern ((Seq_index inp@75@01 i@112@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) (* N@73@01 M@72@01))))
    (= (Seq_index inp@75@01 (inv@113@01 r)) r))
  :pattern ((inv@113@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) (* N@73@01 M@72@01)))
      (img@114@01 r)
      (= r (Seq_index inp@75@01 (inv@113@01 r))))
    ($Perm.min
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
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
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@115@01 r))
    $Perm.No)
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@115@01 r) $Perm.No)
  
  :qid |quant-u-90|))))
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
      (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) (* N@73@01 M@72@01)))
      (img@114@01 r)
      (= r (Seq_index inp@75@01 (inv@113@01 r))))
    (= (- (/ (to_real 1) (to_real 4)) (pTaken@115@01 r)) $Perm.No))
  
  :qid |quant-u-91|))))
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
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef11|)))
(declare-const $t@117@01 $Snap)
(assert (= $t@117@01 ($Snap.combine ($Snap.first $t@117@01) ($Snap.second $t@117@01))))
(declare-const j@118@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && j < M * N
; [eval] 0 <= j
(push) ; 4
; [then-branch: 52 | !(0 <= j@118@01) | live]
; [else-branch: 52 | 0 <= j@118@01 | live]
(push) ; 5
; [then-branch: 52 | !(0 <= j@118@01)]
(assert (not (<= 0 j@118@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 52 | 0 <= j@118@01]
(assert (<= 0 j@118@01))
; [eval] j < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@118@01) (not (<= 0 j@118@01))))
(assert (and (<= 0 j@118@01) (< j@118@01 (* M@72@01 N@73@01))))
; [eval] out[j]
(push) ; 4
(assert (not (>= j@118@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@118@01 (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@119@01 ($Ref) Int)
(declare-fun img@120@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@118@01 Int)) (!
  (=>
    (and (<= 0 j@118@01) (< j@118@01 (* M@72@01 N@73@01)))
    (or (<= 0 j@118@01) (not (<= 0 j@118@01))))
  :pattern ((Seq_index out@74@01 j@118@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@118@01 Int) (j2@118@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@118@01) (< j1@118@01 (* M@72@01 N@73@01)))
      (and (<= 0 j2@118@01) (< j2@118@01 (* M@72@01 N@73@01)))
      (= (Seq_index out@74@01 j1@118@01) (Seq_index out@74@01 j2@118@01)))
    (= j1@118@01 j2@118@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@118@01 Int)) (!
  (=>
    (and (<= 0 j@118@01) (< j@118@01 (* M@72@01 N@73@01)))
    (and
      (= (inv@119@01 (Seq_index out@74@01 j@118@01)) j@118@01)
      (img@120@01 (Seq_index out@74@01 j@118@01))))
  :pattern ((Seq_index out@74@01 j@118@01))
  :qid |quant-u-93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@120@01 r)
      (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
    (= (Seq_index out@74@01 (inv@119@01 r)) r))
  :pattern ((inv@119@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@118@01 Int)) (!
  (=>
    (and (<= 0 j@118@01) (< j@118@01 (* M@72@01 N@73@01)))
    (not (= (Seq_index out@74@01 j@118@01) $Ref.null)))
  :pattern ((Seq_index out@74@01 j@118@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index out@74@01 j@118@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@120@01 r)
        (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-94|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@117@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@117@01))
    ($Snap.second ($Snap.second $t@117@01)))))
(declare-const i@121@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N * M
; [eval] 0 <= i
(push) ; 4
; [then-branch: 53 | !(0 <= i@121@01) | live]
; [else-branch: 53 | 0 <= i@121@01 | live]
(push) ; 5
; [then-branch: 53 | !(0 <= i@121@01)]
(assert (not (<= 0 i@121@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 53 | 0 <= i@121@01]
(assert (<= 0 i@121@01))
; [eval] i < N * M
; [eval] N * M
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@121@01) (not (<= 0 i@121@01))))
(assert (and (<= 0 i@121@01) (< i@121@01 (* N@73@01 M@72@01))))
; [eval] inp[i]
(push) ; 4
(assert (not (>= i@121@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@121@01 (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@122@01 ($Ref) Int)
(declare-fun img@123@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@121@01 Int)) (!
  (=>
    (and (<= 0 i@121@01) (< i@121@01 (* N@73@01 M@72@01)))
    (or (<= 0 i@121@01) (not (<= 0 i@121@01))))
  :pattern ((Seq_index inp@75@01 i@121@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@121@01 Int) (i2@121@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@121@01) (< i1@121@01 (* N@73@01 M@72@01)))
      (and (<= 0 i2@121@01) (< i2@121@01 (* N@73@01 M@72@01)))
      (= (Seq_index inp@75@01 i1@121@01) (Seq_index inp@75@01 i2@121@01)))
    (= i1@121@01 i2@121@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@121@01 Int)) (!
  (=>
    (and (<= 0 i@121@01) (< i@121@01 (* N@73@01 M@72@01)))
    (and
      (= (inv@122@01 (Seq_index inp@75@01 i@121@01)) i@121@01)
      (img@123@01 (Seq_index inp@75@01 i@121@01))))
  :pattern ((Seq_index inp@75@01 i@121@01))
  :qid |quant-u-96|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@123@01 r)
      (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
    (= (Seq_index inp@75@01 (inv@122@01 r)) r))
  :pattern ((inv@122@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@121@01 Int)) (!
  (=>
    (and (<= 0 i@121@01) (< i@121@01 (* N@73@01 M@72@01)))
    (not (= (Seq_index inp@75@01 i@121@01) $Ref.null)))
  :pattern ((Seq_index inp@75@01 i@121@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index inp@75@01 i@121@01) (Seq_index out@74@01 j@118@01))
    (=
      (and
        (img@123@01 r)
        (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
      (and
        (img@120@01 r)
        (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))))
  
  :qid |quant-u-97|))))
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
    (= (Seq_index inp@75@01 i@121@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@123@01 r)
        (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@117@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { out[Ref__multidim_index_2(M, N, i, j)] } { inp[Ref__multidim_index_2(N, M, j, i)] } 0 <= i && (i < M && (0 <= j && j < N)) ==> out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
(declare-const i@124@01 Int)
(declare-const j@125@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 54 | !(0 <= i@124@01) | live]
; [else-branch: 54 | 0 <= i@124@01 | live]
(push) ; 5
; [then-branch: 54 | !(0 <= i@124@01)]
(assert (not (<= 0 i@124@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 54 | 0 <= i@124@01]
(assert (<= 0 i@124@01))
; [eval] i < M
(push) ; 6
; [then-branch: 55 | !(i@124@01 < M@72@01) | live]
; [else-branch: 55 | i@124@01 < M@72@01 | live]
(push) ; 7
; [then-branch: 55 | !(i@124@01 < M@72@01)]
(assert (not (< i@124@01 M@72@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 55 | i@124@01 < M@72@01]
(assert (< i@124@01 M@72@01))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 56 | !(0 <= j@125@01) | live]
; [else-branch: 56 | 0 <= j@125@01 | live]
(push) ; 9
; [then-branch: 56 | !(0 <= j@125@01)]
(assert (not (<= 0 j@125@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 56 | 0 <= j@125@01]
(assert (<= 0 j@125@01))
; [eval] j < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@125@01) (not (<= 0 j@125@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@124@01 M@72@01)
  (and (< i@124@01 M@72@01) (or (<= 0 j@125@01) (not (<= 0 j@125@01))))))
(assert (or (< i@124@01 M@72@01) (not (< i@124@01 M@72@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@124@01)
  (and
    (<= 0 i@124@01)
    (=>
      (< i@124@01 M@72@01)
      (and (< i@124@01 M@72@01) (or (<= 0 j@125@01) (not (<= 0 j@125@01)))))
    (or (< i@124@01 M@72@01) (not (< i@124@01 M@72@01))))))
(assert (or (<= 0 i@124@01) (not (<= 0 i@124@01))))
(push) ; 4
; [then-branch: 57 | 0 <= i@124@01 && i@124@01 < M@72@01 && 0 <= j@125@01 && j@125@01 < N@73@01 | live]
; [else-branch: 57 | !(0 <= i@124@01 && i@124@01 < M@72@01 && 0 <= j@125@01 && j@125@01 < N@73@01) | live]
(push) ; 5
; [then-branch: 57 | 0 <= i@124@01 && i@124@01 < M@72@01 && 0 <= j@125@01 && j@125@01 < N@73@01]
(assert (and
  (<= 0 i@124@01)
  (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01)))))
; [eval] out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] out[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 M@72@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@72@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 N@73@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@73@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 M@72@01)
  (<= 0 N@73@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01)))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01)
  (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@126@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@120@01 r)
      (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@123@01 r)
      (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
  :qid |qp.fvfValDef14|)))
(declare-const pm@127@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@127@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@86@01 r)
            (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
          (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r))
          $Perm.No)
        (ite
          (and
            (img@120@01 r)
            (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@123@01 r)
          (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@127@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@127@01  $FPM) (Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01))
(pop) ; 6
; Joined path conditions
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)
  (Seq_length inp@75@01))))
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
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@120@01 r)
        (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@123@01 r)
        (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
    :qid |qp.fvfValDef14|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@86@01 (Seq_index
            inp@75@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
          (and
            (<=
              0
              (inv@85@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01))))
            (<
              (inv@85@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
              (* N@73@01 M@72@01))))
        (-
          (/ (to_real 1) (to_real 2))
          (pTaken@115@01 (Seq_index
            inp@75@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01))))
        $Perm.No)
      (ite
        (and
          (img@120@01 (Seq_index
            inp@75@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
          (and
            (<=
              0
              (inv@119@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01))))
            (<
              (inv@119@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
              (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@123@01 (Seq_index
          inp@75@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
        (and
          (<=
            0
            (inv@122@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01))))
          (<
            (inv@122@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
            (* N@73@01 M@72@01))))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 57 | !(0 <= i@124@01 && i@124@01 < M@72@01 && 0 <= j@125@01 && j@125@01 < N@73@01)]
(assert (not
  (and
    (<= 0 i@124@01)
    (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@120@01 r)
      (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@123@01 r)
      (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@127@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@86@01 r)
            (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
          (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r))
          $Perm.No)
        (ite
          (and
            (img@120@01 r)
            (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@123@01 r)
          (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@127@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(assert (=>
  (and
    (<= 0 i@124@01)
    (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01))))
  (and
    (<= 0 i@124@01)
    (< i@124@01 M@72@01)
    (<= 0 j@125@01)
    (< j@125@01 N@73@01)
    (<= 0 M@72@01)
    (<= 0 N@73@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@124@01)
      (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01)))))
  (and
    (<= 0 i@124@01)
    (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@120@01 r)
      (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@123@01 r)
      (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@127@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@86@01 r)
            (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
          (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r))
          $Perm.No)
        (ite
          (and
            (img@120@01 r)
            (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@123@01 r)
          (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@127@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@124@01 Int) (j@125@01 Int)) (!
  (and
    (=>
      (<= 0 i@124@01)
      (and
        (<= 0 i@124@01)
        (=>
          (< i@124@01 M@72@01)
          (and (< i@124@01 M@72@01) (or (<= 0 j@125@01) (not (<= 0 j@125@01)))))
        (or (< i@124@01 M@72@01) (not (< i@124@01 M@72@01)))))
    (or (<= 0 i@124@01) (not (<= 0 i@124@01)))
    (=>
      (and
        (<= 0 i@124@01)
        (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01))))
      (and
        (<= 0 i@124@01)
        (< i@124@01 M@72@01)
        (<= 0 j@125@01)
        (< j@125@01 N@73@01)
        (<= 0 M@72@01)
        (<= 0 N@73@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
    (or
      (not
        (and
          (<= 0 i@124@01)
          (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01)))))
      (and
        (<= 0 i@124@01)
        (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01))))))
  :pattern ((Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@83@12@83@204-aux|)))
(assert (forall ((i@124@01 Int) (j@125@01 Int)) (!
  (and
    (=>
      (<= 0 i@124@01)
      (and
        (<= 0 i@124@01)
        (=>
          (< i@124@01 M@72@01)
          (and (< i@124@01 M@72@01) (or (<= 0 j@125@01) (not (<= 0 j@125@01)))))
        (or (< i@124@01 M@72@01) (not (< i@124@01 M@72@01)))))
    (or (<= 0 i@124@01) (not (<= 0 i@124@01)))
    (=>
      (and
        (<= 0 i@124@01)
        (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01))))
      (and
        (<= 0 i@124@01)
        (< i@124@01 M@72@01)
        (<= 0 j@125@01)
        (< j@125@01 N@73@01)
        (<= 0 M@72@01)
        (<= 0 N@73@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
    (or
      (not
        (and
          (<= 0 i@124@01)
          (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01)))))
      (and
        (<= 0 i@124@01)
        (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01))))))
  :pattern ((Seq_index
    inp@75@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@83@12@83@204-aux|)))
(assert (forall ((i@124@01 Int) (j@125@01 Int)) (!
  (=>
    (and
      (<= 0 i@124@01)
      (and (< i@124@01 M@72@01) (and (<= 0 j@125@01) (< j@125@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        out@74@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))))
  :pattern ((Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@124@01 j@125@01)))
  :pattern ((Seq_index
    inp@75@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@125@01 i@124@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@83@12@83@204|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] M > 0
; [eval] N > 0
(declare-const j1@128@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j1 && j1 < M * N
; [eval] 0 <= j1
(push) ; 4
; [then-branch: 58 | !(0 <= j1@128@01) | live]
; [else-branch: 58 | 0 <= j1@128@01 | live]
(push) ; 5
; [then-branch: 58 | !(0 <= j1@128@01)]
(assert (not (<= 0 j1@128@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 58 | 0 <= j1@128@01]
(assert (<= 0 j1@128@01))
; [eval] j1 < M * N
; [eval] M * N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@128@01) (not (<= 0 j1@128@01))))
(assert (and (<= 0 j1@128@01) (< j1@128@01 (* M@72@01 N@73@01))))
; [eval] out[j1]
(push) ; 4
(assert (not (>= j1@128@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j1@128@01 (Seq_length out@74@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@129@01 ($Ref) Int)
(declare-fun img@130@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j1@128@01 Int)) (!
  (=>
    (and (<= 0 j1@128@01) (< j1@128@01 (* M@72@01 N@73@01)))
    (or (<= 0 j1@128@01) (not (<= 0 j1@128@01))))
  :pattern ((Seq_index out@74@01 j1@128@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j11@128@01 Int) (j12@128@01 Int)) (!
  (=>
    (and
      (and (<= 0 j11@128@01) (< j11@128@01 (* M@72@01 N@73@01)))
      (and (<= 0 j12@128@01) (< j12@128@01 (* M@72@01 N@73@01)))
      (= (Seq_index out@74@01 j11@128@01) (Seq_index out@74@01 j12@128@01)))
    (= j11@128@01 j12@128@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j1@128@01 Int)) (!
  (=>
    (and (<= 0 j1@128@01) (< j1@128@01 (* M@72@01 N@73@01)))
    (and
      (= (inv@129@01 (Seq_index out@74@01 j1@128@01)) j1@128@01)
      (img@130@01 (Seq_index out@74@01 j1@128@01))))
  :pattern ((Seq_index out@74@01 j1@128@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@130@01 r)
      (and (<= 0 (inv@129@01 r)) (< (inv@129@01 r) (* M@72@01 N@73@01))))
    (= (Seq_index out@74@01 (inv@129@01 r)) r))
  :pattern ((inv@129@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((j1@128@01 Int)) (!
  (= (Seq_index out@74@01 j1@128@01) (Seq_index inp@75@01 j1@128@01))
  
  :qid |quant-u-100|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((j1@128@01 Int)) (!
  (= (Seq_index out@74@01 j1@128@01) (Seq_index inp@75@01 j1@128@01))
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@131@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@129@01 r)) (< (inv@129@01 r) (* M@72@01 N@73@01)))
      (img@130@01 r)
      (= r (Seq_index out@74@01 (inv@129@01 r))))
    ($Perm.min
      (ite
        (and
          (img@120@01 r)
          (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@132@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@129@01 r)) (< (inv@129@01 r) (* M@72@01 N@73@01)))
      (img@130@01 r)
      (= r (Seq_index out@74@01 (inv@129@01 r))))
    ($Perm.min
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@131@01 r)))
    $Perm.No))
(define-fun pTaken@133@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@129@01 r)) (< (inv@129@01 r) (* M@72@01 N@73@01)))
      (img@130@01 r)
      (= r (Seq_index out@74@01 (inv@129@01 r))))
    ($Perm.min
      (ite
        (and
          (img@123@01 r)
          (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (- $Perm.Write (pTaken@131@01 r)) (pTaken@132@01 r)))
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
          (img@120@01 r)
          (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@131@01 r))
    $Perm.No)
  
  :qid |quant-u-103|))))
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
      (and (<= 0 (inv@129@01 r)) (< (inv@129@01 r) (* M@72@01 N@73@01)))
      (img@130@01 r)
      (= r (Seq_index out@74@01 (inv@129@01 r))))
    (= (- $Perm.Write (pTaken@131@01 r)) $Perm.No))
  
  :qid |quant-u-104|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const j1@134@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j1 && j1 < N * M
; [eval] 0 <= j1
(push) ; 4
; [then-branch: 59 | !(0 <= j1@134@01) | live]
; [else-branch: 59 | 0 <= j1@134@01 | live]
(push) ; 5
; [then-branch: 59 | !(0 <= j1@134@01)]
(assert (not (<= 0 j1@134@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 59 | 0 <= j1@134@01]
(assert (<= 0 j1@134@01))
; [eval] j1 < N * M
; [eval] N * M
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j1@134@01) (not (<= 0 j1@134@01))))
(assert (and (<= 0 j1@134@01) (< j1@134@01 (* N@73@01 M@72@01))))
; [eval] inp[j1]
(push) ; 4
(assert (not (>= j1@134@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j1@134@01 (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@135@01 ($Ref) Int)
(declare-fun img@136@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j1@134@01 Int)) (!
  (=>
    (and (<= 0 j1@134@01) (< j1@134@01 (* N@73@01 M@72@01)))
    (or (<= 0 j1@134@01) (not (<= 0 j1@134@01))))
  :pattern ((Seq_index inp@75@01 j1@134@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j11@134@01 Int) (j12@134@01 Int)) (!
  (=>
    (and
      (and (<= 0 j11@134@01) (< j11@134@01 (* N@73@01 M@72@01)))
      (and (<= 0 j12@134@01) (< j12@134@01 (* N@73@01 M@72@01)))
      (= (Seq_index inp@75@01 j11@134@01) (Seq_index inp@75@01 j12@134@01)))
    (= j11@134@01 j12@134@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j1@134@01 Int)) (!
  (=>
    (and (<= 0 j1@134@01) (< j1@134@01 (* N@73@01 M@72@01)))
    (and
      (= (inv@135@01 (Seq_index inp@75@01 j1@134@01)) j1@134@01)
      (img@136@01 (Seq_index inp@75@01 j1@134@01))))
  :pattern ((Seq_index inp@75@01 j1@134@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@136@01 r)
      (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) (* N@73@01 M@72@01))))
    (= (Seq_index inp@75@01 (inv@135@01 r)) r))
  :pattern ((inv@135@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@137@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) (* N@73@01 M@72@01)))
      (img@136@01 r)
      (= r (Seq_index inp@75@01 (inv@135@01 r))))
    ($Perm.min
      (ite
        (and
          (img@123@01 r)
          (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@138@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) (* N@73@01 M@72@01)))
      (img@136@01 r)
      (= r (Seq_index inp@75@01 (inv@135@01 r))))
    ($Perm.min
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@137@01 r)))
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
          (img@123@01 r)
          (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (pTaken@137@01 r))
    $Perm.No)
  
  :qid |quant-u-107|))))
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
      (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) (* N@73@01 M@72@01)))
      (img@136@01 r)
      (= r (Seq_index inp@75@01 (inv@135@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@137@01 r)) $Perm.No))
  
  :qid |quant-u-108|))))
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
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r))
        $Perm.No)
      (pTaken@138@01 r))
    $Perm.No)
  
  :qid |quant-u-109|))))
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
      (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) (* N@73@01 M@72@01)))
      (img@136@01 r)
      (= r (Seq_index inp@75@01 (inv@135@01 r))))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@137@01 r)) (pTaken@138@01 r))
      $Perm.No))
  
  :qid |quant-u-110|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@139@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@123@01 r)
      (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@139@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef17|)))
; [eval] (forall i: Int, j: Int :: { out[Ref__multidim_index_2(M, N, i, j)] } { inp[Ref__multidim_index_2(N, M, j, i)] } 0 <= i && (i < M && (0 <= j && j < N)) ==> out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
(declare-const i@140@01 Int)
(declare-const j@141@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 60 | !(0 <= i@140@01) | live]
; [else-branch: 60 | 0 <= i@140@01 | live]
(push) ; 5
; [then-branch: 60 | !(0 <= i@140@01)]
(assert (not (<= 0 i@140@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 60 | 0 <= i@140@01]
(assert (<= 0 i@140@01))
; [eval] i < M
(push) ; 6
; [then-branch: 61 | !(i@140@01 < M@72@01) | live]
; [else-branch: 61 | i@140@01 < M@72@01 | live]
(push) ; 7
; [then-branch: 61 | !(i@140@01 < M@72@01)]
(assert (not (< i@140@01 M@72@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 61 | i@140@01 < M@72@01]
(assert (< i@140@01 M@72@01))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 62 | !(0 <= j@141@01) | live]
; [else-branch: 62 | 0 <= j@141@01 | live]
(push) ; 9
; [then-branch: 62 | !(0 <= j@141@01)]
(assert (not (<= 0 j@141@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 62 | 0 <= j@141@01]
(assert (<= 0 j@141@01))
; [eval] j < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@141@01) (not (<= 0 j@141@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@140@01 M@72@01)
  (and (< i@140@01 M@72@01) (or (<= 0 j@141@01) (not (<= 0 j@141@01))))))
(assert (or (< i@140@01 M@72@01) (not (< i@140@01 M@72@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@140@01)
  (and
    (<= 0 i@140@01)
    (=>
      (< i@140@01 M@72@01)
      (and (< i@140@01 M@72@01) (or (<= 0 j@141@01) (not (<= 0 j@141@01)))))
    (or (< i@140@01 M@72@01) (not (< i@140@01 M@72@01))))))
(assert (or (<= 0 i@140@01) (not (<= 0 i@140@01))))
(push) ; 4
; [then-branch: 63 | 0 <= i@140@01 && i@140@01 < M@72@01 && 0 <= j@141@01 && j@141@01 < N@73@01 | live]
; [else-branch: 63 | !(0 <= i@140@01 && i@140@01 < M@72@01 && 0 <= j@141@01 && j@141@01 < N@73@01) | live]
(push) ; 5
; [then-branch: 63 | 0 <= i@140@01 && i@140@01 < M@72@01 && 0 <= j@141@01 && j@141@01 < N@73@01]
(assert (and
  (<= 0 i@140@01)
  (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01)))))
; [eval] out[Ref__multidim_index_2(M, N, i, j)].Ref__Integer_value == inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value
; [eval] out[Ref__multidim_index_2(M, N, i, j)]
; [eval] Ref__multidim_index_2(M, N, i, j)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 M@72@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@72@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 N@73@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@73@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 M@72@01)
  (<= 0 N@73@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)
  (Seq_length out@74@01))))
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
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@120@01 r)
        (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@123@01 r)
        (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
    :qid |qp.fvfValDef14|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@86@01 (Seq_index
            out@74@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
          (and
            (<=
              0
              (inv@85@01 (Seq_index
                out@74@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01))))
            (<
              (inv@85@01 (Seq_index
                out@74@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
              (* N@73@01 M@72@01))))
        (-
          (/ (to_real 1) (to_real 2))
          (pTaken@115@01 (Seq_index
            out@74@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01))))
        $Perm.No)
      (ite
        (and
          (img@120@01 (Seq_index
            out@74@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
          (and
            (<=
              0
              (inv@119@01 (Seq_index
                out@74@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01))))
            (<
              (inv@119@01 (Seq_index
                out@74@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
              (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@123@01 (Seq_index
          out@74@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
        (and
          (<=
            0
            (inv@122@01 (Seq_index
              out@74@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01))))
          (<
            (inv@122@01 (Seq_index
              out@74@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
            (* N@73@01 M@72@01))))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01))
(pop) ; 6
; Joined path conditions
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)
  (Seq_length inp@75@01))))
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
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@120@01 r)
        (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@123@01 r)
        (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
    :qid |qp.fvfValDef14|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@86@01 (Seq_index
            inp@75@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
          (and
            (<=
              0
              (inv@85@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01))))
            (<
              (inv@85@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
              (* N@73@01 M@72@01))))
        (-
          (/ (to_real 1) (to_real 2))
          (pTaken@115@01 (Seq_index
            inp@75@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01))))
        $Perm.No)
      (ite
        (and
          (img@120@01 (Seq_index
            inp@75@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
          (and
            (<=
              0
              (inv@119@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01))))
            (<
              (inv@119@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
              (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@123@01 (Seq_index
          inp@75@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
        (and
          (<=
            0
            (inv@122@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01))))
          (<
            (inv@122@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
            (* N@73@01 M@72@01))))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 63 | !(0 <= i@140@01 && i@140@01 < M@72@01 && 0 <= j@141@01 && j@141@01 < N@73@01)]
(assert (not
  (and
    (<= 0 i@140@01)
    (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@120@01 r)
      (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@123@01 r)
      (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
  :qid |qp.fvfValDef14|)))
(assert (=>
  (and
    (<= 0 i@140@01)
    (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))
  (and
    (<= 0 i@140@01)
    (< i@140@01 M@72@01)
    (<= 0 j@141@01)
    (< j@141@01 N@73@01)
    (<= 0 M@72@01)
    (<= 0 N@73@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@140@01)
      (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01)))))
  (and
    (<= 0 i@140@01)
    (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@120@01 r)
      (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@123@01 r)
      (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
  :qid |qp.fvfValDef14|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@140@01 Int) (j@141@01 Int)) (!
  (and
    (=>
      (<= 0 i@140@01)
      (and
        (<= 0 i@140@01)
        (=>
          (< i@140@01 M@72@01)
          (and (< i@140@01 M@72@01) (or (<= 0 j@141@01) (not (<= 0 j@141@01)))))
        (or (< i@140@01 M@72@01) (not (< i@140@01 M@72@01)))))
    (or (<= 0 i@140@01) (not (<= 0 i@140@01)))
    (=>
      (and
        (<= 0 i@140@01)
        (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))
      (and
        (<= 0 i@140@01)
        (< i@140@01 M@72@01)
        (<= 0 j@141@01)
        (< j@141@01 N@73@01)
        (<= 0 M@72@01)
        (<= 0 N@73@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
    (or
      (not
        (and
          (<= 0 i@140@01)
          (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01)))))
      (and
        (<= 0 i@140@01)
        (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))))
  :pattern ((Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@131@12@131@204-aux|)))
(assert (forall ((i@140@01 Int) (j@141@01 Int)) (!
  (and
    (=>
      (<= 0 i@140@01)
      (and
        (<= 0 i@140@01)
        (=>
          (< i@140@01 M@72@01)
          (and (< i@140@01 M@72@01) (or (<= 0 j@141@01) (not (<= 0 j@141@01)))))
        (or (< i@140@01 M@72@01) (not (< i@140@01 M@72@01)))))
    (or (<= 0 i@140@01) (not (<= 0 i@140@01)))
    (=>
      (and
        (<= 0 i@140@01)
        (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))
      (and
        (<= 0 i@140@01)
        (< i@140@01 M@72@01)
        (<= 0 j@141@01)
        (< j@141@01 N@73@01)
        (<= 0 M@72@01)
        (<= 0 N@73@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
    (or
      (not
        (and
          (<= 0 i@140@01)
          (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01)))))
      (and
        (<= 0 i@140@01)
        (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))))
  :pattern ((Seq_index
    inp@75@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@131@12@131@204-aux|)))
(assert (forall ((i@140@01 Int) (j@141@01 Int)) (!
  (=>
    (and
      (<= 0 i@140@01)
      (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))
    (and
      (Ref__multidim_index_2%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)
      (Ref__multidim_index_2%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
  :pattern ((Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
  :pattern ((Seq_index
    inp@75@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@131@12@131@204_precondition|)))
(push) ; 3
(assert (not (forall ((i@140@01 Int) (j@141@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 i@140@01)
          (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))
        (and
          (Ref__multidim_index_2%precondition ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)
          (Ref__multidim_index_2%precondition ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
      (and
        (<= 0 i@140@01)
        (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        out@74@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))))
  :pattern ((Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
  :pattern ((Seq_index
    inp@75@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@131@12@131@204|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@140@01 Int) (j@141@01 Int)) (!
  (=>
    (and
      (<= 0 i@140@01)
      (and (< i@140@01 M@72@01) (and (<= 0 j@141@01) (< j@141@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        out@74@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))))
  :pattern ((Seq_index
    out@74@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) M@72@01 N@73@01 i@140@01 j@141@01)))
  :pattern ((Seq_index
    inp@75@01
    (Ref__multidim_index_2 ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@141@01 i@140@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@131@12@131@204|)))
; [eval] (forall i: Int, j: Int :: { old(Ref__multidim_index_2(N, M, j, i)) } { old(inp[Ref__multidim_index_2(N, M, j, i)]) } 0 <= i && (i < M && (0 <= j && j < N)) ==> inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value == old(inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value))
(declare-const i@142@01 Int)
(declare-const j@143@01 Int)
(push) ; 3
; [eval] 0 <= i && (i < M && (0 <= j && j < N)) ==> inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value == old(inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
; [eval] 0 <= i && (i < M && (0 <= j && j < N))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 64 | !(0 <= i@142@01) | live]
; [else-branch: 64 | 0 <= i@142@01 | live]
(push) ; 5
; [then-branch: 64 | !(0 <= i@142@01)]
(assert (not (<= 0 i@142@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 64 | 0 <= i@142@01]
(assert (<= 0 i@142@01))
; [eval] i < M
(push) ; 6
; [then-branch: 65 | !(i@142@01 < M@72@01) | live]
; [else-branch: 65 | i@142@01 < M@72@01 | live]
(push) ; 7
; [then-branch: 65 | !(i@142@01 < M@72@01)]
(assert (not (< i@142@01 M@72@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 65 | i@142@01 < M@72@01]
(assert (< i@142@01 M@72@01))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 66 | !(0 <= j@143@01) | live]
; [else-branch: 66 | 0 <= j@143@01 | live]
(push) ; 9
; [then-branch: 66 | !(0 <= j@143@01)]
(assert (not (<= 0 j@143@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 66 | 0 <= j@143@01]
(assert (<= 0 j@143@01))
; [eval] j < N
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@143@01) (not (<= 0 j@143@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@142@01 M@72@01)
  (and (< i@142@01 M@72@01) (or (<= 0 j@143@01) (not (<= 0 j@143@01))))))
(assert (or (< i@142@01 M@72@01) (not (< i@142@01 M@72@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@142@01)
  (and
    (<= 0 i@142@01)
    (=>
      (< i@142@01 M@72@01)
      (and (< i@142@01 M@72@01) (or (<= 0 j@143@01) (not (<= 0 j@143@01)))))
    (or (< i@142@01 M@72@01) (not (< i@142@01 M@72@01))))))
(assert (or (<= 0 i@142@01) (not (<= 0 i@142@01))))
(push) ; 4
; [then-branch: 67 | 0 <= i@142@01 && i@142@01 < M@72@01 && 0 <= j@143@01 && j@143@01 < N@73@01 | live]
; [else-branch: 67 | !(0 <= i@142@01 && i@142@01 < M@72@01 && 0 <= j@143@01 && j@143@01 < N@73@01) | live]
(push) ; 5
; [then-branch: 67 | 0 <= i@142@01 && i@142@01 < M@72@01 && 0 <= j@143@01 && j@143@01 < N@73@01]
(assert (and
  (<= 0 i@142@01)
  (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01)))))
; [eval] inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value == old(inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 6
; [eval] 0 <= i0
; [eval] i0 < N0
; [eval] 0 <= N0
(push) ; 7
(assert (not (<= 0 N@73@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@73@01))
; [eval] 0 <= i1
; [eval] i1 < N1
; [eval] 0 <= N1
(push) ; 7
(assert (not (<= 0 M@72@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 M@72@01))
(assert (Ref__multidim_index_2%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 N@73@01)
  (<= 0 M@72@01)
  (Ref__multidim_index_2%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
(push) ; 6
(assert (not (>=
  (Ref__multidim_index_2 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)
  (Seq_length inp@75@01))))
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
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@120@01 r)
        (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@123@01 r)
        (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
    :qid |qp.fvfValDef14|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@86@01 (Seq_index
            inp@75@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
          (and
            (<=
              0
              (inv@85@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))))
            (<
              (inv@85@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
              (* N@73@01 M@72@01))))
        (-
          (/ (to_real 1) (to_real 2))
          (pTaken@115@01 (Seq_index
            inp@75@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))))
        $Perm.No)
      (ite
        (and
          (img@120@01 (Seq_index
            inp@75@01
            (Ref__multidim_index_2 ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
          (and
            (<=
              0
              (inv@119@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))))
            (<
              (inv@119@01 (Seq_index
                inp@75@01
                (Ref__multidim_index_2 ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
              (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@123@01 (Seq_index
          inp@75@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
        (and
          (<=
            0
            (inv@122@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))))
          (<
            (inv@122@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
            (* N@73@01 M@72@01))))
      (/ (to_real 1) (to_real 4))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(inp[Ref__multidim_index_2(N, M, j, i)].Ref__Integer_value)
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)
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
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)
  (Seq_length inp@75@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@81@01 (Seq_index
          inp@75@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
        (and
          (<=
            0
            (inv@80@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))))
          (<
            (inv@80@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
            (* M@72@01 N@73@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@86@01 (Seq_index
          inp@75@01
          (Ref__multidim_index_2 ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
        (and
          (<=
            0
            (inv@85@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))))
          (<
            (inv@85@01 (Seq_index
              inp@75@01
              (Ref__multidim_index_2 ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
            (* N@73@01 M@72@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 67 | !(0 <= i@142@01 && i@142@01 < M@72@01 && 0 <= j@143@01 && j@143@01 < N@73@01)]
(assert (not
  (and
    (<= 0 i@142@01)
    (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@120@01 r)
      (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@123@01 r)
      (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (=>
  (and
    (<= 0 i@142@01)
    (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01))))
  (and
    (<= 0 i@142@01)
    (< i@142@01 M@72@01)
    (<= 0 j@143@01)
    (< j@143@01 N@73@01)
    (<= 0 N@73@01)
    (<= 0 M@72@01)
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@142@01)
      (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01)))))
  (and
    (<= 0 i@142@01)
    (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01))))))
; [eval] old(Ref__multidim_index_2(N, M, j, i))
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 4
; [eval] 0 <= i0
(push) ; 5
(assert (not (<= 0 j@143@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@144@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@144@01  $FPM) r)
    (+
      (ite
        (and
          (img@81@01 r)
          (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@144@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@144@01  $FPM) r) $Perm.Write)
  :pattern ((inv@80@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@144@01  $FPM) r) $Perm.Write)
  :pattern ((inv@85@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 j@143@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@145@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@145@01  $FPM) r)
    (+
      (ite
        (and
          (img@81@01 r)
          (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@145@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@145@01  $FPM) r) $Perm.Write)
  :pattern ((inv@80@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@145@01  $FPM) r) $Perm.Write)
  :pattern ((inv@85@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 j@143@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-113|))))
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
(assert (not (<= 0 j@143@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; [eval] old(inp[Ref__multidim_index_2(N, M, j, i)])
; [eval] inp[Ref__multidim_index_2(N, M, j, i)]
; [eval] Ref__multidim_index_2(N, M, j, i)
(push) ; 4
; [eval] 0 <= i0
(push) ; 5
(assert (not (<= 0 j@143@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-114|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@146@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@146@01  $FPM) r)
    (+
      (ite
        (and
          (img@81@01 r)
          (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@146@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@146@01  $FPM) r) $Perm.Write)
  :pattern ((inv@80@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@146@01  $FPM) r) $Perm.Write)
  :pattern ((inv@85@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 j@143@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@147@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@147@01  $FPM) r)
    (+
      (ite
        (and
          (img@81@01 r)
          (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@86@01 r)
          (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@147@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@147@01  $FPM) r) $Perm.Write)
  :pattern ((inv@80@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field Ref__Integer_value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Ref__Integer_value (as pm@147@01  $FPM) r) $Perm.Write)
  :pattern ((inv@85@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= i0
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 j@143@01)))
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
    (= (Seq_index out@74@01 j1@79@01) (Seq_index inp@75@01 j1@84@01))
    (=
      (and
        (img@81@01 r)
        (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
      (and
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))))
  
  :qid |quant-u-116|))))
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
(assert (not (<= 0 j@143@01)))
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
        (img@86@01 r)
        (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@115@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@120@01 r)
      (and (<= 0 (inv@119@01 r)) (< (inv@119@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@117@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@123@01 r)
      (and (<= 0 (inv@122@01 r)) (< (inv@122@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@117@01))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) (* M@72@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (* N@73@01 M@72@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))))) r))
  :qid |qp.fvfValDef10|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@142@01 Int) (j@143@01 Int)) (!
  (and
    (=>
      (<= 0 i@142@01)
      (and
        (<= 0 i@142@01)
        (=>
          (< i@142@01 M@72@01)
          (and (< i@142@01 M@72@01) (or (<= 0 j@143@01) (not (<= 0 j@143@01)))))
        (or (< i@142@01 M@72@01) (not (< i@142@01 M@72@01)))))
    (or (<= 0 i@142@01) (not (<= 0 i@142@01)))
    (=>
      (and
        (<= 0 i@142@01)
        (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01))))
      (and
        (<= 0 i@142@01)
        (< i@142@01 M@72@01)
        (<= 0 j@143@01)
        (< j@143@01 N@73@01)
        (<= 0 N@73@01)
        (<= 0 M@72@01)
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
    (or
      (not
        (and
          (<= 0 i@142@01)
          (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01)))))
      (and
        (<= 0 i@142@01)
        (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01))))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@132@12@132@209-aux|)))
(assert (forall ((i@142@01 Int) (j@143@01 Int)) (!
  (=>
    (and
      (<= 0 i@142@01)
      (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01))))
    (Ref__multidim_index_2%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@132@12@132@209_precondition|)))
(push) ; 3
(assert (not (forall ((i@142@01 Int) (j@143@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 i@142@01)
          (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01))))
        (Ref__multidim_index_2%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01))
      (and
        (<= 0 i@142@01)
        (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01)))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@132@12@132@209|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@142@01 Int) (j@143@01 Int)) (!
  (=>
    (and
      (<= 0 i@142@01)
      (and (< i@142@01 M@72@01) (and (<= 0 j@143@01) (< j@143@01 N@73@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@109@01  $FVF<Ref__Integer_value>) (Seq_index
        inp@75@01
        (Ref__multidim_index_2 ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) N@73@01 M@72@01 j@143@01 i@142@01)))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testTranspose.vpr@132@12@132@209|)))
(pop) ; 2
(pop) ; 1
; ---------- Ref__Ref ----------
(declare-const current_thread_id@148@01 Int)
(declare-const sys__result@149@01 $Ref)
(declare-const current_thread_id@150@01 Int)
(declare-const sys__result@151@01 $Ref)
(push) ; 1
(declare-const $t@152@01 $Snap)
(assert (= $t@152@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@150@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@153@01 $Snap)
(assert (= $t@153@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@151@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@154@01 $Ref)
; [exec]
; diz := new(Ref__Integer_value)
(declare-const diz@155@01 $Ref)
(assert (not (= diz@155@01 $Ref.null)))
(declare-const Ref__Integer_value@156@01 Int)
(assert (not (= diz@155@01 sys__result@151@01)))
(assert (not (= diz@155@01 diz@154@01)))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
