(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:56
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr
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
(declare-sort $FVF<val> 0)
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
(declare-fun $SortWrappers.$FVF<val>To$Snap ($FVF<val>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val> ($Snap) $FVF<val>)
(assert (forall ((x $FVF<val>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val>($SortWrappers.$FVF<val>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val>To$Snap($SortWrappers.$SnapTo$FVF<val> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val> x))
    :qid |$Snap.$FVF<val>To$SnapTo$FVF<val>|
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
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun sum ($Snap $Ref Int Int Int Seq<$Ref>) Int)
(declare-fun sum%limited ($Snap $Ref Int Int Int Seq<$Ref>) Int)
(declare-fun sum%stateless ($Ref Int Int Int Seq<$Ref>) Bool)
(declare-fun sum%precondition ($Snap $Ref Int Int Int Seq<$Ref>) Bool)
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
; /field_value_functions_axioms.smt2 [val: Int]
(assert (forall ((vs $FVF<val>) (ws $FVF<val>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val vs) ($FVF.domain_val ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val vs))
            (= ($FVF.lookup_val vs x) ($FVF.lookup_val ws x)))
          :pattern (($FVF.lookup_val vs x) ($FVF.lookup_val ws x))
          :qid |qp.$FVF<val>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val>To$Snap vs)
              ($SortWrappers.$FVF<val>To$Snap ws)
              )
    :qid |qp.$FVF<val>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val pm r))
    :pattern (($FVF.perm_val pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION sum----------
(declare-fun diz@0@00 () $Ref)
(declare-fun lo@1@00 () Int)
(declare-fun hi@2@00 () Int)
(declare-fun i@3@00 () Int)
(declare-fun ar@4@00 () Seq<$Ref>)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] 0 <= lo
(assert (<= 0 lo@1@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] lo <= i
(assert (<= lo@1@00 i@3@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] i <= hi
(assert (<= i@3@00 hi@2@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] hi <= |ar|
; [eval] |ar|
(assert (<= hi@2@00 (Seq_length ar@4@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] (forall k1: Int, k2: Int :: { (k1 in [lo..hi)), (k2 in [lo..hi)) } { (k1 in [lo..hi)), ar[k2] } { (k2 in [lo..hi)), ar[k1] } { ar[k1], ar[k2] } (k1 in [lo..hi)) && ((k2 in [lo..hi)) && k1 != k2) ==> ar[k1] != ar[k2])
(declare-const k1@6@00 Int)
(declare-const k2@7@00 Int)
(push) ; 2
; [eval] (k1 in [lo..hi)) && ((k2 in [lo..hi)) && k1 != k2) ==> ar[k1] != ar[k2]
; [eval] (k1 in [lo..hi)) && ((k2 in [lo..hi)) && k1 != k2)
; [eval] (k1 in [lo..hi))
; [eval] [lo..hi)
(push) ; 3
; [then-branch: 0 | !(k1@6@00 in [lo@1@00..hi@2@00]) | live]
; [else-branch: 0 | k1@6@00 in [lo@1@00..hi@2@00] | live]
(push) ; 4
; [then-branch: 0 | !(k1@6@00 in [lo@1@00..hi@2@00])]
(assert (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | k1@6@00 in [lo@1@00..hi@2@00]]
(assert (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00))
; [eval] (k2 in [lo..hi))
; [eval] [lo..hi)
(push) ; 5
; [then-branch: 1 | !(k2@7@00 in [lo@1@00..hi@2@00]) | live]
; [else-branch: 1 | k2@7@00 in [lo@1@00..hi@2@00] | live]
(push) ; 6
; [then-branch: 1 | !(k2@7@00 in [lo@1@00..hi@2@00])]
(assert (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | k2@7@00 in [lo@1@00..hi@2@00]]
(assert (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00))
; [eval] k1 != k2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
  (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00))))))
(assert (or
  (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
  (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00))))
(push) ; 3
; [then-branch: 2 | k1@6@00 in [lo@1@00..hi@2@00] && k2@7@00 in [lo@1@00..hi@2@00] && k1@6@00 != k2@7@00 | live]
; [else-branch: 2 | !(k1@6@00 in [lo@1@00..hi@2@00] && k2@7@00 in [lo@1@00..hi@2@00] && k1@6@00 != k2@7@00) | live]
(push) ; 4
; [then-branch: 2 | k1@6@00 in [lo@1@00..hi@2@00] && k2@7@00 in [lo@1@00..hi@2@00] && k1@6@00 != k2@7@00]
(assert (and
  (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
    (not (= k1@6@00 k2@7@00)))))
; [eval] ar[k1] != ar[k2]
; [eval] ar[k1]
(push) ; 5
(assert (not (>= k1@6@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k1@6@00 (Seq_length ar@4@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k2]
(push) ; 5
(assert (not (>= k2@7@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k2@7@00 (Seq_length ar@4@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(k1@6@00 in [lo@1@00..hi@2@00] && k2@7@00 in [lo@1@00..hi@2@00] && k1@6@00 != k2@7@00)]
(assert (not
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
      (not (= k1@6@00 k2@7@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
      (not (= k1@6@00 k2@7@00))))
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
    (not (= k1@6@00 k2@7@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00)))))
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
      (not (= k1@6@00 k2@7@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains_trigger
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains_trigger
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_index ar@4@00 k1@6@00) (Seq_index ar@4@00 k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (not (= (Seq_index ar@4@00 k1@6@00) (Seq_index ar@4@00 k2@7@00))))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains_trigger
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :pattern ((Seq_index ar@4@00 k1@6@00) (Seq_index ar@4@00 k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104|)))
(declare-const k@8@00 Int)
(push) ; 2
; [eval] (k in [lo..hi))
; [eval] [lo..hi)
(assert (Seq_contains (Seq_range lo@1@00 hi@2@00) k@8@00))
; [eval] ar[k]
(push) ; 3
(assert (not (>= k@8@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< k@8@00 (Seq_length ar@4@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@9@00 $Perm)
(assert ($Perm.isReadVar $k@9@00))
(pop) ; 2
(declare-fun inv@10@00 ($Snap $Ref Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@11@00 ($Snap $Ref Int Int Int Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@9@00))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((k@8@00 Int)) (!
  (=>
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k@8@00)
    (or (= $k@9@00 $Perm.No) (< $Perm.No $k@9@00)))
  
  :qid |quant-u-2|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@8@00 Int) (k2@8@00 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@8@00)
        (< $Perm.No $k@9@00))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@8@00)
        (< $Perm.No $k@9@00))
      (= (Seq_index ar@4@00 k1@8@00) (Seq_index ar@4@00 k2@8@00)))
    (= k1@8@00 k2@8@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@8@00 Int)) (!
  (=>
    (and (Seq_contains (Seq_range lo@1@00 hi@2@00) k@8@00) (< $Perm.No $k@9@00))
    (and
      (=
        (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
          ar@4@00
          k@8@00))
        k@8@00)
      (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
        ar@4@00
        k@8@00))))
  :pattern ((Seq_index ar@4@00 k@8@00))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@9@00)))
    (=
      (Seq_index
        ar@4@00
        (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      r))
  :pattern ((inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((k@8@00 Int)) (!
  (<= $Perm.No $k@9@00)
  :pattern ((Seq_index ar@4@00 k@8@00))
  :qid |val-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((k@8@00 Int)) (!
  (<= $k@9@00 $Perm.Write)
  :pattern ((Seq_index ar@4@00 k@8@00))
  :qid |val-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((k@8@00 Int)) (!
  (=>
    (and (Seq_contains (Seq_range lo@1@00 hi@2@00) k@8@00) (< $Perm.No $k@9@00))
    (not (= (Seq_index ar@4@00 k@8@00) $Ref.null)))
  :pattern ((Seq_index ar@4@00 k@8@00))
  :qid |val-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref) (lo@1@00 Int) (hi@2@00 Int) (i@3@00 Int) (ar@4@00 Seq<$Ref>)) (!
  (=
    (sum%limited s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)
    (sum s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00))
  :pattern ((sum s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref) (lo@1@00 Int) (hi@2@00 Int) (i@3@00 Int) (ar@4@00 Seq<$Ref>)) (!
  (sum%stateless diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)
  :pattern ((sum%limited s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@9@00)))
    (=
      (Seq_index
        ar@4@00
        (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      r))
  :pattern ((inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((k@8@00 Int)) (!
  (=>
    (and (Seq_contains (Seq_range lo@1@00 hi@2@00) k@8@00) (< $Perm.No $k@9@00))
    (and
      (=
        (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
          ar@4@00
          k@8@00))
        k@8@00)
      (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
        ar@4@00
        k@8@00))))
  :pattern ((Seq_index ar@4@00 k@8@00))
  :qid |quant-u-3|)))
(assert (forall ((k@8@00 Int)) (!
  (<= $Perm.No $k@9@00)
  :pattern ((Seq_index ar@4@00 k@8@00))
  :qid |val-permAtLeastZero|)))
(assert (forall ((k@8@00 Int)) (!
  (<= $k@9@00 $Perm.Write)
  :pattern ((Seq_index ar@4@00 k@8@00))
  :qid |val-permAtMostOne|)))
(assert (forall ((k@8@00 Int)) (!
  (=>
    (and (Seq_contains (Seq_range lo@1@00 hi@2@00) k@8@00) (< $Perm.No $k@9@00))
    (not (= (Seq_index ar@4@00 k@8@00) $Ref.null)))
  :pattern ((Seq_index ar@4@00 k@8@00))
  :qid |val-permImpliesNonNull|)))
(assert ($Perm.isReadVar $k@9@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= diz@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= 0 lo@1@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= lo@1@00 i@3@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (<= i@3@00 hi@2@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (<= hi@2@00 (Seq_length ar@4@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains_trigger
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains_trigger
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (or
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)))))
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)))
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (or
      (not
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
            (not (= k1@6@00 k2@7@00)))))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
          (not (= k1@6@00 k2@7@00))))))
  :pattern ((Seq_index ar@4@00 k1@6@00) (Seq_index ar@4@00 k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104-aux|)))
(assert (forall ((k1@6@00 Int) (k2@7@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00)
        (not (= k1@6@00 k2@7@00))))
    (not (= (Seq_index ar@4@00 k1@6@00) (Seq_index ar@4@00 k2@7@00))))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_contains_trigger
    (Seq_range lo@1@00 hi@2@00)
    k2@7@00))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k1@6@00) (Seq_index
    ar@4@00
    k2@7@00))
  :pattern ((Seq_contains (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :pattern ((Seq_contains_trigger (Seq_range lo@1@00 hi@2@00) k2@7@00) (Seq_index
    ar@4@00
    k1@6@00))
  :pattern ((Seq_index ar@4@00 k1@6@00) (Seq_index ar@4@00 k2@7@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i < hi ? ar[i].val + sum(diz, lo, hi, i + 1, ar) : 0)
; [eval] i < hi
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@3@00 hi@2@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@3@00 hi@2@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | i@3@00 < hi@2@00 | live]
; [else-branch: 3 | !(i@3@00 < hi@2@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | i@3@00 < hi@2@00]
(assert (< i@3@00 hi@2@00))
; [eval] ar[i].val + sum(diz, lo, hi, i + 1, ar)
; [eval] ar[i]
(push) ; 4
(assert (not (>= i@3@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@3@00 (Seq_length ar@4@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (ite
  (and
    (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
      ar@4@00
      i@3@00))
    (Seq_contains
      (Seq_range lo@1@00 hi@2@00)
      (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
        ar@4@00
        i@3@00))))
  (< $Perm.No $k@9@00)
  false)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] sum(diz, lo, hi, i + 1, ar)
; [eval] i + 1
(push) ; 4
; [eval] diz != null
; [eval] 0 <= lo
; [eval] lo <= i
(push) ; 5
(assert (not (<= lo@1@00 (+ i@3@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= lo@1@00 (+ i@3@00 1)))
; [eval] i <= hi
(push) ; 5
(assert (not (<= (+ i@3@00 1) hi@2@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@3@00 1) hi@2@00))
; [eval] hi <= |ar|
; [eval] |ar|
; [eval] (forall k1: Int, k2: Int ::(k1 in [lo..hi)) && ((k2 in [lo..hi)) && k1 != k2) ==> ar[k1] != ar[k2])
(declare-const k1@12@00 Int)
(declare-const k2@13@00 Int)
(push) ; 5
; [eval] (k1 in [lo..hi)) && ((k2 in [lo..hi)) && k1 != k2) ==> ar[k1] != ar[k2]
; [eval] (k1 in [lo..hi)) && ((k2 in [lo..hi)) && k1 != k2)
; [eval] (k1 in [lo..hi))
; [eval] [lo..hi)
(push) ; 6
; [then-branch: 4 | !(k1@12@00 in [lo@1@00..hi@2@00]) | live]
; [else-branch: 4 | k1@12@00 in [lo@1@00..hi@2@00] | live]
(push) ; 7
; [then-branch: 4 | !(k1@12@00 in [lo@1@00..hi@2@00])]
(assert (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | k1@12@00 in [lo@1@00..hi@2@00]]
(assert (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00))
; [eval] (k2 in [lo..hi))
; [eval] [lo..hi)
(push) ; 8
; [then-branch: 5 | !(k2@13@00 in [lo@1@00..hi@2@00]) | live]
; [else-branch: 5 | k2@13@00 in [lo@1@00..hi@2@00] | live]
(push) ; 9
; [then-branch: 5 | !(k2@13@00 in [lo@1@00..hi@2@00])]
(assert (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)))
(pop) ; 9
(push) ; 9
; [else-branch: 5 | k2@13@00 in [lo@1@00..hi@2@00]]
(assert (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00))
; [eval] k1 != k2
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
  (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
    (or
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
      (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00))))))
(assert (or
  (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
  (not (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00))))
(push) ; 6
; [then-branch: 6 | k1@12@00 in [lo@1@00..hi@2@00] && k2@13@00 in [lo@1@00..hi@2@00] && k1@12@00 != k2@13@00 | live]
; [else-branch: 6 | !(k1@12@00 in [lo@1@00..hi@2@00] && k2@13@00 in [lo@1@00..hi@2@00] && k1@12@00 != k2@13@00) | live]
(push) ; 7
; [then-branch: 6 | k1@12@00 in [lo@1@00..hi@2@00] && k2@13@00 in [lo@1@00..hi@2@00] && k1@12@00 != k2@13@00]
(assert (and
  (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
    (not (= k1@12@00 k2@13@00)))))
; [eval] ar[k1] != ar[k2]
; [eval] ar[k1]
(push) ; 8
(assert (not (>= k1@12@00 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< k1@12@00 (Seq_length ar@4@00))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k2]
(push) ; 8
(assert (not (>= k2@13@00 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< k2@13@00 (Seq_length ar@4@00))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 6 | !(k1@12@00 in [lo@1@00..hi@2@00] && k2@13@00 in [lo@1@00..hi@2@00] && k1@12@00 != k2@13@00)]
(assert (not
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
      (not (= k1@12@00 k2@13@00))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
      (not (= k1@12@00 k2@13@00))))
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
    (not (= k1@12@00 k2@13@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
        (not (= k1@12@00 k2@13@00)))))
  (and
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
      (not (= k1@12@00 k2@13@00))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((k1@12@00 Int) (k2@13@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
        (not (= k1@12@00 k2@13@00))))
    (not (= (Seq_index ar@4@00 k1@12@00) (Seq_index ar@4@00 k2@13@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k1@12@00 Int) (k2@13@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
        (not (= k1@12@00 k2@13@00))))
    (not (= (Seq_index ar@4@00 k1@12@00) (Seq_index ar@4@00 k2@13@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104|)))
(declare-const k@14@00 Int)
(push) ; 5
; [eval] (k in [lo..hi))
; [eval] [lo..hi)
(assert (Seq_contains (Seq_range lo@1@00 hi@2@00) k@14@00))
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@14@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< k@14@00 (Seq_length ar@4@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@16@00 ($Snap $Ref Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@17@00 ($Snap $Ref Int Int Int Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@15@00))
; Nested auxiliary terms: non-globals
(push) ; 5
(assert (not (forall ((k@14@00 Int)) (!
  (=>
    (Seq_contains (Seq_range lo@1@00 hi@2@00) k@14@00)
    (or (= $k@15@00 $Perm.No) (< $Perm.No $k@15@00)))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@14@00 Int) (k2@14@00 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@14@00)
        (< $Perm.No $k@15@00))
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@14@00)
        (< $Perm.No $k@15@00))
      (= (Seq_index ar@4@00 k1@14@00) (Seq_index ar@4@00 k2@14@00)))
    (= k1@14@00 k2@14@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@14@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k@14@00)
      (< $Perm.No $k@15@00))
    (and
      (=
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
          ar@4@00
          k@14@00))
        k@14@00)
      (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
        ar@4@00
        k@14@00))))
  :pattern ((Seq_index ar@4@00 k@14@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)))
    (=
      (Seq_index
        ar@4@00
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      r))
  :pattern ((inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@15@00
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
          $k@9@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
      (<
        (ite
          (and
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
            (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
            (=
              r
              (Seq_index
                ar@4@00
                (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))))
          $k@15@00
          $Perm.No)
        $k@9@00)
      (<
        (ite
          (and
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
            (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
            (=
              r
              (Seq_index
                ar@4@00
                (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))))
          $k@15@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
  :pattern ((Seq_contains
    (Seq_range lo@1@00 hi@2@00)
    (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
  :pattern ((Seq_contains_trigger
    (Seq_range lo@1@00 hi@2@00)
    (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
  :pattern ((Seq_contains
    (Seq_range lo@1@00 hi@2@00)
    (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
  :pattern ((Seq_contains_trigger
    (Seq_range lo@1@00 hi@2@00)
    (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
  :pattern ((img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
  :pattern ((Seq_index
    ar@4@00
    (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
  :qid |qp.srp0|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains
        (Seq_range lo@1@00 hi@2@00)
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
      (=
        r
        (Seq_index
          ar@4@00
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))))
    (=
      (-
        $k@15@00
        (ite
          (and
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
            (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
            (=
              r
              (Seq_index
                ar@4@00
                (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))))
          ($Perm.min
            (ite
              (and
                (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
                (Seq_contains
                  (Seq_range lo@1@00 hi@2@00)
                  (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
              $k@9@00
              $Perm.No)
            $k@15@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@18@00 ($Snap $Ref Int Int Int Seq<$Ref>) $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)
        (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
    (=>
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)
        (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00))))
  :qid |qp.fvfDomDef2|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)
        (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      (ite
        (and
          (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
          (Seq_contains
            (Seq_range lo@1@00 hi@2@00)
            (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
        (< $Perm.No $k@9@00)
        false))
    (=
      ($FVF.lookup_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) r)))
  :pattern (($FVF.lookup_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (sum%precondition ($Snap.combine
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
            ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))))) diz@0@00 lo@1@00 hi@2@00 (+
  i@3@00
  1) ar@4@00))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@15@00))
(assert (forall ((k@14@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k@14@00)
      (< $Perm.No $k@15@00))
    (and
      (=
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
          ar@4@00
          k@14@00))
        k@14@00)
      (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
        ar@4@00
        k@14@00))))
  :pattern ((Seq_index ar@4@00 k@14@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)))
    (=
      (Seq_index
        ar@4@00
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      r))
  :pattern ((inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)
        (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
    (=>
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)
        (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00))))
  :qid |qp.fvfDomDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)
        (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      (ite
        (and
          (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
          (Seq_contains
            (Seq_range lo@1@00 hi@2@00)
            (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
        (< $Perm.No $k@9@00)
        false))
    (=
      ($FVF.lookup_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) r)))
  :pattern (($FVF.lookup_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (and
  (<= lo@1@00 (+ i@3@00 1))
  (<= (+ i@3@00 1) hi@2@00)
  (forall ((k1@12@00 Int) (k2@13@00 Int)) (!
    (=>
      (and
        (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
          (not (= k1@12@00 k2@13@00))))
      (not (= (Seq_index ar@4@00 k1@12@00) (Seq_index ar@4@00 k2@13@00))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
              (Seq_contains
                (Seq_range lo@1@00 hi@2@00)
                (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
            $k@9@00
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
          (Seq_contains
            (Seq_range lo@1@00 hi@2@00)
            (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
        (<
          (ite
            (and
              (Seq_contains
                (Seq_range lo@1@00 hi@2@00)
                (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
              (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
              (=
                r
                (Seq_index
                  ar@4@00
                  (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))))
            $k@15@00
            $Perm.No)
          $k@9@00)
        (<
          (ite
            (and
              (Seq_contains
                (Seq_range lo@1@00 hi@2@00)
                (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
              (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
              (=
                r
                (Seq_index
                  ar@4@00
                  (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))))
            $k@15@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
    :pattern ((Seq_contains
      (Seq_range lo@1@00 hi@2@00)
      (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
    :pattern ((Seq_contains_trigger
      (Seq_range lo@1@00 hi@2@00)
      (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
    :pattern ((Seq_contains
      (Seq_range lo@1@00 hi@2@00)
      (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
    :pattern ((Seq_contains_trigger
      (Seq_range lo@1@00 hi@2@00)
      (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
    :pattern ((img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
    :pattern ((Seq_index
      ar@4@00
      (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
    :qid |qp.srp0|))
  (sum%precondition ($Snap.combine
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
              ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))))) diz@0@00 lo@1@00 hi@2@00 (+
    i@3@00
    1) ar@4@00)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 3 | !(i@3@00 < hi@2@00)]
(assert (not (< i@3@00 hi@2@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@15@00))
(assert (forall ((k@14@00 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range lo@1@00 hi@2@00) k@14@00)
      (< $Perm.No $k@15@00))
    (and
      (=
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
          ar@4@00
          k@14@00))
        k@14@00)
      (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
        ar@4@00
        k@14@00))))
  :pattern ((Seq_index ar@4@00 k@14@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)))
    (=
      (Seq_index
        ar@4@00
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      r))
  :pattern ((inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)
        (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
    (=>
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)
        (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00))))
  :qid |qp.fvfDomDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains
          (Seq_range lo@1@00 hi@2@00)
          (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
        (< $Perm.No $k@15@00)
        (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      (ite
        (and
          (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
          (Seq_contains
            (Seq_range lo@1@00 hi@2@00)
            (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
        (< $Perm.No $k@9@00)
        false))
    (=
      ($FVF.lookup_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) r)))
  :pattern (($FVF.lookup_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (=>
  (< i@3@00 hi@2@00)
  (and
    (< i@3@00 hi@2@00)
    (<= lo@1@00 (+ i@3@00 1))
    (<= (+ i@3@00 1) hi@2@00)
    (forall ((k1@12@00 Int) (k2@13@00 Int)) (!
      (=>
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k1@12@00)
          (and
            (Seq_contains (Seq_range lo@1@00 hi@2@00) k2@13@00)
            (not (= k1@12@00 k2@13@00))))
        (not (= (Seq_index ar@4@00 k1@12@00) (Seq_index ar@4@00 k2@13@00))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/array-sum.vpr@15@12@15@104|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
                (Seq_contains
                  (Seq_range lo@1@00 hi@2@00)
                  (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
              $k@9@00
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
          (<
            (ite
              (and
                (Seq_contains
                  (Seq_range lo@1@00 hi@2@00)
                  (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
                (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
                (=
                  r
                  (Seq_index
                    ar@4@00
                    (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))))
              $k@15@00
              $Perm.No)
            $k@9@00)
          (<
            (ite
              (and
                (Seq_contains
                  (Seq_range lo@1@00 hi@2@00)
                  (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
                (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
                (=
                  r
                  (Seq_index
                    ar@4@00
                    (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))))
              $k@15@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      :pattern ((Seq_contains
        (Seq_range lo@1@00 hi@2@00)
        (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
      :pattern ((Seq_contains_trigger
        (Seq_range lo@1@00 hi@2@00)
        (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
      :pattern ((Seq_contains
        (Seq_range lo@1@00 hi@2@00)
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
      :pattern ((Seq_contains_trigger
        (Seq_range lo@1@00 hi@2@00)
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
      :pattern ((img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      :pattern ((Seq_index
        ar@4@00
        (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
      :qid |qp.srp0|))
    (sum%precondition ($Snap.combine
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
                ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))))) diz@0@00 lo@1@00 hi@2@00 (+
      i@3@00
      1) ar@4@00))))
; Joined path conditions
(assert (or (not (< i@3@00 hi@2@00)) (< i@3@00 hi@2@00)))
(assert (=
  result@5@00
  (ite
    (< i@3@00 hi@2@00)
    (+
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) (Seq_index
        ar@4@00
        i@3@00))
      (sum ($Snap.combine
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
                  ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))))) diz@0@00 lo@1@00 hi@2@00 (+
        i@3@00
        1) ar@4@00))
    0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref) (lo@1@00 Int) (hi@2@00 Int) (i@3@00 Int) (ar@4@00 Seq<$Ref>)) (!
  (and
    (forall ((k@8@00 Int)) (!
      (=>
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k@8@00)
          (< $Perm.No $k@9@00))
        (and
          (=
            (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
              ar@4@00
              k@8@00))
            k@8@00)
          (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
            ar@4@00
            k@8@00))))
      :pattern ((Seq_index ar@4@00 k@8@00))
      :qid |quant-u-3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
          (and
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
            (< $Perm.No $k@9@00)))
        (=
          (Seq_index
            ar@4@00
            (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
          r))
      :pattern ((inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      :qid |val-fctOfInv|))
    (forall ((k@14@00 Int)) (!
      (=>
        (and
          (Seq_contains (Seq_range lo@1@00 hi@2@00) k@14@00)
          (< $Perm.No $k@15@00))
        (and
          (=
            (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
              ar@4@00
              k@14@00))
            k@14@00)
          (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 (Seq_index
            ar@4@00
            k@14@00))))
      :pattern ((Seq_index ar@4@00 k@14@00))
      :qid |val-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
          (and
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
            (< $Perm.No $k@15@00)))
        (=
          (Seq_index
            ar@4@00
            (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
          r))
      :pattern ((inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
      :qid |val-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))
          (and
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
            (< $Perm.No $k@15@00)
            (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
        (=>
          (and
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
            (< $Perm.No $k@15@00)
            (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
          (Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))
      :pattern ((Set_in r ($FVF.domain_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00))))
      :qid |qp.fvfDomDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Seq_contains
              (Seq_range lo@1@00 hi@2@00)
              (inv@16@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
            (< $Perm.No $k@15@00)
            (img@17@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r))
          (ite
            (and
              (img@11@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)
              (Seq_contains
                (Seq_range lo@1@00 hi@2@00)
                (inv@10@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00 r)))
            (< $Perm.No $k@9@00)
            false))
        (=
          ($FVF.lookup_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) r)))
      :pattern (($FVF.lookup_val (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) r))
      :qid |qp.fvfValDef1|))
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@15@00)
    (=>
      (sum%precondition s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)
      (=
        (sum s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)
        (ite
          (< i@3@00 hi@2@00)
          (+
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) (Seq_index
              ar@4@00
              i@3@00))
            (sum%limited ($Snap.combine
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
                        ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))))) diz@0@00 lo@1@00 hi@2@00 (+
              i@3@00
              1) ar@4@00))
          0))))
  :pattern ((sum s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref) (lo@1@00 Int) (hi@2@00 Int) (i@3@00 Int) (ar@4@00 Seq<$Ref>)) (!
  (=>
    (sum%precondition s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)
    (ite
      (< i@3@00 hi@2@00)
      (sum%precondition ($Snap.combine
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
                  ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00)))))))) diz@0@00 lo@1@00 hi@2@00 (+
        i@3@00
        1) ar@4@00)
      true))
  :pattern ((sum s@$ diz@0@00 lo@1@00 hi@2@00 i@3@00 ar@4@00))
  :qid |quant-u-9|)))
