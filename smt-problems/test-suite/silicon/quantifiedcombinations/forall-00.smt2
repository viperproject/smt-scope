(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:15:57
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr
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
; /field_value_functions_declarations.smt2 [g: Int]
(declare-fun $FVF.domain_g ($FVF<g>) Set<$Ref>)
(declare-fun $FVF.lookup_g ($FVF<g> $Ref) Int)
(declare-fun $FVF.after_g ($FVF<g> $FVF<g>) Bool)
(declare-fun $FVF.loc_g (Int $Ref) Bool)
(declare-fun $FVF.perm_g ($FPM $Ref) $Perm)
(declare-const $fvfTOP_g $FVF<g>)
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
; ---------- m1 ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const xs@1@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const x@2@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@1@01 x@2@01))
(pop) ; 2
(declare-const $t@3@01 $FVF<f>)
(declare-fun inv@4@01 ($Ref) $Ref)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@2@01 $Ref) (x2@2@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@1@01 x1@2@01)
      (Seq_contains xs@1@01 x2@2@01)
      (= x1@2@01 x2@2@01))
    (= x1@2@01 x2@2@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@2@01 $Ref)) (!
  (=>
    (Seq_contains xs@1@01 x@2@01)
    (and (= (inv@4@01 x@2@01) x@2@01) (img@5@01 x@2@01)))
  :pattern ((Seq_contains xs@1@01 x@2@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@2@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@2@01))
  :pattern ((inv@4@01 x@2@01))
  :pattern ((img@5@01 x@2@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@5@01 r) (Seq_contains xs@1@01 (inv@4@01 r))) (= (inv@4@01 r) r))
  :pattern ((inv@4@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@2@01 $Ref)) (!
  (=> (Seq_contains xs@1@01 x@2@01) (not (= x@2@01 $Ref.null)))
  :pattern ((Seq_contains xs@1@01 x@2@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@2@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@2@01))
  :pattern ((inv@4@01 x@2@01))
  :pattern ((img@5@01 x@2@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@6@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@1@01 x@6@01))
(pop) ; 3
(declare-const $t@7@01 $FVF<f>)
(declare-fun inv@8@01 ($Ref) $Ref)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@6@01 $Ref) (x2@6@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@1@01 x1@6@01)
      (Seq_contains xs@1@01 x2@6@01)
      (= x1@6@01 x2@6@01))
    (= x1@6@01 x2@6@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@6@01 $Ref)) (!
  (=>
    (Seq_contains xs@1@01 x@6@01)
    (and (= (inv@8@01 x@6@01) x@6@01) (img@9@01 x@6@01)))
  :pattern ((Seq_contains xs@1@01 x@6@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@6@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@6@01))
  :pattern ((inv@8@01 x@6@01))
  :pattern ((img@9@01 x@6@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@9@01 r) (Seq_contains xs@1@01 (inv@8@01 r))) (= (inv@8@01 r) r))
  :pattern ((inv@8@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@6@01 $Ref)) (!
  (=> (Seq_contains xs@1@01 x@6@01) (not (= x@6@01 $Ref.null)))
  :pattern ((Seq_contains xs@1@01 x@6@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@6@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@6@01))
  :pattern ((inv@8@01 x@6@01))
  :pattern ((img@9@01 x@6@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@10@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@1@01 x@10@01))
(pop) ; 3
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@10@01 $Ref) (x2@10@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@1@01 x1@10@01)
      (Seq_contains xs@1@01 x2@10@01)
      (= x1@10@01 x2@10@01))
    (= x1@10@01 x2@10@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@10@01 $Ref)) (!
  (=>
    (Seq_contains xs@1@01 x@10@01)
    (and (= (inv@11@01 x@10@01) x@10@01) (img@12@01 x@10@01)))
  :pattern ((Seq_contains xs@1@01 x@10@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@10@01))
  :pattern ((inv@11@01 x@10@01))
  :pattern ((img@12@01 x@10@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (Seq_contains xs@1@01 (inv@11@01 r)))
    (= (inv@11@01 r) r))
  :pattern ((inv@11@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@13@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@1@01 (inv@11@01 r)) (img@12@01 r) (= r (inv@11@01 r)))
    ($Perm.min
      (ite
        (and (img@5@01 r) (Seq_contains xs@1@01 (inv@4@01 r)))
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
        (and (img@5@01 r) (Seq_contains xs@1@01 (inv@4@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@13@01 r))
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
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Seq_contains xs@1@01 (inv@11@01 r)) (img@12@01 r) (= r (inv@11@01 r)))
    (= (- $Perm.Write (pTaken@13@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@14@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@5@01 r) (Seq_contains xs@1@01 (inv@4@01 r)))
    (= ($FVF.lookup_f (as sm@14@01  $FVF<f>) r) ($FVF.lookup_f $t@3@01 r)))
  :pattern (($FVF.lookup_f (as sm@14@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@3@01 r))
  :qid |qp.fvfValDef0|)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const xs@15@01 Seq<$Ref>)
(declare-const xs@16@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const x@17@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@16@01 x@17@01))
(pop) ; 2
(declare-const $t@18@01 $PSF<pred>)
(declare-fun inv@19@01 ($Ref) $Ref)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@17@01 $Ref) (x2@17@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@16@01 x1@17@01)
      (Seq_contains xs@16@01 x2@17@01)
      (= x1@17@01 x2@17@01))
    (= x1@17@01 x2@17@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@17@01 $Ref)) (!
  (=>
    (Seq_contains xs@16@01 x@17@01)
    (and (= (inv@19@01 x@17@01) x@17@01) (img@20@01 x@17@01)))
  :pattern ((Seq_contains xs@16@01 x@17@01))
  :pattern ((Seq_contains_trigger xs@16@01 x@17@01))
  :pattern ((Seq_contains_trigger xs@16@01 x@17@01))
  :pattern ((inv@19@01 x@17@01))
  :pattern ((img@20@01 x@17@01))
  :qid |quant-u-9|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@20@01 x) (Seq_contains xs@16@01 (inv@19@01 x)))
    (= (inv@19@01 x) x))
  :pattern ((inv@19@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@21@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@16@01 x@21@01))
(pop) ; 3
(declare-const $t@22@01 $PSF<pred>)
(declare-fun inv@23@01 ($Ref) $Ref)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@21@01 $Ref) (x2@21@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@16@01 x1@21@01)
      (Seq_contains xs@16@01 x2@21@01)
      (= x1@21@01 x2@21@01))
    (= x1@21@01 x2@21@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@21@01 $Ref)) (!
  (=>
    (Seq_contains xs@16@01 x@21@01)
    (and (= (inv@23@01 x@21@01) x@21@01) (img@24@01 x@21@01)))
  :pattern ((Seq_contains xs@16@01 x@21@01))
  :pattern ((Seq_contains_trigger xs@16@01 x@21@01))
  :pattern ((Seq_contains_trigger xs@16@01 x@21@01))
  :pattern ((inv@23@01 x@21@01))
  :pattern ((img@24@01 x@21@01))
  :qid |quant-u-11|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@24@01 x) (Seq_contains xs@16@01 (inv@23@01 x)))
    (= (inv@23@01 x) x))
  :pattern ((inv@23@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const x@25@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@16@01 x@25@01))
(pop) ; 3
(declare-fun inv@26@01 ($Ref) $Ref)
(declare-fun img@27@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@25@01 $Ref) (x2@25@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@16@01 x1@25@01)
      (Seq_contains xs@16@01 x2@25@01)
      (= x1@25@01 x2@25@01))
    (= x1@25@01 x2@25@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@25@01 $Ref)) (!
  (=>
    (Seq_contains xs@16@01 x@25@01)
    (and (= (inv@26@01 x@25@01) x@25@01) (img@27@01 x@25@01)))
  :pattern ((Seq_contains xs@16@01 x@25@01))
  :pattern ((Seq_contains_trigger xs@16@01 x@25@01))
  :pattern ((inv@26@01 x@25@01))
  :pattern ((img@27@01 x@25@01))
  :qid |pred-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@27@01 x) (Seq_contains xs@16@01 (inv@26@01 x)))
    (= (inv@26@01 x) x))
  :pattern ((inv@26@01 x))
  :qid |pred-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@28@01 ((x $Ref)) $Perm
  (ite
    (and (Seq_contains xs@16@01 (inv@26@01 x)) (img@27@01 x) (= x (inv@26@01 x)))
    ($Perm.min
      (ite
        (and (img@20@01 x) (Seq_contains xs@16@01 (inv@19@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@20@01 x) (Seq_contains xs@16@01 (inv@19@01 x)))
        $Perm.Write
        $Perm.No)
      (pTaken@28@01 x))
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
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Seq_contains xs@16@01 (inv@26@01 x)) (img@27@01 x) (= x (inv@26@01 x)))
    (= (- $Perm.Write (pTaken@28@01 x)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@29@01 $PSF<pred>)
(declare-const s@30@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@30@01 $Snap)) (!
  (=>
    (and
      (img@20@01 ($SortWrappers.$SnapTo$Ref s@30@01))
      (Seq_contains xs@16@01 (inv@19@01 ($SortWrappers.$SnapTo$Ref s@30@01))))
    (and
      (not (= s@30@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@29@01  $PSF<pred>) s@30@01)
        ($PSF.lookup_pred $t@18@01 s@30@01))))
  :pattern (($PSF.lookup_pred (as sm@29@01  $PSF<pred>) s@30@01))
  :pattern (($PSF.lookup_pred $t@18@01 s@30@01))
  :qid |qp.psmValDef1|)))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const xs@31@01 Seq<$Ref>)
(declare-const xs@32@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(declare-const x@34@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@32@01 x@34@01))
(pop) ; 2
(declare-fun inv@35@01 ($Ref) $Ref)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@34@01 $Ref) (x2@34@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@32@01 x1@34@01)
      (Seq_contains xs@32@01 x2@34@01)
      (= x1@34@01 x2@34@01))
    (= x1@34@01 x2@34@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@34@01 $Ref)) (!
  (=>
    (Seq_contains xs@32@01 x@34@01)
    (and (= (inv@35@01 x@34@01) x@34@01) (img@36@01 x@34@01)))
  :pattern ((Seq_contains xs@32@01 x@34@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@34@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@34@01))
  :pattern ((inv@35@01 x@34@01))
  :pattern ((img@36@01 x@34@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (Seq_contains xs@32@01 (inv@35@01 r)))
    (= (inv@35@01 r) r))
  :pattern ((inv@35@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@34@01 $Ref)) (!
  (=> (Seq_contains xs@32@01 x@34@01) (not (= x@34@01 $Ref.null)))
  :pattern ((Seq_contains xs@32@01 x@34@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@34@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@34@01))
  :pattern ((inv@35@01 x@34@01))
  :pattern ((img@36@01 x@34@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@37@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@32@01 x@37@01))
(pop) ; 2
(declare-fun inv@38@01 ($Ref) $Ref)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@37@01 $Ref) (x2@37@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@32@01 x1@37@01)
      (Seq_contains xs@32@01 x2@37@01)
      (= x1@37@01 x2@37@01))
    (= x1@37@01 x2@37@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@37@01 $Ref)) (!
  (=>
    (Seq_contains xs@32@01 x@37@01)
    (and (= (inv@38@01 x@37@01) x@37@01) (img@39@01 x@37@01)))
  :pattern ((Seq_contains xs@32@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@37@01))
  :pattern ((inv@38@01 x@37@01))
  :pattern ((img@39@01 x@37@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (Seq_contains xs@32@01 (inv@38@01 r)))
    (= (inv@38@01 r) r))
  :pattern ((inv@38@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@37@01 $Ref)) (!
  (=> (Seq_contains xs@32@01 x@37@01) (not (= x@37@01 $Ref.null)))
  :pattern ((Seq_contains xs@32@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@37@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@37@01))
  :pattern ((inv@38@01 x@37@01))
  :pattern ((img@39@01 x@37@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 ($Snap.combine ($Snap.first $t@40@01) ($Snap.second $t@40@01))))
(declare-const x@41@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@32@01 x@41@01))
(pop) ; 3
(declare-fun inv@42@01 ($Ref) $Ref)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@41@01 $Ref) (x2@41@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@32@01 x1@41@01)
      (Seq_contains xs@32@01 x2@41@01)
      (= x1@41@01 x2@41@01))
    (= x1@41@01 x2@41@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@41@01 $Ref)) (!
  (=>
    (Seq_contains xs@32@01 x@41@01)
    (and (= (inv@42@01 x@41@01) x@41@01) (img@43@01 x@41@01)))
  :pattern ((Seq_contains xs@32@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@41@01))
  :pattern ((inv@42@01 x@41@01))
  :pattern ((img@43@01 x@41@01))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@43@01 r) (Seq_contains xs@32@01 (inv@42@01 r)))
    (= (inv@42@01 r) r))
  :pattern ((inv@42@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@41@01 $Ref)) (!
  (=> (Seq_contains xs@32@01 x@41@01) (not (= x@41@01 $Ref.null)))
  :pattern ((Seq_contains xs@32@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@41@01))
  :pattern ((inv@42@01 x@41@01))
  :pattern ((img@43@01 x@41@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@44@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@32@01 x@44@01))
(pop) ; 3
(declare-fun inv@45@01 ($Ref) $Ref)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@44@01 $Ref) (x2@44@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@32@01 x1@44@01)
      (Seq_contains xs@32@01 x2@44@01)
      (= x1@44@01 x2@44@01))
    (= x1@44@01 x2@44@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@44@01 $Ref)) (!
  (=>
    (Seq_contains xs@32@01 x@44@01)
    (and (= (inv@45@01 x@44@01) x@44@01) (img@46@01 x@44@01)))
  :pattern ((Seq_contains xs@32@01 x@44@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@44@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@44@01))
  :pattern ((inv@45@01 x@44@01))
  :pattern ((img@46@01 x@44@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@46@01 r) (Seq_contains xs@32@01 (inv@45@01 r)))
    (= (inv@45@01 r) r))
  :pattern ((inv@45@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@44@01 $Ref)) (!
  (=> (Seq_contains xs@32@01 x@44@01) (not (= x@44@01 $Ref.null)))
  :pattern ((Seq_contains xs@32@01 x@44@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@44@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@44@01))
  :pattern ((inv@45@01 x@44@01))
  :pattern ((img@46@01 x@44@01))
  :qid |g-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@47@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@32@01 x@47@01))
(pop) ; 3
(declare-fun inv@48@01 ($Ref) $Ref)
(declare-fun img@49@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@47@01 $Ref) (x2@47@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@32@01 x1@47@01)
      (Seq_contains xs@32@01 x2@47@01)
      (= x1@47@01 x2@47@01))
    (= x1@47@01 x2@47@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@47@01 $Ref)) (!
  (=>
    (Seq_contains xs@32@01 x@47@01)
    (and (= (inv@48@01 x@47@01) x@47@01) (img@49@01 x@47@01)))
  :pattern ((Seq_contains xs@32@01 x@47@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@47@01))
  :pattern ((inv@48@01 x@47@01))
  :pattern ((img@49@01 x@47@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@49@01 r) (Seq_contains xs@32@01 (inv@48@01 r)))
    (= (inv@48@01 r) r))
  :pattern ((inv@48@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@32@01 (inv@48@01 r)) (img@49@01 r) (= r (inv@48@01 r)))
    ($Perm.min
      (ite
        (and (img@36@01 r) (Seq_contains xs@32@01 (inv@35@01 r)))
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
        (and (img@36@01 r) (Seq_contains xs@32@01 (inv@35@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@50@01 r))
    $Perm.No)
  
  :qid |quant-u-26|))))
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
    (and (Seq_contains xs@32@01 (inv@48@01 r)) (img@49@01 r) (= r (inv@48@01 r)))
    (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@51@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (Seq_contains xs@32@01 (inv@35@01 r)))
    (=
      ($FVF.lookup_f (as sm@51@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@33@01)) r)))
  :pattern (($FVF.lookup_f (as sm@51@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@33@01)) r))
  :qid |qp.fvfValDef2|)))
(declare-const x@52@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@32@01 x@52@01))
(pop) ; 3
(declare-fun inv@53@01 ($Ref) $Ref)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@52@01 $Ref) (x2@52@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@32@01 x1@52@01)
      (Seq_contains xs@32@01 x2@52@01)
      (= x1@52@01 x2@52@01))
    (= x1@52@01 x2@52@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@52@01 $Ref)) (!
  (=>
    (Seq_contains xs@32@01 x@52@01)
    (and (= (inv@53@01 x@52@01) x@52@01) (img@54@01 x@52@01)))
  :pattern ((Seq_contains xs@32@01 x@52@01))
  :pattern ((Seq_contains_trigger xs@32@01 x@52@01))
  :pattern ((inv@53@01 x@52@01))
  :pattern ((img@54@01 x@52@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@54@01 r) (Seq_contains xs@32@01 (inv@53@01 r)))
    (= (inv@53@01 r) r))
  :pattern ((inv@53@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@32@01 (inv@53@01 r)) (img@54@01 r) (= r (inv@53@01 r)))
    ($Perm.min
      (ite
        (and (img@39@01 r) (Seq_contains xs@32@01 (inv@38@01 r)))
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
        (and (img@39@01 r) (Seq_contains xs@32@01 (inv@38@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@55@01 r))
    $Perm.No)
  
  :qid |quant-u-30|))))
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
    (and (Seq_contains xs@32@01 (inv@53@01 r)) (img@54@01 r) (= r (inv@53@01 r)))
    (= (- $Perm.Write (pTaken@55@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@56@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (Seq_contains xs@32@01 (inv@38@01 r)))
    (=
      ($FVF.lookup_g (as sm@56@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second $t@33@01)) r)))
  :pattern (($FVF.lookup_g (as sm@56@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second $t@33@01)) r))
  :qid |qp.fvfValDef3|)))
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const xs@57@01 Seq<$Ref>)
(declare-const xs@58@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 ($Snap.combine ($Snap.first $t@59@01) ($Snap.second $t@59@01))))
(declare-const x@60@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@58@01 x@60@01))
(pop) ; 2
(declare-fun inv@61@01 ($Ref) $Ref)
(declare-fun img@62@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@60@01 $Ref) (x2@60@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@58@01 x1@60@01)
      (Seq_contains xs@58@01 x2@60@01)
      (= x1@60@01 x2@60@01))
    (= x1@60@01 x2@60@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@60@01 $Ref)) (!
  (=>
    (Seq_contains xs@58@01 x@60@01)
    (and (= (inv@61@01 x@60@01) x@60@01) (img@62@01 x@60@01)))
  :pattern ((Seq_contains xs@58@01 x@60@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@60@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@60@01))
  :pattern ((inv@61@01 x@60@01))
  :pattern ((img@62@01 x@60@01))
  :qid |quant-u-33|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@62@01 x) (Seq_contains xs@58@01 (inv@61@01 x)))
    (= (inv@61@01 x) x))
  :pattern ((inv@61@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(declare-const x@63@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@58@01 x@63@01))
(pop) ; 2
(declare-fun inv@64@01 ($Ref) $Ref)
(declare-fun img@65@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@63@01 $Ref) (x2@63@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@58@01 x1@63@01)
      (Seq_contains xs@58@01 x2@63@01)
      (= x1@63@01 x2@63@01))
    (= x1@63@01 x2@63@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@63@01 $Ref)) (!
  (=>
    (Seq_contains xs@58@01 x@63@01)
    (and (= (inv@64@01 x@63@01) x@63@01) (img@65@01 x@63@01)))
  :pattern ((Seq_contains xs@58@01 x@63@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@63@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@63@01))
  :pattern ((inv@64@01 x@63@01))
  :pattern ((img@65@01 x@63@01))
  :qid |quant-u-35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@65@01 r) (Seq_contains xs@58@01 (inv@64@01 r)))
    (= (inv@64@01 r) r))
  :pattern ((inv@64@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@63@01 $Ref)) (!
  (=> (Seq_contains xs@58@01 x@63@01) (not (= x@63@01 $Ref.null)))
  :pattern ((Seq_contains xs@58@01 x@63@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@63@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@63@01))
  :pattern ((inv@64@01 x@63@01))
  :pattern ((img@65@01 x@63@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 ($Snap.combine ($Snap.first $t@66@01) ($Snap.second $t@66@01))))
(declare-const x@67@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@58@01 x@67@01))
(pop) ; 3
(declare-fun inv@68@01 ($Ref) $Ref)
(declare-fun img@69@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@67@01 $Ref) (x2@67@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@58@01 x1@67@01)
      (Seq_contains xs@58@01 x2@67@01)
      (= x1@67@01 x2@67@01))
    (= x1@67@01 x2@67@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@67@01 $Ref)) (!
  (=>
    (Seq_contains xs@58@01 x@67@01)
    (and (= (inv@68@01 x@67@01) x@67@01) (img@69@01 x@67@01)))
  :pattern ((Seq_contains xs@58@01 x@67@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@67@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@67@01))
  :pattern ((inv@68@01 x@67@01))
  :pattern ((img@69@01 x@67@01))
  :qid |quant-u-37|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@69@01 x) (Seq_contains xs@58@01 (inv@68@01 x)))
    (= (inv@68@01 x) x))
  :pattern ((inv@68@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(declare-const x@70@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@58@01 x@70@01))
(pop) ; 3
(declare-fun inv@71@01 ($Ref) $Ref)
(declare-fun img@72@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@70@01 $Ref) (x2@70@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@58@01 x1@70@01)
      (Seq_contains xs@58@01 x2@70@01)
      (= x1@70@01 x2@70@01))
    (= x1@70@01 x2@70@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@70@01 $Ref)) (!
  (=>
    (Seq_contains xs@58@01 x@70@01)
    (and (= (inv@71@01 x@70@01) x@70@01) (img@72@01 x@70@01)))
  :pattern ((Seq_contains xs@58@01 x@70@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@70@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@70@01))
  :pattern ((inv@71@01 x@70@01))
  :pattern ((img@72@01 x@70@01))
  :qid |quant-u-39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@72@01 r) (Seq_contains xs@58@01 (inv@71@01 r)))
    (= (inv@71@01 r) r))
  :pattern ((inv@71@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@70@01 $Ref)) (!
  (=> (Seq_contains xs@58@01 x@70@01) (not (= x@70@01 $Ref.null)))
  :pattern ((Seq_contains xs@58@01 x@70@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@70@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@70@01))
  :pattern ((inv@71@01 x@70@01))
  :pattern ((img@72@01 x@70@01))
  :qid |g-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@73@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@58@01 x@73@01))
(pop) ; 3
(declare-fun inv@74@01 ($Ref) $Ref)
(declare-fun img@75@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@73@01 $Ref) (x2@73@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@58@01 x1@73@01)
      (Seq_contains xs@58@01 x2@73@01)
      (= x1@73@01 x2@73@01))
    (= x1@73@01 x2@73@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@73@01 $Ref)) (!
  (=>
    (Seq_contains xs@58@01 x@73@01)
    (and (= (inv@74@01 x@73@01) x@73@01) (img@75@01 x@73@01)))
  :pattern ((Seq_contains xs@58@01 x@73@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@73@01))
  :pattern ((inv@74@01 x@73@01))
  :pattern ((img@75@01 x@73@01))
  :qid |pred-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@75@01 x) (Seq_contains xs@58@01 (inv@74@01 x)))
    (= (inv@74@01 x) x))
  :pattern ((inv@74@01 x))
  :qid |pred-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@76@01 ((x $Ref)) $Perm
  (ite
    (and (Seq_contains xs@58@01 (inv@74@01 x)) (img@75@01 x) (= x (inv@74@01 x)))
    ($Perm.min
      (ite
        (and (img@62@01 x) (Seq_contains xs@58@01 (inv@61@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@62@01 x) (Seq_contains xs@58@01 (inv@61@01 x)))
        $Perm.Write
        $Perm.No)
      (pTaken@76@01 x))
    $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Seq_contains xs@58@01 (inv@74@01 x)) (img@75@01 x) (= x (inv@74@01 x)))
    (= (- $Perm.Write (pTaken@76@01 x)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@77@01 $PSF<pred>)
(declare-const s@78@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@78@01 $Snap)) (!
  (=>
    (and
      (img@62@01 ($SortWrappers.$SnapTo$Ref s@78@01))
      (Seq_contains xs@58@01 (inv@61@01 ($SortWrappers.$SnapTo$Ref s@78@01))))
    (and
      (not (= s@78@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@77@01  $PSF<pred>) s@78@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@59@01)) s@78@01))))
  :pattern (($PSF.lookup_pred (as sm@77@01  $PSF<pred>) s@78@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@59@01)) s@78@01))
  :qid |qp.psmValDef4|)))
(declare-const x@79@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@58@01 x@79@01))
(pop) ; 3
(declare-fun inv@80@01 ($Ref) $Ref)
(declare-fun img@81@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@79@01 $Ref) (x2@79@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@58@01 x1@79@01)
      (Seq_contains xs@58@01 x2@79@01)
      (= x1@79@01 x2@79@01))
    (= x1@79@01 x2@79@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@79@01 $Ref)) (!
  (=>
    (Seq_contains xs@58@01 x@79@01)
    (and (= (inv@80@01 x@79@01) x@79@01) (img@81@01 x@79@01)))
  :pattern ((Seq_contains xs@58@01 x@79@01))
  :pattern ((Seq_contains_trigger xs@58@01 x@79@01))
  :pattern ((inv@80@01 x@79@01))
  :pattern ((img@81@01 x@79@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@81@01 r) (Seq_contains xs@58@01 (inv@80@01 r)))
    (= (inv@80@01 r) r))
  :pattern ((inv@80@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@82@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@58@01 (inv@80@01 r)) (img@81@01 r) (= r (inv@80@01 r)))
    ($Perm.min
      (ite
        (and (img@65@01 r) (Seq_contains xs@58@01 (inv@64@01 r)))
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
        (and (img@65@01 r) (Seq_contains xs@58@01 (inv@64@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@82@01 r))
    $Perm.No)
  
  :qid |quant-u-46|))))
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
    (and (Seq_contains xs@58@01 (inv@80@01 r)) (img@81@01 r) (= r (inv@80@01 r)))
    (= (- $Perm.Write (pTaken@82@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@83@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@65@01 r) (Seq_contains xs@58@01 (inv@64@01 r)))
    (=
      ($FVF.lookup_g (as sm@83@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second $t@59@01)) r)))
  :pattern (($FVF.lookup_g (as sm@83@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second $t@59@01)) r))
  :qid |qp.fvfValDef5|)))
(pop) ; 2
(pop) ; 1
; ---------- m5 ----------
(declare-const xs@84@01 Seq<$Ref>)
(declare-const xs@85@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@86@01 $Snap)
(assert (= $t@86@01 ($Snap.combine ($Snap.first $t@86@01) ($Snap.second $t@86@01))))
(declare-const x@87@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@85@01 x@87@01))
(pop) ; 2
(declare-fun inv@88@01 ($Ref) $Ref)
(declare-fun img@89@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@87@01 $Ref) (x2@87@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@85@01 x1@87@01)
      (Seq_contains xs@85@01 x2@87@01)
      (= x1@87@01 x2@87@01))
    (= x1@87@01 x2@87@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@87@01 $Ref)) (!
  (=>
    (Seq_contains xs@85@01 x@87@01)
    (and (= (inv@88@01 x@87@01) x@87@01) (img@89@01 x@87@01)))
  :pattern ((Seq_contains xs@85@01 x@87@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@87@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@87@01))
  :pattern ((inv@88@01 x@87@01))
  :pattern ((img@89@01 x@87@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@89@01 r) (Seq_contains xs@85@01 (inv@88@01 r)))
    (= (inv@88@01 r) r))
  :pattern ((inv@88@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@87@01 $Ref)) (!
  (=> (Seq_contains xs@85@01 x@87@01) (not (= x@87@01 $Ref.null)))
  :pattern ((Seq_contains xs@85@01 x@87@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@87@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@87@01))
  :pattern ((inv@88@01 x@87@01))
  :pattern ((img@89@01 x@87@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@90@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@85@01 x@90@01))
(pop) ; 2
(declare-fun inv@91@01 ($Ref) $Ref)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@90@01 $Ref) (x2@90@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@85@01 x1@90@01)
      (Seq_contains xs@85@01 x2@90@01)
      (= x1@90@01 x2@90@01))
    (= x1@90@01 x2@90@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@90@01 $Ref)) (!
  (=>
    (Seq_contains xs@85@01 x@90@01)
    (and (= (inv@91@01 x@90@01) x@90@01) (img@92@01 x@90@01)))
  :pattern ((Seq_contains xs@85@01 x@90@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@90@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@90@01))
  :pattern ((inv@91@01 x@90@01))
  :pattern ((img@92@01 x@90@01))
  :qid |quant-u-51|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@92@01 x) (Seq_contains xs@85@01 (inv@91@01 x)))
    (= (inv@91@01 x) x))
  :pattern ((inv@91@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
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
; [eval] (x in xs)
(assert (Seq_contains xs@85@01 x@94@01))
(pop) ; 3
(declare-fun inv@95@01 ($Ref) $Ref)
(declare-fun img@96@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@94@01 $Ref) (x2@94@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@85@01 x1@94@01)
      (Seq_contains xs@85@01 x2@94@01)
      (= x1@94@01 x2@94@01))
    (= x1@94@01 x2@94@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@94@01 $Ref)) (!
  (=>
    (Seq_contains xs@85@01 x@94@01)
    (and (= (inv@95@01 x@94@01) x@94@01) (img@96@01 x@94@01)))
  :pattern ((Seq_contains xs@85@01 x@94@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@94@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@94@01))
  :pattern ((inv@95@01 x@94@01))
  :pattern ((img@96@01 x@94@01))
  :qid |quant-u-53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@96@01 r) (Seq_contains xs@85@01 (inv@95@01 r)))
    (= (inv@95@01 r) r))
  :pattern ((inv@95@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@94@01 $Ref)) (!
  (=> (Seq_contains xs@85@01 x@94@01) (not (= x@94@01 $Ref.null)))
  :pattern ((Seq_contains xs@85@01 x@94@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@94@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@94@01))
  :pattern ((inv@95@01 x@94@01))
  :pattern ((img@96@01 x@94@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@97@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@85@01 x@97@01))
(pop) ; 3
(declare-fun inv@98@01 ($Ref) $Ref)
(declare-fun img@99@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@97@01 $Ref) (x2@97@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@85@01 x1@97@01)
      (Seq_contains xs@85@01 x2@97@01)
      (= x1@97@01 x2@97@01))
    (= x1@97@01 x2@97@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@97@01 $Ref)) (!
  (=>
    (Seq_contains xs@85@01 x@97@01)
    (and (= (inv@98@01 x@97@01) x@97@01) (img@99@01 x@97@01)))
  :pattern ((Seq_contains xs@85@01 x@97@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@97@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@97@01))
  :pattern ((inv@98@01 x@97@01))
  :pattern ((img@99@01 x@97@01))
  :qid |quant-u-55|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@99@01 x) (Seq_contains xs@85@01 (inv@98@01 x)))
    (= (inv@98@01 x) x))
  :pattern ((inv@98@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const x@100@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@85@01 x@100@01))
(pop) ; 3
(declare-fun inv@101@01 ($Ref) $Ref)
(declare-fun img@102@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@100@01 $Ref) (x2@100@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@85@01 x1@100@01)
      (Seq_contains xs@85@01 x2@100@01)
      (= x1@100@01 x2@100@01))
    (= x1@100@01 x2@100@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@100@01 $Ref)) (!
  (=>
    (Seq_contains xs@85@01 x@100@01)
    (and (= (inv@101@01 x@100@01) x@100@01) (img@102@01 x@100@01)))
  :pattern ((Seq_contains xs@85@01 x@100@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@100@01))
  :pattern ((inv@101@01 x@100@01))
  :pattern ((img@102@01 x@100@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@102@01 r) (Seq_contains xs@85@01 (inv@101@01 r)))
    (= (inv@101@01 r) r))
  :pattern ((inv@101@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@103@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@85@01 (inv@101@01 r))
      (img@102@01 r)
      (= r (inv@101@01 r)))
    ($Perm.min
      (ite
        (and (img@89@01 r) (Seq_contains xs@85@01 (inv@88@01 r)))
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
        (and (img@89@01 r) (Seq_contains xs@85@01 (inv@88@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@103@01 r))
    $Perm.No)
  
  :qid |quant-u-58|))))
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
      (Seq_contains xs@85@01 (inv@101@01 r))
      (img@102@01 r)
      (= r (inv@101@01 r)))
    (= (- $Perm.Write (pTaken@103@01 r)) $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@104@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@89@01 r) (Seq_contains xs@85@01 (inv@88@01 r)))
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@86@01)) r)))
  :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@86@01)) r))
  :qid |qp.fvfValDef6|)))
(declare-const x@105@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@85@01 x@105@01))
(pop) ; 3
(declare-fun inv@106@01 ($Ref) $Ref)
(declare-fun img@107@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@105@01 $Ref) (x2@105@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@85@01 x1@105@01)
      (Seq_contains xs@85@01 x2@105@01)
      (= x1@105@01 x2@105@01))
    (= x1@105@01 x2@105@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@105@01 $Ref)) (!
  (=>
    (Seq_contains xs@85@01 x@105@01)
    (and (= (inv@106@01 x@105@01) x@105@01) (img@107@01 x@105@01)))
  :pattern ((Seq_contains xs@85@01 x@105@01))
  :pattern ((Seq_contains_trigger xs@85@01 x@105@01))
  :pattern ((inv@106@01 x@105@01))
  :pattern ((img@107@01 x@105@01))
  :qid |pred-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@107@01 x) (Seq_contains xs@85@01 (inv@106@01 x)))
    (= (inv@106@01 x) x))
  :pattern ((inv@106@01 x))
  :qid |pred-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@108@01 ((x $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@85@01 (inv@106@01 x))
      (img@107@01 x)
      (= x (inv@106@01 x)))
    ($Perm.min
      (ite
        (and (img@92@01 x) (Seq_contains xs@85@01 (inv@91@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@92@01 x) (Seq_contains xs@85@01 (inv@91@01 x)))
        $Perm.Write
        $Perm.No)
      (pTaken@108@01 x))
    $Perm.No)
  
  :qid |quant-u-62|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Seq_contains xs@85@01 (inv@106@01 x))
      (img@107@01 x)
      (= x (inv@106@01 x)))
    (= (- $Perm.Write (pTaken@108@01 x)) $Perm.No))
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@109@01 $PSF<pred>)
(declare-const s@110@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@110@01 $Snap)) (!
  (=>
    (and
      (img@92@01 ($SortWrappers.$SnapTo$Ref s@110@01))
      (Seq_contains xs@85@01 (inv@91@01 ($SortWrappers.$SnapTo$Ref s@110@01))))
    (and
      (not (= s@110@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@109@01  $PSF<pred>) s@110@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@86@01)) s@110@01))))
  :pattern (($PSF.lookup_pred (as sm@109@01  $PSF<pred>) s@110@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@86@01)) s@110@01))
  :qid |qp.psmValDef7|)))
(pop) ; 2
(pop) ; 1
; ---------- m6 ----------
(declare-const xs@111@01 Seq<$Ref>)
(declare-const xs@112@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@113@01 $Snap)
(assert (= $t@113@01 ($Snap.combine ($Snap.first $t@113@01) ($Snap.second $t@113@01))))
(declare-const x@114@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@112@01 x@114@01))
(pop) ; 2
(declare-fun inv@115@01 ($Ref) $Ref)
(declare-fun img@116@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@114@01 $Ref) (x2@114@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@112@01 x1@114@01)
      (Seq_contains xs@112@01 x2@114@01)
      (= x1@114@01 x2@114@01))
    (= x1@114@01 x2@114@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@114@01 $Ref)) (!
  (=>
    (Seq_contains xs@112@01 x@114@01)
    (and (= (inv@115@01 x@114@01) x@114@01) (img@116@01 x@114@01)))
  :pattern ((Seq_contains xs@112@01 x@114@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@114@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@114@01))
  :pattern ((inv@115@01 x@114@01))
  :pattern ((img@116@01 x@114@01))
  :qid |quant-u-65|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@116@01 x) (Seq_contains xs@112@01 (inv@115@01 x)))
    (= (inv@115@01 x) x))
  :pattern ((inv@115@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(declare-const x@117@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@112@01 x@117@01))
(pop) ; 2
(declare-fun inv@118@01 ($Ref) $Ref)
(declare-fun img@119@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@117@01 $Ref) (x2@117@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@112@01 x1@117@01)
      (Seq_contains xs@112@01 x2@117@01)
      (= x1@117@01 x2@117@01))
    (= x1@117@01 x2@117@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@117@01 $Ref)) (!
  (=>
    (Seq_contains xs@112@01 x@117@01)
    (and (= (inv@118@01 x@117@01) x@117@01) (img@119@01 x@117@01)))
  :pattern ((Seq_contains xs@112@01 x@117@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@117@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@117@01))
  :pattern ((inv@118@01 x@117@01))
  :pattern ((img@119@01 x@117@01))
  :qid |quant-u-67|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@119@01 x) (Seq_contains xs@112@01 (inv@118@01 x)))
    (= (inv@118@01 x) x))
  :pattern ((inv@118@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (and
    (= x@117@01 x@114@01)
    (=
      (and (img@119@01 x) (Seq_contains xs@112@01 (inv@118@01 x)))
      (and (img@116@01 x) (Seq_contains xs@112@01 (inv@115@01 x)))))
  
  :qid |quant-u-68|))))
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
(declare-const $t@120@01 $Snap)
(assert (= $t@120@01 ($Snap.combine ($Snap.first $t@120@01) ($Snap.second $t@120@01))))
(declare-const x@121@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@112@01 x@121@01))
(pop) ; 3
(declare-fun inv@122@01 ($Ref) $Ref)
(declare-fun img@123@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@121@01 $Ref) (x2@121@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@112@01 x1@121@01)
      (Seq_contains xs@112@01 x2@121@01)
      (= x1@121@01 x2@121@01))
    (= x1@121@01 x2@121@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@121@01 $Ref)) (!
  (=>
    (Seq_contains xs@112@01 x@121@01)
    (and (= (inv@122@01 x@121@01) x@121@01) (img@123@01 x@121@01)))
  :pattern ((Seq_contains xs@112@01 x@121@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@121@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@121@01))
  :pattern ((inv@122@01 x@121@01))
  :pattern ((img@123@01 x@121@01))
  :qid |quant-u-70|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@123@01 x) (Seq_contains xs@112@01 (inv@122@01 x)))
    (= (inv@122@01 x) x))
  :pattern ((inv@122@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(declare-const x@124@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@112@01 x@124@01))
(pop) ; 3
(declare-fun inv@125@01 ($Ref) $Ref)
(declare-fun img@126@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@124@01 $Ref) (x2@124@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@112@01 x1@124@01)
      (Seq_contains xs@112@01 x2@124@01)
      (= x1@124@01 x2@124@01))
    (= x1@124@01 x2@124@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@124@01 $Ref)) (!
  (=>
    (Seq_contains xs@112@01 x@124@01)
    (and (= (inv@125@01 x@124@01) x@124@01) (img@126@01 x@124@01)))
  :pattern ((Seq_contains xs@112@01 x@124@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@124@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@124@01))
  :pattern ((inv@125@01 x@124@01))
  :pattern ((img@126@01 x@124@01))
  :qid |quant-u-72|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@126@01 x) (Seq_contains xs@112@01 (inv@125@01 x)))
    (= (inv@125@01 x) x))
  :pattern ((inv@125@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (and
    (= x@124@01 x@121@01)
    (=
      (and (img@126@01 x) (Seq_contains xs@112@01 (inv@125@01 x)))
      (and (img@123@01 x) (Seq_contains xs@112@01 (inv@122@01 x)))))
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
(declare-const x@127@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@112@01 x@127@01))
(pop) ; 3
(declare-fun inv@128@01 ($Ref) $Ref)
(declare-fun img@129@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@127@01 $Ref) (x2@127@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@112@01 x1@127@01)
      (Seq_contains xs@112@01 x2@127@01)
      (= x1@127@01 x2@127@01))
    (= x1@127@01 x2@127@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@127@01 $Ref)) (!
  (=>
    (Seq_contains xs@112@01 x@127@01)
    (and (= (inv@128@01 x@127@01) x@127@01) (img@129@01 x@127@01)))
  :pattern ((Seq_contains xs@112@01 x@127@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@127@01))
  :pattern ((inv@128@01 x@127@01))
  :pattern ((img@129@01 x@127@01))
  :qid |pred-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@129@01 x) (Seq_contains xs@112@01 (inv@128@01 x)))
    (= (inv@128@01 x) x))
  :pattern ((inv@128@01 x))
  :qid |pred-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@130@01 ((x $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@112@01 (inv@128@01 x))
      (img@129@01 x)
      (= x (inv@128@01 x)))
    ($Perm.min
      (ite
        (and (img@116@01 x) (Seq_contains xs@112@01 (inv@115@01 x)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@131@01 ((x $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@112@01 (inv@128@01 x))
      (img@129@01 x)
      (= x (inv@128@01 x)))
    ($Perm.min
      (ite
        (and (img@119@01 x) (Seq_contains xs@112@01 (inv@118@01 x)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@130@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@116@01 x) (Seq_contains xs@112@01 (inv@115@01 x)))
        $Perm.Write
        $Perm.No)
      (pTaken@130@01 x))
    $Perm.No)
  
  :qid |quant-u-76|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Seq_contains xs@112@01 (inv@128@01 x))
      (img@129@01 x)
      (= x (inv@128@01 x)))
    (= (- $Perm.Write (pTaken@130@01 x)) $Perm.No))
  
  :qid |quant-u-77|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@132@01 $PSF<pred>)
(declare-const s@133@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@133@01 $Snap)) (!
  (=>
    (and
      (img@116@01 ($SortWrappers.$SnapTo$Ref s@133@01))
      (Seq_contains xs@112@01 (inv@115@01 ($SortWrappers.$SnapTo$Ref s@133@01))))
    (and
      (not (= s@133@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@132@01  $PSF<pred>) s@133@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@113@01)) s@133@01))))
  :pattern (($PSF.lookup_pred (as sm@132@01  $PSF<pred>) s@133@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first $t@113@01)) s@133@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@133@01 $Snap)) (!
  (=>
    (and
      (img@119@01 ($SortWrappers.$SnapTo$Ref s@133@01))
      (Seq_contains xs@112@01 (inv@118@01 ($SortWrappers.$SnapTo$Ref s@133@01))))
    (and
      (not (= s@133@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@132@01  $PSF<pred>) s@133@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@113@01)) s@133@01))))
  :pattern (($PSF.lookup_pred (as sm@132@01  $PSF<pred>) s@133@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@113@01)) s@133@01))
  :qid |qp.psmValDef9|)))
(declare-const x@134@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@112@01 x@134@01))
(pop) ; 3
(declare-fun inv@135@01 ($Ref) $Ref)
(declare-fun img@136@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@134@01 $Ref) (x2@134@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@112@01 x1@134@01)
      (Seq_contains xs@112@01 x2@134@01)
      (= x1@134@01 x2@134@01))
    (= x1@134@01 x2@134@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@134@01 $Ref)) (!
  (=>
    (Seq_contains xs@112@01 x@134@01)
    (and (= (inv@135@01 x@134@01) x@134@01) (img@136@01 x@134@01)))
  :pattern ((Seq_contains xs@112@01 x@134@01))
  :pattern ((Seq_contains_trigger xs@112@01 x@134@01))
  :pattern ((inv@135@01 x@134@01))
  :pattern ((img@136@01 x@134@01))
  :qid |pred-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@136@01 x) (Seq_contains xs@112@01 (inv@135@01 x)))
    (= (inv@135@01 x) x))
  :pattern ((inv@135@01 x))
  :qid |pred-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@137@01 ((x $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@112@01 (inv@135@01 x))
      (img@136@01 x)
      (= x (inv@135@01 x)))
    ($Perm.min
      (ite
        (and (img@119@01 x) (Seq_contains xs@112@01 (inv@118@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@119@01 x) (Seq_contains xs@112@01 (inv@118@01 x)))
        $Perm.Write
        $Perm.No)
      (pTaken@137@01 x))
    $Perm.No)
  
  :qid |quant-u-80|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Seq_contains xs@112@01 (inv@135@01 x))
      (img@136@01 x)
      (= x (inv@135@01 x)))
    (= (- $Perm.Write (pTaken@137@01 x)) $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@138@01 $PSF<pred>)
(declare-const s@139@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@139@01 $Snap)) (!
  (=>
    (and
      (img@119@01 ($SortWrappers.$SnapTo$Ref s@139@01))
      (Seq_contains xs@112@01 (inv@118@01 ($SortWrappers.$SnapTo$Ref s@139@01))))
    (and
      (not (= s@139@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@138@01  $PSF<pred>) s@139@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@113@01)) s@139@01))))
  :pattern (($PSF.lookup_pred (as sm@138@01  $PSF<pred>) s@139@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.second $t@113@01)) s@139@01))
  :qid |qp.psmValDef10|)))
(pop) ; 2
(pop) ; 1
; ---------- m7 ----------
(declare-const xs@140@01 Seq<$Ref>)
(declare-const xs@141@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@142@01 $Snap)
(assert (= $t@142@01 ($Snap.combine ($Snap.first $t@142@01) ($Snap.second $t@142@01))))
(declare-const x@143@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@141@01 x@143@01))
(pop) ; 2
(declare-fun inv@144@01 ($Ref) $Ref)
(declare-fun img@145@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@143@01 $Ref) (x2@143@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 x1@143@01)
      (Seq_contains xs@141@01 x2@143@01)
      (= x1@143@01 x2@143@01))
    (= x1@143@01 x2@143@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@143@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@143@01)
    (and (= (inv@144@01 x@143@01) x@143@01) (img@145@01 x@143@01)))
  :pattern ((Seq_contains xs@141@01 x@143@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@143@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@143@01))
  :pattern ((inv@144@01 x@143@01))
  :pattern ((img@145@01 x@143@01))
  :qid |quant-u-83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@145@01 r) (Seq_contains xs@141@01 (inv@144@01 r)))
    (= (inv@144@01 r) r))
  :pattern ((inv@144@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@143@01 $Ref)) (!
  (=> (Seq_contains xs@141@01 x@143@01) (not (= x@143@01 $Ref.null)))
  :pattern ((Seq_contains xs@141@01 x@143@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@143@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@143@01))
  :pattern ((inv@144@01 x@143@01))
  :pattern ((img@145@01 x@143@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@142@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@142@01))
    ($Snap.second ($Snap.second $t@142@01)))))
(declare-const x@146@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@141@01 x@146@01))
(pop) ; 2
(declare-fun inv@147@01 ($Ref) $Ref)
(declare-fun img@148@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@146@01 $Ref) (x2@146@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 x1@146@01)
      (Seq_contains xs@141@01 x2@146@01)
      (= x1@146@01 x2@146@01))
    (= x1@146@01 x2@146@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@146@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@146@01)
    (and (= (inv@147@01 x@146@01) x@146@01) (img@148@01 x@146@01)))
  :pattern ((Seq_contains xs@141@01 x@146@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@146@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@146@01))
  :pattern ((inv@147@01 x@146@01))
  :pattern ((img@148@01 x@146@01))
  :qid |quant-u-85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@148@01 r) (Seq_contains xs@141@01 (inv@147@01 r)))
    (= (inv@147@01 r) r))
  :pattern ((inv@147@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@146@01 $Ref)) (!
  (=> (Seq_contains xs@141@01 x@146@01) (not (= x@146@01 $Ref.null)))
  :pattern ((Seq_contains xs@141@01 x@146@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@146@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@146@01))
  :pattern ((inv@147@01 x@146@01))
  :pattern ((img@148@01 x@146@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@142@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@142@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
(declare-const x@149@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@141@01 x@149@01))
(pop) ; 2
(declare-fun inv@150@01 ($Ref) $Ref)
(declare-fun img@151@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@149@01 $Ref) (x2@149@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 x1@149@01)
      (Seq_contains xs@141@01 x2@149@01)
      (= x1@149@01 x2@149@01))
    (= x1@149@01 x2@149@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@149@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@149@01)
    (and (= (inv@150@01 x@149@01) x@149@01) (img@151@01 x@149@01)))
  :pattern ((Seq_contains xs@141@01 x@149@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@149@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@149@01))
  :pattern ((inv@150@01 x@149@01))
  :pattern ((img@151@01 x@149@01))
  :qid |quant-u-87|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@151@01 x) (Seq_contains xs@141@01 (inv@150@01 x)))
    (= (inv@150@01 x) x))
  :pattern ((inv@150@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@142@01))) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) ==> x.f > 0)
(declare-const x@152@01 $Ref)
(push) ; 2
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 0 | x@152@01 in xs@141@01 | live]
; [else-branch: 0 | !(x@152@01 in xs@141@01) | live]
(push) ; 4
; [then-branch: 0 | x@152@01 in xs@141@01]
(assert (Seq_contains xs@141@01 x@152@01))
; [eval] x.f > 0
(push) ; 5
(assert (not (and (img@145@01 x@152@01) (Seq_contains xs@141@01 (inv@144@01 x@152@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(x@152@01 in xs@141@01)]
(assert (not (Seq_contains xs@141@01 x@152@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Seq_contains xs@141@01 x@152@01)) (Seq_contains xs@141@01 x@152@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@152@01 $Ref)) (!
  (or (not (Seq_contains xs@141@01 x@152@01)) (Seq_contains xs@141@01 x@152@01))
  :pattern ((Seq_contains xs@141@01 x@152@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@152@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@43@10@43@45-aux|)))
(assert (forall ((x@152@01 $Ref)) (!
  (or (not (Seq_contains xs@141@01 x@152@01)) (Seq_contains xs@141@01 x@152@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@152@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@43@10@43@45-aux|)))
(assert (forall ((x@152@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@152@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@142@01)) x@152@01)
      0))
  :pattern ((Seq_contains xs@141@01 x@152@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@152@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@43@10@43@45|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@153@01 $Snap)
(assert (= $t@153@01 ($Snap.combine ($Snap.first $t@153@01) ($Snap.second $t@153@01))))
(declare-const x@154@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@141@01 x@154@01))
(pop) ; 3
(declare-fun inv@155@01 ($Ref) $Ref)
(declare-fun img@156@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@154@01 $Ref) (x2@154@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 x1@154@01)
      (Seq_contains xs@141@01 x2@154@01)
      (= x1@154@01 x2@154@01))
    (= x1@154@01 x2@154@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@154@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@154@01)
    (and (= (inv@155@01 x@154@01) x@154@01) (img@156@01 x@154@01)))
  :pattern ((Seq_contains xs@141@01 x@154@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@154@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@154@01))
  :pattern ((inv@155@01 x@154@01))
  :pattern ((img@156@01 x@154@01))
  :qid |quant-u-89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@156@01 r) (Seq_contains xs@141@01 (inv@155@01 r)))
    (= (inv@155@01 r) r))
  :pattern ((inv@155@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@154@01 $Ref)) (!
  (=> (Seq_contains xs@141@01 x@154@01) (not (= x@154@01 $Ref.null)))
  :pattern ((Seq_contains xs@141@01 x@154@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@154@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@154@01))
  :pattern ((inv@155@01 x@154@01))
  :pattern ((img@156@01 x@154@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@153@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@153@01))
    ($Snap.second ($Snap.second $t@153@01)))))
(declare-const x@157@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@141@01 x@157@01))
(pop) ; 3
(declare-fun inv@158@01 ($Ref) $Ref)
(declare-fun img@159@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@157@01 $Ref) (x2@157@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 x1@157@01)
      (Seq_contains xs@141@01 x2@157@01)
      (= x1@157@01 x2@157@01))
    (= x1@157@01 x2@157@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@157@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@157@01)
    (and (= (inv@158@01 x@157@01) x@157@01) (img@159@01 x@157@01)))
  :pattern ((Seq_contains xs@141@01 x@157@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@157@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@157@01))
  :pattern ((inv@158@01 x@157@01))
  :pattern ((img@159@01 x@157@01))
  :qid |quant-u-91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@159@01 r) (Seq_contains xs@141@01 (inv@158@01 r)))
    (= (inv@158@01 r) r))
  :pattern ((inv@158@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@157@01 $Ref)) (!
  (=> (Seq_contains xs@141@01 x@157@01) (not (= x@157@01 $Ref.null)))
  :pattern ((Seq_contains xs@141@01 x@157@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@157@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@157@01))
  :pattern ((inv@158@01 x@157@01))
  :pattern ((img@159@01 x@157@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@153@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@153@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@153@01))))))
(declare-const x@160@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@141@01 x@160@01))
(pop) ; 3
(declare-fun inv@161@01 ($Ref) $Ref)
(declare-fun img@162@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@160@01 $Ref) (x2@160@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 x1@160@01)
      (Seq_contains xs@141@01 x2@160@01)
      (= x1@160@01 x2@160@01))
    (= x1@160@01 x2@160@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@160@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@160@01)
    (and (= (inv@161@01 x@160@01) x@160@01) (img@162@01 x@160@01)))
  :pattern ((Seq_contains xs@141@01 x@160@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@160@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@160@01))
  :pattern ((inv@161@01 x@160@01))
  :pattern ((img@162@01 x@160@01))
  :qid |quant-u-93|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@162@01 x) (Seq_contains xs@141@01 (inv@161@01 x)))
    (= (inv@161@01 x) x))
  :pattern ((inv@161@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@153@01))) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) ==> x.f > 0)
(declare-const x@163@01 $Ref)
(push) ; 3
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 1 | x@163@01 in xs@141@01 | live]
; [else-branch: 1 | !(x@163@01 in xs@141@01) | live]
(push) ; 5
; [then-branch: 1 | x@163@01 in xs@141@01]
(assert (Seq_contains xs@141@01 x@163@01))
; [eval] x.f > 0
(push) ; 6
(assert (not (and (img@156@01 x@163@01) (Seq_contains xs@141@01 (inv@155@01 x@163@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(x@163@01 in xs@141@01)]
(assert (not (Seq_contains xs@141@01 x@163@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Seq_contains xs@141@01 x@163@01)) (Seq_contains xs@141@01 x@163@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@163@01 $Ref)) (!
  (or (not (Seq_contains xs@141@01 x@163@01)) (Seq_contains xs@141@01 x@163@01))
  :pattern ((Seq_contains xs@141@01 x@163@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@163@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@45@10@45@45-aux|)))
(assert (forall ((x@163@01 $Ref)) (!
  (or (not (Seq_contains xs@141@01 x@163@01)) (Seq_contains xs@141@01 x@163@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@163@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@45@10@45@45-aux|)))
(assert (forall ((x@163@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@163@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@153@01)) x@163@01)
      0))
  :pattern ((Seq_contains xs@141@01 x@163@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@163@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@45@10@45@45|)))
(pop) ; 2
(push) ; 2
(declare-const x@164@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@141@01 x@164@01))
(pop) ; 3
(declare-fun inv@165@01 ($Ref) $Ref)
(declare-fun img@166@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@164@01 $Ref) (x2@164@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 x1@164@01)
      (Seq_contains xs@141@01 x2@164@01)
      (= x1@164@01 x2@164@01))
    (= x1@164@01 x2@164@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@164@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@164@01)
    (and (= (inv@165@01 x@164@01) x@164@01) (img@166@01 x@164@01)))
  :pattern ((Seq_contains xs@141@01 x@164@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@164@01))
  :pattern ((inv@165@01 x@164@01))
  :pattern ((img@166@01 x@164@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Seq_contains xs@141@01 (inv@165@01 r)))
    (= (inv@165@01 r) r))
  :pattern ((inv@165@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@167@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@141@01 (inv@165@01 r))
      (img@166@01 r)
      (= r (inv@165@01 r)))
    ($Perm.min
      (ite
        (and (img@145@01 r) (Seq_contains xs@141@01 (inv@144@01 r)))
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
        (and (img@145@01 r) (Seq_contains xs@141@01 (inv@144@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@167@01 r))
    $Perm.No)
  
  :qid |quant-u-96|))))
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
      (Seq_contains xs@141@01 (inv@165@01 r))
      (img@166@01 r)
      (= r (inv@165@01 r)))
    (= (- $Perm.Write (pTaken@167@01 r)) $Perm.No))
  
  :qid |quant-u-97|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@168@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@145@01 r) (Seq_contains xs@141@01 (inv@144@01 r)))
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@142@01)) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@142@01)) r))
  :qid |qp.fvfValDef11|)))
(declare-const x@169@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@141@01 x@169@01))
(pop) ; 3
(declare-fun inv@170@01 ($Ref) $Ref)
(declare-fun img@171@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@169@01 $Ref) (x2@169@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 x1@169@01)
      (Seq_contains xs@141@01 x2@169@01)
      (= x1@169@01 x2@169@01))
    (= x1@169@01 x2@169@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@169@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@169@01)
    (and (= (inv@170@01 x@169@01) x@169@01) (img@171@01 x@169@01)))
  :pattern ((Seq_contains xs@141@01 x@169@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@169@01))
  :pattern ((inv@170@01 x@169@01))
  :pattern ((img@171@01 x@169@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@171@01 r) (Seq_contains xs@141@01 (inv@170@01 r)))
    (= (inv@170@01 r) r))
  :pattern ((inv@170@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@172@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@141@01 (inv@170@01 r))
      (img@171@01 r)
      (= r (inv@170@01 r)))
    ($Perm.min
      (ite
        (and (img@148@01 r) (Seq_contains xs@141@01 (inv@147@01 r)))
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
        (and (img@148@01 r) (Seq_contains xs@141@01 (inv@147@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@172@01 r))
    $Perm.No)
  
  :qid |quant-u-100|))))
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
      (Seq_contains xs@141@01 (inv@170@01 r))
      (img@171@01 r)
      (= r (inv@170@01 r)))
    (= (- $Perm.Write (pTaken@172@01 r)) $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@173@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@148@01 r) (Seq_contains xs@141@01 (inv@147@01 r)))
    (=
      ($FVF.lookup_g (as sm@173@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@142@01))) r)))
  :pattern (($FVF.lookup_g (as sm@173@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@142@01))) r))
  :qid |qp.fvfValDef12|)))
(declare-const x@174@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@141@01 x@174@01))
(pop) ; 3
(declare-fun inv@175@01 ($Ref) $Ref)
(declare-fun img@176@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@174@01 $Ref) (x2@174@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 x1@174@01)
      (Seq_contains xs@141@01 x2@174@01)
      (= x1@174@01 x2@174@01))
    (= x1@174@01 x2@174@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@174@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@174@01)
    (and (= (inv@175@01 x@174@01) x@174@01) (img@176@01 x@174@01)))
  :pattern ((Seq_contains xs@141@01 x@174@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@174@01))
  :pattern ((inv@175@01 x@174@01))
  :pattern ((img@176@01 x@174@01))
  :qid |pred-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@176@01 x) (Seq_contains xs@141@01 (inv@175@01 x)))
    (= (inv@175@01 x) x))
  :pattern ((inv@175@01 x))
  :qid |pred-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@177@01 ((x $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@141@01 (inv@175@01 x))
      (img@176@01 x)
      (= x (inv@175@01 x)))
    ($Perm.min
      (ite
        (and (img@151@01 x) (Seq_contains xs@141@01 (inv@150@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@151@01 x) (Seq_contains xs@141@01 (inv@150@01 x)))
        $Perm.Write
        $Perm.No)
      (pTaken@177@01 x))
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
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Seq_contains xs@141@01 (inv@175@01 x))
      (img@176@01 x)
      (= x (inv@175@01 x)))
    (= (- $Perm.Write (pTaken@177@01 x)) $Perm.No))
  
  :qid |quant-u-105|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@178@01 $PSF<pred>)
(declare-const s@179@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@179@01 $Snap)) (!
  (=>
    (and
      (img@151@01 ($SortWrappers.$SnapTo$Ref s@179@01))
      (Seq_contains xs@141@01 (inv@150@01 ($SortWrappers.$SnapTo$Ref s@179@01))))
    (and
      (not (= s@179@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@178@01  $PSF<pred>) s@179@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first ($Snap.second ($Snap.second $t@142@01)))) s@179@01))))
  :pattern (($PSF.lookup_pred (as sm@178@01  $PSF<pred>) s@179@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first ($Snap.second ($Snap.second $t@142@01)))) s@179@01))
  :qid |qp.psmValDef13|)))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) ==> x.f > 0)
(declare-const x@180@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 2 | x@180@01 in xs@141@01 | live]
; [else-branch: 2 | !(x@180@01 in xs@141@01) | live]
(push) ; 5
; [then-branch: 2 | x@180@01 in xs@141@01]
(assert (Seq_contains xs@141@01 x@180@01))
; [eval] x.f > 0
(push) ; 6
(assert (not (and (img@145@01 x@180@01) (Seq_contains xs@141@01 (inv@144@01 x@180@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(x@180@01 in xs@141@01)]
(assert (not (Seq_contains xs@141@01 x@180@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Seq_contains xs@141@01 x@180@01)) (Seq_contains xs@141@01 x@180@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@180@01 $Ref)) (!
  (or (not (Seq_contains xs@141@01 x@180@01)) (Seq_contains xs@141@01 x@180@01))
  :pattern ((Seq_contains xs@141@01 x@180@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@180@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@45@10@45@45-aux|)))
(assert (forall ((x@180@01 $Ref)) (!
  (or (not (Seq_contains xs@141@01 x@180@01)) (Seq_contains xs@141@01 x@180@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@180@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@45@10@45@45-aux|)))
(push) ; 3
(assert (not (forall ((x@180@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@180@01)
    (> ($FVF.lookup_f (as sm@168@01  $FVF<f>) x@180@01) 0))
  :pattern ((Seq_contains xs@141@01 x@180@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@180@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@180@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@45@10@45@45|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@180@01 $Ref)) (!
  (=>
    (Seq_contains xs@141@01 x@180@01)
    (> ($FVF.lookup_f (as sm@168@01  $FVF<f>) x@180@01) 0))
  :pattern ((Seq_contains xs@141@01 x@180@01))
  :pattern ((Seq_contains_trigger xs@141@01 x@180@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@45@10@45@45|)))
(pop) ; 2
(pop) ; 1
; ---------- m8 ----------
(declare-const xs@181@01 Seq<$Ref>)
(declare-const ys@182@01 Seq<$Ref>)
(declare-const xs@183@01 Seq<$Ref>)
(declare-const ys@184@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@185@01 $Snap)
(assert (= $t@185@01 ($Snap.combine ($Snap.first $t@185@01) ($Snap.second $t@185@01))))
(declare-const x@186@01 $Ref)
(push) ; 2
; [eval] (x in xs) && (x in ys)
; [eval] (x in xs)
(push) ; 3
; [then-branch: 3 | !(x@186@01 in xs@183@01) | live]
; [else-branch: 3 | x@186@01 in xs@183@01 | live]
(push) ; 4
; [then-branch: 3 | !(x@186@01 in xs@183@01)]
(assert (not (Seq_contains xs@183@01 x@186@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | x@186@01 in xs@183@01]
(assert (Seq_contains xs@183@01 x@186@01))
; [eval] (x in ys)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@183@01 x@186@01) (not (Seq_contains xs@183@01 x@186@01))))
(assert (and (Seq_contains xs@183@01 x@186@01) (Seq_contains ys@184@01 x@186@01)))
(pop) ; 2
(declare-fun inv@187@01 ($Ref) $Ref)
(declare-fun img@188@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@186@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@183@01 x@186@01) (Seq_contains ys@184@01 x@186@01))
    (or
      (Seq_contains xs@183@01 x@186@01)
      (not (Seq_contains xs@183@01 x@186@01))))
  :pattern ((Seq_contains xs@183@01 x@186@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@186@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@186@01))
  :pattern ((Seq_contains ys@184@01 x@186@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@186@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@186@01))
  :pattern ((inv@187@01 x@186@01))
  :pattern ((img@188@01 x@186@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@186@01 $Ref) (x2@186@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@183@01 x1@186@01) (Seq_contains ys@184@01 x1@186@01))
      (and (Seq_contains xs@183@01 x2@186@01) (Seq_contains ys@184@01 x2@186@01))
      (= x1@186@01 x2@186@01))
    (= x1@186@01 x2@186@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@186@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@183@01 x@186@01) (Seq_contains ys@184@01 x@186@01))
    (and (= (inv@187@01 x@186@01) x@186@01) (img@188@01 x@186@01)))
  :pattern ((Seq_contains xs@183@01 x@186@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@186@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@186@01))
  :pattern ((Seq_contains ys@184@01 x@186@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@186@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@186@01))
  :pattern ((inv@187@01 x@186@01))
  :pattern ((img@188@01 x@186@01))
  :qid |quant-u-107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@188@01 r)
      (and
        (Seq_contains xs@183@01 (inv@187@01 r))
        (Seq_contains ys@184@01 (inv@187@01 r))))
    (= (inv@187@01 r) r))
  :pattern ((inv@187@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@186@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@183@01 x@186@01) (Seq_contains ys@184@01 x@186@01))
    (not (= x@186@01 $Ref.null)))
  :pattern ((Seq_contains xs@183@01 x@186@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@186@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@186@01))
  :pattern ((Seq_contains ys@184@01 x@186@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@186@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@186@01))
  :pattern ((inv@187@01 x@186@01))
  :pattern ((img@188@01 x@186@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@189@01 $Ref)
(push) ; 2
; [eval] (x in xs) && (x in ys)
; [eval] (x in xs)
(push) ; 3
; [then-branch: 4 | !(x@189@01 in xs@183@01) | live]
; [else-branch: 4 | x@189@01 in xs@183@01 | live]
(push) ; 4
; [then-branch: 4 | !(x@189@01 in xs@183@01)]
(assert (not (Seq_contains xs@183@01 x@189@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | x@189@01 in xs@183@01]
(assert (Seq_contains xs@183@01 x@189@01))
; [eval] (x in ys)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@183@01 x@189@01) (not (Seq_contains xs@183@01 x@189@01))))
(assert (and (Seq_contains xs@183@01 x@189@01) (Seq_contains ys@184@01 x@189@01)))
(pop) ; 2
(declare-fun inv@190@01 ($Ref) $Ref)
(declare-fun img@191@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@189@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@183@01 x@189@01) (Seq_contains ys@184@01 x@189@01))
    (or
      (Seq_contains xs@183@01 x@189@01)
      (not (Seq_contains xs@183@01 x@189@01))))
  :pattern ((Seq_contains xs@183@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@189@01))
  :pattern ((Seq_contains ys@184@01 x@189@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@189@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@189@01))
  :pattern ((inv@190@01 x@189@01))
  :pattern ((img@191@01 x@189@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@189@01 $Ref) (x2@189@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@183@01 x1@189@01) (Seq_contains ys@184@01 x1@189@01))
      (and (Seq_contains xs@183@01 x2@189@01) (Seq_contains ys@184@01 x2@189@01))
      (= x1@189@01 x2@189@01))
    (= x1@189@01 x2@189@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@189@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@183@01 x@189@01) (Seq_contains ys@184@01 x@189@01))
    (and (= (inv@190@01 x@189@01) x@189@01) (img@191@01 x@189@01)))
  :pattern ((Seq_contains xs@183@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@189@01))
  :pattern ((Seq_contains ys@184@01 x@189@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@189@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@189@01))
  :pattern ((inv@190@01 x@189@01))
  :pattern ((img@191@01 x@189@01))
  :qid |quant-u-109|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@191@01 r)
      (and
        (Seq_contains xs@183@01 (inv@190@01 r))
        (Seq_contains ys@184@01 (inv@190@01 r))))
    (= (inv@190@01 r) r))
  :pattern ((inv@190@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@189@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@183@01 x@189@01) (Seq_contains ys@184@01 x@189@01))
    (not (= x@189@01 $Ref.null)))
  :pattern ((Seq_contains xs@183@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@183@01 x@189@01))
  :pattern ((Seq_contains ys@184@01 x@189@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@189@01))
  :pattern ((Seq_contains_trigger ys@184@01 x@189@01))
  :pattern ((inv@190@01 x@189@01))
  :pattern ((img@191@01 x@189@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(pop) ; 2
(pop) ; 1
; ---------- m9 ----------
(declare-const xs@192@01 Seq<$Ref>)
(declare-const xs@193@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@194@01 $Snap)
(assert (= $t@194@01 ($Snap.combine ($Snap.first $t@194@01) ($Snap.second $t@194@01))))
(declare-const x@195@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@193@01 x@195@01))
(pop) ; 2
(declare-fun inv@196@01 ($Ref) $Ref)
(declare-fun img@197@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@195@01 $Ref) (x2@195@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 x1@195@01)
      (Seq_contains xs@193@01 x2@195@01)
      (= x1@195@01 x2@195@01))
    (= x1@195@01 x2@195@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@195@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@195@01)
    (and (= (inv@196@01 x@195@01) x@195@01) (img@197@01 x@195@01)))
  :pattern ((Seq_contains xs@193@01 x@195@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@195@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@195@01))
  :pattern ((inv@196@01 x@195@01))
  :pattern ((img@197@01 x@195@01))
  :qid |quant-u-111|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@197@01 r) (Seq_contains xs@193@01 (inv@196@01 r)))
    (= (inv@196@01 r) r))
  :pattern ((inv@196@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@195@01 $Ref)) (!
  (=> (Seq_contains xs@193@01 x@195@01) (not (= x@195@01 $Ref.null)))
  :pattern ((Seq_contains xs@193@01 x@195@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@195@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@195@01))
  :pattern ((inv@196@01 x@195@01))
  :pattern ((img@197@01 x@195@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@194@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@194@01))
    ($Snap.second ($Snap.second $t@194@01)))))
(declare-const x@198@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@193@01 x@198@01))
(pop) ; 2
(declare-fun inv@199@01 ($Ref) $Ref)
(declare-fun img@200@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@198@01 $Ref) (x2@198@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 x1@198@01)
      (Seq_contains xs@193@01 x2@198@01)
      (= x1@198@01 x2@198@01))
    (= x1@198@01 x2@198@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@198@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@198@01)
    (and (= (inv@199@01 x@198@01) x@198@01) (img@200@01 x@198@01)))
  :pattern ((Seq_contains xs@193@01 x@198@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@198@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@198@01))
  :pattern ((inv@199@01 x@198@01))
  :pattern ((img@200@01 x@198@01))
  :qid |quant-u-113|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@200@01 r) (Seq_contains xs@193@01 (inv@199@01 r)))
    (= (inv@199@01 r) r))
  :pattern ((inv@199@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@198@01 $Ref)) (!
  (=> (Seq_contains xs@193@01 x@198@01) (not (= x@198@01 $Ref.null)))
  :pattern ((Seq_contains xs@193@01 x@198@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@198@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@198@01))
  :pattern ((inv@199@01 x@198@01))
  :pattern ((img@200@01 x@198@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@194@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@194@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@194@01))))))
(declare-const x@201@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@193@01 x@201@01))
(pop) ; 2
(declare-fun inv@202@01 ($Ref) $Ref)
(declare-fun img@203@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@201@01 $Ref) (x2@201@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 x1@201@01)
      (Seq_contains xs@193@01 x2@201@01)
      (= x1@201@01 x2@201@01))
    (= x1@201@01 x2@201@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@201@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@201@01)
    (and (= (inv@202@01 x@201@01) x@201@01) (img@203@01 x@201@01)))
  :pattern ((Seq_contains xs@193@01 x@201@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@201@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@201@01))
  :pattern ((inv@202@01 x@201@01))
  :pattern ((img@203@01 x@201@01))
  :qid |quant-u-115|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@203@01 x) (Seq_contains xs@193@01 (inv@202@01 x)))
    (= (inv@202@01 x) x))
  :pattern ((inv@202@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@194@01))) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) ==> x.f > 0)
(declare-const x@204@01 $Ref)
(push) ; 2
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 5 | x@204@01 in xs@193@01 | live]
; [else-branch: 5 | !(x@204@01 in xs@193@01) | live]
(push) ; 4
; [then-branch: 5 | x@204@01 in xs@193@01]
(assert (Seq_contains xs@193@01 x@204@01))
; [eval] x.f > 0
(push) ; 5
(assert (not (and (img@197@01 x@204@01) (Seq_contains xs@193@01 (inv@196@01 x@204@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(x@204@01 in xs@193@01)]
(assert (not (Seq_contains xs@193@01 x@204@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Seq_contains xs@193@01 x@204@01)) (Seq_contains xs@193@01 x@204@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@204@01 $Ref)) (!
  (or (not (Seq_contains xs@193@01 x@204@01)) (Seq_contains xs@193@01 x@204@01))
  :pattern ((Seq_contains xs@193@01 x@204@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@204@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@55@10@55@86-aux|)))
(assert (forall ((x@204@01 $Ref)) (!
  (or (not (Seq_contains xs@193@01 x@204@01)) (Seq_contains xs@193@01 x@204@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@204@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@55@10@55@86-aux|)))
(assert (forall ((x@204@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@204@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@194@01)) x@204@01)
      0))
  :pattern ((Seq_contains xs@193@01 x@204@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@204@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@55@10@55@86|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@205@01 $Snap)
(assert (= $t@205@01 ($Snap.combine ($Snap.first $t@205@01) ($Snap.second $t@205@01))))
(declare-const x@206@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@193@01 x@206@01))
(pop) ; 3
(declare-fun inv@207@01 ($Ref) $Ref)
(declare-fun img@208@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@206@01 $Ref) (x2@206@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 x1@206@01)
      (Seq_contains xs@193@01 x2@206@01)
      (= x1@206@01 x2@206@01))
    (= x1@206@01 x2@206@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@206@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@206@01)
    (and (= (inv@207@01 x@206@01) x@206@01) (img@208@01 x@206@01)))
  :pattern ((Seq_contains xs@193@01 x@206@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@206@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@206@01))
  :pattern ((inv@207@01 x@206@01))
  :pattern ((img@208@01 x@206@01))
  :qid |quant-u-117|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@208@01 r) (Seq_contains xs@193@01 (inv@207@01 r)))
    (= (inv@207@01 r) r))
  :pattern ((inv@207@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@206@01 $Ref)) (!
  (=> (Seq_contains xs@193@01 x@206@01) (not (= x@206@01 $Ref.null)))
  :pattern ((Seq_contains xs@193@01 x@206@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@206@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@206@01))
  :pattern ((inv@207@01 x@206@01))
  :pattern ((img@208@01 x@206@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@205@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@205@01))
    ($Snap.second ($Snap.second $t@205@01)))))
(declare-const x@209@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@193@01 x@209@01))
(pop) ; 3
(declare-fun inv@210@01 ($Ref) $Ref)
(declare-fun img@211@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@209@01 $Ref) (x2@209@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 x1@209@01)
      (Seq_contains xs@193@01 x2@209@01)
      (= x1@209@01 x2@209@01))
    (= x1@209@01 x2@209@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@209@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@209@01)
    (and (= (inv@210@01 x@209@01) x@209@01) (img@211@01 x@209@01)))
  :pattern ((Seq_contains xs@193@01 x@209@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@209@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@209@01))
  :pattern ((inv@210@01 x@209@01))
  :pattern ((img@211@01 x@209@01))
  :qid |quant-u-119|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Seq_contains xs@193@01 (inv@210@01 r)))
    (= (inv@210@01 r) r))
  :pattern ((inv@210@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@209@01 $Ref)) (!
  (=> (Seq_contains xs@193@01 x@209@01) (not (= x@209@01 $Ref.null)))
  :pattern ((Seq_contains xs@193@01 x@209@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@209@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@209@01))
  :pattern ((inv@210@01 x@209@01))
  :pattern ((img@211@01 x@209@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@205@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@205@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@205@01))))))
(declare-const x@212@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@193@01 x@212@01))
(pop) ; 3
(declare-fun inv@213@01 ($Ref) $Ref)
(declare-fun img@214@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@212@01 $Ref) (x2@212@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 x1@212@01)
      (Seq_contains xs@193@01 x2@212@01)
      (= x1@212@01 x2@212@01))
    (= x1@212@01 x2@212@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@212@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@212@01)
    (and (= (inv@213@01 x@212@01) x@212@01) (img@214@01 x@212@01)))
  :pattern ((Seq_contains xs@193@01 x@212@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@212@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@212@01))
  :pattern ((inv@213@01 x@212@01))
  :pattern ((img@214@01 x@212@01))
  :qid |quant-u-121|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@214@01 x) (Seq_contains xs@193@01 (inv@213@01 x)))
    (= (inv@213@01 x) x))
  :pattern ((inv@213@01 x))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@205@01))) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) ==> x.f > 0)
(declare-const x@215@01 $Ref)
(push) ; 3
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 6 | x@215@01 in xs@193@01 | live]
; [else-branch: 6 | !(x@215@01 in xs@193@01) | live]
(push) ; 5
; [then-branch: 6 | x@215@01 in xs@193@01]
(assert (Seq_contains xs@193@01 x@215@01))
; [eval] x.f > 0
(push) ; 6
(assert (not (and (img@208@01 x@215@01) (Seq_contains xs@193@01 (inv@207@01 x@215@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(x@215@01 in xs@193@01)]
(assert (not (Seq_contains xs@193@01 x@215@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Seq_contains xs@193@01 x@215@01)) (Seq_contains xs@193@01 x@215@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@215@01 $Ref)) (!
  (or (not (Seq_contains xs@193@01 x@215@01)) (Seq_contains xs@193@01 x@215@01))
  :pattern ((Seq_contains xs@193@01 x@215@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@215@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@56@9@56@85-aux|)))
(assert (forall ((x@215@01 $Ref)) (!
  (or (not (Seq_contains xs@193@01 x@215@01)) (Seq_contains xs@193@01 x@215@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@215@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@56@9@56@85-aux|)))
(assert (forall ((x@215@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@215@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@205@01)) x@215@01)
      0))
  :pattern ((Seq_contains xs@193@01 x@215@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@215@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@56@9@56@85|)))
(pop) ; 2
(push) ; 2
(declare-const x@216@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@193@01 x@216@01))
(pop) ; 3
(declare-fun inv@217@01 ($Ref) $Ref)
(declare-fun img@218@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@216@01 $Ref) (x2@216@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 x1@216@01)
      (Seq_contains xs@193@01 x2@216@01)
      (= x1@216@01 x2@216@01))
    (= x1@216@01 x2@216@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@216@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@216@01)
    (and (= (inv@217@01 x@216@01) x@216@01) (img@218@01 x@216@01)))
  :pattern ((Seq_contains xs@193@01 x@216@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@216@01))
  :pattern ((inv@217@01 x@216@01))
  :pattern ((img@218@01 x@216@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@218@01 r) (Seq_contains xs@193@01 (inv@217@01 r)))
    (= (inv@217@01 r) r))
  :pattern ((inv@217@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@219@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@193@01 (inv@217@01 r))
      (img@218@01 r)
      (= r (inv@217@01 r)))
    ($Perm.min
      (ite
        (and (img@197@01 r) (Seq_contains xs@193@01 (inv@196@01 r)))
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
        (and (img@197@01 r) (Seq_contains xs@193@01 (inv@196@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@219@01 r))
    $Perm.No)
  
  :qid |quant-u-124|))))
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
      (Seq_contains xs@193@01 (inv@217@01 r))
      (img@218@01 r)
      (= r (inv@217@01 r)))
    (= (- $Perm.Write (pTaken@219@01 r)) $Perm.No))
  
  :qid |quant-u-125|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@220@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@197@01 r) (Seq_contains xs@193@01 (inv@196@01 r)))
    (=
      ($FVF.lookup_f (as sm@220@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@194@01)) r)))
  :pattern (($FVF.lookup_f (as sm@220@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@194@01)) r))
  :qid |qp.fvfValDef14|)))
(declare-const x@221@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@193@01 x@221@01))
(pop) ; 3
(declare-fun inv@222@01 ($Ref) $Ref)
(declare-fun img@223@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@221@01 $Ref) (x2@221@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 x1@221@01)
      (Seq_contains xs@193@01 x2@221@01)
      (= x1@221@01 x2@221@01))
    (= x1@221@01 x2@221@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@221@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@221@01)
    (and (= (inv@222@01 x@221@01) x@221@01) (img@223@01 x@221@01)))
  :pattern ((Seq_contains xs@193@01 x@221@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@221@01))
  :pattern ((inv@222@01 x@221@01))
  :pattern ((img@223@01 x@221@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@223@01 r) (Seq_contains xs@193@01 (inv@222@01 r)))
    (= (inv@222@01 r) r))
  :pattern ((inv@222@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@224@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@193@01 (inv@222@01 r))
      (img@223@01 r)
      (= r (inv@222@01 r)))
    ($Perm.min
      (ite
        (and (img@200@01 r) (Seq_contains xs@193@01 (inv@199@01 r)))
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
        (and (img@200@01 r) (Seq_contains xs@193@01 (inv@199@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@224@01 r))
    $Perm.No)
  
  :qid |quant-u-128|))))
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
      (Seq_contains xs@193@01 (inv@222@01 r))
      (img@223@01 r)
      (= r (inv@222@01 r)))
    (= (- $Perm.Write (pTaken@224@01 r)) $Perm.No))
  
  :qid |quant-u-129|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@225@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@200@01 r) (Seq_contains xs@193@01 (inv@199@01 r)))
    (=
      ($FVF.lookup_g (as sm@225@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@194@01))) r)))
  :pattern (($FVF.lookup_g (as sm@225@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@194@01))) r))
  :qid |qp.fvfValDef15|)))
(declare-const x@226@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@193@01 x@226@01))
(pop) ; 3
(declare-fun inv@227@01 ($Ref) $Ref)
(declare-fun img@228@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@226@01 $Ref) (x2@226@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 x1@226@01)
      (Seq_contains xs@193@01 x2@226@01)
      (= x1@226@01 x2@226@01))
    (= x1@226@01 x2@226@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@226@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@226@01)
    (and (= (inv@227@01 x@226@01) x@226@01) (img@228@01 x@226@01)))
  :pattern ((Seq_contains xs@193@01 x@226@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@226@01))
  :pattern ((inv@227@01 x@226@01))
  :pattern ((img@228@01 x@226@01))
  :qid |pred-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@228@01 x) (Seq_contains xs@193@01 (inv@227@01 x)))
    (= (inv@227@01 x) x))
  :pattern ((inv@227@01 x))
  :qid |pred-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@229@01 ((x $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@193@01 (inv@227@01 x))
      (img@228@01 x)
      (= x (inv@227@01 x)))
    ($Perm.min
      (ite
        (and (img@203@01 x) (Seq_contains xs@193@01 (inv@202@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@203@01 x) (Seq_contains xs@193@01 (inv@202@01 x)))
        $Perm.Write
        $Perm.No)
      (pTaken@229@01 x))
    $Perm.No)
  
  :qid |quant-u-132|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Seq_contains xs@193@01 (inv@227@01 x))
      (img@228@01 x)
      (= x (inv@227@01 x)))
    (= (- $Perm.Write (pTaken@229@01 x)) $Perm.No))
  
  :qid |quant-u-133|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@230@01 $PSF<pred>)
(declare-const s@231@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@231@01 $Snap)) (!
  (=>
    (and
      (img@203@01 ($SortWrappers.$SnapTo$Ref s@231@01))
      (Seq_contains xs@193@01 (inv@202@01 ($SortWrappers.$SnapTo$Ref s@231@01))))
    (and
      (not (= s@231@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@230@01  $PSF<pred>) s@231@01)
        ($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first ($Snap.second ($Snap.second $t@194@01)))) s@231@01))))
  :pattern (($PSF.lookup_pred (as sm@230@01  $PSF<pred>) s@231@01))
  :pattern (($PSF.lookup_pred ($SortWrappers.$SnapTo$PSF<pred> ($Snap.first ($Snap.second ($Snap.second $t@194@01)))) s@231@01))
  :qid |qp.psmValDef16|)))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) ==> x.f > 0)
(declare-const x@232@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 7 | x@232@01 in xs@193@01 | live]
; [else-branch: 7 | !(x@232@01 in xs@193@01) | live]
(push) ; 5
; [then-branch: 7 | x@232@01 in xs@193@01]
(assert (Seq_contains xs@193@01 x@232@01))
; [eval] x.f > 0
(push) ; 6
(assert (not (and (img@197@01 x@232@01) (Seq_contains xs@193@01 (inv@196@01 x@232@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(x@232@01 in xs@193@01)]
(assert (not (Seq_contains xs@193@01 x@232@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Seq_contains xs@193@01 x@232@01)) (Seq_contains xs@193@01 x@232@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@232@01 $Ref)) (!
  (or (not (Seq_contains xs@193@01 x@232@01)) (Seq_contains xs@193@01 x@232@01))
  :pattern ((Seq_contains xs@193@01 x@232@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@232@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@56@9@56@85-aux|)))
(assert (forall ((x@232@01 $Ref)) (!
  (or (not (Seq_contains xs@193@01 x@232@01)) (Seq_contains xs@193@01 x@232@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@232@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@56@9@56@85-aux|)))
(push) ; 3
(assert (not (forall ((x@232@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@232@01)
    (> ($FVF.lookup_f (as sm@220@01  $FVF<f>) x@232@01) 0))
  :pattern ((Seq_contains xs@193@01 x@232@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@232@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@232@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@56@9@56@85|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@232@01 $Ref)) (!
  (=>
    (Seq_contains xs@193@01 x@232@01)
    (> ($FVF.lookup_f (as sm@220@01  $FVF<f>) x@232@01) 0))
  :pattern ((Seq_contains xs@193@01 x@232@01))
  :pattern ((Seq_contains_trigger xs@193@01 x@232@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/forall.vpr@56@9@56@85|)))
(pop) ; 2
(pop) ; 1
