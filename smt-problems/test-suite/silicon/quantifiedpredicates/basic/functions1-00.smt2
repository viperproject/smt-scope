(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:24:38
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr
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
; /predicate_snap_functions_declarations.smt2 [P: Snap]
(declare-fun $PSF.domain_P ($PSF<P>) Set<$Snap>)
(declare-fun $PSF.lookup_P ($PSF<P> $Snap) $Snap)
(declare-fun $PSF.after_P ($PSF<P> $PSF<P>) Bool)
(declare-fun $PSF.loc_P ($Snap $Snap) Bool)
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
; /predicate_snap_functions_axioms.smt2 [P: Snap]
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
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_P f s) true)
    :pattern (($PSF.loc_P f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@13@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@14@00 ($Snap Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@15@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun inv@19@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@20@00 ($Snap Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@21@00 ($Snap Seq<$Ref> Int) $PSF<P>)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (get_f%limited s@$ x@0@00) (get_f s@$ x@0@00))
  :pattern ((get_f s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (get_f%stateless x@0@00)
  :pattern ((get_f%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (get_P%limited s@$ x@2@00) (get_P s@$ x@2@00))
  :pattern ((get_P s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (get_P%stateless x@2@00)
  :pattern ((get_P%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@4@00 Seq<$Ref>) (j@5@00 Int)) (!
  (= (fun_f%limited s@$ xs@4@00 j@5@00) (fun_f s@$ xs@4@00 j@5@00))
  :pattern ((fun_f s@$ xs@4@00 j@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@4@00 Seq<$Ref>) (j@5@00 Int)) (!
  (fun_f%stateless xs@4@00 j@5@00)
  :pattern ((fun_f%limited s@$ xs@4@00 j@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@4@00 Seq<$Ref>) (j@5@00 Int)) (!
  (and
    (forall ((i@12@00 Int)) (!
      (=>
        (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@4@00)))
        (and
          (= (inv@13@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 i@12@00)) i@12@00)
          (img@14@00 s@$ xs@4@00 j@5@00 (Seq_index xs@4@00 i@12@00))))
      :pattern ((Seq_index xs@4@00 i@12@00))
      :qid |quant-u-9|))
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
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (xs@4@00 Seq<$Ref>) (j@5@00 Int)) (!
  (=>
    (fun_f%precondition s@$ xs@4@00 j@5@00)
    (get_f%precondition ($SortWrappers.IntTo$Snap ($FVF.lookup_f (sm@15@00 s@$ xs@4@00 j@5@00) (Seq_index
      xs@4@00
      j@5@00))) (Seq_index xs@4@00 j@5@00)))
  :pattern ((fun_f s@$ xs@4@00 j@5@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (j@8@00 Int)) (!
  (= (fun_P%limited s@$ xs@7@00 j@8@00) (fun_P s@$ xs@7@00 j@8@00))
  :pattern ((fun_P s@$ xs@7@00 j@8@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (j@8@00 Int)) (!
  (fun_P%stateless xs@7@00 j@8@00)
  :pattern ((fun_P%limited s@$ xs@7@00 j@8@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (j@8@00 Int)) (!
  (and
    (forall ((i@18@00 Int)) (!
      (=>
        (and (<= 0 i@18@00) (< i@18@00 (Seq_length xs@7@00)))
        (and
          (= (inv@19@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 i@18@00)) i@18@00)
          (img@20@00 s@$ xs@7@00 j@8@00 (Seq_index xs@7@00 i@18@00))))
      :pattern ((Seq_index xs@7@00 i@18@00))
      :qid |quant-u-17|))
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
        (get_P ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) ($SortWrappers.$RefTo$Snap (Seq_index
          xs@7@00
          j@8@00))) (Seq_index xs@7@00 j@8@00)))))
  :pattern ((fun_P s@$ xs@7@00 j@8@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (j@8@00 Int)) (!
  (=>
    (fun_P%precondition s@$ xs@7@00 j@8@00)
    (get_P%precondition ($PSF.lookup_P (sm@21@00 s@$ xs@7@00 j@8@00) ($SortWrappers.$RefTo$Snap (Seq_index
      xs@7@00
      j@8@00))) (Seq_index xs@7@00 j@8@00)))
  :pattern ((fun_P s@$ xs@7@00 j@8@00))
  :qid |quant-u-23|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test_P ----------
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
; var ys: Seq[Ref]
(declare-const ys@0@01 Seq<$Ref>)
; [exec]
; var k: Int
(declare-const k@1@01 Int)
; [exec]
; inhale 0 <= k
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] 0 <= k
(assert (<= 0 k@1@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale k < |ys|
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] k < |ys|
; [eval] |ys|
(assert (< k@1@01 (Seq_length ys@0@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall ix: Int, jx: Int ::
;     { ys[ix], ys[jx] }
;     ix >= 0 && (ix < |ys| && (jx >= 0 && (jx < |ys| && ix != jx))) ==>
;     ys[ix] != ys[jx])
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { ys[ix], ys[jx] } ix >= 0 && (ix < |ys| && (jx >= 0 && (jx < |ys| && ix != jx))) ==> ys[ix] != ys[jx])
(declare-const ix@5@01 Int)
(declare-const jx@6@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] ix >= 0 && (ix < |ys| && (jx >= 0 && (jx < |ys| && ix != jx))) ==> ys[ix] != ys[jx]
; [eval] ix >= 0 && (ix < |ys| && (jx >= 0 && (jx < |ys| && ix != jx)))
; [eval] ix >= 0
(push) ; 4
; [then-branch: 0 | !(ix@5@01 >= 0) | live]
; [else-branch: 0 | ix@5@01 >= 0 | live]
(push) ; 5
; [then-branch: 0 | !(ix@5@01 >= 0)]
(assert (not (>= ix@5@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | ix@5@01 >= 0]
(assert (>= ix@5@01 0))
; [eval] ix < |ys|
; [eval] |ys|
(push) ; 6
; [then-branch: 1 | !(ix@5@01 < |ys@0@01|) | live]
; [else-branch: 1 | ix@5@01 < |ys@0@01| | live]
(push) ; 7
; [then-branch: 1 | !(ix@5@01 < |ys@0@01|)]
(assert (not (< ix@5@01 (Seq_length ys@0@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | ix@5@01 < |ys@0@01|]
(assert (< ix@5@01 (Seq_length ys@0@01)))
; [eval] jx >= 0
(push) ; 8
; [then-branch: 2 | !(jx@6@01 >= 0) | live]
; [else-branch: 2 | jx@6@01 >= 0 | live]
(push) ; 9
; [then-branch: 2 | !(jx@6@01 >= 0)]
(assert (not (>= jx@6@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | jx@6@01 >= 0]
(assert (>= jx@6@01 0))
; [eval] jx < |ys|
; [eval] |ys|
(push) ; 10
; [then-branch: 3 | !(jx@6@01 < |ys@0@01|) | live]
; [else-branch: 3 | jx@6@01 < |ys@0@01| | live]
(push) ; 11
; [then-branch: 3 | !(jx@6@01 < |ys@0@01|)]
(assert (not (< jx@6@01 (Seq_length ys@0@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | jx@6@01 < |ys@0@01|]
(assert (< jx@6@01 (Seq_length ys@0@01)))
; [eval] ix != jx
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< jx@6@01 (Seq_length ys@0@01)) (not (< jx@6@01 (Seq_length ys@0@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@6@01 0)
  (and
    (>= jx@6@01 0)
    (or (< jx@6@01 (Seq_length ys@0@01)) (not (< jx@6@01 (Seq_length ys@0@01)))))))
(assert (or (>= jx@6@01 0) (not (>= jx@6@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@5@01 (Seq_length ys@0@01))
  (and
    (< ix@5@01 (Seq_length ys@0@01))
    (=>
      (>= jx@6@01 0)
      (and
        (>= jx@6@01 0)
        (or
          (< jx@6@01 (Seq_length ys@0@01))
          (not (< jx@6@01 (Seq_length ys@0@01))))))
    (or (>= jx@6@01 0) (not (>= jx@6@01 0))))))
(assert (or (< ix@5@01 (Seq_length ys@0@01)) (not (< ix@5@01 (Seq_length ys@0@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@5@01 0)
  (and
    (>= ix@5@01 0)
    (=>
      (< ix@5@01 (Seq_length ys@0@01))
      (and
        (< ix@5@01 (Seq_length ys@0@01))
        (=>
          (>= jx@6@01 0)
          (and
            (>= jx@6@01 0)
            (or
              (< jx@6@01 (Seq_length ys@0@01))
              (not (< jx@6@01 (Seq_length ys@0@01))))))
        (or (>= jx@6@01 0) (not (>= jx@6@01 0)))))
    (or (< ix@5@01 (Seq_length ys@0@01)) (not (< ix@5@01 (Seq_length ys@0@01)))))))
(assert (or (>= ix@5@01 0) (not (>= ix@5@01 0))))
(push) ; 4
; [then-branch: 4 | ix@5@01 >= 0 && ix@5@01 < |ys@0@01| && jx@6@01 >= 0 && jx@6@01 < |ys@0@01| && ix@5@01 != jx@6@01 | live]
; [else-branch: 4 | !(ix@5@01 >= 0 && ix@5@01 < |ys@0@01| && jx@6@01 >= 0 && jx@6@01 < |ys@0@01| && ix@5@01 != jx@6@01) | live]
(push) ; 5
; [then-branch: 4 | ix@5@01 >= 0 && ix@5@01 < |ys@0@01| && jx@6@01 >= 0 && jx@6@01 < |ys@0@01| && ix@5@01 != jx@6@01]
(assert (and
  (>= ix@5@01 0)
  (and
    (< ix@5@01 (Seq_length ys@0@01))
    (and
      (>= jx@6@01 0)
      (and (< jx@6@01 (Seq_length ys@0@01)) (not (= ix@5@01 jx@6@01)))))))
; [eval] ys[ix] != ys[jx]
; [eval] ys[ix]
; [eval] ys[jx]
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(ix@5@01 >= 0 && ix@5@01 < |ys@0@01| && jx@6@01 >= 0 && jx@6@01 < |ys@0@01| && ix@5@01 != jx@6@01)]
(assert (not
  (and
    (>= ix@5@01 0)
    (and
      (< ix@5@01 (Seq_length ys@0@01))
      (and
        (>= jx@6@01 0)
        (and (< jx@6@01 (Seq_length ys@0@01)) (not (= ix@5@01 jx@6@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= ix@5@01 0)
    (and
      (< ix@5@01 (Seq_length ys@0@01))
      (and
        (>= jx@6@01 0)
        (and (< jx@6@01 (Seq_length ys@0@01)) (not (= ix@5@01 jx@6@01))))))
  (and
    (>= ix@5@01 0)
    (< ix@5@01 (Seq_length ys@0@01))
    (>= jx@6@01 0)
    (< jx@6@01 (Seq_length ys@0@01))
    (not (= ix@5@01 jx@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@5@01 0)
      (and
        (< ix@5@01 (Seq_length ys@0@01))
        (and
          (>= jx@6@01 0)
          (and (< jx@6@01 (Seq_length ys@0@01)) (not (= ix@5@01 jx@6@01)))))))
  (and
    (>= ix@5@01 0)
    (and
      (< ix@5@01 (Seq_length ys@0@01))
      (and
        (>= jx@6@01 0)
        (and (< jx@6@01 (Seq_length ys@0@01)) (not (= ix@5@01 jx@6@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@5@01 Int) (jx@6@01 Int)) (!
  (and
    (=>
      (>= ix@5@01 0)
      (and
        (>= ix@5@01 0)
        (=>
          (< ix@5@01 (Seq_length ys@0@01))
          (and
            (< ix@5@01 (Seq_length ys@0@01))
            (=>
              (>= jx@6@01 0)
              (and
                (>= jx@6@01 0)
                (or
                  (< jx@6@01 (Seq_length ys@0@01))
                  (not (< jx@6@01 (Seq_length ys@0@01))))))
            (or (>= jx@6@01 0) (not (>= jx@6@01 0)))))
        (or
          (< ix@5@01 (Seq_length ys@0@01))
          (not (< ix@5@01 (Seq_length ys@0@01))))))
    (or (>= ix@5@01 0) (not (>= ix@5@01 0)))
    (=>
      (and
        (>= ix@5@01 0)
        (and
          (< ix@5@01 (Seq_length ys@0@01))
          (and
            (>= jx@6@01 0)
            (and (< jx@6@01 (Seq_length ys@0@01)) (not (= ix@5@01 jx@6@01))))))
      (and
        (>= ix@5@01 0)
        (< ix@5@01 (Seq_length ys@0@01))
        (>= jx@6@01 0)
        (< jx@6@01 (Seq_length ys@0@01))
        (not (= ix@5@01 jx@6@01))))
    (or
      (not
        (and
          (>= ix@5@01 0)
          (and
            (< ix@5@01 (Seq_length ys@0@01))
            (and
              (>= jx@6@01 0)
              (and (< jx@6@01 (Seq_length ys@0@01)) (not (= ix@5@01 jx@6@01)))))))
      (and
        (>= ix@5@01 0)
        (and
          (< ix@5@01 (Seq_length ys@0@01))
          (and
            (>= jx@6@01 0)
            (and (< jx@6@01 (Seq_length ys@0@01)) (not (= ix@5@01 jx@6@01))))))))
  :pattern ((Seq_index ys@0@01 ix@5@01) (Seq_index ys@0@01 jx@6@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@20@10@20@114-aux|)))
(assert (forall ((ix@5@01 Int) (jx@6@01 Int)) (!
  (=>
    (and
      (>= ix@5@01 0)
      (and
        (< ix@5@01 (Seq_length ys@0@01))
        (and
          (>= jx@6@01 0)
          (and (< jx@6@01 (Seq_length ys@0@01)) (not (= ix@5@01 jx@6@01))))))
    (not (= (Seq_index ys@0@01 ix@5@01) (Seq_index ys@0@01 jx@6@01))))
  :pattern ((Seq_index ys@0@01 ix@5@01) (Seq_index ys@0@01 jx@6@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@20@10@20@114|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |ys| ==> acc(P(ys[i]), write))
(declare-const i@7@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |ys|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | !(0 <= i@7@01) | live]
; [else-branch: 5 | 0 <= i@7@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= i@7@01)]
(assert (not (<= 0 i@7@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= i@7@01]
(assert (<= 0 i@7@01))
; [eval] i < |ys|
; [eval] |ys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@7@01) (not (<= 0 i@7@01))))
(assert (and (<= 0 i@7@01) (< i@7@01 (Seq_length ys@0@01))))
; [eval] ys[i]
(push) ; 4
(assert (not (>= i@7@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@8@01 $PSF<P>)
(declare-fun inv@9@01 ($Ref) Int)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@7@01 Int)) (!
  (=>
    (and (<= 0 i@7@01) (< i@7@01 (Seq_length ys@0@01)))
    (or (<= 0 i@7@01) (not (<= 0 i@7@01))))
  :pattern ((Seq_index ys@0@01 i@7@01))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@7@01 Int) (i2@7@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@7@01) (< i1@7@01 (Seq_length ys@0@01)))
      (and (<= 0 i2@7@01) (< i2@7@01 (Seq_length ys@0@01)))
      (= (Seq_index ys@0@01 i1@7@01) (Seq_index ys@0@01 i2@7@01)))
    (= i1@7@01 i2@7@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@7@01 Int)) (!
  (=>
    (and (<= 0 i@7@01) (< i@7@01 (Seq_length ys@0@01)))
    (and
      (= (inv@9@01 (Seq_index ys@0@01 i@7@01)) i@7@01)
      (img@10@01 (Seq_index ys@0@01 i@7@01))))
  :pattern ((Seq_index ys@0@01 i@7@01))
  :qid |quant-u-25|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@10@01 x)
      (and (<= 0 (inv@9@01 x)) (< (inv@9@01 x) (Seq_length ys@0@01))))
    (= (Seq_index ys@0@01 (inv@9@01 x)) x))
  :pattern ((inv@9@01 x))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun_P(ys, k) == 0
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] fun_P(ys, k) == 0
; [eval] fun_P(ys, k)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall ix: Int, jx: Int ::ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx))) ==> xs[ix] != xs[jx])
(declare-const ix@12@01 Int)
(declare-const jx@13@01 Int)
(push) ; 4
; [eval] ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx))) ==> xs[ix] != xs[jx]
; [eval] ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx)))
; [eval] ix >= 0
(push) ; 5
; [then-branch: 6 | !(ix@12@01 >= 0) | live]
; [else-branch: 6 | ix@12@01 >= 0 | live]
(push) ; 6
; [then-branch: 6 | !(ix@12@01 >= 0)]
(assert (not (>= ix@12@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | ix@12@01 >= 0]
(assert (>= ix@12@01 0))
; [eval] ix < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 7 | !(ix@12@01 < |ys@0@01|) | live]
; [else-branch: 7 | ix@12@01 < |ys@0@01| | live]
(push) ; 8
; [then-branch: 7 | !(ix@12@01 < |ys@0@01|)]
(assert (not (< ix@12@01 (Seq_length ys@0@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 7 | ix@12@01 < |ys@0@01|]
(assert (< ix@12@01 (Seq_length ys@0@01)))
; [eval] jx >= 0
(push) ; 9
; [then-branch: 8 | !(jx@13@01 >= 0) | live]
; [else-branch: 8 | jx@13@01 >= 0 | live]
(push) ; 10
; [then-branch: 8 | !(jx@13@01 >= 0)]
(assert (not (>= jx@13@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 8 | jx@13@01 >= 0]
(assert (>= jx@13@01 0))
; [eval] jx < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 9 | !(jx@13@01 < |ys@0@01|) | live]
; [else-branch: 9 | jx@13@01 < |ys@0@01| | live]
(push) ; 12
; [then-branch: 9 | !(jx@13@01 < |ys@0@01|)]
(assert (not (< jx@13@01 (Seq_length ys@0@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 9 | jx@13@01 < |ys@0@01|]
(assert (< jx@13@01 (Seq_length ys@0@01)))
; [eval] ix != jx
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< jx@13@01 (Seq_length ys@0@01)) (not (< jx@13@01 (Seq_length ys@0@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@13@01 0)
  (and
    (>= jx@13@01 0)
    (or
      (< jx@13@01 (Seq_length ys@0@01))
      (not (< jx@13@01 (Seq_length ys@0@01)))))))
(assert (or (>= jx@13@01 0) (not (>= jx@13@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@12@01 (Seq_length ys@0@01))
  (and
    (< ix@12@01 (Seq_length ys@0@01))
    (=>
      (>= jx@13@01 0)
      (and
        (>= jx@13@01 0)
        (or
          (< jx@13@01 (Seq_length ys@0@01))
          (not (< jx@13@01 (Seq_length ys@0@01))))))
    (or (>= jx@13@01 0) (not (>= jx@13@01 0))))))
(assert (or (< ix@12@01 (Seq_length ys@0@01)) (not (< ix@12@01 (Seq_length ys@0@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@12@01 0)
  (and
    (>= ix@12@01 0)
    (=>
      (< ix@12@01 (Seq_length ys@0@01))
      (and
        (< ix@12@01 (Seq_length ys@0@01))
        (=>
          (>= jx@13@01 0)
          (and
            (>= jx@13@01 0)
            (or
              (< jx@13@01 (Seq_length ys@0@01))
              (not (< jx@13@01 (Seq_length ys@0@01))))))
        (or (>= jx@13@01 0) (not (>= jx@13@01 0)))))
    (or
      (< ix@12@01 (Seq_length ys@0@01))
      (not (< ix@12@01 (Seq_length ys@0@01)))))))
(assert (or (>= ix@12@01 0) (not (>= ix@12@01 0))))
(push) ; 5
; [then-branch: 10 | ix@12@01 >= 0 && ix@12@01 < |ys@0@01| && jx@13@01 >= 0 && jx@13@01 < |ys@0@01| && ix@12@01 != jx@13@01 | live]
; [else-branch: 10 | !(ix@12@01 >= 0 && ix@12@01 < |ys@0@01| && jx@13@01 >= 0 && jx@13@01 < |ys@0@01| && ix@12@01 != jx@13@01) | live]
(push) ; 6
; [then-branch: 10 | ix@12@01 >= 0 && ix@12@01 < |ys@0@01| && jx@13@01 >= 0 && jx@13@01 < |ys@0@01| && ix@12@01 != jx@13@01]
(assert (and
  (>= ix@12@01 0)
  (and
    (< ix@12@01 (Seq_length ys@0@01))
    (and
      (>= jx@13@01 0)
      (and (< jx@13@01 (Seq_length ys@0@01)) (not (= ix@12@01 jx@13@01)))))))
; [eval] xs[ix] != xs[jx]
; [eval] xs[ix]
; [eval] xs[jx]
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(ix@12@01 >= 0 && ix@12@01 < |ys@0@01| && jx@13@01 >= 0 && jx@13@01 < |ys@0@01| && ix@12@01 != jx@13@01)]
(assert (not
  (and
    (>= ix@12@01 0)
    (and
      (< ix@12@01 (Seq_length ys@0@01))
      (and
        (>= jx@13@01 0)
        (and (< jx@13@01 (Seq_length ys@0@01)) (not (= ix@12@01 jx@13@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= ix@12@01 0)
    (and
      (< ix@12@01 (Seq_length ys@0@01))
      (and
        (>= jx@13@01 0)
        (and (< jx@13@01 (Seq_length ys@0@01)) (not (= ix@12@01 jx@13@01))))))
  (and
    (>= ix@12@01 0)
    (< ix@12@01 (Seq_length ys@0@01))
    (>= jx@13@01 0)
    (< jx@13@01 (Seq_length ys@0@01))
    (not (= ix@12@01 jx@13@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@12@01 0)
      (and
        (< ix@12@01 (Seq_length ys@0@01))
        (and
          (>= jx@13@01 0)
          (and (< jx@13@01 (Seq_length ys@0@01)) (not (= ix@12@01 jx@13@01)))))))
  (and
    (>= ix@12@01 0)
    (and
      (< ix@12@01 (Seq_length ys@0@01))
      (and
        (>= jx@13@01 0)
        (and (< jx@13@01 (Seq_length ys@0@01)) (not (= ix@12@01 jx@13@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((ix@12@01 Int) (jx@13@01 Int)) (!
  (=>
    (and
      (>= ix@12@01 0)
      (and
        (< ix@12@01 (Seq_length ys@0@01))
        (and
          (>= jx@13@01 0)
          (and (< jx@13@01 (Seq_length ys@0@01)) (not (= ix@12@01 jx@13@01))))))
    (not (= (Seq_index ys@0@01 ix@12@01) (Seq_index ys@0@01 jx@13@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@7@12@7@116|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((ix@12@01 Int) (jx@13@01 Int)) (!
  (=>
    (and
      (>= ix@12@01 0)
      (and
        (< ix@12@01 (Seq_length ys@0@01))
        (and
          (>= jx@13@01 0)
          (and (< jx@13@01 (Seq_length ys@0@01)) (not (= ix@12@01 jx@13@01))))))
    (not (= (Seq_index ys@0@01 ix@12@01) (Seq_index ys@0@01 jx@13@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@7@12@7@116|)))
(declare-const i@14@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 11 | !(0 <= i@14@01) | live]
; [else-branch: 11 | 0 <= i@14@01 | live]
(push) ; 6
; [then-branch: 11 | !(0 <= i@14@01)]
(assert (not (<= 0 i@14@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | 0 <= i@14@01]
(assert (<= 0 i@14@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@14@01) (not (<= 0 i@14@01))))
(assert (and (<= 0 i@14@01) (< i@14@01 (Seq_length ys@0@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@14@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@15@01 ($Ref) Int)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@14@01 Int)) (!
  (=>
    (and (<= 0 i@14@01) (< i@14@01 (Seq_length ys@0@01)))
    (or (<= 0 i@14@01) (not (<= 0 i@14@01))))
  :pattern ((Seq_index ys@0@01 i@14@01))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@14@01 Int) (i2@14@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@14@01) (< i1@14@01 (Seq_length ys@0@01)))
      (and (<= 0 i2@14@01) (< i2@14@01 (Seq_length ys@0@01)))
      (= (Seq_index ys@0@01 i1@14@01) (Seq_index ys@0@01 i2@14@01)))
    (= i1@14@01 i2@14@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@14@01 Int)) (!
  (=>
    (and (<= 0 i@14@01) (< i@14@01 (Seq_length ys@0@01)))
    (and
      (= (inv@15@01 (Seq_index ys@0@01 i@14@01)) i@14@01)
      (img@16@01 (Seq_index ys@0@01 i@14@01))))
  :pattern ((Seq_index ys@0@01 i@14@01))
  :qid |P-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@16@01 x)
      (and (<= 0 (inv@15@01 x)) (< (inv@15@01 x) (Seq_length ys@0@01))))
    (= (Seq_index ys@0@01 (inv@15@01 x)) x))
  :pattern ((inv@15@01 x))
  :qid |P-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((x $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@15@01 x)) (< (inv@15@01 x) (Seq_length ys@0@01)))
      (img@16@01 x)
      (= x (Seq_index ys@0@01 (inv@15@01 x))))
    ($Perm.min
      (ite
        (and
          (img@10@01 x)
          (and (<= 0 (inv@9@01 x)) (< (inv@9@01 x) (Seq_length ys@0@01))))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@10@01 x)
          (and (<= 0 (inv@9@01 x)) (< (inv@9@01 x) (Seq_length ys@0@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@17@01 x))
    $Perm.No)
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@15@01 x)) (< (inv@15@01 x) (Seq_length ys@0@01)))
      (img@16@01 x)
      (= x (Seq_index ys@0@01 (inv@15@01 x))))
    (= (- $Perm.Write (pTaken@17@01 x)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@18@01 $PSF<P>)
(declare-const s@19@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@19@01 $Snap)) (!
  (and
    (=>
      (Set_in s@19@01 ($PSF.domain_P (as sm@18@01  $PSF<P>)))
      (and
        (and
          (<= 0 (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
          (<
            (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01))
            (Seq_length ys@0@01)))
        (img@16@01 ($SortWrappers.$SnapTo$Ref s@19@01))))
    (=>
      (and
        (and
          (<= 0 (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
          (<
            (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01))
            (Seq_length ys@0@01)))
        (img@16@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
      (Set_in s@19@01 ($PSF.domain_P (as sm@18@01  $PSF<P>)))))
  :pattern ((Set_in s@19@01 ($PSF.domain_P (as sm@18@01  $PSF<P>))))
  :qid |qp.psmDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@19@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
          (<
            (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01))
            (Seq_length ys@0@01)))
        (img@16@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
      (and
        (img@10@01 ($SortWrappers.$SnapTo$Ref s@19@01))
        (and
          (<= 0 (inv@9@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
          (< (inv@9@01 ($SortWrappers.$SnapTo$Ref s@19@01)) (Seq_length ys@0@01)))))
    (and
      (not (= s@19@01 $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@18@01  $PSF<P>) s@19@01)
        ($PSF.lookup_P $t@8@01 s@19@01))))
  :pattern (($PSF.lookup_P (as sm@18@01  $PSF<P>) s@19@01))
  :pattern (($PSF.lookup_P $t@8@01 s@19@01))
  :qid |qp.psmValDef0|)))
; [eval] 0 <= j
; [eval] j < |xs|
; [eval] |xs|
(assert (fun_P%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$PSF<P>To$Snap (as sm@18@01  $PSF<P>))
    ($Snap.combine $Snap.unit $Snap.unit))) ys@0@01 k@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@14@01 Int)) (!
  (=>
    (and (<= 0 i@14@01) (< i@14@01 (Seq_length ys@0@01)))
    (and
      (= (inv@15@01 (Seq_index ys@0@01 i@14@01)) i@14@01)
      (img@16@01 (Seq_index ys@0@01 i@14@01))))
  :pattern ((Seq_index ys@0@01 i@14@01))
  :qid |P-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@16@01 x)
      (and (<= 0 (inv@15@01 x)) (< (inv@15@01 x) (Seq_length ys@0@01))))
    (= (Seq_index ys@0@01 (inv@15@01 x)) x))
  :pattern ((inv@15@01 x))
  :qid |P-fctOfInv|)))
(assert (forall ((s@19@01 $Snap)) (!
  (and
    (=>
      (Set_in s@19@01 ($PSF.domain_P (as sm@18@01  $PSF<P>)))
      (and
        (and
          (<= 0 (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
          (<
            (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01))
            (Seq_length ys@0@01)))
        (img@16@01 ($SortWrappers.$SnapTo$Ref s@19@01))))
    (=>
      (and
        (and
          (<= 0 (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
          (<
            (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01))
            (Seq_length ys@0@01)))
        (img@16@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
      (Set_in s@19@01 ($PSF.domain_P (as sm@18@01  $PSF<P>)))))
  :pattern ((Set_in s@19@01 ($PSF.domain_P (as sm@18@01  $PSF<P>))))
  :qid |qp.psmDomDef1|)))
(assert (forall ((s@19@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
          (<
            (inv@15@01 ($SortWrappers.$SnapTo$Ref s@19@01))
            (Seq_length ys@0@01)))
        (img@16@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
      (and
        (img@10@01 ($SortWrappers.$SnapTo$Ref s@19@01))
        (and
          (<= 0 (inv@9@01 ($SortWrappers.$SnapTo$Ref s@19@01)))
          (< (inv@9@01 ($SortWrappers.$SnapTo$Ref s@19@01)) (Seq_length ys@0@01)))))
    (and
      (not (= s@19@01 $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@18@01  $PSF<P>) s@19@01)
        ($PSF.lookup_P $t@8@01 s@19@01))))
  :pattern (($PSF.lookup_P (as sm@18@01  $PSF<P>) s@19@01))
  :pattern (($PSF.lookup_P $t@8@01 s@19@01))
  :qid |qp.psmValDef0|)))
(assert (and
  (forall ((ix@12@01 Int) (jx@13@01 Int)) (!
    (=>
      (and
        (>= ix@12@01 0)
        (and
          (< ix@12@01 (Seq_length ys@0@01))
          (and
            (>= jx@13@01 0)
            (and (< jx@13@01 (Seq_length ys@0@01)) (not (= ix@12@01 jx@13@01))))))
      (not (= (Seq_index ys@0@01 ix@12@01) (Seq_index ys@0@01 jx@13@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@7@12@7@116|))
  (forall ((i@14@01 Int)) (!
    (=>
      (and (<= 0 i@14@01) (< i@14@01 (Seq_length ys@0@01)))
      (or (<= 0 i@14@01) (not (<= 0 i@14@01))))
    :pattern ((Seq_index ys@0@01 i@14@01))
    :qid |P-aux|))
  (fun_P%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$PSF<P>To$Snap (as sm@18@01  $PSF<P>))
      ($Snap.combine $Snap.unit $Snap.unit))) ys@0@01 k@1@01)))
(assert (=
  (fun_P ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$PSF<P>To$Snap (as sm@18@01  $PSF<P>))
      ($Snap.combine $Snap.unit $Snap.unit))) ys@0@01 k@1@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale get_P(ys[k]) == 0
; [eval] get_P(ys[k]) == 0
; [eval] get_P(ys[k])
; [eval] ys[k]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= k@1@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((x $Ref)) $Perm
  (ite
    (= x (Seq_index ys@0@01 k@1@01))
    ($Perm.min
      (ite
        (and
          (img@10@01 x)
          (and (<= 0 (inv@9@01 x)) (< (inv@9@01 x) (Seq_length ys@0@01))))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@10@01 x)
          (and (<= 0 (inv@9@01 x)) (< (inv@9@01 x) (Seq_length ys@0@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@20@01 x))
    $Perm.No)
  
  :qid |quant-u-31|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@20@01 x) $Perm.No)
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x (Seq_index ys@0@01 k@1@01))
    (= (- $Perm.Write (pTaken@20@01 x)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@21@01 $PSF<P>)
(declare-const s@22@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@10@01 (Seq_index ys@0@01 k@1@01))
    (and
      (<= 0 (inv@9@01 (Seq_index ys@0@01 k@1@01)))
      (< (inv@9@01 (Seq_index ys@0@01 k@1@01)) (Seq_length ys@0@01))))
  (and
    (not (= ($SortWrappers.$RefTo$Snap (Seq_index ys@0@01 k@1@01)) $Snap.unit))
    (=
      ($PSF.lookup_P (as sm@21@01  $PSF<P>) ($SortWrappers.$RefTo$Snap (Seq_index
        ys@0@01
        k@1@01)))
      ($PSF.lookup_P $t@8@01 ($SortWrappers.$RefTo$Snap (Seq_index
        ys@0@01
        k@1@01)))))))
(assert (get_P%precondition ($PSF.lookup_P (as sm@21@01  $PSF<P>) ($SortWrappers.$RefTo$Snap (Seq_index
  ys@0@01
  k@1@01))) (Seq_index ys@0@01 k@1@01)))
(pop) ; 3
; Joined path conditions
(assert (and
  (=>
    (and
      (img@10@01 (Seq_index ys@0@01 k@1@01))
      (and
        (<= 0 (inv@9@01 (Seq_index ys@0@01 k@1@01)))
        (< (inv@9@01 (Seq_index ys@0@01 k@1@01)) (Seq_length ys@0@01))))
    (and
      (not (= ($SortWrappers.$RefTo$Snap (Seq_index ys@0@01 k@1@01)) $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@21@01  $PSF<P>) ($SortWrappers.$RefTo$Snap (Seq_index
          ys@0@01
          k@1@01)))
        ($PSF.lookup_P $t@8@01 ($SortWrappers.$RefTo$Snap (Seq_index
          ys@0@01
          k@1@01))))))
  (get_P%precondition ($PSF.lookup_P (as sm@21@01  $PSF<P>) ($SortWrappers.$RefTo$Snap (Seq_index
    ys@0@01
    k@1@01))) (Seq_index ys@0@01 k@1@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (get_P ($PSF.lookup_P (as sm@21@01  $PSF<P>) ($SortWrappers.$RefTo$Snap (Seq_index
    ys@0@01
    k@1@01))) (Seq_index ys@0@01 k@1@01))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get_P ($PSF.lookup_P (as sm@21@01  $PSF<P>) ($SortWrappers.$RefTo$Snap (Seq_index
    ys@0@01
    k@1@01))) (Seq_index ys@0@01 k@1@01))
  0))
(pop) ; 2
(pop) ; 1
; ---------- test_f ----------
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
; var ys: Seq[Ref]
(declare-const ys@23@01 Seq<$Ref>)
; [exec]
; var k: Int
(declare-const k@24@01 Int)
; [exec]
; inhale 0 <= k
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] 0 <= k
(assert (<= 0 k@24@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale k < |ys|
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] k < |ys|
; [eval] |ys|
(assert (< k@24@01 (Seq_length ys@23@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall ix: Int, jx: Int ::
;     { ys[ix], ys[jx] }
;     ix >= 0 && (ix < |ys| && (jx >= 0 && (jx < |ys| && ix != jx))) ==>
;     ys[ix] != ys[jx])
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] (forall ix: Int, jx: Int :: { ys[ix], ys[jx] } ix >= 0 && (ix < |ys| && (jx >= 0 && (jx < |ys| && ix != jx))) ==> ys[ix] != ys[jx])
(declare-const ix@28@01 Int)
(declare-const jx@29@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] ix >= 0 && (ix < |ys| && (jx >= 0 && (jx < |ys| && ix != jx))) ==> ys[ix] != ys[jx]
; [eval] ix >= 0 && (ix < |ys| && (jx >= 0 && (jx < |ys| && ix != jx)))
; [eval] ix >= 0
(push) ; 4
; [then-branch: 12 | !(ix@28@01 >= 0) | live]
; [else-branch: 12 | ix@28@01 >= 0 | live]
(push) ; 5
; [then-branch: 12 | !(ix@28@01 >= 0)]
(assert (not (>= ix@28@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | ix@28@01 >= 0]
(assert (>= ix@28@01 0))
; [eval] ix < |ys|
; [eval] |ys|
(push) ; 6
; [then-branch: 13 | !(ix@28@01 < |ys@23@01|) | live]
; [else-branch: 13 | ix@28@01 < |ys@23@01| | live]
(push) ; 7
; [then-branch: 13 | !(ix@28@01 < |ys@23@01|)]
(assert (not (< ix@28@01 (Seq_length ys@23@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | ix@28@01 < |ys@23@01|]
(assert (< ix@28@01 (Seq_length ys@23@01)))
; [eval] jx >= 0
(push) ; 8
; [then-branch: 14 | !(jx@29@01 >= 0) | live]
; [else-branch: 14 | jx@29@01 >= 0 | live]
(push) ; 9
; [then-branch: 14 | !(jx@29@01 >= 0)]
(assert (not (>= jx@29@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 14 | jx@29@01 >= 0]
(assert (>= jx@29@01 0))
; [eval] jx < |ys|
; [eval] |ys|
(push) ; 10
; [then-branch: 15 | !(jx@29@01 < |ys@23@01|) | live]
; [else-branch: 15 | jx@29@01 < |ys@23@01| | live]
(push) ; 11
; [then-branch: 15 | !(jx@29@01 < |ys@23@01|)]
(assert (not (< jx@29@01 (Seq_length ys@23@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 15 | jx@29@01 < |ys@23@01|]
(assert (< jx@29@01 (Seq_length ys@23@01)))
; [eval] ix != jx
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< jx@29@01 (Seq_length ys@23@01)) (not (< jx@29@01 (Seq_length ys@23@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@29@01 0)
  (and
    (>= jx@29@01 0)
    (or
      (< jx@29@01 (Seq_length ys@23@01))
      (not (< jx@29@01 (Seq_length ys@23@01)))))))
(assert (or (>= jx@29@01 0) (not (>= jx@29@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@28@01 (Seq_length ys@23@01))
  (and
    (< ix@28@01 (Seq_length ys@23@01))
    (=>
      (>= jx@29@01 0)
      (and
        (>= jx@29@01 0)
        (or
          (< jx@29@01 (Seq_length ys@23@01))
          (not (< jx@29@01 (Seq_length ys@23@01))))))
    (or (>= jx@29@01 0) (not (>= jx@29@01 0))))))
(assert (or (< ix@28@01 (Seq_length ys@23@01)) (not (< ix@28@01 (Seq_length ys@23@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@28@01 0)
  (and
    (>= ix@28@01 0)
    (=>
      (< ix@28@01 (Seq_length ys@23@01))
      (and
        (< ix@28@01 (Seq_length ys@23@01))
        (=>
          (>= jx@29@01 0)
          (and
            (>= jx@29@01 0)
            (or
              (< jx@29@01 (Seq_length ys@23@01))
              (not (< jx@29@01 (Seq_length ys@23@01))))))
        (or (>= jx@29@01 0) (not (>= jx@29@01 0)))))
    (or
      (< ix@28@01 (Seq_length ys@23@01))
      (not (< ix@28@01 (Seq_length ys@23@01)))))))
(assert (or (>= ix@28@01 0) (not (>= ix@28@01 0))))
(push) ; 4
; [then-branch: 16 | ix@28@01 >= 0 && ix@28@01 < |ys@23@01| && jx@29@01 >= 0 && jx@29@01 < |ys@23@01| && ix@28@01 != jx@29@01 | live]
; [else-branch: 16 | !(ix@28@01 >= 0 && ix@28@01 < |ys@23@01| && jx@29@01 >= 0 && jx@29@01 < |ys@23@01| && ix@28@01 != jx@29@01) | live]
(push) ; 5
; [then-branch: 16 | ix@28@01 >= 0 && ix@28@01 < |ys@23@01| && jx@29@01 >= 0 && jx@29@01 < |ys@23@01| && ix@28@01 != jx@29@01]
(assert (and
  (>= ix@28@01 0)
  (and
    (< ix@28@01 (Seq_length ys@23@01))
    (and
      (>= jx@29@01 0)
      (and (< jx@29@01 (Seq_length ys@23@01)) (not (= ix@28@01 jx@29@01)))))))
; [eval] ys[ix] != ys[jx]
; [eval] ys[ix]
; [eval] ys[jx]
(pop) ; 5
(push) ; 5
; [else-branch: 16 | !(ix@28@01 >= 0 && ix@28@01 < |ys@23@01| && jx@29@01 >= 0 && jx@29@01 < |ys@23@01| && ix@28@01 != jx@29@01)]
(assert (not
  (and
    (>= ix@28@01 0)
    (and
      (< ix@28@01 (Seq_length ys@23@01))
      (and
        (>= jx@29@01 0)
        (and (< jx@29@01 (Seq_length ys@23@01)) (not (= ix@28@01 jx@29@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= ix@28@01 0)
    (and
      (< ix@28@01 (Seq_length ys@23@01))
      (and
        (>= jx@29@01 0)
        (and (< jx@29@01 (Seq_length ys@23@01)) (not (= ix@28@01 jx@29@01))))))
  (and
    (>= ix@28@01 0)
    (< ix@28@01 (Seq_length ys@23@01))
    (>= jx@29@01 0)
    (< jx@29@01 (Seq_length ys@23@01))
    (not (= ix@28@01 jx@29@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@28@01 0)
      (and
        (< ix@28@01 (Seq_length ys@23@01))
        (and
          (>= jx@29@01 0)
          (and (< jx@29@01 (Seq_length ys@23@01)) (not (= ix@28@01 jx@29@01)))))))
  (and
    (>= ix@28@01 0)
    (and
      (< ix@28@01 (Seq_length ys@23@01))
      (and
        (>= jx@29@01 0)
        (and (< jx@29@01 (Seq_length ys@23@01)) (not (= ix@28@01 jx@29@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((ix@28@01 Int) (jx@29@01 Int)) (!
  (and
    (=>
      (>= ix@28@01 0)
      (and
        (>= ix@28@01 0)
        (=>
          (< ix@28@01 (Seq_length ys@23@01))
          (and
            (< ix@28@01 (Seq_length ys@23@01))
            (=>
              (>= jx@29@01 0)
              (and
                (>= jx@29@01 0)
                (or
                  (< jx@29@01 (Seq_length ys@23@01))
                  (not (< jx@29@01 (Seq_length ys@23@01))))))
            (or (>= jx@29@01 0) (not (>= jx@29@01 0)))))
        (or
          (< ix@28@01 (Seq_length ys@23@01))
          (not (< ix@28@01 (Seq_length ys@23@01))))))
    (or (>= ix@28@01 0) (not (>= ix@28@01 0)))
    (=>
      (and
        (>= ix@28@01 0)
        (and
          (< ix@28@01 (Seq_length ys@23@01))
          (and
            (>= jx@29@01 0)
            (and (< jx@29@01 (Seq_length ys@23@01)) (not (= ix@28@01 jx@29@01))))))
      (and
        (>= ix@28@01 0)
        (< ix@28@01 (Seq_length ys@23@01))
        (>= jx@29@01 0)
        (< jx@29@01 (Seq_length ys@23@01))
        (not (= ix@28@01 jx@29@01))))
    (or
      (not
        (and
          (>= ix@28@01 0)
          (and
            (< ix@28@01 (Seq_length ys@23@01))
            (and
              (>= jx@29@01 0)
              (and
                (< jx@29@01 (Seq_length ys@23@01))
                (not (= ix@28@01 jx@29@01)))))))
      (and
        (>= ix@28@01 0)
        (and
          (< ix@28@01 (Seq_length ys@23@01))
          (and
            (>= jx@29@01 0)
            (and (< jx@29@01 (Seq_length ys@23@01)) (not (= ix@28@01 jx@29@01))))))))
  :pattern ((Seq_index ys@23@01 ix@28@01) (Seq_index ys@23@01 jx@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@44@10@44@114-aux|)))
(assert (forall ((ix@28@01 Int) (jx@29@01 Int)) (!
  (=>
    (and
      (>= ix@28@01 0)
      (and
        (< ix@28@01 (Seq_length ys@23@01))
        (and
          (>= jx@29@01 0)
          (and (< jx@29@01 (Seq_length ys@23@01)) (not (= ix@28@01 jx@29@01))))))
    (not (= (Seq_index ys@23@01 ix@28@01) (Seq_index ys@23@01 jx@29@01))))
  :pattern ((Seq_index ys@23@01 ix@28@01) (Seq_index ys@23@01 jx@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@44@10@44@114|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |ys| ==> acc(ys[i].f, write))
(declare-const i@30@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |ys|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 17 | !(0 <= i@30@01) | live]
; [else-branch: 17 | 0 <= i@30@01 | live]
(push) ; 5
; [then-branch: 17 | !(0 <= i@30@01)]
(assert (not (<= 0 i@30@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | 0 <= i@30@01]
(assert (<= 0 i@30@01))
; [eval] i < |ys|
; [eval] |ys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@30@01) (not (<= 0 i@30@01))))
(assert (and (<= 0 i@30@01) (< i@30@01 (Seq_length ys@23@01))))
; [eval] ys[i]
(push) ; 4
(assert (not (>= i@30@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@31@01 $FVF<f>)
(declare-fun inv@32@01 ($Ref) Int)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@30@01 Int)) (!
  (=>
    (and (<= 0 i@30@01) (< i@30@01 (Seq_length ys@23@01)))
    (or (<= 0 i@30@01) (not (<= 0 i@30@01))))
  :pattern ((Seq_index ys@23@01 i@30@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@30@01 Int) (i2@30@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@30@01) (< i1@30@01 (Seq_length ys@23@01)))
      (and (<= 0 i2@30@01) (< i2@30@01 (Seq_length ys@23@01)))
      (= (Seq_index ys@23@01 i1@30@01) (Seq_index ys@23@01 i2@30@01)))
    (= i1@30@01 i2@30@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@30@01 Int)) (!
  (=>
    (and (<= 0 i@30@01) (< i@30@01 (Seq_length ys@23@01)))
    (and
      (= (inv@32@01 (Seq_index ys@23@01 i@30@01)) i@30@01)
      (img@33@01 (Seq_index ys@23@01 i@30@01))))
  :pattern ((Seq_index ys@23@01 i@30@01))
  :qid |quant-u-35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length ys@23@01))))
    (= (Seq_index ys@23@01 (inv@32@01 r)) r))
  :pattern ((inv@32@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@30@01 Int)) (!
  (=>
    (and (<= 0 i@30@01) (< i@30@01 (Seq_length ys@23@01)))
    (not (= (Seq_index ys@23@01 i@30@01) $Ref.null)))
  :pattern ((Seq_index ys@23@01 i@30@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun_f(ys, k) == 0
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] fun_f(ys, k) == 0
; [eval] fun_f(ys, k)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall ix: Int, jx: Int ::ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx))) ==> xs[ix] != xs[jx])
(declare-const ix@35@01 Int)
(declare-const jx@36@01 Int)
(push) ; 4
; [eval] ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx))) ==> xs[ix] != xs[jx]
; [eval] ix >= 0 && (ix < |xs| && (jx >= 0 && (jx < |xs| && ix != jx)))
; [eval] ix >= 0
(push) ; 5
; [then-branch: 18 | !(ix@35@01 >= 0) | live]
; [else-branch: 18 | ix@35@01 >= 0 | live]
(push) ; 6
; [then-branch: 18 | !(ix@35@01 >= 0)]
(assert (not (>= ix@35@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | ix@35@01 >= 0]
(assert (>= ix@35@01 0))
; [eval] ix < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 19 | !(ix@35@01 < |ys@23@01|) | live]
; [else-branch: 19 | ix@35@01 < |ys@23@01| | live]
(push) ; 8
; [then-branch: 19 | !(ix@35@01 < |ys@23@01|)]
(assert (not (< ix@35@01 (Seq_length ys@23@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | ix@35@01 < |ys@23@01|]
(assert (< ix@35@01 (Seq_length ys@23@01)))
; [eval] jx >= 0
(push) ; 9
; [then-branch: 20 | !(jx@36@01 >= 0) | live]
; [else-branch: 20 | jx@36@01 >= 0 | live]
(push) ; 10
; [then-branch: 20 | !(jx@36@01 >= 0)]
(assert (not (>= jx@36@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 20 | jx@36@01 >= 0]
(assert (>= jx@36@01 0))
; [eval] jx < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 21 | !(jx@36@01 < |ys@23@01|) | live]
; [else-branch: 21 | jx@36@01 < |ys@23@01| | live]
(push) ; 12
; [then-branch: 21 | !(jx@36@01 < |ys@23@01|)]
(assert (not (< jx@36@01 (Seq_length ys@23@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 21 | jx@36@01 < |ys@23@01|]
(assert (< jx@36@01 (Seq_length ys@23@01)))
; [eval] ix != jx
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< jx@36@01 (Seq_length ys@23@01)) (not (< jx@36@01 (Seq_length ys@23@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= jx@36@01 0)
  (and
    (>= jx@36@01 0)
    (or
      (< jx@36@01 (Seq_length ys@23@01))
      (not (< jx@36@01 (Seq_length ys@23@01)))))))
(assert (or (>= jx@36@01 0) (not (>= jx@36@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< ix@35@01 (Seq_length ys@23@01))
  (and
    (< ix@35@01 (Seq_length ys@23@01))
    (=>
      (>= jx@36@01 0)
      (and
        (>= jx@36@01 0)
        (or
          (< jx@36@01 (Seq_length ys@23@01))
          (not (< jx@36@01 (Seq_length ys@23@01))))))
    (or (>= jx@36@01 0) (not (>= jx@36@01 0))))))
(assert (or (< ix@35@01 (Seq_length ys@23@01)) (not (< ix@35@01 (Seq_length ys@23@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= ix@35@01 0)
  (and
    (>= ix@35@01 0)
    (=>
      (< ix@35@01 (Seq_length ys@23@01))
      (and
        (< ix@35@01 (Seq_length ys@23@01))
        (=>
          (>= jx@36@01 0)
          (and
            (>= jx@36@01 0)
            (or
              (< jx@36@01 (Seq_length ys@23@01))
              (not (< jx@36@01 (Seq_length ys@23@01))))))
        (or (>= jx@36@01 0) (not (>= jx@36@01 0)))))
    (or
      (< ix@35@01 (Seq_length ys@23@01))
      (not (< ix@35@01 (Seq_length ys@23@01)))))))
(assert (or (>= ix@35@01 0) (not (>= ix@35@01 0))))
(push) ; 5
; [then-branch: 22 | ix@35@01 >= 0 && ix@35@01 < |ys@23@01| && jx@36@01 >= 0 && jx@36@01 < |ys@23@01| && ix@35@01 != jx@36@01 | live]
; [else-branch: 22 | !(ix@35@01 >= 0 && ix@35@01 < |ys@23@01| && jx@36@01 >= 0 && jx@36@01 < |ys@23@01| && ix@35@01 != jx@36@01) | live]
(push) ; 6
; [then-branch: 22 | ix@35@01 >= 0 && ix@35@01 < |ys@23@01| && jx@36@01 >= 0 && jx@36@01 < |ys@23@01| && ix@35@01 != jx@36@01]
(assert (and
  (>= ix@35@01 0)
  (and
    (< ix@35@01 (Seq_length ys@23@01))
    (and
      (>= jx@36@01 0)
      (and (< jx@36@01 (Seq_length ys@23@01)) (not (= ix@35@01 jx@36@01)))))))
; [eval] xs[ix] != xs[jx]
; [eval] xs[ix]
; [eval] xs[jx]
(pop) ; 6
(push) ; 6
; [else-branch: 22 | !(ix@35@01 >= 0 && ix@35@01 < |ys@23@01| && jx@36@01 >= 0 && jx@36@01 < |ys@23@01| && ix@35@01 != jx@36@01)]
(assert (not
  (and
    (>= ix@35@01 0)
    (and
      (< ix@35@01 (Seq_length ys@23@01))
      (and
        (>= jx@36@01 0)
        (and (< jx@36@01 (Seq_length ys@23@01)) (not (= ix@35@01 jx@36@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= ix@35@01 0)
    (and
      (< ix@35@01 (Seq_length ys@23@01))
      (and
        (>= jx@36@01 0)
        (and (< jx@36@01 (Seq_length ys@23@01)) (not (= ix@35@01 jx@36@01))))))
  (and
    (>= ix@35@01 0)
    (< ix@35@01 (Seq_length ys@23@01))
    (>= jx@36@01 0)
    (< jx@36@01 (Seq_length ys@23@01))
    (not (= ix@35@01 jx@36@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= ix@35@01 0)
      (and
        (< ix@35@01 (Seq_length ys@23@01))
        (and
          (>= jx@36@01 0)
          (and (< jx@36@01 (Seq_length ys@23@01)) (not (= ix@35@01 jx@36@01)))))))
  (and
    (>= ix@35@01 0)
    (and
      (< ix@35@01 (Seq_length ys@23@01))
      (and
        (>= jx@36@01 0)
        (and (< jx@36@01 (Seq_length ys@23@01)) (not (= ix@35@01 jx@36@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((ix@35@01 Int) (jx@36@01 Int)) (!
  (=>
    (and
      (>= ix@35@01 0)
      (and
        (< ix@35@01 (Seq_length ys@23@01))
        (and
          (>= jx@36@01 0)
          (and (< jx@36@01 (Seq_length ys@23@01)) (not (= ix@35@01 jx@36@01))))))
    (not (= (Seq_index ys@23@01 ix@35@01) (Seq_index ys@23@01 jx@36@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@31@12@31@116|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((ix@35@01 Int) (jx@36@01 Int)) (!
  (=>
    (and
      (>= ix@35@01 0)
      (and
        (< ix@35@01 (Seq_length ys@23@01))
        (and
          (>= jx@36@01 0)
          (and (< jx@36@01 (Seq_length ys@23@01)) (not (= ix@35@01 jx@36@01))))))
    (not (= (Seq_index ys@23@01 ix@35@01) (Seq_index ys@23@01 jx@36@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@31@12@31@116|)))
(declare-const i@37@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 23 | !(0 <= i@37@01) | live]
; [else-branch: 23 | 0 <= i@37@01 | live]
(push) ; 6
; [then-branch: 23 | !(0 <= i@37@01)]
(assert (not (<= 0 i@37@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 23 | 0 <= i@37@01]
(assert (<= 0 i@37@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@37@01) (not (<= 0 i@37@01))))
(assert (and (<= 0 i@37@01) (< i@37@01 (Seq_length ys@23@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@37@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@38@01 ($Ref) Int)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and (<= 0 i@37@01) (< i@37@01 (Seq_length ys@23@01)))
    (or (<= 0 i@37@01) (not (<= 0 i@37@01))))
  :pattern ((Seq_index ys@23@01 i@37@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@37@01 Int) (i2@37@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@37@01) (< i1@37@01 (Seq_length ys@23@01)))
      (and (<= 0 i2@37@01) (< i2@37@01 (Seq_length ys@23@01)))
      (= (Seq_index ys@23@01 i1@37@01) (Seq_index ys@23@01 i2@37@01)))
    (= i1@37@01 i2@37@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and (<= 0 i@37@01) (< i@37@01 (Seq_length ys@23@01)))
    (and
      (= (inv@38@01 (Seq_index ys@23@01 i@37@01)) i@37@01)
      (img@39@01 (Seq_index ys@23@01 i@37@01))))
  :pattern ((Seq_index ys@23@01 i@37@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@01 r)
      (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01))))
    (= (Seq_index ys@23@01 (inv@38@01 r)) r))
  :pattern ((inv@38@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01)))
      (img@39@01 r)
      (= r (Seq_index ys@23@01 (inv@38@01 r))))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length ys@23@01))))
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
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length ys@23@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@40@01 r))
    $Perm.No)
  
  :qid |quant-u-38|))))
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
      (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01)))
      (img@39@01 r)
      (= r (Seq_index ys@23@01 (inv@38@01 r))))
    (= (- $Perm.Write (pTaken@40@01 r)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@41@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@41@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01)))
        (img@39@01 r)))
    (=>
      (and
        (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01)))
        (img@39@01 r))
      (Set_in r ($FVF.domain_f (as sm@41@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@41@01  $FVF<f>))))
  :qid |qp.fvfDomDef4|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01)))
        (img@39@01 r))
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length ys@23@01)))))
    (= ($FVF.lookup_f (as sm@41@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@41@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef3|)))
; [eval] 0 <= j
; [eval] j < |xs|
; [eval] |xs|
(assert (fun_f%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@41@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit))) ys@23@01 k@24@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and (<= 0 i@37@01) (< i@37@01 (Seq_length ys@23@01)))
    (and
      (= (inv@38@01 (Seq_index ys@23@01 i@37@01)) i@37@01)
      (img@39@01 (Seq_index ys@23@01 i@37@01))))
  :pattern ((Seq_index ys@23@01 i@37@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@01 r)
      (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01))))
    (= (Seq_index ys@23@01 (inv@38@01 r)) r))
  :pattern ((inv@38@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@41@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01)))
        (img@39@01 r)))
    (=>
      (and
        (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01)))
        (img@39@01 r))
      (Set_in r ($FVF.domain_f (as sm@41@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@41@01  $FVF<f>))))
  :qid |qp.fvfDomDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@38@01 r)) (< (inv@38@01 r) (Seq_length ys@23@01)))
        (img@39@01 r))
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length ys@23@01)))))
    (= ($FVF.lookup_f (as sm@41@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@41@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef3|)))
(assert (and
  (forall ((ix@35@01 Int) (jx@36@01 Int)) (!
    (=>
      (and
        (>= ix@35@01 0)
        (and
          (< ix@35@01 (Seq_length ys@23@01))
          (and
            (>= jx@36@01 0)
            (and (< jx@36@01 (Seq_length ys@23@01)) (not (= ix@35@01 jx@36@01))))))
      (not (= (Seq_index ys@23@01 ix@35@01) (Seq_index ys@23@01 jx@36@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/basic/functions1.vpr@31@12@31@116|))
  (forall ((i@37@01 Int)) (!
    (=>
      (and (<= 0 i@37@01) (< i@37@01 (Seq_length ys@23@01)))
      (or (<= 0 i@37@01) (not (<= 0 i@37@01))))
    :pattern ((Seq_index ys@23@01 i@37@01))
    :qid |f-aux|))
  (fun_f%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@41@01  $FVF<f>))
      ($Snap.combine $Snap.unit $Snap.unit))) ys@23@01 k@24@01)))
(assert (=
  (fun_f ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@41@01  $FVF<f>))
      ($Snap.combine $Snap.unit $Snap.unit))) ys@23@01 k@24@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale get_f(ys[k]) == 0
; [eval] get_f(ys[k]) == 0
; [eval] get_f(ys[k])
; [eval] ys[k]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= k@24@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@42@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ys@23@01 k@24@01))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length ys@23@01))))
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
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length ys@23@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@42@01 r))
    $Perm.No)
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@42@01 r) $Perm.No)
  
  :qid |quant-u-42|))))
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
  (=>
    (= r (Seq_index ys@23@01 k@24@01))
    (= (- $Perm.Write (pTaken@42@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@43@01 $FVF<f>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@33@01 (Seq_index ys@23@01 k@24@01))
    (and
      (<= 0 (inv@32@01 (Seq_index ys@23@01 k@24@01)))
      (< (inv@32@01 (Seq_index ys@23@01 k@24@01)) (Seq_length ys@23@01))))
  (=
    ($FVF.lookup_f (as sm@43@01  $FVF<f>) (Seq_index ys@23@01 k@24@01))
    ($FVF.lookup_f $t@31@01 (Seq_index ys@23@01 k@24@01)))))
(assert (get_f%precondition ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@43@01  $FVF<f>) (Seq_index
  ys@23@01
  k@24@01))) (Seq_index ys@23@01 k@24@01)))
(pop) ; 3
; Joined path conditions
(assert (and
  (=>
    (and
      (img@33@01 (Seq_index ys@23@01 k@24@01))
      (and
        (<= 0 (inv@32@01 (Seq_index ys@23@01 k@24@01)))
        (< (inv@32@01 (Seq_index ys@23@01 k@24@01)) (Seq_length ys@23@01))))
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) (Seq_index ys@23@01 k@24@01))
      ($FVF.lookup_f $t@31@01 (Seq_index ys@23@01 k@24@01))))
  (get_f%precondition ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@43@01  $FVF<f>) (Seq_index
    ys@23@01
    k@24@01))) (Seq_index ys@23@01 k@24@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (get_f ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@43@01  $FVF<f>) (Seq_index
    ys@23@01
    k@24@01))) (Seq_index ys@23@01 k@24@01))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get_f ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@43@01  $FVF<f>) (Seq_index
    ys@23@01
    k@24@01))) (Seq_index ys@23@01 k@24@01))
  0))
(pop) ; 2
(pop) ; 1
