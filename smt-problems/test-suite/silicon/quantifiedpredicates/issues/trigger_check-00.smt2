(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:25:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr
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
; /predicate_snap_functions_declarations.smt2 [p: Snap]
(declare-fun $PSF.domain_p ($PSF<p>) Set<$Snap>)
(declare-fun $PSF.lookup_p ($PSF<p> $Snap) $Snap)
(declare-fun $PSF.after_p ($PSF<p> $PSF<p>) Bool)
(declare-fun $PSF.loc_p ($Snap $Snap) Bool)
(declare-fun $PSF.perm_p ($PPM $Snap) $Perm)
(declare-const $psfTOP_p $PSF<p>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun e ($Snap $Ref) $Ref)
(declare-fun e%limited ($Snap $Ref) $Ref)
(declare-fun e%stateless ($Ref) Bool)
(declare-fun e%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p%trigger ($Snap $Ref Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [p: Snap]
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
(assert (forall ((s $Snap) (f $Snap)) (!
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (e%limited s@$ x@0@00) (e s@$ x@0@00))
  :pattern ((e s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (e%stateless x@0@00)
  :pattern ((e%limited s@$ x@0@00))
  :qid |quant-u-1|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const xs@1@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] (forall ix: Ref, jx: Ref :: { (ix in xs), (jx in xs) } { (ix in xs), e(jx) } { (jx in xs), e(ix) } { e(ix), e(jx) } (ix in xs) && ((jx in xs) && ix != jx) ==> e(ix) != e(jx))
(declare-const ix@3@01 $Ref)
(declare-const jx@4@01 $Ref)
(push) ; 2
; [eval] (ix in xs) && ((jx in xs) && ix != jx) ==> e(ix) != e(jx)
; [eval] (ix in xs) && ((jx in xs) && ix != jx)
; [eval] (ix in xs)
(push) ; 3
; [then-branch: 0 | !(ix@3@01 in xs@1@01) | live]
; [else-branch: 0 | ix@3@01 in xs@1@01 | live]
(push) ; 4
; [then-branch: 0 | !(ix@3@01 in xs@1@01)]
(assert (not (Seq_contains xs@1@01 ix@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | ix@3@01 in xs@1@01]
(assert (Seq_contains xs@1@01 ix@3@01))
; [eval] (jx in xs)
(push) ; 5
; [then-branch: 1 | !(jx@4@01 in xs@1@01) | live]
; [else-branch: 1 | jx@4@01 in xs@1@01 | live]
(push) ; 6
; [then-branch: 1 | !(jx@4@01 in xs@1@01)]
(assert (not (Seq_contains xs@1@01 jx@4@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | jx@4@01 in xs@1@01]
(assert (Seq_contains xs@1@01 jx@4@01))
; [eval] ix != jx
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@1@01 jx@4@01) (not (Seq_contains xs@1@01 jx@4@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains xs@1@01 ix@3@01)
  (and
    (Seq_contains xs@1@01 ix@3@01)
    (or (Seq_contains xs@1@01 jx@4@01) (not (Seq_contains xs@1@01 jx@4@01))))))
(assert (or (Seq_contains xs@1@01 ix@3@01) (not (Seq_contains xs@1@01 ix@3@01))))
(push) ; 3
; [then-branch: 2 | ix@3@01 in xs@1@01 && jx@4@01 in xs@1@01 && ix@3@01 != jx@4@01 | live]
; [else-branch: 2 | !(ix@3@01 in xs@1@01 && jx@4@01 in xs@1@01 && ix@3@01 != jx@4@01) | live]
(push) ; 4
; [then-branch: 2 | ix@3@01 in xs@1@01 && jx@4@01 in xs@1@01 && ix@3@01 != jx@4@01]
(assert (and
  (Seq_contains xs@1@01 ix@3@01)
  (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01)))))
; [eval] e(ix) != e(jx)
; [eval] e(ix)
(push) ; 5
(assert (e%precondition $Snap.unit ix@3@01))
(pop) ; 5
; Joined path conditions
(assert (e%precondition $Snap.unit ix@3@01))
; [eval] e(jx)
(push) ; 5
(assert (e%precondition $Snap.unit jx@4@01))
(pop) ; 5
; Joined path conditions
(assert (e%precondition $Snap.unit jx@4@01))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(ix@3@01 in xs@1@01 && jx@4@01 in xs@1@01 && ix@3@01 != jx@4@01)]
(assert (not
  (and
    (Seq_contains xs@1@01 ix@3@01)
    (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains xs@1@01 ix@3@01)
    (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))
  (and
    (Seq_contains xs@1@01 ix@3@01)
    (Seq_contains xs@1@01 jx@4@01)
    (not (= ix@3@01 jx@4@01))
    (e%precondition $Snap.unit ix@3@01)
    (e%precondition $Snap.unit jx@4@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains xs@1@01 ix@3@01)
      (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01)))))
  (and
    (Seq_contains xs@1@01 ix@3@01)
    (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@3@01 $Ref) (jx@4@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@1@01 ix@3@01)
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (or (Seq_contains xs@1@01 jx@4@01) (not (Seq_contains xs@1@01 jx@4@01)))))
    (or (Seq_contains xs@1@01 ix@3@01) (not (Seq_contains xs@1@01 ix@3@01)))
    (=>
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (Seq_contains xs@1@01 jx@4@01)
        (not (= ix@3@01 jx@4@01))
        (e%precondition $Snap.unit ix@3@01)
        (e%precondition $Snap.unit jx@4@01)))
    (or
      (not
        (and
          (Seq_contains xs@1@01 ix@3@01)
          (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01)))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))))
  :pattern ((Seq_contains xs@1@01 ix@3@01) (Seq_contains xs@1@01 jx@4@01))
  :pattern ((Seq_contains_trigger xs@1@01 ix@3@01) (Seq_contains_trigger
    xs@1@01
    jx@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@12@10@12@88-aux|)))
(assert (forall ((ix@3@01 $Ref) (jx@4@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@1@01 ix@3@01)
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (or (Seq_contains xs@1@01 jx@4@01) (not (Seq_contains xs@1@01 jx@4@01)))))
    (or (Seq_contains xs@1@01 ix@3@01) (not (Seq_contains xs@1@01 ix@3@01)))
    (=>
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (Seq_contains xs@1@01 jx@4@01)
        (not (= ix@3@01 jx@4@01))
        (e%precondition $Snap.unit ix@3@01)
        (e%precondition $Snap.unit jx@4@01)))
    (or
      (not
        (and
          (Seq_contains xs@1@01 ix@3@01)
          (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01)))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))))
  :pattern ((Seq_contains_trigger xs@1@01 ix@3@01) (Seq_contains_trigger
    xs@1@01
    jx@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@12@10@12@88-aux|)))
(assert (forall ((ix@3@01 $Ref) (jx@4@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@1@01 ix@3@01)
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (or (Seq_contains xs@1@01 jx@4@01) (not (Seq_contains xs@1@01 jx@4@01)))))
    (or (Seq_contains xs@1@01 ix@3@01) (not (Seq_contains xs@1@01 ix@3@01)))
    (=>
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (Seq_contains xs@1@01 jx@4@01)
        (not (= ix@3@01 jx@4@01))
        (e%precondition $Snap.unit ix@3@01)
        (e%precondition $Snap.unit jx@4@01)))
    (or
      (not
        (and
          (Seq_contains xs@1@01 ix@3@01)
          (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01)))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))))
  :pattern ((Seq_contains xs@1@01 ix@3@01) (e%limited $Snap.unit jx@4@01))
  :pattern ((Seq_contains_trigger xs@1@01 ix@3@01) (e%limited $Snap.unit jx@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@12@10@12@88-aux|)))
(assert (forall ((ix@3@01 $Ref) (jx@4@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@1@01 ix@3@01)
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (or (Seq_contains xs@1@01 jx@4@01) (not (Seq_contains xs@1@01 jx@4@01)))))
    (or (Seq_contains xs@1@01 ix@3@01) (not (Seq_contains xs@1@01 ix@3@01)))
    (=>
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (Seq_contains xs@1@01 jx@4@01)
        (not (= ix@3@01 jx@4@01))
        (e%precondition $Snap.unit ix@3@01)
        (e%precondition $Snap.unit jx@4@01)))
    (or
      (not
        (and
          (Seq_contains xs@1@01 ix@3@01)
          (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01)))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))))
  :pattern ((Seq_contains_trigger xs@1@01 ix@3@01) (e%limited $Snap.unit jx@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@12@10@12@88-aux|)))
(assert (forall ((ix@3@01 $Ref) (jx@4@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@1@01 ix@3@01)
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (or (Seq_contains xs@1@01 jx@4@01) (not (Seq_contains xs@1@01 jx@4@01)))))
    (or (Seq_contains xs@1@01 ix@3@01) (not (Seq_contains xs@1@01 ix@3@01)))
    (=>
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (Seq_contains xs@1@01 jx@4@01)
        (not (= ix@3@01 jx@4@01))
        (e%precondition $Snap.unit ix@3@01)
        (e%precondition $Snap.unit jx@4@01)))
    (or
      (not
        (and
          (Seq_contains xs@1@01 ix@3@01)
          (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01)))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))))
  :pattern ((Seq_contains xs@1@01 jx@4@01) (e%limited $Snap.unit ix@3@01))
  :pattern ((Seq_contains_trigger xs@1@01 jx@4@01) (e%limited $Snap.unit ix@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@12@10@12@88-aux|)))
(assert (forall ((ix@3@01 $Ref) (jx@4@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@1@01 ix@3@01)
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (or (Seq_contains xs@1@01 jx@4@01) (not (Seq_contains xs@1@01 jx@4@01)))))
    (or (Seq_contains xs@1@01 ix@3@01) (not (Seq_contains xs@1@01 ix@3@01)))
    (=>
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (Seq_contains xs@1@01 jx@4@01)
        (not (= ix@3@01 jx@4@01))
        (e%precondition $Snap.unit ix@3@01)
        (e%precondition $Snap.unit jx@4@01)))
    (or
      (not
        (and
          (Seq_contains xs@1@01 ix@3@01)
          (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01)))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))))
  :pattern ((Seq_contains_trigger xs@1@01 jx@4@01) (e%limited $Snap.unit ix@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@12@10@12@88-aux|)))
(assert (forall ((ix@3@01 $Ref) (jx@4@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@1@01 ix@3@01)
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (or (Seq_contains xs@1@01 jx@4@01) (not (Seq_contains xs@1@01 jx@4@01)))))
    (or (Seq_contains xs@1@01 ix@3@01) (not (Seq_contains xs@1@01 ix@3@01)))
    (=>
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (Seq_contains xs@1@01 jx@4@01)
        (not (= ix@3@01 jx@4@01))
        (e%precondition $Snap.unit ix@3@01)
        (e%precondition $Snap.unit jx@4@01)))
    (or
      (not
        (and
          (Seq_contains xs@1@01 ix@3@01)
          (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01)))))
      (and
        (Seq_contains xs@1@01 ix@3@01)
        (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))))
  :pattern ((e%limited $Snap.unit ix@3@01) (e%limited $Snap.unit jx@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@12@10@12@88-aux|)))
(assert (forall ((ix@3@01 $Ref) (jx@4@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@1@01 ix@3@01)
      (and (Seq_contains xs@1@01 jx@4@01) (not (= ix@3@01 jx@4@01))))
    (not (= (e $Snap.unit ix@3@01) (e $Snap.unit jx@4@01))))
  :pattern ((Seq_contains xs@1@01 ix@3@01) (Seq_contains xs@1@01 jx@4@01))
  :pattern ((Seq_contains_trigger xs@1@01 ix@3@01) (Seq_contains_trigger
    xs@1@01
    jx@4@01))
  :pattern ((Seq_contains xs@1@01 ix@3@01) (e%limited $Snap.unit jx@4@01))
  :pattern ((Seq_contains_trigger xs@1@01 ix@3@01) (e%limited $Snap.unit jx@4@01))
  :pattern ((Seq_contains xs@1@01 jx@4@01) (e%limited $Snap.unit ix@3@01))
  :pattern ((Seq_contains_trigger xs@1@01 jx@4@01) (e%limited $Snap.unit ix@3@01))
  :pattern ((e%limited $Snap.unit ix@3@01) (e%limited $Snap.unit jx@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@12@10@12@88|)))
(declare-const x@5@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@1@01 x@5@01))
; [eval] e(x)
(push) ; 3
(assert (e%precondition $Snap.unit x@5@01))
(pop) ; 3
; Joined path conditions
(assert (e%precondition $Snap.unit x@5@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@5@01 $Ref)) (!
  (=> (Seq_contains xs@1@01 x@5@01) (e%precondition $Snap.unit x@5@01))
  :pattern ((e $Snap.unit x@5@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((x1@5@01 $Ref) (x2@5@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@1@01 x1@5@01) (Seq_contains xs@1@01 x2@5@01))
    (and (e%precondition $Snap.unit x1@5@01) (e%precondition $Snap.unit x2@5@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 2
(assert (not (forall ((x1@5@01 $Ref) (x2@5@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@1@01 x1@5@01)
      (Seq_contains xs@1@01 x2@5@01)
      (= (e $Snap.unit x1@5@01) (e $Snap.unit x2@5@01)))
    (= x1@5@01 x2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@5@01 $Ref)) (!
  (=>
    (Seq_contains xs@1@01 x@5@01)
    (and
      (e%precondition $Snap.unit x@5@01)
      (=>
        (= (inv@6@01 (e $Snap.unit x@5@01)) x@5@01)
        (e%precondition $Snap.unit x@5@01))))
  :pattern ((e $Snap.unit x@5@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Seq_contains xs@1@01 (inv@6@01 r)))
    (e%precondition $Snap.unit (inv@6@01 r)))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@5@01 $Ref)) (!
  (=>
    (Seq_contains xs@1@01 x@5@01)
    (and
      (= (inv@6@01 (e $Snap.unit x@5@01)) x@5@01)
      (img@7@01 (e $Snap.unit x@5@01))))
  :pattern ((e $Snap.unit x@5@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Seq_contains xs@1@01 (inv@6@01 r)))
    (= (e $Snap.unit (inv@6@01 r)) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@5@01 $Ref)) (!
  (=> (Seq_contains xs@1@01 x@5@01) (not (= (e $Snap.unit x@5@01) $Ref.null)))
  :pattern ((e $Snap.unit x@5@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@8@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@1@01 x@8@01))
; [eval] e(x)
(push) ; 4
(assert (e%precondition $Snap.unit x@8@01))
(pop) ; 4
; Joined path conditions
(assert (e%precondition $Snap.unit x@8@01))
(pop) ; 3
(declare-const $t@9@01 $FVF<f>)
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@8@01 $Ref)) (!
  (=> (Seq_contains xs@1@01 x@8@01) (e%precondition $Snap.unit x@8@01))
  :pattern ((e $Snap.unit x@8@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((x1@8@01 $Ref) (x2@8@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@1@01 x1@8@01) (Seq_contains xs@1@01 x2@8@01))
    (and (e%precondition $Snap.unit x1@8@01) (e%precondition $Snap.unit x2@8@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((x1@8@01 $Ref) (x2@8@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@1@01 x1@8@01)
      (Seq_contains xs@1@01 x2@8@01)
      (= (e $Snap.unit x1@8@01) (e $Snap.unit x2@8@01)))
    (= x1@8@01 x2@8@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (Seq_contains xs@1@01 x@8@01)
    (and
      (e%precondition $Snap.unit x@8@01)
      (=>
        (= (inv@10@01 (e $Snap.unit x@8@01)) x@8@01)
        (e%precondition $Snap.unit x@8@01))))
  :pattern ((e $Snap.unit x@8@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (Seq_contains xs@1@01 (inv@10@01 r)))
    (e%precondition $Snap.unit (inv@10@01 r)))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (Seq_contains xs@1@01 x@8@01)
    (and
      (= (inv@10@01 (e $Snap.unit x@8@01)) x@8@01)
      (img@11@01 (e $Snap.unit x@8@01))))
  :pattern ((e $Snap.unit x@8@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (Seq_contains xs@1@01 (inv@10@01 r)))
    (= (e $Snap.unit (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@8@01 $Ref)) (!
  (=> (Seq_contains xs@1@01 x@8@01) (not (= (e $Snap.unit x@8@01) $Ref.null)))
  :pattern ((e $Snap.unit x@8@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@12@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@1@01 x@12@01))
; [eval] e(x)
(push) ; 4
(assert (e%precondition $Snap.unit x@12@01))
(pop) ; 4
; Joined path conditions
(assert (e%precondition $Snap.unit x@12@01))
(pop) ; 3
(declare-fun inv@13@01 ($Ref) $Ref)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@12@01 $Ref)) (!
  (=> (Seq_contains xs@1@01 x@12@01) (e%precondition $Snap.unit x@12@01))
  :pattern ((e $Snap.unit x@12@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((x1@12@01 $Ref) (x2@12@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@1@01 x1@12@01) (Seq_contains xs@1@01 x2@12@01))
    (and
      (e%precondition $Snap.unit x1@12@01)
      (e%precondition $Snap.unit x2@12@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((x1@12@01 $Ref) (x2@12@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@1@01 x1@12@01)
      (Seq_contains xs@1@01 x2@12@01)
      (= (e $Snap.unit x1@12@01) (e $Snap.unit x2@12@01)))
    (= x1@12@01 x2@12@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Seq_contains xs@1@01 x@12@01)
    (and
      (e%precondition $Snap.unit x@12@01)
      (=>
        (= (inv@13@01 (e $Snap.unit x@12@01)) x@12@01)
        (e%precondition $Snap.unit x@12@01))))
  :pattern ((e $Snap.unit x@12@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (Seq_contains xs@1@01 (inv@13@01 r)))
    (e%precondition $Snap.unit (inv@13@01 r)))
  :pattern ((inv@13@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Seq_contains xs@1@01 x@12@01)
    (and
      (= (inv@13@01 (e $Snap.unit x@12@01)) x@12@01)
      (img@14@01 (e $Snap.unit x@12@01))))
  :pattern ((e $Snap.unit x@12@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (Seq_contains xs@1@01 (inv@13@01 r)))
    (= (e $Snap.unit (inv@13@01 r)) r))
  :pattern ((inv@13@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@15@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@1@01 (inv@13@01 r))
      (img@14@01 r)
      (= r (e $Snap.unit (inv@13@01 r))))
    ($Perm.min
      (ite
        (and (img@7@01 r) (Seq_contains xs@1@01 (inv@6@01 r)))
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
        (and (img@7@01 r) (Seq_contains xs@1@01 (inv@6@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@15@01 r))
    $Perm.No)
  
  :qid |quant-u-8|))))
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
      (Seq_contains xs@1@01 (inv@13@01 r))
      (img@14@01 r)
      (= r (e $Snap.unit (inv@13@01 r))))
    (= (- $Perm.Write (pTaken@15@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@16@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Seq_contains xs@1@01 (inv@6@01 r)))
    (=
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@2@01)) r)))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@2@01)) r))
  :qid |qp.fvfValDef0|)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const xs@17@01 Seq<$Ref>)
(declare-const i@18@01 Int)
(declare-const xs@19@01 Seq<$Ref>)
(declare-const i@20@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (= ($Snap.first $t@21@01) $Snap.unit))
; [eval] (forall ix: Ref, jx: Ref :: { (ix in xs), (jx in xs) } { (ix in xs), e(jx) } { (jx in xs), e(ix) } { e(ix), e(jx) } (ix in xs) && ((jx in xs) && ix != jx) ==> e(ix) != e(jx))
(declare-const ix@22@01 $Ref)
(declare-const jx@23@01 $Ref)
(push) ; 2
; [eval] (ix in xs) && ((jx in xs) && ix != jx) ==> e(ix) != e(jx)
; [eval] (ix in xs) && ((jx in xs) && ix != jx)
; [eval] (ix in xs)
(push) ; 3
; [then-branch: 3 | !(ix@22@01 in xs@19@01) | live]
; [else-branch: 3 | ix@22@01 in xs@19@01 | live]
(push) ; 4
; [then-branch: 3 | !(ix@22@01 in xs@19@01)]
(assert (not (Seq_contains xs@19@01 ix@22@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | ix@22@01 in xs@19@01]
(assert (Seq_contains xs@19@01 ix@22@01))
; [eval] (jx in xs)
(push) ; 5
; [then-branch: 4 | !(jx@23@01 in xs@19@01) | live]
; [else-branch: 4 | jx@23@01 in xs@19@01 | live]
(push) ; 6
; [then-branch: 4 | !(jx@23@01 in xs@19@01)]
(assert (not (Seq_contains xs@19@01 jx@23@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | jx@23@01 in xs@19@01]
(assert (Seq_contains xs@19@01 jx@23@01))
; [eval] ix != jx
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@19@01 jx@23@01) (not (Seq_contains xs@19@01 jx@23@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains xs@19@01 ix@22@01)
  (and
    (Seq_contains xs@19@01 ix@22@01)
    (or (Seq_contains xs@19@01 jx@23@01) (not (Seq_contains xs@19@01 jx@23@01))))))
(assert (or (Seq_contains xs@19@01 ix@22@01) (not (Seq_contains xs@19@01 ix@22@01))))
(push) ; 3
; [then-branch: 5 | ix@22@01 in xs@19@01 && jx@23@01 in xs@19@01 && ix@22@01 != jx@23@01 | live]
; [else-branch: 5 | !(ix@22@01 in xs@19@01 && jx@23@01 in xs@19@01 && ix@22@01 != jx@23@01) | live]
(push) ; 4
; [then-branch: 5 | ix@22@01 in xs@19@01 && jx@23@01 in xs@19@01 && ix@22@01 != jx@23@01]
(assert (and
  (Seq_contains xs@19@01 ix@22@01)
  (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01)))))
; [eval] e(ix) != e(jx)
; [eval] e(ix)
(push) ; 5
(assert (e%precondition $Snap.unit ix@22@01))
(pop) ; 5
; Joined path conditions
(assert (e%precondition $Snap.unit ix@22@01))
; [eval] e(jx)
(push) ; 5
(assert (e%precondition $Snap.unit jx@23@01))
(pop) ; 5
; Joined path conditions
(assert (e%precondition $Snap.unit jx@23@01))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(ix@22@01 in xs@19@01 && jx@23@01 in xs@19@01 && ix@22@01 != jx@23@01)]
(assert (not
  (and
    (Seq_contains xs@19@01 ix@22@01)
    (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains xs@19@01 ix@22@01)
    (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))
  (and
    (Seq_contains xs@19@01 ix@22@01)
    (Seq_contains xs@19@01 jx@23@01)
    (not (= ix@22@01 jx@23@01))
    (e%precondition $Snap.unit ix@22@01)
    (e%precondition $Snap.unit jx@23@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains xs@19@01 ix@22@01)
      (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01)))))
  (and
    (Seq_contains xs@19@01 ix@22@01)
    (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@22@01 $Ref) (jx@23@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@19@01 ix@22@01)
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (or
          (Seq_contains xs@19@01 jx@23@01)
          (not (Seq_contains xs@19@01 jx@23@01)))))
    (or (Seq_contains xs@19@01 ix@22@01) (not (Seq_contains xs@19@01 ix@22@01)))
    (=>
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (Seq_contains xs@19@01 jx@23@01)
        (not (= ix@22@01 jx@23@01))
        (e%precondition $Snap.unit ix@22@01)
        (e%precondition $Snap.unit jx@23@01)))
    (or
      (not
        (and
          (Seq_contains xs@19@01 ix@22@01)
          (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01)))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))))
  :pattern ((Seq_contains xs@19@01 ix@22@01) (Seq_contains xs@19@01 jx@23@01))
  :pattern ((Seq_contains_trigger xs@19@01 ix@22@01) (Seq_contains_trigger
    xs@19@01
    jx@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@18@10@18@88-aux|)))
(assert (forall ((ix@22@01 $Ref) (jx@23@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@19@01 ix@22@01)
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (or
          (Seq_contains xs@19@01 jx@23@01)
          (not (Seq_contains xs@19@01 jx@23@01)))))
    (or (Seq_contains xs@19@01 ix@22@01) (not (Seq_contains xs@19@01 ix@22@01)))
    (=>
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (Seq_contains xs@19@01 jx@23@01)
        (not (= ix@22@01 jx@23@01))
        (e%precondition $Snap.unit ix@22@01)
        (e%precondition $Snap.unit jx@23@01)))
    (or
      (not
        (and
          (Seq_contains xs@19@01 ix@22@01)
          (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01)))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))))
  :pattern ((Seq_contains_trigger xs@19@01 ix@22@01) (Seq_contains_trigger
    xs@19@01
    jx@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@18@10@18@88-aux|)))
(assert (forall ((ix@22@01 $Ref) (jx@23@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@19@01 ix@22@01)
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (or
          (Seq_contains xs@19@01 jx@23@01)
          (not (Seq_contains xs@19@01 jx@23@01)))))
    (or (Seq_contains xs@19@01 ix@22@01) (not (Seq_contains xs@19@01 ix@22@01)))
    (=>
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (Seq_contains xs@19@01 jx@23@01)
        (not (= ix@22@01 jx@23@01))
        (e%precondition $Snap.unit ix@22@01)
        (e%precondition $Snap.unit jx@23@01)))
    (or
      (not
        (and
          (Seq_contains xs@19@01 ix@22@01)
          (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01)))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))))
  :pattern ((Seq_contains xs@19@01 ix@22@01) (e%limited $Snap.unit jx@23@01))
  :pattern ((Seq_contains_trigger xs@19@01 ix@22@01) (e%limited $Snap.unit jx@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@18@10@18@88-aux|)))
(assert (forall ((ix@22@01 $Ref) (jx@23@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@19@01 ix@22@01)
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (or
          (Seq_contains xs@19@01 jx@23@01)
          (not (Seq_contains xs@19@01 jx@23@01)))))
    (or (Seq_contains xs@19@01 ix@22@01) (not (Seq_contains xs@19@01 ix@22@01)))
    (=>
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (Seq_contains xs@19@01 jx@23@01)
        (not (= ix@22@01 jx@23@01))
        (e%precondition $Snap.unit ix@22@01)
        (e%precondition $Snap.unit jx@23@01)))
    (or
      (not
        (and
          (Seq_contains xs@19@01 ix@22@01)
          (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01)))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))))
  :pattern ((Seq_contains_trigger xs@19@01 ix@22@01) (e%limited $Snap.unit jx@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@18@10@18@88-aux|)))
(assert (forall ((ix@22@01 $Ref) (jx@23@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@19@01 ix@22@01)
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (or
          (Seq_contains xs@19@01 jx@23@01)
          (not (Seq_contains xs@19@01 jx@23@01)))))
    (or (Seq_contains xs@19@01 ix@22@01) (not (Seq_contains xs@19@01 ix@22@01)))
    (=>
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (Seq_contains xs@19@01 jx@23@01)
        (not (= ix@22@01 jx@23@01))
        (e%precondition $Snap.unit ix@22@01)
        (e%precondition $Snap.unit jx@23@01)))
    (or
      (not
        (and
          (Seq_contains xs@19@01 ix@22@01)
          (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01)))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))))
  :pattern ((Seq_contains xs@19@01 jx@23@01) (e%limited $Snap.unit ix@22@01))
  :pattern ((Seq_contains_trigger xs@19@01 jx@23@01) (e%limited $Snap.unit ix@22@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@18@10@18@88-aux|)))
(assert (forall ((ix@22@01 $Ref) (jx@23@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@19@01 ix@22@01)
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (or
          (Seq_contains xs@19@01 jx@23@01)
          (not (Seq_contains xs@19@01 jx@23@01)))))
    (or (Seq_contains xs@19@01 ix@22@01) (not (Seq_contains xs@19@01 ix@22@01)))
    (=>
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (Seq_contains xs@19@01 jx@23@01)
        (not (= ix@22@01 jx@23@01))
        (e%precondition $Snap.unit ix@22@01)
        (e%precondition $Snap.unit jx@23@01)))
    (or
      (not
        (and
          (Seq_contains xs@19@01 ix@22@01)
          (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01)))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))))
  :pattern ((Seq_contains_trigger xs@19@01 jx@23@01) (e%limited $Snap.unit ix@22@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@18@10@18@88-aux|)))
(assert (forall ((ix@22@01 $Ref) (jx@23@01 $Ref)) (!
  (and
    (=>
      (Seq_contains xs@19@01 ix@22@01)
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (or
          (Seq_contains xs@19@01 jx@23@01)
          (not (Seq_contains xs@19@01 jx@23@01)))))
    (or (Seq_contains xs@19@01 ix@22@01) (not (Seq_contains xs@19@01 ix@22@01)))
    (=>
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (Seq_contains xs@19@01 jx@23@01)
        (not (= ix@22@01 jx@23@01))
        (e%precondition $Snap.unit ix@22@01)
        (e%precondition $Snap.unit jx@23@01)))
    (or
      (not
        (and
          (Seq_contains xs@19@01 ix@22@01)
          (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01)))))
      (and
        (Seq_contains xs@19@01 ix@22@01)
        (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))))
  :pattern ((e%limited $Snap.unit ix@22@01) (e%limited $Snap.unit jx@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@18@10@18@88-aux|)))
(assert (forall ((ix@22@01 $Ref) (jx@23@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@19@01 ix@22@01)
      (and (Seq_contains xs@19@01 jx@23@01) (not (= ix@22@01 jx@23@01))))
    (not (= (e $Snap.unit ix@22@01) (e $Snap.unit jx@23@01))))
  :pattern ((Seq_contains xs@19@01 ix@22@01) (Seq_contains xs@19@01 jx@23@01))
  :pattern ((Seq_contains_trigger xs@19@01 ix@22@01) (Seq_contains_trigger
    xs@19@01
    jx@23@01))
  :pattern ((Seq_contains xs@19@01 ix@22@01) (e%limited $Snap.unit jx@23@01))
  :pattern ((Seq_contains_trigger xs@19@01 ix@22@01) (e%limited $Snap.unit jx@23@01))
  :pattern ((Seq_contains xs@19@01 jx@23@01) (e%limited $Snap.unit ix@22@01))
  :pattern ((Seq_contains_trigger xs@19@01 jx@23@01) (e%limited $Snap.unit ix@22@01))
  :pattern ((e%limited $Snap.unit ix@22@01) (e%limited $Snap.unit jx@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/trigger_check.vpr@18@10@18@88|)))
(declare-const x@24@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@19@01 x@24@01))
; [eval] e(x)
(push) ; 3
(assert (e%precondition $Snap.unit x@24@01))
(pop) ; 3
; Joined path conditions
(assert (e%precondition $Snap.unit x@24@01))
; [eval] i + 1
(pop) ; 2
(declare-fun inv@25@01 ($Ref Int) $Ref)
(declare-fun img@26@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@24@01 $Ref)) (!
  (=> (Seq_contains xs@19@01 x@24@01) (e%precondition $Snap.unit x@24@01))
  :pattern ((e $Snap.unit x@24@01))
  :qid |p-aux|)))
; Check receiver injectivity
(assert (forall ((x1@24@01 $Ref) (x2@24@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@19@01 x1@24@01) (Seq_contains xs@19@01 x2@24@01))
    (and
      (e%precondition $Snap.unit x1@24@01)
      (e%precondition $Snap.unit x2@24@01)))
  
  :qid |p-rcvrInj|)))
(push) ; 2
(assert (not (forall ((x1@24@01 $Ref) (x2@24@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@19@01 x1@24@01)
      (Seq_contains xs@19@01 x2@24@01)
      (= (e $Snap.unit x1@24@01) (e $Snap.unit x2@24@01)))
    (= x1@24@01 x2@24@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@24@01 $Ref)) (!
  (=>
    (Seq_contains xs@19@01 x@24@01)
    (and
      (e%precondition $Snap.unit x@24@01)
      (=>
        (= (inv@25@01 (e $Snap.unit x@24@01) (+ i@20@01 1)) x@24@01)
        (e%precondition $Snap.unit x@24@01))))
  :pattern ((e $Snap.unit x@24@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@26@01 r i) (Seq_contains xs@19@01 (inv@25@01 r i)))
    (e%precondition $Snap.unit (inv@25@01 r i)))
  :pattern ((inv@25@01 r i))
  :qid |p-fctOfInv|)))
(assert (forall ((x@24@01 $Ref)) (!
  (=>
    (Seq_contains xs@19@01 x@24@01)
    (and
      (= (inv@25@01 (e $Snap.unit x@24@01) (+ i@20@01 1)) x@24@01)
      (img@26@01 (e $Snap.unit x@24@01) (+ i@20@01 1))))
  :pattern ((e $Snap.unit x@24@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@26@01 r i) (Seq_contains xs@19@01 (inv@25@01 r i)))
    (and (= (e $Snap.unit (inv@25@01 r i)) r) (= (+ i@20@01 1) i)))
  :pattern ((inv@25@01 r i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@27@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@19@01 x@27@01))
; [eval] e(x)
(push) ; 4
(assert (e%precondition $Snap.unit x@27@01))
(pop) ; 4
; Joined path conditions
(assert (e%precondition $Snap.unit x@27@01))
; [eval] i + 1
(pop) ; 3
(declare-const $t@28@01 $PSF<p>)
(declare-fun inv@29@01 ($Ref Int) $Ref)
(declare-fun img@30@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@27@01 $Ref)) (!
  (=> (Seq_contains xs@19@01 x@27@01) (e%precondition $Snap.unit x@27@01))
  :pattern ((e $Snap.unit x@27@01))
  :qid |p-aux|)))
; Check receiver injectivity
(assert (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@19@01 x1@27@01) (Seq_contains xs@19@01 x2@27@01))
    (and
      (e%precondition $Snap.unit x1@27@01)
      (e%precondition $Snap.unit x2@27@01)))
  
  :qid |p-rcvrInj|)))
(push) ; 3
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@19@01 x1@27@01)
      (Seq_contains xs@19@01 x2@27@01)
      (= (e $Snap.unit x1@27@01) (e $Snap.unit x2@27@01)))
    (= x1@27@01 x2@27@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Seq_contains xs@19@01 x@27@01)
    (and
      (e%precondition $Snap.unit x@27@01)
      (=>
        (= (inv@29@01 (e $Snap.unit x@27@01) (+ i@20@01 1)) x@27@01)
        (e%precondition $Snap.unit x@27@01))))
  :pattern ((e $Snap.unit x@27@01))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@30@01 r i) (Seq_contains xs@19@01 (inv@29@01 r i)))
    (e%precondition $Snap.unit (inv@29@01 r i)))
  :pattern ((inv@29@01 r i))
  :qid |p-fctOfInv|)))
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Seq_contains xs@19@01 x@27@01)
    (and
      (= (inv@29@01 (e $Snap.unit x@27@01) (+ i@20@01 1)) x@27@01)
      (img@30@01 (e $Snap.unit x@27@01) (+ i@20@01 1))))
  :pattern ((e $Snap.unit x@27@01))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@30@01 r i) (Seq_contains xs@19@01 (inv@29@01 r i)))
    (and (= (e $Snap.unit (inv@29@01 r i)) r) (= (+ i@20@01 1) i)))
  :pattern ((inv@29@01 r i))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const x@31@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@19@01 x@31@01))
; [eval] e(x)
(push) ; 4
(assert (e%precondition $Snap.unit x@31@01))
(pop) ; 4
; Joined path conditions
(assert (e%precondition $Snap.unit x@31@01))
; [eval] i + 1
(pop) ; 3
(declare-fun inv@32@01 ($Ref Int) $Ref)
(declare-fun img@33@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@31@01 $Ref)) (!
  (=> (Seq_contains xs@19@01 x@31@01) (e%precondition $Snap.unit x@31@01))
  :pattern ((e $Snap.unit x@31@01))
  :qid |p-aux|)))
; Check receiver injectivity
(assert (forall ((x1@31@01 $Ref) (x2@31@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@19@01 x1@31@01) (Seq_contains xs@19@01 x2@31@01))
    (and
      (e%precondition $Snap.unit x1@31@01)
      (e%precondition $Snap.unit x2@31@01)))
  
  :qid |p-rcvrInj|)))
(push) ; 3
(assert (not (forall ((x1@31@01 $Ref) (x2@31@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@19@01 x1@31@01)
      (Seq_contains xs@19@01 x2@31@01)
      (= (e $Snap.unit x1@31@01) (e $Snap.unit x2@31@01)))
    (= x1@31@01 x2@31@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@31@01 $Ref)) (!
  (=>
    (Seq_contains xs@19@01 x@31@01)
    (and
      (e%precondition $Snap.unit x@31@01)
      (=>
        (= (inv@32@01 (e $Snap.unit x@31@01) (+ i@20@01 1)) x@31@01)
        (e%precondition $Snap.unit x@31@01))))
  :pattern ((e $Snap.unit x@31@01))
  :qid |p-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@33@01 r i) (Seq_contains xs@19@01 (inv@32@01 r i)))
    (e%precondition $Snap.unit (inv@32@01 r i)))
  :pattern ((inv@32@01 r i))
  :qid |p-fctOfInv|)))
(assert (forall ((x@31@01 $Ref)) (!
  (=>
    (Seq_contains xs@19@01 x@31@01)
    (and
      (= (inv@32@01 (e $Snap.unit x@31@01) (+ i@20@01 1)) x@31@01)
      (img@33@01 (e $Snap.unit x@31@01) (+ i@20@01 1))))
  :pattern ((e $Snap.unit x@31@01))
  :qid |p-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@33@01 r i) (Seq_contains xs@19@01 (inv@32@01 r i)))
    (and (= (e $Snap.unit (inv@32@01 r i)) r) (= (+ i@20@01 1) i)))
  :pattern ((inv@32@01 r i))
  :qid |p-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@34@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Seq_contains xs@19@01 (inv@32@01 r i))
      (img@33@01 r i)
      (and (= r (e $Snap.unit (inv@32@01 r i))) (= i (+ i@20@01 1))))
    ($Perm.min
      (ite
        (and (img@26@01 r i) (Seq_contains xs@19@01 (inv@25@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@26@01 r i) (Seq_contains xs@19@01 (inv@25@01 r i)))
        $Perm.Write
        $Perm.No)
      (pTaken@34@01 r i))
    $Perm.No)
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (Seq_contains xs@19@01 (inv@32@01 r i))
      (img@33@01 r i)
      (and (= r (e $Snap.unit (inv@32@01 r i))) (= i (+ i@20@01 1))))
    (= (- $Perm.Write (pTaken@34@01 r i)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@35@01 $PSF<p>)
(declare-const s@36@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@36@01 $Snap)) (!
  (=>
    (and
      (img@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@36@01)) ($SortWrappers.$SnapToInt ($Snap.second s@36@01)))
      (Seq_contains
        xs@19@01
        (inv@25@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@36@01)) ($SortWrappers.$SnapToInt ($Snap.second s@36@01)))))
    (and
      (not (= s@36@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@35@01  $PSF<p>) s@36@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@21@01)) s@36@01))))
  :pattern (($PSF.lookup_p (as sm@35@01  $PSF<p>) s@36@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.second $t@21@01)) s@36@01))
  :qid |qp.psmValDef1|)))
(pop) ; 2
(pop) ; 1
