(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:16:21
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedcombinations/write_permission.vpr
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
(declare-sort $FVF<g> 0)
(declare-sort $PSF<p> 0)
(declare-sort $PSF<p2> 0)
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
(declare-fun $SortWrappers.$FVF<g>To$Snap ($FVF<g>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<g> ($Snap) $FVF<g>)
(assert (forall ((x $FVF<g>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<g>($SortWrappers.$FVF<g>To$Snap x)))
    :pattern (($SortWrappers.$FVF<g>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<g>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<g>To$Snap($SortWrappers.$SnapTo$FVF<g> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<g> x))
    :qid |$Snap.$FVF<g>To$SnapTo$FVF<g>|
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
(declare-fun $SortWrappers.$PSF<p2>To$Snap ($PSF<p2>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<p2> ($Snap) $PSF<p2>)
(assert (forall ((x $PSF<p2>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<p2>($SortWrappers.$PSF<p2>To$Snap x)))
    :pattern (($SortWrappers.$PSF<p2>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<p2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<p2>To$Snap($SortWrappers.$SnapTo$PSF<p2> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<p2> x))
    :qid |$Snap.$PSF<p2>To$SnapTo$PSF<p2>|
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
; /field_value_functions_declarations.smt2 [g: Int]
(declare-fun $FVF.domain_g ($FVF<g>) Set<$Ref>)
(declare-fun $FVF.lookup_g ($FVF<g> $Ref) Int)
(declare-fun $FVF.after_g ($FVF<g> $FVF<g>) Bool)
(declare-fun $FVF.loc_g (Int $Ref) Bool)
(declare-fun $FVF.perm_g ($FPM $Ref) $Perm)
(declare-const $fvfTOP_g $FVF<g>)
; /predicate_snap_functions_declarations.smt2 [p: Int]
(declare-fun $PSF.domain_p ($PSF<p>) Set<$Snap>)
(declare-fun $PSF.lookup_p ($PSF<p> $Snap) Int)
(declare-fun $PSF.after_p ($PSF<p> $PSF<p>) Bool)
(declare-fun $PSF.loc_p (Int $Snap) Bool)
(declare-fun $PSF.perm_p ($PPM $Snap) $Perm)
(declare-const $psfTOP_p $PSF<p>)
; /predicate_snap_functions_declarations.smt2 [p2: Snap]
(declare-fun $PSF.domain_p2 ($PSF<p2>) Set<$Snap>)
(declare-fun $PSF.lookup_p2 ($PSF<p2> $Snap) $Snap)
(declare-fun $PSF.after_p2 ($PSF<p2> $PSF<p2>) Bool)
(declare-fun $PSF.loc_p2 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_p2 ($PPM $Snap) $Perm)
(declare-const $psfTOP_p2 $PSF<p2>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p%trigger ($Snap $Ref) Bool)
(declare-fun p2%trigger ($Snap $Ref Int) Bool)
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
; /field_value_functions_axioms.smt2 [g: Int]
(assert (forall ((vs $FVF<g>) (ws $FVF<g>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_g vs) ($FVF.domain_g ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_g vs))
            (= ($FVF.lookup_g vs x) ($FVF.lookup_g ws x)))
          :pattern (($FVF.lookup_g vs x) ($FVF.lookup_g ws x))
          :qid |qp.$FVF<g>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<g>To$Snap vs)
              ($SortWrappers.$FVF<g>To$Snap ws)
              )
    :qid |qp.$FVF<g>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_g pm r))
    :pattern (($FVF.perm_g pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_g f r) true)
    :pattern (($FVF.loc_g f r)))))
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
; /predicate_snap_functions_axioms.smt2 [p2: Snap]
(assert (forall ((vs $PSF<p2>) (ws $PSF<p2>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_p2 vs) ($PSF.domain_p2 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_p2 vs))
            (= ($PSF.lookup_p2 vs x) ($PSF.lookup_p2 ws x)))
          :pattern (($PSF.lookup_p2 vs x) ($PSF.lookup_p2 ws x))
          :qid |qp.$PSF<p2>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<p2>To$Snap vs)
              ($SortWrappers.$PSF<p2>To$Snap ws)
              )
    :qid |qp.$PSF<p2>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_p2 pm s))
    :pattern (($PSF.perm_p2 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_p2 f s) true)
    :pattern (($PSF.loc_p2 f s)))))
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
; ---------- m1_1 ----------
(declare-const r@0@01 $Ref)
(declare-const xs@1@01 Seq<$Ref>)
(declare-const i@2@01 Int)
(declare-const r@3@01 $Ref)
(declare-const xs@4@01 Seq<$Ref>)
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] (r in xs)
(assert (Seq_contains xs@4@01 r@3@01))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(declare-const x@7@01 $Ref)
(push) ; 2
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 0 | !(x@7@01 in xs@4@01) | live]
; [else-branch: 0 | x@7@01 in xs@4@01 | live]
(push) ; 4
; [then-branch: 0 | !(x@7@01 in xs@4@01)]
(assert (not (Seq_contains xs@4@01 x@7@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | x@7@01 in xs@4@01]
(assert (Seq_contains xs@4@01 x@7@01))
; [eval] i > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@4@01 x@7@01) (not (Seq_contains xs@4@01 x@7@01))))
(assert (and (Seq_contains xs@4@01 x@7@01) (> i@5@01 0)))
(pop) ; 2
(declare-fun inv@8@01 ($Ref) $Ref)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@7@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@7@01) (> i@5@01 0))
    (or (Seq_contains xs@4@01 x@7@01) (not (Seq_contains xs@4@01 x@7@01))))
  :pattern ((Seq_contains xs@4@01 x@7@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@7@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@7@01))
  :pattern ((inv@8@01 x@7@01))
  :pattern ((img@9@01 x@7@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@7@01 $Ref) (x2@7@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@4@01 x1@7@01) (> i@5@01 0))
      (and (Seq_contains xs@4@01 x2@7@01) (> i@5@01 0))
      (= x1@7@01 x2@7@01))
    (= x1@7@01 x2@7@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@7@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@7@01) (> i@5@01 0))
    (and (= (inv@8@01 x@7@01) x@7@01) (img@9@01 x@7@01)))
  :pattern ((Seq_contains xs@4@01 x@7@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@7@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@7@01))
  :pattern ((inv@8@01 x@7@01))
  :pattern ((img@9@01 x@7@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (and (Seq_contains xs@4@01 (inv@8@01 r)) (> i@5@01 0)))
    (= (inv@8@01 r) r))
  :pattern ((inv@8@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@7@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@7@01) (> i@5@01 0))
    (not (= x@7@01 $Ref.null)))
  :pattern ((Seq_contains xs@4@01 x@7@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@7@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@7@01))
  :pattern ((inv@8@01 x@7@01))
  :pattern ((img@9@01 x@7@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@10@01 $Ref)
(push) ; 2
; [eval] (x in xs) && i <= 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 1 | !(x@10@01 in xs@4@01) | live]
; [else-branch: 1 | x@10@01 in xs@4@01 | live]
(push) ; 4
; [then-branch: 1 | !(x@10@01 in xs@4@01)]
(assert (not (Seq_contains xs@4@01 x@10@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | x@10@01 in xs@4@01]
(assert (Seq_contains xs@4@01 x@10@01))
; [eval] i <= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@4@01 x@10@01) (not (Seq_contains xs@4@01 x@10@01))))
(assert (and (Seq_contains xs@4@01 x@10@01) (<= i@5@01 0)))
(pop) ; 2
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@10@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@10@01) (<= i@5@01 0))
    (or (Seq_contains xs@4@01 x@10@01) (not (Seq_contains xs@4@01 x@10@01))))
  :pattern ((Seq_contains xs@4@01 x@10@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@10@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@10@01))
  :pattern ((inv@11@01 x@10@01))
  :pattern ((img@12@01 x@10@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@10@01 $Ref) (x2@10@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@4@01 x1@10@01) (<= i@5@01 0))
      (and (Seq_contains xs@4@01 x2@10@01) (<= i@5@01 0))
      (= x1@10@01 x2@10@01))
    (= x1@10@01 x2@10@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@10@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@10@01) (<= i@5@01 0))
    (and (= (inv@11@01 x@10@01) x@10@01) (img@12@01 x@10@01)))
  :pattern ((Seq_contains xs@4@01 x@10@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@10@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@10@01))
  :pattern ((inv@11@01 x@10@01))
  :pattern ((img@12@01 x@10@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (and (Seq_contains xs@4@01 (inv@11@01 r)) (<= i@5@01 0)))
    (= (inv@11@01 r) r))
  :pattern ((inv@11@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@10@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@10@01) (<= i@5@01 0))
    (not (= x@10@01 $Ref.null)))
  :pattern ((Seq_contains xs@4@01 x@10@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@10@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@10@01))
  :pattern ((inv@11@01 x@10@01))
  :pattern ((img@12@01 x@10@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(declare-const x@14@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 2 | !(x@14@01 in xs@4@01) | live]
; [else-branch: 2 | x@14@01 in xs@4@01 | live]
(push) ; 5
; [then-branch: 2 | !(x@14@01 in xs@4@01)]
(assert (not (Seq_contains xs@4@01 x@14@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | x@14@01 in xs@4@01]
(assert (Seq_contains xs@4@01 x@14@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@4@01 x@14@01) (not (Seq_contains xs@4@01 x@14@01))))
(assert (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0)))
(pop) ; 3
(declare-fun inv@15@01 ($Ref) $Ref)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@14@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0))
    (or (Seq_contains xs@4@01 x@14@01) (not (Seq_contains xs@4@01 x@14@01))))
  :pattern ((Seq_contains xs@4@01 x@14@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@14@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@14@01))
  :pattern ((inv@15@01 x@14@01))
  :pattern ((img@16@01 x@14@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@14@01 $Ref) (x2@14@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@4@01 x1@14@01) (> i@5@01 0))
      (and (Seq_contains xs@4@01 x2@14@01) (> i@5@01 0))
      (= x1@14@01 x2@14@01))
    (= x1@14@01 x2@14@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@14@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0))
    (and (= (inv@15@01 x@14@01) x@14@01) (img@16@01 x@14@01)))
  :pattern ((Seq_contains xs@4@01 x@14@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@14@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@14@01))
  :pattern ((inv@15@01 x@14@01))
  :pattern ((img@16@01 x@14@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (and (Seq_contains xs@4@01 (inv@15@01 r)) (> i@5@01 0)))
    (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@14@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0))
    (not (= x@14@01 $Ref.null)))
  :pattern ((Seq_contains xs@4@01 x@14@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@14@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@14@01))
  :pattern ((inv@15@01 x@14@01))
  :pattern ((img@16@01 x@14@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(declare-const x@17@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i <= 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 3 | !(x@17@01 in xs@4@01) | live]
; [else-branch: 3 | x@17@01 in xs@4@01 | live]
(push) ; 5
; [then-branch: 3 | !(x@17@01 in xs@4@01)]
(assert (not (Seq_contains xs@4@01 x@17@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | x@17@01 in xs@4@01]
(assert (Seq_contains xs@4@01 x@17@01))
; [eval] i <= 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@4@01 x@17@01) (not (Seq_contains xs@4@01 x@17@01))))
(assert (and (Seq_contains xs@4@01 x@17@01) (<= i@5@01 0)))
(pop) ; 3
(declare-fun inv@18@01 ($Ref) $Ref)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@17@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@17@01) (<= i@5@01 0))
    (or (Seq_contains xs@4@01 x@17@01) (not (Seq_contains xs@4@01 x@17@01))))
  :pattern ((Seq_contains xs@4@01 x@17@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@17@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@17@01))
  :pattern ((inv@18@01 x@17@01))
  :pattern ((img@19@01 x@17@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@17@01 $Ref) (x2@17@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@4@01 x1@17@01) (<= i@5@01 0))
      (and (Seq_contains xs@4@01 x2@17@01) (<= i@5@01 0))
      (= x1@17@01 x2@17@01))
    (= x1@17@01 x2@17@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@17@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@17@01) (<= i@5@01 0))
    (and (= (inv@18@01 x@17@01) x@17@01) (img@19@01 x@17@01)))
  :pattern ((Seq_contains xs@4@01 x@17@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@17@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@17@01))
  :pattern ((inv@18@01 x@17@01))
  :pattern ((img@19@01 x@17@01))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (and (Seq_contains xs@4@01 (inv@18@01 r)) (<= i@5@01 0)))
    (= (inv@18@01 r) r))
  :pattern ((inv@18@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@17@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@17@01) (<= i@5@01 0))
    (not (= x@17@01 $Ref.null)))
  :pattern ((Seq_contains xs@4@01 x@17@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@17@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@17@01))
  :pattern ((inv@18@01 x@17@01))
  :pattern ((img@19@01 x@17@01))
  :qid |g-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@13@01)) $Snap.unit))
; [eval] i > 0 ==> r.f == 1
; [eval] i > 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> i@5@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> i@5@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | i@5@01 > 0 | live]
; [else-branch: 4 | !(i@5@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | i@5@01 > 0]
(assert (> i@5@01 0))
; [eval] r.f == 1
(push) ; 5
(assert (not (and
  (img@16@01 r@3@01)
  (and (Seq_contains xs@4@01 (inv@15@01 r@3@01)) (> i@5@01 0)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(i@5@01 > 0)]
(assert (not (> i@5@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (> i@5@01 0)) (> i@5@01 0)))
(assert (=>
  (> i@5@01 0)
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@13@01)) r@3@01)
    1)))
(pop) ; 2
(push) ; 2
; [eval] i > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> i@5@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> i@5@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | i@5@01 > 0 | live]
; [else-branch: 5 | !(i@5@01 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | i@5@01 > 0]
(assert (> i@5@01 0))
; [exec]
; r.f := 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((r $Ref)) $Perm
  (ite
    (= r r@3@01)
    ($Perm.min
      (ite
        (and (img@9@01 r) (and (Seq_contains xs@4@01 (inv@8@01 r)) (> i@5@01 0)))
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
        (and (img@9@01 r) (and (Seq_contains xs@4@01 (inv@8@01 r)) (> i@5@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@20@01 r))
    $Perm.No)
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@20@01 r) $Perm.No)
  
  :qid |quant-u-10|))))
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
  (=> (= r r@3@01) (= (- $Perm.Write (pTaken@20@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@21@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@3@01) 1))
; [exec]
; r.g := 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@22@01 ((r $Ref)) $Perm
  (ite
    (= r r@3@01)
    ($Perm.min
      (ite
        (and
          (img@12@01 r)
          (and (Seq_contains xs@4@01 (inv@11@01 r)) (<= i@5@01 0)))
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
          (img@12@01 r)
          (and (Seq_contains xs@4@01 (inv@11@01 r)) (<= i@5@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@22@01 r))
    $Perm.No)
  
  :qid |quant-u-13|))))
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
  (=> (= r r@3@01) (= (- $Perm.Write (pTaken@22@01 r)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=> (= r r@3@01) (= (- $Perm.Write (pTaken@22@01 r)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m1_2 ----------
(declare-const r@23@01 $Ref)
(declare-const xs@24@01 Seq<$Ref>)
(declare-const i@25@01 Int)
(declare-const r@26@01 $Ref)
(declare-const xs@27@01 Seq<$Ref>)
(declare-const i@28@01 Int)
(push) ; 1
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(assert (= ($Snap.first $t@29@01) $Snap.unit))
; [eval] (r in xs)
(assert (Seq_contains xs@27@01 r@26@01))
(assert (=
  ($Snap.second $t@29@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@29@01))
    ($Snap.second ($Snap.second $t@29@01)))))
(declare-const x@30@01 $Ref)
(push) ; 2
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 6 | !(x@30@01 in xs@27@01) | live]
; [else-branch: 6 | x@30@01 in xs@27@01 | live]
(push) ; 4
; [then-branch: 6 | !(x@30@01 in xs@27@01)]
(assert (not (Seq_contains xs@27@01 x@30@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | x@30@01 in xs@27@01]
(assert (Seq_contains xs@27@01 x@30@01))
; [eval] i > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@27@01 x@30@01) (not (Seq_contains xs@27@01 x@30@01))))
(assert (and (Seq_contains xs@27@01 x@30@01) (> i@28@01 0)))
(pop) ; 2
(declare-fun inv@31@01 ($Ref) $Ref)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@30@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@30@01) (> i@28@01 0))
    (or (Seq_contains xs@27@01 x@30@01) (not (Seq_contains xs@27@01 x@30@01))))
  :pattern ((Seq_contains xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((inv@31@01 x@30@01))
  :pattern ((img@32@01 x@30@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@30@01 $Ref) (x2@30@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@27@01 x1@30@01) (> i@28@01 0))
      (and (Seq_contains xs@27@01 x2@30@01) (> i@28@01 0))
      (= x1@30@01 x2@30@01))
    (= x1@30@01 x2@30@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@30@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@30@01) (> i@28@01 0))
    (and (= (inv@31@01 x@30@01) x@30@01) (img@32@01 x@30@01)))
  :pattern ((Seq_contains xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((inv@31@01 x@30@01))
  :pattern ((img@32@01 x@30@01))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (and (Seq_contains xs@27@01 (inv@31@01 r)) (> i@28@01 0)))
    (= (inv@31@01 r) r))
  :pattern ((inv@31@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@30@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@30@01) (> i@28@01 0))
    (not (= x@30@01 $Ref.null)))
  :pattern ((Seq_contains xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((inv@31@01 x@30@01))
  :pattern ((img@32@01 x@30@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@33@01 $Ref)
(push) ; 2
; [eval] (x in xs) && i <= 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 7 | !(x@33@01 in xs@27@01) | live]
; [else-branch: 7 | x@33@01 in xs@27@01 | live]
(push) ; 4
; [then-branch: 7 | !(x@33@01 in xs@27@01)]
(assert (not (Seq_contains xs@27@01 x@33@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | x@33@01 in xs@27@01]
(assert (Seq_contains xs@27@01 x@33@01))
; [eval] i <= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@27@01 x@33@01) (not (Seq_contains xs@27@01 x@33@01))))
(assert (and (Seq_contains xs@27@01 x@33@01) (<= i@28@01 0)))
(pop) ; 2
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@33@01) (<= i@28@01 0))
    (or (Seq_contains xs@27@01 x@33@01) (not (Seq_contains xs@27@01 x@33@01))))
  :pattern ((Seq_contains xs@27@01 x@33@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@33@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@33@01))
  :pattern ((inv@34@01 x@33@01))
  :pattern ((img@35@01 x@33@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@33@01 $Ref) (x2@33@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@27@01 x1@33@01) (<= i@28@01 0))
      (and (Seq_contains xs@27@01 x2@33@01) (<= i@28@01 0))
      (= x1@33@01 x2@33@01))
    (= x1@33@01 x2@33@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@33@01) (<= i@28@01 0))
    (and (= (inv@34@01 x@33@01) x@33@01) (img@35@01 x@33@01)))
  :pattern ((Seq_contains xs@27@01 x@33@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@33@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@33@01))
  :pattern ((inv@34@01 x@33@01))
  :pattern ((img@35@01 x@33@01))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@01 r)
      (and (Seq_contains xs@27@01 (inv@34@01 r)) (<= i@28@01 0)))
    (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@33@01) (<= i@28@01 0))
    (not (= x@33@01 $Ref.null)))
  :pattern ((Seq_contains xs@27@01 x@33@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@33@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@33@01))
  :pattern ((inv@34@01 x@33@01))
  :pattern ((img@35@01 x@33@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(declare-const x@37@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 8 | !(x@37@01 in xs@27@01) | live]
; [else-branch: 8 | x@37@01 in xs@27@01 | live]
(push) ; 5
; [then-branch: 8 | !(x@37@01 in xs@27@01)]
(assert (not (Seq_contains xs@27@01 x@37@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | x@37@01 in xs@27@01]
(assert (Seq_contains xs@27@01 x@37@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@27@01 x@37@01) (not (Seq_contains xs@27@01 x@37@01))))
(assert (and (Seq_contains xs@27@01 x@37@01) (> i@28@01 0)))
(pop) ; 3
(declare-fun inv@38@01 ($Ref) $Ref)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@37@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@37@01) (> i@28@01 0))
    (or (Seq_contains xs@27@01 x@37@01) (not (Seq_contains xs@27@01 x@37@01))))
  :pattern ((Seq_contains xs@27@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@37@01))
  :pattern ((inv@38@01 x@37@01))
  :pattern ((img@39@01 x@37@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@37@01 $Ref) (x2@37@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@27@01 x1@37@01) (> i@28@01 0))
      (and (Seq_contains xs@27@01 x2@37@01) (> i@28@01 0))
      (= x1@37@01 x2@37@01))
    (= x1@37@01 x2@37@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@37@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@37@01) (> i@28@01 0))
    (and (= (inv@38@01 x@37@01) x@37@01) (img@39@01 x@37@01)))
  :pattern ((Seq_contains xs@27@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@37@01))
  :pattern ((inv@38@01 x@37@01))
  :pattern ((img@39@01 x@37@01))
  :qid |quant-u-20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (and (Seq_contains xs@27@01 (inv@38@01 r)) (> i@28@01 0)))
    (= (inv@38@01 r) r))
  :pattern ((inv@38@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@37@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@37@01) (> i@28@01 0))
    (not (= x@37@01 $Ref.null)))
  :pattern ((Seq_contains xs@27@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@37@01))
  :pattern ((inv@38@01 x@37@01))
  :pattern ((img@39@01 x@37@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(declare-const x@40@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i <= 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 9 | !(x@40@01 in xs@27@01) | live]
; [else-branch: 9 | x@40@01 in xs@27@01 | live]
(push) ; 5
; [then-branch: 9 | !(x@40@01 in xs@27@01)]
(assert (not (Seq_contains xs@27@01 x@40@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | x@40@01 in xs@27@01]
(assert (Seq_contains xs@27@01 x@40@01))
; [eval] i <= 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@27@01 x@40@01) (not (Seq_contains xs@27@01 x@40@01))))
(assert (and (Seq_contains xs@27@01 x@40@01) (<= i@28@01 0)))
(pop) ; 3
(declare-fun inv@41@01 ($Ref) $Ref)
(declare-fun img@42@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@40@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@40@01) (<= i@28@01 0))
    (or (Seq_contains xs@27@01 x@40@01) (not (Seq_contains xs@27@01 x@40@01))))
  :pattern ((Seq_contains xs@27@01 x@40@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@40@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@40@01))
  :pattern ((inv@41@01 x@40@01))
  :pattern ((img@42@01 x@40@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@40@01 $Ref) (x2@40@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@27@01 x1@40@01) (<= i@28@01 0))
      (and (Seq_contains xs@27@01 x2@40@01) (<= i@28@01 0))
      (= x1@40@01 x2@40@01))
    (= x1@40@01 x2@40@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@40@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@40@01) (<= i@28@01 0))
    (and (= (inv@41@01 x@40@01) x@40@01) (img@42@01 x@40@01)))
  :pattern ((Seq_contains xs@27@01 x@40@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@40@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@40@01))
  :pattern ((inv@41@01 x@40@01))
  :pattern ((img@42@01 x@40@01))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (and (Seq_contains xs@27@01 (inv@41@01 r)) (<= i@28@01 0)))
    (= (inv@41@01 r) r))
  :pattern ((inv@41@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@40@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@27@01 x@40@01) (<= i@28@01 0))
    (not (= x@40@01 $Ref.null)))
  :pattern ((Seq_contains xs@27@01 x@40@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@40@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@40@01))
  :pattern ((inv@41@01 x@40@01))
  :pattern ((img@42@01 x@40@01))
  :qid |g-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@36@01)) $Snap.unit))
; [eval] i <= 0 ==> r.g == 4
; [eval] i <= 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (<= i@28@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<= i@28@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | i@28@01 <= 0 | live]
; [else-branch: 10 | !(i@28@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | i@28@01 <= 0]
(assert (<= i@28@01 0))
; [eval] r.g == 4
(push) ; 5
(assert (not (and
  (img@42@01 r@26@01)
  (and (Seq_contains xs@27@01 (inv@41@01 r@26@01)) (<= i@28@01 0)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(i@28@01 <= 0)]
(assert (not (<= i@28@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (<= i@28@01 0)) (<= i@28@01 0)))
(assert (=>
  (<= i@28@01 0)
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@36@01))) r@26@01)
    4)))
(pop) ; 2
(push) ; 2
; [eval] i <= 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= i@28@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= i@28@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | i@28@01 <= 0 | live]
; [else-branch: 11 | !(i@28@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | i@28@01 <= 0]
(assert (<= i@28@01 0))
; [exec]
; r.f := 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@43@01 ((r $Ref)) $Perm
  (ite
    (= r r@26@01)
    ($Perm.min
      (ite
        (and
          (img@32@01 r)
          (and (Seq_contains xs@27@01 (inv@31@01 r)) (> i@28@01 0)))
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
          (img@32@01 r)
          (and (Seq_contains xs@27@01 (inv@31@01 r)) (> i@28@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@43@01 r))
    $Perm.No)
  
  :qid |quant-u-24|))))
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
  (=> (= r r@26@01) (= (- $Perm.Write (pTaken@43@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=> (= r r@26@01) (= (- $Perm.Write (pTaken@43@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const r@44@01 $Ref)
(declare-const xs@45@01 Seq<$Ref>)
(declare-const i@46@01 Int)
(declare-const r@47@01 $Ref)
(declare-const xs@48@01 Seq<$Ref>)
(declare-const i@49@01 Int)
(push) ; 1
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(assert (= ($Snap.first $t@50@01) $Snap.unit))
; [eval] (r in xs)
(assert (Seq_contains xs@48@01 r@47@01))
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(declare-const x@51@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@48@01 x@51@01))
(pop) ; 2
(declare-fun inv@52@01 ($Ref) $Ref)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@51@01 $Ref) (x2@51@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@48@01 x1@51@01)
      (Seq_contains xs@48@01 x2@51@01)
      (= x1@51@01 x2@51@01))
    (= x1@51@01 x2@51@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@51@01 $Ref)) (!
  (=>
    (Seq_contains xs@48@01 x@51@01)
    (and (= (inv@52@01 x@51@01) x@51@01) (img@53@01 x@51@01)))
  :pattern ((Seq_contains xs@48@01 x@51@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@51@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@51@01))
  :pattern ((inv@52@01 x@51@01))
  :pattern ((img@53@01 x@51@01))
  :qid |quant-u-27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
    (= (inv@52@01 r) r))
  :pattern ((inv@52@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@51@01 $Ref)) (!
  (=> (Seq_contains xs@48@01 x@51@01) (not (= x@51@01 $Ref.null)))
  :pattern ((Seq_contains xs@48@01 x@51@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@51@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@51@01))
  :pattern ((inv@52@01 x@51@01))
  :pattern ((img@53@01 x@51@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@54@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@48@01 x@54@01))
(pop) ; 2
(declare-fun inv@55@01 ($Ref) $Ref)
(declare-fun img@56@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@54@01 $Ref) (x2@54@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@48@01 x1@54@01)
      (Seq_contains xs@48@01 x2@54@01)
      (= x1@54@01 x2@54@01))
    (= x1@54@01 x2@54@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@54@01 $Ref)) (!
  (=>
    (Seq_contains xs@48@01 x@54@01)
    (and (= (inv@55@01 x@54@01) x@54@01) (img@56@01 x@54@01)))
  :pattern ((Seq_contains xs@48@01 x@54@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@54@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@54@01))
  :pattern ((inv@55@01 x@54@01))
  :pattern ((img@56@01 x@54@01))
  :qid |quant-u-29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
    (= (inv@55@01 r) r))
  :pattern ((inv@55@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@54@01 $Ref)) (!
  (=> (Seq_contains xs@48@01 x@54@01) (not (= x@54@01 $Ref.null)))
  :pattern ((Seq_contains xs@48@01 x@54@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@54@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@54@01))
  :pattern ((inv@55@01 x@54@01))
  :pattern ((img@56@01 x@54@01))
  :qid |g-permImpliesNonNull|)))
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
; [eval] (x in xs)
(assert (Seq_contains xs@48@01 x@58@01))
(pop) ; 3
(declare-fun inv@59@01 ($Ref) $Ref)
(declare-fun img@60@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@58@01 $Ref) (x2@58@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@48@01 x1@58@01)
      (Seq_contains xs@48@01 x2@58@01)
      (= x1@58@01 x2@58@01))
    (= x1@58@01 x2@58@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@58@01 $Ref)) (!
  (=>
    (Seq_contains xs@48@01 x@58@01)
    (and (= (inv@59@01 x@58@01) x@58@01) (img@60@01 x@58@01)))
  :pattern ((Seq_contains xs@48@01 x@58@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@58@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@58@01))
  :pattern ((inv@59@01 x@58@01))
  :pattern ((img@60@01 x@58@01))
  :qid |quant-u-31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@60@01 r) (Seq_contains xs@48@01 (inv@59@01 r)))
    (= (inv@59@01 r) r))
  :pattern ((inv@59@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@58@01 $Ref)) (!
  (=> (Seq_contains xs@48@01 x@58@01) (not (= x@58@01 $Ref.null)))
  :pattern ((Seq_contains xs@48@01 x@58@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@58@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@58@01))
  :pattern ((inv@59@01 x@58@01))
  :pattern ((img@60@01 x@58@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@57@01))
    ($Snap.second ($Snap.second $t@57@01)))))
(declare-const x@61@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@48@01 x@61@01))
(pop) ; 3
(declare-fun inv@62@01 ($Ref) $Ref)
(declare-fun img@63@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@61@01 $Ref) (x2@61@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@48@01 x1@61@01)
      (Seq_contains xs@48@01 x2@61@01)
      (= x1@61@01 x2@61@01))
    (= x1@61@01 x2@61@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@61@01 $Ref)) (!
  (=>
    (Seq_contains xs@48@01 x@61@01)
    (and (= (inv@62@01 x@61@01) x@61@01) (img@63@01 x@61@01)))
  :pattern ((Seq_contains xs@48@01 x@61@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@61@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@61@01))
  :pattern ((inv@62@01 x@61@01))
  :pattern ((img@63@01 x@61@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@63@01 r) (Seq_contains xs@48@01 (inv@62@01 r)))
    (= (inv@62@01 r) r))
  :pattern ((inv@62@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@61@01 $Ref)) (!
  (=> (Seq_contains xs@48@01 x@61@01) (not (= x@61@01 $Ref.null)))
  :pattern ((Seq_contains xs@48@01 x@61@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@61@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@61@01))
  :pattern ((inv@62@01 x@61@01))
  :pattern ((img@63@01 x@61@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@57@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@57@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@57@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@57@01))) $Snap.unit))
; [eval] i > 0 ==> r.f == 1 && r.g == 2
; [eval] i > 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> i@49@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> i@49@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | i@49@01 > 0 | live]
; [else-branch: 12 | !(i@49@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | i@49@01 > 0]
(assert (> i@49@01 0))
; [eval] r.f == 1 && r.g == 2
; [eval] r.f == 1
(push) ; 5
(assert (not (and (img@60@01 r@47@01) (Seq_contains xs@48@01 (inv@59@01 r@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 13 | Lookup(f, First:($t@57@01), r@47@01) != 1 | live]
; [else-branch: 13 | Lookup(f, First:($t@57@01), r@47@01) == 1 | live]
(push) ; 6
; [then-branch: 13 | Lookup(f, First:($t@57@01), r@47@01) != 1]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r@47@01)
    1)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | Lookup(f, First:($t@57@01), r@47@01) == 1]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r@47@01)
  1))
; [eval] r.g == 2
(push) ; 7
(assert (not (and (img@63@01 r@47@01) (Seq_contains xs@48@01 (inv@62@01 r@47@01)))))
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
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r@47@01)
    1)
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r@47@01)
      1))))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | !(i@49@01 > 0)]
(assert (not (> i@49@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> i@49@01 0)
  (and
    (> i@49@01 0)
    (or
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r@47@01)
        1)
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r@47@01)
          1))))))
; Joined path conditions
(assert (or (not (> i@49@01 0)) (> i@49@01 0)))
(assert (=>
  (> i@49@01 0)
  (and
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r@47@01)
      1)
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@57@01))) r@47@01)
      2))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@57@01))) $Snap.unit))
; [eval] i <= 0 ==> r.g == 4 && r.f == 3
; [eval] i <= 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (<= i@49@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<= i@49@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | i@49@01 <= 0 | live]
; [else-branch: 14 | !(i@49@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 14 | i@49@01 <= 0]
(assert (<= i@49@01 0))
; [eval] r.g == 4 && r.f == 3
; [eval] r.g == 4
(push) ; 5
(assert (not (and (img@63@01 r@47@01) (Seq_contains xs@48@01 (inv@62@01 r@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 15 | Lookup(g, First:(Second:($t@57@01)), r@47@01) != 4 | live]
; [else-branch: 15 | Lookup(g, First:(Second:($t@57@01)), r@47@01) == 4 | live]
(push) ; 6
; [then-branch: 15 | Lookup(g, First:(Second:($t@57@01)), r@47@01) != 4]
(assert (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@57@01))) r@47@01)
    4)))
(pop) ; 6
(push) ; 6
; [else-branch: 15 | Lookup(g, First:(Second:($t@57@01)), r@47@01) == 4]
(assert (=
  ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@57@01))) r@47@01)
  4))
; [eval] r.f == 3
(push) ; 7
(assert (not (and (img@60@01 r@47@01) (Seq_contains xs@48@01 (inv@59@01 r@47@01)))))
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
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@57@01))) r@47@01)
    4)
  (not
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@57@01))) r@47@01)
      4))))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(i@49@01 <= 0)]
(assert (not (<= i@49@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (<= i@49@01 0)
  (and
    (<= i@49@01 0)
    (or
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@57@01))) r@47@01)
        4)
      (not
        (=
          ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@57@01))) r@47@01)
          4))))))
; Joined path conditions
(assert (or (not (<= i@49@01 0)) (<= i@49@01 0)))
(assert (=>
  (<= i@49@01 0)
  (and
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@57@01))) r@47@01)
      4)
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r@47@01)
      3))))
(pop) ; 2
(push) ; 2
; [eval] i > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> i@49@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> i@49@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | i@49@01 > 0 | live]
; [else-branch: 16 | !(i@49@01 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 16 | i@49@01 > 0]
(assert (> i@49@01 0))
; [exec]
; r.f := 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (= r r@47@01)
    ($Perm.min
      (ite
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
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
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@64@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@64@01 r) $Perm.No)
  
  :qid |quant-u-36|))))
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
  (=> (= r r@47@01) (= (- $Perm.Write (pTaken@64@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@65@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@65@01  $FVF<f>) r@47@01) 1))
; [exec]
; r.g := 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@66@01 ((r $Ref)) $Perm
  (ite
    (= r r@47@01)
    ($Perm.min
      (ite
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
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
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@66@01 r))
    $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@66@01 r) $Perm.No)
  
  :qid |quant-u-40|))))
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
  (=> (= r r@47@01) (= (- $Perm.Write (pTaken@66@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@67@01 $FVF<g>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_g (as sm@67@01  $FVF<g>) r@47@01) 2))
(declare-const x@68@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@48@01 x@68@01))
(pop) ; 4
(declare-fun inv@69@01 ($Ref) $Ref)
(declare-fun img@70@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@68@01 $Ref) (x2@68@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@48@01 x1@68@01)
      (Seq_contains xs@48@01 x2@68@01)
      (= x1@68@01 x2@68@01))
    (= x1@68@01 x2@68@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@68@01 $Ref)) (!
  (=>
    (Seq_contains xs@48@01 x@68@01)
    (and (= (inv@69@01 x@68@01) x@68@01) (img@70@01 x@68@01)))
  :pattern ((Seq_contains xs@48@01 x@68@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@68@01))
  :pattern ((inv@69@01 x@68@01))
  :pattern ((img@70@01 x@68@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@70@01 r) (Seq_contains xs@48@01 (inv@69@01 r)))
    (= (inv@69@01 r) r))
  :pattern ((inv@69@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@71@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@48@01 (inv@69@01 r)) (img@70@01 r) (= r (inv@69@01 r)))
    ($Perm.min
      (ite
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
        (- $Perm.Write (pTaken@64@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@72@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@48@01 (inv@69@01 r)) (img@70@01 r) (= r (inv@69@01 r)))
    ($Perm.min
      (ite (= r r@47@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@71@01 r)))
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
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
        (- $Perm.Write (pTaken@64@01 r))
        $Perm.No)
      (pTaken@71@01 r))
    $Perm.No)
  
  :qid |quant-u-44|))))
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
    (and (Seq_contains xs@48@01 (inv@69@01 r)) (img@70@01 r) (= r (inv@69@01 r)))
    (= (- $Perm.Write (pTaken@71@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@72@01 r@47@01)) $Perm.No)))
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
    (and (Seq_contains xs@48@01 (inv@69@01 r)) (img@70@01 r) (= r (inv@69@01 r)))
    (= (- (- $Perm.Write (pTaken@71@01 r)) (pTaken@72@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@73@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@64@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(declare-const x@74@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@48@01 x@74@01))
(pop) ; 4
(declare-fun inv@75@01 ($Ref) $Ref)
(declare-fun img@76@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@74@01 $Ref) (x2@74@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@48@01 x1@74@01)
      (Seq_contains xs@48@01 x2@74@01)
      (= x1@74@01 x2@74@01))
    (= x1@74@01 x2@74@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@74@01 $Ref)) (!
  (=>
    (Seq_contains xs@48@01 x@74@01)
    (and (= (inv@75@01 x@74@01) x@74@01) (img@76@01 x@74@01)))
  :pattern ((Seq_contains xs@48@01 x@74@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@74@01))
  :pattern ((inv@75@01 x@74@01))
  :pattern ((img@76@01 x@74@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@76@01 r) (Seq_contains xs@48@01 (inv@75@01 r)))
    (= (inv@75@01 r) r))
  :pattern ((inv@75@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@77@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@48@01 (inv@75@01 r)) (img@76@01 r) (= r (inv@75@01 r)))
    ($Perm.min
      (ite
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        (- $Perm.Write (pTaken@66@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@48@01 (inv@75@01 r)) (img@76@01 r) (= r (inv@75@01 r)))
    ($Perm.min
      (ite (= r r@47@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@77@01 r)))
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
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        (- $Perm.Write (pTaken@66@01 r))
        $Perm.No)
      (pTaken@77@01 r))
    $Perm.No)
  
  :qid |quant-u-50|))))
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
    (and (Seq_contains xs@48@01 (inv@75@01 r)) (img@76@01 r) (= r (inv@75@01 r)))
    (= (- $Perm.Write (pTaken@77@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@78@01 r@47@01)) $Perm.No)))
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
    (and (Seq_contains xs@48@01 (inv@75@01 r)) (img@76@01 r) (= r (inv@75@01 r)))
    (= (- (- $Perm.Write (pTaken@77@01 r)) (pTaken@78@01 r)) $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@79@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@66@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@79@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_g (as sm@79@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_g (as sm@79@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@67@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@79@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@67@01  $FVF<g>) r))
  :qid |qp.fvfValDef3|)))
; [eval] i > 0 ==> r.f == 1 && r.g == 2
; [eval] i > 0
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@49@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | i@49@01 > 0 | live]
; [else-branch: 17 | !(i@49@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | i@49@01 > 0]
; [eval] r.f == 1 && r.g == 2
; [eval] r.f == 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@64@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r)))
    :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r r@47@01)
      (=
        ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@53@01 r@47@01) (Seq_contains xs@48@01 (inv@52@01 r@47@01)))
      (- $Perm.Write (pTaken@64@01 r@47@01))
      $Perm.No)
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 18 | Lookup(f, sm@73@01, r@47@01) != 1 | live]
; [else-branch: 18 | Lookup(f, sm@73@01, r@47@01) == 1 | live]
(push) ; 7
; [then-branch: 18 | Lookup(f, sm@73@01, r@47@01) != 1]
(assert (not (= ($FVF.lookup_f (as sm@73@01  $FVF<f>) r@47@01) 1)))
(pop) ; 7
(push) ; 7
; [else-branch: 18 | Lookup(f, sm@73@01, r@47@01) == 1]
(assert (= ($FVF.lookup_f (as sm@73@01  $FVF<f>) r@47@01) 1))
; [eval] r.g == 2
(declare-const sm@80@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_g (as sm@80@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@67@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@80@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@67@01  $FVF<g>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@66@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@80@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_g (as sm@80@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef5|)))
(declare-const pm@81@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@81@01  $FPM) r)
    (+
      (ite (= r r@47@01) $Perm.Write $Perm.No)
      (ite
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        (- $Perm.Write (pTaken@66@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@81@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_g (as pm@81@01  $FPM) r@47@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_g (as sm@80@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@67@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@80@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@67@01  $FVF<g>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@66@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@80@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_g (as sm@80@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@81@01  $FPM) r)
    (+
      (ite (= r r@47@01) $Perm.Write $Perm.No)
      (ite
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        (- $Perm.Write (pTaken@66@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@81@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (or
  (= ($FVF.lookup_f (as sm@73@01  $FVF<f>) r@47@01) 1)
  (not (= ($FVF.lookup_f (as sm@73@01  $FVF<f>) r@47@01) 1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@64@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_g (as sm@80@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@67@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@80@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@67@01  $FVF<g>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@66@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@80@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_g (as sm@80@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@81@01  $FPM) r)
    (+
      (ite (= r r@47@01) $Perm.Write $Perm.No)
      (ite
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        (- $Perm.Write (pTaken@66@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@81@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (=>
  (> i@49@01 0)
  (or
    (= ($FVF.lookup_f (as sm@73@01  $FVF<f>) r@47@01) 1)
    (not (= ($FVF.lookup_f (as sm@73@01  $FVF<f>) r@47@01) 1)))))
(push) ; 4
(assert (not (=>
  (> i@49@01 0)
  (and
    (= ($FVF.lookup_f (as sm@73@01  $FVF<f>) r@47@01) 1)
    (= ($FVF.lookup_g (as sm@80@01  $FVF<g>) r@47@01) 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (> i@49@01 0)
  (and
    (= ($FVF.lookup_f (as sm@73@01  $FVF<f>) r@47@01) 1)
    (= ($FVF.lookup_g (as sm@80@01  $FVF<g>) r@47@01) 2))))
; [eval] i <= 0 ==> r.g == 4 && r.f == 3
; [eval] i <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= i@49@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | i@49@01 <= 0 | dead]
; [else-branch: 19 | !(i@49@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 19 | !(i@49@01 <= 0)]
(assert (not (<= i@49@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (<= i@49@01 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 16 | !(i@49@01 > 0)]
(assert (not (> i@49@01 0)))
(pop) ; 3
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (> i@49@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> i@49@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | !(i@49@01 > 0) | live]
; [else-branch: 20 | i@49@01 > 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 20 | !(i@49@01 > 0)]
(assert (not (> i@49@01 0)))
; [exec]
; r.f := 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@82@01 ((r $Ref)) $Perm
  (ite
    (= r r@47@01)
    ($Perm.min
      (ite
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
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
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@82@01 r))
    $Perm.No)
  
  :qid |quant-u-55|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@82@01 r) $Perm.No)
  
  :qid |quant-u-56|))))
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
  (=> (= r r@47@01) (= (- $Perm.Write (pTaken@82@01 r)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@83@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r@47@01) 3))
; [exec]
; r.g := 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@84@01 ((r $Ref)) $Perm
  (ite
    (= r r@47@01)
    ($Perm.min
      (ite
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
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
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@84@01 r))
    $Perm.No)
  
  :qid |quant-u-59|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@84@01 r) $Perm.No)
  
  :qid |quant-u-60|))))
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
  (=> (= r r@47@01) (= (- $Perm.Write (pTaken@84@01 r)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@85@01 $FVF<g>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_g (as sm@85@01  $FVF<g>) r@47@01) 4))
(declare-const x@86@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@48@01 x@86@01))
(pop) ; 4
(declare-fun inv@87@01 ($Ref) $Ref)
(declare-fun img@88@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@86@01 $Ref) (x2@86@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@48@01 x1@86@01)
      (Seq_contains xs@48@01 x2@86@01)
      (= x1@86@01 x2@86@01))
    (= x1@86@01 x2@86@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@86@01 $Ref)) (!
  (=>
    (Seq_contains xs@48@01 x@86@01)
    (and (= (inv@87@01 x@86@01) x@86@01) (img@88@01 x@86@01)))
  :pattern ((Seq_contains xs@48@01 x@86@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@86@01))
  :pattern ((inv@87@01 x@86@01))
  :pattern ((img@88@01 x@86@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@88@01 r) (Seq_contains xs@48@01 (inv@87@01 r)))
    (= (inv@87@01 r) r))
  :pattern ((inv@87@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@89@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@48@01 (inv@87@01 r)) (img@88@01 r) (= r (inv@87@01 r)))
    ($Perm.min
      (ite
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
        (- $Perm.Write (pTaken@82@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@90@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@48@01 (inv@87@01 r)) (img@88@01 r) (= r (inv@87@01 r)))
    ($Perm.min
      (ite (= r r@47@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@89@01 r)))
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
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
        (- $Perm.Write (pTaken@82@01 r))
        $Perm.No)
      (pTaken@89@01 r))
    $Perm.No)
  
  :qid |quant-u-64|))))
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
    (and (Seq_contains xs@48@01 (inv@87@01 r)) (img@88@01 r) (= r (inv@87@01 r)))
    (= (- $Perm.Write (pTaken@89@01 r)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@90@01 r@47@01)) $Perm.No)))
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
    (and (Seq_contains xs@48@01 (inv@87@01 r)) (img@88@01 r) (= r (inv@87@01 r)))
    (= (- (- $Perm.Write (pTaken@89@01 r)) (pTaken@90@01 r)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@91@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@82@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(declare-const x@92@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@48@01 x@92@01))
(pop) ; 4
(declare-fun inv@93@01 ($Ref) $Ref)
(declare-fun img@94@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@92@01 $Ref) (x2@92@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@48@01 x1@92@01)
      (Seq_contains xs@48@01 x2@92@01)
      (= x1@92@01 x2@92@01))
    (= x1@92@01 x2@92@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@92@01 $Ref)) (!
  (=>
    (Seq_contains xs@48@01 x@92@01)
    (and (= (inv@93@01 x@92@01) x@92@01) (img@94@01 x@92@01)))
  :pattern ((Seq_contains xs@48@01 x@92@01))
  :pattern ((Seq_contains_trigger xs@48@01 x@92@01))
  :pattern ((inv@93@01 x@92@01))
  :pattern ((img@94@01 x@92@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@94@01 r) (Seq_contains xs@48@01 (inv@93@01 r)))
    (= (inv@93@01 r) r))
  :pattern ((inv@93@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@95@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@48@01 (inv@93@01 r)) (img@94@01 r) (= r (inv@93@01 r)))
    ($Perm.min
      (ite
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        (- $Perm.Write (pTaken@84@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@96@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@48@01 (inv@93@01 r)) (img@94@01 r) (= r (inv@93@01 r)))
    ($Perm.min
      (ite (= r r@47@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@95@01 r)))
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
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        (- $Perm.Write (pTaken@84@01 r))
        $Perm.No)
      (pTaken@95@01 r))
    $Perm.No)
  
  :qid |quant-u-70|))))
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
    (and (Seq_contains xs@48@01 (inv@93@01 r)) (img@94@01 r) (= r (inv@93@01 r)))
    (= (- $Perm.Write (pTaken@95@01 r)) $Perm.No))
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@96@01 r@47@01)) $Perm.No)))
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
    (and (Seq_contains xs@48@01 (inv@93@01 r)) (img@94@01 r) (= r (inv@93@01 r)))
    (= (- (- $Perm.Write (pTaken@95@01 r)) (pTaken@96@01 r)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@97@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@84@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@97@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_g (as sm@97@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_g (as sm@97@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@97@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@85@01  $FVF<g>) r))
  :qid |qp.fvfValDef10|)))
; [eval] i > 0 ==> r.f == 1 && r.g == 2
; [eval] i > 0
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | i@49@01 > 0 | dead]
; [else-branch: 21 | !(i@49@01 > 0) | live]
(push) ; 5
; [else-branch: 21 | !(i@49@01 > 0)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] i <= 0 ==> r.g == 4 && r.f == 3
; [eval] i <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= i@49@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | i@49@01 <= 0 | live]
; [else-branch: 22 | !(i@49@01 <= 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | i@49@01 <= 0]
(assert (<= i@49@01 0))
; [eval] r.g == 4 && r.f == 3
; [eval] r.g == 4
(declare-const sm@98@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_g (as sm@98@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@85@01  $FVF<g>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@84@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@98@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef12|)))
(declare-const pm@99@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@99@01  $FPM) r)
    (+
      (ite (= r r@47@01) $Perm.Write $Perm.No)
      (ite
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        (- $Perm.Write (pTaken@84@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_g (as pm@99@01  $FPM) r@47@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 23 | Lookup(g, sm@98@01, r@47@01) != 4 | live]
; [else-branch: 23 | Lookup(g, sm@98@01, r@47@01) == 4 | live]
(push) ; 7
; [then-branch: 23 | Lookup(g, sm@98@01, r@47@01) != 4]
(assert (not (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r@47@01) 4)))
(pop) ; 7
(push) ; 7
; [else-branch: 23 | Lookup(g, sm@98@01, r@47@01) == 4]
(assert (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r@47@01) 4))
; [eval] r.f == 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@82@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r)))
    :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (=>
      (= r r@47@01)
      (=
        ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :qid |qp.fvfValDef8|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@53@01 r@47@01) (Seq_contains xs@48@01 (inv@52@01 r@47@01)))
      (- $Perm.Write (pTaken@82@01 r@47@01))
      $Perm.No)
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@82@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (or
  (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r@47@01) 4)
  (not (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r@47@01) 4))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_g (as sm@98@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@85@01  $FVF<g>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@84@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@98@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@99@01  $FPM) r)
    (+
      (ite (= r r@47@01) $Perm.Write $Perm.No)
      (ite
        (and (img@56@01 r) (Seq_contains xs@48@01 (inv@55@01 r)))
        (- $Perm.Write (pTaken@84@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@53@01 r) (Seq_contains xs@48@01 (inv@52@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@82@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r)))
  :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@50@01))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@47@01)
    (=
      ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (=>
  (<= i@49@01 0)
  (and
    (<= i@49@01 0)
    (or
      (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r@47@01) 4)
      (not (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r@47@01) 4))))))
(assert (<= i@49@01 0))
(push) ; 4
(assert (not (=>
  (<= i@49@01 0)
  (and
    (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r@47@01) 4)
    (= ($FVF.lookup_f (as sm@91@01  $FVF<f>) r@47@01) 3)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= i@49@01 0)
  (and
    (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r@47@01) 4)
    (= ($FVF.lookup_f (as sm@91@01  $FVF<f>) r@47@01) 3))))
(pop) ; 3
(push) ; 3
; [else-branch: 20 | i@49@01 > 0]
(assert (> i@49@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m3_1 ----------
(declare-const r@100@01 $Ref)
(declare-const xs@101@01 Seq<$Ref>)
(declare-const i@102@01 Int)
(declare-const r@103@01 $Ref)
(declare-const xs@104@01 Seq<$Ref>)
(declare-const i@105@01 Int)
(push) ; 1
(declare-const $t@106@01 $Snap)
(assert (= $t@106@01 ($Snap.combine ($Snap.first $t@106@01) ($Snap.second $t@106@01))))
(assert (= ($Snap.first $t@106@01) $Snap.unit))
; [eval] (r in xs)
(assert (Seq_contains xs@104@01 r@103@01))
(assert (=
  ($Snap.second $t@106@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@106@01))
    ($Snap.second ($Snap.second $t@106@01)))))
(declare-const x@107@01 $Ref)
(push) ; 2
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 24 | !(x@107@01 in xs@104@01) | live]
; [else-branch: 24 | x@107@01 in xs@104@01 | live]
(push) ; 4
; [then-branch: 24 | !(x@107@01 in xs@104@01)]
(assert (not (Seq_contains xs@104@01 x@107@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 24 | x@107@01 in xs@104@01]
(assert (Seq_contains xs@104@01 x@107@01))
; [eval] i > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@104@01 x@107@01) (not (Seq_contains xs@104@01 x@107@01))))
(assert (and (Seq_contains xs@104@01 x@107@01) (> i@105@01 0)))
(pop) ; 2
(declare-fun inv@108@01 ($Ref) $Ref)
(declare-fun img@109@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@107@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@107@01) (> i@105@01 0))
    (or
      (Seq_contains xs@104@01 x@107@01)
      (not (Seq_contains xs@104@01 x@107@01))))
  :pattern ((Seq_contains xs@104@01 x@107@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@107@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@107@01))
  :pattern ((inv@108@01 x@107@01))
  :pattern ((img@109@01 x@107@01))
  :qid |p-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@107@01 $Ref) (x2@107@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@104@01 x1@107@01) (> i@105@01 0))
      (and (Seq_contains xs@104@01 x2@107@01) (> i@105@01 0))
      (= x1@107@01 x2@107@01))
    (= x1@107@01 x2@107@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@107@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@107@01) (> i@105@01 0))
    (and (= (inv@108@01 x@107@01) x@107@01) (img@109@01 x@107@01)))
  :pattern ((Seq_contains xs@104@01 x@107@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@107@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@107@01))
  :pattern ((inv@108@01 x@107@01))
  :pattern ((img@109@01 x@107@01))
  :qid |quant-u-75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@109@01 r)
      (and (Seq_contains xs@104@01 (inv@108@01 r)) (> i@105@01 0)))
    (= (inv@108@01 r) r))
  :pattern ((inv@108@01 r))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(declare-const x@110@01 $Ref)
(push) ; 2
; [eval] (x in xs) && i <= 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 25 | !(x@110@01 in xs@104@01) | live]
; [else-branch: 25 | x@110@01 in xs@104@01 | live]
(push) ; 4
; [then-branch: 25 | !(x@110@01 in xs@104@01)]
(assert (not (Seq_contains xs@104@01 x@110@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 25 | x@110@01 in xs@104@01]
(assert (Seq_contains xs@104@01 x@110@01))
; [eval] i <= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@104@01 x@110@01) (not (Seq_contains xs@104@01 x@110@01))))
(assert (and (Seq_contains xs@104@01 x@110@01) (<= i@105@01 0)))
(pop) ; 2
(declare-fun inv@111@01 ($Ref) $Ref)
(declare-fun img@112@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@110@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@110@01) (<= i@105@01 0))
    (or
      (Seq_contains xs@104@01 x@110@01)
      (not (Seq_contains xs@104@01 x@110@01))))
  :pattern ((Seq_contains xs@104@01 x@110@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@110@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@110@01))
  :pattern ((inv@111@01 x@110@01))
  :pattern ((img@112@01 x@110@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@110@01 $Ref) (x2@110@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@104@01 x1@110@01) (<= i@105@01 0))
      (and (Seq_contains xs@104@01 x2@110@01) (<= i@105@01 0))
      (= x1@110@01 x2@110@01))
    (= x1@110@01 x2@110@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@110@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@110@01) (<= i@105@01 0))
    (and (= (inv@111@01 x@110@01) x@110@01) (img@112@01 x@110@01)))
  :pattern ((Seq_contains xs@104@01 x@110@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@110@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@110@01))
  :pattern ((inv@111@01 x@110@01))
  :pattern ((img@112@01 x@110@01))
  :qid |quant-u-77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@112@01 r)
      (and (Seq_contains xs@104@01 (inv@111@01 r)) (<= i@105@01 0)))
    (= (inv@111@01 r) r))
  :pattern ((inv@111@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@110@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@110@01) (<= i@105@01 0))
    (not (= x@110@01 $Ref.null)))
  :pattern ((Seq_contains xs@104@01 x@110@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@110@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@110@01))
  :pattern ((inv@111@01 x@110@01))
  :pattern ((img@112@01 x@110@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@113@01 $Snap)
(assert (= $t@113@01 ($Snap.combine ($Snap.first $t@113@01) ($Snap.second $t@113@01))))
(declare-const x@114@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 26 | !(x@114@01 in xs@104@01) | live]
; [else-branch: 26 | x@114@01 in xs@104@01 | live]
(push) ; 5
; [then-branch: 26 | !(x@114@01 in xs@104@01)]
(assert (not (Seq_contains xs@104@01 x@114@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | x@114@01 in xs@104@01]
(assert (Seq_contains xs@104@01 x@114@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@104@01 x@114@01) (not (Seq_contains xs@104@01 x@114@01))))
(assert (and (Seq_contains xs@104@01 x@114@01) (> i@105@01 0)))
(pop) ; 3
(declare-fun inv@115@01 ($Ref) $Ref)
(declare-fun img@116@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@114@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@114@01) (> i@105@01 0))
    (or
      (Seq_contains xs@104@01 x@114@01)
      (not (Seq_contains xs@104@01 x@114@01))))
  :pattern ((Seq_contains xs@104@01 x@114@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@114@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@114@01))
  :pattern ((inv@115@01 x@114@01))
  :pattern ((img@116@01 x@114@01))
  :qid |p-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@114@01 $Ref) (x2@114@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@104@01 x1@114@01) (> i@105@01 0))
      (and (Seq_contains xs@104@01 x2@114@01) (> i@105@01 0))
      (= x1@114@01 x2@114@01))
    (= x1@114@01 x2@114@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@114@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@114@01) (> i@105@01 0))
    (and (= (inv@115@01 x@114@01) x@114@01) (img@116@01 x@114@01)))
  :pattern ((Seq_contains xs@104@01 x@114@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@114@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@114@01))
  :pattern ((inv@115@01 x@114@01))
  :pattern ((img@116@01 x@114@01))
  :qid |quant-u-79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@116@01 r)
      (and (Seq_contains xs@104@01 (inv@115@01 r)) (> i@105@01 0)))
    (= (inv@115@01 r) r))
  :pattern ((inv@115@01 r))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@113@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@113@01))
    ($Snap.second ($Snap.second $t@113@01)))))
(declare-const x@117@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i <= 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 27 | !(x@117@01 in xs@104@01) | live]
; [else-branch: 27 | x@117@01 in xs@104@01 | live]
(push) ; 5
; [then-branch: 27 | !(x@117@01 in xs@104@01)]
(assert (not (Seq_contains xs@104@01 x@117@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | x@117@01 in xs@104@01]
(assert (Seq_contains xs@104@01 x@117@01))
; [eval] i <= 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@104@01 x@117@01) (not (Seq_contains xs@104@01 x@117@01))))
(assert (and (Seq_contains xs@104@01 x@117@01) (<= i@105@01 0)))
(pop) ; 3
(declare-fun inv@118@01 ($Ref) $Ref)
(declare-fun img@119@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@117@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@117@01) (<= i@105@01 0))
    (or
      (Seq_contains xs@104@01 x@117@01)
      (not (Seq_contains xs@104@01 x@117@01))))
  :pattern ((Seq_contains xs@104@01 x@117@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@117@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@117@01))
  :pattern ((inv@118@01 x@117@01))
  :pattern ((img@119@01 x@117@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@117@01 $Ref) (x2@117@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@104@01 x1@117@01) (<= i@105@01 0))
      (and (Seq_contains xs@104@01 x2@117@01) (<= i@105@01 0))
      (= x1@117@01 x2@117@01))
    (= x1@117@01 x2@117@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@117@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@117@01) (<= i@105@01 0))
    (and (= (inv@118@01 x@117@01) x@117@01) (img@119@01 x@117@01)))
  :pattern ((Seq_contains xs@104@01 x@117@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@117@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@117@01))
  :pattern ((inv@118@01 x@117@01))
  :pattern ((img@119@01 x@117@01))
  :qid |quant-u-81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@119@01 r)
      (and (Seq_contains xs@104@01 (inv@118@01 r)) (<= i@105@01 0)))
    (= (inv@118@01 r) r))
  :pattern ((inv@118@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@117@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@104@01 x@117@01) (<= i@105@01 0))
    (not (= x@117@01 $Ref.null)))
  :pattern ((Seq_contains xs@104@01 x@117@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@117@01))
  :pattern ((Seq_contains_trigger xs@104@01 x@117@01))
  :pattern ((inv@118@01 x@117@01))
  :pattern ((img@119@01 x@117@01))
  :qid |g-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@113@01)) $Snap.unit))
; [eval] i > 0 ==> (unfolding acc(p(r), write) in r.f == 1)
; [eval] i > 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> i@105@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> i@105@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | i@105@01 > 0 | live]
; [else-branch: 28 | !(i@105@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 28 | i@105@01 > 0]
(assert (> i@105@01 0))
; [eval] (unfolding acc(p(r), write) in r.f == 1)
(push) ; 5
; Precomputing data for removing quantified permissions
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (= r r@103@01)
    ($Perm.min
      (ite
        (and
          (img@116@01 r)
          (and (Seq_contains xs@104@01 (inv@115@01 r)) (> i@105@01 0)))
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
          (img@116@01 r)
          (and (Seq_contains xs@104@01 (inv@115@01 r)) (> i@105@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@120@01 r))
    $Perm.No)
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@120@01 r) $Perm.No)
  
  :qid |quant-u-84|))))
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
  (=> (= r r@103@01) (= (- $Perm.Write (pTaken@120@01 r)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@121@01 $PSF<p>)
(declare-const s@122@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@116@01 r@103@01)
    (and (Seq_contains xs@104@01 (inv@115@01 r@103@01)) (> i@105@01 0)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap r@103@01) $Snap.unit))
    (=
      ($PSF.lookup_p (as sm@121@01  $PSF<p>) ($SortWrappers.$RefTo$Snap r@103@01))
      ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@113@01)) ($SortWrappers.$RefTo$Snap r@103@01))))))
(assert (p%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p (as sm@121@01  $PSF<p>) ($SortWrappers.$RefTo$Snap r@103@01))) r@103@01))
(assert (not (= r@103@01 $Ref.null)))
; [eval] r.f == 1
(pop) ; 5
; Joined path conditions
(assert (and
  (=>
    (and
      (img@116@01 r@103@01)
      (and (Seq_contains xs@104@01 (inv@115@01 r@103@01)) (> i@105@01 0)))
    (and
      (not (= ($SortWrappers.$RefTo$Snap r@103@01) $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@121@01  $PSF<p>) ($SortWrappers.$RefTo$Snap r@103@01))
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@113@01)) ($SortWrappers.$RefTo$Snap r@103@01)))))
  (p%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p (as sm@121@01  $PSF<p>) ($SortWrappers.$RefTo$Snap r@103@01))) r@103@01)
  (not (= r@103@01 $Ref.null))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 28 | !(i@105@01 > 0)]
(assert (not (> i@105@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> i@105@01 0)
  (and
    (> i@105@01 0)
    (=>
      (and
        (img@116@01 r@103@01)
        (and (Seq_contains xs@104@01 (inv@115@01 r@103@01)) (> i@105@01 0)))
      (and
        (not (= ($SortWrappers.$RefTo$Snap r@103@01) $Snap.unit))
        (=
          ($PSF.lookup_p (as sm@121@01  $PSF<p>) ($SortWrappers.$RefTo$Snap r@103@01))
          ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@113@01)) ($SortWrappers.$RefTo$Snap r@103@01)))))
    (p%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p (as sm@121@01  $PSF<p>) ($SortWrappers.$RefTo$Snap r@103@01))) r@103@01)
    (not (= r@103@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (> i@105@01 0)) (> i@105@01 0)))
(assert (=>
  (> i@105@01 0)
  (=
    ($PSF.lookup_p (as sm@121@01  $PSF<p>) ($SortWrappers.$RefTo$Snap r@103@01))
    1)))
(pop) ; 2
(push) ; 2
; [eval] i > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> i@105@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> i@105@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | i@105@01 > 0 | live]
; [else-branch: 29 | !(i@105@01 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 29 | i@105@01 > 0]
(assert (> i@105@01 0))
; [exec]
; unfold acc(p(r), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@123@01 ((r $Ref)) $Perm
  (ite
    (= r r@103@01)
    ($Perm.min
      (ite
        (and
          (img@109@01 r)
          (and (Seq_contains xs@104@01 (inv@108@01 r)) (> i@105@01 0)))
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
          (img@109@01 r)
          (and (Seq_contains xs@104@01 (inv@108@01 r)) (> i@105@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@123@01 r))
    $Perm.No)
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@123@01 r) $Perm.No)
  
  :qid |quant-u-88|))))
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
  (=> (= r r@103@01) (= (- $Perm.Write (pTaken@123@01 r)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@124@01 $PSF<p>)
(declare-const s@125@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@109@01 r@103@01)
    (and (Seq_contains xs@104@01 (inv@108@01 r@103@01)) (> i@105@01 0)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap r@103@01) $Snap.unit))
    (=
      ($PSF.lookup_p (as sm@124@01  $PSF<p>) ($SortWrappers.$RefTo$Snap r@103@01))
      ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first ($Snap.second $t@106@01))) ($SortWrappers.$RefTo$Snap r@103@01))))))
(assert (not (= r@103@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p (as sm@124@01  $PSF<p>) ($SortWrappers.$RefTo$Snap r@103@01))) r@103@01))
; [exec]
; r.f := 1
; [exec]
; r.g := 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@126@01 ((r $Ref)) $Perm
  (ite
    (= r r@103@01)
    ($Perm.min
      (ite
        (and
          (img@112@01 r)
          (and (Seq_contains xs@104@01 (inv@111@01 r)) (<= i@105@01 0)))
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
          (img@112@01 r)
          (and (Seq_contains xs@104@01 (inv@111@01 r)) (<= i@105@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@126@01 r))
    $Perm.No)
  
  :qid |quant-u-91|))))
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
  (=> (= r r@103@01) (= (- $Perm.Write (pTaken@126@01 r)) $Perm.No))
  
  :qid |quant-u-92|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=> (= r r@103@01) (= (- $Perm.Write (pTaken@126@01 r)) $Perm.No))
  
  :qid |quant-u-92|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m3_2 ----------
(declare-const r@127@01 $Ref)
(declare-const xs@128@01 Seq<$Ref>)
(declare-const i@129@01 Int)
(declare-const r@130@01 $Ref)
(declare-const xs@131@01 Seq<$Ref>)
(declare-const i@132@01 Int)
(push) ; 1
(declare-const $t@133@01 $Snap)
(assert (= $t@133@01 ($Snap.combine ($Snap.first $t@133@01) ($Snap.second $t@133@01))))
(assert (= ($Snap.first $t@133@01) $Snap.unit))
; [eval] (r in xs)
(assert (Seq_contains xs@131@01 r@130@01))
(assert (=
  ($Snap.second $t@133@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@133@01))
    ($Snap.second ($Snap.second $t@133@01)))))
(declare-const x@134@01 $Ref)
(push) ; 2
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 30 | !(x@134@01 in xs@131@01) | live]
; [else-branch: 30 | x@134@01 in xs@131@01 | live]
(push) ; 4
; [then-branch: 30 | !(x@134@01 in xs@131@01)]
(assert (not (Seq_contains xs@131@01 x@134@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 30 | x@134@01 in xs@131@01]
(assert (Seq_contains xs@131@01 x@134@01))
; [eval] i > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@131@01 x@134@01) (not (Seq_contains xs@131@01 x@134@01))))
(assert (and (Seq_contains xs@131@01 x@134@01) (> i@132@01 0)))
(pop) ; 2
(declare-fun inv@135@01 ($Ref) $Ref)
(declare-fun img@136@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@134@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@134@01) (> i@132@01 0))
    (or
      (Seq_contains xs@131@01 x@134@01)
      (not (Seq_contains xs@131@01 x@134@01))))
  :pattern ((Seq_contains xs@131@01 x@134@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@134@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@134@01))
  :pattern ((inv@135@01 x@134@01))
  :pattern ((img@136@01 x@134@01))
  :qid |p-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@134@01 $Ref) (x2@134@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@131@01 x1@134@01) (> i@132@01 0))
      (and (Seq_contains xs@131@01 x2@134@01) (> i@132@01 0))
      (= x1@134@01 x2@134@01))
    (= x1@134@01 x2@134@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@134@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@134@01) (> i@132@01 0))
    (and (= (inv@135@01 x@134@01) x@134@01) (img@136@01 x@134@01)))
  :pattern ((Seq_contains xs@131@01 x@134@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@134@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@134@01))
  :pattern ((inv@135@01 x@134@01))
  :pattern ((img@136@01 x@134@01))
  :qid |quant-u-94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@136@01 r)
      (and (Seq_contains xs@131@01 (inv@135@01 r)) (> i@132@01 0)))
    (= (inv@135@01 r) r))
  :pattern ((inv@135@01 r))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(declare-const x@137@01 $Ref)
(push) ; 2
; [eval] (x in xs) && i <= 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 31 | !(x@137@01 in xs@131@01) | live]
; [else-branch: 31 | x@137@01 in xs@131@01 | live]
(push) ; 4
; [then-branch: 31 | !(x@137@01 in xs@131@01)]
(assert (not (Seq_contains xs@131@01 x@137@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 31 | x@137@01 in xs@131@01]
(assert (Seq_contains xs@131@01 x@137@01))
; [eval] i <= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@131@01 x@137@01) (not (Seq_contains xs@131@01 x@137@01))))
(assert (and (Seq_contains xs@131@01 x@137@01) (<= i@132@01 0)))
(pop) ; 2
(declare-fun inv@138@01 ($Ref) $Ref)
(declare-fun img@139@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@137@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@137@01) (<= i@132@01 0))
    (or
      (Seq_contains xs@131@01 x@137@01)
      (not (Seq_contains xs@131@01 x@137@01))))
  :pattern ((Seq_contains xs@131@01 x@137@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@137@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@137@01))
  :pattern ((inv@138@01 x@137@01))
  :pattern ((img@139@01 x@137@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@137@01 $Ref) (x2@137@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@131@01 x1@137@01) (<= i@132@01 0))
      (and (Seq_contains xs@131@01 x2@137@01) (<= i@132@01 0))
      (= x1@137@01 x2@137@01))
    (= x1@137@01 x2@137@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@137@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@137@01) (<= i@132@01 0))
    (and (= (inv@138@01 x@137@01) x@137@01) (img@139@01 x@137@01)))
  :pattern ((Seq_contains xs@131@01 x@137@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@137@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@137@01))
  :pattern ((inv@138@01 x@137@01))
  :pattern ((img@139@01 x@137@01))
  :qid |quant-u-96|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@139@01 r)
      (and (Seq_contains xs@131@01 (inv@138@01 r)) (<= i@132@01 0)))
    (= (inv@138@01 r) r))
  :pattern ((inv@138@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@137@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@137@01) (<= i@132@01 0))
    (not (= x@137@01 $Ref.null)))
  :pattern ((Seq_contains xs@131@01 x@137@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@137@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@137@01))
  :pattern ((inv@138@01 x@137@01))
  :pattern ((img@139@01 x@137@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@140@01 $Snap)
(assert (= $t@140@01 ($Snap.combine ($Snap.first $t@140@01) ($Snap.second $t@140@01))))
(declare-const x@141@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 32 | !(x@141@01 in xs@131@01) | live]
; [else-branch: 32 | x@141@01 in xs@131@01 | live]
(push) ; 5
; [then-branch: 32 | !(x@141@01 in xs@131@01)]
(assert (not (Seq_contains xs@131@01 x@141@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 32 | x@141@01 in xs@131@01]
(assert (Seq_contains xs@131@01 x@141@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@131@01 x@141@01) (not (Seq_contains xs@131@01 x@141@01))))
(assert (and (Seq_contains xs@131@01 x@141@01) (> i@132@01 0)))
(pop) ; 3
(declare-fun inv@142@01 ($Ref) $Ref)
(declare-fun img@143@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@141@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@141@01) (> i@132@01 0))
    (or
      (Seq_contains xs@131@01 x@141@01)
      (not (Seq_contains xs@131@01 x@141@01))))
  :pattern ((Seq_contains xs@131@01 x@141@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@141@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@141@01))
  :pattern ((inv@142@01 x@141@01))
  :pattern ((img@143@01 x@141@01))
  :qid |p-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@141@01 $Ref) (x2@141@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@131@01 x1@141@01) (> i@132@01 0))
      (and (Seq_contains xs@131@01 x2@141@01) (> i@132@01 0))
      (= x1@141@01 x2@141@01))
    (= x1@141@01 x2@141@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@141@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@141@01) (> i@132@01 0))
    (and (= (inv@142@01 x@141@01) x@141@01) (img@143@01 x@141@01)))
  :pattern ((Seq_contains xs@131@01 x@141@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@141@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@141@01))
  :pattern ((inv@142@01 x@141@01))
  :pattern ((img@143@01 x@141@01))
  :qid |quant-u-98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@143@01 r)
      (and (Seq_contains xs@131@01 (inv@142@01 r)) (> i@132@01 0)))
    (= (inv@142@01 r) r))
  :pattern ((inv@142@01 r))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@140@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@140@01))
    ($Snap.second ($Snap.second $t@140@01)))))
(declare-const x@144@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i <= 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 33 | !(x@144@01 in xs@131@01) | live]
; [else-branch: 33 | x@144@01 in xs@131@01 | live]
(push) ; 5
; [then-branch: 33 | !(x@144@01 in xs@131@01)]
(assert (not (Seq_contains xs@131@01 x@144@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | x@144@01 in xs@131@01]
(assert (Seq_contains xs@131@01 x@144@01))
; [eval] i <= 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@131@01 x@144@01) (not (Seq_contains xs@131@01 x@144@01))))
(assert (and (Seq_contains xs@131@01 x@144@01) (<= i@132@01 0)))
(pop) ; 3
(declare-fun inv@145@01 ($Ref) $Ref)
(declare-fun img@146@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@144@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@144@01) (<= i@132@01 0))
    (or
      (Seq_contains xs@131@01 x@144@01)
      (not (Seq_contains xs@131@01 x@144@01))))
  :pattern ((Seq_contains xs@131@01 x@144@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@144@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@144@01))
  :pattern ((inv@145@01 x@144@01))
  :pattern ((img@146@01 x@144@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@144@01 $Ref) (x2@144@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@131@01 x1@144@01) (<= i@132@01 0))
      (and (Seq_contains xs@131@01 x2@144@01) (<= i@132@01 0))
      (= x1@144@01 x2@144@01))
    (= x1@144@01 x2@144@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@144@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@144@01) (<= i@132@01 0))
    (and (= (inv@145@01 x@144@01) x@144@01) (img@146@01 x@144@01)))
  :pattern ((Seq_contains xs@131@01 x@144@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@144@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@144@01))
  :pattern ((inv@145@01 x@144@01))
  :pattern ((img@146@01 x@144@01))
  :qid |quant-u-100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@146@01 r)
      (and (Seq_contains xs@131@01 (inv@145@01 r)) (<= i@132@01 0)))
    (= (inv@145@01 r) r))
  :pattern ((inv@145@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@144@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@131@01 x@144@01) (<= i@132@01 0))
    (not (= x@144@01 $Ref.null)))
  :pattern ((Seq_contains xs@131@01 x@144@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@144@01))
  :pattern ((Seq_contains_trigger xs@131@01 x@144@01))
  :pattern ((inv@145@01 x@144@01))
  :pattern ((img@146@01 x@144@01))
  :qid |g-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@140@01)) $Snap.unit))
; [eval] i <= 0 ==> r.g == 4
; [eval] i <= 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (<= i@132@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<= i@132@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | i@132@01 <= 0 | live]
; [else-branch: 34 | !(i@132@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 34 | i@132@01 <= 0]
(assert (<= i@132@01 0))
; [eval] r.g == 4
(push) ; 5
(assert (not (and
  (img@146@01 r@130@01)
  (and (Seq_contains xs@131@01 (inv@145@01 r@130@01)) (<= i@132@01 0)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 34 | !(i@132@01 <= 0)]
(assert (not (<= i@132@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (<= i@132@01 0)) (<= i@132@01 0)))
(assert (=>
  (<= i@132@01 0)
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@140@01))) r@130@01)
    4)))
(pop) ; 2
(push) ; 2
; [eval] i <= 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= i@132@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= i@132@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | i@132@01 <= 0 | live]
; [else-branch: 35 | !(i@132@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 35 | i@132@01 <= 0]
(assert (<= i@132@01 0))
; [exec]
; unfold acc(p(r), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@147@01 ((r $Ref)) $Perm
  (ite
    (= r r@130@01)
    ($Perm.min
      (ite
        (and
          (img@136@01 r)
          (and (Seq_contains xs@131@01 (inv@135@01 r)) (> i@132@01 0)))
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
          (img@136@01 r)
          (and (Seq_contains xs@131@01 (inv@135@01 r)) (> i@132@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@147@01 r))
    $Perm.No)
  
  :qid |quant-u-102|))))
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
  (=> (= r r@130@01) (= (- $Perm.Write (pTaken@147@01 r)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=> (= r r@130@01) (= (- $Perm.Write (pTaken@147@01 r)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const r@148@01 $Ref)
(declare-const xs@149@01 Seq<$Ref>)
(declare-const i@150@01 Int)
(declare-const r@151@01 $Ref)
(declare-const xs@152@01 Seq<$Ref>)
(declare-const i@153@01 Int)
(push) ; 1
(declare-const $t@154@01 $Snap)
(assert (= $t@154@01 ($Snap.combine ($Snap.first $t@154@01) ($Snap.second $t@154@01))))
(assert (= ($Snap.first $t@154@01) $Snap.unit))
; [eval] (r in xs)
(assert (Seq_contains xs@152@01 r@151@01))
(assert (=
  ($Snap.second $t@154@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@154@01))
    ($Snap.second ($Snap.second $t@154@01)))))
(declare-const x@155@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@152@01 x@155@01))
(pop) ; 2
(declare-fun inv@156@01 ($Ref Int) $Ref)
(declare-fun img@157@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@155@01 $Ref) (x2@155@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@152@01 x1@155@01)
      (Seq_contains xs@152@01 x2@155@01)
      (= x1@155@01 x2@155@01))
    (= x1@155@01 x2@155@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@155@01 $Ref)) (!
  (=>
    (Seq_contains xs@152@01 x@155@01)
    (and
      (= (inv@156@01 x@155@01 i@153@01) x@155@01)
      (img@157@01 x@155@01 i@153@01)))
  :pattern ((Seq_contains xs@152@01 x@155@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@155@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@155@01))
  :pattern ((inv@156@01 x@155@01 i@153@01))
  :pattern ((img@157@01 x@155@01 i@153@01))
  :qid |quant-u-105|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
    (and (= (inv@156@01 r i) r) (= i@153@01 i)))
  :pattern ((inv@156@01 r i))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(declare-const x@158@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@152@01 x@158@01))
(pop) ; 2
(declare-fun inv@159@01 ($Ref) $Ref)
(declare-fun img@160@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@158@01 $Ref) (x2@158@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@152@01 x1@158@01)
      (Seq_contains xs@152@01 x2@158@01)
      (= x1@158@01 x2@158@01))
    (= x1@158@01 x2@158@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@158@01 $Ref)) (!
  (=>
    (Seq_contains xs@152@01 x@158@01)
    (and (= (inv@159@01 x@158@01) x@158@01) (img@160@01 x@158@01)))
  :pattern ((Seq_contains xs@152@01 x@158@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@158@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@158@01))
  :pattern ((inv@159@01 x@158@01))
  :pattern ((img@160@01 x@158@01))
  :qid |quant-u-107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
    (= (inv@159@01 r) r))
  :pattern ((inv@159@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@158@01 $Ref)) (!
  (=> (Seq_contains xs@152@01 x@158@01) (not (= x@158@01 $Ref.null)))
  :pattern ((Seq_contains xs@152@01 x@158@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@158@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@158@01))
  :pattern ((inv@159@01 x@158@01))
  :pattern ((img@160@01 x@158@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@161@01 $Snap)
(assert (= $t@161@01 ($Snap.combine ($Snap.first $t@161@01) ($Snap.second $t@161@01))))
(declare-const x@162@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@152@01 x@162@01))
(pop) ; 3
(declare-fun inv@163@01 ($Ref Int) $Ref)
(declare-fun img@164@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@162@01 $Ref) (x2@162@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@152@01 x1@162@01)
      (Seq_contains xs@152@01 x2@162@01)
      (= x1@162@01 x2@162@01))
    (= x1@162@01 x2@162@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@162@01 $Ref)) (!
  (=>
    (Seq_contains xs@152@01 x@162@01)
    (and
      (= (inv@163@01 x@162@01 i@153@01) x@162@01)
      (img@164@01 x@162@01 i@153@01)))
  :pattern ((Seq_contains xs@152@01 x@162@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@162@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@162@01))
  :pattern ((inv@163@01 x@162@01 i@153@01))
  :pattern ((img@164@01 x@162@01 i@153@01))
  :qid |quant-u-109|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@164@01 r i) (Seq_contains xs@152@01 (inv@163@01 r i)))
    (and (= (inv@163@01 r i) r) (= i@153@01 i)))
  :pattern ((inv@163@01 r i))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@161@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@161@01))
    ($Snap.second ($Snap.second $t@161@01)))))
(declare-const x@165@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@152@01 x@165@01))
(pop) ; 3
(declare-fun inv@166@01 ($Ref) $Ref)
(declare-fun img@167@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@165@01 $Ref) (x2@165@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@152@01 x1@165@01)
      (Seq_contains xs@152@01 x2@165@01)
      (= x1@165@01 x2@165@01))
    (= x1@165@01 x2@165@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@165@01 $Ref)) (!
  (=>
    (Seq_contains xs@152@01 x@165@01)
    (and (= (inv@166@01 x@165@01) x@165@01) (img@167@01 x@165@01)))
  :pattern ((Seq_contains xs@152@01 x@165@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@165@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@165@01))
  :pattern ((inv@166@01 x@165@01))
  :pattern ((img@167@01 x@165@01))
  :qid |quant-u-111|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@167@01 r) (Seq_contains xs@152@01 (inv@166@01 r)))
    (= (inv@166@01 r) r))
  :pattern ((inv@166@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@165@01 $Ref)) (!
  (=> (Seq_contains xs@152@01 x@165@01) (not (= x@165@01 $Ref.null)))
  :pattern ((Seq_contains xs@152@01 x@165@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@165@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@165@01))
  :pattern ((inv@166@01 x@165@01))
  :pattern ((img@167@01 x@165@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@161@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@161@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@161@01))) $Snap.unit))
; [eval] i > 0 ==> (unfolding acc(p2(r, i), write) in r.f == i && r.g == 2)
; [eval] i > 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> i@153@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> i@153@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | i@153@01 > 0 | live]
; [else-branch: 36 | !(i@153@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 36 | i@153@01 > 0]
(assert (> i@153@01 0))
; [eval] (unfolding acc(p2(r, i), write) in r.f == i && r.g == 2)
(push) ; 5
; Precomputing data for removing quantified permissions
(define-fun pTaken@168@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r r@151@01) (= i i@153@01))
    ($Perm.min
      (ite
        (and (img@164@01 r i) (Seq_contains xs@152@01 (inv@163@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@164@01 r i) (Seq_contains xs@152@01 (inv@163@01 r i)))
        $Perm.Write
        $Perm.No)
      (pTaken@168@01 r i))
    $Perm.No)
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@168@01 r i) $Perm.No)
  
  :qid |quant-u-114|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@151@01) (= i i@153@01))
    (= (- $Perm.Write (pTaken@168@01 r i)) $Perm.No))
  
  :qid |quant-u-115|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@169@01 $PSF<p2>)
(declare-const s@170@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@164@01 r@151@01 i@153@01)
    (Seq_contains xs@152@01 (inv@163@01 r@151@01 i@153@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@161@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (p2%trigger ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@151@01)
  ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01))
(assert (=
  ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (not (= r@151@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))))
  $Snap.unit))
; [eval] r.f == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))))
  i@153@01))
; [eval] r.f == i && r.g == 2
; [eval] r.f == i
(set-option :timeout 0)
(push) ; 6
; [then-branch: 37 | First:(PredicateLookup(p2, sm@169@01, List(r@151@01, i@153@01))) != i@153@01 | live]
; [else-branch: 37 | First:(PredicateLookup(p2, sm@169@01, List(r@151@01, i@153@01))) == i@153@01 | live]
(push) ; 7
; [then-branch: 37 | First:(PredicateLookup(p2, sm@169@01, List(r@151@01, i@153@01))) != i@153@01]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 37 | First:(PredicateLookup(p2, sm@169@01, List(r@151@01, i@153@01))) == i@153@01]
; [eval] r.g == 2
(push) ; 8
(assert (not (and (img@167@01 r@151@01) (Seq_contains xs@152@01 (inv@166@01 r@151@01)))))
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
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01))))
(pop) ; 5
; Joined path conditions
(assert (and
  (=>
    (and
      (img@164@01 r@151@01 i@153@01)
      (Seq_contains xs@152@01 (inv@163@01 r@151@01 i@153@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@161@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))))
  (p2%trigger ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01)
  (=
    ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
      ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))))
  (not (= r@151@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)
  (or
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (not
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))))
        i@153@01)))))
(pop) ; 4
(push) ; 4
; [else-branch: 36 | !(i@153@01 > 0)]
(assert (not (> i@153@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> i@153@01 0)
  (and
    (> i@153@01 0)
    (=>
      (and
        (img@164@01 r@151@01 i@153@01)
        (Seq_contains xs@152@01 (inv@163@01 r@151@01 i@153@01)))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@151@01)
              ($SortWrappers.IntTo$Snap i@153@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01)))
          ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@161@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01))))))
    (p2%trigger ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01)
    (=
      ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))
        ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))))
    (not (= r@151@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (or
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))))
        i@153@01)
      (not
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01)))))
          i@153@01))))))
; Joined path conditions
(assert (or (not (> i@153@01 0)) (> i@153@01 0)))
(assert (=>
  (> i@153@01 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@161@01))) r@151@01)
      2))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@161@01))) $Snap.unit))
; [eval] i <= 0 ==> (unfolding acc(p2(r, i), write) in r.f == i && r.g == 4)
; [eval] i <= 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (<= i@153@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<= i@153@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | i@153@01 <= 0 | live]
; [else-branch: 38 | !(i@153@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 38 | i@153@01 <= 0]
(assert (<= i@153@01 0))
; [eval] (unfolding acc(p2(r, i), write) in r.f == i && r.g == 4)
(push) ; 5
; Precomputing data for removing quantified permissions
(define-fun pTaken@171@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r r@151@01) (= i i@153@01))
    ($Perm.min
      (ite
        (and (img@164@01 r i) (Seq_contains xs@152@01 (inv@163@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@164@01 r i) (Seq_contains xs@152@01 (inv@163@01 r i)))
        $Perm.Write
        $Perm.No)
      (pTaken@171@01 r i))
    $Perm.No)
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@171@01 r i) $Perm.No)
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@151@01) (= i i@153@01))
    (= (- $Perm.Write (pTaken@171@01 r i)) $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@164@01 r@151@01 i@153@01)
    (Seq_contains xs@152@01 (inv@163@01 r@151@01 i@153@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@161@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (p2%trigger ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@151@01)
  ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01))
(assert (=
  ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (not (= r@151@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))))
  $Snap.unit))
; [eval] r.f == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))))
  i@153@01))
; [eval] r.f == i && r.g == 4
; [eval] r.f == i
(set-option :timeout 0)
(push) ; 6
; [then-branch: 39 | First:(PredicateLookup(p2, sm@169@01, List(r@151@01, i@153@01))) != i@153@01 | live]
; [else-branch: 39 | First:(PredicateLookup(p2, sm@169@01, List(r@151@01, i@153@01))) == i@153@01 | live]
(push) ; 7
; [then-branch: 39 | First:(PredicateLookup(p2, sm@169@01, List(r@151@01, i@153@01))) != i@153@01]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 39 | First:(PredicateLookup(p2, sm@169@01, List(r@151@01, i@153@01))) == i@153@01]
; [eval] r.g == 4
(push) ; 8
(assert (not (and (img@167@01 r@151@01) (Seq_contains xs@152@01 (inv@166@01 r@151@01)))))
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
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01))))
(pop) ; 5
; Joined path conditions
(assert (and
  (=>
    (and
      (img@164@01 r@151@01 i@153@01)
      (Seq_contains xs@152@01 (inv@163@01 r@151@01 i@153@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@161@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))))
  (p2%trigger ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01)
  (=
    ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
      ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))))
  (not (= r@151@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)
  (or
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (not
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))))
        i@153@01)))))
(pop) ; 4
(push) ; 4
; [else-branch: 38 | !(i@153@01 <= 0)]
(assert (not (<= i@153@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (<= i@153@01 0)
  (and
    (<= i@153@01 0)
    (=>
      (and
        (img@164@01 r@151@01 i@153@01)
        (Seq_contains xs@152@01 (inv@163@01 r@151@01 i@153@01)))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@151@01)
              ($SortWrappers.IntTo$Snap i@153@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01)))
          ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@161@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01))))))
    (p2%trigger ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01)
    (=
      ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))
        ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))))
    (not (= r@151@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (or
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))))
        i@153@01)
      (not
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01)))))
          i@153@01))))))
; Joined path conditions
(assert (or (not (<= i@153@01 0)) (<= i@153@01 0)))
(assert (=>
  (<= i@153@01 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@169@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@161@01))) r@151@01)
      4))))
(pop) ; 2
(push) ; 2
; [eval] i > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> i@153@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> i@153@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | i@153@01 > 0 | live]
; [else-branch: 40 | !(i@153@01 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 40 | i@153@01 > 0]
(assert (> i@153@01 0))
; [exec]
; unfold acc(p2(r, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@172@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r r@151@01) (= i i@153@01))
    ($Perm.min
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
        $Perm.Write
        $Perm.No)
      (pTaken@172@01 r i))
    $Perm.No)
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@172@01 r i) $Perm.No)
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@151@01) (= i i@153@01))
    (= (- $Perm.Write (pTaken@172@01 r i)) $Perm.No))
  
  :qid |quant-u-123|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@173@01 $PSF<p2>)
(declare-const s@174@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@157@01 r@151@01 i@153@01)
    (Seq_contains xs@152@01 (inv@156@01 r@151@01 i@153@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@173@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (=
  ($PSF.lookup_p2 (as sm@173@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p2 (as sm@173@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    ($Snap.second ($PSF.lookup_p2 (as sm@173@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (not (= r@151@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p2 (as sm@173@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))))
  $Snap.unit))
; [eval] r.f == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@173@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))))
  i@153@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($PSF.lookup_p2 (as sm@173@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@151@01)
  ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01))
; [exec]
; assert r.f == i
; [eval] r.f == i
; [exec]
; r.g := 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@175@01 ((r $Ref)) $Perm
  (ite
    (= r r@151@01)
    ($Perm.min
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
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
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@175@01 r))
    $Perm.No)
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@175@01 r) $Perm.No)
  
  :qid |quant-u-126|))))
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
  (=> (= r r@151@01) (= (- $Perm.Write (pTaken@175@01 r)) $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@176@01 $FVF<g>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_g (as sm@176@01  $FVF<g>) r@151@01) 2))
; [exec]
; fold acc(p2(r, i), write)
; [eval] r.f == i
(assert (p2%trigger ($Snap.combine
  ($Snap.first ($PSF.lookup_p2 (as sm@173@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))))
  $Snap.unit) r@151@01 i@153@01))
(declare-const sm@177@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@177@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p2 (as sm@173@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    $Snap.unit)))
(declare-const x@178@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@152@01 x@178@01))
(pop) ; 4
(declare-fun inv@179@01 ($Ref Int) $Ref)
(declare-fun img@180@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@178@01 $Ref) (x2@178@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@152@01 x1@178@01)
      (Seq_contains xs@152@01 x2@178@01)
      (= x1@178@01 x2@178@01))
    (= x1@178@01 x2@178@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@178@01 $Ref)) (!
  (=>
    (Seq_contains xs@152@01 x@178@01)
    (and
      (= (inv@179@01 x@178@01 i@153@01) x@178@01)
      (img@180@01 x@178@01 i@153@01)))
  :pattern ((Seq_contains xs@152@01 x@178@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@178@01))
  :pattern ((inv@179@01 x@178@01 i@153@01))
  :pattern ((img@180@01 x@178@01 i@153@01))
  :qid |p2-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@180@01 r i) (Seq_contains xs@152@01 (inv@179@01 r i)))
    (and (= (inv@179@01 r i) r) (= i@153@01 i)))
  :pattern ((inv@179@01 r i))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@181@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Seq_contains xs@152@01 (inv@179@01 r i))
      (img@180@01 r i)
      (and (= r (inv@179@01 r i)) (= i i@153@01)))
    ($Perm.min
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
        (- $Perm.Write (pTaken@172@01 r i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@182@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Seq_contains xs@152@01 (inv@179@01 r i))
      (img@180@01 r i)
      (and (= r (inv@179@01 r i)) (= i i@153@01)))
    ($Perm.min
      (ite (and (= r r@151@01) (= i i@153@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@181@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
        (- $Perm.Write (pTaken@172@01 r i))
        $Perm.No)
      (pTaken@181@01 r i))
    $Perm.No)
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (Seq_contains xs@152@01 (inv@179@01 r i))
      (img@180@01 r i)
      (and (= r (inv@179@01 r i)) (= i i@153@01)))
    (= (- $Perm.Write (pTaken@181@01 r i)) $Perm.No))
  
  :qid |quant-u-131|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@182@01 r@151@01 i@153@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (Seq_contains xs@152@01 (inv@179@01 r i))
      (img@180@01 r i)
      (and (= r (inv@179@01 r i)) (= i i@153@01)))
    (= (- (- $Perm.Write (pTaken@181@01 r i)) (pTaken@182@01 r i)) $Perm.No))
  
  :qid |quant-u-133|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@183@01 $PSF<p2>)
(declare-const s@184@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@184@01 $Snap)) (!
  (and
    (=>
      (Set_in s@184@01 ($PSF.domain_p2 (as sm@183@01  $PSF<p2>)))
      (and
        (Seq_contains
          xs@152@01
          (inv@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))
        (img@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))))
    (=>
      (and
        (Seq_contains
          xs@152@01
          (inv@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))
        (img@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))
      (Set_in s@184@01 ($PSF.domain_p2 (as sm@183@01  $PSF<p2>)))))
  :pattern ((Set_in s@184@01 ($PSF.domain_p2 (as sm@183@01  $PSF<p2>))))
  :qid |qp.psmDomDef20|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@184@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@152@01
          (inv@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))
        (img@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) r@151@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@184@01)) i@153@01)))
    (and
      (not (= s@184@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@183@01  $PSF<p2>) s@184@01)
        ($PSF.lookup_p2 (as sm@177@01  $PSF<p2>) s@184@01))))
  :pattern (($PSF.lookup_p2 (as sm@183@01  $PSF<p2>) s@184@01))
  :pattern (($PSF.lookup_p2 (as sm@177@01  $PSF<p2>) s@184@01))
  :qid |qp.psmValDef18|)))
(assert (forall ((s@184@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@152@01
          (inv@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))
        (img@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))
      (ite
        (and
          (img@157@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))
          (Seq_contains
            xs@152@01
            (inv@156@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@172@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))))
        false))
    (and
      (not (= s@184@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@183@01  $PSF<p2>) s@184@01)
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) s@184@01))))
  :pattern (($PSF.lookup_p2 (as sm@183@01  $PSF<p2>) s@184@01))
  :pattern (($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) s@184@01))
  :qid |qp.psmValDef19|)))
(declare-const x@185@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@152@01 x@185@01))
(pop) ; 4
(declare-fun inv@186@01 ($Ref) $Ref)
(declare-fun img@187@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@185@01 $Ref) (x2@185@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@152@01 x1@185@01)
      (Seq_contains xs@152@01 x2@185@01)
      (= x1@185@01 x2@185@01))
    (= x1@185@01 x2@185@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@185@01 $Ref)) (!
  (=>
    (Seq_contains xs@152@01 x@185@01)
    (and (= (inv@186@01 x@185@01) x@185@01) (img@187@01 x@185@01)))
  :pattern ((Seq_contains xs@152@01 x@185@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@185@01))
  :pattern ((inv@186@01 x@185@01))
  :pattern ((img@187@01 x@185@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@187@01 r) (Seq_contains xs@152@01 (inv@186@01 r)))
    (= (inv@186@01 r) r))
  :pattern ((inv@186@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@188@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@152@01 (inv@186@01 r))
      (img@187@01 r)
      (= r (inv@186@01 r)))
    ($Perm.min
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@175@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@189@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@152@01 (inv@186@01 r))
      (img@187@01 r)
      (= r (inv@186@01 r)))
    ($Perm.min
      (ite (= r r@151@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@188@01 r)))
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
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@175@01 r))
        $Perm.No)
      (pTaken@188@01 r))
    $Perm.No)
  
  :qid |quant-u-136|))))
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
      (Seq_contains xs@152@01 (inv@186@01 r))
      (img@187@01 r)
      (= r (inv@186@01 r)))
    (= (- $Perm.Write (pTaken@188@01 r)) $Perm.No))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@189@01 r@151@01)) $Perm.No)))
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
      (Seq_contains xs@152@01 (inv@186@01 r))
      (img@187@01 r)
      (= r (inv@186@01 r)))
    (= (- (- $Perm.Write (pTaken@188@01 r)) (pTaken@189@01 r)) $Perm.No))
  
  :qid |quant-u-139|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@190@01 $FVF<g>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_g (as sm@190@01  $FVF<g>)))
      (and (Seq_contains xs@152@01 (inv@186@01 r)) (img@187@01 r)))
    (=>
      (and (Seq_contains xs@152@01 (inv@186@01 r)) (img@187@01 r))
      (Set_in r ($FVF.domain_g (as sm@190@01  $FVF<g>)))))
  :pattern ((Set_in r ($FVF.domain_g (as sm@190@01  $FVF<g>))))
  :qid |qp.fvfDomDef23|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@152@01 (inv@186@01 r)) (img@187@01 r))
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@175@01 r)))
        false))
    (=
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@190@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@152@01 (inv@186@01 r)) (img@187@01 r))
      (= r r@151@01))
    (=
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@176@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@190@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@176@01  $FVF<g>) r))
  :qid |qp.fvfValDef22|)))
; [eval] i > 0 ==> (unfolding acc(p2(r, i), write) in r.f == i && r.g == 2)
; [eval] i > 0
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@153@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | i@153@01 > 0 | live]
; [else-branch: 41 | !(i@153@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 41 | i@153@01 > 0]
; [eval] (unfolding acc(p2(r, i), write) in r.f == i && r.g == 2)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@191@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r r@151@01) (= i i@153@01))
    ($Perm.min
      (ite (and (= r r@151@01) (= i i@153@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@192@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r r@151@01) (= i i@153@01))
    ($Perm.min
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
        (- $Perm.Write (pTaken@172@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@191@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@191@01 r@151@01 i@153@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@151@01) (= i i@153@01))
    (= (- $Perm.Write (pTaken@191@01 r i)) $Perm.No))
  
  :qid |quant-u-142|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@193@01 $PSF<p2>)
(declare-const s@194@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))
    ($PSF.lookup_p2 (as sm@177@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))))
(assert (=>
  (ite
    (and
      (img@157@01 r@151@01 i@153@01)
      (Seq_contains xs@152@01 (inv@156@01 r@151@01 i@153@01)))
    (< $Perm.No (- $Perm.Write (pTaken@172@01 r@151@01 i@153@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (p2%trigger ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@151@01)
  ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01))
(assert (=
  ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    ($Snap.second ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (=
  ($Snap.second ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))))
  $Snap.unit))
; [eval] r.f == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))))
  i@153@01))
; [eval] r.f == i && r.g == 2
; [eval] r.f == i
(set-option :timeout 0)
(push) ; 7
; [then-branch: 42 | First:(PredicateLookup(p2, sm@193@01, List(r@151@01, i@153@01))) != i@153@01 | live]
; [else-branch: 42 | First:(PredicateLookup(p2, sm@193@01, List(r@151@01, i@153@01))) == i@153@01 | live]
(push) ; 8
; [then-branch: 42 | First:(PredicateLookup(p2, sm@193@01, List(r@151@01, i@153@01))) != i@153@01]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 42 | First:(PredicateLookup(p2, sm@193@01, List(r@151@01, i@153@01))) == i@153@01]
; [eval] r.g == 2
(declare-const sm@195@01 $FVF<g>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@175@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@195@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@195@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@151@01)
    (=
      ($FVF.lookup_g (as sm@195@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@176@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@195@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@176@01  $FVF<g>) r))
  :qid |qp.fvfValDef27|)))
(declare-const pm@196@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@196@01  $FPM) r)
    (+
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@175@01 r))
        $Perm.No)
      (ite (= r r@151@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@196@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(push) ; 9
(assert (not (< $Perm.No ($FVF.perm_g (as pm@196@01  $FPM) r@151@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@175@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@195@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@195@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@151@01)
    (=
      ($FVF.lookup_g (as sm@195@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@176@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@195@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@176@01  $FVF<g>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@196@01  $FPM) r)
    (+
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@175@01 r))
        $Perm.No)
      (ite (= r r@151@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@196@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (or
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01))))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@175@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@195@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@195@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@151@01)
    (=
      ($FVF.lookup_g (as sm@195@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@176@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@195@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@176@01  $FVF<g>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@196@01  $FPM) r)
    (+
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@175@01 r))
        $Perm.No)
      (ite (= r r@151@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@196@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))
    ($PSF.lookup_p2 (as sm@177@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
  (=>
    (ite
      (and
        (img@157@01 r@151@01 i@153@01)
        (Seq_contains xs@152@01 (inv@156@01 r@151@01 i@153@01)))
      (< $Perm.No (- $Perm.Write (pTaken@172@01 r@151@01 i@153@01)))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))))
  (p2%trigger ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01)
  (=
    ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
      ($Snap.second ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))))
  (=
    ($Snap.second ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)
  (or
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (not
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))))
        i@153@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@175@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@195@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@195@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@151@01)
    (=
      ($FVF.lookup_g (as sm@195@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@176@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@195@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@176@01  $FVF<g>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@196@01  $FPM) r)
    (+
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@175@01 r))
        $Perm.No)
      (ite (= r r@151@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@196@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (=>
  (> i@153@01 0)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($PSF.lookup_p2 (as sm@177@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
    (=>
      (ite
        (and
          (img@157@01 r@151@01 i@153@01)
          (Seq_contains xs@152@01 (inv@156@01 r@151@01 i@153@01)))
        (< $Perm.No (- $Perm.Write (pTaken@172@01 r@151@01 i@153@01)))
        false)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@151@01)
              ($SortWrappers.IntTo$Snap i@153@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01)))
          ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01))))))
    (p2%trigger ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01)
    (=
      ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))
        ($Snap.second ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))))
    (=
      ($Snap.second ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (or
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))))
        i@153@01)
      (not
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01)))))
          i@153@01))))))
(push) ; 4
(assert (not (=>
  (> i@153@01 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (= ($FVF.lookup_g (as sm@195@01  $FVF<g>) r@151@01) 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (> i@153@01 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@193@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (= ($FVF.lookup_g (as sm@195@01  $FVF<g>) r@151@01) 2))))
; [eval] i <= 0 ==> (unfolding acc(p2(r, i), write) in r.f == i && r.g == 4)
; [eval] i <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= i@153@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | i@153@01 <= 0 | dead]
; [else-branch: 43 | !(i@153@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 43 | !(i@153@01 <= 0)]
(assert (not (<= i@153@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (<= i@153@01 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 40 | !(i@153@01 > 0)]
(assert (not (> i@153@01 0)))
(pop) ; 3
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (> i@153@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> i@153@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | !(i@153@01 > 0) | live]
; [else-branch: 44 | i@153@01 > 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 44 | !(i@153@01 > 0)]
(assert (not (> i@153@01 0)))
; [exec]
; unfold acc(p2(r, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@197@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r r@151@01) (= i i@153@01))
    ($Perm.min
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
        $Perm.Write
        $Perm.No)
      (pTaken@197@01 r i))
    $Perm.No)
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@197@01 r i) $Perm.No)
  
  :qid |quant-u-145|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@151@01) (= i i@153@01))
    (= (- $Perm.Write (pTaken@197@01 r i)) $Perm.No))
  
  :qid |quant-u-146|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@198@01 $PSF<p2>)
(declare-const s@199@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@157@01 r@151@01 i@153@01)
    (Seq_contains xs@152@01 (inv@156@01 r@151@01 i@153@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@198@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (=
  ($PSF.lookup_p2 (as sm@198@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p2 (as sm@198@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    ($Snap.second ($PSF.lookup_p2 (as sm@198@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (not (= r@151@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p2 (as sm@198@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))))
  $Snap.unit))
; [eval] r.f == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@198@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))))
  i@153@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($PSF.lookup_p2 (as sm@198@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@151@01)
  ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01))
; [exec]
; assert r.f == i
; [eval] r.f == i
; [exec]
; r.g := 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@200@01 ((r $Ref)) $Perm
  (ite
    (= r r@151@01)
    ($Perm.min
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
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
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@200@01 r))
    $Perm.No)
  
  :qid |quant-u-148|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@200@01 r) $Perm.No)
  
  :qid |quant-u-149|))))
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
  (=> (= r r@151@01) (= (- $Perm.Write (pTaken@200@01 r)) $Perm.No))
  
  :qid |quant-u-150|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@201@01 $FVF<g>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_g (as sm@201@01  $FVF<g>) r@151@01) 4))
; [exec]
; fold acc(p2(r, i), write)
; [eval] r.f == i
(assert (p2%trigger ($Snap.combine
  ($Snap.first ($PSF.lookup_p2 (as sm@198@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))))
  $Snap.unit) r@151@01 i@153@01))
(declare-const sm@202@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@202@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p2 (as sm@198@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    $Snap.unit)))
(declare-const x@203@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@152@01 x@203@01))
(pop) ; 4
(declare-fun inv@204@01 ($Ref Int) $Ref)
(declare-fun img@205@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@203@01 $Ref) (x2@203@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@152@01 x1@203@01)
      (Seq_contains xs@152@01 x2@203@01)
      (= x1@203@01 x2@203@01))
    (= x1@203@01 x2@203@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@203@01 $Ref)) (!
  (=>
    (Seq_contains xs@152@01 x@203@01)
    (and
      (= (inv@204@01 x@203@01 i@153@01) x@203@01)
      (img@205@01 x@203@01 i@153@01)))
  :pattern ((Seq_contains xs@152@01 x@203@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@203@01))
  :pattern ((inv@204@01 x@203@01 i@153@01))
  :pattern ((img@205@01 x@203@01 i@153@01))
  :qid |p2-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@205@01 r i) (Seq_contains xs@152@01 (inv@204@01 r i)))
    (and (= (inv@204@01 r i) r) (= i@153@01 i)))
  :pattern ((inv@204@01 r i))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@206@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Seq_contains xs@152@01 (inv@204@01 r i))
      (img@205@01 r i)
      (and (= r (inv@204@01 r i)) (= i i@153@01)))
    ($Perm.min
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
        (- $Perm.Write (pTaken@197@01 r i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@207@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Seq_contains xs@152@01 (inv@204@01 r i))
      (img@205@01 r i)
      (and (= r (inv@204@01 r i)) (= i i@153@01)))
    ($Perm.min
      (ite (and (= r r@151@01) (= i i@153@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@206@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
        (- $Perm.Write (pTaken@197@01 r i))
        $Perm.No)
      (pTaken@206@01 r i))
    $Perm.No)
  
  :qid |quant-u-153|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (Seq_contains xs@152@01 (inv@204@01 r i))
      (img@205@01 r i)
      (and (= r (inv@204@01 r i)) (= i i@153@01)))
    (= (- $Perm.Write (pTaken@206@01 r i)) $Perm.No))
  
  :qid |quant-u-154|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@207@01 r@151@01 i@153@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (Seq_contains xs@152@01 (inv@204@01 r i))
      (img@205@01 r i)
      (and (= r (inv@204@01 r i)) (= i i@153@01)))
    (= (- (- $Perm.Write (pTaken@206@01 r i)) (pTaken@207@01 r i)) $Perm.No))
  
  :qid |quant-u-156|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@208@01 $PSF<p2>)
(declare-const s@209@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@209@01 $Snap)) (!
  (and
    (=>
      (Set_in s@209@01 ($PSF.domain_p2 (as sm@208@01  $PSF<p2>)))
      (and
        (Seq_contains
          xs@152@01
          (inv@204@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01))))
        (img@205@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01)))))
    (=>
      (and
        (Seq_contains
          xs@152@01
          (inv@204@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01))))
        (img@205@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01))))
      (Set_in s@209@01 ($PSF.domain_p2 (as sm@208@01  $PSF<p2>)))))
  :pattern ((Set_in s@209@01 ($PSF.domain_p2 (as sm@208@01  $PSF<p2>))))
  :qid |qp.psmDomDef32|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@209@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@152@01
          (inv@204@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01))))
        (img@205@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) r@151@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@209@01)) i@153@01)))
    (and
      (not (= s@209@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@208@01  $PSF<p2>) s@209@01)
        ($PSF.lookup_p2 (as sm@202@01  $PSF<p2>) s@209@01))))
  :pattern (($PSF.lookup_p2 (as sm@208@01  $PSF<p2>) s@209@01))
  :pattern (($PSF.lookup_p2 (as sm@202@01  $PSF<p2>) s@209@01))
  :qid |qp.psmValDef30|)))
(assert (forall ((s@209@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@152@01
          (inv@204@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01))))
        (img@205@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01))))
      (ite
        (and
          (img@157@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01)))
          (Seq_contains
            xs@152@01
            (inv@156@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01)))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@209@01)) ($SortWrappers.$SnapToInt ($Snap.second s@209@01)))))
        false))
    (and
      (not (= s@209@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@208@01  $PSF<p2>) s@209@01)
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) s@209@01))))
  :pattern (($PSF.lookup_p2 (as sm@208@01  $PSF<p2>) s@209@01))
  :pattern (($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) s@209@01))
  :qid |qp.psmValDef31|)))
(declare-const x@210@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@152@01 x@210@01))
(pop) ; 4
(declare-fun inv@211@01 ($Ref) $Ref)
(declare-fun img@212@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@210@01 $Ref) (x2@210@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@152@01 x1@210@01)
      (Seq_contains xs@152@01 x2@210@01)
      (= x1@210@01 x2@210@01))
    (= x1@210@01 x2@210@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@210@01 $Ref)) (!
  (=>
    (Seq_contains xs@152@01 x@210@01)
    (and (= (inv@211@01 x@210@01) x@210@01) (img@212@01 x@210@01)))
  :pattern ((Seq_contains xs@152@01 x@210@01))
  :pattern ((Seq_contains_trigger xs@152@01 x@210@01))
  :pattern ((inv@211@01 x@210@01))
  :pattern ((img@212@01 x@210@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@212@01 r) (Seq_contains xs@152@01 (inv@211@01 r)))
    (= (inv@211@01 r) r))
  :pattern ((inv@211@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@213@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@152@01 (inv@211@01 r))
      (img@212@01 r)
      (= r (inv@211@01 r)))
    ($Perm.min
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@200@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@214@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@152@01 (inv@211@01 r))
      (img@212@01 r)
      (= r (inv@211@01 r)))
    ($Perm.min
      (ite (= r r@151@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@213@01 r)))
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
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@200@01 r))
        $Perm.No)
      (pTaken@213@01 r))
    $Perm.No)
  
  :qid |quant-u-159|))))
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
      (Seq_contains xs@152@01 (inv@211@01 r))
      (img@212@01 r)
      (= r (inv@211@01 r)))
    (= (- $Perm.Write (pTaken@213@01 r)) $Perm.No))
  
  :qid |quant-u-160|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@214@01 r@151@01)) $Perm.No)))
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
      (Seq_contains xs@152@01 (inv@211@01 r))
      (img@212@01 r)
      (= r (inv@211@01 r)))
    (= (- (- $Perm.Write (pTaken@213@01 r)) (pTaken@214@01 r)) $Perm.No))
  
  :qid |quant-u-162|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@215@01 $FVF<g>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_g (as sm@215@01  $FVF<g>)))
      (and (Seq_contains xs@152@01 (inv@211@01 r)) (img@212@01 r)))
    (=>
      (and (Seq_contains xs@152@01 (inv@211@01 r)) (img@212@01 r))
      (Set_in r ($FVF.domain_g (as sm@215@01  $FVF<g>)))))
  :pattern ((Set_in r ($FVF.domain_g (as sm@215@01  $FVF<g>))))
  :qid |qp.fvfDomDef35|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@152@01 (inv@211@01 r)) (img@212@01 r))
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@200@01 r)))
        false))
    (=
      ($FVF.lookup_g (as sm@215@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@215@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@152@01 (inv@211@01 r)) (img@212@01 r))
      (= r r@151@01))
    (=
      ($FVF.lookup_g (as sm@215@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@201@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@215@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@201@01  $FVF<g>) r))
  :qid |qp.fvfValDef34|)))
; [eval] i > 0 ==> (unfolding acc(p2(r, i), write) in r.f == i && r.g == 2)
; [eval] i > 0
(set-option :timeout 0)
(push) ; 4
; [then-branch: 45 | i@153@01 > 0 | dead]
; [else-branch: 45 | !(i@153@01 > 0) | live]
(push) ; 5
; [else-branch: 45 | !(i@153@01 > 0)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] i <= 0 ==> (unfolding acc(p2(r, i), write) in r.f == i && r.g == 4)
; [eval] i <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= i@153@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= i@153@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | i@153@01 <= 0 | live]
; [else-branch: 46 | !(i@153@01 <= 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 46 | i@153@01 <= 0]
(assert (<= i@153@01 0))
; [eval] (unfolding acc(p2(r, i), write) in r.f == i && r.g == 4)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@216@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r r@151@01) (= i i@153@01))
    ($Perm.min
      (ite (and (= r r@151@01) (= i i@153@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@217@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r r@151@01) (= i i@153@01))
    ($Perm.min
      (ite
        (and (img@157@01 r i) (Seq_contains xs@152@01 (inv@156@01 r i)))
        (- $Perm.Write (pTaken@197@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@216@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@216@01 r@151@01 i@153@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@151@01) (= i i@153@01))
    (= (- $Perm.Write (pTaken@216@01 r i)) $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@218@01 $PSF<p2>)
(declare-const s@219@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))
    ($PSF.lookup_p2 (as sm@202@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))))
(assert (=>
  (ite
    (and
      (img@157@01 r@151@01 i@153@01)
      (Seq_contains xs@152@01 (inv@156@01 r@151@01 i@153@01)))
    (< $Perm.No (- $Perm.Write (pTaken@197@01 r@151@01 i@153@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (p2%trigger ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@151@01)
  ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01))
(assert (=
  ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    ($Snap.second ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))))
(assert (=
  ($Snap.second ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))))
  $Snap.unit))
; [eval] r.f == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01)))))
  i@153@01))
; [eval] r.f == i && r.g == 4
; [eval] r.f == i
(set-option :timeout 0)
(push) ; 7
; [then-branch: 47 | First:(PredicateLookup(p2, sm@218@01, List(r@151@01, i@153@01))) != i@153@01 | live]
; [else-branch: 47 | First:(PredicateLookup(p2, sm@218@01, List(r@151@01, i@153@01))) == i@153@01 | live]
(push) ; 8
; [then-branch: 47 | First:(PredicateLookup(p2, sm@218@01, List(r@151@01, i@153@01))) != i@153@01]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 47 | First:(PredicateLookup(p2, sm@218@01, List(r@151@01, i@153@01))) == i@153@01]
; [eval] r.g == 4
(declare-const sm@220@01 $FVF<g>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@200@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@220@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@151@01)
    (=
      ($FVF.lookup_g (as sm@220@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@201@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@201@01  $FVF<g>) r))
  :qid |qp.fvfValDef39|)))
(declare-const pm@221@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@221@01  $FPM) r)
    (+
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@200@01 r))
        $Perm.No)
      (ite (= r r@151@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@221@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(push) ; 9
(assert (not (< $Perm.No ($FVF.perm_g (as pm@221@01  $FPM) r@151@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@200@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@220@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@151@01)
    (=
      ($FVF.lookup_g (as sm@220@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@201@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@201@01  $FVF<g>) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@221@01  $FPM) r)
    (+
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@200@01 r))
        $Perm.No)
      (ite (= r r@151@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@221@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(assert (or
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01))))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@200@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@220@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@151@01)
    (=
      ($FVF.lookup_g (as sm@220@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@201@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@201@01  $FVF<g>) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@221@01  $FPM) r)
    (+
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@200@01 r))
        $Perm.No)
      (ite (= r r@151@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@221@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))
    ($PSF.lookup_p2 (as sm@202@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
  (=>
    (ite
      (and
        (img@157@01 r@151@01 i@153@01)
        (Seq_contains xs@152@01 (inv@156@01 r@151@01 i@153@01)))
      (< $Perm.No (- $Perm.Write (pTaken@197@01 r@151@01 i@153@01)))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))))
  (p2%trigger ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@151@01)
    ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01)
  (=
    ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
      ($Snap.second ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))))
  (=
    ($Snap.second ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01)))))
    i@153@01)
  (or
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (not
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))))
        i@153@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@200@01 r)))
      false)
    (=
      ($FVF.lookup_g (as sm@220@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@154@01))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@151@01)
    (=
      ($FVF.lookup_g (as sm@220@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@201@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@201@01  $FVF<g>) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@221@01  $FPM) r)
    (+
      (ite
        (and (img@160@01 r) (Seq_contains xs@152@01 (inv@159@01 r)))
        (- $Perm.Write (pTaken@200@01 r))
        $Perm.No)
      (ite (= r r@151@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@221@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(assert (=>
  (<= i@153@01 0)
  (and
    (<= i@153@01 0)
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($PSF.lookup_p2 (as sm@202@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
    (=>
      (ite
        (and
          (img@157@01 r@151@01 i@153@01)
          (Seq_contains xs@152@01 (inv@156@01 r@151@01 i@153@01)))
        (< $Perm.No (- $Perm.Write (pTaken@197@01 r@151@01 i@153@01)))
        false)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@151@01)
              ($SortWrappers.IntTo$Snap i@153@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01)))
          ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first ($Snap.second $t@154@01))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01))))))
    (p2%trigger ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@151@01)
      ($SortWrappers.IntTo$Snap i@153@01))) r@151@01 i@153@01)
    (=
      ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))
        ($Snap.second ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01))))))
    (=
      ($Snap.second ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (or
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@151@01)
          ($SortWrappers.IntTo$Snap i@153@01)))))
        i@153@01)
      (not
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@151@01)
            ($SortWrappers.IntTo$Snap i@153@01)))))
          i@153@01))))))
(assert (<= i@153@01 0))
(push) ; 4
(assert (not (=>
  (<= i@153@01 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r@151@01) 4)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= i@153@01 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@218@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@151@01)
        ($SortWrappers.IntTo$Snap i@153@01)))))
      i@153@01)
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r@151@01) 4))))
(pop) ; 3
(push) ; 3
; [else-branch: 44 | i@153@01 > 0]
(assert (> i@153@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
