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
; ---------- FUNCTION fun05----------
(declare-fun x@0@00 () $Ref)
(declare-fun xs@1@00 () Seq<$Ref>)
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] 3 <= |xs|
; [eval] |xs|
(assert (<= 3 (Seq_length xs@1@00)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@18@00 Int)
(declare-const i2@19@00 Int)
(push) ; 2
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 3
; [then-branch: 0 | !(i1@18@00 in [0..3]) | live]
; [else-branch: 0 | i1@18@00 in [0..3] | live]
(push) ; 4
; [then-branch: 0 | !(i1@18@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@18@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | i1@18@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@18@00))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 1 | !(i2@19@00 in [0..3]) | live]
; [else-branch: 1 | i2@19@00 in [0..3] | live]
(push) ; 6
; [then-branch: 1 | !(i2@19@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@19@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i2@19@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@19@00))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@19@00)
  (not (Seq_contains (Seq_range 0 3) i2@19@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@18@00)
  (and
    (Seq_contains (Seq_range 0 3) i1@18@00)
    (or
      (Seq_contains (Seq_range 0 3) i2@19@00)
      (not (Seq_contains (Seq_range 0 3) i2@19@00))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@18@00)
  (not (Seq_contains (Seq_range 0 3) i1@18@00))))
(push) ; 3
; [then-branch: 2 | i1@18@00 in [0..3] && i2@19@00 in [0..3] && i1@18@00 != i2@19@00 | live]
; [else-branch: 2 | !(i1@18@00 in [0..3] && i2@19@00 in [0..3] && i1@18@00 != i2@19@00) | live]
(push) ; 4
; [then-branch: 2 | i1@18@00 in [0..3] && i2@19@00 in [0..3] && i1@18@00 != i2@19@00]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@18@00)
  (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@18@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@18@00 (Seq_length xs@1@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@19@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@19@00 (Seq_length xs@1@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(i1@18@00 in [0..3] && i2@19@00 in [0..3] && i1@18@00 != i2@19@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@18@00)
    (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@18@00)
    (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))
  (and
    (Seq_contains (Seq_range 0 3) i1@18@00)
    (Seq_contains (Seq_range 0 3) i2@19@00)
    (not (= i1@18@00 i2@19@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@18@00)
    (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@18@00 Int) (i2@19@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@19@00)
          (not (Seq_contains (Seq_range 0 3) i2@19@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (not (Seq_contains (Seq_range 0 3) i1@18@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (Seq_contains (Seq_range 0 3) i2@19@00)
        (not (= i1@18@00 i2@19@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@18@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@19@00)
            (not (= i1@18@00 i2@19@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@18@00) (Seq_contains
    (Seq_range 0 3)
    i2@19@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@18@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100-aux|)))
(assert (forall ((i1@18@00 Int) (i2@19@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@19@00)
          (not (Seq_contains (Seq_range 0 3) i2@19@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (not (Seq_contains (Seq_range 0 3) i1@18@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (Seq_contains (Seq_range 0 3) i2@19@00)
        (not (= i1@18@00 i2@19@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@18@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@19@00)
            (not (= i1@18@00 i2@19@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@18@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100-aux|)))
(assert (forall ((i1@18@00 Int) (i2@19@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@19@00)
          (not (Seq_contains (Seq_range 0 3) i2@19@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (not (Seq_contains (Seq_range 0 3) i1@18@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (Seq_contains (Seq_range 0 3) i2@19@00)
        (not (= i1@18@00 i2@19@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@18@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@19@00)
            (not (= i1@18@00 i2@19@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@18@00) (Seq_index xs@1@00 i2@19@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@18@00) (Seq_index
    xs@1@00
    i2@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100-aux|)))
(assert (forall ((i1@18@00 Int) (i2@19@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@19@00)
          (not (Seq_contains (Seq_range 0 3) i2@19@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (not (Seq_contains (Seq_range 0 3) i1@18@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (Seq_contains (Seq_range 0 3) i2@19@00)
        (not (= i1@18@00 i2@19@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@18@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@19@00)
            (not (= i1@18@00 i2@19@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@18@00) (Seq_index
    xs@1@00
    i2@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100-aux|)))
(assert (forall ((i1@18@00 Int) (i2@19@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@19@00)
          (not (Seq_contains (Seq_range 0 3) i2@19@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (not (Seq_contains (Seq_range 0 3) i1@18@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (Seq_contains (Seq_range 0 3) i2@19@00)
        (not (= i1@18@00 i2@19@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@18@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@19@00)
            (not (= i1@18@00 i2@19@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@19@00) (Seq_index xs@1@00 i1@18@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@19@00) (Seq_index
    xs@1@00
    i1@18@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100-aux|)))
(assert (forall ((i1@18@00 Int) (i2@19@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@19@00)
          (not (Seq_contains (Seq_range 0 3) i2@19@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (not (Seq_contains (Seq_range 0 3) i1@18@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (Seq_contains (Seq_range 0 3) i2@19@00)
        (not (= i1@18@00 i2@19@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@18@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@19@00)
            (not (= i1@18@00 i2@19@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@19@00) (Seq_index
    xs@1@00
    i1@18@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100-aux|)))
(assert (forall ((i1@18@00 Int) (i2@19@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@19@00)
          (not (Seq_contains (Seq_range 0 3) i2@19@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (not (Seq_contains (Seq_range 0 3) i1@18@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (Seq_contains (Seq_range 0 3) i2@19@00)
        (not (= i1@18@00 i2@19@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@18@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@19@00)
            (not (= i1@18@00 i2@19@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@18@00)
        (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))))
  :pattern ((Seq_index xs@1@00 i1@18@00) (Seq_index xs@1@00 i2@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100-aux|)))
(assert (forall ((i1@18@00 Int) (i2@19@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@18@00)
      (and (Seq_contains (Seq_range 0 3) i2@19@00) (not (= i1@18@00 i2@19@00))))
    (not (= (Seq_index xs@1@00 i1@18@00) (Seq_index xs@1@00 i2@19@00))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@18@00) (Seq_contains
    (Seq_range 0 3)
    i2@19@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@18@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@19@00))
  :pattern ((Seq_contains (Seq_range 0 3) i1@18@00) (Seq_index xs@1@00 i2@19@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@18@00) (Seq_index
    xs@1@00
    i2@19@00))
  :pattern ((Seq_contains (Seq_range 0 3) i2@19@00) (Seq_index xs@1@00 i1@18@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@19@00) (Seq_index
    xs@1@00
    i1@18@00))
  :pattern ((Seq_index xs@1@00 i1@18@00) (Seq_index xs@1@00 i2@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@112@12@112@100|)))
(declare-const k@20@00 Int)
(push) ; 2
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 3
; [then-branch: 3 | !(0 <= k@20@00) | live]
; [else-branch: 3 | 0 <= k@20@00 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= k@20@00)]
(assert (not (<= 0 k@20@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= k@20@00]
(assert (<= 0 k@20@00))
; [eval] k < 3
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@20@00) (not (<= 0 k@20@00))))
(assert (and (<= 0 k@20@00) (< k@20@00 3)))
; [eval] xs[k]
(push) ; 3
(assert (not (>= k@20@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@20@00 (Seq_length xs@1@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@21@00 ($Snap $Ref Seq<$Ref> $Ref) Int)
(declare-fun img@22@00 ($Snap $Ref Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@20@00 Int)) (!
  (=>
    (and (<= 0 k@20@00) (< k@20@00 3))
    (or (<= 0 k@20@00) (not (<= 0 k@20@00))))
  :pattern ((Seq_index xs@1@00 k@20@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@20@00 Int) (k2@20@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@20@00) (< k1@20@00 3))
      (and (<= 0 k2@20@00) (< k2@20@00 3))
      (= (Seq_index xs@1@00 k1@20@00) (Seq_index xs@1@00 k2@20@00)))
    (= k1@20@00 k2@20@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@20@00 Int)) (!
  (=>
    (and (<= 0 k@20@00) (< k@20@00 3))
    (and
      (= (inv@21@00 s@$ x@0@00 xs@1@00 (Seq_index xs@1@00 k@20@00)) k@20@00)
      (img@22@00 s@$ x@0@00 xs@1@00 (Seq_index xs@1@00 k@20@00))))
  :pattern ((Seq_index xs@1@00 k@20@00))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ x@0@00 xs@1@00 r)
      (and
        (<= 0 (inv@21@00 s@$ x@0@00 xs@1@00 r))
        (< (inv@21@00 s@$ x@0@00 xs@1@00 r) 3)))
    (= (Seq_index xs@1@00 (inv@21@00 s@$ x@0@00 xs@1@00 r)) r))
  :pattern ((inv@21@00 s@$ x@0@00 xs@1@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@20@00 Int)) (!
  (=>
    (and (<= 0 k@20@00) (< k@20@00 3))
    (not (= (Seq_index xs@1@00 k@20@00) $Ref.null)))
  :pattern ((Seq_index xs@1@00 k@20@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (xs@1@00 Seq<$Ref>)) (!
  (= (fun05%limited s@$ x@0@00 xs@1@00) (fun05 s@$ x@0@00 xs@1@00))
  :pattern ((fun05 s@$ x@0@00 xs@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (xs@1@00 Seq<$Ref>)) (!
  (fun05%stateless x@0@00 xs@1@00)
  :pattern ((fun05%limited s@$ x@0@00 xs@1@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION fun02----------
(declare-fun xs@3@00 () Seq<$Ref>)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@3@00) 10))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@23@00 Int)
(declare-const i2@24@00 Int)
(push) ; 2
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 3
; [then-branch: 4 | !(i1@23@00 in [0..3]) | live]
; [else-branch: 4 | i1@23@00 in [0..3] | live]
(push) ; 4
; [then-branch: 4 | !(i1@23@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@23@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | i1@23@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@23@00))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 5 | !(i2@24@00 in [0..3]) | live]
; [else-branch: 5 | i2@24@00 in [0..3] | live]
(push) ; 6
; [then-branch: 5 | !(i2@24@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@24@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | i2@24@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@24@00))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@24@00)
  (not (Seq_contains (Seq_range 0 3) i2@24@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@23@00)
  (and
    (Seq_contains (Seq_range 0 3) i1@23@00)
    (or
      (Seq_contains (Seq_range 0 3) i2@24@00)
      (not (Seq_contains (Seq_range 0 3) i2@24@00))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@23@00)
  (not (Seq_contains (Seq_range 0 3) i1@23@00))))
(push) ; 3
; [then-branch: 6 | i1@23@00 in [0..3] && i2@24@00 in [0..3] && i1@23@00 != i2@24@00 | live]
; [else-branch: 6 | !(i1@23@00 in [0..3] && i2@24@00 in [0..3] && i1@23@00 != i2@24@00) | live]
(push) ; 4
; [then-branch: 6 | i1@23@00 in [0..3] && i2@24@00 in [0..3] && i1@23@00 != i2@24@00]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@23@00)
  (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@23@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@23@00 (Seq_length xs@3@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@24@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@24@00 (Seq_length xs@3@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(i1@23@00 in [0..3] && i2@24@00 in [0..3] && i1@23@00 != i2@24@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@23@00)
    (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@23@00)
    (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))
  (and
    (Seq_contains (Seq_range 0 3) i1@23@00)
    (Seq_contains (Seq_range 0 3) i2@24@00)
    (not (= i1@23@00 i2@24@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@23@00)
    (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@23@00 Int) (i2@24@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@24@00)
          (not (Seq_contains (Seq_range 0 3) i2@24@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (not (Seq_contains (Seq_range 0 3) i1@23@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (Seq_contains (Seq_range 0 3) i2@24@00)
        (not (= i1@23@00 i2@24@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@23@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@24@00)
            (not (= i1@23@00 i2@24@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@23@00) (Seq_contains
    (Seq_range 0 3)
    i2@24@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@23@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@24@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100-aux|)))
(assert (forall ((i1@23@00 Int) (i2@24@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@24@00)
          (not (Seq_contains (Seq_range 0 3) i2@24@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (not (Seq_contains (Seq_range 0 3) i1@23@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (Seq_contains (Seq_range 0 3) i2@24@00)
        (not (= i1@23@00 i2@24@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@23@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@24@00)
            (not (= i1@23@00 i2@24@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@23@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@24@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100-aux|)))
(assert (forall ((i1@23@00 Int) (i2@24@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@24@00)
          (not (Seq_contains (Seq_range 0 3) i2@24@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (not (Seq_contains (Seq_range 0 3) i1@23@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (Seq_contains (Seq_range 0 3) i2@24@00)
        (not (= i1@23@00 i2@24@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@23@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@24@00)
            (not (= i1@23@00 i2@24@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@23@00) (Seq_index xs@3@00 i2@24@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@23@00) (Seq_index
    xs@3@00
    i2@24@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100-aux|)))
(assert (forall ((i1@23@00 Int) (i2@24@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@24@00)
          (not (Seq_contains (Seq_range 0 3) i2@24@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (not (Seq_contains (Seq_range 0 3) i1@23@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (Seq_contains (Seq_range 0 3) i2@24@00)
        (not (= i1@23@00 i2@24@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@23@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@24@00)
            (not (= i1@23@00 i2@24@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@23@00) (Seq_index
    xs@3@00
    i2@24@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100-aux|)))
(assert (forall ((i1@23@00 Int) (i2@24@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@24@00)
          (not (Seq_contains (Seq_range 0 3) i2@24@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (not (Seq_contains (Seq_range 0 3) i1@23@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (Seq_contains (Seq_range 0 3) i2@24@00)
        (not (= i1@23@00 i2@24@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@23@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@24@00)
            (not (= i1@23@00 i2@24@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@24@00) (Seq_index xs@3@00 i1@23@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@24@00) (Seq_index
    xs@3@00
    i1@23@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100-aux|)))
(assert (forall ((i1@23@00 Int) (i2@24@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@24@00)
          (not (Seq_contains (Seq_range 0 3) i2@24@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (not (Seq_contains (Seq_range 0 3) i1@23@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (Seq_contains (Seq_range 0 3) i2@24@00)
        (not (= i1@23@00 i2@24@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@23@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@24@00)
            (not (= i1@23@00 i2@24@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@24@00) (Seq_index
    xs@3@00
    i1@23@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100-aux|)))
(assert (forall ((i1@23@00 Int) (i2@24@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@24@00)
          (not (Seq_contains (Seq_range 0 3) i2@24@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (not (Seq_contains (Seq_range 0 3) i1@23@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (Seq_contains (Seq_range 0 3) i2@24@00)
        (not (= i1@23@00 i2@24@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@23@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@24@00)
            (not (= i1@23@00 i2@24@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@23@00)
        (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))))
  :pattern ((Seq_index xs@3@00 i1@23@00) (Seq_index xs@3@00 i2@24@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100-aux|)))
(assert (forall ((i1@23@00 Int) (i2@24@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@23@00)
      (and (Seq_contains (Seq_range 0 3) i2@24@00) (not (= i1@23@00 i2@24@00))))
    (not (= (Seq_index xs@3@00 i1@23@00) (Seq_index xs@3@00 i2@24@00))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@23@00) (Seq_contains
    (Seq_range 0 3)
    i2@24@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@23@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@24@00))
  :pattern ((Seq_contains (Seq_range 0 3) i1@23@00) (Seq_index xs@3@00 i2@24@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@23@00) (Seq_index
    xs@3@00
    i2@24@00))
  :pattern ((Seq_contains (Seq_range 0 3) i2@24@00) (Seq_index xs@3@00 i1@23@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@24@00) (Seq_index
    xs@3@00
    i1@23@00))
  :pattern ((Seq_index xs@3@00 i1@23@00) (Seq_index xs@3@00 i2@24@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@26@12@26@100|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(declare-const k@25@00 Int)
(push) ; 2
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 3
; [then-branch: 7 | !(0 <= k@25@00) | live]
; [else-branch: 7 | 0 <= k@25@00 | live]
(push) ; 4
; [then-branch: 7 | !(0 <= k@25@00)]
(assert (not (<= 0 k@25@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | 0 <= k@25@00]
(assert (<= 0 k@25@00))
; [eval] k < 3
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@25@00) (not (<= 0 k@25@00))))
(assert (and (<= 0 k@25@00) (< k@25@00 3)))
; [eval] xs[k]
(push) ; 3
(assert (not (>= k@25@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@25@00 (Seq_length xs@3@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@26@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@27@00 ($Snap Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@25@00 Int)) (!
  (=>
    (and (<= 0 k@25@00) (< k@25@00 3))
    (or (<= 0 k@25@00) (not (<= 0 k@25@00))))
  :pattern ((Seq_index xs@3@00 k@25@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@25@00 Int) (k2@25@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@25@00) (< k1@25@00 3))
      (and (<= 0 k2@25@00) (< k2@25@00 3))
      (= (Seq_index xs@3@00 k1@25@00) (Seq_index xs@3@00 k2@25@00)))
    (= k1@25@00 k2@25@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@25@00 Int)) (!
  (=>
    (and (<= 0 k@25@00) (< k@25@00 3))
    (and
      (= (inv@26@00 s@$ xs@3@00 (Seq_index xs@3@00 k@25@00)) k@25@00)
      (img@27@00 s@$ xs@3@00 (Seq_index xs@3@00 k@25@00))))
  :pattern ((Seq_index xs@3@00 k@25@00))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@00 s@$ xs@3@00 r)
      (and (<= 0 (inv@26@00 s@$ xs@3@00 r)) (< (inv@26@00 s@$ xs@3@00 r) 3)))
    (= (Seq_index xs@3@00 (inv@26@00 s@$ xs@3@00 r)) r))
  :pattern ((inv@26@00 s@$ xs@3@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@25@00 Int)) (!
  (=>
    (and (<= 0 k@25@00) (< k@25@00 3))
    (not (= (Seq_index xs@3@00 k@25@00) $Ref.null)))
  :pattern ((Seq_index xs@3@00 k@25@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [6..9)), (i2 in [6..9)) } { (i1 in [6..9)), xs[i2] } { (i2 in [6..9)), xs[i1] } { xs[i1], xs[i2] } (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@28@00 Int)
(declare-const i2@29@00 Int)
(push) ; 2
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 3
; [then-branch: 8 | !(i1@28@00 in [6..9]) | live]
; [else-branch: 8 | i1@28@00 in [6..9] | live]
(push) ; 4
; [then-branch: 8 | !(i1@28@00 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@28@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | i1@28@00 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@28@00))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 5
; [then-branch: 9 | !(i2@29@00 in [6..9]) | live]
; [else-branch: 9 | i2@29@00 in [6..9] | live]
(push) ; 6
; [then-branch: 9 | !(i2@29@00 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@29@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | i2@29@00 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@29@00))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@29@00)
  (not (Seq_contains (Seq_range 6 9) i2@29@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@28@00)
  (and
    (Seq_contains (Seq_range 6 9) i1@28@00)
    (or
      (Seq_contains (Seq_range 6 9) i2@29@00)
      (not (Seq_contains (Seq_range 6 9) i2@29@00))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@28@00)
  (not (Seq_contains (Seq_range 6 9) i1@28@00))))
(push) ; 3
; [then-branch: 10 | i1@28@00 in [6..9] && i2@29@00 in [6..9] && i1@28@00 != i2@29@00 | live]
; [else-branch: 10 | !(i1@28@00 in [6..9] && i2@29@00 in [6..9] && i1@28@00 != i2@29@00) | live]
(push) ; 4
; [then-branch: 10 | i1@28@00 in [6..9] && i2@29@00 in [6..9] && i1@28@00 != i2@29@00]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@28@00)
  (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@28@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@28@00 (Seq_length xs@3@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@29@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@29@00 (Seq_length xs@3@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(i1@28@00 in [6..9] && i2@29@00 in [6..9] && i1@28@00 != i2@29@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@28@00)
    (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@28@00)
    (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))
  (and
    (Seq_contains (Seq_range 6 9) i1@28@00)
    (Seq_contains (Seq_range 6 9) i2@29@00)
    (not (= i1@28@00 i2@29@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@28@00)
    (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@28@00 Int) (i2@29@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@29@00)
          (not (Seq_contains (Seq_range 6 9) i2@29@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (not (Seq_contains (Seq_range 6 9) i1@28@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (Seq_contains (Seq_range 6 9) i2@29@00)
        (not (= i1@28@00 i2@29@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@28@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@29@00)
            (not (= i1@28@00 i2@29@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@28@00) (Seq_contains
    (Seq_range 6 9)
    i2@29@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@28@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@29@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100-aux|)))
(assert (forall ((i1@28@00 Int) (i2@29@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@29@00)
          (not (Seq_contains (Seq_range 6 9) i2@29@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (not (Seq_contains (Seq_range 6 9) i1@28@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (Seq_contains (Seq_range 6 9) i2@29@00)
        (not (= i1@28@00 i2@29@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@28@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@29@00)
            (not (= i1@28@00 i2@29@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@28@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@29@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100-aux|)))
(assert (forall ((i1@28@00 Int) (i2@29@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@29@00)
          (not (Seq_contains (Seq_range 6 9) i2@29@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (not (Seq_contains (Seq_range 6 9) i1@28@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (Seq_contains (Seq_range 6 9) i2@29@00)
        (not (= i1@28@00 i2@29@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@28@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@29@00)
            (not (= i1@28@00 i2@29@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@28@00) (Seq_index xs@3@00 i2@29@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@28@00) (Seq_index
    xs@3@00
    i2@29@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100-aux|)))
(assert (forall ((i1@28@00 Int) (i2@29@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@29@00)
          (not (Seq_contains (Seq_range 6 9) i2@29@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (not (Seq_contains (Seq_range 6 9) i1@28@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (Seq_contains (Seq_range 6 9) i2@29@00)
        (not (= i1@28@00 i2@29@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@28@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@29@00)
            (not (= i1@28@00 i2@29@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@28@00) (Seq_index
    xs@3@00
    i2@29@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100-aux|)))
(assert (forall ((i1@28@00 Int) (i2@29@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@29@00)
          (not (Seq_contains (Seq_range 6 9) i2@29@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (not (Seq_contains (Seq_range 6 9) i1@28@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (Seq_contains (Seq_range 6 9) i2@29@00)
        (not (= i1@28@00 i2@29@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@28@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@29@00)
            (not (= i1@28@00 i2@29@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i2@29@00) (Seq_index xs@3@00 i1@28@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@29@00) (Seq_index
    xs@3@00
    i1@28@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100-aux|)))
(assert (forall ((i1@28@00 Int) (i2@29@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@29@00)
          (not (Seq_contains (Seq_range 6 9) i2@29@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (not (Seq_contains (Seq_range 6 9) i1@28@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (Seq_contains (Seq_range 6 9) i2@29@00)
        (not (= i1@28@00 i2@29@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@28@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@29@00)
            (not (= i1@28@00 i2@29@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@29@00) (Seq_index
    xs@3@00
    i1@28@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100-aux|)))
(assert (forall ((i1@28@00 Int) (i2@29@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@29@00)
          (not (Seq_contains (Seq_range 6 9) i2@29@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (not (Seq_contains (Seq_range 6 9) i1@28@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (Seq_contains (Seq_range 6 9) i2@29@00)
        (not (= i1@28@00 i2@29@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@28@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@29@00)
            (not (= i1@28@00 i2@29@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@28@00)
        (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))))
  :pattern ((Seq_index xs@3@00 i1@28@00) (Seq_index xs@3@00 i2@29@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100-aux|)))
(assert (forall ((i1@28@00 Int) (i2@29@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@28@00)
      (and (Seq_contains (Seq_range 6 9) i2@29@00) (not (= i1@28@00 i2@29@00))))
    (not (= (Seq_index xs@3@00 i1@28@00) (Seq_index xs@3@00 i2@29@00))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@28@00) (Seq_contains
    (Seq_range 6 9)
    i2@29@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@28@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@29@00))
  :pattern ((Seq_contains (Seq_range 6 9) i1@28@00) (Seq_index xs@3@00 i2@29@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@28@00) (Seq_index
    xs@3@00
    i2@29@00))
  :pattern ((Seq_contains (Seq_range 6 9) i2@29@00) (Seq_index xs@3@00 i1@28@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@29@00) (Seq_index
    xs@3@00
    i1@28@00))
  :pattern ((Seq_index xs@3@00 i1@28@00) (Seq_index xs@3@00 i2@29@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@28@12@28@100|)))
(declare-const k@30@00 Int)
(push) ; 2
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 3
; [then-branch: 11 | !(6 <= k@30@00) | live]
; [else-branch: 11 | 6 <= k@30@00 | live]
(push) ; 4
; [then-branch: 11 | !(6 <= k@30@00)]
(assert (not (<= 6 k@30@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | 6 <= k@30@00]
(assert (<= 6 k@30@00))
; [eval] k < 9
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@30@00) (not (<= 6 k@30@00))))
(assert (and (<= 6 k@30@00) (< k@30@00 9)))
; [eval] xs[k]
(push) ; 3
(assert (not (>= k@30@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@30@00 (Seq_length xs@3@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@31@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@32@00 ($Snap Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@30@00 Int)) (!
  (=>
    (and (<= 6 k@30@00) (< k@30@00 9))
    (or (<= 6 k@30@00) (not (<= 6 k@30@00))))
  :pattern ((Seq_index xs@3@00 k@30@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@30@00 Int) (k2@30@00 Int)) (!
  (=>
    (and
      (and (<= 6 k1@30@00) (< k1@30@00 9))
      (and (<= 6 k2@30@00) (< k2@30@00 9))
      (= (Seq_index xs@3@00 k1@30@00) (Seq_index xs@3@00 k2@30@00)))
    (= k1@30@00 k2@30@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@30@00 Int)) (!
  (=>
    (and (<= 6 k@30@00) (< k@30@00 9))
    (and
      (= (inv@31@00 s@$ xs@3@00 (Seq_index xs@3@00 k@30@00)) k@30@00)
      (img@32@00 s@$ xs@3@00 (Seq_index xs@3@00 k@30@00))))
  :pattern ((Seq_index xs@3@00 k@30@00))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ xs@3@00 r)
      (and (<= 6 (inv@31@00 s@$ xs@3@00 r)) (< (inv@31@00 s@$ xs@3@00 r) 9)))
    (= (Seq_index xs@3@00 (inv@31@00 s@$ xs@3@00 r)) r))
  :pattern ((inv@31@00 s@$ xs@3@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@30@00 Int)) (!
  (=>
    (and (<= 6 k@30@00) (< k@30@00 9))
    (not (= (Seq_index xs@3@00 k@30@00) $Ref.null)))
  :pattern ((Seq_index xs@3@00 k@30@00))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@3@00 k@30@00) (Seq_index xs@3@00 k@25@00))
    (=
      (and
        (img@32@00 s@$ xs@3@00 r)
        (and (<= 6 (inv@31@00 s@$ xs@3@00 r)) (< (inv@31@00 s@$ xs@3@00 r) 9)))
      (and
        (img@27@00 s@$ xs@3@00 r)
        (and (<= 0 (inv@26@00 s@$ xs@3@00 r)) (< (inv@26@00 s@$ xs@3@00 r) 3)))))
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>)) (!
  (= (fun02%limited s@$ xs@3@00) (fun02 s@$ xs@3@00))
  :pattern ((fun02 s@$ xs@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>)) (!
  (fun02%stateless xs@3@00)
  :pattern ((fun02%limited s@$ xs@3@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION fun01----------
(declare-fun xs@5@00 () Seq<$Ref>)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@5@00) 10))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@33@00 Int)
(declare-const i2@34@00 Int)
(push) ; 2
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 3
; [then-branch: 12 | !(i1@33@00 in [0..3]) | live]
; [else-branch: 12 | i1@33@00 in [0..3] | live]
(push) ; 4
; [then-branch: 12 | !(i1@33@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@33@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | i1@33@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@33@00))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 13 | !(i2@34@00 in [0..3]) | live]
; [else-branch: 13 | i2@34@00 in [0..3] | live]
(push) ; 6
; [then-branch: 13 | !(i2@34@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@34@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | i2@34@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@34@00))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@34@00)
  (not (Seq_contains (Seq_range 0 3) i2@34@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@33@00)
  (and
    (Seq_contains (Seq_range 0 3) i1@33@00)
    (or
      (Seq_contains (Seq_range 0 3) i2@34@00)
      (not (Seq_contains (Seq_range 0 3) i2@34@00))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@33@00)
  (not (Seq_contains (Seq_range 0 3) i1@33@00))))
(push) ; 3
; [then-branch: 14 | i1@33@00 in [0..3] && i2@34@00 in [0..3] && i1@33@00 != i2@34@00 | live]
; [else-branch: 14 | !(i1@33@00 in [0..3] && i2@34@00 in [0..3] && i1@33@00 != i2@34@00) | live]
(push) ; 4
; [then-branch: 14 | i1@33@00 in [0..3] && i2@34@00 in [0..3] && i1@33@00 != i2@34@00]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@33@00)
  (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@33@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@33@00 (Seq_length xs@5@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@34@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@34@00 (Seq_length xs@5@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(i1@33@00 in [0..3] && i2@34@00 in [0..3] && i1@33@00 != i2@34@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@33@00)
    (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@33@00)
    (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))
  (and
    (Seq_contains (Seq_range 0 3) i1@33@00)
    (Seq_contains (Seq_range 0 3) i2@34@00)
    (not (= i1@33@00 i2@34@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@33@00)
    (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@33@00 Int) (i2@34@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@34@00)
          (not (Seq_contains (Seq_range 0 3) i2@34@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (not (Seq_contains (Seq_range 0 3) i1@33@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (Seq_contains (Seq_range 0 3) i2@34@00)
        (not (= i1@33@00 i2@34@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@33@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@34@00)
            (not (= i1@33@00 i2@34@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@33@00) (Seq_contains
    (Seq_range 0 3)
    i2@34@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@33@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@34@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100-aux|)))
(assert (forall ((i1@33@00 Int) (i2@34@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@34@00)
          (not (Seq_contains (Seq_range 0 3) i2@34@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (not (Seq_contains (Seq_range 0 3) i1@33@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (Seq_contains (Seq_range 0 3) i2@34@00)
        (not (= i1@33@00 i2@34@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@33@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@34@00)
            (not (= i1@33@00 i2@34@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@33@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@34@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100-aux|)))
(assert (forall ((i1@33@00 Int) (i2@34@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@34@00)
          (not (Seq_contains (Seq_range 0 3) i2@34@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (not (Seq_contains (Seq_range 0 3) i1@33@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (Seq_contains (Seq_range 0 3) i2@34@00)
        (not (= i1@33@00 i2@34@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@33@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@34@00)
            (not (= i1@33@00 i2@34@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@33@00) (Seq_index xs@5@00 i2@34@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@33@00) (Seq_index
    xs@5@00
    i2@34@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100-aux|)))
(assert (forall ((i1@33@00 Int) (i2@34@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@34@00)
          (not (Seq_contains (Seq_range 0 3) i2@34@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (not (Seq_contains (Seq_range 0 3) i1@33@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (Seq_contains (Seq_range 0 3) i2@34@00)
        (not (= i1@33@00 i2@34@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@33@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@34@00)
            (not (= i1@33@00 i2@34@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@33@00) (Seq_index
    xs@5@00
    i2@34@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100-aux|)))
(assert (forall ((i1@33@00 Int) (i2@34@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@34@00)
          (not (Seq_contains (Seq_range 0 3) i2@34@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (not (Seq_contains (Seq_range 0 3) i1@33@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (Seq_contains (Seq_range 0 3) i2@34@00)
        (not (= i1@33@00 i2@34@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@33@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@34@00)
            (not (= i1@33@00 i2@34@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@34@00) (Seq_index xs@5@00 i1@33@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@34@00) (Seq_index
    xs@5@00
    i1@33@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100-aux|)))
(assert (forall ((i1@33@00 Int) (i2@34@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@34@00)
          (not (Seq_contains (Seq_range 0 3) i2@34@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (not (Seq_contains (Seq_range 0 3) i1@33@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (Seq_contains (Seq_range 0 3) i2@34@00)
        (not (= i1@33@00 i2@34@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@33@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@34@00)
            (not (= i1@33@00 i2@34@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@34@00) (Seq_index
    xs@5@00
    i1@33@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100-aux|)))
(assert (forall ((i1@33@00 Int) (i2@34@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@34@00)
          (not (Seq_contains (Seq_range 0 3) i2@34@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (not (Seq_contains (Seq_range 0 3) i1@33@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (Seq_contains (Seq_range 0 3) i2@34@00)
        (not (= i1@33@00 i2@34@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@33@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@34@00)
            (not (= i1@33@00 i2@34@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@33@00)
        (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))))
  :pattern ((Seq_index xs@5@00 i1@33@00) (Seq_index xs@5@00 i2@34@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100-aux|)))
(assert (forall ((i1@33@00 Int) (i2@34@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@33@00)
      (and (Seq_contains (Seq_range 0 3) i2@34@00) (not (= i1@33@00 i2@34@00))))
    (not (= (Seq_index xs@5@00 i1@33@00) (Seq_index xs@5@00 i2@34@00))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@33@00) (Seq_contains
    (Seq_range 0 3)
    i2@34@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@33@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@34@00))
  :pattern ((Seq_contains (Seq_range 0 3) i1@33@00) (Seq_index xs@5@00 i2@34@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@33@00) (Seq_index
    xs@5@00
    i2@34@00))
  :pattern ((Seq_contains (Seq_range 0 3) i2@34@00) (Seq_index xs@5@00 i1@33@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@34@00) (Seq_index
    xs@5@00
    i1@33@00))
  :pattern ((Seq_index xs@5@00 i1@33@00) (Seq_index xs@5@00 i2@34@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@9@12@9@100|)))
(declare-const k@35@00 Int)
(push) ; 2
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 3
; [then-branch: 15 | !(0 <= k@35@00) | live]
; [else-branch: 15 | 0 <= k@35@00 | live]
(push) ; 4
; [then-branch: 15 | !(0 <= k@35@00)]
(assert (not (<= 0 k@35@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | 0 <= k@35@00]
(assert (<= 0 k@35@00))
; [eval] k < 3
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@35@00) (not (<= 0 k@35@00))))
(assert (and (<= 0 k@35@00) (< k@35@00 3)))
; [eval] xs[k]
(push) ; 3
(assert (not (>= k@35@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@35@00 (Seq_length xs@5@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@36@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@37@00 ($Snap Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@35@00 Int)) (!
  (=>
    (and (<= 0 k@35@00) (< k@35@00 3))
    (or (<= 0 k@35@00) (not (<= 0 k@35@00))))
  :pattern ((Seq_index xs@5@00 k@35@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@35@00 Int) (k2@35@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@35@00) (< k1@35@00 3))
      (and (<= 0 k2@35@00) (< k2@35@00 3))
      (= (Seq_index xs@5@00 k1@35@00) (Seq_index xs@5@00 k2@35@00)))
    (= k1@35@00 k2@35@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@35@00 Int)) (!
  (=>
    (and (<= 0 k@35@00) (< k@35@00 3))
    (and
      (= (inv@36@00 s@$ xs@5@00 (Seq_index xs@5@00 k@35@00)) k@35@00)
      (img@37@00 s@$ xs@5@00 (Seq_index xs@5@00 k@35@00))))
  :pattern ((Seq_index xs@5@00 k@35@00))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@5@00 r)
      (and (<= 0 (inv@36@00 s@$ xs@5@00 r)) (< (inv@36@00 s@$ xs@5@00 r) 3)))
    (= (Seq_index xs@5@00 (inv@36@00 s@$ xs@5@00 r)) r))
  :pattern ((inv@36@00 s@$ xs@5@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@35@00 Int)) (!
  (=>
    (and (<= 0 k@35@00) (< k@35@00 3))
    (not (= (Seq_index xs@5@00 k@35@00) $Ref.null)))
  :pattern ((Seq_index xs@5@00 k@35@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@5@00 Seq<$Ref>)) (!
  (= (fun01%limited s@$ xs@5@00) (fun01 s@$ xs@5@00))
  :pattern ((fun01 s@$ xs@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Seq<$Ref>)) (!
  (fun01%stateless xs@5@00)
  :pattern ((fun01%limited s@$ xs@5@00))
  :qid |quant-u-5|)))
; ---------- FUNCTION fun04----------
(declare-fun xs@7@00 () Seq<$Ref>)
(declare-fun b@8@00 () Bool)
(declare-fun result@9@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@7@00) 10))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] (b ? (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]) : (forall i1: Int, i2: Int :: { (i1 in [6..9)), (i2 in [6..9)) } { (i1 in [6..9)), xs[i2] } { (i2 in [6..9)), xs[i1] } { xs[i1], xs[i2] } (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@8@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@8@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | b@8@00 | live]
; [else-branch: 16 | !(b@8@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 16 | b@8@00]
(assert b@8@00)
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@38@00 Int)
(declare-const i2@39@00 Int)
(push) ; 4
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 17 | !(i1@38@00 in [0..3]) | live]
; [else-branch: 17 | i1@38@00 in [0..3] | live]
(push) ; 6
; [then-branch: 17 | !(i1@38@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@38@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 17 | i1@38@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@38@00))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 7
; [then-branch: 18 | !(i2@39@00 in [0..3]) | live]
; [else-branch: 18 | i2@39@00 in [0..3] | live]
(push) ; 8
; [then-branch: 18 | !(i2@39@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@39@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 18 | i2@39@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@39@00))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@39@00)
  (not (Seq_contains (Seq_range 0 3) i2@39@00))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@38@00)
  (and
    (Seq_contains (Seq_range 0 3) i1@38@00)
    (or
      (Seq_contains (Seq_range 0 3) i2@39@00)
      (not (Seq_contains (Seq_range 0 3) i2@39@00))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@38@00)
  (not (Seq_contains (Seq_range 0 3) i1@38@00))))
(push) ; 5
; [then-branch: 19 | i1@38@00 in [0..3] && i2@39@00 in [0..3] && i1@38@00 != i2@39@00 | live]
; [else-branch: 19 | !(i1@38@00 in [0..3] && i2@39@00 in [0..3] && i1@38@00 != i2@39@00) | live]
(push) ; 6
; [then-branch: 19 | i1@38@00 in [0..3] && i2@39@00 in [0..3] && i1@38@00 != i2@39@00]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@38@00)
  (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@38@00 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@38@00 (Seq_length xs@7@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@39@00 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@39@00 (Seq_length xs@7@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 19 | !(i1@38@00 in [0..3] && i2@39@00 in [0..3] && i1@38@00 != i2@39@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@38@00)
    (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@38@00)
    (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))
  (and
    (Seq_contains (Seq_range 0 3) i1@38@00)
    (Seq_contains (Seq_range 0 3) i2@39@00)
    (not (= i1@38@00 i2@39@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@38@00)
    (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@39@00)
          (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (not (Seq_contains (Seq_range 0 3) i1@38@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (Seq_contains (Seq_range 0 3) i2@39@00)
        (not (= i1@38@00 i2@39@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@38@00) (Seq_contains
    (Seq_range 0 3)
    i2@39@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@39@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|)))
(assert (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@39@00)
          (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (not (Seq_contains (Seq_range 0 3) i1@38@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (Seq_contains (Seq_range 0 3) i2@39@00)
        (not (= i1@38@00 i2@39@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@39@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|)))
(assert (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@39@00)
          (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (not (Seq_contains (Seq_range 0 3) i1@38@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (Seq_contains (Seq_range 0 3) i2@39@00)
        (not (= i1@38@00 i2@39@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@38@00) (Seq_index xs@7@00 i2@39@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_index
    xs@7@00
    i2@39@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|)))
(assert (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@39@00)
          (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (not (Seq_contains (Seq_range 0 3) i1@38@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (Seq_contains (Seq_range 0 3) i2@39@00)
        (not (= i1@38@00 i2@39@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_index
    xs@7@00
    i2@39@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|)))
(assert (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@39@00)
          (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (not (Seq_contains (Seq_range 0 3) i1@38@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (Seq_contains (Seq_range 0 3) i2@39@00)
        (not (= i1@38@00 i2@39@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@39@00) (Seq_index xs@7@00 i1@38@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@39@00) (Seq_index
    xs@7@00
    i1@38@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|)))
(assert (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@39@00)
          (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (not (Seq_contains (Seq_range 0 3) i1@38@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (Seq_contains (Seq_range 0 3) i2@39@00)
        (not (= i1@38@00 i2@39@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@39@00) (Seq_index
    xs@7@00
    i1@38@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|)))
(assert (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@39@00)
          (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@38@00)
      (not (Seq_contains (Seq_range 0 3) i1@38@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (Seq_contains (Seq_range 0 3) i2@39@00)
        (not (= i1@38@00 i2@39@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))))
  :pattern ((Seq_index xs@7@00 i1@38@00) (Seq_index xs@7@00 i2@39@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|)))
(pop) ; 3
(push) ; 3
; [else-branch: 16 | !(b@8@00)]
(assert (not b@8@00))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [6..9)), (i2 in [6..9)) } { (i1 in [6..9)), xs[i2] } { (i2 in [6..9)), xs[i1] } { xs[i1], xs[i2] } (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@40@00 Int)
(declare-const i2@41@00 Int)
(push) ; 4
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 5
; [then-branch: 20 | !(i1@40@00 in [6..9]) | live]
; [else-branch: 20 | i1@40@00 in [6..9] | live]
(push) ; 6
; [then-branch: 20 | !(i1@40@00 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@40@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 20 | i1@40@00 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@40@00))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 7
; [then-branch: 21 | !(i2@41@00 in [6..9]) | live]
; [else-branch: 21 | i2@41@00 in [6..9] | live]
(push) ; 8
; [then-branch: 21 | !(i2@41@00 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@41@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 21 | i2@41@00 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@41@00))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@41@00)
  (not (Seq_contains (Seq_range 6 9) i2@41@00))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@40@00)
  (and
    (Seq_contains (Seq_range 6 9) i1@40@00)
    (or
      (Seq_contains (Seq_range 6 9) i2@41@00)
      (not (Seq_contains (Seq_range 6 9) i2@41@00))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@40@00)
  (not (Seq_contains (Seq_range 6 9) i1@40@00))))
(push) ; 5
; [then-branch: 22 | i1@40@00 in [6..9] && i2@41@00 in [6..9] && i1@40@00 != i2@41@00 | live]
; [else-branch: 22 | !(i1@40@00 in [6..9] && i2@41@00 in [6..9] && i1@40@00 != i2@41@00) | live]
(push) ; 6
; [then-branch: 22 | i1@40@00 in [6..9] && i2@41@00 in [6..9] && i1@40@00 != i2@41@00]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@40@00)
  (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 7
(assert (not (>= i1@40@00 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@40@00 (Seq_length xs@7@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 7
(assert (not (>= i2@41@00 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@41@00 (Seq_length xs@7@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 22 | !(i1@40@00 in [6..9] && i2@41@00 in [6..9] && i1@40@00 != i2@41@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@40@00)
    (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@40@00)
    (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))
  (and
    (Seq_contains (Seq_range 6 9) i1@40@00)
    (Seq_contains (Seq_range 6 9) i2@41@00)
    (not (= i1@40@00 i2@41@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@40@00)
    (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@41@00)
          (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (not (Seq_contains (Seq_range 6 9) i1@40@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (Seq_contains (Seq_range 6 9) i2@41@00)
        (not (= i1@40@00 i2@41@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@40@00) (Seq_contains
    (Seq_range 6 9)
    i2@41@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@41@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|)))
(assert (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@41@00)
          (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (not (Seq_contains (Seq_range 6 9) i1@40@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (Seq_contains (Seq_range 6 9) i2@41@00)
        (not (= i1@40@00 i2@41@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@41@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|)))
(assert (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@41@00)
          (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (not (Seq_contains (Seq_range 6 9) i1@40@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (Seq_contains (Seq_range 6 9) i2@41@00)
        (not (= i1@40@00 i2@41@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@40@00) (Seq_index xs@7@00 i2@41@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_index
    xs@7@00
    i2@41@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|)))
(assert (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@41@00)
          (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (not (Seq_contains (Seq_range 6 9) i1@40@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (Seq_contains (Seq_range 6 9) i2@41@00)
        (not (= i1@40@00 i2@41@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_index
    xs@7@00
    i2@41@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|)))
(assert (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@41@00)
          (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (not (Seq_contains (Seq_range 6 9) i1@40@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (Seq_contains (Seq_range 6 9) i2@41@00)
        (not (= i1@40@00 i2@41@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i2@41@00) (Seq_index xs@7@00 i1@40@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@41@00) (Seq_index
    xs@7@00
    i1@40@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|)))
(assert (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@41@00)
          (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (not (Seq_contains (Seq_range 6 9) i1@40@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (Seq_contains (Seq_range 6 9) i2@41@00)
        (not (= i1@40@00 i2@41@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@41@00) (Seq_index
    xs@7@00
    i1@40@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|)))
(assert (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@41@00)
          (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@40@00)
      (not (Seq_contains (Seq_range 6 9) i1@40@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (Seq_contains (Seq_range 6 9) i2@41@00)
        (not (= i1@40@00 i2@41@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))))
  :pattern ((Seq_index xs@7@00 i1@40@00) (Seq_index xs@7@00 i2@41@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  b@8@00
  (and
    b@8@00
    (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (or
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
        (or
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (not (Seq_contains (Seq_range 0 3) i1@38@00)))
        (=>
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 0 3) i1@38@00)
              (and
                (Seq_contains (Seq_range 0 3) i2@39@00)
                (not (= i1@38@00 i2@39@00)))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))))
      :pattern ((Seq_contains (Seq_range 0 3) i1@38@00) (Seq_contains
        (Seq_range 0 3)
        i2@39@00))
      :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_contains_trigger
        (Seq_range 0 3)
        i2@39@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|))
    (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (or
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
        (or
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (not (Seq_contains (Seq_range 0 3) i1@38@00)))
        (=>
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 0 3) i1@38@00)
              (and
                (Seq_contains (Seq_range 0 3) i2@39@00)
                (not (= i1@38@00 i2@39@00)))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))))
      :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_contains_trigger
        (Seq_range 0 3)
        i2@39@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|))
    (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (or
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
        (or
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (not (Seq_contains (Seq_range 0 3) i1@38@00)))
        (=>
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 0 3) i1@38@00)
              (and
                (Seq_contains (Seq_range 0 3) i2@39@00)
                (not (= i1@38@00 i2@39@00)))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))))
      :pattern ((Seq_contains (Seq_range 0 3) i1@38@00) (Seq_index
        xs@7@00
        i2@39@00))
      :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_index
        xs@7@00
        i2@39@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|))
    (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (or
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
        (or
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (not (Seq_contains (Seq_range 0 3) i1@38@00)))
        (=>
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 0 3) i1@38@00)
              (and
                (Seq_contains (Seq_range 0 3) i2@39@00)
                (not (= i1@38@00 i2@39@00)))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))))
      :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_index
        xs@7@00
        i2@39@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|))
    (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (or
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
        (or
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (not (Seq_contains (Seq_range 0 3) i1@38@00)))
        (=>
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 0 3) i1@38@00)
              (and
                (Seq_contains (Seq_range 0 3) i2@39@00)
                (not (= i1@38@00 i2@39@00)))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))))
      :pattern ((Seq_contains (Seq_range 0 3) i2@39@00) (Seq_index
        xs@7@00
        i1@38@00))
      :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@39@00) (Seq_index
        xs@7@00
        i1@38@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|))
    (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (or
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
        (or
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (not (Seq_contains (Seq_range 0 3) i1@38@00)))
        (=>
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 0 3) i1@38@00)
              (and
                (Seq_contains (Seq_range 0 3) i2@39@00)
                (not (= i1@38@00 i2@39@00)))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))))
      :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@39@00) (Seq_index
        xs@7@00
        i1@38@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|))
    (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (or
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (Seq_contains (Seq_range 0 3) i2@39@00)))))
        (or
          (Seq_contains (Seq_range 0 3) i1@38@00)
          (not (Seq_contains (Seq_range 0 3) i1@38@00)))
        (=>
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (Seq_contains (Seq_range 0 3) i2@39@00)
            (not (= i1@38@00 i2@39@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 0 3) i1@38@00)
              (and
                (Seq_contains (Seq_range 0 3) i2@39@00)
                (not (= i1@38@00 i2@39@00)))))
          (and
            (Seq_contains (Seq_range 0 3) i1@38@00)
            (and
              (Seq_contains (Seq_range 0 3) i2@39@00)
              (not (= i1@38@00 i2@39@00))))))
      :pattern ((Seq_index xs@7@00 i1@38@00) (Seq_index xs@7@00 i2@39@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105-aux|)))))
; Joined path conditions
(assert (=>
  (not b@8@00)
  (and
    (not b@8@00)
    (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (or
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
        (or
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (not (Seq_contains (Seq_range 6 9) i1@40@00)))
        (=>
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 6 9) i1@40@00)
              (and
                (Seq_contains (Seq_range 6 9) i2@41@00)
                (not (= i1@40@00 i2@41@00)))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))))
      :pattern ((Seq_contains (Seq_range 6 9) i1@40@00) (Seq_contains
        (Seq_range 6 9)
        i2@41@00))
      :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_contains_trigger
        (Seq_range 6 9)
        i2@41@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|))
    (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (or
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
        (or
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (not (Seq_contains (Seq_range 6 9) i1@40@00)))
        (=>
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 6 9) i1@40@00)
              (and
                (Seq_contains (Seq_range 6 9) i2@41@00)
                (not (= i1@40@00 i2@41@00)))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))))
      :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_contains_trigger
        (Seq_range 6 9)
        i2@41@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|))
    (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (or
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
        (or
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (not (Seq_contains (Seq_range 6 9) i1@40@00)))
        (=>
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 6 9) i1@40@00)
              (and
                (Seq_contains (Seq_range 6 9) i2@41@00)
                (not (= i1@40@00 i2@41@00)))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))))
      :pattern ((Seq_contains (Seq_range 6 9) i1@40@00) (Seq_index
        xs@7@00
        i2@41@00))
      :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_index
        xs@7@00
        i2@41@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|))
    (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (or
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
        (or
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (not (Seq_contains (Seq_range 6 9) i1@40@00)))
        (=>
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 6 9) i1@40@00)
              (and
                (Seq_contains (Seq_range 6 9) i2@41@00)
                (not (= i1@40@00 i2@41@00)))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))))
      :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_index
        xs@7@00
        i2@41@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|))
    (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (or
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
        (or
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (not (Seq_contains (Seq_range 6 9) i1@40@00)))
        (=>
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 6 9) i1@40@00)
              (and
                (Seq_contains (Seq_range 6 9) i2@41@00)
                (not (= i1@40@00 i2@41@00)))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))))
      :pattern ((Seq_contains (Seq_range 6 9) i2@41@00) (Seq_index
        xs@7@00
        i1@40@00))
      :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@41@00) (Seq_index
        xs@7@00
        i1@40@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|))
    (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (or
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
        (or
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (not (Seq_contains (Seq_range 6 9) i1@40@00)))
        (=>
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 6 9) i1@40@00)
              (and
                (Seq_contains (Seq_range 6 9) i2@41@00)
                (not (= i1@40@00 i2@41@00)))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))))
      :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@41@00) (Seq_index
        xs@7@00
        i1@40@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|))
    (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
      (and
        (=>
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (or
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (Seq_contains (Seq_range 6 9) i2@41@00)))))
        (or
          (Seq_contains (Seq_range 6 9) i1@40@00)
          (not (Seq_contains (Seq_range 6 9) i1@40@00)))
        (=>
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (Seq_contains (Seq_range 6 9) i2@41@00)
            (not (= i1@40@00 i2@41@00))))
        (or
          (not
            (and
              (Seq_contains (Seq_range 6 9) i1@40@00)
              (and
                (Seq_contains (Seq_range 6 9) i2@41@00)
                (not (= i1@40@00 i2@41@00)))))
          (and
            (Seq_contains (Seq_range 6 9) i1@40@00)
            (and
              (Seq_contains (Seq_range 6 9) i2@41@00)
              (not (= i1@40@00 i2@41@00))))))
      :pattern ((Seq_index xs@7@00 i1@40@00) (Seq_index xs@7@00 i2@41@00))
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105-aux|)))))
(assert (or (not b@8@00) b@8@00))
(assert (ite
  b@8@00
  (forall ((i1@38@00 Int) (i2@39@00 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@38@00)
        (and (Seq_contains (Seq_range 0 3) i2@39@00) (not (= i1@38@00 i2@39@00))))
      (not (= (Seq_index xs@7@00 i1@38@00) (Seq_index xs@7@00 i2@39@00))))
    :pattern ((Seq_contains (Seq_range 0 3) i1@38@00) (Seq_contains
      (Seq_range 0 3)
      i2@39@00))
    :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_contains_trigger
      (Seq_range 0 3)
      i2@39@00))
    :pattern ((Seq_contains (Seq_range 0 3) i1@38@00) (Seq_index
      xs@7@00
      i2@39@00))
    :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@38@00) (Seq_index
      xs@7@00
      i2@39@00))
    :pattern ((Seq_contains (Seq_range 0 3) i2@39@00) (Seq_index
      xs@7@00
      i1@38@00))
    :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@39@00) (Seq_index
      xs@7@00
      i1@38@00))
    :pattern ((Seq_index xs@7@00 i1@38@00) (Seq_index xs@7@00 i2@39@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@86@17@86@105|))
  (forall ((i1@40@00 Int) (i2@41@00 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@40@00)
        (and (Seq_contains (Seq_range 6 9) i2@41@00) (not (= i1@40@00 i2@41@00))))
      (not (= (Seq_index xs@7@00 i1@40@00) (Seq_index xs@7@00 i2@41@00))))
    :pattern ((Seq_contains (Seq_range 6 9) i1@40@00) (Seq_contains
      (Seq_range 6 9)
      i2@41@00))
    :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_contains_trigger
      (Seq_range 6 9)
      i2@41@00))
    :pattern ((Seq_contains (Seq_range 6 9) i1@40@00) (Seq_index
      xs@7@00
      i2@41@00))
    :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@40@00) (Seq_index
      xs@7@00
      i2@41@00))
    :pattern ((Seq_contains (Seq_range 6 9) i2@41@00) (Seq_index
      xs@7@00
      i1@40@00))
    :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@41@00) (Seq_index
      xs@7@00
      i1@40@00))
    :pattern ((Seq_index xs@7@00 i1@40@00) (Seq_index xs@7@00 i2@41@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@87@17@87@105|))))
(push) ; 2
(set-option :timeout 10)
(assert (not (not b@8@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not b@8@00))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | b@8@00 | live]
; [else-branch: 23 | !(b@8@00) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 23 | b@8@00]
(assert b@8@00)
(declare-const k@42@00 Int)
(push) ; 3
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 4
; [then-branch: 24 | !(0 <= k@42@00) | live]
; [else-branch: 24 | 0 <= k@42@00 | live]
(push) ; 5
; [then-branch: 24 | !(0 <= k@42@00)]
(assert (not (<= 0 k@42@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | 0 <= k@42@00]
(assert (<= 0 k@42@00))
; [eval] k < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@42@00) (not (<= 0 k@42@00))))
(assert (and (<= 0 k@42@00) (< k@42@00 3)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@42@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@42@00 (Seq_length xs@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@43@00 ($Snap Seq<$Ref> Bool $Ref) Int)
(declare-fun img@44@00 ($Snap Seq<$Ref> Bool $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@42@00 Int)) (!
  (=>
    (and (<= 0 k@42@00) (< k@42@00 3))
    (or (<= 0 k@42@00) (not (<= 0 k@42@00))))
  :pattern ((Seq_index xs@7@00 k@42@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@42@00 Int) (k2@42@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@42@00) (< k1@42@00 3))
      (and (<= 0 k2@42@00) (< k2@42@00 3))
      (= (Seq_index xs@7@00 k1@42@00) (Seq_index xs@7@00 k2@42@00)))
    (= k1@42@00 k2@42@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@42@00 Int)) (!
  (=>
    (and (<= 0 k@42@00) (< k@42@00 3))
    (and
      (= (inv@43@00 s@$ xs@7@00 b@8@00 (Seq_index xs@7@00 k@42@00)) k@42@00)
      (img@44@00 s@$ xs@7@00 b@8@00 (Seq_index xs@7@00 k@42@00))))
  :pattern ((Seq_index xs@7@00 k@42@00))
  :qid |quant-u-24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@44@00 s@$ xs@7@00 b@8@00 r)
      (and
        (<= 0 (inv@43@00 s@$ xs@7@00 b@8@00 r))
        (< (inv@43@00 s@$ xs@7@00 b@8@00 r) 3)))
    (= (Seq_index xs@7@00 (inv@43@00 s@$ xs@7@00 b@8@00 r)) r))
  :pattern ((inv@43@00 s@$ xs@7@00 b@8@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@42@00 Int)) (!
  (=>
    (and (<= 0 k@42@00) (< k@42@00 3))
    (not (= (Seq_index xs@7@00 k@42@00) $Ref.null)))
  :pattern ((Seq_index xs@7@00 k@42@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
; [else-branch: 23 | !(b@8@00)]
(assert (not b@8@00))
(declare-const k@45@00 Int)
(push) ; 3
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 4
; [then-branch: 25 | !(6 <= k@45@00) | live]
; [else-branch: 25 | 6 <= k@45@00 | live]
(push) ; 5
; [then-branch: 25 | !(6 <= k@45@00)]
(assert (not (<= 6 k@45@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | 6 <= k@45@00]
(assert (<= 6 k@45@00))
; [eval] k < 9
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@45@00) (not (<= 6 k@45@00))))
(assert (and (<= 6 k@45@00) (< k@45@00 9)))
; [eval] xs[k]
(push) ; 4
(assert (not (>= k@45@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< k@45@00 (Seq_length xs@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@46@00 ($Snap Seq<$Ref> Bool $Ref) Int)
(declare-fun img@47@00 ($Snap Seq<$Ref> Bool $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@45@00 Int)) (!
  (=>
    (and (<= 6 k@45@00) (< k@45@00 9))
    (or (<= 6 k@45@00) (not (<= 6 k@45@00))))
  :pattern ((Seq_index xs@7@00 k@45@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@45@00 Int) (k2@45@00 Int)) (!
  (=>
    (and
      (and (<= 6 k1@45@00) (< k1@45@00 9))
      (and (<= 6 k2@45@00) (< k2@45@00 9))
      (= (Seq_index xs@7@00 k1@45@00) (Seq_index xs@7@00 k2@45@00)))
    (= k1@45@00 k2@45@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@45@00 Int)) (!
  (=>
    (and (<= 6 k@45@00) (< k@45@00 9))
    (and
      (= (inv@46@00 s@$ xs@7@00 b@8@00 (Seq_index xs@7@00 k@45@00)) k@45@00)
      (img@47@00 s@$ xs@7@00 b@8@00 (Seq_index xs@7@00 k@45@00))))
  :pattern ((Seq_index xs@7@00 k@45@00))
  :qid |quant-u-26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ xs@7@00 b@8@00 r)
      (and
        (<= 6 (inv@46@00 s@$ xs@7@00 b@8@00 r))
        (< (inv@46@00 s@$ xs@7@00 b@8@00 r) 9)))
    (= (Seq_index xs@7@00 (inv@46@00 s@$ xs@7@00 b@8@00 r)) r))
  :pattern ((inv@46@00 s@$ xs@7@00 b@8@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@45@00 Int)) (!
  (=>
    (and (<= 6 k@45@00) (< k@45@00 9))
    (not (= (Seq_index xs@7@00 k@45@00) $Ref.null)))
  :pattern ((Seq_index xs@7@00 k@45@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (b@8@00 Bool)) (!
  (= (fun04%limited s@$ xs@7@00 b@8@00) (fun04 s@$ xs@7@00 b@8@00))
  :pattern ((fun04 s@$ xs@7@00 b@8@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (b@8@00 Bool)) (!
  (fun04%stateless xs@7@00 b@8@00)
  :pattern ((fun04%limited s@$ xs@7@00 b@8@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION fun07----------
(declare-fun xs@10@00 () Seq<$Ref>)
(declare-fun result@11@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@10@00) 10))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@48@00 Int)
(declare-const i2@49@00 Int)
(push) ; 2
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 3
; [then-branch: 26 | !(i1@48@00 in [0..3]) | live]
; [else-branch: 26 | i1@48@00 in [0..3] | live]
(push) ; 4
; [then-branch: 26 | !(i1@48@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@48@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 26 | i1@48@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@48@00))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 27 | !(i2@49@00 in [0..3]) | live]
; [else-branch: 27 | i2@49@00 in [0..3] | live]
(push) ; 6
; [then-branch: 27 | !(i2@49@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@49@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | i2@49@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@49@00))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@49@00)
  (not (Seq_contains (Seq_range 0 3) i2@49@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@48@00)
  (and
    (Seq_contains (Seq_range 0 3) i1@48@00)
    (or
      (Seq_contains (Seq_range 0 3) i2@49@00)
      (not (Seq_contains (Seq_range 0 3) i2@49@00))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@48@00)
  (not (Seq_contains (Seq_range 0 3) i1@48@00))))
(push) ; 3
; [then-branch: 28 | i1@48@00 in [0..3] && i2@49@00 in [0..3] && i1@48@00 != i2@49@00 | live]
; [else-branch: 28 | !(i1@48@00 in [0..3] && i2@49@00 in [0..3] && i1@48@00 != i2@49@00) | live]
(push) ; 4
; [then-branch: 28 | i1@48@00 in [0..3] && i2@49@00 in [0..3] && i1@48@00 != i2@49@00]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@48@00)
  (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@48@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@48@00 (Seq_length xs@10@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@49@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@49@00 (Seq_length xs@10@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 28 | !(i1@48@00 in [0..3] && i2@49@00 in [0..3] && i1@48@00 != i2@49@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@48@00)
    (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@48@00)
    (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))
  (and
    (Seq_contains (Seq_range 0 3) i1@48@00)
    (Seq_contains (Seq_range 0 3) i2@49@00)
    (not (= i1@48@00 i2@49@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@48@00)
    (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@48@00 Int) (i2@49@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@49@00)
          (not (Seq_contains (Seq_range 0 3) i2@49@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (not (Seq_contains (Seq_range 0 3) i1@48@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (Seq_contains (Seq_range 0 3) i2@49@00)
        (not (= i1@48@00 i2@49@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@48@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@49@00)
            (not (= i1@48@00 i2@49@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@48@00) (Seq_contains
    (Seq_range 0 3)
    i2@49@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@48@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@49@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100-aux|)))
(assert (forall ((i1@48@00 Int) (i2@49@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@49@00)
          (not (Seq_contains (Seq_range 0 3) i2@49@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (not (Seq_contains (Seq_range 0 3) i1@48@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (Seq_contains (Seq_range 0 3) i2@49@00)
        (not (= i1@48@00 i2@49@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@48@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@49@00)
            (not (= i1@48@00 i2@49@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@48@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@49@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100-aux|)))
(assert (forall ((i1@48@00 Int) (i2@49@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@49@00)
          (not (Seq_contains (Seq_range 0 3) i2@49@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (not (Seq_contains (Seq_range 0 3) i1@48@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (Seq_contains (Seq_range 0 3) i2@49@00)
        (not (= i1@48@00 i2@49@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@48@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@49@00)
            (not (= i1@48@00 i2@49@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@48@00) (Seq_index xs@10@00 i2@49@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@48@00) (Seq_index
    xs@10@00
    i2@49@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100-aux|)))
(assert (forall ((i1@48@00 Int) (i2@49@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@49@00)
          (not (Seq_contains (Seq_range 0 3) i2@49@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (not (Seq_contains (Seq_range 0 3) i1@48@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (Seq_contains (Seq_range 0 3) i2@49@00)
        (not (= i1@48@00 i2@49@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@48@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@49@00)
            (not (= i1@48@00 i2@49@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@48@00) (Seq_index
    xs@10@00
    i2@49@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100-aux|)))
(assert (forall ((i1@48@00 Int) (i2@49@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@49@00)
          (not (Seq_contains (Seq_range 0 3) i2@49@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (not (Seq_contains (Seq_range 0 3) i1@48@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (Seq_contains (Seq_range 0 3) i2@49@00)
        (not (= i1@48@00 i2@49@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@48@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@49@00)
            (not (= i1@48@00 i2@49@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@49@00) (Seq_index xs@10@00 i1@48@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@49@00) (Seq_index
    xs@10@00
    i1@48@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100-aux|)))
(assert (forall ((i1@48@00 Int) (i2@49@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@49@00)
          (not (Seq_contains (Seq_range 0 3) i2@49@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (not (Seq_contains (Seq_range 0 3) i1@48@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (Seq_contains (Seq_range 0 3) i2@49@00)
        (not (= i1@48@00 i2@49@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@48@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@49@00)
            (not (= i1@48@00 i2@49@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@49@00) (Seq_index
    xs@10@00
    i1@48@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100-aux|)))
(assert (forall ((i1@48@00 Int) (i2@49@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@49@00)
          (not (Seq_contains (Seq_range 0 3) i2@49@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (not (Seq_contains (Seq_range 0 3) i1@48@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (Seq_contains (Seq_range 0 3) i2@49@00)
        (not (= i1@48@00 i2@49@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@48@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@49@00)
            (not (= i1@48@00 i2@49@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@48@00)
        (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))))
  :pattern ((Seq_index xs@10@00 i1@48@00) (Seq_index xs@10@00 i2@49@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100-aux|)))
(assert (forall ((i1@48@00 Int) (i2@49@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@48@00)
      (and (Seq_contains (Seq_range 0 3) i2@49@00) (not (= i1@48@00 i2@49@00))))
    (not (= (Seq_index xs@10@00 i1@48@00) (Seq_index xs@10@00 i2@49@00))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@48@00) (Seq_contains
    (Seq_range 0 3)
    i2@49@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@48@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@49@00))
  :pattern ((Seq_contains (Seq_range 0 3) i1@48@00) (Seq_index xs@10@00 i2@49@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@48@00) (Seq_index
    xs@10@00
    i2@49@00))
  :pattern ((Seq_contains (Seq_range 0 3) i2@49@00) (Seq_index xs@10@00 i1@48@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@49@00) (Seq_index
    xs@10@00
    i1@48@00))
  :pattern ((Seq_index xs@10@00 i1@48@00) (Seq_index xs@10@00 i2@49@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@69@12@69@100|)))
(declare-const k@50@00 Int)
(push) ; 2
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 3
; [then-branch: 29 | !(0 <= k@50@00) | live]
; [else-branch: 29 | 0 <= k@50@00 | live]
(push) ; 4
; [then-branch: 29 | !(0 <= k@50@00)]
(assert (not (<= 0 k@50@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 29 | 0 <= k@50@00]
(assert (<= 0 k@50@00))
; [eval] k < 3
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@50@00) (not (<= 0 k@50@00))))
(assert (and (<= 0 k@50@00) (< k@50@00 3)))
; [eval] xs[k]
(push) ; 3
(assert (not (>= k@50@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@50@00 (Seq_length xs@10@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@51@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@52@00 ($Snap Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@50@00 Int)) (!
  (=>
    (and (<= 0 k@50@00) (< k@50@00 3))
    (or (<= 0 k@50@00) (not (<= 0 k@50@00))))
  :pattern ((Seq_index xs@10@00 k@50@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@50@00 Int) (k2@50@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@50@00) (< k1@50@00 3))
      (and (<= 0 k2@50@00) (< k2@50@00 3))
      (= (Seq_index xs@10@00 k1@50@00) (Seq_index xs@10@00 k2@50@00)))
    (= k1@50@00 k2@50@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@50@00 Int)) (!
  (=>
    (and (<= 0 k@50@00) (< k@50@00 3))
    (and
      (= (inv@51@00 s@$ xs@10@00 (Seq_index xs@10@00 k@50@00)) k@50@00)
      (img@52@00 s@$ xs@10@00 (Seq_index xs@10@00 k@50@00))))
  :pattern ((Seq_index xs@10@00 k@50@00))
  :qid |quant-u-28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@00 s@$ xs@10@00 r)
      (and (<= 0 (inv@51@00 s@$ xs@10@00 r)) (< (inv@51@00 s@$ xs@10@00 r) 3)))
    (= (Seq_index xs@10@00 (inv@51@00 s@$ xs@10@00 r)) r))
  :pattern ((inv@51@00 s@$ xs@10@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@50@00 Int)) (!
  (=>
    (and (<= 0 k@50@00) (< k@50@00 3))
    (not (= (Seq_index xs@10@00 k@50@00) $Ref.null)))
  :pattern ((Seq_index xs@10@00 k@50@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (= (fun07%limited s@$ xs@10@00) (fun07 s@$ xs@10@00))
  :pattern ((fun07 s@$ xs@10@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (fun07%stateless xs@10@00)
  :pattern ((fun07%limited s@$ xs@10@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION fun03----------
(declare-fun xs@12@00 () Seq<$Ref>)
(declare-fun result@13@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@12@00) 10))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@53@00 Int)
(declare-const i2@54@00 Int)
(push) ; 2
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 3
; [then-branch: 30 | !(i1@53@00 in [0..3]) | live]
; [else-branch: 30 | i1@53@00 in [0..3] | live]
(push) ; 4
; [then-branch: 30 | !(i1@53@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@53@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 30 | i1@53@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@53@00))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 31 | !(i2@54@00 in [0..3]) | live]
; [else-branch: 31 | i2@54@00 in [0..3] | live]
(push) ; 6
; [then-branch: 31 | !(i2@54@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@54@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 31 | i2@54@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@54@00))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@54@00)
  (not (Seq_contains (Seq_range 0 3) i2@54@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@53@00)
  (and
    (Seq_contains (Seq_range 0 3) i1@53@00)
    (or
      (Seq_contains (Seq_range 0 3) i2@54@00)
      (not (Seq_contains (Seq_range 0 3) i2@54@00))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@53@00)
  (not (Seq_contains (Seq_range 0 3) i1@53@00))))
(push) ; 3
; [then-branch: 32 | i1@53@00 in [0..3] && i2@54@00 in [0..3] && i1@53@00 != i2@54@00 | live]
; [else-branch: 32 | !(i1@53@00 in [0..3] && i2@54@00 in [0..3] && i1@53@00 != i2@54@00) | live]
(push) ; 4
; [then-branch: 32 | i1@53@00 in [0..3] && i2@54@00 in [0..3] && i1@53@00 != i2@54@00]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@53@00)
  (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@53@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@53@00 (Seq_length xs@12@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@54@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@54@00 (Seq_length xs@12@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 32 | !(i1@53@00 in [0..3] && i2@54@00 in [0..3] && i1@53@00 != i2@54@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@53@00)
    (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@53@00)
    (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
  (and
    (Seq_contains (Seq_range 0 3) i1@53@00)
    (Seq_contains (Seq_range 0 3) i2@54@00)
    (not (= i1@53@00 i2@54@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@53@00)
    (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@53@00) (Seq_contains
    (Seq_range 0 3)
    i2@54@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@53@00) (Seq_index xs@12@00 i2@54@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_index
    xs@12@00
    i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_index
    xs@12@00
    i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@54@00) (Seq_index xs@12@00 i1@53@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@54@00) (Seq_index
    xs@12@00
    i1@53@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@54@00) (Seq_index
    xs@12@00
    i1@53@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_index xs@12@00 i1@53@00) (Seq_index xs@12@00 i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
    (not (= (Seq_index xs@12@00 i1@53@00) (Seq_index xs@12@00 i2@54@00))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@53@00) (Seq_contains
    (Seq_range 0 3)
    i2@54@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@54@00))
  :pattern ((Seq_contains (Seq_range 0 3) i1@53@00) (Seq_index xs@12@00 i2@54@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_index
    xs@12@00
    i2@54@00))
  :pattern ((Seq_contains (Seq_range 0 3) i2@54@00) (Seq_index xs@12@00 i1@53@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@54@00) (Seq_index
    xs@12@00
    i1@53@00))
  :pattern ((Seq_index xs@12@00 i1@53@00) (Seq_index xs@12@00 i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(declare-const k@55@00 Int)
(push) ; 2
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 3
; [then-branch: 33 | !(0 <= k@55@00) | live]
; [else-branch: 33 | 0 <= k@55@00 | live]
(push) ; 4
; [then-branch: 33 | !(0 <= k@55@00)]
(assert (not (<= 0 k@55@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 33 | 0 <= k@55@00]
(assert (<= 0 k@55@00))
; [eval] k < 3
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@55@00) (not (<= 0 k@55@00))))
(assert (and (<= 0 k@55@00) (< k@55@00 3)))
; [eval] xs[k]
(push) ; 3
(assert (not (>= k@55@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@55@00 (Seq_length xs@12@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@56@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@57@00 ($Snap Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@55@00 Int)) (!
  (=>
    (and (<= 0 k@55@00) (< k@55@00 3))
    (or (<= 0 k@55@00) (not (<= 0 k@55@00))))
  :pattern ((Seq_index xs@12@00 k@55@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@55@00 Int) (k2@55@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@55@00) (< k1@55@00 3))
      (and (<= 0 k2@55@00) (< k2@55@00 3))
      (= (Seq_index xs@12@00 k1@55@00) (Seq_index xs@12@00 k2@55@00)))
    (= k1@55@00 k2@55@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@55@00 Int)) (!
  (=>
    (and (<= 0 k@55@00) (< k@55@00 3))
    (and
      (= (inv@56@00 s@$ xs@12@00 (Seq_index xs@12@00 k@55@00)) k@55@00)
      (img@57@00 s@$ xs@12@00 (Seq_index xs@12@00 k@55@00))))
  :pattern ((Seq_index xs@12@00 k@55@00))
  :qid |quant-u-30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@57@00 s@$ xs@12@00 r)
      (and (<= 0 (inv@56@00 s@$ xs@12@00 r)) (< (inv@56@00 s@$ xs@12@00 r) 3)))
    (= (Seq_index xs@12@00 (inv@56@00 s@$ xs@12@00 r)) r))
  :pattern ((inv@56@00 s@$ xs@12@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@55@00 Int)) (!
  (=>
    (and (<= 0 k@55@00) (< k@55@00 3))
    (not (= (Seq_index xs@12@00 k@55@00) $Ref.null)))
  :pattern ((Seq_index xs@12@00 k@55@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [6..9)), (i2 in [6..9)) } { (i1 in [6..9)), xs[i2] } { (i2 in [6..9)), xs[i1] } { xs[i1], xs[i2] } (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@58@00 Int)
(declare-const i2@59@00 Int)
(push) ; 2
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [6..9)) && ((i2 in [6..9)) && i1 != i2)
; [eval] (i1 in [6..9))
; [eval] [6..9)
(push) ; 3
; [then-branch: 34 | !(i1@58@00 in [6..9]) | live]
; [else-branch: 34 | i1@58@00 in [6..9] | live]
(push) ; 4
; [then-branch: 34 | !(i1@58@00 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i1@58@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 34 | i1@58@00 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i1@58@00))
; [eval] (i2 in [6..9))
; [eval] [6..9)
(push) ; 5
; [then-branch: 35 | !(i2@59@00 in [6..9]) | live]
; [else-branch: 35 | i2@59@00 in [6..9] | live]
(push) ; 6
; [then-branch: 35 | !(i2@59@00 in [6..9])]
(assert (not (Seq_contains (Seq_range 6 9) i2@59@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 35 | i2@59@00 in [6..9]]
(assert (Seq_contains (Seq_range 6 9) i2@59@00))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 6 9) i2@59@00)
  (not (Seq_contains (Seq_range 6 9) i2@59@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 6 9) i1@58@00)
  (and
    (Seq_contains (Seq_range 6 9) i1@58@00)
    (or
      (Seq_contains (Seq_range 6 9) i2@59@00)
      (not (Seq_contains (Seq_range 6 9) i2@59@00))))))
(assert (or
  (Seq_contains (Seq_range 6 9) i1@58@00)
  (not (Seq_contains (Seq_range 6 9) i1@58@00))))
(push) ; 3
; [then-branch: 36 | i1@58@00 in [6..9] && i2@59@00 in [6..9] && i1@58@00 != i2@59@00 | live]
; [else-branch: 36 | !(i1@58@00 in [6..9] && i2@59@00 in [6..9] && i1@58@00 != i2@59@00) | live]
(push) ; 4
; [then-branch: 36 | i1@58@00 in [6..9] && i2@59@00 in [6..9] && i1@58@00 != i2@59@00]
(assert (and
  (Seq_contains (Seq_range 6 9) i1@58@00)
  (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@58@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@58@00 (Seq_length xs@12@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@59@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@59@00 (Seq_length xs@12@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 36 | !(i1@58@00 in [6..9] && i2@59@00 in [6..9] && i1@58@00 != i2@59@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 6 9) i1@58@00)
    (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 6 9) i1@58@00)
    (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
  (and
    (Seq_contains (Seq_range 6 9) i1@58@00)
    (Seq_contains (Seq_range 6 9) i2@59@00)
    (not (= i1@58@00 i2@59@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00)))))
  (and
    (Seq_contains (Seq_range 6 9) i1@58@00)
    (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@58@00) (Seq_contains
    (Seq_range 6 9)
    i2@59@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@58@00) (Seq_index xs@12@00 i2@59@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_index
    xs@12@00
    i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_index
    xs@12@00
    i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i2@59@00) (Seq_index xs@12@00 i1@58@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@59@00) (Seq_index
    xs@12@00
    i1@58@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@59@00) (Seq_index
    xs@12@00
    i1@58@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_index xs@12@00 i1@58@00) (Seq_index xs@12@00 i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
    (not (= (Seq_index xs@12@00 i1@58@00) (Seq_index xs@12@00 i2@59@00))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@58@00) (Seq_contains
    (Seq_range 6 9)
    i2@59@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@59@00))
  :pattern ((Seq_contains (Seq_range 6 9) i1@58@00) (Seq_index xs@12@00 i2@59@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_index
    xs@12@00
    i2@59@00))
  :pattern ((Seq_contains (Seq_range 6 9) i2@59@00) (Seq_index xs@12@00 i1@58@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@59@00) (Seq_index
    xs@12@00
    i1@58@00))
  :pattern ((Seq_index xs@12@00 i1@58@00) (Seq_index xs@12@00 i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100|)))
(declare-const k@60@00 Int)
(push) ; 2
; [eval] 6 <= k && k < 9
; [eval] 6 <= k
(push) ; 3
; [then-branch: 37 | !(6 <= k@60@00) | live]
; [else-branch: 37 | 6 <= k@60@00 | live]
(push) ; 4
; [then-branch: 37 | !(6 <= k@60@00)]
(assert (not (<= 6 k@60@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 37 | 6 <= k@60@00]
(assert (<= 6 k@60@00))
; [eval] k < 9
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 k@60@00) (not (<= 6 k@60@00))))
(assert (and (<= 6 k@60@00) (< k@60@00 9)))
; [eval] xs[k]
(push) ; 3
(assert (not (>= k@60@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@60@00 (Seq_length xs@12@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@61@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@62@00 ($Snap Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@60@00 Int)) (!
  (=>
    (and (<= 6 k@60@00) (< k@60@00 9))
    (or (<= 6 k@60@00) (not (<= 6 k@60@00))))
  :pattern ((Seq_index xs@12@00 k@60@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@60@00 Int) (k2@60@00 Int)) (!
  (=>
    (and
      (and (<= 6 k1@60@00) (< k1@60@00 9))
      (and (<= 6 k2@60@00) (< k2@60@00 9))
      (= (Seq_index xs@12@00 k1@60@00) (Seq_index xs@12@00 k2@60@00)))
    (= k1@60@00 k2@60@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@60@00 Int)) (!
  (=>
    (and (<= 6 k@60@00) (< k@60@00 9))
    (and
      (= (inv@61@00 s@$ xs@12@00 (Seq_index xs@12@00 k@60@00)) k@60@00)
      (img@62@00 s@$ xs@12@00 (Seq_index xs@12@00 k@60@00))))
  :pattern ((Seq_index xs@12@00 k@60@00))
  :qid |quant-u-32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@00 s@$ xs@12@00 r)
      (and (<= 6 (inv@61@00 s@$ xs@12@00 r)) (< (inv@61@00 s@$ xs@12@00 r) 9)))
    (= (Seq_index xs@12@00 (inv@61@00 s@$ xs@12@00 r)) r))
  :pattern ((inv@61@00 s@$ xs@12@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@60@00 Int)) (!
  (=>
    (and (<= 6 k@60@00) (< k@60@00 9))
    (not (= (Seq_index xs@12@00 k@60@00) $Ref.null)))
  :pattern ((Seq_index xs@12@00 k@60@00))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@12@00 k@60@00) (Seq_index xs@12@00 k@55@00))
    (=
      (and
        (img@62@00 s@$ xs@12@00 r)
        (and (<= 6 (inv@61@00 s@$ xs@12@00 r)) (< (inv@61@00 s@$ xs@12@00 r) 9)))
      (and
        (img@57@00 s@$ xs@12@00 r)
        (and (<= 0 (inv@56@00 s@$ xs@12@00 r)) (< (inv@56@00 s@$ xs@12@00 r) 3)))))
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (= (fun03%limited s@$ xs@12@00) (fun03 s@$ xs@12@00))
  :pattern ((fun03 s@$ xs@12@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (fun03%stateless xs@12@00)
  :pattern ((fun03%limited s@$ xs@12@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@00 s@$ xs@12@00 r)
      (and (<= 6 (inv@61@00 s@$ xs@12@00 r)) (< (inv@61@00 s@$ xs@12@00 r) 9)))
    (= (Seq_index xs@12@00 (inv@61@00 s@$ xs@12@00 r)) r))
  :pattern ((inv@61@00 s@$ xs@12@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((k@60@00 Int)) (!
  (=>
    (and (<= 6 k@60@00) (< k@60@00 9))
    (and
      (= (inv@61@00 s@$ xs@12@00 (Seq_index xs@12@00 k@60@00)) k@60@00)
      (img@62@00 s@$ xs@12@00 (Seq_index xs@12@00 k@60@00))))
  :pattern ((Seq_index xs@12@00 k@60@00))
  :qid |quant-u-32|)))
(assert (forall ((k@60@00 Int)) (!
  (=>
    (and (<= 6 k@60@00) (< k@60@00 9))
    (not (= (Seq_index xs@12@00 k@60@00) $Ref.null)))
  :pattern ((Seq_index xs@12@00 k@60@00))
  :qid |f-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@57@00 s@$ xs@12@00 r)
      (and (<= 0 (inv@56@00 s@$ xs@12@00 r)) (< (inv@56@00 s@$ xs@12@00 r) 3)))
    (= (Seq_index xs@12@00 (inv@56@00 s@$ xs@12@00 r)) r))
  :pattern ((inv@56@00 s@$ xs@12@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((k@55@00 Int)) (!
  (=>
    (and (<= 0 k@55@00) (< k@55@00 3))
    (and
      (= (inv@56@00 s@$ xs@12@00 (Seq_index xs@12@00 k@55@00)) k@55@00)
      (img@57@00 s@$ xs@12@00 (Seq_index xs@12@00 k@55@00))))
  :pattern ((Seq_index xs@12@00 k@55@00))
  :qid |quant-u-30|)))
(assert (forall ((k@55@00 Int)) (!
  (=>
    (and (<= 0 k@55@00) (< k@55@00 3))
    (not (= (Seq_index xs@12@00 k@55@00) $Ref.null)))
  :pattern ((Seq_index xs@12@00 k@55@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@58@00) (Seq_contains
    (Seq_range 6 9)
    i2@59@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@58@00) (Seq_index xs@12@00 i2@59@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_index
    xs@12@00
    i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_index
    xs@12@00
    i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains (Seq_range 6 9) i2@59@00) (Seq_index xs@12@00 i1@58@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@59@00) (Seq_index
    xs@12@00
    i1@58@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@59@00) (Seq_index
    xs@12@00
    i1@58@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (or
          (Seq_contains (Seq_range 6 9) i2@59@00)
          (not (Seq_contains (Seq_range 6 9) i2@59@00)))))
    (or
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (not (Seq_contains (Seq_range 6 9) i1@58@00)))
    (=>
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (Seq_contains (Seq_range 6 9) i2@59@00)
        (not (= i1@58@00 i2@59@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 6 9) i1@58@00)
          (and
            (Seq_contains (Seq_range 6 9) i2@59@00)
            (not (= i1@58@00 i2@59@00)))))
      (and
        (Seq_contains (Seq_range 6 9) i1@58@00)
        (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))))
  :pattern ((Seq_index xs@12@00 i1@58@00) (Seq_index xs@12@00 i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100-aux|)))
(assert (forall ((i1@58@00 Int) (i2@59@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 6 9) i1@58@00)
      (and (Seq_contains (Seq_range 6 9) i2@59@00) (not (= i1@58@00 i2@59@00))))
    (not (= (Seq_index xs@12@00 i1@58@00) (Seq_index xs@12@00 i2@59@00))))
  :pattern ((Seq_contains (Seq_range 6 9) i1@58@00) (Seq_contains
    (Seq_range 6 9)
    i2@59@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_contains_trigger
    (Seq_range 6 9)
    i2@59@00))
  :pattern ((Seq_contains (Seq_range 6 9) i1@58@00) (Seq_index xs@12@00 i2@59@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i1@58@00) (Seq_index
    xs@12@00
    i2@59@00))
  :pattern ((Seq_contains (Seq_range 6 9) i2@59@00) (Seq_index xs@12@00 i1@58@00))
  :pattern ((Seq_contains_trigger (Seq_range 6 9) i2@59@00) (Seq_index
    xs@12@00
    i1@58@00))
  :pattern ((Seq_index xs@12@00 i1@58@00) (Seq_index xs@12@00 i2@59@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@49@12@49@100|)))
(assert (forall ((k@60@00 Int)) (!
  (=>
    (and (<= 6 k@60@00) (< k@60@00 9))
    (or (<= 6 k@60@00) (not (<= 6 k@60@00))))
  :pattern ((Seq_index xs@12@00 k@60@00))
  :qid |f-aux|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (> (Seq_length xs@12@00) 10))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@53@00) (Seq_contains
    (Seq_range 0 3)
    i2@54@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@53@00) (Seq_index xs@12@00 i2@54@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_index
    xs@12@00
    i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_index
    xs@12@00
    i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@54@00) (Seq_index xs@12@00 i1@53@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@54@00) (Seq_index
    xs@12@00
    i1@53@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@54@00) (Seq_index
    xs@12@00
    i1@53@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@54@00)
          (not (Seq_contains (Seq_range 0 3) i2@54@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (not (Seq_contains (Seq_range 0 3) i1@53@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (Seq_contains (Seq_range 0 3) i2@54@00)
        (not (= i1@53@00 i2@54@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@53@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@54@00)
            (not (= i1@53@00 i2@54@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@53@00)
        (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))))
  :pattern ((Seq_index xs@12@00 i1@53@00) (Seq_index xs@12@00 i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100-aux|)))
(assert (forall ((i1@53@00 Int) (i2@54@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@53@00)
      (and (Seq_contains (Seq_range 0 3) i2@54@00) (not (= i1@53@00 i2@54@00))))
    (not (= (Seq_index xs@12@00 i1@53@00) (Seq_index xs@12@00 i2@54@00))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@53@00) (Seq_contains
    (Seq_range 0 3)
    i2@54@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@54@00))
  :pattern ((Seq_contains (Seq_range 0 3) i1@53@00) (Seq_index xs@12@00 i2@54@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@53@00) (Seq_index
    xs@12@00
    i2@54@00))
  :pattern ((Seq_contains (Seq_range 0 3) i2@54@00) (Seq_index xs@12@00 i1@53@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@54@00) (Seq_index
    xs@12@00
    i1@53@00))
  :pattern ((Seq_index xs@12@00 i1@53@00) (Seq_index xs@12@00 i2@54@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@47@12@47@100|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (forall ((k@55@00 Int)) (!
  (=>
    (and (<= 0 k@55@00) (< k@55@00 3))
    (or (<= 0 k@55@00) (not (<= 0 k@55@00))))
  :pattern ((Seq_index xs@12@00 k@55@00))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] xs[2].f + xs[6].f
; [eval] xs[2]
(set-option :timeout 0)
(push) ; 2
(assert (not (< 2 (Seq_length xs@12@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@63@00 ($Snap Seq<$Ref>) $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@57@00 s@$ xs@12@00 r)
      (and (<= 0 (inv@56@00 s@$ xs@12@00 r)) (< (inv@56@00 s@$ xs@12@00 r) 3)))
    (=
      ($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@00 s@$ xs@12@00 r)
      (and (<= 6 (inv@61@00 s@$ xs@12@00 r)) (< (inv@61@00 s@$ xs@12@00 r) 9)))
    (=
      ($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@64@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@64@00  $FPM) r)
    (+
      (ite
        (and
          (img@57@00 s@$ xs@12@00 r)
          (and
            (<= 0 (inv@56@00 s@$ xs@12@00 r))
            (< (inv@56@00 s@$ xs@12@00 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@62@00 s@$ xs@12@00 r)
          (and
            (<= 6 (inv@61@00 s@$ xs@12@00 r))
            (< (inv@61@00 s@$ xs@12@00 r) 9)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@64@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_f (as pm@64@00  $FPM) (Seq_index xs@12@00 2)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] xs[6]
(push) ; 2
(assert (not (< 6 (Seq_length xs@12@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@57@00 s@$ xs@12@00 r)
        (and (<= 0 (inv@56@00 s@$ xs@12@00 r)) (< (inv@56@00 s@$ xs@12@00 r) 3)))
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
        (and (<= 6 (inv@61@00 s@$ xs@12@00 r)) (< (inv@61@00 s@$ xs@12@00 r) 9)))
      (=
        ($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
    :pattern (($FVF.lookup_f (sm@63@00 s@$ xs@12@00) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
    :qid |qp.fvfValDef1|))))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@57@00 s@$ xs@12@00 (Seq_index xs@12@00 6))
        (and
          (<= 0 (inv@56@00 s@$ xs@12@00 (Seq_index xs@12@00 6)))
          (< (inv@56@00 s@$ xs@12@00 (Seq_index xs@12@00 6)) 3)))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@62@00 s@$ xs@12@00 (Seq_index xs@12@00 6))
        (and
          (<= 6 (inv@61@00 s@$ xs@12@00 (Seq_index xs@12@00 6)))
          (< (inv@61@00 s@$ xs@12@00 (Seq_index xs@12@00 6)) 9)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@13@00
  (+
    ($FVF.lookup_f (sm@63@00 s@$ xs@12@00) (Seq_index xs@12@00 2))
    ($FVF.lookup_f (sm@63@00 s@$ xs@12@00) (Seq_index xs@12@00 6)))))
(pop) ; 1
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
; ---------- FUNCTION fun06----------
(declare-fun x@14@00 () $Ref)
(declare-fun i@15@00 () Int)
(declare-fun xs@16@00 () Seq<$Ref>)
(declare-fun result@17@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] |xs| > 10
; [eval] |xs|
(assert (> (Seq_length xs@16@00) 10))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-fun sm@65@00 ($Snap $Ref Int Seq<$Ref>) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@65@00 s@$ x@14@00 i@15@00 xs@16@00) x@14@00)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (not (= x@14@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] i > 0
(assert (> i@15@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..3)), (i2 in [0..3)) } { (i1 in [0..3)), xs[i2] } { (i2 in [0..3)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@66@00 Int)
(declare-const i2@67@00 Int)
(push) ; 2
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..3)) && ((i2 in [0..3)) && i1 != i2)
; [eval] (i1 in [0..3))
; [eval] [0..3)
(push) ; 3
; [then-branch: 38 | !(i1@66@00 in [0..3]) | live]
; [else-branch: 38 | i1@66@00 in [0..3] | live]
(push) ; 4
; [then-branch: 38 | !(i1@66@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i1@66@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 38 | i1@66@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i1@66@00))
; [eval] (i2 in [0..3))
; [eval] [0..3)
(push) ; 5
; [then-branch: 39 | !(i2@67@00 in [0..3]) | live]
; [else-branch: 39 | i2@67@00 in [0..3] | live]
(push) ; 6
; [then-branch: 39 | !(i2@67@00 in [0..3])]
(assert (not (Seq_contains (Seq_range 0 3) i2@67@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 39 | i2@67@00 in [0..3]]
(assert (Seq_contains (Seq_range 0 3) i2@67@00))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 3) i2@67@00)
  (not (Seq_contains (Seq_range 0 3) i2@67@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 3) i1@66@00)
  (and
    (Seq_contains (Seq_range 0 3) i1@66@00)
    (or
      (Seq_contains (Seq_range 0 3) i2@67@00)
      (not (Seq_contains (Seq_range 0 3) i2@67@00))))))
(assert (or
  (Seq_contains (Seq_range 0 3) i1@66@00)
  (not (Seq_contains (Seq_range 0 3) i1@66@00))))
(push) ; 3
; [then-branch: 40 | i1@66@00 in [0..3] && i2@67@00 in [0..3] && i1@66@00 != i2@67@00 | live]
; [else-branch: 40 | !(i1@66@00 in [0..3] && i2@67@00 in [0..3] && i1@66@00 != i2@67@00) | live]
(push) ; 4
; [then-branch: 40 | i1@66@00 in [0..3] && i2@67@00 in [0..3] && i1@66@00 != i2@67@00]
(assert (and
  (Seq_contains (Seq_range 0 3) i1@66@00)
  (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@66@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@66@00 (Seq_length xs@16@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@67@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@67@00 (Seq_length xs@16@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 40 | !(i1@66@00 in [0..3] && i2@67@00 in [0..3] && i1@66@00 != i2@67@00)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 3) i1@66@00)
    (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 3) i1@66@00)
    (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))
  (and
    (Seq_contains (Seq_range 0 3) i1@66@00)
    (Seq_contains (Seq_range 0 3) i2@67@00)
    (not (= i1@66@00 i2@67@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00)))))
  (and
    (Seq_contains (Seq_range 0 3) i1@66@00)
    (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@66@00 Int) (i2@67@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@67@00)
          (not (Seq_contains (Seq_range 0 3) i2@67@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (not (Seq_contains (Seq_range 0 3) i1@66@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (Seq_contains (Seq_range 0 3) i2@67@00)
        (not (= i1@66@00 i2@67@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@66@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@67@00)
            (not (= i1@66@00 i2@67@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@66@00) (Seq_contains
    (Seq_range 0 3)
    i2@67@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@66@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@67@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100-aux|)))
(assert (forall ((i1@66@00 Int) (i2@67@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@67@00)
          (not (Seq_contains (Seq_range 0 3) i2@67@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (not (Seq_contains (Seq_range 0 3) i1@66@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (Seq_contains (Seq_range 0 3) i2@67@00)
        (not (= i1@66@00 i2@67@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@66@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@67@00)
            (not (= i1@66@00 i2@67@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@66@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@67@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100-aux|)))
(assert (forall ((i1@66@00 Int) (i2@67@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@67@00)
          (not (Seq_contains (Seq_range 0 3) i2@67@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (not (Seq_contains (Seq_range 0 3) i1@66@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (Seq_contains (Seq_range 0 3) i2@67@00)
        (not (= i1@66@00 i2@67@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@66@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@67@00)
            (not (= i1@66@00 i2@67@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@66@00) (Seq_index xs@16@00 i2@67@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@66@00) (Seq_index
    xs@16@00
    i2@67@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100-aux|)))
(assert (forall ((i1@66@00 Int) (i2@67@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@67@00)
          (not (Seq_contains (Seq_range 0 3) i2@67@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (not (Seq_contains (Seq_range 0 3) i1@66@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (Seq_contains (Seq_range 0 3) i2@67@00)
        (not (= i1@66@00 i2@67@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@66@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@67@00)
            (not (= i1@66@00 i2@67@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@66@00) (Seq_index
    xs@16@00
    i2@67@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100-aux|)))
(assert (forall ((i1@66@00 Int) (i2@67@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@67@00)
          (not (Seq_contains (Seq_range 0 3) i2@67@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (not (Seq_contains (Seq_range 0 3) i1@66@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (Seq_contains (Seq_range 0 3) i2@67@00)
        (not (= i1@66@00 i2@67@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@66@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@67@00)
            (not (= i1@66@00 i2@67@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))))
  :pattern ((Seq_contains (Seq_range 0 3) i2@67@00) (Seq_index xs@16@00 i1@66@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@67@00) (Seq_index
    xs@16@00
    i1@66@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100-aux|)))
(assert (forall ((i1@66@00 Int) (i2@67@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@67@00)
          (not (Seq_contains (Seq_range 0 3) i2@67@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (not (Seq_contains (Seq_range 0 3) i1@66@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (Seq_contains (Seq_range 0 3) i2@67@00)
        (not (= i1@66@00 i2@67@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@66@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@67@00)
            (not (= i1@66@00 i2@67@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@67@00) (Seq_index
    xs@16@00
    i1@66@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100-aux|)))
(assert (forall ((i1@66@00 Int) (i2@67@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (or
          (Seq_contains (Seq_range 0 3) i2@67@00)
          (not (Seq_contains (Seq_range 0 3) i2@67@00)))))
    (or
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (not (Seq_contains (Seq_range 0 3) i1@66@00)))
    (=>
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (Seq_contains (Seq_range 0 3) i2@67@00)
        (not (= i1@66@00 i2@67@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 3) i1@66@00)
          (and
            (Seq_contains (Seq_range 0 3) i2@67@00)
            (not (= i1@66@00 i2@67@00)))))
      (and
        (Seq_contains (Seq_range 0 3) i1@66@00)
        (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))))
  :pattern ((Seq_index xs@16@00 i1@66@00) (Seq_index xs@16@00 i2@67@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100-aux|)))
(assert (forall ((i1@66@00 Int) (i2@67@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 3) i1@66@00)
      (and (Seq_contains (Seq_range 0 3) i2@67@00) (not (= i1@66@00 i2@67@00))))
    (not (= (Seq_index xs@16@00 i1@66@00) (Seq_index xs@16@00 i2@67@00))))
  :pattern ((Seq_contains (Seq_range 0 3) i1@66@00) (Seq_contains
    (Seq_range 0 3)
    i2@67@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@66@00) (Seq_contains_trigger
    (Seq_range 0 3)
    i2@67@00))
  :pattern ((Seq_contains (Seq_range 0 3) i1@66@00) (Seq_index xs@16@00 i2@67@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i1@66@00) (Seq_index
    xs@16@00
    i2@67@00))
  :pattern ((Seq_contains (Seq_range 0 3) i2@67@00) (Seq_index xs@16@00 i1@66@00))
  :pattern ((Seq_contains_trigger (Seq_range 0 3) i2@67@00) (Seq_index
    xs@16@00
    i1@66@00))
  :pattern ((Seq_index xs@16@00 i1@66@00) (Seq_index xs@16@00 i2@67@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0139.vpr@132@12@132@100|)))
(declare-const k@68@00 Int)
(push) ; 2
; [eval] 0 <= k && k < 3
; [eval] 0 <= k
(push) ; 3
; [then-branch: 41 | !(0 <= k@68@00) | live]
; [else-branch: 41 | 0 <= k@68@00 | live]
(push) ; 4
; [then-branch: 41 | !(0 <= k@68@00)]
(assert (not (<= 0 k@68@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 41 | 0 <= k@68@00]
(assert (<= 0 k@68@00))
; [eval] k < 3
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@68@00) (not (<= 0 k@68@00))))
(assert (and (<= 0 k@68@00) (< k@68@00 3)))
; [eval] xs[k]
(push) ; 3
(assert (not (>= k@68@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@68@00 (Seq_length xs@16@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@69@00 ($Snap $Ref Int Seq<$Ref> $Ref) Int)
(declare-fun img@70@00 ($Snap $Ref Int Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@68@00 Int)) (!
  (=>
    (and (<= 0 k@68@00) (< k@68@00 3))
    (or (<= 0 k@68@00) (not (<= 0 k@68@00))))
  :pattern ((Seq_index xs@16@00 k@68@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@68@00 Int) (k2@68@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@68@00) (< k1@68@00 3))
      (and (<= 0 k2@68@00) (< k2@68@00 3))
      (= (Seq_index xs@16@00 k1@68@00) (Seq_index xs@16@00 k2@68@00)))
    (= k1@68@00 k2@68@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@68@00 Int)) (!
  (=>
    (and (<= 0 k@68@00) (< k@68@00 3))
    (and
      (=
        (inv@69@00 s@$ x@14@00 i@15@00 xs@16@00 (Seq_index xs@16@00 k@68@00))
        k@68@00)
      (img@70@00 s@$ x@14@00 i@15@00 xs@16@00 (Seq_index xs@16@00 k@68@00))))
  :pattern ((Seq_index xs@16@00 k@68@00))
  :qid |quant-u-37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@00 s@$ x@14@00 i@15@00 xs@16@00 r)
      (and
        (<= 0 (inv@69@00 s@$ x@14@00 i@15@00 xs@16@00 r))
        (< (inv@69@00 s@$ x@14@00 i@15@00 xs@16@00 r) 3)))
    (= (Seq_index xs@16@00 (inv@69@00 s@$ x@14@00 i@15@00 xs@16@00 r)) r))
  :pattern ((inv@69@00 s@$ x@14@00 i@15@00 xs@16@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@68@00 Int)) (!
  (=>
    (and (<= 0 k@68@00) (< k@68@00 3))
    (not (= (Seq_index xs@16@00 k@68@00) $Ref.null)))
  :pattern ((Seq_index xs@16@00 k@68@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
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
