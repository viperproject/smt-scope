(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:26:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/predicates/arguments.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<unrelatedField> 0)
(declare-sort $FVF<f> 0)
(declare-sort $PSF<valid> 0)
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
(declare-fun $SortWrappers.$FVF<unrelatedField>To$Snap ($FVF<unrelatedField>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<unrelatedField> ($Snap) $FVF<unrelatedField>)
(assert (forall ((x $FVF<unrelatedField>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<unrelatedField>($SortWrappers.$FVF<unrelatedField>To$Snap x)))
    :pattern (($SortWrappers.$FVF<unrelatedField>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<unrelatedField>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<unrelatedField>To$Snap($SortWrappers.$SnapTo$FVF<unrelatedField> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<unrelatedField> x))
    :qid |$Snap.$FVF<unrelatedField>To$SnapTo$FVF<unrelatedField>|
    )))
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
(declare-fun $SortWrappers.$PSF<valid>To$Snap ($PSF<valid>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<valid> ($Snap) $PSF<valid>)
(assert (forall ((x $PSF<valid>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<valid>($SortWrappers.$PSF<valid>To$Snap x)))
    :pattern (($SortWrappers.$PSF<valid>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<valid>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<valid>To$Snap($SortWrappers.$SnapTo$PSF<valid> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<valid> x))
    :qid |$Snap.$PSF<valid>To$SnapTo$PSF<valid>|
    )))
; ////////// Symbols
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
; /field_value_functions_declarations.smt2 [unrelatedField: Int]
(declare-fun $FVF.domain_unrelatedField ($FVF<unrelatedField>) Set<$Ref>)
(declare-fun $FVF.lookup_unrelatedField ($FVF<unrelatedField> $Ref) Int)
(declare-fun $FVF.after_unrelatedField ($FVF<unrelatedField> $FVF<unrelatedField>) Bool)
(declare-fun $FVF.loc_unrelatedField (Int $Ref) Bool)
(declare-fun $FVF.perm_unrelatedField ($FPM $Ref) $Perm)
(declare-const $fvfTOP_unrelatedField $FVF<unrelatedField>)
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /predicate_snap_functions_declarations.smt2 [valid: Snap]
(declare-fun $PSF.domain_valid ($PSF<valid>) Set<$Snap>)
(declare-fun $PSF.lookup_valid ($PSF<valid> $Snap) $Snap)
(declare-fun $PSF.after_valid ($PSF<valid> $PSF<valid>) Bool)
(declare-fun $PSF.loc_valid ($Snap $Snap) Bool)
(declare-fun $PSF.perm_valid ($PPM $Snap) $Perm)
(declare-const $psfTOP_valid $PSF<valid>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid%trigger ($Snap $Ref Bool) Bool)
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
; /field_value_functions_axioms.smt2 [unrelatedField: Int]
(assert (forall ((vs $FVF<unrelatedField>) (ws $FVF<unrelatedField>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_unrelatedField vs) ($FVF.domain_unrelatedField ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_unrelatedField vs))
            (= ($FVF.lookup_unrelatedField vs x) ($FVF.lookup_unrelatedField ws x)))
          :pattern (($FVF.lookup_unrelatedField vs x) ($FVF.lookup_unrelatedField ws x))
          :qid |qp.$FVF<unrelatedField>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<unrelatedField>To$Snap vs)
              ($SortWrappers.$FVF<unrelatedField>To$Snap ws)
              )
    :qid |qp.$FVF<unrelatedField>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_unrelatedField pm r))
    :pattern (($FVF.perm_unrelatedField pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_unrelatedField f r) true)
    :pattern (($FVF.loc_unrelatedField f r)))))
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
; /predicate_snap_functions_axioms.smt2 [valid: Snap]
(assert (forall ((vs $PSF<valid>) (ws $PSF<valid>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_valid vs) ($PSF.domain_valid ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_valid vs))
            (= ($PSF.lookup_valid vs x) ($PSF.lookup_valid ws x)))
          :pattern (($PSF.lookup_valid vs x) ($PSF.lookup_valid ws x))
          :qid |qp.$PSF<valid>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<valid>To$Snap vs)
              ($SortWrappers.$PSF<valid>To$Snap ws)
              )
    :qid |qp.$PSF<valid>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_valid pm s))
    :pattern (($PSF.perm_valid pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_valid f s) true)
    :pattern (($PSF.loc_valid f s)))))
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
; ---------- unrelated ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
(assert (not (= this@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 Int)
(pop) ; 2
(push) ; 2
(pop) ; 2
(pop) ; 1
; ---------- t1_1 ----------
(declare-const this@4@01 $Ref)
(declare-const xs@5@01 Seq<$Ref>)
(declare-const b@6@01 Bool)
(declare-const this@7@01 $Ref)
(declare-const xs@8@01 Seq<$Ref>)
(declare-const b@9@01 Bool)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.first $t@10@01) $Snap.unit))
; [eval] (this in xs)
(assert (Seq_contains xs@8@01 this@7@01))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(declare-const x@11@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@8@01 x@11@01))
(pop) ; 2
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@11@01 $Ref) (x2@11@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@8@01 x1@11@01)
      (Seq_contains xs@8@01 x2@11@01)
      (= x1@11@01 x2@11@01))
    (= x1@11@01 x2@11@01))
  
  :qid |unrelatedField-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@11@01 $Ref)) (!
  (=>
    (Seq_contains xs@8@01 x@11@01)
    (and (= (inv@12@01 x@11@01) x@11@01) (img@13@01 x@11@01)))
  :pattern ((Seq_contains xs@8@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@8@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@8@01 x@11@01))
  :pattern ((inv@12@01 x@11@01))
  :pattern ((img@13@01 x@11@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Seq_contains xs@8@01 (inv@12@01 r)))
    (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |unrelatedField-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@11@01 $Ref)) (!
  (=> (Seq_contains xs@8@01 x@11@01) (not (= x@11@01 $Ref.null)))
  :pattern ((Seq_contains xs@8@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@8@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@8@01 x@11@01))
  :pattern ((inv@12@01 x@11@01))
  :pattern ((img@13@01 x@11@01))
  :qid |unrelatedField-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@14@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this, b), write)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@9@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@9@01 | live]
; [else-branch: 0 | !(b@9@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b@9@01]
(assert b@9@01)
(assert (not (= this@7@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.second $t@10@01)) this@7@01 b@9@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@9@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@9@01 | live]
; [else-branch: 1 | !(b@9@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | b@9@01]
; [exec]
; this.f := 1
; [exec]
; fold acc(valid(this, b), write)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@9@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b@9@01 | live]
; [else-branch: 2 | !(b@9@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | b@9@01]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 1) this@7@01 b@9@01))
; [exec]
; unrelated(this)
; Precomputing data for removing quantified permissions
(define-fun pTaken@15@01 ((r $Ref)) $Perm
  (ite
    (= r this@7@01)
    ($Perm.min
      (ite
        (and (img@13@01 r) (Seq_contains xs@8@01 (inv@12@01 r)))
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
        (and (img@13@01 r) (Seq_contains xs@8@01 (inv@12@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@15@01 r))
    $Perm.No)
  
  :qid |quant-u-3|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@15@01 r) $Perm.No)
  
  :qid |quant-u-4|))))
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
  (=> (= r this@7@01) (= (- $Perm.Write (pTaken@15@01 r)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@16@01 $FVF<unrelatedField>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@13@01 this@7@01) (Seq_contains xs@8@01 (inv@12@01 this@7@01)))
  (=
    ($FVF.lookup_unrelatedField (as sm@16@01  $FVF<unrelatedField>) this@7@01)
    ($FVF.lookup_unrelatedField ($SortWrappers.$SnapTo$FVF<unrelatedField> ($Snap.first ($Snap.second $t@10@01))) this@7@01))))
(declare-const $t@17@01 Int)
(declare-const sm@18@01 $FVF<unrelatedField>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_unrelatedField (as sm@18@01  $FVF<unrelatedField>) this@7@01)
  $t@17@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; [eval] !b
; [then-branch: 3 | !(b@9@01) | dead]
; [else-branch: 3 | b@9@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | b@9@01]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(b@9@01)]
(assert (not b@9@01))
(assert (not (= this@7@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.second $t@10@01)) this@7@01 b@9@01))
; [then-branch: 4 | b@9@01 | dead]
; [else-branch: 4 | !(b@9@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | !(b@9@01)]
(pop) ; 4
; [eval] !b
(push) ; 4
(set-option :timeout 10)
(assert (not b@9@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(b@9@01) | live]
; [else-branch: 5 | b@9@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | !(b@9@01)]
; [exec]
; this.g := 2
; [exec]
; fold acc(valid(this, b), write)
; [then-branch: 6 | b@9@01 | dead]
; [else-branch: 6 | !(b@9@01) | live]
(push) ; 5
; [else-branch: 6 | !(b@9@01)]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 2) this@7@01 b@9@01))
; [exec]
; unrelated(this)
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((r $Ref)) $Perm
  (ite
    (= r this@7@01)
    ($Perm.min
      (ite
        (and (img@13@01 r) (Seq_contains xs@8@01 (inv@12@01 r)))
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
        (and (img@13@01 r) (Seq_contains xs@8@01 (inv@12@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@19@01 r))
    $Perm.No)
  
  :qid |quant-u-7|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@19@01 r) $Perm.No)
  
  :qid |quant-u-8|))))
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
  (=> (= r this@7@01) (= (- $Perm.Write (pTaken@19@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@20@01 $FVF<unrelatedField>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@13@01 this@7@01) (Seq_contains xs@8@01 (inv@12@01 this@7@01)))
  (=
    ($FVF.lookup_unrelatedField (as sm@20@01  $FVF<unrelatedField>) this@7@01)
    ($FVF.lookup_unrelatedField ($SortWrappers.$SnapTo$FVF<unrelatedField> ($Snap.first ($Snap.second $t@10@01))) this@7@01))))
(declare-const $t@21@01 Int)
(declare-const sm@22@01 $FVF<unrelatedField>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_unrelatedField (as sm@22@01  $FVF<unrelatedField>) this@7@01)
  $t@21@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t1_2 ----------
(declare-const this@23@01 $Ref)
(declare-const xs@24@01 Seq<$Ref>)
(declare-const b@25@01 Bool)
(declare-const this@26@01 $Ref)
(declare-const xs@27@01 Seq<$Ref>)
(declare-const b@28@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(assert (= ($Snap.first $t@29@01) $Snap.unit))
; [eval] (this in xs)
(assert (Seq_contains xs@27@01 this@26@01))
(assert (=
  ($Snap.second $t@29@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@29@01))
    ($Snap.second ($Snap.second $t@29@01)))))
(declare-const x@30@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@27@01 x@30@01))
(pop) ; 2
(declare-fun inv@31@01 ($Ref) $Ref)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@30@01 $Ref) (x2@30@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@27@01 x1@30@01)
      (Seq_contains xs@27@01 x2@30@01)
      (= x1@30@01 x2@30@01))
    (= x1@30@01 x2@30@01))
  
  :qid |unrelatedField-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@30@01 $Ref)) (!
  (=>
    (Seq_contains xs@27@01 x@30@01)
    (and (= (inv@31@01 x@30@01) x@30@01) (img@32@01 x@30@01)))
  :pattern ((Seq_contains xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((inv@31@01 x@30@01))
  :pattern ((img@32@01 x@30@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains xs@27@01 (inv@31@01 r)))
    (= (inv@31@01 r) r))
  :pattern ((inv@31@01 r))
  :qid |unrelatedField-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@30@01 $Ref)) (!
  (=> (Seq_contains xs@27@01 x@30@01) (not (= x@30@01 $Ref.null)))
  :pattern ((Seq_contains xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@30@01))
  :pattern ((inv@31@01 x@30@01))
  :pattern ((img@32@01 x@30@01))
  :qid |unrelatedField-permImpliesNonNull|)))
(declare-const x@33@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@27@01 x@33@01))
(pop) ; 2
(declare-fun inv@34@01 ($Ref Bool) $Ref)
(declare-fun img@35@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@33@01 $Ref) (x2@33@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@27@01 x1@33@01)
      (Seq_contains xs@27@01 x2@33@01)
      (= x1@33@01 x2@33@01))
    (= x1@33@01 x2@33@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (Seq_contains xs@27@01 x@33@01)
    (and (= (inv@34@01 x@33@01 b@28@01) x@33@01) (img@35@01 x@33@01 b@28@01)))
  :pattern ((Seq_contains xs@27@01 x@33@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@33@01))
  :pattern ((Seq_contains_trigger xs@27@01 x@33@01))
  :pattern ((inv@34@01 x@33@01 b@28@01))
  :pattern ((img@35@01 x@33@01 b@28@01))
  :qid |quant-u-13|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@35@01 this b) (Seq_contains xs@27@01 (inv@34@01 this b)))
    (and (= (inv@34@01 this b) this) (= b@28@01 b)))
  :pattern ((inv@34@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@36@01 $Snap)
(declare-const sm@37@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@37@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@26@01)
    ($SortWrappers.BoolTo$Snap b@28@01)))
  $t@36@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this, b), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@38@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@26@01) (= b b@28@01))
    ($Perm.min
      (ite
        (and (img@35@01 this b) (Seq_contains xs@27@01 (inv@34@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@35@01 this b) (Seq_contains xs@27@01 (inv@34@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@38@01 this b))
    $Perm.No)
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@38@01 this b) $Perm.No)
  
  :qid |quant-u-16|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@26@01) (= b b@28@01))
    (= (- $Perm.Write (pTaken@38@01 this b)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@39@01 $PSF<valid>)
(declare-const s@40@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@35@01 this@26@01 b@28@01)
    (Seq_contains xs@27@01 (inv@34@01 this@26@01 b@28@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@26@01)
          ($SortWrappers.BoolTo$Snap b@28@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@39@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@26@01)
        ($SortWrappers.BoolTo$Snap b@28@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@29@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@26@01)
        ($SortWrappers.BoolTo$Snap b@28@01)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@28@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@28@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | b@28@01 | live]
; [else-branch: 7 | !(b@28@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | b@28@01]
(assert b@28@01)
(assert (not (= this@26@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($PSF.lookup_valid (as sm@39@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@26@01)
  ($SortWrappers.BoolTo$Snap b@28@01))) this@26@01 b@28@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@28@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | b@28@01 | live]
; [else-branch: 8 | !(b@28@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | b@28@01]
; [exec]
; this.f := 1
; [exec]
; fold acc(valid(this, b), write)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@28@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | b@28@01 | live]
; [else-branch: 9 | !(b@28@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | b@28@01]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 1) this@26@01 b@28@01))
(declare-const sm@41@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@41@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@26@01)
    ($SortWrappers.BoolTo$Snap b@28@01)))
  ($SortWrappers.IntTo$Snap 1)))
; [exec]
; unrelated(this)
; Precomputing data for removing quantified permissions
(define-fun pTaken@42@01 ((r $Ref)) $Perm
  (ite
    (= r this@26@01)
    ($Perm.min
      (ite
        (and (img@32@01 r) (Seq_contains xs@27@01 (inv@31@01 r)))
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
        (and (img@32@01 r) (Seq_contains xs@27@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@42@01 r))
    $Perm.No)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@42@01 r) $Perm.No)
  
  :qid |quant-u-20|))))
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
  (=> (= r this@26@01) (= (- $Perm.Write (pTaken@42@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@43@01 $FVF<unrelatedField>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@32@01 this@26@01) (Seq_contains xs@27@01 (inv@31@01 this@26@01)))
  (=
    ($FVF.lookup_unrelatedField (as sm@43@01  $FVF<unrelatedField>) this@26@01)
    ($FVF.lookup_unrelatedField ($SortWrappers.$SnapTo$FVF<unrelatedField> ($Snap.first ($Snap.second $t@29@01))) this@26@01))))
(declare-const $t@44@01 Int)
(declare-const sm@45@01 $FVF<unrelatedField>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_unrelatedField (as sm@45@01  $FVF<unrelatedField>) this@26@01)
  $t@44@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@46@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@26@01) (= b b@28@01))
    ($Perm.min
      (ite (and (= this this@26@01) (= b b@28@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@47@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@26@01) (= b b@28@01))
    ($Perm.min
      (ite
        (and (img@35@01 this b) (Seq_contains xs@27@01 (inv@34@01 this b)))
        (- $Perm.Write (pTaken@38@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@46@01 this b)))
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
(assert (not (= (- $Perm.Write (pTaken@46@01 this@26@01 b@28@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@26@01) (= b b@28@01))
    (= (- $Perm.Write (pTaken@46@01 this b)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@48@01 $PSF<valid>)
(declare-const s@49@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@35@01 this@26@01 b@28@01)
      (Seq_contains xs@27@01 (inv@34@01 this@26@01 b@28@01)))
    (< $Perm.No (- $Perm.Write (pTaken@38@01 this@26@01 b@28@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@26@01)
          ($SortWrappers.BoolTo$Snap b@28@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@48@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@26@01)
        ($SortWrappers.BoolTo$Snap b@28@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@29@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@26@01)
        ($SortWrappers.BoolTo$Snap b@28@01)))))))
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@26@01)
        ($SortWrappers.BoolTo$Snap b@28@01))
      $Snap.unit))
  (=
    ($PSF.lookup_valid (as sm@48@01  $PSF<valid>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap this@26@01)
      ($SortWrappers.BoolTo$Snap b@28@01)))
    ($PSF.lookup_valid (as sm@41@01  $PSF<valid>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap this@26@01)
      ($SortWrappers.BoolTo$Snap b@28@01))))))
(pop) ; 5
(pop) ; 4
; [eval] !b
; [then-branch: 10 | !(b@28@01) | dead]
; [else-branch: 10 | b@28@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 10 | b@28@01]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 7 | !(b@28@01)]
(assert (not b@28@01))
(assert (not (= this@26@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($PSF.lookup_valid (as sm@39@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@26@01)
  ($SortWrappers.BoolTo$Snap b@28@01))) this@26@01 b@28@01))
; [then-branch: 11 | b@28@01 | dead]
; [else-branch: 11 | !(b@28@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(b@28@01)]
(pop) ; 4
; [eval] !b
(push) ; 4
(set-option :timeout 10)
(assert (not b@28@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | !(b@28@01) | live]
; [else-branch: 12 | b@28@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | !(b@28@01)]
; [exec]
; this.g := 2
; [exec]
; fold acc(valid(this, b), write)
; [then-branch: 13 | b@28@01 | dead]
; [else-branch: 13 | !(b@28@01) | live]
(push) ; 5
; [else-branch: 13 | !(b@28@01)]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 2) this@26@01 b@28@01))
(declare-const sm@50@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@50@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@26@01)
    ($SortWrappers.BoolTo$Snap b@28@01)))
  ($SortWrappers.IntTo$Snap 2)))
; [exec]
; unrelated(this)
; Precomputing data for removing quantified permissions
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (= r this@26@01)
    ($Perm.min
      (ite
        (and (img@32@01 r) (Seq_contains xs@27@01 (inv@31@01 r)))
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
        (and (img@32@01 r) (Seq_contains xs@27@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@51@01 r))
    $Perm.No)
  
  :qid |quant-u-26|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@51@01 r) $Perm.No)
  
  :qid |quant-u-27|))))
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
  (=> (= r this@26@01) (= (- $Perm.Write (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@52@01 $FVF<unrelatedField>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@32@01 this@26@01) (Seq_contains xs@27@01 (inv@31@01 this@26@01)))
  (=
    ($FVF.lookup_unrelatedField (as sm@52@01  $FVF<unrelatedField>) this@26@01)
    ($FVF.lookup_unrelatedField ($SortWrappers.$SnapTo$FVF<unrelatedField> ($Snap.first ($Snap.second $t@29@01))) this@26@01))))
(declare-const $t@53@01 Int)
(declare-const sm@54@01 $FVF<unrelatedField>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_unrelatedField (as sm@54@01  $FVF<unrelatedField>) this@26@01)
  $t@53@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@55@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@26@01) (= b b@28@01))
    ($Perm.min
      (ite (and (= this this@26@01) (= b b@28@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@56@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@26@01) (= b b@28@01))
    ($Perm.min
      (ite
        (and (img@35@01 this b) (Seq_contains xs@27@01 (inv@34@01 this b)))
        (- $Perm.Write (pTaken@38@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@55@01 this b)))
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
(assert (not (= (- $Perm.Write (pTaken@55@01 this@26@01 b@28@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@26@01) (= b b@28@01))
    (= (- $Perm.Write (pTaken@55@01 this b)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@57@01 $PSF<valid>)
(declare-const s@58@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@35@01 this@26@01 b@28@01)
      (Seq_contains xs@27@01 (inv@34@01 this@26@01 b@28@01)))
    (< $Perm.No (- $Perm.Write (pTaken@38@01 this@26@01 b@28@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@26@01)
          ($SortWrappers.BoolTo$Snap b@28@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@57@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@26@01)
        ($SortWrappers.BoolTo$Snap b@28@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@29@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@26@01)
        ($SortWrappers.BoolTo$Snap b@28@01)))))))
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@26@01)
        ($SortWrappers.BoolTo$Snap b@28@01))
      $Snap.unit))
  (=
    ($PSF.lookup_valid (as sm@57@01  $PSF<valid>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap this@26@01)
      ($SortWrappers.BoolTo$Snap b@28@01)))
    ($PSF.lookup_valid (as sm@50@01  $PSF<valid>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap this@26@01)
      ($SortWrappers.BoolTo$Snap b@28@01))))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t1_3 ----------
(declare-const this@59@01 $Ref)
(declare-const xs@60@01 Seq<$Ref>)
(declare-const b@61@01 Bool)
(declare-const this@62@01 $Ref)
(declare-const xs@63@01 Seq<$Ref>)
(declare-const b@64@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 ($Snap.combine ($Snap.first $t@65@01) ($Snap.second $t@65@01))))
(assert (= ($Snap.first $t@65@01) $Snap.unit))
; [eval] (this in xs)
(assert (Seq_contains xs@63@01 this@62@01))
(assert (=
  ($Snap.second $t@65@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@65@01))
    ($Snap.second ($Snap.second $t@65@01)))))
(declare-const x@66@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@63@01 x@66@01))
(pop) ; 2
(declare-fun inv@67@01 ($Ref) $Ref)
(declare-fun img@68@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@66@01 $Ref) (x2@66@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@63@01 x1@66@01)
      (Seq_contains xs@63@01 x2@66@01)
      (= x1@66@01 x2@66@01))
    (= x1@66@01 x2@66@01))
  
  :qid |unrelatedField-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@66@01 $Ref)) (!
  (=>
    (Seq_contains xs@63@01 x@66@01)
    (and (= (inv@67@01 x@66@01) x@66@01) (img@68@01 x@66@01)))
  :pattern ((Seq_contains xs@63@01 x@66@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@66@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@66@01))
  :pattern ((inv@67@01 x@66@01))
  :pattern ((img@68@01 x@66@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@68@01 r) (Seq_contains xs@63@01 (inv@67@01 r)))
    (= (inv@67@01 r) r))
  :pattern ((inv@67@01 r))
  :qid |unrelatedField-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@66@01 $Ref)) (!
  (=> (Seq_contains xs@63@01 x@66@01) (not (= x@66@01 $Ref.null)))
  :pattern ((Seq_contains xs@63@01 x@66@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@66@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@66@01))
  :pattern ((inv@67@01 x@66@01))
  :pattern ((img@68@01 x@66@01))
  :qid |unrelatedField-permImpliesNonNull|)))
(declare-const x@69@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@63@01 x@69@01))
(pop) ; 2
(declare-fun inv@70@01 ($Ref Bool) $Ref)
(declare-fun img@71@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@69@01 $Ref) (x2@69@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@63@01 x1@69@01)
      (Seq_contains xs@63@01 x2@69@01)
      (= x1@69@01 x2@69@01))
    (= x1@69@01 x2@69@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@69@01 $Ref)) (!
  (=>
    (Seq_contains xs@63@01 x@69@01)
    (and (= (inv@70@01 x@69@01 b@64@01) x@69@01) (img@71@01 x@69@01 b@64@01)))
  :pattern ((Seq_contains xs@63@01 x@69@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@69@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@69@01))
  :pattern ((inv@70@01 x@69@01 b@64@01))
  :pattern ((img@71@01 x@69@01 b@64@01))
  :qid |quant-u-35|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@71@01 this b) (Seq_contains xs@63@01 (inv@70@01 this b)))
    (and (= (inv@70@01 this b) this) (= b@64@01 b)))
  :pattern ((inv@70@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@72@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@63@01 x@72@01))
(pop) ; 3
(declare-const $t@73@01 $PSF<valid>)
(declare-fun inv@74@01 ($Ref Bool) $Ref)
(declare-fun img@75@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@72@01 $Ref) (x2@72@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@63@01 x1@72@01)
      (Seq_contains xs@63@01 x2@72@01)
      (= x1@72@01 x2@72@01))
    (= x1@72@01 x2@72@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@72@01 $Ref)) (!
  (=>
    (Seq_contains xs@63@01 x@72@01)
    (and (= (inv@74@01 x@72@01 b@64@01) x@72@01) (img@75@01 x@72@01 b@64@01)))
  :pattern ((Seq_contains xs@63@01 x@72@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@72@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@72@01))
  :pattern ((inv@74@01 x@72@01 b@64@01))
  :pattern ((img@75@01 x@72@01 b@64@01))
  :qid |quant-u-37|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@75@01 this b) (Seq_contains xs@63@01 (inv@74@01 this b)))
    (and (= (inv@74@01 this b) this) (= b@64@01 b)))
  :pattern ((inv@74@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this, b), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@76@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@62@01) (= b b@64@01))
    ($Perm.min
      (ite
        (and (img@71@01 this b) (Seq_contains xs@63@01 (inv@70@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@71@01 this b) (Seq_contains xs@63@01 (inv@70@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@76@01 this b))
    $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@76@01 this b) $Perm.No)
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@62@01) (= b b@64@01))
    (= (- $Perm.Write (pTaken@76@01 this b)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@77@01 $PSF<valid>)
(declare-const s@78@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@71@01 this@62@01 b@64@01)
    (Seq_contains xs@63@01 (inv@70@01 this@62@01 b@64@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@62@01)
          ($SortWrappers.BoolTo$Snap b@64@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@77@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@62@01)
        ($SortWrappers.BoolTo$Snap b@64@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@65@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@62@01)
        ($SortWrappers.BoolTo$Snap b@64@01)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@64@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@64@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | b@64@01 | live]
; [else-branch: 14 | !(b@64@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | b@64@01]
(assert b@64@01)
(assert (not (= this@62@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($PSF.lookup_valid (as sm@77@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@62@01)
  ($SortWrappers.BoolTo$Snap b@64@01))) this@62@01 b@64@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@64@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | b@64@01 | live]
; [else-branch: 15 | !(b@64@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | b@64@01]
; [exec]
; this.f := 1
; [exec]
; fold acc(valid(this, b), write)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@64@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | b@64@01 | live]
; [else-branch: 16 | !(b@64@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | b@64@01]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 1) this@62@01 b@64@01))
(declare-const sm@79@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@79@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@62@01)
    ($SortWrappers.BoolTo$Snap b@64@01)))
  ($SortWrappers.IntTo$Snap 1)))
; [exec]
; unrelated(this)
; Precomputing data for removing quantified permissions
(define-fun pTaken@80@01 ((r $Ref)) $Perm
  (ite
    (= r this@62@01)
    ($Perm.min
      (ite
        (and (img@68@01 r) (Seq_contains xs@63@01 (inv@67@01 r)))
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
        (and (img@68@01 r) (Seq_contains xs@63@01 (inv@67@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@80@01 r))
    $Perm.No)
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@80@01 r) $Perm.No)
  
  :qid |quant-u-44|))))
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
  (=> (= r this@62@01) (= (- $Perm.Write (pTaken@80@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@81@01 $FVF<unrelatedField>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@68@01 this@62@01) (Seq_contains xs@63@01 (inv@67@01 this@62@01)))
  (=
    ($FVF.lookup_unrelatedField (as sm@81@01  $FVF<unrelatedField>) this@62@01)
    ($FVF.lookup_unrelatedField ($SortWrappers.$SnapTo$FVF<unrelatedField> ($Snap.first ($Snap.second $t@65@01))) this@62@01))))
(declare-const $t@82@01 Int)
(declare-const sm@83@01 $FVF<unrelatedField>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_unrelatedField (as sm@83@01  $FVF<unrelatedField>) this@62@01)
  $t@82@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const x@84@01 $Ref)
(set-option :timeout 0)
(push) ; 6
; [eval] (x in xs)
(assert (Seq_contains xs@63@01 x@84@01))
(pop) ; 6
(declare-fun inv@85@01 ($Ref Bool) $Ref)
(declare-fun img@86@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((x1@84@01 $Ref) (x2@84@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@63@01 x1@84@01)
      (Seq_contains xs@63@01 x2@84@01)
      (= x1@84@01 x2@84@01))
    (= x1@84@01 x2@84@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@84@01 $Ref)) (!
  (=>
    (Seq_contains xs@63@01 x@84@01)
    (and (= (inv@85@01 x@84@01 b@64@01) x@84@01) (img@86@01 x@84@01 b@64@01)))
  :pattern ((Seq_contains xs@63@01 x@84@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@84@01))
  :pattern ((inv@85@01 x@84@01 b@64@01))
  :pattern ((img@86@01 x@84@01 b@64@01))
  :qid |valid-invOfFct|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@86@01 this b) (Seq_contains xs@63@01 (inv@85@01 this b)))
    (and (= (inv@85@01 this b) this) (= b@64@01 b)))
  :pattern ((inv@85@01 this b))
  :qid |valid-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@87@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and
      (Seq_contains xs@63@01 (inv@85@01 this b))
      (img@86@01 this b)
      (and (= this (inv@85@01 this b)) (= b b@64@01)))
    ($Perm.min
      (ite
        (and (img@71@01 this b) (Seq_contains xs@63@01 (inv@70@01 this b)))
        (- $Perm.Write (pTaken@76@01 this b))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@88@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and
      (Seq_contains xs@63@01 (inv@85@01 this b))
      (img@86@01 this b)
      (and (= this (inv@85@01 this b)) (= b b@64@01)))
    ($Perm.min
      (ite (and (= this this@62@01) (= b b@64@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@87@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@71@01 this b) (Seq_contains xs@63@01 (inv@70@01 this b)))
        (- $Perm.Write (pTaken@76@01 this b))
        $Perm.No)
      (pTaken@87@01 this b))
    $Perm.No)
  
  :qid |quant-u-48|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and
      (Seq_contains xs@63@01 (inv@85@01 this b))
      (img@86@01 this b)
      (and (= this (inv@85@01 this b)) (= b b@64@01)))
    (= (- $Perm.Write (pTaken@87@01 this b)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@88@01 this@62@01 b@64@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and
      (Seq_contains xs@63@01 (inv@85@01 this b))
      (img@86@01 this b)
      (and (= this (inv@85@01 this b)) (= b b@64@01)))
    (= (- (- $Perm.Write (pTaken@87@01 this b)) (pTaken@88@01 this b)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@89@01 $PSF<valid>)
(declare-const s@90@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@90@01 $Snap)) (!
  (and
    (=>
      (Set_in s@90@01 ($PSF.domain_valid (as sm@89@01  $PSF<valid>)))
      (and
        (Seq_contains
          xs@63@01
          (inv@85@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01))))
        (img@86@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01)))))
    (=>
      (and
        (Seq_contains
          xs@63@01
          (inv@85@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01))))
        (img@86@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01))))
      (Set_in s@90@01 ($PSF.domain_valid (as sm@89@01  $PSF<valid>)))))
  :pattern ((Set_in s@90@01 ($PSF.domain_valid (as sm@89@01  $PSF<valid>))))
  :qid |qp.psmDomDef13|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@90@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@63@01
          (inv@85@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01))))
        (img@86@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01))))
      (ite
        (and
          (img@71@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01)))
          (Seq_contains
            xs@63@01
            (inv@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01)))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01)))))
        false))
    (and
      (not (= s@90@01 $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@89@01  $PSF<valid>) s@90@01)
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@65@01))) s@90@01))))
  :pattern (($PSF.lookup_valid (as sm@89@01  $PSF<valid>) s@90@01))
  :pattern (($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@65@01))) s@90@01))
  :qid |qp.psmValDef11|)))
(assert (forall ((s@90@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@63@01
          (inv@85@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01))))
        (img@86@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToBool ($Snap.second s@90@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) this@62@01)
        (= ($SortWrappers.$SnapToBool ($Snap.second s@90@01)) b@64@01)))
    (and
      (not (= s@90@01 $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@89@01  $PSF<valid>) s@90@01)
        ($PSF.lookup_valid (as sm@79@01  $PSF<valid>) s@90@01))))
  :pattern (($PSF.lookup_valid (as sm@89@01  $PSF<valid>) s@90@01))
  :pattern (($PSF.lookup_valid (as sm@79@01  $PSF<valid>) s@90@01))
  :qid |qp.psmValDef12|)))
(pop) ; 5
(pop) ; 4
; [eval] !b
; [then-branch: 17 | !(b@64@01) | dead]
; [else-branch: 17 | b@64@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 17 | b@64@01]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 14 | !(b@64@01)]
(assert (not b@64@01))
(assert (not (= this@62@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($PSF.lookup_valid (as sm@77@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@62@01)
  ($SortWrappers.BoolTo$Snap b@64@01))) this@62@01 b@64@01))
; [then-branch: 18 | b@64@01 | dead]
; [else-branch: 18 | !(b@64@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 18 | !(b@64@01)]
(pop) ; 4
; [eval] !b
(push) ; 4
(set-option :timeout 10)
(assert (not b@64@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | !(b@64@01) | live]
; [else-branch: 19 | b@64@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | !(b@64@01)]
; [exec]
; this.g := 2
; [exec]
; fold acc(valid(this, b), write)
; [then-branch: 20 | b@64@01 | dead]
; [else-branch: 20 | !(b@64@01) | live]
(push) ; 5
; [else-branch: 20 | !(b@64@01)]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 2) this@62@01 b@64@01))
(declare-const sm@91@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@91@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@62@01)
    ($SortWrappers.BoolTo$Snap b@64@01)))
  ($SortWrappers.IntTo$Snap 2)))
; [exec]
; unrelated(this)
; Precomputing data for removing quantified permissions
(define-fun pTaken@92@01 ((r $Ref)) $Perm
  (ite
    (= r this@62@01)
    ($Perm.min
      (ite
        (and (img@68@01 r) (Seq_contains xs@63@01 (inv@67@01 r)))
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
        (and (img@68@01 r) (Seq_contains xs@63@01 (inv@67@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@92@01 r))
    $Perm.No)
  
  :qid |quant-u-53|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@92@01 r) $Perm.No)
  
  :qid |quant-u-54|))))
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
  (=> (= r this@62@01) (= (- $Perm.Write (pTaken@92@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@93@01 $FVF<unrelatedField>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@68@01 this@62@01) (Seq_contains xs@63@01 (inv@67@01 this@62@01)))
  (=
    ($FVF.lookup_unrelatedField (as sm@93@01  $FVF<unrelatedField>) this@62@01)
    ($FVF.lookup_unrelatedField ($SortWrappers.$SnapTo$FVF<unrelatedField> ($Snap.first ($Snap.second $t@65@01))) this@62@01))))
(declare-const $t@94@01 Int)
(declare-const sm@95@01 $FVF<unrelatedField>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_unrelatedField (as sm@95@01  $FVF<unrelatedField>) this@62@01)
  $t@94@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const x@96@01 $Ref)
(set-option :timeout 0)
(push) ; 6
; [eval] (x in xs)
(assert (Seq_contains xs@63@01 x@96@01))
(pop) ; 6
(declare-fun inv@97@01 ($Ref Bool) $Ref)
(declare-fun img@98@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((x1@96@01 $Ref) (x2@96@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@63@01 x1@96@01)
      (Seq_contains xs@63@01 x2@96@01)
      (= x1@96@01 x2@96@01))
    (= x1@96@01 x2@96@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@96@01 $Ref)) (!
  (=>
    (Seq_contains xs@63@01 x@96@01)
    (and (= (inv@97@01 x@96@01 b@64@01) x@96@01) (img@98@01 x@96@01 b@64@01)))
  :pattern ((Seq_contains xs@63@01 x@96@01))
  :pattern ((Seq_contains_trigger xs@63@01 x@96@01))
  :pattern ((inv@97@01 x@96@01 b@64@01))
  :pattern ((img@98@01 x@96@01 b@64@01))
  :qid |valid-invOfFct|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@98@01 this b) (Seq_contains xs@63@01 (inv@97@01 this b)))
    (and (= (inv@97@01 this b) this) (= b@64@01 b)))
  :pattern ((inv@97@01 this b))
  :qid |valid-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@99@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and
      (Seq_contains xs@63@01 (inv@97@01 this b))
      (img@98@01 this b)
      (and (= this (inv@97@01 this b)) (= b b@64@01)))
    ($Perm.min
      (ite
        (and (img@71@01 this b) (Seq_contains xs@63@01 (inv@70@01 this b)))
        (- $Perm.Write (pTaken@76@01 this b))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@100@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and
      (Seq_contains xs@63@01 (inv@97@01 this b))
      (img@98@01 this b)
      (and (= this (inv@97@01 this b)) (= b b@64@01)))
    ($Perm.min
      (ite (and (= this this@62@01) (= b b@64@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@99@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@71@01 this b) (Seq_contains xs@63@01 (inv@70@01 this b)))
        (- $Perm.Write (pTaken@76@01 this b))
        $Perm.No)
      (pTaken@99@01 this b))
    $Perm.No)
  
  :qid |quant-u-58|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and
      (Seq_contains xs@63@01 (inv@97@01 this b))
      (img@98@01 this b)
      (and (= this (inv@97@01 this b)) (= b b@64@01)))
    (= (- $Perm.Write (pTaken@99@01 this b)) $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@100@01 this@62@01 b@64@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and
      (Seq_contains xs@63@01 (inv@97@01 this b))
      (img@98@01 this b)
      (and (= this (inv@97@01 this b)) (= b b@64@01)))
    (= (- (- $Perm.Write (pTaken@99@01 this b)) (pTaken@100@01 this b)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@101@01 $PSF<valid>)
(declare-const s@102@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@102@01 $Snap)) (!
  (and
    (=>
      (Set_in s@102@01 ($PSF.domain_valid (as sm@101@01  $PSF<valid>)))
      (and
        (Seq_contains
          xs@63@01
          (inv@97@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01))))
        (img@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01)))))
    (=>
      (and
        (Seq_contains
          xs@63@01
          (inv@97@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01))))
        (img@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01))))
      (Set_in s@102@01 ($PSF.domain_valid (as sm@101@01  $PSF<valid>)))))
  :pattern ((Set_in s@102@01 ($PSF.domain_valid (as sm@101@01  $PSF<valid>))))
  :qid |qp.psmDomDef17|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@102@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@63@01
          (inv@97@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01))))
        (img@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01))))
      (ite
        (and
          (img@71@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01)))
          (Seq_contains
            xs@63@01
            (inv@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01)))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01)))))
        false))
    (and
      (not (= s@102@01 $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@101@01  $PSF<valid>) s@102@01)
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@65@01))) s@102@01))))
  :pattern (($PSF.lookup_valid (as sm@101@01  $PSF<valid>) s@102@01))
  :pattern (($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@65@01))) s@102@01))
  :qid |qp.psmValDef15|)))
(assert (forall ((s@102@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@63@01
          (inv@97@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01))))
        (img@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) ($SortWrappers.$SnapToBool ($Snap.second s@102@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@01)) this@62@01)
        (= ($SortWrappers.$SnapToBool ($Snap.second s@102@01)) b@64@01)))
    (and
      (not (= s@102@01 $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@101@01  $PSF<valid>) s@102@01)
        ($PSF.lookup_valid (as sm@91@01  $PSF<valid>) s@102@01))))
  :pattern (($PSF.lookup_valid (as sm@101@01  $PSF<valid>) s@102@01))
  :pattern (($PSF.lookup_valid (as sm@91@01  $PSF<valid>) s@102@01))
  :qid |qp.psmValDef16|)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t1_4 ----------
(declare-const this@103@01 $Ref)
(declare-const xs@104@01 Seq<$Ref>)
(declare-const b@105@01 Bool)
(declare-const this@106@01 $Ref)
(declare-const xs@107@01 Seq<$Ref>)
(declare-const b@108@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@109@01 $Snap)
(assert (= $t@109@01 ($Snap.combine ($Snap.first $t@109@01) ($Snap.second $t@109@01))))
(assert (= ($Snap.first $t@109@01) $Snap.unit))
; [eval] (this in xs)
(assert (Seq_contains xs@107@01 this@106@01))
(assert (=
  ($Snap.second $t@109@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@109@01))
    ($Snap.second ($Snap.second $t@109@01)))))
(assert (not (= this@106@01 $Ref.null)))
(declare-const x@110@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@107@01 x@110@01))
(pop) ; 2
(declare-fun inv@111@01 ($Ref Bool) $Ref)
(declare-fun img@112@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@110@01 $Ref) (x2@110@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@107@01 x1@110@01)
      (Seq_contains xs@107@01 x2@110@01)
      (= x1@110@01 x2@110@01))
    (= x1@110@01 x2@110@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@110@01 $Ref)) (!
  (=>
    (Seq_contains xs@107@01 x@110@01)
    (and
      (= (inv@111@01 x@110@01 b@108@01) x@110@01)
      (img@112@01 x@110@01 b@108@01)))
  :pattern ((Seq_contains xs@107@01 x@110@01))
  :pattern ((Seq_contains_trigger xs@107@01 x@110@01))
  :pattern ((Seq_contains_trigger xs@107@01 x@110@01))
  :pattern ((inv@111@01 x@110@01 b@108@01))
  :pattern ((img@112@01 x@110@01 b@108@01))
  :qid |quant-u-63|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@112@01 this b) (Seq_contains xs@107@01 (inv@111@01 this b)))
    (and (= (inv@111@01 this b) this) (= b@108@01 b)))
  :pattern ((inv@111@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@113@01 $Snap)
(declare-const sm@114@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@114@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@106@01)
    ($SortWrappers.BoolTo$Snap b@108@01)))
  $t@113@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this, b), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@115@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@106@01) (= b b@108@01))
    ($Perm.min
      (ite
        (and (img@112@01 this b) (Seq_contains xs@107@01 (inv@111@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@112@01 this b) (Seq_contains xs@107@01 (inv@111@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@115@01 this b))
    $Perm.No)
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@115@01 this b) $Perm.No)
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@106@01) (= b b@108@01))
    (= (- $Perm.Write (pTaken@115@01 this b)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@116@01 $PSF<valid>)
(declare-const s@117@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@112@01 this@106@01 b@108@01)
    (Seq_contains xs@107@01 (inv@111@01 this@106@01 b@108@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@106@01)
          ($SortWrappers.BoolTo$Snap b@108@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@116@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@106@01)
        ($SortWrappers.BoolTo$Snap b@108@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@109@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@106@01)
        ($SortWrappers.BoolTo$Snap b@108@01)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@108@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@108@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | b@108@01 | live]
; [else-branch: 21 | !(b@108@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 21 | b@108@01]
(assert b@108@01)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($PSF.lookup_valid (as sm@116@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@106@01)
  ($SortWrappers.BoolTo$Snap b@108@01))) this@106@01 b@108@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@108@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | b@108@01 | live]
; [else-branch: 22 | !(b@108@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | b@108@01]
; [exec]
; this.f := 1
; [exec]
; fold acc(valid(this, b), write)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@108@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | b@108@01 | live]
; [else-branch: 23 | !(b@108@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | b@108@01]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 1) this@106@01 b@108@01))
(declare-const sm@118@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@118@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@106@01)
    ($SortWrappers.BoolTo$Snap b@108@01)))
  ($SortWrappers.IntTo$Snap 1)))
; [exec]
; unrelated(this)
(declare-const $t@119@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@120@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@106@01) (= b b@108@01))
    ($Perm.min
      (ite (and (= this this@106@01) (= b b@108@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@121@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@106@01) (= b b@108@01))
    ($Perm.min
      (ite
        (and (img@112@01 this b) (Seq_contains xs@107@01 (inv@111@01 this b)))
        (- $Perm.Write (pTaken@115@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@120@01 this b)))
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
(assert (not (= (- $Perm.Write (pTaken@120@01 this@106@01 b@108@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@106@01) (= b b@108@01))
    (= (- $Perm.Write (pTaken@120@01 this b)) $Perm.No))
  
  :qid |quant-u-70|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@122@01 $PSF<valid>)
(declare-const s@123@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@106@01)
        ($SortWrappers.BoolTo$Snap b@108@01))
      $Snap.unit))
  (=
    ($PSF.lookup_valid (as sm@122@01  $PSF<valid>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap this@106@01)
      ($SortWrappers.BoolTo$Snap b@108@01)))
    ($PSF.lookup_valid (as sm@118@01  $PSF<valid>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap this@106@01)
      ($SortWrappers.BoolTo$Snap b@108@01))))))
(assert (=>
  (ite
    (and
      (img@112@01 this@106@01 b@108@01)
      (Seq_contains xs@107@01 (inv@111@01 this@106@01 b@108@01)))
    (< $Perm.No (- $Perm.Write (pTaken@115@01 this@106@01 b@108@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@106@01)
          ($SortWrappers.BoolTo$Snap b@108@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@122@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@106@01)
        ($SortWrappers.BoolTo$Snap b@108@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@109@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@106@01)
        ($SortWrappers.BoolTo$Snap b@108@01)))))))
(pop) ; 5
(pop) ; 4
; [eval] !b
; [then-branch: 24 | !(b@108@01) | dead]
; [else-branch: 24 | b@108@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 24 | b@108@01]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 21 | !(b@108@01)]
(assert (not b@108@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($PSF.lookup_valid (as sm@116@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@106@01)
  ($SortWrappers.BoolTo$Snap b@108@01))) this@106@01 b@108@01))
; [then-branch: 25 | b@108@01 | dead]
; [else-branch: 25 | !(b@108@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 25 | !(b@108@01)]
(pop) ; 4
; [eval] !b
(push) ; 4
(set-option :timeout 10)
(assert (not b@108@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | !(b@108@01) | live]
; [else-branch: 26 | b@108@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 26 | !(b@108@01)]
; [exec]
; this.g := 2
; [exec]
; fold acc(valid(this, b), write)
; [then-branch: 27 | b@108@01 | dead]
; [else-branch: 27 | !(b@108@01) | live]
(push) ; 5
; [else-branch: 27 | !(b@108@01)]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 2) this@106@01 b@108@01))
(declare-const sm@124@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@124@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@106@01)
    ($SortWrappers.BoolTo$Snap b@108@01)))
  ($SortWrappers.IntTo$Snap 2)))
; [exec]
; unrelated(this)
(declare-const $t@125@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@126@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@106@01) (= b b@108@01))
    ($Perm.min
      (ite (and (= this this@106@01) (= b b@108@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@127@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@106@01) (= b b@108@01))
    ($Perm.min
      (ite
        (and (img@112@01 this b) (Seq_contains xs@107@01 (inv@111@01 this b)))
        (- $Perm.Write (pTaken@115@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@126@01 this b)))
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
(assert (not (= (- $Perm.Write (pTaken@126@01 this@106@01 b@108@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@106@01) (= b b@108@01))
    (= (- $Perm.Write (pTaken@126@01 this b)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@128@01 $PSF<valid>)
(declare-const s@129@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@106@01)
        ($SortWrappers.BoolTo$Snap b@108@01))
      $Snap.unit))
  (=
    ($PSF.lookup_valid (as sm@128@01  $PSF<valid>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap this@106@01)
      ($SortWrappers.BoolTo$Snap b@108@01)))
    ($PSF.lookup_valid (as sm@124@01  $PSF<valid>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap this@106@01)
      ($SortWrappers.BoolTo$Snap b@108@01))))))
(assert (=>
  (ite
    (and
      (img@112@01 this@106@01 b@108@01)
      (Seq_contains xs@107@01 (inv@111@01 this@106@01 b@108@01)))
    (< $Perm.No (- $Perm.Write (pTaken@115@01 this@106@01 b@108@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@106@01)
          ($SortWrappers.BoolTo$Snap b@108@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@128@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@106@01)
        ($SortWrappers.BoolTo$Snap b@108@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@109@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@106@01)
        ($SortWrappers.BoolTo$Snap b@108@01)))))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(declare-const x1@130@01 $Ref)
(declare-const x2@131@01 $Ref)
(declare-const x1@132@01 $Ref)
(declare-const x2@133@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@134@01 $Snap)
(assert (= $t@134@01 ($Snap.combine ($Snap.first $t@134@01) ($Snap.second $t@134@01))))
(assert (not (= x1@132@01 $Ref.null)))
(assert (=
  ($Snap.second $t@134@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@134@01))
    ($Snap.second ($Snap.second $t@134@01)))))
(assert (= ($Snap.first ($Snap.second $t@134@01)) $Snap.unit))
; [eval] x1 != x2
(assert (not (= x1@132@01 x2@133@01)))
(declare-const x@135@01 $Ref)
(push) ; 2
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@135@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
(pop) ; 2
(declare-fun inv@136@01 ($Ref) $Ref)
(declare-fun img@137@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@135@01 $Ref) (x2@135@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@135@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (Set_in x2@135@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (= x1@135@01 x2@135@01))
    (= x1@135@01 x2@135@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@135@01 $Ref)) (!
  (=>
    (Set_in x@135@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
    (and (= (inv@136@01 x@135@01) x@135@01) (img@137@01 x@135@01)))
  :pattern ((Set_in x@135@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
  :pattern ((inv@136@01 x@135@01))
  :pattern ((img@137@01 x@135@01))
  :qid |quant-u-75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@137@01 r)
      (Set_in (inv@136@01 r) (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
    (= (inv@136@01 r) r))
  :pattern ((inv@136@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@135@01 $Ref)) (!
  (=>
    (Set_in x@135@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
    (not (= x@135@01 $Ref.null)))
  :pattern ((Set_in x@135@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
  :pattern ((inv@136@01 x@135@01))
  :pattern ((img@137@01 x@135@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@138@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@138@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
(pop) ; 3
(declare-const $t@139@01 $PSF<valid>)
(declare-fun inv@140@01 ($Ref Bool) $Ref)
(declare-fun img@141@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@138@01 $Ref) (x2@138@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@138@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (Set_in x2@138@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (= x1@138@01 x2@138@01))
    (= x1@138@01 x2@138@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@138@01 $Ref)) (!
  (=>
    (Set_in x@138@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
    (and (= (inv@140@01 x@138@01 true) x@138@01) (img@141@01 x@138@01 true)))
  :pattern ((Set_in x@138@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
  :pattern ((inv@140@01 x@138@01 true))
  :pattern ((img@141@01 x@138@01 true))
  :qid |quant-u-77|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and
      (img@141@01 this b)
      (Set_in (inv@140@01 this b) (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
    (and (= (inv@140@01 this b) this) (= true b)))
  :pattern ((inv@140@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(valid(x1, true), write)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 28 | True]
; Precomputing data for removing quantified permissions
(define-fun pTaken@142@01 ((r $Ref)) $Perm
  (ite
    (= r x1@132@01)
    ($Perm.min
      (ite
        (and
          (img@137@01 r)
          (Set_in (inv@136@01 r) (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
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
          (img@137@01 r)
          (Set_in (inv@136@01 r) (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@142@01 r))
    $Perm.No)
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@142@01 r) $Perm.No)
  
  :qid |quant-u-80|))))
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
  (=> (= r x1@132@01) (= (- $Perm.Write (pTaken@142@01 r)) $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@143@01 $FVF<f>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@137@01 x1@132@01)
    (Set_in (inv@136@01 x1@132@01) (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
  (=
    ($FVF.lookup_f (as sm@143@01  $FVF<f>) x1@132@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@134@01))) x1@132@01))))
(assert (valid%trigger ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@143@01  $FVF<f>) x1@132@01)) x1@132@01 true))
(declare-const sm@144@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@144@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@132@01)
    ($SortWrappers.BoolTo$Snap true)))
  ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@143@01  $FVF<f>) x1@132@01))))
; [exec]
; fold acc(valid(x2, true), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 29 | True]
; Precomputing data for removing quantified permissions
(define-fun pTaken@145@01 ((r $Ref)) $Perm
  (ite
    (= r x2@133@01)
    ($Perm.min
      (ite
        (and
          (img@137@01 r)
          (Set_in (inv@136@01 r) (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
        (- $Perm.Write (pTaken@142@01 r))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@137@01 r)
          (Set_in (inv@136@01 r) (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
        (- $Perm.Write (pTaken@142@01 r))
        $Perm.No)
      (pTaken@145@01 r))
    $Perm.No)
  
  :qid |quant-u-83|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r x2@133@01) (= (- $Perm.Write (pTaken@145@01 r)) $Perm.No))
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@146@01 $FVF<f>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@137@01 x2@133@01)
      (Set_in (inv@136@01 x2@133@01) (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
    (< $Perm.No (- $Perm.Write (pTaken@142@01 x2@133@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@146@01  $FVF<f>) x2@133@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@134@01))) x2@133@01))))
(assert (valid%trigger ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@146@01  $FVF<f>) x2@133@01)) x2@133@01 true))
(declare-const sm@147@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@147@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@133@01)
    ($SortWrappers.BoolTo$Snap true)))
  ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@146@01  $FVF<f>) x2@133@01))))
; [exec]
; unrelated(x1)
(declare-const $t@148@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const x@149@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@149@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
(pop) ; 5
(declare-fun inv@150@01 ($Ref Bool) $Ref)
(declare-fun img@151@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@149@01 $Ref) (x2@149@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@149@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (Set_in x2@149@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (= x1@149@01 x2@149@01))
    (= x1@149@01 x2@149@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@149@01 $Ref)) (!
  (=>
    (Set_in x@149@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01))
    (and (= (inv@150@01 x@149@01 true) x@149@01) (img@151@01 x@149@01 true)))
  :pattern ((Set_in x@149@01 (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
  :pattern ((inv@150@01 x@149@01 true))
  :pattern ((img@151@01 x@149@01 true))
  :qid |valid-invOfFct|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and
      (img@151@01 this b)
      (Set_in (inv@150@01 this b) (Set_unionone (Set_singleton x1@132@01) x2@133@01)))
    (and (= (inv@150@01 this b) this) (= true b)))
  :pattern ((inv@150@01 this b))
  :qid |valid-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@152@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and
      (Set_in (inv@150@01 this b) (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (img@151@01 this b)
      (and (= this (inv@150@01 this b)) (= b true)))
    ($Perm.min
      (ite (and (= this x2@133@01) (= b true)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@153@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and
      (Set_in (inv@150@01 this b) (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (img@151@01 this b)
      (and (= this (inv@150@01 this b)) (= b true)))
    ($Perm.min
      (ite (and (= this x1@132@01) (= b true)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@152@01 this b)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (- (ite (= true true) $Perm.Write $Perm.No) (pTaken@152@01 x2@133@01 true))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and
      (Set_in (inv@150@01 this b) (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (img@151@01 this b)
      (and (= this (inv@150@01 this b)) (= b true)))
    (= (- $Perm.Write (pTaken@152@01 this b)) $Perm.No))
  
  :qid |quant-u-88|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (- (ite (= true true) $Perm.Write $Perm.No) (pTaken@153@01 x1@132@01 true))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and
      (Set_in (inv@150@01 this b) (Set_unionone (Set_singleton x1@132@01) x2@133@01))
      (img@151@01 this b)
      (and (= this (inv@150@01 this b)) (= b true)))
    (=
      (- (- $Perm.Write (pTaken@152@01 this b)) (pTaken@153@01 this b))
      $Perm.No))
  
  :qid |quant-u-90|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@154@01 $PSF<valid>)
(declare-const s@155@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@155@01 $Snap)) (!
  (and
    (=>
      (Set_in s@155@01 ($PSF.domain_valid (as sm@154@01  $PSF<valid>)))
      (and
        (Set_in (inv@150@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) ($SortWrappers.$SnapToBool ($Snap.second s@155@01))) (Set_unionone (Set_singleton x1@132@01) x2@133@01))
        (img@151@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) ($SortWrappers.$SnapToBool ($Snap.second s@155@01)))))
    (=>
      (and
        (Set_in (inv@150@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) ($SortWrappers.$SnapToBool ($Snap.second s@155@01))) (Set_unionone (Set_singleton x1@132@01) x2@133@01))
        (img@151@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) ($SortWrappers.$SnapToBool ($Snap.second s@155@01))))
      (Set_in s@155@01 ($PSF.domain_valid (as sm@154@01  $PSF<valid>)))))
  :pattern ((Set_in s@155@01 ($PSF.domain_valid (as sm@154@01  $PSF<valid>))))
  :qid |qp.psmDomDef27|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@155@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@150@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) ($SortWrappers.$SnapToBool ($Snap.second s@155@01))) (Set_unionone (Set_singleton x1@132@01) x2@133@01))
        (img@151@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) ($SortWrappers.$SnapToBool ($Snap.second s@155@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) x2@133@01)
        (= ($SortWrappers.$SnapToBool ($Snap.second s@155@01)) true)))
    (and
      (not (= s@155@01 $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@154@01  $PSF<valid>) s@155@01)
        ($PSF.lookup_valid (as sm@147@01  $PSF<valid>) s@155@01))))
  :pattern (($PSF.lookup_valid (as sm@154@01  $PSF<valid>) s@155@01))
  :pattern (($PSF.lookup_valid (as sm@147@01  $PSF<valid>) s@155@01))
  :qid |qp.psmValDef25|)))
(assert (forall ((s@155@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@150@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) ($SortWrappers.$SnapToBool ($Snap.second s@155@01))) (Set_unionone (Set_singleton x1@132@01) x2@133@01))
        (img@151@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) ($SortWrappers.$SnapToBool ($Snap.second s@155@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@155@01)) x1@132@01)
        (= ($SortWrappers.$SnapToBool ($Snap.second s@155@01)) true)))
    (and
      (not (= s@155@01 $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@154@01  $PSF<valid>) s@155@01)
        ($PSF.lookup_valid (as sm@144@01  $PSF<valid>) s@155@01))))
  :pattern (($PSF.lookup_valid (as sm@154@01  $PSF<valid>) s@155@01))
  :pattern (($PSF.lookup_valid (as sm@144@01  $PSF<valid>) s@155@01))
  :qid |qp.psmValDef26|)))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t2_b ----------
(declare-const x1@156@01 $Ref)
(declare-const x2@157@01 $Ref)
(declare-const x1@158@01 $Ref)
(declare-const x2@159@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@160@01 $Snap)
(assert (= $t@160@01 ($Snap.combine ($Snap.first $t@160@01) ($Snap.second $t@160@01))))
(assert (not (= x1@158@01 $Ref.null)))
(declare-const x@161@01 $Ref)
(push) ; 2
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@161@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
(pop) ; 2
(declare-fun inv@162@01 ($Ref) $Ref)
(declare-fun img@163@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@161@01 $Ref) (x2@161@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@161@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01))
      (Set_in x2@161@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01))
      (= x1@161@01 x2@161@01))
    (= x1@161@01 x2@161@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@161@01 $Ref)) (!
  (=>
    (Set_in x@161@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01))
    (and (= (inv@162@01 x@161@01) x@161@01) (img@163@01 x@161@01)))
  :pattern ((Set_in x@161@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
  :pattern ((inv@162@01 x@161@01))
  :pattern ((img@163@01 x@161@01))
  :qid |quant-u-92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@163@01 r)
      (Set_in (inv@162@01 r) (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
    (= (inv@162@01 r) r))
  :pattern ((inv@162@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@161@01 $Ref)) (!
  (=>
    (Set_in x@161@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01))
    (not (= x@161@01 $Ref.null)))
  :pattern ((Set_in x@161@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
  :pattern ((inv@162@01 x@161@01))
  :pattern ((img@163@01 x@161@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@164@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@164@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
(pop) ; 3
(declare-const $t@165@01 $PSF<valid>)
(declare-fun inv@166@01 ($Ref Bool) $Ref)
(declare-fun img@167@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@164@01 $Ref) (x2@164@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@164@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01))
      (Set_in x2@164@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01))
      (= x1@164@01 x2@164@01))
    (= x1@164@01 x2@164@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@164@01 $Ref)) (!
  (=>
    (Set_in x@164@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01))
    (and (= (inv@166@01 x@164@01 true) x@164@01) (img@167@01 x@164@01 true)))
  :pattern ((Set_in x@164@01 (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
  :pattern ((inv@166@01 x@164@01 true))
  :pattern ((img@167@01 x@164@01 true))
  :qid |quant-u-94|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and
      (img@167@01 this b)
      (Set_in (inv@166@01 this b) (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
    (and (= (inv@166@01 this b) this) (= true b)))
  :pattern ((inv@166@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(valid(x2, false), write)
; [then-branch: 30 | False | dead]
; [else-branch: 30 | True | live]
(push) ; 3
; [else-branch: 30 | True]
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@168@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@163@01 r)
      (Set_in (inv@162@01 r) (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@160@01)) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@160@01)) r))
  :qid |qp.fvfValDef28|)))
(declare-const pm@169@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@169@01  $FPM) r)
    (ite
      (and
        (img@163@01 r)
        (Set_in (inv@162@01 r) (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@169@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@169@01  $FPM) r) $Perm.Write)
  :pattern ((inv@162@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@170@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@163@01 r)
      (Set_in (inv@162@01 r) (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
    (=
      ($FVF.lookup_f (as sm@170@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@160@01)) r)))
  :pattern (($FVF.lookup_f (as sm@170@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@160@01)) r))
  :qid |qp.fvfValDef30|)))
(declare-const pm@171@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@171@01  $FPM) r)
    (ite
      (and
        (img@163@01 r)
        (Set_in (inv@162@01 r) (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@171@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@171@01  $FPM) r) $Perm.Write)
  :pattern ((inv@162@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@172@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@163@01 r)
      (Set_in (inv@162@01 r) (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
    (=
      ($FVF.lookup_f (as sm@172@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@160@01)) r)))
  :pattern (($FVF.lookup_f (as sm@172@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@160@01)) r))
  :qid |qp.fvfValDef32|)))
(declare-const pm@173@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@173@01  $FPM) r)
    (ite
      (and
        (img@163@01 r)
        (Set_in (inv@162@01 r) (Set_unionone (Set_singleton x1@158@01) x2@159@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@173@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@173@01  $FPM) r) $Perm.Write)
  :pattern ((inv@162@01 r))
  :qid |qp-fld-prm-bnd|)))
; [then-branch: 31 | False | dead]
; [else-branch: 31 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 31 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t3_1 ----------
(declare-const this@174@01 $Ref)
(declare-const xs@175@01 Seq<$Ref>)
(declare-const b@176@01 Bool)
(declare-const this@177@01 $Ref)
(declare-const xs@178@01 Seq<$Ref>)
(declare-const b@179@01 Bool)
(push) ; 1
(declare-const $t@180@01 $Snap)
(assert (= $t@180@01 ($Snap.combine ($Snap.first $t@180@01) ($Snap.second $t@180@01))))
(assert (= ($Snap.first $t@180@01) $Snap.unit))
; [eval] (this in xs)
(assert (Seq_contains xs@178@01 this@177@01))
(assert (=
  ($Snap.second $t@180@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@180@01))
    ($Snap.second ($Snap.second $t@180@01)))))
(assert (not (= this@177@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@180@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@180@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@180@01))))))
(declare-const x@181@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@178@01 x@181@01))
(pop) ; 2
(declare-fun inv@182@01 ($Ref Bool) $Ref)
(declare-fun img@183@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@181@01 $Ref) (x2@181@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@178@01 x1@181@01)
      (Seq_contains xs@178@01 x2@181@01)
      (= x1@181@01 x2@181@01))
    (= x1@181@01 x2@181@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@181@01 $Ref)) (!
  (=>
    (Seq_contains xs@178@01 x@181@01)
    (and
      (= (inv@182@01 x@181@01 b@179@01) x@181@01)
      (img@183@01 x@181@01 b@179@01)))
  :pattern ((Seq_contains xs@178@01 x@181@01))
  :pattern ((Seq_contains_trigger xs@178@01 x@181@01))
  :pattern ((Seq_contains_trigger xs@178@01 x@181@01))
  :pattern ((inv@182@01 x@181@01 b@179@01))
  :pattern ((img@183@01 x@181@01 b@179@01))
  :qid |quant-u-96|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
    (and (= (inv@182@01 this b) this) (= b@179@01 b)))
  :pattern ((inv@182@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@180@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@180@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@180@01)))))))
(declare-const x@184@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@178@01 x@184@01))
; [eval] !b
(pop) ; 2
(declare-fun inv@185@01 ($Ref Bool) $Ref)
(declare-fun img@186@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@184@01 $Ref) (x2@184@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@178@01 x1@184@01)
      (Seq_contains xs@178@01 x2@184@01)
      (= x1@184@01 x2@184@01))
    (= x1@184@01 x2@184@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@184@01 $Ref)) (!
  (=>
    (Seq_contains xs@178@01 x@184@01)
    (and
      (= (inv@185@01 x@184@01 (not b@179@01)) x@184@01)
      (img@186@01 x@184@01 (not b@179@01))))
  :pattern ((Seq_contains xs@178@01 x@184@01))
  :pattern ((Seq_contains_trigger xs@178@01 x@184@01))
  :pattern ((Seq_contains_trigger xs@178@01 x@184@01))
  :qid |quant-u-98|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
    (and (= (inv@185@01 this b) this) (= (not b@179@01) b)))
  :pattern ((inv@185@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (and
    (= x@184@01 x@181@01)
    (=
      (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
      (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@180@01))))
  $Snap.unit))
; [eval] (unfolding acc(valid(this, false), write) in this.g == 2)
(set-option :timeout 0)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@187@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b false))
    ($Perm.min
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@188@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b false))
    ($Perm.min
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@187@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@187@01 this b))
    $Perm.No)
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@187@01 this b) $Perm.No)
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b false))
    (= (- $Perm.Write (pTaken@187@01 this b)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@188@01 this b))
    $Perm.No)
  
  :qid |quant-u-104|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@188@01 this b) $Perm.No)
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b false))
    (=
      (- (- $Perm.Write (pTaken@187@01 this b)) (pTaken@188@01 this b))
      $Perm.No))
  
  :qid |quant-u-106|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@189@01 $PSF<valid>)
(declare-const s@190@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@183@01 this@177@01 false)
    (Seq_contains xs@178@01 (inv@182@01 this@177@01 false)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@180@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (=>
  (and
    (img@186@01 this@177@01 false)
    (Seq_contains xs@178@01 (inv@185@01 this@177@01 false)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@180@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (valid%trigger ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@177@01)
  ($SortWrappers.BoolTo$Snap false))) this@177@01 false))
; [then-branch: 32 | False | dead]
; [else-branch: 32 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 32 | True]
; [eval] this.g == 2
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (and
      (img@183@01 this@177@01 false)
      (Seq_contains xs@178@01 (inv@182@01 this@177@01 false)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@177@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@180@01)))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (=>
    (and
      (img@186@01 this@177@01 false)
      (Seq_contains xs@178@01 (inv@185@01 this@177@01 false)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@177@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@180@01))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (valid%trigger ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap false))) this@177@01 false)))
(assert (=
  ($SortWrappers.$SnapToInt ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap false))))
  2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@191@01 $Snap)
(assert (= $t@191@01 ($Snap.combine ($Snap.first $t@191@01) ($Snap.second $t@191@01))))
(declare-const sm@192@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@192@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap b@179@01)))
  ($Snap.first $t@191@01)))
(assert (=
  ($Snap.second $t@191@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@191@01))
    ($Snap.second ($Snap.second $t@191@01)))))
; [eval] !b
(declare-const sm@193@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@193@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap (not b@179@01))))
  ($Snap.first ($Snap.second $t@191@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= (not b@179@01) b@179@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (ite (= (not b@179@01) (not b@179@01)) $Perm.Write $Perm.No)))
(assert (= ($Snap.second ($Snap.second $t@191@01)) $Snap.unit))
; [eval] (unfolding acc(valid(this, false), write) in this.g == 2)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= b@179@01 false)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (not b@179@01) false)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@194@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b false))
    ($Perm.min
      (ite (and (= this this@177@01) (= b b@179@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@195@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b false))
    ($Perm.min
      (ite (and (= this this@177@01) (= b (not b@179@01))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@194@01 this b)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@194@01 this@177@01 b@179@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@194@01 this b) $Perm.No)
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b false))
    (= (- $Perm.Write (pTaken@194@01 this b)) $Perm.No))
  
  :qid |quant-u-110|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (not b@179@01) (not b@179@01)) $Perm.Write $Perm.No)
    (pTaken@195@01 this@177@01 (not b@179@01)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@195@01 this b) $Perm.No)
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b false))
    (=
      (- (- $Perm.Write (pTaken@194@01 this b)) (pTaken@195@01 this b))
      $Perm.No))
  
  :qid |quant-u-113|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@196@01 $PSF<valid>)
(declare-const s@197@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= false b@179@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@196@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid (as sm@192@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (=>
  (= false (not b@179@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@196@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid (as sm@193@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (valid%trigger ($PSF.lookup_valid (as sm@196@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@177@01)
  ($SortWrappers.BoolTo$Snap false))) this@177@01 false))
; [then-branch: 33 | False | dead]
; [else-branch: 33 | True | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 33 | True]
; [eval] this.g == 2
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (=>
    (= false b@179@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@177@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@196@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid (as sm@192@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (=>
    (= false (not b@179@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@177@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@196@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid (as sm@193@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (valid%trigger ($PSF.lookup_valid (as sm@196@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap false))) this@177@01 false)))
(assert (=
  ($SortWrappers.$SnapToInt ($PSF.lookup_valid (as sm@196@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap false))))
  2))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this, true), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@198@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b true))
    ($Perm.min
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@199@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b true))
    ($Perm.min
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@198@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@198@01 this b))
    $Perm.No)
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@198@01 this b) $Perm.No)
  
  :qid |quant-u-116|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b true))
    (= (- $Perm.Write (pTaken@198@01 this b)) $Perm.No))
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@199@01 this b))
    $Perm.No)
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@199@01 this b) $Perm.No)
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b true))
    (=
      (- (- $Perm.Write (pTaken@198@01 this b)) (pTaken@199@01 this b))
      $Perm.No))
  
  :qid |quant-u-120|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@183@01 this@177@01 true)
    (Seq_contains xs@178@01 (inv@182@01 this@177@01 true)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap true))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap true)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@180@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap true)))))))
(assert (=>
  (and
    (img@186@01 this@177@01 true)
    (Seq_contains xs@178@01 (inv@185@01 this@177@01 true)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap true))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap true)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@180@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap true)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | True | live]
; [else-branch: 34 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 34 | True]
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($PSF.lookup_valid (as sm@189@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@177@01)
  ($SortWrappers.BoolTo$Snap true))) this@177@01 true))
; [exec]
; this.f := 1
; [exec]
; fold acc(valid(this, true), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | True | live]
; [else-branch: 35 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | True]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 1) this@177@01 true))
(declare-const sm@200@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@200@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap true)))
  ($SortWrappers.IntTo$Snap 1)))
(push) ; 5
(set-option :timeout 10)
(assert (not (= true b@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@201@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b b@179@01))
    ($Perm.min
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        (- $Perm.Write (pTaken@199@01 this b))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@202@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b b@179@01))
    ($Perm.min
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        (- $Perm.Write (pTaken@198@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@201@01 this b)))
    $Perm.No))
(define-fun pTaken@203@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b b@179@01))
    ($Perm.min
      (ite (and (= this this@177@01) (= b true)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@201@01 this b)) (pTaken@202@01 this b)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        (- $Perm.Write (pTaken@199@01 this b))
        $Perm.No)
      (pTaken@201@01 this b))
    $Perm.No)
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@201@01 this b) $Perm.No)
  
  :qid |quant-u-123|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b b@179@01))
    (= (- $Perm.Write (pTaken@201@01 this b)) $Perm.No))
  
  :qid |quant-u-124|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        (- $Perm.Write (pTaken@198@01 this b))
        $Perm.No)
      (pTaken@202@01 this b))
    $Perm.No)
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@202@01 this b) $Perm.No)
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b b@179@01))
    (=
      (- (- $Perm.Write (pTaken@201@01 this b)) (pTaken@202@01 this b))
      $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (- (ite (= true true) $Perm.Write $Perm.No) (pTaken@203@01 this@177@01 true))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@203@01 this b) $Perm.No)
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b b@179@01))
    (=
      (-
        (- (- $Perm.Write (pTaken@201@01 this b)) (pTaken@202@01 this b))
        (pTaken@203@01 this b))
      $Perm.No))
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@204@01 $PSF<valid>)
(declare-const s@205@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= b@179@01 true)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap b@179@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap b@179@01)))
      ($PSF.lookup_valid (as sm@200@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap b@179@01)))))))
(assert (=>
  (ite
    (and
      (img@186@01 this@177@01 b@179@01)
      (Seq_contains xs@178@01 (inv@185@01 this@177@01 b@179@01)))
    (< $Perm.No (- $Perm.Write (pTaken@199@01 this@177@01 b@179@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap b@179@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap b@179@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@180@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap b@179@01)))))))
(assert (=>
  (ite
    (and
      (img@183@01 this@177@01 b@179@01)
      (Seq_contains xs@178@01 (inv@182@01 this@177@01 b@179@01)))
    (< $Perm.No (- $Perm.Write (pTaken@198@01 this@177@01 b@179@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap b@179@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap b@179@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@180@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap b@179@01)))))))
; [eval] !b
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= true (not b@179@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@206@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b (not b@179@01)))
    ($Perm.min
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        (- (- $Perm.Write (pTaken@198@01 this b)) (pTaken@202@01 this b))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@207@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b (not b@179@01)))
    ($Perm.min
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        (- $Perm.Write (pTaken@199@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@206@01 this b)))
    $Perm.No))
(define-fun pTaken@208@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b (not b@179@01)))
    ($Perm.min
      (ite
        (and (= this this@177@01) (= b true))
        (- $Perm.Write (pTaken@203@01 this b))
        $Perm.No)
      (- (- $Perm.Write (pTaken@206@01 this b)) (pTaken@207@01 this b)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        (- (- $Perm.Write (pTaken@198@01 this b)) (pTaken@202@01 this b))
        $Perm.No)
      (pTaken@206@01 this b))
    $Perm.No)
  
  :qid |quant-u-132|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@206@01 this b) $Perm.No)
  
  :qid |quant-u-133|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b (not b@179@01)))
    (= (- $Perm.Write (pTaken@206@01 this b)) $Perm.No))
  
  :qid |quant-u-134|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        (- $Perm.Write (pTaken@199@01 this b))
        $Perm.No)
      (pTaken@207@01 this b))
    $Perm.No)
  
  :qid |quant-u-135|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@207@01 this b) $Perm.No)
  
  :qid |quant-u-136|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b (not b@179@01)))
    (=
      (- (- $Perm.Write (pTaken@206@01 this b)) (pTaken@207@01 this b))
      $Perm.No))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= true true) (- $Perm.Write (pTaken@203@01 this@177@01 true)) $Perm.No)
    (pTaken@208@01 this@177@01 true))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b (not b@179@01)))
    (=
      (-
        (- (- $Perm.Write (pTaken@206@01 this b)) (pTaken@207@01 this b))
        (pTaken@208@01 this b))
      $Perm.No))
  
  :qid |quant-u-139|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@209@01 $PSF<valid>)
(declare-const s@210@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (= (not b@179@01) true)
    (< $Perm.No (- $Perm.Write (pTaken@203@01 this@177@01 (not b@179@01))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap (not b@179@01)))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@209@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap (not b@179@01))))
      ($PSF.lookup_valid (as sm@200@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap (not b@179@01))))))))
(assert (=>
  (ite
    (and
      (img@183@01 this@177@01 (not b@179@01))
      (Seq_contains xs@178@01 (inv@182@01 this@177@01 (not b@179@01))))
    (<
      $Perm.No
      (-
        (- $Perm.Write (pTaken@198@01 this@177@01 (not b@179@01)))
        (pTaken@202@01 this@177@01 (not b@179@01))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap (not b@179@01)))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@209@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap (not b@179@01))))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@180@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap (not b@179@01))))))))
(assert (=>
  (ite
    (and
      (img@186@01 this@177@01 (not b@179@01))
      (Seq_contains xs@178@01 (inv@185@01 this@177@01 (not b@179@01))))
    (< $Perm.No (- $Perm.Write (pTaken@199@01 this@177@01 (not b@179@01))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap (not b@179@01)))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@209@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap (not b@179@01))))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@180@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap (not b@179@01))))))))
; [eval] (unfolding acc(valid(this, false), write) in this.g == 2)
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@211@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b false))
    ($Perm.min
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        (- $Perm.Write (pTaken@199@01 this b))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@212@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b false))
    ($Perm.min
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        (- $Perm.Write (pTaken@198@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@211@01 this b)))
    $Perm.No))
(define-fun pTaken@213@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@177@01) (= b false))
    ($Perm.min
      (ite (and (= this this@177@01) (= b true)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@211@01 this b)) (pTaken@212@01 this b)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@186@01 this b) (Seq_contains xs@178@01 (inv@185@01 this b)))
        (- $Perm.Write (pTaken@199@01 this b))
        $Perm.No)
      (pTaken@211@01 this b))
    $Perm.No)
  
  :qid |quant-u-141|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@211@01 this b) $Perm.No)
  
  :qid |quant-u-142|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b false))
    (= (- $Perm.Write (pTaken@211@01 this b)) $Perm.No))
  
  :qid |quant-u-143|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@183@01 this b) (Seq_contains xs@178@01 (inv@182@01 this b)))
        (- $Perm.Write (pTaken@198@01 this b))
        $Perm.No)
      (pTaken@212@01 this b))
    $Perm.No)
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@212@01 this b) $Perm.No)
  
  :qid |quant-u-145|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@177@01) (= b false))
    (=
      (- (- $Perm.Write (pTaken@211@01 this b)) (pTaken@212@01 this b))
      $Perm.No))
  
  :qid |quant-u-146|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= false true)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid (as sm@200@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (=>
  (ite
    (and
      (img@186@01 this@177@01 false)
      (Seq_contains xs@178@01 (inv@185@01 this@177@01 false)))
    (< $Perm.No (- $Perm.Write (pTaken@199@01 this@177@01 false)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@180@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (=>
  (ite
    (and
      (img@183@01 this@177@01 false)
      (Seq_contains xs@178@01 (inv@182@01 this@177@01 false)))
    (< $Perm.No (- $Perm.Write (pTaken@198@01 this@177@01 false)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@180@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@177@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (valid%trigger ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@177@01)
  ($SortWrappers.BoolTo$Snap false))) this@177@01 false))
; [then-branch: 36 | False | dead]
; [else-branch: 36 | True | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 36 | True]
; [eval] this.g == 2
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (and
  (=>
    (= false true)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@177@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid (as sm@200@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (=>
    (ite
      (and
        (img@186@01 this@177@01 false)
        (Seq_contains xs@178@01 (inv@185@01 this@177@01 false)))
      (< $Perm.No (- $Perm.Write (pTaken@199@01 this@177@01 false)))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@177@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@180@01))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (=>
    (ite
      (and
        (img@183@01 this@177@01 false)
        (Seq_contains xs@178@01 (inv@182@01 this@177@01 false)))
      (< $Perm.No (- $Perm.Write (pTaken@198@01 this@177@01 false)))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@177@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@180@01)))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@177@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (valid%trigger ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap false))) this@177@01 false)))
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap false))))
  2)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($PSF.lookup_valid (as sm@204@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@177@01)
    ($SortWrappers.BoolTo$Snap false))))
  2))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t3a ----------
(declare-const this@214@01 $Ref)
(declare-const xs@215@01 Seq<$Ref>)
(declare-const b@216@01 Bool)
(declare-const this@217@01 $Ref)
(declare-const xs@218@01 Seq<$Ref>)
(declare-const b@219@01 Bool)
(push) ; 1
(declare-const $t@220@01 $Snap)
(assert (= $t@220@01 ($Snap.combine ($Snap.first $t@220@01) ($Snap.second $t@220@01))))
(assert (= ($Snap.first $t@220@01) $Snap.unit))
; [eval] (this in xs)
(assert (Seq_contains xs@218@01 this@217@01))
(assert (=
  ($Snap.second $t@220@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@220@01))
    ($Snap.second ($Snap.second $t@220@01)))))
(assert (not (= this@217@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@220@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@220@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))
(declare-const x@221@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@218@01 x@221@01))
(pop) ; 2
(declare-fun inv@222@01 ($Ref Bool) $Ref)
(declare-fun img@223@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@221@01 $Ref) (x2@221@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@218@01 x1@221@01)
      (Seq_contains xs@218@01 x2@221@01)
      (= x1@221@01 x2@221@01))
    (= x1@221@01 x2@221@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@221@01 $Ref)) (!
  (=>
    (Seq_contains xs@218@01 x@221@01)
    (and
      (= (inv@222@01 x@221@01 b@219@01) x@221@01)
      (img@223@01 x@221@01 b@219@01)))
  :pattern ((Seq_contains xs@218@01 x@221@01))
  :pattern ((Seq_contains_trigger xs@218@01 x@221@01))
  :pattern ((Seq_contains_trigger xs@218@01 x@221@01))
  :pattern ((inv@222@01 x@221@01 b@219@01))
  :pattern ((img@223@01 x@221@01 b@219@01))
  :qid |quant-u-148|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
    (and (= (inv@222@01 this b) this) (= b@219@01 b)))
  :pattern ((inv@222@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@220@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))
(declare-const x@224@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@218@01 x@224@01))
; [eval] !b
(pop) ; 2
(declare-fun inv@225@01 ($Ref Bool) $Ref)
(declare-fun img@226@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@224@01 $Ref) (x2@224@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@218@01 x1@224@01)
      (Seq_contains xs@218@01 x2@224@01)
      (= x1@224@01 x2@224@01))
    (= x1@224@01 x2@224@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@224@01 $Ref)) (!
  (=>
    (Seq_contains xs@218@01 x@224@01)
    (and
      (= (inv@225@01 x@224@01 (not b@219@01)) x@224@01)
      (img@226@01 x@224@01 (not b@219@01))))
  :pattern ((Seq_contains xs@218@01 x@224@01))
  :pattern ((Seq_contains_trigger xs@218@01 x@224@01))
  :pattern ((Seq_contains_trigger xs@218@01 x@224@01))
  :qid |quant-u-150|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
    (and (= (inv@225@01 this b) this) (= (not b@219@01) b)))
  :pattern ((inv@225@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (and
    (= x@224@01 x@221@01)
    (=
      (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
      (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))))
  
  :qid |quant-u-151|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))
  $Snap.unit))
; [eval] (unfolding acc(valid(this, false), write) in this.g == 2)
(set-option :timeout 0)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@227@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b false))
    ($Perm.min
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@228@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b false))
    ($Perm.min
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@227@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@227@01 this b))
    $Perm.No)
  
  :qid |quant-u-153|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@227@01 this b) $Perm.No)
  
  :qid |quant-u-154|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b false))
    (= (- $Perm.Write (pTaken@227@01 this b)) $Perm.No))
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@228@01 this b))
    $Perm.No)
  
  :qid |quant-u-156|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@228@01 this b) $Perm.No)
  
  :qid |quant-u-157|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b false))
    (=
      (- (- $Perm.Write (pTaken@227@01 this b)) (pTaken@228@01 this b))
      $Perm.No))
  
  :qid |quant-u-158|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@229@01 $PSF<valid>)
(declare-const s@230@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@223@01 this@217@01 false)
    (Seq_contains xs@218@01 (inv@222@01 this@217@01 false)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@220@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (=>
  (and
    (img@226@01 this@217@01 false)
    (Seq_contains xs@218@01 (inv@225@01 this@217@01 false)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (valid%trigger ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@217@01)
  ($SortWrappers.BoolTo$Snap false))) this@217@01 false))
; [then-branch: 37 | False | dead]
; [else-branch: 37 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 37 | True]
; [eval] this.g == 2
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (and
      (img@223@01 this@217@01 false)
      (Seq_contains xs@218@01 (inv@222@01 this@217@01 false)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@217@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@220@01)))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (=>
    (and
      (img@226@01 this@217@01 false)
      (Seq_contains xs@218@01 (inv@225@01 this@217@01 false)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@217@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (valid%trigger ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap false))) this@217@01 false)))
(assert (=
  ($SortWrappers.$SnapToInt ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap false))))
  2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@231@01 $Snap)
(assert (= $t@231@01 ($Snap.combine ($Snap.first $t@231@01) ($Snap.second $t@231@01))))
(declare-const sm@232@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@232@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap b@219@01)))
  ($Snap.first $t@231@01)))
(assert (=
  ($Snap.second $t@231@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@231@01))
    ($Snap.second ($Snap.second $t@231@01)))))
; [eval] !b
(declare-const sm@233@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@233@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap (not b@219@01))))
  ($Snap.first ($Snap.second $t@231@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= (not b@219@01) b@219@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (ite (= (not b@219@01) (not b@219@01)) $Perm.Write $Perm.No)))
(assert (= ($Snap.second ($Snap.second $t@231@01)) $Snap.unit))
; [eval] (unfolding acc(valid(this, false), write) in this.g == 2)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= b@219@01 false)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (not b@219@01) false)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@234@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b false))
    ($Perm.min
      (ite (and (= this this@217@01) (= b b@219@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@235@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b false))
    ($Perm.min
      (ite (and (= this this@217@01) (= b (not b@219@01))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@234@01 this b)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@234@01 this@217@01 b@219@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@234@01 this b) $Perm.No)
  
  :qid |quant-u-161|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b false))
    (= (- $Perm.Write (pTaken@234@01 this b)) $Perm.No))
  
  :qid |quant-u-162|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (not b@219@01) (not b@219@01)) $Perm.Write $Perm.No)
    (pTaken@235@01 this@217@01 (not b@219@01)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@235@01 this b) $Perm.No)
  
  :qid |quant-u-164|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b false))
    (=
      (- (- $Perm.Write (pTaken@234@01 this b)) (pTaken@235@01 this b))
      $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@236@01 $PSF<valid>)
(declare-const s@237@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= false b@219@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@236@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid (as sm@232@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (=>
  (= false (not b@219@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@236@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid (as sm@233@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (valid%trigger ($PSF.lookup_valid (as sm@236@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@217@01)
  ($SortWrappers.BoolTo$Snap false))) this@217@01 false))
; [then-branch: 38 | False | dead]
; [else-branch: 38 | True | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 38 | True]
; [eval] this.g == 2
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (=>
    (= false b@219@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@217@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@236@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid (as sm@232@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (=>
    (= false (not b@219@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@217@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@236@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid (as sm@233@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (valid%trigger ($PSF.lookup_valid (as sm@236@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap false))) this@217@01 false)))
(assert (=
  ($SortWrappers.$SnapToInt ($PSF.lookup_valid (as sm@236@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap false))))
  2))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this, true), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@238@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b true))
    ($Perm.min
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@239@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b true))
    ($Perm.min
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@238@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@238@01 this b))
    $Perm.No)
  
  :qid |quant-u-167|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@238@01 this b) $Perm.No)
  
  :qid |quant-u-168|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b true))
    (= (- $Perm.Write (pTaken@238@01 this b)) $Perm.No))
  
  :qid |quant-u-169|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@239@01 this b))
    $Perm.No)
  
  :qid |quant-u-170|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@239@01 this b) $Perm.No)
  
  :qid |quant-u-171|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b true))
    (=
      (- (- $Perm.Write (pTaken@238@01 this b)) (pTaken@239@01 this b))
      $Perm.No))
  
  :qid |quant-u-172|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@223@01 this@217@01 true)
    (Seq_contains xs@218@01 (inv@222@01 this@217@01 true)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap true))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap true)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@220@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap true)))))))
(assert (=>
  (and
    (img@226@01 this@217@01 true)
    (Seq_contains xs@218@01 (inv@225@01 this@217@01 true)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap true))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap true)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap true)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | True | live]
; [else-branch: 39 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 39 | True]
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($PSF.lookup_valid (as sm@229@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@217@01)
  ($SortWrappers.BoolTo$Snap true))) this@217@01 true))
; [exec]
; this.f := 1
; [exec]
; fold acc(valid(this, true), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | True | live]
; [else-branch: 40 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 40 | True]
(assert (valid%trigger ($SortWrappers.IntTo$Snap 1) this@217@01 true))
(declare-const sm@240@01 $PSF<valid>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_valid (as sm@240@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap true)))
  ($SortWrappers.IntTo$Snap 1)))
; [exec]
; unrelated(this)
(declare-const $t@241@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= true b@219@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@242@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b b@219@01))
    ($Perm.min
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        (- $Perm.Write (pTaken@239@01 this b))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@243@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b b@219@01))
    ($Perm.min
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        (- $Perm.Write (pTaken@238@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@242@01 this b)))
    $Perm.No))
(define-fun pTaken@244@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b b@219@01))
    ($Perm.min
      (ite (and (= this this@217@01) (= b true)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@242@01 this b)) (pTaken@243@01 this b)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        (- $Perm.Write (pTaken@239@01 this b))
        $Perm.No)
      (pTaken@242@01 this b))
    $Perm.No)
  
  :qid |quant-u-174|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@242@01 this b) $Perm.No)
  
  :qid |quant-u-175|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b b@219@01))
    (= (- $Perm.Write (pTaken@242@01 this b)) $Perm.No))
  
  :qid |quant-u-176|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        (- $Perm.Write (pTaken@238@01 this b))
        $Perm.No)
      (pTaken@243@01 this b))
    $Perm.No)
  
  :qid |quant-u-177|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@243@01 this b) $Perm.No)
  
  :qid |quant-u-178|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b b@219@01))
    (=
      (- (- $Perm.Write (pTaken@242@01 this b)) (pTaken@243@01 this b))
      $Perm.No))
  
  :qid |quant-u-179|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (- (ite (= true true) $Perm.Write $Perm.No) (pTaken@244@01 this@217@01 true))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@244@01 this b) $Perm.No)
  
  :qid |quant-u-181|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b b@219@01))
    (=
      (-
        (- (- $Perm.Write (pTaken@242@01 this b)) (pTaken@243@01 this b))
        (pTaken@244@01 this b))
      $Perm.No))
  
  :qid |quant-u-182|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@245@01 $PSF<valid>)
(declare-const s@246@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= b@219@01 true)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap b@219@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap b@219@01)))
      ($PSF.lookup_valid (as sm@240@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap b@219@01)))))))
(assert (=>
  (ite
    (and
      (img@226@01 this@217@01 b@219@01)
      (Seq_contains xs@218@01 (inv@225@01 this@217@01 b@219@01)))
    (< $Perm.No (- $Perm.Write (pTaken@239@01 this@217@01 b@219@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap b@219@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap b@219@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap b@219@01)))))))
(assert (=>
  (ite
    (and
      (img@223@01 this@217@01 b@219@01)
      (Seq_contains xs@218@01 (inv@222@01 this@217@01 b@219@01)))
    (< $Perm.No (- $Perm.Write (pTaken@238@01 this@217@01 b@219@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap b@219@01))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap b@219@01)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@220@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap b@219@01)))))))
; [eval] !b
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= true (not b@219@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@247@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b (not b@219@01)))
    ($Perm.min
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        (- (- $Perm.Write (pTaken@238@01 this b)) (pTaken@243@01 this b))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@248@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b (not b@219@01)))
    ($Perm.min
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        (- $Perm.Write (pTaken@239@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@247@01 this b)))
    $Perm.No))
(define-fun pTaken@249@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b (not b@219@01)))
    ($Perm.min
      (ite
        (and (= this this@217@01) (= b true))
        (- $Perm.Write (pTaken@244@01 this b))
        $Perm.No)
      (- (- $Perm.Write (pTaken@247@01 this b)) (pTaken@248@01 this b)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        (- (- $Perm.Write (pTaken@238@01 this b)) (pTaken@243@01 this b))
        $Perm.No)
      (pTaken@247@01 this b))
    $Perm.No)
  
  :qid |quant-u-184|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@247@01 this b) $Perm.No)
  
  :qid |quant-u-185|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b (not b@219@01)))
    (= (- $Perm.Write (pTaken@247@01 this b)) $Perm.No))
  
  :qid |quant-u-186|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        (- $Perm.Write (pTaken@239@01 this b))
        $Perm.No)
      (pTaken@248@01 this b))
    $Perm.No)
  
  :qid |quant-u-187|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@248@01 this b) $Perm.No)
  
  :qid |quant-u-188|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b (not b@219@01)))
    (=
      (- (- $Perm.Write (pTaken@247@01 this b)) (pTaken@248@01 this b))
      $Perm.No))
  
  :qid |quant-u-189|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= true true) (- $Perm.Write (pTaken@244@01 this@217@01 true)) $Perm.No)
    (pTaken@249@01 this@217@01 true))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b (not b@219@01)))
    (=
      (-
        (- (- $Perm.Write (pTaken@247@01 this b)) (pTaken@248@01 this b))
        (pTaken@249@01 this b))
      $Perm.No))
  
  :qid |quant-u-191|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@250@01 $PSF<valid>)
(declare-const s@251@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (= (not b@219@01) true)
    (< $Perm.No (- $Perm.Write (pTaken@244@01 this@217@01 (not b@219@01))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap (not b@219@01)))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@250@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap (not b@219@01))))
      ($PSF.lookup_valid (as sm@240@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap (not b@219@01))))))))
(assert (=>
  (ite
    (and
      (img@223@01 this@217@01 (not b@219@01))
      (Seq_contains xs@218@01 (inv@222@01 this@217@01 (not b@219@01))))
    (<
      $Perm.No
      (-
        (- $Perm.Write (pTaken@238@01 this@217@01 (not b@219@01)))
        (pTaken@243@01 this@217@01 (not b@219@01))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap (not b@219@01)))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@250@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap (not b@219@01))))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@220@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap (not b@219@01))))))))
(assert (=>
  (ite
    (and
      (img@226@01 this@217@01 (not b@219@01))
      (Seq_contains xs@218@01 (inv@225@01 this@217@01 (not b@219@01))))
    (< $Perm.No (- $Perm.Write (pTaken@239@01 this@217@01 (not b@219@01))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap (not b@219@01)))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@250@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap (not b@219@01))))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap (not b@219@01))))))))
; [eval] (unfolding acc(valid(this, false), write) in this.g == 2)
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@252@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b false))
    ($Perm.min
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        (- $Perm.Write (pTaken@239@01 this b))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@253@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b false))
    ($Perm.min
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        (- $Perm.Write (pTaken@238@01 this b))
        $Perm.No)
      (- $Perm.Write (pTaken@252@01 this b)))
    $Perm.No))
(define-fun pTaken@254@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@217@01) (= b false))
    ($Perm.min
      (ite (and (= this this@217@01) (= b true)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@252@01 this b)) (pTaken@253@01 this b)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@226@01 this b) (Seq_contains xs@218@01 (inv@225@01 this b)))
        (- $Perm.Write (pTaken@239@01 this b))
        $Perm.No)
      (pTaken@252@01 this b))
    $Perm.No)
  
  :qid |quant-u-193|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@252@01 this b) $Perm.No)
  
  :qid |quant-u-194|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b false))
    (= (- $Perm.Write (pTaken@252@01 this b)) $Perm.No))
  
  :qid |quant-u-195|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@223@01 this b) (Seq_contains xs@218@01 (inv@222@01 this b)))
        (- $Perm.Write (pTaken@238@01 this b))
        $Perm.No)
      (pTaken@253@01 this b))
    $Perm.No)
  
  :qid |quant-u-196|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@253@01 this b) $Perm.No)
  
  :qid |quant-u-197|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@217@01) (= b false))
    (=
      (- (- $Perm.Write (pTaken@252@01 this b)) (pTaken@253@01 this b))
      $Perm.No))
  
  :qid |quant-u-198|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= false true)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid (as sm@240@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (=>
  (ite
    (and
      (img@226@01 this@217@01 false)
      (Seq_contains xs@218@01 (inv@225@01 this@217@01 false)))
    (< $Perm.No (- $Perm.Write (pTaken@239@01 this@217@01 false)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (=>
  (ite
    (and
      (img@223@01 this@217@01 false)
      (Seq_contains xs@218@01 (inv@222@01 this@217@01 false)))
    (< $Perm.No (- $Perm.Write (pTaken@238@01 this@217@01 false)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@220@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@217@01)
        ($SortWrappers.BoolTo$Snap false)))))))
(assert (valid%trigger ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@217@01)
  ($SortWrappers.BoolTo$Snap false))) this@217@01 false))
; [then-branch: 41 | False | dead]
; [else-branch: 41 | True | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 41 | True]
; [eval] this.g == 2
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (and
  (=>
    (= false true)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@217@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid (as sm@240@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (=>
    (ite
      (and
        (img@226@01 this@217@01 false)
        (Seq_contains xs@218@01 (inv@225@01 this@217@01 false)))
      (< $Perm.No (- $Perm.Write (pTaken@239@01 this@217@01 false)))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@217@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (=>
    (ite
      (and
        (img@223@01 this@217@01 false)
        (Seq_contains xs@218@01 (inv@222@01 this@217@01 false)))
      (< $Perm.No (- $Perm.Write (pTaken@238@01 this@217@01 false)))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap this@217@01)
            ($SortWrappers.BoolTo$Snap false))
          $Snap.unit))
      (=
        ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false)))
        ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second ($Snap.second $t@220@01)))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@217@01)
          ($SortWrappers.BoolTo$Snap false))))))
  (valid%trigger ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap false))) this@217@01 false)))
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap false))))
  2)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($PSF.lookup_valid (as sm@245@01  $PSF<valid>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap this@217@01)
    ($SortWrappers.BoolTo$Snap false))))
  2))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t3b ----------
(declare-const this@255@01 $Ref)
(declare-const xs@256@01 Seq<$Ref>)
(declare-const b@257@01 Bool)
(declare-const this@258@01 $Ref)
(declare-const xs@259@01 Seq<$Ref>)
(declare-const b@260@01 Bool)
(push) ; 1
(declare-const $t@261@01 $Snap)
(assert (= $t@261@01 ($Snap.combine ($Snap.first $t@261@01) ($Snap.second $t@261@01))))
(assert (= ($Snap.first $t@261@01) $Snap.unit))
; [eval] (this in xs)
(assert (Seq_contains xs@259@01 this@258@01))
(assert (=
  ($Snap.second $t@261@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@261@01))
    ($Snap.second ($Snap.second $t@261@01)))))
(declare-const x@262@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@259@01 x@262@01))
(pop) ; 2
(declare-fun inv@263@01 ($Ref Bool) $Ref)
(declare-fun img@264@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@262@01 $Ref) (x2@262@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@259@01 x1@262@01)
      (Seq_contains xs@259@01 x2@262@01)
      (= x1@262@01 x2@262@01))
    (= x1@262@01 x2@262@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@262@01 $Ref)) (!
  (=>
    (Seq_contains xs@259@01 x@262@01)
    (and
      (= (inv@263@01 x@262@01 b@260@01) x@262@01)
      (img@264@01 x@262@01 b@260@01)))
  :pattern ((Seq_contains xs@259@01 x@262@01))
  :pattern ((Seq_contains_trigger xs@259@01 x@262@01))
  :pattern ((Seq_contains_trigger xs@259@01 x@262@01))
  :pattern ((inv@263@01 x@262@01 b@260@01))
  :pattern ((img@264@01 x@262@01 b@260@01))
  :qid |quant-u-200|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@264@01 this b) (Seq_contains xs@259@01 (inv@263@01 this b)))
    (and (= (inv@263@01 this b) this) (= b@260@01 b)))
  :pattern ((inv@263@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
(declare-const x@265@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@259@01 x@265@01))
; [eval] !b
(pop) ; 2
(declare-fun inv@266@01 ($Ref Bool) $Ref)
(declare-fun img@267@01 ($Ref Bool) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@265@01 $Ref) (x2@265@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@259@01 x1@265@01)
      (Seq_contains xs@259@01 x2@265@01)
      (= x1@265@01 x2@265@01))
    (= x1@265@01 x2@265@01))
  
  :qid |valid-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@265@01 $Ref)) (!
  (=>
    (Seq_contains xs@259@01 x@265@01)
    (and
      (= (inv@266@01 x@265@01 (not b@260@01)) x@265@01)
      (img@267@01 x@265@01 (not b@260@01))))
  :pattern ((Seq_contains xs@259@01 x@265@01))
  :pattern ((Seq_contains_trigger xs@259@01 x@265@01))
  :pattern ((Seq_contains_trigger xs@259@01 x@265@01))
  :qid |quant-u-202|)))
(assert (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (img@267@01 this b) (Seq_contains xs@259@01 (inv@266@01 this b)))
    (and (= (inv@266@01 this b) this) (= (not b@260@01) b)))
  :pattern ((inv@266@01 this b))
  :qid |valid-fctOfInv|)))
; Permissions are non-negative
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (and
    (= x@265@01 x@262@01)
    (=
      (and (img@267@01 this b) (Seq_contains xs@259@01 (inv@266@01 this b)))
      (and (img@264@01 this b) (Seq_contains xs@259@01 (inv@263@01 this b)))))
  
  :qid |quant-u-203|))))
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
; unfold acc(valid(this, true), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@268@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@258@01) (= b true))
    ($Perm.min
      (ite
        (and (img@264@01 this b) (Seq_contains xs@259@01 (inv@263@01 this b)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@269@01 ((this $Ref) (b Bool)) $Perm
  (ite
    (and (= this this@258@01) (= b true))
    ($Perm.min
      (ite
        (and (img@267@01 this b) (Seq_contains xs@259@01 (inv@266@01 this b)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@268@01 this b)))
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
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@264@01 this b) (Seq_contains xs@259@01 (inv@263@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@268@01 this b))
    $Perm.No)
  
  :qid |quant-u-205|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@268@01 this b) $Perm.No)
  
  :qid |quant-u-206|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@258@01) (= b true))
    (= (- $Perm.Write (pTaken@268@01 this b)) $Perm.No))
  
  :qid |quant-u-207|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=
    (-
      (ite
        (and (img@267@01 this b) (Seq_contains xs@259@01 (inv@266@01 this b)))
        $Perm.Write
        $Perm.No)
      (pTaken@269@01 this b))
    $Perm.No)
  
  :qid |quant-u-208|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (= (pTaken@269@01 this b) $Perm.No)
  
  :qid |quant-u-209|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (=>
    (and (= this this@258@01) (= b true))
    (=
      (- (- $Perm.Write (pTaken@268@01 this b)) (pTaken@269@01 this b))
      $Perm.No))
  
  :qid |quant-u-210|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@270@01 $PSF<valid>)
(declare-const s@271@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@264@01 this@258@01 true)
    (Seq_contains xs@259@01 (inv@263@01 this@258@01 true)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@258@01)
          ($SortWrappers.BoolTo$Snap true))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@270@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@258@01)
        ($SortWrappers.BoolTo$Snap true)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.first ($Snap.second $t@261@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@258@01)
        ($SortWrappers.BoolTo$Snap true)))))))
(assert (=>
  (and
    (img@267@01 this@258@01 true)
    (Seq_contains xs@259@01 (inv@266@01 this@258@01 true)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap this@258@01)
          ($SortWrappers.BoolTo$Snap true))
        $Snap.unit))
    (=
      ($PSF.lookup_valid (as sm@270@01  $PSF<valid>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@258@01)
        ($SortWrappers.BoolTo$Snap true)))
      ($PSF.lookup_valid ($SortWrappers.$SnapTo$PSF<valid> ($Snap.second ($Snap.second $t@261@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap this@258@01)
        ($SortWrappers.BoolTo$Snap true)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | True | live]
; [else-branch: 42 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 42 | True]
(assert (not (= this@258@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($PSF.lookup_valid (as sm@270@01  $PSF<valid>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap this@258@01)
  ($SortWrappers.BoolTo$Snap true))) this@258@01 true))
; [exec]
; this.f := 1
; [exec]
; this.g := 1
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((this $Ref) (b Bool)) (!
  (and
    (= x@265@01 x@262@01)
    (=
      (and (img@267@01 this b) (Seq_contains xs@259@01 (inv@266@01 this b)))
      (and (img@264@01 this b) (Seq_contains xs@259@01 (inv@263@01 this b)))))
  
  :qid |quant-u-211|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
