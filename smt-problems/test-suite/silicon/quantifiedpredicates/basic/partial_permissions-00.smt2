(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:24:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<f> 0)
(declare-sort $PSF<pred> 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<pred>To$Snap ($PSF<pred>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<pred> ($Snap) $PSF<pred>)
(assert (forall ((x $PSF<pred>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<pred>($SortWrappers.$PSF<pred>To$Snap x)))
    :pattern (($SortWrappers.$PSF<pred>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<pred>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<pred>To$Snap($SortWrappers.$SnapTo$PSF<pred> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<pred> x))
    :qid |$Snap.$PSF<pred>To$SnapTo$PSF<pred>|
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /predicate_snap_functions_declarations.smt2 [pred: Int]
(declare-fun $PSF.domain_pred ($PSF<pred>) Set<$Snap>)
(declare-fun $PSF.lookup_pred ($PSF<pred> $Snap) Int)
(declare-fun $PSF.after_pred ($PSF<pred> $PSF<pred>) Bool)
(declare-fun $PSF.loc_pred (Int $Snap) Bool)
(declare-fun $PSF.perm_pred ($PPM $Snap) $Perm)
(declare-const $psfTOP_pred $PSF<pred>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun pred%trigger ($Snap $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [pred: Int]
(assert (forall ((vs $PSF<pred>) (ws $PSF<pred>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_pred vs) ($PSF.domain_pred ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_pred vs))
            (= ($PSF.lookup_pred vs x) ($PSF.lookup_pred ws x)))
          :pattern (($PSF.lookup_pred vs x) ($PSF.lookup_pred ws x))
          :qid |qp.$PSF<pred>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<pred>To$Snap vs)
              ($SortWrappers.$PSF<pred>To$Snap ws)
              )
    :qid |qp.$PSF<pred>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_pred pm s))
    :pattern (($PSF.perm_pred pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_pred f s) true)
    :pattern (($PSF.loc_pred f s)))))
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
; ---------- t1 ----------
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const x@2@01 $Ref)
(push) ; 2
(declare-const $k@3@01 $Perm)
(assert ($Perm.isReadVar $k@3@01))
(declare-const sm@4@01 $PSF<pred>)
(declare-const s@5@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-const $t@6@01 $PSF<pred>)
(declare-fun inv@7@01 ($Ref) $Ref)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@3@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@2@01 $Ref)) (!
  (or (= $k@3@01 $Perm.No) (< $Perm.No $k@3@01))
  
  :qid |quant-u-0|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@2@01 $Ref) (x2@2@01 $Ref)) (!
  (=> (and (< $Perm.No $k@3@01) (= x1@2@01 x2@2@01)) (= x1@2@01 x2@2@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@2@01 $Ref)) (!
  (=> (< $Perm.No $k@3@01) (and (= (inv@7@01 x@2@01) x@2@01) (img@8@01 x@2@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred $t@6@01 ($SortWrappers.$RefTo$Snap x@2@01)) ($SortWrappers.$RefTo$Snap x@2@01)))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@8@01 r) (< $Perm.No $k@3@01)) (= (inv@7@01 r) r))
  :pattern ((inv@7@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@2@01 $Ref)) (!
  (<= $Perm.No $k@3@01)
  :pattern (($PSF.loc_pred ($PSF.lookup_pred $t@6@01 ($SortWrappers.$RefTo$Snap x@2@01)) ($SortWrappers.$RefTo$Snap x@2@01)))
  :qid |pred-permAtLeastZero|)))
(declare-const sm@9@01 $PSF<pred>)
(declare-const s@10@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@10@01 $Snap)) (!
  (=>
    (ite
      (img@8@01 ($SortWrappers.$SnapTo$Ref s@10@01))
      (< $Perm.No $k@3@01)
      false)
    (and
      (not (= s@10@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@9@01  $PSF<pred>) s@10@01)
        ($PSF.lookup_pred $t@6@01 s@10@01))))
  :pattern (($PSF.lookup_pred (as sm@9@01  $PSF<pred>) s@10@01))
  :pattern (($PSF.lookup_pred $t@6@01 s@10@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@10@01 $Snap)) (!
  ($PSF.loc_pred ($PSF.lookup_pred $t@6@01 s@10@01) s@10@01)
  :pattern (($PSF.lookup_pred (as sm@9@01  $PSF<pred>) s@10@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  ($PSF.loc_pred ($PSF.lookup_pred (as sm@9@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r))
  :pattern ((inv@7@01 r))
  :qid |quant-u-2|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; t1(r)
(declare-const x@11@01 $Ref)
(push) ; 3
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@13@01 ($Ref) $Ref)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@12@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@11@01 $Ref)) (!
  (or (= $k@12@01 $Perm.No) (< $Perm.No $k@12@01))
  
  :qid |quant-u-3|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@11@01 $Ref) (x2@11@01 $Ref)) (!
  (=>
    (and
      (and
        ($PSF.loc_pred ($PSF.lookup_pred (as sm@9@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x1@11@01)) ($SortWrappers.$RefTo$Snap x1@11@01))
        (< $Perm.No $k@12@01))
      (and
        ($PSF.loc_pred ($PSF.lookup_pred (as sm@9@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x2@11@01)) ($SortWrappers.$RefTo$Snap x2@11@01))
        (< $Perm.No $k@12@01))
      (= x1@11@01 x2@11@01))
    (= x1@11@01 x2@11@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@11@01 $Ref)) (!
  (=>
    (< $Perm.No $k@12@01)
    (and (= (inv@13@01 x@11@01) x@11@01) (img@14@01 x@11@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred (as sm@9@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x@11@01)) ($SortWrappers.$RefTo$Snap x@11@01)))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@14@01 r) (< $Perm.No $k@12@01)) (= (inv@13@01 r) r))
  :pattern ((inv@13@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  ($PSF.loc_pred ($PSF.lookup_pred (as sm@9@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r))
  :pattern ((inv@13@01 r))
  :qid |quant-u-4|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@15@01 ((r $Ref)) $Perm
  (ite
    (and (img@14@01 r) (= r (inv@13@01 r)))
    ($Perm.min (ite (img@8@01 r) $k@3@01 $Perm.No) $k@12@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@12@01
(assert (forall ((r $Ref)) (!
  (=>
    (not (= (ite (img@8@01 r) $k@3@01 $Perm.No) $Perm.No))
    (ite
      (img@8@01 r)
      (< (ite (and (img@14@01 r) (= r (inv@13@01 r))) $k@12@01 $Perm.No) $k@3@01)
      (<
        (ite (and (img@14@01 r) (= r (inv@13@01 r))) $k@12@01 $Perm.No)
        $Perm.No)))
  :pattern ((img@8@01 r))
  :pattern ((img@14@01 r))
  :pattern ((inv@13@01 r))
  :qid |qp.srp3|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= r (inv@13@01 r)))
    (= (- $k@12@01 (pTaken@15@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; t1(r)
(declare-const x@16@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@17@01 $Perm)
(assert ($Perm.isReadVar $k@17@01))
(declare-const sm@18@01 $PSF<pred>)
(declare-const s@19@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@19@01 $Snap)) (!
  (=>
    (ite
      (img@8@01 ($SortWrappers.$SnapTo$Ref s@19@01))
      (< $Perm.No (- $k@3@01 (pTaken@15@01 ($SortWrappers.$SnapTo$Ref s@19@01))))
      false)
    (and
      (not (= s@19@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@18@01  $PSF<pred>) s@19@01)
        ($PSF.lookup_pred $t@6@01 s@19@01))))
  :pattern (($PSF.lookup_pred (as sm@18@01  $PSF<pred>) s@19@01))
  :pattern (($PSF.lookup_pred $t@6@01 s@19@01))
  :qid |qp.psmValDef4|)))
(assert (forall ((s@19@01 $Snap)) (!
  ($PSF.loc_pred ($PSF.lookup_pred $t@6@01 s@19@01) s@19@01)
  :pattern (($PSF.lookup_pred (as sm@18@01  $PSF<pred>) s@19@01))
  :qid |qp.psmResTrgDef5|)))
(pop) ; 3
(declare-fun inv@20@01 ($Ref) $Ref)
(declare-fun img@21@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@17@01))
(assert (forall ((s@19@01 $Snap)) (!
  (=>
    (ite
      (img@8@01 ($SortWrappers.$SnapTo$Ref s@19@01))
      (< $Perm.No (- $k@3@01 (pTaken@15@01 ($SortWrappers.$SnapTo$Ref s@19@01))))
      false)
    (and
      (not (= s@19@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@18@01  $PSF<pred>) s@19@01)
        ($PSF.lookup_pred $t@6@01 s@19@01))))
  :pattern (($PSF.lookup_pred (as sm@18@01  $PSF<pred>) s@19@01))
  :pattern (($PSF.lookup_pred $t@6@01 s@19@01))
  :qid |qp.psmValDef4|)))
(assert (forall ((s@19@01 $Snap)) (!
  ($PSF.loc_pred ($PSF.lookup_pred $t@6@01 s@19@01) s@19@01)
  :pattern (($PSF.lookup_pred (as sm@18@01  $PSF<pred>) s@19@01))
  :qid |qp.psmResTrgDef5|)))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@16@01 $Ref)) (!
  (or (= $k@17@01 $Perm.No) (< $Perm.No $k@17@01))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@22@01 $PSF<pred>)
(declare-const s@23@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@23@01 $Snap)) (!
  (=>
    (ite
      (img@8@01 ($SortWrappers.$SnapTo$Ref s@23@01))
      (< $Perm.No (- $k@3@01 (pTaken@15@01 ($SortWrappers.$SnapTo$Ref s@23@01))))
      false)
    (and
      (not (= s@23@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@22@01  $PSF<pred>) s@23@01)
        ($PSF.lookup_pred $t@6@01 s@23@01))))
  :pattern (($PSF.lookup_pred (as sm@22@01  $PSF<pred>) s@23@01))
  :pattern (($PSF.lookup_pred $t@6@01 s@23@01))
  :qid |qp.psmValDef6|)))
(assert (forall ((s@23@01 $Snap)) (!
  ($PSF.loc_pred ($PSF.lookup_pred $t@6@01 s@23@01) s@23@01)
  :pattern (($PSF.lookup_pred (as sm@22@01  $PSF<pred>) s@23@01))
  :qid |qp.psmResTrgDef7|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@16@01 $Ref) (x2@16@01 $Ref)) (!
  (=>
    (and
      (and
        ($PSF.loc_pred ($PSF.lookup_pred (as sm@22@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x1@16@01)) ($SortWrappers.$RefTo$Snap x1@16@01))
        (< $Perm.No $k@17@01))
      (and
        ($PSF.loc_pred ($PSF.lookup_pred (as sm@22@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x2@16@01)) ($SortWrappers.$RefTo$Snap x2@16@01))
        (< $Perm.No $k@17@01))
      (= x1@16@01 x2@16@01))
    (= x1@16@01 x2@16@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@16@01 $Ref)) (!
  (=>
    (< $Perm.No $k@17@01)
    (and (= (inv@20@01 x@16@01) x@16@01) (img@21@01 x@16@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred (as sm@18@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x@16@01)) ($SortWrappers.$RefTo$Snap x@16@01)))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@21@01 r) (< $Perm.No $k@17@01)) (= (inv@20@01 r) r))
  :pattern ((inv@20@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  ($PSF.loc_pred ($PSF.lookup_pred (as sm@22@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r))
  :pattern ((inv@20@01 r))
  :qid |quant-u-9|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@24@01 ((r $Ref)) $Perm
  (ite
    (and (img@21@01 r) (= r (inv@20@01 r)))
    ($Perm.min (ite (img@8@01 r) (- $k@3@01 (pTaken@15@01 r)) $Perm.No) $k@17@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@17@01
(assert (forall ((r $Ref)) (!
  (=>
    (not (= (ite (img@8@01 r) (- $k@3@01 (pTaken@15@01 r)) $Perm.No) $Perm.No))
    (ite
      (img@8@01 r)
      (<
        (ite (and (img@21@01 r) (= r (inv@20@01 r))) $k@17@01 $Perm.No)
        (- $k@3@01 (pTaken@15@01 r)))
      (<
        (ite (and (img@21@01 r) (= r (inv@20@01 r))) $k@17@01 $Perm.No)
        $Perm.No)))
  :pattern ((img@8@01 r))
  :pattern ((img@21@01 r))
  :pattern ((inv@20@01 r))
  :qid |qp.srp8|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (= r (inv@20@01 r)))
    (= (- $k@17@01 (pTaken@24@01 r)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(declare-const r@25@01 $Ref)
(declare-const r@26@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const x@27@01 $Ref)
(push) ; 2
(declare-const $k@28@01 $Perm)
(assert ($Perm.isReadVar $k@28@01))
(declare-const sm@29@01 $FVF<f>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-const $t@30@01 $FVF<f>)
(declare-fun inv@31@01 ($Ref) $Ref)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@28@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@27@01 $Ref)) (!
  (or (= $k@28@01 $Perm.No) (< $Perm.No $k@28@01))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=> (and (< $Perm.No $k@28@01) (= x1@27@01 x2@27@01)) (= x1@27@01 x2@27@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (< $Perm.No $k@28@01)
    (and (= (inv@31@01 x@27@01) x@27@01) (img@32@01 x@27@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@30@01 x@27@01) x@27@01))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@32@01 r) (< $Perm.No $k@28@01)) (= (inv@31@01 r) r))
  :pattern ((inv@31@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@27@01 $Ref)) (!
  (<= $Perm.No $k@28@01)
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@30@01 x@27@01) x@27@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@27@01 $Ref)) (!
  (<= $k@28@01 $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@30@01 x@27@01) x@27@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@27@01 $Ref)) (!
  (=> (< $Perm.No $k@28@01) (not (= x@27@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@30@01 x@27@01) x@27@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@33@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@32@01 r) (< $Perm.No $k@28@01) false)
    (= ($FVF.lookup_f (as sm@33@01  $FVF<f>) r) ($FVF.lookup_f $t@30@01 r)))
  :pattern (($FVF.lookup_f (as sm@33@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@30@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@30@01 r) r)
  :pattern (($FVF.lookup_f (as sm@33@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@33@01  $FVF<f>) r) r)
  :pattern ((inv@31@01 r))
  :qid |quant-u-15|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; t2(r)
(declare-const x@34@01 $Ref)
(push) ; 3
(declare-const $k@35@01 $Perm)
(assert ($Perm.isReadVar $k@35@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@36@01 ($Ref) $Ref)
(declare-fun img@37@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@35@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@34@01 $Ref)) (!
  (or (= $k@35@01 $Perm.No) (< $Perm.No $k@35@01))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@34@01 $Ref) (x2@34@01 $Ref)) (!
  (=>
    (and
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@33@01  $FVF<f>) x1@34@01) x1@34@01)
        (< $Perm.No $k@35@01))
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@33@01  $FVF<f>) x2@34@01) x2@34@01)
        (< $Perm.No $k@35@01))
      (= x1@34@01 x2@34@01))
    (= x1@34@01 x2@34@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@34@01 $Ref)) (!
  (=>
    (< $Perm.No $k@35@01)
    (and (= (inv@36@01 x@34@01) x@34@01) (img@37@01 x@34@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@33@01  $FVF<f>) x@34@01) x@34@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@37@01 r) (< $Perm.No $k@35@01)) (= (inv@36@01 r) r))
  :pattern ((inv@36@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@33@01  $FVF<f>) r) r)
  :pattern ((inv@36@01 r))
  :qid |quant-u-17|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@38@01 ((r $Ref)) $Perm
  (ite
    (and (img@37@01 r) (= r (inv@36@01 r)))
    ($Perm.min (ite (img@32@01 r) $k@28@01 $Perm.No) $k@35@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@35@01
(assert (forall ((r $Ref)) (!
  (=>
    (not (= (ite (img@32@01 r) $k@28@01 $Perm.No) $Perm.No))
    (ite
      (img@32@01 r)
      (<
        (ite (and (img@37@01 r) (= r (inv@36@01 r))) $k@35@01 $Perm.No)
        $k@28@01)
      (<
        (ite (and (img@37@01 r) (= r (inv@36@01 r))) $k@35@01 $Perm.No)
        $Perm.No)))
  :pattern ((img@32@01 r))
  :pattern ((img@37@01 r))
  :pattern ((inv@36@01 r))
  :qid |qp.srp12|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (= r (inv@36@01 r)))
    (= (- $k@35@01 (pTaken@38@01 r)) $Perm.No))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; t2(r)
(declare-const x@39@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@40@01 $Perm)
(assert ($Perm.isReadVar $k@40@01))
(declare-const sm@41@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@32@01 r) (< $Perm.No (- $k@28@01 (pTaken@38@01 r))) false)
    (= ($FVF.lookup_f (as sm@41@01  $FVF<f>) r) ($FVF.lookup_f $t@30@01 r)))
  :pattern (($FVF.lookup_f (as sm@41@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@30@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@30@01 r) r)
  :pattern (($FVF.lookup_f (as sm@41@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef14|)))
(pop) ; 3
(declare-fun inv@42@01 ($Ref) $Ref)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@40@01))
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@32@01 r) (< $Perm.No (- $k@28@01 (pTaken@38@01 r))) false)
    (= ($FVF.lookup_f (as sm@41@01  $FVF<f>) r) ($FVF.lookup_f $t@30@01 r)))
  :pattern (($FVF.lookup_f (as sm@41@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@30@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@30@01 r) r)
  :pattern (($FVF.lookup_f (as sm@41@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef14|)))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@39@01 $Ref)) (!
  (or (= $k@40@01 $Perm.No) (< $Perm.No $k@40@01))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@44@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@32@01 r) (< $Perm.No (- $k@28@01 (pTaken@38@01 r))) false)
    (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) r) ($FVF.lookup_f $t@30@01 r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@30@01 r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@30@01 r) r)
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef16|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@39@01 $Ref) (x2@39@01 $Ref)) (!
  (=>
    (and
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@44@01  $FVF<f>) x1@39@01) x1@39@01)
        (< $Perm.No $k@40@01))
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@44@01  $FVF<f>) x2@39@01) x2@39@01)
        (< $Perm.No $k@40@01))
      (= x1@39@01 x2@39@01))
    (= x1@39@01 x2@39@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@39@01 $Ref)) (!
  (=>
    (< $Perm.No $k@40@01)
    (and (= (inv@42@01 x@39@01) x@39@01) (img@43@01 x@39@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@41@01  $FVF<f>) x@39@01) x@39@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@43@01 r) (< $Perm.No $k@40@01)) (= (inv@42@01 r) r))
  :pattern ((inv@42@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@44@01  $FVF<f>) r) r)
  :pattern ((inv@42@01 r))
  :qid |quant-u-22|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (and (img@43@01 r) (= r (inv@42@01 r)))
    ($Perm.min
      (ite (img@32@01 r) (- $k@28@01 (pTaken@38@01 r)) $Perm.No)
      $k@40@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@40@01
(assert (forall ((r $Ref)) (!
  (=>
    (not (= (ite (img@32@01 r) (- $k@28@01 (pTaken@38@01 r)) $Perm.No) $Perm.No))
    (ite
      (img@32@01 r)
      (<
        (ite (and (img@43@01 r) (= r (inv@42@01 r))) $k@40@01 $Perm.No)
        (- $k@28@01 (pTaken@38@01 r)))
      (<
        (ite (and (img@43@01 r) (= r (inv@42@01 r))) $k@40@01 $Perm.No)
        $Perm.No)))
  :pattern ((img@32@01 r))
  :pattern ((img@43@01 r))
  :pattern ((inv@42@01 r))
  :qid |qp.srp17|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@43@01 r) (= r (inv@42@01 r)))
    (= (- $k@40@01 (pTaken@45@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- t3 ----------
(declare-const r@46@01 $Ref)
(declare-const r@47@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const x@48@01 $Ref)
(push) ; 2
(declare-const $k@49@01 $Perm)
(assert ($Perm.isReadVar $k@49@01))
(declare-const sm@50@01 $PSF<pred>)
(declare-const s@51@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-const $t@52@01 $PSF<pred>)
(declare-fun inv@53@01 ($Ref) $Ref)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@49@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@48@01 $Ref)) (!
  (or (= $k@49@01 $Perm.No) (< $Perm.No $k@49@01))
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@48@01 $Ref) (x2@48@01 $Ref)) (!
  (=> (and (< $Perm.No $k@49@01) (= x1@48@01 x2@48@01)) (= x1@48@01 x2@48@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@48@01 $Ref)) (!
  (=>
    (< $Perm.No $k@49@01)
    (and (= (inv@53@01 x@48@01) x@48@01) (img@54@01 x@48@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred $t@52@01 ($SortWrappers.$RefTo$Snap x@48@01)) ($SortWrappers.$RefTo$Snap x@48@01)))
  :qid |quant-u-27|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@54@01 r) (< $Perm.No $k@49@01)) (= (inv@53@01 r) r))
  :pattern ((inv@53@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@48@01 $Ref)) (!
  (<= $Perm.No $k@49@01)
  :pattern (($PSF.loc_pred ($PSF.lookup_pred $t@52@01 ($SortWrappers.$RefTo$Snap x@48@01)) ($SortWrappers.$RefTo$Snap x@48@01)))
  :qid |pred-permAtLeastZero|)))
(declare-const sm@55@01 $PSF<pred>)
(declare-const s@56@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@56@01 $Snap)) (!
  (=>
    (ite
      (img@54@01 ($SortWrappers.$SnapTo$Ref s@56@01))
      (< $Perm.No $k@49@01)
      false)
    (and
      (not (= s@56@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@55@01  $PSF<pred>) s@56@01)
        ($PSF.lookup_pred $t@52@01 s@56@01))))
  :pattern (($PSF.lookup_pred (as sm@55@01  $PSF<pred>) s@56@01))
  :pattern (($PSF.lookup_pred $t@52@01 s@56@01))
  :qid |qp.psmValDef19|)))
(assert (forall ((s@56@01 $Snap)) (!
  ($PSF.loc_pred ($PSF.lookup_pred $t@52@01 s@56@01) s@56@01)
  :pattern (($PSF.lookup_pred (as sm@55@01  $PSF<pred>) s@56@01))
  :qid |qp.psmResTrgDef20|)))
(assert (forall ((r $Ref)) (!
  ($PSF.loc_pred ($PSF.lookup_pred (as sm@55@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r))
  :pattern ((inv@53@01 r))
  :qid |quant-u-28|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 ($Snap.combine ($Snap.first $t@57@01) ($Snap.second $t@57@01))))
(declare-const x@58@01 $Ref)
(push) ; 3
(declare-const $k@59@01 $Perm)
(assert ($Perm.isReadVar $k@59@01))
(declare-const sm@60@01 $PSF<pred>)
(declare-const s@61@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@62@01 ($Ref) $Ref)
(declare-fun img@63@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@59@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@58@01 $Ref)) (!
  (or (= $k@59@01 $Perm.No) (< $Perm.No $k@59@01))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@58@01 $Ref) (x2@58@01 $Ref)) (!
  (=> (and (< $Perm.No $k@59@01) (= x1@58@01 x2@58@01)) (= x1@58@01 x2@58@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@58@01 $Ref)) (!
  (=>
    (< $Perm.No $k@59@01)
    (and (= (inv@62@01 x@58@01) x@58@01) (img@63@01 x@58@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@57@01)) ($SortWrappers.$RefTo$Snap x@58@01)) ($SortWrappers.$RefTo$Snap x@58@01)))
  :qid |quant-u-30|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@63@01 r) (< $Perm.No $k@59@01)) (= (inv@62@01 r) r))
  :pattern ((inv@62@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@58@01 $Ref)) (!
  (<= $Perm.No $k@59@01)
  :pattern (($PSF.loc_pred ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@57@01)) ($SortWrappers.$RefTo$Snap x@58@01)) ($SortWrappers.$RefTo$Snap x@58@01)))
  :qid |pred-permAtLeastZero|)))
(declare-const sm@64@01 $PSF<pred>)
(declare-const s@65@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@65@01 $Snap)) (!
  (=>
    (ite
      (img@63@01 ($SortWrappers.$SnapTo$Ref s@65@01))
      (< $Perm.No $k@59@01)
      false)
    (and
      (not (= s@65@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@64@01  $PSF<pred>) s@65@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@57@01)) s@65@01))))
  :pattern (($PSF.lookup_pred (as sm@64@01  $PSF<pred>) s@65@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@57@01)) s@65@01))
  :qid |qp.psmValDef22|)))
(assert (forall ((s@65@01 $Snap)) (!
  ($PSF.loc_pred ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@57@01)) s@65@01) s@65@01)
  :pattern (($PSF.lookup_pred (as sm@64@01  $PSF<pred>) s@65@01))
  :qid |qp.psmResTrgDef23|)))
(assert (forall ((r $Ref)) (!
  ($PSF.loc_pred ($PSF.lookup_pred (as sm@64@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r))
  :pattern ((inv@62@01 r))
  :qid |quant-u-31|)))
(declare-const x@66@01 $Ref)
(push) ; 3
(declare-const $k@67@01 $Perm)
(assert ($Perm.isReadVar $k@67@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@68@01 ($Ref) $Ref)
(declare-fun img@69@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@67@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@66@01 $Ref)) (!
  (or (= $k@67@01 $Perm.No) (< $Perm.No $k@67@01))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@66@01 $Ref) (x2@66@01 $Ref)) (!
  (=> (and (< $Perm.No $k@67@01) (= x1@66@01 x2@66@01)) (= x1@66@01 x2@66@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@66@01 $Ref)) (!
  (=>
    (< $Perm.No $k@67@01)
    (and (= (inv@68@01 x@66@01) x@66@01) (img@69@01 x@66@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@57@01)) ($SortWrappers.$RefTo$Snap x@66@01)) ($SortWrappers.$RefTo$Snap x@66@01)))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@69@01 r) (< $Perm.No $k@67@01)) (= (inv@68@01 r) r))
  :pattern ((inv@68@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@66@01 $Ref)) (!
  (<= $Perm.No $k@67@01)
  :pattern (($PSF.loc_pred ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@57@01)) ($SortWrappers.$RefTo$Snap x@66@01)) ($SortWrappers.$RefTo$Snap x@66@01)))
  :qid |pred-permAtLeastZero|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and (= x@66@01 x@58@01) (= (img@69@01 r) (img@63@01 r)))
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@70@01 $PSF<pred>)
(declare-const s@71@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@71@01 $Snap)) (!
  (=>
    (ite
      (img@63@01 ($SortWrappers.$SnapTo$Ref s@71@01))
      (< $Perm.No $k@59@01)
      false)
    (and
      (not (= s@71@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@70@01  $PSF<pred>) s@71@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@57@01)) s@71@01))))
  :pattern (($PSF.lookup_pred (as sm@70@01  $PSF<pred>) s@71@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@57@01)) s@71@01))
  :qid |qp.psmValDef24|)))
(assert (forall ((s@71@01 $Snap)) (!
  (=>
    (ite
      (img@69@01 ($SortWrappers.$SnapTo$Ref s@71@01))
      (< $Perm.No $k@67@01)
      false)
    (and
      (not (= s@71@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@70@01  $PSF<pred>) s@71@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@57@01)) s@71@01))))
  :pattern (($PSF.lookup_pred (as sm@70@01  $PSF<pred>) s@71@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@57@01)) s@71@01))
  :qid |qp.psmValDef25|)))
(assert (forall ((s@71@01 $Snap)) (!
  (and
    ($PSF.loc_pred ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@57@01)) s@71@01) s@71@01)
    ($PSF.loc_pred ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@57@01)) s@71@01) s@71@01))
  :pattern (($PSF.lookup_pred (as sm@70@01  $PSF<pred>) s@71@01))
  :qid |qp.psmResTrgDef26|)))
(assert (forall ((r $Ref)) (!
  ($PSF.loc_pred ($PSF.lookup_pred (as sm@70@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r))
  :pattern ((inv@68@01 r))
  :qid |quant-u-35|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
(declare-const x@72@01 $Ref)
(push) ; 3
(declare-const $k@73@01 $Perm)
(assert ($Perm.isReadVar $k@73@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@74@01 ($Ref) $Ref)
(declare-fun img@75@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@73@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@72@01 $Ref)) (!
  (or (= $k@73@01 $Perm.No) (< $Perm.No $k@73@01))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@72@01 $Ref) (x2@72@01 $Ref)) (!
  (=>
    (and
      (and
        ($PSF.loc_pred ($PSF.lookup_pred (as sm@55@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x1@72@01)) ($SortWrappers.$RefTo$Snap x1@72@01))
        (< $Perm.No $k@73@01))
      (and
        ($PSF.loc_pred ($PSF.lookup_pred (as sm@55@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x2@72@01)) ($SortWrappers.$RefTo$Snap x2@72@01))
        (< $Perm.No $k@73@01))
      (= x1@72@01 x2@72@01))
    (= x1@72@01 x2@72@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@72@01 $Ref)) (!
  (=>
    (< $Perm.No $k@73@01)
    (and (= (inv@74@01 x@72@01) x@72@01) (img@75@01 x@72@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred (as sm@55@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x@72@01)) ($SortWrappers.$RefTo$Snap x@72@01)))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@75@01 r) (< $Perm.No $k@73@01)) (= (inv@74@01 r) r))
  :pattern ((inv@74@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  ($PSF.loc_pred ($PSF.lookup_pred (as sm@55@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r))
  :pattern ((inv@74@01 r))
  :qid |quant-u-37|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@76@01 ((r $Ref)) $Perm
  (ite
    (and (img@75@01 r) (= r (inv@74@01 r)))
    ($Perm.min (ite (img@54@01 r) $k@49@01 $Perm.No) $k@73@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@73@01
(assert (forall ((r $Ref)) (!
  (=>
    (not (= (ite (img@54@01 r) $k@49@01 $Perm.No) $Perm.No))
    (ite
      (img@54@01 r)
      (<
        (ite (and (img@75@01 r) (= r (inv@74@01 r))) $k@73@01 $Perm.No)
        $k@49@01)
      (<
        (ite (and (img@75@01 r) (= r (inv@74@01 r))) $k@73@01 $Perm.No)
        $Perm.No)))
  :pattern ((img@54@01 r))
  :pattern ((img@75@01 r))
  :pattern ((inv@74@01 r))
  :qid |qp.srp27|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@75@01 r) (= r (inv@74@01 r)))
    (= (- $k@73@01 (pTaken@76@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const x@77@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@78@01 $Perm)
(assert ($Perm.isReadVar $k@78@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@79@01 ($Ref) $Ref)
(declare-fun img@80@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@78@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@77@01 $Ref)) (!
  (or (= $k@78@01 $Perm.No) (< $Perm.No $k@78@01))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@81@01 $PSF<pred>)
(declare-const s@82@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@82@01 $Snap)) (!
  (=>
    (ite
      (img@54@01 ($SortWrappers.$SnapTo$Ref s@82@01))
      (<
        $Perm.No
        (- $k@49@01 (pTaken@76@01 ($SortWrappers.$SnapTo$Ref s@82@01))))
      false)
    (and
      (not (= s@82@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@81@01  $PSF<pred>) s@82@01)
        ($PSF.lookup_pred $t@52@01 s@82@01))))
  :pattern (($PSF.lookup_pred (as sm@81@01  $PSF<pred>) s@82@01))
  :pattern (($PSF.lookup_pred $t@52@01 s@82@01))
  :qid |qp.psmValDef28|)))
(assert (forall ((s@82@01 $Snap)) (!
  ($PSF.loc_pred ($PSF.lookup_pred $t@52@01 s@82@01) s@82@01)
  :pattern (($PSF.lookup_pred (as sm@81@01  $PSF<pred>) s@82@01))
  :qid |qp.psmResTrgDef29|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@77@01 $Ref) (x2@77@01 $Ref)) (!
  (=>
    (and
      (and
        ($PSF.loc_pred ($PSF.lookup_pred (as sm@81@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x1@77@01)) ($SortWrappers.$RefTo$Snap x1@77@01))
        (< $Perm.No $k@78@01))
      (and
        ($PSF.loc_pred ($PSF.lookup_pred (as sm@81@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x2@77@01)) ($SortWrappers.$RefTo$Snap x2@77@01))
        (< $Perm.No $k@78@01))
      (= x1@77@01 x2@77@01))
    (= x1@77@01 x2@77@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@77@01 $Ref)) (!
  (=>
    (< $Perm.No $k@78@01)
    (and (= (inv@79@01 x@77@01) x@77@01) (img@80@01 x@77@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred (as sm@55@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x@77@01)) ($SortWrappers.$RefTo$Snap x@77@01)))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@80@01 r) (< $Perm.No $k@78@01)) (= (inv@79@01 r) r))
  :pattern ((inv@79@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  ($PSF.loc_pred ($PSF.lookup_pred (as sm@81@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r))
  :pattern ((inv@79@01 r))
  :qid |quant-u-42|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@83@01 ((r $Ref)) $Perm
  (ite
    (and (img@80@01 r) (= r (inv@79@01 r)))
    ($Perm.min
      (ite (img@54@01 r) (- $k@49@01 (pTaken@76@01 r)) $Perm.No)
      $k@78@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@78@01
(assert (forall ((r $Ref)) (!
  (=>
    (not (= (ite (img@54@01 r) (- $k@49@01 (pTaken@76@01 r)) $Perm.No) $Perm.No))
    (ite
      (img@54@01 r)
      (<
        (ite (and (img@80@01 r) (= r (inv@79@01 r))) $k@78@01 $Perm.No)
        (- $k@49@01 (pTaken@76@01 r)))
      (<
        (ite (and (img@80@01 r) (= r (inv@79@01 r))) $k@78@01 $Perm.No)
        $Perm.No)))
  :pattern ((img@54@01 r))
  :pattern ((img@80@01 r))
  :pattern ((inv@79@01 r))
  :qid |qp.srp30|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (= r (inv@79@01 r)))
    (= (- $k@78@01 (pTaken@83@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 2
(pop) ; 1
; ---------- t4 ----------
(declare-const r@84@01 $Ref)
(declare-const r@85@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const x@86@01 $Ref)
(push) ; 2
(declare-const $k@87@01 $Perm)
(assert ($Perm.isReadVar $k@87@01))
(declare-const sm@88@01 $FVF<f>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-const $t@89@01 $FVF<f>)
(declare-fun inv@90@01 ($Ref) $Ref)
(declare-fun img@91@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@87@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@86@01 $Ref)) (!
  (or (= $k@87@01 $Perm.No) (< $Perm.No $k@87@01))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@86@01 $Ref) (x2@86@01 $Ref)) (!
  (=> (and (< $Perm.No $k@87@01) (= x1@86@01 x2@86@01)) (= x1@86@01 x2@86@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@86@01 $Ref)) (!
  (=>
    (< $Perm.No $k@87@01)
    (and (= (inv@90@01 x@86@01) x@86@01) (img@91@01 x@86@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@89@01 x@86@01) x@86@01))
  :qid |quant-u-47|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@91@01 r) (< $Perm.No $k@87@01)) (= (inv@90@01 r) r))
  :pattern ((inv@90@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@86@01 $Ref)) (!
  (<= $Perm.No $k@87@01)
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@89@01 x@86@01) x@86@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@86@01 $Ref)) (!
  (<= $k@87@01 $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@89@01 x@86@01) x@86@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@86@01 $Ref)) (!
  (=> (< $Perm.No $k@87@01) (not (= x@86@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@89@01 x@86@01) x@86@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@92@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@91@01 r) (< $Perm.No $k@87@01) false)
    (= ($FVF.lookup_f (as sm@92@01  $FVF<f>) r) ($FVF.lookup_f $t@89@01 r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@89@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@89@01 r) r)
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@92@01  $FVF<f>) r) r)
  :pattern ((inv@90@01 r))
  :qid |quant-u-48|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@93@01 $Snap)
(assert (= $t@93@01 ($Snap.combine ($Snap.first $t@93@01) ($Snap.second $t@93@01))))
(declare-const x@94@01 $Ref)
(push) ; 3
(declare-const $k@95@01 $Perm)
(assert ($Perm.isReadVar $k@95@01))
(declare-const sm@96@01 $FVF<f>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@97@01 ($Ref) $Ref)
(declare-fun img@98@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@95@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@94@01 $Ref)) (!
  (or (= $k@95@01 $Perm.No) (< $Perm.No $k@95@01))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@94@01 $Ref) (x2@94@01 $Ref)) (!
  (=> (and (< $Perm.No $k@95@01) (= x1@94@01 x2@94@01)) (= x1@94@01 x2@94@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@94@01 $Ref)) (!
  (=>
    (< $Perm.No $k@95@01)
    (and (= (inv@97@01 x@94@01) x@94@01) (img@98@01 x@94@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) x@94@01) x@94@01))
  :qid |quant-u-50|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@98@01 r) (< $Perm.No $k@95@01)) (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@94@01 $Ref)) (!
  (<= $Perm.No $k@95@01)
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) x@94@01) x@94@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@94@01 $Ref)) (!
  (<= $k@95@01 $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) x@94@01) x@94@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@94@01 $Ref)) (!
  (=> (< $Perm.No $k@95@01) (not (= x@94@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) x@94@01) x@94@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@99@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@98@01 r) (< $Perm.No $k@95@01) false)
    (=
      ($FVF.lookup_f (as sm@99@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) r)))
  :pattern (($FVF.lookup_f (as sm@99@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) r) r)
  :pattern (($FVF.lookup_f (as sm@99@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@99@01  $FVF<f>) r) r)
  :pattern ((inv@97@01 r))
  :qid |quant-u-51|)))
(declare-const x@100@01 $Ref)
(push) ; 3
(declare-const $k@101@01 $Perm)
(assert ($Perm.isReadVar $k@101@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@102@01 ($Ref) $Ref)
(declare-fun img@103@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@101@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@100@01 $Ref)) (!
  (or (= $k@101@01 $Perm.No) (< $Perm.No $k@101@01))
  
  :qid |quant-u-52|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@100@01 $Ref) (x2@100@01 $Ref)) (!
  (=>
    (and (< $Perm.No $k@101@01) (= x1@100@01 x2@100@01))
    (= x1@100@01 x2@100@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@100@01 $Ref)) (!
  (=>
    (< $Perm.No $k@101@01)
    (and (= (inv@102@01 x@100@01) x@100@01) (img@103@01 x@100@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@93@01)) x@100@01) x@100@01))
  :qid |quant-u-53|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@103@01 r) (< $Perm.No $k@101@01)) (= (inv@102@01 r) r))
  :pattern ((inv@102@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@100@01 $Ref)) (!
  (<= $Perm.No $k@101@01)
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@93@01)) x@100@01) x@100@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@100@01 $Ref)) (!
  (<= $k@101@01 $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@93@01)) x@100@01) x@100@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@100@01 $Ref)) (!
  (=> (< $Perm.No $k@101@01) (not (= x@100@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@93@01)) x@100@01) x@100@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and (= x@100@01 x@94@01) (= (img@103@01 r) (img@98@01 r)))
  
  :qid |quant-u-54|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@104@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@98@01 r) (< $Perm.No $k@95@01) false)
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@103@01 r) (< $Perm.No $k@101@01) false)
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@93@01)) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@93@01)) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@93@01)) r) r)
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@93@01)) r) r))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@104@01  $FVF<f>) r) r)
  :pattern ((inv@102@01 r))
  :qid |quant-u-55|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
(declare-const x@105@01 $Ref)
(push) ; 3
(declare-const $k@106@01 $Perm)
(assert ($Perm.isReadVar $k@106@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@107@01 ($Ref) $Ref)
(declare-fun img@108@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@106@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@105@01 $Ref)) (!
  (or (= $k@106@01 $Perm.No) (< $Perm.No $k@106@01))
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@105@01 $Ref) (x2@105@01 $Ref)) (!
  (=>
    (and
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@92@01  $FVF<f>) x1@105@01) x1@105@01)
        (< $Perm.No $k@106@01))
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@92@01  $FVF<f>) x2@105@01) x2@105@01)
        (< $Perm.No $k@106@01))
      (= x1@105@01 x2@105@01))
    (= x1@105@01 x2@105@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@105@01 $Ref)) (!
  (=>
    (< $Perm.No $k@106@01)
    (and (= (inv@107@01 x@105@01) x@105@01) (img@108@01 x@105@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@92@01  $FVF<f>) x@105@01) x@105@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@108@01 r) (< $Perm.No $k@106@01)) (= (inv@107@01 r) r))
  :pattern ((inv@107@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@92@01  $FVF<f>) r) r)
  :pattern ((inv@107@01 r))
  :qid |quant-u-57|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@109@01 ((r $Ref)) $Perm
  (ite
    (and (img@108@01 r) (= r (inv@107@01 r)))
    ($Perm.min (ite (img@91@01 r) $k@87@01 $Perm.No) $k@106@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@106@01
(assert (forall ((r $Ref)) (!
  (=>
    (not (= (ite (img@91@01 r) $k@87@01 $Perm.No) $Perm.No))
    (ite
      (img@91@01 r)
      (<
        (ite (and (img@108@01 r) (= r (inv@107@01 r))) $k@106@01 $Perm.No)
        $k@87@01)
      (<
        (ite (and (img@108@01 r) (= r (inv@107@01 r))) $k@106@01 $Perm.No)
        $Perm.No)))
  :pattern ((img@91@01 r))
  :pattern ((img@108@01 r))
  :pattern ((inv@107@01 r))
  :qid |qp.srp40|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@108@01 r) (= r (inv@107@01 r)))
    (= (- $k@106@01 (pTaken@109@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const x@110@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@111@01 $Perm)
(assert ($Perm.isReadVar $k@111@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@112@01 ($Ref) $Ref)
(declare-fun img@113@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@111@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@110@01 $Ref)) (!
  (or (= $k@111@01 $Perm.No) (< $Perm.No $k@111@01))
  
  :qid |quant-u-61|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@114@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@91@01 r) (< $Perm.No (- $k@87@01 (pTaken@109@01 r))) false)
    (= ($FVF.lookup_f (as sm@114@01  $FVF<f>) r) ($FVF.lookup_f $t@89@01 r)))
  :pattern (($FVF.lookup_f (as sm@114@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@89@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@89@01 r) r)
  :pattern (($FVF.lookup_f (as sm@114@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef42|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@110@01 $Ref) (x2@110@01 $Ref)) (!
  (=>
    (and
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@114@01  $FVF<f>) x1@110@01) x1@110@01)
        (< $Perm.No $k@111@01))
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@114@01  $FVF<f>) x2@110@01) x2@110@01)
        (< $Perm.No $k@111@01))
      (= x1@110@01 x2@110@01))
    (= x1@110@01 x2@110@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@110@01 $Ref)) (!
  (=>
    (< $Perm.No $k@111@01)
    (and (= (inv@112@01 x@110@01) x@110@01) (img@113@01 x@110@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@92@01  $FVF<f>) x@110@01) x@110@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@113@01 r) (< $Perm.No $k@111@01)) (= (inv@112@01 r) r))
  :pattern ((inv@112@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@114@01  $FVF<f>) r) r)
  :pattern ((inv@112@01 r))
  :qid |quant-u-62|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (and (img@113@01 r) (= r (inv@112@01 r)))
    ($Perm.min
      (ite (img@91@01 r) (- $k@87@01 (pTaken@109@01 r)) $Perm.No)
      $k@111@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@111@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (= (ite (img@91@01 r) (- $k@87@01 (pTaken@109@01 r)) $Perm.No) $Perm.No))
    (ite
      (img@91@01 r)
      (<
        (ite (and (img@113@01 r) (= r (inv@112@01 r))) $k@111@01 $Perm.No)
        (- $k@87@01 (pTaken@109@01 r)))
      (<
        (ite (and (img@113@01 r) (= r (inv@112@01 r))) $k@111@01 $Perm.No)
        $Perm.No)))
  :pattern ((img@91@01 r))
  :pattern ((img@113@01 r))
  :pattern ((inv@112@01 r))
  :qid |qp.srp43|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@113@01 r) (= r (inv@112@01 r)))
    (= (- $k@111@01 (pTaken@115@01 r)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 2
(pop) ; 1
; ---------- t5 ----------
(declare-const r@116@01 $Ref)
(declare-const xs@117@01 Seq<$Ref>)
(declare-const r@118@01 $Ref)
(declare-const xs@119@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const x@120@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@119@01 x@120@01))
(declare-const sm@121@01 $FVF<f>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-const $t@122@01 $FVF<f>)
(declare-fun inv@123@01 ($Ref) $Ref)
(declare-fun img@124@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@120@01 $Ref) (x2@120@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@119@01 x1@120@01)
      (Seq_contains xs@119@01 x2@120@01)
      (= x1@120@01 x2@120@01))
    (= x1@120@01 x2@120@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@120@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@120@01)
    (and (= (inv@123@01 x@120@01) x@120@01) (img@124@01 x@120@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@122@01 x@120@01) x@120@01))
  :qid |quant-u-67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
    (= (inv@123@01 r) r))
  :pattern ((inv@123@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@120@01 $Ref)) (!
  (=> (Seq_contains xs@119@01 x@120@01) (not (= x@120@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@122@01 x@120@01) x@120@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@125@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
    (= ($FVF.lookup_f (as sm@125@01  $FVF<f>) r) ($FVF.lookup_f $t@122@01 r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@122@01 r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@122@01 r) r)
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@119@01 (inv@123@01 r))
    ($FVF.loc_f ($FVF.lookup_f (as sm@125@01  $FVF<f>) r) r))
  :pattern ((inv@123@01 r))
  :qid |quant-u-68|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall x: Ref :: { x.f } (x in xs) ==> acc(x.f, 1 / 3))
(declare-const x@126@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@119@01 x@126@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@127@01 ($Ref) $Ref)
(declare-fun img@128@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@126@01 $Ref) (x2@126@01 $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains xs@119@01 x1@126@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@125@01  $FVF<f>) x1@126@01) x1@126@01))
      (and
        (Seq_contains xs@119@01 x2@126@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@125@01  $FVF<f>) x2@126@01) x2@126@01))
      (= x1@126@01 x2@126@01))
    (= x1@126@01 x2@126@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@126@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@126@01)
    (and (= (inv@127@01 x@126@01) x@126@01) (img@128@01 x@126@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@125@01  $FVF<f>) x@126@01) x@126@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@128@01 r) (Seq_contains xs@119@01 (inv@127@01 r)))
    (= (inv@127@01 r) r))
  :pattern ((inv@127@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@119@01 (inv@127@01 r))
    ($FVF.loc_f ($FVF.lookup_f (as sm@125@01  $FVF<f>) r) r))
  :pattern ((inv@127@01 r))
  :qid |quant-u-70|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@129@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@119@01 (inv@127@01 r))
      (img@128@01 r)
      (= r (inv@127@01 r)))
    ($Perm.min
      (ite
        (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 3)))
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
        (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@129@01 r))
    $Perm.No)
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@129@01 r) $Perm.No)
  
  :qid |quant-u-73|))))
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
      (Seq_contains xs@119@01 (inv@127@01 r))
      (img@128@01 r)
      (= r (inv@127@01 r)))
    (= (- (/ (to_real 1) (to_real 3)) (pTaken@129@01 r)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; assert (forall x: Ref :: { x.f } (x in xs) ==> perm(x.f) == 2 / 3)
; [eval] (forall x: Ref :: { x.f } (x in xs) ==> perm(x.f) == 2 / 3)
(declare-const x@130@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> perm(x.f) == 2 / 3
; [eval] (x in xs)
(push) ; 4
; [then-branch: 0 | x@130@01 in xs@119@01 | live]
; [else-branch: 0 | !(x@130@01 in xs@119@01) | live]
(push) ; 5
; [then-branch: 0 | x@130@01 in xs@119@01]
(assert (Seq_contains xs@119@01 x@130@01))
; [eval] perm(x.f) == 2 / 3
; [eval] perm(x.f)
(declare-const sm@131@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@129@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) ($FVF.lookup_f $t@122@01 r)))
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@122@01 r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@122@01 r) r)
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef48|)))
(declare-const pm@132@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@132@01  $FPM) r)
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (- $Perm.Write (pTaken@129@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@132@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@122@01 r) r))
  :pattern (($FVF.perm_f (as pm@132@01  $FPM) r))
  :qid |qp.resTrgDef50|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@130@01) x@130@01))
; perm(x.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@132@01  $FPM) x@130@01) $Perm.Write))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(x@130@01 in xs@119@01)]
(assert (not (Seq_contains xs@119@01 x@130@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@129@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) ($FVF.lookup_f $t@122@01 r)))
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@122@01 r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@122@01 r) r)
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@132@01  $FPM) r)
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (- $Perm.Write (pTaken@129@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@132@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@122@01 r) r))
  :pattern (($FVF.perm_f (as pm@132@01  $FPM) r))
  :qid |qp.resTrgDef50|)))
(assert (=>
  (Seq_contains xs@119@01 x@130@01)
  (and
    (Seq_contains xs@119@01 x@130@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@130@01) x@130@01)
    (<= ($FVF.perm_f (as pm@132@01  $FPM) x@130@01) $Perm.Write))))
; Joined path conditions
(assert (or (not (Seq_contains xs@119@01 x@130@01)) (Seq_contains xs@119@01 x@130@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@129@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) ($FVF.lookup_f $t@122@01 r)))
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@122@01 r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@122@01 r) r)
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@132@01  $FPM) r)
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (- $Perm.Write (pTaken@129@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@132@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@122@01 r) r))
  :pattern (($FVF.perm_f (as pm@132@01  $FPM) r))
  :qid |qp.resTrgDef50|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@130@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@119@01 x@130@01)
      (and
        (Seq_contains xs@119@01 x@130@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@130@01) x@130@01)
        (<= ($FVF.perm_f (as pm@132@01  $FPM) x@130@01) $Perm.Write)))
    (or
      (not (Seq_contains xs@119@01 x@130@01))
      (Seq_contains xs@119@01 x@130@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@130@01) x@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr@43@12@43@66-aux|)))
(push) ; 3
(assert (not (forall ((x@130@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@130@01)
    (= ($FVF.perm_f (as pm@132@01  $FPM) x@130@01) (/ (to_real 2) (to_real 3))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@130@01) x@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr@43@12@43@66|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@130@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@130@01)
    (= ($FVF.perm_f (as pm@132@01  $FPM) x@130@01) (/ (to_real 2) (to_real 3))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@130@01) x@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr@43@12@43@66|)))
; [exec]
; assert (forall x: Ref :: { x.f } (x in xs) ==> acc(x.f, wildcard))
(declare-const x@133@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@119@01 x@133@01))
(declare-const $k@134@01 $Perm)
(assert ($Perm.isReadVar $k@134@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@135@01 ($Ref) $Ref)
(declare-fun img@136@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@134@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@133@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@133@01)
    (or (= $k@134@01 $Perm.No) (< $Perm.No $k@134@01)))
  
  :qid |quant-u-75|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@133@01 $Ref) (x2@133@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Seq_contains xs@119@01 x1@133@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x1@133@01) x1@133@01))
        (< $Perm.No $k@134@01))
      (and
        (and
          (Seq_contains xs@119@01 x2@133@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x2@133@01) x2@133@01))
        (< $Perm.No $k@134@01))
      (= x1@133@01 x2@133@01))
    (= x1@133@01 x2@133@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@133@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@119@01 x@133@01) (< $Perm.No $k@134@01))
    (and (= (inv@135@01 x@133@01) x@133@01) (img@136@01 x@133@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@133@01) x@133@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@136@01 r)
      (and (Seq_contains xs@119@01 (inv@135@01 r)) (< $Perm.No $k@134@01)))
    (= (inv@135@01 r) r))
  :pattern ((inv@135@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@119@01 (inv@135@01 r))
    ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) r))
  :pattern ((inv@135@01 r))
  :qid |quant-u-76|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@137@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@119@01 (inv@135@01 r))
      (img@136@01 r)
      (= r (inv@135@01 r)))
    ($Perm.min
      (ite
        (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
        (- $Perm.Write (pTaken@129@01 r))
        $Perm.No)
      $k@134@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@134@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
          (- $Perm.Write (pTaken@129@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (<
        (ite
          (and
            (Seq_contains xs@119@01 (inv@135@01 r))
            (img@136@01 r)
            (= r (inv@135@01 r)))
          $k@134@01
          $Perm.No)
        (- $Perm.Write (pTaken@129@01 r)))
      (<
        (ite
          (and
            (Seq_contains xs@119@01 (inv@135@01 r))
            (img@136@01 r)
            (= r (inv@135@01 r)))
          $k@134@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@124@01 r))
  :pattern ((Seq_contains xs@119@01 (inv@123@01 r)))
  :pattern ((Seq_contains_trigger xs@119@01 (inv@123@01 r)))
  :pattern ((Seq_contains xs@119@01 (inv@135@01 r)))
  :pattern ((Seq_contains_trigger xs@119@01 (inv@135@01 r)))
  :pattern ((img@136@01 r))
  :qid |qp.srp51|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@119@01 (inv@135@01 r))
      (img@136@01 r)
      (= r (inv@135@01 r)))
    (= (- $k@134@01 (pTaken@137@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; assert (forall x: Ref :: { x.f } (x in xs) ==> acc(x.f, wildcard))
(declare-const x@138@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@119@01 x@138@01))
(declare-const $k@139@01 $Perm)
(assert ($Perm.isReadVar $k@139@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@140@01 ($Ref) $Ref)
(declare-fun img@141@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@139@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@138@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@138@01)
    (or (= $k@139@01 $Perm.No) (< $Perm.No $k@139@01)))
  
  :qid |quant-u-80|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@138@01 $Ref) (x2@138@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Seq_contains xs@119@01 x1@138@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x1@138@01) x1@138@01))
        (< $Perm.No $k@139@01))
      (and
        (and
          (Seq_contains xs@119@01 x2@138@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x2@138@01) x2@138@01))
        (< $Perm.No $k@139@01))
      (= x1@138@01 x2@138@01))
    (= x1@138@01 x2@138@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@138@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@119@01 x@138@01) (< $Perm.No $k@139@01))
    (and (= (inv@140@01 x@138@01) x@138@01) (img@141@01 x@138@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@138@01) x@138@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@141@01 r)
      (and (Seq_contains xs@119@01 (inv@140@01 r)) (< $Perm.No $k@139@01)))
    (= (inv@140@01 r) r))
  :pattern ((inv@140@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@119@01 (inv@140@01 r))
    ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) r))
  :pattern ((inv@140@01 r))
  :qid |quant-u-81|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@142@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@119@01 (inv@140@01 r))
      (img@141@01 r)
      (= r (inv@140@01 r)))
    ($Perm.min
      (ite
        (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
        (- $Perm.Write (pTaken@129@01 r))
        $Perm.No)
      $k@139@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@139@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
          (- $Perm.Write (pTaken@129@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (<
        (ite
          (and
            (Seq_contains xs@119@01 (inv@140@01 r))
            (img@141@01 r)
            (= r (inv@140@01 r)))
          $k@139@01
          $Perm.No)
        (- $Perm.Write (pTaken@129@01 r)))
      (<
        (ite
          (and
            (Seq_contains xs@119@01 (inv@140@01 r))
            (img@141@01 r)
            (= r (inv@140@01 r)))
          $k@139@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@124@01 r))
  :pattern ((Seq_contains xs@119@01 (inv@123@01 r)))
  :pattern ((Seq_contains_trigger xs@119@01 (inv@123@01 r)))
  :pattern ((Seq_contains xs@119@01 (inv@140@01 r)))
  :pattern ((Seq_contains_trigger xs@119@01 (inv@140@01 r)))
  :pattern ((img@141@01 r))
  :qid |qp.srp52|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@119@01 (inv@140@01 r))
      (img@141@01 r)
      (= r (inv@140@01 r)))
    (= (- $k@139@01 (pTaken@142@01 r)) $Perm.No))
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; exhale (forall x: Ref :: { x.f } (x in xs) ==> acc(x.f, perm(x.f)))
(declare-const x@143@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@119@01 x@143@01))
; [eval] perm(x.f)
; Definitional axioms for snapshot map values
(declare-const pm@144@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@144@01  $FPM) r)
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (- $Perm.Write (pTaken@129@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@144@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@122@01 r) r))
  :pattern (($FVF.perm_f (as pm@144@01  $FPM) r))
  :qid |qp.resTrgDef54|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@143@01) x@143@01))
; perm(x.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@144@01  $FPM) x@143@01) $Perm.Write))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@145@01 ($Ref) $Ref)
(declare-fun img@146@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@144@01  $FPM) r)
    (ite
      (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
      (- $Perm.Write (pTaken@129@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@144@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@122@01 r) r))
  :pattern (($FVF.perm_f (as pm@144@01  $FPM) r))
  :qid |qp.resTrgDef54|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@143@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@143@01)
    (and
      ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@143@01) x@143@01)
      (<= ($FVF.perm_f (as pm@144@01  $FPM) x@143@01) $Perm.Write)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@143@01) x@143@01))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((x@143@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@143@01)
    (or
      (= ($FVF.perm_f (as pm@144@01  $FPM) x@143@01) $Perm.No)
      (< $Perm.No ($FVF.perm_f (as pm@144@01  $FPM) x@143@01))))
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@143@01 $Ref) (x2@143@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Seq_contains xs@119@01 x1@143@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x1@143@01) x1@143@01))
        (< $Perm.No ($FVF.perm_f (as pm@144@01  $FPM) x1@143@01)))
      (and
        (and
          (Seq_contains xs@119@01 x2@143@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x2@143@01) x2@143@01))
        (< $Perm.No ($FVF.perm_f (as pm@144@01  $FPM) x2@143@01)))
      (= x1@143@01 x2@143@01))
    (= x1@143@01 x2@143@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@143@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@119@01 x@143@01)
      (< $Perm.No ($FVF.perm_f (as pm@144@01  $FPM) x@143@01)))
    (and (= (inv@145@01 x@143@01) x@143@01) (img@146@01 x@143@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) x@143@01) x@143@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@146@01 r)
      (and
        (Seq_contains xs@119@01 (inv@145@01 r))
        (< $Perm.No ($FVF.perm_f (as pm@144@01  $FPM) (inv@145@01 r)))))
    (= (inv@145@01 r) r))
  :pattern ((inv@145@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@119@01 (inv@145@01 r))
    ($FVF.loc_f ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) r))
  :pattern ((inv@145@01 r))
  :qid |quant-u-86|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@147@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@119@01 (inv@145@01 r))
      (img@146@01 r)
      (= r (inv@145@01 r)))
    ($Perm.min
      (ite
        (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
        (- $Perm.Write (pTaken@129@01 r))
        $Perm.No)
      ($FVF.perm_f (as pm@144@01  $FPM) (inv@145@01 r)))
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
        (and (img@124@01 r) (Seq_contains xs@119@01 (inv@123@01 r)))
        (- $Perm.Write (pTaken@129@01 r))
        $Perm.No)
      (pTaken@147@01 r))
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
      (Seq_contains xs@119@01 (inv@145@01 r))
      (img@146@01 r)
      (= r (inv@145@01 r)))
    (=
      (- ($FVF.perm_f (as pm@144@01  $FPM) (inv@145@01 r)) (pTaken@147@01 r))
      $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; assert (forall x: Ref :: { x.f } (x in xs) ==> perm(x.f) == none)
; [eval] (forall x: Ref :: { x.f } (x in xs) ==> perm(x.f) == none)
(declare-const x@148@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> perm(x.f) == none
; [eval] (x in xs)
(push) ; 4
; [then-branch: 1 | x@148@01 in xs@119@01 | live]
; [else-branch: 1 | !(x@148@01 in xs@119@01) | live]
(push) ; 5
; [then-branch: 1 | x@148@01 in xs@119@01]
(assert (Seq_contains xs@119@01 x@148@01))
; [eval] perm(x.f) == none
; [eval] perm(x.f)
(declare-const sm@149@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-const pm@150@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@150@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@150@01  $FPM) r))
  :qid |qp.resPrmSumDef56|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) r) r)
  :pattern (($FVF.perm_f (as pm@150@01  $FPM) r))
  :qid |qp.resTrgDef57|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x@148@01) x@148@01))
; perm(x.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@150@01  $FPM) x@148@01) $Perm.Write))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(x@148@01 in xs@119@01)]
(assert (not (Seq_contains xs@119@01 x@148@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@150@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@150@01  $FPM) r))
  :qid |qp.resPrmSumDef56|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) r) r)
  :pattern (($FVF.perm_f (as pm@150@01  $FPM) r))
  :qid |qp.resTrgDef57|)))
(assert (=>
  (Seq_contains xs@119@01 x@148@01)
  (and
    (Seq_contains xs@119@01 x@148@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x@148@01) x@148@01)
    (<= ($FVF.perm_f (as pm@150@01  $FPM) x@148@01) $Perm.Write))))
; Joined path conditions
(assert (or (not (Seq_contains xs@119@01 x@148@01)) (Seq_contains xs@119@01 x@148@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@150@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@150@01  $FPM) r))
  :qid |qp.resPrmSumDef56|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) r) r)
  :pattern (($FVF.perm_f (as pm@150@01  $FPM) r))
  :qid |qp.resTrgDef57|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@148@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@119@01 x@148@01)
      (and
        (Seq_contains xs@119@01 x@148@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x@148@01) x@148@01)
        (<= ($FVF.perm_f (as pm@150@01  $FPM) x@148@01) $Perm.Write)))
    (or
      (not (Seq_contains xs@119@01 x@148@01))
      (Seq_contains xs@119@01 x@148@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x@148@01) x@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr@47@12@47@65-aux|)))
(push) ; 3
(assert (not (forall ((x@148@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@148@01)
    (= ($FVF.perm_f (as pm@150@01  $FPM) x@148@01) $Perm.No))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x@148@01) x@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr@47@12@47@65|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@148@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@148@01)
    (= ($FVF.perm_f (as pm@150@01  $FPM) x@148@01) $Perm.No))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x@148@01) x@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr@47@12@47@65|)))
; [exec]
; assert (forall x: Ref :: { x.f } (x in xs) ==> acc(x.f, wildcard))
(declare-const x@151@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@119@01 x@151@01))
(declare-const $k@152@01 $Perm)
(assert ($Perm.isReadVar $k@152@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@153@01 ($Ref) $Ref)
(declare-fun img@154@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@152@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@151@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@151@01)
    (or (= $k@152@01 $Perm.No) (< $Perm.No $k@152@01)))
  
  :qid |quant-u-90|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@151@01 $Ref) (x2@151@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Seq_contains xs@119@01 x1@151@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x1@151@01) x1@151@01))
        (< $Perm.No $k@152@01))
      (and
        (and
          (Seq_contains xs@119@01 x2@151@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x2@151@01) x2@151@01))
        (< $Perm.No $k@152@01))
      (= x1@151@01 x2@151@01))
    (= x1@151@01 x2@151@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@151@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@119@01 x@151@01) (< $Perm.No $k@152@01))
    (and (= (inv@153@01 x@151@01) x@151@01) (img@154@01 x@151@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x@151@01) x@151@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@154@01 r)
      (and (Seq_contains xs@119@01 (inv@153@01 r)) (< $Perm.No $k@152@01)))
    (= (inv@153@01 r) r))
  :pattern ((inv@153@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@119@01 (inv@153@01 r))
    ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) r) r))
  :pattern ((inv@153@01 r))
  :qid |quant-u-91|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@119@01 (inv@153@01 r))
      (img@154@01 r)
      (= r (inv@153@01 r)))
    (= $k@152@01 $Perm.No))
  
  :qid |quant-u-92|))))
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
(declare-const x@155@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@119@01 x@155@01))
(declare-const $k@156@01 $Perm)
(assert ($Perm.isReadVar $k@156@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@157@01 ($Ref) $Ref)
(declare-fun img@158@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@156@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@155@01 $Ref)) (!
  (=>
    (Seq_contains xs@119@01 x@155@01)
    (or (= $k@156@01 $Perm.No) (< $Perm.No $k@156@01)))
  
  :qid |quant-u-93|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@155@01 $Ref) (x2@155@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Seq_contains xs@119@01 x1@155@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x1@155@01) x1@155@01))
        (< $Perm.No $k@156@01))
      (and
        (and
          (Seq_contains xs@119@01 x2@155@01)
          ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x2@155@01) x2@155@01))
        (< $Perm.No $k@156@01))
      (= x1@155@01 x2@155@01))
    (= x1@155@01 x2@155@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@155@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@119@01 x@155@01) (< $Perm.No $k@156@01))
    (and (= (inv@157@01 x@155@01) x@155@01) (img@158@01 x@155@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) x@155@01) x@155@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@158@01 r)
      (and (Seq_contains xs@119@01 (inv@157@01 r)) (< $Perm.No $k@156@01)))
    (= (inv@157@01 r) r))
  :pattern ((inv@157@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@119@01 (inv@157@01 r))
    ($FVF.loc_f ($FVF.lookup_f (as sm@149@01  $FVF<f>) r) r))
  :pattern ((inv@157@01 r))
  :qid |quant-u-94|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@119@01 (inv@157@01 r))
      (img@158@01 r)
      (= r (inv@157@01 r)))
    (= $k@156@01 $Perm.No))
  
  :qid |quant-u-95|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- t6 ----------
(declare-const r@159@01 $Ref)
(declare-const xs@160@01 Seq<$Ref>)
(declare-const r@161@01 $Ref)
(declare-const xs@162@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@163@01 $Snap)
(assert (= $t@163@01 $Snap.unit))
; [eval] (r in xs)
(assert (Seq_contains xs@162@01 r@161@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall x: Ref :: { (x in xs) } (x in xs) ==> x != null)
(declare-const $t@164@01 $Snap)
(assert (= $t@164@01 $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) ==> x != null)
(declare-const x@165@01 $Ref)
(push) ; 3
; [eval] (x in xs) ==> x != null
; [eval] (x in xs)
(push) ; 4
; [then-branch: 2 | x@165@01 in xs@162@01 | live]
; [else-branch: 2 | !(x@165@01 in xs@162@01) | live]
(push) ; 5
; [then-branch: 2 | x@165@01 in xs@162@01]
(assert (Seq_contains xs@162@01 x@165@01))
; [eval] x != null
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(x@165@01 in xs@162@01)]
(assert (not (Seq_contains xs@162@01 x@165@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Seq_contains xs@162@01 x@165@01)) (Seq_contains xs@162@01 x@165@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@165@01 $Ref)) (!
  (or (not (Seq_contains xs@162@01 x@165@01)) (Seq_contains xs@162@01 x@165@01))
  :pattern ((Seq_contains xs@162@01 x@165@01))
  :pattern ((Seq_contains_trigger xs@162@01 x@165@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr@56@12@56@59-aux|)))
(assert (forall ((x@165@01 $Ref)) (!
  (or (not (Seq_contains xs@162@01 x@165@01)) (Seq_contains xs@162@01 x@165@01))
  :pattern ((Seq_contains_trigger xs@162@01 x@165@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr@56@12@56@59-aux|)))
(assert (forall ((x@165@01 $Ref)) (!
  (=> (Seq_contains xs@162@01 x@165@01) (not (= x@165@01 $Ref.null)))
  :pattern ((Seq_contains xs@162@01 x@165@01))
  :pattern ((Seq_contains_trigger xs@162@01 x@165@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/partial_permissions.vpr@56@12@56@59|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall x: Ref :: { (x in xs) } (x in xs) ==> acc(x.f, wildcard))
(declare-const x@166@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@162@01 x@166@01))
(declare-const $k@167@01 $Perm)
(assert ($Perm.isReadVar $k@167@01))
(pop) ; 3
(declare-fun inv@168@01 ($Ref) $Ref)
(declare-fun img@169@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@167@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@166@01 $Ref)) (!
  (=>
    (Seq_contains xs@162@01 x@166@01)
    (or (= $k@167@01 $Perm.No) (< $Perm.No $k@167@01)))
  
  :qid |quant-u-96|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@166@01 $Ref) (x2@166@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@162@01 x1@166@01) (< $Perm.No $k@167@01))
      (and (Seq_contains xs@162@01 x2@166@01) (< $Perm.No $k@167@01))
      (= x1@166@01 x2@166@01))
    (= x1@166@01 x2@166@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@166@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@162@01 x@166@01) (< $Perm.No $k@167@01))
    (and (= (inv@168@01 x@166@01) x@166@01) (img@169@01 x@166@01)))
  :pattern ((Seq_contains xs@162@01 x@166@01))
  :pattern ((Seq_contains_trigger xs@162@01 x@166@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@169@01 r)
      (and (Seq_contains xs@162@01 (inv@168@01 r)) (< $Perm.No $k@167@01)))
    (= (inv@168@01 r) r))
  :pattern ((inv@168@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@162@01 (inv@168@01 r))
      (img@169@01 r)
      (= r (inv@168@01 r)))
    (= $k@167@01 $Perm.No))
  
  :qid |quant-u-97|))))
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
(declare-const x@170@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@162@01 x@170@01))
(declare-const $k@171@01 $Perm)
(assert ($Perm.isReadVar $k@171@01))
(pop) ; 3
(declare-fun inv@172@01 ($Ref) $Ref)
(declare-fun img@173@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@171@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@170@01 $Ref)) (!
  (=>
    (Seq_contains xs@162@01 x@170@01)
    (or (= $k@171@01 $Perm.No) (< $Perm.No $k@171@01)))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@170@01 $Ref) (x2@170@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@162@01 x1@170@01) (< $Perm.No $k@171@01))
      (and (Seq_contains xs@162@01 x2@170@01) (< $Perm.No $k@171@01))
      (= x1@170@01 x2@170@01))
    (= x1@170@01 x2@170@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@170@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@162@01 x@170@01) (< $Perm.No $k@171@01))
    (and (= (inv@172@01 x@170@01) x@170@01) (img@173@01 x@170@01)))
  :pattern ((Seq_contains xs@162@01 x@170@01))
  :pattern ((Seq_contains_trigger xs@162@01 x@170@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@173@01 r)
      (and (Seq_contains xs@162@01 (inv@172@01 r)) (< $Perm.No $k@171@01)))
    (= (inv@172@01 r) r))
  :pattern ((inv@172@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@162@01 (inv@172@01 r))
      (img@173@01 r)
      (= r (inv@172@01 r)))
    (= $k@171@01 $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- t7 ----------
(declare-const r@174@01 $Ref)
(declare-const xs@175@01 Seq<$Ref>)
(declare-const r@176@01 $Ref)
(declare-const xs@177@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@178@01 $Snap)
(assert (= $t@178@01 $Snap.unit))
; [eval] (r in xs)
(assert (Seq_contains xs@177@01 r@176@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall x: Ref :: { pred(x) } (x in xs) ==> acc(pred(x), wildcard))
(declare-const x@179@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@177@01 x@179@01))
(declare-const $k@180@01 $Perm)
(assert ($Perm.isReadVar $k@180@01))
(declare-const sm@181@01 $PSF<pred>)
(declare-const s@182@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@183@01 ($Ref) $Ref)
(declare-fun img@184@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@180@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@179@01 $Ref)) (!
  (=>
    (Seq_contains xs@177@01 x@179@01)
    (or (= $k@180@01 $Perm.No) (< $Perm.No $k@180@01)))
  
  :qid |quant-u-100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@185@01 $PSF<pred>)
(declare-const s@186@01 $Snap)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@179@01 $Ref) (x2@179@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Seq_contains xs@177@01 x1@179@01)
          ($PSF.loc_pred ($PSF.lookup_pred (as sm@185@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x1@179@01)) ($SortWrappers.$RefTo$Snap x1@179@01)))
        (< $Perm.No $k@180@01))
      (and
        (and
          (Seq_contains xs@177@01 x2@179@01)
          ($PSF.loc_pred ($PSF.lookup_pred (as sm@185@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x2@179@01)) ($SortWrappers.$RefTo$Snap x2@179@01)))
        (< $Perm.No $k@180@01))
      (= x1@179@01 x2@179@01))
    (= x1@179@01 x2@179@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@179@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@177@01 x@179@01) (< $Perm.No $k@180@01))
    (and (= (inv@183@01 x@179@01) x@179@01) (img@184@01 x@179@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred (as sm@181@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x@179@01)) ($SortWrappers.$RefTo$Snap x@179@01)))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (and (Seq_contains xs@177@01 (inv@183@01 r)) (< $Perm.No $k@180@01)))
    (= (inv@183@01 r) r))
  :pattern ((inv@183@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@177@01 (inv@183@01 r))
    ($PSF.loc_pred ($PSF.lookup_pred (as sm@185@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r)))
  :pattern ((inv@183@01 r))
  :qid |quant-u-101|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@177@01 (inv@183@01 r))
      (img@184@01 r)
      (= r (inv@183@01 r)))
    (= $k@180@01 $Perm.No))
  
  :qid |quant-u-102|))))
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
(declare-const x@187@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@177@01 x@187@01))
(declare-const $k@188@01 $Perm)
(assert ($Perm.isReadVar $k@188@01))
(declare-const sm@189@01 $PSF<pred>)
(declare-const s@190@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@191@01 ($Ref) $Ref)
(declare-fun img@192@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@188@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@187@01 $Ref)) (!
  (=>
    (Seq_contains xs@177@01 x@187@01)
    (or (= $k@188@01 $Perm.No) (< $Perm.No $k@188@01)))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@193@01 $PSF<pred>)
(declare-const s@194@01 $Snap)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@187@01 $Ref) (x2@187@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Seq_contains xs@177@01 x1@187@01)
          ($PSF.loc_pred ($PSF.lookup_pred (as sm@193@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x1@187@01)) ($SortWrappers.$RefTo$Snap x1@187@01)))
        (< $Perm.No $k@188@01))
      (and
        (and
          (Seq_contains xs@177@01 x2@187@01)
          ($PSF.loc_pred ($PSF.lookup_pred (as sm@193@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x2@187@01)) ($SortWrappers.$RefTo$Snap x2@187@01)))
        (< $Perm.No $k@188@01))
      (= x1@187@01 x2@187@01))
    (= x1@187@01 x2@187@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@187@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@177@01 x@187@01) (< $Perm.No $k@188@01))
    (and (= (inv@191@01 x@187@01) x@187@01) (img@192@01 x@187@01)))
  :pattern (($PSF.loc_pred ($PSF.lookup_pred (as sm@189@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap x@187@01)) ($SortWrappers.$RefTo$Snap x@187@01)))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@192@01 r)
      (and (Seq_contains xs@177@01 (inv@191@01 r)) (< $Perm.No $k@188@01)))
    (= (inv@191@01 r) r))
  :pattern ((inv@191@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@177@01 (inv@191@01 r))
    ($PSF.loc_pred ($PSF.lookup_pred (as sm@193@01  $PSF<pred>) ($SortWrappers.$RefTo$Snap r)) ($SortWrappers.$RefTo$Snap r)))
  :pattern ((inv@191@01 r))
  :qid |quant-u-104|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@177@01 (inv@191@01 r))
      (img@192@01 r)
      (= r (inv@191@01 r)))
    (= $k@188@01 $Perm.No))
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
