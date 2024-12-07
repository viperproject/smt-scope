(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:16:00
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedcombinations/functions.vpr
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
(declare-sort $PSF<P> 0)
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
(declare-fun $SortWrappers.$PSF<P>To$Snap ($PSF<P>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<P> ($Snap) $PSF<P>)
(assert (forall ((x $PSF<P>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<P>($SortWrappers.$PSF<P>To$Snap x)))
    :pattern (($SortWrappers.$PSF<P>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<P>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<P>To$Snap($SortWrappers.$SnapTo$PSF<P> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<P> x))
    :qid |$Snap.$PSF<P>To$SnapTo$PSF<P>|
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
; /predicate_snap_functions_declarations.smt2 [P: Int]
(declare-fun $PSF.domain_P ($PSF<P>) Set<$Snap>)
(declare-fun $PSF.lookup_P ($PSF<P> $Snap) Int)
(declare-fun $PSF.after_P ($PSF<P> $PSF<P>) Bool)
(declare-fun $PSF.loc_P (Int $Snap) Bool)
(declare-fun $PSF.perm_P ($PPM $Snap) $Perm)
(declare-const $psfTOP_P $PSF<P>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun get_f ($Snap $Ref) Int)
(declare-fun get_f%limited ($Snap $Ref) Int)
(declare-fun get_f%stateless ($Ref) Bool)
(declare-fun get_f%precondition ($Snap $Ref) Bool)
(declare-fun get_P ($Snap $Ref) Int)
(declare-fun get_P%limited ($Snap $Ref) Int)
(declare-fun get_P%stateless ($Ref) Bool)
(declare-fun get_P%precondition ($Snap $Ref) Bool)
(declare-fun fun_f ($Snap Seq<$Ref> Int) Int)
(declare-fun fun_f%limited ($Snap Seq<$Ref> Int) Int)
(declare-fun fun_f%stateless (Seq<$Ref> Int) Bool)
(declare-fun fun_f%precondition ($Snap Seq<$Ref> Int) Bool)
(declare-fun fun_P ($Snap Seq<$Ref> Int) Int)
(declare-fun fun_P%limited ($Snap Seq<$Ref> Int) Int)
(declare-fun fun_P%stateless (Seq<$Ref> Int) Bool)
(declare-fun fun_P%precondition ($Snap Seq<$Ref> Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [P: Int]
(assert (forall ((vs $PSF<P>) (ws $PSF<P>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_P vs) ($PSF.domain_P ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_P vs))
            (= ($PSF.lookup_P vs x) ($PSF.lookup_P ws x)))
          :pattern (($PSF.lookup_P vs x) ($PSF.lookup_P ws x))
          :qid |qp.$PSF<P>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<P>To$Snap vs)
              ($SortWrappers.$PSF<P>To$Snap ws)
              )
    :qid |qp.$PSF<P>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_P pm s))
    :pattern (($PSF.perm_P pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_P f s) true)
    :pattern (($PSF.loc_P f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION get_f----------
(declare-fun x@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (not (= x@0@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (get_f%limited s@$ x@0@00) (get_f s@$ x@0@00))
  :pattern ((get_f s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (get_f%stateless x@0@00)
  :pattern ((get_f%limited s@$ x@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (not (= x@0@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@1@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (get_f%precondition s@$ x@0@00)
    (= (get_f s@$ x@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((get_f s@$ x@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((get_f s@$ x@0@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION get_P----------
(declare-fun x@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (get_P%limited s@$ x@2@00) (get_P s@$ x@2@00))
  :pattern ((get_P s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (get_P%stateless x@2@00)
  :pattern ((get_P%limited s@$ x@2@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(P(x), write) in get_f(x))
(set-option :timeout 0)
(push) ; 2
(assert (P%trigger s@$ x@2@00))
(assert (not (= x@2@00 $Ref.null)))
; [eval] get_f(x)
(push) ; 3
(assert (get_f%precondition s@$ x@2@00))
(pop) ; 3
; Joined path conditions
(assert (get_f%precondition s@$ x@2@00))
(pop) ; 2
; Joined path conditions
(assert (and
  (P%trigger s@$ x@2@00)
  (not (= x@2@00 $Ref.null))
  (get_f%precondition s@$ x@2@00)))
(assert (= result@3@00 (get_f s@$ x@2@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=> (get_P%precondition s@$ x@2@00) (= (get_P s@$ x@2@00) (get_f s@$ x@2@00)))
  :pattern ((get_P s@$ x@2@00))
  :pattern ((get_P%stateless x@2@00) (P%trigger s@$ x@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=> (get_P%precondition s@$ x@2@00) (get_f%precondition s@$ x@2@00))
  :pattern ((get_P s@$ x@2@00))
  :qid |quant-u-11|)))
; ---------- FUNCTION fun_f----------
(declare-fun xs@4@00 () Seq<$Ref>)
(declare-fun j@5@00 () Int)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { xs[ix], xs[jx] } ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx))) ==> xs[ix] != xs[jx])
(declare-const ix@10@00 Int)
(declare-const jx@11@00 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx))) ==> xs[ix] != xs[jx]
; [eval] ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 0 | !(ix@10@00 >= 0) | live]
; [else-branch: 0 | ix@10@00 >= 0 | live]
(push) ; 4
; [then-branch: 0 | !(ix@10@00 >= 0)]
(assert (not (>= ix@10@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | ix@10@00 >= 0]
(assert (>= ix@10@00 0))
; [eval] ix < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 1 | !(ix@10@00 < |xs@4@00|) | live]
; [else-branch: 1 | ix@10@00 < |xs@4@00| | live]
(push) ; 6
; [then-branch: 1 | !(ix@10@00 < |xs@4@00|)]
(assert (not (< ix@10@00 (Seq_length xs@4@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | ix@10@00 < |xs@4@00|]
(assert (< ix@10@00 (Seq_length xs@4@00)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 2 | !(jx@11@00 >= 0) | live]
; [else-branch: 2 | jx@11@00 >= 0 | live]
(push) ; 8
; [then-branch: 2 | !(jx@11@00 >= 0)]
(assert (not (>= jx@11@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | jx@11@00 >= 0]
(assert (>= jx@11@00 0))
; [eval] jx < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 3 | !(jx@11@00 < |xs@4@00|) | live]
; [else-branch: 3 | jx@11@00 < |xs@4@00| | live]
(push) ; 10
; [then-branch: 3 | !(jx@11@00 < |xs@4@00|)]
(assert (not (< jx@11@00 (Seq_length xs@4@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | jx@11@00 < |xs@4@00|]
(assert (< jx@11@00 (Seq_length xs@4@00)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@11@00 (Seq_length xs@4@00)) (not (< jx@11@00 (Seq_length xs@4@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@11@00 0)
  (and
    (>= jx@11@00 0)
    (or
      (< jx@11@00 (Seq_length xs@4@00))
      (not (< jx@11@00 (Seq_length xs@4@00)))))))
(assert (or (>= jx@11@00 0) (not (>= jx@11@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@10@00 (Seq_length xs@4@00))
  (and
    (< ix@10@00 (Seq_length xs@4@00))
    (=>
      (>= jx@11@00 0)
      (and
        (>= jx@11@00 0)
        (or
          (< jx@11@00 (Seq_length xs@4@00))
          (not (< jx@11@00 (Seq_length xs@4@00))))))
    (or (>= jx@11@00 0) (not (>= jx@11@00 0))))))
(assert (or (< ix@10@00 (Seq_length xs@4@00)) (not (< ix@10@00 (Seq_length xs@4@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@10@00 0)
  (and
    (>= ix@10@00 0)
    (=>
      (< ix@10@00 (Seq_length xs@4@00))
      (and
        (< ix@10@00 (Seq_length xs@4@00))
        (=>
          (>= jx@11@00 0)
          (and
            (>= jx@11@00 0)
            (or
              (< jx@11@00 (Seq_length xs@4@00))
              (not (< jx@11@00 (Seq_length xs@4@00))))))
        (or (>= jx@11@00 0) (not (>= jx@11@00 0)))))
    (or
      (< ix@10@00 (Seq_length xs@4@00))
      (not (< ix@10@00 (Seq_length xs@4@00)))))))
(assert (or (>= ix@10@00 0) (not (>= ix@10@00 0))))
(push) ; 3
; [then-branch: 4 | ix@10@00 >= 0 && ix@10@00 < |xs@4@00| && jx@11@00 >= 0 && jx@11@00 < |xs@4@00| && ix@10@00 != jx@11@00 | live]
; [else-branch: 4 | !(ix@10@00 >= 0 && ix@10@00 < |xs@4@00| && jx@11@00 >= 0 && jx@11@00 < |xs@4@00| && ix@10@00 != jx@11@00) | live]
(push) ; 4
; [then-branch: 4 | ix@10@00 >= 0 && ix@10@00 < |xs@4@00| && jx@11@00 >= 0 && jx@11@00 < |xs@4@00| && ix@10@00 != jx@11@00]
(assert (and
  (>= ix@10@00 0)
  (and
    (< ix@10@00 (Seq_length xs@4@00))
    (and
      (>= jx@11@00 0)
      (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00)))))))
; [eval] xs[ix] != xs[jx]
; [eval] xs[ix]
; [eval] xs[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(ix@10@00 >= 0 && ix@10@00 < |xs@4@00| && jx@11@00 >= 0 && jx@11@00 < |xs@4@00| && ix@10@00 != jx@11@00)]
(assert (not
  (and
    (>= ix@10@00 0)
    (and
      (< ix@10@00 (Seq_length xs@4@00))
      (and
        (>= jx@11@00 0)
        (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@10@00 0)
    (and
      (< ix@10@00 (Seq_length xs@4@00))
      (and
        (>= jx@11@00 0)
        (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00))))))
  (and
    (>= ix@10@00 0)
    (< ix@10@00 (Seq_length xs@4@00))
    (>= jx@11@00 0)
    (< jx@11@00 (Seq_length xs@4@00))
    (not (= ix@10@00 jx@11@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@10@00 0)
      (and
        (< ix@10@00 (Seq_length xs@4@00))
        (and
          (>= jx@11@00 0)
          (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00)))))))
  (and
    (>= ix@10@00 0)
    (and
      (< ix@10@00 (Seq_length xs@4@00))
      (and
        (>= jx@11@00 0)
        (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@10@00 Int) (jx@11@00 Int)) (!
  (and
    (=>
      (>= ix@10@00 0)
      (and
        (>= ix@10@00 0)
        (=>
          (< ix@10@00 (Seq_length xs@4@00))
          (and
            (< ix@10@00 (Seq_length xs@4@00))
            (=>
              (>= jx@11@00 0)
              (and
                (>= jx@11@00 0)
                (or
                  (< jx@11@00 (Seq_length xs@4@00))
                  (not (< jx@11@00 (Seq_length xs@4@00))))))
            (or (>= jx@11@00 0) (not (>= jx@11@00 0)))))
        (or
          (< ix@10@00 (Seq_length xs@4@00))
          (not (< ix@10@00 (Seq_length xs@4@00))))))
    (or (>= ix@10@00 0) (not (>= ix@10@00 0)))
    (=>
      (and
        (>= ix@10@00 0)
        (and
          (< ix@10@00 (Seq_length xs@4@00))
          (and
            (>= jx@11@00 0)
            (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00))))))
      (and
        (>= ix@10@00 0)
        (< ix@10@00 (Seq_length xs@4@00))
        (>= jx@11@00 0)
        (< jx@11@00 (Seq_length xs@4@00))
        (not (= ix@10@00 jx@11@00))))
    (or
      (not
        (and
          (>= ix@10@00 0)
          (and
            (< ix@10@00 (Seq_length xs@4@00))
            (and
              (>= jx@11@00 0)
              (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00)))))))
      (and
        (>= ix@10@00 0)
        (and
          (< ix@10@00 (Seq_length xs@4@00))
          (and
            (>= jx@11@00 0)
            (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00))))))))
  :pattern ((Seq_index xs@4@00 ix@10@00) (Seq_index xs@4@00 jx@11@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/functions.vpr@7@12@7@116-aux|)))
(assert (forall ((ix@10@00 Int) (jx@11@00 Int)) (!
  (=>
    (and
      (>= ix@10@00 0)
      (and
        (< ix@10@00 (Seq_length xs@4@00))
        (and
          (>= jx@11@00 0)
          (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00))))))
    (not (= (Seq_index xs@4@00 ix@10@00) (Seq_index xs@4@00 jx@11@00))))
  :pattern ((Seq_index xs@4@00 ix@10@00) (Seq_index xs@4@00 jx@11@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/functions.vpr@7@12@7@116|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const i@12@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 5 | !(0 <= i@12@00) | live]
; [else-branch: 5 | 0 <= i@12@00 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= i@12@00)]
(assert (not (<= 0 i@12@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= i@12@00]
(assert (<= 0 i@12@00))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@12@00) (not (<= 0 i@12@00))))
(assert (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@4@00))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@12@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@13@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@14@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@4@00)))
    (or (<= 0 i@12@00) (not (<= 0 i@12@00))))
  :pattern ((Seq_index xs@4@00 i@12@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@12@00 Int) (i2@12@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@12@00) (< i1@12@00 (Seq_length xs@4@00)))
      (and (<= 0 i2@12@00) (< i2@12@00 (Seq_length xs@4@00)))
      (= (Seq_index xs@4@00 i1@12@00) (Seq_index xs@4@00 i2@12@00)))
    (= i1@12@00 i2@12@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@4@00)))
    (and
      (= (inv@13@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 i@12@00)) i@12@00)
      (img@14@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 i@12@00))))
  :pattern ((Seq_index xs@4@00 i@12@00))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@00 s@$ xs@4@00 j@5@00 r)
      (and
        (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 r))
        (< (inv@13@00 s@$ xs@4@00 j@5@00 r) (Seq_length xs@4@00))))
    (= (Seq_index xs@4@00 (inv@13@00 s@$ xs@4@00 j@5@00 r)) r))
  :pattern ((inv@13@00 s@$ xs@4@00 j@5@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@4@00)))
    (not (= (Seq_index xs@4@00 i@12@00) $Ref.null)))
  :pattern ((Seq_index xs@4@00 i@12@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] 0 <= j
(assert (<= 0 j@5@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] j < |xs|
; [eval] |xs|
(assert (< j@5@00 (Seq_length xs@4@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@4@00 Seq<$Ref>) (j@5@00 Int)) (!
  (= (fun_f%limited s@$ xs@4@00 j@5@00) (fun_f s@$ xs@4@00 j@5@00))
  :pattern ((fun_f s@$ xs@4@00 j@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@4@00 Seq<$Ref>) (j@5@00 Int)) (!
  (fun_f%stateless xs@4@00 j@5@00)
  :pattern ((fun_f%limited s@$ xs@4@00 j@5@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@00 s@$ xs@4@00 j@5@00 r)
      (and
        (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 r))
        (< (inv@13@00 s@$ xs@4@00 j@5@00 r) (Seq_length xs@4@00))))
    (= (Seq_index xs@4@00 (inv@13@00 s@$ xs@4@00 j@5@00 r)) r))
  :pattern ((inv@13@00 s@$ xs@4@00 j@5@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@4@00)))
    (and
      (= (inv@13@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 i@12@00)) i@12@00)
      (img@14@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 i@12@00))))
  :pattern ((Seq_index xs@4@00 i@12@00))
  :qid |quant-u-13|)))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@4@00)))
    (not (= (Seq_index xs@4@00 i@12@00) $Ref.null)))
  :pattern ((Seq_index xs@4@00 i@12@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= 0 j@5@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (< j@5@00 (Seq_length xs@4@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (forall ((ix@10@00 Int) (jx@11@00 Int)) (!
  (and
    (=>
      (>= ix@10@00 0)
      (and
        (>= ix@10@00 0)
        (=>
          (< ix@10@00 (Seq_length xs@4@00))
          (and
            (< ix@10@00 (Seq_length xs@4@00))
            (=>
              (>= jx@11@00 0)
              (and
                (>= jx@11@00 0)
                (or
                  (< jx@11@00 (Seq_length xs@4@00))
                  (not (< jx@11@00 (Seq_length xs@4@00))))))
            (or (>= jx@11@00 0) (not (>= jx@11@00 0)))))
        (or
          (< ix@10@00 (Seq_length xs@4@00))
          (not (< ix@10@00 (Seq_length xs@4@00))))))
    (or (>= ix@10@00 0) (not (>= ix@10@00 0)))
    (=>
      (and
        (>= ix@10@00 0)
        (and
          (< ix@10@00 (Seq_length xs@4@00))
          (and
            (>= jx@11@00 0)
            (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00))))))
      (and
        (>= ix@10@00 0)
        (< ix@10@00 (Seq_length xs@4@00))
        (>= jx@11@00 0)
        (< jx@11@00 (Seq_length xs@4@00))
        (not (= ix@10@00 jx@11@00))))
    (or
      (not
        (and
          (>= ix@10@00 0)
          (and
            (< ix@10@00 (Seq_length xs@4@00))
            (and
              (>= jx@11@00 0)
              (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00)))))))
      (and
        (>= ix@10@00 0)
        (and
          (< ix@10@00 (Seq_length xs@4@00))
          (and
            (>= jx@11@00 0)
            (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00))))))))
  :pattern ((Seq_index xs@4@00 ix@10@00) (Seq_index xs@4@00 jx@11@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/functions.vpr@7@12@7@116-aux|)))
(assert (forall ((ix@10@00 Int) (jx@11@00 Int)) (!
  (=>
    (and
      (>= ix@10@00 0)
      (and
        (< ix@10@00 (Seq_length xs@4@00))
        (and
          (>= jx@11@00 0)
          (and (< jx@11@00 (Seq_length xs@4@00)) (not (= ix@10@00 jx@11@00))))))
    (not (= (Seq_index xs@4@00 ix@10@00) (Seq_index xs@4@00 jx@11@00))))
  :pattern ((Seq_index xs@4@00 ix@10@00) (Seq_index xs@4@00 jx@11@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/functions.vpr@7@12@7@116|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@4@00)))
    (or (<= 0 i@12@00) (not (<= 0 i@12@00))))
  :pattern ((Seq_index xs@4@00 i@12@00))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] get_f(xs[j])
; [eval] xs[j]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= j@5@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
; Precomputing data for removing quantified permissions
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
        (and
          (img@14@00 s@$ xs@4@00 j@5@00 r)
          (and
            (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 r))
            (< (inv@13@00 s@$ xs@4@00 j@5@00 r) (Seq_length xs@4@00))))
        $Perm.Write
        $Perm.No)
      (ite
        (= r (Seq_index xs@4@00 j@5@00))
        ($Perm.min
          (ite
            (and
              (img@14@00 s@$ xs@4@00 j@5@00 r)
              (and
                (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 r))
                (< (inv@13@00 s@$ xs@4@00 j@5@00 r) (Seq_length xs@4@00))))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (= r (Seq_index xs@4@00 j@5@00))
      ($Perm.min
        (ite
          (and
            (img@14@00 s@$ xs@4@00 j@5@00 r)
            (and
              (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 r))
              (< (inv@13@00 s@$ xs@4@00 j@5@00 r) (Seq_length xs@4@00))))
          $Perm.Write
          $Perm.No)
        $Perm.Write)
      $Perm.No)
    $Perm.No)
  
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
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@4@00 j@5@00))
    (=
      (-
        $Perm.Write
        (ite
          (= r (Seq_index xs@4@00 j@5@00))
          ($Perm.min
            (ite
              (and
                (img@14@00 s@$ xs@4@00 j@5@00 r)
                (and
                  (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 r))
                  (< (inv@13@00 s@$ xs@4@00 j@5@00 r) (Seq_length xs@4@00))))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@15@00 ($Snap Seq<$Ref> Int) $FVF<f>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@14@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 j@5@00))
    (and
      (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 j@5@00)))
      (<
        (inv@13@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 j@5@00))
        (Seq_length xs@4@00))))
  (=
    ($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) (Seq_index xs@4@00 j@5@00))
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
      xs@4@00
      j@5@00)))))
(assert (get_f%precondition ($SortWrappers.IntTo$Snap ($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) (Seq_index
  xs@4@00
  j@5@00))) (Seq_index xs@4@00 j@5@00)))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (and
      (img@14@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 j@5@00))
      (and
        (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 j@5@00)))
        (<
          (inv@13@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 j@5@00))
          (Seq_length xs@4@00))))
    (=
      ($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) (Seq_index xs@4@00 j@5@00))
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
        xs@4@00
        j@5@00))))
  (get_f%precondition ($SortWrappers.IntTo$Snap ($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) (Seq_index
    xs@4@00
    j@5@00))) (Seq_index xs@4@00 j@5@00))))
(assert (=
  result@6@00
  (get_f ($SortWrappers.IntTo$Snap ($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) (Seq_index
    xs@4@00
    j@5@00))) (Seq_index xs@4@00 j@5@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@4@00 Seq<$Ref>) (j@5@00 Int)) (!
  (and
    (forall ((i@12@00 Int)) (!
      (=>
        (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@4@00)))
        (and
          (= (inv@13@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 i@12@00)) i@12@00)
          (img@14@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 i@12@00))))
      :pattern ((Seq_index xs@4@00 i@12@00))
      :qid |quant-u-13|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@14@00 s@$ xs@4@00 j@5@00 r)
          (and
            (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 r))
            (< (inv@13@00 s@$ xs@4@00 j@5@00 r) (Seq_length xs@4@00))))
        (= (Seq_index xs@4@00 (inv@13@00 s@$ xs@4@00 j@5@00 r)) r))
      :pattern ((inv@13@00 s@$ xs@4@00 j@5@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@14@00 s@$ xs@4@00 j@5@00 r)
          (and
            (<= 0 (inv@13@00 s@$ xs@4@00 j@5@00 r))
            (< (inv@13@00 s@$ xs@4@00 j@5@00 r) (Seq_length xs@4@00))))
        (=
          ($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef0|))
    (=>
      (fun_f%precondition s@$ xs@4@00 j@5@00)
      (=
        (fun_f s@$ xs@4@00 j@5@00)
        (get_f ($SortWrappers.IntTo$Snap ($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) (Seq_index
          xs@4@00
          j@5@00))) (Seq_index xs@4@00 j@5@00)))))
  :pattern ((fun_f s@$ xs@4@00 j@5@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (xs@4@00 Seq<$Ref>) (j@5@00 Int)) (!
  (=>
    (fun_f%precondition s@$ xs@4@00 j@5@00)
    (get_f%precondition ($SortWrappers.IntTo$Snap ($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) (Seq_index
      xs@4@00
      j@5@00))) (Seq_index xs@4@00 j@5@00)))
  :pattern ((fun_f s@$ xs@4@00 j@5@00))
  :qid |quant-u-19|)))
; ---------- FUNCTION fun_P----------
(declare-fun xs@7@00 () Seq<$Ref>)
(declare-fun j@8@00 () Int)
(declare-fun result@9@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { xs[ix], xs[jx] } ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx))) ==> xs[ix] != xs[jx])
(declare-const ix@16@00 Int)
(declare-const jx@17@00 Int)
(push) ; 2
; [eval] ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx))) ==> xs[ix] != xs[jx]
; [eval] ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx)))
; [eval] ix >= 0
(push) ; 3
; [then-branch: 6 | !(ix@16@00 >= 0) | live]
; [else-branch: 6 | ix@16@00 >= 0 | live]
(push) ; 4
; [then-branch: 6 | !(ix@16@00 >= 0)]
(assert (not (>= ix@16@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | ix@16@00 >= 0]
(assert (>= ix@16@00 0))
; [eval] ix < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 7 | !(ix@16@00 < |xs@7@00|) | live]
; [else-branch: 7 | ix@16@00 < |xs@7@00| | live]
(push) ; 6
; [then-branch: 7 | !(ix@16@00 < |xs@7@00|)]
(assert (not (< ix@16@00 (Seq_length xs@7@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | ix@16@00 < |xs@7@00|]
(assert (< ix@16@00 (Seq_length xs@7@00)))
; [eval] jx >= 0
(push) ; 7
; [then-branch: 8 | !(jx@17@00 >= 0) | live]
; [else-branch: 8 | jx@17@00 >= 0 | live]
(push) ; 8
; [then-branch: 8 | !(jx@17@00 >= 0)]
(assert (not (>= jx@17@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | jx@17@00 >= 0]
(assert (>= jx@17@00 0))
; [eval] jx < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 9 | !(jx@17@00 < |xs@7@00|) | live]
; [else-branch: 9 | jx@17@00 < |xs@7@00| | live]
(push) ; 10
; [then-branch: 9 | !(jx@17@00 < |xs@7@00|)]
(assert (not (< jx@17@00 (Seq_length xs@7@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | jx@17@00 < |xs@7@00|]
(assert (< jx@17@00 (Seq_length xs@7@00)))
; [eval] ix != jx
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< jx@17@00 (Seq_length xs@7@00)) (not (< jx@17@00 (Seq_length xs@7@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@17@00 0)
  (and
    (>= jx@17@00 0)
    (or
      (< jx@17@00 (Seq_length xs@7@00))
      (not (< jx@17@00 (Seq_length xs@7@00)))))))
(assert (or (>= jx@17@00 0) (not (>= jx@17@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@16@00 (Seq_length xs@7@00))
  (and
    (< ix@16@00 (Seq_length xs@7@00))
    (=>
      (>= jx@17@00 0)
      (and
        (>= jx@17@00 0)
        (or
          (< jx@17@00 (Seq_length xs@7@00))
          (not (< jx@17@00 (Seq_length xs@7@00))))))
    (or (>= jx@17@00 0) (not (>= jx@17@00 0))))))
(assert (or (< ix@16@00 (Seq_length xs@7@00)) (not (< ix@16@00 (Seq_length xs@7@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@16@00 0)
  (and
    (>= ix@16@00 0)
    (=>
      (< ix@16@00 (Seq_length xs@7@00))
      (and
        (< ix@16@00 (Seq_length xs@7@00))
        (=>
          (>= jx@17@00 0)
          (and
            (>= jx@17@00 0)
            (or
              (< jx@17@00 (Seq_length xs@7@00))
              (not (< jx@17@00 (Seq_length xs@7@00))))))
        (or (>= jx@17@00 0) (not (>= jx@17@00 0)))))
    (or
      (< ix@16@00 (Seq_length xs@7@00))
      (not (< ix@16@00 (Seq_length xs@7@00)))))))
(assert (or (>= ix@16@00 0) (not (>= ix@16@00 0))))
(push) ; 3
; [then-branch: 10 | ix@16@00 >= 0 && ix@16@00 < |xs@7@00| && jx@17@00 >= 0 && jx@17@00 < |xs@7@00| && ix@16@00 != jx@17@00 | live]
; [else-branch: 10 | !(ix@16@00 >= 0 && ix@16@00 < |xs@7@00| && jx@17@00 >= 0 && jx@17@00 < |xs@7@00| && ix@16@00 != jx@17@00) | live]
(push) ; 4
; [then-branch: 10 | ix@16@00 >= 0 && ix@16@00 < |xs@7@00| && jx@17@00 >= 0 && jx@17@00 < |xs@7@00| && ix@16@00 != jx@17@00]
(assert (and
  (>= ix@16@00 0)
  (and
    (< ix@16@00 (Seq_length xs@7@00))
    (and
      (>= jx@17@00 0)
      (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00)))))))
; [eval] xs[ix] != xs[jx]
; [eval] xs[ix]
; [eval] xs[jx]
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(ix@16@00 >= 0 && ix@16@00 < |xs@7@00| && jx@17@00 >= 0 && jx@17@00 < |xs@7@00| && ix@16@00 != jx@17@00)]
(assert (not
  (and
    (>= ix@16@00 0)
    (and
      (< ix@16@00 (Seq_length xs@7@00))
      (and
        (>= jx@17@00 0)
        (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= ix@16@00 0)
    (and
      (< ix@16@00 (Seq_length xs@7@00))
      (and
        (>= jx@17@00 0)
        (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00))))))
  (and
    (>= ix@16@00 0)
    (< ix@16@00 (Seq_length xs@7@00))
    (>= jx@17@00 0)
    (< jx@17@00 (Seq_length xs@7@00))
    (not (= ix@16@00 jx@17@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@16@00 0)
      (and
        (< ix@16@00 (Seq_length xs@7@00))
        (and
          (>= jx@17@00 0)
          (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00)))))))
  (and
    (>= ix@16@00 0)
    (and
      (< ix@16@00 (Seq_length xs@7@00))
      (and
        (>= jx@17@00 0)
        (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@16@00 Int) (jx@17@00 Int)) (!
  (and
    (=>
      (>= ix@16@00 0)
      (and
        (>= ix@16@00 0)
        (=>
          (< ix@16@00 (Seq_length xs@7@00))
          (and
            (< ix@16@00 (Seq_length xs@7@00))
            (=>
              (>= jx@17@00 0)
              (and
                (>= jx@17@00 0)
                (or
                  (< jx@17@00 (Seq_length xs@7@00))
                  (not (< jx@17@00 (Seq_length xs@7@00))))))
            (or (>= jx@17@00 0) (not (>= jx@17@00 0)))))
        (or
          (< ix@16@00 (Seq_length xs@7@00))
          (not (< ix@16@00 (Seq_length xs@7@00))))))
    (or (>= ix@16@00 0) (not (>= ix@16@00 0)))
    (=>
      (and
        (>= ix@16@00 0)
        (and
          (< ix@16@00 (Seq_length xs@7@00))
          (and
            (>= jx@17@00 0)
            (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00))))))
      (and
        (>= ix@16@00 0)
        (< ix@16@00 (Seq_length xs@7@00))
        (>= jx@17@00 0)
        (< jx@17@00 (Seq_length xs@7@00))
        (not (= ix@16@00 jx@17@00))))
    (or
      (not
        (and
          (>= ix@16@00 0)
          (and
            (< ix@16@00 (Seq_length xs@7@00))
            (and
              (>= jx@17@00 0)
              (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00)))))))
      (and
        (>= ix@16@00 0)
        (and
          (< ix@16@00 (Seq_length xs@7@00))
          (and
            (>= jx@17@00 0)
            (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00))))))))
  :pattern ((Seq_index xs@7@00 ix@16@00) (Seq_index xs@7@00 jx@17@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/functions.vpr@39@12@39@116-aux|)))
(assert (forall ((ix@16@00 Int) (jx@17@00 Int)) (!
  (=>
    (and
      (>= ix@16@00 0)
      (and
        (< ix@16@00 (Seq_length xs@7@00))
        (and
          (>= jx@17@00 0)
          (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00))))))
    (not (= (Seq_index xs@7@00 ix@16@00) (Seq_index xs@7@00 jx@17@00))))
  :pattern ((Seq_index xs@7@00 ix@16@00) (Seq_index xs@7@00 jx@17@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/functions.vpr@39@12@39@116|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const i@18@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 11 | !(0 <= i@18@00) | live]
; [else-branch: 11 | 0 <= i@18@00 | live]
(push) ; 4
; [then-branch: 11 | !(0 <= i@18@00)]
(assert (not (<= 0 i@18@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | 0 <= i@18@00]
(assert (<= 0 i@18@00))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@18@00) (not (<= 0 i@18@00))))
(assert (and (<= 0 i@18@00) (< i@18@00 (Seq_length xs@7@00))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@18@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@19@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@20@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@18@00 Int)) (!
  (=>
    (and (<= 0 i@18@00) (< i@18@00 (Seq_length xs@7@00)))
    (or (<= 0 i@18@00) (not (<= 0 i@18@00))))
  :pattern ((Seq_index xs@7@00 i@18@00))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@18@00 Int) (i2@18@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@18@00) (< i1@18@00 (Seq_length xs@7@00)))
      (and (<= 0 i2@18@00) (< i2@18@00 (Seq_length xs@7@00)))
      (= (Seq_index xs@7@00 i1@18@00) (Seq_index xs@7@00 i2@18@00)))
    (= i1@18@00 i2@18@00))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@18@00 Int)) (!
  (=>
    (and (<= 0 i@18@00) (< i@18@00 (Seq_length xs@7@00)))
    (and
      (= (inv@19@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 i@18@00)) i@18@00)
      (img@20@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 i@18@00))))
  :pattern ((Seq_index xs@7@00 i@18@00))
  :qid |quant-u-21|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ xs@7@00 j@8@00 x)
      (and
        (<= 0 (inv@19@00 s@$ xs@7@00 j@8@00 x))
        (< (inv@19@00 s@$ xs@7@00 j@8@00 x) (Seq_length xs@7@00))))
    (= (Seq_index xs@7@00 (inv@19@00 s@$ xs@7@00 j@8@00 x)) x))
  :pattern ((inv@19@00 s@$ xs@7@00 j@8@00 x))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] 0 <= j
(assert (<= 0 j@8@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] j < |xs|
; [eval] |xs|
(assert (< j@8@00 (Seq_length xs@7@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (j@8@00 Int)) (!
  (= (fun_P%limited s@$ xs@7@00 j@8@00) (fun_P s@$ xs@7@00 j@8@00))
  :pattern ((fun_P s@$ xs@7@00 j@8@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (j@8@00 Int)) (!
  (fun_P%stateless xs@7@00 j@8@00)
  :pattern ((fun_P%limited s@$ xs@7@00 j@8@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ xs@7@00 j@8@00 x)
      (and
        (<= 0 (inv@19@00 s@$ xs@7@00 j@8@00 x))
        (< (inv@19@00 s@$ xs@7@00 j@8@00 x) (Seq_length xs@7@00))))
    (= (Seq_index xs@7@00 (inv@19@00 s@$ xs@7@00 j@8@00 x)) x))
  :pattern ((inv@19@00 s@$ xs@7@00 j@8@00 x))
  :qid |P-fctOfInv|)))
(assert (forall ((i@18@00 Int)) (!
  (=>
    (and (<= 0 i@18@00) (< i@18@00 (Seq_length xs@7@00)))
    (and
      (= (inv@19@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 i@18@00)) i@18@00)
      (img@20@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 i@18@00))))
  :pattern ((Seq_index xs@7@00 i@18@00))
  :qid |quant-u-21|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= 0 j@8@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (< j@8@00 (Seq_length xs@7@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (forall ((ix@16@00 Int) (jx@17@00 Int)) (!
  (and
    (=>
      (>= ix@16@00 0)
      (and
        (>= ix@16@00 0)
        (=>
          (< ix@16@00 (Seq_length xs@7@00))
          (and
            (< ix@16@00 (Seq_length xs@7@00))
            (=>
              (>= jx@17@00 0)
              (and
                (>= jx@17@00 0)
                (or
                  (< jx@17@00 (Seq_length xs@7@00))
                  (not (< jx@17@00 (Seq_length xs@7@00))))))
            (or (>= jx@17@00 0) (not (>= jx@17@00 0)))))
        (or
          (< ix@16@00 (Seq_length xs@7@00))
          (not (< ix@16@00 (Seq_length xs@7@00))))))
    (or (>= ix@16@00 0) (not (>= ix@16@00 0)))
    (=>
      (and
        (>= ix@16@00 0)
        (and
          (< ix@16@00 (Seq_length xs@7@00))
          (and
            (>= jx@17@00 0)
            (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00))))))
      (and
        (>= ix@16@00 0)
        (< ix@16@00 (Seq_length xs@7@00))
        (>= jx@17@00 0)
        (< jx@17@00 (Seq_length xs@7@00))
        (not (= ix@16@00 jx@17@00))))
    (or
      (not
        (and
          (>= ix@16@00 0)
          (and
            (< ix@16@00 (Seq_length xs@7@00))
            (and
              (>= jx@17@00 0)
              (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00)))))))
      (and
        (>= ix@16@00 0)
        (and
          (< ix@16@00 (Seq_length xs@7@00))
          (and
            (>= jx@17@00 0)
            (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00))))))))
  :pattern ((Seq_index xs@7@00 ix@16@00) (Seq_index xs@7@00 jx@17@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/functions.vpr@39@12@39@116-aux|)))
(assert (forall ((ix@16@00 Int) (jx@17@00 Int)) (!
  (=>
    (and
      (>= ix@16@00 0)
      (and
        (< ix@16@00 (Seq_length xs@7@00))
        (and
          (>= jx@17@00 0)
          (and (< jx@17@00 (Seq_length xs@7@00)) (not (= ix@16@00 jx@17@00))))))
    (not (= (Seq_index xs@7@00 ix@16@00) (Seq_index xs@7@00 jx@17@00))))
  :pattern ((Seq_index xs@7@00 ix@16@00) (Seq_index xs@7@00 jx@17@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/functions.vpr@39@12@39@116|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (forall ((i@18@00 Int)) (!
  (=>
    (and (<= 0 i@18@00) (< i@18@00 (Seq_length xs@7@00)))
    (or (<= 0 i@18@00) (not (<= 0 i@18@00))))
  :pattern ((Seq_index xs@7@00 i@18@00))
  :qid |P-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] get_P(xs[j])
; [eval] xs[j]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= j@8@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
; Precomputing data for removing quantified permissions
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
        (and
          (img@20@00 s@$ xs@7@00 j@8@00 x)
          (and
            (<= 0 (inv@19@00 s@$ xs@7@00 j@8@00 x))
            (< (inv@19@00 s@$ xs@7@00 j@8@00 x) (Seq_length xs@7@00))))
        $Perm.Write
        $Perm.No)
      (ite
        (= x (Seq_index xs@7@00 j@8@00))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ xs@7@00 j@8@00 x)
              (and
                (<= 0 (inv@19@00 s@$ xs@7@00 j@8@00 x))
                (< (inv@19@00 s@$ xs@7@00 j@8@00 x) (Seq_length xs@7@00))))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (ite
      (= x (Seq_index xs@7@00 j@8@00))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ xs@7@00 j@8@00 x)
            (and
              (<= 0 (inv@19@00 s@$ xs@7@00 j@8@00 x))
              (< (inv@19@00 s@$ xs@7@00 j@8@00 x) (Seq_length xs@7@00))))
          $Perm.Write
          $Perm.No)
        $Perm.Write)
      $Perm.No)
    $Perm.No)
  
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
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x (Seq_index xs@7@00 j@8@00))
    (=
      (-
        $Perm.Write
        (ite
          (= x (Seq_index xs@7@00 j@8@00))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ xs@7@00 j@8@00 x)
                (and
                  (<= 0 (inv@19@00 s@$ xs@7@00 j@8@00 x))
                  (< (inv@19@00 s@$ xs@7@00 j@8@00 x) (Seq_length xs@7@00))))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@21@00 ($Snap Seq<$Ref> Int) $PSF<P>)
(declare-const s@22@00 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@20@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 j@8@00))
    (and
      (<= 0 (inv@19@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 j@8@00)))
      (<
        (inv@19@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 j@8@00))
        (Seq_length xs@7@00))))
  (and
    (not (= ($SortWrappers.$RefTo$Snap (Seq_index xs@7@00 j@8@00)) $Snap.unit))
    (=
      ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) ($SortWrappers.$RefTo$Snap (Seq_index
        xs@7@00
        j@8@00)))
      ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first ($Snap.second s@$))) ($SortWrappers.$RefTo$Snap (Seq_index
        xs@7@00
        j@8@00)))))))
(assert (get_P%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) ($SortWrappers.$RefTo$Snap (Seq_index
  xs@7@00
  j@8@00)))) (Seq_index xs@7@00 j@8@00)))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (and
      (img@20@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 j@8@00))
      (and
        (<= 0 (inv@19@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 j@8@00)))
        (<
          (inv@19@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 j@8@00))
          (Seq_length xs@7@00))))
    (and
      (not (= ($SortWrappers.$RefTo$Snap (Seq_index xs@7@00 j@8@00)) $Snap.unit))
      (=
        ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) ($SortWrappers.$RefTo$Snap (Seq_index
          xs@7@00
          j@8@00)))
        ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first ($Snap.second s@$))) ($SortWrappers.$RefTo$Snap (Seq_index
          xs@7@00
          j@8@00))))))
  (get_P%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) ($SortWrappers.$RefTo$Snap (Seq_index
    xs@7@00
    j@8@00)))) (Seq_index xs@7@00 j@8@00))))
(assert (=
  result@9@00
  (get_P ($SortWrappers.IntTo$Snap ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) ($SortWrappers.$RefTo$Snap (Seq_index
    xs@7@00
    j@8@00)))) (Seq_index xs@7@00 j@8@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (j@8@00 Int)) (!
  (and
    (forall ((i@18@00 Int)) (!
      (=>
        (and (<= 0 i@18@00) (< i@18@00 (Seq_length xs@7@00)))
        (and
          (= (inv@19@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 i@18@00)) i@18@00)
          (img@20@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 i@18@00))))
      :pattern ((Seq_index xs@7@00 i@18@00))
      :qid |quant-u-21|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@20@00 s@$ xs@7@00 j@8@00 x)
          (and
            (<= 0 (inv@19@00 s@$ xs@7@00 j@8@00 x))
            (< (inv@19@00 s@$ xs@7@00 j@8@00 x) (Seq_length xs@7@00))))
        (= (Seq_index xs@7@00 (inv@19@00 s@$ xs@7@00 j@8@00 x)) x))
      :pattern ((inv@19@00 s@$ xs@7@00 j@8@00 x))
      :qid |P-fctOfInv|))
    (forall ((s@22@00 $Snap)) (!
      (=>
        (and
          (img@20@00 s@$ xs@7@00 j@8@00 ($SortWrappers.$SnapTo$Ref s@22@00))
          (and
            (<=
              0
              (inv@19@00 s@$ xs@7@00 j@8@00 ($SortWrappers.$SnapTo$Ref s@22@00)))
            (<
              (inv@19@00 s@$ xs@7@00 j@8@00 ($SortWrappers.$SnapTo$Ref s@22@00))
              (Seq_length xs@7@00))))
        (and
          (not (= s@22@00 $Snap.unit))
          (=
            ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) s@22@00)
            ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first ($Snap.second s@$))) s@22@00))))
      :pattern (($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) s@22@00))
      :pattern (($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first ($Snap.second s@$))) s@22@00))
      :qid |qp.psmValDef1|))
    (=>
      (fun_P%precondition s@$ xs@7@00 j@8@00)
      (=
        (fun_P s@$ xs@7@00 j@8@00)
        (get_P ($SortWrappers.IntTo$Snap ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) ($SortWrappers.$RefTo$Snap (Seq_index
          xs@7@00
          j@8@00)))) (Seq_index xs@7@00 j@8@00)))))
  :pattern ((fun_P s@$ xs@7@00 j@8@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (j@8@00 Int)) (!
  (=>
    (fun_P%precondition s@$ xs@7@00 j@8@00)
    (get_P%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) ($SortWrappers.$RefTo$Snap (Seq_index
      xs@7@00
      j@8@00)))) (Seq_index xs@7@00 j@8@00)))
  :pattern ((fun_P s@$ xs@7@00 j@8@00))
  :qid |quant-u-27|)))
; ---------- P ----------
(declare-const x@23@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@24@00 Int)
(assert (not (= x@23@00 $Ref.null)))
(pop) ; 1
