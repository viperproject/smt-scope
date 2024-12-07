(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr
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
(declare-sort Seq<Int> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort VCTArray<Ref> 0)
(declare-sort $FVF<Integer__item> 0)
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
(declare-fun $SortWrappers.VCTArray<Ref>To$Snap (VCTArray<Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToVCTArray<Ref> ($Snap) VCTArray<Ref>)
(assert (forall ((x VCTArray<Ref>)) (!
    (= x ($SortWrappers.$SnapToVCTArray<Ref>($SortWrappers.VCTArray<Ref>To$Snap x)))
    :pattern (($SortWrappers.VCTArray<Ref>To$Snap x))
    :qid |$Snap.$SnapToVCTArray<Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.VCTArray<Ref>To$Snap($SortWrappers.$SnapToVCTArray<Ref> x)))
    :pattern (($SortWrappers.$SnapToVCTArray<Ref> x))
    :qid |$Snap.VCTArray<Ref>To$SnapToVCTArray<Ref>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<Integer__item>To$Snap ($FVF<Integer__item>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Integer__item> ($Snap) $FVF<Integer__item>)
(assert (forall ((x $FVF<Integer__item>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Integer__item>($SortWrappers.$FVF<Integer__item>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Integer__item>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Integer__item>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Integer__item>To$Snap($SortWrappers.$SnapTo$FVF<Integer__item> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Integer__item> x))
    :qid |$Snap.$FVF<Integer__item>To$SnapTo$FVF<Integer__item>|
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
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_contains_trigger (Seq<Int> Int) Bool)
(declare-fun Seq_skolem (Seq<Int> Int) Int)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_skolem_diff (Seq<Int> Seq<Int>) Int)
(declare-fun Seq_range (Int Int) Seq<Int>)
(declare-fun loc<Ref> (VCTArray<Ref> Int) $Ref)
(declare-fun alen<Int> (VCTArray<Ref>) Int)
; /field_value_functions_declarations.smt2 [Integer__item: Int]
(declare-fun $FVF.domain_Integer__item ($FVF<Integer__item>) Set<$Ref>)
(declare-fun $FVF.lookup_Integer__item ($FVF<Integer__item> $Ref) Int)
(declare-fun $FVF.after_Integer__item ($FVF<Integer__item> $FVF<Integer__item>) Bool)
(declare-fun $FVF.loc_Integer__item (Int $Ref) Bool)
(declare-fun $FVF.perm_Integer__item ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Integer__item $FVF<Integer__item>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun CheckBounded ($Snap Seq<Int> Int) Bool)
(declare-fun CheckBounded%limited ($Snap Seq<Int> Int) Bool)
(declare-fun CheckBounded%stateless (Seq<Int> Int) Bool)
(declare-fun CheckBounded%precondition ($Snap Seq<Int> Int) Bool)
(declare-fun IsReordered ($Snap VCTArray<Ref> Seq<Int> VCTArray<Ref> Int) Bool)
(declare-fun IsReordered%limited ($Snap VCTArray<Ref> Seq<Int> VCTArray<Ref> Int) Bool)
(declare-fun IsReordered%stateless (VCTArray<Ref> Seq<Int> VCTArray<Ref> Int) Bool)
(declare-fun IsReordered%precondition ($Snap VCTArray<Ref> Seq<Int> VCTArray<Ref> Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
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
(assert (forall ((a VCTArray<Ref>)) (!
  (>= (alen<Int> a) 0)
  :pattern ((alen<Int> a))
  :qid |prog.len_nonneg|)))
(assert (forall ((a VCTArray<Ref>) (i Int) (j Int)) (!
  (=>
    (and
      (>= i 0)
      (and
        (>= j 0)
        (and (< i (alen<Int> a)) (and (< j (alen<Int> a)) (not (= i j))))))
    (not (= (loc<Ref> a i) (loc<Ref> a j))))
  :pattern ((loc<Ref> a i) (loc<Ref> a j))
  :qid |prog.loc_inject|)))
; /field_value_functions_axioms.smt2 [Integer__item: Int]
(assert (forall ((vs $FVF<Integer__item>) (ws $FVF<Integer__item>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Integer__item vs) ($FVF.domain_Integer__item ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Integer__item vs))
            (= ($FVF.lookup_Integer__item vs x) ($FVF.lookup_Integer__item ws x)))
          :pattern (($FVF.lookup_Integer__item vs x) ($FVF.lookup_Integer__item ws x))
          :qid |qp.$FVF<Integer__item>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Integer__item>To$Snap vs)
              ($SortWrappers.$FVF<Integer__item>To$Snap ws)
              )
    :qid |qp.$FVF<Integer__item>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Integer__item pm r))
    :pattern (($FVF.perm_Integer__item pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_Integer__item f r) true)
    :pattern (($FVF.loc_Integer__item f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION CheckBounded----------
(declare-fun order@0@00 () Seq<Int>)
(declare-fun maxLen@1@00 () Int)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 ($Snap.combine ($Snap.first $t@8@00) ($Snap.second $t@8@00))))
(assert (= ($Snap.first $t@8@00) $Snap.unit))
; [eval] |order| <= maxLen
; [eval] |order|
(assert (<= (Seq_length order@0@00) maxLen@1@00))
(assert (= ($Snap.second $t@8@00) $Snap.unit))
; [eval] (forall i: Int :: { order[i] } 0 <= i && i < |order| ==> 0 <= order[i] && order[i] < maxLen)
(declare-const i@9@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |order| ==> 0 <= order[i] && order[i] < maxLen
; [eval] 0 <= i && i < |order|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@9@00) | live]
; [else-branch: 0 | 0 <= i@9@00 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@9@00)]
(assert (not (<= 0 i@9@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@9@00]
(assert (<= 0 i@9@00))
; [eval] i < |order|
; [eval] |order|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@9@00) (not (<= 0 i@9@00))))
(push) ; 3
; [then-branch: 1 | 0 <= i@9@00 && i@9@00 < |order@0@00| | live]
; [else-branch: 1 | !(0 <= i@9@00 && i@9@00 < |order@0@00|) | live]
(push) ; 4
; [then-branch: 1 | 0 <= i@9@00 && i@9@00 < |order@0@00|]
(assert (and (<= 0 i@9@00) (< i@9@00 (Seq_length order@0@00))))
; [eval] 0 <= order[i] && order[i] < maxLen
; [eval] 0 <= order[i]
; [eval] order[i]
(push) ; 5
(assert (not (>= i@9@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 2 | !(0 <= order@0@00[i@9@00]) | live]
; [else-branch: 2 | 0 <= order@0@00[i@9@00] | live]
(push) ; 6
; [then-branch: 2 | !(0 <= order@0@00[i@9@00])]
(assert (not (<= 0 (Seq_index order@0@00 i@9@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | 0 <= order@0@00[i@9@00]]
(assert (<= 0 (Seq_index order@0@00 i@9@00)))
; [eval] order[i] < maxLen
; [eval] order[i]
(push) ; 7
(assert (not (>= i@9@00 0)))
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
  (<= 0 (Seq_index order@0@00 i@9@00))
  (not (<= 0 (Seq_index order@0@00 i@9@00)))))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(0 <= i@9@00 && i@9@00 < |order@0@00|)]
(assert (not (and (<= 0 i@9@00) (< i@9@00 (Seq_length order@0@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@9@00) (< i@9@00 (Seq_length order@0@00)))
  (and
    (<= 0 i@9@00)
    (< i@9@00 (Seq_length order@0@00))
    (or
      (<= 0 (Seq_index order@0@00 i@9@00))
      (not (<= 0 (Seq_index order@0@00 i@9@00)))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@9@00) (< i@9@00 (Seq_length order@0@00))))
  (and (<= 0 i@9@00) (< i@9@00 (Seq_length order@0@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@9@00 Int)) (!
  (and
    (or (<= 0 i@9@00) (not (<= 0 i@9@00)))
    (=>
      (and (<= 0 i@9@00) (< i@9@00 (Seq_length order@0@00)))
      (and
        (<= 0 i@9@00)
        (< i@9@00 (Seq_length order@0@00))
        (or
          (<= 0 (Seq_index order@0@00 i@9@00))
          (not (<= 0 (Seq_index order@0@00 i@9@00))))))
    (or
      (not (and (<= 0 i@9@00) (< i@9@00 (Seq_length order@0@00))))
      (and (<= 0 i@9@00) (< i@9@00 (Seq_length order@0@00)))))
  :pattern ((Seq_index order@0@00 i@9@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@20@31@20@119-aux|)))
(assert (forall ((i@9@00 Int)) (!
  (=>
    (and (<= 0 i@9@00) (< i@9@00 (Seq_length order@0@00)))
    (and
      (<= 0 (Seq_index order@0@00 i@9@00))
      (< (Seq_index order@0@00 i@9@00) maxLen@1@00)))
  :pattern ((Seq_index order@0@00 i@9@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@20@31@20@119|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (order@0@00 Seq<Int>) (maxLen@1@00 Int)) (!
  (=
    (CheckBounded%limited s@$ order@0@00 maxLen@1@00)
    (CheckBounded s@$ order@0@00 maxLen@1@00))
  :pattern ((CheckBounded s@$ order@0@00 maxLen@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (order@0@00 Seq<Int>) (maxLen@1@00 Int)) (!
  (CheckBounded%stateless order@0@00 maxLen@1@00)
  :pattern ((CheckBounded%limited s@$ order@0@00 maxLen@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (order@0@00 Seq<Int>) (maxLen@1@00 Int)) (!
  (let ((result@2@00 (CheckBounded%limited s@$ order@0@00 maxLen@1@00))) (=>
    (CheckBounded%precondition s@$ order@0@00 maxLen@1@00)
    (and
      (<= (Seq_length order@0@00) maxLen@1@00)
      (forall ((i Int)) (!
        (=>
          (and (<= 0 i) (< i (Seq_length order@0@00)))
          (and
            (<= 0 (Seq_index order@0@00 i))
            (< (Seq_index order@0@00 i) maxLen@1@00)))
        :pattern ((Seq_index order@0@00 i))
        )))))
  :pattern ((CheckBounded%limited s@$ order@0@00 maxLen@1@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (order@0@00 Seq<Int>) (maxLen@1@00 Int)) (!
  (let ((result@2@00 (CheckBounded%limited s@$ order@0@00 maxLen@1@00))) true)
  :pattern ((CheckBounded%limited s@$ order@0@00 maxLen@1@00))
  :qid |quant-u-5|)))
; ---------- FUNCTION IsReordered----------
(declare-fun origL@3@00 () VCTArray<Ref>)
(declare-fun newO@4@00 () Seq<Int>)
(declare-fun newL@5@00 () VCTArray<Ref>)
(declare-fun maxLen@6@00 () Int)
(declare-fun result@7@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const i@10@00 Int)
(push) ; 2
; [eval] 0 <= i && i < (alen(origL): Int)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 3 | !(0 <= i@10@00) | live]
; [else-branch: 3 | 0 <= i@10@00 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= i@10@00)]
(assert (not (<= 0 i@10@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= i@10@00]
(assert (<= 0 i@10@00))
; [eval] i < (alen(origL): Int)
; [eval] (alen(origL): Int)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@10@00) (not (<= 0 i@10@00))))
(assert (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00))))
; [eval] (loc(origL, i): Ref)
(pop) ; 2
(declare-fun inv@11@00 ($Snap VCTArray<Ref> Seq<Int> VCTArray<Ref> Int $Ref) Int)
(declare-fun img@12@00 ($Snap VCTArray<Ref> Seq<Int> VCTArray<Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
    (or (<= 0 i@10@00) (not (<= 0 i@10@00))))
  :pattern ((loc<Ref> origL@3@00 i@10@00))
  :qid |Integer__item-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@10@00 Int) (i2@10@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@10@00) (< i1@10@00 (alen<Int> origL@3@00)))
      (and (<= 0 i2@10@00) (< i2@10@00 (alen<Int> origL@3@00)))
      (= (loc<Ref> origL@3@00 i1@10@00) (loc<Ref> origL@3@00 i2@10@00)))
    (= i1@10@00 i2@10@00))
  
  :qid |Integer__item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
    (and
      (=
        (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))
        i@10@00)
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))))
  :pattern ((loc<Ref> origL@3@00 i@10@00))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      (loc<Ref> origL@3@00 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
      r))
  :pattern ((inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
  :qid |Integer__item-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
    (not (= (loc<Ref> origL@3@00 i@10@00) $Ref.null)))
  :pattern ((loc<Ref> origL@3@00 i@10@00))
  :qid |Integer__item-permImpliesNonNull|)))
; [eval] origL != newL
(push) ; 2
(set-option :timeout 10)
(assert (not (= origL@3@00 newL@5@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= origL@3@00 newL@5@00))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | origL@3@00 != newL@5@00 | live]
; [else-branch: 4 | origL@3@00 == newL@5@00 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 4 | origL@3@00 != newL@5@00]
(assert (not (= origL@3@00 newL@5@00)))
(declare-const i@13@00 Int)
(push) ; 3
; [eval] 0 <= i && i < (alen(newL): Int)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | !(0 <= i@13@00) | live]
; [else-branch: 5 | 0 <= i@13@00 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= i@13@00)]
(assert (not (<= 0 i@13@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= i@13@00]
(assert (<= 0 i@13@00))
; [eval] i < (alen(newL): Int)
; [eval] (alen(newL): Int)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@13@00) (not (<= 0 i@13@00))))
(assert (and (<= 0 i@13@00) (< i@13@00 (alen<Int> newL@5@00))))
; [eval] (loc(newL, i): Ref)
(pop) ; 3
(declare-fun inv@14@00 ($Snap VCTArray<Ref> Seq<Int> VCTArray<Ref> Int $Ref) Int)
(declare-fun img@15@00 ($Snap VCTArray<Ref> Seq<Int> VCTArray<Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@13@00 Int)) (!
  (=>
    (and (<= 0 i@13@00) (< i@13@00 (alen<Int> newL@5@00)))
    (or (<= 0 i@13@00) (not (<= 0 i@13@00))))
  :pattern ((loc<Ref> newL@5@00 i@13@00))
  :qid |Integer__item-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@13@00 Int) (i2@13@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@13@00) (< i1@13@00 (alen<Int> newL@5@00)))
      (and (<= 0 i2@13@00) (< i2@13@00 (alen<Int> newL@5@00)))
      (= (loc<Ref> newL@5@00 i1@13@00) (loc<Ref> newL@5@00 i2@13@00)))
    (= i1@13@00 i2@13@00))
  
  :qid |Integer__item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@13@00 Int)) (!
  (=>
    (and (<= 0 i@13@00) (< i@13@00 (alen<Int> newL@5@00)))
    (and
      (=
        (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@13@00))
        i@13@00)
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@13@00))))
  :pattern ((loc<Ref> newL@5@00 i@13@00))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      (loc<Ref> newL@5@00 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
      r))
  :pattern ((inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
  :qid |Integer__item-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@13@00 Int)) (!
  (=>
    (and (<= 0 i@13@00) (< i@13@00 (alen<Int> newL@5@00)))
    (not (= (loc<Ref> newL@5@00 i@13@00) $Ref.null)))
  :pattern ((loc<Ref> newL@5@00 i@13@00))
  :qid |Integer__item-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (loc<Ref> newL@5@00 i@13@00) (loc<Ref> origL@3@00 i@10@00))
    (=
      (and
        (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> newL@5@00))))
      (and
        (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> origL@3@00))))))
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@16@00 $Snap)
(assert (= $t@16@00 $Snap.unit))
; [eval] result == (maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item))))
; [eval] maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)))
; [eval] maxLen <= (alen(origL): Int)
; [eval] (alen(origL): Int)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | !(maxLen@6@00 <= alen[Int](origL@3@00)) | live]
; [else-branch: 6 | maxLen@6@00 <= alen[Int](origL@3@00) | live]
(push) ; 4
; [then-branch: 6 | !(maxLen@6@00 <= alen[Int](origL@3@00))]
(assert (not (<= maxLen@6@00 (alen<Int> origL@3@00))))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | maxLen@6@00 <= alen[Int](origL@3@00)]
(assert (<= maxLen@6@00 (alen<Int> origL@3@00)))
; [eval] maxLen <= (alen(newL): Int)
; [eval] (alen(newL): Int)
(push) ; 5
; [then-branch: 7 | !(maxLen@6@00 <= alen[Int](newL@5@00)) | live]
; [else-branch: 7 | maxLen@6@00 <= alen[Int](newL@5@00) | live]
(push) ; 6
; [then-branch: 7 | !(maxLen@6@00 <= alen[Int](newL@5@00))]
(assert (not (<= maxLen@6@00 (alen<Int> newL@5@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | maxLen@6@00 <= alen[Int](newL@5@00)]
(assert (<= maxLen@6@00 (alen<Int> newL@5@00)))
; [eval] CheckBounded(newO, maxLen)
(push) ; 7
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(pop) ; 7
; Joined path conditions
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(push) ; 7
; [then-branch: 8 | !(CheckBounded(_, newO@4@00, maxLen@6@00)) | live]
; [else-branch: 8 | CheckBounded(_, newO@4@00, maxLen@6@00) | live]
(push) ; 8
; [then-branch: 8 | !(CheckBounded(_, newO@4@00, maxLen@6@00))]
(assert (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | CheckBounded(_, newO@4@00, maxLen@6@00)]
(assert (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
; [eval] (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)
(declare-const i@17@00 Int)
(push) ; 9
; [eval] 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] 0 <= i && i < |newO|
; [eval] 0 <= i
(push) ; 10
; [then-branch: 9 | !(0 <= i@17@00) | live]
; [else-branch: 9 | 0 <= i@17@00 | live]
(push) ; 11
; [then-branch: 9 | !(0 <= i@17@00)]
(assert (not (<= 0 i@17@00)))
(pop) ; 11
(push) ; 11
; [else-branch: 9 | 0 <= i@17@00]
(assert (<= 0 i@17@00))
; [eval] i < |newO|
; [eval] |newO|
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@17@00) (not (<= 0 i@17@00))))
(push) ; 10
; [then-branch: 10 | 0 <= i@17@00 && i@17@00 < |newO@4@00| | live]
; [else-branch: 10 | !(0 <= i@17@00 && i@17@00 < |newO@4@00|) | live]
(push) ; 11
; [then-branch: 10 | 0 <= i@17@00 && i@17@00 < |newO@4@00|]
(assert (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00))))
; [eval] (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] (loc(newL, i): Ref)
(declare-fun sm@18@00 ($Snap VCTArray<Ref> Seq<Int> VCTArray<Ref> Int) $FVF<Integer__item>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@19@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@19@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@19@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_Integer__item (as pm@19@00  $FPM) (loc<Ref> newL@5@00 i@17@00)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [eval] (loc(origL, newO[i]): Ref)
; [eval] newO[i]
(push) ; 12
(assert (not (>= i@17@00 0)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> origL@3@00))))
      (=
        ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
    :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> newL@5@00))))
      (=
        ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
    :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
    :qid |qp.fvfValDef1|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
          newO@4@00
          i@17@00)))
        (and
          (<=
            0
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@17@00))))
          (<
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@17@00)))
            (alen<Int> origL@3@00))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
          newO@4@00
          i@17@00)))
        (and
          (<=
            0
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@17@00))))
          (<
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@17@00)))
            (alen<Int> newL@5@00))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 10 | !(0 <= i@17@00 && i@17@00 < |newO@4@00|)]
(assert (not (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@19@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@19@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00))))
  (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00)))))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@19@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@19@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@17@00 Int)) (!
  (and
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (or
      (not (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00))))
      (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00)))))
  :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@17@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@19@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@19@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (=>
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (and
    (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
    (forall ((i@17@00 Int)) (!
      (and
        (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
        (or
          (not (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00))))
          (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00)))))
      :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@17@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|)))))
(assert (or
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@19@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@19@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (=>
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (and
    (<= maxLen@6@00 (alen<Int> newL@5@00))
    (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
    (=>
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@17@00 Int)) (!
          (and
            (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
            (or
              (not (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00))))
              (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@17@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|))))
    (or
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@19@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@19@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (=>
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (=>
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (<= maxLen@6@00 (alen<Int> newL@5@00))
        (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
        (=>
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (and
            (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
            (forall ((i@17@00 Int)) (!
              (and
                (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
                (or
                  (not (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00))))
                  (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00)))))
              :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@17@00)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|))))
        (or
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))))
    (or
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (not (<= maxLen@6@00 (alen<Int> origL@3@00)))))
(assert (=
  result@7@00
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (and
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@17@00 Int)) (!
          (=>
            (and (<= 0 i@17@00) (< i@17@00 (Seq_length newO@4@00)))
            (=
              ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> newL@5@00 i@17@00))
              ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> origL@3@00 (Seq_index
                newO@4@00
                i@17@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@17@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229|)))))))
(pop) ; 2
(push) ; 2
; [else-branch: 4 | origL@3@00 == newL@5@00]
(assert (= origL@3@00 newL@5@00))
(assert (= ($Snap.second s@$) $Snap.unit))
(declare-const $t@20@00 $Snap)
(assert (= $t@20@00 $Snap.unit))
; [eval] result == (maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item))))
; [eval] maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)))
; [eval] maxLen <= (alen(origL): Int)
; [eval] (alen(origL): Int)
(push) ; 3
; [then-branch: 11 | !(maxLen@6@00 <= alen[Int](origL@3@00)) | live]
; [else-branch: 11 | maxLen@6@00 <= alen[Int](origL@3@00) | live]
(push) ; 4
; [then-branch: 11 | !(maxLen@6@00 <= alen[Int](origL@3@00))]
(assert (not (<= maxLen@6@00 (alen<Int> origL@3@00))))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | maxLen@6@00 <= alen[Int](origL@3@00)]
(assert (<= maxLen@6@00 (alen<Int> origL@3@00)))
; [eval] maxLen <= (alen(newL): Int)
; [eval] (alen(newL): Int)
(push) ; 5
; [then-branch: 12 | !(maxLen@6@00 <= alen[Int](newL@5@00)) | live]
; [else-branch: 12 | maxLen@6@00 <= alen[Int](newL@5@00) | live]
(push) ; 6
; [then-branch: 12 | !(maxLen@6@00 <= alen[Int](newL@5@00))]
(assert (not (<= maxLen@6@00 (alen<Int> newL@5@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | maxLen@6@00 <= alen[Int](newL@5@00)]
(assert (<= maxLen@6@00 (alen<Int> newL@5@00)))
; [eval] CheckBounded(newO, maxLen)
(push) ; 7
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(pop) ; 7
; Joined path conditions
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(push) ; 7
; [then-branch: 13 | !(CheckBounded(_, newO@4@00, maxLen@6@00)) | live]
; [else-branch: 13 | CheckBounded(_, newO@4@00, maxLen@6@00) | live]
(push) ; 8
; [then-branch: 13 | !(CheckBounded(_, newO@4@00, maxLen@6@00))]
(assert (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 13 | CheckBounded(_, newO@4@00, maxLen@6@00)]
(assert (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
; [eval] (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)
(declare-const i@21@00 Int)
(push) ; 9
; [eval] 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] 0 <= i && i < |newO|
; [eval] 0 <= i
(push) ; 10
; [then-branch: 14 | !(0 <= i@21@00) | live]
; [else-branch: 14 | 0 <= i@21@00 | live]
(push) ; 11
; [then-branch: 14 | !(0 <= i@21@00)]
(assert (not (<= 0 i@21@00)))
(pop) ; 11
(push) ; 11
; [else-branch: 14 | 0 <= i@21@00]
(assert (<= 0 i@21@00))
; [eval] i < |newO|
; [eval] |newO|
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@21@00) (not (<= 0 i@21@00))))
(push) ; 10
; [then-branch: 15 | 0 <= i@21@00 && i@21@00 < |newO@4@00| | live]
; [else-branch: 15 | !(0 <= i@21@00 && i@21@00 < |newO@4@00|) | live]
(push) ; 11
; [then-branch: 15 | 0 <= i@21@00 && i@21@00 < |newO@4@00|]
(assert (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00))))
; [eval] (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] (loc(newL, i): Ref)
(push) ; 12
(assert (not (and
  (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@21@00))
  (and
    (<=
      0
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@21@00)))
    (<
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@21@00))
      (alen<Int> origL@3@00))))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [eval] (loc(origL, newO[i]): Ref)
; [eval] newO[i]
(push) ; 12
(assert (not (>= i@21@00 0)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(push) ; 12
(assert (not (and
  (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
    newO@4@00
    i@21@00)))
  (and
    (<=
      0
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
        newO@4@00
        i@21@00))))
    (<
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
        newO@4@00
        i@21@00)))
      (alen<Int> origL@3@00))))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 15 | !(0 <= i@21@00 && i@21@00 < |newO@4@00|)]
(assert (not (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00))))
  (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00)))))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@21@00 Int)) (!
  (and
    (or (<= 0 i@21@00) (not (<= 0 i@21@00)))
    (or
      (not (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00))))
      (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00)))))
  :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@21@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (and
    (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
    (forall ((i@21@00 Int)) (!
      (and
        (or (<= 0 i@21@00) (not (<= 0 i@21@00)))
        (or
          (not (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00))))
          (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00)))))
      :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@21@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|)))))
(assert (or
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (and
    (<= maxLen@6@00 (alen<Int> newL@5@00))
    (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
    (=>
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@21@00 Int)) (!
          (and
            (or (<= 0 i@21@00) (not (<= 0 i@21@00)))
            (or
              (not (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00))))
              (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@21@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|))))
    (or
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (=>
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (<= maxLen@6@00 (alen<Int> newL@5@00))
        (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
        (=>
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (and
            (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
            (forall ((i@21@00 Int)) (!
              (and
                (or (<= 0 i@21@00) (not (<= 0 i@21@00)))
                (or
                  (not (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00))))
                  (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00)))))
              :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@21@00)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|))))
        (or
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))))
    (or
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (not (<= maxLen@6@00 (alen<Int> origL@3@00)))))
(assert (=
  result@7@00
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (and
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@21@00 Int)) (!
          (=>
            (and (<= 0 i@21@00) (< i@21@00 (Seq_length newO@4@00)))
            (=
              ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i@21@00))
              ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                newO@4@00
                i@21@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@21@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229|)))))))
(pop) ; 2
(pop) ; 1
(assert (forall ((s@$ $Snap) (origL@3@00 VCTArray<Ref>) (newO@4@00 Seq<Int>) (newL@5@00 VCTArray<Ref>) (maxLen@6@00 Int)) (!
  (=
    (IsReordered%limited s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00)
    (IsReordered s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00))
  :pattern ((IsReordered s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (origL@3@00 VCTArray<Ref>) (newO@4@00 Seq<Int>) (newL@5@00 VCTArray<Ref>) (maxLen@6@00 Int)) (!
  (IsReordered%stateless origL@3@00 newO@4@00 newL@5@00 maxLen@6@00)
  :pattern ((IsReordered%limited s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (origL@3@00 VCTArray<Ref>) (newO@4@00 Seq<Int>) (newL@5@00 VCTArray<Ref>) (maxLen@6@00 Int)) (!
  (let ((result@7@00 (IsReordered%limited s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00))) (and
    (forall ((i@10@00 Int)) (!
      (=>
        (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
        (and
          (=
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))
            i@10@00)
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))))
      :pattern ((loc<Ref> origL@3@00 i@10@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (=
          (loc<Ref> origL@3@00 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          r))
      :pattern ((inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
      :qid |Integer__item-fctOfInv|))
    (forall ((i@13@00 Int)) (!
      (=>
        (and (<= 0 i@13@00) (< i@13@00 (alen<Int> newL@5@00)))
        (and
          (=
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@13@00))
            i@13@00)
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@13@00))))
      :pattern ((loc<Ref> newL@5@00 i@13@00))
      :qid |quant-u-9|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (=
          (loc<Ref> newL@5@00 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          r))
      :pattern ((inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
      :qid |Integer__item-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (=
          ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
          ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
      :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (=
          ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
          ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
      :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef1|))
    (=>
      (IsReordered%precondition s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00)
      (=
        result@7@00
        (and
          (<= maxLen@6@00 (alen<Int> origL@3@00))
          (and
            (<= maxLen@6@00 (alen<Int> newL@5@00))
            (and
              (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
              (forall ((i Int)) (!
                (=>
                  (and (<= 0 i) (< i (Seq_length newO@4@00)))
                  (=
                    (ite
                      (and (<= 0 i) (< i (Seq_length newO@4@00)))
                      (ite
                        (and
                          (<= maxLen@6@00 (alen<Int> origL@3@00))
                          (not (= origL@3@00 newL@5@00))
                          (<= maxLen@6@00 (alen<Int> newL@5@00))
                          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
                        ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> newL@5@00 i))
                        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i)))
                      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i)))
                    (ite
                      (and (<= 0 i) (< i (Seq_length newO@4@00)))
                      (ite
                        (and
                          (<= maxLen@6@00 (alen<Int> origL@3@00))
                          (not (= origL@3@00 newL@5@00))
                          (<= maxLen@6@00 (alen<Int> newL@5@00))
                          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
                        ($FVF.lookup_Integer__item (sm@18@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> origL@3@00 (Seq_index
                          newO@4@00
                          i)))
                        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                          newO@4@00
                          i))))
                      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                        newO@4@00
                        i))))))
                :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i)))
                )))))))))
  :pattern ((IsReordered%limited s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (origL@3@00 VCTArray<Ref>) (newO@4@00 Seq<Int>) (newL@5@00 VCTArray<Ref>) (maxLen@6@00 Int)) (!
  (let ((result@7@00 (IsReordered%limited s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00))) (=>
    (and
      (IsReordered%precondition s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00)
      (and
        (<= maxLen@6@00 (alen<Int> origL@3@00))
        (<= maxLen@6@00 (alen<Int> newL@5@00))))
    (and
      (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
      (=>
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i Int)) (!
          (=>
            (and (<= 0 i) (< i (Seq_length newO@4@00)))
            (ite
              (and (<= 0 i) (< i (Seq_length newO@4@00)))
              (=>
                (and
                  (<= maxLen@6@00 (alen<Int> origL@3@00))
                  (and
                    (not (= origL@3@00 newL@5@00))
                    (<= maxLen@6@00 (alen<Int> newL@5@00))))
                (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
              true))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i)))
          ))))))
  :pattern ((IsReordered%limited s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00))
  :qid |quant-u-12|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (not (= origL@3@00 newL@5@00)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      (loc<Ref> newL@5@00 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
      r))
  :pattern ((inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
  :qid |Integer__item-fctOfInv|)))
(assert (forall ((i@13@00 Int)) (!
  (=>
    (and (<= 0 i@13@00) (< i@13@00 (alen<Int> newL@5@00)))
    (and
      (=
        (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@13@00))
        i@13@00)
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@13@00))))
  :pattern ((loc<Ref> newL@5@00 i@13@00))
  :qid |quant-u-9|)))
(assert (forall ((i@13@00 Int)) (!
  (=>
    (and (<= 0 i@13@00) (< i@13@00 (alen<Int> newL@5@00)))
    (not (= (loc<Ref> newL@5@00 i@13@00) $Ref.null)))
  :pattern ((loc<Ref> newL@5@00 i@13@00))
  :qid |Integer__item-permImpliesNonNull|)))
(assert (forall ((i@13@00 Int)) (!
  (=>
    (and (<= 0 i@13@00) (< i@13@00 (alen<Int> newL@5@00)))
    (or (<= 0 i@13@00) (not (<= 0 i@13@00))))
  :pattern ((loc<Ref> newL@5@00 i@13@00))
  :qid |Integer__item-aux|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      (loc<Ref> origL@3@00 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
      r))
  :pattern ((inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
  :qid |Integer__item-fctOfInv|)))
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
    (and
      (=
        (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))
        i@10@00)
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))))
  :pattern ((loc<Ref> origL@3@00 i@10@00))
  :qid |quant-u-7|)))
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
    (not (= (loc<Ref> origL@3@00 i@10@00) $Ref.null)))
  :pattern ((loc<Ref> origL@3@00 i@10@00))
  :qid |Integer__item-permImpliesNonNull|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
    (or (<= 0 i@10@00) (not (<= 0 i@10@00))))
  :pattern ((loc<Ref> origL@3@00 i@10@00))
  :qid |Integer__item-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)))
; [eval] maxLen <= (alen(origL): Int)
; [eval] (alen(origL): Int)
(set-option :timeout 0)
(push) ; 2
; [then-branch: 16 | !(maxLen@6@00 <= alen[Int](origL@3@00)) | live]
; [else-branch: 16 | maxLen@6@00 <= alen[Int](origL@3@00) | live]
(push) ; 3
; [then-branch: 16 | !(maxLen@6@00 <= alen[Int](origL@3@00))]
(assert (not (<= maxLen@6@00 (alen<Int> origL@3@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 16 | maxLen@6@00 <= alen[Int](origL@3@00)]
(assert (<= maxLen@6@00 (alen<Int> origL@3@00)))
; [eval] maxLen <= (alen(newL): Int)
; [eval] (alen(newL): Int)
(push) ; 4
; [then-branch: 17 | !(maxLen@6@00 <= alen[Int](newL@5@00)) | live]
; [else-branch: 17 | maxLen@6@00 <= alen[Int](newL@5@00) | live]
(push) ; 5
; [then-branch: 17 | !(maxLen@6@00 <= alen[Int](newL@5@00))]
(assert (not (<= maxLen@6@00 (alen<Int> newL@5@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | maxLen@6@00 <= alen[Int](newL@5@00)]
(assert (<= maxLen@6@00 (alen<Int> newL@5@00)))
; [eval] CheckBounded(newO, maxLen)
(push) ; 6
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(pop) ; 6
; Joined path conditions
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(push) ; 6
; [then-branch: 18 | !(CheckBounded(_, newO@4@00, maxLen@6@00)) | live]
; [else-branch: 18 | CheckBounded(_, newO@4@00, maxLen@6@00) | live]
(push) ; 7
; [then-branch: 18 | !(CheckBounded(_, newO@4@00, maxLen@6@00))]
(assert (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 18 | CheckBounded(_, newO@4@00, maxLen@6@00)]
(assert (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
; [eval] (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)
(declare-const i@22@00 Int)
(push) ; 8
; [eval] 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] 0 <= i && i < |newO|
; [eval] 0 <= i
(push) ; 9
; [then-branch: 19 | !(0 <= i@22@00) | live]
; [else-branch: 19 | 0 <= i@22@00 | live]
(push) ; 10
; [then-branch: 19 | !(0 <= i@22@00)]
(assert (not (<= 0 i@22@00)))
(pop) ; 10
(push) ; 10
; [else-branch: 19 | 0 <= i@22@00]
(assert (<= 0 i@22@00))
; [eval] i < |newO|
; [eval] |newO|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@22@00) (not (<= 0 i@22@00))))
(push) ; 9
; [then-branch: 20 | 0 <= i@22@00 && i@22@00 < |newO@4@00| | live]
; [else-branch: 20 | !(0 <= i@22@00 && i@22@00 < |newO@4@00|) | live]
(push) ; 10
; [then-branch: 20 | 0 <= i@22@00 && i@22@00 < |newO@4@00|]
(assert (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00))))
; [eval] (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] (loc(newL, i): Ref)
(declare-fun sm@23@00 ($Snap VCTArray<Ref> Seq<Int> VCTArray<Ref> Int) $FVF<Integer__item>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@24@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@24@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@24@00  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(push) ; 11
(assert (not (<
  $Perm.No
  ($FVF.perm_Integer__item (as pm@24@00  $FPM) (loc<Ref> newL@5@00 i@22@00)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] (loc(origL, newO[i]): Ref)
; [eval] newO[i]
(push) ; 11
(assert (not (>= i@22@00 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> origL@3@00))))
      (=
        ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
    :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> newL@5@00))))
      (=
        ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
    :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
          newO@4@00
          i@22@00)))
        (and
          (<=
            0
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@22@00))))
          (<
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@22@00)))
            (alen<Int> origL@3@00))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
          newO@4@00
          i@22@00)))
        (and
          (<=
            0
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@22@00))))
          (<
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@22@00)))
            (alen<Int> newL@5@00))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 20 | !(0 <= i@22@00 && i@22@00 < |newO@4@00|)]
(assert (not (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@24@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@24@00  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00))))
  (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@24@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@24@00  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@22@00 Int)) (!
  (and
    (or (<= 0 i@22@00) (not (<= 0 i@22@00)))
    (or
      (not (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00))))
      (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00)))))
  :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@22@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213-aux|)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@24@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@24@00  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (=>
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (and
    (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
    (forall ((i@22@00 Int)) (!
      (and
        (or (<= 0 i@22@00) (not (<= 0 i@22@00)))
        (or
          (not (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00))))
          (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00)))))
      :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@22@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213-aux|)))))
(assert (or
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@24@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@24@00  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (=>
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (and
    (<= maxLen@6@00 (alen<Int> newL@5@00))
    (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
    (=>
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@22@00 Int)) (!
          (and
            (or (<= 0 i@22@00) (not (<= 0 i@22@00)))
            (or
              (not (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00))))
              (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@22@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213-aux|))))
    (or
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@24@00  $FPM) r)
    (+
      (ite
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_Integer__item (as pm@24@00  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (=>
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (=>
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (<= maxLen@6@00 (alen<Int> newL@5@00))
        (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
        (=>
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (and
            (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
            (forall ((i@22@00 Int)) (!
              (and
                (or (<= 0 i@22@00) (not (<= 0 i@22@00)))
                (or
                  (not (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00))))
                  (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00)))))
              :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@22@00)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213-aux|))))
        (or
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))))
    (or
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (not (<= maxLen@6@00 (alen<Int> origL@3@00)))))
(assert (=
  result@7@00
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (and
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@22@00 Int)) (!
          (=>
            (and (<= 0 i@22@00) (< i@22@00 (Seq_length newO@4@00)))
            (=
              ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> newL@5@00 i@22@00))
              ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> origL@3@00 (Seq_index
                newO@4@00
                i@22@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@22@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213|)))))))
; [eval] result == (maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item))))
; [eval] maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)))
; [eval] maxLen <= (alen(origL): Int)
; [eval] (alen(origL): Int)
(push) ; 2
; [then-branch: 21 | !(maxLen@6@00 <= alen[Int](origL@3@00)) | live]
; [else-branch: 21 | maxLen@6@00 <= alen[Int](origL@3@00) | live]
(push) ; 3
; [then-branch: 21 | !(maxLen@6@00 <= alen[Int](origL@3@00))]
(assert (not (<= maxLen@6@00 (alen<Int> origL@3@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 21 | maxLen@6@00 <= alen[Int](origL@3@00)]
(assert (<= maxLen@6@00 (alen<Int> origL@3@00)))
; [eval] maxLen <= (alen(newL): Int)
; [eval] (alen(newL): Int)
(push) ; 4
; [then-branch: 22 | !(maxLen@6@00 <= alen[Int](newL@5@00)) | live]
; [else-branch: 22 | maxLen@6@00 <= alen[Int](newL@5@00) | live]
(push) ; 5
; [then-branch: 22 | !(maxLen@6@00 <= alen[Int](newL@5@00))]
(assert (not (<= maxLen@6@00 (alen<Int> newL@5@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | maxLen@6@00 <= alen[Int](newL@5@00)]
(assert (<= maxLen@6@00 (alen<Int> newL@5@00)))
; [eval] CheckBounded(newO, maxLen)
(push) ; 6
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(pop) ; 6
; Joined path conditions
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(push) ; 6
; [then-branch: 23 | !(CheckBounded(_, newO@4@00, maxLen@6@00)) | live]
; [else-branch: 23 | CheckBounded(_, newO@4@00, maxLen@6@00) | live]
(push) ; 7
; [then-branch: 23 | !(CheckBounded(_, newO@4@00, maxLen@6@00))]
(assert (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 23 | CheckBounded(_, newO@4@00, maxLen@6@00)]
(assert (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
; [eval] (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)
(declare-const i@25@00 Int)
(push) ; 8
; [eval] 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] 0 <= i && i < |newO|
; [eval] 0 <= i
(push) ; 9
; [then-branch: 24 | !(0 <= i@25@00) | live]
; [else-branch: 24 | 0 <= i@25@00 | live]
(push) ; 10
; [then-branch: 24 | !(0 <= i@25@00)]
(assert (not (<= 0 i@25@00)))
(pop) ; 10
(push) ; 10
; [else-branch: 24 | 0 <= i@25@00]
(assert (<= 0 i@25@00))
; [eval] i < |newO|
; [eval] |newO|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@25@00) (not (<= 0 i@25@00))))
(push) ; 9
; [then-branch: 25 | 0 <= i@25@00 && i@25@00 < |newO@4@00| | live]
; [else-branch: 25 | !(0 <= i@25@00 && i@25@00 < |newO@4@00|) | live]
(push) ; 10
; [then-branch: 25 | 0 <= i@25@00 && i@25@00 < |newO@4@00|]
(assert (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00))))
; [eval] (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] (loc(newL, i): Ref)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> origL@3@00))))
      (=
        ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
    :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> newL@5@00))))
      (=
        ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
    :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@25@00))
        (and
          (<=
            0
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@25@00)))
          (<
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@25@00))
            (alen<Int> origL@3@00))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@25@00))
        (and
          (<=
            0
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@25@00)))
          (<
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@25@00))
            (alen<Int> newL@5@00))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] (loc(origL, newO[i]): Ref)
; [eval] newO[i]
(push) ; 11
(assert (not (>= i@25@00 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> origL@3@00))))
      (=
        ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
    :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
        (and
          (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          (<
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
            (alen<Int> newL@5@00))))
      (=
        ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
    :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
          newO@4@00
          i@25@00)))
        (and
          (<=
            0
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@25@00))))
          (<
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@25@00)))
            (alen<Int> origL@3@00))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
          newO@4@00
          i@25@00)))
        (and
          (<=
            0
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@25@00))))
          (<
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
              newO@4@00
              i@25@00)))
            (alen<Int> newL@5@00))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 25 | !(0 <= i@25@00 && i@25@00 < |newO@4@00|)]
(assert (not (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00))))
  (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@25@00 Int)) (!
  (and
    (or (<= 0 i@25@00) (not (<= 0 i@25@00)))
    (or
      (not (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00))))
      (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00)))))
  :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@25@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (and
    (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
    (forall ((i@25@00 Int)) (!
      (and
        (or (<= 0 i@25@00) (not (<= 0 i@25@00)))
        (or
          (not (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00))))
          (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00)))))
      :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@25@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|)))))
(assert (or
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (and
    (<= maxLen@6@00 (alen<Int> newL@5@00))
    (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
    (=>
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@25@00 Int)) (!
          (and
            (or (<= 0 i@25@00) (not (<= 0 i@25@00)))
            (or
              (not (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00))))
              (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@25@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|))))
    (or
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> newL@5@00))))
    (=
      ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (=>
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (<= maxLen@6@00 (alen<Int> newL@5@00))
        (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
        (=>
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (and
            (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
            (forall ((i@25@00 Int)) (!
              (and
                (or (<= 0 i@25@00) (not (<= 0 i@25@00)))
                (or
                  (not (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00))))
                  (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00)))))
              :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@25@00)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|))))
        (or
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))))
    (or
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))))
(push) ; 2
(assert (not (=
  result@7@00
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (and
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@25@00 Int)) (!
          (=>
            (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00)))
            (=
              ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> newL@5@00 i@25@00))
              ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> origL@3@00 (Seq_index
                newO@4@00
                i@25@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@25@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229|))))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@7@00
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (and
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@25@00 Int)) (!
          (=>
            (and (<= 0 i@25@00) (< i@25@00 (Seq_length newO@4@00)))
            (=
              ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> newL@5@00 i@25@00))
              ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> origL@3@00 (Seq_index
                newO@4@00
                i@25@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@25@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229|)))))))
(pop) ; 1
(push) ; 1
(assert (= origL@3@00 newL@5@00))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
      (and
        (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
        (<
          (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (alen<Int> origL@3@00))))
    (=
      (loc<Ref> origL@3@00 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
      r))
  :pattern ((inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
  :qid |Integer__item-fctOfInv|)))
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
    (and
      (=
        (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))
        i@10@00)
      (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))))
  :pattern ((loc<Ref> origL@3@00 i@10@00))
  :qid |quant-u-7|)))
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
    (not (= (loc<Ref> origL@3@00 i@10@00) $Ref.null)))
  :pattern ((loc<Ref> origL@3@00 i@10@00))
  :qid |Integer__item-permImpliesNonNull|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
    (or (<= 0 i@10@00) (not (<= 0 i@10@00))))
  :pattern ((loc<Ref> origL@3@00 i@10@00))
  :qid |Integer__item-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)))
; [eval] maxLen <= (alen(origL): Int)
; [eval] (alen(origL): Int)
(set-option :timeout 0)
(push) ; 2
; [then-branch: 26 | !(maxLen@6@00 <= alen[Int](origL@3@00)) | live]
; [else-branch: 26 | maxLen@6@00 <= alen[Int](origL@3@00) | live]
(push) ; 3
; [then-branch: 26 | !(maxLen@6@00 <= alen[Int](origL@3@00))]
(assert (not (<= maxLen@6@00 (alen<Int> origL@3@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 26 | maxLen@6@00 <= alen[Int](origL@3@00)]
(assert (<= maxLen@6@00 (alen<Int> origL@3@00)))
; [eval] maxLen <= (alen(newL): Int)
; [eval] (alen(newL): Int)
(push) ; 4
; [then-branch: 27 | !(maxLen@6@00 <= alen[Int](newL@5@00)) | live]
; [else-branch: 27 | maxLen@6@00 <= alen[Int](newL@5@00) | live]
(push) ; 5
; [then-branch: 27 | !(maxLen@6@00 <= alen[Int](newL@5@00))]
(assert (not (<= maxLen@6@00 (alen<Int> newL@5@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | maxLen@6@00 <= alen[Int](newL@5@00)]
(assert (<= maxLen@6@00 (alen<Int> newL@5@00)))
; [eval] CheckBounded(newO, maxLen)
(push) ; 6
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(pop) ; 6
; Joined path conditions
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(push) ; 6
; [then-branch: 28 | !(CheckBounded(_, newO@4@00, maxLen@6@00)) | live]
; [else-branch: 28 | CheckBounded(_, newO@4@00, maxLen@6@00) | live]
(push) ; 7
; [then-branch: 28 | !(CheckBounded(_, newO@4@00, maxLen@6@00))]
(assert (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 28 | CheckBounded(_, newO@4@00, maxLen@6@00)]
(assert (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
; [eval] (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)
(declare-const i@26@00 Int)
(push) ; 8
; [eval] 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] 0 <= i && i < |newO|
; [eval] 0 <= i
(push) ; 9
; [then-branch: 29 | !(0 <= i@26@00) | live]
; [else-branch: 29 | 0 <= i@26@00 | live]
(push) ; 10
; [then-branch: 29 | !(0 <= i@26@00)]
(assert (not (<= 0 i@26@00)))
(pop) ; 10
(push) ; 10
; [else-branch: 29 | 0 <= i@26@00]
(assert (<= 0 i@26@00))
; [eval] i < |newO|
; [eval] |newO|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@26@00) (not (<= 0 i@26@00))))
(push) ; 9
; [then-branch: 30 | 0 <= i@26@00 && i@26@00 < |newO@4@00| | live]
; [else-branch: 30 | !(0 <= i@26@00 && i@26@00 < |newO@4@00|) | live]
(push) ; 10
; [then-branch: 30 | 0 <= i@26@00 && i@26@00 < |newO@4@00|]
(assert (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00))))
; [eval] (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] (loc(newL, i): Ref)
(push) ; 11
(assert (not (and
  (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@26@00))
  (and
    (<=
      0
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@26@00)))
    (<
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@26@00))
      (alen<Int> origL@3@00))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] (loc(origL, newO[i]): Ref)
; [eval] newO[i]
(push) ; 11
(assert (not (>= i@26@00 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (and
  (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
    newO@4@00
    i@26@00)))
  (and
    (<=
      0
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
        newO@4@00
        i@26@00))))
    (<
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
        newO@4@00
        i@26@00)))
      (alen<Int> origL@3@00))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 30 | !(0 <= i@26@00 && i@26@00 < |newO@4@00|)]
(assert (not (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00))))
  (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@00 Int)) (!
  (and
    (or (<= 0 i@26@00) (not (<= 0 i@26@00)))
    (or
      (not (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00))))
      (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00)))))
  :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@26@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213-aux|)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (and
    (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
    (forall ((i@26@00 Int)) (!
      (and
        (or (<= 0 i@26@00) (not (<= 0 i@26@00)))
        (or
          (not (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00))))
          (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00)))))
      :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@26@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213-aux|)))))
(assert (or
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (and
    (<= maxLen@6@00 (alen<Int> newL@5@00))
    (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
    (=>
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@26@00 Int)) (!
          (and
            (or (<= 0 i@26@00) (not (<= 0 i@26@00)))
            (or
              (not (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00))))
              (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@26@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213-aux|))))
    (or
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (=>
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (<= maxLen@6@00 (alen<Int> newL@5@00))
        (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
        (=>
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (and
            (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
            (forall ((i@26@00 Int)) (!
              (and
                (or (<= 0 i@26@00) (not (<= 0 i@26@00)))
                (or
                  (not (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00))))
                  (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00)))))
              :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@26@00)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213-aux|))))
        (or
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))))
    (or
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (not (<= maxLen@6@00 (alen<Int> origL@3@00)))))
(assert (=
  result@7@00
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (and
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@26@00 Int)) (!
          (=>
            (and (<= 0 i@26@00) (< i@26@00 (Seq_length newO@4@00)))
            (=
              ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i@26@00))
              ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                newO@4@00
                i@26@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@26@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@29@86@29@213|)))))))
; [eval] result == (maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item))))
; [eval] maxLen <= (alen(origL): Int) && (maxLen <= (alen(newL): Int) && (CheckBounded(newO, maxLen) && (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)))
; [eval] maxLen <= (alen(origL): Int)
; [eval] (alen(origL): Int)
(push) ; 2
; [then-branch: 31 | !(maxLen@6@00 <= alen[Int](origL@3@00)) | live]
; [else-branch: 31 | maxLen@6@00 <= alen[Int](origL@3@00) | live]
(push) ; 3
; [then-branch: 31 | !(maxLen@6@00 <= alen[Int](origL@3@00))]
(assert (not (<= maxLen@6@00 (alen<Int> origL@3@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 31 | maxLen@6@00 <= alen[Int](origL@3@00)]
(assert (<= maxLen@6@00 (alen<Int> origL@3@00)))
; [eval] maxLen <= (alen(newL): Int)
; [eval] (alen(newL): Int)
(push) ; 4
; [then-branch: 32 | !(maxLen@6@00 <= alen[Int](newL@5@00)) | live]
; [else-branch: 32 | maxLen@6@00 <= alen[Int](newL@5@00) | live]
(push) ; 5
; [then-branch: 32 | !(maxLen@6@00 <= alen[Int](newL@5@00))]
(assert (not (<= maxLen@6@00 (alen<Int> newL@5@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 32 | maxLen@6@00 <= alen[Int](newL@5@00)]
(assert (<= maxLen@6@00 (alen<Int> newL@5@00)))
; [eval] CheckBounded(newO, maxLen)
(push) ; 6
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(pop) ; 6
; Joined path conditions
(assert (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
(push) ; 6
; [then-branch: 33 | !(CheckBounded(_, newO@4@00, maxLen@6@00)) | live]
; [else-branch: 33 | CheckBounded(_, newO@4@00, maxLen@6@00) | live]
(push) ; 7
; [then-branch: 33 | !(CheckBounded(_, newO@4@00, maxLen@6@00))]
(assert (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 33 | CheckBounded(_, newO@4@00, maxLen@6@00)]
(assert (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
; [eval] (forall i: Int :: { (loc(origL, newO[i]): Ref) } 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item)
(declare-const i@27@00 Int)
(push) ; 8
; [eval] 0 <= i && i < |newO| ==> (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] 0 <= i && i < |newO|
; [eval] 0 <= i
(push) ; 9
; [then-branch: 34 | !(0 <= i@27@00) | live]
; [else-branch: 34 | 0 <= i@27@00 | live]
(push) ; 10
; [then-branch: 34 | !(0 <= i@27@00)]
(assert (not (<= 0 i@27@00)))
(pop) ; 10
(push) ; 10
; [else-branch: 34 | 0 <= i@27@00]
(assert (<= 0 i@27@00))
; [eval] i < |newO|
; [eval] |newO|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@27@00) (not (<= 0 i@27@00))))
(push) ; 9
; [then-branch: 35 | 0 <= i@27@00 && i@27@00 < |newO@4@00| | live]
; [else-branch: 35 | !(0 <= i@27@00 && i@27@00 < |newO@4@00|) | live]
(push) ; 10
; [then-branch: 35 | 0 <= i@27@00 && i@27@00 < |newO@4@00|]
(assert (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00))))
; [eval] (loc(newL, i): Ref).Integer__item == (loc(origL, newO[i]): Ref).Integer__item
; [eval] (loc(newL, i): Ref)
(push) ; 11
(assert (not (and
  (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@27@00))
  (and
    (<=
      0
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@27@00)))
    (<
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@27@00))
      (alen<Int> origL@3@00))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] (loc(origL, newO[i]): Ref)
; [eval] newO[i]
(push) ; 11
(assert (not (>= i@27@00 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (and
  (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
    newO@4@00
    i@27@00)))
  (and
    (<=
      0
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
        newO@4@00
        i@27@00))))
    (<
      (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 (Seq_index
        newO@4@00
        i@27@00)))
      (alen<Int> origL@3@00))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 35 | !(0 <= i@27@00 && i@27@00 < |newO@4@00|)]
(assert (not (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00))))
  (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@27@00 Int)) (!
  (and
    (or (<= 0 i@27@00) (not (<= 0 i@27@00)))
    (or
      (not (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00))))
      (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00)))))
  :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@27@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (and
    (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
    (forall ((i@27@00 Int)) (!
      (and
        (or (<= 0 i@27@00) (not (<= 0 i@27@00)))
        (or
          (not (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00))))
          (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00)))))
      :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@27@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|)))))
(assert (or
  (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
  (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (and
    (<= maxLen@6@00 (alen<Int> newL@5@00))
    (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
    (=>
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@27@00 Int)) (!
          (and
            (or (<= 0 i@27@00) (not (<= 0 i@27@00)))
            (or
              (not (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00))))
              (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@27@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|))))
    (or
      (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
      (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))))))
(assert (or
  (<= maxLen@6@00 (alen<Int> newL@5@00))
  (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= maxLen@6@00 (alen<Int> origL@3@00))
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (=>
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (<= maxLen@6@00 (alen<Int> newL@5@00))
        (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
        (=>
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (and
            (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
            (forall ((i@27@00 Int)) (!
              (and
                (or (<= 0 i@27@00) (not (<= 0 i@27@00)))
                (or
                  (not (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00))))
                  (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00)))))
              :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@27@00)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229-aux|))))
        (or
          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
          (not (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)))))
    (or
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (not (<= maxLen@6@00 (alen<Int> newL@5@00)))))))
(push) ; 2
(assert (not (=
  result@7@00
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (and
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@27@00 Int)) (!
          (=>
            (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00)))
            (=
              ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i@27@00))
              ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                newO@4@00
                i@27@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@27@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229|))))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@7@00
  (and
    (<= maxLen@6@00 (alen<Int> origL@3@00))
    (and
      (<= maxLen@6@00 (alen<Int> newL@5@00))
      (and
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i@27@00 Int)) (!
          (=>
            (and (<= 0 i@27@00) (< i@27@00 (Seq_length newO@4@00)))
            (=
              ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i@27@00))
              ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                newO@4@00
                i@27@00)))))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i@27@00)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483a.vpr@27@102@27@229|)))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (origL@3@00 VCTArray<Ref>) (newO@4@00 Seq<Int>) (newL@5@00 VCTArray<Ref>) (maxLen@6@00 Int)) (!
  (and
    (forall ((i@10@00 Int)) (!
      (=>
        (and (<= 0 i@10@00) (< i@10@00 (alen<Int> origL@3@00)))
        (and
          (=
            (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))
            i@10@00)
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> origL@3@00 i@10@00))))
      :pattern ((loc<Ref> origL@3@00 i@10@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (=
          (loc<Ref> origL@3@00 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          r))
      :pattern ((inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
      :qid |Integer__item-fctOfInv|))
    (forall ((i@13@00 Int)) (!
      (=>
        (and (<= 0 i@13@00) (< i@13@00 (alen<Int> newL@5@00)))
        (and
          (=
            (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@13@00))
            i@13@00)
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 (loc<Ref> newL@5@00 i@13@00))))
      :pattern ((loc<Ref> newL@5@00 i@13@00))
      :qid |quant-u-9|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (=
          (loc<Ref> newL@5@00 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
          r))
      :pattern ((inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
      :qid |Integer__item-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@12@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@11@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> origL@3@00))))
        (=
          ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
          ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
      :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@15@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
          (and
            (<= 0 (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r))
            (<
              (inv@14@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00 r)
              (alen<Int> newL@5@00))))
        (=
          ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r)
          ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) r))
      :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef4|))
    (=>
      (IsReordered%precondition s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00)
      (=
        (IsReordered s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00)
        (and
          (<= maxLen@6@00 (alen<Int> origL@3@00))
          (and
            (<= maxLen@6@00 (alen<Int> newL@5@00))
            (and
              (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
              (forall ((i Int)) (!
                (=>
                  (and (<= 0 i) (< i (Seq_length newO@4@00)))
                  (=
                    (ite
                      (and (<= 0 i) (< i (Seq_length newO@4@00)))
                      (ite
                        (and
                          (<= maxLen@6@00 (alen<Int> origL@3@00))
                          (not (= origL@3@00 newL@5@00))
                          (<= maxLen@6@00 (alen<Int> newL@5@00))
                          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
                        ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> newL@5@00 i))
                        (ite
                          (and (<= 0 i) (< i (Seq_length newO@4@00)))
                          (ite
                            (and
                              (<= maxLen@6@00 (alen<Int> origL@3@00))
                              (not (= origL@3@00 newL@5@00))
                              (<= maxLen@6@00 (alen<Int> newL@5@00))
                              (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
                            ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> newL@5@00 i))
                            ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i)))
                          ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i))))
                      (ite
                        (and (<= 0 i) (< i (Seq_length newO@4@00)))
                        (ite
                          (and
                            (<= maxLen@6@00 (alen<Int> origL@3@00))
                            (not (= origL@3@00 newL@5@00))
                            (<= maxLen@6@00 (alen<Int> newL@5@00))
                            (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
                          ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> newL@5@00 i))
                          ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i)))
                        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> newL@5@00 i))))
                    (ite
                      (and (<= 0 i) (< i (Seq_length newO@4@00)))
                      (ite
                        (and
                          (<= maxLen@6@00 (alen<Int> origL@3@00))
                          (not (= origL@3@00 newL@5@00))
                          (<= maxLen@6@00 (alen<Int> newL@5@00))
                          (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
                        ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> origL@3@00 (Seq_index
                          newO@4@00
                          i)))
                        (ite
                          (and (<= 0 i) (< i (Seq_length newO@4@00)))
                          (ite
                            (and
                              (<= maxLen@6@00 (alen<Int> origL@3@00))
                              (not (= origL@3@00 newL@5@00))
                              (<= maxLen@6@00 (alen<Int> newL@5@00))
                              (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
                            ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> origL@3@00 (Seq_index
                              newO@4@00
                              i)))
                            ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                              newO@4@00
                              i))))
                          ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                            newO@4@00
                            i)))))
                      (ite
                        (and (<= 0 i) (< i (Seq_length newO@4@00)))
                        (ite
                          (and
                            (<= maxLen@6@00 (alen<Int> origL@3@00))
                            (not (= origL@3@00 newL@5@00))
                            (<= maxLen@6@00 (alen<Int> newL@5@00))
                            (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
                          ($FVF.lookup_Integer__item (sm@23@00 s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00) (loc<Ref> origL@3@00 (Seq_index
                            newO@4@00
                            i)))
                          ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                            newO@4@00
                            i))))
                        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first s@$)) (loc<Ref> origL@3@00 (Seq_index
                          newO@4@00
                          i)))))))
                :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i)))
                ))))))))
  :pattern ((IsReordered s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (origL@3@00 VCTArray<Ref>) (newO@4@00 Seq<Int>) (newL@5@00 VCTArray<Ref>) (maxLen@6@00 Int)) (!
  (=>
    (and
      (IsReordered%precondition s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00)
      (and
        (<= maxLen@6@00 (alen<Int> origL@3@00))
        (<= maxLen@6@00 (alen<Int> newL@5@00))))
    (and
      (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00)
      (=>
        (CheckBounded $Snap.unit newO@4@00 maxLen@6@00)
        (forall ((i Int)) (!
          (=>
            (and (<= 0 i) (< i (Seq_length newO@4@00)))
            (ite
              (and (<= 0 i) (< i (Seq_length newO@4@00)))
              (and
                (=>
                  (and
                    (<= maxLen@6@00 (alen<Int> origL@3@00))
                    (and
                      (not (= origL@3@00 newL@5@00))
                      (<= maxLen@6@00 (alen<Int> newL@5@00))))
                  (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
                (ite
                  (and
                    (<= maxLen@6@00 (alen<Int> origL@3@00))
                    (not (= origL@3@00 newL@5@00))
                    (<= maxLen@6@00 (alen<Int> newL@5@00))
                    (CheckBounded $Snap.unit newO@4@00 maxLen@6@00))
                  true
                  (ite
                    (and (<= 0 i) (< i (Seq_length newO@4@00)))
                    (=>
                      (and
                        (<= maxLen@6@00 (alen<Int> origL@3@00))
                        (and
                          (not (= origL@3@00 newL@5@00))
                          (<= maxLen@6@00 (alen<Int> newL@5@00))))
                      (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
                    true)))
              (ite
                (and (<= 0 i) (< i (Seq_length newO@4@00)))
                (=>
                  (and
                    (<= maxLen@6@00 (alen<Int> origL@3@00))
                    (and
                      (not (= origL@3@00 newL@5@00))
                      (<= maxLen@6@00 (alen<Int> newL@5@00))))
                  (CheckBounded%precondition $Snap.unit newO@4@00 maxLen@6@00))
                true)))
          :pattern ((loc<Ref> origL@3@00 (Seq_index newO@4@00 i)))
          )))))
  :pattern ((IsReordered s@$ origL@3@00 newO@4@00 newL@5@00 maxLen@6@00))
  :qid |quant-u-14|)))
