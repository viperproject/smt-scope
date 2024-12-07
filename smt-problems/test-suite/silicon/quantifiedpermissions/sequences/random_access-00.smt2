(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:19:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr
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
(declare-fun exp_ ($Snap Int Int Int) Int)
(declare-fun exp%limited ($Snap Int Int Int) Int)
(declare-fun exp%stateless (Int Int Int) Bool)
(declare-fun exp%precondition ($Snap Int Int Int) Bool)
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
(assert (forall ((s@$ $Snap) (a@0@00 Int) (i@1@00 Int) (b@2@00 Int)) (!
  (= (exp%limited s@$ a@0@00 i@1@00 b@2@00) (exp_ s@$ a@0@00 i@1@00 b@2@00))
  :pattern ((exp_ s@$ a@0@00 i@1@00 b@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (i@1@00 Int) (b@2@00 Int)) (!
  (exp%stateless a@0@00 i@1@00 b@2@00)
  :pattern ((exp%limited s@$ a@0@00 i@1@00 b@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (i@1@00 Int) (b@2@00 Int)) (!
  (=>
    (exp%precondition s@$ a@0@00 i@1@00 b@2@00)
    (= (exp_ s@$ a@0@00 i@1@00 b@2@00) (+ a@0@00 (* i@1@00 b@2@00))))
  :pattern ((exp_ s@$ a@0@00 i@1@00 b@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (i@1@00 Int) (b@2@00 Int)) (!
  true
  :pattern ((exp_ s@$ a@0@00 i@1@00 b@2@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const s@0@01 Seq<$Ref>)
(declare-const a@1@01 Int)
(declare-const b@2@01 Int)
(declare-const n@3@01 Int)
(declare-const s@4@01 Seq<$Ref>)
(declare-const a@5@01 Int)
(declare-const b@6@01 Int)
(declare-const n@7@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] 0 <= a
(assert (<= 0 a@5@01))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] 0 < b
(assert (< 0 b@6@01))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] 0 < n
(assert (< 0 n@7@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] a + n * b < |s|
; [eval] a + n * b
; [eval] n * b
; [eval] |s|
(assert (< (+ a@5@01 (* n@7@01 b@6@01)) (Seq_length s@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var j: Int
(declare-const j@9@01 Int)
; [exec]
; inhale 0 <= j && j < n
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.first $t@10@01) $Snap.unit))
; [eval] 0 <= j
(assert (<= 0 j@9@01))
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] j < n
(assert (< j@9@01 n@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..n)), (i2 in [0..n)) }
;     (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==>
;     s[a + i1 * b] != s[a + i2 * b])
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..n)), (i2 in [0..n)) } (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> s[a + i1 * b] != s[a + i2 * b])
(declare-const i1@12@01 Int)
(declare-const i2@13@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> s[a + i1 * b] != s[a + i2 * b]
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2)
; [eval] (i1 in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 0 | !(i1@12@01 in [0..n@7@01]) | live]
; [else-branch: 0 | i1@12@01 in [0..n@7@01] | live]
(push) ; 5
; [then-branch: 0 | !(i1@12@01 in [0..n@7@01])]
(assert (not (Seq_contains (Seq_range 0 n@7@01) i1@12@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i1@12@01 in [0..n@7@01]]
(assert (Seq_contains (Seq_range 0 n@7@01) i1@12@01))
; [eval] (i2 in [0..n))
; [eval] [0..n)
(push) ; 6
; [then-branch: 1 | !(i2@13@01 in [0..n@7@01]) | live]
; [else-branch: 1 | i2@13@01 in [0..n@7@01] | live]
(push) ; 7
; [then-branch: 1 | !(i2@13@01 in [0..n@7@01])]
(assert (not (Seq_contains (Seq_range 0 n@7@01) i2@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i2@13@01 in [0..n@7@01]]
(assert (Seq_contains (Seq_range 0 n@7@01) i2@13@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
  (not (Seq_contains (Seq_range 0 n@7@01) i2@13@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
  (and
    (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
    (or
      (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
      (not (Seq_contains (Seq_range 0 n@7@01) i2@13@01))))))
(assert (or
  (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
  (not (Seq_contains (Seq_range 0 n@7@01) i1@12@01))))
(push) ; 4
; [then-branch: 2 | i1@12@01 in [0..n@7@01] && i2@13@01 in [0..n@7@01] && i1@12@01 != i2@13@01 | live]
; [else-branch: 2 | !(i1@12@01 in [0..n@7@01] && i2@13@01 in [0..n@7@01] && i1@12@01 != i2@13@01) | live]
(push) ; 5
; [then-branch: 2 | i1@12@01 in [0..n@7@01] && i2@13@01 in [0..n@7@01] && i1@12@01 != i2@13@01]
(assert (and
  (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
  (and (Seq_contains (Seq_range 0 n@7@01) i2@13@01) (not (= i1@12@01 i2@13@01)))))
; [eval] s[a + i1 * b] != s[a + i2 * b]
; [eval] s[a + i1 * b]
; [eval] a + i1 * b
; [eval] i1 * b
(push) ; 6
(assert (not (>= (+ a@5@01 (* i1@12@01 b@6@01)) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ a@5@01 (* i1@12@01 b@6@01)) (Seq_length s@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] s[a + i2 * b]
; [eval] a + i2 * b
; [eval] i2 * b
(push) ; 6
(assert (not (>= (+ a@5@01 (* i2@13@01 b@6@01)) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ a@5@01 (* i2@13@01 b@6@01)) (Seq_length s@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(i1@12@01 in [0..n@7@01] && i2@13@01 in [0..n@7@01] && i1@12@01 != i2@13@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
    (and
      (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
      (not (= i1@12@01 i2@13@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
    (and
      (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
      (not (= i1@12@01 i2@13@01))))
  (and
    (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
    (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
    (not (= i1@12@01 i2@13@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
      (and
        (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
        (not (= i1@12@01 i2@13@01)))))
  (and
    (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
    (and
      (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
      (not (= i1@12@01 i2@13@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@12@01 Int) (i2@13@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
      (and
        (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
        (or
          (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
          (not (Seq_contains (Seq_range 0 n@7@01) i2@13@01)))))
    (or
      (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
      (not (Seq_contains (Seq_range 0 n@7@01) i1@12@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
        (and
          (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
          (not (= i1@12@01 i2@13@01))))
      (and
        (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
        (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
        (not (= i1@12@01 i2@13@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
          (and
            (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
            (not (= i1@12@01 i2@13@01)))))
      (and
        (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
        (and
          (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
          (not (= i1@12@01 i2@13@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@7@01) i1@12@01) (Seq_contains
    (Seq_range 0 n@7@01)
    i2@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@7@01) i1@12@01) (Seq_contains_trigger
    (Seq_range 0 n@7@01)
    i2@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@13@10@13@137-aux|)))
(assert (forall ((i1@12@01 Int) (i2@13@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
      (and
        (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
        (or
          (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
          (not (Seq_contains (Seq_range 0 n@7@01) i2@13@01)))))
    (or
      (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
      (not (Seq_contains (Seq_range 0 n@7@01) i1@12@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
        (and
          (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
          (not (= i1@12@01 i2@13@01))))
      (and
        (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
        (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
        (not (= i1@12@01 i2@13@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
          (and
            (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
            (not (= i1@12@01 i2@13@01)))))
      (and
        (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
        (and
          (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
          (not (= i1@12@01 i2@13@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@7@01) i1@12@01) (Seq_contains_trigger
    (Seq_range 0 n@7@01)
    i2@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@13@10@13@137-aux|)))
(assert (forall ((i1@12@01 Int) (i2@13@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@7@01) i1@12@01)
      (and
        (Seq_contains (Seq_range 0 n@7@01) i2@13@01)
        (not (= i1@12@01 i2@13@01))))
    (not
      (=
        (Seq_index s@4@01 (+ a@5@01 (* i1@12@01 b@6@01)))
        (Seq_index s@4@01 (+ a@5@01 (* i2@13@01 b@6@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@7@01) i1@12@01) (Seq_contains
    (Seq_range 0 n@7@01)
    i2@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@7@01) i1@12@01) (Seq_contains_trigger
    (Seq_range 0 n@7@01)
    i2@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@13@10@13@137|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { (i in [0..n)) }
;     (i in [0..n)) ==> acc(s[a + i * b].f, write))
(declare-const i@14@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@7@01) i@14@01))
; [eval] s[a + i * b]
; [eval] a + i * b
; [eval] i * b
(push) ; 4
(assert (not (>= (+ a@5@01 (* i@14@01 b@6@01)) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ a@5@01 (* i@14@01 b@6@01)) (Seq_length s@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@15@01 $FVF<f>)
(declare-fun inv@16@01 ($Ref) Int)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@14@01 Int) (i2@14@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@7@01) i1@14@01)
      (Seq_contains (Seq_range 0 n@7@01) i2@14@01)
      (=
        (Seq_index s@4@01 (+ a@5@01 (* i1@14@01 b@6@01)))
        (Seq_index s@4@01 (+ a@5@01 (* i2@14@01 b@6@01)))))
    (= i1@14@01 i2@14@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@14@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@7@01) i@14@01)
    (and
      (= (inv@16@01 (Seq_index s@4@01 (+ a@5@01 (* i@14@01 b@6@01)))) i@14@01)
      (img@17@01 (Seq_index s@4@01 (+ a@5@01 (* i@14@01 b@6@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@7@01) i@14@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@7@01) i@14@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (Seq_contains (Seq_range 0 n@7@01) (inv@16@01 r)))
    (= (Seq_index s@4@01 (+ a@5@01 (* (inv@16@01 r) b@6@01))) r))
  :pattern ((inv@16@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@14@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@7@01) i@14@01)
    (not (= (Seq_index s@4@01 (+ a@5@01 (* i@14@01 b@6@01))) $Ref.null)))
  :pattern ((Seq_contains (Seq_range 0 n@7@01) i@14@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@7@01) i@14@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert s[a + j * b] != null
; [eval] s[a + j * b] != null
; [eval] s[a + j * b]
; [eval] a + j * b
; [eval] j * b
(set-option :timeout 0)
(push) ; 3
(assert (not (>= (+ a@5@01 (* j@9@01 b@6@01)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< (+ a@5@01 (* j@9@01 b@6@01)) (Seq_length s@4@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not (= (Seq_index s@4@01 (+ a@5@01 (* j@9@01 b@6@01))) $Ref.null))))
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
(declare-const sm@18@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (Seq_contains (Seq_range 0 n@7@01) (inv@16@01 r)))
    (= ($FVF.lookup_f (as sm@18@01  $FVF<f>) r) ($FVF.lookup_f $t@15@01 r)))
  :pattern (($FVF.lookup_f (as sm@18@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@15@01 r))
  :qid |qp.fvfValDef0|)))
(declare-const pm@19@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@19@01  $FPM) r)
    (ite
      (and (img@17@01 r) (Seq_contains (Seq_range 0 n@7@01) (inv@16@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@19@01  $FPM) r))
  :qid |qp.resPrmSumDef1|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@19@01  $FPM) r) $Perm.Write)
  :pattern ((inv@16@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] s[a + j * b] != null
; [eval] s[a + j * b]
; [eval] a + j * b
; [eval] j * b
(set-option :timeout 0)
(push) ; 3
(assert (not (>= (+ a@5@01 (* j@9@01 b@6@01)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< (+ a@5@01 (* j@9@01 b@6@01)) (Seq_length s@4@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not (= (Seq_index s@4@01 (+ a@5@01 (* j@9@01 b@6@01))) $Ref.null))))
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
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (Seq_contains (Seq_range 0 n@7@01) (inv@16@01 r)))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@15@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@15@01 r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@21@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@21@01  $FPM) r)
    (ite
      (and (img@17@01 r) (Seq_contains (Seq_range 0 n@7@01) (inv@16@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@21@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@21@01  $FPM) r) $Perm.Write)
  :pattern ((inv@16@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] s[a + j * b] != null
; [eval] s[a + j * b]
; [eval] a + j * b
; [eval] j * b
(set-option :timeout 0)
(push) ; 3
(assert (not (>= (+ a@5@01 (* j@9@01 b@6@01)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< (+ a@5@01 (* j@9@01 b@6@01)) (Seq_length s@4@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not (= (Seq_index s@4@01 (+ a@5@01 (* j@9@01 b@6@01))) $Ref.null))))
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
; [eval] s[a + j * b] != null
; [eval] s[a + j * b]
; [eval] a + j * b
; [eval] j * b
(set-option :timeout 0)
(push) ; 3
(assert (not (>= (+ a@5@01 (* j@9@01 b@6@01)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< (+ a@5@01 (* j@9@01 b@6@01)) (Seq_length s@4@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not (= (Seq_index s@4@01 (+ a@5@01 (* j@9@01 b@6@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const s@22@01 Seq<$Ref>)
(declare-const a@23@01 Int)
(declare-const b@24@01 Int)
(declare-const n@25@01 Int)
(declare-const s@26@01 Seq<$Ref>)
(declare-const a@27@01 Int)
(declare-const b@28@01 Int)
(declare-const n@29@01 Int)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.first $t@30@01) $Snap.unit))
; [eval] 0 <= a
(assert (<= 0 a@27@01))
(assert (=
  ($Snap.second $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@30@01))
    ($Snap.second ($Snap.second $t@30@01)))))
(assert (= ($Snap.first ($Snap.second $t@30@01)) $Snap.unit))
; [eval] 0 < b
(assert (< 0 b@28@01))
(assert (=
  ($Snap.second ($Snap.second $t@30@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@30@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@30@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@30@01))) $Snap.unit))
; [eval] 0 < n
(assert (< 0 n@29@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@30@01))) $Snap.unit))
; [eval] a + n * b < |s|
; [eval] a + n * b
; [eval] n * b
; [eval] |s|
(assert (< (+ a@27@01 (* n@29@01 b@28@01)) (Seq_length s@26@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var j: Int
(declare-const j@31@01 Int)
; [exec]
; inhale 0 <= j && j < n
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (= ($Snap.first $t@32@01) $Snap.unit))
; [eval] 0 <= j
(assert (<= 0 j@31@01))
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; [eval] j < n
(assert (< j@31@01 n@29@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int ::
;     { (i in [0..n)) }
;     (i in [0..n)) ==> exp(a, i, b) < |s|)
; [eval] (forall i: Int :: { (i in [0..n)) } (i in [0..n)) ==> exp(a, i, b) < |s|)
(declare-const i@33@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n)) ==> exp(a, i, b) < |s|
; [eval] (i in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 3 | i@33@01 in [0..n@29@01] | live]
; [else-branch: 3 | !(i@33@01 in [0..n@29@01]) | live]
(push) ; 5
; [then-branch: 3 | i@33@01 in [0..n@29@01]]
(assert (Seq_contains (Seq_range 0 n@29@01) i@33@01))
; [eval] exp(a, i, b) < |s|
; [eval] exp(a, i, b)
(push) ; 6
(assert (exp%precondition $Snap.unit a@27@01 i@33@01 b@28@01))
(pop) ; 6
; Joined path conditions
(assert (exp%precondition $Snap.unit a@27@01 i@33@01 b@28@01))
; [eval] |s|
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(i@33@01 in [0..n@29@01])]
(assert (not (Seq_contains (Seq_range 0 n@29@01) i@33@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@29@01) i@33@01)
  (and
    (Seq_contains (Seq_range 0 n@29@01) i@33@01)
    (exp%precondition $Snap.unit a@27@01 i@33@01 b@28@01))))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 n@29@01) i@33@01))
  (Seq_contains (Seq_range 0 n@29@01) i@33@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@33@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@29@01) i@33@01)
      (and
        (Seq_contains (Seq_range 0 n@29@01) i@33@01)
        (exp%precondition $Snap.unit a@27@01 i@33@01 b@28@01)))
    (or
      (not (Seq_contains (Seq_range 0 n@29@01) i@33@01))
      (Seq_contains (Seq_range 0 n@29@01) i@33@01)))
  :pattern ((Seq_contains (Seq_range 0 n@29@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@46@10@46@75-aux|)))
(assert (forall ((i@33@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@29@01) i@33@01)
      (and
        (Seq_contains (Seq_range 0 n@29@01) i@33@01)
        (exp%precondition $Snap.unit a@27@01 i@33@01 b@28@01)))
    (or
      (not (Seq_contains (Seq_range 0 n@29@01) i@33@01))
      (Seq_contains (Seq_range 0 n@29@01) i@33@01)))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@46@10@46@75-aux|)))
(assert (forall ((i@33@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@29@01) i@33@01)
    (exp%precondition $Snap.unit a@27@01 i@33@01 b@28@01))
  :pattern ((Seq_contains (Seq_range 0 n@29@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@46@10@46@75_precondition|)))
(push) ; 3
(assert (not (forall ((i@33@01 Int)) (!
  (=>
    (and
      (=>
        (Seq_contains (Seq_range 0 n@29@01) i@33@01)
        (exp%precondition $Snap.unit a@27@01 i@33@01 b@28@01))
      (Seq_contains (Seq_range 0 n@29@01) i@33@01))
    (< (exp_ $Snap.unit a@27@01 i@33@01 b@28@01) (Seq_length s@26@01)))
  :pattern ((Seq_contains (Seq_range 0 n@29@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@46@10@46@75|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@33@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@29@01) i@33@01)
    (< (exp_ $Snap.unit a@27@01 i@33@01 b@28@01) (Seq_length s@26@01)))
  :pattern ((Seq_contains (Seq_range 0 n@29@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@46@10@46@75|)))
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..n)), (i2 in [0..n)) }
;     (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==>
;     s[exp(a, i1, b)] != s[exp(a, i2, b)])
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..n)), (i2 in [0..n)) } (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> s[exp(a, i1, b)] != s[exp(a, i2, b)])
(declare-const i1@35@01 Int)
(declare-const i2@36@01 Int)
(push) ; 3
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> s[exp(a, i1, b)] != s[exp(a, i2, b)]
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2)
; [eval] (i1 in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 4 | !(i1@35@01 in [0..n@29@01]) | live]
; [else-branch: 4 | i1@35@01 in [0..n@29@01] | live]
(push) ; 5
; [then-branch: 4 | !(i1@35@01 in [0..n@29@01])]
(assert (not (Seq_contains (Seq_range 0 n@29@01) i1@35@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | i1@35@01 in [0..n@29@01]]
(assert (Seq_contains (Seq_range 0 n@29@01) i1@35@01))
; [eval] (i2 in [0..n))
; [eval] [0..n)
(push) ; 6
; [then-branch: 5 | !(i2@36@01 in [0..n@29@01]) | live]
; [else-branch: 5 | i2@36@01 in [0..n@29@01] | live]
(push) ; 7
; [then-branch: 5 | !(i2@36@01 in [0..n@29@01])]
(assert (not (Seq_contains (Seq_range 0 n@29@01) i2@36@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | i2@36@01 in [0..n@29@01]]
(assert (Seq_contains (Seq_range 0 n@29@01) i2@36@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
  (not (Seq_contains (Seq_range 0 n@29@01) i2@36@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
  (and
    (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
    (or
      (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
      (not (Seq_contains (Seq_range 0 n@29@01) i2@36@01))))))
(assert (or
  (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
  (not (Seq_contains (Seq_range 0 n@29@01) i1@35@01))))
(push) ; 4
; [then-branch: 6 | i1@35@01 in [0..n@29@01] && i2@36@01 in [0..n@29@01] && i1@35@01 != i2@36@01 | live]
; [else-branch: 6 | !(i1@35@01 in [0..n@29@01] && i2@36@01 in [0..n@29@01] && i1@35@01 != i2@36@01) | live]
(push) ; 5
; [then-branch: 6 | i1@35@01 in [0..n@29@01] && i2@36@01 in [0..n@29@01] && i1@35@01 != i2@36@01]
(assert (and
  (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
  (and (Seq_contains (Seq_range 0 n@29@01) i2@36@01) (not (= i1@35@01 i2@36@01)))))
; [eval] s[exp(a, i1, b)] != s[exp(a, i2, b)]
; [eval] s[exp(a, i1, b)]
; [eval] exp(a, i1, b)
(push) ; 6
(assert (exp%precondition $Snap.unit a@27@01 i1@35@01 b@28@01))
(pop) ; 6
; Joined path conditions
(assert (exp%precondition $Snap.unit a@27@01 i1@35@01 b@28@01))
(push) ; 6
(assert (not (>= (exp_ $Snap.unit a@27@01 i1@35@01 b@28@01) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (exp_ $Snap.unit a@27@01 i1@35@01 b@28@01) (Seq_length s@26@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] s[exp(a, i2, b)]
; [eval] exp(a, i2, b)
(push) ; 6
(assert (exp%precondition $Snap.unit a@27@01 i2@36@01 b@28@01))
(pop) ; 6
; Joined path conditions
(assert (exp%precondition $Snap.unit a@27@01 i2@36@01 b@28@01))
(push) ; 6
(assert (not (>= (exp_ $Snap.unit a@27@01 i2@36@01 b@28@01) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (exp_ $Snap.unit a@27@01 i2@36@01 b@28@01) (Seq_length s@26@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(i1@35@01 in [0..n@29@01] && i2@36@01 in [0..n@29@01] && i1@35@01 != i2@36@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
    (and
      (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
      (not (= i1@35@01 i2@36@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
    (and
      (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
      (not (= i1@35@01 i2@36@01))))
  (and
    (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
    (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
    (not (= i1@35@01 i2@36@01))
    (exp%precondition $Snap.unit a@27@01 i1@35@01 b@28@01)
    (exp%precondition $Snap.unit a@27@01 i2@36@01 b@28@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
      (and
        (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
        (not (= i1@35@01 i2@36@01)))))
  (and
    (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
    (and
      (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
      (not (= i1@35@01 i2@36@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@35@01 Int) (i2@36@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
      (and
        (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
        (or
          (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
          (not (Seq_contains (Seq_range 0 n@29@01) i2@36@01)))))
    (or
      (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
      (not (Seq_contains (Seq_range 0 n@29@01) i1@35@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
        (and
          (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
          (not (= i1@35@01 i2@36@01))))
      (and
        (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
        (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
        (not (= i1@35@01 i2@36@01))
        (exp%precondition $Snap.unit a@27@01 i1@35@01 b@28@01)
        (exp%precondition $Snap.unit a@27@01 i2@36@01 b@28@01)))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
          (and
            (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
            (not (= i1@35@01 i2@36@01)))))
      (and
        (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
        (and
          (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
          (not (= i1@35@01 i2@36@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@29@01) i1@35@01) (Seq_contains
    (Seq_range 0 n@29@01)
    i2@36@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i1@35@01) (Seq_contains_trigger
    (Seq_range 0 n@29@01)
    i2@36@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@47@10@47@147-aux|)))
(assert (forall ((i1@35@01 Int) (i2@36@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
      (and
        (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
        (or
          (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
          (not (Seq_contains (Seq_range 0 n@29@01) i2@36@01)))))
    (or
      (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
      (not (Seq_contains (Seq_range 0 n@29@01) i1@35@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
        (and
          (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
          (not (= i1@35@01 i2@36@01))))
      (and
        (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
        (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
        (not (= i1@35@01 i2@36@01))
        (exp%precondition $Snap.unit a@27@01 i1@35@01 b@28@01)
        (exp%precondition $Snap.unit a@27@01 i2@36@01 b@28@01)))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
          (and
            (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
            (not (= i1@35@01 i2@36@01)))))
      (and
        (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
        (and
          (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
          (not (= i1@35@01 i2@36@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i1@35@01) (Seq_contains_trigger
    (Seq_range 0 n@29@01)
    i2@36@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@47@10@47@147-aux|)))
(assert (forall ((i1@35@01 Int) (i2@36@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@29@01) i1@35@01)
      (and
        (Seq_contains (Seq_range 0 n@29@01) i2@36@01)
        (not (= i1@35@01 i2@36@01))))
    (not
      (=
        (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i1@35@01 b@28@01))
        (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i2@36@01 b@28@01)))))
  :pattern ((Seq_contains (Seq_range 0 n@29@01) i1@35@01) (Seq_contains
    (Seq_range 0 n@29@01)
    i2@36@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@29@01) i1@35@01) (Seq_contains_trigger
    (Seq_range 0 n@29@01)
    i2@36@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@47@10@47@147|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [0..n)) ==> acc(s[exp(a, i, b)].f, write))
(declare-const i@37@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@29@01) i@37@01))
; [eval] s[exp(a, i, b)]
; [eval] exp(a, i, b)
(push) ; 4
(assert (exp%precondition $Snap.unit a@27@01 i@37@01 b@28@01))
(pop) ; 4
; Joined path conditions
(assert (exp%precondition $Snap.unit a@27@01 i@37@01 b@28@01))
(push) ; 4
(assert (not (>= (exp_ $Snap.unit a@27@01 i@37@01 b@28@01) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (exp_ $Snap.unit a@27@01 i@37@01 b@28@01) (Seq_length s@26@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@38@01 $FVF<f>)
(declare-fun inv@39@01 ($Ref) Int)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@29@01) i@37@01)
    (exp%precondition $Snap.unit a@27@01 i@37@01 b@28@01))
  :pattern ((Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i@37@01 b@28@01)))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((i1@37@01 Int) (i2@37@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@29@01) i1@37@01)
      (Seq_contains (Seq_range 0 n@29@01) i2@37@01))
    (and
      (exp%precondition $Snap.unit a@27@01 i1@37@01 b@28@01)
      (exp%precondition $Snap.unit a@27@01 i2@37@01 b@28@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((i1@37@01 Int) (i2@37@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@29@01) i1@37@01)
      (Seq_contains (Seq_range 0 n@29@01) i2@37@01)
      (=
        (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i1@37@01 b@28@01))
        (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i2@37@01 b@28@01))))
    (= i1@37@01 i2@37@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@29@01) i@37@01)
    (and
      (exp%precondition $Snap.unit a@27@01 i@37@01 b@28@01)
      (=>
        (=
          (inv@39@01 (Seq_index
            s@26@01
            (exp_ $Snap.unit a@27@01 i@37@01 b@28@01)))
          i@37@01)
        (exp%precondition $Snap.unit a@27@01 i@37@01 b@28@01))))
  :pattern ((Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i@37@01 b@28@01)))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Seq_contains (Seq_range 0 n@29@01) (inv@39@01 r)))
    (exp%precondition $Snap.unit a@27@01 (inv@39@01 r) b@28@01))
  :pattern ((inv@39@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@29@01) i@37@01)
    (and
      (=
        (inv@39@01 (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i@37@01 b@28@01)))
        i@37@01)
      (img@40@01 (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i@37@01 b@28@01)))))
  :pattern ((Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i@37@01 b@28@01)))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Seq_contains (Seq_range 0 n@29@01) (inv@39@01 r)))
    (= (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 (inv@39@01 r) b@28@01)) r))
  :pattern ((inv@39@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@29@01) i@37@01)
    (not
      (= (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i@37@01 b@28@01)) $Ref.null)))
  :pattern ((Seq_index s@26@01 (exp_ $Snap.unit a@27@01 i@37@01 b@28@01)))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert s[exp(a, j, b)] != null
; [eval] s[exp(a, j, b)] != null
; [eval] s[exp(a, j, b)]
; [eval] exp(a, j, b)
(set-option :timeout 0)
(push) ; 3
(assert (exp%precondition $Snap.unit a@27@01 j@31@01 b@28@01))
(pop) ; 3
; Joined path conditions
(assert (exp%precondition $Snap.unit a@27@01 j@31@01 b@28@01))
(push) ; 3
(assert (not (>= (exp_ $Snap.unit a@27@01 j@31@01 b@28@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< (exp_ $Snap.unit a@27@01 j@31@01 b@28@01) (Seq_length s@26@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not (= (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 j@31@01 b@28@01)) $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index s@26@01 (exp_ $Snap.unit a@27@01 j@31@01 b@28@01)) $Ref.null)))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const s@41@01 Seq<$Ref>)
(declare-const a@42@01 Int)
(declare-const b@43@01 Int)
(declare-const s@44@01 Seq<$Ref>)
(declare-const a@45@01 Int)
(declare-const b@46@01 Int)
(push) ; 1
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 ($Snap.combine ($Snap.first $t@47@01) ($Snap.second $t@47@01))))
(assert (= ($Snap.first $t@47@01) $Snap.unit))
; [eval] 0 <= a
(assert (<= 0 a@45@01))
(assert (=
  ($Snap.second $t@47@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@47@01))
    ($Snap.second ($Snap.second $t@47@01)))))
(assert (= ($Snap.first ($Snap.second $t@47@01)) $Snap.unit))
; [eval] 0 < b
(assert (< 0 b@46@01))
(assert (=
  ($Snap.second ($Snap.second $t@47@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@47@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@47@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@47@01))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [a..|s|)), (j in [a..|s|)) } { (i in [a..|s|)), s[j] } { (j in [a..|s|)), s[i] } { s[i], s[j] } (i in [a..|s|)) && ((i - a) % b == 0 && ((j in [a..|s|)) && ((j - a) % b == 0 && i != j))) ==> s[i] != s[j])
(declare-const i@48@01 Int)
(declare-const j@49@01 Int)
(push) ; 2
; [eval] (i in [a..|s|)) && ((i - a) % b == 0 && ((j in [a..|s|)) && ((j - a) % b == 0 && i != j))) ==> s[i] != s[j]
; [eval] (i in [a..|s|)) && ((i - a) % b == 0 && ((j in [a..|s|)) && ((j - a) % b == 0 && i != j)))
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 3
; [then-branch: 7 | !(i@48@01 in [a@45@01..|s@44@01|]) | live]
; [else-branch: 7 | i@48@01 in [a@45@01..|s@44@01|] | live]
(push) ; 4
; [then-branch: 7 | !(i@48@01 in [a@45@01..|s@44@01|])]
(assert (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | i@48@01 in [a@45@01..|s@44@01|]]
(assert (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 5
(assert (not (not (= b@46@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 8 | i@48@01 - a@45@01 % b@46@01 != 0 | live]
; [else-branch: 8 | i@48@01 - a@45@01 % b@46@01 == 0 | live]
(push) ; 6
; [then-branch: 8 | i@48@01 - a@45@01 % b@46@01 != 0]
(assert (not (= (mod (- i@48@01 a@45@01) b@46@01) 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | i@48@01 - a@45@01 % b@46@01 == 0]
(assert (= (mod (- i@48@01 a@45@01) b@46@01) 0))
; [eval] (j in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 7
; [then-branch: 9 | !(j@49@01 in [a@45@01..|s@44@01|]) | live]
; [else-branch: 9 | j@49@01 in [a@45@01..|s@44@01|] | live]
(push) ; 8
; [then-branch: 9 | !(j@49@01 in [a@45@01..|s@44@01|])]
(assert (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 9 | j@49@01 in [a@45@01..|s@44@01|]]
(assert (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01))
; [eval] (j - a) % b == 0
; [eval] (j - a) % b
; [eval] j - a
(push) ; 9
(assert (not (not (= b@46@01 0))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
; [then-branch: 10 | j@49@01 - a@45@01 % b@46@01 != 0 | live]
; [else-branch: 10 | j@49@01 - a@45@01 % b@46@01 == 0 | live]
(push) ; 10
; [then-branch: 10 | j@49@01 - a@45@01 % b@46@01 != 0]
(assert (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 10 | j@49@01 - a@45@01 % b@46@01 == 0]
(assert (= (mod (- j@49@01 a@45@01) b@46@01) 0))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (= (mod (- j@49@01 a@45@01) b@46@01) 0)
  (not (= (mod (- j@49@01 a@45@01) b@46@01) 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
  (and
    (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
    (or
      (= (mod (- j@49@01 a@45@01) b@46@01) 0)
      (not (= (mod (- j@49@01 a@45@01) b@46@01) 0))))))
(assert (or
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
  (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (mod (- i@48@01 a@45@01) b@46@01) 0)
  (and
    (= (mod (- i@48@01 a@45@01) b@46@01) 0)
    (=>
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (or
          (= (mod (- j@49@01 a@45@01) b@46@01) 0)
          (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01))))))
(assert (or
  (= (mod (- i@48@01 a@45@01) b@46@01) 0)
  (not (= (mod (- i@48@01 a@45@01) b@46@01) 0))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
  (and
    (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
    (=>
      (= (mod (- i@48@01 a@45@01) b@46@01) 0)
      (and
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (=>
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (or
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))))
        (or
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
          (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)))))
    (or
      (= (mod (- i@48@01 a@45@01) b@46@01) 0)
      (not (= (mod (- i@48@01 a@45@01) b@46@01) 0))))))
(assert (or
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
  (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01))))
(push) ; 3
; [then-branch: 11 | i@48@01 in [a@45@01..|s@44@01|] && i@48@01 - a@45@01 % b@46@01 == 0 && j@49@01 in [a@45@01..|s@44@01|] && j@49@01 - a@45@01 % b@46@01 == 0 && i@48@01 != j@49@01 | live]
; [else-branch: 11 | !(i@48@01 in [a@45@01..|s@44@01|] && i@48@01 - a@45@01 % b@46@01 == 0 && j@49@01 in [a@45@01..|s@44@01|] && j@49@01 - a@45@01 % b@46@01 == 0 && i@48@01 != j@49@01) | live]
(push) ; 4
; [then-branch: 11 | i@48@01 in [a@45@01..|s@44@01|] && i@48@01 - a@45@01 % b@46@01 == 0 && j@49@01 in [a@45@01..|s@44@01|] && j@49@01 - a@45@01 % b@46@01 == 0 && i@48@01 != j@49@01]
(assert (and
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
  (and
    (= (mod (- i@48@01 a@45@01) b@46@01) 0)
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
      (and (= (mod (- j@49@01 a@45@01) b@46@01) 0) (not (= i@48@01 j@49@01)))))))
; [eval] s[i] != s[j]
; [eval] s[i]
(push) ; 5
(assert (not (>= i@48@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@48@01 (Seq_length s@44@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] s[j]
(push) ; 5
(assert (not (>= j@49@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@49@01 (Seq_length s@44@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 11 | !(i@48@01 in [a@45@01..|s@44@01|] && i@48@01 - a@45@01 % b@46@01 == 0 && j@49@01 in [a@45@01..|s@44@01|] && j@49@01 - a@45@01 % b@46@01 == 0 && i@48@01 != j@49@01)]
(assert (not
  (and
    (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
    (and
      (= (mod (- i@48@01 a@45@01) b@46@01) 0)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (and (= (mod (- j@49@01 a@45@01) b@46@01) 0) (not (= i@48@01 j@49@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
    (and
      (= (mod (- i@48@01 a@45@01) b@46@01) 0)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (and (= (mod (- j@49@01 a@45@01) b@46@01) 0) (not (= i@48@01 j@49@01))))))
  (and
    (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
    (= (mod (- i@48@01 a@45@01) b@46@01) 0)
    (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
    (= (mod (- j@49@01 a@45@01) b@46@01) 0)
    (not (= i@48@01 j@49@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (and
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
          (and (= (mod (- j@49@01 a@45@01) b@46@01) 0) (not (= i@48@01 j@49@01)))))))
  (and
    (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
    (and
      (= (mod (- i@48@01 a@45@01) b@46@01) 0)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (and (= (mod (- j@49@01 a@45@01) b@46@01) 0) (not (= i@48@01 j@49@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@48@01 Int) (j@49@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (=>
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (=>
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
                (or
                  (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                  (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))))
            (or
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (not
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)))))
        (or
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (not (= (mod (- i@48@01 a@45@01) b@46@01) 0)))))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (= (mod (- j@49@01 a@45@01) b@46@01) 0)
        (not (= i@48@01 j@49@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (and
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                (not (= i@48@01 j@49@01)))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))))
  :pattern ((Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01) (Seq_contains
    (Seq_range a@45@01 (Seq_length s@44@01))
    j@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    i@48@01) (Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    j@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@63@12@63@134-aux|)))
(assert (forall ((i@48@01 Int) (j@49@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (=>
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (=>
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
                (or
                  (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                  (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))))
            (or
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (not
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)))))
        (or
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (not (= (mod (- i@48@01 a@45@01) b@46@01) 0)))))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (= (mod (- j@49@01 a@45@01) b@46@01) 0)
        (not (= i@48@01 j@49@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (and
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                (not (= i@48@01 j@49@01)))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))))
  :pattern ((Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    i@48@01) (Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    j@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@63@12@63@134-aux|)))
(assert (forall ((i@48@01 Int) (j@49@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (=>
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (=>
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
                (or
                  (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                  (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))))
            (or
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (not
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)))))
        (or
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (not (= (mod (- i@48@01 a@45@01) b@46@01) 0)))))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (= (mod (- j@49@01 a@45@01) b@46@01) 0)
        (not (= i@48@01 j@49@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (and
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                (not (= i@48@01 j@49@01)))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))))
  :pattern ((Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01) (Seq_index
    s@44@01
    j@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    i@48@01) (Seq_index s@44@01 j@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@63@12@63@134-aux|)))
(assert (forall ((i@48@01 Int) (j@49@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (=>
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (=>
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
                (or
                  (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                  (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))))
            (or
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (not
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)))))
        (or
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (not (= (mod (- i@48@01 a@45@01) b@46@01) 0)))))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (= (mod (- j@49@01 a@45@01) b@46@01) 0)
        (not (= i@48@01 j@49@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (and
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                (not (= i@48@01 j@49@01)))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))))
  :pattern ((Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    i@48@01) (Seq_index s@44@01 j@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@63@12@63@134-aux|)))
(assert (forall ((i@48@01 Int) (j@49@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (=>
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (=>
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
                (or
                  (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                  (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))))
            (or
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (not
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)))))
        (or
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (not (= (mod (- i@48@01 a@45@01) b@46@01) 0)))))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (= (mod (- j@49@01 a@45@01) b@46@01) 0)
        (not (= i@48@01 j@49@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (and
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                (not (= i@48@01 j@49@01)))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))))
  :pattern ((Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01) (Seq_index
    s@44@01
    i@48@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    j@49@01) (Seq_index s@44@01 i@48@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@63@12@63@134-aux|)))
(assert (forall ((i@48@01 Int) (j@49@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (=>
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (=>
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
                (or
                  (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                  (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))))
            (or
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (not
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)))))
        (or
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (not (= (mod (- i@48@01 a@45@01) b@46@01) 0)))))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (= (mod (- j@49@01 a@45@01) b@46@01) 0)
        (not (= i@48@01 j@49@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (and
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                (not (= i@48@01 j@49@01)))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))))
  :pattern ((Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    j@49@01) (Seq_index s@44@01 i@48@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@63@12@63@134-aux|)))
(assert (forall ((i@48@01 Int) (j@49@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (=>
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (=>
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
                (or
                  (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                  (not (= (mod (- j@49@01 a@45@01) b@46@01) 0)))))
            (or
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (not
                (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)))))
        (or
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (not (= (mod (- i@48@01 a@45@01) b@46@01) 0)))))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
        (= (mod (- j@49@01 a@45@01) b@46@01) 0)
        (not (= i@48@01 j@49@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
          (and
            (= (mod (- i@48@01 a@45@01) b@46@01) 0)
            (and
              (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
              (and
                (= (mod (- j@49@01 a@45@01) b@46@01) 0)
                (not (= i@48@01 j@49@01)))))))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
        (and
          (= (mod (- i@48@01 a@45@01) b@46@01) 0)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
            (and
              (= (mod (- j@49@01 a@45@01) b@46@01) 0)
              (not (= i@48@01 j@49@01))))))))
  :pattern ((Seq_index s@44@01 i@48@01) (Seq_index s@44@01 j@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@63@12@63@134-aux|)))
(assert (forall ((i@48@01 Int) (j@49@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01)
      (and
        (= (mod (- i@48@01 a@45@01) b@46@01) 0)
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01)
          (and (= (mod (- j@49@01 a@45@01) b@46@01) 0) (not (= i@48@01 j@49@01))))))
    (not (= (Seq_index s@44@01 i@48@01) (Seq_index s@44@01 j@49@01))))
  :pattern ((Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01) (Seq_contains
    (Seq_range a@45@01 (Seq_length s@44@01))
    j@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    i@48@01) (Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    j@49@01))
  :pattern ((Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@48@01) (Seq_index
    s@44@01
    j@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    i@48@01) (Seq_index s@44@01 j@49@01))
  :pattern ((Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@49@01) (Seq_index
    s@44@01
    i@48@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@45@01 (Seq_length s@44@01))
    j@49@01) (Seq_index s@44@01 i@48@01))
  :pattern ((Seq_index s@44@01 i@48@01) (Seq_index s@44@01 j@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@63@12@63@134|)))
(declare-const i@50@01 Int)
(push) ; 2
; [eval] (i in [a..|s|)) && (i - a) % b == 0
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 3
; [then-branch: 12 | !(i@50@01 in [a@45@01..|s@44@01|]) | live]
; [else-branch: 12 | i@50@01 in [a@45@01..|s@44@01|] | live]
(push) ; 4
; [then-branch: 12 | !(i@50@01 in [a@45@01..|s@44@01|])]
(assert (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | i@50@01 in [a@45@01..|s@44@01|]]
(assert (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 5
(assert (not (not (= b@46@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01)
  (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01))))
(assert (and
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01)
  (= (mod (- i@50@01 a@45@01) b@46@01) 0)))
; [eval] s[i]
(push) ; 3
(assert (not (>= i@50@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@50@01 (Seq_length s@44@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@51@01 ($Ref) Int)
(declare-fun img@52@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@50@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01)
      (= (mod (- i@50@01 a@45@01) b@46@01) 0))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01))))
  :pattern ((Seq_index s@44@01 i@50@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@50@01 Int) (i2@50@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i1@50@01)
        (= (mod (- i1@50@01 a@45@01) b@46@01) 0))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i2@50@01)
        (= (mod (- i2@50@01 a@45@01) b@46@01) 0))
      (= (Seq_index s@44@01 i1@50@01) (Seq_index s@44@01 i2@50@01)))
    (= i1@50@01 i2@50@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@50@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01)
      (= (mod (- i@50@01 a@45@01) b@46@01) 0))
    (and
      (= (inv@51@01 (Seq_index s@44@01 i@50@01)) i@50@01)
      (img@52@01 (Seq_index s@44@01 i@50@01))))
  :pattern ((Seq_index s@44@01 i@50@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@01 r)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@51@01 r))
        (= (mod (- (inv@51@01 r) a@45@01) b@46@01) 0)))
    (= (Seq_index s@44@01 (inv@51@01 r)) r))
  :pattern ((inv@51@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@50@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@50@01)
      (= (mod (- i@50@01 a@45@01) b@46@01) 0))
    (not (= (Seq_index s@44@01 i@50@01) $Ref.null)))
  :pattern ((Seq_index s@44@01 i@50@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var j: Int
(declare-const j@53@01 Int)
; [exec]
; j := a
(declare-const j@54@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(assert (= ($Snap.first $t@55@01) $Snap.unit))
; [eval] a <= j
(assert (<= a@45@01 j@54@01))
(assert (=
  ($Snap.second $t@55@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@55@01))
    ($Snap.second ($Snap.second $t@55@01)))))
(assert (= ($Snap.first ($Snap.second $t@55@01)) $Snap.unit))
; [eval] (j - a) % b == 0
; [eval] (j - a) % b
; [eval] j - a
(push) ; 4
(assert (not (not (= b@46@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (mod (- j@54@01 a@45@01) b@46@01) 0))
(declare-const i@56@01 Int)
(push) ; 4
; [eval] (i in [a..|s|)) && (i - a) % b == 0
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 5
; [then-branch: 13 | !(i@56@01 in [a@45@01..|s@44@01|]) | live]
; [else-branch: 13 | i@56@01 in [a@45@01..|s@44@01|] | live]
(push) ; 6
; [then-branch: 13 | !(i@56@01 in [a@45@01..|s@44@01|])]
(assert (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | i@56@01 in [a@45@01..|s@44@01|]]
(assert (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 7
(assert (not (not (= b@46@01 0))))
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
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
  (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01))))
(assert (and
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
  (= (mod (- i@56@01 a@45@01) b@46@01) 0)))
; [eval] s[i]
(push) ; 5
(assert (not (>= i@56@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@56@01 (Seq_length s@44@01))))
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
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
      (= (mod (- i@56@01 a@45@01) b@46@01) 0))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01))))
  :pattern ((Seq_index s@44@01 i@56@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@56@01 Int) (i2@56@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i1@56@01)
        (= (mod (- i1@56@01 a@45@01) b@46@01) 0))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i2@56@01)
        (= (mod (- i2@56@01 a@45@01) b@46@01) 0))
      (= (Seq_index s@44@01 i1@56@01) (Seq_index s@44@01 i2@56@01)))
    (= i1@56@01 i2@56@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
      (= (mod (- i@56@01 a@45@01) b@46@01) 0))
    (and
      (= (inv@57@01 (Seq_index s@44@01 i@56@01)) i@56@01)
      (img@58@01 (Seq_index s@44@01 i@56@01))))
  :pattern ((Seq_index s@44@01 i@56@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@57@01 r))
        (= (mod (- (inv@57@01 r) a@45@01) b@46@01) 0)))
    (= (Seq_index s@44@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
      (= (mod (- i@56@01 a@45@01) b@46@01) 0))
    (not (= (Seq_index s@44@01 i@56@01) $Ref.null)))
  :pattern ((Seq_index s@44@01 i@56@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] a <= j
; [eval] (j - a) % b == 0
; [eval] (j - a) % b
; [eval] j - a
(push) ; 4
(assert (not (not (= b@46@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (= (mod 0 b@46@01) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (mod 0 b@46@01) 0))
(declare-const i@59@01 Int)
(push) ; 4
; [eval] (i in [a..|s|)) && (i - a) % b == 0
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 5
; [then-branch: 14 | !(i@59@01 in [a@45@01..|s@44@01|]) | live]
; [else-branch: 14 | i@59@01 in [a@45@01..|s@44@01|] | live]
(push) ; 6
; [then-branch: 14 | !(i@59@01 in [a@45@01..|s@44@01|])]
(assert (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@59@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | i@59@01 in [a@45@01..|s@44@01|]]
(assert (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@59@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 7
(assert (not (not (= b@46@01 0))))
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
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@59@01)
  (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@59@01))))
(assert (and
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@59@01)
  (= (mod (- i@59@01 a@45@01) b@46@01) 0)))
; [eval] s[i]
(push) ; 5
(assert (not (>= i@59@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@59@01 (Seq_length s@44@01))))
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
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@59@01)
      (= (mod (- i@59@01 a@45@01) b@46@01) 0))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@59@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@59@01))))
  :pattern ((Seq_index s@44@01 i@59@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@59@01 Int) (i2@59@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i1@59@01)
        (= (mod (- i1@59@01 a@45@01) b@46@01) 0))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i2@59@01)
        (= (mod (- i2@59@01 a@45@01) b@46@01) 0))
      (= (Seq_index s@44@01 i1@59@01) (Seq_index s@44@01 i2@59@01)))
    (= i1@59@01 i2@59@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@59@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@59@01)
      (= (mod (- i@59@01 a@45@01) b@46@01) 0))
    (and
      (= (inv@60@01 (Seq_index s@44@01 i@59@01)) i@59@01)
      (img@61@01 (Seq_index s@44@01 i@59@01))))
  :pattern ((Seq_index s@44@01 i@59@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@61@01 r)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@60@01 r))
        (= (mod (- (inv@60@01 r) a@45@01) b@46@01) 0)))
    (= (Seq_index s@44@01 (inv@60@01 r)) r))
  :pattern ((inv@60@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@60@01 r))
        (= (mod (- (inv@60@01 r) a@45@01) b@46@01) 0))
      (img@61@01 r)
      (= r (Seq_index s@44@01 (inv@60@01 r))))
    ($Perm.min
      (ite
        (and
          (img@52@01 r)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@51@01 r))
            (= (mod (- (inv@51@01 r) a@45@01) b@46@01) 0)))
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
          (img@52@01 r)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@51@01 r))
            (= (mod (- (inv@51@01 r) a@45@01) b@46@01) 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@62@01 r))
    $Perm.No)
  
  :qid |quant-u-14|))))
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
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@60@01 r))
        (= (mod (- (inv@60@01 r) a@45@01) b@46@01) 0))
      (img@61@01 r)
      (= r (Seq_index s@44@01 (inv@60@01 r))))
    (= (- $Perm.Write (pTaken@62@01 r)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@01 r)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@51@01 r))
        (= (mod (- (inv@51@01 r) a@45@01) b@46@01) 0)))
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@47@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@47@01)))) r))
  :qid |qp.fvfValDef4|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@57@01 r))
        (= (mod (- (inv@57@01 r) a@45@01) b@46@01) 0)))
    (= (Seq_index s@44@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
      (= (mod (- i@56@01 a@45@01) b@46@01) 0))
    (and
      (= (inv@57@01 (Seq_index s@44@01 i@56@01)) i@56@01)
      (img@58@01 (Seq_index s@44@01 i@56@01))))
  :pattern ((Seq_index s@44@01 i@56@01))
  :qid |quant-u-11|)))
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
      (= (mod (- i@56@01 a@45@01) b@46@01) 0))
    (not (= (Seq_index s@44@01 i@56@01) $Ref.null)))
  :pattern ((Seq_index s@44@01 i@56@01))
  :qid |f-permImpliesNonNull|)))
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(assert (= ($Snap.first $t@55@01) $Snap.unit))
(assert (<= a@45@01 j@54@01))
(assert (=
  ($Snap.second $t@55@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@55@01))
    ($Snap.second ($Snap.second $t@55@01)))))
(assert (= ($Snap.first ($Snap.second $t@55@01)) $Snap.unit))
(assert (= (mod (- j@54@01 a@45@01) b@46@01) 0))
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
      (= (mod (- i@56@01 a@45@01) b@46@01) 0))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@56@01))))
  :pattern ((Seq_index s@44@01 i@56@01))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] j < |s|
; [eval] |s|
(pop) ; 5
(push) ; 5
; [eval] !(j < |s|)
; [eval] j < |s|
; [eval] |s|
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] j < |s|
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< j@54@01 (Seq_length s@44@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< j@54@01 (Seq_length s@44@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | j@54@01 < |s@44@01| | live]
; [else-branch: 15 | !(j@54@01 < |s@44@01|) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | j@54@01 < |s@44@01|]
(assert (< j@54@01 (Seq_length s@44@01)))
; [exec]
; assert (j in [a..|s|))
; [eval] (j in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 6
(assert (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@54@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) j@54@01))
; [exec]
; assert (j - a) % b == 0
; [eval] (j - a) % b == 0
; [eval] (j - a) % b
; [eval] j - a
(push) ; 6
(assert (not (not (= b@46@01 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [exec]
; s[j].f := j
; [eval] s[j]
(push) ; 6
(assert (not (>= j@54@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index s@44@01 j@54@01))
    ($Perm.min
      (ite
        (and
          (img@58@01 r)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@57@01 r))
            (= (mod (- (inv@57@01 r) a@45@01) b@46@01) 0)))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@58@01 r)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@57@01 r))
            (= (mod (- (inv@57@01 r) a@45@01) b@46@01) 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@64@01 r))
    $Perm.No)
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@64@01 r) $Perm.No)
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index s@44@01 j@54@01))
    (= (- $Perm.Write (pTaken@64@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@65@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@65@01  $FVF<f>) (Seq_index s@44@01 j@54@01)) j@54@01))
; [exec]
; j := j + b
; [eval] j + b
(declare-const j@66@01 Int)
(assert (= j@66@01 (+ j@54@01 b@46@01)))
; [exec]
; inhale (j - a) % b == 0
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 $Snap.unit))
; [eval] (j - a) % b == 0
; [eval] (j - a) % b
; [eval] j - a
(set-option :timeout 0)
(push) ; 6
(assert (not (not (= b@46@01 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (mod (- j@66@01 a@45@01) b@46@01) 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
; [eval] a <= j
(set-option :timeout 0)
(push) ; 6
(assert (not (<= a@45@01 j@66@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= a@45@01 j@66@01))
; [eval] (j - a) % b == 0
; [eval] (j - a) % b
; [eval] j - a
(push) ; 6
(assert (not (not (= b@46@01 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const i@68@01 Int)
(push) ; 6
; [eval] (i in [a..|s|)) && (i - a) % b == 0
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 7
; [then-branch: 16 | !(i@68@01 in [a@45@01..|s@44@01|]) | live]
; [else-branch: 16 | i@68@01 in [a@45@01..|s@44@01|] | live]
(push) ; 8
; [then-branch: 16 | !(i@68@01 in [a@45@01..|s@44@01|])]
(assert (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@68@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 16 | i@68@01 in [a@45@01..|s@44@01|]]
(assert (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@68@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 9
(assert (not (not (= b@46@01 0))))
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
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@68@01)
  (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@68@01))))
(assert (and
  (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@68@01)
  (= (mod (- i@68@01 a@45@01) b@46@01) 0)))
; [eval] s[i]
(push) ; 7
(assert (not (>= i@68@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@68@01 (Seq_length s@44@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@69@01 ($Ref) Int)
(declare-fun img@70@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@68@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@68@01)
      (= (mod (- i@68@01 a@45@01) b@46@01) 0))
    (or
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@68@01)
      (not (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@68@01))))
  :pattern ((Seq_index s@44@01 i@68@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@68@01 Int) (i2@68@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i1@68@01)
        (= (mod (- i1@68@01 a@45@01) b@46@01) 0))
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i2@68@01)
        (= (mod (- i2@68@01 a@45@01) b@46@01) 0))
      (= (Seq_index s@44@01 i1@68@01) (Seq_index s@44@01 i2@68@01)))
    (= i1@68@01 i2@68@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@68@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) i@68@01)
      (= (mod (- i@68@01 a@45@01) b@46@01) 0))
    (and
      (= (inv@69@01 (Seq_index s@44@01 i@68@01)) i@68@01)
      (img@70@01 (Seq_index s@44@01 i@68@01))))
  :pattern ((Seq_index s@44@01 i@68@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@01 r)
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@69@01 r))
        (= (mod (- (inv@69@01 r) a@45@01) b@46@01) 0)))
    (= (Seq_index s@44@01 (inv@69@01 r)) r))
  :pattern ((inv@69@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@71@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@69@01 r))
        (= (mod (- (inv@69@01 r) a@45@01) b@46@01) 0))
      (img@70@01 r)
      (= r (Seq_index s@44@01 (inv@69@01 r))))
    ($Perm.min
      (ite
        (and
          (img@58@01 r)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@57@01 r))
            (= (mod (- (inv@57@01 r) a@45@01) b@46@01) 0)))
        (- $Perm.Write (pTaken@64@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@72@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@69@01 r))
        (= (mod (- (inv@69@01 r) a@45@01) b@46@01) 0))
      (img@70@01 r)
      (= r (Seq_index s@44@01 (inv@69@01 r))))
    ($Perm.min
      (ite (= r (Seq_index s@44@01 j@54@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@71@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@58@01 r)
          (and
            (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@57@01 r))
            (= (mod (- (inv@57@01 r) a@45@01) b@46@01) 0)))
        (- $Perm.Write (pTaken@64@01 r))
        $Perm.No)
      (pTaken@71@01 r))
    $Perm.No)
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@69@01 r))
        (= (mod (- (inv@69@01 r) a@45@01) b@46@01) 0))
      (img@70@01 r)
      (= r (Seq_index s@44@01 (inv@69@01 r))))
    (= (- $Perm.Write (pTaken@71@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index s@44@01 j@54@01) (Seq_index s@44@01 j@54@01))
      $Perm.Write
      $Perm.No)
    (pTaken@72@01 (Seq_index s@44@01 j@54@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@69@01 r))
        (= (mod (- (inv@69@01 r) a@45@01) b@46@01) 0))
      (img@70@01 r)
      (= r (Seq_index s@44@01 (inv@69@01 r))))
    (= (- (- $Perm.Write (pTaken@71@01 r)) (pTaken@72@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@73@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index s@44@01 j@54@01))
    (=
      ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@58@01 r)
        (and
          (Seq_contains (Seq_range a@45@01 (Seq_length s@44@01)) (inv@57@01 r))
          (= (mod (- (inv@57@01 r) a@45@01) b@46@01) 0)))
      (< $Perm.No (- $Perm.Write (pTaken@64@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@55@01))) r)))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@55@01))) r))
  :qid |qp.fvfValDef6|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 15 | !(j@54@01 < |s@44@01|)]
(assert (not (< j@54@01 (Seq_length s@44@01))))
(pop) ; 5
; [eval] !(j < |s|)
; [eval] j < |s|
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (< j@54@01 (Seq_length s@44@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< j@54@01 (Seq_length s@44@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | !(j@54@01 < |s@44@01|) | live]
; [else-branch: 17 | j@54@01 < |s@44@01| | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | !(j@54@01 < |s@44@01|)]
(assert (not (< j@54@01 (Seq_length s@44@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | j@54@01 < |s@44@01|]
(assert (< j@54@01 (Seq_length s@44@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const s@74@01 Seq<$Ref>)
(declare-const a@75@01 Int)
(declare-const b@76@01 Int)
(declare-const s@77@01 Seq<$Ref>)
(declare-const a@78@01 Int)
(declare-const b@79@01 Int)
(push) ; 1
(declare-const $t@80@01 $Snap)
(assert (= $t@80@01 ($Snap.combine ($Snap.first $t@80@01) ($Snap.second $t@80@01))))
(assert (= ($Snap.first $t@80@01) $Snap.unit))
; [eval] 0 <= a
(assert (<= 0 a@78@01))
(assert (=
  ($Snap.second $t@80@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@80@01))
    ($Snap.second ($Snap.second $t@80@01)))))
(assert (= ($Snap.first ($Snap.second $t@80@01)) $Snap.unit))
; [eval] 0 < b
(assert (< 0 b@79@01))
(assert (=
  ($Snap.second ($Snap.second $t@80@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@80@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@80@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@80@01))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [a..|s|)), (j in [a..|s|)) } { (i in [a..|s|)), s[j] } { (j in [a..|s|)), s[i] } { s[i], s[j] } (i in [a..|s|)) && ((i - a) % b == 0 && ((j in [a..|s|)) && ((j - a) % b == 0 && i != j))) ==> s[i] != s[j])
(declare-const i@81@01 Int)
(declare-const j@82@01 Int)
(push) ; 2
; [eval] (i in [a..|s|)) && ((i - a) % b == 0 && ((j in [a..|s|)) && ((j - a) % b == 0 && i != j))) ==> s[i] != s[j]
; [eval] (i in [a..|s|)) && ((i - a) % b == 0 && ((j in [a..|s|)) && ((j - a) % b == 0 && i != j)))
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 3
; [then-branch: 18 | !(i@81@01 in [a@78@01..|s@77@01|]) | live]
; [else-branch: 18 | i@81@01 in [a@78@01..|s@77@01|] | live]
(push) ; 4
; [then-branch: 18 | !(i@81@01 in [a@78@01..|s@77@01|])]
(assert (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 18 | i@81@01 in [a@78@01..|s@77@01|]]
(assert (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 5
(assert (not (not (= b@79@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 19 | i@81@01 - a@78@01 % b@79@01 != 0 | live]
; [else-branch: 19 | i@81@01 - a@78@01 % b@79@01 == 0 | live]
(push) ; 6
; [then-branch: 19 | i@81@01 - a@78@01 % b@79@01 != 0]
(assert (not (= (mod (- i@81@01 a@78@01) b@79@01) 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 19 | i@81@01 - a@78@01 % b@79@01 == 0]
(assert (= (mod (- i@81@01 a@78@01) b@79@01) 0))
; [eval] (j in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 7
; [then-branch: 20 | !(j@82@01 in [a@78@01..|s@77@01|]) | live]
; [else-branch: 20 | j@82@01 in [a@78@01..|s@77@01|] | live]
(push) ; 8
; [then-branch: 20 | !(j@82@01 in [a@78@01..|s@77@01|])]
(assert (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 20 | j@82@01 in [a@78@01..|s@77@01|]]
(assert (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01))
; [eval] (j - a) % b == 0
; [eval] (j - a) % b
; [eval] j - a
(push) ; 9
(assert (not (not (= b@79@01 0))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
; [then-branch: 21 | j@82@01 - a@78@01 % b@79@01 != 0 | live]
; [else-branch: 21 | j@82@01 - a@78@01 % b@79@01 == 0 | live]
(push) ; 10
; [then-branch: 21 | j@82@01 - a@78@01 % b@79@01 != 0]
(assert (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 21 | j@82@01 - a@78@01 % b@79@01 == 0]
(assert (= (mod (- j@82@01 a@78@01) b@79@01) 0))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (= (mod (- j@82@01 a@78@01) b@79@01) 0)
  (not (= (mod (- j@82@01 a@78@01) b@79@01) 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
  (and
    (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
    (or
      (= (mod (- j@82@01 a@78@01) b@79@01) 0)
      (not (= (mod (- j@82@01 a@78@01) b@79@01) 0))))))
(assert (or
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
  (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (mod (- i@81@01 a@78@01) b@79@01) 0)
  (and
    (= (mod (- i@81@01 a@78@01) b@79@01) 0)
    (=>
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (or
          (= (mod (- j@82@01 a@78@01) b@79@01) 0)
          (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01))))))
(assert (or
  (= (mod (- i@81@01 a@78@01) b@79@01) 0)
  (not (= (mod (- i@81@01 a@78@01) b@79@01) 0))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
  (and
    (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
    (=>
      (= (mod (- i@81@01 a@78@01) b@79@01) 0)
      (and
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (=>
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (or
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))))
        (or
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
          (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)))))
    (or
      (= (mod (- i@81@01 a@78@01) b@79@01) 0)
      (not (= (mod (- i@81@01 a@78@01) b@79@01) 0))))))
(assert (or
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
  (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01))))
(push) ; 3
; [then-branch: 22 | i@81@01 in [a@78@01..|s@77@01|] && i@81@01 - a@78@01 % b@79@01 == 0 && j@82@01 in [a@78@01..|s@77@01|] && j@82@01 - a@78@01 % b@79@01 == 0 && i@81@01 != j@82@01 | live]
; [else-branch: 22 | !(i@81@01 in [a@78@01..|s@77@01|] && i@81@01 - a@78@01 % b@79@01 == 0 && j@82@01 in [a@78@01..|s@77@01|] && j@82@01 - a@78@01 % b@79@01 == 0 && i@81@01 != j@82@01) | live]
(push) ; 4
; [then-branch: 22 | i@81@01 in [a@78@01..|s@77@01|] && i@81@01 - a@78@01 % b@79@01 == 0 && j@82@01 in [a@78@01..|s@77@01|] && j@82@01 - a@78@01 % b@79@01 == 0 && i@81@01 != j@82@01]
(assert (and
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
  (and
    (= (mod (- i@81@01 a@78@01) b@79@01) 0)
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
      (and (= (mod (- j@82@01 a@78@01) b@79@01) 0) (not (= i@81@01 j@82@01)))))))
; [eval] s[i] != s[j]
; [eval] s[i]
(push) ; 5
(assert (not (>= i@81@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@81@01 (Seq_length s@77@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] s[j]
(push) ; 5
(assert (not (>= j@82@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@82@01 (Seq_length s@77@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 22 | !(i@81@01 in [a@78@01..|s@77@01|] && i@81@01 - a@78@01 % b@79@01 == 0 && j@82@01 in [a@78@01..|s@77@01|] && j@82@01 - a@78@01 % b@79@01 == 0 && i@81@01 != j@82@01)]
(assert (not
  (and
    (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
    (and
      (= (mod (- i@81@01 a@78@01) b@79@01) 0)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (and (= (mod (- j@82@01 a@78@01) b@79@01) 0) (not (= i@81@01 j@82@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
    (and
      (= (mod (- i@81@01 a@78@01) b@79@01) 0)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (and (= (mod (- j@82@01 a@78@01) b@79@01) 0) (not (= i@81@01 j@82@01))))))
  (and
    (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
    (= (mod (- i@81@01 a@78@01) b@79@01) 0)
    (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
    (= (mod (- j@82@01 a@78@01) b@79@01) 0)
    (not (= i@81@01 j@82@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (and
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
          (and (= (mod (- j@82@01 a@78@01) b@79@01) 0) (not (= i@81@01 j@82@01)))))))
  (and
    (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
    (and
      (= (mod (- i@81@01 a@78@01) b@79@01) 0)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (and (= (mod (- j@82@01 a@78@01) b@79@01) 0) (not (= i@81@01 j@82@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (=>
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (=>
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
                (or
                  (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                  (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))))
            (or
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (not
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)))))
        (or
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (not (= (mod (- i@81@01 a@78@01) b@79@01) 0)))))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (= (mod (- j@82@01 a@78@01) b@79@01) 0)
        (not (= i@81@01 j@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (and
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                (not (= i@81@01 j@82@01)))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))))
  :pattern ((Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01) (Seq_contains
    (Seq_range a@78@01 (Seq_length s@77@01))
    j@82@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    i@81@01) (Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@85@12@85@134-aux|)))
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (=>
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (=>
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
                (or
                  (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                  (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))))
            (or
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (not
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)))))
        (or
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (not (= (mod (- i@81@01 a@78@01) b@79@01) 0)))))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (= (mod (- j@82@01 a@78@01) b@79@01) 0)
        (not (= i@81@01 j@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (and
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                (not (= i@81@01 j@82@01)))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))))
  :pattern ((Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    i@81@01) (Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@85@12@85@134-aux|)))
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (=>
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (=>
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
                (or
                  (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                  (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))))
            (or
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (not
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)))))
        (or
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (not (= (mod (- i@81@01 a@78@01) b@79@01) 0)))))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (= (mod (- j@82@01 a@78@01) b@79@01) 0)
        (not (= i@81@01 j@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (and
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                (not (= i@81@01 j@82@01)))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))))
  :pattern ((Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01) (Seq_index
    s@77@01
    j@82@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    i@81@01) (Seq_index s@77@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@85@12@85@134-aux|)))
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (=>
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (=>
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
                (or
                  (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                  (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))))
            (or
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (not
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)))))
        (or
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (not (= (mod (- i@81@01 a@78@01) b@79@01) 0)))))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (= (mod (- j@82@01 a@78@01) b@79@01) 0)
        (not (= i@81@01 j@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (and
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                (not (= i@81@01 j@82@01)))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))))
  :pattern ((Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    i@81@01) (Seq_index s@77@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@85@12@85@134-aux|)))
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (=>
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (=>
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
                (or
                  (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                  (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))))
            (or
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (not
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)))))
        (or
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (not (= (mod (- i@81@01 a@78@01) b@79@01) 0)))))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (= (mod (- j@82@01 a@78@01) b@79@01) 0)
        (not (= i@81@01 j@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (and
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                (not (= i@81@01 j@82@01)))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))))
  :pattern ((Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01) (Seq_index
    s@77@01
    i@81@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    j@82@01) (Seq_index s@77@01 i@81@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@85@12@85@134-aux|)))
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (=>
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (=>
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
                (or
                  (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                  (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))))
            (or
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (not
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)))))
        (or
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (not (= (mod (- i@81@01 a@78@01) b@79@01) 0)))))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (= (mod (- j@82@01 a@78@01) b@79@01) 0)
        (not (= i@81@01 j@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (and
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                (not (= i@81@01 j@82@01)))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))))
  :pattern ((Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    j@82@01) (Seq_index s@77@01 i@81@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@85@12@85@134-aux|)))
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (=>
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (=>
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
                (or
                  (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                  (not (= (mod (- j@82@01 a@78@01) b@79@01) 0)))))
            (or
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (not
                (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)))))
        (or
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (not (= (mod (- i@81@01 a@78@01) b@79@01) 0)))))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)))
    (=>
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
        (= (mod (- j@82@01 a@78@01) b@79@01) 0)
        (not (= i@81@01 j@82@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
          (and
            (= (mod (- i@81@01 a@78@01) b@79@01) 0)
            (and
              (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
              (and
                (= (mod (- j@82@01 a@78@01) b@79@01) 0)
                (not (= i@81@01 j@82@01)))))))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
        (and
          (= (mod (- i@81@01 a@78@01) b@79@01) 0)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
            (and
              (= (mod (- j@82@01 a@78@01) b@79@01) 0)
              (not (= i@81@01 j@82@01))))))))
  :pattern ((Seq_index s@77@01 i@81@01) (Seq_index s@77@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@85@12@85@134-aux|)))
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01)
      (and
        (= (mod (- i@81@01 a@78@01) b@79@01) 0)
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01)
          (and (= (mod (- j@82@01 a@78@01) b@79@01) 0) (not (= i@81@01 j@82@01))))))
    (not (= (Seq_index s@77@01 i@81@01) (Seq_index s@77@01 j@82@01))))
  :pattern ((Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01) (Seq_contains
    (Seq_range a@78@01 (Seq_length s@77@01))
    j@82@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    i@81@01) (Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    j@82@01))
  :pattern ((Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@81@01) (Seq_index
    s@77@01
    j@82@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    i@81@01) (Seq_index s@77@01 j@82@01))
  :pattern ((Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) j@82@01) (Seq_index
    s@77@01
    i@81@01))
  :pattern ((Seq_contains_trigger
    (Seq_range a@78@01 (Seq_length s@77@01))
    j@82@01) (Seq_index s@77@01 i@81@01))
  :pattern ((Seq_index s@77@01 i@81@01) (Seq_index s@77@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/random_access.vpr@85@12@85@134|)))
(declare-const i@83@01 Int)
(push) ; 2
; [eval] (i in [a..|s|)) && (i - a) % b == 0
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 3
; [then-branch: 23 | !(i@83@01 in [a@78@01..|s@77@01|]) | live]
; [else-branch: 23 | i@83@01 in [a@78@01..|s@77@01|] | live]
(push) ; 4
; [then-branch: 23 | !(i@83@01 in [a@78@01..|s@77@01|])]
(assert (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 23 | i@83@01 in [a@78@01..|s@77@01|]]
(assert (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 5
(assert (not (not (= b@79@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01)
  (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01))))
(assert (and
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01)
  (= (mod (- i@83@01 a@78@01) b@79@01) 0)))
; [eval] s[i]
(push) ; 3
(assert (not (>= i@83@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@83@01 (Seq_length s@77@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@84@01 ($Ref) Int)
(declare-fun img@85@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01)
      (= (mod (- i@83@01 a@78@01) b@79@01) 0))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01))))
  :pattern ((Seq_index s@77@01 i@83@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@83@01 Int) (i2@83@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i1@83@01)
        (= (mod (- i1@83@01 a@78@01) b@79@01) 0))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i2@83@01)
        (= (mod (- i2@83@01 a@78@01) b@79@01) 0))
      (= (Seq_index s@77@01 i1@83@01) (Seq_index s@77@01 i2@83@01)))
    (= i1@83@01 i2@83@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01)
      (= (mod (- i@83@01 a@78@01) b@79@01) 0))
    (and
      (= (inv@84@01 (Seq_index s@77@01 i@83@01)) i@83@01)
      (img@85@01 (Seq_index s@77@01 i@83@01))))
  :pattern ((Seq_index s@77@01 i@83@01))
  :qid |quant-u-27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@84@01 r))
        (= (mod (- (inv@84@01 r) a@78@01) b@79@01) 0)))
    (= (Seq_index s@77@01 (inv@84@01 r)) r))
  :pattern ((inv@84@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@83@01)
      (= (mod (- i@83@01 a@78@01) b@79@01) 0))
    (not (= (Seq_index s@77@01 i@83@01) $Ref.null)))
  :pattern ((Seq_index s@77@01 i@83@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var j: Int
(declare-const j@86@01 Int)
; [exec]
; j := 0
; [exec]
; assert j * b % b == 0
; [eval] j * b % b == 0
; [eval] j * b % b
; [eval] j * b
(push) ; 3
(assert (not (not (= b@79@01 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (mod 0 b@79@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (mod 0 b@79@01) 0))
(declare-const j@87@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@88@01 $Snap)
(assert (= $t@88@01 ($Snap.combine ($Snap.first $t@88@01) ($Snap.second $t@88@01))))
(assert (= ($Snap.first $t@88@01) $Snap.unit))
; [eval] 0 <= j
(assert (<= 0 j@87@01))
(assert (=
  ($Snap.second $t@88@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@88@01))
    ($Snap.second ($Snap.second $t@88@01)))))
(assert (= ($Snap.first ($Snap.second $t@88@01)) $Snap.unit))
; [eval] j * b % b == 0
; [eval] j * b % b
; [eval] j * b
(push) ; 4
(assert (not (not (= b@79@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (mod (* j@87@01 b@79@01) b@79@01) 0))
(declare-const i@89@01 Int)
(push) ; 4
; [eval] (i in [a..|s|)) && (i - a) % b == 0
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 5
; [then-branch: 24 | !(i@89@01 in [a@78@01..|s@77@01|]) | live]
; [else-branch: 24 | i@89@01 in [a@78@01..|s@77@01|] | live]
(push) ; 6
; [then-branch: 24 | !(i@89@01 in [a@78@01..|s@77@01|])]
(assert (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 24 | i@89@01 in [a@78@01..|s@77@01|]]
(assert (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 7
(assert (not (not (= b@79@01 0))))
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
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
  (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01))))
(assert (and
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
  (= (mod (- i@89@01 a@78@01) b@79@01) 0)))
; [eval] s[i]
(push) ; 5
(assert (not (>= i@89@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@89@01 (Seq_length s@77@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@90@01 ($Ref) Int)
(declare-fun img@91@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
      (= (mod (- i@89@01 a@78@01) b@79@01) 0))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01))))
  :pattern ((Seq_index s@77@01 i@89@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@89@01 Int) (i2@89@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i1@89@01)
        (= (mod (- i1@89@01 a@78@01) b@79@01) 0))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i2@89@01)
        (= (mod (- i2@89@01 a@78@01) b@79@01) 0))
      (= (Seq_index s@77@01 i1@89@01) (Seq_index s@77@01 i2@89@01)))
    (= i1@89@01 i2@89@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
      (= (mod (- i@89@01 a@78@01) b@79@01) 0))
    (and
      (= (inv@90@01 (Seq_index s@77@01 i@89@01)) i@89@01)
      (img@91@01 (Seq_index s@77@01 i@89@01))))
  :pattern ((Seq_index s@77@01 i@89@01))
  :qid |quant-u-29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@91@01 r)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@90@01 r))
        (= (mod (- (inv@90@01 r) a@78@01) b@79@01) 0)))
    (= (Seq_index s@77@01 (inv@90@01 r)) r))
  :pattern ((inv@90@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
      (= (mod (- i@89@01 a@78@01) b@79@01) 0))
    (not (= (Seq_index s@77@01 i@89@01) $Ref.null)))
  :pattern ((Seq_index s@77@01 i@89@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= j
; [eval] j * b % b == 0
; [eval] j * b % b
; [eval] j * b
(push) ; 4
(assert (not (not (= b@79@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const i@92@01 Int)
(push) ; 4
; [eval] (i in [a..|s|)) && (i - a) % b == 0
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 5
; [then-branch: 25 | !(i@92@01 in [a@78@01..|s@77@01|]) | live]
; [else-branch: 25 | i@92@01 in [a@78@01..|s@77@01|] | live]
(push) ; 6
; [then-branch: 25 | !(i@92@01 in [a@78@01..|s@77@01|])]
(assert (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@92@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 25 | i@92@01 in [a@78@01..|s@77@01|]]
(assert (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@92@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 7
(assert (not (not (= b@79@01 0))))
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
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@92@01)
  (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@92@01))))
(assert (and
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@92@01)
  (= (mod (- i@92@01 a@78@01) b@79@01) 0)))
; [eval] s[i]
(push) ; 5
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@92@01 (Seq_length s@77@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@93@01 ($Ref) Int)
(declare-fun img@94@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@92@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@92@01)
      (= (mod (- i@92@01 a@78@01) b@79@01) 0))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@92@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@92@01))))
  :pattern ((Seq_index s@77@01 i@92@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@92@01 Int) (i2@92@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i1@92@01)
        (= (mod (- i1@92@01 a@78@01) b@79@01) 0))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i2@92@01)
        (= (mod (- i2@92@01 a@78@01) b@79@01) 0))
      (= (Seq_index s@77@01 i1@92@01) (Seq_index s@77@01 i2@92@01)))
    (= i1@92@01 i2@92@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@92@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@92@01)
      (= (mod (- i@92@01 a@78@01) b@79@01) 0))
    (and
      (= (inv@93@01 (Seq_index s@77@01 i@92@01)) i@92@01)
      (img@94@01 (Seq_index s@77@01 i@92@01))))
  :pattern ((Seq_index s@77@01 i@92@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@94@01 r)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@93@01 r))
        (= (mod (- (inv@93@01 r) a@78@01) b@79@01) 0)))
    (= (Seq_index s@77@01 (inv@93@01 r)) r))
  :pattern ((inv@93@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@95@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@93@01 r))
        (= (mod (- (inv@93@01 r) a@78@01) b@79@01) 0))
      (img@94@01 r)
      (= r (Seq_index s@77@01 (inv@93@01 r))))
    ($Perm.min
      (ite
        (and
          (img@85@01 r)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@84@01 r))
            (= (mod (- (inv@84@01 r) a@78@01) b@79@01) 0)))
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
          (img@85@01 r)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@84@01 r))
            (= (mod (- (inv@84@01 r) a@78@01) b@79@01) 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@95@01 r))
    $Perm.No)
  
  :qid |quant-u-32|))))
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
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@93@01 r))
        (= (mod (- (inv@93@01 r) a@78@01) b@79@01) 0))
      (img@94@01 r)
      (= r (Seq_index s@77@01 (inv@93@01 r))))
    (= (- $Perm.Write (pTaken@95@01 r)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@96@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@84@01 r))
        (= (mod (- (inv@84@01 r) a@78@01) b@79@01) 0)))
    (=
      ($FVF.lookup_f (as sm@96@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@80@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@96@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@80@01)))) r))
  :qid |qp.fvfValDef7|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@91@01 r)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@90@01 r))
        (= (mod (- (inv@90@01 r) a@78@01) b@79@01) 0)))
    (= (Seq_index s@77@01 (inv@90@01 r)) r))
  :pattern ((inv@90@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
      (= (mod (- i@89@01 a@78@01) b@79@01) 0))
    (and
      (= (inv@90@01 (Seq_index s@77@01 i@89@01)) i@89@01)
      (img@91@01 (Seq_index s@77@01 i@89@01))))
  :pattern ((Seq_index s@77@01 i@89@01))
  :qid |quant-u-29|)))
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
      (= (mod (- i@89@01 a@78@01) b@79@01) 0))
    (not (= (Seq_index s@77@01 i@89@01) $Ref.null)))
  :pattern ((Seq_index s@77@01 i@89@01))
  :qid |f-permImpliesNonNull|)))
(assert (= $t@88@01 ($Snap.combine ($Snap.first $t@88@01) ($Snap.second $t@88@01))))
(assert (= ($Snap.first $t@88@01) $Snap.unit))
(assert (<= 0 j@87@01))
(assert (=
  ($Snap.second $t@88@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@88@01))
    ($Snap.second ($Snap.second $t@88@01)))))
(assert (= ($Snap.first ($Snap.second $t@88@01)) $Snap.unit))
(assert (= (mod (* j@87@01 b@79@01) b@79@01) 0))
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
      (= (mod (- i@89@01 a@78@01) b@79@01) 0))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@89@01))))
  :pattern ((Seq_index s@77@01 i@89@01))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] a + j * b < |s|
; [eval] a + j * b
; [eval] j * b
; [eval] |s|
(pop) ; 5
(push) ; 5
; [eval] !(a + j * b < |s|)
; [eval] a + j * b < |s|
; [eval] a + j * b
; [eval] j * b
; [eval] |s|
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] a + j * b < |s|
; [eval] a + j * b
; [eval] j * b
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< (+ a@78@01 (* j@87@01 b@79@01)) (Seq_length s@77@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< (+ a@78@01 (* j@87@01 b@79@01)) (Seq_length s@77@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | a@78@01 + j@87@01 * b@79@01 < |s@77@01| | live]
; [else-branch: 26 | !(a@78@01 + j@87@01 * b@79@01 < |s@77@01|) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 26 | a@78@01 + j@87@01 * b@79@01 < |s@77@01|]
(assert (< (+ a@78@01 (* j@87@01 b@79@01)) (Seq_length s@77@01)))
; [exec]
; assert (a + j * b in [a..|s|))
; [eval] (a + j * b in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
; [eval] a + j * b
; [eval] j * b
(push) ; 6
(assert (not (Seq_contains
  (Seq_range a@78@01 (Seq_length s@77@01))
  (+ a@78@01 (* j@87@01 b@79@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Seq_contains
  (Seq_range a@78@01 (Seq_length s@77@01))
  (+ a@78@01 (* j@87@01 b@79@01))))
; [exec]
; assert j * b % b == 0
; [eval] j * b % b == 0
; [eval] j * b % b
; [eval] j * b
(push) ; 6
(assert (not (not (= b@79@01 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [exec]
; s[a + j * b].f := j
; [eval] s[a + j * b]
; [eval] a + j * b
; [eval] j * b
(push) ; 6
(assert (not (>= (+ a@78@01 (* j@87@01 b@79@01)) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@97@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index s@77@01 (+ a@78@01 (* j@87@01 b@79@01))))
    ($Perm.min
      (ite
        (and
          (img@91@01 r)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@90@01 r))
            (= (mod (- (inv@90@01 r) a@78@01) b@79@01) 0)))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@91@01 r)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@90@01 r))
            (= (mod (- (inv@90@01 r) a@78@01) b@79@01) 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@97@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@97@01 r) $Perm.No)
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index s@77@01 (+ a@78@01 (* j@87@01 b@79@01))))
    (= (- $Perm.Write (pTaken@97@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@98@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@98@01  $FVF<f>) (Seq_index
    s@77@01
    (+ a@78@01 (* j@87@01 b@79@01))))
  j@87@01))
; [exec]
; j := j + 1
; [eval] j + 1
(declare-const j@99@01 Int)
(assert (= j@99@01 (+ j@87@01 1)))
; [exec]
; inhale j * b % b == 0
(declare-const $t@100@01 $Snap)
(assert (= $t@100@01 $Snap.unit))
; [eval] j * b % b == 0
; [eval] j * b % b
; [eval] j * b
(set-option :timeout 0)
(push) ; 6
(assert (not (not (= b@79@01 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (mod (* j@99@01 b@79@01) b@79@01) 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
; [eval] 0 <= j
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 j@99@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 j@99@01))
; [eval] j * b % b == 0
; [eval] j * b % b
; [eval] j * b
(push) ; 6
(assert (not (not (= b@79@01 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const i@101@01 Int)
(push) ; 6
; [eval] (i in [a..|s|)) && (i - a) % b == 0
; [eval] (i in [a..|s|))
; [eval] [a..|s|)
; [eval] |s|
(push) ; 7
; [then-branch: 27 | !(i@101@01 in [a@78@01..|s@77@01|]) | live]
; [else-branch: 27 | i@101@01 in [a@78@01..|s@77@01|] | live]
(push) ; 8
; [then-branch: 27 | !(i@101@01 in [a@78@01..|s@77@01|])]
(assert (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@101@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 27 | i@101@01 in [a@78@01..|s@77@01|]]
(assert (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@101@01))
; [eval] (i - a) % b == 0
; [eval] (i - a) % b
; [eval] i - a
(push) ; 9
(assert (not (not (= b@79@01 0))))
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
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@101@01)
  (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@101@01))))
(assert (and
  (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@101@01)
  (= (mod (- i@101@01 a@78@01) b@79@01) 0)))
; [eval] s[i]
(push) ; 7
(assert (not (>= i@101@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@101@01 (Seq_length s@77@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@102@01 ($Ref) Int)
(declare-fun img@103@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@101@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@101@01)
      (= (mod (- i@101@01 a@78@01) b@79@01) 0))
    (or
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@101@01)
      (not (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@101@01))))
  :pattern ((Seq_index s@77@01 i@101@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@101@01 Int) (i2@101@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i1@101@01)
        (= (mod (- i1@101@01 a@78@01) b@79@01) 0))
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i2@101@01)
        (= (mod (- i2@101@01 a@78@01) b@79@01) 0))
      (= (Seq_index s@77@01 i1@101@01) (Seq_index s@77@01 i2@101@01)))
    (= i1@101@01 i2@101@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@101@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) i@101@01)
      (= (mod (- i@101@01 a@78@01) b@79@01) 0))
    (and
      (= (inv@102@01 (Seq_index s@77@01 i@101@01)) i@101@01)
      (img@103@01 (Seq_index s@77@01 i@101@01))))
  :pattern ((Seq_index s@77@01 i@101@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@103@01 r)
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@102@01 r))
        (= (mod (- (inv@102@01 r) a@78@01) b@79@01) 0)))
    (= (Seq_index s@77@01 (inv@102@01 r)) r))
  :pattern ((inv@102@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@104@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@102@01 r))
        (= (mod (- (inv@102@01 r) a@78@01) b@79@01) 0))
      (img@103@01 r)
      (= r (Seq_index s@77@01 (inv@102@01 r))))
    ($Perm.min
      (ite
        (and
          (img@91@01 r)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@90@01 r))
            (= (mod (- (inv@90@01 r) a@78@01) b@79@01) 0)))
        (- $Perm.Write (pTaken@97@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@102@01 r))
        (= (mod (- (inv@102@01 r) a@78@01) b@79@01) 0))
      (img@103@01 r)
      (= r (Seq_index s@77@01 (inv@102@01 r))))
    ($Perm.min
      (ite
        (= r (Seq_index s@77@01 (+ a@78@01 (* j@87@01 b@79@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@104@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@91@01 r)
          (and
            (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@90@01 r))
            (= (mod (- (inv@90@01 r) a@78@01) b@79@01) 0)))
        (- $Perm.Write (pTaken@97@01 r))
        $Perm.No)
      (pTaken@104@01 r))
    $Perm.No)
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@102@01 r))
        (= (mod (- (inv@102@01 r) a@78@01) b@79@01) 0))
      (img@103@01 r)
      (= r (Seq_index s@77@01 (inv@102@01 r))))
    (= (- $Perm.Write (pTaken@104@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (Seq_index s@77@01 (+ a@78@01 (* j@87@01 b@79@01)))
        (Seq_index s@77@01 (+ a@78@01 (* j@87@01 b@79@01))))
      $Perm.Write
      $Perm.No)
    (pTaken@105@01 (Seq_index s@77@01 (+ a@78@01 (* j@87@01 b@79@01)))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@102@01 r))
        (= (mod (- (inv@102@01 r) a@78@01) b@79@01) 0))
      (img@103@01 r)
      (= r (Seq_index s@77@01 (inv@102@01 r))))
    (= (- (- $Perm.Write (pTaken@104@01 r)) (pTaken@105@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@106@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index s@77@01 (+ a@78@01 (* j@87@01 b@79@01))))
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@91@01 r)
        (and
          (Seq_contains (Seq_range a@78@01 (Seq_length s@77@01)) (inv@90@01 r))
          (= (mod (- (inv@90@01 r) a@78@01) b@79@01) 0)))
      (< $Perm.No (- $Perm.Write (pTaken@97@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@88@01))) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@88@01))) r))
  :qid |qp.fvfValDef9|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 26 | !(a@78@01 + j@87@01 * b@79@01 < |s@77@01|)]
(assert (not (< (+ a@78@01 (* j@87@01 b@79@01)) (Seq_length s@77@01))))
(pop) ; 5
; [eval] !(a + j * b < |s|)
; [eval] a + j * b < |s|
; [eval] a + j * b
; [eval] j * b
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (< (+ a@78@01 (* j@87@01 b@79@01)) (Seq_length s@77@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< (+ a@78@01 (* j@87@01 b@79@01)) (Seq_length s@77@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | !(a@78@01 + j@87@01 * b@79@01 < |s@77@01|) | live]
; [else-branch: 28 | a@78@01 + j@87@01 * b@79@01 < |s@77@01| | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 28 | !(a@78@01 + j@87@01 * b@79@01 < |s@77@01|)]
(assert (not (< (+ a@78@01 (* j@87@01 b@79@01)) (Seq_length s@77@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 28 | a@78@01 + j@87@01 * b@79@01 < |s@77@01|]
(assert (< (+ a@78@01 (* j@87@01 b@79@01)) (Seq_length s@77@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
