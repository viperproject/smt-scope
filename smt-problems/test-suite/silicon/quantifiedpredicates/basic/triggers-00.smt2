(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:25:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/basic/triggers.vpr
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
(declare-fun fun2 ($Snap $Ref) $Ref)
(declare-fun fun2%limited ($Snap $Ref) $Ref)
(declare-fun fun2%stateless ($Ref) Bool)
(declare-fun fun2%precondition ($Snap $Ref) Bool)
(declare-fun fun ($Snap $Ref Int) $Ref)
(declare-fun fun%limited ($Snap $Ref Int) $Ref)
(declare-fun fun%stateless ($Ref Int) Bool)
(declare-fun fun%precondition ($Snap $Ref Int) Bool)
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
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (fun2%limited s@$ r@0@00) (fun2 s@$ r@0@00))
  :pattern ((fun2 s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (fun2%stateless r@0@00)
  :pattern ((fun2%limited s@$ r@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (=> (fun2%precondition s@$ r@0@00) (= (fun2 s@$ r@0@00) r@0@00))
  :pattern ((fun2 s@$ r@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  true
  :pattern ((fun2 s@$ r@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref) (i@3@00 Int)) (!
  (= (fun%limited s@$ r@2@00 i@3@00) (fun s@$ r@2@00 i@3@00))
  :pattern ((fun s@$ r@2@00 i@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref) (i@3@00 Int)) (!
  (fun%stateless r@2@00 i@3@00)
  :pattern ((fun%limited s@$ r@2@00 i@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref) (i@3@00 Int)) (!
  (=> (fun%precondition s@$ r@2@00 i@3@00) (= (fun s@$ r@2@00 i@3@00) r@2@00))
  :pattern ((fun s@$ r@2@00 i@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref) (i@3@00 Int)) (!
  true
  :pattern ((fun s@$ r@2@00 i@3@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- t3 ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const r@1@01 $Ref)
(declare-const i@2@01 Int)
(declare-const xs@3@01 Seq<$Ref>)
(declare-const r@4@01 $Ref)
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const x@6@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@3@01 x@6@01))
; [eval] fun(x, i)
(push) ; 3
(assert (fun%precondition $Snap.unit x@6@01 i@5@01))
(pop) ; 3
; Joined path conditions
(assert (fun%precondition $Snap.unit x@6@01 i@5@01))
(pop) ; 2
(declare-const $t@7@01 $PSF<pred>)
(declare-fun inv@8@01 ($Ref) $Ref)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@6@01 $Ref)) (!
  (=> (Seq_contains xs@3@01 x@6@01) (fun%precondition $Snap.unit x@6@01 i@5@01))
  :pattern ((fun $Snap.unit x@6@01 i@5@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((x1@6@01 $Ref) (x2@6@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@3@01 x1@6@01) (Seq_contains xs@3@01 x2@6@01))
    (and
      (fun%precondition $Snap.unit x1@6@01 i@5@01)
      (fun%precondition $Snap.unit x2@6@01 i@5@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 2
(assert (not (forall ((x1@6@01 $Ref) (x2@6@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@3@01 x1@6@01)
      (Seq_contains xs@3@01 x2@6@01)
      (= (fun $Snap.unit x1@6@01 i@5@01) (fun $Snap.unit x2@6@01 i@5@01)))
    (= x1@6@01 x2@6@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@6@01 $Ref)) (!
  (=>
    (Seq_contains xs@3@01 x@6@01)
    (and
      (fun%precondition $Snap.unit x@6@01 i@5@01)
      (=>
        (= (inv@8@01 (fun $Snap.unit x@6@01 i@5@01)) x@6@01)
        (fun%precondition $Snap.unit x@6@01 i@5@01))))
  :pattern ((fun $Snap.unit x@6@01 i@5@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Seq_contains xs@3@01 (inv@8@01 r)))
    (fun%precondition $Snap.unit (inv@8@01 r) i@5@01))
  :pattern ((inv@8@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((x@6@01 $Ref)) (!
  (=>
    (Seq_contains xs@3@01 x@6@01)
    (and
      (= (inv@8@01 (fun $Snap.unit x@6@01 i@5@01)) x@6@01)
      (img@9@01 (fun $Snap.unit x@6@01 i@5@01))))
  :pattern ((fun $Snap.unit x@6@01 i@5@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Seq_contains xs@3@01 (inv@8@01 r)))
    (= (fun $Snap.unit (inv@8@01 r) i@5@01) r))
  :pattern ((inv@8@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@10@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@3@01 x@10@01))
; [eval] fun2(x)
(push) ; 4
(assert (fun2%precondition $Snap.unit x@10@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit x@10@01))
(pop) ; 3
(declare-const $t@11@01 $PSF<pred>)
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@10@01 $Ref)) (!
  (=> (Seq_contains xs@3@01 x@10@01) (fun2%precondition $Snap.unit x@10@01))
  :pattern ((fun2 $Snap.unit x@10@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((x1@10@01 $Ref) (x2@10@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@3@01 x1@10@01) (Seq_contains xs@3@01 x2@10@01))
    (and
      (fun2%precondition $Snap.unit x1@10@01)
      (fun2%precondition $Snap.unit x2@10@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 3
(assert (not (forall ((x1@10@01 $Ref) (x2@10@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@3@01 x1@10@01)
      (Seq_contains xs@3@01 x2@10@01)
      (= (fun2 $Snap.unit x1@10@01) (fun2 $Snap.unit x2@10@01)))
    (= x1@10@01 x2@10@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@10@01 $Ref)) (!
  (=>
    (Seq_contains xs@3@01 x@10@01)
    (and
      (fun2%precondition $Snap.unit x@10@01)
      (=>
        (= (inv@12@01 (fun2 $Snap.unit x@10@01)) x@10@01)
        (fun2%precondition $Snap.unit x@10@01))))
  :pattern ((fun2 $Snap.unit x@10@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Seq_contains xs@3@01 (inv@12@01 r)))
    (fun2%precondition $Snap.unit (inv@12@01 r)))
  :pattern ((inv@12@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((x@10@01 $Ref)) (!
  (=>
    (Seq_contains xs@3@01 x@10@01)
    (and
      (= (inv@12@01 (fun2 $Snap.unit x@10@01)) x@10@01)
      (img@13@01 (fun2 $Snap.unit x@10@01))))
  :pattern ((fun2 $Snap.unit x@10@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Seq_contains xs@3@01 (inv@12@01 r)))
    (= (fun2 $Snap.unit (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall x: Ref :: { fun(x, i) } { fun2(x) } fun(x, i) == fun2(x))
; [eval] (forall x: Ref :: { fun(x, i) } { fun2(x) } fun(x, i) == fun2(x))
(declare-const x@14@01 $Ref)
(push) ; 3
; [eval] fun(x, i) == fun2(x)
; [eval] fun(x, i)
(push) ; 4
(assert (fun%precondition $Snap.unit x@14@01 i@5@01))
(pop) ; 4
; Joined path conditions
(assert (fun%precondition $Snap.unit x@14@01 i@5@01))
; [eval] fun2(x)
(push) ; 4
(assert (fun2%precondition $Snap.unit x@14@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit x@14@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@14@01 $Ref)) (!
  (and
    (fun%precondition $Snap.unit x@14@01 i@5@01)
    (fun2%precondition $Snap.unit x@14@01))
  :pattern ((fun%limited $Snap.unit x@14@01 i@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/triggers.vpr@21@12@21@49-aux|)))
(assert (forall ((x@14@01 $Ref)) (!
  (and
    (fun%precondition $Snap.unit x@14@01 i@5@01)
    (fun2%precondition $Snap.unit x@14@01))
  :pattern ((fun2%limited $Snap.unit x@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/triggers.vpr@21@12@21@49-aux|)))
(assert (forall ((x@14@01 $Ref)) (!
  (and
    (fun%precondition $Snap.unit x@14@01 i@5@01)
    (fun2%precondition $Snap.unit x@14@01))
  :pattern ((fun%limited $Snap.unit x@14@01 i@5@01))
  :pattern ((fun2%limited $Snap.unit x@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/triggers.vpr@21@12@21@49_precondition|)))
(push) ; 3
(assert (not (forall ((x@14@01 $Ref)) (!
  (=>
    (and
      (fun%precondition $Snap.unit x@14@01 i@5@01)
      (fun2%precondition $Snap.unit x@14@01))
    (= (fun $Snap.unit x@14@01 i@5@01) (fun2 $Snap.unit x@14@01)))
  :pattern ((fun%limited $Snap.unit x@14@01 i@5@01))
  :pattern ((fun2%limited $Snap.unit x@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/triggers.vpr@21@12@21@49|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@14@01 $Ref)) (!
  (= (fun $Snap.unit x@14@01 i@5@01) (fun2 $Snap.unit x@14@01))
  :pattern ((fun%limited $Snap.unit x@14@01 i@5@01))
  :pattern ((fun2%limited $Snap.unit x@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/triggers.vpr@21@12@21@49|)))
(declare-const x@15@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@3@01 x@15@01))
; [eval] fun2(x)
(push) ; 4
(assert (fun2%precondition $Snap.unit x@15@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit x@15@01))
(pop) ; 3
(declare-fun inv@16@01 ($Ref) $Ref)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@15@01 $Ref)) (!
  (=> (Seq_contains xs@3@01 x@15@01) (fun2%precondition $Snap.unit x@15@01))
  :pattern ((fun2 $Snap.unit x@15@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((x1@15@01 $Ref) (x2@15@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@3@01 x1@15@01) (Seq_contains xs@3@01 x2@15@01))
    (and
      (fun2%precondition $Snap.unit x1@15@01)
      (fun2%precondition $Snap.unit x2@15@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 3
(assert (not (forall ((x1@15@01 $Ref) (x2@15@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@3@01 x1@15@01)
      (Seq_contains xs@3@01 x2@15@01)
      (= (fun2 $Snap.unit x1@15@01) (fun2 $Snap.unit x2@15@01)))
    (= x1@15@01 x2@15@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@15@01 $Ref)) (!
  (=>
    (Seq_contains xs@3@01 x@15@01)
    (and
      (fun2%precondition $Snap.unit x@15@01)
      (=>
        (= (inv@16@01 (fun2 $Snap.unit x@15@01)) x@15@01)
        (fun2%precondition $Snap.unit x@15@01))))
  :pattern ((fun2 $Snap.unit x@15@01))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (Seq_contains xs@3@01 (inv@16@01 r)))
    (fun2%precondition $Snap.unit (inv@16@01 r)))
  :pattern ((inv@16@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((x@15@01 $Ref)) (!
  (=>
    (Seq_contains xs@3@01 x@15@01)
    (and
      (= (inv@16@01 (fun2 $Snap.unit x@15@01)) x@15@01)
      (img@17@01 (fun2 $Snap.unit x@15@01))))
  :pattern ((fun2 $Snap.unit x@15@01))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (Seq_contains xs@3@01 (inv@16@01 r)))
    (= (fun2 $Snap.unit (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |pred-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x@15@01 $Ref)) (!
  (= (fun2 $Snap.unit x@15@01) (fun $Snap.unit x@15@01 i@5@01))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@3@01 (inv@16@01 r))
      (img@17@01 r)
      (= r (fun2 $Snap.unit (inv@16@01 r))))
    ($Perm.min
      (ite
        (and (img@9@01 r) (Seq_contains xs@3@01 (inv@8@01 r)))
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
        (and (img@9@01 r) (Seq_contains xs@3@01 (inv@8@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@18@01 r))
    $Perm.No)
  
  :qid |quant-u-15|))))
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
      (Seq_contains xs@3@01 (inv@16@01 r))
      (img@17@01 r)
      (= r (fun2 $Snap.unit (inv@16@01 r))))
    (= (- $Perm.Write (pTaken@18@01 r)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $PSF<pred>)
(declare-const s@20@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@20@01 $Snap)) (!
  (=>
    (and
      (img@9@01 ($SortWrappers.$SnapTo$Ref s@20@01))
      (Seq_contains xs@3@01 (inv@8@01 ($SortWrappers.$SnapTo$Ref s@20@01))))
    (and
      (not (= s@20@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@19@01  $PSF<pred>) s@20@01)
        ($PSF.lookup_pred $t@7@01 s@20@01))))
  :pattern (($PSF.lookup_pred (as sm@19@01  $PSF<pred>) s@20@01))
  :pattern (($PSF.lookup_pred $t@7@01 s@20@01))
  :qid |qp.psmValDef0|)))
(pop) ; 2
(pop) ; 1
; ---------- t4a ----------
(declare-const xs@21@01 Seq<$Ref>)
(declare-const r@22@01 $Ref)
(declare-const i@23@01 Int)
(declare-const xs@24@01 Seq<$Ref>)
(declare-const r@25@01 $Ref)
(declare-const i@26@01 Int)
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
; inhale (forall x: Ref ::
;     { fun2(x) }
;     (x in xs) ==> acc(pred(fun(x, i)), write))
(declare-const x@27@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@24@01 x@27@01))
; [eval] fun(x, i)
(push) ; 4
(assert (fun%precondition $Snap.unit x@27@01 i@26@01))
(pop) ; 4
; Joined path conditions
(assert (fun%precondition $Snap.unit x@27@01 i@26@01))
; [eval] fun2(x)
(push) ; 4
(assert (fun2%precondition $Snap.unit x@27@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit x@27@01))
(assert (fun2%precondition $Snap.unit x@27@01))
(pop) ; 3
(declare-const $t@28@01 $PSF<pred>)
(declare-fun inv@29@01 ($Ref) $Ref)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Seq_contains xs@24@01 x@27@01)
    (and
      (fun%precondition $Snap.unit x@27@01 i@26@01)
      (fun2%precondition $Snap.unit x@27@01)))
  :pattern ((fun2 $Snap.unit x@27@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@24@01 x1@27@01) (Seq_contains xs@24@01 x2@27@01))
    (and
      (fun%precondition $Snap.unit x1@27@01 i@26@01)
      (fun%precondition $Snap.unit x2@27@01 i@26@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 3
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@24@01 x1@27@01)
      (Seq_contains xs@24@01 x2@27@01)
      (= (fun $Snap.unit x1@27@01 i@26@01) (fun $Snap.unit x2@27@01 i@26@01)))
    (= x1@27@01 x2@27@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Seq_contains xs@24@01 x@27@01)
    (and
      (fun%precondition $Snap.unit x@27@01 i@26@01)
      (=>
        (= (inv@29@01 (fun $Snap.unit x@27@01 i@26@01)) x@27@01)
        (fun%precondition $Snap.unit x@27@01 i@26@01))))
  :pattern ((fun2 $Snap.unit x@27@01))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Seq_contains xs@24@01 (inv@29@01 r)))
    (fun%precondition $Snap.unit (inv@29@01 r) i@26@01))
  :pattern ((inv@29@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Seq_contains xs@24@01 x@27@01)
    (and
      (= (inv@29@01 (fun $Snap.unit x@27@01 i@26@01)) x@27@01)
      (img@30@01 (fun $Snap.unit x@27@01 i@26@01))))
  :pattern ((fun2 $Snap.unit x@27@01))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Seq_contains xs@24@01 (inv@29@01 r)))
    (= (fun $Snap.unit (inv@29@01 r) i@26@01) r))
  :pattern ((inv@29@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall y: Ref ::
;     { fun(y, i) }
;     (y in xs) ==> acc(pred(fun2(y)), write))
(declare-const y@31@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (y in xs)
(assert (Seq_contains xs@24@01 y@31@01))
; [eval] fun2(y)
(push) ; 4
(assert (fun2%precondition $Snap.unit y@31@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit y@31@01))
; [eval] fun(y, i)
(push) ; 4
(assert (fun%precondition $Snap.unit y@31@01 i@26@01))
(pop) ; 4
; Joined path conditions
(assert (fun%precondition $Snap.unit y@31@01 i@26@01))
(assert (fun%precondition $Snap.unit y@31@01 i@26@01))
(pop) ; 3
(declare-fun inv@32@01 ($Ref) $Ref)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((y@31@01 $Ref)) (!
  (=>
    (Seq_contains xs@24@01 y@31@01)
    (and
      (fun2%precondition $Snap.unit y@31@01)
      (fun%precondition $Snap.unit y@31@01 i@26@01)))
  :pattern ((fun $Snap.unit y@31@01 i@26@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((y1@31@01 $Ref) (y2@31@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@24@01 y1@31@01) (Seq_contains xs@24@01 y2@31@01))
    (and
      (fun2%precondition $Snap.unit y1@31@01)
      (fun2%precondition $Snap.unit y2@31@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 3
(assert (not (forall ((y1@31@01 $Ref) (y2@31@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@24@01 y1@31@01)
      (Seq_contains xs@24@01 y2@31@01)
      (= (fun2 $Snap.unit y1@31@01) (fun2 $Snap.unit y2@31@01)))
    (= y1@31@01 y2@31@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@31@01 $Ref)) (!
  (=>
    (Seq_contains xs@24@01 y@31@01)
    (and
      (fun2%precondition $Snap.unit y@31@01)
      (=>
        (= (inv@32@01 (fun2 $Snap.unit y@31@01)) y@31@01)
        (fun2%precondition $Snap.unit y@31@01))))
  :pattern ((fun $Snap.unit y@31@01 i@26@01))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@33@01 r) (Seq_contains xs@24@01 (inv@32@01 r)))
    (fun2%precondition $Snap.unit (inv@32@01 r)))
  :pattern ((inv@32@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((y@31@01 $Ref)) (!
  (=>
    (Seq_contains xs@24@01 y@31@01)
    (and
      (= (inv@32@01 (fun2 $Snap.unit y@31@01)) y@31@01)
      (img@33@01 (fun2 $Snap.unit y@31@01))))
  :pattern ((fun $Snap.unit y@31@01 i@26@01))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@33@01 r) (Seq_contains xs@24@01 (inv@32@01 r)))
    (= (fun2 $Snap.unit (inv@32@01 r)) r))
  :pattern ((inv@32@01 r))
  :qid |pred-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((y@31@01 $Ref)) (!
  (= (fun2 $Snap.unit y@31@01) (fun $Snap.unit y@31@01 i@26@01))
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@24@01 (inv@32@01 r))
      (img@33@01 r)
      (= r (fun2 $Snap.unit (inv@32@01 r))))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Seq_contains xs@24@01 (inv@29@01 r)))
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
        (and (img@30@01 r) (Seq_contains xs@24@01 (inv@29@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@34@01 r))
    $Perm.No)
  
  :qid |quant-u-22|))))
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
      (Seq_contains xs@24@01 (inv@32@01 r))
      (img@33@01 r)
      (= r (fun2 $Snap.unit (inv@32@01 r))))
    (= (- $Perm.Write (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@35@01 $PSF<pred>)
(declare-const s@36@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@36@01 $Snap)) (!
  (=>
    (and
      (img@30@01 ($SortWrappers.$SnapTo$Ref s@36@01))
      (Seq_contains xs@24@01 (inv@29@01 ($SortWrappers.$SnapTo$Ref s@36@01))))
    (and
      (not (= s@36@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@35@01  $PSF<pred>) s@36@01)
        ($PSF.lookup_pred $t@28@01 s@36@01))))
  :pattern (($PSF.lookup_pred (as sm@35@01  $PSF<pred>) s@36@01))
  :pattern (($PSF.lookup_pred $t@28@01 s@36@01))
  :qid |qp.psmValDef1|)))
(pop) ; 2
(pop) ; 1
; ---------- t4b ----------
(declare-const xs@37@01 Seq<$Ref>)
(declare-const r@38@01 $Ref)
(declare-const i@39@01 Int)
(declare-const xs@40@01 Seq<$Ref>)
(declare-const r@41@01 $Ref)
(declare-const i@42@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const x@43@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@40@01 x@43@01))
; [eval] fun(x, i)
(push) ; 3
(assert (fun%precondition $Snap.unit x@43@01 i@42@01))
(pop) ; 3
; Joined path conditions
(assert (fun%precondition $Snap.unit x@43@01 i@42@01))
; [eval] fun2(x)
(push) ; 3
(assert (fun2%precondition $Snap.unit x@43@01))
(pop) ; 3
; Joined path conditions
(assert (fun2%precondition $Snap.unit x@43@01))
(assert (fun2%precondition $Snap.unit x@43@01))
(pop) ; 2
(declare-const $t@44@01 $PSF<pred>)
(declare-fun inv@45@01 ($Ref) $Ref)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@43@01 $Ref)) (!
  (=>
    (Seq_contains xs@40@01 x@43@01)
    (and
      (fun%precondition $Snap.unit x@43@01 i@42@01)
      (fun2%precondition $Snap.unit x@43@01)))
  :pattern ((fun2 $Snap.unit x@43@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((x1@43@01 $Ref) (x2@43@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@40@01 x1@43@01) (Seq_contains xs@40@01 x2@43@01))
    (and
      (fun%precondition $Snap.unit x1@43@01 i@42@01)
      (fun%precondition $Snap.unit x2@43@01 i@42@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 2
(assert (not (forall ((x1@43@01 $Ref) (x2@43@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@40@01 x1@43@01)
      (Seq_contains xs@40@01 x2@43@01)
      (= (fun $Snap.unit x1@43@01 i@42@01) (fun $Snap.unit x2@43@01 i@42@01)))
    (= x1@43@01 x2@43@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@43@01 $Ref)) (!
  (=>
    (Seq_contains xs@40@01 x@43@01)
    (and
      (fun%precondition $Snap.unit x@43@01 i@42@01)
      (=>
        (= (inv@45@01 (fun $Snap.unit x@43@01 i@42@01)) x@43@01)
        (fun%precondition $Snap.unit x@43@01 i@42@01))))
  :pattern ((fun2 $Snap.unit x@43@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@46@01 r) (Seq_contains xs@40@01 (inv@45@01 r)))
    (fun%precondition $Snap.unit (inv@45@01 r) i@42@01))
  :pattern ((inv@45@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((x@43@01 $Ref)) (!
  (=>
    (Seq_contains xs@40@01 x@43@01)
    (and
      (= (inv@45@01 (fun $Snap.unit x@43@01 i@42@01)) x@43@01)
      (img@46@01 (fun $Snap.unit x@43@01 i@42@01))))
  :pattern ((fun2 $Snap.unit x@43@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@46@01 r) (Seq_contains xs@40@01 (inv@45@01 r)))
    (= (fun $Snap.unit (inv@45@01 r) i@42@01) r))
  :pattern ((inv@45@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const y@47@01 $Ref)
(push) ; 3
; [eval] (y in xs)
(assert (Seq_contains xs@40@01 y@47@01))
; [eval] fun2(y)
(push) ; 4
(assert (fun2%precondition $Snap.unit y@47@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit y@47@01))
; [eval] fun(y, i)
(push) ; 4
(assert (fun%precondition $Snap.unit y@47@01 i@42@01))
(pop) ; 4
; Joined path conditions
(assert (fun%precondition $Snap.unit y@47@01 i@42@01))
(assert (fun%precondition $Snap.unit y@47@01 i@42@01))
(pop) ; 3
(declare-const $t@48@01 $PSF<pred>)
(declare-fun inv@49@01 ($Ref) $Ref)
(declare-fun img@50@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((y@47@01 $Ref)) (!
  (=>
    (Seq_contains xs@40@01 y@47@01)
    (and
      (fun2%precondition $Snap.unit y@47@01)
      (fun%precondition $Snap.unit y@47@01 i@42@01)))
  :pattern ((fun $Snap.unit y@47@01 i@42@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((y1@47@01 $Ref) (y2@47@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@40@01 y1@47@01) (Seq_contains xs@40@01 y2@47@01))
    (and
      (fun2%precondition $Snap.unit y1@47@01)
      (fun2%precondition $Snap.unit y2@47@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 3
(assert (not (forall ((y1@47@01 $Ref) (y2@47@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@40@01 y1@47@01)
      (Seq_contains xs@40@01 y2@47@01)
      (= (fun2 $Snap.unit y1@47@01) (fun2 $Snap.unit y2@47@01)))
    (= y1@47@01 y2@47@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@47@01 $Ref)) (!
  (=>
    (Seq_contains xs@40@01 y@47@01)
    (and
      (fun2%precondition $Snap.unit y@47@01)
      (=>
        (= (inv@49@01 (fun2 $Snap.unit y@47@01)) y@47@01)
        (fun2%precondition $Snap.unit y@47@01))))
  :pattern ((fun $Snap.unit y@47@01 i@42@01))
  :qid |quant-u-27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@50@01 r) (Seq_contains xs@40@01 (inv@49@01 r)))
    (fun2%precondition $Snap.unit (inv@49@01 r)))
  :pattern ((inv@49@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((y@47@01 $Ref)) (!
  (=>
    (Seq_contains xs@40@01 y@47@01)
    (and
      (= (inv@49@01 (fun2 $Snap.unit y@47@01)) y@47@01)
      (img@50@01 (fun2 $Snap.unit y@47@01))))
  :pattern ((fun $Snap.unit y@47@01 i@42@01))
  :qid |quant-u-27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@50@01 r) (Seq_contains xs@40@01 (inv@49@01 r)))
    (= (fun2 $Snap.unit (inv@49@01 r)) r))
  :pattern ((inv@49@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const y@51@01 $Ref)
(push) ; 3
; [eval] (y in xs)
(assert (Seq_contains xs@40@01 y@51@01))
; [eval] fun2(y)
(push) ; 4
(assert (fun2%precondition $Snap.unit y@51@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit y@51@01))
; [eval] fun(y, i)
(push) ; 4
(assert (fun%precondition $Snap.unit y@51@01 i@42@01))
(pop) ; 4
; Joined path conditions
(assert (fun%precondition $Snap.unit y@51@01 i@42@01))
(assert (fun%precondition $Snap.unit y@51@01 i@42@01))
(pop) ; 3
(declare-fun inv@52@01 ($Ref) $Ref)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((y@51@01 $Ref)) (!
  (=>
    (Seq_contains xs@40@01 y@51@01)
    (and
      (fun2%precondition $Snap.unit y@51@01)
      (fun%precondition $Snap.unit y@51@01 i@42@01)))
  :pattern ((fun $Snap.unit y@51@01 i@42@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((y1@51@01 $Ref) (y2@51@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@40@01 y1@51@01) (Seq_contains xs@40@01 y2@51@01))
    (and
      (fun2%precondition $Snap.unit y1@51@01)
      (fun2%precondition $Snap.unit y2@51@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 3
(assert (not (forall ((y1@51@01 $Ref) (y2@51@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@40@01 y1@51@01)
      (Seq_contains xs@40@01 y2@51@01)
      (= (fun2 $Snap.unit y1@51@01) (fun2 $Snap.unit y2@51@01)))
    (= y1@51@01 y2@51@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@51@01 $Ref)) (!
  (=>
    (Seq_contains xs@40@01 y@51@01)
    (and
      (fun2%precondition $Snap.unit y@51@01)
      (=>
        (= (inv@52@01 (fun2 $Snap.unit y@51@01)) y@51@01)
        (fun2%precondition $Snap.unit y@51@01))))
  :pattern ((fun $Snap.unit y@51@01 i@42@01))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (Seq_contains xs@40@01 (inv@52@01 r)))
    (fun2%precondition $Snap.unit (inv@52@01 r)))
  :pattern ((inv@52@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((y@51@01 $Ref)) (!
  (=>
    (Seq_contains xs@40@01 y@51@01)
    (and
      (= (inv@52@01 (fun2 $Snap.unit y@51@01)) y@51@01)
      (img@53@01 (fun2 $Snap.unit y@51@01))))
  :pattern ((fun $Snap.unit y@51@01 i@42@01))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@53@01 r) (Seq_contains xs@40@01 (inv@52@01 r)))
    (= (fun2 $Snap.unit (inv@52@01 r)) r))
  :pattern ((inv@52@01 r))
  :qid |pred-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((y@51@01 $Ref)) (!
  (= (fun2 $Snap.unit y@51@01) (fun $Snap.unit y@51@01 i@42@01))
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@40@01 (inv@52@01 r))
      (img@53@01 r)
      (= r (fun2 $Snap.unit (inv@52@01 r))))
    ($Perm.min
      (ite
        (and (img@46@01 r) (Seq_contains xs@40@01 (inv@45@01 r)))
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
        (and (img@46@01 r) (Seq_contains xs@40@01 (inv@45@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@54@01 r))
    $Perm.No)
  
  :qid |quant-u-31|))))
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
      (Seq_contains xs@40@01 (inv@52@01 r))
      (img@53@01 r)
      (= r (fun2 $Snap.unit (inv@52@01 r))))
    (= (- $Perm.Write (pTaken@54@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@55@01 $PSF<pred>)
(declare-const s@56@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@56@01 $Snap)) (!
  (=>
    (and
      (img@46@01 ($SortWrappers.$SnapTo$Ref s@56@01))
      (Seq_contains xs@40@01 (inv@45@01 ($SortWrappers.$SnapTo$Ref s@56@01))))
    (and
      (not (= s@56@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@55@01  $PSF<pred>) s@56@01)
        ($PSF.lookup_pred $t@44@01 s@56@01))))
  :pattern (($PSF.lookup_pred (as sm@55@01  $PSF<pred>) s@56@01))
  :pattern (($PSF.lookup_pred $t@44@01 s@56@01))
  :qid |qp.psmValDef2|)))
(pop) ; 2
(pop) ; 1
; ---------- t5b ----------
(declare-const xs@57@01 Seq<$Ref>)
(declare-const r@58@01 $Ref)
(declare-const i@59@01 Int)
(declare-const xs@60@01 Seq<$Ref>)
(declare-const r@61@01 $Ref)
(declare-const i@62@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const x@63@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@60@01 x@63@01))
; [eval] fun(x, i)
(push) ; 3
(assert (fun%precondition $Snap.unit x@63@01 i@62@01))
(pop) ; 3
; Joined path conditions
(assert (fun%precondition $Snap.unit x@63@01 i@62@01))
; [eval] fun2(x)
(push) ; 3
(assert (fun2%precondition $Snap.unit x@63@01))
(pop) ; 3
; Joined path conditions
(assert (fun2%precondition $Snap.unit x@63@01))
(assert (fun2%precondition $Snap.unit x@63@01))
(pop) ; 2
(declare-const $t@64@01 $FVF<f>)
(declare-fun inv@65@01 ($Ref) $Ref)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@63@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 x@63@01)
    (and
      (fun%precondition $Snap.unit x@63@01 i@62@01)
      (fun2%precondition $Snap.unit x@63@01)))
  :pattern ((fun2 $Snap.unit x@63@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((x1@63@01 $Ref) (x2@63@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@60@01 x1@63@01) (Seq_contains xs@60@01 x2@63@01))
    (and
      (fun%precondition $Snap.unit x1@63@01 i@62@01)
      (fun%precondition $Snap.unit x2@63@01 i@62@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 2
(assert (not (forall ((x1@63@01 $Ref) (x2@63@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@60@01 x1@63@01)
      (Seq_contains xs@60@01 x2@63@01)
      (= (fun $Snap.unit x1@63@01 i@62@01) (fun $Snap.unit x2@63@01 i@62@01)))
    (= x1@63@01 x2@63@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@63@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 x@63@01)
    (and
      (fun%precondition $Snap.unit x@63@01 i@62@01)
      (=>
        (= (inv@65@01 (fun $Snap.unit x@63@01 i@62@01)) x@63@01)
        (fun%precondition $Snap.unit x@63@01 i@62@01))))
  :pattern ((fun2 $Snap.unit x@63@01))
  :qid |quant-u-34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Seq_contains xs@60@01 (inv@65@01 r)))
    (fun%precondition $Snap.unit (inv@65@01 r) i@62@01))
  :pattern ((inv@65@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@63@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 x@63@01)
    (and
      (= (inv@65@01 (fun $Snap.unit x@63@01 i@62@01)) x@63@01)
      (img@66@01 (fun $Snap.unit x@63@01 i@62@01))))
  :pattern ((fun2 $Snap.unit x@63@01))
  :qid |quant-u-34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Seq_contains xs@60@01 (inv@65@01 r)))
    (= (fun $Snap.unit (inv@65@01 r) i@62@01) r))
  :pattern ((inv@65@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@63@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 x@63@01)
    (not (= (fun $Snap.unit x@63@01 i@62@01) $Ref.null)))
  :pattern ((fun2 $Snap.unit x@63@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const y@67@01 $Ref)
(push) ; 3
; [eval] (y in xs)
(assert (Seq_contains xs@60@01 y@67@01))
; [eval] fun2(y)
(push) ; 4
(assert (fun2%precondition $Snap.unit y@67@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit y@67@01))
; [eval] fun(y, i)
(push) ; 4
(assert (fun%precondition $Snap.unit y@67@01 i@62@01))
(pop) ; 4
; Joined path conditions
(assert (fun%precondition $Snap.unit y@67@01 i@62@01))
(assert (fun%precondition $Snap.unit y@67@01 i@62@01))
(pop) ; 3
(declare-const $t@68@01 $FVF<f>)
(declare-fun inv@69@01 ($Ref) $Ref)
(declare-fun img@70@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((y@67@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 y@67@01)
    (and
      (fun2%precondition $Snap.unit y@67@01)
      (fun%precondition $Snap.unit y@67@01 i@62@01)))
  :pattern ((fun $Snap.unit y@67@01 i@62@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((y1@67@01 $Ref) (y2@67@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@60@01 y1@67@01) (Seq_contains xs@60@01 y2@67@01))
    (and
      (fun2%precondition $Snap.unit y1@67@01)
      (fun2%precondition $Snap.unit y2@67@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((y1@67@01 $Ref) (y2@67@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@60@01 y1@67@01)
      (Seq_contains xs@60@01 y2@67@01)
      (= (fun2 $Snap.unit y1@67@01) (fun2 $Snap.unit y2@67@01)))
    (= y1@67@01 y2@67@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@67@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 y@67@01)
    (and
      (fun2%precondition $Snap.unit y@67@01)
      (=>
        (= (inv@69@01 (fun2 $Snap.unit y@67@01)) y@67@01)
        (fun2%precondition $Snap.unit y@67@01))))
  :pattern ((fun $Snap.unit y@67@01 i@62@01))
  :qid |quant-u-36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@70@01 r) (Seq_contains xs@60@01 (inv@69@01 r)))
    (fun2%precondition $Snap.unit (inv@69@01 r)))
  :pattern ((inv@69@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((y@67@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 y@67@01)
    (and
      (= (inv@69@01 (fun2 $Snap.unit y@67@01)) y@67@01)
      (img@70@01 (fun2 $Snap.unit y@67@01))))
  :pattern ((fun $Snap.unit y@67@01 i@62@01))
  :qid |quant-u-36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@70@01 r) (Seq_contains xs@60@01 (inv@69@01 r)))
    (= (fun2 $Snap.unit (inv@69@01 r)) r))
  :pattern ((inv@69@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@67@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 y@67@01)
    (not (= (fun2 $Snap.unit y@67@01) $Ref.null)))
  :pattern ((fun $Snap.unit y@67@01 i@62@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const y@71@01 $Ref)
(push) ; 3
; [eval] (y in xs)
(assert (Seq_contains xs@60@01 y@71@01))
; [eval] fun2(y)
(push) ; 4
(assert (fun2%precondition $Snap.unit y@71@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit y@71@01))
; [eval] fun(y, i)
(push) ; 4
(assert (fun%precondition $Snap.unit y@71@01 i@62@01))
(pop) ; 4
; Joined path conditions
(assert (fun%precondition $Snap.unit y@71@01 i@62@01))
(assert (fun%precondition $Snap.unit y@71@01 i@62@01))
(pop) ; 3
(declare-fun inv@72@01 ($Ref) $Ref)
(declare-fun img@73@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((y@71@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 y@71@01)
    (and
      (fun2%precondition $Snap.unit y@71@01)
      (fun%precondition $Snap.unit y@71@01 i@62@01)))
  :pattern ((fun $Snap.unit y@71@01 i@62@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((y1@71@01 $Ref) (y2@71@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@60@01 y1@71@01) (Seq_contains xs@60@01 y2@71@01))
    (and
      (fun2%precondition $Snap.unit y1@71@01)
      (fun2%precondition $Snap.unit y2@71@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((y1@71@01 $Ref) (y2@71@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@60@01 y1@71@01)
      (Seq_contains xs@60@01 y2@71@01)
      (= (fun2 $Snap.unit y1@71@01) (fun2 $Snap.unit y2@71@01)))
    (= y1@71@01 y2@71@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@71@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 y@71@01)
    (and
      (fun2%precondition $Snap.unit y@71@01)
      (=>
        (= (inv@72@01 (fun2 $Snap.unit y@71@01)) y@71@01)
        (fun2%precondition $Snap.unit y@71@01))))
  :pattern ((fun $Snap.unit y@71@01 i@62@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@73@01 r) (Seq_contains xs@60@01 (inv@72@01 r)))
    (fun2%precondition $Snap.unit (inv@72@01 r)))
  :pattern ((inv@72@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((y@71@01 $Ref)) (!
  (=>
    (Seq_contains xs@60@01 y@71@01)
    (and
      (= (inv@72@01 (fun2 $Snap.unit y@71@01)) y@71@01)
      (img@73@01 (fun2 $Snap.unit y@71@01))))
  :pattern ((fun $Snap.unit y@71@01 i@62@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@73@01 r) (Seq_contains xs@60@01 (inv@72@01 r)))
    (= (fun2 $Snap.unit (inv@72@01 r)) r))
  :pattern ((inv@72@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((y@71@01 $Ref)) (!
  (= (fun2 $Snap.unit y@71@01) (fun $Snap.unit y@71@01 i@62@01))
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@74@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@60@01 (inv@72@01 r))
      (img@73@01 r)
      (= r (fun2 $Snap.unit (inv@72@01 r))))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Seq_contains xs@60@01 (inv@65@01 r)))
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
        (and (img@66@01 r) (Seq_contains xs@60@01 (inv@65@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@74@01 r))
    $Perm.No)
  
  :qid |quant-u-40|))))
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
      (Seq_contains xs@60@01 (inv@72@01 r))
      (img@73@01 r)
      (= r (fun2 $Snap.unit (inv@72@01 r))))
    (= (- $Perm.Write (pTaken@74@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@75@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Seq_contains xs@60@01 (inv@65@01 r)))
    (= ($FVF.lookup_f (as sm@75@01  $FVF<f>) r) ($FVF.lookup_f $t@64@01 r)))
  :pattern (($FVF.lookup_f (as sm@75@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@64@01 r))
  :qid |qp.fvfValDef3|)))
(pop) ; 2
(pop) ; 1
