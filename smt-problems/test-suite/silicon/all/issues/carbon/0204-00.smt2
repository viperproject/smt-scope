(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:33
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0204.vpr
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
(declare-sort $FVF<next> 0)
(declare-sort $PSF<Node> 0)
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
(declare-fun $SortWrappers.$FVF<next>To$Snap ($FVF<next>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<next> ($Snap) $FVF<next>)
(assert (forall ((x $FVF<next>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<next>($SortWrappers.$FVF<next>To$Snap x)))
    :pattern (($SortWrappers.$FVF<next>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<next>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<next>To$Snap($SortWrappers.$SnapTo$FVF<next> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<next> x))
    :qid |$Snap.$FVF<next>To$SnapTo$FVF<next>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<Node>To$Snap ($PSF<Node>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<Node> ($Snap) $PSF<Node>)
(assert (forall ((x $PSF<Node>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<Node>($SortWrappers.$PSF<Node>To$Snap x)))
    :pattern (($SortWrappers.$PSF<Node>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<Node>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<Node>To$Snap($SortWrappers.$SnapTo$PSF<Node> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<Node> x))
    :qid |$Snap.$PSF<Node>To$SnapTo$PSF<Node>|
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
; /field_value_functions_declarations.smt2 [next: Ref]
(declare-fun $FVF.domain_next ($FVF<next>) Set<$Ref>)
(declare-fun $FVF.lookup_next ($FVF<next> $Ref) $Ref)
(declare-fun $FVF.after_next ($FVF<next> $FVF<next>) Bool)
(declare-fun $FVF.loc_next ($Ref $Ref) Bool)
(declare-fun $FVF.perm_next ($FPM $Ref) $Perm)
(declare-const $fvfTOP_next $FVF<next>)
; /predicate_snap_functions_declarations.smt2 [Node: Int]
(declare-fun $PSF.domain_Node ($PSF<Node>) Set<$Snap>)
(declare-fun $PSF.lookup_Node ($PSF<Node> $Snap) Int)
(declare-fun $PSF.after_Node ($PSF<Node> $PSF<Node>) Bool)
(declare-fun $PSF.loc_Node (Int $Snap) Bool)
(declare-fun $PSF.perm_Node ($PPM $Snap) $Perm)
(declare-const $psfTOP_Node $PSF<Node>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Node%trigger ($Snap $Ref) Bool)
(declare-fun GRAPH%trigger ($Snap Set<$Ref>) Bool)
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
; /field_value_functions_axioms.smt2 [next: Ref]
(assert (forall ((vs $FVF<next>) (ws $FVF<next>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_next vs) ($FVF.domain_next ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_next vs))
            (= ($FVF.lookup_next vs x) ($FVF.lookup_next ws x)))
          :pattern (($FVF.lookup_next vs x) ($FVF.lookup_next ws x))
          :qid |qp.$FVF<next>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<next>To$Snap vs)
              ($SortWrappers.$FVF<next>To$Snap ws)
              )
    :qid |qp.$FVF<next>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_next pm r))
    :pattern (($FVF.perm_next pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_next f r) true)
    :pattern (($FVF.loc_next f r)))))
; /predicate_snap_functions_axioms.smt2 [Node: Int]
(assert (forall ((vs $PSF<Node>) (ws $PSF<Node>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_Node vs) ($PSF.domain_Node ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_Node vs))
            (= ($PSF.lookup_Node vs x) ($PSF.lookup_Node ws x)))
          :pattern (($PSF.lookup_Node vs x) ($PSF.lookup_Node ws x))
          :qid |qp.$PSF<Node>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<Node>To$Snap vs)
              ($SortWrappers.$PSF<Node>To$Snap ws)
              )
    :qid |qp.$PSF<Node>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_Node pm s))
    :pattern (($PSF.perm_Node pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_Node f s) true)
    :pattern (($PSF.loc_Node f s)))))
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
; ---------- foo ----------
(declare-const s@0@01 Seq<$Ref>)
(declare-const s@1@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { s[i], s[j] } i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j))) ==> s[i] != s[j])
(declare-const i@3@01 Int)
(declare-const j@4@01 Int)
(push) ; 2
; [eval] i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j))) ==> s[i] != s[j]
; [eval] i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j)))
; [eval] i >= 0
(push) ; 3
; [then-branch: 0 | !(i@3@01 >= 0) | live]
; [else-branch: 0 | i@3@01 >= 0 | live]
(push) ; 4
; [then-branch: 0 | !(i@3@01 >= 0)]
(assert (not (>= i@3@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | i@3@01 >= 0]
(assert (>= i@3@01 0))
; [eval] i < |s|
; [eval] |s|
(push) ; 5
; [then-branch: 1 | !(i@3@01 < |s@1@01|) | live]
; [else-branch: 1 | i@3@01 < |s@1@01| | live]
(push) ; 6
; [then-branch: 1 | !(i@3@01 < |s@1@01|)]
(assert (not (< i@3@01 (Seq_length s@1@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i@3@01 < |s@1@01|]
(assert (< i@3@01 (Seq_length s@1@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 2 | !(j@4@01 >= 0) | live]
; [else-branch: 2 | j@4@01 >= 0 | live]
(push) ; 8
; [then-branch: 2 | !(j@4@01 >= 0)]
(assert (not (>= j@4@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | j@4@01 >= 0]
(assert (>= j@4@01 0))
; [eval] j < |s|
; [eval] |s|
(push) ; 9
; [then-branch: 3 | !(j@4@01 < |s@1@01|) | live]
; [else-branch: 3 | j@4@01 < |s@1@01| | live]
(push) ; 10
; [then-branch: 3 | !(j@4@01 < |s@1@01|)]
(assert (not (< j@4@01 (Seq_length s@1@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@4@01 < |s@1@01|]
(assert (< j@4@01 (Seq_length s@1@01)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@4@01 (Seq_length s@1@01)) (not (< j@4@01 (Seq_length s@1@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@4@01 0)
  (and
    (>= j@4@01 0)
    (or (< j@4@01 (Seq_length s@1@01)) (not (< j@4@01 (Seq_length s@1@01)))))))
(assert (or (>= j@4@01 0) (not (>= j@4@01 0))))
(pop) ; 6
(pop) ; 5
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
(pop) ; 4
(pop) ; 3
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
(push) ; 3
; [then-branch: 4 | i@3@01 >= 0 && i@3@01 < |s@1@01| && j@4@01 >= 0 && j@4@01 < |s@1@01| && i@3@01 != j@4@01 | live]
; [else-branch: 4 | !(i@3@01 >= 0 && i@3@01 < |s@1@01| && j@4@01 >= 0 && j@4@01 < |s@1@01| && i@3@01 != j@4@01) | live]
(push) ; 4
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
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(i@3@01 >= 0 && i@3@01 < |s@1@01| && j@4@01 >= 0 && j@4@01 < |s@1@01| && i@3@01 != j@4@01)]
(assert (not
  (and
    (>= i@3@01 0)
    (and
      (< i@3@01 (Seq_length s@1@01))
      (and
        (>= j@4@01 0)
        (and (< j@4@01 (Seq_length s@1@01)) (not (= i@3@01 j@4@01))))))))
(pop) ; 4
(pop) ; 3
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
(pop) ; 2
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
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@11@11@11@99-aux|)))
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
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@11@11@11@99|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(declare-const i@6@01 Int)
(push) ; 3
; [eval] i >= 0 && i < |s|
; [eval] i >= 0
(push) ; 4
; [then-branch: 5 | !(i@6@01 >= 0) | live]
; [else-branch: 5 | i@6@01 >= 0 | live]
(push) ; 5
; [then-branch: 5 | !(i@6@01 >= 0)]
(assert (not (>= i@6@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | i@6@01 >= 0]
(assert (>= i@6@01 0))
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= i@6@01 0) (not (>= i@6@01 0))))
(assert (and (>= i@6@01 0) (< i@6@01 (Seq_length s@1@01))))
; [eval] s[i]
(pop) ; 3
(declare-fun inv@7@01 ($Ref) Int)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@6@01 Int)) (!
  (=>
    (and (>= i@6@01 0) (< i@6@01 (Seq_length s@1@01)))
    (or (>= i@6@01 0) (not (>= i@6@01 0))))
  :pattern ((Seq_index s@1@01 i@6@01))
  :qid |Node-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@6@01 Int) (i2@6@01 Int)) (!
  (=>
    (and
      (and (>= i1@6@01 0) (< i1@6@01 (Seq_length s@1@01)))
      (and (>= i2@6@01 0) (< i2@6@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 i1@6@01) (Seq_index s@1@01 i2@6@01)))
    (= i1@6@01 i2@6@01))
  
  :qid |Node-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@6@01 Int)) (!
  (=>
    (and (>= i@6@01 0) (< i@6@01 (Seq_length s@1@01)))
    (and
      (= (inv@7@01 (Seq_index s@1@01 i@6@01)) i@6@01)
      (img@8@01 (Seq_index s@1@01 i@6@01))))
  :pattern ((Seq_index s@1@01 i@6@01))
  :qid |quant-u-3|)))
(assert (forall ((self $Ref)) (!
  (=>
    (and
      (img@8@01 self)
      (and (>= (inv@7@01 self) 0) (< (inv@7@01 self) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@7@01 self)) self))
  :pattern ((inv@7@01 self))
  :qid |Node-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] (forall i: Int :: { s[i] } i >= 0 && i < |s| ==> (unfolding acc(Node(s[i]), write) in s[i].val >= 0))
(declare-const i@9@01 Int)
(push) ; 3
; [eval] i >= 0 && i < |s| ==> (unfolding acc(Node(s[i]), write) in s[i].val >= 0)
; [eval] i >= 0 && i < |s|
; [eval] i >= 0
(push) ; 4
; [then-branch: 6 | !(i@9@01 >= 0) | live]
; [else-branch: 6 | i@9@01 >= 0 | live]
(push) ; 5
; [then-branch: 6 | !(i@9@01 >= 0)]
(assert (not (>= i@9@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | i@9@01 >= 0]
(assert (>= i@9@01 0))
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= i@9@01 0) (not (>= i@9@01 0))))
(push) ; 4
; [then-branch: 7 | i@9@01 >= 0 && i@9@01 < |s@1@01| | live]
; [else-branch: 7 | !(i@9@01 >= 0 && i@9@01 < |s@1@01|) | live]
(push) ; 5
; [then-branch: 7 | i@9@01 >= 0 && i@9@01 < |s@1@01|]
(assert (and (>= i@9@01 0) (< i@9@01 (Seq_length s@1@01))))
; [eval] (unfolding acc(Node(s[i]), write) in s[i].val >= 0)
; [eval] s[i]
(push) ; 6
; [eval] s[i]
; Precomputing data for removing quantified permissions
(define-fun pTaken@10@01 ((self $Ref) (i@9@01 Int)) $Perm
  (ite
    (= self (Seq_index s@1@01 i@9@01))
    ($Perm.min
      (ite
        (and
          (img@8@01 self)
          (and (>= (inv@7@01 self) 0) (< (inv@7@01 self) (Seq_length s@1@01))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((self $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@8@01 self)
          (and (>= (inv@7@01 self) 0) (< (inv@7@01 self) (Seq_length s@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@10@01 self i@9@01))
    $Perm.No)
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((self $Ref)) (!
  (= (pTaken@10@01 self i@9@01) $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((self $Ref)) (!
  (=>
    (= self (Seq_index s@1@01 i@9@01))
    (= (- $Perm.Write (pTaken@10@01 self i@9@01)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@11@01 $PSF<Node>)
(declare-const s@12@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@8@01 (Seq_index s@1@01 i@9@01))
    (and
      (>= (inv@7@01 (Seq_index s@1@01 i@9@01)) 0)
      (< (inv@7@01 (Seq_index s@1@01 i@9@01)) (Seq_length s@1@01))))
  (and
    (not (= ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@9@01)) $Snap.unit))
    (=
      ($PSF.lookup_Node (as sm@11@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@9@01)))
      ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@5@01)) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@9@01)))))))
(assert (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@11@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
  s@1@01
  i@9@01)))) (Seq_index s@1@01 i@9@01)))
(assert (not (= (Seq_index s@1@01 i@9@01) $Ref.null)))
; [eval] s[i].val >= 0
; [eval] s[i]
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@8@01 (Seq_index s@1@01 i@9@01))
      (and
        (>= (inv@7@01 (Seq_index s@1@01 i@9@01)) 0)
        (< (inv@7@01 (Seq_index s@1@01 i@9@01)) (Seq_length s@1@01))))
    (and
      (not (= ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@9@01)) $Snap.unit))
      (=
        ($PSF.lookup_Node (as sm@11@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
          s@1@01
          i@9@01)))
        ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@5@01)) ($SortWrappers.$RefTo$Snap (Seq_index
          s@1@01
          i@9@01))))))
  (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@11@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
    s@1@01
    i@9@01)))) (Seq_index s@1@01 i@9@01))
  (not (= (Seq_index s@1@01 i@9@01) $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | !(i@9@01 >= 0 && i@9@01 < |s@1@01|)]
(assert (not (and (>= i@9@01 0) (< i@9@01 (Seq_length s@1@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (>= i@9@01 0) (< i@9@01 (Seq_length s@1@01)))
  (and
    (>= i@9@01 0)
    (< i@9@01 (Seq_length s@1@01))
    (=>
      (and
        (img@8@01 (Seq_index s@1@01 i@9@01))
        (and
          (>= (inv@7@01 (Seq_index s@1@01 i@9@01)) 0)
          (< (inv@7@01 (Seq_index s@1@01 i@9@01)) (Seq_length s@1@01))))
      (and
        (not
          (= ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@9@01)) $Snap.unit))
        (=
          ($PSF.lookup_Node (as sm@11@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
            s@1@01
            i@9@01)))
          ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@5@01)) ($SortWrappers.$RefTo$Snap (Seq_index
            s@1@01
            i@9@01))))))
    (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@11@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
      s@1@01
      i@9@01)))) (Seq_index s@1@01 i@9@01))
    (not (= (Seq_index s@1@01 i@9@01) $Ref.null)))))
; Joined path conditions
(assert (or
  (not (and (>= i@9@01 0) (< i@9@01 (Seq_length s@1@01))))
  (and (>= i@9@01 0) (< i@9@01 (Seq_length s@1@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@9@01 Int)) (!
  (and
    (or (>= i@9@01 0) (not (>= i@9@01 0)))
    (=>
      (and (>= i@9@01 0) (< i@9@01 (Seq_length s@1@01)))
      (and
        (>= i@9@01 0)
        (< i@9@01 (Seq_length s@1@01))
        (=>
          (and
            (img@8@01 (Seq_index s@1@01 i@9@01))
            (and
              (>= (inv@7@01 (Seq_index s@1@01 i@9@01)) 0)
              (< (inv@7@01 (Seq_index s@1@01 i@9@01)) (Seq_length s@1@01))))
          (and
            (not
              (=
                ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@9@01))
                $Snap.unit))
            (=
              ($PSF.lookup_Node (as sm@11@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
                s@1@01
                i@9@01)))
              ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@5@01)) ($SortWrappers.$RefTo$Snap (Seq_index
                s@1@01
                i@9@01))))))
        (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@11@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
          s@1@01
          i@9@01)))) (Seq_index s@1@01 i@9@01))
        (not (= (Seq_index s@1@01 i@9@01) $Ref.null))))
    (or
      (not (and (>= i@9@01 0) (< i@9@01 (Seq_length s@1@01))))
      (and (>= i@9@01 0) (< i@9@01 (Seq_length s@1@01)))))
  :pattern ((Seq_index s@1@01 i@9@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@12@13@12@103-aux|)))
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (>= i@9@01 0) (< i@9@01 (Seq_length s@1@01)))
    (>=
      ($PSF.lookup_Node (as sm@11@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@9@01)))
      0))
  :pattern ((Seq_index s@1@01 i@9@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@12@13@12@103|)))
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@13@01 Int)
; [exec]
; foo(s)
; [eval] (forall i: Int, j: Int :: { s[i], s[j] } i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j))) ==> s[i] != s[j])
(declare-const i@14@01 Int)
(declare-const j@15@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j))) ==> s[i] != s[j]
; [eval] i >= 0 && (i < |s| && (j >= 0 && (j < |s| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 8 | !(i@14@01 >= 0) | live]
; [else-branch: 8 | i@14@01 >= 0 | live]
(push) ; 5
; [then-branch: 8 | !(i@14@01 >= 0)]
(assert (not (>= i@14@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | i@14@01 >= 0]
(assert (>= i@14@01 0))
; [eval] i < |s|
; [eval] |s|
(push) ; 6
; [then-branch: 9 | !(i@14@01 < |s@1@01|) | live]
; [else-branch: 9 | i@14@01 < |s@1@01| | live]
(push) ; 7
; [then-branch: 9 | !(i@14@01 < |s@1@01|)]
(assert (not (< i@14@01 (Seq_length s@1@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 9 | i@14@01 < |s@1@01|]
(assert (< i@14@01 (Seq_length s@1@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 10 | !(j@15@01 >= 0) | live]
; [else-branch: 10 | j@15@01 >= 0 | live]
(push) ; 9
; [then-branch: 10 | !(j@15@01 >= 0)]
(assert (not (>= j@15@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 10 | j@15@01 >= 0]
(assert (>= j@15@01 0))
; [eval] j < |s|
; [eval] |s|
(push) ; 10
; [then-branch: 11 | !(j@15@01 < |s@1@01|) | live]
; [else-branch: 11 | j@15@01 < |s@1@01| | live]
(push) ; 11
; [then-branch: 11 | !(j@15@01 < |s@1@01|)]
(assert (not (< j@15@01 (Seq_length s@1@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 11 | j@15@01 < |s@1@01|]
(assert (< j@15@01 (Seq_length s@1@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@15@01 (Seq_length s@1@01)) (not (< j@15@01 (Seq_length s@1@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@15@01 0)
  (and
    (>= j@15@01 0)
    (or (< j@15@01 (Seq_length s@1@01)) (not (< j@15@01 (Seq_length s@1@01)))))))
(assert (or (>= j@15@01 0) (not (>= j@15@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@14@01 (Seq_length s@1@01))
  (and
    (< i@14@01 (Seq_length s@1@01))
    (=>
      (>= j@15@01 0)
      (and
        (>= j@15@01 0)
        (or
          (< j@15@01 (Seq_length s@1@01))
          (not (< j@15@01 (Seq_length s@1@01))))))
    (or (>= j@15@01 0) (not (>= j@15@01 0))))))
(assert (or (< i@14@01 (Seq_length s@1@01)) (not (< i@14@01 (Seq_length s@1@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@14@01 0)
  (and
    (>= i@14@01 0)
    (=>
      (< i@14@01 (Seq_length s@1@01))
      (and
        (< i@14@01 (Seq_length s@1@01))
        (=>
          (>= j@15@01 0)
          (and
            (>= j@15@01 0)
            (or
              (< j@15@01 (Seq_length s@1@01))
              (not (< j@15@01 (Seq_length s@1@01))))))
        (or (>= j@15@01 0) (not (>= j@15@01 0)))))
    (or (< i@14@01 (Seq_length s@1@01)) (not (< i@14@01 (Seq_length s@1@01)))))))
(assert (or (>= i@14@01 0) (not (>= i@14@01 0))))
(push) ; 4
; [then-branch: 12 | i@14@01 >= 0 && i@14@01 < |s@1@01| && j@15@01 >= 0 && j@15@01 < |s@1@01| && i@14@01 != j@15@01 | live]
; [else-branch: 12 | !(i@14@01 >= 0 && i@14@01 < |s@1@01| && j@15@01 >= 0 && j@15@01 < |s@1@01| && i@14@01 != j@15@01) | live]
(push) ; 5
; [then-branch: 12 | i@14@01 >= 0 && i@14@01 < |s@1@01| && j@15@01 >= 0 && j@15@01 < |s@1@01| && i@14@01 != j@15@01]
(assert (and
  (>= i@14@01 0)
  (and
    (< i@14@01 (Seq_length s@1@01))
    (and
      (>= j@15@01 0)
      (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01)))))))
; [eval] s[i] != s[j]
; [eval] s[i]
; [eval] s[j]
(pop) ; 5
(push) ; 5
; [else-branch: 12 | !(i@14@01 >= 0 && i@14@01 < |s@1@01| && j@15@01 >= 0 && j@15@01 < |s@1@01| && i@14@01 != j@15@01)]
(assert (not
  (and
    (>= i@14@01 0)
    (and
      (< i@14@01 (Seq_length s@1@01))
      (and
        (>= j@15@01 0)
        (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@14@01 0)
    (and
      (< i@14@01 (Seq_length s@1@01))
      (and
        (>= j@15@01 0)
        (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01))))))
  (and
    (>= i@14@01 0)
    (< i@14@01 (Seq_length s@1@01))
    (>= j@15@01 0)
    (< j@15@01 (Seq_length s@1@01))
    (not (= i@14@01 j@15@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@14@01 0)
      (and
        (< i@14@01 (Seq_length s@1@01))
        (and
          (>= j@15@01 0)
          (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01)))))))
  (and
    (>= i@14@01 0)
    (and
      (< i@14@01 (Seq_length s@1@01))
      (and
        (>= j@15@01 0)
        (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@14@01 Int) (j@15@01 Int)) (!
  (and
    (=>
      (>= i@14@01 0)
      (and
        (>= i@14@01 0)
        (=>
          (< i@14@01 (Seq_length s@1@01))
          (and
            (< i@14@01 (Seq_length s@1@01))
            (=>
              (>= j@15@01 0)
              (and
                (>= j@15@01 0)
                (or
                  (< j@15@01 (Seq_length s@1@01))
                  (not (< j@15@01 (Seq_length s@1@01))))))
            (or (>= j@15@01 0) (not (>= j@15@01 0)))))
        (or
          (< i@14@01 (Seq_length s@1@01))
          (not (< i@14@01 (Seq_length s@1@01))))))
    (or (>= i@14@01 0) (not (>= i@14@01 0)))
    (=>
      (and
        (>= i@14@01 0)
        (and
          (< i@14@01 (Seq_length s@1@01))
          (and
            (>= j@15@01 0)
            (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01))))))
      (and
        (>= i@14@01 0)
        (< i@14@01 (Seq_length s@1@01))
        (>= j@15@01 0)
        (< j@15@01 (Seq_length s@1@01))
        (not (= i@14@01 j@15@01))))
    (or
      (not
        (and
          (>= i@14@01 0)
          (and
            (< i@14@01 (Seq_length s@1@01))
            (and
              (>= j@15@01 0)
              (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01)))))))
      (and
        (>= i@14@01 0)
        (and
          (< i@14@01 (Seq_length s@1@01))
          (and
            (>= j@15@01 0)
            (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01))))))))
  :pattern ((Seq_index s@1@01 i@14@01) (Seq_index s@1@01 j@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@11@11@11@99-aux|)))
(push) ; 3
(assert (not (forall ((i@14@01 Int) (j@15@01 Int)) (!
  (=>
    (and
      (>= i@14@01 0)
      (and
        (< i@14@01 (Seq_length s@1@01))
        (and
          (>= j@15@01 0)
          (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01))))))
    (not (= (Seq_index s@1@01 i@14@01) (Seq_index s@1@01 j@15@01))))
  :pattern ((Seq_index s@1@01 i@14@01) (Seq_index s@1@01 j@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@11@11@11@99|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@14@01 Int) (j@15@01 Int)) (!
  (=>
    (and
      (>= i@14@01 0)
      (and
        (< i@14@01 (Seq_length s@1@01))
        (and
          (>= j@15@01 0)
          (and (< j@15@01 (Seq_length s@1@01)) (not (= i@14@01 j@15@01))))))
    (not (= (Seq_index s@1@01 i@14@01) (Seq_index s@1@01 j@15@01))))
  :pattern ((Seq_index s@1@01 i@14@01) (Seq_index s@1@01 j@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@11@11@11@99|)))
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(declare-const i@17@01 Int)
(push) ; 3
; [eval] i >= 0 && i < |s|
; [eval] i >= 0
(push) ; 4
; [then-branch: 13 | !(i@17@01 >= 0) | live]
; [else-branch: 13 | i@17@01 >= 0 | live]
(push) ; 5
; [then-branch: 13 | !(i@17@01 >= 0)]
(assert (not (>= i@17@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | i@17@01 >= 0]
(assert (>= i@17@01 0))
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= i@17@01 0) (not (>= i@17@01 0))))
(assert (and (>= i@17@01 0) (< i@17@01 (Seq_length s@1@01))))
; [eval] s[i]
(pop) ; 3
(declare-fun inv@18@01 ($Ref) Int)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and (>= i@17@01 0) (< i@17@01 (Seq_length s@1@01)))
    (or (>= i@17@01 0) (not (>= i@17@01 0))))
  :pattern ((Seq_index s@1@01 i@17@01))
  :qid |Node-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@17@01 Int) (i2@17@01 Int)) (!
  (=>
    (and
      (and (>= i1@17@01 0) (< i1@17@01 (Seq_length s@1@01)))
      (and (>= i2@17@01 0) (< i2@17@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 i1@17@01) (Seq_index s@1@01 i2@17@01)))
    (= i1@17@01 i2@17@01))
  
  :qid |Node-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and (>= i@17@01 0) (< i@17@01 (Seq_length s@1@01)))
    (and
      (= (inv@18@01 (Seq_index s@1@01 i@17@01)) i@17@01)
      (img@19@01 (Seq_index s@1@01 i@17@01))))
  :pattern ((Seq_index s@1@01 i@17@01))
  :qid |quant-u-9|)))
(assert (forall ((self $Ref)) (!
  (=>
    (and
      (img@19@01 self)
      (and (>= (inv@18@01 self) 0) (< (inv@18@01 self) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@18@01 self)) self))
  :pattern ((inv@18@01 self))
  :qid |Node-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@16@01) $Snap.unit))
; [eval] (forall i: Int :: { s[i] } i >= 0 && i < |s| ==> (unfolding acc(Node(s[i]), write) in s[i].val >= 0))
(declare-const i@20@01 Int)
(push) ; 3
; [eval] i >= 0 && i < |s| ==> (unfolding acc(Node(s[i]), write) in s[i].val >= 0)
; [eval] i >= 0 && i < |s|
; [eval] i >= 0
(push) ; 4
; [then-branch: 14 | !(i@20@01 >= 0) | live]
; [else-branch: 14 | i@20@01 >= 0 | live]
(push) ; 5
; [then-branch: 14 | !(i@20@01 >= 0)]
(assert (not (>= i@20@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | i@20@01 >= 0]
(assert (>= i@20@01 0))
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= i@20@01 0) (not (>= i@20@01 0))))
(push) ; 4
; [then-branch: 15 | i@20@01 >= 0 && i@20@01 < |s@1@01| | live]
; [else-branch: 15 | !(i@20@01 >= 0 && i@20@01 < |s@1@01|) | live]
(push) ; 5
; [then-branch: 15 | i@20@01 >= 0 && i@20@01 < |s@1@01|]
(assert (and (>= i@20@01 0) (< i@20@01 (Seq_length s@1@01))))
; [eval] (unfolding acc(Node(s[i]), write) in s[i].val >= 0)
; [eval] s[i]
(push) ; 6
; [eval] s[i]
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((self $Ref) (i@20@01 Int)) $Perm
  (ite
    (= self (Seq_index s@1@01 i@20@01))
    ($Perm.min
      (ite
        (and
          (img@19@01 self)
          (and (>= (inv@18@01 self) 0) (< (inv@18@01 self) (Seq_length s@1@01))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((self $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@19@01 self)
          (and (>= (inv@18@01 self) 0) (< (inv@18@01 self) (Seq_length s@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 self i@20@01))
    $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((self $Ref)) (!
  (= (pTaken@21@01 self i@20@01) $Perm.No)
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((self $Ref)) (!
  (=>
    (= self (Seq_index s@1@01 i@20@01))
    (= (- $Perm.Write (pTaken@21@01 self i@20@01)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@22@01 $PSF<Node>)
(declare-const s@23@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@19@01 (Seq_index s@1@01 i@20@01))
    (and
      (>= (inv@18@01 (Seq_index s@1@01 i@20@01)) 0)
      (< (inv@18@01 (Seq_index s@1@01 i@20@01)) (Seq_length s@1@01))))
  (and
    (not (= ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@20@01)) $Snap.unit))
    (=
      ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@20@01)))
      ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@20@01)))))))
(assert (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
  s@1@01
  i@20@01)))) (Seq_index s@1@01 i@20@01)))
(assert (not (= (Seq_index s@1@01 i@20@01) $Ref.null)))
; [eval] s[i].val >= 0
; [eval] s[i]
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@19@01 (Seq_index s@1@01 i@20@01))
      (and
        (>= (inv@18@01 (Seq_index s@1@01 i@20@01)) 0)
        (< (inv@18@01 (Seq_index s@1@01 i@20@01)) (Seq_length s@1@01))))
    (and
      (not (= ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@20@01)) $Snap.unit))
      (=
        ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
          s@1@01
          i@20@01)))
        ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) ($SortWrappers.$RefTo$Snap (Seq_index
          s@1@01
          i@20@01))))))
  (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
    s@1@01
    i@20@01)))) (Seq_index s@1@01 i@20@01))
  (not (= (Seq_index s@1@01 i@20@01) $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 15 | !(i@20@01 >= 0 && i@20@01 < |s@1@01|)]
(assert (not (and (>= i@20@01 0) (< i@20@01 (Seq_length s@1@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (>= i@20@01 0) (< i@20@01 (Seq_length s@1@01)))
  (and
    (>= i@20@01 0)
    (< i@20@01 (Seq_length s@1@01))
    (=>
      (and
        (img@19@01 (Seq_index s@1@01 i@20@01))
        (and
          (>= (inv@18@01 (Seq_index s@1@01 i@20@01)) 0)
          (< (inv@18@01 (Seq_index s@1@01 i@20@01)) (Seq_length s@1@01))))
      (and
        (not
          (= ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@20@01)) $Snap.unit))
        (=
          ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
            s@1@01
            i@20@01)))
          ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) ($SortWrappers.$RefTo$Snap (Seq_index
            s@1@01
            i@20@01))))))
    (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
      s@1@01
      i@20@01)))) (Seq_index s@1@01 i@20@01))
    (not (= (Seq_index s@1@01 i@20@01) $Ref.null)))))
; Joined path conditions
(assert (or
  (not (and (>= i@20@01 0) (< i@20@01 (Seq_length s@1@01))))
  (and (>= i@20@01 0) (< i@20@01 (Seq_length s@1@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@20@01 Int)) (!
  (and
    (or (>= i@20@01 0) (not (>= i@20@01 0)))
    (=>
      (and (>= i@20@01 0) (< i@20@01 (Seq_length s@1@01)))
      (and
        (>= i@20@01 0)
        (< i@20@01 (Seq_length s@1@01))
        (=>
          (and
            (img@19@01 (Seq_index s@1@01 i@20@01))
            (and
              (>= (inv@18@01 (Seq_index s@1@01 i@20@01)) 0)
              (< (inv@18@01 (Seq_index s@1@01 i@20@01)) (Seq_length s@1@01))))
          (and
            (not
              (=
                ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@20@01))
                $Snap.unit))
            (=
              ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
                s@1@01
                i@20@01)))
              ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) ($SortWrappers.$RefTo$Snap (Seq_index
                s@1@01
                i@20@01))))))
        (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
          s@1@01
          i@20@01)))) (Seq_index s@1@01 i@20@01))
        (not (= (Seq_index s@1@01 i@20@01) $Ref.null))))
    (or
      (not (and (>= i@20@01 0) (< i@20@01 (Seq_length s@1@01))))
      (and (>= i@20@01 0) (< i@20@01 (Seq_length s@1@01)))))
  :pattern ((Seq_index s@1@01 i@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@12@13@12@103-aux|)))
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (>= i@20@01 0) (< i@20@01 (Seq_length s@1@01)))
    (>=
      ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@20@01)))
      0))
  :pattern ((Seq_index s@1@01 i@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@12@13@12@103|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const i@24@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && i < |s|
; [eval] i >= 0
(push) ; 4
; [then-branch: 16 | !(i@24@01 >= 0) | live]
; [else-branch: 16 | i@24@01 >= 0 | live]
(push) ; 5
; [then-branch: 16 | !(i@24@01 >= 0)]
(assert (not (>= i@24@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | i@24@01 >= 0]
(assert (>= i@24@01 0))
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= i@24@01 0) (not (>= i@24@01 0))))
(assert (and (>= i@24@01 0) (< i@24@01 (Seq_length s@1@01))))
; [eval] s[i]
(pop) ; 3
(declare-fun inv@25@01 ($Ref) Int)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and (>= i@24@01 0) (< i@24@01 (Seq_length s@1@01)))
    (or (>= i@24@01 0) (not (>= i@24@01 0))))
  :pattern ((Seq_index s@1@01 i@24@01))
  :qid |Node-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@24@01 Int) (i2@24@01 Int)) (!
  (=>
    (and
      (and (>= i1@24@01 0) (< i1@24@01 (Seq_length s@1@01)))
      (and (>= i2@24@01 0) (< i2@24@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 i1@24@01) (Seq_index s@1@01 i2@24@01)))
    (= i1@24@01 i2@24@01))
  
  :qid |Node-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and (>= i@24@01 0) (< i@24@01 (Seq_length s@1@01)))
    (and
      (= (inv@25@01 (Seq_index s@1@01 i@24@01)) i@24@01)
      (img@26@01 (Seq_index s@1@01 i@24@01))))
  :pattern ((Seq_index s@1@01 i@24@01))
  :qid |Node-invOfFct|)))
(assert (forall ((self $Ref)) (!
  (=>
    (and
      (img@26@01 self)
      (and (>= (inv@25@01 self) 0) (< (inv@25@01 self) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@25@01 self)) self))
  :pattern ((inv@25@01 self))
  :qid |Node-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@27@01 ((self $Ref)) $Perm
  (ite
    (and
      (and (>= (inv@25@01 self) 0) (< (inv@25@01 self) (Seq_length s@1@01)))
      (img@26@01 self)
      (= self (Seq_index s@1@01 (inv@25@01 self))))
    ($Perm.min
      (ite
        (and
          (img@19@01 self)
          (and (>= (inv@18@01 self) 0) (< (inv@18@01 self) (Seq_length s@1@01))))
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
(assert (not (forall ((self $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@19@01 self)
          (and (>= (inv@18@01 self) 0) (< (inv@18@01 self) (Seq_length s@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@27@01 self))
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
(assert (not (forall ((self $Ref)) (!
  (=>
    (and
      (and (>= (inv@25@01 self) 0) (< (inv@25@01 self) (Seq_length s@1@01)))
      (img@26@01 self)
      (= self (Seq_index s@1@01 (inv@25@01 self))))
    (= (- $Perm.Write (pTaken@27@01 self)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(assert (forall ((s@23@01 $Snap)) (!
  (=>
    (and
      (img@19@01 ($SortWrappers.$SnapTo$Ref s@23@01))
      (and
        (>= (inv@18@01 ($SortWrappers.$SnapTo$Ref s@23@01)) 0)
        (< (inv@18@01 ($SortWrappers.$SnapTo$Ref s@23@01)) (Seq_length s@1@01))))
    (and
      (not (= s@23@01 $Snap.unit))
      (=
        ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) s@23@01)
        ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) s@23@01))))
  :pattern (($PSF.lookup_Node (as sm@22@01  $PSF<Node>) s@23@01))
  :pattern (($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) s@23@01))
  :qid |qp.psmValDef1|)))
; [eval] (forall i: Int :: { s[i] } i >= 0 && i < |s| ==> (unfolding acc(Node(s[i]), write) in s[i].val >= 0))
(declare-const i@28@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && i < |s| ==> (unfolding acc(Node(s[i]), write) in s[i].val >= 0)
; [eval] i >= 0 && i < |s|
; [eval] i >= 0
(push) ; 4
; [then-branch: 17 | !(i@28@01 >= 0) | live]
; [else-branch: 17 | i@28@01 >= 0 | live]
(push) ; 5
; [then-branch: 17 | !(i@28@01 >= 0)]
(assert (not (>= i@28@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | i@28@01 >= 0]
(assert (>= i@28@01 0))
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= i@28@01 0) (not (>= i@28@01 0))))
(push) ; 4
; [then-branch: 18 | i@28@01 >= 0 && i@28@01 < |s@1@01| | live]
; [else-branch: 18 | !(i@28@01 >= 0 && i@28@01 < |s@1@01|) | live]
(push) ; 5
; [then-branch: 18 | i@28@01 >= 0 && i@28@01 < |s@1@01|]
(assert (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01))))
; [eval] (unfolding acc(Node(s[i]), write) in s[i].val >= 0)
; [eval] s[i]
(push) ; 6
; [eval] s[i]
; Precomputing data for removing quantified permissions
(define-fun pTaken@29@01 ((self $Ref) (i@28@01 Int)) $Perm
  (ite
    (= self (Seq_index s@1@01 i@28@01))
    ($Perm.min
      (ite
        (and
          (img@19@01 self)
          (and (>= (inv@18@01 self) 0) (< (inv@18@01 self) (Seq_length s@1@01))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((self $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@19@01 self)
          (and (>= (inv@18@01 self) 0) (< (inv@18@01 self) (Seq_length s@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@29@01 self i@28@01))
    $Perm.No)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((self $Ref)) (!
  (= (pTaken@29@01 self i@28@01) $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((self $Ref)) (!
  (=>
    (= self (Seq_index s@1@01 i@28@01))
    (= (- $Perm.Write (pTaken@29@01 self i@28@01)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@19@01 (Seq_index s@1@01 i@28@01))
    (and
      (>= (inv@18@01 (Seq_index s@1@01 i@28@01)) 0)
      (< (inv@18@01 (Seq_index s@1@01 i@28@01)) (Seq_length s@1@01))))
  (and
    (not (= ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@28@01)) $Snap.unit))
    (=
      ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@28@01)))
      ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@28@01)))))))
(assert (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
  s@1@01
  i@28@01)))) (Seq_index s@1@01 i@28@01)))
(assert (not (= (Seq_index s@1@01 i@28@01) $Ref.null)))
; [eval] s[i].val >= 0
; [eval] s[i]
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@19@01 (Seq_index s@1@01 i@28@01))
      (and
        (>= (inv@18@01 (Seq_index s@1@01 i@28@01)) 0)
        (< (inv@18@01 (Seq_index s@1@01 i@28@01)) (Seq_length s@1@01))))
    (and
      (not (= ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@28@01)) $Snap.unit))
      (=
        ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
          s@1@01
          i@28@01)))
        ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) ($SortWrappers.$RefTo$Snap (Seq_index
          s@1@01
          i@28@01))))))
  (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
    s@1@01
    i@28@01)))) (Seq_index s@1@01 i@28@01))
  (not (= (Seq_index s@1@01 i@28@01) $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 18 | !(i@28@01 >= 0 && i@28@01 < |s@1@01|)]
(assert (not (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01)))
  (and
    (>= i@28@01 0)
    (< i@28@01 (Seq_length s@1@01))
    (=>
      (and
        (img@19@01 (Seq_index s@1@01 i@28@01))
        (and
          (>= (inv@18@01 (Seq_index s@1@01 i@28@01)) 0)
          (< (inv@18@01 (Seq_index s@1@01 i@28@01)) (Seq_length s@1@01))))
      (and
        (not
          (= ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@28@01)) $Snap.unit))
        (=
          ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
            s@1@01
            i@28@01)))
          ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) ($SortWrappers.$RefTo$Snap (Seq_index
            s@1@01
            i@28@01))))))
    (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
      s@1@01
      i@28@01)))) (Seq_index s@1@01 i@28@01))
    (not (= (Seq_index s@1@01 i@28@01) $Ref.null)))))
; Joined path conditions
(assert (or
  (not (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01))))
  (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@28@01 Int)) (!
  (and
    (or (>= i@28@01 0) (not (>= i@28@01 0)))
    (=>
      (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01)))
      (and
        (>= i@28@01 0)
        (< i@28@01 (Seq_length s@1@01))
        (=>
          (and
            (img@19@01 (Seq_index s@1@01 i@28@01))
            (and
              (>= (inv@18@01 (Seq_index s@1@01 i@28@01)) 0)
              (< (inv@18@01 (Seq_index s@1@01 i@28@01)) (Seq_length s@1@01))))
          (and
            (not
              (=
                ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@28@01))
                $Snap.unit))
            (=
              ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
                s@1@01
                i@28@01)))
              ($PSF.lookup_Node ($SortWrappers.$SnapTo$PSF<Node> ($Snap.first $t@16@01)) ($SortWrappers.$RefTo$Snap (Seq_index
                s@1@01
                i@28@01))))))
        (Node%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
          s@1@01
          i@28@01)))) (Seq_index s@1@01 i@28@01))
        (not (= (Seq_index s@1@01 i@28@01) $Ref.null))))
    (or
      (not (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01))))
      (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01)))))
  :pattern ((Seq_index s@1@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@12@13@12@103-aux|)))
(push) ; 3
(assert (not (forall ((i@28@01 Int)) (!
  (=>
    (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01)))
    (>=
      ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@28@01)))
      0))
  :pattern ((Seq_index s@1@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@12@13@12@103|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (>= i@28@01 0) (< i@28@01 (Seq_length s@1@01)))
    (>=
      ($PSF.lookup_Node (as sm@22@01  $PSF<Node>) ($SortWrappers.$RefTo$Snap (Seq_index
        s@1@01
        i@28@01)))
      0))
  :pattern ((Seq_index s@1@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0204.vpr@12@13@12@103|)))
(pop) ; 2
(pop) ; 1
; ---------- append ----------
(declare-const g@30@01 Set<$Ref>)
(declare-const g@31@01 Set<$Ref>)
(push) ; 1
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; [eval] (unfolding acc(GRAPH(g), write) in true)
(push) ; 2
(assert (GRAPH%trigger ($Snap.first $t@32@01) g@31@01))
(declare-const n@33@01 $Ref)
(push) ; 3
; [eval] (n in nodes)
(assert (Set_in n@33@01 g@31@01))
(pop) ; 3
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@33@01 $Ref) (n2@33@01 $Ref)) (!
  (=>
    (and
      (Set_in n1@33@01 g@31@01)
      (Set_in n2@33@01 g@31@01)
      (= n1@33@01 n2@33@01))
    (= n1@33@01 n2@33@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@33@01 $Ref)) (!
  (=>
    (Set_in n@33@01 g@31@01)
    (and (= (inv@34@01 n@33@01) n@33@01) (img@35@01 n@33@01)))
  :pattern ((Set_in n@33@01 g@31@01))
  :pattern ((inv@34@01 n@33@01))
  :pattern ((img@35@01 n@33@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@35@01 r) (Set_in (inv@34@01 r) g@31@01)) (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@33@01 $Ref)) (!
  (=> (Set_in n@33@01 g@31@01) (not (= n@33@01 $Ref.null)))
  :pattern ((Set_in n@33@01 g@31@01))
  :pattern ((inv@34@01 n@33@01))
  :pattern ((img@35@01 n@33@01))
  :qid |next-permImpliesNonNull|)))
(pop) ; 2
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=> (and (img@35@01 r) (Set_in (inv@34@01 r) g@31@01)) (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |next-fctOfInv|)))
(assert (GRAPH%trigger ($Snap.first $t@32@01) g@31@01))
(assert (and
  (forall ((n@33@01 $Ref)) (!
    (=>
      (Set_in n@33@01 g@31@01)
      (and (= (inv@34@01 n@33@01) n@33@01) (img@35@01 n@33@01)))
    :pattern ((Set_in n@33@01 g@31@01))
    :pattern ((inv@34@01 n@33@01))
    :pattern ((img@35@01 n@33@01))
    :qid |quant-u-23|))
  (forall ((n@33@01 $Ref)) (!
    (=> (Set_in n@33@01 g@31@01) (not (= n@33@01 $Ref.null)))
    :pattern ((Set_in n@33@01 g@31@01))
    :pattern ((inv@34@01 n@33@01))
    :pattern ((img@35@01 n@33@01))
    :qid |next-permImpliesNonNull|))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(GRAPH(g), write) in (forall n: Ref ::true))
; [eval] (unfolding acc(GRAPH(g), write) in (forall n: Ref ::true))
(push) ; 3
(declare-const n@36@01 $Ref)
(push) ; 4
; [eval] (n in nodes)
(assert (Set_in n@36@01 g@31@01))
(pop) ; 4
(declare-fun inv@37@01 ($Ref) $Ref)
(declare-fun img@38@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n1@36@01 $Ref) (n2@36@01 $Ref)) (!
  (=>
    (and
      (Set_in n1@36@01 g@31@01)
      (Set_in n2@36@01 g@31@01)
      (= n1@36@01 n2@36@01))
    (= n1@36@01 n2@36@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@36@01 $Ref)) (!
  (=>
    (Set_in n@36@01 g@31@01)
    (and (= (inv@37@01 n@36@01) n@36@01) (img@38@01 n@36@01)))
  :pattern ((Set_in n@36@01 g@31@01))
  :pattern ((inv@37@01 n@36@01))
  :pattern ((img@38@01 n@36@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@38@01 r) (Set_in (inv@37@01 r) g@31@01)) (= (inv@37@01 r) r))
  :pattern ((inv@37@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@36@01 $Ref)) (!
  (=> (Set_in n@36@01 g@31@01) (not (= n@36@01 $Ref.null)))
  :pattern ((Set_in n@36@01 g@31@01))
  :pattern ((inv@37@01 n@36@01))
  :pattern ((img@38@01 n@36@01))
  :qid |next-permImpliesNonNull|)))
; [eval] (forall n: Ref ::true)
(declare-const n@39@01 $Ref)
(push) ; 4
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=> (and (img@38@01 r) (Set_in (inv@37@01 r) g@31@01)) (= (inv@37@01 r) r))
  :pattern ((inv@37@01 r))
  :qid |next-fctOfInv|)))
(assert (and
  (forall ((n@36@01 $Ref)) (!
    (=>
      (Set_in n@36@01 g@31@01)
      (and (= (inv@37@01 n@36@01) n@36@01) (img@38@01 n@36@01)))
    :pattern ((Set_in n@36@01 g@31@01))
    :pattern ((inv@37@01 n@36@01))
    :pattern ((img@38@01 n@36@01))
    :qid |quant-u-25|))
  (forall ((n@36@01 $Ref)) (!
    (=> (Set_in n@36@01 g@31@01) (not (= n@36@01 $Ref.null)))
    :pattern ((Set_in n@36@01 g@31@01))
    :pattern ((inv@37@01 n@36@01))
    :pattern ((img@38@01 n@36@01))
    :qid |next-permImpliesNonNull|))))
(pop) ; 2
(pop) ; 1
