(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:05
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0282.vpr
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
(declare-sort Set<$Snap> 0)
(declare-sort Dummy 0)
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
(declare-fun $SortWrappers.DummyTo$Snap (Dummy) $Snap)
(declare-fun $SortWrappers.$SnapToDummy ($Snap) Dummy)
(assert (forall ((x Dummy)) (!
    (= x ($SortWrappers.$SnapToDummy($SortWrappers.DummyTo$Snap x)))
    :pattern (($SortWrappers.DummyTo$Snap x))
    :qid |$Snap.$SnapToDummyTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DummyTo$Snap($SortWrappers.$SnapToDummy x)))
    :pattern (($SortWrappers.$SnapToDummy x))
    :qid |$Snap.DummyTo$SnapToDummy|
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
(declare-fun D<Bool> ($Ref $Ref) Bool)
; /field_value_functions_declarations.smt2 [f: Ref]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) $Ref)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f ($Ref $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /predicate_snap_functions_declarations.smt2 [pred: Snap]
(declare-fun $PSF.domain_pred ($PSF<pred>) Set<$Snap>)
(declare-fun $PSF.lookup_pred ($PSF<pred> $Snap) $Snap)
(declare-fun $PSF.after_pred ($PSF<pred> $PSF<pred>) Bool)
(declare-fun $PSF.loc_pred ($Snap $Snap) Bool)
(declare-fun $PSF.perm_pred ($PPM $Snap) $Perm)
(declare-const $psfTOP_pred $PSF<pred>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun at2 ($Snap Int Seq<$Ref>) $Ref)
(declare-fun at2%limited ($Snap Int Seq<$Ref>) $Ref)
(declare-fun at2%stateless (Int Seq<$Ref>) Bool)
(declare-fun at2%precondition ($Snap Int Seq<$Ref>) Bool)
(declare-fun fun2 ($Snap $Ref) $Ref)
(declare-fun fun2%limited ($Snap $Ref) $Ref)
(declare-fun fun2%stateless ($Ref) Bool)
(declare-fun fun2%precondition ($Snap $Ref) Bool)
(declare-fun at1 ($Snap Seq<$Ref> Int) $Ref)
(declare-fun at1%limited ($Snap Seq<$Ref> Int) $Ref)
(declare-fun at1%stateless (Seq<$Ref> Int) Bool)
(declare-fun at1%precondition ($Snap Seq<$Ref> Int) Bool)
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
(assert (forall ((r1 $Ref) (r2 $Ref)) (!
  (D<Bool> r1 r2)
  :pattern ((D<Bool> r1 r2))
  :qid |prog.def_D|)))
; /field_value_functions_axioms.smt2 [f: Ref]
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
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
; /predicate_snap_functions_axioms.smt2 [pred: Snap]
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
(assert (forall ((s $Snap) (f $Snap)) (!
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
(assert (forall ((s@$ $Snap) (i@0@00 Int) (xs@1@00 Seq<$Ref>)) (!
  (= (at2%limited s@$ i@0@00 xs@1@00) (at2 s@$ i@0@00 xs@1@00))
  :pattern ((at2 s@$ i@0@00 xs@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (xs@1@00 Seq<$Ref>)) (!
  (at2%stateless i@0@00 xs@1@00)
  :pattern ((at2%limited s@$ i@0@00 xs@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (xs@1@00 Seq<$Ref>)) (!
  (=>
    (at2%precondition s@$ i@0@00 xs@1@00)
    (= (at2 s@$ i@0@00 xs@1@00) (Seq_index xs@1@00 i@0@00)))
  :pattern ((at2 s@$ i@0@00 xs@1@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (xs@1@00 Seq<$Ref>)) (!
  true
  :pattern ((at2 s@$ i@0@00 xs@1@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (r@3@00 $Ref)) (!
  (= (fun2%limited s@$ r@3@00) (fun2 s@$ r@3@00))
  :pattern ((fun2 s@$ r@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@3@00 $Ref)) (!
  (fun2%stateless r@3@00)
  :pattern ((fun2%limited s@$ r@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@3@00 $Ref)) (!
  (=> (fun2%precondition s@$ r@3@00) (= (fun2 s@$ r@3@00) r@3@00))
  :pattern ((fun2 s@$ r@3@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (r@3@00 $Ref)) (!
  true
  :pattern ((fun2 s@$ r@3@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Seq<$Ref>) (i@6@00 Int)) (!
  (= (at1%limited s@$ xs@5@00 i@6@00) (at1 s@$ xs@5@00 i@6@00))
  :pattern ((at1 s@$ xs@5@00 i@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Seq<$Ref>) (i@6@00 Int)) (!
  (at1%stateless xs@5@00 i@6@00)
  :pattern ((at1%limited s@$ xs@5@00 i@6@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Seq<$Ref>) (i@6@00 Int)) (!
  (=>
    (at1%precondition s@$ xs@5@00 i@6@00)
    (= (at1 s@$ xs@5@00 i@6@00) (Seq_index xs@5@00 i@6@00)))
  :pattern ((at1 s@$ xs@5@00 i@6@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Seq<$Ref>) (i@6@00 Int)) (!
  true
  :pattern ((at1 s@$ xs@5@00 i@6@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref) (i@9@00 Int)) (!
  (= (fun%limited s@$ r@8@00 i@9@00) (fun s@$ r@8@00 i@9@00))
  :pattern ((fun s@$ r@8@00 i@9@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref) (i@9@00 Int)) (!
  (fun%stateless r@8@00 i@9@00)
  :pattern ((fun%limited s@$ r@8@00 i@9@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref) (i@9@00 Int)) (!
  (=> (fun%precondition s@$ r@8@00 i@9@00) (= (fun s@$ r@8@00 i@9@00) r@8@00))
  :pattern ((fun s@$ r@8@00 i@9@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref) (i@9@00 Int)) (!
  true
  :pattern ((fun s@$ r@8@00 i@9@00))
  :qid |quant-u-15|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- t4b ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const i@1@01 Int)
(declare-const xs@2@01 Seq<$Ref>)
(declare-const i@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const x@4@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@2@01 x@4@01))
; [eval] fun(x, i)
(push) ; 3
(assert (fun%precondition $Snap.unit x@4@01 i@3@01))
(pop) ; 3
; Joined path conditions
(assert (fun%precondition $Snap.unit x@4@01 i@3@01))
; [eval] fun2(x)
(push) ; 3
(assert (fun2%precondition $Snap.unit x@4@01))
(pop) ; 3
; Joined path conditions
(assert (fun2%precondition $Snap.unit x@4@01))
(assert (fun2%precondition $Snap.unit x@4@01))
(pop) ; 2
(declare-const $t@5@01 $PSF<pred>)
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@4@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 x@4@01)
    (and
      (fun%precondition $Snap.unit x@4@01 i@3@01)
      (fun2%precondition $Snap.unit x@4@01)))
  :pattern ((fun2 $Snap.unit x@4@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((x1@4@01 $Ref) (x2@4@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@2@01 x1@4@01) (Seq_contains xs@2@01 x2@4@01))
    (and
      (fun%precondition $Snap.unit x1@4@01 i@3@01)
      (fun%precondition $Snap.unit x2@4@01 i@3@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 2
(assert (not (forall ((x1@4@01 $Ref) (x2@4@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@2@01 x1@4@01)
      (Seq_contains xs@2@01 x2@4@01)
      (= (fun $Snap.unit x1@4@01 i@3@01) (fun $Snap.unit x2@4@01 i@3@01)))
    (= x1@4@01 x2@4@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@4@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 x@4@01)
    (and
      (fun%precondition $Snap.unit x@4@01 i@3@01)
      (=>
        (= (inv@6@01 (fun $Snap.unit x@4@01 i@3@01)) x@4@01)
        (fun%precondition $Snap.unit x@4@01 i@3@01))))
  :pattern ((fun2 $Snap.unit x@4@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
    (fun%precondition $Snap.unit (inv@6@01 r) i@3@01))
  :pattern ((inv@6@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((x@4@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 x@4@01)
    (and
      (= (inv@6@01 (fun $Snap.unit x@4@01 i@3@01)) x@4@01)
      (img@7@01 (fun $Snap.unit x@4@01 i@3@01))))
  :pattern ((fun2 $Snap.unit x@4@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
    (= (fun $Snap.unit (inv@6@01 r) i@3@01) r))
  :pattern ((inv@6@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const y@8@01 $Ref)
(push) ; 3
; [eval] (y in xs)
(assert (Seq_contains xs@2@01 y@8@01))
; [eval] fun2(y)
(push) ; 4
(assert (fun2%precondition $Snap.unit y@8@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit y@8@01))
; [eval] fun(y, i)
(push) ; 4
(assert (fun%precondition $Snap.unit y@8@01 i@3@01))
(pop) ; 4
; Joined path conditions
(assert (fun%precondition $Snap.unit y@8@01 i@3@01))
(assert (fun%precondition $Snap.unit y@8@01 i@3@01))
(pop) ; 3
(declare-const $t@9@01 $PSF<pred>)
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((y@8@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 y@8@01)
    (and
      (fun2%precondition $Snap.unit y@8@01)
      (fun%precondition $Snap.unit y@8@01 i@3@01)))
  :pattern ((fun $Snap.unit y@8@01 i@3@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((y1@8@01 $Ref) (y2@8@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@2@01 y1@8@01) (Seq_contains xs@2@01 y2@8@01))
    (and
      (fun2%precondition $Snap.unit y1@8@01)
      (fun2%precondition $Snap.unit y2@8@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 3
(assert (not (forall ((y1@8@01 $Ref) (y2@8@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@2@01 y1@8@01)
      (Seq_contains xs@2@01 y2@8@01)
      (= (fun2 $Snap.unit y1@8@01) (fun2 $Snap.unit y2@8@01)))
    (= y1@8@01 y2@8@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@8@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 y@8@01)
    (and
      (fun2%precondition $Snap.unit y@8@01)
      (=>
        (= (inv@10@01 (fun2 $Snap.unit y@8@01)) y@8@01)
        (fun2%precondition $Snap.unit y@8@01))))
  :pattern ((fun $Snap.unit y@8@01 i@3@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (Seq_contains xs@2@01 (inv@10@01 r)))
    (fun2%precondition $Snap.unit (inv@10@01 r)))
  :pattern ((inv@10@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((y@8@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 y@8@01)
    (and
      (= (inv@10@01 (fun2 $Snap.unit y@8@01)) y@8@01)
      (img@11@01 (fun2 $Snap.unit y@8@01))))
  :pattern ((fun $Snap.unit y@8@01 i@3@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (Seq_contains xs@2@01 (inv@10@01 r)))
    (= (fun2 $Snap.unit (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |pred-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const y@12@01 $Ref)
(push) ; 3
; [eval] (y in xs)
(assert (Seq_contains xs@2@01 y@12@01))
; [eval] fun2(y)
(push) ; 4
(assert (fun2%precondition $Snap.unit y@12@01))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit y@12@01))
; [eval] fun(y, i)
(push) ; 4
(assert (fun%precondition $Snap.unit y@12@01 i@3@01))
(pop) ; 4
; Joined path conditions
(assert (fun%precondition $Snap.unit y@12@01 i@3@01))
(assert (fun%precondition $Snap.unit y@12@01 i@3@01))
(pop) ; 3
(declare-fun inv@13@01 ($Ref) $Ref)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((y@12@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 y@12@01)
    (and
      (fun2%precondition $Snap.unit y@12@01)
      (fun%precondition $Snap.unit y@12@01 i@3@01)))
  :pattern ((fun $Snap.unit y@12@01 i@3@01))
  :qid |pred-aux|)))
; Check receiver injectivity
(assert (forall ((y1@12@01 $Ref) (y2@12@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@2@01 y1@12@01) (Seq_contains xs@2@01 y2@12@01))
    (and
      (fun2%precondition $Snap.unit y1@12@01)
      (fun2%precondition $Snap.unit y2@12@01)))
  
  :qid |pred-rcvrInj|)))
(push) ; 3
(assert (not (forall ((y1@12@01 $Ref) (y2@12@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@2@01 y1@12@01)
      (Seq_contains xs@2@01 y2@12@01)
      (= (fun2 $Snap.unit y1@12@01) (fun2 $Snap.unit y2@12@01)))
    (= y1@12@01 y2@12@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@12@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 y@12@01)
    (and
      (fun2%precondition $Snap.unit y@12@01)
      (=>
        (= (inv@13@01 (fun2 $Snap.unit y@12@01)) y@12@01)
        (fun2%precondition $Snap.unit y@12@01))))
  :pattern ((fun $Snap.unit y@12@01 i@3@01))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (Seq_contains xs@2@01 (inv@13@01 r)))
    (fun2%precondition $Snap.unit (inv@13@01 r)))
  :pattern ((inv@13@01 r))
  :qid |pred-fctOfInv|)))
(assert (forall ((y@12@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 y@12@01)
    (and
      (= (inv@13@01 (fun2 $Snap.unit y@12@01)) y@12@01)
      (img@14@01 (fun2 $Snap.unit y@12@01))))
  :pattern ((fun $Snap.unit y@12@01 i@3@01))
  :qid |pred-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (Seq_contains xs@2@01 (inv@13@01 r)))
    (= (fun2 $Snap.unit (inv@13@01 r)) r))
  :pattern ((inv@13@01 r))
  :qid |pred-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((y@12@01 $Ref)) (!
  (= (fun2 $Snap.unit y@12@01) (fun $Snap.unit y@12@01 i@3@01))
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@15@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@2@01 (inv@13@01 r))
      (img@14@01 r)
      (= r (fun2 $Snap.unit (inv@13@01 r))))
    ($Perm.min
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
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
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@15@01 r))
    $Perm.No)
  
  :qid |quant-u-23|))))
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
      (Seq_contains xs@2@01 (inv@13@01 r))
      (img@14@01 r)
      (= r (fun2 $Snap.unit (inv@13@01 r))))
    (= (- $Perm.Write (pTaken@15@01 r)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@16@01 $PSF<pred>)
(declare-const s@17@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@17@01 $Snap)) (!
  (=>
    (and
      (img@7@01 ($SortWrappers.$SnapTo$Ref s@17@01))
      (Seq_contains xs@2@01 (inv@6@01 ($SortWrappers.$SnapTo$Ref s@17@01))))
    (and
      (not (= s@17@01 $Snap.unit))
      (=
        ($PSF.lookup_pred (as sm@16@01  $PSF<pred>) s@17@01)
        ($PSF.lookup_pred $t@5@01 s@17@01))))
  :pattern (($PSF.lookup_pred (as sm@16@01  $PSF<pred>) s@17@01))
  :pattern (($PSF.lookup_pred $t@5@01 s@17@01))
  :qid |qp.psmValDef0|)))
(pop) ; 2
(pop) ; 1
; ---------- test02a ----------
(declare-const xs@18@01 Seq<$Ref>)
(declare-const k@19@01 Int)
(declare-const xs@20@01 Seq<$Ref>)
(declare-const k@21@01 Int)
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
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@23@01 Int)
(declare-const j@24@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 0 | !(i@23@01 >= 0) | live]
; [else-branch: 0 | i@23@01 >= 0 | live]
(push) ; 5
; [then-branch: 0 | !(i@23@01 >= 0)]
(assert (not (>= i@23@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i@23@01 >= 0]
(assert (>= i@23@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 1 | !(i@23@01 < |xs@20@01|) | live]
; [else-branch: 1 | i@23@01 < |xs@20@01| | live]
(push) ; 7
; [then-branch: 1 | !(i@23@01 < |xs@20@01|)]
(assert (not (< i@23@01 (Seq_length xs@20@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i@23@01 < |xs@20@01|]
(assert (< i@23@01 (Seq_length xs@20@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 2 | !(j@24@01 >= 0) | live]
; [else-branch: 2 | j@24@01 >= 0 | live]
(push) ; 9
; [then-branch: 2 | !(j@24@01 >= 0)]
(assert (not (>= j@24@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | j@24@01 >= 0]
(assert (>= j@24@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 3 | !(j@24@01 < |xs@20@01|) | live]
; [else-branch: 3 | j@24@01 < |xs@20@01| | live]
(push) ; 11
; [then-branch: 3 | !(j@24@01 < |xs@20@01|)]
(assert (not (< j@24@01 (Seq_length xs@20@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | j@24@01 < |xs@20@01|]
(assert (< j@24@01 (Seq_length xs@20@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@24@01 (Seq_length xs@20@01)) (not (< j@24@01 (Seq_length xs@20@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@24@01 0)
  (and
    (>= j@24@01 0)
    (or
      (< j@24@01 (Seq_length xs@20@01))
      (not (< j@24@01 (Seq_length xs@20@01)))))))
(assert (or (>= j@24@01 0) (not (>= j@24@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@23@01 (Seq_length xs@20@01))
  (and
    (< i@23@01 (Seq_length xs@20@01))
    (=>
      (>= j@24@01 0)
      (and
        (>= j@24@01 0)
        (or
          (< j@24@01 (Seq_length xs@20@01))
          (not (< j@24@01 (Seq_length xs@20@01))))))
    (or (>= j@24@01 0) (not (>= j@24@01 0))))))
(assert (or (< i@23@01 (Seq_length xs@20@01)) (not (< i@23@01 (Seq_length xs@20@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@23@01 0)
  (and
    (>= i@23@01 0)
    (=>
      (< i@23@01 (Seq_length xs@20@01))
      (and
        (< i@23@01 (Seq_length xs@20@01))
        (=>
          (>= j@24@01 0)
          (and
            (>= j@24@01 0)
            (or
              (< j@24@01 (Seq_length xs@20@01))
              (not (< j@24@01 (Seq_length xs@20@01))))))
        (or (>= j@24@01 0) (not (>= j@24@01 0)))))
    (or
      (< i@23@01 (Seq_length xs@20@01))
      (not (< i@23@01 (Seq_length xs@20@01)))))))
(assert (or (>= i@23@01 0) (not (>= i@23@01 0))))
(push) ; 4
; [then-branch: 4 | i@23@01 >= 0 && i@23@01 < |xs@20@01| && j@24@01 >= 0 && j@24@01 < |xs@20@01| && i@23@01 != j@24@01 | live]
; [else-branch: 4 | !(i@23@01 >= 0 && i@23@01 < |xs@20@01| && j@24@01 >= 0 && j@24@01 < |xs@20@01| && i@23@01 != j@24@01) | live]
(push) ; 5
; [then-branch: 4 | i@23@01 >= 0 && i@23@01 < |xs@20@01| && j@24@01 >= 0 && j@24@01 < |xs@20@01| && i@23@01 != j@24@01]
(assert (and
  (>= i@23@01 0)
  (and
    (< i@23@01 (Seq_length xs@20@01))
    (and
      (>= j@24@01 0)
      (and (< j@24@01 (Seq_length xs@20@01)) (not (= i@23@01 j@24@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@23@01 >= 0 && i@23@01 < |xs@20@01| && j@24@01 >= 0 && j@24@01 < |xs@20@01| && i@23@01 != j@24@01)]
(assert (not
  (and
    (>= i@23@01 0)
    (and
      (< i@23@01 (Seq_length xs@20@01))
      (and
        (>= j@24@01 0)
        (and (< j@24@01 (Seq_length xs@20@01)) (not (= i@23@01 j@24@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@23@01 0)
    (and
      (< i@23@01 (Seq_length xs@20@01))
      (and
        (>= j@24@01 0)
        (and (< j@24@01 (Seq_length xs@20@01)) (not (= i@23@01 j@24@01))))))
  (and
    (>= i@23@01 0)
    (< i@23@01 (Seq_length xs@20@01))
    (>= j@24@01 0)
    (< j@24@01 (Seq_length xs@20@01))
    (not (= i@23@01 j@24@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@23@01 0)
      (and
        (< i@23@01 (Seq_length xs@20@01))
        (and
          (>= j@24@01 0)
          (and (< j@24@01 (Seq_length xs@20@01)) (not (= i@23@01 j@24@01)))))))
  (and
    (>= i@23@01 0)
    (and
      (< i@23@01 (Seq_length xs@20@01))
      (and
        (>= j@24@01 0)
        (and (< j@24@01 (Seq_length xs@20@01)) (not (= i@23@01 j@24@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@23@01 Int) (j@24@01 Int)) (!
  (and
    (=>
      (>= i@23@01 0)
      (and
        (>= i@23@01 0)
        (=>
          (< i@23@01 (Seq_length xs@20@01))
          (and
            (< i@23@01 (Seq_length xs@20@01))
            (=>
              (>= j@24@01 0)
              (and
                (>= j@24@01 0)
                (or
                  (< j@24@01 (Seq_length xs@20@01))
                  (not (< j@24@01 (Seq_length xs@20@01))))))
            (or (>= j@24@01 0) (not (>= j@24@01 0)))))
        (or
          (< i@23@01 (Seq_length xs@20@01))
          (not (< i@23@01 (Seq_length xs@20@01))))))
    (or (>= i@23@01 0) (not (>= i@23@01 0)))
    (=>
      (and
        (>= i@23@01 0)
        (and
          (< i@23@01 (Seq_length xs@20@01))
          (and
            (>= j@24@01 0)
            (and (< j@24@01 (Seq_length xs@20@01)) (not (= i@23@01 j@24@01))))))
      (and
        (>= i@23@01 0)
        (< i@23@01 (Seq_length xs@20@01))
        (>= j@24@01 0)
        (< j@24@01 (Seq_length xs@20@01))
        (not (= i@23@01 j@24@01))))
    (or
      (not
        (and
          (>= i@23@01 0)
          (and
            (< i@23@01 (Seq_length xs@20@01))
            (and
              (>= j@24@01 0)
              (and (< j@24@01 (Seq_length xs@20@01)) (not (= i@23@01 j@24@01)))))))
      (and
        (>= i@23@01 0)
        (and
          (< i@23@01 (Seq_length xs@20@01))
          (and
            (>= j@24@01 0)
            (and (< j@24@01 (Seq_length xs@20@01)) (not (= i@23@01 j@24@01))))))))
  :pattern ((Seq_index xs@20@01 i@23@01) (Seq_index xs@20@01 j@24@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@28@10@28@102-aux|)))
(assert (forall ((i@23@01 Int) (j@24@01 Int)) (!
  (=>
    (and
      (>= i@23@01 0)
      (and
        (< i@23@01 (Seq_length xs@20@01))
        (and
          (>= j@24@01 0)
          (and (< j@24@01 (Seq_length xs@20@01)) (not (= i@23@01 j@24@01))))))
    (not (= (Seq_index xs@20@01 i@23@01) (Seq_index xs@20@01 j@24@01))))
  :pattern ((Seq_index xs@20@01 i@23@01) (Seq_index xs@20@01 j@24@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@28@10@28@102|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { at1(xs, i) }
;     0 <= i && i < |xs| ==> acc(at1(xs, i).f, write))
(declare-const i@25@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | !(0 <= i@25@01) | live]
; [else-branch: 5 | 0 <= i@25@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= i@25@01)]
(assert (not (<= 0 i@25@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= i@25@01]
(assert (<= 0 i@25@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
(assert (and (<= 0 i@25@01) (< i@25@01 (Seq_length xs@20@01))))
; [eval] at1(xs, i)
(push) ; 4
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))
(pop) ; 4
; Joined path conditions
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))
(pop) ; 3
(declare-const $t@26@01 $FVF<f>)
(declare-fun inv@27@01 ($Ref) Int)
(declare-fun img@28@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 (Seq_length xs@20@01)))
    (and
      (or (<= 0 i@25@01) (not (<= 0 i@25@01)))
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01)))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((i1@25@01 Int) (i2@25@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@25@01) (< i1@25@01 (Seq_length xs@20@01)))
      (and (<= 0 i2@25@01) (< i2@25@01 (Seq_length xs@20@01))))
    (and
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i1@25@01)
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i2@25@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((i1@25@01 Int) (i2@25@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@25@01) (< i1@25@01 (Seq_length xs@20@01)))
      (and (<= 0 i2@25@01) (< i2@25@01 (Seq_length xs@20@01)))
      (=
        (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i1@25@01)
        (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i2@25@01)))
    (= i1@25@01 i2@25@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 (Seq_length xs@20@01)))
    (and
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01)
      (=>
        (=
          (inv@27@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))
          i@25@01)
        (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))
  :qid |quant-u-26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length xs@20@01))))
    (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 (inv@27@01 r)))
  :pattern ((inv@27@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 (Seq_length xs@20@01)))
    (and
      (=
        (inv@27@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))
        i@25@01)
      (img@28@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))
  :qid |quant-u-26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length xs@20@01))))
    (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 (inv@27@01 r)) r))
  :pattern ((inv@27@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 (Seq_length xs@20@01)))
    (not
      (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01) $Ref.null)))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@25@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     0 <= i && (i < j && j < |xs|) ==> xs[i] != xs[j])
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } 0 <= i && (i < j && j < |xs|) ==> xs[i] != xs[j])
(declare-const i@30@01 Int)
(declare-const j@31@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && (i < j && j < |xs|) ==> xs[i] != xs[j]
; [eval] 0 <= i && (i < j && j < |xs|)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 6 | !(0 <= i@30@01) | live]
; [else-branch: 6 | 0 <= i@30@01 | live]
(push) ; 5
; [then-branch: 6 | !(0 <= i@30@01)]
(assert (not (<= 0 i@30@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 <= i@30@01]
(assert (<= 0 i@30@01))
; [eval] i < j
(push) ; 6
; [then-branch: 7 | !(i@30@01 < j@31@01) | live]
; [else-branch: 7 | i@30@01 < j@31@01 | live]
(push) ; 7
; [then-branch: 7 | !(i@30@01 < j@31@01)]
(assert (not (< i@30@01 j@31@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | i@30@01 < j@31@01]
(assert (< i@30@01 j@31@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< i@30@01 j@31@01) (not (< i@30@01 j@31@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@30@01)
  (and (<= 0 i@30@01) (or (< i@30@01 j@31@01) (not (< i@30@01 j@31@01))))))
(assert (or (<= 0 i@30@01) (not (<= 0 i@30@01))))
(push) ; 4
; [then-branch: 8 | 0 <= i@30@01 && i@30@01 < j@31@01 && j@31@01 < |xs@20@01| | live]
; [else-branch: 8 | !(0 <= i@30@01 && i@30@01 < j@31@01 && j@31@01 < |xs@20@01|) | live]
(push) ; 5
; [then-branch: 8 | 0 <= i@30@01 && i@30@01 < j@31@01 && j@31@01 < |xs@20@01|]
(assert (and (<= 0 i@30@01) (and (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@30@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@30@01 (Seq_length xs@20@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@31@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(0 <= i@30@01 && i@30@01 < j@31@01 && j@31@01 < |xs@20@01|)]
(assert (not
  (and
    (<= 0 i@30@01)
    (and (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@30@01)
    (and (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01))))
  (and (<= 0 i@30@01) (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@30@01)
      (and (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01)))))
  (and
    (<= 0 i@30@01)
    (and (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@30@01 Int) (j@31@01 Int)) (!
  (and
    (=>
      (<= 0 i@30@01)
      (and (<= 0 i@30@01) (or (< i@30@01 j@31@01) (not (< i@30@01 j@31@01)))))
    (or (<= 0 i@30@01) (not (<= 0 i@30@01)))
    (=>
      (and
        (<= 0 i@30@01)
        (and (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01))))
      (and (<= 0 i@30@01) (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01))))
    (or
      (not
        (and
          (<= 0 i@30@01)
          (and (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01)))))
      (and
        (<= 0 i@30@01)
        (and (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01))))))
  :pattern ((Seq_index xs@20@01 i@30@01) (Seq_index xs@20@01 j@31@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@32@10@32@81-aux|)))
(assert (forall ((i@30@01 Int) (j@31@01 Int)) (!
  (=>
    (and
      (<= 0 i@30@01)
      (and (< i@30@01 j@31@01) (< j@31@01 (Seq_length xs@20@01))))
    (not (= (Seq_index xs@20@01 i@30@01) (Seq_index xs@20@01 j@31@01))))
  :pattern ((Seq_index xs@20@01 i@30@01) (Seq_index xs@20@01 j@31@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@32@10@32@81|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int ::
;     { at2(i, xs) }
;     0 <= i && i < |xs| ==> acc(at2(i, xs).f, write))
(declare-const i@32@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 9 | !(0 <= i@32@01) | live]
; [else-branch: 9 | 0 <= i@32@01 | live]
(push) ; 5
; [then-branch: 9 | !(0 <= i@32@01)]
(assert (not (<= 0 i@32@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | 0 <= i@32@01]
(assert (<= 0 i@32@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@32@01) (not (<= 0 i@32@01))))
(assert (and (<= 0 i@32@01) (< i@32@01 (Seq_length xs@20@01))))
; [eval] at2(i, xs)
(push) ; 4
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01))
(pop) ; 4
; Joined path conditions
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01))
(pop) ; 3
(declare-fun inv@33@01 ($Ref) Int)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 (Seq_length xs@20@01)))
    (and
      (or (<= 0 i@32@01) (not (<= 0 i@32@01)))
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01)))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((i1@32@01 Int) (i2@32@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@32@01) (< i1@32@01 (Seq_length xs@20@01)))
      (and (<= 0 i2@32@01) (< i2@32@01 (Seq_length xs@20@01))))
    (and
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i1@32@01 xs@20@01)
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i2@32@01 xs@20@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((i1@32@01 Int) (i2@32@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@32@01) (< i1@32@01 (Seq_length xs@20@01)))
      (and (<= 0 i2@32@01) (< i2@32@01 (Seq_length xs@20@01)))
      (=
        (at2 ($Snap.combine $Snap.unit $Snap.unit) i1@32@01 xs@20@01)
        (at2 ($Snap.combine $Snap.unit $Snap.unit) i2@32@01 xs@20@01)))
    (= i1@32@01 i2@32@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 (Seq_length xs@20@01)))
    (and
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01)
      (=>
        (=
          (inv@33@01 (at2 ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01))
          i@32@01)
        (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01))))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) (Seq_length xs@20@01))))
    (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) (inv@33@01 r) xs@20@01))
  :pattern ((inv@33@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 (Seq_length xs@20@01)))
    (and
      (=
        (inv@33@01 (at2 ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01))
        i@32@01)
      (img@34@01 (at2 ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01))))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) (Seq_length xs@20@01))))
    (= (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@33@01 r) xs@20@01) r))
  :pattern ((inv@33@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@32@01 Int)) (!
  (=
    (at2 ($Snap.combine $Snap.unit $Snap.unit) i@32@01 xs@20@01)
    (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@32@01))
  
  :qid |quant-u-28|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@35@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) (Seq_length xs@20@01)))
      (img@34@01 r)
      (= r (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@33@01 r) xs@20@01)))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length xs@20@01))))
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
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length xs@20@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@35@01 r))
    $Perm.No)
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@35@01 r) $Perm.No)
  
  :qid |quant-u-31|))))
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
      (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) (Seq_length xs@20@01)))
      (img@34@01 r)
      (= r (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@33@01 r) xs@20@01)))
    (= (- $Perm.Write (pTaken@35@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) (Seq_length xs@20@01)))
      (img@34@01 r)
      (= r (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@33@01 r) xs@20@01)))
    (= (- $Perm.Write (pTaken@35@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
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
(declare-const sm@36@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length xs@20@01))))
    (= ($FVF.lookup_f (as sm@36@01  $FVF<f>) r) ($FVF.lookup_f $t@26@01 r)))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@26@01 r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@37@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@37@01  $FPM) r)
    (ite
      (and
        (img@28@01 r)
        (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length xs@20@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@37@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@37@01  $FPM) r) $Perm.Write)
  :pattern ((inv@27@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const i@38@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 10 | !(0 <= i@38@01) | live]
; [else-branch: 10 | 0 <= i@38@01 | live]
(push) ; 5
; [then-branch: 10 | !(0 <= i@38@01)]
(assert (not (<= 0 i@38@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 10 | 0 <= i@38@01]
(assert (<= 0 i@38@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@38@01) (not (<= 0 i@38@01))))
(assert (and (<= 0 i@38@01) (< i@38@01 (Seq_length xs@20@01))))
; [eval] at2(i, xs)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01))
(pop) ; 4
; Joined path conditions
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01))
(pop) ; 3
(declare-fun inv@39@01 ($Ref) Int)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 (Seq_length xs@20@01)))
    (and
      (or (<= 0 i@38@01) (not (<= 0 i@38@01)))
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01)))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((i1@38@01 Int) (i2@38@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@38@01) (< i1@38@01 (Seq_length xs@20@01)))
      (and (<= 0 i2@38@01) (< i2@38@01 (Seq_length xs@20@01))))
    (and
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i1@38@01 xs@20@01)
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i2@38@01 xs@20@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((i1@38@01 Int) (i2@38@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@38@01) (< i1@38@01 (Seq_length xs@20@01)))
      (and (<= 0 i2@38@01) (< i2@38@01 (Seq_length xs@20@01)))
      (=
        (at2 ($Snap.combine $Snap.unit $Snap.unit) i1@38@01 xs@20@01)
        (at2 ($Snap.combine $Snap.unit $Snap.unit) i2@38@01 xs@20@01)))
    (= i1@38@01 i2@38@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 (Seq_length xs@20@01)))
    (and
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01)
      (=>
        (=
          (inv@39@01 (at2 ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01))
          i@38@01)
        (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01))))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@40@01 r)
      (and (<= 0 (inv@39@01 r)) (< (inv@39@01 r) (Seq_length xs@20@01))))
    (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) (inv@39@01 r) xs@20@01))
  :pattern ((inv@39@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 (Seq_length xs@20@01)))
    (and
      (=
        (inv@39@01 (at2 ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01))
        i@38@01)
      (img@40@01 (at2 ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01))))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@40@01 r)
      (and (<= 0 (inv@39@01 r)) (< (inv@39@01 r) (Seq_length xs@20@01))))
    (= (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@39@01 r) xs@20@01) r))
  :pattern ((inv@39@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@38@01 Int)) (!
  (=
    (at2 ($Snap.combine $Snap.unit $Snap.unit) i@38@01 xs@20@01)
    (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@20@01 i@38@01))
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@39@01 r)) (< (inv@39@01 r) (Seq_length xs@20@01)))
      (img@40@01 r)
      (= r (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@39@01 r) xs@20@01)))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length xs@20@01))))
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
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length xs@20@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@41@01 r))
    $Perm.No)
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@41@01 r) $Perm.No)
  
  :qid |quant-u-37|))))
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
      (and (<= 0 (inv@39@01 r)) (< (inv@39@01 r) (Seq_length xs@20@01)))
      (img@40@01 r)
      (= r (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@39@01 r) xs@20@01)))
    (= (- $Perm.Write (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@39@01 r)) (< (inv@39@01 r) (Seq_length xs@20@01)))
      (img@40@01 r)
      (= r (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@39@01 r) xs@20@01)))
    (= (- $Perm.Write (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test02b ----------
(declare-const xs@42@01 Seq<$Ref>)
(declare-const k@43@01 Int)
(declare-const xs@44@01 Seq<$Ref>)
(declare-const k@45@01 Int)
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
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@47@01 Int)
(declare-const j@48@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 11 | !(i@47@01 >= 0) | live]
; [else-branch: 11 | i@47@01 >= 0 | live]
(push) ; 5
; [then-branch: 11 | !(i@47@01 >= 0)]
(assert (not (>= i@47@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | i@47@01 >= 0]
(assert (>= i@47@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 12 | !(i@47@01 < |xs@44@01|) | live]
; [else-branch: 12 | i@47@01 < |xs@44@01| | live]
(push) ; 7
; [then-branch: 12 | !(i@47@01 < |xs@44@01|)]
(assert (not (< i@47@01 (Seq_length xs@44@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 12 | i@47@01 < |xs@44@01|]
(assert (< i@47@01 (Seq_length xs@44@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 13 | !(j@48@01 >= 0) | live]
; [else-branch: 13 | j@48@01 >= 0 | live]
(push) ; 9
; [then-branch: 13 | !(j@48@01 >= 0)]
(assert (not (>= j@48@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 13 | j@48@01 >= 0]
(assert (>= j@48@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 14 | !(j@48@01 < |xs@44@01|) | live]
; [else-branch: 14 | j@48@01 < |xs@44@01| | live]
(push) ; 11
; [then-branch: 14 | !(j@48@01 < |xs@44@01|)]
(assert (not (< j@48@01 (Seq_length xs@44@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 14 | j@48@01 < |xs@44@01|]
(assert (< j@48@01 (Seq_length xs@44@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@48@01 (Seq_length xs@44@01)) (not (< j@48@01 (Seq_length xs@44@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@48@01 0)
  (and
    (>= j@48@01 0)
    (or
      (< j@48@01 (Seq_length xs@44@01))
      (not (< j@48@01 (Seq_length xs@44@01)))))))
(assert (or (>= j@48@01 0) (not (>= j@48@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@47@01 (Seq_length xs@44@01))
  (and
    (< i@47@01 (Seq_length xs@44@01))
    (=>
      (>= j@48@01 0)
      (and
        (>= j@48@01 0)
        (or
          (< j@48@01 (Seq_length xs@44@01))
          (not (< j@48@01 (Seq_length xs@44@01))))))
    (or (>= j@48@01 0) (not (>= j@48@01 0))))))
(assert (or (< i@47@01 (Seq_length xs@44@01)) (not (< i@47@01 (Seq_length xs@44@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@47@01 0)
  (and
    (>= i@47@01 0)
    (=>
      (< i@47@01 (Seq_length xs@44@01))
      (and
        (< i@47@01 (Seq_length xs@44@01))
        (=>
          (>= j@48@01 0)
          (and
            (>= j@48@01 0)
            (or
              (< j@48@01 (Seq_length xs@44@01))
              (not (< j@48@01 (Seq_length xs@44@01))))))
        (or (>= j@48@01 0) (not (>= j@48@01 0)))))
    (or
      (< i@47@01 (Seq_length xs@44@01))
      (not (< i@47@01 (Seq_length xs@44@01)))))))
(assert (or (>= i@47@01 0) (not (>= i@47@01 0))))
(push) ; 4
; [then-branch: 15 | i@47@01 >= 0 && i@47@01 < |xs@44@01| && j@48@01 >= 0 && j@48@01 < |xs@44@01| && i@47@01 != j@48@01 | live]
; [else-branch: 15 | !(i@47@01 >= 0 && i@47@01 < |xs@44@01| && j@48@01 >= 0 && j@48@01 < |xs@44@01| && i@47@01 != j@48@01) | live]
(push) ; 5
; [then-branch: 15 | i@47@01 >= 0 && i@47@01 < |xs@44@01| && j@48@01 >= 0 && j@48@01 < |xs@44@01| && i@47@01 != j@48@01]
(assert (and
  (>= i@47@01 0)
  (and
    (< i@47@01 (Seq_length xs@44@01))
    (and
      (>= j@48@01 0)
      (and (< j@48@01 (Seq_length xs@44@01)) (not (= i@47@01 j@48@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(i@47@01 >= 0 && i@47@01 < |xs@44@01| && j@48@01 >= 0 && j@48@01 < |xs@44@01| && i@47@01 != j@48@01)]
(assert (not
  (and
    (>= i@47@01 0)
    (and
      (< i@47@01 (Seq_length xs@44@01))
      (and
        (>= j@48@01 0)
        (and (< j@48@01 (Seq_length xs@44@01)) (not (= i@47@01 j@48@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@47@01 0)
    (and
      (< i@47@01 (Seq_length xs@44@01))
      (and
        (>= j@48@01 0)
        (and (< j@48@01 (Seq_length xs@44@01)) (not (= i@47@01 j@48@01))))))
  (and
    (>= i@47@01 0)
    (< i@47@01 (Seq_length xs@44@01))
    (>= j@48@01 0)
    (< j@48@01 (Seq_length xs@44@01))
    (not (= i@47@01 j@48@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@47@01 0)
      (and
        (< i@47@01 (Seq_length xs@44@01))
        (and
          (>= j@48@01 0)
          (and (< j@48@01 (Seq_length xs@44@01)) (not (= i@47@01 j@48@01)))))))
  (and
    (>= i@47@01 0)
    (and
      (< i@47@01 (Seq_length xs@44@01))
      (and
        (>= j@48@01 0)
        (and (< j@48@01 (Seq_length xs@44@01)) (not (= i@47@01 j@48@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@47@01 Int) (j@48@01 Int)) (!
  (and
    (=>
      (>= i@47@01 0)
      (and
        (>= i@47@01 0)
        (=>
          (< i@47@01 (Seq_length xs@44@01))
          (and
            (< i@47@01 (Seq_length xs@44@01))
            (=>
              (>= j@48@01 0)
              (and
                (>= j@48@01 0)
                (or
                  (< j@48@01 (Seq_length xs@44@01))
                  (not (< j@48@01 (Seq_length xs@44@01))))))
            (or (>= j@48@01 0) (not (>= j@48@01 0)))))
        (or
          (< i@47@01 (Seq_length xs@44@01))
          (not (< i@47@01 (Seq_length xs@44@01))))))
    (or (>= i@47@01 0) (not (>= i@47@01 0)))
    (=>
      (and
        (>= i@47@01 0)
        (and
          (< i@47@01 (Seq_length xs@44@01))
          (and
            (>= j@48@01 0)
            (and (< j@48@01 (Seq_length xs@44@01)) (not (= i@47@01 j@48@01))))))
      (and
        (>= i@47@01 0)
        (< i@47@01 (Seq_length xs@44@01))
        (>= j@48@01 0)
        (< j@48@01 (Seq_length xs@44@01))
        (not (= i@47@01 j@48@01))))
    (or
      (not
        (and
          (>= i@47@01 0)
          (and
            (< i@47@01 (Seq_length xs@44@01))
            (and
              (>= j@48@01 0)
              (and (< j@48@01 (Seq_length xs@44@01)) (not (= i@47@01 j@48@01)))))))
      (and
        (>= i@47@01 0)
        (and
          (< i@47@01 (Seq_length xs@44@01))
          (and
            (>= j@48@01 0)
            (and (< j@48@01 (Seq_length xs@44@01)) (not (= i@47@01 j@48@01))))))))
  :pattern ((Seq_index xs@44@01 i@47@01) (Seq_index xs@44@01 j@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@44@10@44@102-aux|)))
(assert (forall ((i@47@01 Int) (j@48@01 Int)) (!
  (=>
    (and
      (>= i@47@01 0)
      (and
        (< i@47@01 (Seq_length xs@44@01))
        (and
          (>= j@48@01 0)
          (and (< j@48@01 (Seq_length xs@44@01)) (not (= i@47@01 j@48@01))))))
    (not (= (Seq_index xs@44@01 i@47@01) (Seq_index xs@44@01 j@48@01))))
  :pattern ((Seq_index xs@44@01 i@47@01) (Seq_index xs@44@01 j@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@44@10@44@102|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { at1(xs, i) }
;     0 <= i && i < |xs| ==> acc(at1(xs, i).f, write))
(declare-const i@49@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 16 | !(0 <= i@49@01) | live]
; [else-branch: 16 | 0 <= i@49@01 | live]
(push) ; 5
; [then-branch: 16 | !(0 <= i@49@01)]
(assert (not (<= 0 i@49@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | 0 <= i@49@01]
(assert (<= 0 i@49@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@49@01) (not (<= 0 i@49@01))))
(assert (and (<= 0 i@49@01) (< i@49@01 (Seq_length xs@44@01))))
; [eval] at1(xs, i)
(push) ; 4
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))
(pop) ; 4
; Joined path conditions
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))
(pop) ; 3
(declare-const $t@50@01 $FVF<f>)
(declare-fun inv@51@01 ($Ref) Int)
(declare-fun img@52@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (Seq_length xs@44@01)))
    (and
      (or (<= 0 i@49@01) (not (<= 0 i@49@01)))
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01)))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((i1@49@01 Int) (i2@49@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@49@01) (< i1@49@01 (Seq_length xs@44@01)))
      (and (<= 0 i2@49@01) (< i2@49@01 (Seq_length xs@44@01))))
    (and
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i1@49@01)
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i2@49@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((i1@49@01 Int) (i2@49@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@49@01) (< i1@49@01 (Seq_length xs@44@01)))
      (and (<= 0 i2@49@01) (< i2@49@01 (Seq_length xs@44@01)))
      (=
        (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i1@49@01)
        (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i2@49@01)))
    (= i1@49@01 i2@49@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (Seq_length xs@44@01)))
    (and
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01)
      (=>
        (=
          (inv@51@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))
          i@49@01)
        (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))
  :qid |quant-u-40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@01 r)
      (and (<= 0 (inv@51@01 r)) (< (inv@51@01 r) (Seq_length xs@44@01))))
    (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 (inv@51@01 r)))
  :pattern ((inv@51@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (Seq_length xs@44@01)))
    (and
      (=
        (inv@51@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))
        i@49@01)
      (img@52@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))
  :qid |quant-u-40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@01 r)
      (and (<= 0 (inv@51@01 r)) (< (inv@51@01 r) (Seq_length xs@44@01))))
    (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 (inv@51@01 r)) r))
  :pattern ((inv@51@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (Seq_length xs@44@01)))
    (not
      (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01) $Ref.null)))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@49@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int ::
;     { at1(xs, i) }
;     { at2(i, xs) }
;     0 <= i && i < |xs| ==> at1(xs, i) == at2(i, xs))
; [eval] (forall i: Int :: { at1(xs, i) } { at2(i, xs) } 0 <= i && i < |xs| ==> at1(xs, i) == at2(i, xs))
(declare-const i@53@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs| ==> at1(xs, i) == at2(i, xs)
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 17 | !(0 <= i@53@01) | live]
; [else-branch: 17 | 0 <= i@53@01 | live]
(push) ; 5
; [then-branch: 17 | !(0 <= i@53@01)]
(assert (not (<= 0 i@53@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | 0 <= i@53@01]
(assert (<= 0 i@53@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@53@01) (not (<= 0 i@53@01))))
(push) ; 4
; [then-branch: 18 | 0 <= i@53@01 && i@53@01 < |xs@44@01| | live]
; [else-branch: 18 | !(0 <= i@53@01 && i@53@01 < |xs@44@01|) | live]
(push) ; 5
; [then-branch: 18 | 0 <= i@53@01 && i@53@01 < |xs@44@01|]
(assert (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01))))
; [eval] at1(xs, i) == at2(i, xs)
; [eval] at1(xs, i)
(push) ; 6
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01))
(pop) ; 6
; Joined path conditions
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01))
; [eval] at2(i, xs)
(push) ; 6
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01))
(pop) ; 6
; Joined path conditions
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(0 <= i@53@01 && i@53@01 < |xs@44@01|)]
(assert (not (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))
  (and
    (<= 0 i@53@01)
    (< i@53@01 (Seq_length xs@44@01))
    (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01)
    (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01))))
  (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@53@01 Int)) (!
  (and
    (or (<= 0 i@53@01) (not (<= 0 i@53@01)))
    (=>
      (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))
      (and
        (<= 0 i@53@01)
        (< i@53@01 (Seq_length xs@44@01))
        (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01)
        (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01)))
    (or
      (not (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01))))
      (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@48@10@48@74-aux|)))
(assert (forall ((i@53@01 Int)) (!
  (and
    (or (<= 0 i@53@01) (not (<= 0 i@53@01)))
    (=>
      (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))
      (and
        (<= 0 i@53@01)
        (< i@53@01 (Seq_length xs@44@01))
        (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01)
        (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01)))
    (or
      (not (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01))))
      (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@48@10@48@74-aux|)))
(assert (forall ((i@53@01 Int)) (!
  (=>
    (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))
    (and
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01)
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01)))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@48@10@48@74_precondition|)))
(push) ; 3
(assert (not (forall ((i@53@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))
        (and
          (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01)
          (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01)))
      (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01))))
    (=
      (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01)
      (at2 ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01)))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@48@10@48@74|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@53@01 Int)) (!
  (=>
    (and (<= 0 i@53@01) (< i@53@01 (Seq_length xs@44@01)))
    (=
      (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01)
      (at2 ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01)))
  :pattern ((at1%limited ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@53@01))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@53@01 xs@44@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@48@10@48@74|)))
; [exec]
; assert (forall i: Int ::
;     { at2(i, xs) }
;     0 <= i && i < |xs| ==> acc(at2(i, xs).f, write))
(declare-const i@54@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 19 | !(0 <= i@54@01) | live]
; [else-branch: 19 | 0 <= i@54@01 | live]
(push) ; 5
; [then-branch: 19 | !(0 <= i@54@01)]
(assert (not (<= 0 i@54@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | 0 <= i@54@01]
(assert (<= 0 i@54@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@54@01) (not (<= 0 i@54@01))))
(assert (and (<= 0 i@54@01) (< i@54@01 (Seq_length xs@44@01))))
; [eval] at2(i, xs)
(push) ; 4
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01))
(pop) ; 4
; Joined path conditions
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01))
(pop) ; 3
(declare-fun inv@55@01 ($Ref) Int)
(declare-fun img@56@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@54@01 Int)) (!
  (=>
    (and (<= 0 i@54@01) (< i@54@01 (Seq_length xs@44@01)))
    (and
      (or (<= 0 i@54@01) (not (<= 0 i@54@01)))
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01)))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((i1@54@01 Int) (i2@54@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@54@01) (< i1@54@01 (Seq_length xs@44@01)))
      (and (<= 0 i2@54@01) (< i2@54@01 (Seq_length xs@44@01))))
    (and
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i1@54@01 xs@44@01)
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i2@54@01 xs@44@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((i1@54@01 Int) (i2@54@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@54@01) (< i1@54@01 (Seq_length xs@44@01)))
      (and (<= 0 i2@54@01) (< i2@54@01 (Seq_length xs@44@01)))
      (=
        (at2 ($Snap.combine $Snap.unit $Snap.unit) i1@54@01 xs@44@01)
        (at2 ($Snap.combine $Snap.unit $Snap.unit) i2@54@01 xs@44@01)))
    (= i1@54@01 i2@54@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@54@01 Int)) (!
  (=>
    (and (<= 0 i@54@01) (< i@54@01 (Seq_length xs@44@01)))
    (and
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01)
      (=>
        (=
          (inv@55@01 (at2 ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01))
          i@54@01)
        (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01))))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (Seq_length xs@44@01))))
    (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) (inv@55@01 r) xs@44@01))
  :pattern ((inv@55@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@54@01 Int)) (!
  (=>
    (and (<= 0 i@54@01) (< i@54@01 (Seq_length xs@44@01)))
    (and
      (=
        (inv@55@01 (at2 ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01))
        i@54@01)
      (img@56@01 (at2 ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01))))
  :pattern ((at2%limited ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (Seq_length xs@44@01))))
    (= (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@55@01 r) xs@44@01) r))
  :pattern ((inv@55@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@54@01 Int)) (!
  (=
    (at2 ($Snap.combine $Snap.unit $Snap.unit) i@54@01 xs@44@01)
    (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@44@01 i@54@01))
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@57@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (Seq_length xs@44@01)))
      (img@56@01 r)
      (= r (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@55@01 r) xs@44@01)))
    ($Perm.min
      (ite
        (and
          (img@52@01 r)
          (and (<= 0 (inv@51@01 r)) (< (inv@51@01 r) (Seq_length xs@44@01))))
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
          (img@52@01 r)
          (and (<= 0 (inv@51@01 r)) (< (inv@51@01 r) (Seq_length xs@44@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@57@01 r))
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
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (Seq_length xs@44@01)))
      (img@56@01 r)
      (= r (at2 ($Snap.combine $Snap.unit $Snap.unit) (inv@55@01 r) xs@44@01)))
    (= (- $Perm.Write (pTaken@57@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@58@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@01 r)
      (and (<= 0 (inv@51@01 r)) (< (inv@51@01 r) (Seq_length xs@44@01))))
    (= ($FVF.lookup_f (as sm@58@01  $FVF<f>) r) ($FVF.lookup_f $t@50@01 r)))
  :pattern (($FVF.lookup_f (as sm@58@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@50@01 r))
  :qid |qp.fvfValDef3|)))
(pop) ; 2
(pop) ; 1
; ---------- test03a ----------
(declare-const xs@59@01 Seq<$Ref>)
(declare-const k@60@01 Int)
(declare-const xs@61@01 Seq<$Ref>)
(declare-const k@62@01 Int)
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
; inhale 0 <= k && k < |xs|
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 ($Snap.combine ($Snap.first $t@63@01) ($Snap.second $t@63@01))))
(assert (= ($Snap.first $t@63@01) $Snap.unit))
; [eval] 0 <= k
(assert (<= 0 k@62@01))
(assert (= ($Snap.second $t@63@01) $Snap.unit))
; [eval] k < |xs|
; [eval] |xs|
(assert (< k@62@01 (Seq_length xs@61@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@65@01 Int)
(declare-const j@66@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 20 | !(i@65@01 >= 0) | live]
; [else-branch: 20 | i@65@01 >= 0 | live]
(push) ; 5
; [then-branch: 20 | !(i@65@01 >= 0)]
(assert (not (>= i@65@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | i@65@01 >= 0]
(assert (>= i@65@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 21 | !(i@65@01 < |xs@61@01|) | live]
; [else-branch: 21 | i@65@01 < |xs@61@01| | live]
(push) ; 7
; [then-branch: 21 | !(i@65@01 < |xs@61@01|)]
(assert (not (< i@65@01 (Seq_length xs@61@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 21 | i@65@01 < |xs@61@01|]
(assert (< i@65@01 (Seq_length xs@61@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 22 | !(j@66@01 >= 0) | live]
; [else-branch: 22 | j@66@01 >= 0 | live]
(push) ; 9
; [then-branch: 22 | !(j@66@01 >= 0)]
(assert (not (>= j@66@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 22 | j@66@01 >= 0]
(assert (>= j@66@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 23 | !(j@66@01 < |xs@61@01|) | live]
; [else-branch: 23 | j@66@01 < |xs@61@01| | live]
(push) ; 11
; [then-branch: 23 | !(j@66@01 < |xs@61@01|)]
(assert (not (< j@66@01 (Seq_length xs@61@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 23 | j@66@01 < |xs@61@01|]
(assert (< j@66@01 (Seq_length xs@61@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@66@01 (Seq_length xs@61@01)) (not (< j@66@01 (Seq_length xs@61@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@66@01 0)
  (and
    (>= j@66@01 0)
    (or
      (< j@66@01 (Seq_length xs@61@01))
      (not (< j@66@01 (Seq_length xs@61@01)))))))
(assert (or (>= j@66@01 0) (not (>= j@66@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@65@01 (Seq_length xs@61@01))
  (and
    (< i@65@01 (Seq_length xs@61@01))
    (=>
      (>= j@66@01 0)
      (and
        (>= j@66@01 0)
        (or
          (< j@66@01 (Seq_length xs@61@01))
          (not (< j@66@01 (Seq_length xs@61@01))))))
    (or (>= j@66@01 0) (not (>= j@66@01 0))))))
(assert (or (< i@65@01 (Seq_length xs@61@01)) (not (< i@65@01 (Seq_length xs@61@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@65@01 0)
  (and
    (>= i@65@01 0)
    (=>
      (< i@65@01 (Seq_length xs@61@01))
      (and
        (< i@65@01 (Seq_length xs@61@01))
        (=>
          (>= j@66@01 0)
          (and
            (>= j@66@01 0)
            (or
              (< j@66@01 (Seq_length xs@61@01))
              (not (< j@66@01 (Seq_length xs@61@01))))))
        (or (>= j@66@01 0) (not (>= j@66@01 0)))))
    (or
      (< i@65@01 (Seq_length xs@61@01))
      (not (< i@65@01 (Seq_length xs@61@01)))))))
(assert (or (>= i@65@01 0) (not (>= i@65@01 0))))
(push) ; 4
; [then-branch: 24 | i@65@01 >= 0 && i@65@01 < |xs@61@01| && j@66@01 >= 0 && j@66@01 < |xs@61@01| && i@65@01 != j@66@01 | live]
; [else-branch: 24 | !(i@65@01 >= 0 && i@65@01 < |xs@61@01| && j@66@01 >= 0 && j@66@01 < |xs@61@01| && i@65@01 != j@66@01) | live]
(push) ; 5
; [then-branch: 24 | i@65@01 >= 0 && i@65@01 < |xs@61@01| && j@66@01 >= 0 && j@66@01 < |xs@61@01| && i@65@01 != j@66@01]
(assert (and
  (>= i@65@01 0)
  (and
    (< i@65@01 (Seq_length xs@61@01))
    (and
      (>= j@66@01 0)
      (and (< j@66@01 (Seq_length xs@61@01)) (not (= i@65@01 j@66@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 24 | !(i@65@01 >= 0 && i@65@01 < |xs@61@01| && j@66@01 >= 0 && j@66@01 < |xs@61@01| && i@65@01 != j@66@01)]
(assert (not
  (and
    (>= i@65@01 0)
    (and
      (< i@65@01 (Seq_length xs@61@01))
      (and
        (>= j@66@01 0)
        (and (< j@66@01 (Seq_length xs@61@01)) (not (= i@65@01 j@66@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@65@01 0)
    (and
      (< i@65@01 (Seq_length xs@61@01))
      (and
        (>= j@66@01 0)
        (and (< j@66@01 (Seq_length xs@61@01)) (not (= i@65@01 j@66@01))))))
  (and
    (>= i@65@01 0)
    (< i@65@01 (Seq_length xs@61@01))
    (>= j@66@01 0)
    (< j@66@01 (Seq_length xs@61@01))
    (not (= i@65@01 j@66@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@65@01 0)
      (and
        (< i@65@01 (Seq_length xs@61@01))
        (and
          (>= j@66@01 0)
          (and (< j@66@01 (Seq_length xs@61@01)) (not (= i@65@01 j@66@01)))))))
  (and
    (>= i@65@01 0)
    (and
      (< i@65@01 (Seq_length xs@61@01))
      (and
        (>= j@66@01 0)
        (and (< j@66@01 (Seq_length xs@61@01)) (not (= i@65@01 j@66@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (and
    (=>
      (>= i@65@01 0)
      (and
        (>= i@65@01 0)
        (=>
          (< i@65@01 (Seq_length xs@61@01))
          (and
            (< i@65@01 (Seq_length xs@61@01))
            (=>
              (>= j@66@01 0)
              (and
                (>= j@66@01 0)
                (or
                  (< j@66@01 (Seq_length xs@61@01))
                  (not (< j@66@01 (Seq_length xs@61@01))))))
            (or (>= j@66@01 0) (not (>= j@66@01 0)))))
        (or
          (< i@65@01 (Seq_length xs@61@01))
          (not (< i@65@01 (Seq_length xs@61@01))))))
    (or (>= i@65@01 0) (not (>= i@65@01 0)))
    (=>
      (and
        (>= i@65@01 0)
        (and
          (< i@65@01 (Seq_length xs@61@01))
          (and
            (>= j@66@01 0)
            (and (< j@66@01 (Seq_length xs@61@01)) (not (= i@65@01 j@66@01))))))
      (and
        (>= i@65@01 0)
        (< i@65@01 (Seq_length xs@61@01))
        (>= j@66@01 0)
        (< j@66@01 (Seq_length xs@61@01))
        (not (= i@65@01 j@66@01))))
    (or
      (not
        (and
          (>= i@65@01 0)
          (and
            (< i@65@01 (Seq_length xs@61@01))
            (and
              (>= j@66@01 0)
              (and (< j@66@01 (Seq_length xs@61@01)) (not (= i@65@01 j@66@01)))))))
      (and
        (>= i@65@01 0)
        (and
          (< i@65@01 (Seq_length xs@61@01))
          (and
            (>= j@66@01 0)
            (and (< j@66@01 (Seq_length xs@61@01)) (not (= i@65@01 j@66@01))))))))
  :pattern ((Seq_index xs@61@01 i@65@01) (Seq_index xs@61@01 j@66@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@55@10@55@102-aux|)))
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (=>
    (and
      (>= i@65@01 0)
      (and
        (< i@65@01 (Seq_length xs@61@01))
        (and
          (>= j@66@01 0)
          (and (< j@66@01 (Seq_length xs@61@01)) (not (= i@65@01 j@66@01))))))
    (not (= (Seq_index xs@61@01 i@65@01) (Seq_index xs@61@01 j@66@01))))
  :pattern ((Seq_index xs@61@01 i@65@01) (Seq_index xs@61@01 j@66@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@55@10@55@102|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { at2(i, xs) }
;     0 <= i && i < |xs| ==> acc(at1(xs, i).f, write))
(declare-const i@67@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 25 | !(0 <= i@67@01) | live]
; [else-branch: 25 | 0 <= i@67@01 | live]
(push) ; 5
; [then-branch: 25 | !(0 <= i@67@01)]
(assert (not (<= 0 i@67@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | 0 <= i@67@01]
(assert (<= 0 i@67@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@67@01) (not (<= 0 i@67@01))))
(assert (and (<= 0 i@67@01) (< i@67@01 (Seq_length xs@61@01))))
; [eval] at1(xs, i)
(push) ; 4
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i@67@01))
(pop) ; 4
; Joined path conditions
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i@67@01))
; [eval] at2(i, xs)
(push) ; 4
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@67@01 xs@61@01))
(pop) ; 4
; Joined path conditions
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@67@01 xs@61@01))
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@67@01 xs@61@01))
(pop) ; 3
(declare-const $t@68@01 $FVF<f>)
(declare-fun inv@69@01 ($Ref) Int)
(declare-fun img@70@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@67@01 Int)) (!
  (=>
    (and (<= 0 i@67@01) (< i@67@01 (Seq_length xs@61@01)))
    (and
      (or (<= 0 i@67@01) (not (<= 0 i@67@01)))
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i@67@01)
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@67@01 xs@61@01)))
  :pattern ((at2 ($Snap.combine $Snap.unit $Snap.unit) i@67@01 xs@61@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((i1@67@01 Int) (i2@67@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@67@01) (< i1@67@01 (Seq_length xs@61@01)))
      (and (<= 0 i2@67@01) (< i2@67@01 (Seq_length xs@61@01))))
    (and
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i1@67@01)
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i2@67@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((i1@67@01 Int) (i2@67@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@67@01) (< i1@67@01 (Seq_length xs@61@01)))
      (and (<= 0 i2@67@01) (< i2@67@01 (Seq_length xs@61@01)))
      (=
        (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i1@67@01)
        (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i2@67@01)))
    (= i1@67@01 i2@67@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@67@01 Int)) (!
  (=>
    (and (<= 0 i@67@01) (< i@67@01 (Seq_length xs@61@01)))
    (and
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i@67@01)
      (=>
        (=
          (inv@69@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i@67@01))
          i@67@01)
        (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i@67@01))))
  :pattern ((at2 ($Snap.combine $Snap.unit $Snap.unit) i@67@01 xs@61@01))
  :qid |quant-u-47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@01 r)
      (and (<= 0 (inv@69@01 r)) (< (inv@69@01 r) (Seq_length xs@61@01))))
    (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 (inv@69@01 r)))
  :pattern ((inv@69@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@67@01 Int)) (!
  (=>
    (and (<= 0 i@67@01) (< i@67@01 (Seq_length xs@61@01)))
    (and
      (=
        (inv@69@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i@67@01))
        i@67@01)
      (img@70@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i@67@01))))
  :pattern ((at2 ($Snap.combine $Snap.unit $Snap.unit) i@67@01 xs@61@01))
  :qid |quant-u-47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@01 r)
      (and (<= 0 (inv@69@01 r)) (< (inv@69@01 r) (Seq_length xs@61@01))))
    (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 (inv@69@01 r)) r))
  :pattern ((inv@69@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@67@01 Int)) (!
  (=>
    (and (<= 0 i@67@01) (< i@67@01 (Seq_length xs@61@01)))
    (not
      (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 i@67@01) $Ref.null)))
  :pattern ((at2 ($Snap.combine $Snap.unit $Snap.unit) i@67@01 xs@61@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert at1(xs, k) != null
; [eval] at1(xs, k) != null
; [eval] at1(xs, k)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 k@62@01))
(pop) ; 3
; Joined path conditions
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 k@62@01))
(push) ; 3
(assert (not (not (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 k@62@01) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@71@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@01 r)
      (and (<= 0 (inv@69@01 r)) (< (inv@69@01 r) (Seq_length xs@61@01))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@68@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@68@01 r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@72@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@72@01  $FPM) r)
    (ite
      (and
        (img@70@01 r)
        (and (<= 0 (inv@69@01 r)) (< (inv@69@01 r) (Seq_length xs@61@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
  :pattern ((inv@69@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] at1(xs, k) != null
; [eval] at1(xs, k)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (not (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 k@62@01) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@73@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@01 r)
      (and (<= 0 (inv@69@01 r)) (< (inv@69@01 r) (Seq_length xs@61@01))))
    (= ($FVF.lookup_f (as sm@73@01  $FVF<f>) r) ($FVF.lookup_f $t@68@01 r)))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@68@01 r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@74@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@74@01  $FPM) r)
    (ite
      (and
        (img@70@01 r)
        (and (<= 0 (inv@69@01 r)) (< (inv@69@01 r) (Seq_length xs@61@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@74@01  $FPM) r) $Perm.Write)
  :pattern ((inv@69@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] at1(xs, k) != null
; [eval] at1(xs, k)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (not (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 k@62@01) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] at1(xs, k) != null
; [eval] at1(xs, k)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (not (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@61@01 k@62@01) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03b ----------
(declare-const xs@75@01 Seq<$Ref>)
(declare-const k@76@01 Int)
(declare-const xs@77@01 Seq<$Ref>)
(declare-const k@78@01 Int)
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
; inhale 0 <= k && k < |xs|
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 ($Snap.combine ($Snap.first $t@79@01) ($Snap.second $t@79@01))))
(assert (= ($Snap.first $t@79@01) $Snap.unit))
; [eval] 0 <= k
(assert (<= 0 k@78@01))
(assert (= ($Snap.second $t@79@01) $Snap.unit))
; [eval] k < |xs|
; [eval] |xs|
(assert (< k@78@01 (Seq_length xs@77@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@80@01 $Snap)
(assert (= $t@80@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@81@01 Int)
(declare-const j@82@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 26 | !(i@81@01 >= 0) | live]
; [else-branch: 26 | i@81@01 >= 0 | live]
(push) ; 5
; [then-branch: 26 | !(i@81@01 >= 0)]
(assert (not (>= i@81@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | i@81@01 >= 0]
(assert (>= i@81@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 27 | !(i@81@01 < |xs@77@01|) | live]
; [else-branch: 27 | i@81@01 < |xs@77@01| | live]
(push) ; 7
; [then-branch: 27 | !(i@81@01 < |xs@77@01|)]
(assert (not (< i@81@01 (Seq_length xs@77@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 27 | i@81@01 < |xs@77@01|]
(assert (< i@81@01 (Seq_length xs@77@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 28 | !(j@82@01 >= 0) | live]
; [else-branch: 28 | j@82@01 >= 0 | live]
(push) ; 9
; [then-branch: 28 | !(j@82@01 >= 0)]
(assert (not (>= j@82@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 28 | j@82@01 >= 0]
(assert (>= j@82@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 29 | !(j@82@01 < |xs@77@01|) | live]
; [else-branch: 29 | j@82@01 < |xs@77@01| | live]
(push) ; 11
; [then-branch: 29 | !(j@82@01 < |xs@77@01|)]
(assert (not (< j@82@01 (Seq_length xs@77@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 29 | j@82@01 < |xs@77@01|]
(assert (< j@82@01 (Seq_length xs@77@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@82@01 (Seq_length xs@77@01)) (not (< j@82@01 (Seq_length xs@77@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@82@01 0)
  (and
    (>= j@82@01 0)
    (or
      (< j@82@01 (Seq_length xs@77@01))
      (not (< j@82@01 (Seq_length xs@77@01)))))))
(assert (or (>= j@82@01 0) (not (>= j@82@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@81@01 (Seq_length xs@77@01))
  (and
    (< i@81@01 (Seq_length xs@77@01))
    (=>
      (>= j@82@01 0)
      (and
        (>= j@82@01 0)
        (or
          (< j@82@01 (Seq_length xs@77@01))
          (not (< j@82@01 (Seq_length xs@77@01))))))
    (or (>= j@82@01 0) (not (>= j@82@01 0))))))
(assert (or (< i@81@01 (Seq_length xs@77@01)) (not (< i@81@01 (Seq_length xs@77@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@81@01 0)
  (and
    (>= i@81@01 0)
    (=>
      (< i@81@01 (Seq_length xs@77@01))
      (and
        (< i@81@01 (Seq_length xs@77@01))
        (=>
          (>= j@82@01 0)
          (and
            (>= j@82@01 0)
            (or
              (< j@82@01 (Seq_length xs@77@01))
              (not (< j@82@01 (Seq_length xs@77@01))))))
        (or (>= j@82@01 0) (not (>= j@82@01 0)))))
    (or
      (< i@81@01 (Seq_length xs@77@01))
      (not (< i@81@01 (Seq_length xs@77@01)))))))
(assert (or (>= i@81@01 0) (not (>= i@81@01 0))))
(push) ; 4
; [then-branch: 30 | i@81@01 >= 0 && i@81@01 < |xs@77@01| && j@82@01 >= 0 && j@82@01 < |xs@77@01| && i@81@01 != j@82@01 | live]
; [else-branch: 30 | !(i@81@01 >= 0 && i@81@01 < |xs@77@01| && j@82@01 >= 0 && j@82@01 < |xs@77@01| && i@81@01 != j@82@01) | live]
(push) ; 5
; [then-branch: 30 | i@81@01 >= 0 && i@81@01 < |xs@77@01| && j@82@01 >= 0 && j@82@01 < |xs@77@01| && i@81@01 != j@82@01]
(assert (and
  (>= i@81@01 0)
  (and
    (< i@81@01 (Seq_length xs@77@01))
    (and
      (>= j@82@01 0)
      (and (< j@82@01 (Seq_length xs@77@01)) (not (= i@81@01 j@82@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 30 | !(i@81@01 >= 0 && i@81@01 < |xs@77@01| && j@82@01 >= 0 && j@82@01 < |xs@77@01| && i@81@01 != j@82@01)]
(assert (not
  (and
    (>= i@81@01 0)
    (and
      (< i@81@01 (Seq_length xs@77@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length xs@77@01)) (not (= i@81@01 j@82@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@81@01 0)
    (and
      (< i@81@01 (Seq_length xs@77@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length xs@77@01)) (not (= i@81@01 j@82@01))))))
  (and
    (>= i@81@01 0)
    (< i@81@01 (Seq_length xs@77@01))
    (>= j@82@01 0)
    (< j@82@01 (Seq_length xs@77@01))
    (not (= i@81@01 j@82@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length xs@77@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length xs@77@01)) (not (= i@81@01 j@82@01)))))))
  (and
    (>= i@81@01 0)
    (and
      (< i@81@01 (Seq_length xs@77@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length xs@77@01)) (not (= i@81@01 j@82@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (and
    (=>
      (>= i@81@01 0)
      (and
        (>= i@81@01 0)
        (=>
          (< i@81@01 (Seq_length xs@77@01))
          (and
            (< i@81@01 (Seq_length xs@77@01))
            (=>
              (>= j@82@01 0)
              (and
                (>= j@82@01 0)
                (or
                  (< j@82@01 (Seq_length xs@77@01))
                  (not (< j@82@01 (Seq_length xs@77@01))))))
            (or (>= j@82@01 0) (not (>= j@82@01 0)))))
        (or
          (< i@81@01 (Seq_length xs@77@01))
          (not (< i@81@01 (Seq_length xs@77@01))))))
    (or (>= i@81@01 0) (not (>= i@81@01 0)))
    (=>
      (and
        (>= i@81@01 0)
        (and
          (< i@81@01 (Seq_length xs@77@01))
          (and
            (>= j@82@01 0)
            (and (< j@82@01 (Seq_length xs@77@01)) (not (= i@81@01 j@82@01))))))
      (and
        (>= i@81@01 0)
        (< i@81@01 (Seq_length xs@77@01))
        (>= j@82@01 0)
        (< j@82@01 (Seq_length xs@77@01))
        (not (= i@81@01 j@82@01))))
    (or
      (not
        (and
          (>= i@81@01 0)
          (and
            (< i@81@01 (Seq_length xs@77@01))
            (and
              (>= j@82@01 0)
              (and (< j@82@01 (Seq_length xs@77@01)) (not (= i@81@01 j@82@01)))))))
      (and
        (>= i@81@01 0)
        (and
          (< i@81@01 (Seq_length xs@77@01))
          (and
            (>= j@82@01 0)
            (and (< j@82@01 (Seq_length xs@77@01)) (not (= i@81@01 j@82@01))))))))
  :pattern ((Seq_index xs@77@01 i@81@01) (Seq_index xs@77@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@64@10@64@102-aux|)))
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (=>
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length xs@77@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length xs@77@01)) (not (= i@81@01 j@82@01))))))
    (not (= (Seq_index xs@77@01 i@81@01) (Seq_index xs@77@01 j@82@01))))
  :pattern ((Seq_index xs@77@01 i@81@01) (Seq_index xs@77@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0282.vpr@64@10@64@102|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { at2(i, xs) }
;     0 <= i && i < |xs| ==> acc(at1(xs, i).f, write))
(declare-const i@83@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 31 | !(0 <= i@83@01) | live]
; [else-branch: 31 | 0 <= i@83@01 | live]
(push) ; 5
; [then-branch: 31 | !(0 <= i@83@01)]
(assert (not (<= 0 i@83@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 31 | 0 <= i@83@01]
(assert (<= 0 i@83@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@83@01) (not (<= 0 i@83@01))))
(assert (and (<= 0 i@83@01) (< i@83@01 (Seq_length xs@77@01))))
; [eval] at1(xs, i)
(push) ; 4
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i@83@01))
(pop) ; 4
; Joined path conditions
(assert (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i@83@01))
; [eval] at2(i, xs)
(push) ; 4
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@83@01 xs@77@01))
(pop) ; 4
; Joined path conditions
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@83@01 xs@77@01))
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@83@01 xs@77@01))
(pop) ; 3
(declare-const $t@84@01 $FVF<f>)
(declare-fun inv@85@01 ($Ref) Int)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and (<= 0 i@83@01) (< i@83@01 (Seq_length xs@77@01)))
    (and
      (or (<= 0 i@83@01) (not (<= 0 i@83@01)))
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i@83@01)
      (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) i@83@01 xs@77@01)))
  :pattern ((at2 ($Snap.combine $Snap.unit $Snap.unit) i@83@01 xs@77@01))
  :qid |f-aux|)))
; Check receiver injectivity
(assert (forall ((i1@83@01 Int) (i2@83@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@83@01) (< i1@83@01 (Seq_length xs@77@01)))
      (and (<= 0 i2@83@01) (< i2@83@01 (Seq_length xs@77@01))))
    (and
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i1@83@01)
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i2@83@01)))
  
  :qid |f-rcvrInj|)))
(push) ; 3
(assert (not (forall ((i1@83@01 Int) (i2@83@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@83@01) (< i1@83@01 (Seq_length xs@77@01)))
      (and (<= 0 i2@83@01) (< i2@83@01 (Seq_length xs@77@01)))
      (=
        (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i1@83@01)
        (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i2@83@01)))
    (= i1@83@01 i2@83@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and (<= 0 i@83@01) (< i@83@01 (Seq_length xs@77@01)))
    (and
      (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i@83@01)
      (=>
        (=
          (inv@85@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i@83@01))
          i@83@01)
        (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i@83@01))))
  :pattern ((at2 ($Snap.combine $Snap.unit $Snap.unit) i@83@01 xs@77@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (Seq_length xs@77@01))))
    (at1%precondition ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 (inv@85@01 r)))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and (<= 0 i@83@01) (< i@83@01 (Seq_length xs@77@01)))
    (and
      (=
        (inv@85@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i@83@01))
        i@83@01)
      (img@86@01 (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i@83@01))))
  :pattern ((at2 ($Snap.combine $Snap.unit $Snap.unit) i@83@01 xs@77@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) (Seq_length xs@77@01))))
    (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 (inv@85@01 r)) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and (<= 0 i@83@01) (< i@83@01 (Seq_length xs@77@01)))
    (not
      (= (at1 ($Snap.combine $Snap.unit $Snap.unit) xs@77@01 i@83@01) $Ref.null)))
  :pattern ((at2 ($Snap.combine $Snap.unit $Snap.unit) i@83@01 xs@77@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert at2(k, xs) != null
; [eval] at2(k, xs) != null
; [eval] at2(k, xs)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) k@78@01 xs@77@01))
(pop) ; 3
; Joined path conditions
(assert (at2%precondition ($Snap.combine $Snap.unit $Snap.unit) k@78@01 xs@77@01))
(push) ; 3
(assert (not (not (= (at2 ($Snap.combine $Snap.unit $Snap.unit) k@78@01 xs@77@01) $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (at2 ($Snap.combine $Snap.unit $Snap.unit) k@78@01 xs@77@01) $Ref.null)))
(pop) ; 2
(pop) ; 1
