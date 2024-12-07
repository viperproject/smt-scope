(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:29
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr
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
(declare-sort IArray 0)
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
(declare-fun $SortWrappers.IArrayTo$Snap (IArray) $Snap)
(declare-fun $SortWrappers.$SnapToIArray ($Snap) IArray)
(assert (forall ((x IArray)) (!
    (= x ($SortWrappers.$SnapToIArray($SortWrappers.IArrayTo$Snap x)))
    :pattern (($SortWrappers.IArrayTo$Snap x))
    :qid |$Snap.$SnapToIArrayTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IArrayTo$Snap($SortWrappers.$SnapToIArray x)))
    :pattern (($SortWrappers.$SnapToIArray x))
    :qid |$Snap.IArrayTo$SnapToIArray|
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
(declare-fun loc<Ref> (IArray Int) $Ref)
(declare-fun loc_limited<Ref> (IArray Int) $Ref)
(declare-fun len<Int> (IArray) Int)
(declare-fun first<IArray> ($Ref) IArray)
(declare-fun second<Int> ($Ref) Int)
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
(assert (forall ((a IArray) (i Int)) (!
  (= (loc<Ref> a i) (loc_limited<Ref> a i))
  :pattern ((loc<Ref> a i))
  :qid |prog.limited|)))
(assert (forall ((a IArray) (i Int)) (!
  (and (= (first<IArray> (loc<Ref> a i)) a) (= (second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a IArray)) (!
  (>= (len<Int> a) 0)
  :pattern ((len<Int> a))
  :qid |prog.length_nonneg|)))
(assert (forall ((a IArray) (i Int) (j Int)) (!
  (=>
    (and
      (>= i 0)
      (and
        (>= j 0)
        (and (< i (len<Int> a)) (and (< j (len<Int> a)) (not (= i j))))))
    (not (= (loc<Ref> a i) (loc<Ref> a j))))
  :pattern ((loc<Ref> a i) (loc<Ref> a j))
  :qid |prog.loc_inject|)))
(assert (forall ((a IArray) (i Int) (j Int)) (!
  (=>
    (and
      (>= i 0)
      (and
        (>= j 0)
        (and (< i (len<Int> a)) (and (< j (len<Int> a)) (not (= i j))))))
    (not (= (loc_limited<Ref> a i) (loc_limited<Ref> a j))))
  :pattern ((loc_limited<Ref> a i) (loc_limited<Ref> a j))
  :qid |prog.loc_limited_inject|)))
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
; ---------- test01 ----------
(declare-const a@0@01 IArray)
(declare-const n@1@01 Int)
(declare-const a@2@01 IArray)
(declare-const n@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] n > 5
(assert (> n@3@01 5))
(declare-const i@5@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@3@01) i@5@01))
; [eval] loc(a, i)
(pop) ; 2
(declare-fun inv@6@01 ($Ref) Int)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@5@01 Int) (i2@5@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@3@01) i1@5@01)
      (Seq_contains (Seq_range 0 n@3@01) i2@5@01)
      (= (loc<Ref> a@2@01 i1@5@01) (loc<Ref> a@2@01 i2@5@01)))
    (= i1@5@01 i2@5@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@5@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@3@01) i@5@01)
    (and
      (= (inv@6@01 (loc<Ref> a@2@01 i@5@01)) i@5@01)
      (img@7@01 (loc<Ref> a@2@01 i@5@01))))
  :pattern ((loc<Ref> a@2@01 i@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 r)))
    (= (loc<Ref> a@2@01 (inv@6@01 r)) r))
  :pattern ((inv@6@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@5@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@3@01) i@5@01)
    (not (= (loc<Ref> a@2@01 i@5@01) $Ref.null)))
  :pattern ((loc<Ref> a@2@01 i@5@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(declare-const i@9@01 Int)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@3@01) i@9@01))
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@10@01 ($Ref) Int)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@9@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@3@01) i1@9@01)
      (Seq_contains (Seq_range 0 n@3@01) i2@9@01)
      (= (loc<Ref> a@2@01 i1@9@01) (loc<Ref> a@2@01 i2@9@01)))
    (= i1@9@01 i2@9@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@9@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@3@01) i@9@01)
    (and
      (= (inv@10@01 (loc<Ref> a@2@01 i@9@01)) i@9@01)
      (img@11@01 (loc<Ref> a@2@01 i@9@01))))
  :pattern ((loc<Ref> a@2@01 i@9@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@10@01 r)))
    (= (loc<Ref> a@2@01 (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@9@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@3@01) i@9@01)
    (not (= (loc<Ref> a@2@01 i@9@01) $Ref.null)))
  :pattern ((loc<Ref> a@2@01 i@9@01))
  :qid |val-permImpliesNonNull|)))
(assert (= ($Snap.second $t@8@01) $Snap.unit))
; [eval] loc(a, 1).val == loc(a, 0).val + old(loc(a, 1).val)
; [eval] loc(a, 1)
(push) ; 3
(assert (not (and
  (img@11@01 (loc<Ref> a@2@01 1))
  (Seq_contains (Seq_range 0 n@3@01) (inv@10@01 (loc<Ref> a@2@01 1))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, 0).val + old(loc(a, 1).val)
; [eval] loc(a, 0)
(push) ; 3
(assert (not (and
  (img@11@01 (loc<Ref> a@2@01 0))
  (Seq_contains (Seq_range 0 n@3@01) (inv@10@01 (loc<Ref> a@2@01 0))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(loc(a, 1).val)
; [eval] loc(a, 1)
(push) ; 3
(assert (not (and
  (img@7@01 (loc<Ref> a@2@01 1))
  (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 (loc<Ref> a@2@01 1))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@8@01)) (loc<Ref> a@2@01 1))
  (+
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@8@01)) (loc<Ref> a@2@01 0))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) (loc<Ref> a@2@01 1)))))
(pop) ; 2
(push) ; 2
; [exec]
; loc(a, 1).val := loc(a, 0).val + loc(a, 1).val
; [eval] loc(a, 1)
; [eval] loc(a, 0).val + loc(a, 1).val
; [eval] loc(a, 0)
(push) ; 3
(assert (not (and
  (img@7@01 (loc<Ref> a@2@01 0))
  (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 (loc<Ref> a@2@01 0))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, 1)
(push) ; 3
(assert (not (and
  (img@7@01 (loc<Ref> a@2@01 1))
  (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 (loc<Ref> a@2@01 1))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@12@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@2@01 1))
    ($Perm.min
      (ite
        (and (img@7@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 r)))
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
        (and (img@7@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@12@01 r))
    $Perm.No)
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@12@01 r) $Perm.No)
  
  :qid |quant-u-6|))))
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
  (=> (= r (loc<Ref> a@2@01 1)) (= (- $Perm.Write (pTaken@12@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@13@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@2@01 1))
  (+
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) (loc<Ref> a@2@01 0))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) (loc<Ref> a@2@01 1)))))
(declare-const i@14@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@3@01) i@14@01))
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@15@01 ($Ref) Int)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@14@01 Int) (i2@14@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@3@01) i1@14@01)
      (Seq_contains (Seq_range 0 n@3@01) i2@14@01)
      (= (loc<Ref> a@2@01 i1@14@01) (loc<Ref> a@2@01 i2@14@01)))
    (= i1@14@01 i2@14@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@14@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@3@01) i@14@01)
    (and
      (= (inv@15@01 (loc<Ref> a@2@01 i@14@01)) i@14@01)
      (img@16@01 (loc<Ref> a@2@01 i@14@01))))
  :pattern ((loc<Ref> a@2@01 i@14@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@15@01 r)))
    (= (loc<Ref> a@2@01 (inv@15@01 r)) r))
  :pattern ((inv@15@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@3@01) (inv@15@01 r))
      (img@16@01 r)
      (= r (loc<Ref> a@2@01 (inv@15@01 r))))
    ($Perm.min
      (ite
        (and (img@7@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 r)))
        (- $Perm.Write (pTaken@12@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@3@01) (inv@15@01 r))
      (img@16@01 r)
      (= r (loc<Ref> a@2@01 (inv@15@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@2@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@17@01 r)))
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
        (and (img@7@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 r)))
        (- $Perm.Write (pTaken@12@01 r))
        $Perm.No)
      (pTaken@17@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
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
      (Seq_contains (Seq_range 0 n@3@01) (inv@15@01 r))
      (img@16@01 r)
      (= r (loc<Ref> a@2@01 (inv@15@01 r))))
    (= (- $Perm.Write (pTaken@17@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (loc<Ref> a@2@01 1) (loc<Ref> a@2@01 1)) $Perm.Write $Perm.No)
    (pTaken@18@01 (loc<Ref> a@2@01 1)))
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
    (and
      (Seq_contains (Seq_range 0 n@3@01) (inv@15@01 r))
      (img@16@01 r)
      (= r (loc<Ref> a@2@01 (inv@15@01 r))))
    (= (- (- $Perm.Write (pTaken@17@01 r)) (pTaken@18@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@2@01 1))
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@12@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
; [eval] loc(a, 1).val == loc(a, 0).val + old(loc(a, 1).val)
; [eval] loc(a, 1)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@2@01 1))
      (=
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@12@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) r)))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) r))
    :qid |qp.fvfValDef1|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite (= (loc<Ref> a@2@01 1) (loc<Ref> a@2@01 1)) $Perm.Write $Perm.No)
    (ite
      (and
        (img@7@01 (loc<Ref> a@2@01 1))
        (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 (loc<Ref> a@2@01 1))))
      (- $Perm.Write (pTaken@12@01 (loc<Ref> a@2@01 1)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, 0).val + old(loc(a, 1).val)
; [eval] loc(a, 0)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@2@01 1))
      (=
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@12@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) r)))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) r))
    :qid |qp.fvfValDef1|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite (= (loc<Ref> a@2@01 0) (loc<Ref> a@2@01 1)) $Perm.Write $Perm.No)
    (ite
      (and
        (img@7@01 (loc<Ref> a@2@01 0))
        (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 (loc<Ref> a@2@01 0))))
      (- $Perm.Write (pTaken@12@01 (loc<Ref> a@2@01 0)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(loc(a, 1).val)
; [eval] loc(a, 1)
(push) ; 3
(assert (not (and
  (img@7@01 (loc<Ref> a@2@01 1))
  (Seq_contains (Seq_range 0 n@3@01) (inv@6@01 (loc<Ref> a@2@01 1))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@2@01 1))
  (+
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@2@01 0))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) (loc<Ref> a@2@01 1))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@2@01 1))
  (+
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@2@01 0))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@4@01)) (loc<Ref> a@2@01 1)))))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const a1@20@01 IArray)
(declare-const a2@21@01 IArray)
(declare-const n@22@01 Int)
(declare-const a1@23@01 IArray)
(declare-const a2@24@01 IArray)
(declare-const n@25@01 Int)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
; [eval] a1 != a2
(assert (not (= a1@23@01 a2@24@01)))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(declare-const i@27@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@25@01) i@27@01))
; [eval] loc(a1, i)
(pop) ; 2
(declare-fun inv@28@01 ($Ref) Int)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@27@01 Int) (i2@27@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@25@01) i1@27@01)
      (Seq_contains (Seq_range 0 n@25@01) i2@27@01)
      (= (loc<Ref> a1@23@01 i1@27@01) (loc<Ref> a1@23@01 i2@27@01)))
    (= i1@27@01 i2@27@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@27@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@25@01) i@27@01)
    (and
      (= (inv@28@01 (loc<Ref> a1@23@01 i@27@01)) i@27@01)
      (img@29@01 (loc<Ref> a1@23@01 i@27@01))))
  :pattern ((loc<Ref> a1@23@01 i@27@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (Seq_contains (Seq_range 0 n@25@01) (inv@28@01 r)))
    (= (loc<Ref> a1@23@01 (inv@28@01 r)) r))
  :pattern ((inv@28@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@27@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@25@01) i@27@01)
    (not (= (loc<Ref> a1@23@01 i@27@01) $Ref.null)))
  :pattern ((loc<Ref> a1@23@01 i@27@01))
  :qid |val-permImpliesNonNull|)))
(declare-const i@30@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@25@01) i@30@01))
; [eval] loc(a2, i)
(pop) ; 2
(declare-fun inv@31@01 ($Ref) Int)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@30@01 Int) (i2@30@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@25@01) i1@30@01)
      (Seq_contains (Seq_range 0 n@25@01) i2@30@01)
      (= (loc<Ref> a2@24@01 i1@30@01) (loc<Ref> a2@24@01 i2@30@01)))
    (= i1@30@01 i2@30@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@30@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@25@01) i@30@01)
    (and
      (= (inv@31@01 (loc<Ref> a2@24@01 i@30@01)) i@30@01)
      (img@32@01 (loc<Ref> a2@24@01 i@30@01))))
  :pattern ((loc<Ref> a2@24@01 i@30@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains (Seq_range 0 n@25@01) (inv@31@01 r)))
    (= (loc<Ref> a2@24@01 (inv@31@01 r)) r))
  :pattern ((inv@31@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@30@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@25@01) i@30@01)
    (not (= (loc<Ref> a2@24@01 i@30@01) $Ref.null)))
  :pattern ((loc<Ref> a2@24@01 i@30@01))
  :qid |val-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (loc<Ref> a2@24@01 i@30@01) (loc<Ref> a1@23@01 i@27@01))
    (=
      (and (img@32@01 r) (Seq_contains (Seq_range 0 n@25@01) (inv@31@01 r)))
      (and (img@29@01 r) (Seq_contains (Seq_range 0 n@25@01) (inv@28@01 r)))))
  
  :qid |quant-u-18|))))
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
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall i: Int ::
;     { (i in [0..n)) }
;     { loc(a1, i) }
;     { loc(a2, i) }
;     (i in [0..n)) ==> loc(a1, i) != loc(a2, i))
; [eval] (forall i: Int :: { (i in [0..n)) } { loc(a1, i) } { loc(a2, i) } (i in [0..n)) ==> loc(a1, i) != loc(a2, i))
(declare-const i@33@01 Int)
(push) ; 3
; [eval] (i in [0..n)) ==> loc(a1, i) != loc(a2, i)
; [eval] (i in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 0 | i@33@01 in [0..n@25@01] | live]
; [else-branch: 0 | !(i@33@01 in [0..n@25@01]) | live]
(push) ; 5
; [then-branch: 0 | i@33@01 in [0..n@25@01]]
(assert (Seq_contains (Seq_range 0 n@25@01) i@33@01))
; [eval] loc(a1, i) != loc(a2, i)
; [eval] loc(a1, i)
; [eval] loc(a2, i)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(i@33@01 in [0..n@25@01])]
(assert (not (Seq_contains (Seq_range 0 n@25@01) i@33@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 n@25@01) i@33@01))
  (Seq_contains (Seq_range 0 n@25@01) i@33@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@33@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 n@25@01) i@33@01))
    (Seq_contains (Seq_range 0 n@25@01) i@33@01))
  :pattern ((Seq_contains (Seq_range 0 n@25@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@25@01) i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@52@10@52@67-aux|)))
(assert (forall ((i@33@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 n@25@01) i@33@01))
    (Seq_contains (Seq_range 0 n@25@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@25@01) i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@52@10@52@67-aux|)))
(assert (forall ((i@33@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 n@25@01) i@33@01))
    (Seq_contains (Seq_range 0 n@25@01) i@33@01))
  :pattern ((loc<Ref> a1@23@01 i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@52@10@52@67-aux|)))
(assert (forall ((i@33@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 n@25@01) i@33@01))
    (Seq_contains (Seq_range 0 n@25@01) i@33@01))
  :pattern ((loc<Ref> a2@24@01 i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@52@10@52@67-aux|)))
(push) ; 3
(assert (not (forall ((i@33@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@25@01) i@33@01)
    (not (= (loc<Ref> a1@23@01 i@33@01) (loc<Ref> a2@24@01 i@33@01))))
  :pattern ((Seq_contains (Seq_range 0 n@25@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@25@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@25@01) i@33@01))
  :pattern ((loc<Ref> a1@23@01 i@33@01))
  :pattern ((loc<Ref> a2@24@01 i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@52@10@52@67|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@33@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@25@01) i@33@01)
    (not (= (loc<Ref> a1@23@01 i@33@01) (loc<Ref> a2@24@01 i@33@01))))
  :pattern ((Seq_contains (Seq_range 0 n@25@01) i@33@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@25@01) i@33@01))
  :pattern ((loc<Ref> a1@23@01 i@33@01))
  :pattern ((loc<Ref> a2@24@01 i@33@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@52@10@52@67|)))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const a@34@01 IArray)
(declare-const left@35@01 Int)
(declare-const right@36@01 Int)
(declare-const pw1@37@01 Seq<Int>)
(declare-const pw2@38@01 Seq<Int>)
(declare-const a@39@01 IArray)
(declare-const left@40@01 Int)
(declare-const right@41@01 Int)
(declare-const pw1@42@01 Seq<Int>)
(declare-const pw2@43@01 Seq<Int>)
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
; inhale left == 0
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] left == 0
(assert (= left@40@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale right <= len(a)
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 $Snap.unit))
; [eval] right <= len(a)
; [eval] len(a)
(assert (<= right@41@01 (len<Int> a@39@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale 0 <= left && (left < right && right < len(a))
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(assert (= ($Snap.first $t@46@01) $Snap.unit))
; [eval] 0 <= left
(assert (<= 0 left@40@01))
(assert (=
  ($Snap.second $t@46@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@46@01))
    ($Snap.second ($Snap.second $t@46@01)))))
(assert (= ($Snap.first ($Snap.second $t@46@01)) $Snap.unit))
; [eval] left < right
(assert (< left@40@01 right@41@01))
(assert (= ($Snap.second ($Snap.second $t@46@01)) $Snap.unit))
; [eval] right < len(a)
; [eval] len(a)
(assert (< right@41@01 (len<Int> a@39@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [left..right + 1)) ==>
;     acc(loc_limited(a, i).val, write))
(declare-const i@47@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [left..right + 1))
; [eval] [left..right + 1)
; [eval] right + 1
(assert (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) i@47@01))
; [eval] loc_limited(a, i)
(pop) ; 3
(declare-const $t@48@01 $FVF<val>)
(declare-fun inv@49@01 ($Ref) Int)
(declare-fun img@50@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@47@01 Int) (i2@47@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) i1@47@01)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) i2@47@01)
      (= (loc_limited<Ref> a@39@01 i1@47@01) (loc_limited<Ref> a@39@01 i2@47@01)))
    (= i1@47@01 i2@47@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@47@01 Int)) (!
  (=>
    (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) i@47@01)
    (and
      (= (inv@49@01 (loc_limited<Ref> a@39@01 i@47@01)) i@47@01)
      (img@50@01 (loc_limited<Ref> a@39@01 i@47@01))))
  :pattern ((loc_limited<Ref> a@39@01 i@47@01))
  :qid |quant-u-20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= (loc_limited<Ref> a@39@01 (inv@49@01 r)) r))
  :pattern ((inv@49@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@47@01 Int)) (!
  (=>
    (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) i@47@01)
    (not (= (loc_limited<Ref> a@39@01 i@47@01) $Ref.null)))
  :pattern ((loc_limited<Ref> a@39@01 i@47@01))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@51@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) ($FVF.lookup_val $t@48@01 r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@48@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) r))
  :pattern ((inv@49@01 r))
  :qid |quant-u-21|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale |pw1| == |pw2| && |pw2| == right + 1 - left
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 ($Snap.combine ($Snap.first $t@52@01) ($Snap.second $t@52@01))))
(assert (= ($Snap.first $t@52@01) $Snap.unit))
; [eval] |pw1| == |pw2|
; [eval] |pw1|
; [eval] |pw2|
(assert (= (Seq_length pw1@42@01) (Seq_length pw2@43@01)))
(assert (= ($Snap.second $t@52@01) $Snap.unit))
; [eval] |pw2| == right + 1 - left
; [eval] |pw2|
; [eval] right + 1 - left
; [eval] right + 1
(assert (= (Seq_length pw2@43@01) (- (+ right@41@01 1) left@40@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { pw1[i] }
;     0 <= i && i < |pw1| ==> left <= pw1[i] && pw1[i] <= right)
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 $Snap.unit))
; [eval] (forall i: Int :: { pw1[i] } 0 <= i && i < |pw1| ==> left <= pw1[i] && pw1[i] <= right)
(declare-const i@54@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |pw1| ==> left <= pw1[i] && pw1[i] <= right
; [eval] 0 <= i && i < |pw1|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 1 | !(0 <= i@54@01) | live]
; [else-branch: 1 | 0 <= i@54@01 | live]
(push) ; 5
; [then-branch: 1 | !(0 <= i@54@01)]
(assert (not (<= 0 i@54@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | 0 <= i@54@01]
(assert (<= 0 i@54@01))
; [eval] i < |pw1|
; [eval] |pw1|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@54@01) (not (<= 0 i@54@01))))
(push) ; 4
; [then-branch: 2 | 0 <= i@54@01 && i@54@01 < |pw1@42@01| | live]
; [else-branch: 2 | !(0 <= i@54@01 && i@54@01 < |pw1@42@01|) | live]
(push) ; 5
; [then-branch: 2 | 0 <= i@54@01 && i@54@01 < |pw1@42@01|]
(assert (and (<= 0 i@54@01) (< i@54@01 (Seq_length pw1@42@01))))
; [eval] left <= pw1[i] && pw1[i] <= right
; [eval] left <= pw1[i]
; [eval] pw1[i]
(push) ; 6
(assert (not (>= i@54@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 3 | !(left@40@01 <= pw1@42@01[i@54@01]) | live]
; [else-branch: 3 | left@40@01 <= pw1@42@01[i@54@01] | live]
(push) ; 7
; [then-branch: 3 | !(left@40@01 <= pw1@42@01[i@54@01])]
(assert (not (<= left@40@01 (Seq_index pw1@42@01 i@54@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | left@40@01 <= pw1@42@01[i@54@01]]
(assert (<= left@40@01 (Seq_index pw1@42@01 i@54@01)))
; [eval] pw1[i] <= right
; [eval] pw1[i]
(push) ; 8
(assert (not (>= i@54@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<= left@40@01 (Seq_index pw1@42@01 i@54@01))
  (not (<= left@40@01 (Seq_index pw1@42@01 i@54@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(0 <= i@54@01 && i@54@01 < |pw1@42@01|)]
(assert (not (and (<= 0 i@54@01) (< i@54@01 (Seq_length pw1@42@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@54@01) (< i@54@01 (Seq_length pw1@42@01)))
  (and
    (<= 0 i@54@01)
    (< i@54@01 (Seq_length pw1@42@01))
    (or
      (<= left@40@01 (Seq_index pw1@42@01 i@54@01))
      (not (<= left@40@01 (Seq_index pw1@42@01 i@54@01)))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@54@01) (< i@54@01 (Seq_length pw1@42@01))))
  (and (<= 0 i@54@01) (< i@54@01 (Seq_length pw1@42@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@54@01 Int)) (!
  (and
    (or (<= 0 i@54@01) (not (<= 0 i@54@01)))
    (=>
      (and (<= 0 i@54@01) (< i@54@01 (Seq_length pw1@42@01)))
      (and
        (<= 0 i@54@01)
        (< i@54@01 (Seq_length pw1@42@01))
        (or
          (<= left@40@01 (Seq_index pw1@42@01 i@54@01))
          (not (<= left@40@01 (Seq_index pw1@42@01 i@54@01))))))
    (or
      (not (and (<= 0 i@54@01) (< i@54@01 (Seq_length pw1@42@01))))
      (and (<= 0 i@54@01) (< i@54@01 (Seq_length pw1@42@01)))))
  :pattern ((Seq_index pw1@42@01 i@54@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@64@10@64@84-aux|)))
(assert (forall ((i@54@01 Int)) (!
  (=>
    (and (<= 0 i@54@01) (< i@54@01 (Seq_length pw1@42@01)))
    (and
      (<= left@40@01 (Seq_index pw1@42@01 i@54@01))
      (<= (Seq_index pw1@42@01 i@54@01) right@41@01)))
  :pattern ((Seq_index pw1@42@01 i@54@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@64@10@64@84|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { pw2[i] }
;     0 <= i && i < |pw2| ==> left <= pw2[i] && pw2[i] <= right)
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 $Snap.unit))
; [eval] (forall i: Int :: { pw2[i] } 0 <= i && i < |pw2| ==> left <= pw2[i] && pw2[i] <= right)
(declare-const i@56@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |pw2| ==> left <= pw2[i] && pw2[i] <= right
; [eval] 0 <= i && i < |pw2|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 4 | !(0 <= i@56@01) | live]
; [else-branch: 4 | 0 <= i@56@01 | live]
(push) ; 5
; [then-branch: 4 | !(0 <= i@56@01)]
(assert (not (<= 0 i@56@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | 0 <= i@56@01]
(assert (<= 0 i@56@01))
; [eval] i < |pw2|
; [eval] |pw2|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@56@01) (not (<= 0 i@56@01))))
(push) ; 4
; [then-branch: 5 | 0 <= i@56@01 && i@56@01 < |pw2@43@01| | live]
; [else-branch: 5 | !(0 <= i@56@01 && i@56@01 < |pw2@43@01|) | live]
(push) ; 5
; [then-branch: 5 | 0 <= i@56@01 && i@56@01 < |pw2@43@01|]
(assert (and (<= 0 i@56@01) (< i@56@01 (Seq_length pw2@43@01))))
; [eval] left <= pw2[i] && pw2[i] <= right
; [eval] left <= pw2[i]
; [eval] pw2[i]
(push) ; 6
(assert (not (>= i@56@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 6 | !(left@40@01 <= pw2@43@01[i@56@01]) | live]
; [else-branch: 6 | left@40@01 <= pw2@43@01[i@56@01] | live]
(push) ; 7
; [then-branch: 6 | !(left@40@01 <= pw2@43@01[i@56@01])]
(assert (not (<= left@40@01 (Seq_index pw2@43@01 i@56@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | left@40@01 <= pw2@43@01[i@56@01]]
(assert (<= left@40@01 (Seq_index pw2@43@01 i@56@01)))
; [eval] pw2[i] <= right
; [eval] pw2[i]
(push) ; 8
(assert (not (>= i@56@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<= left@40@01 (Seq_index pw2@43@01 i@56@01))
  (not (<= left@40@01 (Seq_index pw2@43@01 i@56@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(0 <= i@56@01 && i@56@01 < |pw2@43@01|)]
(assert (not (and (<= 0 i@56@01) (< i@56@01 (Seq_length pw2@43@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@56@01) (< i@56@01 (Seq_length pw2@43@01)))
  (and
    (<= 0 i@56@01)
    (< i@56@01 (Seq_length pw2@43@01))
    (or
      (<= left@40@01 (Seq_index pw2@43@01 i@56@01))
      (not (<= left@40@01 (Seq_index pw2@43@01 i@56@01)))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@56@01) (< i@56@01 (Seq_length pw2@43@01))))
  (and (<= 0 i@56@01) (< i@56@01 (Seq_length pw2@43@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@56@01 Int)) (!
  (and
    (or (<= 0 i@56@01) (not (<= 0 i@56@01)))
    (=>
      (and (<= 0 i@56@01) (< i@56@01 (Seq_length pw2@43@01)))
      (and
        (<= 0 i@56@01)
        (< i@56@01 (Seq_length pw2@43@01))
        (or
          (<= left@40@01 (Seq_index pw2@43@01 i@56@01))
          (not (<= left@40@01 (Seq_index pw2@43@01 i@56@01))))))
    (or
      (not (and (<= 0 i@56@01) (< i@56@01 (Seq_length pw2@43@01))))
      (and (<= 0 i@56@01) (< i@56@01 (Seq_length pw2@43@01)))))
  :pattern ((Seq_index pw2@43@01 i@56@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@65@10@65@84-aux|)))
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 (Seq_length pw2@43@01)))
    (and
      (<= left@40@01 (Seq_index pw2@43@01 i@56@01))
      (<= (Seq_index pw2@43@01 i@56@01) right@41@01)))
  :pattern ((Seq_index pw2@43@01 i@56@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@65@10@65@84|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::
;     { loc(a, j).val }
;     0 <= j - left && j - left < |pw1| ==>
;     loc(a, j).val == loc_limited(a, pw1[j - left]).val)
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 $Snap.unit))
; [eval] (forall j: Int :: { loc(a, j).val } 0 <= j - left && j - left < |pw1| ==> loc(a, j).val == loc_limited(a, pw1[j - left]).val)
(declare-const j@58@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j - left && j - left < |pw1| ==> loc(a, j).val == loc_limited(a, pw1[j - left]).val
; [eval] 0 <= j - left && j - left < |pw1|
; [eval] 0 <= j - left
; [eval] j - left
(push) ; 4
; [then-branch: 7 | !(0 <= j@58@01 - left@40@01) | live]
; [else-branch: 7 | 0 <= j@58@01 - left@40@01 | live]
(push) ; 5
; [then-branch: 7 | !(0 <= j@58@01 - left@40@01)]
(assert (not (<= 0 (- j@58@01 left@40@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | 0 <= j@58@01 - left@40@01]
(assert (<= 0 (- j@58@01 left@40@01)))
; [eval] j - left < |pw1|
; [eval] j - left
; [eval] |pw1|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 (- j@58@01 left@40@01)) (not (<= 0 (- j@58@01 left@40@01)))))
(push) ; 4
; [then-branch: 8 | 0 <= j@58@01 - left@40@01 && j@58@01 - left@40@01 < |pw1@42@01| | live]
; [else-branch: 8 | !(0 <= j@58@01 - left@40@01 && j@58@01 - left@40@01 < |pw1@42@01|) | live]
(push) ; 5
; [then-branch: 8 | 0 <= j@58@01 - left@40@01 && j@58@01 - left@40@01 < |pw1@42@01|]
(assert (and
  (<= 0 (- j@58@01 left@40@01))
  (< (- j@58@01 left@40@01) (Seq_length pw1@42@01))))
; [eval] loc(a, j).val == loc_limited(a, pw1[j - left]).val
; [eval] loc(a, j)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@50@01 r)
        (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
      (=
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
        ($FVF.lookup_val $t@48@01 r)))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val $t@48@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 j@58@01)) (loc<Ref> a@39@01 j@58@01)))
(push) ; 6
(assert (not (and
  (img@50@01 (loc<Ref> a@39@01 j@58@01))
  (Seq_contains
    (Seq_range left@40@01 (+ right@41@01 1))
    (inv@49@01 (loc<Ref> a@39@01 j@58@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc_limited(a, pw1[j - left])
; [eval] pw1[j - left]
; [eval] j - left
(push) ; 6
(assert (not (>= (- j@58@01 left@40@01) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@50@01 r)
        (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
      (=
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
        ($FVF.lookup_val $t@48@01 r)))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val $t@48@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 (Seq_index
  pw1@42@01
  (- j@58@01 left@40@01)))) (loc_limited<Ref> a@39@01 (Seq_index
  pw1@42@01
  (- j@58@01 left@40@01)))))
(push) ; 6
(assert (not (and
  (img@50@01 (loc_limited<Ref> a@39@01 (Seq_index
    pw1@42@01
    (- j@58@01 left@40@01))))
  (Seq_contains
    (Seq_range left@40@01 (+ right@41@01 1))
    (inv@49@01 (loc_limited<Ref> a@39@01 (Seq_index
      pw1@42@01
      (- j@58@01 left@40@01))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(0 <= j@58@01 - left@40@01 && j@58@01 - left@40@01 < |pw1@42@01|)]
(assert (not
  (and
    (<= 0 (- j@58@01 left@40@01))
    (< (- j@58@01 left@40@01) (Seq_length pw1@42@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) ($FVF.lookup_val $t@48@01 r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@48@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (=>
  (and
    (<= 0 (- j@58@01 left@40@01))
    (< (- j@58@01 left@40@01) (Seq_length pw1@42@01)))
  (and
    (<= 0 (- j@58@01 left@40@01))
    (< (- j@58@01 left@40@01) (Seq_length pw1@42@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 j@58@01)) (loc<Ref> a@39@01 j@58@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 (Seq_index
      pw1@42@01
      (- j@58@01 left@40@01)))) (loc_limited<Ref> a@39@01 (Seq_index
      pw1@42@01
      (- j@58@01 left@40@01)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 (- j@58@01 left@40@01))
      (< (- j@58@01 left@40@01) (Seq_length pw1@42@01))))
  (and
    (<= 0 (- j@58@01 left@40@01))
    (< (- j@58@01 left@40@01) (Seq_length pw1@42@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) ($FVF.lookup_val $t@48@01 r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@48@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@58@01 Int)) (!
  (and
    (or (<= 0 (- j@58@01 left@40@01)) (not (<= 0 (- j@58@01 left@40@01))))
    (=>
      (and
        (<= 0 (- j@58@01 left@40@01))
        (< (- j@58@01 left@40@01) (Seq_length pw1@42@01)))
      (and
        (<= 0 (- j@58@01 left@40@01))
        (< (- j@58@01 left@40@01) (Seq_length pw1@42@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 j@58@01)) (loc<Ref> a@39@01 j@58@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 (Seq_index
          pw1@42@01
          (- j@58@01 left@40@01)))) (loc_limited<Ref> a@39@01 (Seq_index
          pw1@42@01
          (- j@58@01 left@40@01))))))
    (or
      (not
        (and
          (<= 0 (- j@58@01 left@40@01))
          (< (- j@58@01 left@40@01) (Seq_length pw1@42@01))))
      (and
        (<= 0 (- j@58@01 left@40@01))
        (< (- j@58@01 left@40@01) (Seq_length pw1@42@01)))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 j@58@01)) (loc<Ref> a@39@01 j@58@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@68@10@68@130-aux|)))
(assert (forall ((j@58@01 Int)) (!
  (=>
    (and
      (<= 0 (- j@58@01 left@40@01))
      (< (- j@58@01 left@40@01) (Seq_length pw1@42@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 j@58@01))
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 (Seq_index
        pw1@42@01
        (- j@58@01 left@40@01))))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 j@58@01)) (loc<Ref> a@39@01 j@58@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@68@10@68@130|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::
;     { loc(a, pw2[j]) }
;     0 <= j && j < |pw2| ==>
;     loc_limited(a, j + left).val == loc(a, pw2[j]).val)
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 $Snap.unit))
; [eval] (forall j: Int :: { loc(a, pw2[j]) } 0 <= j && j < |pw2| ==> loc_limited(a, j + left).val == loc(a, pw2[j]).val)
(declare-const j@60@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && j < |pw2| ==> loc_limited(a, j + left).val == loc(a, pw2[j]).val
; [eval] 0 <= j && j < |pw2|
; [eval] 0 <= j
(push) ; 4
; [then-branch: 9 | !(0 <= j@60@01) | live]
; [else-branch: 9 | 0 <= j@60@01 | live]
(push) ; 5
; [then-branch: 9 | !(0 <= j@60@01)]
(assert (not (<= 0 j@60@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | 0 <= j@60@01]
(assert (<= 0 j@60@01))
; [eval] j < |pw2|
; [eval] |pw2|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@60@01) (not (<= 0 j@60@01))))
(push) ; 4
; [then-branch: 10 | 0 <= j@60@01 && j@60@01 < |pw2@43@01| | live]
; [else-branch: 10 | !(0 <= j@60@01 && j@60@01 < |pw2@43@01|) | live]
(push) ; 5
; [then-branch: 10 | 0 <= j@60@01 && j@60@01 < |pw2@43@01|]
(assert (and (<= 0 j@60@01) (< j@60@01 (Seq_length pw2@43@01))))
; [eval] loc_limited(a, j + left).val == loc(a, pw2[j]).val
; [eval] loc_limited(a, j + left)
; [eval] j + left
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@50@01 r)
        (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
      (=
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
        ($FVF.lookup_val $t@48@01 r)))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val $t@48@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 (+
  j@60@01
  left@40@01))) (loc_limited<Ref> a@39@01 (+ j@60@01 left@40@01))))
(push) ; 6
(assert (not (and
  (img@50@01 (loc_limited<Ref> a@39@01 (+ j@60@01 left@40@01)))
  (Seq_contains
    (Seq_range left@40@01 (+ right@41@01 1))
    (inv@49@01 (loc_limited<Ref> a@39@01 (+ j@60@01 left@40@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, pw2[j])
; [eval] pw2[j]
(push) ; 6
(assert (not (>= j@60@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@50@01 r)
        (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
      (=
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
        ($FVF.lookup_val $t@48@01 r)))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val $t@48@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
  pw2@43@01
  j@60@01))) (loc<Ref> a@39@01 (Seq_index pw2@43@01 j@60@01))))
(push) ; 6
(assert (not (and
  (img@50@01 (loc<Ref> a@39@01 (Seq_index pw2@43@01 j@60@01)))
  (Seq_contains
    (Seq_range left@40@01 (+ right@41@01 1))
    (inv@49@01 (loc<Ref> a@39@01 (Seq_index pw2@43@01 j@60@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(0 <= j@60@01 && j@60@01 < |pw2@43@01|)]
(assert (not (and (<= 0 j@60@01) (< j@60@01 (Seq_length pw2@43@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) ($FVF.lookup_val $t@48@01 r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@48@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (=>
  (and (<= 0 j@60@01) (< j@60@01 (Seq_length pw2@43@01)))
  (and
    (<= 0 j@60@01)
    (< j@60@01 (Seq_length pw2@43@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 (+
      j@60@01
      left@40@01))) (loc_limited<Ref> a@39@01 (+ j@60@01 left@40@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
      pw2@43@01
      j@60@01))) (loc<Ref> a@39@01 (Seq_index pw2@43@01 j@60@01))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 j@60@01) (< j@60@01 (Seq_length pw2@43@01))))
  (and (<= 0 j@60@01) (< j@60@01 (Seq_length pw2@43@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) ($FVF.lookup_val $t@48@01 r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@48@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@60@01 Int)) (!
  (and
    (or (<= 0 j@60@01) (not (<= 0 j@60@01)))
    (=>
      (and (<= 0 j@60@01) (< j@60@01 (Seq_length pw2@43@01)))
      (and
        (<= 0 j@60@01)
        (< j@60@01 (Seq_length pw2@43@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 (+
          j@60@01
          left@40@01))) (loc_limited<Ref> a@39@01 (+ j@60@01 left@40@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
          pw2@43@01
          j@60@01))) (loc<Ref> a@39@01 (Seq_index pw2@43@01 j@60@01)))))
    (or
      (not (and (<= 0 j@60@01) (< j@60@01 (Seq_length pw2@43@01))))
      (and (<= 0 j@60@01) (< j@60@01 (Seq_length pw2@43@01)))))
  :pattern ((loc<Ref> a@39@01 (Seq_index pw2@43@01 j@60@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@69@10@69@118-aux|)))
(assert (forall ((j@60@01 Int)) (!
  (=>
    (and (<= 0 j@60@01) (< j@60@01 (Seq_length pw2@43@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 (+
        j@60@01
        left@40@01)))
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
        pw2@43@01
        j@60@01)))))
  :pattern ((loc<Ref> a@39@01 (Seq_index pw2@43@01 j@60@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@69@10@69@118|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall j: Int ::
;     { loc(a, pw1[j]) }
;     0 <= j && j < |pw1| ==> loc(a, j + left).val == loc(a, pw1[j]).val)
; [eval] (forall j: Int :: { loc(a, pw1[j]) } 0 <= j && j < |pw1| ==> loc(a, j + left).val == loc(a, pw1[j]).val)
(declare-const j@61@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && j < |pw1| ==> loc(a, j + left).val == loc(a, pw1[j]).val
; [eval] 0 <= j && j < |pw1|
; [eval] 0 <= j
(push) ; 4
; [then-branch: 11 | !(0 <= j@61@01) | live]
; [else-branch: 11 | 0 <= j@61@01 | live]
(push) ; 5
; [then-branch: 11 | !(0 <= j@61@01)]
(assert (not (<= 0 j@61@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | 0 <= j@61@01]
(assert (<= 0 j@61@01))
; [eval] j < |pw1|
; [eval] |pw1|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@61@01) (not (<= 0 j@61@01))))
(push) ; 4
; [then-branch: 12 | 0 <= j@61@01 && j@61@01 < |pw1@42@01| | live]
; [else-branch: 12 | !(0 <= j@61@01 && j@61@01 < |pw1@42@01|) | live]
(push) ; 5
; [then-branch: 12 | 0 <= j@61@01 && j@61@01 < |pw1@42@01|]
(assert (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01))))
; [eval] loc(a, j + left).val == loc(a, pw1[j]).val
; [eval] loc(a, j + left)
; [eval] j + left
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@50@01 r)
        (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
      (=
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
        ($FVF.lookup_val $t@48@01 r)))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val $t@48@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (+
  j@61@01
  left@40@01))) (loc<Ref> a@39@01 (+ j@61@01 left@40@01))))
(push) ; 6
(assert (not (and
  (img@50@01 (loc<Ref> a@39@01 (+ j@61@01 left@40@01)))
  (Seq_contains
    (Seq_range left@40@01 (+ right@41@01 1))
    (inv@49@01 (loc<Ref> a@39@01 (+ j@61@01 left@40@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, pw1[j])
; [eval] pw1[j]
(push) ; 6
(assert (not (>= j@61@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@50@01 r)
        (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
      (=
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
        ($FVF.lookup_val $t@48@01 r)))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val $t@48@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
  pw1@42@01
  j@61@01))) (loc<Ref> a@39@01 (Seq_index pw1@42@01 j@61@01))))
(push) ; 6
(assert (not (and
  (img@50@01 (loc<Ref> a@39@01 (Seq_index pw1@42@01 j@61@01)))
  (Seq_contains
    (Seq_range left@40@01 (+ right@41@01 1))
    (inv@49@01 (loc<Ref> a@39@01 (Seq_index pw1@42@01 j@61@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 12 | !(0 <= j@61@01 && j@61@01 < |pw1@42@01|)]
(assert (not (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) ($FVF.lookup_val $t@48@01 r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@48@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (=>
  (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01)))
  (and
    (<= 0 j@61@01)
    (< j@61@01 (Seq_length pw1@42@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (+
      j@61@01
      left@40@01))) (loc<Ref> a@39@01 (+ j@61@01 left@40@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
      pw1@42@01
      j@61@01))) (loc<Ref> a@39@01 (Seq_index pw1@42@01 j@61@01))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01))))
  (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) ($FVF.lookup_val $t@48@01 r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@48@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@61@01 Int)) (!
  (and
    (or (<= 0 j@61@01) (not (<= 0 j@61@01)))
    (=>
      (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01)))
      (and
        (<= 0 j@61@01)
        (< j@61@01 (Seq_length pw1@42@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (+
          j@61@01
          left@40@01))) (loc<Ref> a@39@01 (+ j@61@01 left@40@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
          pw1@42@01
          j@61@01))) (loc<Ref> a@39@01 (Seq_index pw1@42@01 j@61@01)))))
    (or
      (not (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01))))
      (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01)))))
  :pattern ((loc<Ref> a@39@01 (Seq_index pw1@42@01 j@61@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@71@10@71@110-aux|)))
(push) ; 3
(assert (not (forall ((j@61@01 Int)) (!
  (=>
    (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (+
        j@61@01
        left@40@01)))
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
        pw1@42@01
        j@61@01)))))
  :pattern ((loc<Ref> a@39@01 (Seq_index pw1@42@01 j@61@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@71@10@71@110|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@61@01 Int)) (!
  (=>
    (and (<= 0 j@61@01) (< j@61@01 (Seq_length pw1@42@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (+
        j@61@01
        left@40@01)))
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
        pw1@42@01
        j@61@01)))))
  :pattern ((loc<Ref> a@39@01 (Seq_index pw1@42@01 j@61@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@71@10@71@110|)))
; [exec]
; assert (forall k: Int ::
;     { loc(a, k) }
;     0 <= k - left && k - left < |pw2| ==>
;     loc_limited(a, k).val == loc(a, pw2[k - left]).val)
; [eval] (forall k: Int :: { loc(a, k) } 0 <= k - left && k - left < |pw2| ==> loc_limited(a, k).val == loc(a, pw2[k - left]).val)
(declare-const k@62@01 Int)
(push) ; 3
; [eval] 0 <= k - left && k - left < |pw2| ==> loc_limited(a, k).val == loc(a, pw2[k - left]).val
; [eval] 0 <= k - left && k - left < |pw2|
; [eval] 0 <= k - left
; [eval] k - left
(push) ; 4
; [then-branch: 13 | !(0 <= k@62@01 - left@40@01) | live]
; [else-branch: 13 | 0 <= k@62@01 - left@40@01 | live]
(push) ; 5
; [then-branch: 13 | !(0 <= k@62@01 - left@40@01)]
(assert (not (<= 0 (- k@62@01 left@40@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | 0 <= k@62@01 - left@40@01]
(assert (<= 0 (- k@62@01 left@40@01)))
; [eval] k - left < |pw2|
; [eval] k - left
; [eval] |pw2|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 (- k@62@01 left@40@01)) (not (<= 0 (- k@62@01 left@40@01)))))
(push) ; 4
; [then-branch: 14 | 0 <= k@62@01 - left@40@01 && k@62@01 - left@40@01 < |pw2@43@01| | live]
; [else-branch: 14 | !(0 <= k@62@01 - left@40@01 && k@62@01 - left@40@01 < |pw2@43@01|) | live]
(push) ; 5
; [then-branch: 14 | 0 <= k@62@01 - left@40@01 && k@62@01 - left@40@01 < |pw2@43@01|]
(assert (and
  (<= 0 (- k@62@01 left@40@01))
  (< (- k@62@01 left@40@01) (Seq_length pw2@43@01))))
; [eval] loc_limited(a, k).val == loc(a, pw2[k - left]).val
; [eval] loc_limited(a, k)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@50@01 r)
        (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
      (=
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
        ($FVF.lookup_val $t@48@01 r)))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val $t@48@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 k@62@01)) (loc_limited<Ref> a@39@01 k@62@01)))
(push) ; 6
(assert (not (and
  (img@50@01 (loc_limited<Ref> a@39@01 k@62@01))
  (Seq_contains
    (Seq_range left@40@01 (+ right@41@01 1))
    (inv@49@01 (loc_limited<Ref> a@39@01 k@62@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, pw2[k - left])
; [eval] pw2[k - left]
; [eval] k - left
(push) ; 6
(assert (not (>= (- k@62@01 left@40@01) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@50@01 r)
        (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
      (=
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
        ($FVF.lookup_val $t@48@01 r)))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val $t@48@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
  pw2@43@01
  (- k@62@01 left@40@01)))) (loc<Ref> a@39@01 (Seq_index
  pw2@43@01
  (- k@62@01 left@40@01)))))
(push) ; 6
(assert (not (and
  (img@50@01 (loc<Ref> a@39@01 (Seq_index pw2@43@01 (- k@62@01 left@40@01))))
  (Seq_contains
    (Seq_range left@40@01 (+ right@41@01 1))
    (inv@49@01 (loc<Ref> a@39@01 (Seq_index pw2@43@01 (- k@62@01 left@40@01))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(0 <= k@62@01 - left@40@01 && k@62@01 - left@40@01 < |pw2@43@01|)]
(assert (not
  (and
    (<= 0 (- k@62@01 left@40@01))
    (< (- k@62@01 left@40@01) (Seq_length pw2@43@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) ($FVF.lookup_val $t@48@01 r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@48@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (=>
  (and
    (<= 0 (- k@62@01 left@40@01))
    (< (- k@62@01 left@40@01) (Seq_length pw2@43@01)))
  (and
    (<= 0 (- k@62@01 left@40@01))
    (< (- k@62@01 left@40@01) (Seq_length pw2@43@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 k@62@01)) (loc_limited<Ref> a@39@01 k@62@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
      pw2@43@01
      (- k@62@01 left@40@01)))) (loc<Ref> a@39@01 (Seq_index
      pw2@43@01
      (- k@62@01 left@40@01)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 (- k@62@01 left@40@01))
      (< (- k@62@01 left@40@01) (Seq_length pw2@43@01))))
  (and
    (<= 0 (- k@62@01 left@40@01))
    (< (- k@62@01 left@40@01) (Seq_length pw2@43@01)))))
; [eval] loc(a, k)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Seq_contains (Seq_range left@40@01 (+ right@41@01 1)) (inv@49@01 r)))
    (= ($FVF.lookup_val (as sm@51@01  $FVF<val>) r) ($FVF.lookup_val $t@48@01 r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@48@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@48@01 r) r)
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@62@01 Int)) (!
  (and
    (or (<= 0 (- k@62@01 left@40@01)) (not (<= 0 (- k@62@01 left@40@01))))
    (=>
      (and
        (<= 0 (- k@62@01 left@40@01))
        (< (- k@62@01 left@40@01) (Seq_length pw2@43@01)))
      (and
        (<= 0 (- k@62@01 left@40@01))
        (< (- k@62@01 left@40@01) (Seq_length pw2@43@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 k@62@01)) (loc_limited<Ref> a@39@01 k@62@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
          pw2@43@01
          (- k@62@01 left@40@01)))) (loc<Ref> a@39@01 (Seq_index
          pw2@43@01
          (- k@62@01 left@40@01))))))
    (or
      (not
        (and
          (<= 0 (- k@62@01 left@40@01))
          (< (- k@62@01 left@40@01) (Seq_length pw2@43@01))))
      (and
        (<= 0 (- k@62@01 left@40@01))
        (< (- k@62@01 left@40@01) (Seq_length pw2@43@01)))))
  :pattern ((loc<Ref> a@39@01 k@62@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@73@10@73@126-aux|)))
(push) ; 3
(assert (not (forall ((k@62@01 Int)) (!
  (=>
    (and
      (<= 0 (- k@62@01 left@40@01))
      (< (- k@62@01 left@40@01) (Seq_length pw2@43@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 k@62@01))
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
        pw2@43@01
        (- k@62@01 left@40@01))))))
  :pattern ((loc<Ref> a@39@01 k@62@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@73@10@73@126|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@62@01 Int)) (!
  (=>
    (and
      (<= 0 (- k@62@01 left@40@01))
      (< (- k@62@01 left@40@01) (Seq_length pw2@43@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc_limited<Ref> a@39@01 k@62@01))
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@39@01 (Seq_index
        pw2@43@01
        (- k@62@01 left@40@01))))))
  :pattern ((loc<Ref> a@39@01 k@62@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/arrays.vpr@73@10@73@126|)))
(pop) ; 2
(pop) ; 1
