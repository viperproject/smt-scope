(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:26
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0512.vpr
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
(declare-sort Seq<Int> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort VCTArray<Ref> 0)
(declare-sort $FVF<item> 0)
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
(declare-fun $SortWrappers.Seq<Int>To$Snap (Seq<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Int> ($Snap) Seq<Int>)
(assert (forall ((x Seq<Int>)) (!
    (= x ($SortWrappers.$SnapToSeq<Int>($SortWrappers.Seq<Int>To$Snap x)))
    :pattern (($SortWrappers.Seq<Int>To$Snap x))
    :qid |$Snap.$SnapToSeq<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Int>To$Snap($SortWrappers.$SnapToSeq<Int> x)))
    :pattern (($SortWrappers.$SnapToSeq<Int> x))
    :qid |$Snap.Seq<Int>To$SnapToSeq<Int>|
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
(declare-fun $SortWrappers.VCTArray<Ref>To$Snap (VCTArray<Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToVCTArray<Ref> ($Snap) VCTArray<Ref>)
(assert (forall ((x VCTArray<Ref>)) (!
    (= x ($SortWrappers.$SnapToVCTArray<Ref>($SortWrappers.VCTArray<Ref>To$Snap x)))
    :pattern (($SortWrappers.VCTArray<Ref>To$Snap x))
    :qid |$Snap.$SnapToVCTArray<Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.VCTArray<Ref>To$Snap($SortWrappers.$SnapToVCTArray<Ref> x)))
    :pattern (($SortWrappers.$SnapToVCTArray<Ref> x))
    :qid |$Snap.VCTArray<Ref>To$SnapToVCTArray<Ref>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<item>To$Snap ($FVF<item>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<item> ($Snap) $FVF<item>)
(assert (forall ((x $FVF<item>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<item>($SortWrappers.$FVF<item>To$Snap x)))
    :pattern (($SortWrappers.$FVF<item>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<item>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<item>To$Snap($SortWrappers.$SnapTo$FVF<item> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<item> x))
    :qid |$Snap.$FVF<item>To$SnapTo$FVF<item>|
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
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_contains_trigger (Seq<Int> Int) Bool)
(declare-fun Seq_skolem (Seq<Int> Int) Int)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_skolem_diff (Seq<Int> Seq<Int>) Int)
(declare-fun Seq_range (Int Int) Seq<Int>)
(declare-fun loc<Ref> (VCTArray<Ref> Int) $Ref)
(declare-fun alen<Int> (VCTArray<Ref>) Int)
; /field_value_functions_declarations.smt2 [item: Int]
(declare-fun $FVF.domain_item ($FVF<item>) Set<$Ref>)
(declare-fun $FVF.lookup_item ($FVF<item> $Ref) Int)
(declare-fun $FVF.after_item ($FVF<item> $FVF<item>) Bool)
(declare-fun $FVF.loc_item (Int $Ref) Bool)
(declare-fun $FVF.perm_item ($FPM $Ref) $Perm)
(declare-const $fvfTOP_item $FVF<item>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun seqToSeqHelper_frac ($Snap Seq<$Ref> Int) Seq<Int>)
(declare-fun seqToSeqHelper_frac%limited ($Snap Seq<$Ref> Int) Seq<Int>)
(declare-fun seqToSeqHelper_frac%stateless (Seq<$Ref> Int) Bool)
(declare-fun seqToSeqHelper_frac%precondition ($Snap Seq<$Ref> Int) Bool)
(declare-fun sumContrib ($Snap VCTArray<Ref> Int $Perm) Int)
(declare-fun sumContrib%limited ($Snap VCTArray<Ref> Int $Perm) Int)
(declare-fun sumContrib%stateless (VCTArray<Ref> Int $Perm) Bool)
(declare-fun sumContrib%precondition ($Snap VCTArray<Ref> Int $Perm) Bool)
(declare-fun seqToSeqHelper_wild ($Snap Seq<$Ref> Int) Seq<Int>)
(declare-fun seqToSeqHelper_wild%limited ($Snap Seq<$Ref> Int) Seq<Int>)
(declare-fun seqToSeqHelper_wild%stateless (Seq<$Ref> Int) Bool)
(declare-fun seqToSeqHelper_wild%precondition ($Snap Seq<$Ref> Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((s Seq<Int>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
(assert (forall ((s Seq<Int>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (not (= s1 (as Seq_empty  Seq<Int>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
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
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
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
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (x Int)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Int>) (x Int) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
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
(assert (forall ((a Seq<Int>) (b Seq<Int>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Int) (y Int)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((min_ Int) (max Int)) (!
  (and
    (=> (< min_ max) (= (Seq_length (Seq_range min_ max)) (- max min_)))
    (=> (<= max min_) (= (Seq_length (Seq_range min_ max)) 0)))
  :pattern ((Seq_length (Seq_range min_ max)))
  :qid |$Seq[Int]_prog.ranged_seq_length|)))
(assert (forall ((min_ Int) (max Int) (j Int)) (!
  (=>
    (and (<= 0 j) (< j (- max min_)))
    (= (Seq_index (Seq_range min_ max) j) (+ min_ j)))
  :pattern ((Seq_index (Seq_range min_ max) j))
  :qid |$Seq[Int]_prog.ranged_seq_index|)))
(assert (forall ((min_ Int) (max Int) (v Int)) (!
  (= (Seq_contains (Seq_range min_ max) v) (and (<= min_ v) (< v max)))
  :pattern ((Seq_contains (Seq_range min_ max) v))
  :qid |$Seq[Int]_prog.ranged_seq_contains|)))
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
(assert (forall ((a VCTArray<Ref>)) (!
  (>= (alen<Int> a) 0)
  :pattern ((alen<Int> a))
  :qid |prog.len_nonneg|)))
(assert (forall ((a VCTArray<Ref>) (i Int) (j Int)) (!
  (=>
    (and
      (>= i 0)
      (and
        (>= j 0)
        (and (< i (alen<Int> a)) (and (< j (alen<Int> a)) (not (= i j))))))
    (not (= (loc<Ref> a i) (loc<Ref> a j))))
  :pattern ((loc<Ref> a i) (loc<Ref> a j))
  :qid |prog.loc_inject|)))
; /field_value_functions_axioms.smt2 [item: Int]
(assert (forall ((vs $FVF<item>) (ws $FVF<item>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_item vs) ($FVF.domain_item ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_item vs))
            (= ($FVF.lookup_item vs x) ($FVF.lookup_item ws x)))
          :pattern (($FVF.lookup_item vs x) ($FVF.lookup_item ws x))
          :qid |qp.$FVF<item>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<item>To$Snap vs)
              ($SortWrappers.$FVF<item>To$Snap ws)
              )
    :qid |qp.$FVF<item>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_item pm r))
    :pattern (($FVF.perm_item pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_item f r) true)
    :pattern (($FVF.loc_item f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION seqToSeqHelper_frac----------
(declare-fun xs@0@00 () Seq<$Ref>)
(declare-fun i@1@00 () Int)
(declare-fun result@2@00 () Seq<Int>)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@1@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] i <= |xs|
; [eval] |xs|
(assert (<= i@1@00 (Seq_length xs@0@00)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@10@00 Int)
(declare-const j@11@00 Int)
(push) ; 2
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 0 | !(k@10@00 >= 0) | live]
; [else-branch: 0 | k@10@00 >= 0 | live]
(push) ; 4
; [then-branch: 0 | !(k@10@00 >= 0)]
(assert (not (>= k@10@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | k@10@00 >= 0]
(assert (>= k@10@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 1 | !(k@10@00 < |xs@0@00|) | live]
; [else-branch: 1 | k@10@00 < |xs@0@00| | live]
(push) ; 6
; [then-branch: 1 | !(k@10@00 < |xs@0@00|)]
(assert (not (< k@10@00 (Seq_length xs@0@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | k@10@00 < |xs@0@00|]
(assert (< k@10@00 (Seq_length xs@0@00)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 2 | !(j@11@00 >= 0) | live]
; [else-branch: 2 | j@11@00 >= 0 | live]
(push) ; 8
; [then-branch: 2 | !(j@11@00 >= 0)]
(assert (not (>= j@11@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | j@11@00 >= 0]
(assert (>= j@11@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 3 | !(j@11@00 < |xs@0@00|) | live]
; [else-branch: 3 | j@11@00 < |xs@0@00| | live]
(push) ; 10
; [then-branch: 3 | !(j@11@00 < |xs@0@00|)]
(assert (not (< j@11@00 (Seq_length xs@0@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@11@00 < |xs@0@00|]
(assert (< j@11@00 (Seq_length xs@0@00)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@11@00 (Seq_length xs@0@00)) (not (< j@11@00 (Seq_length xs@0@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@11@00 0)
  (and
    (>= j@11@00 0)
    (or (< j@11@00 (Seq_length xs@0@00)) (not (< j@11@00 (Seq_length xs@0@00)))))))
(assert (or (>= j@11@00 0) (not (>= j@11@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@10@00 (Seq_length xs@0@00))
  (and
    (< k@10@00 (Seq_length xs@0@00))
    (=>
      (>= j@11@00 0)
      (and
        (>= j@11@00 0)
        (or
          (< j@11@00 (Seq_length xs@0@00))
          (not (< j@11@00 (Seq_length xs@0@00))))))
    (or (>= j@11@00 0) (not (>= j@11@00 0))))))
(assert (or (< k@10@00 (Seq_length xs@0@00)) (not (< k@10@00 (Seq_length xs@0@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@10@00 0)
  (and
    (>= k@10@00 0)
    (=>
      (< k@10@00 (Seq_length xs@0@00))
      (and
        (< k@10@00 (Seq_length xs@0@00))
        (=>
          (>= j@11@00 0)
          (and
            (>= j@11@00 0)
            (or
              (< j@11@00 (Seq_length xs@0@00))
              (not (< j@11@00 (Seq_length xs@0@00))))))
        (or (>= j@11@00 0) (not (>= j@11@00 0)))))
    (or (< k@10@00 (Seq_length xs@0@00)) (not (< k@10@00 (Seq_length xs@0@00)))))))
(assert (or (>= k@10@00 0) (not (>= k@10@00 0))))
(push) ; 3
; [then-branch: 4 | k@10@00 >= 0 && k@10@00 < |xs@0@00| && j@11@00 >= 0 && j@11@00 < |xs@0@00| && k@10@00 != j@11@00 | live]
; [else-branch: 4 | !(k@10@00 >= 0 && k@10@00 < |xs@0@00| && j@11@00 >= 0 && j@11@00 < |xs@0@00| && k@10@00 != j@11@00) | live]
(push) ; 4
; [then-branch: 4 | k@10@00 >= 0 && k@10@00 < |xs@0@00| && j@11@00 >= 0 && j@11@00 < |xs@0@00| && k@10@00 != j@11@00]
(assert (and
  (>= k@10@00 0)
  (and
    (< k@10@00 (Seq_length xs@0@00))
    (and
      (>= j@11@00 0)
      (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(k@10@00 >= 0 && k@10@00 < |xs@0@00| && j@11@00 >= 0 && j@11@00 < |xs@0@00| && k@10@00 != j@11@00)]
(assert (not
  (and
    (>= k@10@00 0)
    (and
      (< k@10@00 (Seq_length xs@0@00))
      (and
        (>= j@11@00 0)
        (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@10@00 0)
    (and
      (< k@10@00 (Seq_length xs@0@00))
      (and
        (>= j@11@00 0)
        (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00))))))
  (and
    (>= k@10@00 0)
    (< k@10@00 (Seq_length xs@0@00))
    (>= j@11@00 0)
    (< j@11@00 (Seq_length xs@0@00))
    (not (= k@10@00 j@11@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@10@00 0)
      (and
        (< k@10@00 (Seq_length xs@0@00))
        (and
          (>= j@11@00 0)
          (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00)))))))
  (and
    (>= k@10@00 0)
    (and
      (< k@10@00 (Seq_length xs@0@00))
      (and
        (>= j@11@00 0)
        (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@10@00 Int) (j@11@00 Int)) (!
  (and
    (=>
      (>= k@10@00 0)
      (and
        (>= k@10@00 0)
        (=>
          (< k@10@00 (Seq_length xs@0@00))
          (and
            (< k@10@00 (Seq_length xs@0@00))
            (=>
              (>= j@11@00 0)
              (and
                (>= j@11@00 0)
                (or
                  (< j@11@00 (Seq_length xs@0@00))
                  (not (< j@11@00 (Seq_length xs@0@00))))))
            (or (>= j@11@00 0) (not (>= j@11@00 0)))))
        (or
          (< k@10@00 (Seq_length xs@0@00))
          (not (< k@10@00 (Seq_length xs@0@00))))))
    (or (>= k@10@00 0) (not (>= k@10@00 0)))
    (=>
      (and
        (>= k@10@00 0)
        (and
          (< k@10@00 (Seq_length xs@0@00))
          (and
            (>= j@11@00 0)
            (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00))))))
      (and
        (>= k@10@00 0)
        (< k@10@00 (Seq_length xs@0@00))
        (>= j@11@00 0)
        (< j@11@00 (Seq_length xs@0@00))
        (not (= k@10@00 j@11@00))))
    (or
      (not
        (and
          (>= k@10@00 0)
          (and
            (< k@10@00 (Seq_length xs@0@00))
            (and
              (>= j@11@00 0)
              (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00)))))))
      (and
        (>= k@10@00 0)
        (and
          (< k@10@00 (Seq_length xs@0@00))
          (and
            (>= j@11@00 0)
            (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00))))))))
  :pattern ((Seq_index xs@0@00 k@10@00) (Seq_index xs@0@00 j@11@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@20@12@20@104-aux|)))
(assert (forall ((k@10@00 Int) (j@11@00 Int)) (!
  (=>
    (and
      (>= k@10@00 0)
      (and
        (< k@10@00 (Seq_length xs@0@00))
        (and
          (>= j@11@00 0)
          (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00))))))
    (not (= (Seq_index xs@0@00 k@10@00) (Seq_index xs@0@00 j@11@00))))
  :pattern ((Seq_index xs@0@00 k@10@00) (Seq_index xs@0@00 j@11@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@20@12@20@104|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(declare-const j@12@00 Int)
(push) ; 2
; [eval] 0 <= j && j < |xs|
; [eval] 0 <= j
(push) ; 3
; [then-branch: 5 | !(0 <= j@12@00) | live]
; [else-branch: 5 | 0 <= j@12@00 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= j@12@00)]
(assert (not (<= 0 j@12@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= j@12@00]
(assert (<= 0 j@12@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@12@00) (not (<= 0 j@12@00))))
(assert (and (<= 0 j@12@00) (< j@12@00 (Seq_length xs@0@00))))
; [eval] xs[j]
(push) ; 3
(assert (not (>= j@12@00 0)))
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
(assert (forall ((j@12@00 Int)) (!
  (=>
    (and (<= 0 j@12@00) (< j@12@00 (Seq_length xs@0@00)))
    (or (<= 0 j@12@00) (not (<= 0 j@12@00))))
  :pattern ((Seq_index xs@0@00 j@12@00))
  :qid |item-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@12@00 Int) (j2@12@00 Int)) (!
  (=>
    (and
      (and (<= 0 j1@12@00) (< j1@12@00 (Seq_length xs@0@00)))
      (and (<= 0 j2@12@00) (< j2@12@00 (Seq_length xs@0@00)))
      (= (Seq_index xs@0@00 j1@12@00) (Seq_index xs@0@00 j2@12@00)))
    (= j1@12@00 j2@12@00))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@12@00 Int)) (!
  (=>
    (and (<= 0 j@12@00) (< j@12@00 (Seq_length xs@0@00)))
    (and
      (= (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@12@00)) j@12@00)
      (img@14@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@12@00))))
  :pattern ((Seq_index xs@0@00 j@12@00))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@00 s@$ xs@0@00 i@1@00 r)
      (and
        (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
        (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@13@00 s@$ xs@0@00 i@1@00 r)) r))
  :pattern ((inv@13@00 s@$ xs@0@00 i@1@00 r))
  :qid |item-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@12@00 Int)) (!
  (=>
    (and (<= 0 j@12@00) (< j@12@00 (Seq_length xs@0@00)))
    (not (= (Seq_index xs@0@00 j@12@00) $Ref.null)))
  :pattern ((Seq_index xs@0@00 j@12@00))
  :qid |item-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] i < |xs|
; [eval] |xs|
(assert (< i@1@00 (Seq_length xs@0@00)))
(declare-const $t@15@00 $Snap)
(assert (= $t@15@00 ($Snap.combine ($Snap.first $t@15@00) ($Snap.second $t@15@00))))
(assert (= ($Snap.first $t@15@00) $Snap.unit))
; [eval] |result| == |xs| - i
; [eval] |result|
; [eval] |xs| - i
; [eval] |xs|
(assert (= (Seq_length result@2@00) (- (Seq_length xs@0@00) i@1@00)))
(assert (= ($Snap.second $t@15@00) $Snap.unit))
; [eval] (forall j: Int :: { xs[j] } i <= j && j < |xs| ==> result[j - i] == xs[j].item)
(declare-const j@16@00 Int)
(push) ; 2
; [eval] i <= j && j < |xs| ==> result[j - i] == xs[j].item
; [eval] i <= j && j < |xs|
; [eval] i <= j
(push) ; 3
; [then-branch: 6 | !(i@1@00 <= j@16@00) | live]
; [else-branch: 6 | i@1@00 <= j@16@00 | live]
(push) ; 4
; [then-branch: 6 | !(i@1@00 <= j@16@00)]
(assert (not (<= i@1@00 j@16@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | i@1@00 <= j@16@00]
(assert (<= i@1@00 j@16@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= i@1@00 j@16@00) (not (<= i@1@00 j@16@00))))
(push) ; 3
; [then-branch: 7 | i@1@00 <= j@16@00 && j@16@00 < |xs@0@00| | live]
; [else-branch: 7 | !(i@1@00 <= j@16@00 && j@16@00 < |xs@0@00|) | live]
(push) ; 4
; [then-branch: 7 | i@1@00 <= j@16@00 && j@16@00 < |xs@0@00|]
(assert (and (<= i@1@00 j@16@00) (< j@16@00 (Seq_length xs@0@00))))
; [eval] result[j - i] == xs[j].item
; [eval] result[j - i]
; [eval] j - i
(push) ; 5
(assert (not (>= (- j@16@00 i@1@00) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (- j@16@00 i@1@00) (Seq_length result@2@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@16@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@14@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@16@00))
  (and
    (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@16@00)))
    (<
      (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@16@00))
      (Seq_length xs@0@00))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(i@1@00 <= j@16@00 && j@16@00 < |xs@0@00|)]
(assert (not (and (<= i@1@00 j@16@00) (< j@16@00 (Seq_length xs@0@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= i@1@00 j@16@00) (< j@16@00 (Seq_length xs@0@00))))
  (and (<= i@1@00 j@16@00) (< j@16@00 (Seq_length xs@0@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@16@00 Int)) (!
  (and
    (or (<= i@1@00 j@16@00) (not (<= i@1@00 j@16@00)))
    (or
      (not (and (<= i@1@00 j@16@00) (< j@16@00 (Seq_length xs@0@00))))
      (and (<= i@1@00 j@16@00) (< j@16@00 (Seq_length xs@0@00)))))
  :pattern ((Seq_index xs@0@00 j@16@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@25@12@25@79-aux|)))
(assert (forall ((j@16@00 Int)) (!
  (=>
    (and (<= i@1@00 j@16@00) (< j@16@00 (Seq_length xs@0@00)))
    (=
      (Seq_index result@2@00 (- j@16@00 i@1@00))
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
        xs@0@00
        j@16@00))))
  :pattern ((Seq_index xs@0@00 j@16@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@25@12@25@79|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (i@1@00 Int)) (!
  (=
    (seqToSeqHelper_frac%limited s@$ xs@0@00 i@1@00)
    (seqToSeqHelper_frac s@$ xs@0@00 i@1@00))
  :pattern ((seqToSeqHelper_frac s@$ xs@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (i@1@00 Int)) (!
  (seqToSeqHelper_frac%stateless xs@0@00 i@1@00)
  :pattern ((seqToSeqHelper_frac%limited s@$ xs@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (i@1@00 Int)) (!
  (let ((result@2@00 (seqToSeqHelper_frac%limited s@$ xs@0@00 i@1@00))) (and
    (forall ((j@12@00 Int)) (!
      (=>
        (and (<= 0 j@12@00) (< j@12@00 (Seq_length xs@0@00)))
        (and
          (= (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@12@00)) j@12@00)
          (img@14@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@12@00))))
      :pattern ((Seq_index xs@0@00 j@12@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@14@00 s@$ xs@0@00 i@1@00 r)
          (and
            (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
            (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
        (= (Seq_index xs@0@00 (inv@13@00 s@$ xs@0@00 i@1@00 r)) r))
      :pattern ((inv@13@00 s@$ xs@0@00 i@1@00 r))
      :qid |item-fctOfInv|))
    (=>
      (seqToSeqHelper_frac%precondition s@$ xs@0@00 i@1@00)
      (and
        (= (Seq_length result@2@00) (- (Seq_length xs@0@00) i@1@00))
        (forall ((j Int)) (!
          (=>
            (and (<= i@1@00 j) (< j (Seq_length xs@0@00)))
            (=
              (Seq_index result@2@00 (- j i@1@00))
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
                xs@0@00
                j))))
          :pattern ((Seq_index xs@0@00 j))
          ))))))
  :pattern ((seqToSeqHelper_frac%limited s@$ xs@0@00 i@1@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (i@1@00 Int)) (!
  (let ((result@2@00 (seqToSeqHelper_frac%limited s@$ xs@0@00 i@1@00))) true)
  :pattern ((seqToSeqHelper_frac%limited s@$ xs@0@00 i@1@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (i@1@00 Int)) (!
  (let ((result@2@00 (seqToSeqHelper_frac%limited s@$ xs@0@00 i@1@00))) true)
  :pattern ((seqToSeqHelper_frac%limited s@$ xs@0@00 i@1@00))
  :qid |quant-u-10|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@00 s@$ xs@0@00 i@1@00 r)
      (and
        (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
        (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@13@00 s@$ xs@0@00 i@1@00 r)) r))
  :pattern ((inv@13@00 s@$ xs@0@00 i@1@00 r))
  :qid |item-fctOfInv|)))
(assert (forall ((j@12@00 Int)) (!
  (=>
    (and (<= 0 j@12@00) (< j@12@00 (Seq_length xs@0@00)))
    (and
      (= (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@12@00)) j@12@00)
      (img@14@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@12@00))))
  :pattern ((Seq_index xs@0@00 j@12@00))
  :qid |quant-u-7|)))
(assert (forall ((j@12@00 Int)) (!
  (=>
    (and (<= 0 j@12@00) (< j@12@00 (Seq_length xs@0@00)))
    (not (= (Seq_index xs@0@00 j@12@00) $Ref.null)))
  :pattern ((Seq_index xs@0@00 j@12@00))
  :qid |item-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (< i@1@00 (Seq_length xs@0@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 i@1@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= i@1@00 (Seq_length xs@0@00)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (forall ((k@10@00 Int) (j@11@00 Int)) (!
  (and
    (=>
      (>= k@10@00 0)
      (and
        (>= k@10@00 0)
        (=>
          (< k@10@00 (Seq_length xs@0@00))
          (and
            (< k@10@00 (Seq_length xs@0@00))
            (=>
              (>= j@11@00 0)
              (and
                (>= j@11@00 0)
                (or
                  (< j@11@00 (Seq_length xs@0@00))
                  (not (< j@11@00 (Seq_length xs@0@00))))))
            (or (>= j@11@00 0) (not (>= j@11@00 0)))))
        (or
          (< k@10@00 (Seq_length xs@0@00))
          (not (< k@10@00 (Seq_length xs@0@00))))))
    (or (>= k@10@00 0) (not (>= k@10@00 0)))
    (=>
      (and
        (>= k@10@00 0)
        (and
          (< k@10@00 (Seq_length xs@0@00))
          (and
            (>= j@11@00 0)
            (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00))))))
      (and
        (>= k@10@00 0)
        (< k@10@00 (Seq_length xs@0@00))
        (>= j@11@00 0)
        (< j@11@00 (Seq_length xs@0@00))
        (not (= k@10@00 j@11@00))))
    (or
      (not
        (and
          (>= k@10@00 0)
          (and
            (< k@10@00 (Seq_length xs@0@00))
            (and
              (>= j@11@00 0)
              (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00)))))))
      (and
        (>= k@10@00 0)
        (and
          (< k@10@00 (Seq_length xs@0@00))
          (and
            (>= j@11@00 0)
            (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00))))))))
  :pattern ((Seq_index xs@0@00 k@10@00) (Seq_index xs@0@00 j@11@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@20@12@20@104-aux|)))
(assert (forall ((k@10@00 Int) (j@11@00 Int)) (!
  (=>
    (and
      (>= k@10@00 0)
      (and
        (< k@10@00 (Seq_length xs@0@00))
        (and
          (>= j@11@00 0)
          (and (< j@11@00 (Seq_length xs@0@00)) (not (= k@10@00 j@11@00))))))
    (not (= (Seq_index xs@0@00 k@10@00) (Seq_index xs@0@00 j@11@00))))
  :pattern ((Seq_index xs@0@00 k@10@00) (Seq_index xs@0@00 j@11@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@20@12@20@104|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (forall ((j@12@00 Int)) (!
  (=>
    (and (<= 0 j@12@00) (< j@12@00 (Seq_length xs@0@00)))
    (or (<= 0 j@12@00) (not (<= 0 j@12@00))))
  :pattern ((Seq_index xs@0@00 j@12@00))
  :qid |item-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] Seq(xs[i].item) ++ seqToSeqHelper_frac(xs, i + 1)
; [eval] Seq(xs[i].item)
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= i@1@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (and
  (img@14@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 i@1@00))
  (and
    (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 i@1@00)))
    (<
      (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 i@1@00))
      (Seq_length xs@0@00))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length
    (Seq_singleton ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
      xs@0@00
      i@1@00))))
  1))
; [eval] seqToSeqHelper_frac(xs, i + 1)
; [eval] i + 1
(push) ; 2
; [eval] 0 <= i
(push) ; 3
(assert (not (<= 0 (+ i@1@00 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ i@1@00 1)))
; [eval] i <= |xs|
; [eval] |xs|
(push) ; 3
(assert (not (<= (+ i@1@00 1) (Seq_length xs@0@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@1@00 1) (Seq_length xs@0@00)))
; [eval] (forall k: Int, j: Int ::k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@17@00 Int)
(declare-const j@18@00 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 8 | !(k@17@00 >= 0) | live]
; [else-branch: 8 | k@17@00 >= 0 | live]
(push) ; 5
; [then-branch: 8 | !(k@17@00 >= 0)]
(assert (not (>= k@17@00 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | k@17@00 >= 0]
(assert (>= k@17@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 9 | !(k@17@00 < |xs@0@00|) | live]
; [else-branch: 9 | k@17@00 < |xs@0@00| | live]
(push) ; 7
; [then-branch: 9 | !(k@17@00 < |xs@0@00|)]
(assert (not (< k@17@00 (Seq_length xs@0@00))))
(pop) ; 7
(push) ; 7
; [else-branch: 9 | k@17@00 < |xs@0@00|]
(assert (< k@17@00 (Seq_length xs@0@00)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 10 | !(j@18@00 >= 0) | live]
; [else-branch: 10 | j@18@00 >= 0 | live]
(push) ; 9
; [then-branch: 10 | !(j@18@00 >= 0)]
(assert (not (>= j@18@00 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 10 | j@18@00 >= 0]
(assert (>= j@18@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 11 | !(j@18@00 < |xs@0@00|) | live]
; [else-branch: 11 | j@18@00 < |xs@0@00| | live]
(push) ; 11
; [then-branch: 11 | !(j@18@00 < |xs@0@00|)]
(assert (not (< j@18@00 (Seq_length xs@0@00))))
(pop) ; 11
(push) ; 11
; [else-branch: 11 | j@18@00 < |xs@0@00|]
(assert (< j@18@00 (Seq_length xs@0@00)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@18@00 (Seq_length xs@0@00)) (not (< j@18@00 (Seq_length xs@0@00)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@18@00 0)
  (and
    (>= j@18@00 0)
    (or (< j@18@00 (Seq_length xs@0@00)) (not (< j@18@00 (Seq_length xs@0@00)))))))
(assert (or (>= j@18@00 0) (not (>= j@18@00 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@17@00 (Seq_length xs@0@00))
  (and
    (< k@17@00 (Seq_length xs@0@00))
    (=>
      (>= j@18@00 0)
      (and
        (>= j@18@00 0)
        (or
          (< j@18@00 (Seq_length xs@0@00))
          (not (< j@18@00 (Seq_length xs@0@00))))))
    (or (>= j@18@00 0) (not (>= j@18@00 0))))))
(assert (or (< k@17@00 (Seq_length xs@0@00)) (not (< k@17@00 (Seq_length xs@0@00)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@17@00 0)
  (and
    (>= k@17@00 0)
    (=>
      (< k@17@00 (Seq_length xs@0@00))
      (and
        (< k@17@00 (Seq_length xs@0@00))
        (=>
          (>= j@18@00 0)
          (and
            (>= j@18@00 0)
            (or
              (< j@18@00 (Seq_length xs@0@00))
              (not (< j@18@00 (Seq_length xs@0@00))))))
        (or (>= j@18@00 0) (not (>= j@18@00 0)))))
    (or (< k@17@00 (Seq_length xs@0@00)) (not (< k@17@00 (Seq_length xs@0@00)))))))
(assert (or (>= k@17@00 0) (not (>= k@17@00 0))))
(push) ; 4
; [then-branch: 12 | k@17@00 >= 0 && k@17@00 < |xs@0@00| && j@18@00 >= 0 && j@18@00 < |xs@0@00| && k@17@00 != j@18@00 | live]
; [else-branch: 12 | !(k@17@00 >= 0 && k@17@00 < |xs@0@00| && j@18@00 >= 0 && j@18@00 < |xs@0@00| && k@17@00 != j@18@00) | live]
(push) ; 5
; [then-branch: 12 | k@17@00 >= 0 && k@17@00 < |xs@0@00| && j@18@00 >= 0 && j@18@00 < |xs@0@00| && k@17@00 != j@18@00]
(assert (and
  (>= k@17@00 0)
  (and
    (< k@17@00 (Seq_length xs@0@00))
    (and
      (>= j@18@00 0)
      (and (< j@18@00 (Seq_length xs@0@00)) (not (= k@17@00 j@18@00)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 12 | !(k@17@00 >= 0 && k@17@00 < |xs@0@00| && j@18@00 >= 0 && j@18@00 < |xs@0@00| && k@17@00 != j@18@00)]
(assert (not
  (and
    (>= k@17@00 0)
    (and
      (< k@17@00 (Seq_length xs@0@00))
      (and
        (>= j@18@00 0)
        (and (< j@18@00 (Seq_length xs@0@00)) (not (= k@17@00 j@18@00))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@17@00 0)
    (and
      (< k@17@00 (Seq_length xs@0@00))
      (and
        (>= j@18@00 0)
        (and (< j@18@00 (Seq_length xs@0@00)) (not (= k@17@00 j@18@00))))))
  (and
    (>= k@17@00 0)
    (< k@17@00 (Seq_length xs@0@00))
    (>= j@18@00 0)
    (< j@18@00 (Seq_length xs@0@00))
    (not (= k@17@00 j@18@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@17@00 0)
      (and
        (< k@17@00 (Seq_length xs@0@00))
        (and
          (>= j@18@00 0)
          (and (< j@18@00 (Seq_length xs@0@00)) (not (= k@17@00 j@18@00)))))))
  (and
    (>= k@17@00 0)
    (and
      (< k@17@00 (Seq_length xs@0@00))
      (and
        (>= j@18@00 0)
        (and (< j@18@00 (Seq_length xs@0@00)) (not (= k@17@00 j@18@00))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((k@17@00 Int) (j@18@00 Int)) (!
  (=>
    (and
      (>= k@17@00 0)
      (and
        (< k@17@00 (Seq_length xs@0@00))
        (and
          (>= j@18@00 0)
          (and (< j@18@00 (Seq_length xs@0@00)) (not (= k@17@00 j@18@00))))))
    (not (= (Seq_index xs@0@00 k@17@00) (Seq_index xs@0@00 j@18@00))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@20@12@20@104|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@17@00 Int) (j@18@00 Int)) (!
  (=>
    (and
      (>= k@17@00 0)
      (and
        (< k@17@00 (Seq_length xs@0@00))
        (and
          (>= j@18@00 0)
          (and (< j@18@00 (Seq_length xs@0@00)) (not (= k@17@00 j@18@00))))))
    (not (= (Seq_index xs@0@00 k@17@00) (Seq_index xs@0@00 j@18@00))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@20@12@20@104|)))
(declare-const j@19@00 Int)
(push) ; 3
; [eval] 0 <= j && j < |xs|
; [eval] 0 <= j
(push) ; 4
; [then-branch: 13 | !(0 <= j@19@00) | live]
; [else-branch: 13 | 0 <= j@19@00 | live]
(push) ; 5
; [then-branch: 13 | !(0 <= j@19@00)]
(assert (not (<= 0 j@19@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | 0 <= j@19@00]
(assert (<= 0 j@19@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@19@00) (not (<= 0 j@19@00))))
(assert (and (<= 0 j@19@00) (< j@19@00 (Seq_length xs@0@00))))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@19@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@20@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@21@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@19@00 Int)) (!
  (=>
    (and (<= 0 j@19@00) (< j@19@00 (Seq_length xs@0@00)))
    (or (<= 0 j@19@00) (not (<= 0 j@19@00))))
  :pattern ((Seq_index xs@0@00 j@19@00))
  :qid |item-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@19@00 Int) (j2@19@00 Int)) (!
  (=>
    (and
      (and (<= 0 j1@19@00) (< j1@19@00 (Seq_length xs@0@00)))
      (and (<= 0 j2@19@00) (< j2@19@00 (Seq_length xs@0@00)))
      (= (Seq_index xs@0@00 j1@19@00) (Seq_index xs@0@00 j2@19@00)))
    (= j1@19@00 j2@19@00))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@19@00 Int)) (!
  (=>
    (and (<= 0 j@19@00) (< j@19@00 (Seq_length xs@0@00)))
    (and
      (= (inv@20@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@19@00)) j@19@00)
      (img@21@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@19@00))))
  :pattern ((Seq_index xs@0@00 j@19@00))
  :qid |item-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@00 s@$ xs@0@00 i@1@00 r)
      (and
        (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
        (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@20@00 s@$ xs@0@00 i@1@00 r)) r))
  :pattern ((inv@20@00 s@$ xs@0@00 i@1@00 r))
  :qid |item-fctOfInv|)))
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
          (img@14@00 s@$ xs@0@00 i@1@00 r)
          (and
            (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
            (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
        (/ (to_real 1) (to_real 77))
        $Perm.No)
      (ite
        (and
          (and
            (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
            (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
          (img@21@00 s@$ xs@0@00 i@1@00 r)
          (= r (Seq_index xs@0@00 (inv@20@00 s@$ xs@0@00 i@1@00 r))))
        ($Perm.min
          (ite
            (and
              (img@14@00 s@$ xs@0@00 i@1@00 r)
              (and
                (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
                (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
            (/ (to_real 1) (to_real 77))
            $Perm.No)
          (/ (to_real 1) (to_real 77)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-13|))))
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
      (and
        (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
        (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
      (img@21@00 s@$ xs@0@00 i@1@00 r)
      (= r (Seq_index xs@0@00 (inv@20@00 s@$ xs@0@00 i@1@00 r))))
    (=
      (-
        (/ (to_real 1) (to_real 77))
        (ite
          (and
            (and
              (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
              (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
            (img@21@00 s@$ xs@0@00 i@1@00 r)
            (= r (Seq_index xs@0@00 (inv@20@00 s@$ xs@0@00 i@1@00 r))))
          ($Perm.min
            (ite
              (and
                (img@14@00 s@$ xs@0@00 i@1@00 r)
                (and
                  (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
                  (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
              (/ (to_real 1) (to_real 77))
              $Perm.No)
            (/ (to_real 1) (to_real 77)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@22@00 ($Snap Seq<$Ref> Int) $FVF<item>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_item (sm@22@00 s@$ xs@0@00 i@1@00)))
      (and
        (and
          (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
          (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
        (img@21@00 s@$ xs@0@00 i@1@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
          (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
        (img@21@00 s@$ xs@0@00 i@1@00 r))
      (Set_in r ($FVF.domain_item (sm@22@00 s@$ xs@0@00 i@1@00)))))
  :pattern ((Set_in r ($FVF.domain_item (sm@22@00 s@$ xs@0@00 i@1@00))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
          (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
        (img@21@00 s@$ xs@0@00 i@1@00 r))
      (and
        (img@14@00 s@$ xs@0@00 i@1@00 r)
        (and
          (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
          (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))))
    (=
      ($FVF.lookup_item (sm@22@00 s@$ xs@0@00 i@1@00) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_item (sm@22@00 s@$ xs@0@00 i@1@00) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef0|)))
(assert (seqToSeqHelper_frac%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<item>To$Snap (sm@22@00 s@$ xs@0@00 i@1@00))
        $Snap.unit)))) xs@0@00 (+ i@1@00 1)))
(pop) ; 2
; Joined path conditions
(assert (forall ((j@19@00 Int)) (!
  (=>
    (and (<= 0 j@19@00) (< j@19@00 (Seq_length xs@0@00)))
    (and
      (= (inv@20@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@19@00)) j@19@00)
      (img@21@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@19@00))))
  :pattern ((Seq_index xs@0@00 j@19@00))
  :qid |item-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@00 s@$ xs@0@00 i@1@00 r)
      (and
        (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
        (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@20@00 s@$ xs@0@00 i@1@00 r)) r))
  :pattern ((inv@20@00 s@$ xs@0@00 i@1@00 r))
  :qid |item-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_item (sm@22@00 s@$ xs@0@00 i@1@00)))
      (and
        (and
          (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
          (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
        (img@21@00 s@$ xs@0@00 i@1@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
          (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
        (img@21@00 s@$ xs@0@00 i@1@00 r))
      (Set_in r ($FVF.domain_item (sm@22@00 s@$ xs@0@00 i@1@00)))))
  :pattern ((Set_in r ($FVF.domain_item (sm@22@00 s@$ xs@0@00 i@1@00))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
          (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
        (img@21@00 s@$ xs@0@00 i@1@00 r))
      (and
        (img@14@00 s@$ xs@0@00 i@1@00 r)
        (and
          (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
          (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))))
    (=
      ($FVF.lookup_item (sm@22@00 s@$ xs@0@00 i@1@00) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_item (sm@22@00 s@$ xs@0@00 i@1@00) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef0|)))
(assert (and
  (<= 0 (+ i@1@00 1))
  (<= (+ i@1@00 1) (Seq_length xs@0@00))
  (forall ((k@17@00 Int) (j@18@00 Int)) (!
    (=>
      (and
        (>= k@17@00 0)
        (and
          (< k@17@00 (Seq_length xs@0@00))
          (and
            (>= j@18@00 0)
            (and (< j@18@00 (Seq_length xs@0@00)) (not (= k@17@00 j@18@00))))))
      (not (= (Seq_index xs@0@00 k@17@00) (Seq_index xs@0@00 j@18@00))))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@20@12@20@104|))
  (forall ((j@19@00 Int)) (!
    (=>
      (and (<= 0 j@19@00) (< j@19@00 (Seq_length xs@0@00)))
      (or (<= 0 j@19@00) (not (<= 0 j@19@00))))
    :pattern ((Seq_index xs@0@00 j@19@00))
    :qid |item-aux|))
  (seqToSeqHelper_frac%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<item>To$Snap (sm@22@00 s@$ xs@0@00 i@1@00))
          $Snap.unit)))) xs@0@00 (+ i@1@00 1))))
(assert (=
  result@2@00
  (Seq_append
    (Seq_singleton ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
      xs@0@00
      i@1@00)))
    (seqToSeqHelper_frac ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<item>To$Snap (sm@22@00 s@$ xs@0@00 i@1@00))
            $Snap.unit)))) xs@0@00 (+ i@1@00 1)))))
; [eval] |result| == |xs| - i
; [eval] |result|
; [eval] |xs| - i
; [eval] |xs|
(set-option :timeout 0)
(push) ; 2
(assert (not (= (Seq_length result@2@00) (- (Seq_length xs@0@00) i@1@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length result@2@00) (- (Seq_length xs@0@00) i@1@00)))
; [eval] (forall j: Int :: { xs[j] } i <= j && j < |xs| ==> result[j - i] == xs[j].item)
(declare-const j@23@00 Int)
(push) ; 2
; [eval] i <= j && j < |xs| ==> result[j - i] == xs[j].item
; [eval] i <= j && j < |xs|
; [eval] i <= j
(push) ; 3
; [then-branch: 14 | !(i@1@00 <= j@23@00) | live]
; [else-branch: 14 | i@1@00 <= j@23@00 | live]
(push) ; 4
; [then-branch: 14 | !(i@1@00 <= j@23@00)]
(assert (not (<= i@1@00 j@23@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | i@1@00 <= j@23@00]
(assert (<= i@1@00 j@23@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= i@1@00 j@23@00) (not (<= i@1@00 j@23@00))))
(push) ; 3
; [then-branch: 15 | i@1@00 <= j@23@00 && j@23@00 < |xs@0@00| | live]
; [else-branch: 15 | !(i@1@00 <= j@23@00 && j@23@00 < |xs@0@00|) | live]
(push) ; 4
; [then-branch: 15 | i@1@00 <= j@23@00 && j@23@00 < |xs@0@00|]
(assert (and (<= i@1@00 j@23@00) (< j@23@00 (Seq_length xs@0@00))))
; [eval] result[j - i] == xs[j].item
; [eval] result[j - i]
; [eval] j - i
(push) ; 5
(assert (not (>= (- j@23@00 i@1@00) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (- j@23@00 i@1@00) (Seq_length result@2@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@23@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@14@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@23@00))
  (and
    (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@23@00)))
    (<
      (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@23@00))
      (Seq_length xs@0@00))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 15 | !(i@1@00 <= j@23@00 && j@23@00 < |xs@0@00|)]
(assert (not (and (<= i@1@00 j@23@00) (< j@23@00 (Seq_length xs@0@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= i@1@00 j@23@00) (< j@23@00 (Seq_length xs@0@00))))
  (and (<= i@1@00 j@23@00) (< j@23@00 (Seq_length xs@0@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@23@00 Int)) (!
  (and
    (or (<= i@1@00 j@23@00) (not (<= i@1@00 j@23@00)))
    (or
      (not (and (<= i@1@00 j@23@00) (< j@23@00 (Seq_length xs@0@00))))
      (and (<= i@1@00 j@23@00) (< j@23@00 (Seq_length xs@0@00)))))
  :pattern ((Seq_index xs@0@00 j@23@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@25@12@25@79-aux|)))
(push) ; 2
(assert (not (forall ((j@23@00 Int)) (!
  (=>
    (and (<= i@1@00 j@23@00) (< j@23@00 (Seq_length xs@0@00)))
    (=
      (Seq_index result@2@00 (- j@23@00 i@1@00))
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
        xs@0@00
        j@23@00))))
  :pattern ((Seq_index xs@0@00 j@23@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@25@12@25@79|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@23@00 Int)) (!
  (=>
    (and (<= i@1@00 j@23@00) (< j@23@00 (Seq_length xs@0@00)))
    (=
      (Seq_index result@2@00 (- j@23@00 i@1@00))
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
        xs@0@00
        j@23@00))))
  :pattern ((Seq_index xs@0@00 j@23@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@25@12@25@79|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (i@1@00 Int)) (!
  (and
    (forall ((j@12@00 Int)) (!
      (=>
        (and (<= 0 j@12@00) (< j@12@00 (Seq_length xs@0@00)))
        (and
          (= (inv@13@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@12@00)) j@12@00)
          (img@14@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@12@00))))
      :pattern ((Seq_index xs@0@00 j@12@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@14@00 s@$ xs@0@00 i@1@00 r)
          (and
            (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
            (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
        (= (Seq_index xs@0@00 (inv@13@00 s@$ xs@0@00 i@1@00 r)) r))
      :pattern ((inv@13@00 s@$ xs@0@00 i@1@00 r))
      :qid |item-fctOfInv|))
    (forall ((j@19@00 Int)) (!
      (=>
        (and (<= 0 j@19@00) (< j@19@00 (Seq_length xs@0@00)))
        (and
          (= (inv@20@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@19@00)) j@19@00)
          (img@21@00 s@$ xs@0@00 i@1@00 (Seq_index xs@0@00 j@19@00))))
      :pattern ((Seq_index xs@0@00 j@19@00))
      :qid |item-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@21@00 s@$ xs@0@00 i@1@00 r)
          (and
            (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
            (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00))))
        (= (Seq_index xs@0@00 (inv@20@00 s@$ xs@0@00 i@1@00 r)) r))
      :pattern ((inv@20@00 s@$ xs@0@00 i@1@00 r))
      :qid |item-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_item (sm@22@00 s@$ xs@0@00 i@1@00)))
          (and
            (and
              (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
              (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
            (img@21@00 s@$ xs@0@00 i@1@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
              (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
            (img@21@00 s@$ xs@0@00 i@1@00 r))
          (Set_in r ($FVF.domain_item (sm@22@00 s@$ xs@0@00 i@1@00)))))
      :pattern ((Set_in r ($FVF.domain_item (sm@22@00 s@$ xs@0@00 i@1@00))))
      :qid |qp.fvfDomDef1|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@20@00 s@$ xs@0@00 i@1@00 r))
              (< (inv@20@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))
            (img@21@00 s@$ xs@0@00 i@1@00 r))
          (and
            (img@14@00 s@$ xs@0@00 i@1@00 r)
            (and
              (<= 0 (inv@13@00 s@$ xs@0@00 i@1@00 r))
              (< (inv@13@00 s@$ xs@0@00 i@1@00 r) (Seq_length xs@0@00)))))
        (=
          ($FVF.lookup_item (sm@22@00 s@$ xs@0@00 i@1@00) r)
          ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_item (sm@22@00 s@$ xs@0@00 i@1@00) r))
      :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef0|))
    (=>
      (seqToSeqHelper_frac%precondition s@$ xs@0@00 i@1@00)
      (=
        (seqToSeqHelper_frac s@$ xs@0@00 i@1@00)
        (Seq_append
          (Seq_singleton ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
            xs@0@00
            i@1@00)))
          (seqToSeqHelper_frac%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<item>To$Snap (sm@22@00 s@$ xs@0@00 i@1@00))
                  $Snap.unit)))) xs@0@00 (+ i@1@00 1))))))
  :pattern ((seqToSeqHelper_frac s@$ xs@0@00 i@1@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (i@1@00 Int)) (!
  (=>
    (seqToSeqHelper_frac%precondition s@$ xs@0@00 i@1@00)
    (seqToSeqHelper_frac%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<item>To$Snap (sm@22@00 s@$ xs@0@00 i@1@00))
            $Snap.unit)))) xs@0@00 (+ i@1@00 1)))
  :pattern ((seqToSeqHelper_frac s@$ xs@0@00 i@1@00))
  :qid |quant-u-16|)))
; ---------- FUNCTION sumContrib----------
(declare-fun A@3@00 () VCTArray<Ref>)
(declare-fun i@4@00 () Int)
(declare-fun P@5@00 () $Perm)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 / 1 < P
(assert (< $Perm.No P@5@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] P < 1 / 1
(assert (< P@5@00 $Perm.Write))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@4@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] i <= (alen(A): Int)
; [eval] (alen(A): Int)
(assert (<= i@4@00 (alen<Int> A@3@00)))
(declare-const j@24@00 Int)
(push) ; 2
; [eval] 0 <= j && j < (alen(A): Int)
; [eval] 0 <= j
(push) ; 3
; [then-branch: 16 | !(0 <= j@24@00) | live]
; [else-branch: 16 | 0 <= j@24@00 | live]
(push) ; 4
; [then-branch: 16 | !(0 <= j@24@00)]
(assert (not (<= 0 j@24@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | 0 <= j@24@00]
(assert (<= 0 j@24@00))
; [eval] j < (alen(A): Int)
; [eval] (alen(A): Int)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@24@00) (not (<= 0 j@24@00))))
(assert (and (<= 0 j@24@00) (< j@24@00 (alen<Int> A@3@00))))
; [eval] (loc(A, j): Ref)
(declare-const $k@25@00 $Perm)
(assert ($Perm.isReadVar $k@25@00))
(pop) ; 2
(declare-fun inv@26@00 ($Snap VCTArray<Ref> Int $Perm $Ref) Int)
(declare-fun img@27@00 ($Snap VCTArray<Ref> Int $Perm $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@25@00))
; Nested auxiliary terms: non-globals
(assert (forall ((j@24@00 Int)) (!
  (=>
    (and (<= 0 j@24@00) (< j@24@00 (alen<Int> A@3@00)))
    (or (<= 0 j@24@00) (not (<= 0 j@24@00))))
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |item-aux|)))
(push) ; 2
(assert (not (forall ((j@24@00 Int)) (!
  (=>
    (and (<= 0 j@24@00) (< j@24@00 (alen<Int> A@3@00)))
    (or (= $k@25@00 $Perm.No) (< $Perm.No $k@25@00)))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@24@00 Int) (j2@24@00 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 j1@24@00) (< j1@24@00 (alen<Int> A@3@00)))
        (< $Perm.No $k@25@00))
      (and
        (and (<= 0 j2@24@00) (< j2@24@00 (alen<Int> A@3@00)))
        (< $Perm.No $k@25@00))
      (= (loc<Ref> A@3@00 j1@24@00) (loc<Ref> A@3@00 j2@24@00)))
    (= j1@24@00 j2@24@00))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@24@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@24@00) (< j@24@00 (alen<Int> A@3@00)))
      (< $Perm.No $k@25@00))
    (and
      (= (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@24@00)) j@24@00)
      (img@27@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@24@00))))
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
      (and
        (and
          (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@25@00)))
    (= (loc<Ref> A@3@00 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r)) r))
  :pattern ((inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
  :qid |item-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((j@24@00 Int)) (!
  (<= $Perm.No $k@25@00)
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |item-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((j@24@00 Int)) (!
  (<= $k@25@00 $Perm.Write)
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |item-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((j@24@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@24@00) (< j@24@00 (alen<Int> A@3@00)))
      (< $Perm.No $k@25@00))
    (not (= (loc<Ref> A@3@00 j@24@00) $Ref.null)))
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |item-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (A@3@00 VCTArray<Ref>) (i@4@00 Int) (P@5@00 $Perm)) (!
  (=
    (sumContrib%limited s@$ A@3@00 i@4@00 P@5@00)
    (sumContrib s@$ A@3@00 i@4@00 P@5@00))
  :pattern ((sumContrib s@$ A@3@00 i@4@00 P@5@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (A@3@00 VCTArray<Ref>) (i@4@00 Int) (P@5@00 $Perm)) (!
  (sumContrib%stateless A@3@00 i@4@00 P@5@00)
  :pattern ((sumContrib%limited s@$ A@3@00 i@4@00 P@5@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
      (and
        (and
          (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@25@00)))
    (= (loc<Ref> A@3@00 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r)) r))
  :pattern ((inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
  :qid |item-fctOfInv|)))
(assert (forall ((j@24@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@24@00) (< j@24@00 (alen<Int> A@3@00)))
      (< $Perm.No $k@25@00))
    (and
      (= (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@24@00)) j@24@00)
      (img@27@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@24@00))))
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |quant-u-18|)))
(assert (forall ((j@24@00 Int)) (!
  (<= $Perm.No $k@25@00)
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |item-permAtLeastZero|)))
(assert (forall ((j@24@00 Int)) (!
  (<= $k@25@00 $Perm.Write)
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |item-permAtMostOne|)))
(assert (forall ((j@24@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@24@00) (< j@24@00 (alen<Int> A@3@00)))
      (< $Perm.No $k@25@00))
    (not (= (loc<Ref> A@3@00 j@24@00) $Ref.null)))
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |item-permImpliesNonNull|)))
(assert ($Perm.isReadVar $k@25@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (< $Perm.No P@5@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (< P@5@00 $Perm.Write))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= 0 i@4@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (<= i@4@00 (alen<Int> A@3@00)))
(assert (forall ((j@24@00 Int)) (!
  (=>
    (and (<= 0 j@24@00) (< j@24@00 (alen<Int> A@3@00)))
    (or (<= 0 j@24@00) (not (<= 0 j@24@00))))
  :pattern ((loc<Ref> A@3@00 j@24@00))
  :qid |item-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i == (alen(A): Int) ? 0 : (loc(A, i): Ref).item + sumContrib(A, i + 1, P))
; [eval] i == (alen(A): Int)
; [eval] (alen(A): Int)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= i@4@00 (alen<Int> A@3@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= i@4@00 (alen<Int> A@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | i@4@00 == alen[Int](A@3@00) | live]
; [else-branch: 17 | i@4@00 != alen[Int](A@3@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | i@4@00 == alen[Int](A@3@00)]
(assert (= i@4@00 (alen<Int> A@3@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 17 | i@4@00 != alen[Int](A@3@00)]
(assert (not (= i@4@00 (alen<Int> A@3@00))))
; [eval] (loc(A, i): Ref).item + sumContrib(A, i + 1, P)
; [eval] (loc(A, i): Ref)
(push) ; 4
(assert (not (ite
  (and
    (img@27@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 i@4@00))
    (and
      (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 i@4@00)))
      (<
        (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 i@4@00))
        (alen<Int> A@3@00))))
  (< $Perm.No $k@25@00)
  false)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] sumContrib(A, i + 1, P)
; [eval] i + 1
(push) ; 4
; [eval] 0 / 1 < P
; [eval] P < 1 / 1
; [eval] 0 <= i
(push) ; 5
(assert (not (<= 0 (+ i@4@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ i@4@00 1)))
; [eval] i <= (alen(A): Int)
; [eval] (alen(A): Int)
(push) ; 5
(assert (not (<= (+ i@4@00 1) (alen<Int> A@3@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@4@00 1) (alen<Int> A@3@00)))
(declare-const j@28@00 Int)
(push) ; 5
; [eval] 0 <= j && j < (alen(A): Int)
; [eval] 0 <= j
(push) ; 6
; [then-branch: 18 | !(0 <= j@28@00) | live]
; [else-branch: 18 | 0 <= j@28@00 | live]
(push) ; 7
; [then-branch: 18 | !(0 <= j@28@00)]
(assert (not (<= 0 j@28@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 18 | 0 <= j@28@00]
(assert (<= 0 j@28@00))
; [eval] j < (alen(A): Int)
; [eval] (alen(A): Int)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@28@00) (not (<= 0 j@28@00))))
(assert (and (<= 0 j@28@00) (< j@28@00 (alen<Int> A@3@00))))
(declare-const $k@29@00 $Perm)
(assert ($Perm.isReadVar $k@29@00))
; [eval] (loc(A, j): Ref)
(pop) ; 5
(declare-fun inv@30@00 ($Snap VCTArray<Ref> Int $Perm $Ref) Int)
(declare-fun img@31@00 ($Snap VCTArray<Ref> Int $Perm $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@29@00))
; Nested auxiliary terms: non-globals
(assert (forall ((j@28@00 Int)) (!
  (=>
    (and (<= 0 j@28@00) (< j@28@00 (alen<Int> A@3@00)))
    (or (<= 0 j@28@00) (not (<= 0 j@28@00))))
  :pattern ((loc<Ref> A@3@00 j@28@00))
  :qid |item-aux|)))
(push) ; 5
(assert (not (forall ((j@28@00 Int)) (!
  (=>
    (and (<= 0 j@28@00) (< j@28@00 (alen<Int> A@3@00)))
    (or (= $k@29@00 $Perm.No) (< $Perm.No $k@29@00)))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((j1@28@00 Int) (j2@28@00 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 j1@28@00) (< j1@28@00 (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00))
      (and
        (and (<= 0 j2@28@00) (< j2@28@00 (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00))
      (= (loc<Ref> A@3@00 j1@28@00) (loc<Ref> A@3@00 j2@28@00)))
    (= j1@28@00 j2@28@00))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@28@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@28@00) (< j@28@00 (alen<Int> A@3@00)))
      (< $Perm.No $k@29@00))
    (and
      (= (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@28@00)) j@28@00)
      (img@31@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@28@00))))
  :pattern ((loc<Ref> A@3@00 j@28@00))
  :qid |item-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)))
    (= (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r)) r))
  :pattern ((inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
  :qid |item-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@29@00
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
            (and
              (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
          $k@25@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
        (and
          (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
      (<
        (ite
          (and
            (and
              (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
            (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
            (= r (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))))
          $k@29@00
          $Perm.No)
        $k@25@00)
      (<
        (ite
          (and
            (and
              (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
            (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
            (= r (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))))
          $k@29@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@27@00 s@$ A@3@00 i@4@00 P@5@00 r))
  :pattern ((inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
  :pattern ((img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
  :pattern ((loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r)))
  :qid |qp.srp2|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
        (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
      (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
      (= r (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))))
    (=
      (-
        $k@29@00
        (ite
          (and
            (and
              (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
            (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
            (= r (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))))
          ($Perm.min
            (ite
              (and
                (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
                (and
                  (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
                  (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
              $k@25@00
              $Perm.No)
            $k@29@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@32@00 ($Snap VCTArray<Ref> Int $Perm) $FVF<item>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)
        (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)
        (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
      (Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))
  :pattern ((Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00))))
  :qid |qp.fvfDomDef4|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)
        (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
      (ite
        (and
          (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
          (and
            (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
            (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
        (< $Perm.No $k@25@00)
        false))
    (=
      ($FVF.lookup_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef3|)))
(assert (sumContrib%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<item>To$Snap (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))) A@3@00 (+
  i@4@00
  1) P@5@00))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@29@00))
(assert (forall ((j@28@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@28@00) (< j@28@00 (alen<Int> A@3@00)))
      (< $Perm.No $k@29@00))
    (and
      (= (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@28@00)) j@28@00)
      (img@31@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@28@00))))
  :pattern ((loc<Ref> A@3@00 j@28@00))
  :qid |item-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)))
    (= (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r)) r))
  :pattern ((inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
  :qid |item-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)
        (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)
        (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
      (Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))
  :pattern ((Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00))))
  :qid |qp.fvfDomDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)
        (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
      (ite
        (and
          (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
          (and
            (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
            (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
        (< $Perm.No $k@25@00)
        false))
    (=
      ($FVF.lookup_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef3|)))
(assert (and
  (<= 0 (+ i@4@00 1))
  (<= (+ i@4@00 1) (alen<Int> A@3@00))
  (forall ((j@28@00 Int)) (!
    (=>
      (and (<= 0 j@28@00) (< j@28@00 (alen<Int> A@3@00)))
      (or (<= 0 j@28@00) (not (<= 0 j@28@00))))
    :pattern ((loc<Ref> A@3@00 j@28@00))
    :qid |item-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
              (and
                (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
                (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
            $k@25@00
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
          (and
            (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
            (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
        (<
          (ite
            (and
              (and
                (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
                (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
              (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
              (= r (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))))
            $k@29@00
            $Perm.No)
          $k@25@00)
        (<
          (ite
            (and
              (and
                (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
                (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
              (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
              (= r (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))))
            $k@29@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@27@00 s@$ A@3@00 i@4@00 P@5@00 r))
    :pattern ((inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
    :pattern ((img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
    :pattern ((loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r)))
    :qid |qp.srp2|))
  (sumContrib%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<item>To$Snap (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))) A@3@00 (+
    i@4@00
    1) P@5@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@29@00))
(assert (forall ((j@28@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@28@00) (< j@28@00 (alen<Int> A@3@00)))
      (< $Perm.No $k@29@00))
    (and
      (= (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@28@00)) j@28@00)
      (img@31@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@28@00))))
  :pattern ((loc<Ref> A@3@00 j@28@00))
  :qid |item-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)))
    (= (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r)) r))
  :pattern ((inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
  :qid |item-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)
        (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)
        (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
      (Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))
  :pattern ((Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00))))
  :qid |qp.fvfDomDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
        (< $Perm.No $k@29@00)
        (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
      (ite
        (and
          (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
          (and
            (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
            (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
        (< $Perm.No $k@25@00)
        false))
    (=
      ($FVF.lookup_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef3|)))
(assert (=>
  (not (= i@4@00 (alen<Int> A@3@00)))
  (and
    (not (= i@4@00 (alen<Int> A@3@00)))
    (<= 0 (+ i@4@00 1))
    (<= (+ i@4@00 1) (alen<Int> A@3@00))
    (forall ((j@28@00 Int)) (!
      (=>
        (and (<= 0 j@28@00) (< j@28@00 (alen<Int> A@3@00)))
        (or (<= 0 j@28@00) (not (<= 0 j@28@00))))
      :pattern ((loc<Ref> A@3@00 j@28@00))
      :qid |item-aux|))
    (forall ((r $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
                (and
                  (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
                  (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
              $k@25@00
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
            (and
              (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
                  (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
                (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
                (= r (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))))
              $k@29@00
              $Perm.No)
            $k@25@00)
          (<
            (ite
              (and
                (and
                  (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
                  (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
                (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
                (= r (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))))
              $k@29@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@27@00 s@$ A@3@00 i@4@00 P@5@00 r))
      :pattern ((inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
      :pattern ((img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
      :pattern ((loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r)))
      :qid |qp.srp2|))
    (sumContrib%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<item>To$Snap (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))) A@3@00 (+
      i@4@00
      1) P@5@00))))
(assert (or (not (= i@4@00 (alen<Int> A@3@00))) (= i@4@00 (alen<Int> A@3@00))))
(assert (=
  result@6@00
  (ite
    (= i@4@00 (alen<Int> A@3@00))
    0
    (+
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (loc<Ref> A@3@00 i@4@00))
      (sumContrib ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<item>To$Snap (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))) A@3@00 (+
        i@4@00
        1) P@5@00)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (A@3@00 VCTArray<Ref>) (i@4@00 Int) (P@5@00 $Perm)) (!
  (and
    (forall ((j@24@00 Int)) (!
      (=>
        (and
          (and (<= 0 j@24@00) (< j@24@00 (alen<Int> A@3@00)))
          (< $Perm.No $k@25@00))
        (and
          (=
            (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@24@00))
            j@24@00)
          (img@27@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@24@00))))
      :pattern ((loc<Ref> A@3@00 j@24@00))
      :qid |quant-u-18|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
          (and
            (and
              (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
            (< $Perm.No $k@25@00)))
        (= (loc<Ref> A@3@00 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r)) r))
      :pattern ((inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
      :qid |item-fctOfInv|))
    (forall ((j@28@00 Int)) (!
      (=>
        (and
          (and (<= 0 j@28@00) (< j@28@00 (alen<Int> A@3@00)))
          (< $Perm.No $k@29@00))
        (and
          (=
            (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@28@00))
            j@28@00)
          (img@31@00 s@$ A@3@00 i@4@00 P@5@00 (loc<Ref> A@3@00 j@28@00))))
      :pattern ((loc<Ref> A@3@00 j@28@00))
      :qid |item-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)
          (and
            (and
              (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
            (< $Perm.No $k@29@00)))
        (= (loc<Ref> A@3@00 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r)) r))
      :pattern ((inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
      :qid |item-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))
          (and
            (and
              (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
            (< $Perm.No $k@29@00)
            (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
            (< $Perm.No $k@29@00)
            (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))
      :pattern ((Set_in r ($FVF.domain_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00))))
      :qid |qp.fvfDomDef4|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r))
              (< (inv@30@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00)))
            (< $Perm.No $k@29@00)
            (img@31@00 s@$ A@3@00 i@4@00 P@5@00 r))
          (ite
            (and
              (img@27@00 s@$ A@3@00 i@4@00 P@5@00 r)
              (and
                (<= 0 (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r))
                (< (inv@26@00 s@$ A@3@00 i@4@00 P@5@00 r) (alen<Int> A@3@00))))
            (< $Perm.No $k@25@00)
            false))
        (=
          ($FVF.lookup_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00) r)
          ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_item (sm@32@00 s@$ A@3@00 i@4@00 P@5@00) r))
      :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef3|))
    ($Perm.isReadVar $k@25@00)
    ($Perm.isReadVar $k@29@00)
    (=>
      (sumContrib%precondition s@$ A@3@00 i@4@00 P@5@00)
      (=
        (sumContrib s@$ A@3@00 i@4@00 P@5@00)
        (ite
          (= i@4@00 (alen<Int> A@3@00))
          0
          (+
            ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (loc<Ref> A@3@00 i@4@00))
            (sumContrib%limited ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<item>To$Snap (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))) A@3@00 (+
              i@4@00
              1) P@5@00))))))
  :pattern ((sumContrib s@$ A@3@00 i@4@00 P@5@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (A@3@00 VCTArray<Ref>) (i@4@00 Int) (P@5@00 $Perm)) (!
  (=>
    (sumContrib%precondition s@$ A@3@00 i@4@00 P@5@00)
    (ite
      (= i@4@00 (alen<Int> A@3@00))
      true
      (sumContrib%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<item>To$Snap (sm@32@00 s@$ A@3@00 i@4@00 P@5@00)))))) A@3@00 (+
        i@4@00
        1) P@5@00)))
  :pattern ((sumContrib s@$ A@3@00 i@4@00 P@5@00))
  :qid |quant-u-24|)))
; ---------- FUNCTION seqToSeqHelper_wild----------
(declare-fun xs@7@00 () Seq<$Ref>)
(declare-fun i@8@00 () Int)
(declare-fun result@9@00 () Seq<Int>)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@8@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] i <= |xs|
; [eval] |xs|
(assert (<= i@8@00 (Seq_length xs@7@00)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@33@00 Int)
(declare-const j@34@00 Int)
(push) ; 2
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 19 | !(k@33@00 >= 0) | live]
; [else-branch: 19 | k@33@00 >= 0 | live]
(push) ; 4
; [then-branch: 19 | !(k@33@00 >= 0)]
(assert (not (>= k@33@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 19 | k@33@00 >= 0]
(assert (>= k@33@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 20 | !(k@33@00 < |xs@7@00|) | live]
; [else-branch: 20 | k@33@00 < |xs@7@00| | live]
(push) ; 6
; [then-branch: 20 | !(k@33@00 < |xs@7@00|)]
(assert (not (< k@33@00 (Seq_length xs@7@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 20 | k@33@00 < |xs@7@00|]
(assert (< k@33@00 (Seq_length xs@7@00)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 21 | !(j@34@00 >= 0) | live]
; [else-branch: 21 | j@34@00 >= 0 | live]
(push) ; 8
; [then-branch: 21 | !(j@34@00 >= 0)]
(assert (not (>= j@34@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 21 | j@34@00 >= 0]
(assert (>= j@34@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 22 | !(j@34@00 < |xs@7@00|) | live]
; [else-branch: 22 | j@34@00 < |xs@7@00| | live]
(push) ; 10
; [then-branch: 22 | !(j@34@00 < |xs@7@00|)]
(assert (not (< j@34@00 (Seq_length xs@7@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 22 | j@34@00 < |xs@7@00|]
(assert (< j@34@00 (Seq_length xs@7@00)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@34@00 (Seq_length xs@7@00)) (not (< j@34@00 (Seq_length xs@7@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@34@00 0)
  (and
    (>= j@34@00 0)
    (or (< j@34@00 (Seq_length xs@7@00)) (not (< j@34@00 (Seq_length xs@7@00)))))))
(assert (or (>= j@34@00 0) (not (>= j@34@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@33@00 (Seq_length xs@7@00))
  (and
    (< k@33@00 (Seq_length xs@7@00))
    (=>
      (>= j@34@00 0)
      (and
        (>= j@34@00 0)
        (or
          (< j@34@00 (Seq_length xs@7@00))
          (not (< j@34@00 (Seq_length xs@7@00))))))
    (or (>= j@34@00 0) (not (>= j@34@00 0))))))
(assert (or (< k@33@00 (Seq_length xs@7@00)) (not (< k@33@00 (Seq_length xs@7@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@33@00 0)
  (and
    (>= k@33@00 0)
    (=>
      (< k@33@00 (Seq_length xs@7@00))
      (and
        (< k@33@00 (Seq_length xs@7@00))
        (=>
          (>= j@34@00 0)
          (and
            (>= j@34@00 0)
            (or
              (< j@34@00 (Seq_length xs@7@00))
              (not (< j@34@00 (Seq_length xs@7@00))))))
        (or (>= j@34@00 0) (not (>= j@34@00 0)))))
    (or (< k@33@00 (Seq_length xs@7@00)) (not (< k@33@00 (Seq_length xs@7@00)))))))
(assert (or (>= k@33@00 0) (not (>= k@33@00 0))))
(push) ; 3
; [then-branch: 23 | k@33@00 >= 0 && k@33@00 < |xs@7@00| && j@34@00 >= 0 && j@34@00 < |xs@7@00| && k@33@00 != j@34@00 | live]
; [else-branch: 23 | !(k@33@00 >= 0 && k@33@00 < |xs@7@00| && j@34@00 >= 0 && j@34@00 < |xs@7@00| && k@33@00 != j@34@00) | live]
(push) ; 4
; [then-branch: 23 | k@33@00 >= 0 && k@33@00 < |xs@7@00| && j@34@00 >= 0 && j@34@00 < |xs@7@00| && k@33@00 != j@34@00]
(assert (and
  (>= k@33@00 0)
  (and
    (< k@33@00 (Seq_length xs@7@00))
    (and
      (>= j@34@00 0)
      (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 4
(push) ; 4
; [else-branch: 23 | !(k@33@00 >= 0 && k@33@00 < |xs@7@00| && j@34@00 >= 0 && j@34@00 < |xs@7@00| && k@33@00 != j@34@00)]
(assert (not
  (and
    (>= k@33@00 0)
    (and
      (< k@33@00 (Seq_length xs@7@00))
      (and
        (>= j@34@00 0)
        (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@33@00 0)
    (and
      (< k@33@00 (Seq_length xs@7@00))
      (and
        (>= j@34@00 0)
        (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00))))))
  (and
    (>= k@33@00 0)
    (< k@33@00 (Seq_length xs@7@00))
    (>= j@34@00 0)
    (< j@34@00 (Seq_length xs@7@00))
    (not (= k@33@00 j@34@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@33@00 0)
      (and
        (< k@33@00 (Seq_length xs@7@00))
        (and
          (>= j@34@00 0)
          (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00)))))))
  (and
    (>= k@33@00 0)
    (and
      (< k@33@00 (Seq_length xs@7@00))
      (and
        (>= j@34@00 0)
        (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@33@00 Int) (j@34@00 Int)) (!
  (and
    (=>
      (>= k@33@00 0)
      (and
        (>= k@33@00 0)
        (=>
          (< k@33@00 (Seq_length xs@7@00))
          (and
            (< k@33@00 (Seq_length xs@7@00))
            (=>
              (>= j@34@00 0)
              (and
                (>= j@34@00 0)
                (or
                  (< j@34@00 (Seq_length xs@7@00))
                  (not (< j@34@00 (Seq_length xs@7@00))))))
            (or (>= j@34@00 0) (not (>= j@34@00 0)))))
        (or
          (< k@33@00 (Seq_length xs@7@00))
          (not (< k@33@00 (Seq_length xs@7@00))))))
    (or (>= k@33@00 0) (not (>= k@33@00 0)))
    (=>
      (and
        (>= k@33@00 0)
        (and
          (< k@33@00 (Seq_length xs@7@00))
          (and
            (>= j@34@00 0)
            (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00))))))
      (and
        (>= k@33@00 0)
        (< k@33@00 (Seq_length xs@7@00))
        (>= j@34@00 0)
        (< j@34@00 (Seq_length xs@7@00))
        (not (= k@33@00 j@34@00))))
    (or
      (not
        (and
          (>= k@33@00 0)
          (and
            (< k@33@00 (Seq_length xs@7@00))
            (and
              (>= j@34@00 0)
              (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00)))))))
      (and
        (>= k@33@00 0)
        (and
          (< k@33@00 (Seq_length xs@7@00))
          (and
            (>= j@34@00 0)
            (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00))))))))
  :pattern ((Seq_index xs@7@00 k@33@00) (Seq_index xs@7@00 j@34@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@8@12@8@104-aux|)))
(assert (forall ((k@33@00 Int) (j@34@00 Int)) (!
  (=>
    (and
      (>= k@33@00 0)
      (and
        (< k@33@00 (Seq_length xs@7@00))
        (and
          (>= j@34@00 0)
          (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00))))))
    (not (= (Seq_index xs@7@00 k@33@00) (Seq_index xs@7@00 j@34@00))))
  :pattern ((Seq_index xs@7@00 k@33@00) (Seq_index xs@7@00 j@34@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@8@12@8@104|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(declare-const j@35@00 Int)
(push) ; 2
; [eval] 0 <= j && j < |xs|
; [eval] 0 <= j
(push) ; 3
; [then-branch: 24 | !(0 <= j@35@00) | live]
; [else-branch: 24 | 0 <= j@35@00 | live]
(push) ; 4
; [then-branch: 24 | !(0 <= j@35@00)]
(assert (not (<= 0 j@35@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 24 | 0 <= j@35@00]
(assert (<= 0 j@35@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@35@00) (not (<= 0 j@35@00))))
(assert (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00))))
; [eval] xs[j]
(push) ; 3
(assert (not (>= j@35@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@36@00 $Perm)
(assert ($Perm.isReadVar $k@36@00))
(pop) ; 2
(declare-fun inv@37@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@38@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@36@00))
; Nested auxiliary terms: non-globals
(assert (forall ((j@35@00 Int)) (!
  (=>
    (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00)))
    (or (<= 0 j@35@00) (not (<= 0 j@35@00))))
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |item-aux|)))
(push) ; 2
(assert (not (forall ((j@35@00 Int)) (!
  (=>
    (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00)))
    (or (= $k@36@00 $Perm.No) (< $Perm.No $k@36@00)))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@35@00 Int) (j2@35@00 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 j1@35@00) (< j1@35@00 (Seq_length xs@7@00)))
        (< $Perm.No $k@36@00))
      (and
        (and (<= 0 j2@35@00) (< j2@35@00 (Seq_length xs@7@00)))
        (< $Perm.No $k@36@00))
      (= (Seq_index xs@7@00 j1@35@00) (Seq_index xs@7@00 j2@35@00)))
    (= j1@35@00 j2@35@00))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@35@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00)))
      (< $Perm.No $k@36@00))
    (and
      (= (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@35@00)) j@35@00)
      (img@38@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@35@00))))
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |quant-u-26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ xs@7@00 i@8@00 r)
      (and
        (and
          (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@36@00)))
    (= (Seq_index xs@7@00 (inv@37@00 s@$ xs@7@00 i@8@00 r)) r))
  :pattern ((inv@37@00 s@$ xs@7@00 i@8@00 r))
  :qid |item-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((j@35@00 Int)) (!
  (<= $Perm.No $k@36@00)
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |item-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((j@35@00 Int)) (!
  (<= $k@36@00 $Perm.Write)
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |item-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((j@35@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00)))
      (< $Perm.No $k@36@00))
    (not (= (Seq_index xs@7@00 j@35@00) $Ref.null)))
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |item-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] i < |xs|
; [eval] |xs|
(assert (< i@8@00 (Seq_length xs@7@00)))
(declare-const $t@39@00 $Snap)
(assert (= $t@39@00 ($Snap.combine ($Snap.first $t@39@00) ($Snap.second $t@39@00))))
(assert (= ($Snap.first $t@39@00) $Snap.unit))
; [eval] |result| == |xs| - i
; [eval] |result|
; [eval] |xs| - i
; [eval] |xs|
(assert (= (Seq_length result@9@00) (- (Seq_length xs@7@00) i@8@00)))
(assert (= ($Snap.second $t@39@00) $Snap.unit))
; [eval] (forall j: Int :: { xs[j] } i <= j && j < |xs| ==> result[j - i] == xs[j].item)
(declare-const j@40@00 Int)
(push) ; 2
; [eval] i <= j && j < |xs| ==> result[j - i] == xs[j].item
; [eval] i <= j && j < |xs|
; [eval] i <= j
(push) ; 3
; [then-branch: 25 | !(i@8@00 <= j@40@00) | live]
; [else-branch: 25 | i@8@00 <= j@40@00 | live]
(push) ; 4
; [then-branch: 25 | !(i@8@00 <= j@40@00)]
(assert (not (<= i@8@00 j@40@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 25 | i@8@00 <= j@40@00]
(assert (<= i@8@00 j@40@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= i@8@00 j@40@00) (not (<= i@8@00 j@40@00))))
(push) ; 3
; [then-branch: 26 | i@8@00 <= j@40@00 && j@40@00 < |xs@7@00| | live]
; [else-branch: 26 | !(i@8@00 <= j@40@00 && j@40@00 < |xs@7@00|) | live]
(push) ; 4
; [then-branch: 26 | i@8@00 <= j@40@00 && j@40@00 < |xs@7@00|]
(assert (and (<= i@8@00 j@40@00) (< j@40@00 (Seq_length xs@7@00))))
; [eval] result[j - i] == xs[j].item
; [eval] result[j - i]
; [eval] j - i
(push) ; 5
(assert (not (>= (- j@40@00 i@8@00) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (- j@40@00 i@8@00) (Seq_length result@9@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@40@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (ite
  (and
    (img@38@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@40@00))
    (and
      (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@40@00)))
      (<
        (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@40@00))
        (Seq_length xs@7@00))))
  (< $Perm.No $k@36@00)
  false)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 26 | !(i@8@00 <= j@40@00 && j@40@00 < |xs@7@00|)]
(assert (not (and (<= i@8@00 j@40@00) (< j@40@00 (Seq_length xs@7@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= i@8@00 j@40@00) (< j@40@00 (Seq_length xs@7@00))))
  (and (<= i@8@00 j@40@00) (< j@40@00 (Seq_length xs@7@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@40@00 Int)) (!
  (and
    (or (<= i@8@00 j@40@00) (not (<= i@8@00 j@40@00)))
    (or
      (not (and (<= i@8@00 j@40@00) (< j@40@00 (Seq_length xs@7@00))))
      (and (<= i@8@00 j@40@00) (< j@40@00 (Seq_length xs@7@00)))))
  :pattern ((Seq_index xs@7@00 j@40@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@13@12@13@79-aux|)))
(assert (forall ((j@40@00 Int)) (!
  (=>
    (and (<= i@8@00 j@40@00) (< j@40@00 (Seq_length xs@7@00)))
    (=
      (Seq_index result@9@00 (- j@40@00 i@8@00))
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
        xs@7@00
        j@40@00))))
  :pattern ((Seq_index xs@7@00 j@40@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@13@12@13@79|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (i@8@00 Int)) (!
  (=
    (seqToSeqHelper_wild%limited s@$ xs@7@00 i@8@00)
    (seqToSeqHelper_wild s@$ xs@7@00 i@8@00))
  :pattern ((seqToSeqHelper_wild s@$ xs@7@00 i@8@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (i@8@00 Int)) (!
  (seqToSeqHelper_wild%stateless xs@7@00 i@8@00)
  :pattern ((seqToSeqHelper_wild%limited s@$ xs@7@00 i@8@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (i@8@00 Int)) (!
  (let ((result@9@00 (seqToSeqHelper_wild%limited s@$ xs@7@00 i@8@00))) (and
    (forall ((j@35@00 Int)) (!
      (=>
        (and
          (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00)))
          (< $Perm.No $k@36@00))
        (and
          (= (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@35@00)) j@35@00)
          (img@38@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@35@00))))
      :pattern ((Seq_index xs@7@00 j@35@00))
      :qid |quant-u-26|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@38@00 s@$ xs@7@00 i@8@00 r)
          (and
            (and
              (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
            (< $Perm.No $k@36@00)))
        (= (Seq_index xs@7@00 (inv@37@00 s@$ xs@7@00 i@8@00 r)) r))
      :pattern ((inv@37@00 s@$ xs@7@00 i@8@00 r))
      :qid |item-fctOfInv|))
    ($Perm.isReadVar $k@36@00)
    (=>
      (seqToSeqHelper_wild%precondition s@$ xs@7@00 i@8@00)
      (and
        (= (Seq_length result@9@00) (- (Seq_length xs@7@00) i@8@00))
        (forall ((j Int)) (!
          (=>
            (and (<= i@8@00 j) (< j (Seq_length xs@7@00)))
            (=
              (Seq_index result@9@00 (- j i@8@00))
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
                xs@7@00
                j))))
          :pattern ((Seq_index xs@7@00 j))
          ))))))
  :pattern ((seqToSeqHelper_wild%limited s@$ xs@7@00 i@8@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (i@8@00 Int)) (!
  (let ((result@9@00 (seqToSeqHelper_wild%limited s@$ xs@7@00 i@8@00))) true)
  :pattern ((seqToSeqHelper_wild%limited s@$ xs@7@00 i@8@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (i@8@00 Int)) (!
  (let ((result@9@00 (seqToSeqHelper_wild%limited s@$ xs@7@00 i@8@00))) true)
  :pattern ((seqToSeqHelper_wild%limited s@$ xs@7@00 i@8@00))
  :qid |quant-u-29|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ xs@7@00 i@8@00 r)
      (and
        (and
          (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@36@00)))
    (= (Seq_index xs@7@00 (inv@37@00 s@$ xs@7@00 i@8@00 r)) r))
  :pattern ((inv@37@00 s@$ xs@7@00 i@8@00 r))
  :qid |item-fctOfInv|)))
(assert (forall ((j@35@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00)))
      (< $Perm.No $k@36@00))
    (and
      (= (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@35@00)) j@35@00)
      (img@38@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@35@00))))
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |quant-u-26|)))
(assert (forall ((j@35@00 Int)) (!
  (<= $Perm.No $k@36@00)
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |item-permAtLeastZero|)))
(assert (forall ((j@35@00 Int)) (!
  (<= $k@36@00 $Perm.Write)
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |item-permAtMostOne|)))
(assert (forall ((j@35@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00)))
      (< $Perm.No $k@36@00))
    (not (= (Seq_index xs@7@00 j@35@00) $Ref.null)))
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |item-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (< i@8@00 (Seq_length xs@7@00)))
(assert ($Perm.isReadVar $k@36@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 i@8@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= i@8@00 (Seq_length xs@7@00)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (forall ((k@33@00 Int) (j@34@00 Int)) (!
  (and
    (=>
      (>= k@33@00 0)
      (and
        (>= k@33@00 0)
        (=>
          (< k@33@00 (Seq_length xs@7@00))
          (and
            (< k@33@00 (Seq_length xs@7@00))
            (=>
              (>= j@34@00 0)
              (and
                (>= j@34@00 0)
                (or
                  (< j@34@00 (Seq_length xs@7@00))
                  (not (< j@34@00 (Seq_length xs@7@00))))))
            (or (>= j@34@00 0) (not (>= j@34@00 0)))))
        (or
          (< k@33@00 (Seq_length xs@7@00))
          (not (< k@33@00 (Seq_length xs@7@00))))))
    (or (>= k@33@00 0) (not (>= k@33@00 0)))
    (=>
      (and
        (>= k@33@00 0)
        (and
          (< k@33@00 (Seq_length xs@7@00))
          (and
            (>= j@34@00 0)
            (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00))))))
      (and
        (>= k@33@00 0)
        (< k@33@00 (Seq_length xs@7@00))
        (>= j@34@00 0)
        (< j@34@00 (Seq_length xs@7@00))
        (not (= k@33@00 j@34@00))))
    (or
      (not
        (and
          (>= k@33@00 0)
          (and
            (< k@33@00 (Seq_length xs@7@00))
            (and
              (>= j@34@00 0)
              (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00)))))))
      (and
        (>= k@33@00 0)
        (and
          (< k@33@00 (Seq_length xs@7@00))
          (and
            (>= j@34@00 0)
            (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00))))))))
  :pattern ((Seq_index xs@7@00 k@33@00) (Seq_index xs@7@00 j@34@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@8@12@8@104-aux|)))
(assert (forall ((k@33@00 Int) (j@34@00 Int)) (!
  (=>
    (and
      (>= k@33@00 0)
      (and
        (< k@33@00 (Seq_length xs@7@00))
        (and
          (>= j@34@00 0)
          (and (< j@34@00 (Seq_length xs@7@00)) (not (= k@33@00 j@34@00))))))
    (not (= (Seq_index xs@7@00 k@33@00) (Seq_index xs@7@00 j@34@00))))
  :pattern ((Seq_index xs@7@00 k@33@00) (Seq_index xs@7@00 j@34@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@8@12@8@104|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (forall ((j@35@00 Int)) (!
  (=>
    (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00)))
    (or (<= 0 j@35@00) (not (<= 0 j@35@00))))
  :pattern ((Seq_index xs@7@00 j@35@00))
  :qid |item-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] Seq(xs[i].item) ++ seqToSeqHelper_wild(xs, i + 1)
; [eval] Seq(xs[i].item)
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= i@8@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (ite
  (and
    (img@38@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 i@8@00))
    (and
      (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 i@8@00)))
      (<
        (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 i@8@00))
        (Seq_length xs@7@00))))
  (< $Perm.No $k@36@00)
  false)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length
    (Seq_singleton ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
      xs@7@00
      i@8@00))))
  1))
; [eval] seqToSeqHelper_wild(xs, i + 1)
; [eval] i + 1
(push) ; 2
; [eval] 0 <= i
(push) ; 3
(assert (not (<= 0 (+ i@8@00 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ i@8@00 1)))
; [eval] i <= |xs|
; [eval] |xs|
(push) ; 3
(assert (not (<= (+ i@8@00 1) (Seq_length xs@7@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ i@8@00 1) (Seq_length xs@7@00)))
; [eval] (forall k: Int, j: Int ::k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@41@00 Int)
(declare-const j@42@00 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 27 | !(k@41@00 >= 0) | live]
; [else-branch: 27 | k@41@00 >= 0 | live]
(push) ; 5
; [then-branch: 27 | !(k@41@00 >= 0)]
(assert (not (>= k@41@00 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | k@41@00 >= 0]
(assert (>= k@41@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 28 | !(k@41@00 < |xs@7@00|) | live]
; [else-branch: 28 | k@41@00 < |xs@7@00| | live]
(push) ; 7
; [then-branch: 28 | !(k@41@00 < |xs@7@00|)]
(assert (not (< k@41@00 (Seq_length xs@7@00))))
(pop) ; 7
(push) ; 7
; [else-branch: 28 | k@41@00 < |xs@7@00|]
(assert (< k@41@00 (Seq_length xs@7@00)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 29 | !(j@42@00 >= 0) | live]
; [else-branch: 29 | j@42@00 >= 0 | live]
(push) ; 9
; [then-branch: 29 | !(j@42@00 >= 0)]
(assert (not (>= j@42@00 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 29 | j@42@00 >= 0]
(assert (>= j@42@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 30 | !(j@42@00 < |xs@7@00|) | live]
; [else-branch: 30 | j@42@00 < |xs@7@00| | live]
(push) ; 11
; [then-branch: 30 | !(j@42@00 < |xs@7@00|)]
(assert (not (< j@42@00 (Seq_length xs@7@00))))
(pop) ; 11
(push) ; 11
; [else-branch: 30 | j@42@00 < |xs@7@00|]
(assert (< j@42@00 (Seq_length xs@7@00)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@42@00 (Seq_length xs@7@00)) (not (< j@42@00 (Seq_length xs@7@00)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@42@00 0)
  (and
    (>= j@42@00 0)
    (or (< j@42@00 (Seq_length xs@7@00)) (not (< j@42@00 (Seq_length xs@7@00)))))))
(assert (or (>= j@42@00 0) (not (>= j@42@00 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@41@00 (Seq_length xs@7@00))
  (and
    (< k@41@00 (Seq_length xs@7@00))
    (=>
      (>= j@42@00 0)
      (and
        (>= j@42@00 0)
        (or
          (< j@42@00 (Seq_length xs@7@00))
          (not (< j@42@00 (Seq_length xs@7@00))))))
    (or (>= j@42@00 0) (not (>= j@42@00 0))))))
(assert (or (< k@41@00 (Seq_length xs@7@00)) (not (< k@41@00 (Seq_length xs@7@00)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@41@00 0)
  (and
    (>= k@41@00 0)
    (=>
      (< k@41@00 (Seq_length xs@7@00))
      (and
        (< k@41@00 (Seq_length xs@7@00))
        (=>
          (>= j@42@00 0)
          (and
            (>= j@42@00 0)
            (or
              (< j@42@00 (Seq_length xs@7@00))
              (not (< j@42@00 (Seq_length xs@7@00))))))
        (or (>= j@42@00 0) (not (>= j@42@00 0)))))
    (or (< k@41@00 (Seq_length xs@7@00)) (not (< k@41@00 (Seq_length xs@7@00)))))))
(assert (or (>= k@41@00 0) (not (>= k@41@00 0))))
(push) ; 4
; [then-branch: 31 | k@41@00 >= 0 && k@41@00 < |xs@7@00| && j@42@00 >= 0 && j@42@00 < |xs@7@00| && k@41@00 != j@42@00 | live]
; [else-branch: 31 | !(k@41@00 >= 0 && k@41@00 < |xs@7@00| && j@42@00 >= 0 && j@42@00 < |xs@7@00| && k@41@00 != j@42@00) | live]
(push) ; 5
; [then-branch: 31 | k@41@00 >= 0 && k@41@00 < |xs@7@00| && j@42@00 >= 0 && j@42@00 < |xs@7@00| && k@41@00 != j@42@00]
(assert (and
  (>= k@41@00 0)
  (and
    (< k@41@00 (Seq_length xs@7@00))
    (and
      (>= j@42@00 0)
      (and (< j@42@00 (Seq_length xs@7@00)) (not (= k@41@00 j@42@00)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 31 | !(k@41@00 >= 0 && k@41@00 < |xs@7@00| && j@42@00 >= 0 && j@42@00 < |xs@7@00| && k@41@00 != j@42@00)]
(assert (not
  (and
    (>= k@41@00 0)
    (and
      (< k@41@00 (Seq_length xs@7@00))
      (and
        (>= j@42@00 0)
        (and (< j@42@00 (Seq_length xs@7@00)) (not (= k@41@00 j@42@00))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@41@00 0)
    (and
      (< k@41@00 (Seq_length xs@7@00))
      (and
        (>= j@42@00 0)
        (and (< j@42@00 (Seq_length xs@7@00)) (not (= k@41@00 j@42@00))))))
  (and
    (>= k@41@00 0)
    (< k@41@00 (Seq_length xs@7@00))
    (>= j@42@00 0)
    (< j@42@00 (Seq_length xs@7@00))
    (not (= k@41@00 j@42@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@41@00 0)
      (and
        (< k@41@00 (Seq_length xs@7@00))
        (and
          (>= j@42@00 0)
          (and (< j@42@00 (Seq_length xs@7@00)) (not (= k@41@00 j@42@00)))))))
  (and
    (>= k@41@00 0)
    (and
      (< k@41@00 (Seq_length xs@7@00))
      (and
        (>= j@42@00 0)
        (and (< j@42@00 (Seq_length xs@7@00)) (not (= k@41@00 j@42@00))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((k@41@00 Int) (j@42@00 Int)) (!
  (=>
    (and
      (>= k@41@00 0)
      (and
        (< k@41@00 (Seq_length xs@7@00))
        (and
          (>= j@42@00 0)
          (and (< j@42@00 (Seq_length xs@7@00)) (not (= k@41@00 j@42@00))))))
    (not (= (Seq_index xs@7@00 k@41@00) (Seq_index xs@7@00 j@42@00))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@8@12@8@104|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@41@00 Int) (j@42@00 Int)) (!
  (=>
    (and
      (>= k@41@00 0)
      (and
        (< k@41@00 (Seq_length xs@7@00))
        (and
          (>= j@42@00 0)
          (and (< j@42@00 (Seq_length xs@7@00)) (not (= k@41@00 j@42@00))))))
    (not (= (Seq_index xs@7@00 k@41@00) (Seq_index xs@7@00 j@42@00))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@8@12@8@104|)))
(declare-const j@43@00 Int)
(push) ; 3
; [eval] 0 <= j && j < |xs|
; [eval] 0 <= j
(push) ; 4
; [then-branch: 32 | !(0 <= j@43@00) | live]
; [else-branch: 32 | 0 <= j@43@00 | live]
(push) ; 5
; [then-branch: 32 | !(0 <= j@43@00)]
(assert (not (<= 0 j@43@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 32 | 0 <= j@43@00]
(assert (<= 0 j@43@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@43@00) (not (<= 0 j@43@00))))
(assert (and (<= 0 j@43@00) (< j@43@00 (Seq_length xs@7@00))))
(declare-const $k@44@00 $Perm)
(assert ($Perm.isReadVar $k@44@00))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@43@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@45@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@46@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@44@00))
; Nested auxiliary terms: non-globals
(assert (forall ((j@43@00 Int)) (!
  (=>
    (and (<= 0 j@43@00) (< j@43@00 (Seq_length xs@7@00)))
    (or (<= 0 j@43@00) (not (<= 0 j@43@00))))
  :pattern ((Seq_index xs@7@00 j@43@00))
  :qid |item-aux|)))
(push) ; 3
(assert (not (forall ((j@43@00 Int)) (!
  (=>
    (and (<= 0 j@43@00) (< j@43@00 (Seq_length xs@7@00)))
    (or (= $k@44@00 $Perm.No) (< $Perm.No $k@44@00)))
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@43@00 Int) (j2@43@00 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 j1@43@00) (< j1@43@00 (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00))
      (and
        (and (<= 0 j2@43@00) (< j2@43@00 (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00))
      (= (Seq_index xs@7@00 j1@43@00) (Seq_index xs@7@00 j2@43@00)))
    (= j1@43@00 j2@43@00))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@43@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@43@00) (< j@43@00 (Seq_length xs@7@00)))
      (< $Perm.No $k@44@00))
    (and
      (= (inv@45@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@43@00)) j@43@00)
      (img@46@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@43@00))))
  :pattern ((Seq_index xs@7@00 j@43@00))
  :qid |item-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@46@00 s@$ xs@7@00 i@8@00 r)
      (and
        (and
          (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00)))
    (= (Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r)) r))
  :pattern ((inv@45@00 s@$ xs@7@00 i@8@00 r))
  :qid |item-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@44@00
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@38@00 s@$ xs@7@00 i@8@00 r)
            (and
              (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00))))
          $k@36@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@38@00 s@$ xs@7@00 i@8@00 r)
        (and
          (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00))))
      (<
        (ite
          (and
            (and
              (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
            (img@46@00 s@$ xs@7@00 i@8@00 r)
            (= r (Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r))))
          $k@44@00
          $Perm.No)
        $k@36@00)
      (<
        (ite
          (and
            (and
              (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
            (img@46@00 s@$ xs@7@00 i@8@00 r)
            (= r (Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r))))
          $k@44@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@38@00 s@$ xs@7@00 i@8@00 r))
  :pattern ((inv@37@00 s@$ xs@7@00 i@8@00 r))
  :pattern ((img@46@00 s@$ xs@7@00 i@8@00 r))
  :pattern ((Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r)))
  :qid |qp.srp5|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
        (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
      (img@46@00 s@$ xs@7@00 i@8@00 r)
      (= r (Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r))))
    (=
      (-
        $k@44@00
        (ite
          (and
            (and
              (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
            (img@46@00 s@$ xs@7@00 i@8@00 r)
            (= r (Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r))))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ xs@7@00 i@8@00 r)
                (and
                  (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
                  (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00))))
              $k@36@00
              $Perm.No)
            $k@44@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@47@00 ($Snap Seq<$Ref> Int) $FVF<item>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_item (sm@47@00 s@$ xs@7@00 i@8@00)))
      (and
        (and
          (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00)
        (img@46@00 s@$ xs@7@00 i@8@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00)
        (img@46@00 s@$ xs@7@00 i@8@00 r))
      (Set_in r ($FVF.domain_item (sm@47@00 s@$ xs@7@00 i@8@00)))))
  :pattern ((Set_in r ($FVF.domain_item (sm@47@00 s@$ xs@7@00 i@8@00))))
  :qid |qp.fvfDomDef7|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00)
        (img@46@00 s@$ xs@7@00 i@8@00 r))
      (ite
        (and
          (img@38@00 s@$ xs@7@00 i@8@00 r)
          (and
            (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
            (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00))))
        (< $Perm.No $k@36@00)
        false))
    (=
      ($FVF.lookup_item (sm@47@00 s@$ xs@7@00 i@8@00) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_item (sm@47@00 s@$ xs@7@00 i@8@00) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef6|)))
(assert (seqToSeqHelper_wild%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<item>To$Snap (sm@47@00 s@$ xs@7@00 i@8@00))
        $Snap.unit)))) xs@7@00 (+ i@8@00 1)))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@44@00))
(assert (forall ((j@43@00 Int)) (!
  (=>
    (and
      (and (<= 0 j@43@00) (< j@43@00 (Seq_length xs@7@00)))
      (< $Perm.No $k@44@00))
    (and
      (= (inv@45@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@43@00)) j@43@00)
      (img@46@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@43@00))))
  :pattern ((Seq_index xs@7@00 j@43@00))
  :qid |item-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@46@00 s@$ xs@7@00 i@8@00 r)
      (and
        (and
          (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00)))
    (= (Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r)) r))
  :pattern ((inv@45@00 s@$ xs@7@00 i@8@00 r))
  :qid |item-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_item (sm@47@00 s@$ xs@7@00 i@8@00)))
      (and
        (and
          (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00)
        (img@46@00 s@$ xs@7@00 i@8@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00)
        (img@46@00 s@$ xs@7@00 i@8@00 r))
      (Set_in r ($FVF.domain_item (sm@47@00 s@$ xs@7@00 i@8@00)))))
  :pattern ((Set_in r ($FVF.domain_item (sm@47@00 s@$ xs@7@00 i@8@00))))
  :qid |qp.fvfDomDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
          (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
        (< $Perm.No $k@44@00)
        (img@46@00 s@$ xs@7@00 i@8@00 r))
      (ite
        (and
          (img@38@00 s@$ xs@7@00 i@8@00 r)
          (and
            (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
            (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00))))
        (< $Perm.No $k@36@00)
        false))
    (=
      ($FVF.lookup_item (sm@47@00 s@$ xs@7@00 i@8@00) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_item (sm@47@00 s@$ xs@7@00 i@8@00) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef6|)))
(assert (and
  (<= 0 (+ i@8@00 1))
  (<= (+ i@8@00 1) (Seq_length xs@7@00))
  (forall ((k@41@00 Int) (j@42@00 Int)) (!
    (=>
      (and
        (>= k@41@00 0)
        (and
          (< k@41@00 (Seq_length xs@7@00))
          (and
            (>= j@42@00 0)
            (and (< j@42@00 (Seq_length xs@7@00)) (not (= k@41@00 j@42@00))))))
      (not (= (Seq_index xs@7@00 k@41@00) (Seq_index xs@7@00 j@42@00))))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@8@12@8@104|))
  (forall ((j@43@00 Int)) (!
    (=>
      (and (<= 0 j@43@00) (< j@43@00 (Seq_length xs@7@00)))
      (or (<= 0 j@43@00) (not (<= 0 j@43@00))))
    :pattern ((Seq_index xs@7@00 j@43@00))
    :qid |item-aux|))
  (forall ((r $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@38@00 s@$ xs@7@00 i@8@00 r)
              (and
                (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
                (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00))))
            $k@36@00
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@38@00 s@$ xs@7@00 i@8@00 r)
          (and
            (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
            (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00))))
        (<
          (ite
            (and
              (and
                (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
                (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
              (img@46@00 s@$ xs@7@00 i@8@00 r)
              (= r (Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r))))
            $k@44@00
            $Perm.No)
          $k@36@00)
        (<
          (ite
            (and
              (and
                (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
                (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
              (img@46@00 s@$ xs@7@00 i@8@00 r)
              (= r (Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r))))
            $k@44@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@38@00 s@$ xs@7@00 i@8@00 r))
    :pattern ((inv@37@00 s@$ xs@7@00 i@8@00 r))
    :pattern ((img@46@00 s@$ xs@7@00 i@8@00 r))
    :pattern ((Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r)))
    :qid |qp.srp5|))
  (seqToSeqHelper_wild%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<item>To$Snap (sm@47@00 s@$ xs@7@00 i@8@00))
          $Snap.unit)))) xs@7@00 (+ i@8@00 1))))
(assert (=
  result@9@00
  (Seq_append
    (Seq_singleton ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
      xs@7@00
      i@8@00)))
    (seqToSeqHelper_wild ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<item>To$Snap (sm@47@00 s@$ xs@7@00 i@8@00))
            $Snap.unit)))) xs@7@00 (+ i@8@00 1)))))
; [eval] |result| == |xs| - i
; [eval] |result|
; [eval] |xs| - i
; [eval] |xs|
(set-option :timeout 0)
(push) ; 2
(assert (not (= (Seq_length result@9@00) (- (Seq_length xs@7@00) i@8@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length result@9@00) (- (Seq_length xs@7@00) i@8@00)))
; [eval] (forall j: Int :: { xs[j] } i <= j && j < |xs| ==> result[j - i] == xs[j].item)
(declare-const j@48@00 Int)
(push) ; 2
; [eval] i <= j && j < |xs| ==> result[j - i] == xs[j].item
; [eval] i <= j && j < |xs|
; [eval] i <= j
(push) ; 3
; [then-branch: 33 | !(i@8@00 <= j@48@00) | live]
; [else-branch: 33 | i@8@00 <= j@48@00 | live]
(push) ; 4
; [then-branch: 33 | !(i@8@00 <= j@48@00)]
(assert (not (<= i@8@00 j@48@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 33 | i@8@00 <= j@48@00]
(assert (<= i@8@00 j@48@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= i@8@00 j@48@00) (not (<= i@8@00 j@48@00))))
(push) ; 3
; [then-branch: 34 | i@8@00 <= j@48@00 && j@48@00 < |xs@7@00| | live]
; [else-branch: 34 | !(i@8@00 <= j@48@00 && j@48@00 < |xs@7@00|) | live]
(push) ; 4
; [then-branch: 34 | i@8@00 <= j@48@00 && j@48@00 < |xs@7@00|]
(assert (and (<= i@8@00 j@48@00) (< j@48@00 (Seq_length xs@7@00))))
; [eval] result[j - i] == xs[j].item
; [eval] result[j - i]
; [eval] j - i
(push) ; 5
(assert (not (>= (- j@48@00 i@8@00) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (- j@48@00 i@8@00) (Seq_length result@9@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@48@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (ite
  (and
    (img@38@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@48@00))
    (and
      (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@48@00)))
      (<
        (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@48@00))
        (Seq_length xs@7@00))))
  (< $Perm.No $k@36@00)
  false)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 34 | !(i@8@00 <= j@48@00 && j@48@00 < |xs@7@00|)]
(assert (not (and (<= i@8@00 j@48@00) (< j@48@00 (Seq_length xs@7@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= i@8@00 j@48@00) (< j@48@00 (Seq_length xs@7@00))))
  (and (<= i@8@00 j@48@00) (< j@48@00 (Seq_length xs@7@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@48@00 Int)) (!
  (and
    (or (<= i@8@00 j@48@00) (not (<= i@8@00 j@48@00)))
    (or
      (not (and (<= i@8@00 j@48@00) (< j@48@00 (Seq_length xs@7@00))))
      (and (<= i@8@00 j@48@00) (< j@48@00 (Seq_length xs@7@00)))))
  :pattern ((Seq_index xs@7@00 j@48@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@13@12@13@79-aux|)))
(push) ; 2
(assert (not (forall ((j@48@00 Int)) (!
  (=>
    (and (<= i@8@00 j@48@00) (< j@48@00 (Seq_length xs@7@00)))
    (=
      (Seq_index result@9@00 (- j@48@00 i@8@00))
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
        xs@7@00
        j@48@00))))
  :pattern ((Seq_index xs@7@00 j@48@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@13@12@13@79|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@48@00 Int)) (!
  (=>
    (and (<= i@8@00 j@48@00) (< j@48@00 (Seq_length xs@7@00)))
    (=
      (Seq_index result@9@00 (- j@48@00 i@8@00))
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
        xs@7@00
        j@48@00))))
  :pattern ((Seq_index xs@7@00 j@48@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0512.vpr@13@12@13@79|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (i@8@00 Int)) (!
  (and
    (forall ((j@35@00 Int)) (!
      (=>
        (and
          (and (<= 0 j@35@00) (< j@35@00 (Seq_length xs@7@00)))
          (< $Perm.No $k@36@00))
        (and
          (= (inv@37@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@35@00)) j@35@00)
          (img@38@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@35@00))))
      :pattern ((Seq_index xs@7@00 j@35@00))
      :qid |quant-u-26|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@38@00 s@$ xs@7@00 i@8@00 r)
          (and
            (and
              (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
            (< $Perm.No $k@36@00)))
        (= (Seq_index xs@7@00 (inv@37@00 s@$ xs@7@00 i@8@00 r)) r))
      :pattern ((inv@37@00 s@$ xs@7@00 i@8@00 r))
      :qid |item-fctOfInv|))
    (forall ((j@43@00 Int)) (!
      (=>
        (and
          (and (<= 0 j@43@00) (< j@43@00 (Seq_length xs@7@00)))
          (< $Perm.No $k@44@00))
        (and
          (= (inv@45@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@43@00)) j@43@00)
          (img@46@00 s@$ xs@7@00 i@8@00 (Seq_index xs@7@00 j@43@00))))
      :pattern ((Seq_index xs@7@00 j@43@00))
      :qid |item-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@46@00 s@$ xs@7@00 i@8@00 r)
          (and
            (and
              (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
            (< $Perm.No $k@44@00)))
        (= (Seq_index xs@7@00 (inv@45@00 s@$ xs@7@00 i@8@00 r)) r))
      :pattern ((inv@45@00 s@$ xs@7@00 i@8@00 r))
      :qid |item-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_item (sm@47@00 s@$ xs@7@00 i@8@00)))
          (and
            (and
              (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
            (< $Perm.No $k@44@00)
            (img@46@00 s@$ xs@7@00 i@8@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
            (< $Perm.No $k@44@00)
            (img@46@00 s@$ xs@7@00 i@8@00 r))
          (Set_in r ($FVF.domain_item (sm@47@00 s@$ xs@7@00 i@8@00)))))
      :pattern ((Set_in r ($FVF.domain_item (sm@47@00 s@$ xs@7@00 i@8@00))))
      :qid |qp.fvfDomDef7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@45@00 s@$ xs@7@00 i@8@00 r))
              (< (inv@45@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00)))
            (< $Perm.No $k@44@00)
            (img@46@00 s@$ xs@7@00 i@8@00 r))
          (ite
            (and
              (img@38@00 s@$ xs@7@00 i@8@00 r)
              (and
                (<= 0 (inv@37@00 s@$ xs@7@00 i@8@00 r))
                (< (inv@37@00 s@$ xs@7@00 i@8@00 r) (Seq_length xs@7@00))))
            (< $Perm.No $k@36@00)
            false))
        (=
          ($FVF.lookup_item (sm@47@00 s@$ xs@7@00 i@8@00) r)
          ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_item (sm@47@00 s@$ xs@7@00 i@8@00) r))
      :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef6|))
    ($Perm.isReadVar $k@36@00)
    ($Perm.isReadVar $k@44@00)
    (=>
      (seqToSeqHelper_wild%precondition s@$ xs@7@00 i@8@00)
      (=
        (seqToSeqHelper_wild s@$ xs@7@00 i@8@00)
        (Seq_append
          (Seq_singleton ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
            xs@7@00
            i@8@00)))
          (seqToSeqHelper_wild%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<item>To$Snap (sm@47@00 s@$ xs@7@00 i@8@00))
                  $Snap.unit)))) xs@7@00 (+ i@8@00 1))))))
  :pattern ((seqToSeqHelper_wild s@$ xs@7@00 i@8@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (xs@7@00 Seq<$Ref>) (i@8@00 Int)) (!
  (=>
    (seqToSeqHelper_wild%precondition s@$ xs@7@00 i@8@00)
    (seqToSeqHelper_wild%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<item>To$Snap (sm@47@00 s@$ xs@7@00 i@8@00))
            $Snap.unit)))) xs@7@00 (+ i@8@00 1)))
  :pattern ((seqToSeqHelper_wild s@$ xs@7@00 i@8@00))
  :qid |quant-u-35|)))
