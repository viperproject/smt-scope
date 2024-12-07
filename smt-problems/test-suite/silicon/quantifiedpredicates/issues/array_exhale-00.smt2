(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:25:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/issues/array_exhale.vpr
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
(declare-sort $PSF<p> 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<p>To$Snap ($PSF<p>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<p> ($Snap) $PSF<p>)
(assert (forall ((x $PSF<p>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<p>($SortWrappers.$PSF<p>To$Snap x)))
    :pattern (($SortWrappers.$PSF<p>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<p>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<p>To$Snap($SortWrappers.$SnapTo$PSF<p> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<p> x))
    :qid |$Snap.$PSF<p>To$SnapTo$PSF<p>|
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
; /predicate_snap_functions_declarations.smt2 [p: Int]
(declare-fun $PSF.domain_p ($PSF<p>) Set<$Snap>)
(declare-fun $PSF.lookup_p ($PSF<p> $Snap) Int)
(declare-fun $PSF.after_p ($PSF<p> $PSF<p>) Bool)
(declare-fun $PSF.loc_p (Int $Snap) Bool)
(declare-fun $PSF.perm_p ($PPM $Snap) $Perm)
(declare-const $psfTOP_p $PSF<p>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p%trigger ($Snap IArray Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [p: Int]
(assert (forall ((vs $PSF<p>) (ws $PSF<p>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_p vs) ($PSF.domain_p ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_p vs))
            (= ($PSF.lookup_p vs x) ($PSF.lookup_p ws x)))
          :pattern (($PSF.lookup_p vs x) ($PSF.lookup_p ws x))
          :qid |qp.$PSF<p>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<p>To$Snap vs)
              ($SortWrappers.$PSF<p>To$Snap ws)
              )
    :qid |qp.$PSF<p>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_p pm s))
    :pattern (($PSF.perm_p pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_p f s) true)
    :pattern (($PSF.loc_p f s)))))
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
; ---------- m1 ----------
(declare-const a@0@01 IArray)
(declare-const n@1@01 Int)
(declare-const i1@2@01 Int)
(declare-const i2@3@01 Int)
(declare-const a@4@01 IArray)
(declare-const n@5@01 Int)
(declare-const i1@6@01 Int)
(declare-const i2@7@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] n > 3
(assert (> n@5@01 3))
(declare-const i@9@01 Int)
(push) ; 2
; [eval] i > 0 && i < n
; [eval] i > 0
(push) ; 3
; [then-branch: 0 | !(i@9@01 > 0) | live]
; [else-branch: 0 | i@9@01 > 0 | live]
(push) ; 4
; [then-branch: 0 | !(i@9@01 > 0)]
(assert (not (> i@9@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | i@9@01 > 0]
(assert (> i@9@01 0))
; [eval] i < n
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (> i@9@01 0) (not (> i@9@01 0))))
(assert (and (> i@9@01 0) (< i@9@01 n@5@01)))
; [eval] i + 1
(pop) ; 2
(declare-fun inv@10@01 (IArray Int) Int)
(declare-fun img@11@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@9@01@rw0 Int)) (!
  (=> (and (> i@9@01 0) (< i@9@01 n@5@01)) (or (> i@9@01 0) (not (> i@9@01 0))))
  :pattern ((inv@10@01 a@4@01 i@9@01@rw0))
  :pattern ((img@11@01 a@4@01 i@9@01@rw0))
  :qid |p-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@9@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (and (> i1@9@01 0) (< i1@9@01 n@5@01))
      (and (> i2@9@01 0) (< i2@9@01 n@5@01))
      (= (+ i1@9@01 1) (+ i2@9@01 1)))
    (= i1@9@01 i2@9@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@9@01@rw0 Int)) (!
  (=>
    (and (> (- i@9@01@rw0 1) 0) (< (- i@9@01@rw0 1) n@5@01))
    (and
      (= (inv@10@01 a@4@01 i@9@01@rw0) (- i@9@01@rw0 1))
      (img@11@01 a@4@01 i@9@01@rw0)))
  :pattern ((inv@10@01 a@4@01 i@9@01@rw0))
  :pattern ((img@11@01 a@4@01 i@9@01@rw0))
  :qid |quant-u-1|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@11@01 a i) (and (> (inv@10@01 a i) 0) (< (inv@10@01 a i) n@5@01)))
    (and (= a@4@01 a) (= (+ (inv@10@01 a i) 1) i)))
  :pattern ((inv@10@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const i@12@01 Int)
(push) ; 3
; [eval] i > 0 && i < n
; [eval] i > 0
(push) ; 4
; [then-branch: 1 | !(i@12@01 > 0) | live]
; [else-branch: 1 | i@12@01 > 0 | live]
(push) ; 5
; [then-branch: 1 | !(i@12@01 > 0)]
(assert (not (> i@12@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | i@12@01 > 0]
(assert (> i@12@01 0))
; [eval] i < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (> i@12@01 0) (not (> i@12@01 0))))
(assert (and (> i@12@01 0) (< i@12@01 n@5@01)))
; [eval] i + 1
(pop) ; 3
(declare-const $t@13@01 $PSF<p>)
(declare-fun inv@14@01 (IArray Int) Int)
(declare-fun img@15@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@12@01@rw1 Int)) (!
  (=>
    (and (> i@12@01 0) (< i@12@01 n@5@01))
    (or (> i@12@01 0) (not (> i@12@01 0))))
  :pattern ((inv@14@01 a@4@01 i@12@01@rw1))
  :pattern ((img@15@01 a@4@01 i@12@01@rw1))
  :qid |p-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@12@01 Int) (i2@12@01 Int)) (!
  (=>
    (and
      (and (> i1@12@01 0) (< i1@12@01 n@5@01))
      (and (> i2@12@01 0) (< i2@12@01 n@5@01))
      (= (+ i1@12@01 1) (+ i2@12@01 1)))
    (= i1@12@01 i2@12@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@12@01@rw1 Int)) (!
  (=>
    (and (> (- i@12@01@rw1 1) 0) (< (- i@12@01@rw1 1) n@5@01))
    (and
      (= (inv@14@01 a@4@01 i@12@01@rw1) (- i@12@01@rw1 1))
      (img@15@01 a@4@01 i@12@01@rw1)))
  :pattern ((inv@14@01 a@4@01 i@12@01@rw1))
  :pattern ((img@15@01 a@4@01 i@12@01@rw1))
  :qid |quant-u-3|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@15@01 a i) (and (> (inv@14@01 a i) 0) (< (inv@14@01 a i) n@5@01)))
    (and (= a@4@01 a) (= (+ (inv@14@01 a i) 1) i)))
  :pattern ((inv@14@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const i@16@01 Int)
(push) ; 3
; [eval] i > 0 && i < n
; [eval] i > 0
(push) ; 4
; [then-branch: 2 | !(i@16@01 > 0) | live]
; [else-branch: 2 | i@16@01 > 0 | live]
(push) ; 5
; [then-branch: 2 | !(i@16@01 > 0)]
(assert (not (> i@16@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | i@16@01 > 0]
(assert (> i@16@01 0))
; [eval] i < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (> i@16@01 0) (not (> i@16@01 0))))
(assert (and (> i@16@01 0) (< i@16@01 n@5@01)))
; [eval] i + 1
(pop) ; 3
(declare-fun inv@17@01 (IArray Int) Int)
(declare-fun img@18@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@16@01@rw2 Int)) (!
  (=>
    (and (> i@16@01 0) (< i@16@01 n@5@01))
    (or (> i@16@01 0) (not (> i@16@01 0))))
  :pattern ((inv@17@01 a@4@01 i@16@01@rw2))
  :pattern ((img@18@01 a@4@01 i@16@01@rw2))
  :qid |p-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@16@01 Int) (i2@16@01 Int)) (!
  (=>
    (and
      (and (> i1@16@01 0) (< i1@16@01 n@5@01))
      (and (> i2@16@01 0) (< i2@16@01 n@5@01))
      (= (+ i1@16@01 1) (+ i2@16@01 1)))
    (= i1@16@01 i2@16@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@16@01@rw2 Int)) (!
  (=>
    (and (> (- i@16@01@rw2 1) 0) (< (- i@16@01@rw2 1) n@5@01))
    (and
      (= (inv@17@01 a@4@01 i@16@01@rw2) (- i@16@01@rw2 1))
      (img@18@01 a@4@01 i@16@01@rw2)))
  :pattern ((inv@17@01 a@4@01 i@16@01@rw2))
  :pattern ((img@18@01 a@4@01 i@16@01@rw2))
  :qid |p-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@18@01 a i) (and (> (inv@17@01 a i) 0) (< (inv@17@01 a i) n@5@01)))
    (and (= a@4@01 a) (= (+ (inv@17@01 a i) 1) i)))
  :pattern ((inv@17@01 a i))
  :qid |p-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and (> (inv@17@01 a i) 0) (< (inv@17@01 a i) n@5@01))
      (img@18@01 a i)
      (and (= a a@4@01) (= i (+ (inv@17@01 a i) 1))))
    ($Perm.min
      (ite
        (and
          (img@11@01 a i)
          (and (> (inv@10@01 a i) 0) (< (inv@10@01 a i) n@5@01)))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@11@01 a i)
          (and (> (inv@10@01 a i) 0) (< (inv@10@01 a i) n@5@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@19@01 a i))
    $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (and (> (inv@17@01 a i) 0) (< (inv@17@01 a i) n@5@01))
      (img@18@01 a i)
      (and (= a a@4@01) (= i (+ (inv@17@01 a i) 1))))
    (= (- $Perm.Write (pTaken@19@01 a i)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@20@01 $PSF<p>)
(declare-const s@21@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@21@01 $Snap)) (!
  (=>
    (and
      (img@11@01 ($SortWrappers.$SnapToIArray ($Snap.first s@21@01)) ($SortWrappers.$SnapToInt ($Snap.second s@21@01)))
      (and
        (>
          (inv@10@01 ($SortWrappers.$SnapToIArray ($Snap.first s@21@01)) ($SortWrappers.$SnapToInt ($Snap.second s@21@01)))
          0)
        (<
          (inv@10@01 ($SortWrappers.$SnapToIArray ($Snap.first s@21@01)) ($SortWrappers.$SnapToInt ($Snap.second s@21@01)))
          n@5@01)))
    (and
      (not (= s@21@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@20@01  $PSF<p>) s@21@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@8@01)) s@21@01))))
  :pattern (($PSF.lookup_p (as sm@20@01  $PSF<p>) s@21@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@8@01)) s@21@01))
  :qid |qp.psmValDef0|)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const a@22@01 IArray)
(declare-const n@23@01 Int)
(declare-const i1@24@01 Int)
(declare-const i2@25@01 Int)
(declare-const a@26@01 IArray)
(declare-const n@27@01 Int)
(declare-const i1@28@01 Int)
(declare-const i2@29@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.first $t@30@01) $Snap.unit))
; [eval] n > 3
(assert (> n@27@01 3))
(declare-const i@31@01 Int)
(push) ; 2
; [eval] i > 0 && i < n
; [eval] i > 0
(push) ; 3
; [then-branch: 3 | !(i@31@01 > 0) | live]
; [else-branch: 3 | i@31@01 > 0 | live]
(push) ; 4
; [then-branch: 3 | !(i@31@01 > 0)]
(assert (not (> i@31@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | i@31@01 > 0]
(assert (> i@31@01 0))
; [eval] i < n
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (> i@31@01 0) (not (> i@31@01 0))))
(assert (and (> i@31@01 0) (< i@31@01 n@27@01)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 2
(declare-fun inv@32@01 ($Ref) Int)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@31@01@rw3 Int)) (!
  (=>
    (and (> i@31@01 0) (< i@31@01 n@27@01))
    (or (> i@31@01 0) (not (> i@31@01 0))))
  :pattern ((loc<Ref> a@26@01 i@31@01@rw3))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@31@01 Int) (i2@31@01 Int)) (!
  (=>
    (and
      (and (> i1@31@01 0) (< i1@31@01 n@27@01))
      (and (> i2@31@01 0) (< i2@31@01 n@27@01))
      (= (loc<Ref> a@26@01 (+ i1@31@01 1)) (loc<Ref> a@26@01 (+ i2@31@01 1))))
    (= i1@31@01 i2@31@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@31@01@rw3 Int)) (!
  (=>
    (and (> (- i@31@01@rw3 1) 0) (< (- i@31@01@rw3 1) n@27@01))
    (and
      (= (inv@32@01 (loc<Ref> a@26@01 i@31@01@rw3)) (- i@31@01@rw3 1))
      (img@33@01 (loc<Ref> a@26@01 i@31@01@rw3))))
  :pattern ((loc<Ref> a@26@01 i@31@01@rw3))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@33@01 r) (and (> (inv@32@01 r) 0) (< (inv@32@01 r) n@27@01)))
    (= (loc<Ref> a@26@01 (+ (inv@32@01 r) 1)) r))
  :pattern ((inv@32@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@31@01@rw3 Int)) (!
  (=>
    (and (> i@31@01 0) (< i@31@01 n@27@01))
    (not (= (loc<Ref> a@26@01 (+ i@31@01 1)) $Ref.null)))
  :pattern ((loc<Ref> a@26@01 i@31@01@rw3))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const i@34@01 Int)
(push) ; 3
; [eval] i > 0 && i < n
; [eval] i > 0
(push) ; 4
; [then-branch: 4 | !(i@34@01 > 0) | live]
; [else-branch: 4 | i@34@01 > 0 | live]
(push) ; 5
; [then-branch: 4 | !(i@34@01 > 0)]
(assert (not (> i@34@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | i@34@01 > 0]
(assert (> i@34@01 0))
; [eval] i < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (> i@34@01 0) (not (> i@34@01 0))))
(assert (and (> i@34@01 0) (< i@34@01 n@27@01)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 3
(declare-const $t@35@01 $FVF<val>)
(declare-fun inv@36@01 ($Ref) Int)
(declare-fun img@37@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@34@01@rw4 Int)) (!
  (=>
    (and (> i@34@01 0) (< i@34@01 n@27@01))
    (or (> i@34@01 0) (not (> i@34@01 0))))
  :pattern ((loc<Ref> a@26@01 i@34@01@rw4))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@34@01 Int) (i2@34@01 Int)) (!
  (=>
    (and
      (and (> i1@34@01 0) (< i1@34@01 n@27@01))
      (and (> i2@34@01 0) (< i2@34@01 n@27@01))
      (= (loc<Ref> a@26@01 (+ i1@34@01 1)) (loc<Ref> a@26@01 (+ i2@34@01 1))))
    (= i1@34@01 i2@34@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@34@01@rw4 Int)) (!
  (=>
    (and (> (- i@34@01@rw4 1) 0) (< (- i@34@01@rw4 1) n@27@01))
    (and
      (= (inv@36@01 (loc<Ref> a@26@01 i@34@01@rw4)) (- i@34@01@rw4 1))
      (img@37@01 (loc<Ref> a@26@01 i@34@01@rw4))))
  :pattern ((loc<Ref> a@26@01 i@34@01@rw4))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (> (inv@36@01 r) 0) (< (inv@36@01 r) n@27@01)))
    (= (loc<Ref> a@26@01 (+ (inv@36@01 r) 1)) r))
  :pattern ((inv@36@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@34@01@rw4 Int)) (!
  (=>
    (and (> i@34@01 0) (< i@34@01 n@27@01))
    (not (= (loc<Ref> a@26@01 (+ i@34@01 1)) $Ref.null)))
  :pattern ((loc<Ref> a@26@01 i@34@01@rw4))
  :qid |val-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const i@38@01 Int)
(push) ; 3
; [eval] i > 0 && i < n
; [eval] i > 0
(push) ; 4
; [then-branch: 5 | !(i@38@01 > 0) | live]
; [else-branch: 5 | i@38@01 > 0 | live]
(push) ; 5
; [then-branch: 5 | !(i@38@01 > 0)]
(assert (not (> i@38@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | i@38@01 > 0]
(assert (> i@38@01 0))
; [eval] i < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (> i@38@01 0) (not (> i@38@01 0))))
(assert (and (> i@38@01 0) (< i@38@01 n@27@01)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 3
(declare-fun inv@39@01 ($Ref) Int)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@38@01@rw5 Int)) (!
  (=>
    (and (> i@38@01 0) (< i@38@01 n@27@01))
    (or (> i@38@01 0) (not (> i@38@01 0))))
  :pattern ((loc<Ref> a@26@01 i@38@01@rw5))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@38@01 Int) (i2@38@01 Int)) (!
  (=>
    (and
      (and (> i1@38@01 0) (< i1@38@01 n@27@01))
      (and (> i2@38@01 0) (< i2@38@01 n@27@01))
      (= (loc<Ref> a@26@01 (+ i1@38@01 1)) (loc<Ref> a@26@01 (+ i2@38@01 1))))
    (= i1@38@01 i2@38@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@38@01@rw5 Int)) (!
  (=>
    (and (> (- i@38@01@rw5 1) 0) (< (- i@38@01@rw5 1) n@27@01))
    (and
      (= (inv@39@01 (loc<Ref> a@26@01 i@38@01@rw5)) (- i@38@01@rw5 1))
      (img@40@01 (loc<Ref> a@26@01 i@38@01@rw5))))
  :pattern ((loc<Ref> a@26@01 i@38@01@rw5))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (and (> (inv@39@01 r) 0) (< (inv@39@01 r) n@27@01)))
    (= (loc<Ref> a@26@01 (+ (inv@39@01 r) 1)) r))
  :pattern ((inv@39@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (> (inv@39@01 r) 0) (< (inv@39@01 r) n@27@01))
      (img@40@01 r)
      (= r (loc<Ref> a@26@01 (+ (inv@39@01 r) 1))))
    ($Perm.min
      (ite
        (and (img@33@01 r) (and (> (inv@32@01 r) 0) (< (inv@32@01 r) n@27@01)))
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
        (and (img@33@01 r) (and (> (inv@32@01 r) 0) (< (inv@32@01 r) n@27@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@41@01 r))
    $Perm.No)
  
  :qid |quant-u-14|))))
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
      (and (> (inv@39@01 r) 0) (< (inv@39@01 r) n@27@01))
      (img@40@01 r)
      (= r (loc<Ref> a@26@01 (+ (inv@39@01 r) 1))))
    (= (- $Perm.Write (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@42@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@33@01 r) (and (> (inv@32@01 r) 0) (< (inv@32@01 r) n@27@01)))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@30@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@30@01)) r))
  :qid |qp.fvfValDef1|)))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const a@43@01 IArray)
(declare-const n@44@01 Int)
(declare-const i1@45@01 Int)
(declare-const i2@46@01 Int)
(declare-const a@47@01 IArray)
(declare-const n@48@01 Int)
(declare-const i1@49@01 Int)
(declare-const i2@50@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (= ($Snap.first $t@51@01) $Snap.unit))
; [eval] n > 3
(assert (> n@48@01 3))
(declare-const i@52@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@48@01) i@52@01))
; [eval] i + 1
(pop) ; 2
(declare-fun inv@53@01 (IArray Int) Int)
(declare-fun img@54@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@52@01 Int) (i2@52@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@48@01) i1@52@01)
      (Seq_contains (Seq_range 0 n@48@01) i2@52@01)
      (= (+ i1@52@01 1) (+ i2@52@01 1)))
    (= i1@52@01 i2@52@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@52@01 Int) (i@52@01@rw6 Int)) (!
  (=>
    (and
      (= i@52@01 (- i@52@01@rw6 1))
      (Seq_contains (Seq_range 0 n@48@01) i@52@01))
    (and
      (= (inv@53@01 a@47@01 i@52@01@rw6) i@52@01)
      (img@54@01 a@47@01 i@52@01@rw6)))
  :pattern ((Seq_contains (Seq_range 0 n@48@01) i@52@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@48@01) i@52@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@48@01) i@52@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@48@01) i@52@01))
  :pattern ((inv@53@01 a@47@01 i@52@01@rw6))
  :pattern ((img@54@01 a@47@01 i@52@01@rw6))
  :qid |quant-u-17|)))
; WARNING: (1480,20): pattern does not contain all quantified variables.
; WARNING: (1480,20): pattern does not contain all quantified variables.
; WARNING: (1480,20): pattern does not contain all quantified variables.
; WARNING: (1480,20): pattern does not contain all quantified variables.
; WARNING: (1480,20): pattern does not contain all quantified variables.
; WARNING: (1480,20): pattern does not contain all quantified variables.
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@54@01 a i) (Seq_contains (Seq_range 0 n@48@01) (inv@53@01 a i)))
    (and (= a@47@01 a) (= (+ (inv@53@01 a i) 1) i)))
  :pattern ((inv@53@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@55@01 Int)
(declare-const sm@56@01 $PSF<p>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p (as sm@56@01  $PSF<p>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@47@01)
    ($SortWrappers.IntTo$Snap 1)))
  $t@55@01))
(assert (<= $Perm.No (ite (= 1 1) $Perm.Write $Perm.No)))
(pop) ; 2
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@57@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@47@01) (= i 1))
    ($Perm.min
      (ite
        (and
          (img@54@01 a i)
          (Seq_contains (Seq_range 0 n@48@01) (inv@53@01 a i)))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@54@01 a i)
          (Seq_contains (Seq_range 0 n@48@01) (inv@53@01 a i)))
        $Perm.Write
        $Perm.No)
      (pTaken@57@01 a i))
    $Perm.No)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@57@01 a i) $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@47@01) (= i 1))
    (= (- $Perm.Write (pTaken@57@01 a i)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@47@01) (= i 1))
    (= (- $Perm.Write (pTaken@57@01 a i)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@47@01) (= i 1))
    ($Perm.min
      (ite
        (and
          (img@54@01 a i)
          (Seq_contains (Seq_range 0 n@48@01) (inv@53@01 a i)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@54@01 a i)
          (Seq_contains (Seq_range 0 n@48@01) (inv@53@01 a i)))
        $Perm.Write
        $Perm.No)
      (pTaken@58@01 a i))
    $Perm.No)
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@58@01 a i) $Perm.No)
  
  :qid |quant-u-24|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@47@01) (= i 1))
    (= (- $Perm.Write (pTaken@58@01 a i)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@47@01) (= i 1))
    (= (- $Perm.Write (pTaken@58@01 a i)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const a@59@01 IArray)
(declare-const n@60@01 Int)
(declare-const i1@61@01 Int)
(declare-const i2@62@01 Int)
(declare-const a@63@01 IArray)
(declare-const n@64@01 Int)
(declare-const i1@65@01 Int)
(declare-const i2@66@01 Int)
(push) ; 1
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01))))
(assert (= ($Snap.first $t@67@01) $Snap.unit))
; [eval] n > 3
(assert (> n@64@01 3))
(declare-const i@68@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@64@01) i@68@01))
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 2
(declare-fun inv@69@01 ($Ref) Int)
(declare-fun img@70@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@68@01 Int) (i2@68@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@64@01) i1@68@01)
      (Seq_contains (Seq_range 0 n@64@01) i2@68@01)
      (= (loc<Ref> a@63@01 (+ i1@68@01 1)) (loc<Ref> a@63@01 (+ i2@68@01 1))))
    (= i1@68@01 i2@68@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@68@01@rw7 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@64@01) (- i@68@01@rw7 1))
    (and
      (= (inv@69@01 (loc<Ref> a@63@01 i@68@01@rw7)) (- i@68@01@rw7 1))
      (img@70@01 (loc<Ref> a@63@01 i@68@01@rw7))))
  :pattern ((loc<Ref> a@63@01 i@68@01@rw7))
  :qid |quant-u-27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@70@01 r) (Seq_contains (Seq_range 0 n@64@01) (inv@69@01 r)))
    (= (loc<Ref> a@63@01 (+ (inv@69@01 r) 1)) r))
  :pattern ((inv@69@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@68@01@rw7 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@64@01) i@68@01)
    (not (= (loc<Ref> a@63@01 (+ i@68@01 1)) $Ref.null)))
  :pattern ((loc<Ref> a@63@01 i@68@01@rw7))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] loc(a, 1)
(declare-const $t@71@01 Int)
(declare-const sm@72@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_val (as sm@72@01  $FVF<val>) (loc<Ref> a@63@01 1)) $t@71@01))
(assert (<=
  $Perm.No
  (ite (= (loc<Ref> a@63@01 1) (loc<Ref> a@63@01 1)) $Perm.Write $Perm.No)))
(assert (<=
  (ite (= (loc<Ref> a@63@01 1) (loc<Ref> a@63@01 1)) $Perm.Write $Perm.No)
  $Perm.Write))
(assert (=>
  (= (loc<Ref> a@63@01 1) (loc<Ref> a@63@01 1))
  (not (= (loc<Ref> a@63@01 1) $Ref.null))))
(pop) ; 2
(push) ; 2
; [eval] loc(a, 1)
; Precomputing data for removing quantified permissions
(define-fun pTaken@73@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@63@01 1))
    ($Perm.min
      (ite
        (and (img@70@01 r) (Seq_contains (Seq_range 0 n@64@01) (inv@69@01 r)))
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
        (and (img@70@01 r) (Seq_contains (Seq_range 0 n@64@01) (inv@69@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@73@01 r))
    $Perm.No)
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@73@01 r) $Perm.No)
  
  :qid |quant-u-30|))))
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
  (=> (= r (loc<Ref> a@63@01 1)) (= (- $Perm.Write (pTaken@73@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@74@01 $FVF<val>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@70@01 (loc<Ref> a@63@01 1))
    (Seq_contains (Seq_range 0 n@64@01) (inv@69@01 (loc<Ref> a@63@01 1))))
  (=
    ($FVF.lookup_val (as sm@74@01  $FVF<val>) (loc<Ref> a@63@01 1))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@67@01)) (loc<Ref> a@63@01 1)))))
(pop) ; 2
(pop) ; 1
; ---------- m5 ----------
(declare-const a@75@01 IArray)
(declare-const n@76@01 Int)
(declare-const i1@77@01 Int)
(declare-const i2@78@01 Int)
(declare-const a@79@01 IArray)
(declare-const n@80@01 Int)
(declare-const i1@81@01 Int)
(declare-const i2@82@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 ($Snap.combine ($Snap.first $t@83@01) ($Snap.second $t@83@01))))
(assert (= ($Snap.first $t@83@01) $Snap.unit))
; [eval] n > 3
(assert (> n@80@01 3))
(declare-const i@84@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@80@01) i@84@01))
; [eval] i + 1
(pop) ; 2
(declare-fun inv@85@01 (IArray Int) Int)
(declare-fun img@86@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@84@01 Int) (i2@84@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@80@01) i1@84@01)
      (Seq_contains (Seq_range 0 n@80@01) i2@84@01)
      (= (+ i1@84@01 1) (+ i2@84@01 1)))
    (= i1@84@01 i2@84@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@84@01 Int) (i@84@01@rw8 Int)) (!
  (=>
    (and
      (= i@84@01 (- i@84@01@rw8 1))
      (Seq_contains (Seq_range 0 n@80@01) i@84@01))
    (and
      (= (inv@85@01 a@79@01 i@84@01@rw8) i@84@01)
      (img@86@01 a@79@01 i@84@01@rw8)))
  :pattern ((Seq_contains (Seq_range 0 n@80@01) i@84@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@80@01) i@84@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@80@01) i@84@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@80@01) i@84@01))
  :pattern ((inv@85@01 a@79@01 i@84@01@rw8))
  :pattern ((img@86@01 a@79@01 i@84@01@rw8))
  :qid |quant-u-33|)))
; WARNING: (1799,20): pattern does not contain all quantified variables.
; WARNING: (1799,20): pattern does not contain all quantified variables.
; WARNING: (1799,20): pattern does not contain all quantified variables.
; WARNING: (1799,20): pattern does not contain all quantified variables.
; WARNING: (1799,20): pattern does not contain all quantified variables.
; WARNING: (1799,20): pattern does not contain all quantified variables.
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@86@01 a i) (Seq_contains (Seq_range 0 n@80@01) (inv@85@01 a i)))
    (and (= a@79@01 a) (= (+ (inv@85@01 a i) 1) i)))
  :pattern ((inv@85@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const i@87@01 Int)
(push) ; 3
; [eval] (i in [1..n + 1))
; [eval] [1..n + 1)
; [eval] n + 1
(assert (Seq_contains (Seq_range 1 (+ n@80@01 1)) i@87@01))
(pop) ; 3
(declare-const $t@88@01 $PSF<p>)
(declare-fun inv@89@01 (IArray Int) Int)
(declare-fun img@90@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@87@01 Int) (i2@87@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) i1@87@01)
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) i2@87@01)
      (= i1@87@01 i2@87@01))
    (= i1@87@01 i2@87@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@87@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 (+ n@80@01 1)) i@87@01)
    (and (= (inv@89@01 a@79@01 i@87@01) i@87@01) (img@90@01 a@79@01 i@87@01)))
  :pattern ((Seq_contains (Seq_range 1 (+ n@80@01 1)) i@87@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 (+ n@80@01 1)) i@87@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 (+ n@80@01 1)) i@87@01))
  :pattern ((inv@89@01 a@79@01 i@87@01))
  :pattern ((img@90@01 a@79@01 i@87@01))
  :qid |quant-u-35|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@90@01 a i)
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) (inv@89@01 a i)))
    (and (= a@79@01 a) (= (inv@89@01 a i) i)))
  :pattern ((inv@89@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const i@91@01 Int)
(push) ; 3
; [eval] (i in [1..n + 1))
; [eval] [1..n + 1)
; [eval] n + 1
(assert (Seq_contains (Seq_range 1 (+ n@80@01 1)) i@91@01))
(pop) ; 3
(declare-fun inv@92@01 (IArray Int) Int)
(declare-fun img@93@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@91@01 Int) (i2@91@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) i1@91@01)
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) i2@91@01)
      (= i1@91@01 i2@91@01))
    (= i1@91@01 i2@91@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@91@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 (+ n@80@01 1)) i@91@01)
    (and (= (inv@92@01 a@79@01 i@91@01) i@91@01) (img@93@01 a@79@01 i@91@01)))
  :pattern ((Seq_contains (Seq_range 1 (+ n@80@01 1)) i@91@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 (+ n@80@01 1)) i@91@01))
  :pattern ((inv@92@01 a@79@01 i@91@01))
  :pattern ((img@93@01 a@79@01 i@91@01))
  :qid |p-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@93@01 a i)
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) (inv@92@01 a i)))
    (and (= a@79@01 a) (= (inv@92@01 a i) i)))
  :pattern ((inv@92@01 a i))
  :qid |p-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@91@01 Int)) (!
  (= i@91@01 (+ i@91@01 1))
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@94@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) (inv@92@01 a i))
      (img@93@01 a i)
      (and (= a a@79@01) (= i (inv@92@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@86@01 a i)
          (Seq_contains (Seq_range 0 n@80@01) (inv@85@01 a i)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@86@01 a i)
          (Seq_contains (Seq_range 0 n@80@01) (inv@85@01 a i)))
        $Perm.Write
        $Perm.No)
      (pTaken@94@01 a i))
    $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) (inv@92@01 a i))
      (img@93@01 a i)
      (and (= a a@79@01) (= i (inv@92@01 a i))))
    (= (- $Perm.Write (pTaken@94@01 a i)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) (inv@92@01 a i))
      (img@93@01 a i)
      (and (= a a@79@01) (= i (inv@92@01 a i))))
    (= (- $Perm.Write (pTaken@94@01 a i)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const i@95@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [1..n + 1))
; [eval] [1..n + 1)
; [eval] n + 1
(assert (Seq_contains (Seq_range 1 (+ n@80@01 1)) i@95@01))
(pop) ; 3
(declare-fun inv@96@01 (IArray Int) Int)
(declare-fun img@97@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@95@01 Int) (i2@95@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) i1@95@01)
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) i2@95@01)
      (= i1@95@01 i2@95@01))
    (= i1@95@01 i2@95@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@95@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 (+ n@80@01 1)) i@95@01)
    (and (= (inv@96@01 a@79@01 i@95@01) i@95@01) (img@97@01 a@79@01 i@95@01)))
  :pattern ((Seq_contains (Seq_range 1 (+ n@80@01 1)) i@95@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 (+ n@80@01 1)) i@95@01))
  :pattern ((inv@96@01 a@79@01 i@95@01))
  :pattern ((img@97@01 a@79@01 i@95@01))
  :qid |p-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@97@01 a i)
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) (inv@96@01 a i)))
    (and (= a@79@01 a) (= (inv@96@01 a i) i)))
  :pattern ((inv@96@01 a i))
  :qid |p-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@95@01 Int)) (!
  (= i@95@01 (+ i@95@01 1))
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@98@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) (inv@96@01 a i))
      (img@97@01 a i)
      (and (= a a@79@01) (= i (inv@96@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@86@01 a i)
          (Seq_contains (Seq_range 0 n@80@01) (inv@85@01 a i)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@86@01 a i)
          (Seq_contains (Seq_range 0 n@80@01) (inv@85@01 a i)))
        $Perm.Write
        $Perm.No)
      (pTaken@98@01 a i))
    $Perm.No)
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) (inv@96@01 a i))
      (img@97@01 a i)
      (and (= a a@79@01) (= i (inv@96@01 a i))))
    (= (- $Perm.Write (pTaken@98@01 a i)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@80@01 1)) (inv@96@01 a i))
      (img@97@01 a i)
      (and (= a a@79@01) (= i (inv@96@01 a i))))
    (= (- $Perm.Write (pTaken@98@01 a i)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- m6 ----------
(declare-const a@99@01 IArray)
(declare-const n@100@01 Int)
(declare-const i1@101@01 Int)
(declare-const i2@102@01 Int)
(declare-const a@103@01 IArray)
(declare-const n@104@01 Int)
(declare-const i1@105@01 Int)
(declare-const i2@106@01 Int)
(push) ; 1
(declare-const $t@107@01 $Snap)
(assert (= $t@107@01 ($Snap.combine ($Snap.first $t@107@01) ($Snap.second $t@107@01))))
(assert (= ($Snap.first $t@107@01) $Snap.unit))
; [eval] n > 3
(assert (> n@104@01 3))
(declare-const i@108@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@104@01) i@108@01))
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 2
(declare-fun inv@109@01 ($Ref) Int)
(declare-fun img@110@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@108@01 Int) (i2@108@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@104@01) i1@108@01)
      (Seq_contains (Seq_range 0 n@104@01) i2@108@01)
      (= (loc<Ref> a@103@01 (+ i1@108@01 1)) (loc<Ref> a@103@01 (+ i2@108@01 1))))
    (= i1@108@01 i2@108@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@108@01@rw9 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@104@01) (- i@108@01@rw9 1))
    (and
      (= (inv@109@01 (loc<Ref> a@103@01 i@108@01@rw9)) (- i@108@01@rw9 1))
      (img@110@01 (loc<Ref> a@103@01 i@108@01@rw9))))
  :pattern ((loc<Ref> a@103@01 i@108@01@rw9))
  :qid |quant-u-47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@110@01 r) (Seq_contains (Seq_range 0 n@104@01) (inv@109@01 r)))
    (= (loc<Ref> a@103@01 (+ (inv@109@01 r) 1)) r))
  :pattern ((inv@109@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@108@01@rw9 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@104@01) i@108@01)
    (not (= (loc<Ref> a@103@01 (+ i@108@01 1)) $Ref.null)))
  :pattern ((loc<Ref> a@103@01 i@108@01@rw9))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const i@111@01 Int)
(push) ; 3
; [eval] (i in [1..n + 1))
; [eval] [1..n + 1)
; [eval] n + 1
(assert (Seq_contains (Seq_range 1 (+ n@104@01 1)) i@111@01))
; [eval] loc(a, i)
(pop) ; 3
(declare-const $t@112@01 $FVF<val>)
(declare-fun inv@113@01 ($Ref) Int)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@111@01 Int) (i2@111@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@104@01 1)) i1@111@01)
      (Seq_contains (Seq_range 1 (+ n@104@01 1)) i2@111@01)
      (= (loc<Ref> a@103@01 i1@111@01) (loc<Ref> a@103@01 i2@111@01)))
    (= i1@111@01 i2@111@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@111@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 (+ n@104@01 1)) i@111@01)
    (and
      (= (inv@113@01 (loc<Ref> a@103@01 i@111@01)) i@111@01)
      (img@114@01 (loc<Ref> a@103@01 i@111@01))))
  :pattern ((loc<Ref> a@103@01 i@111@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 1 (+ n@104@01 1)) (inv@113@01 r)))
    (= (loc<Ref> a@103@01 (inv@113@01 r)) r))
  :pattern ((inv@113@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@111@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 (+ n@104@01 1)) i@111@01)
    (not (= (loc<Ref> a@103@01 i@111@01) $Ref.null)))
  :pattern ((loc<Ref> a@103@01 i@111@01))
  :qid |val-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const i@115@01 Int)
(push) ; 3
; [eval] (i in [1..n + 1))
; [eval] [1..n + 1)
; [eval] n + 1
(assert (Seq_contains (Seq_range 1 (+ n@104@01 1)) i@115@01))
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@116@01 ($Ref) Int)
(declare-fun img@117@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@115@01 Int) (i2@115@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@104@01 1)) i1@115@01)
      (Seq_contains (Seq_range 1 (+ n@104@01 1)) i2@115@01)
      (= (loc<Ref> a@103@01 i1@115@01) (loc<Ref> a@103@01 i2@115@01)))
    (= i1@115@01 i2@115@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@115@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 (+ n@104@01 1)) i@115@01)
    (and
      (= (inv@116@01 (loc<Ref> a@103@01 i@115@01)) i@115@01)
      (img@117@01 (loc<Ref> a@103@01 i@115@01))))
  :pattern ((loc<Ref> a@103@01 i@115@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@117@01 r)
      (Seq_contains (Seq_range 1 (+ n@104@01 1)) (inv@116@01 r)))
    (= (loc<Ref> a@103@01 (inv@116@01 r)) r))
  :pattern ((inv@116@01 r))
  :qid |val-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@115@01 Int)) (!
  (= (loc<Ref> a@103@01 i@115@01) (loc<Ref> a@103@01 (+ i@115@01 1)))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@118@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 1 (+ n@104@01 1)) (inv@116@01 r))
      (img@117@01 r)
      (= r (loc<Ref> a@103@01 (inv@116@01 r))))
    ($Perm.min
      (ite
        (and (img@110@01 r) (Seq_contains (Seq_range 0 n@104@01) (inv@109@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
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
        (and (img@110@01 r) (Seq_contains (Seq_range 0 n@104@01) (inv@109@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@118@01 r))
    $Perm.No)
  
  :qid |quant-u-53|))))
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
      (Seq_contains (Seq_range 1 (+ n@104@01 1)) (inv@116@01 r))
      (img@117@01 r)
      (= r (loc<Ref> a@103@01 (inv@116@01 r))))
    (= (- $Perm.Write (pTaken@118@01 r)) $Perm.No))
  
  :qid |quant-u-54|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@119@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@110@01 r) (Seq_contains (Seq_range 0 n@104@01) (inv@109@01 r)))
    (=
      ($FVF.lookup_val (as sm@119@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@107@01)) r)))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@107@01)) r))
  :qid |qp.fvfValDef3|)))
(pop) ; 2
(pop) ; 1
; ---------- m7 ----------
(declare-const a@120@01 IArray)
(declare-const n@121@01 Int)
(declare-const i1@122@01 Int)
(declare-const i2@123@01 Int)
(declare-const a@124@01 IArray)
(declare-const n@125@01 Int)
(declare-const i1@126@01 Int)
(declare-const i2@127@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@128@01 $Snap)
(assert (= $t@128@01 ($Snap.combine ($Snap.first $t@128@01) ($Snap.second $t@128@01))))
(assert (= ($Snap.first $t@128@01) $Snap.unit))
; [eval] n > 3
(assert (> n@125@01 3))
(declare-const i@129@01 Int)
(push) ; 2
; [eval] (i in [1..n + 1))
; [eval] [1..n + 1)
; [eval] n + 1
(assert (Seq_contains (Seq_range 1 (+ n@125@01 1)) i@129@01))
(pop) ; 2
(declare-fun inv@130@01 (IArray Int) Int)
(declare-fun img@131@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@129@01 Int) (i2@129@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@125@01 1)) i1@129@01)
      (Seq_contains (Seq_range 1 (+ n@125@01 1)) i2@129@01)
      (= i1@129@01 i2@129@01))
    (= i1@129@01 i2@129@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@129@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 (+ n@125@01 1)) i@129@01)
    (and
      (= (inv@130@01 a@124@01 i@129@01) i@129@01)
      (img@131@01 a@124@01 i@129@01)))
  :pattern ((Seq_contains (Seq_range 1 (+ n@125@01 1)) i@129@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 (+ n@125@01 1)) i@129@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 (+ n@125@01 1)) i@129@01))
  :pattern ((inv@130@01 a@124@01 i@129@01))
  :pattern ((img@131@01 a@124@01 i@129@01))
  :qid |quant-u-56|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@131@01 a i)
      (Seq_contains (Seq_range 1 (+ n@125@01 1)) (inv@130@01 a i)))
    (and (= a@124@01 a) (= (inv@130@01 a i) i)))
  :pattern ((inv@130@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const i@132@01 Int)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@125@01) i@132@01))
; [eval] i + 1
(pop) ; 3
(declare-const $t@133@01 $PSF<p>)
(declare-fun inv@134@01 (IArray Int) Int)
(declare-fun img@135@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@132@01 Int) (i2@132@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@125@01) i1@132@01)
      (Seq_contains (Seq_range 0 n@125@01) i2@132@01)
      (= (+ i1@132@01 1) (+ i2@132@01 1)))
    (= i1@132@01 i2@132@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@132@01 Int) (i@132@01@rw10 Int)) (!
  (=>
    (and
      (= i@132@01 (- i@132@01@rw10 1))
      (Seq_contains (Seq_range 0 n@125@01) i@132@01))
    (and
      (= (inv@134@01 a@124@01 i@132@01@rw10) i@132@01)
      (img@135@01 a@124@01 i@132@01@rw10)))
  :pattern ((Seq_contains (Seq_range 0 n@125@01) i@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@125@01) i@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@125@01) i@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@125@01) i@132@01))
  :pattern ((inv@134@01 a@124@01 i@132@01@rw10))
  :pattern ((img@135@01 a@124@01 i@132@01@rw10))
  :qid |quant-u-58|)))
; WARNING: (2347,20): pattern does not contain all quantified variables.
; WARNING: (2347,20): pattern does not contain all quantified variables.
; WARNING: (2347,20): pattern does not contain all quantified variables.
; WARNING: (2347,20): pattern does not contain all quantified variables.
; WARNING: (2347,20): pattern does not contain all quantified variables.
; WARNING: (2347,20): pattern does not contain all quantified variables.
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@135@01 a i) (Seq_contains (Seq_range 0 n@125@01) (inv@134@01 a i)))
    (and (= a@124@01 a) (= (+ (inv@134@01 a i) 1) i)))
  :pattern ((inv@134@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const i@136@01 Int)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@125@01) i@136@01))
; [eval] i + 1
(pop) ; 3
(declare-fun inv@137@01 (IArray Int) Int)
(declare-fun img@138@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@136@01 Int) (i2@136@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@125@01) i1@136@01)
      (Seq_contains (Seq_range 0 n@125@01) i2@136@01)
      (= (+ i1@136@01 1) (+ i2@136@01 1)))
    (= i1@136@01 i2@136@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@136@01 Int) (i@136@01@rw11 Int)) (!
  (=>
    (and
      (= i@136@01 (- i@136@01@rw11 1))
      (Seq_contains (Seq_range 0 n@125@01) i@136@01))
    (and
      (= (inv@137@01 a@124@01 i@136@01@rw11) i@136@01)
      (img@138@01 a@124@01 i@136@01@rw11)))
  :pattern ((Seq_contains (Seq_range 0 n@125@01) i@136@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@125@01) i@136@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@125@01) i@136@01))
  :pattern ((inv@137@01 a@124@01 i@136@01@rw11))
  :pattern ((img@138@01 a@124@01 i@136@01@rw11))
  :qid |p-invOfFct|)))
; WARNING: (2387,20): pattern does not contain all quantified variables.
; WARNING: (2387,20): pattern does not contain all quantified variables.
; WARNING: (2387,20): pattern does not contain all quantified variables.
; WARNING: (2387,20): pattern does not contain all quantified variables.
; WARNING: (2387,20): pattern does not contain all quantified variables.
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@138@01 a i) (Seq_contains (Seq_range 0 n@125@01) (inv@137@01 a i)))
    (and (= a@124@01 a) (= (+ (inv@137@01 a i) 1) i)))
  :pattern ((inv@137@01 a i))
  :qid |p-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@136@01 Int)) (!
  (= (+ i@136@01 1) i@136@01)
  
  :qid |quant-u-60|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@139@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@125@01) (inv@137@01 a i))
      (img@138@01 a i)
      (and (= a a@124@01) (= i (+ (inv@137@01 a i) 1))))
    ($Perm.min
      (ite
        (and
          (img@131@01 a i)
          (Seq_contains (Seq_range 1 (+ n@125@01 1)) (inv@130@01 a i)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@131@01 a i)
          (Seq_contains (Seq_range 1 (+ n@125@01 1)) (inv@130@01 a i)))
        $Perm.Write
        $Perm.No)
      (pTaken@139@01 a i))
    $Perm.No)
  
  :qid |quant-u-62|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@139@01 a i) $Perm.No)
  
  :qid |quant-u-63|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@125@01) (inv@137@01 a i))
      (img@138@01 a i)
      (and (= a a@124@01) (= i (+ (inv@137@01 a i) 1))))
    (= (- $Perm.Write (pTaken@139@01 a i)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@140@01 $PSF<p>)
(declare-const s@141@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@141@01 $Snap)) (!
  (=>
    (and
      (img@131@01 ($SortWrappers.$SnapToIArray ($Snap.first s@141@01)) ($SortWrappers.$SnapToInt ($Snap.second s@141@01)))
      (Seq_contains
        (Seq_range 1 (+ n@125@01 1))
        (inv@130@01 ($SortWrappers.$SnapToIArray ($Snap.first s@141@01)) ($SortWrappers.$SnapToInt ($Snap.second s@141@01)))))
    (and
      (not (= s@141@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@140@01  $PSF<p>) s@141@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@128@01)) s@141@01))))
  :pattern (($PSF.lookup_p (as sm@140@01  $PSF<p>) s@141@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@128@01)) s@141@01))
  :qid |qp.psmValDef4|)))
(pop) ; 2
(pop) ; 1
; ---------- m8 ----------
(declare-const a@142@01 IArray)
(declare-const n@143@01 Int)
(declare-const i1@144@01 Int)
(declare-const i2@145@01 Int)
(declare-const a@146@01 IArray)
(declare-const n@147@01 Int)
(declare-const i1@148@01 Int)
(declare-const i2@149@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@150@01 $Snap)
(assert (= $t@150@01 ($Snap.combine ($Snap.first $t@150@01) ($Snap.second $t@150@01))))
(assert (= ($Snap.first $t@150@01) $Snap.unit))
; [eval] n > 3
(assert (> n@147@01 3))
(declare-const i@151@01 Int)
(push) ; 2
; [eval] (i in [1..n + 1))
; [eval] [1..n + 1)
; [eval] n + 1
(assert (Seq_contains (Seq_range 1 (+ n@147@01 1)) i@151@01))
; [eval] loc(a, i)
(pop) ; 2
(declare-fun inv@152@01 ($Ref) Int)
(declare-fun img@153@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@151@01 Int) (i2@151@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 1 (+ n@147@01 1)) i1@151@01)
      (Seq_contains (Seq_range 1 (+ n@147@01 1)) i2@151@01)
      (= (loc<Ref> a@146@01 i1@151@01) (loc<Ref> a@146@01 i2@151@01)))
    (= i1@151@01 i2@151@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@151@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 (+ n@147@01 1)) i@151@01)
    (and
      (= (inv@152@01 (loc<Ref> a@146@01 i@151@01)) i@151@01)
      (img@153@01 (loc<Ref> a@146@01 i@151@01))))
  :pattern ((loc<Ref> a@146@01 i@151@01))
  :qid |quant-u-66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@153@01 r)
      (Seq_contains (Seq_range 1 (+ n@147@01 1)) (inv@152@01 r)))
    (= (loc<Ref> a@146@01 (inv@152@01 r)) r))
  :pattern ((inv@152@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@151@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 (+ n@147@01 1)) i@151@01)
    (not (= (loc<Ref> a@146@01 i@151@01) $Ref.null)))
  :pattern ((loc<Ref> a@146@01 i@151@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const i@154@01 Int)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@147@01) i@154@01))
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 3
(declare-const $t@155@01 $FVF<val>)
(declare-fun inv@156@01 ($Ref) Int)
(declare-fun img@157@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@154@01 Int) (i2@154@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@147@01) i1@154@01)
      (Seq_contains (Seq_range 0 n@147@01) i2@154@01)
      (= (loc<Ref> a@146@01 (+ i1@154@01 1)) (loc<Ref> a@146@01 (+ i2@154@01 1))))
    (= i1@154@01 i2@154@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@154@01@rw12 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@147@01) (- i@154@01@rw12 1))
    (and
      (= (inv@156@01 (loc<Ref> a@146@01 i@154@01@rw12)) (- i@154@01@rw12 1))
      (img@157@01 (loc<Ref> a@146@01 i@154@01@rw12))))
  :pattern ((loc<Ref> a@146@01 i@154@01@rw12))
  :qid |quant-u-68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@157@01 r) (Seq_contains (Seq_range 0 n@147@01) (inv@156@01 r)))
    (= (loc<Ref> a@146@01 (+ (inv@156@01 r) 1)) r))
  :pattern ((inv@156@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@154@01@rw12 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@147@01) i@154@01)
    (not (= (loc<Ref> a@146@01 (+ i@154@01 1)) $Ref.null)))
  :pattern ((loc<Ref> a@146@01 i@154@01@rw12))
  :qid |val-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const i@158@01 Int)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@147@01) i@158@01))
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 3
(declare-fun inv@159@01 ($Ref) Int)
(declare-fun img@160@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@158@01 Int) (i2@158@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@147@01) i1@158@01)
      (Seq_contains (Seq_range 0 n@147@01) i2@158@01)
      (= (loc<Ref> a@146@01 (+ i1@158@01 1)) (loc<Ref> a@146@01 (+ i2@158@01 1))))
    (= i1@158@01 i2@158@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@158@01@rw13 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@147@01) (- i@158@01@rw13 1))
    (and
      (= (inv@159@01 (loc<Ref> a@146@01 i@158@01@rw13)) (- i@158@01@rw13 1))
      (img@160@01 (loc<Ref> a@146@01 i@158@01@rw13))))
  :pattern ((loc<Ref> a@146@01 i@158@01@rw13))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@160@01 r) (Seq_contains (Seq_range 0 n@147@01) (inv@159@01 r)))
    (= (loc<Ref> a@146@01 (+ (inv@159@01 r) 1)) r))
  :pattern ((inv@159@01 r))
  :qid |val-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@158@01 Int)) (!
  (= (loc<Ref> a@146@01 (+ i@158@01 1)) (loc<Ref> a@146@01 i@158@01))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@161@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@147@01) (inv@159@01 r))
      (img@160@01 r)
      (= r (loc<Ref> a@146@01 (+ (inv@159@01 r) 1))))
    ($Perm.min
      (ite
        (and
          (img@153@01 r)
          (Seq_contains (Seq_range 1 (+ n@147@01 1)) (inv@152@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
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
          (img@153@01 r)
          (Seq_contains (Seq_range 1 (+ n@147@01 1)) (inv@152@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@161@01 r))
    $Perm.No)
  
  :qid |quant-u-72|))))
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
      (Seq_contains (Seq_range 0 n@147@01) (inv@159@01 r))
      (img@160@01 r)
      (= r (loc<Ref> a@146@01 (+ (inv@159@01 r) 1))))
    (= (- $Perm.Write (pTaken@161@01 r)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@162@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@153@01 r)
      (Seq_contains (Seq_range 1 (+ n@147@01 1)) (inv@152@01 r)))
    (=
      ($FVF.lookup_val (as sm@162@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@150@01)) r)))
  :pattern (($FVF.lookup_val (as sm@162@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@150@01)) r))
  :qid |qp.fvfValDef5|)))
(pop) ; 2
(pop) ; 1
; ---------- m9 ----------
(declare-const a@163@01 IArray)
(declare-const n@164@01 Int)
(declare-const a@165@01 IArray)
(declare-const n@166@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@167@01 $Snap)
(assert (= $t@167@01 ($Snap.combine ($Snap.first $t@167@01) ($Snap.second $t@167@01))))
(assert (= ($Snap.first $t@167@01) $Snap.unit))
; [eval] n > 5
(assert (> n@166@01 5))
(declare-const i@168@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@166@01) i@168@01))
(pop) ; 2
(declare-fun inv@169@01 (IArray Int) Int)
(declare-fun img@170@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@168@01 Int) (i2@168@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@166@01) i1@168@01)
      (Seq_contains (Seq_range 0 n@166@01) i2@168@01)
      (= i1@168@01 i2@168@01))
    (= i1@168@01 i2@168@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@168@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@166@01) i@168@01)
    (and
      (= (inv@169@01 a@165@01 i@168@01) i@168@01)
      (img@170@01 a@165@01 i@168@01)))
  :pattern ((Seq_contains (Seq_range 0 n@166@01) i@168@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@166@01) i@168@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@166@01) i@168@01))
  :pattern ((inv@169@01 a@165@01 i@168@01))
  :pattern ((img@170@01 a@165@01 i@168@01))
  :qid |quant-u-75|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@170@01 a i) (Seq_contains (Seq_range 0 n@166@01) (inv@169@01 a i)))
    (and (= a@165@01 a) (= (inv@169@01 a i) i)))
  :pattern ((inv@169@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@171@01 $Snap)
(assert (= $t@171@01 ($Snap.combine ($Snap.first $t@171@01) ($Snap.second $t@171@01))))
(declare-const i@172@01 Int)
(push) ; 3
; [eval] (i in [4..n))
; [eval] [4..n)
(assert (Seq_contains (Seq_range 4 n@166@01) i@172@01))
(pop) ; 3
(declare-fun inv@173@01 (IArray Int) Int)
(declare-fun img@174@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@172@01 Int) (i2@172@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 4 n@166@01) i1@172@01)
      (Seq_contains (Seq_range 4 n@166@01) i2@172@01)
      (= i1@172@01 i2@172@01))
    (= i1@172@01 i2@172@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@172@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 4 n@166@01) i@172@01)
    (and
      (= (inv@173@01 a@165@01 i@172@01) i@172@01)
      (img@174@01 a@165@01 i@172@01)))
  :pattern ((Seq_contains (Seq_range 4 n@166@01) i@172@01))
  :pattern ((Seq_contains_trigger (Seq_range 4 n@166@01) i@172@01))
  :pattern ((Seq_contains_trigger (Seq_range 4 n@166@01) i@172@01))
  :pattern ((inv@173@01 a@165@01 i@172@01))
  :pattern ((img@174@01 a@165@01 i@172@01))
  :qid |quant-u-77|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@174@01 a i) (Seq_contains (Seq_range 4 n@166@01) (inv@173@01 a i)))
    (and (= a@165@01 a) (= (inv@173@01 a i) i)))
  :pattern ((inv@173@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(declare-const i@175@01 Int)
(push) ; 3
; [eval] (i in [0..4))
; [eval] [0..4)
(assert (Seq_contains (Seq_range 0 4) i@175@01))
(pop) ; 3
(declare-fun inv@176@01 (IArray Int) Int)
(declare-fun img@177@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@175@01 Int) (i2@175@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 4) i1@175@01)
      (Seq_contains (Seq_range 0 4) i2@175@01)
      (= i1@175@01 i2@175@01))
    (= i1@175@01 i2@175@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@175@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 4) i@175@01)
    (and
      (= (inv@176@01 a@165@01 i@175@01) i@175@01)
      (img@177@01 a@165@01 i@175@01)))
  :pattern ((Seq_contains (Seq_range 0 4) i@175@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@175@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@175@01))
  :pattern ((inv@176@01 a@165@01 i@175@01))
  :pattern ((img@177@01 a@165@01 i@175@01))
  :qid |quant-u-79|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@177@01 a i) (Seq_contains (Seq_range 0 4) (inv@176@01 a i)))
    (and (= a@165@01 a) (= (inv@176@01 a i) i)))
  :pattern ((inv@176@01 a i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (and (img@177@01 a i) (Seq_contains (Seq_range 0 4) (inv@176@01 a i)))
    (and (img@174@01 a i) (Seq_contains (Seq_range 4 n@166@01) (inv@173@01 a i))))
  
  :qid |quant-u-80|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
(declare-const i@178@01 Int)
(push) ; 3
; [eval] (i in [4..n))
; [eval] [4..n)
(assert (Seq_contains (Seq_range 4 n@166@01) i@178@01))
(pop) ; 3
(declare-fun inv@179@01 (IArray Int) Int)
(declare-fun img@180@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@178@01 Int) (i2@178@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 4 n@166@01) i1@178@01)
      (Seq_contains (Seq_range 4 n@166@01) i2@178@01)
      (= i1@178@01 i2@178@01))
    (= i1@178@01 i2@178@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@178@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 4 n@166@01) i@178@01)
    (and
      (= (inv@179@01 a@165@01 i@178@01) i@178@01)
      (img@180@01 a@165@01 i@178@01)))
  :pattern ((Seq_contains (Seq_range 4 n@166@01) i@178@01))
  :pattern ((Seq_contains_trigger (Seq_range 4 n@166@01) i@178@01))
  :pattern ((inv@179@01 a@165@01 i@178@01))
  :pattern ((img@180@01 a@165@01 i@178@01))
  :qid |p-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@180@01 a i) (Seq_contains (Seq_range 4 n@166@01) (inv@179@01 a i)))
    (and (= a@165@01 a) (= (inv@179@01 a i) i)))
  :pattern ((inv@179@01 a i))
  :qid |p-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@181@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 4 n@166@01) (inv@179@01 a i))
      (img@180@01 a i)
      (and (= a a@165@01) (= i (inv@179@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@170@01 a i)
          (Seq_contains (Seq_range 0 n@166@01) (inv@169@01 a i)))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@170@01 a i)
          (Seq_contains (Seq_range 0 n@166@01) (inv@169@01 a i)))
        $Perm.Write
        $Perm.No)
      (pTaken@181@01 a i))
    $Perm.No)
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@181@01 a i) $Perm.No)
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 4 n@166@01) (inv@179@01 a i))
      (img@180@01 a i)
      (and (= a a@165@01) (= i (inv@179@01 a i))))
    (= (- $Perm.Write (pTaken@181@01 a i)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@182@01 $PSF<p>)
(declare-const s@183@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@183@01 $Snap)) (!
  (=>
    (and
      (img@170@01 ($SortWrappers.$SnapToIArray ($Snap.first s@183@01)) ($SortWrappers.$SnapToInt ($Snap.second s@183@01)))
      (Seq_contains
        (Seq_range 0 n@166@01)
        (inv@169@01 ($SortWrappers.$SnapToIArray ($Snap.first s@183@01)) ($SortWrappers.$SnapToInt ($Snap.second s@183@01)))))
    (and
      (not (= s@183@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@182@01  $PSF<p>) s@183@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@167@01)) s@183@01))))
  :pattern (($PSF.lookup_p (as sm@182@01  $PSF<p>) s@183@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@167@01)) s@183@01))
  :qid |qp.psmValDef6|)))
(declare-const i@184@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..4))
; [eval] [0..4)
(assert (Seq_contains (Seq_range 0 4) i@184@01))
(pop) ; 3
(declare-fun inv@185@01 (IArray Int) Int)
(declare-fun img@186@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@184@01 Int) (i2@184@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 4) i1@184@01)
      (Seq_contains (Seq_range 0 4) i2@184@01)
      (= i1@184@01 i2@184@01))
    (= i1@184@01 i2@184@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@184@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 4) i@184@01)
    (and
      (= (inv@185@01 a@165@01 i@184@01) i@184@01)
      (img@186@01 a@165@01 i@184@01)))
  :pattern ((Seq_contains (Seq_range 0 4) i@184@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@184@01))
  :pattern ((inv@185@01 a@165@01 i@184@01))
  :pattern ((img@186@01 a@165@01 i@184@01))
  :qid |p-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and (img@186@01 a i) (Seq_contains (Seq_range 0 4) (inv@185@01 a i)))
    (and (= a@165@01 a) (= (inv@185@01 a i) i)))
  :pattern ((inv@185@01 a i))
  :qid |p-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@187@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 4) (inv@185@01 a i))
      (img@186@01 a i)
      (and (= a a@165@01) (= i (inv@185@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@170@01 a i)
          (Seq_contains (Seq_range 0 n@166@01) (inv@169@01 a i)))
        (- $Perm.Write (pTaken@181@01 a i))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@170@01 a i)
          (Seq_contains (Seq_range 0 n@166@01) (inv@169@01 a i)))
        (- $Perm.Write (pTaken@181@01 a i))
        $Perm.No)
      (pTaken@187@01 a i))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 4) (inv@185@01 a i))
      (img@186@01 a i)
      (and (= a a@165@01) (= i (inv@185@01 a i))))
    (= (- $Perm.Write (pTaken@187@01 a i)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@188@01 $PSF<p>)
(declare-const s@189@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@189@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@170@01 ($SortWrappers.$SnapToIArray ($Snap.first s@189@01)) ($SortWrappers.$SnapToInt ($Snap.second s@189@01)))
        (Seq_contains
          (Seq_range 0 n@166@01)
          (inv@169@01 ($SortWrappers.$SnapToIArray ($Snap.first s@189@01)) ($SortWrappers.$SnapToInt ($Snap.second s@189@01)))))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@181@01 ($SortWrappers.$SnapToIArray ($Snap.first s@189@01)) ($SortWrappers.$SnapToInt ($Snap.second s@189@01)))))
      false)
    (and
      (not (= s@189@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@188@01  $PSF<p>) s@189@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@167@01)) s@189@01))))
  :pattern (($PSF.lookup_p (as sm@188@01  $PSF<p>) s@189@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@167@01)) s@189@01))
  :qid |qp.psmValDef7|)))
(pop) ; 2
(pop) ; 1
; ---------- m10 ----------
(declare-const a@190@01 IArray)
(declare-const n@191@01 Int)
(declare-const a@192@01 IArray)
(declare-const n@193@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@194@01 $Snap)
(assert (= $t@194@01 ($Snap.combine ($Snap.first $t@194@01) ($Snap.second $t@194@01))))
(assert (= ($Snap.first $t@194@01) $Snap.unit))
; [eval] n > 5
(assert (> n@193@01 5))
(declare-const i@195@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@193@01) i@195@01))
; [eval] loc(a, i)
(pop) ; 2
(declare-fun inv@196@01 ($Ref) Int)
(declare-fun img@197@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@195@01 Int) (i2@195@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@193@01) i1@195@01)
      (Seq_contains (Seq_range 0 n@193@01) i2@195@01)
      (= (loc<Ref> a@192@01 i1@195@01) (loc<Ref> a@192@01 i2@195@01)))
    (= i1@195@01 i2@195@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@195@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@193@01) i@195@01)
    (and
      (= (inv@196@01 (loc<Ref> a@192@01 i@195@01)) i@195@01)
      (img@197@01 (loc<Ref> a@192@01 i@195@01))))
  :pattern ((loc<Ref> a@192@01 i@195@01))
  :qid |quant-u-91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@197@01 r) (Seq_contains (Seq_range 0 n@193@01) (inv@196@01 r)))
    (= (loc<Ref> a@192@01 (inv@196@01 r)) r))
  :pattern ((inv@196@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@195@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@193@01) i@195@01)
    (not (= (loc<Ref> a@192@01 i@195@01) $Ref.null)))
  :pattern ((loc<Ref> a@192@01 i@195@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@198@01 $Snap)
(assert (= $t@198@01 ($Snap.combine ($Snap.first $t@198@01) ($Snap.second $t@198@01))))
(declare-const i@199@01 Int)
(push) ; 3
; [eval] (i in [4..n))
; [eval] [4..n)
(assert (Seq_contains (Seq_range 4 n@193@01) i@199@01))
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@200@01 ($Ref) Int)
(declare-fun img@201@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@199@01 Int) (i2@199@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 4 n@193@01) i1@199@01)
      (Seq_contains (Seq_range 4 n@193@01) i2@199@01)
      (= (loc<Ref> a@192@01 i1@199@01) (loc<Ref> a@192@01 i2@199@01)))
    (= i1@199@01 i2@199@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@199@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 4 n@193@01) i@199@01)
    (and
      (= (inv@200@01 (loc<Ref> a@192@01 i@199@01)) i@199@01)
      (img@201@01 (loc<Ref> a@192@01 i@199@01))))
  :pattern ((loc<Ref> a@192@01 i@199@01))
  :qid |quant-u-93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@201@01 r) (Seq_contains (Seq_range 4 n@193@01) (inv@200@01 r)))
    (= (loc<Ref> a@192@01 (inv@200@01 r)) r))
  :pattern ((inv@200@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@199@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 4 n@193@01) i@199@01)
    (not (= (loc<Ref> a@192@01 i@199@01) $Ref.null)))
  :pattern ((loc<Ref> a@192@01 i@199@01))
  :qid |val-permImpliesNonNull|)))
(declare-const i@202@01 Int)
(push) ; 3
; [eval] (i in [0..4))
; [eval] [0..4)
(assert (Seq_contains (Seq_range 0 4) i@202@01))
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@203@01 ($Ref) Int)
(declare-fun img@204@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@202@01 Int) (i2@202@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 4) i1@202@01)
      (Seq_contains (Seq_range 0 4) i2@202@01)
      (= (loc<Ref> a@192@01 i1@202@01) (loc<Ref> a@192@01 i2@202@01)))
    (= i1@202@01 i2@202@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@202@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 4) i@202@01)
    (and
      (= (inv@203@01 (loc<Ref> a@192@01 i@202@01)) i@202@01)
      (img@204@01 (loc<Ref> a@192@01 i@202@01))))
  :pattern ((loc<Ref> a@192@01 i@202@01))
  :qid |quant-u-95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@204@01 r) (Seq_contains (Seq_range 0 4) (inv@203@01 r)))
    (= (loc<Ref> a@192@01 (inv@203@01 r)) r))
  :pattern ((inv@203@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@202@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 4) i@202@01)
    (not (= (loc<Ref> a@192@01 i@202@01) $Ref.null)))
  :pattern ((loc<Ref> a@192@01 i@202@01))
  :qid |val-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (loc<Ref> a@192@01 i@202@01) (loc<Ref> a@192@01 i@199@01))
    (=
      (and (img@204@01 r) (Seq_contains (Seq_range 0 4) (inv@203@01 r)))
      (and (img@201@01 r) (Seq_contains (Seq_range 4 n@193@01) (inv@200@01 r)))))
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
(declare-const i@205@01 Int)
(push) ; 3
; [eval] (i in [4..n))
; [eval] [4..n)
(assert (Seq_contains (Seq_range 4 n@193@01) i@205@01))
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@206@01 ($Ref) Int)
(declare-fun img@207@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@205@01 Int) (i2@205@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 4 n@193@01) i1@205@01)
      (Seq_contains (Seq_range 4 n@193@01) i2@205@01)
      (= (loc<Ref> a@192@01 i1@205@01) (loc<Ref> a@192@01 i2@205@01)))
    (= i1@205@01 i2@205@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@205@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 4 n@193@01) i@205@01)
    (and
      (= (inv@206@01 (loc<Ref> a@192@01 i@205@01)) i@205@01)
      (img@207@01 (loc<Ref> a@192@01 i@205@01))))
  :pattern ((loc<Ref> a@192@01 i@205@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@207@01 r) (Seq_contains (Seq_range 4 n@193@01) (inv@206@01 r)))
    (= (loc<Ref> a@192@01 (inv@206@01 r)) r))
  :pattern ((inv@206@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@208@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 4 n@193@01) (inv@206@01 r))
      (img@207@01 r)
      (= r (loc<Ref> a@192@01 (inv@206@01 r))))
    ($Perm.min
      (ite
        (and (img@197@01 r) (Seq_contains (Seq_range 0 n@193@01) (inv@196@01 r)))
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
        (and (img@197@01 r) (Seq_contains (Seq_range 0 n@193@01) (inv@196@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@208@01 r))
    $Perm.No)
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@208@01 r) $Perm.No)
  
  :qid |quant-u-100|))))
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
      (Seq_contains (Seq_range 4 n@193@01) (inv@206@01 r))
      (img@207@01 r)
      (= r (loc<Ref> a@192@01 (inv@206@01 r))))
    (= (- $Perm.Write (pTaken@208@01 r)) $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@209@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@197@01 r) (Seq_contains (Seq_range 0 n@193@01) (inv@196@01 r)))
    (=
      ($FVF.lookup_val (as sm@209@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@194@01)) r)))
  :pattern (($FVF.lookup_val (as sm@209@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@194@01)) r))
  :qid |qp.fvfValDef8|)))
(declare-const i@210@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..4))
; [eval] [0..4)
(assert (Seq_contains (Seq_range 0 4) i@210@01))
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@211@01 ($Ref) Int)
(declare-fun img@212@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@210@01 Int) (i2@210@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 4) i1@210@01)
      (Seq_contains (Seq_range 0 4) i2@210@01)
      (= (loc<Ref> a@192@01 i1@210@01) (loc<Ref> a@192@01 i2@210@01)))
    (= i1@210@01 i2@210@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@210@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 4) i@210@01)
    (and
      (= (inv@211@01 (loc<Ref> a@192@01 i@210@01)) i@210@01)
      (img@212@01 (loc<Ref> a@192@01 i@210@01))))
  :pattern ((loc<Ref> a@192@01 i@210@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@212@01 r) (Seq_contains (Seq_range 0 4) (inv@211@01 r)))
    (= (loc<Ref> a@192@01 (inv@211@01 r)) r))
  :pattern ((inv@211@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@213@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 4) (inv@211@01 r))
      (img@212@01 r)
      (= r (loc<Ref> a@192@01 (inv@211@01 r))))
    ($Perm.min
      (ite
        (and (img@197@01 r) (Seq_contains (Seq_range 0 n@193@01) (inv@196@01 r)))
        (- $Perm.Write (pTaken@208@01 r))
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
        (and (img@197@01 r) (Seq_contains (Seq_range 0 n@193@01) (inv@196@01 r)))
        (- $Perm.Write (pTaken@208@01 r))
        $Perm.No)
      (pTaken@213@01 r))
    $Perm.No)
  
  :qid |quant-u-104|))))
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
      (Seq_contains (Seq_range 0 4) (inv@211@01 r))
      (img@212@01 r)
      (= r (loc<Ref> a@192@01 (inv@211@01 r))))
    (= (- $Perm.Write (pTaken@213@01 r)) $Perm.No))
  
  :qid |quant-u-105|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@214@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@197@01 r) (Seq_contains (Seq_range 0 n@193@01) (inv@196@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@208@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@214@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@194@01)) r)))
  :pattern (($FVF.lookup_val (as sm@214@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@194@01)) r))
  :qid |qp.fvfValDef9|)))
(pop) ; 2
(pop) ; 1
