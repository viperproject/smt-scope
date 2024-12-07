(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0271.vpr
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
(declare-sort $PSF<P> 0)
(declare-sort $PSF<someList> 0)
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
(declare-fun $SortWrappers.$PSF<someList>To$Snap ($PSF<someList>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<someList> ($Snap) $PSF<someList>)
(assert (forall ((x $PSF<someList>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<someList>($SortWrappers.$PSF<someList>To$Snap x)))
    :pattern (($SortWrappers.$PSF<someList>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<someList>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<someList>To$Snap($SortWrappers.$SnapTo$PSF<someList> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<someList> x))
    :qid |$Snap.$PSF<someList>To$SnapTo$PSF<someList>|
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
; /predicate_snap_functions_declarations.smt2 [P: Snap]
(declare-fun $PSF.domain_P ($PSF<P>) Set<$Snap>)
(declare-fun $PSF.lookup_P ($PSF<P> $Snap) $Snap)
(declare-fun $PSF.after_P ($PSF<P> $PSF<P>) Bool)
(declare-fun $PSF.loc_P ($Snap $Snap) Bool)
(declare-fun $PSF.perm_P ($PPM $Snap) $Perm)
(declare-const $psfTOP_P $PSF<P>)
; /predicate_snap_functions_declarations.smt2 [someList: Snap]
(declare-fun $PSF.domain_someList ($PSF<someList>) Set<$Snap>)
(declare-fun $PSF.lookup_someList ($PSF<someList> $Snap) $Snap)
(declare-fun $PSF.after_someList ($PSF<someList> $PSF<someList>) Bool)
(declare-fun $PSF.loc_someList ($Snap $Snap) Bool)
(declare-fun $PSF.perm_someList ($PPM $Snap) $Perm)
(declare-const $psfTOP_someList $PSF<someList>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun someFun ($Snap $Ref) Int)
(declare-fun someFun%limited ($Snap $Ref) Int)
(declare-fun someFun%stateless ($Ref) Bool)
(declare-fun someFun%precondition ($Snap $Ref) Bool)
(declare-fun listLength ($Snap $Ref $Ref Int) Int)
(declare-fun listLength%limited ($Snap $Ref $Ref Int) Int)
(declare-fun listLength%stateless ($Ref $Ref Int) Bool)
(declare-fun listLength%precondition ($Snap $Ref $Ref Int) Bool)
(declare-fun foo ($Snap Seq<$Ref>) Bool)
(declare-fun foo%limited ($Snap Seq<$Ref>) Bool)
(declare-fun foo%stateless (Seq<$Ref>) Bool)
(declare-fun foo%precondition ($Snap Seq<$Ref>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
(declare-fun someList%trigger ($Snap $Ref Int) Bool)
(declare-fun otherList%trigger ($Snap $Ref) Bool)
(declare-fun list%trigger ($Snap $Ref) Bool)
(declare-fun list2%trigger ($Snap $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [someList: Snap]
(assert (forall ((vs $PSF<someList>) (ws $PSF<someList>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_someList vs) ($PSF.domain_someList ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_someList vs))
            (= ($PSF.lookup_someList vs x) ($PSF.lookup_someList ws x)))
          :pattern (($PSF.lookup_someList vs x) ($PSF.lookup_someList ws x))
          :qid |qp.$PSF<someList>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<someList>To$Snap vs)
              ($SortWrappers.$PSF<someList>To$Snap ws)
              )
    :qid |qp.$PSF<someList>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_someList pm s))
    :pattern (($PSF.perm_someList pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_someList f s) true)
    :pattern (($PSF.loc_someList f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@9@00 ($Snap $Ref $Ref Int) Int)
(declare-fun img@10@00 ($Snap $Ref $Ref Int) Bool)
(declare-fun inv@17@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@18@00 ($Snap Seq<$Ref> $Ref) Bool)
(assert (forall ((s@$ $Snap) (l@0@00 $Ref)) (!
  (= (someFun%limited s@$ l@0@00) (someFun s@$ l@0@00))
  :pattern ((someFun s@$ l@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (l@0@00 $Ref)) (!
  (someFun%stateless l@0@00)
  :pattern ((someFun%limited s@$ l@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (l@0@00 $Ref)) (!
  (and
    (forall ((i@8@00 Int)) (!
      (and
        (= (inv@9@00 s@$ l@0@00 l@0@00 i@8@00) i@8@00)
        (img@10@00 s@$ l@0@00 l@0@00 i@8@00))
      :pattern ((inv@9@00 s@$ l@0@00 l@0@00 i@8@00))
      :pattern ((img@10@00 s@$ l@0@00 l@0@00 i@8@00))
      :qid |quant-u-7|))
    (forall ((this $Ref) (i Int)) (!
      (=>
        (img@10@00 s@$ l@0@00 this i)
        (and (= l@0@00 this) (= (inv@9@00 s@$ l@0@00 this i) i)))
      :pattern ((inv@9@00 s@$ l@0@00 this i))
      :qid |someList-fctOfInv|))
    (=>
      (someFun%precondition s@$ l@0@00)
      (=
        (someFun s@$ l@0@00)
        (+ 1 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))))
  :pattern ((someFun s@$ l@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (l@0@00 $Ref)) (!
  true
  :pattern ((someFun s@$ l@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (l1@2@00 $Ref) (l2@3@00 $Ref) (k@4@00 Int)) (!
  (=
    (listLength%limited s@$ l1@2@00 l2@3@00 k@4@00)
    (listLength s@$ l1@2@00 l2@3@00 k@4@00))
  :pattern ((listLength s@$ l1@2@00 l2@3@00 k@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (l1@2@00 $Ref) (l2@3@00 $Ref) (k@4@00 Int)) (!
  (listLength%stateless l1@2@00 l2@3@00 k@4@00)
  :pattern ((listLength%limited s@$ l1@2@00 l2@3@00 k@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (l1@2@00 $Ref) (l2@3@00 $Ref) (k@4@00 Int)) (!
  (let ((result@5@00 (listLength%limited s@$ l1@2@00 l2@3@00 k@4@00))) (=>
    (listLength%precondition s@$ l1@2@00 l2@3@00 k@4@00)
    (> result@5@00 0)))
  :pattern ((listLength%limited s@$ l1@2@00 l2@3@00 k@4@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (l1@2@00 $Ref) (l2@3@00 $Ref) (k@4@00 Int)) (!
  (let ((result@5@00 (listLength%limited s@$ l1@2@00 l2@3@00 k@4@00))) true)
  :pattern ((listLength%limited s@$ l1@2@00 l2@3@00 k@4@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (s@6@00 Seq<$Ref>)) (!
  (= (foo%limited s@$ s@6@00) (foo s@$ s@6@00))
  :pattern ((foo s@$ s@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (s@6@00 Seq<$Ref>)) (!
  (foo%stateless s@6@00)
  :pattern ((foo%limited s@$ s@6@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (s@6@00 Seq<$Ref>)) (!
  (and
    (forall ((i@16@00 Int)) (!
      (=>
        (and (<= 0 i@16@00) (< i@16@00 (Seq_length s@6@00)))
        (and
          (= (inv@17@00 s@$ s@6@00 (Seq_index s@6@00 i@16@00)) i@16@00)
          (img@18@00 s@$ s@6@00 (Seq_index s@6@00 i@16@00))))
      :pattern ((Seq_index s@6@00 i@16@00))
      :qid |quant-u-13|))
    (forall ((self $Ref)) (!
      (=>
        (and
          (img@18@00 s@$ s@6@00 self)
          (and
            (<= 0 (inv@17@00 s@$ s@6@00 self))
            (< (inv@17@00 s@$ s@6@00 self) (Seq_length s@6@00))))
        (= (Seq_index s@6@00 (inv@17@00 s@$ s@6@00 self)) self))
      :pattern ((inv@17@00 s@$ s@6@00 self))
      :qid |P-fctOfInv|))
    (=> (foo%precondition s@$ s@6@00) (= (foo s@$ s@6@00) true)))
  :pattern ((foo s@$ s@6@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (s@6@00 Seq<$Ref>)) (!
  true
  :pattern ((foo s@$ s@6@00))
  :qid |quant-u-15|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- clientFoo ----------
(declare-const s@0@01 Seq<$Ref>)
(declare-const s@1@01 Seq<$Ref>)
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
;     { s[i], s[j] }
;     i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j))) ==> s[i] != s[j])
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { s[i], s[j] } i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j))) ==> s[i] != s[j])
(declare-const i@3@01 Int)
(declare-const j@4@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j))) ==> s[i] != s[j]
; [eval] i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 0 | !(i@3@01 >= 0) | live]
; [else-branch: 0 | i@3@01 >= 0 | live]
(push) ; 5
; [then-branch: 0 | !(i@3@01 >= 0)]
(assert (not (>= i@3@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i@3@01 >= 0]
(assert (>= i@3@01 0))
; [eval] i < |s|
; [eval] |s|
(push) ; 6
; [then-branch: 1 | !(i@3@01 < |s@1@01|) | live]
; [else-branch: 1 | i@3@01 < |s@1@01| | live]
(push) ; 7
; [then-branch: 1 | !(i@3@01 < |s@1@01|)]
(assert (not (< i@3@01 (Seq_length s@1@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i@3@01 < |s@1@01|]
(assert (< i@3@01 (Seq_length s@1@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 2 | !(j@4@01 >= 0) | live]
; [else-branch: 2 | j@4@01 >= 0 | live]
(push) ; 9
; [then-branch: 2 | !(j@4@01 >= 0)]
(assert (not (>= j@4@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | j@4@01 >= 0]
(assert (>= j@4@01 0))
; [eval] j < |s|
; [eval] |s|
(push) ; 10
; [then-branch: 3 | !(j@4@01 < |s@1@01|) | live]
; [else-branch: 3 | j@4@01 < |s@1@01| | live]
(push) ; 11
; [then-branch: 3 | !(j@4@01 < |s@1@01|)]
(assert (not (< j@4@01 (Seq_length s@1@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | j@4@01 < |s@1@01|]
(assert (< j@4@01 (Seq_length s@1@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@4@01 (Seq_length s@1@01)) (not (< j@4@01 (Seq_length s@1@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@4@01 0)
  (and
    (>= j@4@01 0)
    (or (< j@4@01 (Seq_length s@1@01)) (not (< j@4@01 (Seq_length s@1@01)))))))
(assert (or (>= j@4@01 0) (not (>= j@4@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@3@01 (Seq_length s@1@01))
  (and
    (< i@3@01 (Seq_length s@1@01))
    (=>
      (>= j@4@01 0)
      (and
        (>= j@4@01 0)
        (or (< j@4@01 (Seq_length s@1@01)) (not (< j@4@01 (Seq_length s@1@01))))))
    (or (>= j@4@01 0) (not (>= j@4@01 0))))))
(assert (or (< i@3@01 (Seq_length s@1@01)) (not (< i@3@01 (Seq_length s@1@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@3@01 0)
  (and
    (>= i@3@01 0)
    (=>
      (< i@3@01 (Seq_length s@1@01))
      (and
        (< i@3@01 (Seq_length s@1@01))
        (=>
          (>= j@4@01 0)
          (and
            (>= j@4@01 0)
            (or
              (< j@4@01 (Seq_length s@1@01))
              (not (< j@4@01 (Seq_length s@1@01))))))
        (or (>= j@4@01 0) (not (>= j@4@01 0)))))
    (or (< i@3@01 (Seq_length s@1@01)) (not (< i@3@01 (Seq_length s@1@01)))))))
(assert (or (>= i@3@01 0) (not (>= i@3@01 0))))
(push) ; 4
; [then-branch: 4 | i@3@01 >= 0 && i@3@01 < |s@1@01| && j@4@01 >= 0 && j@4@01 < |s@1@01| && i@3@01 != j@4@01 | live]
; [else-branch: 4 | !(i@3@01 >= 0 && i@3@01 < |s@1@01| && j@4@01 >= 0 && j@4@01 < |s@1@01| && i@3@01 != j@4@01) | live]
(push) ; 5
; [then-branch: 4 | i@3@01 >= 0 && i@3@01 < |s@1@01| && j@4@01 >= 0 && j@4@01 < |s@1@01| && i@3@01 != j@4@01]
(assert (and
  (>= i@3@01 0)
  (and
    (< i@3@01 (Seq_length s@1@01))
    (and
      (>= j@4@01 0)
      (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01)))))))
; [eval] s[i] != s[j]
; [eval] s[i]
; [eval] s[j]
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@3@01 >= 0 && i@3@01 < |s@1@01| && j@4@01 >= 0 && j@4@01 < |s@1@01| && i@3@01 != j@4@01)]
(assert (not
  (and
    (>= i@3@01 0)
    (and
      (< i@3@01 (Seq_length s@1@01))
      (and
        (>= j@4@01 0)
        (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@3@01 0)
    (and
      (< i@3@01 (Seq_length s@1@01))
      (and
        (>= j@4@01 0)
        (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01))))))
  (and
    (>= i@3@01 0)
    (< i@3@01 (Seq_length s@1@01))
    (>= j@4@01 0)
    (< j@4@01 (Seq_length s@1@01))
    (not (= i@3@01 j@4@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@3@01 0)
      (and
        (< i@3@01 (Seq_length s@1@01))
        (and
          (>= j@4@01 0)
          (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01)))))))
  (and
    (>= i@3@01 0)
    (and
      (< i@3@01 (Seq_length s@1@01))
      (and
        (>= j@4@01 0)
        (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (>= i@3@01 0)
      (and
        (>= i@3@01 0)
        (=>
          (< i@3@01 (Seq_length s@1@01))
          (and
            (< i@3@01 (Seq_length s@1@01))
            (=>
              (>= j@4@01 0)
              (and
                (>= j@4@01 0)
                (or
                  (< j@4@01 (Seq_length s@1@01))
                  (not (< j@4@01 (Seq_length s@1@01))))))
            (or (>= j@4@01 0) (not (>= j@4@01 0)))))
        (or (< i@3@01 (Seq_length s@1@01)) (not (< i@3@01 (Seq_length s@1@01))))))
    (or (>= i@3@01 0) (not (>= i@3@01 0)))
    (=>
      (and
        (>= i@3@01 0)
        (and
          (< i@3@01 (Seq_length s@1@01))
          (and
            (>= j@4@01 0)
            (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01))))))
      (and
        (>= i@3@01 0)
        (< i@3@01 (Seq_length s@1@01))
        (>= j@4@01 0)
        (< j@4@01 (Seq_length s@1@01))
        (not (= i@3@01 j@4@01))))
    (or
      (not
        (and
          (>= i@3@01 0)
          (and
            (< i@3@01 (Seq_length s@1@01))
            (and
              (>= j@4@01 0)
              (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01)))))))
      (and
        (>= i@3@01 0)
        (and
          (< i@3@01 (Seq_length s@1@01))
          (and
            (>= j@4@01 0)
            (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01))))))))
  :pattern ((Seq_index s@1@01 i@3@01) (Seq_index s@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0271.vpr@11@9@11@97-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (=>
    (and
      (>= i@3@01 0)
      (and
        (< i@3@01 (Seq_length s@1@01))
        (and
          (>= j@4@01 0)
          (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01))))))
    (not (= (Seq_index s@1@01 i@3@01) (Seq_index s@1@01 j@4@01))))
  :pattern ((Seq_index s@1@01 i@3@01) (Seq_index s@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0271.vpr@11@9@11@97|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { s[i] }
;     0 <= i && i < |s| ==> acc(P(s[i]), write))
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |s|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | !(0 <= i@5@01) | live]
; [else-branch: 5 | 0 <= i@5@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= i@5@01)]
(assert (not (<= 0 i@5@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= i@5@01]
(assert (<= 0 i@5@01))
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
(assert (and (<= 0 i@5@01) (< i@5@01 (Seq_length s@1@01))))
; [eval] s[i]
(push) ; 4
(assert (not (>= i@5@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@6@01 $PSF<P>)
(declare-fun inv@7@01 ($Ref) Int)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 (Seq_length s@1@01)))
    (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
  :pattern ((Seq_index s@1@01 i@5@01))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@5@01 Int) (i2@5@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@5@01) (< i1@5@01 (Seq_length s@1@01)))
      (and (<= 0 i2@5@01) (< i2@5@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 i1@5@01) (Seq_index s@1@01 i2@5@01)))
    (= i1@5@01 i2@5@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 (Seq_length s@1@01)))
    (and
      (= (inv@7@01 (Seq_index s@1@01 i@5@01)) i@5@01)
      (img@8@01 (Seq_index s@1@01 i@5@01))))
  :pattern ((Seq_index s@1@01 i@5@01))
  :qid |quant-u-17|)))
(assert (forall ((self $Ref)) (!
  (=>
    (and
      (img@8@01 self)
      (and (<= 0 (inv@7@01 self)) (< (inv@7@01 self) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@7@01 self)) self))
  :pattern ((inv@7@01 self))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale foo(s)
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] foo(s)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j))) ==> s[i] != s[j])
(declare-const i@10@01 Int)
(declare-const j@11@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j))) ==> s[i] != s[j]
; [eval] i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 6 | !(i@10@01 >= 0) | live]
; [else-branch: 6 | i@10@01 >= 0 | live]
(push) ; 6
; [then-branch: 6 | !(i@10@01 >= 0)]
(assert (not (>= i@10@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | i@10@01 >= 0]
(assert (>= i@10@01 0))
; [eval] i < |s|
; [eval] |s|
(push) ; 7
; [then-branch: 7 | !(i@10@01 < |s@1@01|) | live]
; [else-branch: 7 | i@10@01 < |s@1@01| | live]
(push) ; 8
; [then-branch: 7 | !(i@10@01 < |s@1@01|)]
(assert (not (< i@10@01 (Seq_length s@1@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 7 | i@10@01 < |s@1@01|]
(assert (< i@10@01 (Seq_length s@1@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 8 | !(j@11@01 >= 0) | live]
; [else-branch: 8 | j@11@01 >= 0 | live]
(push) ; 10
; [then-branch: 8 | !(j@11@01 >= 0)]
(assert (not (>= j@11@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 8 | j@11@01 >= 0]
(assert (>= j@11@01 0))
; [eval] j < |s|
; [eval] |s|
(push) ; 11
; [then-branch: 9 | !(j@11@01 < |s@1@01|) | live]
; [else-branch: 9 | j@11@01 < |s@1@01| | live]
(push) ; 12
; [then-branch: 9 | !(j@11@01 < |s@1@01|)]
(assert (not (< j@11@01 (Seq_length s@1@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 9 | j@11@01 < |s@1@01|]
(assert (< j@11@01 (Seq_length s@1@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@11@01 (Seq_length s@1@01)) (not (< j@11@01 (Seq_length s@1@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@11@01 0)
  (and
    (>= j@11@01 0)
    (or (< j@11@01 (Seq_length s@1@01)) (not (< j@11@01 (Seq_length s@1@01)))))))
(assert (or (>= j@11@01 0) (not (>= j@11@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@10@01 (Seq_length s@1@01))
  (and
    (< i@10@01 (Seq_length s@1@01))
    (=>
      (>= j@11@01 0)
      (and
        (>= j@11@01 0)
        (or
          (< j@11@01 (Seq_length s@1@01))
          (not (< j@11@01 (Seq_length s@1@01))))))
    (or (>= j@11@01 0) (not (>= j@11@01 0))))))
(assert (or (< i@10@01 (Seq_length s@1@01)) (not (< i@10@01 (Seq_length s@1@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@10@01 0)
  (and
    (>= i@10@01 0)
    (=>
      (< i@10@01 (Seq_length s@1@01))
      (and
        (< i@10@01 (Seq_length s@1@01))
        (=>
          (>= j@11@01 0)
          (and
            (>= j@11@01 0)
            (or
              (< j@11@01 (Seq_length s@1@01))
              (not (< j@11@01 (Seq_length s@1@01))))))
        (or (>= j@11@01 0) (not (>= j@11@01 0)))))
    (or (< i@10@01 (Seq_length s@1@01)) (not (< i@10@01 (Seq_length s@1@01)))))))
(assert (or (>= i@10@01 0) (not (>= i@10@01 0))))
(push) ; 5
; [then-branch: 10 | i@10@01 >= 0 && i@10@01 < |s@1@01| && j@11@01 >= 0 && j@11@01 < |s@1@01| && i@10@01 != j@11@01 | live]
; [else-branch: 10 | !(i@10@01 >= 0 && i@10@01 < |s@1@01| && j@11@01 >= 0 && j@11@01 < |s@1@01| && i@10@01 != j@11@01) | live]
(push) ; 6
; [then-branch: 10 | i@10@01 >= 0 && i@10@01 < |s@1@01| && j@11@01 >= 0 && j@11@01 < |s@1@01| && i@10@01 != j@11@01]
(assert (and
  (>= i@10@01 0)
  (and
    (< i@10@01 (Seq_length s@1@01))
    (and
      (>= j@11@01 0)
      (and (< j@11@01 (Seq_length s@1@01)) (not (= i@10@01 j@11@01)))))))
; [eval] s[i] != s[j]
; [eval] s[i]
; [eval] s[j]
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(i@10@01 >= 0 && i@10@01 < |s@1@01| && j@11@01 >= 0 && j@11@01 < |s@1@01| && i@10@01 != j@11@01)]
(assert (not
  (and
    (>= i@10@01 0)
    (and
      (< i@10@01 (Seq_length s@1@01))
      (and
        (>= j@11@01 0)
        (and (< j@11@01 (Seq_length s@1@01)) (not (= i@10@01 j@11@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@10@01 0)
    (and
      (< i@10@01 (Seq_length s@1@01))
      (and
        (>= j@11@01 0)
        (and (< j@11@01 (Seq_length s@1@01)) (not (= i@10@01 j@11@01))))))
  (and
    (>= i@10@01 0)
    (< i@10@01 (Seq_length s@1@01))
    (>= j@11@01 0)
    (< j@11@01 (Seq_length s@1@01))
    (not (= i@10@01 j@11@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@10@01 0)
      (and
        (< i@10@01 (Seq_length s@1@01))
        (and
          (>= j@11@01 0)
          (and (< j@11@01 (Seq_length s@1@01)) (not (= i@10@01 j@11@01)))))))
  (and
    (>= i@10@01 0)
    (and
      (< i@10@01 (Seq_length s@1@01))
      (and
        (>= j@11@01 0)
        (and (< j@11@01 (Seq_length s@1@01)) (not (= i@10@01 j@11@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@10@01 Int) (j@11@01 Int)) (!
  (=>
    (and
      (>= i@10@01 0)
      (and
        (< i@10@01 (Seq_length s@1@01))
        (and
          (>= j@11@01 0)
          (and (< j@11@01 (Seq_length s@1@01)) (not (= i@10@01 j@11@01))))))
    (not (= (Seq_index s@1@01 i@10@01) (Seq_index s@1@01 j@11@01))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0271.vpr@4@11@4@99|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@10@01 Int) (j@11@01 Int)) (!
  (=>
    (and
      (>= i@10@01 0)
      (and
        (< i@10@01 (Seq_length s@1@01))
        (and
          (>= j@11@01 0)
          (and (< j@11@01 (Seq_length s@1@01)) (not (= i@10@01 j@11@01))))))
    (not (= (Seq_index s@1@01 i@10@01) (Seq_index s@1@01 j@11@01))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0271.vpr@4@11@4@99|)))
(declare-const i@12@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |s|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 11 | !(0 <= i@12@01) | live]
; [else-branch: 11 | 0 <= i@12@01 | live]
(push) ; 6
; [then-branch: 11 | !(0 <= i@12@01)]
(assert (not (<= 0 i@12@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | 0 <= i@12@01]
(assert (<= 0 i@12@01))
; [eval] i < |s|
; [eval] |s|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@12@01) (not (<= 0 i@12@01))))
(assert (and (<= 0 i@12@01) (< i@12@01 (Seq_length s@1@01))))
; [eval] s[i]
(push) ; 5
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@13@01 ($Ref) Int)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (<= 0 i@12@01) (< i@12@01 (Seq_length s@1@01)))
    (or (<= 0 i@12@01) (not (<= 0 i@12@01))))
  :pattern ((Seq_index s@1@01 i@12@01))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@12@01 Int) (i2@12@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@12@01) (< i1@12@01 (Seq_length s@1@01)))
      (and (<= 0 i2@12@01) (< i2@12@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 i1@12@01) (Seq_index s@1@01 i2@12@01)))
    (= i1@12@01 i2@12@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (<= 0 i@12@01) (< i@12@01 (Seq_length s@1@01)))
    (and
      (= (inv@13@01 (Seq_index s@1@01 i@12@01)) i@12@01)
      (img@14@01 (Seq_index s@1@01 i@12@01))))
  :pattern ((Seq_index s@1@01 i@12@01))
  :qid |P-invOfFct|)))
(assert (forall ((self $Ref)) (!
  (=>
    (and
      (img@14@01 self)
      (and (<= 0 (inv@13@01 self)) (< (inv@13@01 self) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@13@01 self)) self))
  :pattern ((inv@13@01 self))
  :qid |P-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@15@01 ((self $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@13@01 self)) (< (inv@13@01 self) (Seq_length s@1@01)))
      (img@14@01 self)
      (= self (Seq_index s@1@01 (inv@13@01 self))))
    ($Perm.min
      (ite
        (and
          (img@8@01 self)
          (and (<= 0 (inv@7@01 self)) (< (inv@7@01 self) (Seq_length s@1@01))))
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
(assert (not (forall ((self $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@8@01 self)
          (and (<= 0 (inv@7@01 self)) (< (inv@7@01 self) (Seq_length s@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@15@01 self))
    $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((self $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@13@01 self)) (< (inv@13@01 self) (Seq_length s@1@01)))
      (img@14@01 self)
      (= self (Seq_index s@1@01 (inv@13@01 self))))
    (= (- $Perm.Write (pTaken@15@01 self)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@16@01 $PSF<P>)
(declare-const s@17@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@17@01 $Snap)) (!
  (and
    (=>
      (Set_in s@17@01 ($PSF.domain_P (as sm@16@01  $PSF<P>)))
      (and
        (and
          (<= 0 (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
          (< (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)) (Seq_length s@1@01)))
        (img@14@01 ($SortWrappers.$SnapTo$Ref s@17@01))))
    (=>
      (and
        (and
          (<= 0 (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
          (< (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)) (Seq_length s@1@01)))
        (img@14@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
      (Set_in s@17@01 ($PSF.domain_P (as sm@16@01  $PSF<P>)))))
  :pattern ((Set_in s@17@01 ($PSF.domain_P (as sm@16@01  $PSF<P>))))
  :qid |qp.psmDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@17@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
          (< (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)) (Seq_length s@1@01)))
        (img@14@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
      (and
        (img@8@01 ($SortWrappers.$SnapTo$Ref s@17@01))
        (and
          (<= 0 (inv@7@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
          (< (inv@7@01 ($SortWrappers.$SnapTo$Ref s@17@01)) (Seq_length s@1@01)))))
    (and
      (not (= s@17@01 $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@16@01  $PSF<P>) s@17@01)
        ($PSF.lookup_P $t@6@01 s@17@01))))
  :pattern (($PSF.lookup_P (as sm@16@01  $PSF<P>) s@17@01))
  :pattern (($PSF.lookup_P $t@6@01 s@17@01))
  :qid |qp.psmValDef0|)))
(assert (foo%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$PSF<P>To$Snap (as sm@16@01  $PSF<P>))) s@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (<= 0 i@12@01) (< i@12@01 (Seq_length s@1@01)))
    (and
      (= (inv@13@01 (Seq_index s@1@01 i@12@01)) i@12@01)
      (img@14@01 (Seq_index s@1@01 i@12@01))))
  :pattern ((Seq_index s@1@01 i@12@01))
  :qid |P-invOfFct|)))
(assert (forall ((self $Ref)) (!
  (=>
    (and
      (img@14@01 self)
      (and (<= 0 (inv@13@01 self)) (< (inv@13@01 self) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@13@01 self)) self))
  :pattern ((inv@13@01 self))
  :qid |P-fctOfInv|)))
(assert (forall ((s@17@01 $Snap)) (!
  (and
    (=>
      (Set_in s@17@01 ($PSF.domain_P (as sm@16@01  $PSF<P>)))
      (and
        (and
          (<= 0 (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
          (< (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)) (Seq_length s@1@01)))
        (img@14@01 ($SortWrappers.$SnapTo$Ref s@17@01))))
    (=>
      (and
        (and
          (<= 0 (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
          (< (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)) (Seq_length s@1@01)))
        (img@14@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
      (Set_in s@17@01 ($PSF.domain_P (as sm@16@01  $PSF<P>)))))
  :pattern ((Set_in s@17@01 ($PSF.domain_P (as sm@16@01  $PSF<P>))))
  :qid |qp.psmDomDef1|)))
(assert (forall ((s@17@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
          (< (inv@13@01 ($SortWrappers.$SnapTo$Ref s@17@01)) (Seq_length s@1@01)))
        (img@14@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
      (and
        (img@8@01 ($SortWrappers.$SnapTo$Ref s@17@01))
        (and
          (<= 0 (inv@7@01 ($SortWrappers.$SnapTo$Ref s@17@01)))
          (< (inv@7@01 ($SortWrappers.$SnapTo$Ref s@17@01)) (Seq_length s@1@01)))))
    (and
      (not (= s@17@01 $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@16@01  $PSF<P>) s@17@01)
        ($PSF.lookup_P $t@6@01 s@17@01))))
  :pattern (($PSF.lookup_P (as sm@16@01  $PSF<P>) s@17@01))
  :pattern (($PSF.lookup_P $t@6@01 s@17@01))
  :qid |qp.psmValDef0|)))
(assert (and
  (forall ((i@10@01 Int) (j@11@01 Int)) (!
    (=>
      (and
        (>= i@10@01 0)
        (and
          (< i@10@01 (Seq_length s@1@01))
          (and
            (>= j@11@01 0)
            (and (< j@11@01 (Seq_length s@1@01)) (not (= i@10@01 j@11@01))))))
      (not (= (Seq_index s@1@01 i@10@01) (Seq_index s@1@01 j@11@01))))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0271.vpr@4@11@4@99|))
  (forall ((i@12@01 Int)) (!
    (=>
      (and (<= 0 i@12@01) (< i@12@01 (Seq_length s@1@01)))
      (or (<= 0 i@12@01) (not (<= 0 i@12@01))))
    :pattern ((Seq_index s@1@01 i@12@01))
    :qid |P-aux|))
  (foo%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$PSF<P>To$Snap (as sm@16@01  $PSF<P>))) s@1@01)))
(assert (foo ($Snap.combine
  $Snap.unit
  ($SortWrappers.$PSF<P>To$Snap (as sm@16@01  $PSF<P>))) s@1@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
