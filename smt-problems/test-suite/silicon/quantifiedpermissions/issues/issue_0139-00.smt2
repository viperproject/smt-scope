(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:17:46
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr
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
(declare-sort $FVF<f> 0)
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
(declare-fun $SortWrappers.$FVF<f>To$Snap ($FVF<f>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<f> ($Snap) $FVF<f>)
(assert (forall ((x $FVF<f>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<f>($SortWrappers.$FVF<f>To$Snap x)))
    :pattern (($SortWrappers.$FVF<f>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<f>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<f>To$Snap($SortWrappers.$SnapTo$FVF<f> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<f> x))
    :qid |$Snap.$FVF<f>To$SnapTo$FVF<f>|
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun05 ($Snap $Ref Seq<$Ref>) Int)
(declare-fun fun05%limited ($Snap $Ref Seq<$Ref>) Int)
(declare-fun fun05%stateless ($Ref Seq<$Ref>) Bool)
(declare-fun fun05%precondition ($Snap $Ref Seq<$Ref>) Bool)
(declare-fun fun02 ($Snap Seq<$Ref>) Int)
(declare-fun fun02%limited ($Snap Seq<$Ref>) Int)
(declare-fun fun02%stateless (Seq<$Ref>) Bool)
(declare-fun fun02%precondition ($Snap Seq<$Ref>) Bool)
(declare-fun fun01 ($Snap Seq<$Ref>) Int)
(declare-fun fun01%limited ($Snap Seq<$Ref>) Int)
(declare-fun fun01%stateless (Seq<$Ref>) Bool)
(declare-fun fun01%precondition ($Snap Seq<$Ref>) Bool)
(declare-fun fun04 ($Snap Seq<$Ref> Bool) Int)
(declare-fun fun04%limited ($Snap Seq<$Ref> Bool) Int)
(declare-fun fun04%stateless (Seq<$Ref> Bool) Bool)
(declare-fun fun04%precondition ($Snap Seq<$Ref> Bool) Bool)
(declare-fun fun07 ($Snap Seq<$Ref>) Int)
(declare-fun fun07%limited ($Snap Seq<$Ref>) Int)
(declare-fun fun07%stateless (Seq<$Ref>) Bool)
(declare-fun fun07%precondition ($Snap Seq<$Ref>) Bool)
(declare-fun fun03 ($Snap Seq<$Ref>) Int)
(declare-fun fun03%limited ($Snap Seq<$Ref>) Int)
(declare-fun fun03%stateless (Seq<$Ref>) Bool)
(declare-fun fun03%precondition ($Snap Seq<$Ref>) Bool)
(declare-fun fun06 ($Snap $Ref Int Seq<$Ref>) Int)
(declare-fun fun06%limited ($Snap $Ref Int Seq<$Ref>) Int)
(declare-fun fun06%stateless ($Ref Int Seq<$Ref>) Bool)
(declare-fun fun06%precondition ($Snap $Ref Int Seq<$Ref>) Bool)
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
; /field_value_functions_axioms.smt2 [f: Int]
(assert (forall ((vs $FVF<f>) (ws $FVF<f>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_f vs) ($FVF.domain_f ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_f vs))
            (= ($FVF.lookup_f vs x) ($FVF.lookup_f ws x)))
          :pattern (($FVF.lookup_f vs x) ($FVF.lookup_f ws x))
          :qid |qp.$FVF<f>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<f>To$Snap vs)
              ($SortWrappers.$FVF<f>To$Snap ws)
              )
    :qid |qp.$FVF<f>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_f pm r))
    :pattern (($FVF.perm_f pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@21@00 ($Snap $Ref Seq<$Ref> $Ref) Int)
(declare-fun img@22@00 ($Snap $Ref Seq<$Ref> $Ref) Bool)
(declare-fun inv@26@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@27@00 ($Snap Seq<$Ref> $Ref) Bool)
(declare-fun inv@31@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@32@00 ($Snap Seq<$Ref> $Ref) Bool)
(declare-fun inv@36@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@37@00 ($Snap Seq<$Ref> $Ref) Bool)
(declare-fun inv@43@00 ($Snap Seq<$Ref> Bool $Ref) Int)
(declare-fun img@44@00 ($Snap Seq<$Ref> Bool $Ref) Bool)
(declare-fun inv@46@00 ($Snap Seq<$Ref> Bool $Ref) Int)
(declare-fun img@47@00 ($Snap Seq<$Ref> Bool $Ref) Bool)
(declare-fun inv@51@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@52@00 ($Snap Seq<$Ref> $Ref) Bool)
(declare-fun inv@56@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@57@00 ($Snap Seq<$Ref> $Ref) Bool)
(declare-fun inv@61@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@62@00 ($Snap Seq<$Ref> $Ref) Bool)
(declare-fun sm@63@00 ($Snap Seq<$Ref>) $FVF<f>)
(declare-fun inv@69@00 ($Snap $Ref Int Seq<$Ref> $Ref) Int)
(declare-fun img@70@00 ($Snap $Ref Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@65@00 ($Snap $Ref Int Seq<$Ref>) $FVF<f>)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (xs@1@00 Seq<$Ref>)) (!
  (= (fun05%limited s@$ x@0@00 xs@1@00) (fun05 s@$ x@0@00 xs@1@00))
  :pattern ((fun05 s@$ x@0@00 xs@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (xs@1@00 Seq<$Ref>)) (!
  (fun05%stateless x@0@00 xs@1@00)
  :pattern ((fun05%limited s@$ x@0@00 xs@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>)) (!
  (= (fun02%limited s@$ xs@3@00) (fun02 s@$ xs@3@00))
  :pattern ((fun02 s@$ xs@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>)) (!
  (fun02%stateless xs@3@00)
  :pattern ((fun02%limited s@$ xs@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Seq<$Ref>)) (!
  (= (fun01%limited s@$ xs@5@00) (fun01 s@$ xs@5@00))
  :pattern ((fun01 s@$ xs@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Seq<$Ref>)) (!
  (fun01%stateless xs@5@00)
  :pattern ((fun01%limited s@$ xs@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (b@8@00 Bool)) (!
  (= (fun04%limited s@$ xs@7@00 b@8@00) (fun04 s@$ xs@7@00 b@8@00))
  :pattern ((fun04 s@$ xs@7@00 b@8@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (b@8@00 Bool)) (!
  (fun04%stateless xs@7@00 b@8@00)
  :pattern ((fun04%limited s@$ xs@7@00 b@8@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (= (fun07%limited s@$ xs@10@00) (fun07 s@$ xs@10@00))
  :pattern ((fun07 s@$ xs@10@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (fun07%stateless xs@10@00)
  :pattern ((fun07%limited s@$ xs@10@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (= (fun03%limited s@$ xs@12@00) (fun03 s@$ xs@12@00))
  :pattern ((fun03 s@$ xs@12@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (fun03%stateless xs@12@00)
  :pattern ((fun03%limited s@$ xs@12@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (and
    (forall ((k@55@00 Int)) (!
      (=>
        (and (<= 0 k@55@00) (< k@55@00 3))
        (and
          (= (inv@56@00 s@$ xs@12@00 (Seq_index xs@12@00 k@55@00)) k@55@00)
          (img@57@00 s@$ xs@12@00 (Seq_index xs@12@00 k@55@00))))
      :pattern ((Seq_index xs@12@00 k@55@00))
      :qid |quant-u-30|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@57@00 s@$ xs@12@00 r)
          (and
            (<= 0 (inv@56@00 s@$ xs@12@00 r))
            (< (inv@56@00 s@$ xs@12@00 r) 3)))
        (= (Seq_index xs@12@00 (inv@56@00 s@$ xs@12@00 r)) r))
      :pattern ((inv@56@00 s@$ xs@12@00 r))
      :qid |f-fctOfInv|))
    (forall ((k@60@00 Int)) (!
      (=>
        (and (<= 6 k@60@00) (< k@60@00 9))
        (and
          (= (inv@61@00 s@$ xs@12@00 (Seq_index xs@12@00 k@60@00)) k@60@00)
          (img@62@00 s@$ xs@12@00 (Seq_index xs@12@00 k@60@00))))
      :pattern ((Seq_index xs@12@00 k@60@00))
      :qid |quant-u-32|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@62@00 s@$ xs@12@00 r)
          (and
            (<= 6 (inv@61@00 s@$ xs@12@00 r))
            (< (inv@61@00 s@$ xs@12@00 r) 9)))
        (= (Seq_index xs@12@00 (inv@61@00 s@$ xs@12@00 r)) r))
      :pattern ((inv@61@00 s@$ xs@12@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@57@00 s@$ xs@12@00 r)
          (and
            (<= 0 (inv@56@00 s@$ xs@12@00 r))
            (< (inv@56@00 s@$ xs@12@00 r) 3)))
        (=
          ($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@62@00 s@$ xs@12@00 r)
          (and
            (<= 6 (inv@61@00 s@$ xs@12@00 r))
            (< (inv@61@00 s@$ xs@12@00 r) 9)))
        (=
          ($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef1|))
    (=>
      (fun03%precondition s@$ xs@12@00)
      (=
        (fun03 s@$ xs@12@00)
        (+
          ($FVF.lookup_f (sm@63@00 s@$ xs@12@00) (Seq_index xs@12@00 2))
          ($FVF.lookup_f (sm@63@00 s@$ xs@12@00) (Seq_index xs@12@00 6))))))
  :pattern ((fun03 s@$ xs@12@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  true
  :pattern ((fun03 s@$ xs@12@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (x@14@00 $Ref) (i@15@00 Int) (xs@16@00 Seq<$Ref>)) (!
  (=
    (fun06%limited s@$ x@14@00 i@15@00 xs@16@00)
    (fun06 s@$ x@14@00 i@15@00 xs@16@00))
  :pattern ((fun06 s@$ x@14@00 i@15@00 xs@16@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@14@00 $Ref) (i@15@00 Int) (xs@16@00 Seq<$Ref>)) (!
  (fun06%stateless x@14@00 i@15@00 xs@16@00)
  :pattern ((fun06%limited s@$ x@14@00 i@15@00 xs@16@00))
  :qid |quant-u-13|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const xs@1@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale |xs| > 10
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@1@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..3)), (i2 in [0..3)) }
;     { (i1 in [0..3)), xs[i2] }
;     { (i2 in [0..3)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@4@01 Int)
(declare-const i2@5@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 4
; [then-branch: 0 | !(i1@4@01 in [0..3]) | live]
; [else-branch: 0 | i1@4@01 in [0..3] | live]
(push) ; 5
; [then-branch: 0 | !(i1@4@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i1@4@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@4@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 6
; [then-branch: 1 | !(i2@5@01 in [0..3]) | live]
; [else-branch: 1 | i2@5@01 in [0..3] | live]
(push) ; 7
; [then-branch: 1 | !(i2@5@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@5@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i2@5@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@5@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@5@01)
  (not (Seq_contains (Seq_range 0 3) i2@5@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@4@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@4@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@5@01)
      (not (Seq_contains (Seq_range 0 3) i2@5@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@4@01)
  (not (Seq_contains (Seq_range 0 3) i1@4@01))))
(push) ; 4
; [then-branch: 2 | i1@4@01 in [0..3] && i2@5@01 in [0..3] && i1@4@01 != i2@5@01 | live]
; [else-branch: 2 | !(i1@4@01 in [0..3] && i2@5@01 in [0..3] && i1@4@01 != i2@5@01) | live]
(push) ; 5
; [then-branch: 2 | i1@4@01 in [0..3] && i2@5@01 in [0..3] && i1@4@01 != i2@5@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@4@01)
  (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@4@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@4@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@5@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@5@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(i1@4@01 in [0..3] && i2@5@01 in [0..3] && i1@4@01 != i2@5@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@4@01)
    (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@4@01)
    (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@4@01)
    (Seq_contains (Seq_range 0 3) i2@5@01)
    (not (= i1@4@01 i2@5@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@4@01)
    (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@4@01 Int) (i2@5@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@5@01)
          (not (Seq_contains (Seq_range 0 3) i2@5@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (not (Seq_contains (Seq_range 0 3) i1@4@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (Seq_contains (Seq_range 0 3) i2@5@01)
        (not (= i1@4@01 i2@5@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@4@01)
          (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@4@01) (Seq_contains
    (Seq_range 0 3)
    i2@5@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@4@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@14@10@14@98-aux|)))
(assert (forall ((i1@4@01 Int) (i2@5@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@5@01)
          (not (Seq_contains (Seq_range 0 3) i2@5@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (not (Seq_contains (Seq_range 0 3) i1@4@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (Seq_contains (Seq_range 0 3) i2@5@01)
        (not (= i1@4@01 i2@5@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@4@01)
          (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@4@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@14@10@14@98-aux|)))
(assert (forall ((i1@4@01 Int) (i2@5@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@5@01)
          (not (Seq_contains (Seq_range 0 3) i2@5@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (not (Seq_contains (Seq_range 0 3) i1@4@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (Seq_contains (Seq_range 0 3) i2@5@01)
        (not (= i1@4@01 i2@5@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@4@01)
          (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@4@01) (Seq_index xs@1@01 i2@5@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@4@01) (Seq_index
    xs@1@01
    i2@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@14@10@14@98-aux|)))
(assert (forall ((i1@4@01 Int) (i2@5@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@5@01)
          (not (Seq_contains (Seq_range 0 3) i2@5@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (not (Seq_contains (Seq_range 0 3) i1@4@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (Seq_contains (Seq_range 0 3) i2@5@01)
        (not (= i1@4@01 i2@5@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@4@01)
          (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@4@01) (Seq_index
    xs@1@01
    i2@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@14@10@14@98-aux|)))
(assert (forall ((i1@4@01 Int) (i2@5@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@5@01)
          (not (Seq_contains (Seq_range 0 3) i2@5@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (not (Seq_contains (Seq_range 0 3) i1@4@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (Seq_contains (Seq_range 0 3) i2@5@01)
        (not (= i1@4@01 i2@5@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@4@01)
          (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@5@01) (Seq_index xs@1@01 i1@4@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@5@01) (Seq_index
    xs@1@01
    i1@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@14@10@14@98-aux|)))
(assert (forall ((i1@4@01 Int) (i2@5@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@5@01)
          (not (Seq_contains (Seq_range 0 3) i2@5@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (not (Seq_contains (Seq_range 0 3) i1@4@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (Seq_contains (Seq_range 0 3) i2@5@01)
        (not (= i1@4@01 i2@5@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@4@01)
          (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@5@01) (Seq_index
    xs@1@01
    i1@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@14@10@14@98-aux|)))
(assert (forall ((i1@4@01 Int) (i2@5@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@5@01)
          (not (Seq_contains (Seq_range 0 3) i2@5@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (not (Seq_contains (Seq_range 0 3) i1@4@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (Seq_contains (Seq_range 0 3) i2@5@01)
        (not (= i1@4@01 i2@5@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@4@01)
          (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@4@01)
        (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))))
  :pattern ((Seq_index xs@1@01 i1@4@01) (Seq_index xs@1@01 i2@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@14@10@14@98-aux|)))
(assert (forall ((i1@4@01 Int) (i2@5@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@4@01)
      (and (Seq_contains (Seq_range 0 3) i2@5@01) (not (= i1@4@01 i2@5@01))))
    (not (= (Seq_index xs@1@01 i1@4@01) (Seq_index xs@1@01 i2@5@01))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@4@01) (Seq_contains
    (Seq_range 0 3)
    i2@5@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@4@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@5@01))
  :pattern ((Seq_contains (Seq_range 0 3) i1@4@01) (Seq_index xs@1@01 i2@5@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@4@01) (Seq_index
    xs@1@01
    i2@5@01))
  :pattern ((Seq_contains (Seq_range 0 3) i2@5@01) (Seq_index xs@1@01 i1@4@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@5@01) (Seq_index
    xs@1@01
    i1@4@01))
  :pattern ((Seq_index xs@1@01 i1@4@01) (Seq_index xs@1@01 i2@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@14@10@14@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::0 <= k && k < 3 ==> acc(xs[k].f, write))
(declare-const k@6@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 4
; [then-branch: 3 | !(0 <= k@6@01) | live]
; [else-branch: 3 | 0 <= k@6@01 | live]
(push) ; 5
; [then-branch: 3 | !(0 <= k@6@01)]
(assert (not (<= 0 k@6@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | 0 <= k@6@01]
(assert (<= 0 k@6@01))
; [eval] k < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@6@01) (not (<= 0 k@6@01))))
(assert (and (<= 0 k@6@01) (< k@6@01 3)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@6@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@6@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@7@01 $FVF<f>)
(declare-fun inv@8@01 ($Ref) Int)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@6@01 Int)) (!
  (=> (and (<= 0 k@6@01) (< k@6@01 3)) (or (<= 0 k@6@01) (not (<= 0 k@6@01))))
  :pattern ((Seq_index xs@1@01 k@6@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@6@01 Int) (k2@6@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@6@01) (< k1@6@01 3))
      (and (<= 0 k2@6@01) (< k2@6@01 3))
      (= (Seq_index xs@1@01 k1@6@01) (Seq_index xs@1@01 k2@6@01)))
    (= k1@6@01 k2@6@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@6@01 Int)) (!
  (=>
    (and (<= 0 k@6@01) (< k@6@01 3))
    (and
      (= (inv@8@01 (Seq_index xs@1@01 k@6@01)) k@6@01)
      (img@9@01 (Seq_index xs@1@01 k@6@01))))
  :pattern ((Seq_index xs@1@01 k@6@01))
  :qid |quant-u-39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3)))
    (= (Seq_index xs@1@01 (inv@8@01 r)) r))
  :pattern ((inv@8@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@6@01 Int)) (!
  (=>
    (and (<= 0 k@6@01) (< k@6@01 3))
    (not (= (Seq_index xs@1@01 k@6@01) $Ref.null)))
  :pattern ((Seq_index xs@1@01 k@6@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 10 == fun01(xs)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] 10 == fun01(xs)
; [eval] fun01(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@11@01 Int)
(declare-const i2@12@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 4 | !(i1@11@01 in [0..3]) | live]
; [else-branch: 4 | i1@11@01 in [0..3] | live]
(push) ; 6
; [then-branch: 4 | !(i1@11@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@11@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | i1@11@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@11@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 5 | !(i2@12@01 in [0..3]) | live]
; [else-branch: 5 | i2@12@01 in [0..3] | live]
(push) ; 8
; [then-branch: 5 | !(i2@12@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@12@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 5 | i2@12@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@12@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@12@01)
  (not (Seq_contains (Seq_range 0 3) i2@12@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@11@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@11@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@12@01)
      (not (Seq_contains (Seq_range 0 3) i2@12@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@11@01)
  (not (Seq_contains (Seq_range 0 3) i1@11@01))))
(push) ; 5
; [then-branch: 6 | i1@11@01 in [0..3] && i2@12@01 in [0..3] && i1@11@01 != i2@12@01 | live]
; [else-branch: 6 | !(i1@11@01 in [0..3] && i2@12@01 in [0..3] && i1@11@01 != i2@12@01) | live]
(push) ; 6
; [then-branch: 6 | i1@11@01 in [0..3] && i2@12@01 in [0..3] && i1@11@01 != i2@12@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@11@01)
  (and (Seq_contains (Seq_range 0 3) i2@12@01) (not (= i1@11@01 i2@12@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@11@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@11@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@12@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@12@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 6 | !(i1@11@01 in [0..3] && i2@12@01 in [0..3] && i1@11@01 != i2@12@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@11@01)
    (and (Seq_contains (Seq_range 0 3) i2@12@01) (not (= i1@11@01 i2@12@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@11@01)
    (and (Seq_contains (Seq_range 0 3) i2@12@01) (not (= i1@11@01 i2@12@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@11@01)
    (Seq_contains (Seq_range 0 3) i2@12@01)
    (not (= i1@11@01 i2@12@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@11@01)
      (and (Seq_contains (Seq_range 0 3) i2@12@01) (not (= i1@11@01 i2@12@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@11@01)
    (and (Seq_contains (Seq_range 0 3) i2@12@01) (not (= i1@11@01 i2@12@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@11@01 Int) (i2@12@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@11@01)
      (and (Seq_contains (Seq_range 0 3) i2@12@01) (not (= i1@11@01 i2@12@01))))
    (not (= (Seq_index xs@1@01 i1@11@01) (Seq_index xs@1@01 i2@12@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@11@01 Int) (i2@12@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@11@01)
      (and (Seq_contains (Seq_range 0 3) i2@12@01) (not (= i1@11@01 i2@12@01))))
    (not (= (Seq_index xs@1@01 i1@11@01) (Seq_index xs@1@01 i2@12@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100|)))
(declare-const k@13@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 7 | !(0 <= k@13@01) | live]
; [else-branch: 7 | 0 <= k@13@01 | live]
(push) ; 6
; [then-branch: 7 | !(0 <= k@13@01)]
(assert (not (<= 0 k@13@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | 0 <= k@13@01]
(assert (<= 0 k@13@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@13@01) (not (<= 0 k@13@01))))
(assert (and (<= 0 k@13@01) (< k@13@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@13@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@13@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@14@01 ($Ref) Int)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@13@01 Int)) (!
  (=>
    (and (<= 0 k@13@01) (< k@13@01 3))
    (or (<= 0 k@13@01) (not (<= 0 k@13@01))))
  :pattern ((Seq_index xs@1@01 k@13@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@13@01 Int) (k2@13@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@13@01) (< k1@13@01 3))
      (and (<= 0 k2@13@01) (< k2@13@01 3))
      (= (Seq_index xs@1@01 k1@13@01) (Seq_index xs@1@01 k2@13@01)))
    (= k1@13@01 k2@13@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@13@01 Int)) (!
  (=>
    (and (<= 0 k@13@01) (< k@13@01 3))
    (and
      (= (inv@14@01 (Seq_index xs@1@01 k@13@01)) k@13@01)
      (img@15@01 (Seq_index xs@1@01 k@13@01))))
  :pattern ((Seq_index xs@1@01 k@13@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@15@01 r) (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3)))
    (= (Seq_index xs@1@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@16@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3))
      (img@15@01 r)
      (= r (Seq_index xs@1@01 (inv@14@01 r))))
    ($Perm.min
      (ite
        (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3)))
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
        (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@16@01 r))
    $Perm.No)
  
  :qid |quant-u-42|))))
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
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3))
      (img@15@01 r)
      (= r (Seq_index xs@1@01 (inv@14@01 r))))
    (= (- $Perm.Write (pTaken@16@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@17@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>)))
      (and (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3)) (img@15@01 r)))
    (=>
      (and (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3)) (img@15@01 r))
      (Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3)) (img@15@01 r))
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3))))
    (= ($FVF.lookup_f (as sm@17@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef0|)))
(assert (fun01%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@17@01  $FVF<f>)))) xs@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@13@01 Int)) (!
  (=>
    (and (<= 0 k@13@01) (< k@13@01 3))
    (and
      (= (inv@14@01 (Seq_index xs@1@01 k@13@01)) k@13@01)
      (img@15@01 (Seq_index xs@1@01 k@13@01))))
  :pattern ((Seq_index xs@1@01 k@13@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@15@01 r) (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3)))
    (= (Seq_index xs@1@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>)))
      (and (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3)) (img@15@01 r)))
    (=>
      (and (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3)) (img@15@01 r))
      (Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) 3)) (img@15@01 r))
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3))))
    (= ($FVF.lookup_f (as sm@17@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef0|)))
(assert (and
  (forall ((i1@11@01 Int) (i2@12@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@11@01)
        (and (Seq_contains (Seq_range 0 3) i2@12@01) (not (= i1@11@01 i2@12@01))))
      (not (= (Seq_index xs@1@01 i1@11@01) (Seq_index xs@1@01 i2@12@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100|))
  (forall ((k@13@01 Int)) (!
    (=>
      (and (<= 0 k@13@01) (< k@13@01 3))
      (or (<= 0 k@13@01) (not (<= 0 k@13@01))))
    :pattern ((Seq_index xs@1@01 k@13@01))
    :qid |f-aux|))
  (fun01%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@17@01  $FVF<f>)))) xs@1@01)))
(assert (=
  10
  (fun01 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@17@01  $FVF<f>)))) xs@1@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert 10 == fun01(xs)
; [eval] 10 == fun01(xs)
; [eval] fun01(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@18@01 Int)
(declare-const i2@19@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 8 | !(i1@18@01 in [0..3]) | live]
; [else-branch: 8 | i1@18@01 in [0..3] | live]
(push) ; 6
; [then-branch: 8 | !(i1@18@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@18@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | i1@18@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@18@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 9 | !(i2@19@01 in [0..3]) | live]
; [else-branch: 9 | i2@19@01 in [0..3] | live]
(push) ; 8
; [then-branch: 9 | !(i2@19@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@19@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 9 | i2@19@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@19@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@19@01)
  (not (Seq_contains (Seq_range 0 3) i2@19@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@18@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@18@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@19@01)
      (not (Seq_contains (Seq_range 0 3) i2@19@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@18@01)
  (not (Seq_contains (Seq_range 0 3) i1@18@01))))
(push) ; 5
; [then-branch: 10 | i1@18@01 in [0..3] && i2@19@01 in [0..3] && i1@18@01 != i2@19@01 | live]
; [else-branch: 10 | !(i1@18@01 in [0..3] && i2@19@01 in [0..3] && i1@18@01 != i2@19@01) | live]
(push) ; 6
; [then-branch: 10 | i1@18@01 in [0..3] && i2@19@01 in [0..3] && i1@18@01 != i2@19@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@18@01)
  (and (Seq_contains (Seq_range 0 3) i2@19@01) (not (= i1@18@01 i2@19@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@18@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@18@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@19@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@19@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(i1@18@01 in [0..3] && i2@19@01 in [0..3] && i1@18@01 != i2@19@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@18@01)
    (and (Seq_contains (Seq_range 0 3) i2@19@01) (not (= i1@18@01 i2@19@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@18@01)
    (and (Seq_contains (Seq_range 0 3) i2@19@01) (not (= i1@18@01 i2@19@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@18@01)
    (Seq_contains (Seq_range 0 3) i2@19@01)
    (not (= i1@18@01 i2@19@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@18@01)
      (and (Seq_contains (Seq_range 0 3) i2@19@01) (not (= i1@18@01 i2@19@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@18@01)
    (and (Seq_contains (Seq_range 0 3) i2@19@01) (not (= i1@18@01 i2@19@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@18@01 Int) (i2@19@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@18@01)
      (and (Seq_contains (Seq_range 0 3) i2@19@01) (not (= i1@18@01 i2@19@01))))
    (not (= (Seq_index xs@1@01 i1@18@01) (Seq_index xs@1@01 i2@19@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@18@01 Int) (i2@19@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@18@01)
      (and (Seq_contains (Seq_range 0 3) i2@19@01) (not (= i1@18@01 i2@19@01))))
    (not (= (Seq_index xs@1@01 i1@18@01) (Seq_index xs@1@01 i2@19@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100|)))
(declare-const k@20@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 11 | !(0 <= k@20@01) | live]
; [else-branch: 11 | 0 <= k@20@01 | live]
(push) ; 6
; [then-branch: 11 | !(0 <= k@20@01)]
(assert (not (<= 0 k@20@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | 0 <= k@20@01]
(assert (<= 0 k@20@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@20@01) (not (<= 0 k@20@01))))
(assert (and (<= 0 k@20@01) (< k@20@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@20@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@20@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@21@01 ($Ref) Int)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (<= 0 k@20@01) (< k@20@01 3))
    (or (<= 0 k@20@01) (not (<= 0 k@20@01))))
  :pattern ((Seq_index xs@1@01 k@20@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@20@01 Int) (k2@20@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@20@01) (< k1@20@01 3))
      (and (<= 0 k2@20@01) (< k2@20@01 3))
      (= (Seq_index xs@1@01 k1@20@01) (Seq_index xs@1@01 k2@20@01)))
    (= k1@20@01 k2@20@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (<= 0 k@20@01) (< k@20@01 3))
    (and
      (= (inv@21@01 (Seq_index xs@1@01 k@20@01)) k@20@01)
      (img@22@01 (Seq_index xs@1@01 k@20@01))))
  :pattern ((Seq_index xs@1@01 k@20@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3)))
    (= (Seq_index xs@1@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3))
      (img@22@01 r)
      (= r (Seq_index xs@1@01 (inv@21@01 r))))
    ($Perm.min
      (ite
        (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3)))
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
        (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@23@01 r))
    $Perm.No)
  
  :qid |quant-u-46|))))
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
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3))
      (img@22@01 r)
      (= r (Seq_index xs@1@01 (inv@21@01 r))))
    (= (- $Perm.Write (pTaken@23@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@24@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>)))
      (and (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3)) (img@22@01 r)))
    (=>
      (and (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3)) (img@22@01 r))
      (Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3)) (img@22@01 r))
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3))))
    (= ($FVF.lookup_f (as sm@24@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef2|)))
(assert (fun01%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@24@01  $FVF<f>)))) xs@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (<= 0 k@20@01) (< k@20@01 3))
    (and
      (= (inv@21@01 (Seq_index xs@1@01 k@20@01)) k@20@01)
      (img@22@01 (Seq_index xs@1@01 k@20@01))))
  :pattern ((Seq_index xs@1@01 k@20@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3)))
    (= (Seq_index xs@1@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>)))
      (and (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3)) (img@22@01 r)))
    (=>
      (and (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3)) (img@22@01 r))
      (Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) 3)) (img@22@01 r))
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3))))
    (= ($FVF.lookup_f (as sm@24@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef2|)))
(assert (and
  (forall ((i1@18@01 Int) (i2@19@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@18@01)
        (and (Seq_contains (Seq_range 0 3) i2@19@01) (not (= i1@18@01 i2@19@01))))
      (not (= (Seq_index xs@1@01 i1@18@01) (Seq_index xs@1@01 i2@19@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100|))
  (forall ((k@20@01 Int)) (!
    (=>
      (and (<= 0 k@20@01) (< k@20@01 3))
      (or (<= 0 k@20@01) (not (<= 0 k@20@01))))
    :pattern ((Seq_index xs@1@01 k@20@01))
    :qid |f-aux|))
  (fun01%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@24@01  $FVF<f>)))) xs@1@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun01 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@24@01  $FVF<f>)))) xs@1@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  10
  (fun01 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@24@01  $FVF<f>)))) xs@1@01)))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@25@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3)))
    (= ($FVF.lookup_f (as sm@25@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@26@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@26@01  $FPM) r)
    (ite
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) 3)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@26@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@26@01  $FPM) r) $Perm.Write)
  :pattern ((inv@8@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@27@01 Seq<$Ref>)
(declare-const xs@28@01 Seq<$Ref>)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale |xs| > 10
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@28@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..3)), (i2 in [0..3)) }
;     { (i1 in [0..3)), xs[i2] }
;     { (i2 in [0..3)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@31@01 Int)
(declare-const i2@32@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 4
; [then-branch: 12 | !(i1@31@01 in [0..3]) | live]
; [else-branch: 12 | i1@31@01 in [0..3] | live]
(push) ; 5
; [then-branch: 12 | !(i1@31@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@31@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | i1@31@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@31@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 6
; [then-branch: 13 | !(i2@32@01 in [0..3]) | live]
; [else-branch: 13 | i2@32@01 in [0..3] | live]
(push) ; 7
; [then-branch: 13 | !(i2@32@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@32@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | i2@32@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@32@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@32@01)
  (not (Seq_contains (Seq_range 0 3) i2@32@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@31@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@31@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@32@01)
      (not (Seq_contains (Seq_range 0 3) i2@32@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@31@01)
  (not (Seq_contains (Seq_range 0 3) i1@31@01))))
(push) ; 4
; [then-branch: 14 | i1@31@01 in [0..3] && i2@32@01 in [0..3] && i1@31@01 != i2@32@01 | live]
; [else-branch: 14 | !(i1@31@01 in [0..3] && i2@32@01 in [0..3] && i1@31@01 != i2@32@01) | live]
(push) ; 5
; [then-branch: 14 | i1@31@01 in [0..3] && i2@32@01 in [0..3] && i1@31@01 != i2@32@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@31@01)
  (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@31@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@31@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@32@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@32@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(i1@31@01 in [0..3] && i2@32@01 in [0..3] && i1@31@01 != i2@32@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@31@01)
    (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@31@01)
    (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@31@01)
    (Seq_contains (Seq_range 0 3) i2@32@01)
    (not (= i1@31@01 i2@32@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@31@01)
    (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@32@01)
          (not (Seq_contains (Seq_range 0 3) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (not (Seq_contains (Seq_range 0 3) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (Seq_contains (Seq_range 0 3) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@31@01) (Seq_contains
    (Seq_range 0 3)
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@31@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@33@10@33@98-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@32@01)
          (not (Seq_contains (Seq_range 0 3) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (not (Seq_contains (Seq_range 0 3) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (Seq_contains (Seq_range 0 3) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@31@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@33@10@33@98-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@32@01)
          (not (Seq_contains (Seq_range 0 3) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (not (Seq_contains (Seq_range 0 3) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (Seq_contains (Seq_range 0 3) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@31@01) (Seq_index xs@28@01 i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@31@01) (Seq_index
    xs@28@01
    i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@33@10@33@98-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@32@01)
          (not (Seq_contains (Seq_range 0 3) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (not (Seq_contains (Seq_range 0 3) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (Seq_contains (Seq_range 0 3) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@31@01) (Seq_index
    xs@28@01
    i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@33@10@33@98-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@32@01)
          (not (Seq_contains (Seq_range 0 3) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (not (Seq_contains (Seq_range 0 3) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (Seq_contains (Seq_range 0 3) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@32@01) (Seq_index xs@28@01 i1@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@32@01) (Seq_index
    xs@28@01
    i1@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@33@10@33@98-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@32@01)
          (not (Seq_contains (Seq_range 0 3) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (not (Seq_contains (Seq_range 0 3) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (Seq_contains (Seq_range 0 3) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@32@01) (Seq_index
    xs@28@01
    i1@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@33@10@33@98-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@32@01)
          (not (Seq_contains (Seq_range 0 3) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (not (Seq_contains (Seq_range 0 3) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (Seq_contains (Seq_range 0 3) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@31@01)
        (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_index xs@28@01 i1@31@01) (Seq_index xs@28@01 i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@33@10@33@98-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@31@01)
      (and (Seq_contains (Seq_range 0 3) i2@32@01) (not (= i1@31@01 i2@32@01))))
    (not (= (Seq_index xs@28@01 i1@31@01) (Seq_index xs@28@01 i2@32@01))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@31@01) (Seq_contains
    (Seq_range 0 3)
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@31@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@32@01))
  :pattern ((Seq_contains (Seq_range 0 3) i1@31@01) (Seq_index xs@28@01 i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@31@01) (Seq_index
    xs@28@01
    i2@32@01))
  :pattern ((Seq_contains (Seq_range 0 3) i2@32@01) (Seq_index xs@28@01 i1@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@32@01) (Seq_index
    xs@28@01
    i1@31@01))
  :pattern ((Seq_index xs@28@01 i1@31@01) (Seq_index xs@28@01 i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@33@10@33@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::0 <= k && k < 3 ==> acc(xs[k].f, write))
(declare-const k@33@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 4
; [then-branch: 15 | !(0 <= k@33@01) | live]
; [else-branch: 15 | 0 <= k@33@01 | live]
(push) ; 5
; [then-branch: 15 | !(0 <= k@33@01)]
(assert (not (<= 0 k@33@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | 0 <= k@33@01]
(assert (<= 0 k@33@01))
; [eval] k < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@33@01) (not (<= 0 k@33@01))))
(assert (and (<= 0 k@33@01) (< k@33@01 3)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@33@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@33@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@34@01 $FVF<f>)
(declare-fun inv@35@01 ($Ref) Int)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@33@01 Int)) (!
  (=>
    (and (<= 0 k@33@01) (< k@33@01 3))
    (or (<= 0 k@33@01) (not (<= 0 k@33@01))))
  :pattern ((Seq_index xs@28@01 k@33@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@33@01 Int) (k2@33@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@33@01) (< k1@33@01 3))
      (and (<= 0 k2@33@01) (< k2@33@01 3))
      (= (Seq_index xs@28@01 k1@33@01) (Seq_index xs@28@01 k2@33@01)))
    (= k1@33@01 k2@33@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@33@01 Int)) (!
  (=>
    (and (<= 0 k@33@01) (< k@33@01 3))
    (and
      (= (inv@35@01 (Seq_index xs@28@01 k@33@01)) k@33@01)
      (img@36@01 (Seq_index xs@28@01 k@33@01))))
  :pattern ((Seq_index xs@28@01 k@33@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3)))
    (= (Seq_index xs@28@01 (inv@35@01 r)) r))
  :pattern ((inv@35@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@33@01 Int)) (!
  (=>
    (and (<= 0 k@33@01) (< k@33@01 3))
    (not (= (Seq_index xs@28@01 k@33@01) $Ref.null)))
  :pattern ((Seq_index xs@28@01 k@33@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [6..9)), (i2 in [6..9)) }
;     { (i1 in [6..9)), xs[i2] }
;     { (i2 in [6..9)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [6..9)), (i2 in [6..9)) } { (i1 in [6..9)), xs[i2] } { (i2 in [6..9)), xs[i1] } { xs[i1], xs[i2] } (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@38@01 Int)
(declare-const i2@39@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 4
; [then-branch: 16 | !(i1@38@01 in [6..9]) | live]
; [else-branch: 16 | i1@38@01 in [6..9] | live]
(push) ; 5
; [then-branch: 16 | !(i1@38@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | i1@38@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@38@01))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 6
; [then-branch: 17 | !(i2@39@01 in [6..9]) | live]
; [else-branch: 17 | i2@39@01 in [6..9] | live]
(push) ; 7
; [then-branch: 17 | !(i2@39@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@39@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 17 | i2@39@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@39@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@39@01)
  (not (Seq_contains (Seq_range 6 9) i2@39@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@38@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@38@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@39@01)
      (not (Seq_contains (Seq_range 6 9) i2@39@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@38@01)
  (not (Seq_contains (Seq_range 6 9) i1@38@01))))
(push) ; 4
; [then-branch: 18 | i1@38@01 in [6..9] && i2@39@01 in [6..9] && i1@38@01 != i2@39@01 | live]
; [else-branch: 18 | !(i1@38@01 in [6..9] && i2@39@01 in [6..9] && i1@38@01 != i2@39@01) | live]
(push) ; 5
; [then-branch: 18 | i1@38@01 in [6..9] && i2@39@01 in [6..9] && i1@38@01 != i2@39@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@38@01)
  (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@38@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@38@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@39@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@39@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(i1@38@01 in [6..9] && i2@39@01 in [6..9] && i1@38@01 != i2@39@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@38@01)
    (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@38@01)
    (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@38@01)
    (Seq_contains (Seq_range 6 9) i2@39@01)
    (not (= i1@38@01 i2@39@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@38@01)
    (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@38@01 Int) (i2@39@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@39@01)
          (not (Seq_contains (Seq_range 6 9) i2@39@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (not (Seq_contains (Seq_range 6 9) i1@38@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (Seq_contains (Seq_range 6 9) i2@39@01)
        (not (= i1@38@01 i2@39@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@38@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@39@01)
            (not (= i1@38@01 i2@39@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@38@01) (Seq_contains
    (Seq_range 6 9)
    i2@39@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@38@01) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@35@10@35@98-aux|)))
(assert (forall ((i1@38@01 Int) (i2@39@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@39@01)
          (not (Seq_contains (Seq_range 6 9) i2@39@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (not (Seq_contains (Seq_range 6 9) i1@38@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (Seq_contains (Seq_range 6 9) i2@39@01)
        (not (= i1@38@01 i2@39@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@38@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@39@01)
            (not (= i1@38@01 i2@39@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@38@01) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@35@10@35@98-aux|)))
(assert (forall ((i1@38@01 Int) (i2@39@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@39@01)
          (not (Seq_contains (Seq_range 6 9) i2@39@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (not (Seq_contains (Seq_range 6 9) i1@38@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (Seq_contains (Seq_range 6 9) i2@39@01)
        (not (= i1@38@01 i2@39@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@38@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@39@01)
            (not (= i1@38@01 i2@39@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@38@01) (Seq_index xs@28@01 i2@39@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@38@01) (Seq_index
    xs@28@01
    i2@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@35@10@35@98-aux|)))
(assert (forall ((i1@38@01 Int) (i2@39@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@39@01)
          (not (Seq_contains (Seq_range 6 9) i2@39@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (not (Seq_contains (Seq_range 6 9) i1@38@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (Seq_contains (Seq_range 6 9) i2@39@01)
        (not (= i1@38@01 i2@39@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@38@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@39@01)
            (not (= i1@38@01 i2@39@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@38@01) (Seq_index
    xs@28@01
    i2@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@35@10@35@98-aux|)))
(assert (forall ((i1@38@01 Int) (i2@39@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@39@01)
          (not (Seq_contains (Seq_range 6 9) i2@39@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (not (Seq_contains (Seq_range 6 9) i1@38@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (Seq_contains (Seq_range 6 9) i2@39@01)
        (not (= i1@38@01 i2@39@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@38@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@39@01)
            (not (= i1@38@01 i2@39@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))))
  :pattern ((Seq_contains (Seq_range 6 9) i2@39@01) (Seq_index xs@28@01 i1@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@39@01) (Seq_index
    xs@28@01
    i1@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@35@10@35@98-aux|)))
(assert (forall ((i1@38@01 Int) (i2@39@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@39@01)
          (not (Seq_contains (Seq_range 6 9) i2@39@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (not (Seq_contains (Seq_range 6 9) i1@38@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (Seq_contains (Seq_range 6 9) i2@39@01)
        (not (= i1@38@01 i2@39@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@38@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@39@01)
            (not (= i1@38@01 i2@39@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@39@01) (Seq_index
    xs@28@01
    i1@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@35@10@35@98-aux|)))
(assert (forall ((i1@38@01 Int) (i2@39@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@39@01)
          (not (Seq_contains (Seq_range 6 9) i2@39@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (not (Seq_contains (Seq_range 6 9) i1@38@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (Seq_contains (Seq_range 6 9) i2@39@01)
        (not (= i1@38@01 i2@39@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@38@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@39@01)
            (not (= i1@38@01 i2@39@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@38@01)
        (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))))
  :pattern ((Seq_index xs@28@01 i1@38@01) (Seq_index xs@28@01 i2@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@35@10@35@98-aux|)))
(assert (forall ((i1@38@01 Int) (i2@39@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@38@01)
      (and (Seq_contains (Seq_range 6 9) i2@39@01) (not (= i1@38@01 i2@39@01))))
    (not (= (Seq_index xs@28@01 i1@38@01) (Seq_index xs@28@01 i2@39@01))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@38@01) (Seq_contains
    (Seq_range 6 9)
    i2@39@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@38@01) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@39@01))
  :pattern ((Seq_contains (Seq_range 6 9) i1@38@01) (Seq_index xs@28@01 i2@39@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@38@01) (Seq_index
    xs@28@01
    i2@39@01))
  :pattern ((Seq_contains (Seq_range 6 9) i2@39@01) (Seq_index xs@28@01 i1@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@39@01) (Seq_index
    xs@28@01
    i1@38@01))
  :pattern ((Seq_index xs@28@01 i1@38@01) (Seq_index xs@28@01 i2@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@35@10@35@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::6 <= k && k < 9 ==> acc(xs[k].f, write))
(declare-const k@40@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 4
; [then-branch: 19 | !(6 <= k@40@01) | live]
; [else-branch: 19 | 6 <= k@40@01 | live]
(push) ; 5
; [then-branch: 19 | !(6 <= k@40@01)]
(assert (not (<= 6 k@40@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | 6 <= k@40@01]
(assert (<= 6 k@40@01))
; [eval] k < 9
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@40@01) (not (<= 6 k@40@01))))
(assert (and (<= 6 k@40@01) (< k@40@01 9)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@40@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@40@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@41@01 $FVF<f>)
(declare-fun inv@42@01 ($Ref) Int)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@40@01 Int)) (!
  (=>
    (and (<= 6 k@40@01) (< k@40@01 9))
    (or (<= 6 k@40@01) (not (<= 6 k@40@01))))
  :pattern ((Seq_index xs@28@01 k@40@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@40@01 Int) (k2@40@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@40@01) (< k1@40@01 9))
      (and (<= 6 k2@40@01) (< k2@40@01 9))
      (= (Seq_index xs@28@01 k1@40@01) (Seq_index xs@28@01 k2@40@01)))
    (= k1@40@01 k2@40@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@40@01 Int)) (!
  (=>
    (and (<= 6 k@40@01) (< k@40@01 9))
    (and
      (= (inv@42@01 (Seq_index xs@28@01 k@40@01)) k@40@01)
      (img@43@01 (Seq_index xs@28@01 k@40@01))))
  :pattern ((Seq_index xs@28@01 k@40@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
    (= (Seq_index xs@28@01 (inv@42@01 r)) r))
  :pattern ((inv@42@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@40@01 Int)) (!
  (=>
    (and (<= 6 k@40@01) (< k@40@01 9))
    (not (= (Seq_index xs@28@01 k@40@01) $Ref.null)))
  :pattern ((Seq_index xs@28@01 k@40@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@28@01 k@40@01) (Seq_index xs@28@01 k@33@01))
    (=
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
      (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3)))))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 10 == fun02(xs)
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] 10 == fun02(xs)
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@45@01 Int)
(declare-const i2@46@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 20 | !(i1@45@01 in [0..3]) | live]
; [else-branch: 20 | i1@45@01 in [0..3] | live]
(push) ; 6
; [then-branch: 20 | !(i1@45@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@45@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 20 | i1@45@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@45@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 21 | !(i2@46@01 in [0..3]) | live]
; [else-branch: 21 | i2@46@01 in [0..3] | live]
(push) ; 8
; [then-branch: 21 | !(i2@46@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@46@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 21 | i2@46@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@46@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@46@01)
  (not (Seq_contains (Seq_range 0 3) i2@46@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@45@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@45@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@46@01)
      (not (Seq_contains (Seq_range 0 3) i2@46@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@45@01)
  (not (Seq_contains (Seq_range 0 3) i1@45@01))))
(push) ; 5
; [then-branch: 22 | i1@45@01 in [0..3] && i2@46@01 in [0..3] && i1@45@01 != i2@46@01 | live]
; [else-branch: 22 | !(i1@45@01 in [0..3] && i2@46@01 in [0..3] && i1@45@01 != i2@46@01) | live]
(push) ; 6
; [then-branch: 22 | i1@45@01 in [0..3] && i2@46@01 in [0..3] && i1@45@01 != i2@46@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@45@01)
  (and (Seq_contains (Seq_range 0 3) i2@46@01) (not (= i1@45@01 i2@46@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@45@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@45@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@46@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@46@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 22 | !(i1@45@01 in [0..3] && i2@46@01 in [0..3] && i1@45@01 != i2@46@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@45@01)
    (and (Seq_contains (Seq_range 0 3) i2@46@01) (not (= i1@45@01 i2@46@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@45@01)
    (and (Seq_contains (Seq_range 0 3) i2@46@01) (not (= i1@45@01 i2@46@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@45@01)
    (Seq_contains (Seq_range 0 3) i2@46@01)
    (not (= i1@45@01 i2@46@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@45@01)
      (and (Seq_contains (Seq_range 0 3) i2@46@01) (not (= i1@45@01 i2@46@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@45@01)
    (and (Seq_contains (Seq_range 0 3) i2@46@01) (not (= i1@45@01 i2@46@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@45@01 Int) (i2@46@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@45@01)
      (and (Seq_contains (Seq_range 0 3) i2@46@01) (not (= i1@45@01 i2@46@01))))
    (not (= (Seq_index xs@28@01 i1@45@01) (Seq_index xs@28@01 i2@46@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@45@01 Int) (i2@46@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@45@01)
      (and (Seq_contains (Seq_range 0 3) i2@46@01) (not (= i1@45@01 i2@46@01))))
    (not (= (Seq_index xs@28@01 i1@45@01) (Seq_index xs@28@01 i2@46@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100|)))
(declare-const k@47@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 23 | !(0 <= k@47@01) | live]
; [else-branch: 23 | 0 <= k@47@01 | live]
(push) ; 6
; [then-branch: 23 | !(0 <= k@47@01)]
(assert (not (<= 0 k@47@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 23 | 0 <= k@47@01]
(assert (<= 0 k@47@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@47@01) (not (<= 0 k@47@01))))
(assert (and (<= 0 k@47@01) (< k@47@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@47@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@47@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@48@01 ($Ref) Int)
(declare-fun img@49@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@47@01 Int)) (!
  (=>
    (and (<= 0 k@47@01) (< k@47@01 3))
    (or (<= 0 k@47@01) (not (<= 0 k@47@01))))
  :pattern ((Seq_index xs@28@01 k@47@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@47@01 Int) (k2@47@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@47@01) (< k1@47@01 3))
      (and (<= 0 k2@47@01) (< k2@47@01 3))
      (= (Seq_index xs@28@01 k1@47@01) (Seq_index xs@28@01 k2@47@01)))
    (= k1@47@01 k2@47@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@47@01 Int)) (!
  (=>
    (and (<= 0 k@47@01) (< k@47@01 3))
    (and
      (= (inv@48@01 (Seq_index xs@28@01 k@47@01)) k@47@01)
      (img@49@01 (Seq_index xs@28@01 k@47@01))))
  :pattern ((Seq_index xs@28@01 k@47@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@49@01 r) (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)))
    (= (Seq_index xs@28@01 (inv@48@01 r)) r))
  :pattern ((inv@48@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3))
      (img@49@01 r)
      (= r (Seq_index xs@28@01 (inv@48@01 r))))
    ($Perm.min
      (ite
        (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3))
      (img@49@01 r)
      (= r (Seq_index xs@28@01 (inv@48@01 r))))
    ($Perm.min
      (ite
        (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@50@01 r)))
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
        (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@50@01 r))
    $Perm.No)
  
  :qid |quant-u-55|))))
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
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3))
      (img@49@01 r)
      (= r (Seq_index xs@28@01 (inv@48@01 r))))
    (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@52@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@52@01  $FVF<f>)))
      (and (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)) (img@49@01 r)))
    (=>
      (and (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)) (img@49@01 r))
      (Set_in r ($FVF.domain_f (as sm@52@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@52@01  $FVF<f>))))
  :qid |qp.fvfDomDef8|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)) (img@49@01 r))
      (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3))))
    (= ($FVF.lookup_f (as sm@52@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@52@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)) (img@49@01 r))
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9))))
    (= ($FVF.lookup_f (as sm@52@01  $FVF<f>) r) ($FVF.lookup_f $t@41@01 r)))
  :pattern (($FVF.lookup_f (as sm@52@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@41@01 r))
  :qid |qp.fvfValDef7|)))
; [eval] (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@53@01 Int)
(declare-const i2@54@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 5
; [then-branch: 24 | !(i1@53@01 in [6..9]) | live]
; [else-branch: 24 | i1@53@01 in [6..9] | live]
(push) ; 6
; [then-branch: 24 | !(i1@53@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@53@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 24 | i1@53@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@53@01))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 25 | !(i2@54@01 in [6..9]) | live]
; [else-branch: 25 | i2@54@01 in [6..9] | live]
(push) ; 8
; [then-branch: 25 | !(i2@54@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@54@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 25 | i2@54@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@54@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@54@01)
  (not (Seq_contains (Seq_range 6 9) i2@54@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@53@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@53@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@54@01)
      (not (Seq_contains (Seq_range 6 9) i2@54@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@53@01)
  (not (Seq_contains (Seq_range 6 9) i1@53@01))))
(push) ; 5
; [then-branch: 26 | i1@53@01 in [6..9] && i2@54@01 in [6..9] && i1@53@01 != i2@54@01 | live]
; [else-branch: 26 | !(i1@53@01 in [6..9] && i2@54@01 in [6..9] && i1@53@01 != i2@54@01) | live]
(push) ; 6
; [then-branch: 26 | i1@53@01 in [6..9] && i2@54@01 in [6..9] && i1@53@01 != i2@54@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@53@01)
  (and (Seq_contains (Seq_range 6 9) i2@54@01) (not (= i1@53@01 i2@54@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@53@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@53@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@54@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@54@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 26 | !(i1@53@01 in [6..9] && i2@54@01 in [6..9] && i1@53@01 != i2@54@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@53@01)
    (and (Seq_contains (Seq_range 6 9) i2@54@01) (not (= i1@53@01 i2@54@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@53@01)
    (and (Seq_contains (Seq_range 6 9) i2@54@01) (not (= i1@53@01 i2@54@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@53@01)
    (Seq_contains (Seq_range 6 9) i2@54@01)
    (not (= i1@53@01 i2@54@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@53@01)
      (and (Seq_contains (Seq_range 6 9) i2@54@01) (not (= i1@53@01 i2@54@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@53@01)
    (and (Seq_contains (Seq_range 6 9) i2@54@01) (not (= i1@53@01 i2@54@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@53@01 Int) (i2@54@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@53@01)
      (and (Seq_contains (Seq_range 6 9) i2@54@01) (not (= i1@53@01 i2@54@01))))
    (not (= (Seq_index xs@28@01 i1@53@01) (Seq_index xs@28@01 i2@54@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@53@01 Int) (i2@54@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@53@01)
      (and (Seq_contains (Seq_range 6 9) i2@54@01) (not (= i1@53@01 i2@54@01))))
    (not (= (Seq_index xs@28@01 i1@53@01) (Seq_index xs@28@01 i2@54@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100|)))
(declare-const k@55@01 Int)
(push) ; 4
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 5
; [then-branch: 27 | !(6 <= k@55@01) | live]
; [else-branch: 27 | 6 <= k@55@01 | live]
(push) ; 6
; [then-branch: 27 | !(6 <= k@55@01)]
(assert (not (<= 6 k@55@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | 6 <= k@55@01]
(assert (<= 6 k@55@01))
; [eval] k < 9
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@55@01) (not (<= 6 k@55@01))))
(assert (and (<= 6 k@55@01) (< k@55@01 9)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@55@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@55@01 (Seq_length xs@28@01))))
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
(assert (forall ((k@55@01 Int)) (!
  (=>
    (and (<= 6 k@55@01) (< k@55@01 9))
    (or (<= 6 k@55@01) (not (<= 6 k@55@01))))
  :pattern ((Seq_index xs@28@01 k@55@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@55@01 Int) (k2@55@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@55@01) (< k1@55@01 9))
      (and (<= 6 k2@55@01) (< k2@55@01 9))
      (= (Seq_index xs@28@01 k1@55@01) (Seq_index xs@28@01 k2@55@01)))
    (= k1@55@01 k2@55@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@55@01 Int)) (!
  (=>
    (and (<= 6 k@55@01) (< k@55@01 9))
    (and
      (= (inv@56@01 (Seq_index xs@28@01 k@55@01)) k@55@01)
      (img@57@01 (Seq_index xs@28@01 k@55@01))))
  :pattern ((Seq_index xs@28@01 k@55@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@57@01 r) (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9)))
    (= (Seq_index xs@28@01 (inv@56@01 r)) r))
  :pattern ((inv@56@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9))
      (img@57@01 r)
      (= r (Seq_index xs@28@01 (inv@56@01 r))))
    ($Perm.min
      (ite
        (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
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
        (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (pTaken@58@01 r))
    $Perm.No)
  
  :qid |quant-u-59|))))
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
      (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9))
      (img@57@01 r)
      (= r (Seq_index xs@28@01 (inv@56@01 r))))
    (= (- $Perm.Write (pTaken@58@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@59@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@59@01  $FVF<f>)))
      (and (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9)) (img@57@01 r)))
    (=>
      (and (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9)) (img@57@01 r))
      (Set_in r ($FVF.domain_f (as sm@59@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@59@01  $FVF<f>))))
  :qid |qp.fvfDomDef10|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9)) (img@57@01 r))
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9))))
    (= ($FVF.lookup_f (as sm@59@01  $FVF<f>) r) ($FVF.lookup_f $t@41@01 r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@41@01 r))
  :qid |qp.fvfValDef9|)))
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@52@01  $FVF<f>))
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@59@01  $FVF<f>)))))) xs@28@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@47@01 Int)) (!
  (=>
    (and (<= 0 k@47@01) (< k@47@01 3))
    (and
      (= (inv@48@01 (Seq_index xs@28@01 k@47@01)) k@47@01)
      (img@49@01 (Seq_index xs@28@01 k@47@01))))
  :pattern ((Seq_index xs@28@01 k@47@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@49@01 r) (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)))
    (= (Seq_index xs@28@01 (inv@48@01 r)) r))
  :pattern ((inv@48@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@52@01  $FVF<f>)))
      (and (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)) (img@49@01 r)))
    (=>
      (and (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)) (img@49@01 r))
      (Set_in r ($FVF.domain_f (as sm@52@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@52@01  $FVF<f>))))
  :qid |qp.fvfDomDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)) (img@49@01 r))
      (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3))))
    (= ($FVF.lookup_f (as sm@52@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@52@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) 3)) (img@49@01 r))
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9))))
    (= ($FVF.lookup_f (as sm@52@01  $FVF<f>) r) ($FVF.lookup_f $t@41@01 r)))
  :pattern (($FVF.lookup_f (as sm@52@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@41@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((k@55@01 Int)) (!
  (=>
    (and (<= 6 k@55@01) (< k@55@01 9))
    (and
      (= (inv@56@01 (Seq_index xs@28@01 k@55@01)) k@55@01)
      (img@57@01 (Seq_index xs@28@01 k@55@01))))
  :pattern ((Seq_index xs@28@01 k@55@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@57@01 r) (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9)))
    (= (Seq_index xs@28@01 (inv@56@01 r)) r))
  :pattern ((inv@56@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@59@01  $FVF<f>)))
      (and (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9)) (img@57@01 r)))
    (=>
      (and (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9)) (img@57@01 r))
      (Set_in r ($FVF.domain_f (as sm@59@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@59@01  $FVF<f>))))
  :qid |qp.fvfDomDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@56@01 r)) (< (inv@56@01 r) 9)) (img@57@01 r))
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9))))
    (= ($FVF.lookup_f (as sm@59@01  $FVF<f>) r) ($FVF.lookup_f $t@41@01 r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@41@01 r))
  :qid |qp.fvfValDef9|)))
(assert (and
  (forall ((i1@45@01 Int) (i2@46@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@45@01)
        (and (Seq_contains (Seq_range 0 3) i2@46@01) (not (= i1@45@01 i2@46@01))))
      (not (= (Seq_index xs@28@01 i1@45@01) (Seq_index xs@28@01 i2@46@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100|))
  (forall ((k@47@01 Int)) (!
    (=>
      (and (<= 0 k@47@01) (< k@47@01 3))
      (or (<= 0 k@47@01) (not (<= 0 k@47@01))))
    :pattern ((Seq_index xs@28@01 k@47@01))
    :qid |f-aux|))
  (forall ((i1@53@01 Int) (i2@54@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@53@01)
        (and (Seq_contains (Seq_range 6 9) i2@54@01) (not (= i1@53@01 i2@54@01))))
      (not (= (Seq_index xs@28@01 i1@53@01) (Seq_index xs@28@01 i2@54@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100|))
  (forall ((k@55@01 Int)) (!
    (=>
      (and (<= 6 k@55@01) (< k@55@01 9))
      (or (<= 6 k@55@01) (not (<= 6 k@55@01))))
    :pattern ((Seq_index xs@28@01 k@55@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@52@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@59@01  $FVF<f>)))))) xs@28@01)))
(assert (=
  10
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@52@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@59@01  $FVF<f>)))))) xs@28@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert 10 == fun02(xs)
; [eval] 10 == fun02(xs)
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@60@01 Int)
(declare-const i2@61@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 28 | !(i1@60@01 in [0..3]) | live]
; [else-branch: 28 | i1@60@01 in [0..3] | live]
(push) ; 6
; [then-branch: 28 | !(i1@60@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@60@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 28 | i1@60@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@60@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 29 | !(i2@61@01 in [0..3]) | live]
; [else-branch: 29 | i2@61@01 in [0..3] | live]
(push) ; 8
; [then-branch: 29 | !(i2@61@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@61@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 29 | i2@61@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@61@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@61@01)
  (not (Seq_contains (Seq_range 0 3) i2@61@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@60@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@60@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@61@01)
      (not (Seq_contains (Seq_range 0 3) i2@61@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@60@01)
  (not (Seq_contains (Seq_range 0 3) i1@60@01))))
(push) ; 5
; [then-branch: 30 | i1@60@01 in [0..3] && i2@61@01 in [0..3] && i1@60@01 != i2@61@01 | live]
; [else-branch: 30 | !(i1@60@01 in [0..3] && i2@61@01 in [0..3] && i1@60@01 != i2@61@01) | live]
(push) ; 6
; [then-branch: 30 | i1@60@01 in [0..3] && i2@61@01 in [0..3] && i1@60@01 != i2@61@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@60@01)
  (and (Seq_contains (Seq_range 0 3) i2@61@01) (not (= i1@60@01 i2@61@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@60@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@60@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@61@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@61@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 30 | !(i1@60@01 in [0..3] && i2@61@01 in [0..3] && i1@60@01 != i2@61@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@60@01)
    (and (Seq_contains (Seq_range 0 3) i2@61@01) (not (= i1@60@01 i2@61@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@60@01)
    (and (Seq_contains (Seq_range 0 3) i2@61@01) (not (= i1@60@01 i2@61@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@60@01)
    (Seq_contains (Seq_range 0 3) i2@61@01)
    (not (= i1@60@01 i2@61@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@60@01)
      (and (Seq_contains (Seq_range 0 3) i2@61@01) (not (= i1@60@01 i2@61@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@60@01)
    (and (Seq_contains (Seq_range 0 3) i2@61@01) (not (= i1@60@01 i2@61@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@60@01 Int) (i2@61@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@60@01)
      (and (Seq_contains (Seq_range 0 3) i2@61@01) (not (= i1@60@01 i2@61@01))))
    (not (= (Seq_index xs@28@01 i1@60@01) (Seq_index xs@28@01 i2@61@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@60@01 Int) (i2@61@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@60@01)
      (and (Seq_contains (Seq_range 0 3) i2@61@01) (not (= i1@60@01 i2@61@01))))
    (not (= (Seq_index xs@28@01 i1@60@01) (Seq_index xs@28@01 i2@61@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100|)))
(declare-const k@62@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 31 | !(0 <= k@62@01) | live]
; [else-branch: 31 | 0 <= k@62@01 | live]
(push) ; 6
; [then-branch: 31 | !(0 <= k@62@01)]
(assert (not (<= 0 k@62@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 31 | 0 <= k@62@01]
(assert (<= 0 k@62@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@62@01) (not (<= 0 k@62@01))))
(assert (and (<= 0 k@62@01) (< k@62@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@62@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@62@01 (Seq_length xs@28@01))))
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
(assert (forall ((k@62@01 Int)) (!
  (=>
    (and (<= 0 k@62@01) (< k@62@01 3))
    (or (<= 0 k@62@01) (not (<= 0 k@62@01))))
  :pattern ((Seq_index xs@28@01 k@62@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@62@01 Int) (k2@62@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@62@01) (< k1@62@01 3))
      (and (<= 0 k2@62@01) (< k2@62@01 3))
      (= (Seq_index xs@28@01 k1@62@01) (Seq_index xs@28@01 k2@62@01)))
    (= k1@62@01 k2@62@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@62@01 Int)) (!
  (=>
    (and (<= 0 k@62@01) (< k@62@01 3))
    (and
      (= (inv@63@01 (Seq_index xs@28@01 k@62@01)) k@62@01)
      (img@64@01 (Seq_index xs@28@01 k@62@01))))
  :pattern ((Seq_index xs@28@01 k@62@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@64@01 r) (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)))
    (= (Seq_index xs@28@01 (inv@63@01 r)) r))
  :pattern ((inv@63@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@65@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3))
      (img@64@01 r)
      (= r (Seq_index xs@28@01 (inv@63@01 r))))
    ($Perm.min
      (ite
        (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@66@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3))
      (img@64@01 r)
      (= r (Seq_index xs@28@01 (inv@63@01 r))))
    ($Perm.min
      (ite
        (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@65@01 r)))
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
        (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@65@01 r))
    $Perm.No)
  
  :qid |quant-u-63|))))
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
      (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3))
      (img@64@01 r)
      (= r (Seq_index xs@28@01 (inv@63@01 r))))
    (= (- $Perm.Write (pTaken@65@01 r)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@67@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@67@01  $FVF<f>)))
      (and (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)) (img@64@01 r)))
    (=>
      (and (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)) (img@64@01 r))
      (Set_in r ($FVF.domain_f (as sm@67@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@67@01  $FVF<f>))))
  :qid |qp.fvfDomDef13|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)) (img@64@01 r))
      (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3))))
    (= ($FVF.lookup_f (as sm@67@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)) (img@64@01 r))
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9))))
    (= ($FVF.lookup_f (as sm@67@01  $FVF<f>) r) ($FVF.lookup_f $t@41@01 r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@41@01 r))
  :qid |qp.fvfValDef12|)))
; [eval] (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@68@01 Int)
(declare-const i2@69@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 5
; [then-branch: 32 | !(i1@68@01 in [6..9]) | live]
; [else-branch: 32 | i1@68@01 in [6..9] | live]
(push) ; 6
; [then-branch: 32 | !(i1@68@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@68@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 32 | i1@68@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@68@01))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 33 | !(i2@69@01 in [6..9]) | live]
; [else-branch: 33 | i2@69@01 in [6..9] | live]
(push) ; 8
; [then-branch: 33 | !(i2@69@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@69@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 33 | i2@69@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@69@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@69@01)
  (not (Seq_contains (Seq_range 6 9) i2@69@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@68@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@68@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@69@01)
      (not (Seq_contains (Seq_range 6 9) i2@69@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@68@01)
  (not (Seq_contains (Seq_range 6 9) i1@68@01))))
(push) ; 5
; [then-branch: 34 | i1@68@01 in [6..9] && i2@69@01 in [6..9] && i1@68@01 != i2@69@01 | live]
; [else-branch: 34 | !(i1@68@01 in [6..9] && i2@69@01 in [6..9] && i1@68@01 != i2@69@01) | live]
(push) ; 6
; [then-branch: 34 | i1@68@01 in [6..9] && i2@69@01 in [6..9] && i1@68@01 != i2@69@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@68@01)
  (and (Seq_contains (Seq_range 6 9) i2@69@01) (not (= i1@68@01 i2@69@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@68@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@68@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@69@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@69@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 34 | !(i1@68@01 in [6..9] && i2@69@01 in [6..9] && i1@68@01 != i2@69@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@68@01)
    (and (Seq_contains (Seq_range 6 9) i2@69@01) (not (= i1@68@01 i2@69@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@68@01)
    (and (Seq_contains (Seq_range 6 9) i2@69@01) (not (= i1@68@01 i2@69@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@68@01)
    (Seq_contains (Seq_range 6 9) i2@69@01)
    (not (= i1@68@01 i2@69@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@68@01)
      (and (Seq_contains (Seq_range 6 9) i2@69@01) (not (= i1@68@01 i2@69@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@68@01)
    (and (Seq_contains (Seq_range 6 9) i2@69@01) (not (= i1@68@01 i2@69@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@68@01 Int) (i2@69@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@68@01)
      (and (Seq_contains (Seq_range 6 9) i2@69@01) (not (= i1@68@01 i2@69@01))))
    (not (= (Seq_index xs@28@01 i1@68@01) (Seq_index xs@28@01 i2@69@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@68@01 Int) (i2@69@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@68@01)
      (and (Seq_contains (Seq_range 6 9) i2@69@01) (not (= i1@68@01 i2@69@01))))
    (not (= (Seq_index xs@28@01 i1@68@01) (Seq_index xs@28@01 i2@69@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100|)))
(declare-const k@70@01 Int)
(push) ; 4
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 5
; [then-branch: 35 | !(6 <= k@70@01) | live]
; [else-branch: 35 | 6 <= k@70@01 | live]
(push) ; 6
; [then-branch: 35 | !(6 <= k@70@01)]
(assert (not (<= 6 k@70@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 35 | 6 <= k@70@01]
(assert (<= 6 k@70@01))
; [eval] k < 9
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@70@01) (not (<= 6 k@70@01))))
(assert (and (<= 6 k@70@01) (< k@70@01 9)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@70@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@70@01 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@71@01 ($Ref) Int)
(declare-fun img@72@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@70@01 Int)) (!
  (=>
    (and (<= 6 k@70@01) (< k@70@01 9))
    (or (<= 6 k@70@01) (not (<= 6 k@70@01))))
  :pattern ((Seq_index xs@28@01 k@70@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@70@01 Int) (k2@70@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@70@01) (< k1@70@01 9))
      (and (<= 6 k2@70@01) (< k2@70@01 9))
      (= (Seq_index xs@28@01 k1@70@01) (Seq_index xs@28@01 k2@70@01)))
    (= k1@70@01 k2@70@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@70@01 Int)) (!
  (=>
    (and (<= 6 k@70@01) (< k@70@01 9))
    (and
      (= (inv@71@01 (Seq_index xs@28@01 k@70@01)) k@70@01)
      (img@72@01 (Seq_index xs@28@01 k@70@01))))
  :pattern ((Seq_index xs@28@01 k@70@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@72@01 r) (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9)))
    (= (Seq_index xs@28@01 (inv@71@01 r)) r))
  :pattern ((inv@71@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@73@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9))
      (img@72@01 r)
      (= r (Seq_index xs@28@01 (inv@71@01 r))))
    ($Perm.min
      (ite
        (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
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
        (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (pTaken@73@01 r))
    $Perm.No)
  
  :qid |quant-u-67|))))
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
      (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9))
      (img@72@01 r)
      (= r (Seq_index xs@28@01 (inv@71@01 r))))
    (= (- $Perm.Write (pTaken@73@01 r)) $Perm.No))
  
  :qid |quant-u-68|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@74@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>)))
      (and (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9)) (img@72@01 r)))
    (=>
      (and (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9)) (img@72@01 r))
      (Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9)) (img@72@01 r))
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9))))
    (= ($FVF.lookup_f (as sm@74@01  $FVF<f>) r) ($FVF.lookup_f $t@41@01 r)))
  :pattern (($FVF.lookup_f (as sm@74@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@41@01 r))
  :qid |qp.fvfValDef14|)))
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@67@01  $FVF<f>))
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@74@01  $FVF<f>)))))) xs@28@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@62@01 Int)) (!
  (=>
    (and (<= 0 k@62@01) (< k@62@01 3))
    (and
      (= (inv@63@01 (Seq_index xs@28@01 k@62@01)) k@62@01)
      (img@64@01 (Seq_index xs@28@01 k@62@01))))
  :pattern ((Seq_index xs@28@01 k@62@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@64@01 r) (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)))
    (= (Seq_index xs@28@01 (inv@63@01 r)) r))
  :pattern ((inv@63@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@67@01  $FVF<f>)))
      (and (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)) (img@64@01 r)))
    (=>
      (and (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)) (img@64@01 r))
      (Set_in r ($FVF.domain_f (as sm@67@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@67@01  $FVF<f>))))
  :qid |qp.fvfDomDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)) (img@64@01 r))
      (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3))))
    (= ($FVF.lookup_f (as sm@67@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@63@01 r)) (< (inv@63@01 r) 3)) (img@64@01 r))
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9))))
    (= ($FVF.lookup_f (as sm@67@01  $FVF<f>) r) ($FVF.lookup_f $t@41@01 r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@41@01 r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((k@70@01 Int)) (!
  (=>
    (and (<= 6 k@70@01) (< k@70@01 9))
    (and
      (= (inv@71@01 (Seq_index xs@28@01 k@70@01)) k@70@01)
      (img@72@01 (Seq_index xs@28@01 k@70@01))))
  :pattern ((Seq_index xs@28@01 k@70@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@72@01 r) (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9)))
    (= (Seq_index xs@28@01 (inv@71@01 r)) r))
  :pattern ((inv@71@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>)))
      (and (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9)) (img@72@01 r)))
    (=>
      (and (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9)) (img@72@01 r))
      (Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@71@01 r)) (< (inv@71@01 r) 9)) (img@72@01 r))
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9))))
    (= ($FVF.lookup_f (as sm@74@01  $FVF<f>) r) ($FVF.lookup_f $t@41@01 r)))
  :pattern (($FVF.lookup_f (as sm@74@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@41@01 r))
  :qid |qp.fvfValDef14|)))
(assert (and
  (forall ((i1@60@01 Int) (i2@61@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@60@01)
        (and (Seq_contains (Seq_range 0 3) i2@61@01) (not (= i1@60@01 i2@61@01))))
      (not (= (Seq_index xs@28@01 i1@60@01) (Seq_index xs@28@01 i2@61@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100|))
  (forall ((k@62@01 Int)) (!
    (=>
      (and (<= 0 k@62@01) (< k@62@01 3))
      (or (<= 0 k@62@01) (not (<= 0 k@62@01))))
    :pattern ((Seq_index xs@28@01 k@62@01))
    :qid |f-aux|))
  (forall ((i1@68@01 Int) (i2@69@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@68@01)
        (and (Seq_contains (Seq_range 6 9) i2@69@01) (not (= i1@68@01 i2@69@01))))
      (not (= (Seq_index xs@28@01 i1@68@01) (Seq_index xs@28@01 i2@69@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100|))
  (forall ((k@70@01 Int)) (!
    (=>
      (and (<= 6 k@70@01) (< k@70@01 9))
      (or (<= 6 k@70@01) (not (<= 6 k@70@01))))
    :pattern ((Seq_index xs@28@01 k@70@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@67@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@74@01  $FVF<f>)))))) xs@28@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@67@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@74@01  $FVF<f>)))))) xs@28@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  10
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@67@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@74@01  $FVF<f>)))))) xs@28@01)))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@28@01 k@33@01) (Seq_index xs@28@01 k@40@01))
    (=
      (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3)))
      (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))))
  
  :qid |quant-u-69|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@75@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3)))
    (= ($FVF.lookup_f (as sm@75@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@75@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
    (= ($FVF.lookup_f (as sm@75@01  $FVF<f>) r) ($FVF.lookup_f $t@41@01 r)))
  :pattern (($FVF.lookup_f (as sm@75@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@41@01 r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@76@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@76@01  $FPM) r)
    (+
      (ite
        (and (img@36@01 r) (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@43@01 r) (and (<= 6 (inv@42@01 r)) (< (inv@42@01 r) 9)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@76@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@76@01  $FPM) r) $Perm.Write)
  :pattern ((inv@35@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@76@01  $FPM) r) $Perm.Write)
  :pattern ((inv@42@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const xs@77@01 Seq<$Ref>)
(declare-const xs@78@01 Seq<$Ref>)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale |xs| > 10
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@78@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..3)), (i2 in [0..3)) }
;     { (i1 in [0..3)), xs[i2] }
;     { (i2 in [0..3)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@80@01 $Snap)
(assert (= $t@80@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@81@01 Int)
(declare-const i2@82@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 4
; [then-branch: 36 | !(i1@81@01 in [0..3]) | live]
; [else-branch: 36 | i1@81@01 in [0..3] | live]
(push) ; 5
; [then-branch: 36 | !(i1@81@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@81@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | i1@81@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@81@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 6
; [then-branch: 37 | !(i2@82@01 in [0..3]) | live]
; [else-branch: 37 | i2@82@01 in [0..3] | live]
(push) ; 7
; [then-branch: 37 | !(i2@82@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@82@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 37 | i2@82@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@82@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@82@01)
  (not (Seq_contains (Seq_range 0 3) i2@82@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@81@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@81@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@82@01)
      (not (Seq_contains (Seq_range 0 3) i2@82@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@81@01)
  (not (Seq_contains (Seq_range 0 3) i1@81@01))))
(push) ; 4
; [then-branch: 38 | i1@81@01 in [0..3] && i2@82@01 in [0..3] && i1@81@01 != i2@82@01 | live]
; [else-branch: 38 | !(i1@81@01 in [0..3] && i2@82@01 in [0..3] && i1@81@01 != i2@82@01) | live]
(push) ; 5
; [then-branch: 38 | i1@81@01 in [0..3] && i2@82@01 in [0..3] && i1@81@01 != i2@82@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@81@01)
  (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@81@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@81@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@82@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@82@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 38 | !(i1@81@01 in [0..3] && i2@82@01 in [0..3] && i1@81@01 != i2@82@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@81@01)
    (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@81@01)
    (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@81@01)
    (Seq_contains (Seq_range 0 3) i2@82@01)
    (not (= i1@81@01 i2@82@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@81@01)
    (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@81@01 Int) (i2@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@82@01)
          (not (Seq_contains (Seq_range 0 3) i2@82@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (not (Seq_contains (Seq_range 0 3) i1@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (Seq_contains (Seq_range 0 3) i2@82@01)
        (not (= i1@81@01 i2@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@81@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@82@01)
            (not (= i1@81@01 i2@82@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@81@01) (Seq_contains
    (Seq_range 0 3)
    i2@82@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@81@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@55@10@55@98-aux|)))
(assert (forall ((i1@81@01 Int) (i2@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@82@01)
          (not (Seq_contains (Seq_range 0 3) i2@82@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (not (Seq_contains (Seq_range 0 3) i1@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (Seq_contains (Seq_range 0 3) i2@82@01)
        (not (= i1@81@01 i2@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@81@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@82@01)
            (not (= i1@81@01 i2@82@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@81@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@55@10@55@98-aux|)))
(assert (forall ((i1@81@01 Int) (i2@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@82@01)
          (not (Seq_contains (Seq_range 0 3) i2@82@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (not (Seq_contains (Seq_range 0 3) i1@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (Seq_contains (Seq_range 0 3) i2@82@01)
        (not (= i1@81@01 i2@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@81@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@82@01)
            (not (= i1@81@01 i2@82@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@81@01) (Seq_index xs@78@01 i2@82@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@81@01) (Seq_index
    xs@78@01
    i2@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@55@10@55@98-aux|)))
(assert (forall ((i1@81@01 Int) (i2@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@82@01)
          (not (Seq_contains (Seq_range 0 3) i2@82@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (not (Seq_contains (Seq_range 0 3) i1@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (Seq_contains (Seq_range 0 3) i2@82@01)
        (not (= i1@81@01 i2@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@81@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@82@01)
            (not (= i1@81@01 i2@82@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@81@01) (Seq_index
    xs@78@01
    i2@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@55@10@55@98-aux|)))
(assert (forall ((i1@81@01 Int) (i2@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@82@01)
          (not (Seq_contains (Seq_range 0 3) i2@82@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (not (Seq_contains (Seq_range 0 3) i1@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (Seq_contains (Seq_range 0 3) i2@82@01)
        (not (= i1@81@01 i2@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@81@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@82@01)
            (not (= i1@81@01 i2@82@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@82@01) (Seq_index xs@78@01 i1@81@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@82@01) (Seq_index
    xs@78@01
    i1@81@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@55@10@55@98-aux|)))
(assert (forall ((i1@81@01 Int) (i2@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@82@01)
          (not (Seq_contains (Seq_range 0 3) i2@82@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (not (Seq_contains (Seq_range 0 3) i1@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (Seq_contains (Seq_range 0 3) i2@82@01)
        (not (= i1@81@01 i2@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@81@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@82@01)
            (not (= i1@81@01 i2@82@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@82@01) (Seq_index
    xs@78@01
    i1@81@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@55@10@55@98-aux|)))
(assert (forall ((i1@81@01 Int) (i2@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@82@01)
          (not (Seq_contains (Seq_range 0 3) i2@82@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (not (Seq_contains (Seq_range 0 3) i1@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (Seq_contains (Seq_range 0 3) i2@82@01)
        (not (= i1@81@01 i2@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@81@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@82@01)
            (not (= i1@81@01 i2@82@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@81@01)
        (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))))
  :pattern ((Seq_index xs@78@01 i1@81@01) (Seq_index xs@78@01 i2@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@55@10@55@98-aux|)))
(assert (forall ((i1@81@01 Int) (i2@82@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@81@01)
      (and (Seq_contains (Seq_range 0 3) i2@82@01) (not (= i1@81@01 i2@82@01))))
    (not (= (Seq_index xs@78@01 i1@81@01) (Seq_index xs@78@01 i2@82@01))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@81@01) (Seq_contains
    (Seq_range 0 3)
    i2@82@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@81@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@82@01))
  :pattern ((Seq_contains (Seq_range 0 3) i1@81@01) (Seq_index xs@78@01 i2@82@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@81@01) (Seq_index
    xs@78@01
    i2@82@01))
  :pattern ((Seq_contains (Seq_range 0 3) i2@82@01) (Seq_index xs@78@01 i1@81@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@82@01) (Seq_index
    xs@78@01
    i1@81@01))
  :pattern ((Seq_index xs@78@01 i1@81@01) (Seq_index xs@78@01 i2@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@55@10@55@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::0 <= k && k < 3 ==> acc(xs[k].f, write))
(declare-const k@83@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 4
; [then-branch: 39 | !(0 <= k@83@01) | live]
; [else-branch: 39 | 0 <= k@83@01 | live]
(push) ; 5
; [then-branch: 39 | !(0 <= k@83@01)]
(assert (not (<= 0 k@83@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | 0 <= k@83@01]
(assert (<= 0 k@83@01))
; [eval] k < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@83@01) (not (<= 0 k@83@01))))
(assert (and (<= 0 k@83@01) (< k@83@01 3)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@83@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@83@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@84@01 $FVF<f>)
(declare-fun inv@85@01 ($Ref) Int)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@83@01 Int)) (!
  (=>
    (and (<= 0 k@83@01) (< k@83@01 3))
    (or (<= 0 k@83@01) (not (<= 0 k@83@01))))
  :pattern ((Seq_index xs@78@01 k@83@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@83@01 Int) (k2@83@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@83@01) (< k1@83@01 3))
      (and (<= 0 k2@83@01) (< k2@83@01 3))
      (= (Seq_index xs@78@01 k1@83@01) (Seq_index xs@78@01 k2@83@01)))
    (= k1@83@01 k2@83@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@83@01 Int)) (!
  (=>
    (and (<= 0 k@83@01) (< k@83@01 3))
    (and
      (= (inv@85@01 (Seq_index xs@78@01 k@83@01)) k@83@01)
      (img@86@01 (Seq_index xs@78@01 k@83@01))))
  :pattern ((Seq_index xs@78@01 k@83@01))
  :qid |quant-u-71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3)))
    (= (Seq_index xs@78@01 (inv@85@01 r)) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@83@01 Int)) (!
  (=>
    (and (<= 0 k@83@01) (< k@83@01 3))
    (not (= (Seq_index xs@78@01 k@83@01) $Ref.null)))
  :pattern ((Seq_index xs@78@01 k@83@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [6..9)), (i2 in [6..9)) }
;     { (i1 in [6..9)), xs[i2] }
;     { (i2 in [6..9)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@87@01 $Snap)
(assert (= $t@87@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [6..9)), (i2 in [6..9)) } { (i1 in [6..9)), xs[i2] } { (i2 in [6..9)), xs[i1] } { xs[i1], xs[i2] } (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@88@01 Int)
(declare-const i2@89@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 4
; [then-branch: 40 | !(i1@88@01 in [6..9]) | live]
; [else-branch: 40 | i1@88@01 in [6..9] | live]
(push) ; 5
; [then-branch: 40 | !(i1@88@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@88@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 40 | i1@88@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@88@01))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 6
; [then-branch: 41 | !(i2@89@01 in [6..9]) | live]
; [else-branch: 41 | i2@89@01 in [6..9] | live]
(push) ; 7
; [then-branch: 41 | !(i2@89@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@89@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 41 | i2@89@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@89@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@89@01)
  (not (Seq_contains (Seq_range 6 9) i2@89@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@88@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@88@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@89@01)
      (not (Seq_contains (Seq_range 6 9) i2@89@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@88@01)
  (not (Seq_contains (Seq_range 6 9) i1@88@01))))
(push) ; 4
; [then-branch: 42 | i1@88@01 in [6..9] && i2@89@01 in [6..9] && i1@88@01 != i2@89@01 | live]
; [else-branch: 42 | !(i1@88@01 in [6..9] && i2@89@01 in [6..9] && i1@88@01 != i2@89@01) | live]
(push) ; 5
; [then-branch: 42 | i1@88@01 in [6..9] && i2@89@01 in [6..9] && i1@88@01 != i2@89@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@88@01)
  (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@88@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@88@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@89@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@89@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 42 | !(i1@88@01 in [6..9] && i2@89@01 in [6..9] && i1@88@01 != i2@89@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@88@01)
    (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@88@01)
    (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@88@01)
    (Seq_contains (Seq_range 6 9) i2@89@01)
    (not (= i1@88@01 i2@89@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@88@01)
    (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@88@01 Int) (i2@89@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@89@01)
          (not (Seq_contains (Seq_range 6 9) i2@89@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (not (Seq_contains (Seq_range 6 9) i1@88@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (Seq_contains (Seq_range 6 9) i2@89@01)
        (not (= i1@88@01 i2@89@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@88@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@89@01)
            (not (= i1@88@01 i2@89@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@88@01) (Seq_contains
    (Seq_range 6 9)
    i2@89@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@88@01) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@89@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@57@10@57@98-aux|)))
(assert (forall ((i1@88@01 Int) (i2@89@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@89@01)
          (not (Seq_contains (Seq_range 6 9) i2@89@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (not (Seq_contains (Seq_range 6 9) i1@88@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (Seq_contains (Seq_range 6 9) i2@89@01)
        (not (= i1@88@01 i2@89@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@88@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@89@01)
            (not (= i1@88@01 i2@89@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@88@01) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@89@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@57@10@57@98-aux|)))
(assert (forall ((i1@88@01 Int) (i2@89@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@89@01)
          (not (Seq_contains (Seq_range 6 9) i2@89@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (not (Seq_contains (Seq_range 6 9) i1@88@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (Seq_contains (Seq_range 6 9) i2@89@01)
        (not (= i1@88@01 i2@89@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@88@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@89@01)
            (not (= i1@88@01 i2@89@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@88@01) (Seq_index xs@78@01 i2@89@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@88@01) (Seq_index
    xs@78@01
    i2@89@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@57@10@57@98-aux|)))
(assert (forall ((i1@88@01 Int) (i2@89@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@89@01)
          (not (Seq_contains (Seq_range 6 9) i2@89@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (not (Seq_contains (Seq_range 6 9) i1@88@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (Seq_contains (Seq_range 6 9) i2@89@01)
        (not (= i1@88@01 i2@89@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@88@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@89@01)
            (not (= i1@88@01 i2@89@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@88@01) (Seq_index
    xs@78@01
    i2@89@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@57@10@57@98-aux|)))
(assert (forall ((i1@88@01 Int) (i2@89@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@89@01)
          (not (Seq_contains (Seq_range 6 9) i2@89@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (not (Seq_contains (Seq_range 6 9) i1@88@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (Seq_contains (Seq_range 6 9) i2@89@01)
        (not (= i1@88@01 i2@89@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@88@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@89@01)
            (not (= i1@88@01 i2@89@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))))
  :pattern ((Seq_contains (Seq_range 6 9) i2@89@01) (Seq_index xs@78@01 i1@88@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@89@01) (Seq_index
    xs@78@01
    i1@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@57@10@57@98-aux|)))
(assert (forall ((i1@88@01 Int) (i2@89@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@89@01)
          (not (Seq_contains (Seq_range 6 9) i2@89@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (not (Seq_contains (Seq_range 6 9) i1@88@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (Seq_contains (Seq_range 6 9) i2@89@01)
        (not (= i1@88@01 i2@89@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@88@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@89@01)
            (not (= i1@88@01 i2@89@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@89@01) (Seq_index
    xs@78@01
    i1@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@57@10@57@98-aux|)))
(assert (forall ((i1@88@01 Int) (i2@89@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@89@01)
          (not (Seq_contains (Seq_range 6 9) i2@89@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (not (Seq_contains (Seq_range 6 9) i1@88@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (Seq_contains (Seq_range 6 9) i2@89@01)
        (not (= i1@88@01 i2@89@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@88@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@89@01)
            (not (= i1@88@01 i2@89@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@88@01)
        (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))))
  :pattern ((Seq_index xs@78@01 i1@88@01) (Seq_index xs@78@01 i2@89@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@57@10@57@98-aux|)))
(assert (forall ((i1@88@01 Int) (i2@89@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@88@01)
      (and (Seq_contains (Seq_range 6 9) i2@89@01) (not (= i1@88@01 i2@89@01))))
    (not (= (Seq_index xs@78@01 i1@88@01) (Seq_index xs@78@01 i2@89@01))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@88@01) (Seq_contains
    (Seq_range 6 9)
    i2@89@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@88@01) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@89@01))
  :pattern ((Seq_contains (Seq_range 6 9) i1@88@01) (Seq_index xs@78@01 i2@89@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@88@01) (Seq_index
    xs@78@01
    i2@89@01))
  :pattern ((Seq_contains (Seq_range 6 9) i2@89@01) (Seq_index xs@78@01 i1@88@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@89@01) (Seq_index
    xs@78@01
    i1@88@01))
  :pattern ((Seq_index xs@78@01 i1@88@01) (Seq_index xs@78@01 i2@89@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@57@10@57@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::6 <= k && k < 9 ==> acc(xs[k].f, write))
(declare-const k@90@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 4
; [then-branch: 43 | !(6 <= k@90@01) | live]
; [else-branch: 43 | 6 <= k@90@01 | live]
(push) ; 5
; [then-branch: 43 | !(6 <= k@90@01)]
(assert (not (<= 6 k@90@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 43 | 6 <= k@90@01]
(assert (<= 6 k@90@01))
; [eval] k < 9
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@90@01) (not (<= 6 k@90@01))))
(assert (and (<= 6 k@90@01) (< k@90@01 9)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@90@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@90@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@91@01 $FVF<f>)
(declare-fun inv@92@01 ($Ref) Int)
(declare-fun img@93@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@90@01 Int)) (!
  (=>
    (and (<= 6 k@90@01) (< k@90@01 9))
    (or (<= 6 k@90@01) (not (<= 6 k@90@01))))
  :pattern ((Seq_index xs@78@01 k@90@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@90@01 Int) (k2@90@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@90@01) (< k1@90@01 9))
      (and (<= 6 k2@90@01) (< k2@90@01 9))
      (= (Seq_index xs@78@01 k1@90@01) (Seq_index xs@78@01 k2@90@01)))
    (= k1@90@01 k2@90@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@90@01 Int)) (!
  (=>
    (and (<= 6 k@90@01) (< k@90@01 9))
    (and
      (= (inv@92@01 (Seq_index xs@78@01 k@90@01)) k@90@01)
      (img@93@01 (Seq_index xs@78@01 k@90@01))))
  :pattern ((Seq_index xs@78@01 k@90@01))
  :qid |quant-u-73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
    (= (Seq_index xs@78@01 (inv@92@01 r)) r))
  :pattern ((inv@92@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@90@01 Int)) (!
  (=>
    (and (<= 6 k@90@01) (< k@90@01 9))
    (not (= (Seq_index xs@78@01 k@90@01) $Ref.null)))
  :pattern ((Seq_index xs@78@01 k@90@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@78@01 k@90@01) (Seq_index xs@78@01 k@83@01))
    (=
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3)))))
  
  :qid |quant-u-74|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 10 == fun03(xs)
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 $Snap.unit))
; [eval] 10 == fun03(xs)
; [eval] fun03(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@95@01 Int)
(declare-const i2@96@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 44 | !(i1@95@01 in [0..3]) | live]
; [else-branch: 44 | i1@95@01 in [0..3] | live]
(push) ; 6
; [then-branch: 44 | !(i1@95@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@95@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 44 | i1@95@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@95@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 45 | !(i2@96@01 in [0..3]) | live]
; [else-branch: 45 | i2@96@01 in [0..3] | live]
(push) ; 8
; [then-branch: 45 | !(i2@96@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@96@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 45 | i2@96@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@96@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@96@01)
  (not (Seq_contains (Seq_range 0 3) i2@96@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@95@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@95@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@96@01)
      (not (Seq_contains (Seq_range 0 3) i2@96@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@95@01)
  (not (Seq_contains (Seq_range 0 3) i1@95@01))))
(push) ; 5
; [then-branch: 46 | i1@95@01 in [0..3] && i2@96@01 in [0..3] && i1@95@01 != i2@96@01 | live]
; [else-branch: 46 | !(i1@95@01 in [0..3] && i2@96@01 in [0..3] && i1@95@01 != i2@96@01) | live]
(push) ; 6
; [then-branch: 46 | i1@95@01 in [0..3] && i2@96@01 in [0..3] && i1@95@01 != i2@96@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@95@01)
  (and (Seq_contains (Seq_range 0 3) i2@96@01) (not (= i1@95@01 i2@96@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@95@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@95@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@96@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@96@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 46 | !(i1@95@01 in [0..3] && i2@96@01 in [0..3] && i1@95@01 != i2@96@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@95@01)
    (and (Seq_contains (Seq_range 0 3) i2@96@01) (not (= i1@95@01 i2@96@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@95@01)
    (and (Seq_contains (Seq_range 0 3) i2@96@01) (not (= i1@95@01 i2@96@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@95@01)
    (Seq_contains (Seq_range 0 3) i2@96@01)
    (not (= i1@95@01 i2@96@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@95@01)
      (and (Seq_contains (Seq_range 0 3) i2@96@01) (not (= i1@95@01 i2@96@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@95@01)
    (and (Seq_contains (Seq_range 0 3) i2@96@01) (not (= i1@95@01 i2@96@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@95@01 Int) (i2@96@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@95@01)
      (and (Seq_contains (Seq_range 0 3) i2@96@01) (not (= i1@95@01 i2@96@01))))
    (not (= (Seq_index xs@78@01 i1@95@01) (Seq_index xs@78@01 i2@96@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@95@01 Int) (i2@96@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@95@01)
      (and (Seq_contains (Seq_range 0 3) i2@96@01) (not (= i1@95@01 i2@96@01))))
    (not (= (Seq_index xs@78@01 i1@95@01) (Seq_index xs@78@01 i2@96@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100|)))
(declare-const k@97@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 47 | !(0 <= k@97@01) | live]
; [else-branch: 47 | 0 <= k@97@01 | live]
(push) ; 6
; [then-branch: 47 | !(0 <= k@97@01)]
(assert (not (<= 0 k@97@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 47 | 0 <= k@97@01]
(assert (<= 0 k@97@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@97@01) (not (<= 0 k@97@01))))
(assert (and (<= 0 k@97@01) (< k@97@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@97@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@97@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@98@01 ($Ref) Int)
(declare-fun img@99@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@97@01 Int)) (!
  (=>
    (and (<= 0 k@97@01) (< k@97@01 3))
    (or (<= 0 k@97@01) (not (<= 0 k@97@01))))
  :pattern ((Seq_index xs@78@01 k@97@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@97@01 Int) (k2@97@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@97@01) (< k1@97@01 3))
      (and (<= 0 k2@97@01) (< k2@97@01 3))
      (= (Seq_index xs@78@01 k1@97@01) (Seq_index xs@78@01 k2@97@01)))
    (= k1@97@01 k2@97@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@97@01 Int)) (!
  (=>
    (and (<= 0 k@97@01) (< k@97@01 3))
    (and
      (= (inv@98@01 (Seq_index xs@78@01 k@97@01)) k@97@01)
      (img@99@01 (Seq_index xs@78@01 k@97@01))))
  :pattern ((Seq_index xs@78@01 k@97@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@99@01 r) (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)))
    (= (Seq_index xs@78@01 (inv@98@01 r)) r))
  :pattern ((inv@98@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@100@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3))
      (img@99@01 r)
      (= r (Seq_index xs@78@01 (inv@98@01 r))))
    ($Perm.min
      (ite
        (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@101@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3))
      (img@99@01 r)
      (= r (Seq_index xs@78@01 (inv@98@01 r))))
    ($Perm.min
      (ite
        (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@100@01 r)))
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
        (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@100@01 r))
    $Perm.No)
  
  :qid |quant-u-77|))))
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
      (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3))
      (img@99@01 r)
      (= r (Seq_index xs@78@01 (inv@98@01 r))))
    (= (- $Perm.Write (pTaken@100@01 r)) $Perm.No))
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@102@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@102@01  $FVF<f>)))
      (and (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)) (img@99@01 r)))
    (=>
      (and (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)) (img@99@01 r))
      (Set_in r ($FVF.domain_f (as sm@102@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@102@01  $FVF<f>))))
  :qid |qp.fvfDomDef21|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)) (img@99@01 r))
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3))))
    (= ($FVF.lookup_f (as sm@102@01  $FVF<f>) r) ($FVF.lookup_f $t@84@01 r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@84@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)) (img@99@01 r))
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9))))
    (= ($FVF.lookup_f (as sm@102@01  $FVF<f>) r) ($FVF.lookup_f $t@91@01 r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@91@01 r))
  :qid |qp.fvfValDef20|)))
; [eval] (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@103@01 Int)
(declare-const i2@104@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 5
; [then-branch: 48 | !(i1@103@01 in [6..9]) | live]
; [else-branch: 48 | i1@103@01 in [6..9] | live]
(push) ; 6
; [then-branch: 48 | !(i1@103@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@103@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 48 | i1@103@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@103@01))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 49 | !(i2@104@01 in [6..9]) | live]
; [else-branch: 49 | i2@104@01 in [6..9] | live]
(push) ; 8
; [then-branch: 49 | !(i2@104@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@104@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 49 | i2@104@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@104@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@104@01)
  (not (Seq_contains (Seq_range 6 9) i2@104@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@103@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@103@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@104@01)
      (not (Seq_contains (Seq_range 6 9) i2@104@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@103@01)
  (not (Seq_contains (Seq_range 6 9) i1@103@01))))
(push) ; 5
; [then-branch: 50 | i1@103@01 in [6..9] && i2@104@01 in [6..9] && i1@103@01 != i2@104@01 | live]
; [else-branch: 50 | !(i1@103@01 in [6..9] && i2@104@01 in [6..9] && i1@103@01 != i2@104@01) | live]
(push) ; 6
; [then-branch: 50 | i1@103@01 in [6..9] && i2@104@01 in [6..9] && i1@103@01 != i2@104@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@103@01)
  (and (Seq_contains (Seq_range 6 9) i2@104@01) (not (= i1@103@01 i2@104@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@103@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@103@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@104@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@104@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 50 | !(i1@103@01 in [6..9] && i2@104@01 in [6..9] && i1@103@01 != i2@104@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@103@01)
    (and (Seq_contains (Seq_range 6 9) i2@104@01) (not (= i1@103@01 i2@104@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@103@01)
    (and (Seq_contains (Seq_range 6 9) i2@104@01) (not (= i1@103@01 i2@104@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@103@01)
    (Seq_contains (Seq_range 6 9) i2@104@01)
    (not (= i1@103@01 i2@104@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@103@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@104@01)
        (not (= i1@103@01 i2@104@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@103@01)
    (and (Seq_contains (Seq_range 6 9) i2@104@01) (not (= i1@103@01 i2@104@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@103@01 Int) (i2@104@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@103@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@104@01)
        (not (= i1@103@01 i2@104@01))))
    (not (= (Seq_index xs@78@01 i1@103@01) (Seq_index xs@78@01 i2@104@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@103@01 Int) (i2@104@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@103@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@104@01)
        (not (= i1@103@01 i2@104@01))))
    (not (= (Seq_index xs@78@01 i1@103@01) (Seq_index xs@78@01 i2@104@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100|)))
(declare-const k@105@01 Int)
(push) ; 4
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 5
; [then-branch: 51 | !(6 <= k@105@01) | live]
; [else-branch: 51 | 6 <= k@105@01 | live]
(push) ; 6
; [then-branch: 51 | !(6 <= k@105@01)]
(assert (not (<= 6 k@105@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 51 | 6 <= k@105@01]
(assert (<= 6 k@105@01))
; [eval] k < 9
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@105@01) (not (<= 6 k@105@01))))
(assert (and (<= 6 k@105@01) (< k@105@01 9)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@105@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@105@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@106@01 ($Ref) Int)
(declare-fun img@107@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@105@01 Int)) (!
  (=>
    (and (<= 6 k@105@01) (< k@105@01 9))
    (or (<= 6 k@105@01) (not (<= 6 k@105@01))))
  :pattern ((Seq_index xs@78@01 k@105@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@105@01 Int) (k2@105@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@105@01) (< k1@105@01 9))
      (and (<= 6 k2@105@01) (< k2@105@01 9))
      (= (Seq_index xs@78@01 k1@105@01) (Seq_index xs@78@01 k2@105@01)))
    (= k1@105@01 k2@105@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@105@01 Int)) (!
  (=>
    (and (<= 6 k@105@01) (< k@105@01 9))
    (and
      (= (inv@106@01 (Seq_index xs@78@01 k@105@01)) k@105@01)
      (img@107@01 (Seq_index xs@78@01 k@105@01))))
  :pattern ((Seq_index xs@78@01 k@105@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@107@01 r) (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9)))
    (= (Seq_index xs@78@01 (inv@106@01 r)) r))
  :pattern ((inv@106@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@108@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9))
      (img@107@01 r)
      (= r (Seq_index xs@78@01 (inv@106@01 r))))
    ($Perm.min
      (ite
        (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
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
        (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (pTaken@108@01 r))
    $Perm.No)
  
  :qid |quant-u-81|))))
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
      (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9))
      (img@107@01 r)
      (= r (Seq_index xs@78@01 (inv@106@01 r))))
    (= (- $Perm.Write (pTaken@108@01 r)) $Perm.No))
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@109@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@109@01  $FVF<f>)))
      (and (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9)) (img@107@01 r)))
    (=>
      (and (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9)) (img@107@01 r))
      (Set_in r ($FVF.domain_f (as sm@109@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@109@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9)) (img@107@01 r))
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9))))
    (= ($FVF.lookup_f (as sm@109@01  $FVF<f>) r) ($FVF.lookup_f $t@91@01 r)))
  :pattern (($FVF.lookup_f (as sm@109@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@91@01 r))
  :qid |qp.fvfValDef22|)))
(assert (fun03%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@102@01  $FVF<f>))
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@109@01  $FVF<f>)))))) xs@78@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@97@01 Int)) (!
  (=>
    (and (<= 0 k@97@01) (< k@97@01 3))
    (and
      (= (inv@98@01 (Seq_index xs@78@01 k@97@01)) k@97@01)
      (img@99@01 (Seq_index xs@78@01 k@97@01))))
  :pattern ((Seq_index xs@78@01 k@97@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@99@01 r) (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)))
    (= (Seq_index xs@78@01 (inv@98@01 r)) r))
  :pattern ((inv@98@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@102@01  $FVF<f>)))
      (and (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)) (img@99@01 r)))
    (=>
      (and (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)) (img@99@01 r))
      (Set_in r ($FVF.domain_f (as sm@102@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@102@01  $FVF<f>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)) (img@99@01 r))
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3))))
    (= ($FVF.lookup_f (as sm@102@01  $FVF<f>) r) ($FVF.lookup_f $t@84@01 r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@84@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@98@01 r)) (< (inv@98@01 r) 3)) (img@99@01 r))
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9))))
    (= ($FVF.lookup_f (as sm@102@01  $FVF<f>) r) ($FVF.lookup_f $t@91@01 r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@91@01 r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((k@105@01 Int)) (!
  (=>
    (and (<= 6 k@105@01) (< k@105@01 9))
    (and
      (= (inv@106@01 (Seq_index xs@78@01 k@105@01)) k@105@01)
      (img@107@01 (Seq_index xs@78@01 k@105@01))))
  :pattern ((Seq_index xs@78@01 k@105@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@107@01 r) (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9)))
    (= (Seq_index xs@78@01 (inv@106@01 r)) r))
  :pattern ((inv@106@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@109@01  $FVF<f>)))
      (and (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9)) (img@107@01 r)))
    (=>
      (and (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9)) (img@107@01 r))
      (Set_in r ($FVF.domain_f (as sm@109@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@109@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@106@01 r)) (< (inv@106@01 r) 9)) (img@107@01 r))
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9))))
    (= ($FVF.lookup_f (as sm@109@01  $FVF<f>) r) ($FVF.lookup_f $t@91@01 r)))
  :pattern (($FVF.lookup_f (as sm@109@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@91@01 r))
  :qid |qp.fvfValDef22|)))
(assert (and
  (forall ((i1@95@01 Int) (i2@96@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@95@01)
        (and (Seq_contains (Seq_range 0 3) i2@96@01) (not (= i1@95@01 i2@96@01))))
      (not (= (Seq_index xs@78@01 i1@95@01) (Seq_index xs@78@01 i2@96@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100|))
  (forall ((k@97@01 Int)) (!
    (=>
      (and (<= 0 k@97@01) (< k@97@01 3))
      (or (<= 0 k@97@01) (not (<= 0 k@97@01))))
    :pattern ((Seq_index xs@78@01 k@97@01))
    :qid |f-aux|))
  (forall ((i1@103@01 Int) (i2@104@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@103@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@104@01)
          (not (= i1@103@01 i2@104@01))))
      (not (= (Seq_index xs@78@01 i1@103@01) (Seq_index xs@78@01 i2@104@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100|))
  (forall ((k@105@01 Int)) (!
    (=>
      (and (<= 6 k@105@01) (< k@105@01 9))
      (or (<= 6 k@105@01) (not (<= 6 k@105@01))))
    :pattern ((Seq_index xs@78@01 k@105@01))
    :qid |f-aux|))
  (fun03%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@102@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@109@01  $FVF<f>)))))) xs@78@01)))
(assert (=
  10
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@102@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@109@01  $FVF<f>)))))) xs@78@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert 10 == fun03(xs)
; [eval] 10 == fun03(xs)
; [eval] fun03(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@110@01 Int)
(declare-const i2@111@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 52 | !(i1@110@01 in [0..3]) | live]
; [else-branch: 52 | i1@110@01 in [0..3] | live]
(push) ; 6
; [then-branch: 52 | !(i1@110@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@110@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 52 | i1@110@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@110@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 53 | !(i2@111@01 in [0..3]) | live]
; [else-branch: 53 | i2@111@01 in [0..3] | live]
(push) ; 8
; [then-branch: 53 | !(i2@111@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@111@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 53 | i2@111@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@111@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@111@01)
  (not (Seq_contains (Seq_range 0 3) i2@111@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@110@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@110@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@111@01)
      (not (Seq_contains (Seq_range 0 3) i2@111@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@110@01)
  (not (Seq_contains (Seq_range 0 3) i1@110@01))))
(push) ; 5
; [then-branch: 54 | i1@110@01 in [0..3] && i2@111@01 in [0..3] && i1@110@01 != i2@111@01 | live]
; [else-branch: 54 | !(i1@110@01 in [0..3] && i2@111@01 in [0..3] && i1@110@01 != i2@111@01) | live]
(push) ; 6
; [then-branch: 54 | i1@110@01 in [0..3] && i2@111@01 in [0..3] && i1@110@01 != i2@111@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@110@01)
  (and (Seq_contains (Seq_range 0 3) i2@111@01) (not (= i1@110@01 i2@111@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@110@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@110@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@111@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@111@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 54 | !(i1@110@01 in [0..3] && i2@111@01 in [0..3] && i1@110@01 != i2@111@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@110@01)
    (and (Seq_contains (Seq_range 0 3) i2@111@01) (not (= i1@110@01 i2@111@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@110@01)
    (and (Seq_contains (Seq_range 0 3) i2@111@01) (not (= i1@110@01 i2@111@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@110@01)
    (Seq_contains (Seq_range 0 3) i2@111@01)
    (not (= i1@110@01 i2@111@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@110@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@111@01)
        (not (= i1@110@01 i2@111@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@110@01)
    (and (Seq_contains (Seq_range 0 3) i2@111@01) (not (= i1@110@01 i2@111@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@110@01 Int) (i2@111@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@110@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@111@01)
        (not (= i1@110@01 i2@111@01))))
    (not (= (Seq_index xs@78@01 i1@110@01) (Seq_index xs@78@01 i2@111@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@110@01 Int) (i2@111@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@110@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@111@01)
        (not (= i1@110@01 i2@111@01))))
    (not (= (Seq_index xs@78@01 i1@110@01) (Seq_index xs@78@01 i2@111@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100|)))
(declare-const k@112@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 55 | !(0 <= k@112@01) | live]
; [else-branch: 55 | 0 <= k@112@01 | live]
(push) ; 6
; [then-branch: 55 | !(0 <= k@112@01)]
(assert (not (<= 0 k@112@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 55 | 0 <= k@112@01]
(assert (<= 0 k@112@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@112@01) (not (<= 0 k@112@01))))
(assert (and (<= 0 k@112@01) (< k@112@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@112@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@112@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@113@01 ($Ref) Int)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@112@01 Int)) (!
  (=>
    (and (<= 0 k@112@01) (< k@112@01 3))
    (or (<= 0 k@112@01) (not (<= 0 k@112@01))))
  :pattern ((Seq_index xs@78@01 k@112@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@112@01 Int) (k2@112@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@112@01) (< k1@112@01 3))
      (and (<= 0 k2@112@01) (< k2@112@01 3))
      (= (Seq_index xs@78@01 k1@112@01) (Seq_index xs@78@01 k2@112@01)))
    (= k1@112@01 k2@112@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@112@01 Int)) (!
  (=>
    (and (<= 0 k@112@01) (< k@112@01 3))
    (and
      (= (inv@113@01 (Seq_index xs@78@01 k@112@01)) k@112@01)
      (img@114@01 (Seq_index xs@78@01 k@112@01))))
  :pattern ((Seq_index xs@78@01 k@112@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@114@01 r) (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)))
    (= (Seq_index xs@78@01 (inv@113@01 r)) r))
  :pattern ((inv@113@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3))
      (img@114@01 r)
      (= r (Seq_index xs@78@01 (inv@113@01 r))))
    ($Perm.min
      (ite
        (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@116@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3))
      (img@114@01 r)
      (= r (Seq_index xs@78@01 (inv@113@01 r))))
    ($Perm.min
      (ite
        (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@115@01 r)))
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
        (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@115@01 r))
    $Perm.No)
  
  :qid |quant-u-85|))))
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
      (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3))
      (img@114@01 r)
      (= r (Seq_index xs@78@01 (inv@113@01 r))))
    (= (- $Perm.Write (pTaken@115@01 r)) $Perm.No))
  
  :qid |quant-u-86|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@117@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@117@01  $FVF<f>)))
      (and (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)) (img@114@01 r)))
    (=>
      (and (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)) (img@114@01 r))
      (Set_in r ($FVF.domain_f (as sm@117@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@117@01  $FVF<f>))))
  :qid |qp.fvfDomDef26|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)) (img@114@01 r))
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3))))
    (= ($FVF.lookup_f (as sm@117@01  $FVF<f>) r) ($FVF.lookup_f $t@84@01 r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@84@01 r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)) (img@114@01 r))
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9))))
    (= ($FVF.lookup_f (as sm@117@01  $FVF<f>) r) ($FVF.lookup_f $t@91@01 r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@91@01 r))
  :qid |qp.fvfValDef25|)))
; [eval] (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@118@01 Int)
(declare-const i2@119@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 5
; [then-branch: 56 | !(i1@118@01 in [6..9]) | live]
; [else-branch: 56 | i1@118@01 in [6..9] | live]
(push) ; 6
; [then-branch: 56 | !(i1@118@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@118@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 56 | i1@118@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@118@01))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 57 | !(i2@119@01 in [6..9]) | live]
; [else-branch: 57 | i2@119@01 in [6..9] | live]
(push) ; 8
; [then-branch: 57 | !(i2@119@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@119@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 57 | i2@119@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@119@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@119@01)
  (not (Seq_contains (Seq_range 6 9) i2@119@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@118@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@118@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@119@01)
      (not (Seq_contains (Seq_range 6 9) i2@119@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@118@01)
  (not (Seq_contains (Seq_range 6 9) i1@118@01))))
(push) ; 5
; [then-branch: 58 | i1@118@01 in [6..9] && i2@119@01 in [6..9] && i1@118@01 != i2@119@01 | live]
; [else-branch: 58 | !(i1@118@01 in [6..9] && i2@119@01 in [6..9] && i1@118@01 != i2@119@01) | live]
(push) ; 6
; [then-branch: 58 | i1@118@01 in [6..9] && i2@119@01 in [6..9] && i1@118@01 != i2@119@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@118@01)
  (and (Seq_contains (Seq_range 6 9) i2@119@01) (not (= i1@118@01 i2@119@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@118@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@119@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@119@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 58 | !(i1@118@01 in [6..9] && i2@119@01 in [6..9] && i1@118@01 != i2@119@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@118@01)
    (and (Seq_contains (Seq_range 6 9) i2@119@01) (not (= i1@118@01 i2@119@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@118@01)
    (and (Seq_contains (Seq_range 6 9) i2@119@01) (not (= i1@118@01 i2@119@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@118@01)
    (Seq_contains (Seq_range 6 9) i2@119@01)
    (not (= i1@118@01 i2@119@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@118@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@119@01)
        (not (= i1@118@01 i2@119@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@118@01)
    (and (Seq_contains (Seq_range 6 9) i2@119@01) (not (= i1@118@01 i2@119@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@118@01 Int) (i2@119@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@118@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@119@01)
        (not (= i1@118@01 i2@119@01))))
    (not (= (Seq_index xs@78@01 i1@118@01) (Seq_index xs@78@01 i2@119@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@118@01 Int) (i2@119@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@118@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@119@01)
        (not (= i1@118@01 i2@119@01))))
    (not (= (Seq_index xs@78@01 i1@118@01) (Seq_index xs@78@01 i2@119@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100|)))
(declare-const k@120@01 Int)
(push) ; 4
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 5
; [then-branch: 59 | !(6 <= k@120@01) | live]
; [else-branch: 59 | 6 <= k@120@01 | live]
(push) ; 6
; [then-branch: 59 | !(6 <= k@120@01)]
(assert (not (<= 6 k@120@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 59 | 6 <= k@120@01]
(assert (<= 6 k@120@01))
; [eval] k < 9
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@120@01) (not (<= 6 k@120@01))))
(assert (and (<= 6 k@120@01) (< k@120@01 9)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@120@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@120@01 (Seq_length xs@78@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@121@01 ($Ref) Int)
(declare-fun img@122@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@120@01 Int)) (!
  (=>
    (and (<= 6 k@120@01) (< k@120@01 9))
    (or (<= 6 k@120@01) (not (<= 6 k@120@01))))
  :pattern ((Seq_index xs@78@01 k@120@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@120@01 Int) (k2@120@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@120@01) (< k1@120@01 9))
      (and (<= 6 k2@120@01) (< k2@120@01 9))
      (= (Seq_index xs@78@01 k1@120@01) (Seq_index xs@78@01 k2@120@01)))
    (= k1@120@01 k2@120@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@120@01 Int)) (!
  (=>
    (and (<= 6 k@120@01) (< k@120@01 9))
    (and
      (= (inv@121@01 (Seq_index xs@78@01 k@120@01)) k@120@01)
      (img@122@01 (Seq_index xs@78@01 k@120@01))))
  :pattern ((Seq_index xs@78@01 k@120@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@122@01 r) (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9)))
    (= (Seq_index xs@78@01 (inv@121@01 r)) r))
  :pattern ((inv@121@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@123@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9))
      (img@122@01 r)
      (= r (Seq_index xs@78@01 (inv@121@01 r))))
    ($Perm.min
      (ite
        (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
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
        (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (pTaken@123@01 r))
    $Perm.No)
  
  :qid |quant-u-89|))))
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
      (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9))
      (img@122@01 r)
      (= r (Seq_index xs@78@01 (inv@121@01 r))))
    (= (- $Perm.Write (pTaken@123@01 r)) $Perm.No))
  
  :qid |quant-u-90|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@124@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@124@01  $FVF<f>)))
      (and (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9)) (img@122@01 r)))
    (=>
      (and (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9)) (img@122@01 r))
      (Set_in r ($FVF.domain_f (as sm@124@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@124@01  $FVF<f>))))
  :qid |qp.fvfDomDef28|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9)) (img@122@01 r))
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9))))
    (= ($FVF.lookup_f (as sm@124@01  $FVF<f>) r) ($FVF.lookup_f $t@91@01 r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@91@01 r))
  :qid |qp.fvfValDef27|)))
(assert (fun03%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@117@01  $FVF<f>))
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@124@01  $FVF<f>)))))) xs@78@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@112@01 Int)) (!
  (=>
    (and (<= 0 k@112@01) (< k@112@01 3))
    (and
      (= (inv@113@01 (Seq_index xs@78@01 k@112@01)) k@112@01)
      (img@114@01 (Seq_index xs@78@01 k@112@01))))
  :pattern ((Seq_index xs@78@01 k@112@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@114@01 r) (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)))
    (= (Seq_index xs@78@01 (inv@113@01 r)) r))
  :pattern ((inv@113@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@117@01  $FVF<f>)))
      (and (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)) (img@114@01 r)))
    (=>
      (and (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)) (img@114@01 r))
      (Set_in r ($FVF.domain_f (as sm@117@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@117@01  $FVF<f>))))
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)) (img@114@01 r))
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3))))
    (= ($FVF.lookup_f (as sm@117@01  $FVF<f>) r) ($FVF.lookup_f $t@84@01 r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@84@01 r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) 3)) (img@114@01 r))
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9))))
    (= ($FVF.lookup_f (as sm@117@01  $FVF<f>) r) ($FVF.lookup_f $t@91@01 r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@91@01 r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((k@120@01 Int)) (!
  (=>
    (and (<= 6 k@120@01) (< k@120@01 9))
    (and
      (= (inv@121@01 (Seq_index xs@78@01 k@120@01)) k@120@01)
      (img@122@01 (Seq_index xs@78@01 k@120@01))))
  :pattern ((Seq_index xs@78@01 k@120@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@122@01 r) (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9)))
    (= (Seq_index xs@78@01 (inv@121@01 r)) r))
  :pattern ((inv@121@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@124@01  $FVF<f>)))
      (and (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9)) (img@122@01 r)))
    (=>
      (and (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9)) (img@122@01 r))
      (Set_in r ($FVF.domain_f (as sm@124@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@124@01  $FVF<f>))))
  :qid |qp.fvfDomDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@121@01 r)) (< (inv@121@01 r) 9)) (img@122@01 r))
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9))))
    (= ($FVF.lookup_f (as sm@124@01  $FVF<f>) r) ($FVF.lookup_f $t@91@01 r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@91@01 r))
  :qid |qp.fvfValDef27|)))
(assert (and
  (forall ((i1@110@01 Int) (i2@111@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@110@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@111@01)
          (not (= i1@110@01 i2@111@01))))
      (not (= (Seq_index xs@78@01 i1@110@01) (Seq_index xs@78@01 i2@111@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100|))
  (forall ((k@112@01 Int)) (!
    (=>
      (and (<= 0 k@112@01) (< k@112@01 3))
      (or (<= 0 k@112@01) (not (<= 0 k@112@01))))
    :pattern ((Seq_index xs@78@01 k@112@01))
    :qid |f-aux|))
  (forall ((i1@118@01 Int) (i2@119@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@118@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@119@01)
          (not (= i1@118@01 i2@119@01))))
      (not (= (Seq_index xs@78@01 i1@118@01) (Seq_index xs@78@01 i2@119@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100|))
  (forall ((k@120@01 Int)) (!
    (=>
      (and (<= 6 k@120@01) (< k@120@01 9))
      (or (<= 6 k@120@01) (not (<= 6 k@120@01))))
    :pattern ((Seq_index xs@78@01 k@120@01))
    :qid |f-aux|))
  (fun03%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@117@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@124@01  $FVF<f>)))))) xs@78@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@117@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@124@01  $FVF<f>)))))) xs@78@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  10
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@117@01  $FVF<f>))
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@124@01  $FVF<f>)))))) xs@78@01)))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@78@01 k@83@01) (Seq_index xs@78@01 k@90@01))
    (=
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3)))
      (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@125@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3)))
    (= ($FVF.lookup_f (as sm@125@01  $FVF<f>) r) ($FVF.lookup_f $t@84@01 r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@84@01 r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
    (= ($FVF.lookup_f (as sm@125@01  $FVF<f>) r) ($FVF.lookup_f $t@91@01 r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@91@01 r))
  :qid |qp.fvfValDef30|)))
(declare-const pm@126@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@126@01  $FPM) r)
    (+
      (ite
        (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@93@01 r) (and (<= 6 (inv@92@01 r)) (< (inv@92@01 r) 9)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@126@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
  :pattern ((inv@85@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
  :pattern ((inv@92@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const xs@127@01 Seq<$Ref>)
(declare-const xs@128@01 Seq<$Ref>)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale |xs| > 10
(declare-const $t@129@01 $Snap)
(assert (= $t@129@01 $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@128@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..10)), (i2 in [0..10)) }
;     { (i1 in [0..10)), xs[i2] }
;     { (i2 in [0..10)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..10)) && ((i2 in [0..10)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@130@01 $Snap)
(assert (= $t@130@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..10)), (i2 in [0..10)) } { (i1 in [0..10)), xs[i2] } { (i2 in [0..10)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..10)) && ((i2 in [0..10)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@131@01 Int)
(declare-const i2@132@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..10)) && ((i2 in [0..10)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..10)) && ((i2 in [0..10)) && i1 != i2)
; [eval] (i1 in [0..10))
; [eval] [0..10)
(push) ; 4
; [then-branch: 60 | !(i1@131@01 in [0..10]) | live]
; [else-branch: 60 | i1@131@01 in [0..10] | live]
(push) ; 5
; [then-branch: 60 | !(i1@131@01 in [0..10])]
(assert (not (Seq_contains (Seq_range 0 10) i1@131@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 60 | i1@131@01 in [0..10]]
(assert (Seq_contains (Seq_range 0 10) i1@131@01))
; [eval] (i2 in [0..10))
; [eval] [0..10)
(push) ; 6
; [then-branch: 61 | !(i2@132@01 in [0..10]) | live]
; [else-branch: 61 | i2@132@01 in [0..10] | live]
(push) ; 7
; [then-branch: 61 | !(i2@132@01 in [0..10])]
(assert (not (Seq_contains (Seq_range 0 10) i2@132@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 61 | i2@132@01 in [0..10]]
(assert (Seq_contains (Seq_range 0 10) i2@132@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 10) i2@132@01)
  (not (Seq_contains (Seq_range 0 10) i2@132@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 10) i1@131@01)
  (and
    (Seq_contains (Seq_range 0 10) i1@131@01)
    (or
      (Seq_contains (Seq_range 0 10) i2@132@01)
      (not (Seq_contains (Seq_range 0 10) i2@132@01))))))
(assert (or
  (Seq_contains (Seq_range 0 10) i1@131@01)
  (not (Seq_contains (Seq_range 0 10) i1@131@01))))
(push) ; 4
; [then-branch: 62 | i1@131@01 in [0..10] && i2@132@01 in [0..10] && i1@131@01 != i2@132@01 | live]
; [else-branch: 62 | !(i1@131@01 in [0..10] && i2@132@01 in [0..10] && i1@131@01 != i2@132@01) | live]
(push) ; 5
; [then-branch: 62 | i1@131@01 in [0..10] && i2@132@01 in [0..10] && i1@131@01 != i2@132@01]
(assert (and
  (Seq_contains (Seq_range 0 10) i1@131@01)
  (and (Seq_contains (Seq_range 0 10) i2@132@01) (not (= i1@131@01 i2@132@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@131@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@131@01 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@132@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@132@01 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 62 | !(i1@131@01 in [0..10] && i2@132@01 in [0..10] && i1@131@01 != i2@132@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 10) i1@131@01)
    (and (Seq_contains (Seq_range 0 10) i2@132@01) (not (= i1@131@01 i2@132@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 10) i1@131@01)
    (and (Seq_contains (Seq_range 0 10) i2@132@01) (not (= i1@131@01 i2@132@01))))
  (and
    (Seq_contains (Seq_range 0 10) i1@131@01)
    (Seq_contains (Seq_range 0 10) i2@132@01)
    (not (= i1@131@01 i2@132@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (and
        (Seq_contains (Seq_range 0 10) i2@132@01)
        (not (= i1@131@01 i2@132@01)))))
  (and
    (Seq_contains (Seq_range 0 10) i1@131@01)
    (and (Seq_contains (Seq_range 0 10) i2@132@01) (not (= i1@131@01 i2@132@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@131@01 Int) (i2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (or
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (Seq_contains (Seq_range 0 10) i2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (not (Seq_contains (Seq_range 0 10) i1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (Seq_contains (Seq_range 0 10) i2@132@01)
        (not (= i1@131@01 i2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 10) i1@131@01)
          (and
            (Seq_contains (Seq_range 0 10) i2@132@01)
            (not (= i1@131@01 i2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))))
  :pattern ((Seq_contains (Seq_range 0 10) i1@131@01) (Seq_contains
    (Seq_range 0 10)
    i2@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) i1@131@01) (Seq_contains_trigger
    (Seq_range 0 10)
    i2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@74@10@74@100-aux|)))
(assert (forall ((i1@131@01 Int) (i2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (or
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (Seq_contains (Seq_range 0 10) i2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (not (Seq_contains (Seq_range 0 10) i1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (Seq_contains (Seq_range 0 10) i2@132@01)
        (not (= i1@131@01 i2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 10) i1@131@01)
          (and
            (Seq_contains (Seq_range 0 10) i2@132@01)
            (not (= i1@131@01 i2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) i1@131@01) (Seq_contains_trigger
    (Seq_range 0 10)
    i2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@74@10@74@100-aux|)))
(assert (forall ((i1@131@01 Int) (i2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (or
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (Seq_contains (Seq_range 0 10) i2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (not (Seq_contains (Seq_range 0 10) i1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (Seq_contains (Seq_range 0 10) i2@132@01)
        (not (= i1@131@01 i2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 10) i1@131@01)
          (and
            (Seq_contains (Seq_range 0 10) i2@132@01)
            (not (= i1@131@01 i2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))))
  :pattern ((Seq_contains (Seq_range 0 10) i1@131@01) (Seq_index
    xs@128@01
    i2@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) i1@131@01) (Seq_index
    xs@128@01
    i2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@74@10@74@100-aux|)))
(assert (forall ((i1@131@01 Int) (i2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (or
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (Seq_contains (Seq_range 0 10) i2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (not (Seq_contains (Seq_range 0 10) i1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (Seq_contains (Seq_range 0 10) i2@132@01)
        (not (= i1@131@01 i2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 10) i1@131@01)
          (and
            (Seq_contains (Seq_range 0 10) i2@132@01)
            (not (= i1@131@01 i2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) i1@131@01) (Seq_index
    xs@128@01
    i2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@74@10@74@100-aux|)))
(assert (forall ((i1@131@01 Int) (i2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (or
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (Seq_contains (Seq_range 0 10) i2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (not (Seq_contains (Seq_range 0 10) i1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (Seq_contains (Seq_range 0 10) i2@132@01)
        (not (= i1@131@01 i2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 10) i1@131@01)
          (and
            (Seq_contains (Seq_range 0 10) i2@132@01)
            (not (= i1@131@01 i2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))))
  :pattern ((Seq_contains (Seq_range 0 10) i2@132@01) (Seq_index
    xs@128@01
    i1@131@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) i2@132@01) (Seq_index
    xs@128@01
    i1@131@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@74@10@74@100-aux|)))
(assert (forall ((i1@131@01 Int) (i2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (or
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (Seq_contains (Seq_range 0 10) i2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (not (Seq_contains (Seq_range 0 10) i1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (Seq_contains (Seq_range 0 10) i2@132@01)
        (not (= i1@131@01 i2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 10) i1@131@01)
          (and
            (Seq_contains (Seq_range 0 10) i2@132@01)
            (not (= i1@131@01 i2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) i2@132@01) (Seq_index
    xs@128@01
    i1@131@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@74@10@74@100-aux|)))
(assert (forall ((i1@131@01 Int) (i2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (or
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (Seq_contains (Seq_range 0 10) i2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (not (Seq_contains (Seq_range 0 10) i1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (Seq_contains (Seq_range 0 10) i2@132@01)
        (not (= i1@131@01 i2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 10) i1@131@01)
          (and
            (Seq_contains (Seq_range 0 10) i2@132@01)
            (not (= i1@131@01 i2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 10) i1@131@01)
        (and
          (Seq_contains (Seq_range 0 10) i2@132@01)
          (not (= i1@131@01 i2@132@01))))))
  :pattern ((Seq_index xs@128@01 i1@131@01) (Seq_index xs@128@01 i2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@74@10@74@100-aux|)))
(assert (forall ((i1@131@01 Int) (i2@132@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 10) i1@131@01)
      (and
        (Seq_contains (Seq_range 0 10) i2@132@01)
        (not (= i1@131@01 i2@132@01))))
    (not (= (Seq_index xs@128@01 i1@131@01) (Seq_index xs@128@01 i2@132@01))))
  :pattern ((Seq_contains (Seq_range 0 10) i1@131@01) (Seq_contains
    (Seq_range 0 10)
    i2@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) i1@131@01) (Seq_contains_trigger
    (Seq_range 0 10)
    i2@132@01))
  :pattern ((Seq_contains (Seq_range 0 10) i1@131@01) (Seq_index
    xs@128@01
    i2@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) i1@131@01) (Seq_index
    xs@128@01
    i2@132@01))
  :pattern ((Seq_contains (Seq_range 0 10) i2@132@01) (Seq_index
    xs@128@01
    i1@131@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) i2@132@01) (Seq_index
    xs@128@01
    i1@131@01))
  :pattern ((Seq_index xs@128@01 i1@131@01) (Seq_index xs@128@01 i2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@74@10@74@100|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::0 <= k && k < 10 ==> acc(xs[k].f, write))
(declare-const k@133@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < 10
; [eval] 0 <= k
(push) ; 4
; [then-branch: 63 | !(0 <= k@133@01) | live]
; [else-branch: 63 | 0 <= k@133@01 | live]
(push) ; 5
; [then-branch: 63 | !(0 <= k@133@01)]
(assert (not (<= 0 k@133@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 63 | 0 <= k@133@01]
(assert (<= 0 k@133@01))
; [eval] k < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@133@01) (not (<= 0 k@133@01))))
(assert (and (<= 0 k@133@01) (< k@133@01 10)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@133@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@133@01 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@134@01 $FVF<f>)
(declare-fun inv@135@01 ($Ref) Int)
(declare-fun img@136@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@133@01 Int)) (!
  (=>
    (and (<= 0 k@133@01) (< k@133@01 10))
    (or (<= 0 k@133@01) (not (<= 0 k@133@01))))
  :pattern ((Seq_index xs@128@01 k@133@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@133@01 Int) (k2@133@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@133@01) (< k1@133@01 10))
      (and (<= 0 k2@133@01) (< k2@133@01 10))
      (= (Seq_index xs@128@01 k1@133@01) (Seq_index xs@128@01 k2@133@01)))
    (= k1@133@01 k2@133@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@133@01 Int)) (!
  (=>
    (and (<= 0 k@133@01) (< k@133@01 10))
    (and
      (= (inv@135@01 (Seq_index xs@128@01 k@133@01)) k@133@01)
      (img@136@01 (Seq_index xs@128@01 k@133@01))))
  :pattern ((Seq_index xs@128@01 k@133@01))
  :qid |quant-u-93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10)))
    (= (Seq_index xs@128@01 (inv@135@01 r)) r))
  :pattern ((inv@135@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@133@01 Int)) (!
  (=>
    (and (<= 0 k@133@01) (< k@133@01 10))
    (not (= (Seq_index xs@128@01 k@133@01) $Ref.null)))
  :pattern ((Seq_index xs@128@01 k@133@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 10 == fun07(xs)
(declare-const $t@137@01 $Snap)
(assert (= $t@137@01 $Snap.unit))
; [eval] 10 == fun07(xs)
; [eval] fun07(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@138@01 Int)
(declare-const i2@139@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 64 | !(i1@138@01 in [0..3]) | live]
; [else-branch: 64 | i1@138@01 in [0..3] | live]
(push) ; 6
; [then-branch: 64 | !(i1@138@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@138@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 64 | i1@138@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@138@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 65 | !(i2@139@01 in [0..3]) | live]
; [else-branch: 65 | i2@139@01 in [0..3] | live]
(push) ; 8
; [then-branch: 65 | !(i2@139@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@139@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 65 | i2@139@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@139@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@139@01)
  (not (Seq_contains (Seq_range 0 3) i2@139@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@138@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@138@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@139@01)
      (not (Seq_contains (Seq_range 0 3) i2@139@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@138@01)
  (not (Seq_contains (Seq_range 0 3) i1@138@01))))
(push) ; 5
; [then-branch: 66 | i1@138@01 in [0..3] && i2@139@01 in [0..3] && i1@138@01 != i2@139@01 | live]
; [else-branch: 66 | !(i1@138@01 in [0..3] && i2@139@01 in [0..3] && i1@138@01 != i2@139@01) | live]
(push) ; 6
; [then-branch: 66 | i1@138@01 in [0..3] && i2@139@01 in [0..3] && i1@138@01 != i2@139@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@138@01)
  (and (Seq_contains (Seq_range 0 3) i2@139@01) (not (= i1@138@01 i2@139@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@138@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@138@01 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@139@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@139@01 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 66 | !(i1@138@01 in [0..3] && i2@139@01 in [0..3] && i1@138@01 != i2@139@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@138@01)
    (and (Seq_contains (Seq_range 0 3) i2@139@01) (not (= i1@138@01 i2@139@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@138@01)
    (and (Seq_contains (Seq_range 0 3) i2@139@01) (not (= i1@138@01 i2@139@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@138@01)
    (Seq_contains (Seq_range 0 3) i2@139@01)
    (not (= i1@138@01 i2@139@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@138@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@139@01)
        (not (= i1@138@01 i2@139@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@138@01)
    (and (Seq_contains (Seq_range 0 3) i2@139@01) (not (= i1@138@01 i2@139@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@138@01 Int) (i2@139@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@138@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@139@01)
        (not (= i1@138@01 i2@139@01))))
    (not (= (Seq_index xs@128@01 i1@138@01) (Seq_index xs@128@01 i2@139@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@138@01 Int) (i2@139@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@138@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@139@01)
        (not (= i1@138@01 i2@139@01))))
    (not (= (Seq_index xs@128@01 i1@138@01) (Seq_index xs@128@01 i2@139@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100|)))
(declare-const k@140@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 67 | !(0 <= k@140@01) | live]
; [else-branch: 67 | 0 <= k@140@01 | live]
(push) ; 6
; [then-branch: 67 | !(0 <= k@140@01)]
(assert (not (<= 0 k@140@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 67 | 0 <= k@140@01]
(assert (<= 0 k@140@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@140@01) (not (<= 0 k@140@01))))
(assert (and (<= 0 k@140@01) (< k@140@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@140@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@140@01 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@141@01 ($Ref) Int)
(declare-fun img@142@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@140@01 Int)) (!
  (=>
    (and (<= 0 k@140@01) (< k@140@01 3))
    (or (<= 0 k@140@01) (not (<= 0 k@140@01))))
  :pattern ((Seq_index xs@128@01 k@140@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@140@01 Int) (k2@140@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@140@01) (< k1@140@01 3))
      (and (<= 0 k2@140@01) (< k2@140@01 3))
      (= (Seq_index xs@128@01 k1@140@01) (Seq_index xs@128@01 k2@140@01)))
    (= k1@140@01 k2@140@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@140@01 Int)) (!
  (=>
    (and (<= 0 k@140@01) (< k@140@01 3))
    (and
      (= (inv@141@01 (Seq_index xs@128@01 k@140@01)) k@140@01)
      (img@142@01 (Seq_index xs@128@01 k@140@01))))
  :pattern ((Seq_index xs@128@01 k@140@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@142@01 r) (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3)))
    (= (Seq_index xs@128@01 (inv@141@01 r)) r))
  :pattern ((inv@141@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@143@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3))
      (img@142@01 r)
      (= r (Seq_index xs@128@01 (inv@141@01 r))))
    ($Perm.min
      (ite
        (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10)))
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
        (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10)))
        $Perm.Write
        $Perm.No)
      (pTaken@143@01 r))
    $Perm.No)
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@143@01 r) $Perm.No)
  
  :qid |quant-u-97|))))
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
    (and
      (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3))
      (img@142@01 r)
      (= r (Seq_index xs@128@01 (inv@141@01 r))))
    (= (- $Perm.Write (pTaken@143@01 r)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@144@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))
      (and (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3)) (img@142@01 r)))
    (=>
      (and (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3)) (img@142@01 r))
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>))))
  :qid |qp.fvfDomDef33|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3)) (img@142@01 r))
      (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10))))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@134@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@134@01 r))
  :qid |qp.fvfValDef32|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)))) xs@128@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@140@01 Int)) (!
  (=>
    (and (<= 0 k@140@01) (< k@140@01 3))
    (and
      (= (inv@141@01 (Seq_index xs@128@01 k@140@01)) k@140@01)
      (img@142@01 (Seq_index xs@128@01 k@140@01))))
  :pattern ((Seq_index xs@128@01 k@140@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@142@01 r) (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3)))
    (= (Seq_index xs@128@01 (inv@141@01 r)) r))
  :pattern ((inv@141@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))
      (and (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3)) (img@142@01 r)))
    (=>
      (and (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3)) (img@142@01 r))
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@141@01 r)) (< (inv@141@01 r) 3)) (img@142@01 r))
      (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10))))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@134@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@134@01 r))
  :qid |qp.fvfValDef32|)))
(assert (and
  (forall ((i1@138@01 Int) (i2@139@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@138@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@139@01)
          (not (= i1@138@01 i2@139@01))))
      (not (= (Seq_index xs@128@01 i1@138@01) (Seq_index xs@128@01 i2@139@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100|))
  (forall ((k@140@01 Int)) (!
    (=>
      (and (<= 0 k@140@01) (< k@140@01 3))
      (or (<= 0 k@140@01) (not (<= 0 k@140@01))))
    :pattern ((Seq_index xs@128@01 k@140@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)))) xs@128@01)))
(assert (=
  10
  (fun07 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)))) xs@128@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; xs[6].f := 0
; [eval] xs[6]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 6 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@145@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@128@01 6))
    ($Perm.min
      (ite
        (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10)))
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
        (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10)))
        $Perm.Write
        $Perm.No)
      (pTaken@145@01 r))
    $Perm.No)
  
  :qid |quant-u-100|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@145@01 r) $Perm.No)
  
  :qid |quant-u-101|))))
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
    (= r (Seq_index xs@128@01 6))
    (= (- $Perm.Write (pTaken@145@01 r)) $Perm.No))
  
  :qid |quant-u-102|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@146@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@146@01  $FVF<f>) (Seq_index xs@128@01 6)) 0))
; [exec]
; assert 10 == fun07(xs)
; [eval] 10 == fun07(xs)
; [eval] fun07(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@147@01 Int)
(declare-const i2@148@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 68 | !(i1@147@01 in [0..3]) | live]
; [else-branch: 68 | i1@147@01 in [0..3] | live]
(push) ; 6
; [then-branch: 68 | !(i1@147@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@147@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 68 | i1@147@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@147@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 69 | !(i2@148@01 in [0..3]) | live]
; [else-branch: 69 | i2@148@01 in [0..3] | live]
(push) ; 8
; [then-branch: 69 | !(i2@148@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@148@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 69 | i2@148@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@148@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@148@01)
  (not (Seq_contains (Seq_range 0 3) i2@148@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@147@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@147@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@148@01)
      (not (Seq_contains (Seq_range 0 3) i2@148@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@147@01)
  (not (Seq_contains (Seq_range 0 3) i1@147@01))))
(push) ; 5
; [then-branch: 70 | i1@147@01 in [0..3] && i2@148@01 in [0..3] && i1@147@01 != i2@148@01 | live]
; [else-branch: 70 | !(i1@147@01 in [0..3] && i2@148@01 in [0..3] && i1@147@01 != i2@148@01) | live]
(push) ; 6
; [then-branch: 70 | i1@147@01 in [0..3] && i2@148@01 in [0..3] && i1@147@01 != i2@148@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@147@01)
  (and (Seq_contains (Seq_range 0 3) i2@148@01) (not (= i1@147@01 i2@148@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@147@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@147@01 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@148@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@148@01 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 70 | !(i1@147@01 in [0..3] && i2@148@01 in [0..3] && i1@147@01 != i2@148@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@147@01)
    (and (Seq_contains (Seq_range 0 3) i2@148@01) (not (= i1@147@01 i2@148@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@147@01)
    (and (Seq_contains (Seq_range 0 3) i2@148@01) (not (= i1@147@01 i2@148@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@147@01)
    (Seq_contains (Seq_range 0 3) i2@148@01)
    (not (= i1@147@01 i2@148@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@147@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@148@01)
        (not (= i1@147@01 i2@148@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@147@01)
    (and (Seq_contains (Seq_range 0 3) i2@148@01) (not (= i1@147@01 i2@148@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@147@01 Int) (i2@148@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@147@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@148@01)
        (not (= i1@147@01 i2@148@01))))
    (not (= (Seq_index xs@128@01 i1@147@01) (Seq_index xs@128@01 i2@148@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@147@01 Int) (i2@148@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@147@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@148@01)
        (not (= i1@147@01 i2@148@01))))
    (not (= (Seq_index xs@128@01 i1@147@01) (Seq_index xs@128@01 i2@148@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100|)))
(declare-const k@149@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 71 | !(0 <= k@149@01) | live]
; [else-branch: 71 | 0 <= k@149@01 | live]
(push) ; 6
; [then-branch: 71 | !(0 <= k@149@01)]
(assert (not (<= 0 k@149@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 71 | 0 <= k@149@01]
(assert (<= 0 k@149@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@149@01) (not (<= 0 k@149@01))))
(assert (and (<= 0 k@149@01) (< k@149@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@149@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@149@01 (Seq_length xs@128@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@150@01 ($Ref) Int)
(declare-fun img@151@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@149@01 Int)) (!
  (=>
    (and (<= 0 k@149@01) (< k@149@01 3))
    (or (<= 0 k@149@01) (not (<= 0 k@149@01))))
  :pattern ((Seq_index xs@128@01 k@149@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@149@01 Int) (k2@149@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@149@01) (< k1@149@01 3))
      (and (<= 0 k2@149@01) (< k2@149@01 3))
      (= (Seq_index xs@128@01 k1@149@01) (Seq_index xs@128@01 k2@149@01)))
    (= k1@149@01 k2@149@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@149@01 Int)) (!
  (=>
    (and (<= 0 k@149@01) (< k@149@01 3))
    (and
      (= (inv@150@01 (Seq_index xs@128@01 k@149@01)) k@149@01)
      (img@151@01 (Seq_index xs@128@01 k@149@01))))
  :pattern ((Seq_index xs@128@01 k@149@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@151@01 r) (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)))
    (= (Seq_index xs@128@01 (inv@150@01 r)) r))
  :pattern ((inv@150@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@152@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3))
      (img@151@01 r)
      (= r (Seq_index xs@128@01 (inv@150@01 r))))
    ($Perm.min
      (ite
        (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10)))
        (- $Perm.Write (pTaken@145@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@153@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3))
      (img@151@01 r)
      (= r (Seq_index xs@128@01 (inv@150@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@128@01 6)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@152@01 r)))
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
        (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10)))
        (- $Perm.Write (pTaken@145@01 r))
        $Perm.No)
      (pTaken@152@01 r))
    $Perm.No)
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@152@01 r) $Perm.No)
  
  :qid |quant-u-106|))))
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
    (and
      (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3))
      (img@151@01 r)
      (= r (Seq_index xs@128@01 (inv@150@01 r))))
    (= (- $Perm.Write (pTaken@152@01 r)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@154@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>)))
      (and (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)) (img@151@01 r)))
    (=>
      (and (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)) (img@151@01 r))
      (Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>))))
  :qid |qp.fvfDomDef36|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)) (img@151@01 r))
      (= r (Seq_index xs@128@01 6)))
    (=
      ($FVF.lookup_f (as sm@154@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)) (img@151@01 r))
      (ite
        (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10)))
        (< $Perm.No (- $Perm.Write (pTaken@145@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@154@01  $FVF<f>) r) ($FVF.lookup_f $t@134@01 r)))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@134@01 r))
  :qid |qp.fvfValDef35|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@154@01  $FVF<f>)))) xs@128@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@149@01 Int)) (!
  (=>
    (and (<= 0 k@149@01) (< k@149@01 3))
    (and
      (= (inv@150@01 (Seq_index xs@128@01 k@149@01)) k@149@01)
      (img@151@01 (Seq_index xs@128@01 k@149@01))))
  :pattern ((Seq_index xs@128@01 k@149@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@151@01 r) (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)))
    (= (Seq_index xs@128@01 (inv@150@01 r)) r))
  :pattern ((inv@150@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>)))
      (and (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)) (img@151@01 r)))
    (=>
      (and (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)) (img@151@01 r))
      (Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>))))
  :qid |qp.fvfDomDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)) (img@151@01 r))
      (= r (Seq_index xs@128@01 6)))
    (=
      ($FVF.lookup_f (as sm@154@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@150@01 r)) (< (inv@150@01 r) 3)) (img@151@01 r))
      (ite
        (and (img@136@01 r) (and (<= 0 (inv@135@01 r)) (< (inv@135@01 r) 10)))
        (< $Perm.No (- $Perm.Write (pTaken@145@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@154@01  $FVF<f>) r) ($FVF.lookup_f $t@134@01 r)))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@134@01 r))
  :qid |qp.fvfValDef35|)))
(assert (and
  (forall ((i1@147@01 Int) (i2@148@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@147@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@148@01)
          (not (= i1@147@01 i2@148@01))))
      (not (= (Seq_index xs@128@01 i1@147@01) (Seq_index xs@128@01 i2@148@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100|))
  (forall ((k@149@01 Int)) (!
    (=>
      (and (<= 0 k@149@01) (< k@149@01 3))
      (or (<= 0 k@149@01) (not (<= 0 k@149@01))))
    :pattern ((Seq_index xs@128@01 k@149@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@154@01  $FVF<f>)))) xs@128@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun07 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@154@01  $FVF<f>)))) xs@128@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  10
  (fun07 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@154@01  $FVF<f>)))) xs@128@01)))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const xs@155@01 Seq<$Ref>)
(declare-const xs@156@01 Seq<$Ref>)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale |xs| > 10
(declare-const $t@157@01 $Snap)
(assert (= $t@157@01 $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@156@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..3)), (i2 in [0..3)) }
;     { (i1 in [0..3)), xs[i2] }
;     { (i2 in [0..3)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@158@01 $Snap)
(assert (= $t@158@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@159@01 Int)
(declare-const i2@160@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 4
; [then-branch: 72 | !(i1@159@01 in [0..3]) | live]
; [else-branch: 72 | i1@159@01 in [0..3] | live]
(push) ; 5
; [then-branch: 72 | !(i1@159@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@159@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 72 | i1@159@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@159@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 6
; [then-branch: 73 | !(i2@160@01 in [0..3]) | live]
; [else-branch: 73 | i2@160@01 in [0..3] | live]
(push) ; 7
; [then-branch: 73 | !(i2@160@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@160@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 73 | i2@160@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@160@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@160@01)
  (not (Seq_contains (Seq_range 0 3) i2@160@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@159@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@159@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@160@01)
      (not (Seq_contains (Seq_range 0 3) i2@160@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@159@01)
  (not (Seq_contains (Seq_range 0 3) i1@159@01))))
(push) ; 4
; [then-branch: 74 | i1@159@01 in [0..3] && i2@160@01 in [0..3] && i1@159@01 != i2@160@01 | live]
; [else-branch: 74 | !(i1@159@01 in [0..3] && i2@160@01 in [0..3] && i1@159@01 != i2@160@01) | live]
(push) ; 5
; [then-branch: 74 | i1@159@01 in [0..3] && i2@160@01 in [0..3] && i1@159@01 != i2@160@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@159@01)
  (and (Seq_contains (Seq_range 0 3) i2@160@01) (not (= i1@159@01 i2@160@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@159@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@159@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@160@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@160@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 74 | !(i1@159@01 in [0..3] && i2@160@01 in [0..3] && i1@159@01 != i2@160@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@159@01)
    (and (Seq_contains (Seq_range 0 3) i2@160@01) (not (= i1@159@01 i2@160@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@159@01)
    (and (Seq_contains (Seq_range 0 3) i2@160@01) (not (= i1@159@01 i2@160@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@159@01)
    (Seq_contains (Seq_range 0 3) i2@160@01)
    (not (= i1@159@01 i2@160@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@160@01)
        (not (= i1@159@01 i2@160@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@159@01)
    (and (Seq_contains (Seq_range 0 3) i2@160@01) (not (= i1@159@01 i2@160@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@159@01 Int) (i2@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (Seq_contains (Seq_range 0 3) i2@160@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (not (Seq_contains (Seq_range 0 3) i1@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (Seq_contains (Seq_range 0 3) i2@160@01)
        (not (= i1@159@01 i2@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@159@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@160@01)
            (not (= i1@159@01 i2@160@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@159@01) (Seq_contains
    (Seq_range 0 3)
    i2@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@159@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@93@10@93@98-aux|)))
(assert (forall ((i1@159@01 Int) (i2@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (Seq_contains (Seq_range 0 3) i2@160@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (not (Seq_contains (Seq_range 0 3) i1@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (Seq_contains (Seq_range 0 3) i2@160@01)
        (not (= i1@159@01 i2@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@159@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@160@01)
            (not (= i1@159@01 i2@160@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@159@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@93@10@93@98-aux|)))
(assert (forall ((i1@159@01 Int) (i2@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (Seq_contains (Seq_range 0 3) i2@160@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (not (Seq_contains (Seq_range 0 3) i1@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (Seq_contains (Seq_range 0 3) i2@160@01)
        (not (= i1@159@01 i2@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@159@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@160@01)
            (not (= i1@159@01 i2@160@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@159@01) (Seq_index
    xs@156@01
    i2@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@159@01) (Seq_index
    xs@156@01
    i2@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@93@10@93@98-aux|)))
(assert (forall ((i1@159@01 Int) (i2@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (Seq_contains (Seq_range 0 3) i2@160@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (not (Seq_contains (Seq_range 0 3) i1@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (Seq_contains (Seq_range 0 3) i2@160@01)
        (not (= i1@159@01 i2@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@159@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@160@01)
            (not (= i1@159@01 i2@160@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@159@01) (Seq_index
    xs@156@01
    i2@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@93@10@93@98-aux|)))
(assert (forall ((i1@159@01 Int) (i2@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (Seq_contains (Seq_range 0 3) i2@160@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (not (Seq_contains (Seq_range 0 3) i1@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (Seq_contains (Seq_range 0 3) i2@160@01)
        (not (= i1@159@01 i2@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@159@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@160@01)
            (not (= i1@159@01 i2@160@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@160@01) (Seq_index
    xs@156@01
    i1@159@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@160@01) (Seq_index
    xs@156@01
    i1@159@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@93@10@93@98-aux|)))
(assert (forall ((i1@159@01 Int) (i2@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (Seq_contains (Seq_range 0 3) i2@160@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (not (Seq_contains (Seq_range 0 3) i1@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (Seq_contains (Seq_range 0 3) i2@160@01)
        (not (= i1@159@01 i2@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@159@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@160@01)
            (not (= i1@159@01 i2@160@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@160@01) (Seq_index
    xs@156@01
    i1@159@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@93@10@93@98-aux|)))
(assert (forall ((i1@159@01 Int) (i2@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (Seq_contains (Seq_range 0 3) i2@160@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (not (Seq_contains (Seq_range 0 3) i1@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (Seq_contains (Seq_range 0 3) i2@160@01)
        (not (= i1@159@01 i2@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@159@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@160@01)
            (not (= i1@159@01 i2@160@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@159@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@160@01)
          (not (= i1@159@01 i2@160@01))))))
  :pattern ((Seq_index xs@156@01 i1@159@01) (Seq_index xs@156@01 i2@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@93@10@93@98-aux|)))
(assert (forall ((i1@159@01 Int) (i2@160@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@159@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@160@01)
        (not (= i1@159@01 i2@160@01))))
    (not (= (Seq_index xs@156@01 i1@159@01) (Seq_index xs@156@01 i2@160@01))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@159@01) (Seq_contains
    (Seq_range 0 3)
    i2@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@159@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@160@01))
  :pattern ((Seq_contains (Seq_range 0 3) i1@159@01) (Seq_index
    xs@156@01
    i2@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@159@01) (Seq_index
    xs@156@01
    i2@160@01))
  :pattern ((Seq_contains (Seq_range 0 3) i2@160@01) (Seq_index
    xs@156@01
    i1@159@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@160@01) (Seq_index
    xs@156@01
    i1@159@01))
  :pattern ((Seq_index xs@156@01 i1@159@01) (Seq_index xs@156@01 i2@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@93@10@93@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::0 <= k && k < 3 ==> acc(xs[k].f, write))
(declare-const k@161@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 4
; [then-branch: 75 | !(0 <= k@161@01) | live]
; [else-branch: 75 | 0 <= k@161@01 | live]
(push) ; 5
; [then-branch: 75 | !(0 <= k@161@01)]
(assert (not (<= 0 k@161@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 75 | 0 <= k@161@01]
(assert (<= 0 k@161@01))
; [eval] k < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@161@01) (not (<= 0 k@161@01))))
(assert (and (<= 0 k@161@01) (< k@161@01 3)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@161@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@161@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@162@01 $FVF<f>)
(declare-fun inv@163@01 ($Ref) Int)
(declare-fun img@164@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@161@01 Int)) (!
  (=>
    (and (<= 0 k@161@01) (< k@161@01 3))
    (or (<= 0 k@161@01) (not (<= 0 k@161@01))))
  :pattern ((Seq_index xs@156@01 k@161@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@161@01 Int) (k2@161@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@161@01) (< k1@161@01 3))
      (and (<= 0 k2@161@01) (< k2@161@01 3))
      (= (Seq_index xs@156@01 k1@161@01) (Seq_index xs@156@01 k2@161@01)))
    (= k1@161@01 k2@161@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@161@01 Int)) (!
  (=>
    (and (<= 0 k@161@01) (< k@161@01 3))
    (and
      (= (inv@163@01 (Seq_index xs@156@01 k@161@01)) k@161@01)
      (img@164@01 (Seq_index xs@156@01 k@161@01))))
  :pattern ((Seq_index xs@156@01 k@161@01))
  :qid |quant-u-109|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
    (= (Seq_index xs@156@01 (inv@163@01 r)) r))
  :pattern ((inv@163@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@161@01 Int)) (!
  (=>
    (and (<= 0 k@161@01) (< k@161@01 3))
    (not (= (Seq_index xs@156@01 k@161@01) $Ref.null)))
  :pattern ((Seq_index xs@156@01 k@161@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [6..9)), (i2 in [6..9)) }
;     { (i1 in [6..9)), xs[i2] }
;     { (i2 in [6..9)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@165@01 $Snap)
(assert (= $t@165@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [6..9)), (i2 in [6..9)) } { (i1 in [6..9)), xs[i2] } { (i2 in [6..9)), xs[i1] } { xs[i1], xs[i2] } (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@166@01 Int)
(declare-const i2@167@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 4
; [then-branch: 76 | !(i1@166@01 in [6..9]) | live]
; [else-branch: 76 | i1@166@01 in [6..9] | live]
(push) ; 5
; [then-branch: 76 | !(i1@166@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@166@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 76 | i1@166@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@166@01))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 6
; [then-branch: 77 | !(i2@167@01 in [6..9]) | live]
; [else-branch: 77 | i2@167@01 in [6..9] | live]
(push) ; 7
; [then-branch: 77 | !(i2@167@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@167@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 77 | i2@167@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@167@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@167@01)
  (not (Seq_contains (Seq_range 6 9) i2@167@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@166@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@166@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@167@01)
      (not (Seq_contains (Seq_range 6 9) i2@167@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@166@01)
  (not (Seq_contains (Seq_range 6 9) i1@166@01))))
(push) ; 4
; [then-branch: 78 | i1@166@01 in [6..9] && i2@167@01 in [6..9] && i1@166@01 != i2@167@01 | live]
; [else-branch: 78 | !(i1@166@01 in [6..9] && i2@167@01 in [6..9] && i1@166@01 != i2@167@01) | live]
(push) ; 5
; [then-branch: 78 | i1@166@01 in [6..9] && i2@167@01 in [6..9] && i1@166@01 != i2@167@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@166@01)
  (and (Seq_contains (Seq_range 6 9) i2@167@01) (not (= i1@166@01 i2@167@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@166@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@166@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@167@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@167@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 78 | !(i1@166@01 in [6..9] && i2@167@01 in [6..9] && i1@166@01 != i2@167@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@166@01)
    (and (Seq_contains (Seq_range 6 9) i2@167@01) (not (= i1@166@01 i2@167@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@166@01)
    (and (Seq_contains (Seq_range 6 9) i2@167@01) (not (= i1@166@01 i2@167@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@166@01)
    (Seq_contains (Seq_range 6 9) i2@167@01)
    (not (= i1@166@01 i2@167@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@167@01)
        (not (= i1@166@01 i2@167@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@166@01)
    (and (Seq_contains (Seq_range 6 9) i2@167@01) (not (= i1@166@01 i2@167@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@166@01 Int) (i2@167@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (Seq_contains (Seq_range 6 9) i2@167@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (not (Seq_contains (Seq_range 6 9) i1@166@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (Seq_contains (Seq_range 6 9) i2@167@01)
        (not (= i1@166@01 i2@167@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@166@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@167@01)
            (not (= i1@166@01 i2@167@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@166@01) (Seq_contains
    (Seq_range 6 9)
    i2@167@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@166@01) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@95@10@95@98-aux|)))
(assert (forall ((i1@166@01 Int) (i2@167@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (Seq_contains (Seq_range 6 9) i2@167@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (not (Seq_contains (Seq_range 6 9) i1@166@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (Seq_contains (Seq_range 6 9) i2@167@01)
        (not (= i1@166@01 i2@167@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@166@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@167@01)
            (not (= i1@166@01 i2@167@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@166@01) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@95@10@95@98-aux|)))
(assert (forall ((i1@166@01 Int) (i2@167@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (Seq_contains (Seq_range 6 9) i2@167@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (not (Seq_contains (Seq_range 6 9) i1@166@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (Seq_contains (Seq_range 6 9) i2@167@01)
        (not (= i1@166@01 i2@167@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@166@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@167@01)
            (not (= i1@166@01 i2@167@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@166@01) (Seq_index
    xs@156@01
    i2@167@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@166@01) (Seq_index
    xs@156@01
    i2@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@95@10@95@98-aux|)))
(assert (forall ((i1@166@01 Int) (i2@167@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (Seq_contains (Seq_range 6 9) i2@167@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (not (Seq_contains (Seq_range 6 9) i1@166@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (Seq_contains (Seq_range 6 9) i2@167@01)
        (not (= i1@166@01 i2@167@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@166@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@167@01)
            (not (= i1@166@01 i2@167@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@166@01) (Seq_index
    xs@156@01
    i2@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@95@10@95@98-aux|)))
(assert (forall ((i1@166@01 Int) (i2@167@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (Seq_contains (Seq_range 6 9) i2@167@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (not (Seq_contains (Seq_range 6 9) i1@166@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (Seq_contains (Seq_range 6 9) i2@167@01)
        (not (= i1@166@01 i2@167@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@166@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@167@01)
            (not (= i1@166@01 i2@167@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))))
  :pattern ((Seq_contains (Seq_range 6 9) i2@167@01) (Seq_index
    xs@156@01
    i1@166@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@167@01) (Seq_index
    xs@156@01
    i1@166@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@95@10@95@98-aux|)))
(assert (forall ((i1@166@01 Int) (i2@167@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (Seq_contains (Seq_range 6 9) i2@167@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (not (Seq_contains (Seq_range 6 9) i1@166@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (Seq_contains (Seq_range 6 9) i2@167@01)
        (not (= i1@166@01 i2@167@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@166@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@167@01)
            (not (= i1@166@01 i2@167@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@167@01) (Seq_index
    xs@156@01
    i1@166@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@95@10@95@98-aux|)))
(assert (forall ((i1@166@01 Int) (i2@167@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (or
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (Seq_contains (Seq_range 6 9) i2@167@01)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (not (Seq_contains (Seq_range 6 9) i1@166@01)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (Seq_contains (Seq_range 6 9) i2@167@01)
        (not (= i1@166@01 i2@167@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@166@01)
          (and
            (Seq_contains (Seq_range 6 9) i2@167@01)
            (not (= i1@166@01 i2@167@01)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@166@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@167@01)
          (not (= i1@166@01 i2@167@01))))))
  :pattern ((Seq_index xs@156@01 i1@166@01) (Seq_index xs@156@01 i2@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@95@10@95@98-aux|)))
(assert (forall ((i1@166@01 Int) (i2@167@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@166@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@167@01)
        (not (= i1@166@01 i2@167@01))))
    (not (= (Seq_index xs@156@01 i1@166@01) (Seq_index xs@156@01 i2@167@01))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@166@01) (Seq_contains
    (Seq_range 6 9)
    i2@167@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@166@01) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@167@01))
  :pattern ((Seq_contains (Seq_range 6 9) i1@166@01) (Seq_index
    xs@156@01
    i2@167@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@166@01) (Seq_index
    xs@156@01
    i2@167@01))
  :pattern ((Seq_contains (Seq_range 6 9) i2@167@01) (Seq_index
    xs@156@01
    i1@166@01))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@167@01) (Seq_index
    xs@156@01
    i1@166@01))
  :pattern ((Seq_index xs@156@01 i1@166@01) (Seq_index xs@156@01 i2@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@95@10@95@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::6 <= k && k < 9 ==> acc(xs[k].f, write))
(declare-const k@168@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 4
; [then-branch: 79 | !(6 <= k@168@01) | live]
; [else-branch: 79 | 6 <= k@168@01 | live]
(push) ; 5
; [then-branch: 79 | !(6 <= k@168@01)]
(assert (not (<= 6 k@168@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 79 | 6 <= k@168@01]
(assert (<= 6 k@168@01))
; [eval] k < 9
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@168@01) (not (<= 6 k@168@01))))
(assert (and (<= 6 k@168@01) (< k@168@01 9)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@168@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@168@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@169@01 $FVF<f>)
(declare-fun inv@170@01 ($Ref) Int)
(declare-fun img@171@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@168@01 Int)) (!
  (=>
    (and (<= 6 k@168@01) (< k@168@01 9))
    (or (<= 6 k@168@01) (not (<= 6 k@168@01))))
  :pattern ((Seq_index xs@156@01 k@168@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@168@01 Int) (k2@168@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@168@01) (< k1@168@01 9))
      (and (<= 6 k2@168@01) (< k2@168@01 9))
      (= (Seq_index xs@156@01 k1@168@01) (Seq_index xs@156@01 k2@168@01)))
    (= k1@168@01 k2@168@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@168@01 Int)) (!
  (=>
    (and (<= 6 k@168@01) (< k@168@01 9))
    (and
      (= (inv@170@01 (Seq_index xs@156@01 k@168@01)) k@168@01)
      (img@171@01 (Seq_index xs@156@01 k@168@01))))
  :pattern ((Seq_index xs@156@01 k@168@01))
  :qid |quant-u-111|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@170@01 r)) r))
  :pattern ((inv@170@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@168@01 Int)) (!
  (=>
    (and (<= 6 k@168@01) (< k@168@01 9))
    (not (= (Seq_index xs@156@01 k@168@01) $Ref.null)))
  :pattern ((Seq_index xs@156@01 k@168@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 10 == fun04(xs, true)
(declare-const $t@172@01 $Snap)
(assert (= $t@172@01 $Snap.unit))
; [eval] 10 == fun04(xs, true)
; [eval] fun04(xs, true)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (b ? (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]) : (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 80 | True | live]
; [else-branch: 80 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 80 | True]
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@173@01 Int)
(declare-const i2@174@01 Int)
(push) ; 6
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 81 | !(i1@173@01 in [0..3]) | live]
; [else-branch: 81 | i1@173@01 in [0..3] | live]
(push) ; 8
; [then-branch: 81 | !(i1@173@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@173@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 81 | i1@173@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@173@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 9
; [then-branch: 82 | !(i2@174@01 in [0..3]) | live]
; [else-branch: 82 | i2@174@01 in [0..3] | live]
(push) ; 10
; [then-branch: 82 | !(i2@174@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@174@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 82 | i2@174@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@174@01))
; [eval] i1 != i2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@174@01)
  (not (Seq_contains (Seq_range 0 3) i2@174@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@173@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@173@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@174@01)
      (not (Seq_contains (Seq_range 0 3) i2@174@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@173@01)
  (not (Seq_contains (Seq_range 0 3) i1@173@01))))
(push) ; 7
; [then-branch: 83 | i1@173@01 in [0..3] && i2@174@01 in [0..3] && i1@173@01 != i2@174@01 | live]
; [else-branch: 83 | !(i1@173@01 in [0..3] && i2@174@01 in [0..3] && i1@173@01 != i2@174@01) | live]
(push) ; 8
; [then-branch: 83 | i1@173@01 in [0..3] && i2@174@01 in [0..3] && i1@173@01 != i2@174@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@173@01)
  (and (Seq_contains (Seq_range 0 3) i2@174@01) (not (= i1@173@01 i2@174@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 9
(assert (not (>= i1@173@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i1@173@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 9
(assert (not (>= i2@174@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i2@174@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 83 | !(i1@173@01 in [0..3] && i2@174@01 in [0..3] && i1@173@01 != i2@174@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@173@01)
    (and (Seq_contains (Seq_range 0 3) i2@174@01) (not (= i1@173@01 i2@174@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@173@01)
    (and (Seq_contains (Seq_range 0 3) i2@174@01) (not (= i1@173@01 i2@174@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@173@01)
    (Seq_contains (Seq_range 0 3) i2@174@01)
    (not (= i1@173@01 i2@174@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@173@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@174@01)
        (not (= i1@173@01 i2@174@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@173@01)
    (and (Seq_contains (Seq_range 0 3) i2@174@01) (not (= i1@173@01 i2@174@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (forall ((i1@173@01 Int) (i2@174@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@173@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@174@01)
        (not (= i1@173@01 i2@174@01))))
    (not (= (Seq_index xs@156@01 i1@173@01) (Seq_index xs@156@01 i2@174@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@173@01 Int) (i2@174@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@173@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@174@01)
        (not (= i1@173@01 i2@174@01))))
    (not (= (Seq_index xs@156@01 i1@173@01) (Seq_index xs@156@01 i2@174@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105|)))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 84 | True | live]
; [else-branch: 84 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 84 | True]
(declare-const k@175@01 Int)
(push) ; 5
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 6
; [then-branch: 85 | !(0 <= k@175@01) | live]
; [else-branch: 85 | 0 <= k@175@01 | live]
(push) ; 7
; [then-branch: 85 | !(0 <= k@175@01)]
(assert (not (<= 0 k@175@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 85 | 0 <= k@175@01]
(assert (<= 0 k@175@01))
; [eval] k < 3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@175@01) (not (<= 0 k@175@01))))
(assert (and (<= 0 k@175@01) (< k@175@01 3)))
; [eval] xs[k]
(push) ; 6
(assert (not (>= k@175@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@175@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@176@01 ($Ref) Int)
(declare-fun img@177@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@175@01 Int)) (!
  (=>
    (and (<= 0 k@175@01) (< k@175@01 3))
    (or (<= 0 k@175@01) (not (<= 0 k@175@01))))
  :pattern ((Seq_index xs@156@01 k@175@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@175@01 Int) (k2@175@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@175@01) (< k1@175@01 3))
      (and (<= 0 k2@175@01) (< k2@175@01 3))
      (= (Seq_index xs@156@01 k1@175@01) (Seq_index xs@156@01 k2@175@01)))
    (= k1@175@01 k2@175@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@175@01 Int)) (!
  (=>
    (and (<= 0 k@175@01) (< k@175@01 3))
    (and
      (= (inv@176@01 (Seq_index xs@156@01 k@175@01)) k@175@01)
      (img@177@01 (Seq_index xs@156@01 k@175@01))))
  :pattern ((Seq_index xs@156@01 k@175@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@177@01 r) (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)))
    (= (Seq_index xs@156@01 (inv@176@01 r)) r))
  :pattern ((inv@176@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@178@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3))
      (img@177@01 r)
      (= r (Seq_index xs@156@01 (inv@176@01 r))))
    ($Perm.min
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@179@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3))
      (img@177@01 r)
      (= r (Seq_index xs@156@01 (inv@176@01 r))))
    ($Perm.min
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@178@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@178@01 r))
    $Perm.No)
  
  :qid |quant-u-115|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3))
      (img@177@01 r)
      (= r (Seq_index xs@156@01 (inv@176@01 r))))
    (= (- $Perm.Write (pTaken@178@01 r)) $Perm.No))
  
  :qid |quant-u-116|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@180@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@180@01  $FVF<f>)))
      (and (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)) (img@177@01 r)))
    (=>
      (and (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)) (img@177@01 r))
      (Set_in r ($FVF.domain_f (as sm@180@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@180@01  $FVF<f>))))
  :qid |qp.fvfDomDef39|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)) (img@177@01 r))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3))))
    (= ($FVF.lookup_f (as sm@180@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)) (img@177@01 r))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9))))
    (= ($FVF.lookup_f (as sm@180@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef38|)))
(assert (fun04%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@180@01  $FVF<f>)))) xs@156@01 true))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((k@175@01 Int)) (!
  (=>
    (and (<= 0 k@175@01) (< k@175@01 3))
    (and
      (= (inv@176@01 (Seq_index xs@156@01 k@175@01)) k@175@01)
      (img@177@01 (Seq_index xs@156@01 k@175@01))))
  :pattern ((Seq_index xs@156@01 k@175@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@177@01 r) (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)))
    (= (Seq_index xs@156@01 (inv@176@01 r)) r))
  :pattern ((inv@176@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@180@01  $FVF<f>)))
      (and (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)) (img@177@01 r)))
    (=>
      (and (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)) (img@177@01 r))
      (Set_in r ($FVF.domain_f (as sm@180@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@180@01  $FVF<f>))))
  :qid |qp.fvfDomDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)) (img@177@01 r))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3))))
    (= ($FVF.lookup_f (as sm@180@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@176@01 r)) (< (inv@176@01 r) 3)) (img@177@01 r))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9))))
    (= ($FVF.lookup_f (as sm@180@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((i1@173@01 Int) (i2@174@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@173@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@174@01)
        (not (= i1@173@01 i2@174@01))))
    (not (= (Seq_index xs@156@01 i1@173@01) (Seq_index xs@156@01 i2@174@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105|)))
(assert (and
  (forall ((k@175@01 Int)) (!
    (=>
      (and (<= 0 k@175@01) (< k@175@01 3))
      (or (<= 0 k@175@01) (not (<= 0 k@175@01))))
    :pattern ((Seq_index xs@156@01 k@175@01))
    :qid |f-aux|))
  (fun04%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@180@01  $FVF<f>)))) xs@156@01 true)))
(assert (=
  10
  (fun04 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@180@01  $FVF<f>)))) xs@156@01 true)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 20 == fun04(xs, false)
(declare-const $t@181@01 $Snap)
(assert (= $t@181@01 $Snap.unit))
; [eval] 20 == fun04(xs, false)
; [eval] fun04(xs, false)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (b ? (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]) : (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]))
(push) ; 4
; [then-branch: 86 | False | dead]
; [else-branch: 86 | True | live]
(push) ; 5
; [else-branch: 86 | True]
; [eval] (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@182@01 Int)
(declare-const i2@183@01 Int)
(push) ; 6
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 87 | !(i1@182@01 in [6..9]) | live]
; [else-branch: 87 | i1@182@01 in [6..9] | live]
(push) ; 8
; [then-branch: 87 | !(i1@182@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@182@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 87 | i1@182@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@182@01))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 9
; [then-branch: 88 | !(i2@183@01 in [6..9]) | live]
; [else-branch: 88 | i2@183@01 in [6..9] | live]
(push) ; 10
; [then-branch: 88 | !(i2@183@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@183@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 88 | i2@183@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@183@01))
; [eval] i1 != i2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@183@01)
  (not (Seq_contains (Seq_range 6 9) i2@183@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@182@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@182@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@183@01)
      (not (Seq_contains (Seq_range 6 9) i2@183@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@182@01)
  (not (Seq_contains (Seq_range 6 9) i1@182@01))))
(push) ; 7
; [then-branch: 89 | i1@182@01 in [6..9] && i2@183@01 in [6..9] && i1@182@01 != i2@183@01 | live]
; [else-branch: 89 | !(i1@182@01 in [6..9] && i2@183@01 in [6..9] && i1@182@01 != i2@183@01) | live]
(push) ; 8
; [then-branch: 89 | i1@182@01 in [6..9] && i2@183@01 in [6..9] && i1@182@01 != i2@183@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@182@01)
  (and (Seq_contains (Seq_range 6 9) i2@183@01) (not (= i1@182@01 i2@183@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 9
(assert (not (>= i1@182@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i1@182@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 9
(assert (not (>= i2@183@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i2@183@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 89 | !(i1@182@01 in [6..9] && i2@183@01 in [6..9] && i1@182@01 != i2@183@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@182@01)
    (and (Seq_contains (Seq_range 6 9) i2@183@01) (not (= i1@182@01 i2@183@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@182@01)
    (and (Seq_contains (Seq_range 6 9) i2@183@01) (not (= i1@182@01 i2@183@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@182@01)
    (Seq_contains (Seq_range 6 9) i2@183@01)
    (not (= i1@182@01 i2@183@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@182@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@183@01)
        (not (= i1@182@01 i2@183@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@182@01)
    (and (Seq_contains (Seq_range 6 9) i2@183@01) (not (= i1@182@01 i2@183@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (forall ((i1@182@01 Int) (i2@183@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@182@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@183@01)
        (not (= i1@182@01 i2@183@01))))
    (not (= (Seq_index xs@156@01 i1@182@01) (Seq_index xs@156@01 i2@183@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@182@01 Int) (i2@183@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@182@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@183@01)
        (not (= i1@182@01 i2@183@01))))
    (not (= (Seq_index xs@156@01 i1@182@01) (Seq_index xs@156@01 i2@183@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|)))
; [then-branch: 90 | False | dead]
; [else-branch: 90 | True | live]
(push) ; 4
; [else-branch: 90 | True]
(declare-const k@184@01 Int)
(push) ; 5
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 6
; [then-branch: 91 | !(6 <= k@184@01) | live]
; [else-branch: 91 | 6 <= k@184@01 | live]
(push) ; 7
; [then-branch: 91 | !(6 <= k@184@01)]
(assert (not (<= 6 k@184@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 91 | 6 <= k@184@01]
(assert (<= 6 k@184@01))
; [eval] k < 9
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@184@01) (not (<= 6 k@184@01))))
(assert (and (<= 6 k@184@01) (< k@184@01 9)))
; [eval] xs[k]
(push) ; 6
(assert (not (>= k@184@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@184@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@185@01 ($Ref) Int)
(declare-fun img@186@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@184@01 Int)) (!
  (=>
    (and (<= 6 k@184@01) (< k@184@01 9))
    (or (<= 6 k@184@01) (not (<= 6 k@184@01))))
  :pattern ((Seq_index xs@156@01 k@184@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@184@01 Int) (k2@184@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@184@01) (< k1@184@01 9))
      (and (<= 6 k2@184@01) (< k2@184@01 9))
      (= (Seq_index xs@156@01 k1@184@01) (Seq_index xs@156@01 k2@184@01)))
    (= k1@184@01 k2@184@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@184@01 Int)) (!
  (=>
    (and (<= 6 k@184@01) (< k@184@01 9))
    (and
      (= (inv@185@01 (Seq_index xs@156@01 k@184@01)) k@184@01)
      (img@186@01 (Seq_index xs@156@01 k@184@01))))
  :pattern ((Seq_index xs@156@01 k@184@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@186@01 r) (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@185@01 r)) r))
  :pattern ((inv@185@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@187@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9))
      (img@186@01 r)
      (= r (Seq_index xs@156@01 (inv@185@01 r))))
    ($Perm.min
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@188@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9))
      (img@186@01 r)
      (= r (Seq_index xs@156@01 (inv@185@01 r))))
    ($Perm.min
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@187@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@187@01 r))
    $Perm.No)
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@187@01 r) $Perm.No)
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9))
      (img@186@01 r)
      (= r (Seq_index xs@156@01 (inv@185@01 r))))
    (= (- $Perm.Write (pTaken@187@01 r)) $Perm.No))
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (pTaken@188@01 r))
    $Perm.No)
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@188@01 r) $Perm.No)
  
  :qid |quant-u-123|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9))
      (img@186@01 r)
      (= r (Seq_index xs@156@01 (inv@185@01 r))))
    (= (- (- $Perm.Write (pTaken@187@01 r)) (pTaken@188@01 r)) $Perm.No))
  
  :qid |quant-u-124|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@189@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@189@01  $FVF<f>)))
      (and (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)) (img@186@01 r)))
    (=>
      (and (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)) (img@186@01 r))
      (Set_in r ($FVF.domain_f (as sm@189@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@189@01  $FVF<f>))))
  :qid |qp.fvfDomDef42|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)) (img@186@01 r))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3))))
    (= ($FVF.lookup_f (as sm@189@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@189@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)) (img@186@01 r))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9))))
    (= ($FVF.lookup_f (as sm@189@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@189@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef41|)))
(assert (fun04%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@189@01  $FVF<f>)))) xs@156@01 false))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((k@184@01 Int)) (!
  (=>
    (and (<= 6 k@184@01) (< k@184@01 9))
    (and
      (= (inv@185@01 (Seq_index xs@156@01 k@184@01)) k@184@01)
      (img@186@01 (Seq_index xs@156@01 k@184@01))))
  :pattern ((Seq_index xs@156@01 k@184@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@186@01 r) (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@185@01 r)) r))
  :pattern ((inv@185@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@189@01  $FVF<f>)))
      (and (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)) (img@186@01 r)))
    (=>
      (and (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)) (img@186@01 r))
      (Set_in r ($FVF.domain_f (as sm@189@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@189@01  $FVF<f>))))
  :qid |qp.fvfDomDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)) (img@186@01 r))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3))))
    (= ($FVF.lookup_f (as sm@189@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@189@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@185@01 r)) (< (inv@185@01 r) 9)) (img@186@01 r))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9))))
    (= ($FVF.lookup_f (as sm@189@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@189@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((i1@182@01 Int) (i2@183@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@182@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@183@01)
        (not (= i1@182@01 i2@183@01))))
    (not (= (Seq_index xs@156@01 i1@182@01) (Seq_index xs@156@01 i2@183@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|)))
(assert (and
  (forall ((k@184@01 Int)) (!
    (=>
      (and (<= 6 k@184@01) (< k@184@01 9))
      (or (<= 6 k@184@01) (not (<= 6 k@184@01))))
    :pattern ((Seq_index xs@156@01 k@184@01))
    :qid |f-aux|))
  (fun04%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@189@01  $FVF<f>)))) xs@156@01 false)))
(assert (=
  20
  (fun04 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@189@01  $FVF<f>)))) xs@156@01 false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; xs[8].f := 0
; [eval] xs[8]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 8 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@190@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@156@01 8))
    ($Perm.min
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@191@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@156@01 8))
    ($Perm.min
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@190@01 r)))
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
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@190@01 r))
    $Perm.No)
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@190@01 r) $Perm.No)
  
  :qid |quant-u-127|))))
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
    (= r (Seq_index xs@156@01 8))
    (= (- $Perm.Write (pTaken@190@01 r)) $Perm.No))
  
  :qid |quant-u-128|))))
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
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        $Perm.Write
        $Perm.No)
      (pTaken@191@01 r))
    $Perm.No)
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@191@01 r) $Perm.No)
  
  :qid |quant-u-130|))))
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
    (= r (Seq_index xs@156@01 8))
    (= (- (- $Perm.Write (pTaken@190@01 r)) (pTaken@191@01 r)) $Perm.No))
  
  :qid |quant-u-131|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@192@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@192@01  $FVF<f>) (Seq_index xs@156@01 8)) 0))
; [exec]
; assert 10 == fun04(xs, true)
; [eval] 10 == fun04(xs, true)
; [eval] fun04(xs, true)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (b ? (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]) : (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 92 | True | live]
; [else-branch: 92 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 92 | True]
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@193@01 Int)
(declare-const i2@194@01 Int)
(push) ; 6
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 93 | !(i1@193@01 in [0..3]) | live]
; [else-branch: 93 | i1@193@01 in [0..3] | live]
(push) ; 8
; [then-branch: 93 | !(i1@193@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@193@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 93 | i1@193@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@193@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 9
; [then-branch: 94 | !(i2@194@01 in [0..3]) | live]
; [else-branch: 94 | i2@194@01 in [0..3] | live]
(push) ; 10
; [then-branch: 94 | !(i2@194@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@194@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 94 | i2@194@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@194@01))
; [eval] i1 != i2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@194@01)
  (not (Seq_contains (Seq_range 0 3) i2@194@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@193@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@193@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@194@01)
      (not (Seq_contains (Seq_range 0 3) i2@194@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@193@01)
  (not (Seq_contains (Seq_range 0 3) i1@193@01))))
(push) ; 7
; [then-branch: 95 | i1@193@01 in [0..3] && i2@194@01 in [0..3] && i1@193@01 != i2@194@01 | live]
; [else-branch: 95 | !(i1@193@01 in [0..3] && i2@194@01 in [0..3] && i1@193@01 != i2@194@01) | live]
(push) ; 8
; [then-branch: 95 | i1@193@01 in [0..3] && i2@194@01 in [0..3] && i1@193@01 != i2@194@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@193@01)
  (and (Seq_contains (Seq_range 0 3) i2@194@01) (not (= i1@193@01 i2@194@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 9
(assert (not (>= i1@193@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i1@193@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 9
(assert (not (>= i2@194@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i2@194@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 95 | !(i1@193@01 in [0..3] && i2@194@01 in [0..3] && i1@193@01 != i2@194@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@193@01)
    (and (Seq_contains (Seq_range 0 3) i2@194@01) (not (= i1@193@01 i2@194@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@193@01)
    (and (Seq_contains (Seq_range 0 3) i2@194@01) (not (= i1@193@01 i2@194@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@193@01)
    (Seq_contains (Seq_range 0 3) i2@194@01)
    (not (= i1@193@01 i2@194@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@193@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@194@01)
        (not (= i1@193@01 i2@194@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@193@01)
    (and (Seq_contains (Seq_range 0 3) i2@194@01) (not (= i1@193@01 i2@194@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (forall ((i1@193@01 Int) (i2@194@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@193@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@194@01)
        (not (= i1@193@01 i2@194@01))))
    (not (= (Seq_index xs@156@01 i1@193@01) (Seq_index xs@156@01 i2@194@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@193@01 Int) (i2@194@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@193@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@194@01)
        (not (= i1@193@01 i2@194@01))))
    (not (= (Seq_index xs@156@01 i1@193@01) (Seq_index xs@156@01 i2@194@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105|)))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 96 | True | live]
; [else-branch: 96 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 96 | True]
(declare-const k@195@01 Int)
(push) ; 5
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 6
; [then-branch: 97 | !(0 <= k@195@01) | live]
; [else-branch: 97 | 0 <= k@195@01 | live]
(push) ; 7
; [then-branch: 97 | !(0 <= k@195@01)]
(assert (not (<= 0 k@195@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 97 | 0 <= k@195@01]
(assert (<= 0 k@195@01))
; [eval] k < 3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@195@01) (not (<= 0 k@195@01))))
(assert (and (<= 0 k@195@01) (< k@195@01 3)))
; [eval] xs[k]
(push) ; 6
(assert (not (>= k@195@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@195@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@196@01 ($Ref) Int)
(declare-fun img@197@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@195@01 Int)) (!
  (=>
    (and (<= 0 k@195@01) (< k@195@01 3))
    (or (<= 0 k@195@01) (not (<= 0 k@195@01))))
  :pattern ((Seq_index xs@156@01 k@195@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@195@01 Int) (k2@195@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@195@01) (< k1@195@01 3))
      (and (<= 0 k2@195@01) (< k2@195@01 3))
      (= (Seq_index xs@156@01 k1@195@01) (Seq_index xs@156@01 k2@195@01)))
    (= k1@195@01 k2@195@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@195@01 Int)) (!
  (=>
    (and (<= 0 k@195@01) (< k@195@01 3))
    (and
      (= (inv@196@01 (Seq_index xs@156@01 k@195@01)) k@195@01)
      (img@197@01 (Seq_index xs@156@01 k@195@01))))
  :pattern ((Seq_index xs@156@01 k@195@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@197@01 r) (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)))
    (= (Seq_index xs@156@01 (inv@196@01 r)) r))
  :pattern ((inv@196@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@198@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3))
      (img@197@01 r)
      (= r (Seq_index xs@156@01 (inv@196@01 r))))
    ($Perm.min
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@199@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3))
      (img@197@01 r)
      (= r (Seq_index xs@156@01 (inv@196@01 r))))
    ($Perm.min
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@198@01 r)))
    $Perm.No))
(define-fun pTaken@200@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3))
      (img@197@01 r)
      (= r (Seq_index xs@156@01 (inv@196@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@198@01 r)) (pTaken@199@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      (pTaken@198@01 r))
    $Perm.No)
  
  :qid |quant-u-134|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@198@01 r) $Perm.No)
  
  :qid |quant-u-135|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3))
      (img@197@01 r)
      (= r (Seq_index xs@156@01 (inv@196@01 r))))
    (= (- $Perm.Write (pTaken@198@01 r)) $Perm.No))
  
  :qid |quant-u-136|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      (pTaken@199@01 r))
    $Perm.No)
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@199@01 r) $Perm.No)
  
  :qid |quant-u-138|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3))
      (img@197@01 r)
      (= r (Seq_index xs@156@01 (inv@196@01 r))))
    (= (- (- $Perm.Write (pTaken@198@01 r)) (pTaken@199@01 r)) $Perm.No))
  
  :qid |quant-u-139|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@201@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@201@01  $FVF<f>)))
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r)))
    (=>
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r))
      (Set_in r ($FVF.domain_f (as sm@201@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@201@01  $FVF<f>))))
  :qid |qp.fvfDomDef46|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@201@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@201@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@201@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@201@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@201@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@201@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef45|)))
(assert (fun04%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@201@01  $FVF<f>)))) xs@156@01 true))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((k@195@01 Int)) (!
  (=>
    (and (<= 0 k@195@01) (< k@195@01 3))
    (and
      (= (inv@196@01 (Seq_index xs@156@01 k@195@01)) k@195@01)
      (img@197@01 (Seq_index xs@156@01 k@195@01))))
  :pattern ((Seq_index xs@156@01 k@195@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@197@01 r) (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)))
    (= (Seq_index xs@156@01 (inv@196@01 r)) r))
  :pattern ((inv@196@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@201@01  $FVF<f>)))
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r)))
    (=>
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r))
      (Set_in r ($FVF.domain_f (as sm@201@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@201@01  $FVF<f>))))
  :qid |qp.fvfDomDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@201@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@201@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@201@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@201@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@196@01 r)) (< (inv@196@01 r) 3)) (img@197@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@201@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@201@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((i1@193@01 Int) (i2@194@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@193@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@194@01)
        (not (= i1@193@01 i2@194@01))))
    (not (= (Seq_index xs@156@01 i1@193@01) (Seq_index xs@156@01 i2@194@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105|)))
(assert (and
  (forall ((k@195@01 Int)) (!
    (=>
      (and (<= 0 k@195@01) (< k@195@01 3))
      (or (<= 0 k@195@01) (not (<= 0 k@195@01))))
    :pattern ((Seq_index xs@156@01 k@195@01))
    :qid |f-aux|))
  (fun04%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@201@01  $FVF<f>)))) xs@156@01 true)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun04 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@201@01  $FVF<f>)))) xs@156@01 true))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  10
  (fun04 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@201@01  $FVF<f>)))) xs@156@01 true)))
; [exec]
; assert 20 == fun04(xs, false)
; [eval] 20 == fun04(xs, false)
; [eval] fun04(xs, false)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (b ? (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]) : (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]))
(push) ; 4
; [then-branch: 98 | False | dead]
; [else-branch: 98 | True | live]
(push) ; 5
; [else-branch: 98 | True]
; [eval] (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@202@01 Int)
(declare-const i2@203@01 Int)
(push) ; 6
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 99 | !(i1@202@01 in [6..9]) | live]
; [else-branch: 99 | i1@202@01 in [6..9] | live]
(push) ; 8
; [then-branch: 99 | !(i1@202@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@202@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 99 | i1@202@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@202@01))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 9
; [then-branch: 100 | !(i2@203@01 in [6..9]) | live]
; [else-branch: 100 | i2@203@01 in [6..9] | live]
(push) ; 10
; [then-branch: 100 | !(i2@203@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@203@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 100 | i2@203@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@203@01))
; [eval] i1 != i2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@203@01)
  (not (Seq_contains (Seq_range 6 9) i2@203@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@202@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@202@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@203@01)
      (not (Seq_contains (Seq_range 6 9) i2@203@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@202@01)
  (not (Seq_contains (Seq_range 6 9) i1@202@01))))
(push) ; 7
; [then-branch: 101 | i1@202@01 in [6..9] && i2@203@01 in [6..9] && i1@202@01 != i2@203@01 | live]
; [else-branch: 101 | !(i1@202@01 in [6..9] && i2@203@01 in [6..9] && i1@202@01 != i2@203@01) | live]
(push) ; 8
; [then-branch: 101 | i1@202@01 in [6..9] && i2@203@01 in [6..9] && i1@202@01 != i2@203@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@202@01)
  (and (Seq_contains (Seq_range 6 9) i2@203@01) (not (= i1@202@01 i2@203@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 9
(assert (not (>= i1@202@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i1@202@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 9
(assert (not (>= i2@203@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i2@203@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 101 | !(i1@202@01 in [6..9] && i2@203@01 in [6..9] && i1@202@01 != i2@203@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@202@01)
    (and (Seq_contains (Seq_range 6 9) i2@203@01) (not (= i1@202@01 i2@203@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@202@01)
    (and (Seq_contains (Seq_range 6 9) i2@203@01) (not (= i1@202@01 i2@203@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@202@01)
    (Seq_contains (Seq_range 6 9) i2@203@01)
    (not (= i1@202@01 i2@203@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@202@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@203@01)
        (not (= i1@202@01 i2@203@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@202@01)
    (and (Seq_contains (Seq_range 6 9) i2@203@01) (not (= i1@202@01 i2@203@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (forall ((i1@202@01 Int) (i2@203@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@202@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@203@01)
        (not (= i1@202@01 i2@203@01))))
    (not (= (Seq_index xs@156@01 i1@202@01) (Seq_index xs@156@01 i2@203@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@202@01 Int) (i2@203@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@202@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@203@01)
        (not (= i1@202@01 i2@203@01))))
    (not (= (Seq_index xs@156@01 i1@202@01) (Seq_index xs@156@01 i2@203@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|)))
; [then-branch: 102 | False | dead]
; [else-branch: 102 | True | live]
(push) ; 4
; [else-branch: 102 | True]
(declare-const k@204@01 Int)
(push) ; 5
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 6
; [then-branch: 103 | !(6 <= k@204@01) | live]
; [else-branch: 103 | 6 <= k@204@01 | live]
(push) ; 7
; [then-branch: 103 | !(6 <= k@204@01)]
(assert (not (<= 6 k@204@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 103 | 6 <= k@204@01]
(assert (<= 6 k@204@01))
; [eval] k < 9
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@204@01) (not (<= 6 k@204@01))))
(assert (and (<= 6 k@204@01) (< k@204@01 9)))
; [eval] xs[k]
(push) ; 6
(assert (not (>= k@204@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@204@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@205@01 ($Ref) Int)
(declare-fun img@206@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@204@01 Int)) (!
  (=>
    (and (<= 6 k@204@01) (< k@204@01 9))
    (or (<= 6 k@204@01) (not (<= 6 k@204@01))))
  :pattern ((Seq_index xs@156@01 k@204@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@204@01 Int) (k2@204@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@204@01) (< k1@204@01 9))
      (and (<= 6 k2@204@01) (< k2@204@01 9))
      (= (Seq_index xs@156@01 k1@204@01) (Seq_index xs@156@01 k2@204@01)))
    (= k1@204@01 k2@204@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@204@01 Int)) (!
  (=>
    (and (<= 6 k@204@01) (< k@204@01 9))
    (and
      (= (inv@205@01 (Seq_index xs@156@01 k@204@01)) k@204@01)
      (img@206@01 (Seq_index xs@156@01 k@204@01))))
  :pattern ((Seq_index xs@156@01 k@204@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@206@01 r) (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@205@01 r)) r))
  :pattern ((inv@205@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@207@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9))
      (img@206@01 r)
      (= r (Seq_index xs@156@01 (inv@205@01 r))))
    ($Perm.min
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@208@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9))
      (img@206@01 r)
      (= r (Seq_index xs@156@01 (inv@205@01 r))))
    ($Perm.min
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@207@01 r)))
    $Perm.No))
(define-fun pTaken@209@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9))
      (img@206@01 r)
      (= r (Seq_index xs@156@01 (inv@205@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@207@01 r)) (pTaken@208@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      (pTaken@207@01 r))
    $Perm.No)
  
  :qid |quant-u-142|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9))
      (img@206@01 r)
      (= r (Seq_index xs@156@01 (inv@205@01 r))))
    (= (- $Perm.Write (pTaken@207@01 r)) $Perm.No))
  
  :qid |quant-u-143|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      (pTaken@208@01 r))
    $Perm.No)
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@208@01 r) $Perm.No)
  
  :qid |quant-u-145|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9))
      (img@206@01 r)
      (= r (Seq_index xs@156@01 (inv@205@01 r))))
    (= (- (- $Perm.Write (pTaken@207@01 r)) (pTaken@208@01 r)) $Perm.No))
  
  :qid |quant-u-146|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index xs@156@01 8) (Seq_index xs@156@01 8))
      $Perm.Write
      $Perm.No)
    (pTaken@209@01 (Seq_index xs@156@01 8)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@209@01 r) $Perm.No)
  
  :qid |quant-u-148|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9))
      (img@206@01 r)
      (= r (Seq_index xs@156@01 (inv@205@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@207@01 r)) (pTaken@208@01 r))
        (pTaken@209@01 r))
      $Perm.No))
  
  :qid |quant-u-149|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@210@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@210@01  $FVF<f>)))
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r)))
    (=>
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r))
      (Set_in r ($FVF.domain_f (as sm@210@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@210@01  $FVF<f>))))
  :qid |qp.fvfDomDef50|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@210@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef49|)))
(assert (fun04%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@210@01  $FVF<f>)))) xs@156@01 false))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((k@204@01 Int)) (!
  (=>
    (and (<= 6 k@204@01) (< k@204@01 9))
    (and
      (= (inv@205@01 (Seq_index xs@156@01 k@204@01)) k@204@01)
      (img@206@01 (Seq_index xs@156@01 k@204@01))))
  :pattern ((Seq_index xs@156@01 k@204@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@206@01 r) (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@205@01 r)) r))
  :pattern ((inv@205@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@210@01  $FVF<f>)))
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r)))
    (=>
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r))
      (Set_in r ($FVF.domain_f (as sm@210@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@210@01  $FVF<f>))))
  :qid |qp.fvfDomDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@210@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@205@01 r)) (< (inv@205@01 r) 9)) (img@206@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((i1@202@01 Int) (i2@203@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@202@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@203@01)
        (not (= i1@202@01 i2@203@01))))
    (not (= (Seq_index xs@156@01 i1@202@01) (Seq_index xs@156@01 i2@203@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|)))
(assert (and
  (forall ((k@204@01 Int)) (!
    (=>
      (and (<= 6 k@204@01) (< k@204@01 9))
      (or (<= 6 k@204@01) (not (<= 6 k@204@01))))
    :pattern ((Seq_index xs@156@01 k@204@01))
    :qid |f-aux|))
  (fun04%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@210@01  $FVF<f>)))) xs@156@01 false)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  20
  (fun04 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@210@01  $FVF<f>)))) xs@156@01 false))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-150|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@211@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@211@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@211@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@211@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@211@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@211@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@211@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef53|)))
(declare-const pm@212@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@212@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@212@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (<= ($FVF.perm_f (as pm@212@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@212@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@212@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 20 == fun04(xs, false)
; [eval] fun04(xs, false)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (b ? (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]) : (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]))
(push) ; 4
; [then-branch: 104 | False | dead]
; [else-branch: 104 | True | live]
(push) ; 5
; [else-branch: 104 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-151|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@213@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@213@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@213@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@213@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@213@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@213@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@213@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef57|)))
(declare-const pm@214@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@214@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@214@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@214@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@214@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@214@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
; [eval] (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@215@01 Int)
(declare-const i2@216@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 105 | !(i1@215@01 in [6..9]) | live]
; [else-branch: 105 | i1@215@01 in [6..9] | live]
(push) ; 8
; [then-branch: 105 | !(i1@215@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@215@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-152|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 105 | i1@215@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@215@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-153|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] (i2 in [6..9))
; [eval] [6..9)
(set-option :timeout 0)
(push) ; 9
; [then-branch: 106 | !(i2@216@01 in [6..9]) | live]
; [else-branch: 106 | i2@216@01 in [6..9] | live]
(push) ; 10
; [then-branch: 106 | !(i2@216@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@216@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-154|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 106 | i2@216@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@216@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i1 != i2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@216@01)
  (not (Seq_contains (Seq_range 6 9) i2@216@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@215@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@215@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@216@01)
      (not (Seq_contains (Seq_range 6 9) i2@216@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@215@01)
  (not (Seq_contains (Seq_range 6 9) i1@215@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 107 | i1@215@01 in [6..9] && i2@216@01 in [6..9] && i1@215@01 != i2@216@01 | live]
; [else-branch: 107 | !(i1@215@01 in [6..9] && i2@216@01 in [6..9] && i1@215@01 != i2@216@01) | live]
(push) ; 8
; [then-branch: 107 | i1@215@01 in [6..9] && i2@216@01 in [6..9] && i1@215@01 != i2@216@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@215@01)
  (and (Seq_contains (Seq_range 6 9) i2@216@01) (not (= i1@215@01 i2@216@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-156|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(set-option :timeout 0)
(push) ; 9
(assert (not (>= i1@215@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i1@215@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 9
(assert (not (>= i2@216@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i2@216@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 107 | !(i1@215@01 in [6..9] && i2@216@01 in [6..9] && i1@215@01 != i2@216@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@215@01)
    (and (Seq_contains (Seq_range 6 9) i2@216@01) (not (= i1@215@01 i2@216@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-157|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@215@01)
    (and (Seq_contains (Seq_range 6 9) i2@216@01) (not (= i1@215@01 i2@216@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@215@01)
    (Seq_contains (Seq_range 6 9) i2@216@01)
    (not (= i1@215@01 i2@216@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@215@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@216@01)
        (not (= i1@215@01 i2@216@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@215@01)
    (and (Seq_contains (Seq_range 6 9) i2@216@01) (not (= i1@215@01 i2@216@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@213@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@213@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@213@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@213@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@213@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@213@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@214@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@214@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
(assert (and
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@214@01  $FPM) r) $Perm.Write)
    :pattern ((inv@163@01 r))
    :qid |qp-fld-prm-bnd|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@214@01  $FPM) r) $Perm.Write)
    :pattern ((inv@170@01 r))
    :qid |qp-fld-prm-bnd|))
  (<= ($FVF.perm_f (as pm@214@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write)))
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i1@215@01 Int) (i2@216@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@215@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@216@01)
        (not (= i1@215@01 i2@216@01))))
    (not (= (Seq_index xs@156@01 i1@215@01) (Seq_index xs@156@01 i2@216@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@215@01 Int) (i2@216@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@215@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@216@01)
        (not (= i1@215@01 i2@216@01))))
    (not (= (Seq_index xs@156@01 i1@215@01) (Seq_index xs@156@01 i2@216@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|)))
; [then-branch: 108 | False | dead]
; [else-branch: 108 | True | live]
(push) ; 4
; [else-branch: 108 | True]
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
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-158|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(declare-const k@217@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 6
; [then-branch: 109 | !(6 <= k@217@01) | live]
; [else-branch: 109 | 6 <= k@217@01 | live]
(push) ; 7
; [then-branch: 109 | !(6 <= k@217@01)]
(assert (not (<= 6 k@217@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-159|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 109 | 6 <= k@217@01]
(assert (<= 6 k@217@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-160|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] k < 9
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@217@01) (not (<= 6 k@217@01))))
(assert (and (<= 6 k@217@01) (< k@217@01 9)))
; [eval] xs[k]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= k@217@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@217@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@218@01 ($Ref) Int)
(declare-fun img@219@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@217@01 Int)) (!
  (=>
    (and (<= 6 k@217@01) (< k@217@01 9))
    (or (<= 6 k@217@01) (not (<= 6 k@217@01))))
  :pattern ((Seq_index xs@156@01 k@217@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@217@01 Int) (k2@217@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@217@01) (< k1@217@01 9))
      (and (<= 6 k2@217@01) (< k2@217@01 9))
      (= (Seq_index xs@156@01 k1@217@01) (Seq_index xs@156@01 k2@217@01)))
    (= k1@217@01 k2@217@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@217@01 Int)) (!
  (=>
    (and (<= 6 k@217@01) (< k@217@01 9))
    (and
      (= (inv@218@01 (Seq_index xs@156@01 k@217@01)) k@217@01)
      (img@219@01 (Seq_index xs@156@01 k@217@01))))
  :pattern ((Seq_index xs@156@01 k@217@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@219@01 r) (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@218@01 r)) r))
  :pattern ((inv@218@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@220@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9))
      (img@219@01 r)
      (= r (Seq_index xs@156@01 (inv@218@01 r))))
    ($Perm.min
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@221@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9))
      (img@219@01 r)
      (= r (Seq_index xs@156@01 (inv@218@01 r))))
    ($Perm.min
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@220@01 r)))
    $Perm.No))
(define-fun pTaken@222@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9))
      (img@219@01 r)
      (= r (Seq_index xs@156@01 (inv@218@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@220@01 r)) (pTaken@221@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      (pTaken@220@01 r))
    $Perm.No)
  
  :qid |quant-u-163|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@220@01 r) $Perm.No)
  
  :qid |quant-u-164|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9))
      (img@219@01 r)
      (= r (Seq_index xs@156@01 (inv@218@01 r))))
    (= (- $Perm.Write (pTaken@220@01 r)) $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      (pTaken@221@01 r))
    $Perm.No)
  
  :qid |quant-u-166|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9))
      (img@219@01 r)
      (= r (Seq_index xs@156@01 (inv@218@01 r))))
    (= (- (- $Perm.Write (pTaken@220@01 r)) (pTaken@221@01 r)) $Perm.No))
  
  :qid |quant-u-167|))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index xs@156@01 8) (Seq_index xs@156@01 8))
      $Perm.Write
      $Perm.No)
    (pTaken@222@01 (Seq_index xs@156@01 8)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9))
      (img@219@01 r)
      (= r (Seq_index xs@156@01 (inv@218@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@220@01 r)) (pTaken@221@01 r))
        (pTaken@222@01 r))
      $Perm.No))
  
  :qid |quant-u-169|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@223@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@223@01  $FVF<f>)))
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r)))
    (=>
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r))
      (Set_in r ($FVF.domain_f (as sm@223@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@223@01  $FVF<f>))))
  :qid |qp.fvfDomDef62|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@223@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@223@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@223@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@223@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@223@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@223@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef61|)))
(assert (fun04%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@223@01  $FVF<f>)))) xs@156@01 false))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@213@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@213@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@213@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@213@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@213@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@213@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@214@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@214@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
(assert (forall ((k@217@01 Int)) (!
  (=>
    (and (<= 6 k@217@01) (< k@217@01 9))
    (and
      (= (inv@218@01 (Seq_index xs@156@01 k@217@01)) k@217@01)
      (img@219@01 (Seq_index xs@156@01 k@217@01))))
  :pattern ((Seq_index xs@156@01 k@217@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@219@01 r) (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@218@01 r)) r))
  :pattern ((inv@218@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@223@01  $FVF<f>)))
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r)))
    (=>
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r))
      (Set_in r ($FVF.domain_f (as sm@223@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@223@01  $FVF<f>))))
  :qid |qp.fvfDomDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@223@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@223@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@223@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@223@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@218@01 r)) (< (inv@218@01 r) 9)) (img@219@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@223@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@223@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef61|)))
(assert (and
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@214@01  $FPM) r) $Perm.Write)
    :pattern ((inv@163@01 r))
    :qid |qp-fld-prm-bnd|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@214@01  $FPM) r) $Perm.Write)
    :pattern ((inv@170@01 r))
    :qid |qp-fld-prm-bnd|))
  (<= ($FVF.perm_f (as pm@214@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write)
  (forall ((i1@215@01 Int) (i2@216@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@215@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@216@01)
          (not (= i1@215@01 i2@216@01))))
      (not (= (Seq_index xs@156@01 i1@215@01) (Seq_index xs@156@01 i2@216@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|))))
(assert (and
  (forall ((k@217@01 Int)) (!
    (=>
      (and (<= 6 k@217@01) (< k@217@01 9))
      (or (<= 6 k@217@01) (not (<= 6 k@217@01))))
    :pattern ((Seq_index xs@156@01 k@217@01))
    :qid |f-aux|))
  (fun04%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@223@01  $FVF<f>)))) xs@156@01 false)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  20
  (fun04 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@223@01  $FVF<f>)))) xs@156@01 false))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-170|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@224@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@224@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@224@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@224@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@224@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@224@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@224@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef65|)))
(declare-const pm@225@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@225@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@225@01  $FPM) r))
  :qid |qp.resPrmSumDef66|)))
(assert (<= ($FVF.perm_f (as pm@225@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@225@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@225@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 20 == fun04(xs, false)
; [eval] fun04(xs, false)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (b ? (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]) : (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]))
(push) ; 4
; [then-branch: 110 | False | dead]
; [else-branch: 110 | True | live]
(push) ; 5
; [else-branch: 110 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-171|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@226@01 Int)
(declare-const i2@227@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 111 | !(i1@226@01 in [6..9]) | live]
; [else-branch: 111 | i1@226@01 in [6..9] | live]
(push) ; 8
; [then-branch: 111 | !(i1@226@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@226@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-172|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(declare-const sm@228@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef69|)))
(declare-const pm@229@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@229@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@229@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@229@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@229@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 111 | i1@226@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@226@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-173|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(declare-const sm@230@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@230@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef73|)))
(declare-const pm@231@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@231@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@231@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@231@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(set-option :timeout 0)
(push) ; 9
; [then-branch: 112 | !(i2@227@01 in [6..9]) | live]
; [else-branch: 112 | i2@227@01 in [6..9] | live]
(push) ; 10
; [then-branch: 112 | !(i2@227@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@227@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-174|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 112 | i2@227@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@227@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-175|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i1 != i2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@227@01)
  (not (Seq_contains (Seq_range 6 9) i2@227@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@229@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
(assert (=>
  (not (Seq_contains (Seq_range 6 9) i1@226@01))
  (and
    (not (Seq_contains (Seq_range 6 9) i1@226@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@229@01  $FPM) r) $Perm.Write)
      :pattern ((inv@163@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@229@01  $FPM) r) $Perm.Write)
      :pattern ((inv@170@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@229@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@230@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@231@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@231@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@226@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@226@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
      :pattern ((inv@163@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
      :pattern ((inv@170@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@231@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write)
    (or
      (Seq_contains (Seq_range 6 9) i2@227@01)
      (not (Seq_contains (Seq_range 6 9) i2@227@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@226@01)
  (not (Seq_contains (Seq_range 6 9) i1@226@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 113 | i1@226@01 in [6..9] && i2@227@01 in [6..9] && i1@226@01 != i2@227@01 | live]
; [else-branch: 113 | !(i1@226@01 in [6..9] && i2@227@01 in [6..9] && i1@226@01 != i2@227@01) | live]
(push) ; 8
; [then-branch: 113 | i1@226@01 in [6..9] && i2@227@01 in [6..9] && i1@226@01 != i2@227@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@226@01)
  (and (Seq_contains (Seq_range 6 9) i2@227@01) (not (= i1@226@01 i2@227@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-176|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@231@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(set-option :timeout 0)
(push) ; 9
(assert (not (>= i1@226@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i1@226@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 9
(assert (not (>= i2@227@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i2@227@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 113 | !(i1@226@01 in [6..9] && i2@227@01 in [6..9] && i1@226@01 != i2@227@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@226@01)
    (and (Seq_contains (Seq_range 6 9) i2@227@01) (not (= i1@226@01 i2@227@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-177|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@231@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@226@01)
    (and (Seq_contains (Seq_range 6 9) i2@227@01) (not (= i1@226@01 i2@227@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@226@01)
    (Seq_contains (Seq_range 6 9) i2@227@01)
    (not (= i1@226@01 i2@227@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
      :pattern ((inv@163@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
      :pattern ((inv@170@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@231@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@226@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@227@01)
        (not (= i1@226@01 i2@227@01)))))
  (and
    (not
      (and
        (Seq_contains (Seq_range 6 9) i1@226@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@227@01)
          (not (= i1@226@01 i2@227@01)))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
      :pattern ((inv@163@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@231@01  $FPM) r) $Perm.Write)
      :pattern ((inv@170@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@231@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))))
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@226@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@227@01)
        (not (= i1@226@01 i2@227@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@226@01)
    (and (Seq_contains (Seq_range 6 9) i2@227@01) (not (= i1@226@01 i2@227@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@229@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@230@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@231@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@231@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@229@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@230@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@231@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@231@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i1@226@01 Int) (i2@227@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@226@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@227@01)
        (not (= i1@226@01 i2@227@01))))
    (not (= (Seq_index xs@156@01 i1@226@01) (Seq_index xs@156@01 i2@227@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@226@01 Int) (i2@227@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@226@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@227@01)
        (not (= i1@226@01 i2@227@01))))
    (not (= (Seq_index xs@156@01 i1@226@01) (Seq_index xs@156@01 i2@227@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|)))
; [then-branch: 114 | False | dead]
; [else-branch: 114 | True | live]
(push) ; 4
; [else-branch: 114 | True]
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
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-178|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(declare-const k@232@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 6
; [then-branch: 115 | !(6 <= k@232@01) | live]
; [else-branch: 115 | 6 <= k@232@01 | live]
(push) ; 7
; [then-branch: 115 | !(6 <= k@232@01)]
(assert (not (<= 6 k@232@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-179|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@233@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@233@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@233@01  $FPM) r))
  :qid |qp.resPrmSumDef75|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@233@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@233@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@233@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 115 | 6 <= k@232@01]
(assert (<= 6 k@232@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-180|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@234@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@234@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@234@01  $FPM) r))
  :qid |qp.resPrmSumDef76|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@234@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@234@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@234@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
; [eval] k < 9
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@233@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@233@01  $FPM) r))
  :qid |qp.resPrmSumDef75|)))
(assert (=>
  (not (<= 6 k@232@01))
  (and
    (not (<= 6 k@232@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@233@01  $FPM) r) $Perm.Write)
      :pattern ((inv@163@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@233@01  $FPM) r) $Perm.Write)
      :pattern ((inv@170@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@233@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@234@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@234@01  $FPM) r))
  :qid |qp.resPrmSumDef76|)))
(assert (=>
  (<= 6 k@232@01)
  (and
    (<= 6 k@232@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@234@01  $FPM) r) $Perm.Write)
      :pattern ((inv@163@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@234@01  $FPM) r) $Perm.Write)
      :pattern ((inv@170@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@234@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))))
(assert (or (<= 6 k@232@01) (not (<= 6 k@232@01))))
(assert (and (<= 6 k@232@01) (< k@232@01 9)))
; [eval] xs[k]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= k@232@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@232@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@235@01 ($Ref) Int)
(declare-fun img@236@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@233@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@233@01  $FPM) r))
  :qid |qp.resPrmSumDef75|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@234@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@234@01  $FPM) r))
  :qid |qp.resPrmSumDef76|)))
; Nested auxiliary terms: non-globals
(assert (forall ((k@232@01 Int)) (!
  (=>
    (and (<= 6 k@232@01) (< k@232@01 9))
    (and
      (=>
        (not (<= 6 k@232@01))
        (and
          (not (<= 6 k@232@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@233@01  $FPM) r) $Perm.Write)
            :pattern ((inv@163@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@233@01  $FPM) r) $Perm.Write)
            :pattern ((inv@170@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@233@01  $FPM) (Seq_index xs@156@01 8))
            $Perm.Write)))
      (=>
        (<= 6 k@232@01)
        (and
          (<= 6 k@232@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@234@01  $FPM) r) $Perm.Write)
            :pattern ((inv@163@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@234@01  $FPM) r) $Perm.Write)
            :pattern ((inv@170@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@234@01  $FPM) (Seq_index xs@156@01 8))
            $Perm.Write)))
      (or (<= 6 k@232@01) (not (<= 6 k@232@01)))))
  :pattern ((Seq_index xs@156@01 k@232@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@232@01 Int) (k2@232@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@232@01) (< k1@232@01 9))
      (and (<= 6 k2@232@01) (< k2@232@01 9))
      (= (Seq_index xs@156@01 k1@232@01) (Seq_index xs@156@01 k2@232@01)))
    (= k1@232@01 k2@232@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@232@01 Int)) (!
  (=>
    (and (<= 6 k@232@01) (< k@232@01 9))
    (and
      (= (inv@235@01 (Seq_index xs@156@01 k@232@01)) k@232@01)
      (img@236@01 (Seq_index xs@156@01 k@232@01))))
  :pattern ((Seq_index xs@156@01 k@232@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@236@01 r) (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@235@01 r)) r))
  :pattern ((inv@235@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@237@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9))
      (img@236@01 r)
      (= r (Seq_index xs@156@01 (inv@235@01 r))))
    ($Perm.min
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@238@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9))
      (img@236@01 r)
      (= r (Seq_index xs@156@01 (inv@235@01 r))))
    ($Perm.min
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@237@01 r)))
    $Perm.No))
(define-fun pTaken@239@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9))
      (img@236@01 r)
      (= r (Seq_index xs@156@01 (inv@235@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@237@01 r)) (pTaken@238@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      (pTaken@237@01 r))
    $Perm.No)
  
  :qid |quant-u-183|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9))
      (img@236@01 r)
      (= r (Seq_index xs@156@01 (inv@235@01 r))))
    (= (- $Perm.Write (pTaken@237@01 r)) $Perm.No))
  
  :qid |quant-u-184|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      (pTaken@238@01 r))
    $Perm.No)
  
  :qid |quant-u-185|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@238@01 r) $Perm.No)
  
  :qid |quant-u-186|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9))
      (img@236@01 r)
      (= r (Seq_index xs@156@01 (inv@235@01 r))))
    (= (- (- $Perm.Write (pTaken@237@01 r)) (pTaken@238@01 r)) $Perm.No))
  
  :qid |quant-u-187|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index xs@156@01 8) (Seq_index xs@156@01 8))
      $Perm.Write
      $Perm.No)
    (pTaken@239@01 (Seq_index xs@156@01 8)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9))
      (img@236@01 r)
      (= r (Seq_index xs@156@01 (inv@235@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@237@01 r)) (pTaken@238@01 r))
        (pTaken@239@01 r))
      $Perm.No))
  
  :qid |quant-u-189|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@240@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@240@01  $FVF<f>)))
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r)))
    (=>
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r))
      (Set_in r ($FVF.domain_f (as sm@240@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@240@01  $FVF<f>))))
  :qid |qp.fvfDomDef80|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@240@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@240@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@240@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@240@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@240@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@240@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef79|)))
(assert (fun04%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@240@01  $FVF<f>)))) xs@156@01 false))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@228@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@229@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@230@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@230@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@230@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@231@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@231@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@233@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@233@01  $FPM) r))
  :qid |qp.resPrmSumDef75|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@234@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@234@01  $FPM) r))
  :qid |qp.resPrmSumDef76|)))
(assert (forall ((k@232@01 Int)) (!
  (=>
    (and (<= 6 k@232@01) (< k@232@01 9))
    (and
      (= (inv@235@01 (Seq_index xs@156@01 k@232@01)) k@232@01)
      (img@236@01 (Seq_index xs@156@01 k@232@01))))
  :pattern ((Seq_index xs@156@01 k@232@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@236@01 r) (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@235@01 r)) r))
  :pattern ((inv@235@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@240@01  $FVF<f>)))
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r)))
    (=>
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r))
      (Set_in r ($FVF.domain_f (as sm@240@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@240@01  $FVF<f>))))
  :qid |qp.fvfDomDef80|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@240@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@240@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@240@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@240@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@235@01 r)) (< (inv@235@01 r) 9)) (img@236@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@240@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@240@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((i1@226@01 Int) (i2@227@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@226@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@227@01)
        (not (= i1@226@01 i2@227@01))))
    (not (= (Seq_index xs@156@01 i1@226@01) (Seq_index xs@156@01 i2@227@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|)))
(assert (and
  (forall ((k@232@01 Int)) (!
    (=>
      (and (<= 6 k@232@01) (< k@232@01 9))
      (and
        (=>
          (not (<= 6 k@232@01))
          (and
            (not (<= 6 k@232@01))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@233@01  $FPM) r) $Perm.Write)
              :pattern ((inv@163@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@233@01  $FPM) r) $Perm.Write)
              :pattern ((inv@170@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@233@01  $FPM) (Seq_index xs@156@01 8))
              $Perm.Write)))
        (=>
          (<= 6 k@232@01)
          (and
            (<= 6 k@232@01)
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@234@01  $FPM) r) $Perm.Write)
              :pattern ((inv@163@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@234@01  $FPM) r) $Perm.Write)
              :pattern ((inv@170@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@234@01  $FPM) (Seq_index xs@156@01 8))
              $Perm.Write)))
        (or (<= 6 k@232@01) (not (<= 6 k@232@01)))))
    :pattern ((Seq_index xs@156@01 k@232@01))
    :qid |f-aux|))
  (fun04%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@240@01  $FVF<f>)))) xs@156@01 false)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  20
  (fun04 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@240@01  $FVF<f>)))) xs@156@01 false))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-190|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] 20 == fun04(xs, false)
; [eval] fun04(xs, false)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; [eval] (b ? (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]) : (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]))
(push) ; 4
; [then-branch: 116 | False | dead]
; [else-branch: 116 | True | live]
(push) ; 5
; [else-branch: 116 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-191|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@241@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@241@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@241@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@241@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@241@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@241@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@241@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef83|)))
(declare-const pm@242@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@242@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@242@01  $FPM) r))
  :qid |qp.resPrmSumDef84|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@242@01  $FPM) r) $Perm.Write)
  :pattern ((inv@163@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@242@01  $FPM) r) $Perm.Write)
  :pattern ((inv@170@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@242@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write))
; [eval] (forall i1: Int, i2: Int ::(i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@243@01 Int)
(declare-const i2@244@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 117 | !(i1@243@01 in [6..9]) | live]
; [else-branch: 117 | i1@243@01 in [6..9] | live]
(push) ; 8
; [then-branch: 117 | !(i1@243@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@243@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-192|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 117 | i1@243@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@243@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-193|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] (i2 in [6..9))
; [eval] [6..9)
(set-option :timeout 0)
(push) ; 9
; [then-branch: 118 | !(i2@244@01 in [6..9]) | live]
; [else-branch: 118 | i2@244@01 in [6..9] | live]
(push) ; 10
; [then-branch: 118 | !(i2@244@01 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@244@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-194|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 118 | i2@244@01 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@244@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-195|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i1 != i2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@244@01)
  (not (Seq_contains (Seq_range 6 9) i2@244@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@243@01)
  (and
    (Seq_contains (Seq_range 6 9) i1@243@01)
    (or
      (Seq_contains (Seq_range 6 9) i2@244@01)
      (not (Seq_contains (Seq_range 6 9) i2@244@01))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@243@01)
  (not (Seq_contains (Seq_range 6 9) i1@243@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 119 | i1@243@01 in [6..9] && i2@244@01 in [6..9] && i1@243@01 != i2@244@01 | live]
; [else-branch: 119 | !(i1@243@01 in [6..9] && i2@244@01 in [6..9] && i1@243@01 != i2@244@01) | live]
(push) ; 8
; [then-branch: 119 | i1@243@01 in [6..9] && i2@244@01 in [6..9] && i1@243@01 != i2@244@01]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@243@01)
  (and (Seq_contains (Seq_range 6 9) i2@244@01) (not (= i1@243@01 i2@244@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-196|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(set-option :timeout 0)
(push) ; 9
(assert (not (>= i1@243@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i1@243@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 9
(assert (not (>= i2@244@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i2@244@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 119 | !(i1@243@01 in [6..9] && i2@244@01 in [6..9] && i1@243@01 != i2@244@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@243@01)
    (and (Seq_contains (Seq_range 6 9) i2@244@01) (not (= i1@243@01 i2@244@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-197|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@243@01)
    (and (Seq_contains (Seq_range 6 9) i2@244@01) (not (= i1@243@01 i2@244@01))))
  (and
    (Seq_contains (Seq_range 6 9) i1@243@01)
    (Seq_contains (Seq_range 6 9) i2@244@01)
    (not (= i1@243@01 i2@244@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@243@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@244@01)
        (not (= i1@243@01 i2@244@01)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@243@01)
    (and (Seq_contains (Seq_range 6 9) i2@244@01) (not (= i1@243@01 i2@244@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@241@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@241@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@241@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@241@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@241@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@241@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@242@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@242@01  $FPM) r))
  :qid |qp.resPrmSumDef84|)))
(assert (and
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@242@01  $FPM) r) $Perm.Write)
    :pattern ((inv@163@01 r))
    :qid |qp-fld-prm-bnd|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@242@01  $FPM) r) $Perm.Write)
    :pattern ((inv@170@01 r))
    :qid |qp-fld-prm-bnd|))
  (<= ($FVF.perm_f (as pm@242@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write)))
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i1@243@01 Int) (i2@244@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@243@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@244@01)
        (not (= i1@243@01 i2@244@01))))
    (not (= (Seq_index xs@156@01 i1@243@01) (Seq_index xs@156@01 i2@244@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@243@01 Int) (i2@244@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@243@01)
      (and
        (Seq_contains (Seq_range 6 9) i2@244@01)
        (not (= i1@243@01 i2@244@01))))
    (not (= (Seq_index xs@156@01 i1@243@01) (Seq_index xs@156@01 i2@244@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|)))
; [then-branch: 120 | False | dead]
; [else-branch: 120 | True | live]
(push) ; 4
; [else-branch: 120 | True]
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
    (= (Seq_index xs@156@01 k@161@01) (Seq_index xs@156@01 k@168@01))
    (=
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))))
  
  :qid |quant-u-198|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(declare-const k@245@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 6
; [then-branch: 121 | !(6 <= k@245@01) | live]
; [else-branch: 121 | 6 <= k@245@01 | live]
(push) ; 7
; [then-branch: 121 | !(6 <= k@245@01)]
(assert (not (<= 6 k@245@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-199|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 121 | 6 <= k@245@01]
(assert (<= 6 k@245@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@156@01 k@168@01) (Seq_index xs@156@01 k@161@01))
    (=
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))))
  
  :qid |quant-u-200|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] k < 9
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@245@01) (not (<= 6 k@245@01))))
(assert (and (<= 6 k@245@01) (< k@245@01 9)))
; [eval] xs[k]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= k@245@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@245@01 (Seq_length xs@156@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@246@01 ($Ref) Int)
(declare-fun img@247@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@245@01 Int)) (!
  (=>
    (and (<= 6 k@245@01) (< k@245@01 9))
    (or (<= 6 k@245@01) (not (<= 6 k@245@01))))
  :pattern ((Seq_index xs@156@01 k@245@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@245@01 Int) (k2@245@01 Int)) (!
  (=>
    (and
      (and (<= 6 k1@245@01) (< k1@245@01 9))
      (and (<= 6 k2@245@01) (< k2@245@01 9))
      (= (Seq_index xs@156@01 k1@245@01) (Seq_index xs@156@01 k2@245@01)))
    (= k1@245@01 k2@245@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@245@01 Int)) (!
  (=>
    (and (<= 6 k@245@01) (< k@245@01 9))
    (and
      (= (inv@246@01 (Seq_index xs@156@01 k@245@01)) k@245@01)
      (img@247@01 (Seq_index xs@156@01 k@245@01))))
  :pattern ((Seq_index xs@156@01 k@245@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@247@01 r) (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@246@01 r)) r))
  :pattern ((inv@246@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@248@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9))
      (img@247@01 r)
      (= r (Seq_index xs@156@01 (inv@246@01 r))))
    ($Perm.min
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@249@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9))
      (img@247@01 r)
      (= r (Seq_index xs@156@01 (inv@246@01 r))))
    ($Perm.min
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@248@01 r)))
    $Perm.No))
(define-fun pTaken@250@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9))
      (img@247@01 r)
      (= r (Seq_index xs@156@01 (inv@246@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@248@01 r)) (pTaken@249@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      (pTaken@248@01 r))
    $Perm.No)
  
  :qid |quant-u-203|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@248@01 r) $Perm.No)
  
  :qid |quant-u-204|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9))
      (img@247@01 r)
      (= r (Seq_index xs@156@01 (inv@246@01 r))))
    (= (- $Perm.Write (pTaken@248@01 r)) $Perm.No))
  
  :qid |quant-u-205|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (- $Perm.Write (pTaken@191@01 r))
        $Perm.No)
      (pTaken@249@01 r))
    $Perm.No)
  
  :qid |quant-u-206|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9))
      (img@247@01 r)
      (= r (Seq_index xs@156@01 (inv@246@01 r))))
    (= (- (- $Perm.Write (pTaken@248@01 r)) (pTaken@249@01 r)) $Perm.No))
  
  :qid |quant-u-207|))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index xs@156@01 8) (Seq_index xs@156@01 8))
      $Perm.Write
      $Perm.No)
    (pTaken@250@01 (Seq_index xs@156@01 8)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9))
      (img@247@01 r)
      (= r (Seq_index xs@156@01 (inv@246@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@248@01 r)) (pTaken@249@01 r))
        (pTaken@250@01 r))
      $Perm.No))
  
  :qid |quant-u-209|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@251@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@251@01  $FVF<f>)))
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r)))
    (=>
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r))
      (Set_in r ($FVF.domain_f (as sm@251@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@251@01  $FVF<f>))))
  :qid |qp.fvfDomDef88|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@251@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@251@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@251@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@251@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@251@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@251@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef87|)))
(assert (fun04%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@251@01  $FVF<f>)))) xs@156@01 false))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
      (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@241@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@241@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
      (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@241@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@241@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@156@01 8))
    (=
      ($FVF.lookup_f (as sm@241@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@241@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@242@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
          (- $Perm.Write (pTaken@190@01 r))
          $Perm.No)
        (ite
          (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
          (- $Perm.Write (pTaken@191@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@156@01 8)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@242@01  $FPM) r))
  :qid |qp.resPrmSumDef84|)))
(assert (forall ((k@245@01 Int)) (!
  (=>
    (and (<= 6 k@245@01) (< k@245@01 9))
    (and
      (= (inv@246@01 (Seq_index xs@156@01 k@245@01)) k@245@01)
      (img@247@01 (Seq_index xs@156@01 k@245@01))))
  :pattern ((Seq_index xs@156@01 k@245@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@247@01 r) (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)))
    (= (Seq_index xs@156@01 (inv@246@01 r)) r))
  :pattern ((inv@246@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@251@01  $FVF<f>)))
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r)))
    (=>
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r))
      (Set_in r ($FVF.domain_f (as sm@251@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@251@01  $FVF<f>))))
  :qid |qp.fvfDomDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r))
      (ite
        (and (img@164@01 r) (and (<= 0 (inv@163@01 r)) (< (inv@163@01 r) 3)))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@251@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@251@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r))
      (ite
        (and (img@171@01 r) (and (<= 6 (inv@170@01 r)) (< (inv@170@01 r) 9)))
        (< $Perm.No (- $Perm.Write (pTaken@191@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@251@01  $FVF<f>) r) ($FVF.lookup_f $t@169@01 r)))
  :pattern (($FVF.lookup_f (as sm@251@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@169@01 r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 6 (inv@246@01 r)) (< (inv@246@01 r) 9)) (img@247@01 r))
      (= r (Seq_index xs@156@01 8)))
    (=
      ($FVF.lookup_f (as sm@251@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@192@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@251@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@192@01  $FVF<f>) r))
  :qid |qp.fvfValDef87|)))
(assert (and
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@242@01  $FPM) r) $Perm.Write)
    :pattern ((inv@163@01 r))
    :qid |qp-fld-prm-bnd|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@242@01  $FPM) r) $Perm.Write)
    :pattern ((inv@170@01 r))
    :qid |qp-fld-prm-bnd|))
  (<= ($FVF.perm_f (as pm@242@01  $FPM) (Seq_index xs@156@01 8)) $Perm.Write)
  (forall ((i1@243@01 Int) (i2@244@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@243@01)
        (and
          (Seq_contains (Seq_range 6 9) i2@244@01)
          (not (= i1@243@01 i2@244@01))))
      (not (= (Seq_index xs@156@01 i1@243@01) (Seq_index xs@156@01 i2@244@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|))))
(assert (and
  (forall ((k@245@01 Int)) (!
    (=>
      (and (<= 6 k@245@01) (< k@245@01 9))
      (or (<= 6 k@245@01) (not (<= 6 k@245@01))))
    :pattern ((Seq_index xs@156@01 k@245@01))
    :qid |f-aux|))
  (fun04%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@251@01  $FVF<f>)))) xs@156@01 false)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  20
  (fun04 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@251@01  $FVF<f>)))) xs@156@01 false))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const x@252@01 $Ref)
(declare-const xs@253@01 Seq<$Ref>)
(declare-const x@254@01 $Ref)
(declare-const xs@255@01 Seq<$Ref>)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale acc(x.g, write)
(declare-const $t@256@01 Int)
(assert (not (= x@254@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 3 <= |xs|
(declare-const $t@257@01 $Snap)
(assert (= $t@257@01 $Snap.unit))
; [eval] 3 <= |xs|
; [eval] |xs|
(assert (<= 3 (Seq_length xs@255@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..3)), (i2 in [0..3)) }
;     { (i1 in [0..3)), xs[i2] }
;     { (i2 in [0..3)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@258@01 $Snap)
(assert (= $t@258@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@259@01 Int)
(declare-const i2@260@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 4
; [then-branch: 122 | !(i1@259@01 in [0..3]) | live]
; [else-branch: 122 | i1@259@01 in [0..3] | live]
(push) ; 5
; [then-branch: 122 | !(i1@259@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@259@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 122 | i1@259@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@259@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 6
; [then-branch: 123 | !(i2@260@01 in [0..3]) | live]
; [else-branch: 123 | i2@260@01 in [0..3] | live]
(push) ; 7
; [then-branch: 123 | !(i2@260@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@260@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 123 | i2@260@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@260@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@260@01)
  (not (Seq_contains (Seq_range 0 3) i2@260@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@259@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@259@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@260@01)
      (not (Seq_contains (Seq_range 0 3) i2@260@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@259@01)
  (not (Seq_contains (Seq_range 0 3) i1@259@01))))
(push) ; 4
; [then-branch: 124 | i1@259@01 in [0..3] && i2@260@01 in [0..3] && i1@259@01 != i2@260@01 | live]
; [else-branch: 124 | !(i1@259@01 in [0..3] && i2@260@01 in [0..3] && i1@259@01 != i2@260@01) | live]
(push) ; 5
; [then-branch: 124 | i1@259@01 in [0..3] && i2@260@01 in [0..3] && i1@259@01 != i2@260@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@259@01)
  (and (Seq_contains (Seq_range 0 3) i2@260@01) (not (= i1@259@01 i2@260@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@259@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@259@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@260@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@260@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 124 | !(i1@259@01 in [0..3] && i2@260@01 in [0..3] && i1@259@01 != i2@260@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@259@01)
    (and (Seq_contains (Seq_range 0 3) i2@260@01) (not (= i1@259@01 i2@260@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@259@01)
    (and (Seq_contains (Seq_range 0 3) i2@260@01) (not (= i1@259@01 i2@260@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@259@01)
    (Seq_contains (Seq_range 0 3) i2@260@01)
    (not (= i1@259@01 i2@260@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@260@01)
        (not (= i1@259@01 i2@260@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@259@01)
    (and (Seq_contains (Seq_range 0 3) i2@260@01) (not (= i1@259@01 i2@260@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@259@01 Int) (i2@260@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (Seq_contains (Seq_range 0 3) i2@260@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (not (Seq_contains (Seq_range 0 3) i1@259@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (Seq_contains (Seq_range 0 3) i2@260@01)
        (not (= i1@259@01 i2@260@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@259@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@260@01)
            (not (= i1@259@01 i2@260@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@259@01) (Seq_contains
    (Seq_range 0 3)
    i2@260@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@259@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@260@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@118@10@118@98-aux|)))
(assert (forall ((i1@259@01 Int) (i2@260@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (Seq_contains (Seq_range 0 3) i2@260@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (not (Seq_contains (Seq_range 0 3) i1@259@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (Seq_contains (Seq_range 0 3) i2@260@01)
        (not (= i1@259@01 i2@260@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@259@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@260@01)
            (not (= i1@259@01 i2@260@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@259@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@260@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@118@10@118@98-aux|)))
(assert (forall ((i1@259@01 Int) (i2@260@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (Seq_contains (Seq_range 0 3) i2@260@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (not (Seq_contains (Seq_range 0 3) i1@259@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (Seq_contains (Seq_range 0 3) i2@260@01)
        (not (= i1@259@01 i2@260@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@259@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@260@01)
            (not (= i1@259@01 i2@260@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@259@01) (Seq_index
    xs@255@01
    i2@260@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@259@01) (Seq_index
    xs@255@01
    i2@260@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@118@10@118@98-aux|)))
(assert (forall ((i1@259@01 Int) (i2@260@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (Seq_contains (Seq_range 0 3) i2@260@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (not (Seq_contains (Seq_range 0 3) i1@259@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (Seq_contains (Seq_range 0 3) i2@260@01)
        (not (= i1@259@01 i2@260@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@259@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@260@01)
            (not (= i1@259@01 i2@260@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@259@01) (Seq_index
    xs@255@01
    i2@260@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@118@10@118@98-aux|)))
(assert (forall ((i1@259@01 Int) (i2@260@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (Seq_contains (Seq_range 0 3) i2@260@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (not (Seq_contains (Seq_range 0 3) i1@259@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (Seq_contains (Seq_range 0 3) i2@260@01)
        (not (= i1@259@01 i2@260@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@259@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@260@01)
            (not (= i1@259@01 i2@260@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@260@01) (Seq_index
    xs@255@01
    i1@259@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@260@01) (Seq_index
    xs@255@01
    i1@259@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@118@10@118@98-aux|)))
(assert (forall ((i1@259@01 Int) (i2@260@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (Seq_contains (Seq_range 0 3) i2@260@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (not (Seq_contains (Seq_range 0 3) i1@259@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (Seq_contains (Seq_range 0 3) i2@260@01)
        (not (= i1@259@01 i2@260@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@259@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@260@01)
            (not (= i1@259@01 i2@260@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@260@01) (Seq_index
    xs@255@01
    i1@259@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@118@10@118@98-aux|)))
(assert (forall ((i1@259@01 Int) (i2@260@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (Seq_contains (Seq_range 0 3) i2@260@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (not (Seq_contains (Seq_range 0 3) i1@259@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (Seq_contains (Seq_range 0 3) i2@260@01)
        (not (= i1@259@01 i2@260@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@259@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@260@01)
            (not (= i1@259@01 i2@260@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@259@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@260@01)
          (not (= i1@259@01 i2@260@01))))))
  :pattern ((Seq_index xs@255@01 i1@259@01) (Seq_index xs@255@01 i2@260@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@118@10@118@98-aux|)))
(assert (forall ((i1@259@01 Int) (i2@260@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@259@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@260@01)
        (not (= i1@259@01 i2@260@01))))
    (not (= (Seq_index xs@255@01 i1@259@01) (Seq_index xs@255@01 i2@260@01))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@259@01) (Seq_contains
    (Seq_range 0 3)
    i2@260@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@259@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@260@01))
  :pattern ((Seq_contains (Seq_range 0 3) i1@259@01) (Seq_index
    xs@255@01
    i2@260@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@259@01) (Seq_index
    xs@255@01
    i2@260@01))
  :pattern ((Seq_contains (Seq_range 0 3) i2@260@01) (Seq_index
    xs@255@01
    i1@259@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@260@01) (Seq_index
    xs@255@01
    i1@259@01))
  :pattern ((Seq_index xs@255@01 i1@259@01) (Seq_index xs@255@01 i2@260@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@118@10@118@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::0 <= k && k < 3 ==> acc(xs[k].f, write))
(declare-const k@261@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 4
; [then-branch: 125 | !(0 <= k@261@01) | live]
; [else-branch: 125 | 0 <= k@261@01 | live]
(push) ; 5
; [then-branch: 125 | !(0 <= k@261@01)]
(assert (not (<= 0 k@261@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 125 | 0 <= k@261@01]
(assert (<= 0 k@261@01))
; [eval] k < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@261@01) (not (<= 0 k@261@01))))
(assert (and (<= 0 k@261@01) (< k@261@01 3)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@261@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@261@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@262@01 $FVF<f>)
(declare-fun inv@263@01 ($Ref) Int)
(declare-fun img@264@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@261@01 Int)) (!
  (=>
    (and (<= 0 k@261@01) (< k@261@01 3))
    (or (<= 0 k@261@01) (not (<= 0 k@261@01))))
  :pattern ((Seq_index xs@255@01 k@261@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@261@01 Int) (k2@261@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@261@01) (< k1@261@01 3))
      (and (<= 0 k2@261@01) (< k2@261@01 3))
      (= (Seq_index xs@255@01 k1@261@01) (Seq_index xs@255@01 k2@261@01)))
    (= k1@261@01 k2@261@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@261@01 Int)) (!
  (=>
    (and (<= 0 k@261@01) (< k@261@01 3))
    (and
      (= (inv@263@01 (Seq_index xs@255@01 k@261@01)) k@261@01)
      (img@264@01 (Seq_index xs@255@01 k@261@01))))
  :pattern ((Seq_index xs@255@01 k@261@01))
  :qid |quant-u-211|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@263@01 r)) r))
  :pattern ((inv@263@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@261@01 Int)) (!
  (=>
    (and (<= 0 k@261@01) (< k@261@01 3))
    (not (= (Seq_index xs@255@01 k@261@01) $Ref.null)))
  :pattern ((Seq_index xs@255@01 k@261@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 10 == fun05(x, xs)
(declare-const $t@265@01 $Snap)
(assert (= $t@265@01 $Snap.unit))
; [eval] 10 == fun05(x, xs)
; [eval] fun05(x, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= |xs|
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@266@01 Int)
(declare-const i2@267@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 126 | !(i1@266@01 in [0..3]) | live]
; [else-branch: 126 | i1@266@01 in [0..3] | live]
(push) ; 6
; [then-branch: 126 | !(i1@266@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@266@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 126 | i1@266@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@266@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 127 | !(i2@267@01 in [0..3]) | live]
; [else-branch: 127 | i2@267@01 in [0..3] | live]
(push) ; 8
; [then-branch: 127 | !(i2@267@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@267@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 127 | i2@267@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@267@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@267@01)
  (not (Seq_contains (Seq_range 0 3) i2@267@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@266@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@266@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@267@01)
      (not (Seq_contains (Seq_range 0 3) i2@267@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@266@01)
  (not (Seq_contains (Seq_range 0 3) i1@266@01))))
(push) ; 5
; [then-branch: 128 | i1@266@01 in [0..3] && i2@267@01 in [0..3] && i1@266@01 != i2@267@01 | live]
; [else-branch: 128 | !(i1@266@01 in [0..3] && i2@267@01 in [0..3] && i1@266@01 != i2@267@01) | live]
(push) ; 6
; [then-branch: 128 | i1@266@01 in [0..3] && i2@267@01 in [0..3] && i1@266@01 != i2@267@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@266@01)
  (and (Seq_contains (Seq_range 0 3) i2@267@01) (not (= i1@266@01 i2@267@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@266@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@266@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@267@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@267@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 128 | !(i1@266@01 in [0..3] && i2@267@01 in [0..3] && i1@266@01 != i2@267@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@266@01)
    (and (Seq_contains (Seq_range 0 3) i2@267@01) (not (= i1@266@01 i2@267@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@266@01)
    (and (Seq_contains (Seq_range 0 3) i2@267@01) (not (= i1@266@01 i2@267@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@266@01)
    (Seq_contains (Seq_range 0 3) i2@267@01)
    (not (= i1@266@01 i2@267@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@266@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@267@01)
        (not (= i1@266@01 i2@267@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@266@01)
    (and (Seq_contains (Seq_range 0 3) i2@267@01) (not (= i1@266@01 i2@267@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@266@01 Int) (i2@267@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@266@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@267@01)
        (not (= i1@266@01 i2@267@01))))
    (not (= (Seq_index xs@255@01 i1@266@01) (Seq_index xs@255@01 i2@267@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@266@01 Int) (i2@267@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@266@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@267@01)
        (not (= i1@266@01 i2@267@01))))
    (not (= (Seq_index xs@255@01 i1@266@01) (Seq_index xs@255@01 i2@267@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|)))
(declare-const k@268@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 129 | !(0 <= k@268@01) | live]
; [else-branch: 129 | 0 <= k@268@01 | live]
(push) ; 6
; [then-branch: 129 | !(0 <= k@268@01)]
(assert (not (<= 0 k@268@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 129 | 0 <= k@268@01]
(assert (<= 0 k@268@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@268@01) (not (<= 0 k@268@01))))
(assert (and (<= 0 k@268@01) (< k@268@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@268@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@268@01 (Seq_length xs@255@01))))
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
(assert (forall ((k@268@01 Int)) (!
  (=>
    (and (<= 0 k@268@01) (< k@268@01 3))
    (or (<= 0 k@268@01) (not (<= 0 k@268@01))))
  :pattern ((Seq_index xs@255@01 k@268@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@268@01 Int) (k2@268@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@268@01) (< k1@268@01 3))
      (and (<= 0 k2@268@01) (< k2@268@01 3))
      (= (Seq_index xs@255@01 k1@268@01) (Seq_index xs@255@01 k2@268@01)))
    (= k1@268@01 k2@268@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@268@01 Int)) (!
  (=>
    (and (<= 0 k@268@01) (< k@268@01 3))
    (and
      (= (inv@269@01 (Seq_index xs@255@01 k@268@01)) k@268@01)
      (img@270@01 (Seq_index xs@255@01 k@268@01))))
  :pattern ((Seq_index xs@255@01 k@268@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@270@01 r) (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@269@01 r)) r))
  :pattern ((inv@269@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@271@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3))
      (img@270@01 r)
      (= r (Seq_index xs@255@01 (inv@269@01 r))))
    ($Perm.min
      (ite
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
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
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@271@01 r))
    $Perm.No)
  
  :qid |quant-u-214|))))
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
      (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3))
      (img@270@01 r)
      (= r (Seq_index xs@255@01 (inv@269@01 r))))
    (= (- $Perm.Write (pTaken@271@01 r)) $Perm.No))
  
  :qid |quant-u-215|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@272@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@272@01  $FVF<f>)))
      (and (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)) (img@270@01 r)))
    (=>
      (and (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)) (img@270@01 r))
      (Set_in r ($FVF.domain_f (as sm@272@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@272@01  $FVF<f>))))
  :qid |qp.fvfDomDef90|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)) (img@270@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@272@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@272@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef89|)))
(assert (fun05%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@256@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@272@01  $FVF<f>))))) x@254@01 xs@255@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@268@01 Int)) (!
  (=>
    (and (<= 0 k@268@01) (< k@268@01 3))
    (and
      (= (inv@269@01 (Seq_index xs@255@01 k@268@01)) k@268@01)
      (img@270@01 (Seq_index xs@255@01 k@268@01))))
  :pattern ((Seq_index xs@255@01 k@268@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@270@01 r) (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@269@01 r)) r))
  :pattern ((inv@269@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@272@01  $FVF<f>)))
      (and (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)) (img@270@01 r)))
    (=>
      (and (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)) (img@270@01 r))
      (Set_in r ($FVF.domain_f (as sm@272@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@272@01  $FVF<f>))))
  :qid |qp.fvfDomDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)) (img@270@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@272@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@272@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef89|)))
(assert (and
  (forall ((i1@266@01 Int) (i2@267@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@266@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@267@01)
          (not (= i1@266@01 i2@267@01))))
      (not (= (Seq_index xs@255@01 i1@266@01) (Seq_index xs@255@01 i2@267@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))
  (forall ((k@268@01 Int)) (!
    (=>
      (and (<= 0 k@268@01) (< k@268@01 3))
      (or (<= 0 k@268@01) (not (<= 0 k@268@01))))
    :pattern ((Seq_index xs@255@01 k@268@01))
    :qid |f-aux|))
  (fun05%precondition ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@256@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@272@01  $FVF<f>))))) x@254@01 xs@255@01)))
(assert (=
  10
  (fun05 ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@256@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@272@01  $FVF<f>))))) x@254@01 xs@255@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 10 == fun05(x, xs)
(declare-const $t@273@01 $Snap)
(assert (= $t@273@01 $Snap.unit))
; [eval] 10 == fun05(x, xs)
; [eval] fun05(x, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= |xs|
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@274@01 Int)
(declare-const i2@275@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 130 | !(i1@274@01 in [0..3]) | live]
; [else-branch: 130 | i1@274@01 in [0..3] | live]
(push) ; 6
; [then-branch: 130 | !(i1@274@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@274@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 130 | i1@274@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@274@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 131 | !(i2@275@01 in [0..3]) | live]
; [else-branch: 131 | i2@275@01 in [0..3] | live]
(push) ; 8
; [then-branch: 131 | !(i2@275@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@275@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 131 | i2@275@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@275@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@275@01)
  (not (Seq_contains (Seq_range 0 3) i2@275@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@274@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@274@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@275@01)
      (not (Seq_contains (Seq_range 0 3) i2@275@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@274@01)
  (not (Seq_contains (Seq_range 0 3) i1@274@01))))
(push) ; 5
; [then-branch: 132 | i1@274@01 in [0..3] && i2@275@01 in [0..3] && i1@274@01 != i2@275@01 | live]
; [else-branch: 132 | !(i1@274@01 in [0..3] && i2@275@01 in [0..3] && i1@274@01 != i2@275@01) | live]
(push) ; 6
; [then-branch: 132 | i1@274@01 in [0..3] && i2@275@01 in [0..3] && i1@274@01 != i2@275@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@274@01)
  (and (Seq_contains (Seq_range 0 3) i2@275@01) (not (= i1@274@01 i2@275@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@274@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@274@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@275@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@275@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 132 | !(i1@274@01 in [0..3] && i2@275@01 in [0..3] && i1@274@01 != i2@275@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@274@01)
    (and (Seq_contains (Seq_range 0 3) i2@275@01) (not (= i1@274@01 i2@275@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@274@01)
    (and (Seq_contains (Seq_range 0 3) i2@275@01) (not (= i1@274@01 i2@275@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@274@01)
    (Seq_contains (Seq_range 0 3) i2@275@01)
    (not (= i1@274@01 i2@275@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@274@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@275@01)
        (not (= i1@274@01 i2@275@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@274@01)
    (and (Seq_contains (Seq_range 0 3) i2@275@01) (not (= i1@274@01 i2@275@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@274@01 Int) (i2@275@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@274@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@275@01)
        (not (= i1@274@01 i2@275@01))))
    (not (= (Seq_index xs@255@01 i1@274@01) (Seq_index xs@255@01 i2@275@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@274@01 Int) (i2@275@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@274@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@275@01)
        (not (= i1@274@01 i2@275@01))))
    (not (= (Seq_index xs@255@01 i1@274@01) (Seq_index xs@255@01 i2@275@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|)))
(declare-const k@276@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 133 | !(0 <= k@276@01) | live]
; [else-branch: 133 | 0 <= k@276@01 | live]
(push) ; 6
; [then-branch: 133 | !(0 <= k@276@01)]
(assert (not (<= 0 k@276@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 133 | 0 <= k@276@01]
(assert (<= 0 k@276@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@276@01) (not (<= 0 k@276@01))))
(assert (and (<= 0 k@276@01) (< k@276@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@276@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@276@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@277@01 ($Ref) Int)
(declare-fun img@278@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@276@01 Int)) (!
  (=>
    (and (<= 0 k@276@01) (< k@276@01 3))
    (or (<= 0 k@276@01) (not (<= 0 k@276@01))))
  :pattern ((Seq_index xs@255@01 k@276@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@276@01 Int) (k2@276@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@276@01) (< k1@276@01 3))
      (and (<= 0 k2@276@01) (< k2@276@01 3))
      (= (Seq_index xs@255@01 k1@276@01) (Seq_index xs@255@01 k2@276@01)))
    (= k1@276@01 k2@276@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@276@01 Int)) (!
  (=>
    (and (<= 0 k@276@01) (< k@276@01 3))
    (and
      (= (inv@277@01 (Seq_index xs@255@01 k@276@01)) k@276@01)
      (img@278@01 (Seq_index xs@255@01 k@276@01))))
  :pattern ((Seq_index xs@255@01 k@276@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@278@01 r) (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@277@01 r)) r))
  :pattern ((inv@277@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@279@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3))
      (img@278@01 r)
      (= r (Seq_index xs@255@01 (inv@277@01 r))))
    ($Perm.min
      (ite
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
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
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@279@01 r))
    $Perm.No)
  
  :qid |quant-u-218|))))
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
      (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3))
      (img@278@01 r)
      (= r (Seq_index xs@255@01 (inv@277@01 r))))
    (= (- $Perm.Write (pTaken@279@01 r)) $Perm.No))
  
  :qid |quant-u-219|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@280@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@280@01  $FVF<f>)))
      (and (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3)) (img@278@01 r)))
    (=>
      (and (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3)) (img@278@01 r))
      (Set_in r ($FVF.domain_f (as sm@280@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@280@01  $FVF<f>))))
  :qid |qp.fvfDomDef92|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3)) (img@278@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@280@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@280@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef91|)))
(assert (fun05%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@256@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@280@01  $FVF<f>))))) x@254@01 xs@255@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@276@01 Int)) (!
  (=>
    (and (<= 0 k@276@01) (< k@276@01 3))
    (and
      (= (inv@277@01 (Seq_index xs@255@01 k@276@01)) k@276@01)
      (img@278@01 (Seq_index xs@255@01 k@276@01))))
  :pattern ((Seq_index xs@255@01 k@276@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@278@01 r) (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@277@01 r)) r))
  :pattern ((inv@277@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@280@01  $FVF<f>)))
      (and (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3)) (img@278@01 r)))
    (=>
      (and (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3)) (img@278@01 r))
      (Set_in r ($FVF.domain_f (as sm@280@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@280@01  $FVF<f>))))
  :qid |qp.fvfDomDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@277@01 r)) (< (inv@277@01 r) 3)) (img@278@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@280@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@280@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef91|)))
(assert (and
  (forall ((i1@274@01 Int) (i2@275@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@274@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@275@01)
          (not (= i1@274@01 i2@275@01))))
      (not (= (Seq_index xs@255@01 i1@274@01) (Seq_index xs@255@01 i2@275@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))
  (forall ((k@276@01 Int)) (!
    (=>
      (and (<= 0 k@276@01) (< k@276@01 3))
      (or (<= 0 k@276@01) (not (<= 0 k@276@01))))
    :pattern ((Seq_index xs@255@01 k@276@01))
    :qid |f-aux|))
  (fun05%precondition ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@256@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@280@01  $FVF<f>))))) x@254@01 xs@255@01)))
(assert (=
  10
  (fun05 ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@256@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@280@01  $FVF<f>))))) x@254@01 xs@255@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; x.g := 0
; [exec]
; assert 10 == fun05(x, xs)
; [eval] 10 == fun05(x, xs)
; [eval] fun05(x, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= |xs|
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@281@01 Int)
(declare-const i2@282@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 134 | !(i1@281@01 in [0..3]) | live]
; [else-branch: 134 | i1@281@01 in [0..3] | live]
(push) ; 6
; [then-branch: 134 | !(i1@281@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@281@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 134 | i1@281@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@281@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 135 | !(i2@282@01 in [0..3]) | live]
; [else-branch: 135 | i2@282@01 in [0..3] | live]
(push) ; 8
; [then-branch: 135 | !(i2@282@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@282@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 135 | i2@282@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@282@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@282@01)
  (not (Seq_contains (Seq_range 0 3) i2@282@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@281@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@281@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@282@01)
      (not (Seq_contains (Seq_range 0 3) i2@282@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@281@01)
  (not (Seq_contains (Seq_range 0 3) i1@281@01))))
(push) ; 5
; [then-branch: 136 | i1@281@01 in [0..3] && i2@282@01 in [0..3] && i1@281@01 != i2@282@01 | live]
; [else-branch: 136 | !(i1@281@01 in [0..3] && i2@282@01 in [0..3] && i1@281@01 != i2@282@01) | live]
(push) ; 6
; [then-branch: 136 | i1@281@01 in [0..3] && i2@282@01 in [0..3] && i1@281@01 != i2@282@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@281@01)
  (and (Seq_contains (Seq_range 0 3) i2@282@01) (not (= i1@281@01 i2@282@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@281@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@281@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@282@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@282@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 136 | !(i1@281@01 in [0..3] && i2@282@01 in [0..3] && i1@281@01 != i2@282@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@281@01)
    (and (Seq_contains (Seq_range 0 3) i2@282@01) (not (= i1@281@01 i2@282@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@281@01)
    (and (Seq_contains (Seq_range 0 3) i2@282@01) (not (= i1@281@01 i2@282@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@281@01)
    (Seq_contains (Seq_range 0 3) i2@282@01)
    (not (= i1@281@01 i2@282@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@281@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@282@01)
        (not (= i1@281@01 i2@282@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@281@01)
    (and (Seq_contains (Seq_range 0 3) i2@282@01) (not (= i1@281@01 i2@282@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@281@01 Int) (i2@282@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@281@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@282@01)
        (not (= i1@281@01 i2@282@01))))
    (not (= (Seq_index xs@255@01 i1@281@01) (Seq_index xs@255@01 i2@282@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@281@01 Int) (i2@282@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@281@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@282@01)
        (not (= i1@281@01 i2@282@01))))
    (not (= (Seq_index xs@255@01 i1@281@01) (Seq_index xs@255@01 i2@282@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|)))
(declare-const k@283@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 137 | !(0 <= k@283@01) | live]
; [else-branch: 137 | 0 <= k@283@01 | live]
(push) ; 6
; [then-branch: 137 | !(0 <= k@283@01)]
(assert (not (<= 0 k@283@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 137 | 0 <= k@283@01]
(assert (<= 0 k@283@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@283@01) (not (<= 0 k@283@01))))
(assert (and (<= 0 k@283@01) (< k@283@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@283@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@283@01 (Seq_length xs@255@01))))
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
(assert (forall ((k@283@01 Int)) (!
  (=>
    (and (<= 0 k@283@01) (< k@283@01 3))
    (or (<= 0 k@283@01) (not (<= 0 k@283@01))))
  :pattern ((Seq_index xs@255@01 k@283@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@283@01 Int) (k2@283@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@283@01) (< k1@283@01 3))
      (and (<= 0 k2@283@01) (< k2@283@01 3))
      (= (Seq_index xs@255@01 k1@283@01) (Seq_index xs@255@01 k2@283@01)))
    (= k1@283@01 k2@283@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@283@01 Int)) (!
  (=>
    (and (<= 0 k@283@01) (< k@283@01 3))
    (and
      (= (inv@284@01 (Seq_index xs@255@01 k@283@01)) k@283@01)
      (img@285@01 (Seq_index xs@255@01 k@283@01))))
  :pattern ((Seq_index xs@255@01 k@283@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@285@01 r) (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@284@01 r)) r))
  :pattern ((inv@284@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@286@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3))
      (img@285@01 r)
      (= r (Seq_index xs@255@01 (inv@284@01 r))))
    ($Perm.min
      (ite
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
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
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@286@01 r))
    $Perm.No)
  
  :qid |quant-u-222|))))
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
      (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3))
      (img@285@01 r)
      (= r (Seq_index xs@255@01 (inv@284@01 r))))
    (= (- $Perm.Write (pTaken@286@01 r)) $Perm.No))
  
  :qid |quant-u-223|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@287@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@287@01  $FVF<f>)))
      (and (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3)) (img@285@01 r)))
    (=>
      (and (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3)) (img@285@01 r))
      (Set_in r ($FVF.domain_f (as sm@287@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@287@01  $FVF<f>))))
  :qid |qp.fvfDomDef94|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3)) (img@285@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@287@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@287@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef93|)))
(assert (fun05%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@287@01  $FVF<f>))))) x@254@01 xs@255@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@283@01 Int)) (!
  (=>
    (and (<= 0 k@283@01) (< k@283@01 3))
    (and
      (= (inv@284@01 (Seq_index xs@255@01 k@283@01)) k@283@01)
      (img@285@01 (Seq_index xs@255@01 k@283@01))))
  :pattern ((Seq_index xs@255@01 k@283@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@285@01 r) (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@284@01 r)) r))
  :pattern ((inv@284@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@287@01  $FVF<f>)))
      (and (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3)) (img@285@01 r)))
    (=>
      (and (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3)) (img@285@01 r))
      (Set_in r ($FVF.domain_f (as sm@287@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@287@01  $FVF<f>))))
  :qid |qp.fvfDomDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@284@01 r)) (< (inv@284@01 r) 3)) (img@285@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@287@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@287@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef93|)))
(assert (and
  (forall ((i1@281@01 Int) (i2@282@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@281@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@282@01)
          (not (= i1@281@01 i2@282@01))))
      (not (= (Seq_index xs@255@01 i1@281@01) (Seq_index xs@255@01 i2@282@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))
  (forall ((k@283@01 Int)) (!
    (=>
      (and (<= 0 k@283@01) (< k@283@01 3))
      (or (<= 0 k@283@01) (not (<= 0 k@283@01))))
    :pattern ((Seq_index xs@255@01 k@283@01))
    :qid |f-aux|))
  (fun05%precondition ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@287@01  $FVF<f>))))) x@254@01 xs@255@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun05 ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@287@01  $FVF<f>))))) x@254@01 xs@255@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@288@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
    (= ($FVF.lookup_f (as sm@288@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@288@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef95|)))
(declare-const pm@289@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@289@01  $FPM) r)
    (ite
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@289@01  $FPM) r))
  :qid |qp.resPrmSumDef96|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@289@01  $FPM) r) $Perm.Write)
  :pattern ((inv@263@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 10 == fun05(x, xs)
; [eval] fun05(x, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= |xs|
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@290@01 Int)
(declare-const i2@291@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 138 | !(i1@290@01 in [0..3]) | live]
; [else-branch: 138 | i1@290@01 in [0..3] | live]
(push) ; 6
; [then-branch: 138 | !(i1@290@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@290@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 138 | i1@290@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@290@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] (i2 in [0..3))
; [eval] [0..3)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 139 | !(i2@291@01 in [0..3]) | live]
; [else-branch: 139 | i2@291@01 in [0..3] | live]
(push) ; 8
; [then-branch: 139 | !(i2@291@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@291@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 139 | i2@291@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@291@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@291@01)
  (not (Seq_contains (Seq_range 0 3) i2@291@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@290@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@290@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@291@01)
      (not (Seq_contains (Seq_range 0 3) i2@291@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@290@01)
  (not (Seq_contains (Seq_range 0 3) i1@290@01))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 140 | i1@290@01 in [0..3] && i2@291@01 in [0..3] && i1@290@01 != i2@291@01 | live]
; [else-branch: 140 | !(i1@290@01 in [0..3] && i2@291@01 in [0..3] && i1@290@01 != i2@291@01) | live]
(push) ; 6
; [then-branch: 140 | i1@290@01 in [0..3] && i2@291@01 in [0..3] && i1@290@01 != i2@291@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@290@01)
  (and (Seq_contains (Seq_range 0 3) i2@291@01) (not (= i1@290@01 i2@291@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i1@290@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@290@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@291@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@291@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 140 | !(i1@290@01 in [0..3] && i2@291@01 in [0..3] && i1@290@01 != i2@291@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@290@01)
    (and (Seq_contains (Seq_range 0 3) i2@291@01) (not (= i1@290@01 i2@291@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@290@01)
    (and (Seq_contains (Seq_range 0 3) i2@291@01) (not (= i1@290@01 i2@291@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@290@01)
    (Seq_contains (Seq_range 0 3) i2@291@01)
    (not (= i1@290@01 i2@291@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@290@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@291@01)
        (not (= i1@290@01 i2@291@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@290@01)
    (and (Seq_contains (Seq_range 0 3) i2@291@01) (not (= i1@290@01 i2@291@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i1@290@01 Int) (i2@291@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@290@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@291@01)
        (not (= i1@290@01 i2@291@01))))
    (not (= (Seq_index xs@255@01 i1@290@01) (Seq_index xs@255@01 i2@291@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@290@01 Int) (i2@291@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@290@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@291@01)
        (not (= i1@290@01 i2@291@01))))
    (not (= (Seq_index xs@255@01 i1@290@01) (Seq_index xs@255@01 i2@291@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|)))
(declare-const k@292@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 141 | !(0 <= k@292@01) | live]
; [else-branch: 141 | 0 <= k@292@01 | live]
(push) ; 6
; [then-branch: 141 | !(0 <= k@292@01)]
(assert (not (<= 0 k@292@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 141 | 0 <= k@292@01]
(assert (<= 0 k@292@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@292@01) (not (<= 0 k@292@01))))
(assert (and (<= 0 k@292@01) (< k@292@01 3)))
; [eval] xs[k]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= k@292@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@292@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@293@01 ($Ref) Int)
(declare-fun img@294@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@292@01 Int)) (!
  (=>
    (and (<= 0 k@292@01) (< k@292@01 3))
    (or (<= 0 k@292@01) (not (<= 0 k@292@01))))
  :pattern ((Seq_index xs@255@01 k@292@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@292@01 Int) (k2@292@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@292@01) (< k1@292@01 3))
      (and (<= 0 k2@292@01) (< k2@292@01 3))
      (= (Seq_index xs@255@01 k1@292@01) (Seq_index xs@255@01 k2@292@01)))
    (= k1@292@01 k2@292@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@292@01 Int)) (!
  (=>
    (and (<= 0 k@292@01) (< k@292@01 3))
    (and
      (= (inv@293@01 (Seq_index xs@255@01 k@292@01)) k@292@01)
      (img@294@01 (Seq_index xs@255@01 k@292@01))))
  :pattern ((Seq_index xs@255@01 k@292@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@294@01 r) (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@293@01 r)) r))
  :pattern ((inv@293@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@295@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3))
      (img@294@01 r)
      (= r (Seq_index xs@255@01 (inv@293@01 r))))
    ($Perm.min
      (ite
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
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
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@295@01 r))
    $Perm.No)
  
  :qid |quant-u-226|))))
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
      (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3))
      (img@294@01 r)
      (= r (Seq_index xs@255@01 (inv@293@01 r))))
    (= (- $Perm.Write (pTaken@295@01 r)) $Perm.No))
  
  :qid |quant-u-227|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@296@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@296@01  $FVF<f>)))
      (and (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)) (img@294@01 r)))
    (=>
      (and (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)) (img@294@01 r))
      (Set_in r ($FVF.domain_f (as sm@296@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@296@01  $FVF<f>))))
  :qid |qp.fvfDomDef98|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)) (img@294@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@296@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@296@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef97|)))
(assert (fun05%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@296@01  $FVF<f>))))) x@254@01 xs@255@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@292@01 Int)) (!
  (=>
    (and (<= 0 k@292@01) (< k@292@01 3))
    (and
      (= (inv@293@01 (Seq_index xs@255@01 k@292@01)) k@292@01)
      (img@294@01 (Seq_index xs@255@01 k@292@01))))
  :pattern ((Seq_index xs@255@01 k@292@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@294@01 r) (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@293@01 r)) r))
  :pattern ((inv@293@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@296@01  $FVF<f>)))
      (and (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)) (img@294@01 r)))
    (=>
      (and (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)) (img@294@01 r))
      (Set_in r ($FVF.domain_f (as sm@296@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@296@01  $FVF<f>))))
  :qid |qp.fvfDomDef98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)) (img@294@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@296@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@296@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef97|)))
(assert (and
  (forall ((i1@290@01 Int) (i2@291@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@290@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@291@01)
          (not (= i1@290@01 i2@291@01))))
      (not (= (Seq_index xs@255@01 i1@290@01) (Seq_index xs@255@01 i2@291@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))
  (forall ((k@292@01 Int)) (!
    (=>
      (and (<= 0 k@292@01) (< k@292@01 3))
      (or (<= 0 k@292@01) (not (<= 0 k@292@01))))
    :pattern ((Seq_index xs@255@01 k@292@01))
    :qid |f-aux|))
  (fun05%precondition ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@296@01  $FVF<f>))))) x@254@01 xs@255@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun05 ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@296@01  $FVF<f>))))) x@254@01 xs@255@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@297@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
    (= ($FVF.lookup_f (as sm@297@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@297@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef99|)))
(declare-const pm@298@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@298@01  $FPM) r)
    (ite
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@298@01  $FPM) r))
  :qid |qp.resPrmSumDef100|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@298@01  $FPM) r) $Perm.Write)
  :pattern ((inv@263@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 10 == fun05(x, xs)
; [eval] fun05(x, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= |xs|
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@299@01 Int)
(declare-const i2@300@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 142 | !(i1@299@01 in [0..3]) | live]
; [else-branch: 142 | i1@299@01 in [0..3] | live]
(push) ; 6
; [then-branch: 142 | !(i1@299@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@299@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 142 | i1@299@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@299@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] (i2 in [0..3))
; [eval] [0..3)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 143 | !(i2@300@01 in [0..3]) | live]
; [else-branch: 143 | i2@300@01 in [0..3] | live]
(push) ; 8
; [then-branch: 143 | !(i2@300@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@300@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 143 | i2@300@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@300@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@300@01)
  (not (Seq_contains (Seq_range 0 3) i2@300@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@299@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@299@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@300@01)
      (not (Seq_contains (Seq_range 0 3) i2@300@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@299@01)
  (not (Seq_contains (Seq_range 0 3) i1@299@01))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 144 | i1@299@01 in [0..3] && i2@300@01 in [0..3] && i1@299@01 != i2@300@01 | live]
; [else-branch: 144 | !(i1@299@01 in [0..3] && i2@300@01 in [0..3] && i1@299@01 != i2@300@01) | live]
(push) ; 6
; [then-branch: 144 | i1@299@01 in [0..3] && i2@300@01 in [0..3] && i1@299@01 != i2@300@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@299@01)
  (and (Seq_contains (Seq_range 0 3) i2@300@01) (not (= i1@299@01 i2@300@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i1@299@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@299@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@300@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@300@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 144 | !(i1@299@01 in [0..3] && i2@300@01 in [0..3] && i1@299@01 != i2@300@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@299@01)
    (and (Seq_contains (Seq_range 0 3) i2@300@01) (not (= i1@299@01 i2@300@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@299@01)
    (and (Seq_contains (Seq_range 0 3) i2@300@01) (not (= i1@299@01 i2@300@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@299@01)
    (Seq_contains (Seq_range 0 3) i2@300@01)
    (not (= i1@299@01 i2@300@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@299@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@300@01)
        (not (= i1@299@01 i2@300@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@299@01)
    (and (Seq_contains (Seq_range 0 3) i2@300@01) (not (= i1@299@01 i2@300@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i1@299@01 Int) (i2@300@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@299@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@300@01)
        (not (= i1@299@01 i2@300@01))))
    (not (= (Seq_index xs@255@01 i1@299@01) (Seq_index xs@255@01 i2@300@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@299@01 Int) (i2@300@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@299@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@300@01)
        (not (= i1@299@01 i2@300@01))))
    (not (= (Seq_index xs@255@01 i1@299@01) (Seq_index xs@255@01 i2@300@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|)))
(declare-const k@301@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 145 | !(0 <= k@301@01) | live]
; [else-branch: 145 | 0 <= k@301@01 | live]
(push) ; 6
; [then-branch: 145 | !(0 <= k@301@01)]
(assert (not (<= 0 k@301@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 145 | 0 <= k@301@01]
(assert (<= 0 k@301@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@301@01) (not (<= 0 k@301@01))))
(assert (and (<= 0 k@301@01) (< k@301@01 3)))
; [eval] xs[k]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= k@301@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@301@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@302@01 ($Ref) Int)
(declare-fun img@303@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@301@01 Int)) (!
  (=>
    (and (<= 0 k@301@01) (< k@301@01 3))
    (or (<= 0 k@301@01) (not (<= 0 k@301@01))))
  :pattern ((Seq_index xs@255@01 k@301@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@301@01 Int) (k2@301@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@301@01) (< k1@301@01 3))
      (and (<= 0 k2@301@01) (< k2@301@01 3))
      (= (Seq_index xs@255@01 k1@301@01) (Seq_index xs@255@01 k2@301@01)))
    (= k1@301@01 k2@301@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@301@01 Int)) (!
  (=>
    (and (<= 0 k@301@01) (< k@301@01 3))
    (and
      (= (inv@302@01 (Seq_index xs@255@01 k@301@01)) k@301@01)
      (img@303@01 (Seq_index xs@255@01 k@301@01))))
  :pattern ((Seq_index xs@255@01 k@301@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@303@01 r) (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@302@01 r)) r))
  :pattern ((inv@302@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@304@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3))
      (img@303@01 r)
      (= r (Seq_index xs@255@01 (inv@302@01 r))))
    ($Perm.min
      (ite
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
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
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@304@01 r))
    $Perm.No)
  
  :qid |quant-u-230|))))
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
      (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3))
      (img@303@01 r)
      (= r (Seq_index xs@255@01 (inv@302@01 r))))
    (= (- $Perm.Write (pTaken@304@01 r)) $Perm.No))
  
  :qid |quant-u-231|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@305@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@305@01  $FVF<f>)))
      (and (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3)) (img@303@01 r)))
    (=>
      (and (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3)) (img@303@01 r))
      (Set_in r ($FVF.domain_f (as sm@305@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@305@01  $FVF<f>))))
  :qid |qp.fvfDomDef102|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3)) (img@303@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@305@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@305@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef101|)))
(assert (fun05%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@305@01  $FVF<f>))))) x@254@01 xs@255@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@301@01 Int)) (!
  (=>
    (and (<= 0 k@301@01) (< k@301@01 3))
    (and
      (= (inv@302@01 (Seq_index xs@255@01 k@301@01)) k@301@01)
      (img@303@01 (Seq_index xs@255@01 k@301@01))))
  :pattern ((Seq_index xs@255@01 k@301@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@303@01 r) (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@302@01 r)) r))
  :pattern ((inv@302@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@305@01  $FVF<f>)))
      (and (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3)) (img@303@01 r)))
    (=>
      (and (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3)) (img@303@01 r))
      (Set_in r ($FVF.domain_f (as sm@305@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@305@01  $FVF<f>))))
  :qid |qp.fvfDomDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@302@01 r)) (< (inv@302@01 r) 3)) (img@303@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@305@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@305@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef101|)))
(assert (and
  (forall ((i1@299@01 Int) (i2@300@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@299@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@300@01)
          (not (= i1@299@01 i2@300@01))))
      (not (= (Seq_index xs@255@01 i1@299@01) (Seq_index xs@255@01 i2@300@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))
  (forall ((k@301@01 Int)) (!
    (=>
      (and (<= 0 k@301@01) (< k@301@01 3))
      (or (<= 0 k@301@01) (not (<= 0 k@301@01))))
    :pattern ((Seq_index xs@255@01 k@301@01))
    :qid |f-aux|))
  (fun05%precondition ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@305@01  $FVF<f>))))) x@254@01 xs@255@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun05 ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@305@01  $FVF<f>))))) x@254@01 xs@255@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] 10 == fun05(x, xs)
; [eval] fun05(x, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= |xs|
; [eval] |xs|
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@306@01 Int)
(declare-const i2@307@01 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 146 | !(i1@306@01 in [0..3]) | live]
; [else-branch: 146 | i1@306@01 in [0..3] | live]
(push) ; 6
; [then-branch: 146 | !(i1@306@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@306@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 146 | i1@306@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@306@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] (i2 in [0..3))
; [eval] [0..3)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 147 | !(i2@307@01 in [0..3]) | live]
; [else-branch: 147 | i2@307@01 in [0..3] | live]
(push) ; 8
; [then-branch: 147 | !(i2@307@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@307@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 147 | i2@307@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@307@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@307@01)
  (not (Seq_contains (Seq_range 0 3) i2@307@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@306@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@306@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@307@01)
      (not (Seq_contains (Seq_range 0 3) i2@307@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@306@01)
  (not (Seq_contains (Seq_range 0 3) i1@306@01))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 148 | i1@306@01 in [0..3] && i2@307@01 in [0..3] && i1@306@01 != i2@307@01 | live]
; [else-branch: 148 | !(i1@306@01 in [0..3] && i2@307@01 in [0..3] && i1@306@01 != i2@307@01) | live]
(push) ; 6
; [then-branch: 148 | i1@306@01 in [0..3] && i2@307@01 in [0..3] && i1@306@01 != i2@307@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@306@01)
  (and (Seq_contains (Seq_range 0 3) i2@307@01) (not (= i1@306@01 i2@307@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i1@306@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@306@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@307@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@307@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 148 | !(i1@306@01 in [0..3] && i2@307@01 in [0..3] && i1@306@01 != i2@307@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@306@01)
    (and (Seq_contains (Seq_range 0 3) i2@307@01) (not (= i1@306@01 i2@307@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@306@01)
    (and (Seq_contains (Seq_range 0 3) i2@307@01) (not (= i1@306@01 i2@307@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@306@01)
    (Seq_contains (Seq_range 0 3) i2@307@01)
    (not (= i1@306@01 i2@307@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@306@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@307@01)
        (not (= i1@306@01 i2@307@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@306@01)
    (and (Seq_contains (Seq_range 0 3) i2@307@01) (not (= i1@306@01 i2@307@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i1@306@01 Int) (i2@307@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@306@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@307@01)
        (not (= i1@306@01 i2@307@01))))
    (not (= (Seq_index xs@255@01 i1@306@01) (Seq_index xs@255@01 i2@307@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@306@01 Int) (i2@307@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@306@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@307@01)
        (not (= i1@306@01 i2@307@01))))
    (not (= (Seq_index xs@255@01 i1@306@01) (Seq_index xs@255@01 i2@307@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|)))
(declare-const k@308@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 149 | !(0 <= k@308@01) | live]
; [else-branch: 149 | 0 <= k@308@01 | live]
(push) ; 6
; [then-branch: 149 | !(0 <= k@308@01)]
(assert (not (<= 0 k@308@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 149 | 0 <= k@308@01]
(assert (<= 0 k@308@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@308@01) (not (<= 0 k@308@01))))
(assert (and (<= 0 k@308@01) (< k@308@01 3)))
; [eval] xs[k]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= k@308@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@308@01 (Seq_length xs@255@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@309@01 ($Ref) Int)
(declare-fun img@310@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@308@01 Int)) (!
  (=>
    (and (<= 0 k@308@01) (< k@308@01 3))
    (or (<= 0 k@308@01) (not (<= 0 k@308@01))))
  :pattern ((Seq_index xs@255@01 k@308@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@308@01 Int) (k2@308@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@308@01) (< k1@308@01 3))
      (and (<= 0 k2@308@01) (< k2@308@01 3))
      (= (Seq_index xs@255@01 k1@308@01) (Seq_index xs@255@01 k2@308@01)))
    (= k1@308@01 k2@308@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@308@01 Int)) (!
  (=>
    (and (<= 0 k@308@01) (< k@308@01 3))
    (and
      (= (inv@309@01 (Seq_index xs@255@01 k@308@01)) k@308@01)
      (img@310@01 (Seq_index xs@255@01 k@308@01))))
  :pattern ((Seq_index xs@255@01 k@308@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@310@01 r) (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@309@01 r)) r))
  :pattern ((inv@309@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@311@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3))
      (img@310@01 r)
      (= r (Seq_index xs@255@01 (inv@309@01 r))))
    ($Perm.min
      (ite
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
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
        (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@311@01 r))
    $Perm.No)
  
  :qid |quant-u-234|))))
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
      (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3))
      (img@310@01 r)
      (= r (Seq_index xs@255@01 (inv@309@01 r))))
    (= (- $Perm.Write (pTaken@311@01 r)) $Perm.No))
  
  :qid |quant-u-235|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@312@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@312@01  $FVF<f>)))
      (and (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3)) (img@310@01 r)))
    (=>
      (and (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3)) (img@310@01 r))
      (Set_in r ($FVF.domain_f (as sm@312@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@312@01  $FVF<f>))))
  :qid |qp.fvfDomDef104|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3)) (img@310@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@312@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@312@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef103|)))
(assert (fun05%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (as sm@312@01  $FVF<f>))))) x@254@01 xs@255@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@308@01 Int)) (!
  (=>
    (and (<= 0 k@308@01) (< k@308@01 3))
    (and
      (= (inv@309@01 (Seq_index xs@255@01 k@308@01)) k@308@01)
      (img@310@01 (Seq_index xs@255@01 k@308@01))))
  :pattern ((Seq_index xs@255@01 k@308@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@310@01 r) (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3)))
    (= (Seq_index xs@255@01 (inv@309@01 r)) r))
  :pattern ((inv@309@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@312@01  $FVF<f>)))
      (and (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3)) (img@310@01 r)))
    (=>
      (and (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3)) (img@310@01 r))
      (Set_in r ($FVF.domain_f (as sm@312@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@312@01  $FVF<f>))))
  :qid |qp.fvfDomDef104|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@309@01 r)) (< (inv@309@01 r) 3)) (img@310@01 r))
      (and (img@264@01 r) (and (<= 0 (inv@263@01 r)) (< (inv@263@01 r) 3))))
    (= ($FVF.lookup_f (as sm@312@01  $FVF<f>) r) ($FVF.lookup_f $t@262@01 r)))
  :pattern (($FVF.lookup_f (as sm@312@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@262@01 r))
  :qid |qp.fvfValDef103|)))
(assert (and
  (forall ((i1@306@01 Int) (i2@307@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@306@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@307@01)
          (not (= i1@306@01 i2@307@01))))
      (not (= (Seq_index xs@255@01 i1@306@01) (Seq_index xs@255@01 i2@307@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|))
  (forall ((k@308@01 Int)) (!
    (=>
      (and (<= 0 k@308@01) (< k@308@01 3))
      (or (<= 0 k@308@01) (not (<= 0 k@308@01))))
    :pattern ((Seq_index xs@255@01 k@308@01))
    :qid |f-aux|))
  (fun05%precondition ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@312@01  $FVF<f>))))) x@254@01 xs@255@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun05 ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@312@01  $FVF<f>))))) x@254@01 xs@255@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
(declare-const x@313@01 $Ref)
(declare-const i@314@01 Int)
(declare-const xs@315@01 Seq<$Ref>)
(declare-const x@316@01 $Ref)
(declare-const i@317@01 Int)
(declare-const xs@318@01 Seq<$Ref>)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale |xs| > 10
(declare-const $t@319@01 $Snap)
(assert (= $t@319@01 $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@318@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.f, write)
(declare-const $t@320@01 Int)
(declare-const sm@321@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_f (as sm@321@01  $FVF<f>) x@316@01) $t@320@01))
(assert (not (= x@316@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale i > 0
(declare-const $t@322@01 $Snap)
(assert (= $t@322@01 $Snap.unit))
; [eval] i > 0
(assert (> i@317@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..3)), (i2 in [0..3)) }
;     { (i1 in [0..3)), xs[i2] }
;     { (i2 in [0..3)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@323@01 $Snap)
(assert (= $t@323@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@324@01 Int)
(declare-const i2@325@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 4
; [then-branch: 150 | !(i1@324@01 in [0..3]) | live]
; [else-branch: 150 | i1@324@01 in [0..3] | live]
(push) ; 5
; [then-branch: 150 | !(i1@324@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@324@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 150 | i1@324@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@324@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 6
; [then-branch: 151 | !(i2@325@01 in [0..3]) | live]
; [else-branch: 151 | i2@325@01 in [0..3] | live]
(push) ; 7
; [then-branch: 151 | !(i2@325@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@325@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 151 | i2@325@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@325@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@325@01)
  (not (Seq_contains (Seq_range 0 3) i2@325@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@324@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@324@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@325@01)
      (not (Seq_contains (Seq_range 0 3) i2@325@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@324@01)
  (not (Seq_contains (Seq_range 0 3) i1@324@01))))
(push) ; 4
; [then-branch: 152 | i1@324@01 in [0..3] && i2@325@01 in [0..3] && i1@324@01 != i2@325@01 | live]
; [else-branch: 152 | !(i1@324@01 in [0..3] && i2@325@01 in [0..3] && i1@324@01 != i2@325@01) | live]
(push) ; 5
; [then-branch: 152 | i1@324@01 in [0..3] && i2@325@01 in [0..3] && i1@324@01 != i2@325@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@324@01)
  (and (Seq_contains (Seq_range 0 3) i2@325@01) (not (= i1@324@01 i2@325@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@324@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@324@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@325@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@325@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 152 | !(i1@324@01 in [0..3] && i2@325@01 in [0..3] && i1@324@01 != i2@325@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@324@01)
    (and (Seq_contains (Seq_range 0 3) i2@325@01) (not (= i1@324@01 i2@325@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@324@01)
    (and (Seq_contains (Seq_range 0 3) i2@325@01) (not (= i1@324@01 i2@325@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@324@01)
    (Seq_contains (Seq_range 0 3) i2@325@01)
    (not (= i1@324@01 i2@325@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@325@01)
        (not (= i1@324@01 i2@325@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@324@01)
    (and (Seq_contains (Seq_range 0 3) i2@325@01) (not (= i1@324@01 i2@325@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@324@01 Int) (i2@325@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (Seq_contains (Seq_range 0 3) i2@325@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (not (Seq_contains (Seq_range 0 3) i1@324@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (Seq_contains (Seq_range 0 3) i2@325@01)
        (not (= i1@324@01 i2@325@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@324@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@325@01)
            (not (= i1@324@01 i2@325@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@324@01) (Seq_contains
    (Seq_range 0 3)
    i2@325@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@324@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@325@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@139@10@139@98-aux|)))
(assert (forall ((i1@324@01 Int) (i2@325@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (Seq_contains (Seq_range 0 3) i2@325@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (not (Seq_contains (Seq_range 0 3) i1@324@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (Seq_contains (Seq_range 0 3) i2@325@01)
        (not (= i1@324@01 i2@325@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@324@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@325@01)
            (not (= i1@324@01 i2@325@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@324@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@325@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@139@10@139@98-aux|)))
(assert (forall ((i1@324@01 Int) (i2@325@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (Seq_contains (Seq_range 0 3) i2@325@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (not (Seq_contains (Seq_range 0 3) i1@324@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (Seq_contains (Seq_range 0 3) i2@325@01)
        (not (= i1@324@01 i2@325@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@324@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@325@01)
            (not (= i1@324@01 i2@325@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@324@01) (Seq_index
    xs@318@01
    i2@325@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@324@01) (Seq_index
    xs@318@01
    i2@325@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@139@10@139@98-aux|)))
(assert (forall ((i1@324@01 Int) (i2@325@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (Seq_contains (Seq_range 0 3) i2@325@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (not (Seq_contains (Seq_range 0 3) i1@324@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (Seq_contains (Seq_range 0 3) i2@325@01)
        (not (= i1@324@01 i2@325@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@324@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@325@01)
            (not (= i1@324@01 i2@325@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@324@01) (Seq_index
    xs@318@01
    i2@325@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@139@10@139@98-aux|)))
(assert (forall ((i1@324@01 Int) (i2@325@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (Seq_contains (Seq_range 0 3) i2@325@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (not (Seq_contains (Seq_range 0 3) i1@324@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (Seq_contains (Seq_range 0 3) i2@325@01)
        (not (= i1@324@01 i2@325@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@324@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@325@01)
            (not (= i1@324@01 i2@325@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@325@01) (Seq_index
    xs@318@01
    i1@324@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@325@01) (Seq_index
    xs@318@01
    i1@324@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@139@10@139@98-aux|)))
(assert (forall ((i1@324@01 Int) (i2@325@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (Seq_contains (Seq_range 0 3) i2@325@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (not (Seq_contains (Seq_range 0 3) i1@324@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (Seq_contains (Seq_range 0 3) i2@325@01)
        (not (= i1@324@01 i2@325@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@324@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@325@01)
            (not (= i1@324@01 i2@325@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@325@01) (Seq_index
    xs@318@01
    i1@324@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@139@10@139@98-aux|)))
(assert (forall ((i1@324@01 Int) (i2@325@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (or
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (Seq_contains (Seq_range 0 3) i2@325@01)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (not (Seq_contains (Seq_range 0 3) i1@324@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (Seq_contains (Seq_range 0 3) i2@325@01)
        (not (= i1@324@01 i2@325@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@324@01)
          (and
            (Seq_contains (Seq_range 0 3) i2@325@01)
            (not (= i1@324@01 i2@325@01)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@324@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@325@01)
          (not (= i1@324@01 i2@325@01))))))
  :pattern ((Seq_index xs@318@01 i1@324@01) (Seq_index xs@318@01 i2@325@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@139@10@139@98-aux|)))
(assert (forall ((i1@324@01 Int) (i2@325@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@324@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@325@01)
        (not (= i1@324@01 i2@325@01))))
    (not (= (Seq_index xs@318@01 i1@324@01) (Seq_index xs@318@01 i2@325@01))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@324@01) (Seq_contains
    (Seq_range 0 3)
    i2@325@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@324@01) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@325@01))
  :pattern ((Seq_contains (Seq_range 0 3) i1@324@01) (Seq_index
    xs@318@01
    i2@325@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@324@01) (Seq_index
    xs@318@01
    i2@325@01))
  :pattern ((Seq_contains (Seq_range 0 3) i2@325@01) (Seq_index
    xs@318@01
    i1@324@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@325@01) (Seq_index
    xs@318@01
    i1@324@01))
  :pattern ((Seq_index xs@318@01 i1@324@01) (Seq_index xs@318@01 i2@325@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@139@10@139@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::0 <= k && k < 3 ==> acc(xs[k].f, write))
(declare-const k@326@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 4
; [then-branch: 153 | !(0 <= k@326@01) | live]
; [else-branch: 153 | 0 <= k@326@01 | live]
(push) ; 5
; [then-branch: 153 | !(0 <= k@326@01)]
(assert (not (<= 0 k@326@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 153 | 0 <= k@326@01]
(assert (<= 0 k@326@01))
; [eval] k < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@326@01) (not (<= 0 k@326@01))))
(assert (and (<= 0 k@326@01) (< k@326@01 3)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@326@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@326@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@327@01 $FVF<f>)
(declare-fun inv@328@01 ($Ref) Int)
(declare-fun img@329@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@326@01 Int)) (!
  (=>
    (and (<= 0 k@326@01) (< k@326@01 3))
    (or (<= 0 k@326@01) (not (<= 0 k@326@01))))
  :pattern ((Seq_index xs@318@01 k@326@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@326@01 Int) (k2@326@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@326@01) (< k1@326@01 3))
      (and (<= 0 k2@326@01) (< k2@326@01 3))
      (= (Seq_index xs@318@01 k1@326@01) (Seq_index xs@318@01 k2@326@01)))
    (= k1@326@01 k2@326@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@326@01 Int)) (!
  (=>
    (and (<= 0 k@326@01) (< k@326@01 3))
    (and
      (= (inv@328@01 (Seq_index xs@318@01 k@326@01)) k@326@01)
      (img@329@01 (Seq_index xs@318@01 k@326@01))))
  :pattern ((Seq_index xs@318@01 k@326@01))
  :qid |quant-u-237|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@328@01 r)) r))
  :pattern ((inv@328@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@326@01 Int)) (!
  (=>
    (and (<= 0 k@326@01) (< k@326@01 3))
    (not (= (Seq_index xs@318@01 k@326@01) $Ref.null)))
  :pattern ((Seq_index xs@318@01 k@326@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 10 == fun06(x, i, xs)
(declare-const $t@330@01 $Snap)
(assert (= $t@330@01 $Snap.unit))
; [eval] 10 == fun06(x, i, xs)
; [eval] fun06(x, i, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; Precomputing data for removing quantified permissions
(define-fun pTaken@331@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min (ite (= r x@316@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@332@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@331@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@331@01 x@316@01)) $Perm.No)))
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
  (=> (= r x@316@01) (= (- $Perm.Write (pTaken@331@01 r)) $Perm.No))
  
  :qid |quant-u-240|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@333@01 $FVF<f>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01)
  ($FVF.lookup_f (as sm@321@01  $FVF<f>) x@316@01)))
(assert (=>
  (and
    (img@329@01 x@316@01)
    (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
  (=
    ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f $t@327@01 x@316@01))))
; [eval] i > 0
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@334@01 Int)
(declare-const i2@335@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 154 | !(i1@334@01 in [0..3]) | live]
; [else-branch: 154 | i1@334@01 in [0..3] | live]
(push) ; 6
; [then-branch: 154 | !(i1@334@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@334@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 154 | i1@334@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@334@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 155 | !(i2@335@01 in [0..3]) | live]
; [else-branch: 155 | i2@335@01 in [0..3] | live]
(push) ; 8
; [then-branch: 155 | !(i2@335@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@335@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 155 | i2@335@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@335@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@335@01)
  (not (Seq_contains (Seq_range 0 3) i2@335@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@334@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@334@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@335@01)
      (not (Seq_contains (Seq_range 0 3) i2@335@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@334@01)
  (not (Seq_contains (Seq_range 0 3) i1@334@01))))
(push) ; 5
; [then-branch: 156 | i1@334@01 in [0..3] && i2@335@01 in [0..3] && i1@334@01 != i2@335@01 | live]
; [else-branch: 156 | !(i1@334@01 in [0..3] && i2@335@01 in [0..3] && i1@334@01 != i2@335@01) | live]
(push) ; 6
; [then-branch: 156 | i1@334@01 in [0..3] && i2@335@01 in [0..3] && i1@334@01 != i2@335@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@334@01)
  (and (Seq_contains (Seq_range 0 3) i2@335@01) (not (= i1@334@01 i2@335@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@334@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@334@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@335@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@335@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 156 | !(i1@334@01 in [0..3] && i2@335@01 in [0..3] && i1@334@01 != i2@335@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@334@01)
    (and (Seq_contains (Seq_range 0 3) i2@335@01) (not (= i1@334@01 i2@335@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@334@01)
    (and (Seq_contains (Seq_range 0 3) i2@335@01) (not (= i1@334@01 i2@335@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@334@01)
    (Seq_contains (Seq_range 0 3) i2@335@01)
    (not (= i1@334@01 i2@335@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@334@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@335@01)
        (not (= i1@334@01 i2@335@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@334@01)
    (and (Seq_contains (Seq_range 0 3) i2@335@01) (not (= i1@334@01 i2@335@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@334@01 Int) (i2@335@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@334@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@335@01)
        (not (= i1@334@01 i2@335@01))))
    (not (= (Seq_index xs@318@01 i1@334@01) (Seq_index xs@318@01 i2@335@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@334@01 Int) (i2@335@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@334@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@335@01)
        (not (= i1@334@01 i2@335@01))))
    (not (= (Seq_index xs@318@01 i1@334@01) (Seq_index xs@318@01 i2@335@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|)))
(declare-const k@336@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 157 | !(0 <= k@336@01) | live]
; [else-branch: 157 | 0 <= k@336@01 | live]
(push) ; 6
; [then-branch: 157 | !(0 <= k@336@01)]
(assert (not (<= 0 k@336@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 157 | 0 <= k@336@01]
(assert (<= 0 k@336@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@336@01) (not (<= 0 k@336@01))))
(assert (and (<= 0 k@336@01) (< k@336@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@336@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@336@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@337@01 ($Ref) Int)
(declare-fun img@338@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@336@01 Int)) (!
  (=>
    (and (<= 0 k@336@01) (< k@336@01 3))
    (or (<= 0 k@336@01) (not (<= 0 k@336@01))))
  :pattern ((Seq_index xs@318@01 k@336@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@336@01 Int) (k2@336@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@336@01) (< k1@336@01 3))
      (and (<= 0 k2@336@01) (< k2@336@01 3))
      (= (Seq_index xs@318@01 k1@336@01) (Seq_index xs@318@01 k2@336@01)))
    (= k1@336@01 k2@336@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@336@01 Int)) (!
  (=>
    (and (<= 0 k@336@01) (< k@336@01 3))
    (and
      (= (inv@337@01 (Seq_index xs@318@01 k@336@01)) k@336@01)
      (img@338@01 (Seq_index xs@318@01 k@336@01))))
  :pattern ((Seq_index xs@318@01 k@336@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@338@01 r) (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@337@01 r)) r))
  :pattern ((inv@337@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@339@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3))
      (img@338@01 r)
      (= r (Seq_index xs@318@01 (inv@337@01 r))))
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
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
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@339@01 r))
    $Perm.No)
  
  :qid |quant-u-243|))))
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
      (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3))
      (img@338@01 r)
      (= r (Seq_index xs@318@01 (inv@337@01 r))))
    (= (- $Perm.Write (pTaken@339@01 r)) $Perm.No))
  
  :qid |quant-u-244|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@340@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@340@01  $FVF<f>)))
      (and (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3)) (img@338@01 r)))
    (=>
      (and (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3)) (img@338@01 r))
      (Set_in r ($FVF.domain_f (as sm@340@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@340@01  $FVF<f>))))
  :qid |qp.fvfDomDef108|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3)) (img@338@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@340@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@340@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef107|)))
(assert (fun06%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@340@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@336@01 Int)) (!
  (=>
    (and (<= 0 k@336@01) (< k@336@01 3))
    (and
      (= (inv@337@01 (Seq_index xs@318@01 k@336@01)) k@336@01)
      (img@338@01 (Seq_index xs@318@01 k@336@01))))
  :pattern ((Seq_index xs@318@01 k@336@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@338@01 r) (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@337@01 r)) r))
  :pattern ((inv@337@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@340@01  $FVF<f>)))
      (and (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3)) (img@338@01 r)))
    (=>
      (and (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3)) (img@338@01 r))
      (Set_in r ($FVF.domain_f (as sm@340@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@340@01  $FVF<f>))))
  :qid |qp.fvfDomDef108|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@337@01 r)) (< (inv@337@01 r) 3)) (img@338@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@340@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@340@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef107|)))
(assert (and
  (=
    ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f (as sm@321@01  $FVF<f>) x@316@01))
  (=>
    (and
      (img@329@01 x@316@01)
      (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
    (=
      ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01)
      ($FVF.lookup_f $t@327@01 x@316@01)))
  (forall ((i1@334@01 Int) (i2@335@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@334@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@335@01)
          (not (= i1@334@01 i2@335@01))))
      (not (= (Seq_index xs@318@01 i1@334@01) (Seq_index xs@318@01 i2@335@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))
  (forall ((k@336@01 Int)) (!
    (=>
      (and (<= 0 k@336@01) (< k@336@01 3))
      (or (<= 0 k@336@01) (not (<= 0 k@336@01))))
    :pattern ((Seq_index xs@318@01 k@336@01))
    :qid |f-aux|))
  (fun06%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@340@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01)))
(assert (=
  10
  (fun06 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@340@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert 10 == fun06(x, i, xs)
; [eval] 10 == fun06(x, i, xs)
; [eval] fun06(x, i, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; Precomputing data for removing quantified permissions
(define-fun pTaken@341@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min (ite (= r x@316@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@342@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@341@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@341@01 x@316@01)) $Perm.No)))
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
  (=> (= r x@316@01) (= (- $Perm.Write (pTaken@341@01 r)) $Perm.No))
  
  :qid |quant-u-247|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
; [eval] i > 0
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@343@01 Int)
(declare-const i2@344@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 158 | !(i1@343@01 in [0..3]) | live]
; [else-branch: 158 | i1@343@01 in [0..3] | live]
(push) ; 6
; [then-branch: 158 | !(i1@343@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@343@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 158 | i1@343@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@343@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 159 | !(i2@344@01 in [0..3]) | live]
; [else-branch: 159 | i2@344@01 in [0..3] | live]
(push) ; 8
; [then-branch: 159 | !(i2@344@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@344@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 159 | i2@344@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@344@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@344@01)
  (not (Seq_contains (Seq_range 0 3) i2@344@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@343@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@343@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@344@01)
      (not (Seq_contains (Seq_range 0 3) i2@344@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@343@01)
  (not (Seq_contains (Seq_range 0 3) i1@343@01))))
(push) ; 5
; [then-branch: 160 | i1@343@01 in [0..3] && i2@344@01 in [0..3] && i1@343@01 != i2@344@01 | live]
; [else-branch: 160 | !(i1@343@01 in [0..3] && i2@344@01 in [0..3] && i1@343@01 != i2@344@01) | live]
(push) ; 6
; [then-branch: 160 | i1@343@01 in [0..3] && i2@344@01 in [0..3] && i1@343@01 != i2@344@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@343@01)
  (and (Seq_contains (Seq_range 0 3) i2@344@01) (not (= i1@343@01 i2@344@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@343@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@343@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@344@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@344@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 160 | !(i1@343@01 in [0..3] && i2@344@01 in [0..3] && i1@343@01 != i2@344@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@343@01)
    (and (Seq_contains (Seq_range 0 3) i2@344@01) (not (= i1@343@01 i2@344@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@343@01)
    (and (Seq_contains (Seq_range 0 3) i2@344@01) (not (= i1@343@01 i2@344@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@343@01)
    (Seq_contains (Seq_range 0 3) i2@344@01)
    (not (= i1@343@01 i2@344@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@343@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@344@01)
        (not (= i1@343@01 i2@344@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@343@01)
    (and (Seq_contains (Seq_range 0 3) i2@344@01) (not (= i1@343@01 i2@344@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@343@01 Int) (i2@344@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@343@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@344@01)
        (not (= i1@343@01 i2@344@01))))
    (not (= (Seq_index xs@318@01 i1@343@01) (Seq_index xs@318@01 i2@344@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@343@01 Int) (i2@344@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@343@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@344@01)
        (not (= i1@343@01 i2@344@01))))
    (not (= (Seq_index xs@318@01 i1@343@01) (Seq_index xs@318@01 i2@344@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|)))
(declare-const k@345@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 161 | !(0 <= k@345@01) | live]
; [else-branch: 161 | 0 <= k@345@01 | live]
(push) ; 6
; [then-branch: 161 | !(0 <= k@345@01)]
(assert (not (<= 0 k@345@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 161 | 0 <= k@345@01]
(assert (<= 0 k@345@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@345@01) (not (<= 0 k@345@01))))
(assert (and (<= 0 k@345@01) (< k@345@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@345@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@345@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@346@01 ($Ref) Int)
(declare-fun img@347@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@345@01 Int)) (!
  (=>
    (and (<= 0 k@345@01) (< k@345@01 3))
    (or (<= 0 k@345@01) (not (<= 0 k@345@01))))
  :pattern ((Seq_index xs@318@01 k@345@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@345@01 Int) (k2@345@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@345@01) (< k1@345@01 3))
      (and (<= 0 k2@345@01) (< k2@345@01 3))
      (= (Seq_index xs@318@01 k1@345@01) (Seq_index xs@318@01 k2@345@01)))
    (= k1@345@01 k2@345@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@345@01 Int)) (!
  (=>
    (and (<= 0 k@345@01) (< k@345@01 3))
    (and
      (= (inv@346@01 (Seq_index xs@318@01 k@345@01)) k@345@01)
      (img@347@01 (Seq_index xs@318@01 k@345@01))))
  :pattern ((Seq_index xs@318@01 k@345@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@347@01 r) (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@346@01 r)) r))
  :pattern ((inv@346@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@348@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3))
      (img@347@01 r)
      (= r (Seq_index xs@318@01 (inv@346@01 r))))
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
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
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@348@01 r))
    $Perm.No)
  
  :qid |quant-u-250|))))
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
      (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3))
      (img@347@01 r)
      (= r (Seq_index xs@318@01 (inv@346@01 r))))
    (= (- $Perm.Write (pTaken@348@01 r)) $Perm.No))
  
  :qid |quant-u-251|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@349@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@349@01  $FVF<f>)))
      (and (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3)) (img@347@01 r)))
    (=>
      (and (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3)) (img@347@01 r))
      (Set_in r ($FVF.domain_f (as sm@349@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@349@01  $FVF<f>))))
  :qid |qp.fvfDomDef110|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3)) (img@347@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@349@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@349@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef109|)))
(assert (fun06%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@345@01 Int)) (!
  (=>
    (and (<= 0 k@345@01) (< k@345@01 3))
    (and
      (= (inv@346@01 (Seq_index xs@318@01 k@345@01)) k@345@01)
      (img@347@01 (Seq_index xs@318@01 k@345@01))))
  :pattern ((Seq_index xs@318@01 k@345@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@347@01 r) (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@346@01 r)) r))
  :pattern ((inv@346@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@349@01  $FVF<f>)))
      (and (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3)) (img@347@01 r)))
    (=>
      (and (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3)) (img@347@01 r))
      (Set_in r ($FVF.domain_f (as sm@349@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@349@01  $FVF<f>))))
  :qid |qp.fvfDomDef110|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@346@01 r)) (< (inv@346@01 r) 3)) (img@347@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@349@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@349@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef109|)))
(assert (and
  (forall ((i1@343@01 Int) (i2@344@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@343@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@344@01)
          (not (= i1@343@01 i2@344@01))))
      (not (= (Seq_index xs@318@01 i1@343@01) (Seq_index xs@318@01 i2@344@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))
  (forall ((k@345@01 Int)) (!
    (=>
      (and (<= 0 k@345@01) (< k@345@01 3))
      (or (<= 0 k@345@01) (not (<= 0 k@345@01))))
    :pattern ((Seq_index xs@318@01 k@345@01))
    :qid |f-aux|))
  (fun06%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun06 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  10
  (fun06 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@333@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01)))
; [exec]
; x.f := 0
; Precomputing data for removing quantified permissions
(define-fun pTaken@350@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min (ite (= r x@316@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@351@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@350@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@350@01 x@316@01)) $Perm.No)))
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
  (=> (= r x@316@01) (= (- $Perm.Write (pTaken@350@01 r)) $Perm.No))
  
  :qid |quant-u-254|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@352@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@352@01  $FVF<f>) x@316@01) 0))
; [exec]
; assert 10 == fun06(x, i, xs)
; [eval] 10 == fun06(x, i, xs)
; [eval] fun06(x, i, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; Precomputing data for removing quantified permissions
(define-fun pTaken@353@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min (ite (= r x@316@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@354@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@353@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@353@01 x@316@01)) $Perm.No)))
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
  (=> (= r x@316@01) (= (- $Perm.Write (pTaken@353@01 r)) $Perm.No))
  
  :qid |quant-u-257|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@355@01 $FVF<f>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@355@01  $FVF<f>) x@316@01)
  ($FVF.lookup_f (as sm@352@01  $FVF<f>) x@316@01)))
(assert (=>
  (and
    (img@329@01 x@316@01)
    (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
  (=
    ($FVF.lookup_f (as sm@355@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f $t@327@01 x@316@01))))
; [eval] i > 0
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@356@01 Int)
(declare-const i2@357@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 162 | !(i1@356@01 in [0..3]) | live]
; [else-branch: 162 | i1@356@01 in [0..3] | live]
(push) ; 6
; [then-branch: 162 | !(i1@356@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@356@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 162 | i1@356@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@356@01))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 163 | !(i2@357@01 in [0..3]) | live]
; [else-branch: 163 | i2@357@01 in [0..3] | live]
(push) ; 8
; [then-branch: 163 | !(i2@357@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@357@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 163 | i2@357@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@357@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@357@01)
  (not (Seq_contains (Seq_range 0 3) i2@357@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@356@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@356@01)
    (or
      (Seq_contains (Seq_range 0 3) i2@357@01)
      (not (Seq_contains (Seq_range 0 3) i2@357@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@356@01)
  (not (Seq_contains (Seq_range 0 3) i1@356@01))))
(push) ; 5
; [then-branch: 164 | i1@356@01 in [0..3] && i2@357@01 in [0..3] && i1@356@01 != i2@357@01 | live]
; [else-branch: 164 | !(i1@356@01 in [0..3] && i2@357@01 in [0..3] && i1@356@01 != i2@357@01) | live]
(push) ; 6
; [then-branch: 164 | i1@356@01 in [0..3] && i2@357@01 in [0..3] && i1@356@01 != i2@357@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@356@01)
  (and (Seq_contains (Seq_range 0 3) i2@357@01) (not (= i1@356@01 i2@357@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@356@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@356@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@357@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@357@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 164 | !(i1@356@01 in [0..3] && i2@357@01 in [0..3] && i1@356@01 != i2@357@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@356@01)
    (and (Seq_contains (Seq_range 0 3) i2@357@01) (not (= i1@356@01 i2@357@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@356@01)
    (and (Seq_contains (Seq_range 0 3) i2@357@01) (not (= i1@356@01 i2@357@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@356@01)
    (Seq_contains (Seq_range 0 3) i2@357@01)
    (not (= i1@356@01 i2@357@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@356@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@357@01)
        (not (= i1@356@01 i2@357@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@356@01)
    (and (Seq_contains (Seq_range 0 3) i2@357@01) (not (= i1@356@01 i2@357@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i1@356@01 Int) (i2@357@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@356@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@357@01)
        (not (= i1@356@01 i2@357@01))))
    (not (= (Seq_index xs@318@01 i1@356@01) (Seq_index xs@318@01 i2@357@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@356@01 Int) (i2@357@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@356@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@357@01)
        (not (= i1@356@01 i2@357@01))))
    (not (= (Seq_index xs@318@01 i1@356@01) (Seq_index xs@318@01 i2@357@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|)))
(declare-const k@358@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 165 | !(0 <= k@358@01) | live]
; [else-branch: 165 | 0 <= k@358@01 | live]
(push) ; 6
; [then-branch: 165 | !(0 <= k@358@01)]
(assert (not (<= 0 k@358@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 165 | 0 <= k@358@01]
(assert (<= 0 k@358@01))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@358@01) (not (<= 0 k@358@01))))
(assert (and (<= 0 k@358@01) (< k@358@01 3)))
; [eval] xs[k]
(push) ; 5
(assert (not (>= k@358@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@358@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@359@01 ($Ref) Int)
(declare-fun img@360@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@358@01 Int)) (!
  (=>
    (and (<= 0 k@358@01) (< k@358@01 3))
    (or (<= 0 k@358@01) (not (<= 0 k@358@01))))
  :pattern ((Seq_index xs@318@01 k@358@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@358@01 Int) (k2@358@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@358@01) (< k1@358@01 3))
      (and (<= 0 k2@358@01) (< k2@358@01 3))
      (= (Seq_index xs@318@01 k1@358@01) (Seq_index xs@318@01 k2@358@01)))
    (= k1@358@01 k2@358@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@358@01 Int)) (!
  (=>
    (and (<= 0 k@358@01) (< k@358@01 3))
    (and
      (= (inv@359@01 (Seq_index xs@318@01 k@358@01)) k@358@01)
      (img@360@01 (Seq_index xs@318@01 k@358@01))))
  :pattern ((Seq_index xs@318@01 k@358@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@360@01 r) (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@359@01 r)) r))
  :pattern ((inv@359@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@361@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3))
      (img@360@01 r)
      (= r (Seq_index xs@318@01 (inv@359@01 r))))
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
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
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@361@01 r))
    $Perm.No)
  
  :qid |quant-u-260|))))
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
      (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3))
      (img@360@01 r)
      (= r (Seq_index xs@318@01 (inv@359@01 r))))
    (= (- $Perm.Write (pTaken@361@01 r)) $Perm.No))
  
  :qid |quant-u-261|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@362@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@362@01  $FVF<f>)))
      (and (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3)) (img@360@01 r)))
    (=>
      (and (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3)) (img@360@01 r))
      (Set_in r ($FVF.domain_f (as sm@362@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@362@01  $FVF<f>))))
  :qid |qp.fvfDomDef114|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3)) (img@360@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@362@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@362@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef113|)))
(assert (fun06%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@355@01  $FVF<f>) x@316@01))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@362@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((k@358@01 Int)) (!
  (=>
    (and (<= 0 k@358@01) (< k@358@01 3))
    (and
      (= (inv@359@01 (Seq_index xs@318@01 k@358@01)) k@358@01)
      (img@360@01 (Seq_index xs@318@01 k@358@01))))
  :pattern ((Seq_index xs@318@01 k@358@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@360@01 r) (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@359@01 r)) r))
  :pattern ((inv@359@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@362@01  $FVF<f>)))
      (and (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3)) (img@360@01 r)))
    (=>
      (and (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3)) (img@360@01 r))
      (Set_in r ($FVF.domain_f (as sm@362@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@362@01  $FVF<f>))))
  :qid |qp.fvfDomDef114|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@359@01 r)) (< (inv@359@01 r) 3)) (img@360@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@362@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@362@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef113|)))
(assert (and
  (=
    ($FVF.lookup_f (as sm@355@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f (as sm@352@01  $FVF<f>) x@316@01))
  (=>
    (and
      (img@329@01 x@316@01)
      (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
    (=
      ($FVF.lookup_f (as sm@355@01  $FVF<f>) x@316@01)
      ($FVF.lookup_f $t@327@01 x@316@01)))
  (forall ((i1@356@01 Int) (i2@357@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@356@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@357@01)
          (not (= i1@356@01 i2@357@01))))
      (not (= (Seq_index xs@318@01 i1@356@01) (Seq_index xs@318@01 i2@357@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))
  (forall ((k@358@01 Int)) (!
    (=>
      (and (<= 0 k@358@01) (< k@358@01 3))
      (or (<= 0 k@358@01) (not (<= 0 k@358@01))))
    :pattern ((Seq_index xs@318@01 k@358@01))
    :qid |f-aux|))
  (fun06%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@355@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@362@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun06 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@355@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@362@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@363@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@363@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@363@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@363@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@363@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef116|)))
(declare-const pm@364@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@364@01  $FPM) r)
    (+
      (ite (= r x@316@01) $Perm.Write $Perm.No)
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@364@01  $FPM) r))
  :qid |qp.resPrmSumDef117|)))
(assert (<= ($FVF.perm_f (as pm@364@01  $FPM) x@316@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@364@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 10 == fun06(x, i, xs)
; [eval] fun06(x, i, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; Precomputing data for removing quantified permissions
(define-fun pTaken@365@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min (ite (= r x@316@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@366@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@365@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@365@01 x@316@01)) $Perm.No)))
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
  (=> (= r x@316@01) (= (- $Perm.Write (pTaken@365@01 r)) $Perm.No))
  
  :qid |quant-u-264|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@367@01 $FVF<f>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@329@01 x@316@01)
    (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
  (=
    ($FVF.lookup_f (as sm@367@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f $t@327@01 x@316@01))))
(assert (=
  ($FVF.lookup_f (as sm@367@01  $FVF<f>) x@316@01)
  ($FVF.lookup_f (as sm@352@01  $FVF<f>) x@316@01)))
; [eval] i > 0
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@368@01 Int)
(declare-const i2@369@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 166 | !(i1@368@01 in [0..3]) | live]
; [else-branch: 166 | i1@368@01 in [0..3] | live]
(push) ; 6
; [then-branch: 166 | !(i1@368@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@368@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@367@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@367@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef119|)))
(declare-const pm@370@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@370@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@370@01  $FPM) r))
  :qid |qp.resPrmSumDef120|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@370@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@370@01  $FPM) x@316@01) $Perm.Write))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 166 | i1@368@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@368@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@367@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@367@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef119|)))
(declare-const pm@371@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@371@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@371@01  $FPM) r))
  :qid |qp.resPrmSumDef121|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@371@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@371@01  $FPM) x@316@01) $Perm.Write))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 167 | !(i2@369@01 in [0..3]) | live]
; [else-branch: 167 | i2@369@01 in [0..3] | live]
(push) ; 8
; [then-branch: 167 | !(i2@369@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@369@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 167 | i2@369@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@369@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@369@01)
  (not (Seq_contains (Seq_range 0 3) i2@369@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@367@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@367@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@370@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@370@01  $FPM) r))
  :qid |qp.resPrmSumDef120|)))
(assert (=>
  (not (Seq_contains (Seq_range 0 3) i1@368@01))
  (and
    (not (Seq_contains (Seq_range 0 3) i1@368@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@370@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@370@01  $FPM) x@316@01) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@371@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@371@01  $FPM) r))
  :qid |qp.resPrmSumDef121|)))
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@368@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@368@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@371@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@371@01  $FPM) x@316@01) $Perm.Write)
    (or
      (Seq_contains (Seq_range 0 3) i2@369@01)
      (not (Seq_contains (Seq_range 0 3) i2@369@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@368@01)
  (not (Seq_contains (Seq_range 0 3) i1@368@01))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 168 | i1@368@01 in [0..3] && i2@369@01 in [0..3] && i1@368@01 != i2@369@01 | live]
; [else-branch: 168 | !(i1@368@01 in [0..3] && i2@369@01 in [0..3] && i1@368@01 != i2@369@01) | live]
(push) ; 6
; [then-branch: 168 | i1@368@01 in [0..3] && i2@369@01 in [0..3] && i1@368@01 != i2@369@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@368@01)
  (and (Seq_contains (Seq_range 0 3) i2@369@01) (not (= i1@368@01 i2@369@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@371@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@371@01  $FPM) x@316@01) $Perm.Write))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i1@368@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@368@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@369@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@369@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 168 | !(i1@368@01 in [0..3] && i2@369@01 in [0..3] && i1@368@01 != i2@369@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@368@01)
    (and (Seq_contains (Seq_range 0 3) i2@369@01) (not (= i1@368@01 i2@369@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@371@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@371@01  $FPM) x@316@01) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@368@01)
    (and (Seq_contains (Seq_range 0 3) i2@369@01) (not (= i1@368@01 i2@369@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@368@01)
    (Seq_contains (Seq_range 0 3) i2@369@01)
    (not (= i1@368@01 i2@369@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@371@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@371@01  $FPM) x@316@01) $Perm.Write))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@368@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@369@01)
        (not (= i1@368@01 i2@369@01)))))
  (and
    (not
      (and
        (Seq_contains (Seq_range 0 3) i1@368@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@369@01)
          (not (= i1@368@01 i2@369@01)))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@371@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@371@01  $FPM) x@316@01) $Perm.Write))))
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@368@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@369@01)
        (not (= i1@368@01 i2@369@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@368@01)
    (and (Seq_contains (Seq_range 0 3) i2@369@01) (not (= i1@368@01 i2@369@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@367@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@367@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@370@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@370@01  $FPM) r))
  :qid |qp.resPrmSumDef120|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@371@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@371@01  $FPM) r))
  :qid |qp.resPrmSumDef121|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i1@368@01 Int) (i2@369@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@368@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@369@01)
        (not (= i1@368@01 i2@369@01))))
    (not (= (Seq_index xs@318@01 i1@368@01) (Seq_index xs@318@01 i2@369@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@368@01 Int) (i2@369@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@368@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@369@01)
        (not (= i1@368@01 i2@369@01))))
    (not (= (Seq_index xs@318@01 i1@368@01) (Seq_index xs@318@01 i2@369@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|)))
(declare-const k@372@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 169 | !(0 <= k@372@01) | live]
; [else-branch: 169 | 0 <= k@372@01 | live]
(push) ; 6
; [then-branch: 169 | !(0 <= k@372@01)]
(assert (not (<= 0 k@372@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@373@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@373@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@373@01  $FPM) r))
  :qid |qp.resPrmSumDef122|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@373@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@373@01  $FPM) x@316@01) $Perm.Write))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 169 | 0 <= k@372@01]
(assert (<= 0 k@372@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@374@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@374@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@374@01  $FPM) r))
  :qid |qp.resPrmSumDef123|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@374@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@374@01  $FPM) x@316@01) $Perm.Write))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@373@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@373@01  $FPM) r))
  :qid |qp.resPrmSumDef122|)))
(assert (=>
  (not (<= 0 k@372@01))
  (and
    (not (<= 0 k@372@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@373@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@373@01  $FPM) x@316@01) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@374@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@374@01  $FPM) r))
  :qid |qp.resPrmSumDef123|)))
(assert (=>
  (<= 0 k@372@01)
  (and
    (<= 0 k@372@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@374@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@374@01  $FPM) x@316@01) $Perm.Write))))
(assert (or (<= 0 k@372@01) (not (<= 0 k@372@01))))
(assert (and (<= 0 k@372@01) (< k@372@01 3)))
; [eval] xs[k]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= k@372@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@372@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@375@01 ($Ref) Int)
(declare-fun img@376@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@373@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@373@01  $FPM) r))
  :qid |qp.resPrmSumDef122|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@374@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@374@01  $FPM) r))
  :qid |qp.resPrmSumDef123|)))
; Nested auxiliary terms: non-globals
(assert (forall ((k@372@01 Int)) (!
  (=>
    (and (<= 0 k@372@01) (< k@372@01 3))
    (and
      (=>
        (not (<= 0 k@372@01))
        (and
          (not (<= 0 k@372@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@373@01  $FPM) r) $Perm.Write)
            :pattern ((inv@328@01 r))
            :qid |qp-fld-prm-bnd|))
          (<= ($FVF.perm_f (as pm@373@01  $FPM) x@316@01) $Perm.Write)))
      (=>
        (<= 0 k@372@01)
        (and
          (<= 0 k@372@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@374@01  $FPM) r) $Perm.Write)
            :pattern ((inv@328@01 r))
            :qid |qp-fld-prm-bnd|))
          (<= ($FVF.perm_f (as pm@374@01  $FPM) x@316@01) $Perm.Write)))
      (or (<= 0 k@372@01) (not (<= 0 k@372@01)))))
  :pattern ((Seq_index xs@318@01 k@372@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@372@01 Int) (k2@372@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@372@01) (< k1@372@01 3))
      (and (<= 0 k2@372@01) (< k2@372@01 3))
      (= (Seq_index xs@318@01 k1@372@01) (Seq_index xs@318@01 k2@372@01)))
    (= k1@372@01 k2@372@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@372@01 Int)) (!
  (=>
    (and (<= 0 k@372@01) (< k@372@01 3))
    (and
      (= (inv@375@01 (Seq_index xs@318@01 k@372@01)) k@372@01)
      (img@376@01 (Seq_index xs@318@01 k@372@01))))
  :pattern ((Seq_index xs@318@01 k@372@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@376@01 r) (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@375@01 r)) r))
  :pattern ((inv@375@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@377@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3))
      (img@376@01 r)
      (= r (Seq_index xs@318@01 (inv@375@01 r))))
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
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
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@377@01 r))
    $Perm.No)
  
  :qid |quant-u-267|))))
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
      (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3))
      (img@376@01 r)
      (= r (Seq_index xs@318@01 (inv@375@01 r))))
    (= (- $Perm.Write (pTaken@377@01 r)) $Perm.No))
  
  :qid |quant-u-268|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@378@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@378@01  $FVF<f>)))
      (and (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3)) (img@376@01 r)))
    (=>
      (and (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3)) (img@376@01 r))
      (Set_in r ($FVF.domain_f (as sm@378@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@378@01  $FVF<f>))))
  :qid |qp.fvfDomDef125|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3)) (img@376@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@378@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@378@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef124|)))
(assert (fun06%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@367@01  $FVF<f>) x@316@01))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@378@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@367@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@367@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@370@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@370@01  $FPM) r))
  :qid |qp.resPrmSumDef120|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@371@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@371@01  $FPM) r))
  :qid |qp.resPrmSumDef121|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@373@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@373@01  $FPM) r))
  :qid |qp.resPrmSumDef122|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@374@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@374@01  $FPM) r))
  :qid |qp.resPrmSumDef123|)))
(assert (forall ((k@372@01 Int)) (!
  (=>
    (and (<= 0 k@372@01) (< k@372@01 3))
    (and
      (= (inv@375@01 (Seq_index xs@318@01 k@372@01)) k@372@01)
      (img@376@01 (Seq_index xs@318@01 k@372@01))))
  :pattern ((Seq_index xs@318@01 k@372@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@376@01 r) (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@375@01 r)) r))
  :pattern ((inv@375@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@378@01  $FVF<f>)))
      (and (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3)) (img@376@01 r)))
    (=>
      (and (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3)) (img@376@01 r))
      (Set_in r ($FVF.domain_f (as sm@378@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@378@01  $FVF<f>))))
  :qid |qp.fvfDomDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@375@01 r)) (< (inv@375@01 r) 3)) (img@376@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@378@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@378@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef124|)))
(assert (and
  (=>
    (and
      (img@329@01 x@316@01)
      (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
    (=
      ($FVF.lookup_f (as sm@367@01  $FVF<f>) x@316@01)
      ($FVF.lookup_f $t@327@01 x@316@01)))
  (=
    ($FVF.lookup_f (as sm@367@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f (as sm@352@01  $FVF<f>) x@316@01))
  (forall ((i1@368@01 Int) (i2@369@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@368@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@369@01)
          (not (= i1@368@01 i2@369@01))))
      (not (= (Seq_index xs@318@01 i1@368@01) (Seq_index xs@318@01 i2@369@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))
  (forall ((k@372@01 Int)) (!
    (=>
      (and (<= 0 k@372@01) (< k@372@01 3))
      (and
        (=>
          (not (<= 0 k@372@01))
          (and
            (not (<= 0 k@372@01))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@373@01  $FPM) r) $Perm.Write)
              :pattern ((inv@328@01 r))
              :qid |qp-fld-prm-bnd|))
            (<= ($FVF.perm_f (as pm@373@01  $FPM) x@316@01) $Perm.Write)))
        (=>
          (<= 0 k@372@01)
          (and
            (<= 0 k@372@01)
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@374@01  $FPM) r) $Perm.Write)
              :pattern ((inv@328@01 r))
              :qid |qp-fld-prm-bnd|))
            (<= ($FVF.perm_f (as pm@374@01  $FPM) x@316@01) $Perm.Write)))
        (or (<= 0 k@372@01) (not (<= 0 k@372@01)))))
    :pattern ((Seq_index xs@318@01 k@372@01))
    :qid |f-aux|))
  (fun06%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@367@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@378@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun06 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@367@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@378@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@379@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@379@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@379@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@379@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@379@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef127|)))
(declare-const pm@380@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@380@01  $FPM) r)
    (+
      (ite (= r x@316@01) $Perm.Write $Perm.No)
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@380@01  $FPM) r))
  :qid |qp.resPrmSumDef128|)))
(assert (<= ($FVF.perm_f (as pm@380@01  $FPM) x@316@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@380@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 10 == fun06(x, i, xs)
; [eval] fun06(x, i, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; Precomputing data for removing quantified permissions
(define-fun pTaken@381@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min (ite (= r x@316@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@382@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@381@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@381@01 x@316@01)) $Perm.No)))
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
  (=> (= r x@316@01) (= (- $Perm.Write (pTaken@381@01 r)) $Perm.No))
  
  :qid |quant-u-271|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@379@01  $FVF<f>) x@316@01)
  ($FVF.lookup_f (as sm@352@01  $FVF<f>) x@316@01)))
(assert (=>
  (and
    (img@329@01 x@316@01)
    (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
  (=
    ($FVF.lookup_f (as sm@379@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f $t@327@01 x@316@01))))
; [eval] i > 0
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@383@01 Int)
(declare-const i2@384@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 170 | !(i1@383@01 in [0..3]) | live]
; [else-branch: 170 | i1@383@01 in [0..3] | live]
(push) ; 6
; [then-branch: 170 | !(i1@383@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@383@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 170 | i1@383@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@383@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] (i2 in [0..3))
; [eval] [0..3)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 171 | !(i2@384@01 in [0..3]) | live]
; [else-branch: 171 | i2@384@01 in [0..3] | live]
(push) ; 8
; [then-branch: 171 | !(i2@384@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@384@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@385@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@385@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@385@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef130|)))
(declare-const pm@386@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@386@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@386@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@386@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@386@01  $FPM) x@316@01) $Perm.Write))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 171 | i2@384@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@384@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@387@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@387@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@387@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef133|)))
(declare-const pm@388@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@388@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@388@01  $FPM) r))
  :qid |qp.resPrmSumDef134|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@388@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@388@01  $FPM) x@316@01) $Perm.Write))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@385@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@385@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@386@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@386@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
(assert (=>
  (not (Seq_contains (Seq_range 0 3) i2@384@01))
  (and
    (not (Seq_contains (Seq_range 0 3) i2@384@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@386@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@386@01  $FPM) x@316@01) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@387@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@387@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@388@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@388@01  $FPM) r))
  :qid |qp.resPrmSumDef134|)))
(assert (=>
  (Seq_contains (Seq_range 0 3) i2@384@01)
  (and
    (Seq_contains (Seq_range 0 3) i2@384@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@388@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@388@01  $FPM) x@316@01) $Perm.Write))))
(assert (or
  (Seq_contains (Seq_range 0 3) i2@384@01)
  (not (Seq_contains (Seq_range 0 3) i2@384@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@385@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@385@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@386@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@386@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@387@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@387@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@388@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@388@01  $FPM) r))
  :qid |qp.resPrmSumDef134|)))
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@383@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@383@01)
    (=>
      (not (Seq_contains (Seq_range 0 3) i2@384@01))
      (and
        (not (Seq_contains (Seq_range 0 3) i2@384@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@386@01  $FPM) r) $Perm.Write)
          :pattern ((inv@328@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@386@01  $FPM) x@316@01) $Perm.Write)))
    (=>
      (Seq_contains (Seq_range 0 3) i2@384@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@384@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@388@01  $FPM) r) $Perm.Write)
          :pattern ((inv@328@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@388@01  $FPM) x@316@01) $Perm.Write)))
    (or
      (Seq_contains (Seq_range 0 3) i2@384@01)
      (not (Seq_contains (Seq_range 0 3) i2@384@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@383@01)
  (not (Seq_contains (Seq_range 0 3) i1@383@01))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 172 | i1@383@01 in [0..3] && i2@384@01 in [0..3] && i1@383@01 != i2@384@01 | live]
; [else-branch: 172 | !(i1@383@01 in [0..3] && i2@384@01 in [0..3] && i1@383@01 != i2@384@01) | live]
(push) ; 6
; [then-branch: 172 | i1@383@01 in [0..3] && i2@384@01 in [0..3] && i1@383@01 != i2@384@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@383@01)
  (and (Seq_contains (Seq_range 0 3) i2@384@01) (not (= i1@383@01 i2@384@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i1@383@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@383@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@384@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@384@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 172 | !(i1@383@01 in [0..3] && i2@384@01 in [0..3] && i1@383@01 != i2@384@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@383@01)
    (and (Seq_contains (Seq_range 0 3) i2@384@01) (not (= i1@383@01 i2@384@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@383@01)
    (and (Seq_contains (Seq_range 0 3) i2@384@01) (not (= i1@383@01 i2@384@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@383@01)
    (Seq_contains (Seq_range 0 3) i2@384@01)
    (not (= i1@383@01 i2@384@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@383@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@384@01)
        (not (= i1@383@01 i2@384@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@383@01)
    (and (Seq_contains (Seq_range 0 3) i2@384@01) (not (= i1@383@01 i2@384@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@385@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@385@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@386@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@386@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@387@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@387@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@388@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@388@01  $FPM) r))
  :qid |qp.resPrmSumDef134|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i1@383@01 Int) (i2@384@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@383@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@384@01)
        (not (= i1@383@01 i2@384@01))))
    (not (= (Seq_index xs@318@01 i1@383@01) (Seq_index xs@318@01 i2@384@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@383@01 Int) (i2@384@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@383@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@384@01)
        (not (= i1@383@01 i2@384@01))))
    (not (= (Seq_index xs@318@01 i1@383@01) (Seq_index xs@318@01 i2@384@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|)))
(declare-const k@389@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 173 | !(0 <= k@389@01) | live]
; [else-branch: 173 | 0 <= k@389@01 | live]
(push) ; 6
; [then-branch: 173 | !(0 <= k@389@01)]
(assert (not (<= 0 k@389@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 173 | 0 <= k@389@01]
(assert (<= 0 k@389@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@389@01) (not (<= 0 k@389@01))))
(assert (and (<= 0 k@389@01) (< k@389@01 3)))
; [eval] xs[k]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= k@389@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@389@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@390@01 ($Ref) Int)
(declare-fun img@391@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@389@01 Int)) (!
  (=>
    (and (<= 0 k@389@01) (< k@389@01 3))
    (or (<= 0 k@389@01) (not (<= 0 k@389@01))))
  :pattern ((Seq_index xs@318@01 k@389@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@389@01 Int) (k2@389@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@389@01) (< k1@389@01 3))
      (and (<= 0 k2@389@01) (< k2@389@01 3))
      (= (Seq_index xs@318@01 k1@389@01) (Seq_index xs@318@01 k2@389@01)))
    (= k1@389@01 k2@389@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@389@01 Int)) (!
  (=>
    (and (<= 0 k@389@01) (< k@389@01 3))
    (and
      (= (inv@390@01 (Seq_index xs@318@01 k@389@01)) k@389@01)
      (img@391@01 (Seq_index xs@318@01 k@389@01))))
  :pattern ((Seq_index xs@318@01 k@389@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@391@01 r) (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@390@01 r)) r))
  :pattern ((inv@390@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@392@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3))
      (img@391@01 r)
      (= r (Seq_index xs@318@01 (inv@390@01 r))))
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
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
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@392@01 r))
    $Perm.No)
  
  :qid |quant-u-274|))))
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
      (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3))
      (img@391@01 r)
      (= r (Seq_index xs@318@01 (inv@390@01 r))))
    (= (- $Perm.Write (pTaken@392@01 r)) $Perm.No))
  
  :qid |quant-u-275|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@393@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@393@01  $FVF<f>)))
      (and (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3)) (img@391@01 r)))
    (=>
      (and (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3)) (img@391@01 r))
      (Set_in r ($FVF.domain_f (as sm@393@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@393@01  $FVF<f>))))
  :qid |qp.fvfDomDef136|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3)) (img@391@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@393@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@393@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef135|)))
(assert (fun06%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@379@01  $FVF<f>) x@316@01))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@393@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@385@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@385@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@385@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@386@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@386@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@387@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@387@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@387@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@388@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@388@01  $FPM) r))
  :qid |qp.resPrmSumDef134|)))
(assert (forall ((k@389@01 Int)) (!
  (=>
    (and (<= 0 k@389@01) (< k@389@01 3))
    (and
      (= (inv@390@01 (Seq_index xs@318@01 k@389@01)) k@389@01)
      (img@391@01 (Seq_index xs@318@01 k@389@01))))
  :pattern ((Seq_index xs@318@01 k@389@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@391@01 r) (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@390@01 r)) r))
  :pattern ((inv@390@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@393@01  $FVF<f>)))
      (and (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3)) (img@391@01 r)))
    (=>
      (and (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3)) (img@391@01 r))
      (Set_in r ($FVF.domain_f (as sm@393@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@393@01  $FVF<f>))))
  :qid |qp.fvfDomDef136|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@390@01 r)) (< (inv@390@01 r) 3)) (img@391@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@393@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@393@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef135|)))
(assert (and
  (=
    ($FVF.lookup_f (as sm@379@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f (as sm@352@01  $FVF<f>) x@316@01))
  (=>
    (and
      (img@329@01 x@316@01)
      (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
    (=
      ($FVF.lookup_f (as sm@379@01  $FVF<f>) x@316@01)
      ($FVF.lookup_f $t@327@01 x@316@01)))
  (forall ((i1@383@01 Int) (i2@384@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@383@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@384@01)
          (not (= i1@383@01 i2@384@01))))
      (not (= (Seq_index xs@318@01 i1@383@01) (Seq_index xs@318@01 i2@384@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))
  (forall ((k@389@01 Int)) (!
    (=>
      (and (<= 0 k@389@01) (< k@389@01 3))
      (or (<= 0 k@389@01) (not (<= 0 k@389@01))))
    :pattern ((Seq_index xs@318@01 k@389@01))
    :qid |f-aux|))
  (fun06%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@379@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@393@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun06 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@379@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@393@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] 10 == fun06(x, i, xs)
; [eval] fun06(x, i, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 10
; [eval] |xs|
; Precomputing data for removing quantified permissions
(define-fun pTaken@394@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min (ite (= r x@316@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@395@01 ((r $Ref)) $Perm
  (ite
    (= r x@316@01)
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@394@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@394@01 x@316@01)) $Perm.No)))
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
  (=> (= r x@316@01) (= (- $Perm.Write (pTaken@394@01 r)) $Perm.No))
  
  :qid |quant-u-278|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@396@01 $FVF<f>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@329@01 x@316@01)
    (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
  (=
    ($FVF.lookup_f (as sm@396@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f $t@327@01 x@316@01))))
(assert (=
  ($FVF.lookup_f (as sm@396@01  $FVF<f>) x@316@01)
  ($FVF.lookup_f (as sm@352@01  $FVF<f>) x@316@01)))
; [eval] i > 0
; [eval] (forall i1: Int, i2: Int ::(i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@397@01 Int)
(declare-const i2@398@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 174 | !(i1@397@01 in [0..3]) | live]
; [else-branch: 174 | i1@397@01 in [0..3] | live]
(push) ; 6
; [then-branch: 174 | !(i1@397@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@397@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@396@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@396@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef138|)))
(declare-const pm@399@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@399@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@399@01  $FPM) r))
  :qid |qp.resPrmSumDef139|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@399@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@399@01  $FPM) x@316@01) $Perm.Write))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 174 | i1@397@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@397@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@396@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@396@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef138|)))
(declare-const pm@400@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@400@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@400@01  $FPM) r))
  :qid |qp.resPrmSumDef140|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@400@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@400@01  $FPM) x@316@01) $Perm.Write))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 175 | !(i2@398@01 in [0..3]) | live]
; [else-branch: 175 | i2@398@01 in [0..3] | live]
(push) ; 8
; [then-branch: 175 | !(i2@398@01 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@398@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 175 | i2@398@01 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@398@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@398@01)
  (not (Seq_contains (Seq_range 0 3) i2@398@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@396@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@396@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@399@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@399@01  $FPM) r))
  :qid |qp.resPrmSumDef139|)))
(assert (=>
  (not (Seq_contains (Seq_range 0 3) i1@397@01))
  (and
    (not (Seq_contains (Seq_range 0 3) i1@397@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@399@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@399@01  $FPM) x@316@01) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@400@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@400@01  $FPM) r))
  :qid |qp.resPrmSumDef140|)))
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@397@01)
  (and
    (Seq_contains (Seq_range 0 3) i1@397@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@400@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@400@01  $FPM) x@316@01) $Perm.Write)
    (or
      (Seq_contains (Seq_range 0 3) i2@398@01)
      (not (Seq_contains (Seq_range 0 3) i2@398@01))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@397@01)
  (not (Seq_contains (Seq_range 0 3) i1@397@01))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 176 | i1@397@01 in [0..3] && i2@398@01 in [0..3] && i1@397@01 != i2@398@01 | live]
; [else-branch: 176 | !(i1@397@01 in [0..3] && i2@398@01 in [0..3] && i1@397@01 != i2@398@01) | live]
(push) ; 6
; [then-branch: 176 | i1@397@01 in [0..3] && i2@398@01 in [0..3] && i1@397@01 != i2@398@01]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@397@01)
  (and (Seq_contains (Seq_range 0 3) i2@398@01) (not (= i1@397@01 i2@398@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@400@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@400@01  $FPM) x@316@01) $Perm.Write))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i1@397@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@397@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@398@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@398@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 176 | !(i1@397@01 in [0..3] && i2@398@01 in [0..3] && i1@397@01 != i2@398@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@397@01)
    (and (Seq_contains (Seq_range 0 3) i2@398@01) (not (= i1@397@01 i2@398@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@400@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@400@01  $FPM) x@316@01) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@397@01)
    (and (Seq_contains (Seq_range 0 3) i2@398@01) (not (= i1@397@01 i2@398@01))))
  (and
    (Seq_contains (Seq_range 0 3) i1@397@01)
    (Seq_contains (Seq_range 0 3) i2@398@01)
    (not (= i1@397@01 i2@398@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@400@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@400@01  $FPM) x@316@01) $Perm.Write))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@397@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@398@01)
        (not (= i1@397@01 i2@398@01)))))
  (and
    (not
      (and
        (Seq_contains (Seq_range 0 3) i1@397@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@398@01)
          (not (= i1@397@01 i2@398@01)))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@400@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@400@01  $FPM) x@316@01) $Perm.Write))))
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@397@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@398@01)
        (not (= i1@397@01 i2@398@01)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@397@01)
    (and (Seq_contains (Seq_range 0 3) i2@398@01) (not (= i1@397@01 i2@398@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@396@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@396@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@399@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@399@01  $FPM) r))
  :qid |qp.resPrmSumDef139|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@400@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@400@01  $FPM) r))
  :qid |qp.resPrmSumDef140|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i1@397@01 Int) (i2@398@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@397@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@398@01)
        (not (= i1@397@01 i2@398@01))))
    (not (= (Seq_index xs@318@01 i1@397@01) (Seq_index xs@318@01 i2@398@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@397@01 Int) (i2@398@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@397@01)
      (and
        (Seq_contains (Seq_range 0 3) i2@398@01)
        (not (= i1@397@01 i2@398@01))))
    (not (= (Seq_index xs@318@01 i1@397@01) (Seq_index xs@318@01 i2@398@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|)))
(declare-const k@401@01 Int)
(push) ; 4
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 5
; [then-branch: 177 | !(0 <= k@401@01) | live]
; [else-branch: 177 | 0 <= k@401@01 | live]
(push) ; 6
; [then-branch: 177 | !(0 <= k@401@01)]
(assert (not (<= 0 k@401@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@402@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@402@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@402@01  $FPM) r))
  :qid |qp.resPrmSumDef141|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@402@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@402@01  $FPM) x@316@01) $Perm.Write))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 177 | 0 <= k@401@01]
(assert (<= 0 k@401@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@403@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@403@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@403@01  $FPM) r))
  :qid |qp.resPrmSumDef142|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@403@01  $FPM) r) $Perm.Write)
  :pattern ((inv@328@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@403@01  $FPM) x@316@01) $Perm.Write))
; [eval] k < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@402@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@402@01  $FPM) r))
  :qid |qp.resPrmSumDef141|)))
(assert (=>
  (not (<= 0 k@401@01))
  (and
    (not (<= 0 k@401@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@402@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@402@01  $FPM) x@316@01) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@403@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@403@01  $FPM) r))
  :qid |qp.resPrmSumDef142|)))
(assert (=>
  (<= 0 k@401@01)
  (and
    (<= 0 k@401@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@403@01  $FPM) r) $Perm.Write)
      :pattern ((inv@328@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@403@01  $FPM) x@316@01) $Perm.Write))))
(assert (or (<= 0 k@401@01) (not (<= 0 k@401@01))))
(assert (and (<= 0 k@401@01) (< k@401@01 3)))
; [eval] xs[k]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= k@401@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@401@01 (Seq_length xs@318@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@404@01 ($Ref) Int)
(declare-fun img@405@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@402@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@402@01  $FPM) r))
  :qid |qp.resPrmSumDef141|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@403@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@403@01  $FPM) r))
  :qid |qp.resPrmSumDef142|)))
; Nested auxiliary terms: non-globals
(assert (forall ((k@401@01 Int)) (!
  (=>
    (and (<= 0 k@401@01) (< k@401@01 3))
    (and
      (=>
        (not (<= 0 k@401@01))
        (and
          (not (<= 0 k@401@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@402@01  $FPM) r) $Perm.Write)
            :pattern ((inv@328@01 r))
            :qid |qp-fld-prm-bnd|))
          (<= ($FVF.perm_f (as pm@402@01  $FPM) x@316@01) $Perm.Write)))
      (=>
        (<= 0 k@401@01)
        (and
          (<= 0 k@401@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@403@01  $FPM) r) $Perm.Write)
            :pattern ((inv@328@01 r))
            :qid |qp-fld-prm-bnd|))
          (<= ($FVF.perm_f (as pm@403@01  $FPM) x@316@01) $Perm.Write)))
      (or (<= 0 k@401@01) (not (<= 0 k@401@01)))))
  :pattern ((Seq_index xs@318@01 k@401@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@401@01 Int) (k2@401@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@401@01) (< k1@401@01 3))
      (and (<= 0 k2@401@01) (< k2@401@01 3))
      (= (Seq_index xs@318@01 k1@401@01) (Seq_index xs@318@01 k2@401@01)))
    (= k1@401@01 k2@401@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@401@01 Int)) (!
  (=>
    (and (<= 0 k@401@01) (< k@401@01 3))
    (and
      (= (inv@404@01 (Seq_index xs@318@01 k@401@01)) k@401@01)
      (img@405@01 (Seq_index xs@318@01 k@401@01))))
  :pattern ((Seq_index xs@318@01 k@401@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@405@01 r) (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@404@01 r)) r))
  :pattern ((inv@404@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@406@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3))
      (img@405@01 r)
      (= r (Seq_index xs@318@01 (inv@404@01 r))))
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
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
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@406@01 r))
    $Perm.No)
  
  :qid |quant-u-281|))))
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
      (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3))
      (img@405@01 r)
      (= r (Seq_index xs@318@01 (inv@404@01 r))))
    (= (- $Perm.Write (pTaken@406@01 r)) $Perm.No))
  
  :qid |quant-u-282|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@407@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@407@01  $FVF<f>)))
      (and (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3)) (img@405@01 r)))
    (=>
      (and (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3)) (img@405@01 r))
      (Set_in r ($FVF.domain_f (as sm@407@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@407@01  $FVF<f>))))
  :qid |qp.fvfDomDef144|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3)) (img@405@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@407@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@407@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef143|)))
(assert (fun06%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@396@01  $FVF<f>) x@316@01))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (as sm@407@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (= ($FVF.lookup_f (as sm@396@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@316@01)
    (=
      ($FVF.lookup_f (as sm@396@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@352@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@396@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@399@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@399@01  $FPM) r))
  :qid |qp.resPrmSumDef139|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@400@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@400@01  $FPM) r))
  :qid |qp.resPrmSumDef140|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@402@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@402@01  $FPM) r))
  :qid |qp.resPrmSumDef141|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@403@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite (= r x@316@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@403@01  $FPM) r))
  :qid |qp.resPrmSumDef142|)))
(assert (forall ((k@401@01 Int)) (!
  (=>
    (and (<= 0 k@401@01) (< k@401@01 3))
    (and
      (= (inv@404@01 (Seq_index xs@318@01 k@401@01)) k@401@01)
      (img@405@01 (Seq_index xs@318@01 k@401@01))))
  :pattern ((Seq_index xs@318@01 k@401@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@405@01 r) (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3)))
    (= (Seq_index xs@318@01 (inv@404@01 r)) r))
  :pattern ((inv@404@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@407@01  $FVF<f>)))
      (and (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3)) (img@405@01 r)))
    (=>
      (and (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3)) (img@405@01 r))
      (Set_in r ($FVF.domain_f (as sm@407@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@407@01  $FVF<f>))))
  :qid |qp.fvfDomDef144|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@404@01 r)) (< (inv@404@01 r) 3)) (img@405@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (= ($FVF.lookup_f (as sm@407@01  $FVF<f>) r) ($FVF.lookup_f $t@327@01 r)))
  :pattern (($FVF.lookup_f (as sm@407@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@327@01 r))
  :qid |qp.fvfValDef143|)))
(assert (and
  (=>
    (and
      (img@329@01 x@316@01)
      (and (<= 0 (inv@328@01 x@316@01)) (< (inv@328@01 x@316@01) 3)))
    (=
      ($FVF.lookup_f (as sm@396@01  $FVF<f>) x@316@01)
      ($FVF.lookup_f $t@327@01 x@316@01)))
  (=
    ($FVF.lookup_f (as sm@396@01  $FVF<f>) x@316@01)
    ($FVF.lookup_f (as sm@352@01  $FVF<f>) x@316@01))
  (forall ((i1@397@01 Int) (i2@398@01 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@397@01)
        (and
          (Seq_contains (Seq_range 0 3) i2@398@01)
          (not (= i1@397@01 i2@398@01))))
      (not (= (Seq_index xs@318@01 i1@397@01) (Seq_index xs@318@01 i2@398@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|))
  (forall ((k@401@01 Int)) (!
    (=>
      (and (<= 0 k@401@01) (< k@401@01 3))
      (and
        (=>
          (not (<= 0 k@401@01))
          (and
            (not (<= 0 k@401@01))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@402@01  $FPM) r) $Perm.Write)
              :pattern ((inv@328@01 r))
              :qid |qp-fld-prm-bnd|))
            (<= ($FVF.perm_f (as pm@402@01  $FPM) x@316@01) $Perm.Write)))
        (=>
          (<= 0 k@401@01)
          (and
            (<= 0 k@401@01)
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@403@01  $FPM) r) $Perm.Write)
              :pattern ((inv@328@01 r))
              :qid |qp-fld-prm-bnd|))
            (<= ($FVF.perm_f (as pm@403@01  $FPM) x@316@01) $Perm.Write)))
        (or (<= 0 k@401@01) (not (<= 0 k@401@01)))))
    :pattern ((Seq_index xs@318@01 k@401@01))
    :qid |f-aux|))
  (fun06%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@396@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@407@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  10
  (fun06 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@396@01  $FVF<f>) x@316@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (as sm@407@01  $FVF<f>)))))) x@316@01 i@317@01 xs@318@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
