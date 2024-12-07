(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr
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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- main ----------
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
; var v: Seq[Ref]
(declare-const v@0@01 Seq<$Ref>)
; [exec]
; var i: Int
(declare-const i@1@01 Int)
; [exec]
; var res: Int
(declare-const res@2@01 Int)
; [exec]
; var tmp: Ref
(declare-const tmp@3@01 $Ref)
; [exec]
; v := Seq[Ref]()
; [eval] Seq[Ref]()
; [exec]
; res := 0
; [exec]
; i := 0
(declare-const tmp@4@01 $Ref)
(declare-const v@5@01 Seq<$Ref>)
(declare-const i@6@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
; [eval] i <= 10
(assert (<= i@6@01 10))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (= ($Snap.first ($Snap.second $t@7@01)) $Snap.unit))
; [eval] |v| == i
; [eval] |v|
(assert (= (Seq_length v@5@01) i@6@01))
(assert (=
  ($Snap.second ($Snap.second $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@7@01))) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..i)), (i2 in [0..i)) } { (i1 in [0..i)), v[i2] } { (i2 in [0..i)), v[i1] } { v[i1], v[i2] } (i1 in [0..i)) && ((i2 in [0..i)) && i1 != i2) ==> v[i1] != v[i2])
(declare-const i1@8@01 Int)
(declare-const i2@9@01 Int)
(push) ; 4
; [eval] (i1 in [0..i)) && ((i2 in [0..i)) && i1 != i2) ==> v[i1] != v[i2]
; [eval] (i1 in [0..i)) && ((i2 in [0..i)) && i1 != i2)
; [eval] (i1 in [0..i))
; [eval] [0..i)
(push) ; 5
; [then-branch: 0 | !(i1@8@01 in [0..i@6@01]) | live]
; [else-branch: 0 | i1@8@01 in [0..i@6@01] | live]
(push) ; 6
; [then-branch: 0 | !(i1@8@01 in [0..i@6@01])]
(assert (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 0 | i1@8@01 in [0..i@6@01]]
(assert (Seq_contains (Seq_range 0 i@6@01) i1@8@01))
; [eval] (i2 in [0..i))
; [eval] [0..i)
(push) ; 7
; [then-branch: 1 | !(i2@9@01 in [0..i@6@01]) | live]
; [else-branch: 1 | i2@9@01 in [0..i@6@01] | live]
(push) ; 8
; [then-branch: 1 | !(i2@9@01 in [0..i@6@01])]
(assert (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 1 | i2@9@01 in [0..i@6@01]]
(assert (Seq_contains (Seq_range 0 i@6@01) i2@9@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
  (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
  (and
    (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
    (or
      (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01))))))
(assert (or
  (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
  (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01))))
(push) ; 5
; [then-branch: 2 | i1@8@01 in [0..i@6@01] && i2@9@01 in [0..i@6@01] && i1@8@01 != i2@9@01 | live]
; [else-branch: 2 | !(i1@8@01 in [0..i@6@01] && i2@9@01 in [0..i@6@01] && i1@8@01 != i2@9@01) | live]
(push) ; 6
; [then-branch: 2 | i1@8@01 in [0..i@6@01] && i2@9@01 in [0..i@6@01] && i1@8@01 != i2@9@01]
(assert (and
  (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
  (and (Seq_contains (Seq_range 0 i@6@01) i2@9@01) (not (= i1@8@01 i2@9@01)))))
; [eval] v[i1] != v[i2]
; [eval] v[i1]
(push) ; 7
(assert (not (>= i1@8@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@8@01 (Seq_length v@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] v[i2]
(push) ; 7
(assert (not (>= i2@9@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@9@01 (Seq_length v@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 2 | !(i1@8@01 in [0..i@6@01] && i2@9@01 in [0..i@6@01] && i1@8@01 != i2@9@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
    (and (Seq_contains (Seq_range 0 i@6@01) i2@9@01) (not (= i1@8@01 i2@9@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
    (and (Seq_contains (Seq_range 0 i@6@01) i2@9@01) (not (= i1@8@01 i2@9@01))))
  (and
    (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
    (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
    (not (= i1@8@01 i2@9@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and (Seq_contains (Seq_range 0 i@6@01) i2@9@01) (not (= i1@8@01 i2@9@01)))))
  (and
    (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
    (and (Seq_contains (Seq_range 0 i@6@01) i2@9@01) (not (= i1@8@01 i2@9@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i1@8@01) (Seq_contains
    (Seq_range 0 i@6@01)
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_contains_trigger
    (Seq_range 0 i@6@01)
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_contains_trigger
    (Seq_range 0 i@6@01)
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_index v@5@01 i1@8@01) (Seq_index v@5@01 i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and (Seq_contains (Seq_range 0 i@6@01) i2@9@01) (not (= i1@8@01 i2@9@01))))
    (not (= (Seq_index v@5@01 i1@8@01) (Seq_index v@5@01 i2@9@01))))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i1@8@01) (Seq_contains
    (Seq_range 0 i@6@01)
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_contains_trigger
    (Seq_range 0 i@6@01)
    i2@9@01))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :pattern ((Seq_index v@5@01 i1@8@01) (Seq_index v@5@01 i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@7@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))
(declare-const j@10@01 Int)
(push) ; 4
; [eval] (j in [0..i))
; [eval] [0..i)
(assert (Seq_contains (Seq_range 0 i@6@01) j@10@01))
; [eval] v[j]
(push) ; 5
(assert (not (>= j@10@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@10@01 (Seq_length v@5@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@11@01 ($Ref) Int)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@10@01 Int) (j2@10@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 i@6@01) j1@10@01)
      (Seq_contains (Seq_range 0 i@6@01) j2@10@01)
      (= (Seq_index v@5@01 j1@10@01) (Seq_index v@5@01 j2@10@01)))
    (= j1@10@01 j2@10@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@10@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 i@6@01) j@10@01)
    (and
      (= (inv@11@01 (Seq_index v@5@01 j@10@01)) j@10@01)
      (img@12@01 (Seq_index v@5@01 j@10@01))))
  :pattern ((Seq_index v@5@01 j@10@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 r)))
    (= (Seq_index v@5@01 (inv@11@01 r)) r))
  :pattern ((inv@11@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@10@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 i@6@01) j@10@01)
    (not (= (Seq_index v@5@01 j@10@01) $Ref.null)))
  :pattern ((Seq_index v@5@01 j@10@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
  $Snap.unit))
; [eval] (forall j: Int :: { (j in [0..i)) } { v[j] } (j in [0..i)) ==> v[j].val == 1)
(declare-const j@13@01 Int)
(push) ; 4
; [eval] (j in [0..i)) ==> v[j].val == 1
; [eval] (j in [0..i))
; [eval] [0..i)
(push) ; 5
; [then-branch: 3 | j@13@01 in [0..i@6@01] | live]
; [else-branch: 3 | !(j@13@01 in [0..i@6@01]) | live]
(push) ; 6
; [then-branch: 3 | j@13@01 in [0..i@6@01]]
(assert (Seq_contains (Seq_range 0 i@6@01) j@13@01))
; [eval] v[j].val == 1
; [eval] v[j]
(push) ; 7
(assert (not (>= j@13@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@13@01 (Seq_length v@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@12@01 (Seq_index v@5@01 j@13@01))
  (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 (Seq_index v@5@01 j@13@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 3 | !(j@13@01 in [0..i@6@01])]
(assert (not (Seq_contains (Seq_range 0 i@6@01) j@13@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 i@6@01) j@13@01))
  (Seq_contains (Seq_range 0 i@6@01) j@13@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@13@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 i@6@01) j@13@01))
    (Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) j@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@13@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 i@6@01) j@13@01))
    (Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) j@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@13@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 i@6@01) j@13@01))
    (Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_index v@5@01 j@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 i@6@01) j@13@01)
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) (Seq_index
        v@5@01
        j@13@01))
      1))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_index v@5@01 j@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] i <= 10
; [eval] |v| == i
; [eval] |v|
(push) ; 4
(assert (not (= (Seq_length (as Seq_empty  Seq<$Ref>)) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (as Seq_empty  Seq<$Ref>)) 0))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..i)), (i2 in [0..i)) } { (i1 in [0..i)), v[i2] } { (i2 in [0..i)), v[i1] } { v[i1], v[i2] } (i1 in [0..i)) && ((i2 in [0..i)) && i1 != i2) ==> v[i1] != v[i2])
(declare-const i1@14@01 Int)
(declare-const i2@15@01 Int)
(push) ; 4
; [eval] (i1 in [0..i)) && ((i2 in [0..i)) && i1 != i2) ==> v[i1] != v[i2]
; [eval] (i1 in [0..i)) && ((i2 in [0..i)) && i1 != i2)
; [eval] (i1 in [0..i))
; [eval] [0..i)
(push) ; 5
; [then-branch: 4 | !(i1@14@01 in [0..0]) | live]
; [else-branch: 4 | i1@14@01 in [0..0] | live]
(push) ; 6
; [then-branch: 4 | !(i1@14@01 in [0..0])]
(assert (not (Seq_contains (Seq_range 0 0) i1@14@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | i1@14@01 in [0..0]]
(assert (Seq_contains (Seq_range 0 0) i1@14@01))
; [eval] (i2 in [0..i))
; [eval] [0..i)
(push) ; 7
; [then-branch: 5 | !(i2@15@01 in [0..0]) | live]
; [else-branch: 5 | i2@15@01 in [0..0] | live]
(push) ; 8
; [then-branch: 5 | !(i2@15@01 in [0..0])]
(assert (not (Seq_contains (Seq_range 0 0) i2@15@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 5 | i2@15@01 in [0..0]]
(assert (Seq_contains (Seq_range 0 0) i2@15@01))
; [eval] i1 != i2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 0) i2@15@01)
  (not (Seq_contains (Seq_range 0 0) i2@15@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 0) i1@14@01)
  (and
    (Seq_contains (Seq_range 0 0) i1@14@01)
    (or
      (Seq_contains (Seq_range 0 0) i2@15@01)
      (not (Seq_contains (Seq_range 0 0) i2@15@01))))))
(assert (or
  (Seq_contains (Seq_range 0 0) i1@14@01)
  (not (Seq_contains (Seq_range 0 0) i1@14@01))))
(push) ; 5
; [then-branch: 6 | i1@14@01 in [0..0] && i2@15@01 in [0..0] && i1@14@01 != i2@15@01 | live]
; [else-branch: 6 | !(i1@14@01 in [0..0] && i2@15@01 in [0..0] && i1@14@01 != i2@15@01) | live]
(push) ; 6
; [then-branch: 6 | i1@14@01 in [0..0] && i2@15@01 in [0..0] && i1@14@01 != i2@15@01]
(assert (and
  (Seq_contains (Seq_range 0 0) i1@14@01)
  (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01)))))
; [eval] v[i1] != v[i2]
; [eval] v[i1]
(push) ; 7
(assert (not (>= i1@14@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i1@14@01 (Seq_length (as Seq_empty  Seq<$Ref>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] v[i2]
(push) ; 7
(assert (not (>= i2@15@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i2@15@01 (Seq_length (as Seq_empty  Seq<$Ref>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 6 | !(i1@14@01 in [0..0] && i2@15@01 in [0..0] && i1@14@01 != i2@15@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 0) i1@14@01)
    (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 0) i1@14@01)
    (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
  (and
    (Seq_contains (Seq_range 0 0) i1@14@01)
    (Seq_contains (Seq_range 0 0) i2@15@01)
    (not (= i1@14@01 i2@15@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01)))))
  (and
    (Seq_contains (Seq_range 0 0) i1@14@01)
    (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@14@01 Int) (i2@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (or
          (Seq_contains (Seq_range 0 0) i2@15@01)
          (not (Seq_contains (Seq_range 0 0) i2@15@01)))))
    (or
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (not (Seq_contains (Seq_range 0 0) i1@14@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (Seq_contains (Seq_range 0 0) i2@15@01)
        (not (= i1@14@01 i2@15@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 0) i1@14@01)
          (and
            (Seq_contains (Seq_range 0 0) i2@15@01)
            (not (= i1@14@01 i2@15@01)))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))))
  :pattern ((Seq_contains (Seq_range 0 0) i1@14@01) (Seq_contains
    (Seq_range 0 0)
    i2@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_contains_trigger
    (Seq_range 0 0)
    i2@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@14@01 Int) (i2@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (or
          (Seq_contains (Seq_range 0 0) i2@15@01)
          (not (Seq_contains (Seq_range 0 0) i2@15@01)))))
    (or
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (not (Seq_contains (Seq_range 0 0) i1@14@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (Seq_contains (Seq_range 0 0) i2@15@01)
        (not (= i1@14@01 i2@15@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 0) i1@14@01)
          (and
            (Seq_contains (Seq_range 0 0) i2@15@01)
            (not (= i1@14@01 i2@15@01)))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_contains_trigger
    (Seq_range 0 0)
    i2@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@14@01 Int) (i2@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (or
          (Seq_contains (Seq_range 0 0) i2@15@01)
          (not (Seq_contains (Seq_range 0 0) i2@15@01)))))
    (or
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (not (Seq_contains (Seq_range 0 0) i1@14@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (Seq_contains (Seq_range 0 0) i2@15@01)
        (not (= i1@14@01 i2@15@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 0) i1@14@01)
          (and
            (Seq_contains (Seq_range 0 0) i2@15@01)
            (not (= i1@14@01 i2@15@01)))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))))
  :pattern ((Seq_contains (Seq_range 0 0) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@14@01 Int) (i2@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (or
          (Seq_contains (Seq_range 0 0) i2@15@01)
          (not (Seq_contains (Seq_range 0 0) i2@15@01)))))
    (or
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (not (Seq_contains (Seq_range 0 0) i1@14@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (Seq_contains (Seq_range 0 0) i2@15@01)
        (not (= i1@14@01 i2@15@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 0) i1@14@01)
          (and
            (Seq_contains (Seq_range 0 0) i2@15@01)
            (not (= i1@14@01 i2@15@01)))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@14@01 Int) (i2@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (or
          (Seq_contains (Seq_range 0 0) i2@15@01)
          (not (Seq_contains (Seq_range 0 0) i2@15@01)))))
    (or
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (not (Seq_contains (Seq_range 0 0) i1@14@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (Seq_contains (Seq_range 0 0) i2@15@01)
        (not (= i1@14@01 i2@15@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 0) i1@14@01)
          (and
            (Seq_contains (Seq_range 0 0) i2@15@01)
            (not (= i1@14@01 i2@15@01)))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))))
  :pattern ((Seq_contains (Seq_range 0 0) i2@15@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i1@14@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i2@15@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i1@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@14@01 Int) (i2@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (or
          (Seq_contains (Seq_range 0 0) i2@15@01)
          (not (Seq_contains (Seq_range 0 0) i2@15@01)))))
    (or
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (not (Seq_contains (Seq_range 0 0) i1@14@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (Seq_contains (Seq_range 0 0) i2@15@01)
        (not (= i1@14@01 i2@15@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 0) i1@14@01)
          (and
            (Seq_contains (Seq_range 0 0) i2@15@01)
            (not (= i1@14@01 i2@15@01)))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i2@15@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i1@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@14@01 Int) (i2@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (or
          (Seq_contains (Seq_range 0 0) i2@15@01)
          (not (Seq_contains (Seq_range 0 0) i2@15@01)))))
    (or
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (not (Seq_contains (Seq_range 0 0) i1@14@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (Seq_contains (Seq_range 0 0) i2@15@01)
        (not (= i1@14@01 i2@15@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 0) i1@14@01)
          (and
            (Seq_contains (Seq_range 0 0) i2@15@01)
            (not (= i1@14@01 i2@15@01)))))
      (and
        (Seq_contains (Seq_range 0 0) i1@14@01)
        (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))))
  :pattern ((Seq_index (as Seq_empty  Seq<$Ref>) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(push) ; 4
(assert (not (forall ((i1@14@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
    (not
      (=
        (Seq_index (as Seq_empty  Seq<$Ref>) i1@14@01)
        (Seq_index (as Seq_empty  Seq<$Ref>) i2@15@01))))
  :pattern ((Seq_contains (Seq_range 0 0) i1@14@01) (Seq_contains
    (Seq_range 0 0)
    i2@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_contains_trigger
    (Seq_range 0 0)
    i2@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_contains_trigger
    (Seq_range 0 0)
    i2@15@01))
  :pattern ((Seq_contains (Seq_range 0 0) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :pattern ((Seq_contains (Seq_range 0 0) i2@15@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i1@14@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i2@15@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i1@14@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i2@15@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i1@14@01))
  :pattern ((Seq_index (as Seq_empty  Seq<$Ref>) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@14@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 0) i1@14@01)
      (and (Seq_contains (Seq_range 0 0) i2@15@01) (not (= i1@14@01 i2@15@01))))
    (not
      (=
        (Seq_index (as Seq_empty  Seq<$Ref>) i1@14@01)
        (Seq_index (as Seq_empty  Seq<$Ref>) i2@15@01))))
  :pattern ((Seq_contains (Seq_range 0 0) i1@14@01) (Seq_contains
    (Seq_range 0 0)
    i2@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_contains_trigger
    (Seq_range 0 0)
    i2@15@01))
  :pattern ((Seq_contains (Seq_range 0 0) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :pattern ((Seq_contains (Seq_range 0 0) i2@15@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i1@14@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) i2@15@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i1@14@01))
  :pattern ((Seq_index (as Seq_empty  Seq<$Ref>) i1@14@01) (Seq_index
    (as Seq_empty  Seq<$Ref>)
    i2@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101|)))
(declare-const j@16@01 Int)
(push) ; 4
; [eval] (j in [0..i))
; [eval] [0..i)
(assert (Seq_contains (Seq_range 0 0) j@16@01))
; [eval] v[j]
(push) ; 5
(assert (not (>= j@16@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@16@01 (Seq_length (as Seq_empty  Seq<$Ref>)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@17@01 ($Ref) Int)
(declare-fun img@18@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@16@01 Int) (j2@16@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 0) j1@16@01)
      (Seq_contains (Seq_range 0 0) j2@16@01)
      (=
        (Seq_index (as Seq_empty  Seq<$Ref>) j1@16@01)
        (Seq_index (as Seq_empty  Seq<$Ref>) j2@16@01)))
    (= j1@16@01 j2@16@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@16@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 0) j@16@01)
    (and
      (= (inv@17@01 (Seq_index (as Seq_empty  Seq<$Ref>) j@16@01)) j@16@01)
      (img@18@01 (Seq_index (as Seq_empty  Seq<$Ref>) j@16@01))))
  :pattern ((Seq_index (as Seq_empty  Seq<$Ref>) j@16@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@18@01 r) (Seq_contains (Seq_range 0 0) (inv@17@01 r)))
    (= (Seq_index (as Seq_empty  Seq<$Ref>) (inv@17@01 r)) r))
  :pattern ((inv@17@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 0) (inv@17@01 r))
      (img@18@01 r)
      (= r (Seq_index (as Seq_empty  Seq<$Ref>) (inv@17@01 r))))
    false)
  
  :qid |quant-u-3|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@19@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] (forall j: Int :: { (j in [0..i)) } { v[j] } (j in [0..i)) ==> v[j].val == 1)
(declare-const j@20@01 Int)
(push) ; 4
; [eval] (j in [0..i)) ==> v[j].val == 1
; [eval] (j in [0..i))
; [eval] [0..i)
(push) ; 5
; [then-branch: 7 | j@20@01 in [0..0] | live]
; [else-branch: 7 | !(j@20@01 in [0..0]) | live]
(push) ; 6
; [then-branch: 7 | j@20@01 in [0..0]]
(assert (Seq_contains (Seq_range 0 0) j@20@01))
; [eval] v[j].val == 1
; [eval] v[j]
(push) ; 7
(assert (not (>= j@20@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@20@01 (Seq_length (as Seq_empty  Seq<$Ref>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 7 | !(j@20@01 in [0..0])]
(assert (not (Seq_contains (Seq_range 0 0) j@20@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 0) j@20@01))
  (Seq_contains (Seq_range 0 0) j@20@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@20@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 0) j@20@01))
    (Seq_contains (Seq_range 0 0) j@20@01))
  :pattern ((Seq_contains (Seq_range 0 0) j@20@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) j@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@20@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 0) j@20@01))
    (Seq_contains (Seq_range 0 0) j@20@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) j@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@20@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 0) j@20@01))
    (Seq_contains (Seq_range 0 0) j@20@01))
  :pattern ((Seq_index (as Seq_empty  Seq<$Ref>) j@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(push) ; 4
(assert (not (forall ((j@20@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 0) j@20@01)
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) (Seq_index
        (as Seq_empty  Seq<$Ref>)
        j@20@01))
      1))
  :pattern ((Seq_contains (Seq_range 0 0) j@20@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) j@20@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) j@20@01))
  :pattern ((Seq_index (as Seq_empty  Seq<$Ref>) j@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@20@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 0) j@20@01)
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) (Seq_index
        (as Seq_empty  Seq<$Ref>)
        j@20@01))
      1))
  :pattern ((Seq_contains (Seq_range 0 0) j@20@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 0) j@20@01))
  :pattern ((Seq_index (as Seq_empty  Seq<$Ref>) j@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 r)))
    (= (Seq_index v@5@01 (inv@11@01 r)) r))
  :pattern ((inv@11@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((j@10@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 i@6@01) j@10@01)
    (and
      (= (inv@11@01 (Seq_index v@5@01 j@10@01)) j@10@01)
      (img@12@01 (Seq_index v@5@01 j@10@01))))
  :pattern ((Seq_index v@5@01 j@10@01))
  :qid |quant-u-1|)))
(assert (forall ((j@10@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 i@6@01) j@10@01)
    (not (= (Seq_index v@5@01 j@10@01) $Ref.null)))
  :pattern ((Seq_index v@5@01 j@10@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
  $Snap.unit))
(assert (forall ((j@13@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 i@6@01) j@13@01))
    (Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) j@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@13@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 i@6@01) j@13@01))
    (Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) j@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@13@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 i@6@01) j@13@01))
    (Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_index v@5@01 j@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 i@6@01) j@13@01)
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) (Seq_index
        v@5@01
        j@13@01))
      1))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) j@13@01))
  :pattern ((Seq_index v@5@01 j@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60|)))
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
(assert (<= i@6@01 10))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (= ($Snap.first ($Snap.second $t@7@01)) $Snap.unit))
(assert (= (Seq_length v@5@01) i@6@01))
(assert (=
  ($Snap.second ($Snap.second $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@7@01))) $Snap.unit))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i1@8@01) (Seq_contains
    (Seq_range 0 i@6@01)
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_contains_trigger
    (Seq_range 0 i@6@01)
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_contains_trigger
    (Seq_range 0 i@6@01)
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 i@6@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 i@6@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 i@6@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_index v@5@01 i1@8@01) (Seq_index v@5@01 i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 i@6@01) i1@8@01)
      (and (Seq_contains (Seq_range 0 i@6@01) i2@9@01) (not (= i1@8@01 i2@9@01))))
    (not (= (Seq_index v@5@01 i1@8@01) (Seq_index v@5@01 i2@9@01))))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i1@8@01) (Seq_contains
    (Seq_range 0 i@6@01)
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_contains_trigger
    (Seq_range 0 i@6@01)
    i2@9@01))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i1@8@01) (Seq_index
    v@5@01
    i2@9@01))
  :pattern ((Seq_contains (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@6@01) i2@9@01) (Seq_index
    v@5@01
    i1@8@01))
  :pattern ((Seq_index v@5@01 i1@8@01) (Seq_index v@5@01 i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@7@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))
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
; [eval] i < 10
(pop) ; 5
(push) ; 5
; [eval] !(i < 10)
; [eval] i < 10
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@6@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@6@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | i@6@01 < 10 | live]
; [else-branch: 8 | !(i@6@01 < 10) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | i@6@01 < 10]
(assert (< i@6@01 10))
; [exec]
; tmp := new(val)
(declare-const tmp@21@01 $Ref)
(assert (not (= tmp@21@01 $Ref.null)))
(declare-const val@22@01 Int)
(declare-const sm@23@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@23@01  $FVF<val>) tmp@21@01) val@22@01))
(assert (not (= tmp@21@01 tmp@4@01)))
(assert (not (Seq_contains v@5@01 tmp@21@01)))
; [exec]
; tmp.val := 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@24@01 ((r $Ref)) $Perm
  (ite
    (= r tmp@21@01)
    ($Perm.min (ite (= r tmp@21@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@25@01 ((r $Ref)) $Perm
  (ite
    (= r tmp@21@01)
    ($Perm.min
      (ite
        (and (img@12@01 r) (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@24@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@24@01 tmp@21@01)) $Perm.No)))
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
  (=> (= r tmp@21@01) (= (- $Perm.Write (pTaken@24@01 r)) $Perm.No))
  
  :qid |quant-u-6|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@26@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@26@01  $FVF<val>) tmp@21@01) 1))
; [exec]
; v := v ++ Seq(tmp)
; [eval] v ++ Seq(tmp)
; [eval] Seq(tmp)
(assert (= (Seq_length (Seq_singleton tmp@21@01)) 1))
(declare-const v@27@01 Seq<$Ref>)
(assert (= v@27@01 (Seq_append v@5@01 (Seq_singleton tmp@21@01))))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@28@01 Int)
(assert (= i@28@01 (+ i@6@01 1)))
; Loop head block: Re-establish invariant
; [eval] i <= 10
(set-option :timeout 0)
(push) ; 6
(assert (not (<= i@28@01 10)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@28@01 10))
; [eval] |v| == i
; [eval] |v|
(push) ; 6
(assert (not (= (Seq_length v@27@01) i@28@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length v@27@01) i@28@01))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..i)), (i2 in [0..i)) } { (i1 in [0..i)), v[i2] } { (i2 in [0..i)), v[i1] } { v[i1], v[i2] } (i1 in [0..i)) && ((i2 in [0..i)) && i1 != i2) ==> v[i1] != v[i2])
(declare-const i1@29@01 Int)
(declare-const i2@30@01 Int)
(push) ; 6
; [eval] (i1 in [0..i)) && ((i2 in [0..i)) && i1 != i2) ==> v[i1] != v[i2]
; [eval] (i1 in [0..i)) && ((i2 in [0..i)) && i1 != i2)
; [eval] (i1 in [0..i))
; [eval] [0..i)
(push) ; 7
; [then-branch: 9 | !(i1@29@01 in [0..i@28@01]) | live]
; [else-branch: 9 | i1@29@01 in [0..i@28@01] | live]
(push) ; 8
; [then-branch: 9 | !(i1@29@01 in [0..i@28@01])]
(assert (not (Seq_contains (Seq_range 0 i@28@01) i1@29@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 9 | i1@29@01 in [0..i@28@01]]
(assert (Seq_contains (Seq_range 0 i@28@01) i1@29@01))
; [eval] (i2 in [0..i))
; [eval] [0..i)
(push) ; 9
; [then-branch: 10 | !(i2@30@01 in [0..i@28@01]) | live]
; [else-branch: 10 | i2@30@01 in [0..i@28@01] | live]
(push) ; 10
; [then-branch: 10 | !(i2@30@01 in [0..i@28@01])]
(assert (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 10 | i2@30@01 in [0..i@28@01]]
(assert (Seq_contains (Seq_range 0 i@28@01) i2@30@01))
; [eval] i1 != i2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
  (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
  (and
    (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
    (or
      (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
      (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01))))))
(assert (or
  (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
  (not (Seq_contains (Seq_range 0 i@28@01) i1@29@01))))
(push) ; 7
; [then-branch: 11 | i1@29@01 in [0..i@28@01] && i2@30@01 in [0..i@28@01] && i1@29@01 != i2@30@01 | live]
; [else-branch: 11 | !(i1@29@01 in [0..i@28@01] && i2@30@01 in [0..i@28@01] && i1@29@01 != i2@30@01) | live]
(push) ; 8
; [then-branch: 11 | i1@29@01 in [0..i@28@01] && i2@30@01 in [0..i@28@01] && i1@29@01 != i2@30@01]
(assert (and
  (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
  (and (Seq_contains (Seq_range 0 i@28@01) i2@30@01) (not (= i1@29@01 i2@30@01)))))
; [eval] v[i1] != v[i2]
; [eval] v[i1]
(push) ; 9
(assert (not (>= i1@29@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i1@29@01 (Seq_length v@27@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] v[i2]
(push) ; 9
(assert (not (>= i2@30@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i2@30@01 (Seq_length v@27@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 11 | !(i1@29@01 in [0..i@28@01] && i2@30@01 in [0..i@28@01] && i1@29@01 != i2@30@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
    (and
      (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
      (not (= i1@29@01 i2@30@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
    (and
      (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
      (not (= i1@29@01 i2@30@01))))
  (and
    (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
    (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
    (not (= i1@29@01 i2@30@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01)))))
  (and
    (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
    (and
      (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
      (not (= i1@29@01 i2@30@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@29@01 Int) (i2@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (or
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01)))))
    (or
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (not (Seq_contains (Seq_range 0 i@28@01) i1@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
          (and
            (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
            (not (= i1@29@01 i2@30@01)))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) i1@29@01) (Seq_contains
    (Seq_range 0 i@28@01)
    i2@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_contains_trigger
    (Seq_range 0 i@28@01)
    i2@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@29@01 Int) (i2@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (or
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01)))))
    (or
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (not (Seq_contains (Seq_range 0 i@28@01) i1@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
          (and
            (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
            (not (= i1@29@01 i2@30@01)))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_contains_trigger
    (Seq_range 0 i@28@01)
    i2@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@29@01 Int) (i2@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (or
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01)))))
    (or
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (not (Seq_contains (Seq_range 0 i@28@01) i1@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
          (and
            (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
            (not (= i1@29@01 i2@30@01)))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) i1@29@01) (Seq_index
    v@27@01
    i2@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_index
    v@27@01
    i2@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@29@01 Int) (i2@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (or
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01)))))
    (or
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (not (Seq_contains (Seq_range 0 i@28@01) i1@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
          (and
            (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
            (not (= i1@29@01 i2@30@01)))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_index
    v@27@01
    i2@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@29@01 Int) (i2@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (or
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01)))))
    (or
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (not (Seq_contains (Seq_range 0 i@28@01) i1@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
          (and
            (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
            (not (= i1@29@01 i2@30@01)))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) i2@30@01) (Seq_index
    v@27@01
    i1@29@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i2@30@01) (Seq_index
    v@27@01
    i1@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@29@01 Int) (i2@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (or
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01)))))
    (or
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (not (Seq_contains (Seq_range 0 i@28@01) i1@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
          (and
            (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
            (not (= i1@29@01 i2@30@01)))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i2@30@01) (Seq_index
    v@27@01
    i1@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(assert (forall ((i1@29@01 Int) (i2@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (or
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (Seq_contains (Seq_range 0 i@28@01) i2@30@01)))))
    (or
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (not (Seq_contains (Seq_range 0 i@28@01) i1@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
          (and
            (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
            (not (= i1@29@01 i2@30@01)))))
      (and
        (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
        (and
          (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
          (not (= i1@29@01 i2@30@01))))))
  :pattern ((Seq_index v@27@01 i1@29@01) (Seq_index v@27@01 i2@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101-aux|)))
(push) ; 6
(assert (not (forall ((i1@29@01 Int) (i2@30@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01))))
    (not (= (Seq_index v@27@01 i1@29@01) (Seq_index v@27@01 i2@30@01))))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) i1@29@01) (Seq_contains
    (Seq_range 0 i@28@01)
    i2@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_contains_trigger
    (Seq_range 0 i@28@01)
    i2@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_contains_trigger
    (Seq_range 0 i@28@01)
    i2@30@01))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) i1@29@01) (Seq_index
    v@27@01
    i2@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_index
    v@27@01
    i2@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_index
    v@27@01
    i2@30@01))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) i2@30@01) (Seq_index
    v@27@01
    i1@29@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i2@30@01) (Seq_index
    v@27@01
    i1@29@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i2@30@01) (Seq_index
    v@27@01
    i1@29@01))
  :pattern ((Seq_index v@27@01 i1@29@01) (Seq_index v@27@01 i2@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@29@01 Int) (i2@30@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 i@28@01) i1@29@01)
      (and
        (Seq_contains (Seq_range 0 i@28@01) i2@30@01)
        (not (= i1@29@01 i2@30@01))))
    (not (= (Seq_index v@27@01 i1@29@01) (Seq_index v@27@01 i2@30@01))))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) i1@29@01) (Seq_contains
    (Seq_range 0 i@28@01)
    i2@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_contains_trigger
    (Seq_range 0 i@28@01)
    i2@30@01))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) i1@29@01) (Seq_index
    v@27@01
    i2@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i1@29@01) (Seq_index
    v@27@01
    i2@30@01))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) i2@30@01) (Seq_index
    v@27@01
    i1@29@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) i2@30@01) (Seq_index
    v@27@01
    i1@29@01))
  :pattern ((Seq_index v@27@01 i1@29@01) (Seq_index v@27@01 i2@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@17@15@17@101|)))
(declare-const j@31@01 Int)
(push) ; 6
; [eval] (j in [0..i))
; [eval] [0..i)
(assert (Seq_contains (Seq_range 0 i@28@01) j@31@01))
; [eval] v[j]
(push) ; 7
(assert (not (>= j@31@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@31@01 (Seq_length v@27@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@32@01 ($Ref) Int)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@31@01 Int) (j2@31@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 i@28@01) j1@31@01)
      (Seq_contains (Seq_range 0 i@28@01) j2@31@01)
      (= (Seq_index v@27@01 j1@31@01) (Seq_index v@27@01 j2@31@01)))
    (= j1@31@01 j2@31@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@31@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 i@28@01) j@31@01)
    (and
      (= (inv@32@01 (Seq_index v@27@01 j@31@01)) j@31@01)
      (img@33@01 (Seq_index v@27@01 j@31@01))))
  :pattern ((Seq_index v@27@01 j@31@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@33@01 r) (Seq_contains (Seq_range 0 i@28@01) (inv@32@01 r)))
    (= (Seq_index v@27@01 (inv@32@01 r)) r))
  :pattern ((inv@32@01 r))
  :qid |val-fctOfInv|)))
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((j@31@01 Int)) (!
  (= (Seq_index v@27@01 j@31@01) (Seq_index v@5@01 j@31@01))
  
  :qid |quant-u-8|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 i@28@01) (inv@32@01 r))
      (img@33@01 r)
      (= r (Seq_index v@27@01 (inv@32@01 r))))
    ($Perm.min (ite (= r tmp@21@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@35@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 i@28@01) (inv@32@01 r))
      (img@33@01 r)
      (= r (Seq_index v@27@01 (inv@32@01 r))))
    ($Perm.min
      (ite
        (and (img@12@01 r) (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@34@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@34@01 tmp@21@01)) $Perm.No)))
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
      (Seq_contains (Seq_range 0 i@28@01) (inv@32@01 r))
      (img@33@01 r)
      (= r (Seq_index v@27@01 (inv@32@01 r))))
    (= (- $Perm.Write (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@12@01 r) (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@35@01 r))
    $Perm.No)
  
  :qid |quant-u-12|))))
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
      (Seq_contains (Seq_range 0 i@28@01) (inv@32@01 r))
      (img@33@01 r)
      (= r (Seq_index v@27@01 (inv@32@01 r))))
    (= (- (- $Perm.Write (pTaken@34@01 r)) (pTaken@35@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@36@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r tmp@21@01)
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@26@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@26@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 r)))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) r))
  :qid |qp.fvfValDef1|)))
; [eval] (forall j: Int :: { (j in [0..i)) } { v[j] } (j in [0..i)) ==> v[j].val == 1)
(declare-const j@37@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (j in [0..i)) ==> v[j].val == 1
; [eval] (j in [0..i))
; [eval] [0..i)
(push) ; 7
; [then-branch: 12 | j@37@01 in [0..i@28@01] | live]
; [else-branch: 12 | !(j@37@01 in [0..i@28@01]) | live]
(push) ; 8
; [then-branch: 12 | j@37@01 in [0..i@28@01]]
(assert (Seq_contains (Seq_range 0 i@28@01) j@37@01))
; [eval] v[j].val == 1
; [eval] v[j]
(push) ; 9
(assert (not (>= j@37@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< j@37@01 (Seq_length v@27@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r tmp@21@01)
      (=
        ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@26@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@26@01  $FVF<val>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@12@01 r) (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 r)))
      (=
        ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) r)))
    :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) r))
    :qid |qp.fvfValDef1|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite (= (Seq_index v@27@01 j@37@01) tmp@21@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@12@01 (Seq_index v@27@01 j@37@01))
        (Seq_contains
          (Seq_range 0 i@6@01)
          (inv@11@01 (Seq_index v@27@01 j@37@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 12 | !(j@37@01 in [0..i@28@01])]
(assert (not (Seq_contains (Seq_range 0 i@28@01) j@37@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r tmp@21@01)
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@26@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@26@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 r)))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) r))
  :qid |qp.fvfValDef1|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 i@28@01) j@37@01))
  (Seq_contains (Seq_range 0 i@28@01) j@37@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r tmp@21@01)
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@26@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@26@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 r)))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) r))
  :qid |qp.fvfValDef1|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@37@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 i@28@01) j@37@01))
    (Seq_contains (Seq_range 0 i@28@01) j@37@01))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) j@37@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) j@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@37@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 i@28@01) j@37@01))
    (Seq_contains (Seq_range 0 i@28@01) j@37@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) j@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(assert (forall ((j@37@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 i@28@01) j@37@01))
    (Seq_contains (Seq_range 0 i@28@01) j@37@01))
  :pattern ((Seq_index v@27@01 j@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60-aux|)))
(push) ; 6
(assert (not (forall ((j@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 i@28@01) j@37@01)
    (= ($FVF.lookup_val (as sm@36@01  $FVF<val>) (Seq_index v@27@01 j@37@01)) 1))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) j@37@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) j@37@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) j@37@01))
  :pattern ((Seq_index v@27@01 j@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 i@28@01) j@37@01)
    (= ($FVF.lookup_val (as sm@36@01  $FVF<val>) (Seq_index v@27@01 j@37@01)) 1))
  :pattern ((Seq_contains (Seq_range 0 i@28@01) j@37@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 i@28@01) j@37@01))
  :pattern ((Seq_index v@27@01 j@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@19@15@19@60|)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(i@6@01 < 10)]
(assert (not (< i@6@01 10)))
(pop) ; 5
; [eval] !(i < 10)
; [eval] i < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@6@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@6@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | !(i@6@01 < 10) | live]
; [else-branch: 13 | i@6@01 < 10 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | !(i@6@01 < 10)]
(assert (not (< i@6@01 10)))
; [exec]
; assert (forall j: Int ::
;     { (j in [0..10)) }
;     { v[j] }
;     (j in [0..10)) ==> v[j].val > 0)
; [eval] (forall j: Int :: { (j in [0..10)) } { v[j] } (j in [0..10)) ==> v[j].val > 0)
(declare-const j@38@01 Int)
(push) ; 6
; [eval] (j in [0..10)) ==> v[j].val > 0
; [eval] (j in [0..10))
; [eval] [0..10)
(push) ; 7
; [then-branch: 14 | j@38@01 in [0..10] | live]
; [else-branch: 14 | !(j@38@01 in [0..10]) | live]
(push) ; 8
; [then-branch: 14 | j@38@01 in [0..10]]
(assert (Seq_contains (Seq_range 0 10) j@38@01))
; [eval] v[j].val > 0
; [eval] v[j]
(push) ; 9
(assert (not (>= j@38@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< j@38@01 (Seq_length v@5@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and
  (img@12@01 (Seq_index v@5@01 j@38@01))
  (Seq_contains (Seq_range 0 i@6@01) (inv@11@01 (Seq_index v@5@01 j@38@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 14 | !(j@38@01 in [0..10])]
(assert (not (Seq_contains (Seq_range 0 10) j@38@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 10) j@38@01))
  (Seq_contains (Seq_range 0 10) j@38@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@38@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 10) j@38@01))
    (Seq_contains (Seq_range 0 10) j@38@01))
  :pattern ((Seq_contains (Seq_range 0 10) j@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) j@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@27@10@27@55-aux|)))
(assert (forall ((j@38@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 10) j@38@01))
    (Seq_contains (Seq_range 0 10) j@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) j@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@27@10@27@55-aux|)))
(assert (forall ((j@38@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 10) j@38@01))
    (Seq_contains (Seq_range 0 10) j@38@01))
  :pattern ((Seq_index v@5@01 j@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@27@10@27@55-aux|)))
(push) ; 6
(assert (not (forall ((j@38@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 10) j@38@01)
    (>
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) (Seq_index
        v@5@01
        j@38@01))
      0))
  :pattern ((Seq_contains (Seq_range 0 10) j@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) j@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) j@38@01))
  :pattern ((Seq_index v@5@01 j@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@27@10@27@55|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@38@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 10) j@38@01)
    (>
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))) (Seq_index
        v@5@01
        j@38@01))
      0))
  :pattern ((Seq_contains (Seq_range 0 10) j@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 10) j@38@01))
  :pattern ((Seq_index v@5@01 j@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0176.vpr@27@10@27@55|)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | i@6@01 < 10]
(assert (< i@6@01 10))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
