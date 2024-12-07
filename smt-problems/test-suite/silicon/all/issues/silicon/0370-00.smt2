(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0370.vpr
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
(declare-sort VCTOption<Seq<Ref>> 0)
(declare-sort $FVF<Integer__item> 0)
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
(declare-fun $SortWrappers.VCTOption<Seq<Ref>>To$Snap (VCTOption<Seq<Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToVCTOption<Seq<Ref>> ($Snap) VCTOption<Seq<Ref>>)
(assert (forall ((x VCTOption<Seq<Ref>>)) (!
    (= x ($SortWrappers.$SnapToVCTOption<Seq<Ref>>($SortWrappers.VCTOption<Seq<Ref>>To$Snap x)))
    :pattern (($SortWrappers.VCTOption<Seq<Ref>>To$Snap x))
    :qid |$Snap.$SnapToVCTOption<Seq<Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.VCTOption<Seq<Ref>>To$Snap($SortWrappers.$SnapToVCTOption<Seq<Ref>> x)))
    :pattern (($SortWrappers.$SnapToVCTOption<Seq<Ref>> x))
    :qid |$Snap.VCTOption<Seq<Ref>>To$SnapToVCTOption<Seq<Ref>>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<Integer__item>To$Snap ($FVF<Integer__item>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Integer__item> ($Snap) $FVF<Integer__item>)
(assert (forall ((x $FVF<Integer__item>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Integer__item>($SortWrappers.$FVF<Integer__item>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Integer__item>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Integer__item>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Integer__item>To$Snap($SortWrappers.$SnapTo$FVF<Integer__item> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Integer__item> x))
    :qid |$Snap.$FVF<Integer__item>To$SnapTo$FVF<Integer__item>|
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
(declare-const VCTNone<VCTOption<Seq<Ref>>> VCTOption<Seq<Ref>>)
(declare-fun getVCTOption<Seq<Ref>> (VCTOption<Seq<Ref>>) Seq<$Ref>)
; /field_value_functions_declarations.smt2 [Integer__item: Int]
(declare-fun $FVF.domain_Integer__item ($FVF<Integer__item>) Set<$Ref>)
(declare-fun $FVF.lookup_Integer__item ($FVF<Integer__item> $Ref) Int)
(declare-fun $FVF.after_Integer__item ($FVF<Integer__item> $FVF<Integer__item>) Bool)
(declare-fun $FVF.loc_Integer__item (Int $Ref) Bool)
(declare-fun $FVF.perm_Integer__item ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Integer__item $FVF<Integer__item>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun getVCTOption1 ($Snap VCTOption<Seq<Ref>>) Seq<$Ref>)
(declare-fun getVCTOption1%limited ($Snap VCTOption<Seq<Ref>>) Seq<$Ref>)
(declare-fun getVCTOption1%stateless (VCTOption<Seq<Ref>>) Bool)
(declare-fun getVCTOption1%precondition ($Snap VCTOption<Seq<Ref>>) Bool)
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
; /field_value_functions_axioms.smt2 [Integer__item: Int]
(assert (forall ((vs $FVF<Integer__item>) (ws $FVF<Integer__item>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Integer__item vs) ($FVF.domain_Integer__item ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Integer__item vs))
            (= ($FVF.lookup_Integer__item vs x) ($FVF.lookup_Integer__item ws x)))
          :pattern (($FVF.lookup_Integer__item vs x) ($FVF.lookup_Integer__item ws x))
          :qid |qp.$FVF<Integer__item>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Integer__item>To$Snap vs)
              ($SortWrappers.$FVF<Integer__item>To$Snap ws)
              )
    :qid |qp.$FVF<Integer__item>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Integer__item pm r))
    :pattern (($FVF.perm_Integer__item pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_Integer__item f r) true)
    :pattern (($FVF.loc_Integer__item f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (x@0@00 VCTOption<Seq<Ref>>)) (!
  (= (getVCTOption1%limited s@$ x@0@00) (getVCTOption1 s@$ x@0@00))
  :pattern ((getVCTOption1 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 VCTOption<Seq<Ref>>)) (!
  (getVCTOption1%stateless x@0@00)
  :pattern ((getVCTOption1%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 VCTOption<Seq<Ref>>)) (!
  (=>
    (getVCTOption1%precondition s@$ x@0@00)
    (= (getVCTOption1 s@$ x@0@00) (getVCTOption<Seq<Ref>> x@0@00)))
  :pattern ((getVCTOption1 s@$ x@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 VCTOption<Seq<Ref>>)) (!
  true
  :pattern ((getVCTOption1 s@$ x@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- barrier_check_2 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const output@2@01 VCTOption<Seq<Ref>>)
(declare-const diz@3@01 $Ref)
(declare-const current_thread_id@4@01 Int)
(declare-const output@5@01 VCTOption<Seq<Ref>>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] (VCTNone(): VCTOption[Seq[Ref]]) != output
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(assert (not (= (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>) output@5@01)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { getVCTOption1(output)[i], getVCTOption1(output)[j] } i >= 0 && (i < |getVCTOption1(output)| && (j >= 0 && (j < |getVCTOption1(output)| && i != j))) ==> getVCTOption1(output)[i] != getVCTOption1(output)[j])
(declare-const i@7@01 Int)
(declare-const j@8@01 Int)
(push) ; 2
; [eval] i >= 0 && (i < |getVCTOption1(output)| && (j >= 0 && (j < |getVCTOption1(output)| && i != j))) ==> getVCTOption1(output)[i] != getVCTOption1(output)[j]
; [eval] i >= 0 && (i < |getVCTOption1(output)| && (j >= 0 && (j < |getVCTOption1(output)| && i != j)))
; [eval] i >= 0
(push) ; 3
; [then-branch: 0 | !(i@7@01 >= 0) | live]
; [else-branch: 0 | i@7@01 >= 0 | live]
(push) ; 4
; [then-branch: 0 | !(i@7@01 >= 0)]
(assert (not (>= i@7@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | i@7@01 >= 0]
(assert (>= i@7@01 0))
; [eval] i < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 5
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 6
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
(push) ; 5
; [then-branch: 1 | !(i@7@01 < |getVCTOption1(_, output@5@01)|) | live]
; [else-branch: 1 | i@7@01 < |getVCTOption1(_, output@5@01)| | live]
(push) ; 6
; [then-branch: 1 | !(i@7@01 < |getVCTOption1(_, output@5@01)|)]
(assert (not (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i@7@01 < |getVCTOption1(_, output@5@01)|]
(assert (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
; [eval] j >= 0
(push) ; 7
; [then-branch: 2 | !(j@8@01 >= 0) | live]
; [else-branch: 2 | j@8@01 >= 0 | live]
(push) ; 8
; [then-branch: 2 | !(j@8@01 >= 0)]
(assert (not (>= j@8@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | j@8@01 >= 0]
(assert (>= j@8@01 0))
; [eval] j < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 9
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 3 | !(j@8@01 < |getVCTOption1(_, output@5@01)|) | live]
; [else-branch: 3 | j@8@01 < |getVCTOption1(_, output@5@01)| | live]
(push) ; 10
; [then-branch: 3 | !(j@8@01 < |getVCTOption1(_, output@5@01)|)]
(assert (not (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@8@01 < |getVCTOption1(_, output@5@01)|]
(assert (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
  (not (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@8@01 0)
  (and
    (>= j@8@01 0)
    (or
      (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (not (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))))
(assert (or (>= j@8@01 0) (not (>= j@8@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
  (and
    (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
    (=>
      (>= j@8@01 0)
      (and
        (>= j@8@01 0)
        (or
          (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
          (not (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))))
    (or (>= j@8@01 0) (not (>= j@8@01 0))))))
(assert (or
  (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
  (not (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@7@01 0)
  (and
    (>= i@7@01 0)
    (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@5@01)
    (=>
      (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (and
        (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (=>
          (>= j@8@01 0)
          (and
            (>= j@8@01 0)
            (or
              (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
              (not
                (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))))
        (or (>= j@8@01 0) (not (>= j@8@01 0)))))
    (or
      (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (not (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))))
(assert (or (>= i@7@01 0) (not (>= i@7@01 0))))
(push) ; 3
; [then-branch: 4 | i@7@01 >= 0 && i@7@01 < |getVCTOption1(_, output@5@01)| && j@8@01 >= 0 && j@8@01 < |getVCTOption1(_, output@5@01)| && i@7@01 != j@8@01 | live]
; [else-branch: 4 | !(i@7@01 >= 0 && i@7@01 < |getVCTOption1(_, output@5@01)| && j@8@01 >= 0 && j@8@01 < |getVCTOption1(_, output@5@01)| && i@7@01 != j@8@01) | live]
(push) ; 4
; [then-branch: 4 | i@7@01 >= 0 && i@7@01 < |getVCTOption1(_, output@5@01)| && j@8@01 >= 0 && j@8@01 < |getVCTOption1(_, output@5@01)| && i@7@01 != j@8@01]
(assert (and
  (>= i@7@01 0)
  (and
    (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
    (and
      (>= j@8@01 0)
      (and
        (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (not (= i@7@01 j@8@01)))))))
; [eval] getVCTOption1(output)[i] != getVCTOption1(output)[j]
; [eval] getVCTOption1(output)[i]
; [eval] getVCTOption1(output)
(push) ; 5
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 6
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
; [eval] getVCTOption1(output)[j]
; [eval] getVCTOption1(output)
(push) ; 5
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(i@7@01 >= 0 && i@7@01 < |getVCTOption1(_, output@5@01)| && j@8@01 >= 0 && j@8@01 < |getVCTOption1(_, output@5@01)| && i@7@01 != j@8@01)]
(assert (not
  (and
    (>= i@7@01 0)
    (and
      (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (and
        (>= j@8@01 0)
        (and
          (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
          (not (= i@7@01 j@8@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= i@7@01 0)
    (and
      (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (and
        (>= j@8@01 0)
        (and
          (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
          (not (= i@7@01 j@8@01))))))
  (and
    (>= i@7@01 0)
    (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
    (>= j@8@01 0)
    (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
    (not (= i@7@01 j@8@01))
    (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@5@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@7@01 0)
      (and
        (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (and
          (>= j@8@01 0)
          (and
            (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
            (not (= i@7@01 j@8@01)))))))
  (and
    (>= i@7@01 0)
    (and
      (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (and
        (>= j@8@01 0)
        (and
          (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
          (not (= i@7@01 j@8@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@7@01 Int) (j@8@01 Int)) (!
  (and
    (=>
      (>= i@7@01 0)
      (and
        (>= i@7@01 0)
        (not
          (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
        (getVCTOption1%precondition $Snap.unit output@5@01)
        (=>
          (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
          (and
            (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
            (=>
              (>= j@8@01 0)
              (and
                (>= j@8@01 0)
                (or
                  (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
                  (not
                    (<
                      j@8@01
                      (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))))
            (or (>= j@8@01 0) (not (>= j@8@01 0)))))
        (or
          (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
          (not (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))))
    (or (>= i@7@01 0) (not (>= i@7@01 0)))
    (=>
      (and
        (>= i@7@01 0)
        (and
          (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
          (and
            (>= j@8@01 0)
            (and
              (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
              (not (= i@7@01 j@8@01))))))
      (and
        (>= i@7@01 0)
        (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (>= j@8@01 0)
        (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (not (= i@7@01 j@8@01))
        (not
          (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
        (getVCTOption1%precondition $Snap.unit output@5@01)))
    (or
      (not
        (and
          (>= i@7@01 0)
          (and
            (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
            (and
              (>= j@8@01 0)
              (and
                (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
                (not (= i@7@01 j@8@01)))))))
      (and
        (>= i@7@01 0)
        (and
          (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
          (and
            (>= j@8@01 0)
            (and
              (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
              (not (= i@7@01 j@8@01))))))))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@5@01) i@7@01) (Seq_index
    (getVCTOption1 $Snap.unit output@5@01)
    j@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@20@12@20@180-aux|)))
(assert (forall ((i@7@01 Int) (j@8@01 Int)) (!
  (=>
    (and
      (>= i@7@01 0)
      (and
        (< i@7@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (and
          (>= j@8@01 0)
          (and
            (< j@8@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
            (not (= i@7@01 j@8@01))))))
    (not
      (=
        (Seq_index (getVCTOption1 $Snap.unit output@5@01) i@7@01)
        (Seq_index (getVCTOption1 $Snap.unit output@5@01) j@8@01))))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@5@01) i@7@01) (Seq_index
    (getVCTOption1 $Snap.unit output@5@01)
    j@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@20@12@20@180|)))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(declare-const tid@9@01 Int)
(push) ; 2
; [eval] 0 <= tid && tid < |getVCTOption1(output)|
; [eval] 0 <= tid
(push) ; 3
; [then-branch: 5 | !(0 <= tid@9@01) | live]
; [else-branch: 5 | 0 <= tid@9@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= tid@9@01)]
(assert (not (<= 0 tid@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= tid@9@01]
(assert (<= 0 tid@9@01))
; [eval] tid < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 5
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 6
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 tid@9@01)
  (and
    (<= 0 tid@9@01)
    (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@5@01))))
(assert (or (<= 0 tid@9@01) (not (<= 0 tid@9@01))))
(assert (and
  (<= 0 tid@9@01)
  (< tid@9@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
; [eval] getVCTOption1(output)[tid]
; [eval] getVCTOption1(output)
(push) ; 3
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 4
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
(push) ; 3
(assert (not (>= tid@9@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@10@01 ($Ref) Int)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((tid@9@01 Int)) (!
  (=>
    (and
      (<= 0 tid@9@01)
      (< tid@9@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
    (and
      (=>
        (<= 0 tid@9@01)
        (and
          (<= 0 tid@9@01)
          (not
            (=
              output@5@01
              (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
          (getVCTOption1%precondition $Snap.unit output@5@01)))
      (or (<= 0 tid@9@01) (not (<= 0 tid@9@01)))
      (not
        (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
      (getVCTOption1%precondition $Snap.unit output@5@01)))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@9@01))
  :qid |Integer__item-aux|)))
; Check receiver injectivity
(assert (forall ((tid1@9@01 Int) (tid2@9@01 Int)) (!
  (and
    (=> (<= 0 tid1@9@01) (getVCTOption1%precondition $Snap.unit output@5@01))
    (=>
      (and
        (<= 0 tid1@9@01)
        (< tid1@9@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
      (and
        (=> (<= 0 tid2@9@01) (getVCTOption1%precondition $Snap.unit output@5@01))
        (=>
          (and
            (<= 0 tid2@9@01)
            (< tid2@9@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
          (getVCTOption1%precondition $Snap.unit output@5@01)))))
  
  :qid |Integer__item-rcvrInj|)))
(push) ; 2
(assert (not (forall ((tid1@9@01 Int) (tid2@9@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 tid1@9@01)
        (< tid1@9@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
      (and
        (<= 0 tid2@9@01)
        (< tid2@9@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
      (=
        (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid1@9@01)
        (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid2@9@01)))
    (= tid1@9@01 tid2@9@01))
  
  :qid |Integer__item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((tid@9@01 Int)) (!
  (and
    (=> (<= 0 tid@9@01) (getVCTOption1%precondition $Snap.unit output@5@01))
    (=>
      (and
        (<= 0 tid@9@01)
        (< tid@9@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
      (and
        (getVCTOption1%precondition $Snap.unit output@5@01)
        (=>
          (=
            (inv@10@01 (Seq_index
              (getVCTOption1 $Snap.unit output@5@01)
              tid@9@01))
            tid@9@01)
          (getVCTOption1%precondition $Snap.unit output@5@01)))))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@9@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (and (img@11@01 r) (<= 0 (inv@10@01 r)))
      (getVCTOption1%precondition $Snap.unit output@5@01))
    (=>
      (and
        (img@11@01 r)
        (and
          (<= 0 (inv@10@01 r))
          (< (inv@10@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
      (getVCTOption1%precondition $Snap.unit output@5@01)))
  :pattern ((inv@10@01 r))
  :qid |Integer__item-fctOfInv|)))
(assert (forall ((tid@9@01 Int)) (!
  (=>
    (and
      (<= 0 tid@9@01)
      (< tid@9@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
    (and
      (=
        (inv@10@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@9@01))
        tid@9@01)
      (img@11@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@9@01))))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@9@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (< (inv@10@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
    (= (Seq_index (getVCTOption1 $Snap.unit output@5@01) (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |Integer__item-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((tid@9@01 Int)) (!
  (=>
    (and
      (<= 0 tid@9@01)
      (< tid@9@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
    (not
      (= (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@9@01) $Ref.null)))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@9@01))
  :qid |Integer__item-permImpliesNonNull|)))
(declare-const sm@12@01 $FVF<Integer__item>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (< (inv@10@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
    (=
      ($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r)))
  :pattern (($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@10@01 r))
      (< (inv@10@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r) r))
  :pattern ((inv@10@01 r))
  :qid |quant-u-6|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] (forall tid: Int :: { getVCTOption1(output)[tid] } 0 <= tid && tid < |getVCTOption1(output)| ==> getVCTOption1(output)[tid].Integer__item == tid)
(declare-const tid@13@01 Int)
(push) ; 2
; [eval] 0 <= tid && tid < |getVCTOption1(output)| ==> getVCTOption1(output)[tid].Integer__item == tid
; [eval] 0 <= tid && tid < |getVCTOption1(output)|
; [eval] 0 <= tid
(push) ; 3
; [then-branch: 6 | !(0 <= tid@13@01) | live]
; [else-branch: 6 | 0 <= tid@13@01 | live]
(push) ; 4
; [then-branch: 6 | !(0 <= tid@13@01)]
(assert (not (<= 0 tid@13@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | 0 <= tid@13@01]
(assert (<= 0 tid@13@01))
; [eval] tid < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 5
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 6
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 tid@13@01)
  (and
    (<= 0 tid@13@01)
    (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@5@01))))
(assert (or (<= 0 tid@13@01) (not (<= 0 tid@13@01))))
(push) ; 3
; [then-branch: 7 | 0 <= tid@13@01 && tid@13@01 < |getVCTOption1(_, output@5@01)| | live]
; [else-branch: 7 | !(0 <= tid@13@01 && tid@13@01 < |getVCTOption1(_, output@5@01)|) | live]
(push) ; 4
; [then-branch: 7 | 0 <= tid@13@01 && tid@13@01 < |getVCTOption1(_, output@5@01)|]
(assert (and
  (<= 0 tid@13@01)
  (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
; [eval] getVCTOption1(output)[tid].Integer__item == tid
; [eval] getVCTOption1(output)[tid]
; [eval] getVCTOption1(output)
(push) ; 5
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 6
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
(push) ; 5
(assert (not (>= tid@13@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@11@01 r)
        (and
          (<= 0 (inv@10@01 r))
          (< (inv@10@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
      (=
        ($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r)))
    :pattern (($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r) r)
    :pattern (($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r))
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) (Seq_index
  (getVCTOption1 $Snap.unit output@5@01)
  tid@13@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@13@01)))
(push) ; 5
(assert (not (and
  (img@11@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@13@01))
  (and
    (<=
      0
      (inv@10@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@13@01)))
    (<
      (inv@10@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@13@01))
      (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(0 <= tid@13@01 && tid@13@01 < |getVCTOption1(_, output@5@01)|)]
(assert (not
  (and
    (<= 0 tid@13@01)
    (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (< (inv@10@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
    (=
      ($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r)))
  :pattern (($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (=>
  (and
    (<= 0 tid@13@01)
    (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
  (and
    (<= 0 tid@13@01)
    (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
    (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@5@01)
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) (Seq_index
      (getVCTOption1 $Snap.unit output@5@01)
      tid@13@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@13@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 tid@13@01)
      (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
  (and
    (<= 0 tid@13@01)
    (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (< (inv@10@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
    (=
      ($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r)))
  :pattern (($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef1|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((tid@13@01 Int)) (!
  (and
    (=>
      (<= 0 tid@13@01)
      (and
        (<= 0 tid@13@01)
        (not
          (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
        (getVCTOption1%precondition $Snap.unit output@5@01)))
    (or (<= 0 tid@13@01) (not (<= 0 tid@13@01)))
    (=>
      (and
        (<= 0 tid@13@01)
        (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
      (and
        (<= 0 tid@13@01)
        (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (not
          (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
        (getVCTOption1%precondition $Snap.unit output@5@01)
        ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) (Seq_index
          (getVCTOption1 $Snap.unit output@5@01)
          tid@13@01)) (Seq_index
          (getVCTOption1 $Snap.unit output@5@01)
          tid@13@01))))
    (or
      (not
        (and
          (<= 0 tid@13@01)
          (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
      (and
        (<= 0 tid@13@01)
        (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@22@13@22@125-aux|)))
(assert (forall ((tid@13@01 Int)) (!
  (=>
    (and
      (<= 0 tid@13@01)
      (< tid@13@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
    (=
      ($FVF.lookup_Integer__item (as sm@12@01  $FVF<Integer__item>) (Seq_index
        (getVCTOption1 $Snap.unit output@5@01)
        tid@13@01))
      tid@13@01))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@5@01) tid@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@22@13@22@125|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] (VCTNone(): VCTOption[Seq[Ref]]) != output
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(declare-const k@15@01 Int)
(push) ; 3
; [eval] 0 <= k && k < |getVCTOption1(output)|
; [eval] 0 <= k
(push) ; 4
; [then-branch: 8 | !(0 <= k@15@01) | live]
; [else-branch: 8 | 0 <= k@15@01 | live]
(push) ; 5
; [then-branch: 8 | !(0 <= k@15@01)]
(assert (not (<= 0 k@15@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | 0 <= k@15@01]
(assert (<= 0 k@15@01))
; [eval] k < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@15@01)
  (and
    (<= 0 k@15@01)
    (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@5@01))))
(assert (or (<= 0 k@15@01) (not (<= 0 k@15@01))))
(assert (and
  (<= 0 k@15@01)
  (< k@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
; [eval] getVCTOption1(output)[k]
; [eval] getVCTOption1(output)
(push) ; 4
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 5
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
(push) ; 4
(assert (not (>= k@15@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@16@01 $Perm)
(assert ($Perm.isReadVar $k@16@01))
(declare-const sm@17@01 $FVF<Integer__item>)
; Definitional axioms for snapshot map values
; [eval] getVCTOption1(output)[k]
; [eval] getVCTOption1(output)
(push) ; 4
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 4
; Joined path conditions
(pop) ; 3
(declare-fun inv@18@01 ($Ref) Int)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@16@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@15@01 Int)) (!
  (=>
    (and
      (<= 0 k@15@01)
      (< k@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
    (and
      (=>
        (<= 0 k@15@01)
        (and
          (<= 0 k@15@01)
          (not
            (=
              output@5@01
              (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
          (getVCTOption1%precondition $Snap.unit output@5@01)))
      (or (<= 0 k@15@01) (not (<= 0 k@15@01)))
      (not
        (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
      (getVCTOption1%precondition $Snap.unit output@5@01)))
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) (Seq_index
    (getVCTOption1 $Snap.unit output@5@01)
    k@15@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01)))
  :qid |Integer__item-aux|)))
(push) ; 3
(assert (not (forall ((k@15@01 Int)) (!
  (=>
    (and
      (=> (<= 0 k@15@01) (getVCTOption1%precondition $Snap.unit output@5@01))
      (and
        (<= 0 k@15@01)
        (< k@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
    (or (= $k@16@01 $Perm.No) (< $Perm.No $k@16@01)))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((k1@15@01 Int) (k2@15@01 Int)) (!
  (and
    (=> (<= 0 k1@15@01) (getVCTOption1%precondition $Snap.unit output@5@01))
    (=>
      (and
        (and
          (<= 0 k1@15@01)
          (< k1@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
        (< $Perm.No $k@16@01))
      (and
        (=> (<= 0 k2@15@01) (getVCTOption1%precondition $Snap.unit output@5@01))
        (=>
          (and
            (and
              (<= 0 k2@15@01)
              (< k2@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
            (< $Perm.No $k@16@01))
          (getVCTOption1%precondition $Snap.unit output@5@01)))))
  
  :qid |Integer__item-rcvrInj|)))
(push) ; 3
(assert (not (forall ((k1@15@01 Int) (k2@15@01 Int)) (!
  (=>
    (and
      (and
        (and
          (<= 0 k1@15@01)
          (< k1@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
        (< $Perm.No $k@16@01))
      (and
        (and
          (<= 0 k2@15@01)
          (< k2@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
        (< $Perm.No $k@16@01))
      (=
        (Seq_index (getVCTOption1 $Snap.unit output@5@01) k1@15@01)
        (Seq_index (getVCTOption1 $Snap.unit output@5@01) k2@15@01)))
    (= k1@15@01 k2@15@01))
  
  :qid |Integer__item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@15@01 Int)) (!
  (and
    (=> (<= 0 k@15@01) (getVCTOption1%precondition $Snap.unit output@5@01))
    (=>
      (and
        (and
          (<= 0 k@15@01)
          (< k@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
        (< $Perm.No $k@16@01))
      (and
        (getVCTOption1%precondition $Snap.unit output@5@01)
        (=>
          (=
            (inv@18@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01))
            k@15@01)
          (getVCTOption1%precondition $Snap.unit output@5@01)))))
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) (Seq_index
    (getVCTOption1 $Snap.unit output@5@01)
    k@15@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01)))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (and (img@19@01 r) (<= 0 (inv@18@01 r)))
      (getVCTOption1%precondition $Snap.unit output@5@01))
    (=>
      (and
        (img@19@01 r)
        (and
          (and
            (<= 0 (inv@18@01 r))
            (< (inv@18@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
          (< $Perm.No $k@16@01)))
      (getVCTOption1%precondition $Snap.unit output@5@01)))
  :pattern ((inv@18@01 r))
  :qid |Integer__item-fctOfInv|)))
(assert (forall ((k@15@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 k@15@01)
        (< k@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
      (< $Perm.No $k@16@01))
    (and
      (=
        (inv@18@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01))
        k@15@01)
      (img@19@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01))))
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) (Seq_index
    (getVCTOption1 $Snap.unit output@5@01)
    k@15@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01)))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (and
        (and
          (<= 0 (inv@18@01 r))
          (< (inv@18@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
        (< $Perm.No $k@16@01)))
    (= (Seq_index (getVCTOption1 $Snap.unit output@5@01) (inv@18@01 r)) r))
  :pattern ((inv@18@01 r))
  :qid |Integer__item-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((k@15@01 Int)) (!
  (<= $Perm.No $k@16@01)
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) (Seq_index
    (getVCTOption1 $Snap.unit output@5@01)
    k@15@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01)))
  :qid |Integer__item-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((k@15@01 Int)) (!
  (<= $k@16@01 $Perm.Write)
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) (Seq_index
    (getVCTOption1 $Snap.unit output@5@01)
    k@15@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01)))
  :qid |Integer__item-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((k@15@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 k@15@01)
        (< k@15@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
      (< $Perm.No $k@16@01))
    (not
      (= (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01) $Ref.null)))
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) (Seq_index
    (getVCTOption1 $Snap.unit output@5@01)
    k@15@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) k@15@01)))
  :qid |Integer__item-permImpliesNonNull|)))
(declare-const sm@20@01 $FVF<Integer__item>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and
          (<= 0 (inv@18@01 r))
          (< (inv@18@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
      (< $Perm.No $k@16@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r)))
  :pattern (($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@18@01 r))
      (< (inv@18@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r) r))
  :pattern ((inv@18@01 r))
  :qid |quant-u-9|)))
(assert (= ($Snap.second ($Snap.second $t@14@01)) $Snap.unit))
; [eval] (forall tid: Int, j: Int ::0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid)
(declare-const tid@21@01 Int)
(declare-const j@22@01 Int)
(push) ; 3
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|))
; [eval] 0 <= tid
(push) ; 4
; [then-branch: 9 | !(0 <= tid@21@01) | live]
; [else-branch: 9 | 0 <= tid@21@01 | live]
(push) ; 5
; [then-branch: 9 | !(0 <= tid@21@01)]
(assert (not (<= 0 tid@21@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | 0 <= tid@21@01]
(assert (<= 0 tid@21@01))
; [eval] tid < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
(push) ; 6
; [then-branch: 10 | !(tid@21@01 < |getVCTOption1(_, output@5@01)|) | live]
; [else-branch: 10 | tid@21@01 < |getVCTOption1(_, output@5@01)| | live]
(push) ; 7
; [then-branch: 10 | !(tid@21@01 < |getVCTOption1(_, output@5@01)|)]
(assert (not (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | tid@21@01 < |getVCTOption1(_, output@5@01)|]
(assert (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 11 | !(0 <= j@22@01) | live]
; [else-branch: 11 | 0 <= j@22@01 | live]
(push) ; 9
; [then-branch: 11 | !(0 <= j@22@01)]
(assert (not (<= 0 j@22@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 11 | 0 <= j@22@01]
(assert (<= 0 j@22@01))
; [eval] j < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 10
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@22@01) (not (<= 0 j@22@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
  (and
    (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
    (or (<= 0 j@22@01) (not (<= 0 j@22@01))))))
(assert (or
  (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
  (not (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 tid@21@01)
  (and
    (<= 0 tid@21@01)
    (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@5@01)
    (=>
      (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (and
        (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (or (<= 0 j@22@01) (not (<= 0 j@22@01)))))
    (or
      (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (not (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))))
(assert (or (<= 0 tid@21@01) (not (<= 0 tid@21@01))))
(push) ; 4
; [then-branch: 12 | 0 <= tid@21@01 && tid@21@01 < |getVCTOption1(_, output@5@01)| && 0 <= j@22@01 && j@22@01 < |getVCTOption1(_, output@5@01)| | live]
; [else-branch: 12 | !(0 <= tid@21@01 && tid@21@01 < |getVCTOption1(_, output@5@01)| && 0 <= j@22@01 && j@22@01 < |getVCTOption1(_, output@5@01)|) | live]
(push) ; 5
; [then-branch: 12 | 0 <= tid@21@01 && tid@21@01 < |getVCTOption1(_, output@5@01)| && 0 <= j@22@01 && j@22@01 < |getVCTOption1(_, output@5@01)|]
(assert (and
  (<= 0 tid@21@01)
  (and
    (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
    (and
      (<= 0 j@22@01)
      (< j@22@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))))
; [eval] getVCTOption1(output)[j].Integer__item == tid
; [eval] getVCTOption1(output)[j]
; [eval] getVCTOption1(output)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@5@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@5@01)))
(push) ; 6
(assert (not (>= j@22@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@19@01 r)
          (and
            (<= 0 (inv@18@01 r))
            (< (inv@18@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
        (< $Perm.No $k@16@01)
        false)
      (=
        ($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r)
        ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r)))
    :pattern (($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r))
    :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r) r)
    :pattern (($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r))
    :qid |qp.fvfResTrgDef4|))))
(assert ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) (Seq_index
  (getVCTOption1 $Snap.unit output@5@01)
  j@22@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) j@22@01)))
(push) ; 6
(assert (not (ite
  (and
    (img@19@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) j@22@01))
    (and
      (<=
        0
        (inv@18@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) j@22@01)))
      (<
        (inv@18@01 (Seq_index (getVCTOption1 $Snap.unit output@5@01) j@22@01))
        (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
  (< $Perm.No $k@16@01)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 12 | !(0 <= tid@21@01 && tid@21@01 < |getVCTOption1(_, output@5@01)| && 0 <= j@22@01 && j@22@01 < |getVCTOption1(_, output@5@01)|)]
(assert (not
  (and
    (<= 0 tid@21@01)
    (and
      (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (and
        (<= 0 j@22@01)
        (< j@22@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and
          (<= 0 (inv@18@01 r))
          (< (inv@18@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
      (< $Perm.No $k@16@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r)))
  :pattern (($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (=>
  (and
    (<= 0 tid@21@01)
    (and
      (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (and
        (<= 0 j@22@01)
        (< j@22@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))
  (and
    (<= 0 tid@21@01)
    (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
    (<= 0 j@22@01)
    (< j@22@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
    (not (= output@5@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@5@01)
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) (Seq_index
      (getVCTOption1 $Snap.unit output@5@01)
      j@22@01)) (Seq_index (getVCTOption1 $Snap.unit output@5@01) j@22@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 tid@21@01)
      (and
        (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (and
          (<= 0 j@22@01)
          (< j@22@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))))
  (and
    (<= 0 tid@21@01)
    (and
      (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
      (and
        (<= 0 j@22@01)
        (< j@22@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and
          (<= 0 (inv@18@01 r))
          (< (inv@18@01 r) (Seq_length (getVCTOption1 $Snap.unit output@5@01)))))
      (< $Perm.No $k@16@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r)))
  :pattern (($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item ($SortWrappers.$SnapTo$FVF<Integer__item> ($Snap.first ($Snap.second $t@14@01))) r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((tid@21@01 Int) (j@22@01 Int)) (!
  (=>
    (and
      (<= 0 tid@21@01)
      (and
        (< tid@21@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01)))
        (and
          (<= 0 j@22@01)
          (< j@22@01 (Seq_length (getVCTOption1 $Snap.unit output@5@01))))))
    (=
      ($FVF.lookup_Integer__item (as sm@20@01  $FVF<Integer__item>) (Seq_index
        (getVCTOption1 $Snap.unit output@5@01)
        j@22@01))
      tid@21@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@25@12@25@173|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- barrier_check_2_essence ----------
(declare-const diz@23@01 $Ref)
(declare-const current_thread_id@24@01 Int)
(declare-const output@25@01 VCTOption<Seq<Ref>>)
(declare-const diz@26@01 $Ref)
(declare-const current_thread_id@27@01 Int)
(declare-const output@28@01 VCTOption<Seq<Ref>>)
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
; inhale (VCTNone(): VCTOption[Seq[Ref]]) != output
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 $Snap.unit))
; [eval] (VCTNone(): VCTOption[Seq[Ref]]) != output
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(assert (not (= (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>) output@28@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { getVCTOption1(output)[i], getVCTOption1(output)[j] }
;     i >= 0 &&
;     (i < |getVCTOption1(output)| &&
;     (j >= 0 && (j < |getVCTOption1(output)| && i != j))) ==>
;     getVCTOption1(output)[i] != getVCTOption1(output)[j])
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { getVCTOption1(output)[i], getVCTOption1(output)[j] } i >= 0 && (i < |getVCTOption1(output)| && (j >= 0 && (j < |getVCTOption1(output)| && i != j))) ==> getVCTOption1(output)[i] != getVCTOption1(output)[j])
(declare-const i@31@01 Int)
(declare-const j@32@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && (i < |getVCTOption1(output)| && (j >= 0 && (j < |getVCTOption1(output)| && i != j))) ==> getVCTOption1(output)[i] != getVCTOption1(output)[j]
; [eval] i >= 0 && (i < |getVCTOption1(output)| && (j >= 0 && (j < |getVCTOption1(output)| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 13 | !(i@31@01 >= 0) | live]
; [else-branch: 13 | i@31@01 >= 0 | live]
(push) ; 5
; [then-branch: 13 | !(i@31@01 >= 0)]
(assert (not (>= i@31@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | i@31@01 >= 0]
(assert (>= i@31@01 0))
; [eval] i < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 6
; [then-branch: 14 | !(i@31@01 < |getVCTOption1(_, output@28@01)|) | live]
; [else-branch: 14 | i@31@01 < |getVCTOption1(_, output@28@01)| | live]
(push) ; 7
; [then-branch: 14 | !(i@31@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
(pop) ; 7
(push) ; 7
; [else-branch: 14 | i@31@01 < |getVCTOption1(_, output@28@01)|]
(assert (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 15 | !(j@32@01 >= 0) | live]
; [else-branch: 15 | j@32@01 >= 0 | live]
(push) ; 9
; [then-branch: 15 | !(j@32@01 >= 0)]
(assert (not (>= j@32@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 15 | j@32@01 >= 0]
(assert (>= j@32@01 0))
; [eval] j < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 10
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 10
; Joined path conditions
(push) ; 10
; [then-branch: 16 | !(j@32@01 < |getVCTOption1(_, output@28@01)|) | live]
; [else-branch: 16 | j@32@01 < |getVCTOption1(_, output@28@01)| | live]
(push) ; 11
; [then-branch: 16 | !(j@32@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
(pop) ; 11
(push) ; 11
; [else-branch: 16 | j@32@01 < |getVCTOption1(_, output@28@01)|]
(assert (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (not (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@32@01 0)
  (and
    (>= j@32@01 0)
    (or
      (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (not (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(assert (or (>= j@32@01 0) (not (>= j@32@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (and
    (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (=>
      (>= j@32@01 0)
      (and
        (>= j@32@01 0)
        (or
          (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (not (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
    (or (>= j@32@01 0) (not (>= j@32@01 0))))))
(assert (or
  (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (not (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@31@01 0)
  (and
    (>= i@31@01 0)
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01)
    (=>
      (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (=>
          (>= j@32@01 0)
          (and
            (>= j@32@01 0)
            (or
              (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
              (not
                (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
        (or (>= j@32@01 0) (not (>= j@32@01 0)))))
    (or
      (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (not (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(assert (or (>= i@31@01 0) (not (>= i@31@01 0))))
(push) ; 4
; [then-branch: 17 | i@31@01 >= 0 && i@31@01 < |getVCTOption1(_, output@28@01)| && j@32@01 >= 0 && j@32@01 < |getVCTOption1(_, output@28@01)| && i@31@01 != j@32@01 | live]
; [else-branch: 17 | !(i@31@01 >= 0 && i@31@01 < |getVCTOption1(_, output@28@01)| && j@32@01 >= 0 && j@32@01 < |getVCTOption1(_, output@28@01)| && i@31@01 != j@32@01) | live]
(push) ; 5
; [then-branch: 17 | i@31@01 >= 0 && i@31@01 < |getVCTOption1(_, output@28@01)| && j@32@01 >= 0 && j@32@01 < |getVCTOption1(_, output@28@01)| && i@31@01 != j@32@01]
(assert (and
  (>= i@31@01 0)
  (and
    (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (and
      (>= j@32@01 0)
      (and
        (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (not (= i@31@01 j@32@01)))))))
; [eval] getVCTOption1(output)[i] != getVCTOption1(output)[j]
; [eval] getVCTOption1(output)[i]
; [eval] getVCTOption1(output)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
; [eval] getVCTOption1(output)[j]
; [eval] getVCTOption1(output)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(i@31@01 >= 0 && i@31@01 < |getVCTOption1(_, output@28@01)| && j@32@01 >= 0 && j@32@01 < |getVCTOption1(_, output@28@01)| && i@31@01 != j@32@01)]
(assert (not
  (and
    (>= i@31@01 0)
    (and
      (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (>= j@32@01 0)
        (and
          (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (not (= i@31@01 j@32@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@31@01 0)
    (and
      (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (>= j@32@01 0)
        (and
          (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (not (= i@31@01 j@32@01))))))
  (and
    (>= i@31@01 0)
    (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (>= j@32@01 0)
    (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (not (= i@31@01 j@32@01))
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@31@01 0)
      (and
        (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (and
          (>= j@32@01 0)
          (and
            (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
            (not (= i@31@01 j@32@01)))))))
  (and
    (>= i@31@01 0)
    (and
      (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (>= j@32@01 0)
        (and
          (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (not (= i@31@01 j@32@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@31@01 Int) (j@32@01 Int)) (!
  (and
    (=>
      (>= i@31@01 0)
      (and
        (>= i@31@01 0)
        (not
          (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
        (getVCTOption1%precondition $Snap.unit output@28@01)
        (=>
          (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
            (=>
              (>= j@32@01 0)
              (and
                (>= j@32@01 0)
                (or
                  (<
                    j@32@01
                    (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
                  (not
                    (<
                      j@32@01
                      (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
            (or (>= j@32@01 0) (not (>= j@32@01 0)))))
        (or
          (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (not (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
    (or (>= i@31@01 0) (not (>= i@31@01 0)))
    (=>
      (and
        (>= i@31@01 0)
        (and
          (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (>= j@32@01 0)
            (and
              (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
              (not (= i@31@01 j@32@01))))))
      (and
        (>= i@31@01 0)
        (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (>= j@32@01 0)
        (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (not (= i@31@01 j@32@01))
        (not
          (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
        (getVCTOption1%precondition $Snap.unit output@28@01)))
    (or
      (not
        (and
          (>= i@31@01 0)
          (and
            (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
            (and
              (>= j@32@01 0)
              (and
                (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
                (not (= i@31@01 j@32@01)))))))
      (and
        (>= i@31@01 0)
        (and
          (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (>= j@32@01 0)
            (and
              (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
              (not (= i@31@01 j@32@01))))))))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@28@01) i@31@01) (Seq_index
    (getVCTOption1 $Snap.unit output@28@01)
    j@32@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@34@10@34@178-aux|)))
(assert (forall ((i@31@01 Int) (j@32@01 Int)) (!
  (=>
    (and
      (>= i@31@01 0)
      (and
        (< i@31@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (and
          (>= j@32@01 0)
          (and
            (< j@32@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
            (not (= i@31@01 j@32@01))))))
    (not
      (=
        (Seq_index (getVCTOption1 $Snap.unit output@28@01) i@31@01)
        (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@32@01))))
  :pattern ((Seq_index (getVCTOption1 $Snap.unit output@28@01) i@31@01) (Seq_index
    (getVCTOption1 $Snap.unit output@28@01)
    j@32@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@34@10@34@178|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int ::
;     { getVCTOption1(output)[k].Integer__item }
;     0 <= k && k < |getVCTOption1(output)| ==>
;     acc(getVCTOption1(output)[k].Integer__item, wildcard))
(declare-const k@33@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= k && k < |getVCTOption1(output)|
; [eval] 0 <= k
(push) ; 4
; [then-branch: 18 | !(0 <= k@33@01) | live]
; [else-branch: 18 | 0 <= k@33@01 | live]
(push) ; 5
; [then-branch: 18 | !(0 <= k@33@01)]
(assert (not (<= 0 k@33@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | 0 <= k@33@01]
(assert (<= 0 k@33@01))
; [eval] k < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@33@01)
  (and
    (<= 0 k@33@01)
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01))))
(assert (or (<= 0 k@33@01) (not (<= 0 k@33@01))))
(assert (and
  (<= 0 k@33@01)
  (< k@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
; [eval] getVCTOption1(output)[k]
; [eval] getVCTOption1(output)
(push) ; 4
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 5
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 4
(assert (not (>= k@33@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@34@01 $Perm)
(assert ($Perm.isReadVar $k@34@01))
(declare-const sm@35@01 $FVF<Integer__item>)
; Definitional axioms for snapshot map values
; [eval] getVCTOption1(output)[k]
; [eval] getVCTOption1(output)
(push) ; 4
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 4
; Joined path conditions
(pop) ; 3
(declare-const $t@36@01 $FVF<Integer__item>)
(declare-fun inv@37@01 ($Ref) Int)
(declare-fun img@38@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@34@01))
; Nested auxiliary terms: non-globals
(assert (forall ((k@33@01 Int)) (!
  (=>
    (and
      (<= 0 k@33@01)
      (< k@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
    (and
      (=>
        (<= 0 k@33@01)
        (and
          (<= 0 k@33@01)
          (not
            (=
              output@28@01
              (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
          (getVCTOption1%precondition $Snap.unit output@28@01)))
      (or (<= 0 k@33@01) (not (<= 0 k@33@01)))
      (not
        (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
      (getVCTOption1%precondition $Snap.unit output@28@01)))
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 (Seq_index
    (getVCTOption1 $Snap.unit output@28@01)
    k@33@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) k@33@01)))
  :qid |Integer__item-aux|)))
(push) ; 3
(assert (not (forall ((k@33@01 Int)) (!
  (=>
    (and
      (=> (<= 0 k@33@01) (getVCTOption1%precondition $Snap.unit output@28@01))
      (and
        (<= 0 k@33@01)
        (< k@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
    (or (= $k@34@01 $Perm.No) (< $Perm.No $k@34@01)))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((k1@33@01 Int) (k2@33@01 Int)) (!
  (and
    (=> (<= 0 k1@33@01) (getVCTOption1%precondition $Snap.unit output@28@01))
    (=>
      (and
        (and
          (<= 0 k1@33@01)
          (< k1@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
        (< $Perm.No $k@34@01))
      (and
        (=> (<= 0 k2@33@01) (getVCTOption1%precondition $Snap.unit output@28@01))
        (=>
          (and
            (and
              (<= 0 k2@33@01)
              (< k2@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
            (< $Perm.No $k@34@01))
          (getVCTOption1%precondition $Snap.unit output@28@01)))))
  
  :qid |Integer__item-rcvrInj|)))
(push) ; 3
(assert (not (forall ((k1@33@01 Int) (k2@33@01 Int)) (!
  (=>
    (and
      (and
        (and
          (<= 0 k1@33@01)
          (< k1@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
        (< $Perm.No $k@34@01))
      (and
        (and
          (<= 0 k2@33@01)
          (< k2@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
        (< $Perm.No $k@34@01))
      (=
        (Seq_index (getVCTOption1 $Snap.unit output@28@01) k1@33@01)
        (Seq_index (getVCTOption1 $Snap.unit output@28@01) k2@33@01)))
    (= k1@33@01 k2@33@01))
  
  :qid |Integer__item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@33@01 Int)) (!
  (and
    (=> (<= 0 k@33@01) (getVCTOption1%precondition $Snap.unit output@28@01))
    (=>
      (and
        (and
          (<= 0 k@33@01)
          (< k@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
        (< $Perm.No $k@34@01))
      (and
        (getVCTOption1%precondition $Snap.unit output@28@01)
        (=>
          (=
            (inv@37@01 (Seq_index
              (getVCTOption1 $Snap.unit output@28@01)
              k@33@01))
            k@33@01)
          (getVCTOption1%precondition $Snap.unit output@28@01)))))
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 (Seq_index
    (getVCTOption1 $Snap.unit output@28@01)
    k@33@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) k@33@01)))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (and (img@38@01 r) (<= 0 (inv@37@01 r)))
      (getVCTOption1%precondition $Snap.unit output@28@01))
    (=>
      (and
        (img@38@01 r)
        (and
          (and
            (<= 0 (inv@37@01 r))
            (<
              (inv@37@01 r)
              (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
          (< $Perm.No $k@34@01)))
      (getVCTOption1%precondition $Snap.unit output@28@01)))
  :pattern ((inv@37@01 r))
  :qid |Integer__item-fctOfInv|)))
(assert (forall ((k@33@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 k@33@01)
        (< k@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
      (< $Perm.No $k@34@01))
    (and
      (=
        (inv@37@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) k@33@01))
        k@33@01)
      (img@38@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) k@33@01))))
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 (Seq_index
    (getVCTOption1 $Snap.unit output@28@01)
    k@33@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) k@33@01)))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@01 r)
      (and
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
        (< $Perm.No $k@34@01)))
    (= (Seq_index (getVCTOption1 $Snap.unit output@28@01) (inv@37@01 r)) r))
  :pattern ((inv@37@01 r))
  :qid |Integer__item-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((k@33@01 Int)) (!
  (<= $Perm.No $k@34@01)
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 (Seq_index
    (getVCTOption1 $Snap.unit output@28@01)
    k@33@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) k@33@01)))
  :qid |Integer__item-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((k@33@01 Int)) (!
  (<= $k@34@01 $Perm.Write)
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 (Seq_index
    (getVCTOption1 $Snap.unit output@28@01)
    k@33@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) k@33@01)))
  :qid |Integer__item-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((k@33@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 k@33@01)
        (< k@33@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
      (< $Perm.No $k@34@01))
    (not
      (= (Seq_index (getVCTOption1 $Snap.unit output@28@01) k@33@01) $Ref.null)))
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 (Seq_index
    (getVCTOption1 $Snap.unit output@28@01)
    k@33@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) k@33@01)))
  :qid |Integer__item-permImpliesNonNull|)))
(declare-const sm@39@01 $FVF<Integer__item>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@37@01 r))
      (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r) r))
  :pattern ((inv@37@01 r))
  :qid |quant-u-12|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall tid: Int, j: Int ::0 <= tid &&
;     (tid < |getVCTOption1(output)| &&
;     (0 <= j && j < |getVCTOption1(output)|)) ==>
;     getVCTOption1(output)[j].Integer__item == tid)
; [eval] (forall tid: Int, j: Int ::0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid)
(declare-const tid@40@01 Int)
(declare-const j@41@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|))
; [eval] 0 <= tid
(push) ; 4
; [then-branch: 19 | !(0 <= tid@40@01) | live]
; [else-branch: 19 | 0 <= tid@40@01 | live]
(push) ; 5
; [then-branch: 19 | !(0 <= tid@40@01)]
(assert (not (<= 0 tid@40@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | 0 <= tid@40@01]
(assert (<= 0 tid@40@01))
; [eval] tid < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 6
; [then-branch: 20 | !(tid@40@01 < |getVCTOption1(_, output@28@01)|) | live]
; [else-branch: 20 | tid@40@01 < |getVCTOption1(_, output@28@01)| | live]
(push) ; 7
; [then-branch: 20 | !(tid@40@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
(pop) ; 7
(push) ; 7
; [else-branch: 20 | tid@40@01 < |getVCTOption1(_, output@28@01)|]
(assert (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 21 | !(0 <= j@41@01) | live]
; [else-branch: 21 | 0 <= j@41@01 | live]
(push) ; 9
; [then-branch: 21 | !(0 <= j@41@01)]
(assert (not (<= 0 j@41@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 21 | 0 <= j@41@01]
(assert (<= 0 j@41@01))
; [eval] j < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(push) ; 10
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@41@01) (not (<= 0 j@41@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (and
    (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (or (<= 0 j@41@01) (not (<= 0 j@41@01))))))
(assert (or
  (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (not (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 tid@40@01)
  (and
    (<= 0 tid@40@01)
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01)
    (=>
      (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (or (<= 0 j@41@01) (not (<= 0 j@41@01)))))
    (or
      (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (not (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(assert (or (<= 0 tid@40@01) (not (<= 0 tid@40@01))))
(push) ; 4
; [then-branch: 22 | 0 <= tid@40@01 && tid@40@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@41@01 && j@41@01 < |getVCTOption1(_, output@28@01)| | live]
; [else-branch: 22 | !(0 <= tid@40@01 && tid@40@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@41@01 && j@41@01 < |getVCTOption1(_, output@28@01)|) | live]
(push) ; 5
; [then-branch: 22 | 0 <= tid@40@01 && tid@40@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@41@01 && j@41@01 < |getVCTOption1(_, output@28@01)|]
(assert (and
  (<= 0 tid@40@01)
  (and
    (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (and
      (<= 0 j@41@01)
      (< j@41@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
; [eval] getVCTOption1(output)[j].Integer__item == tid
; [eval] getVCTOption1(output)[j]
; [eval] getVCTOption1(output)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 6
(assert (not (>= j@41@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@38@01 r)
          (and
            (<= 0 (inv@37@01 r))
            (<
              (inv@37@01 r)
              (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
        (< $Perm.No $k@34@01)
        false)
      (=
        ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
        ($FVF.lookup_Integer__item $t@36@01 r)))
    :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
    :pattern (($FVF.lookup_Integer__item $t@36@01 r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
    :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
    :qid |qp.fvfResTrgDef7|))))
(assert ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
  (getVCTOption1 $Snap.unit output@28@01)
  j@41@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@41@01)))
(push) ; 6
(assert (not (ite
  (and
    (img@38@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@41@01))
    (and
      (<=
        0
        (inv@37@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@41@01)))
      (<
        (inv@37@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@41@01))
        (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
  (< $Perm.No $k@34@01)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(0 <= tid@40@01 && tid@40@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@41@01 && j@41@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not
  (and
    (<= 0 tid@40@01)
    (and
      (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@41@01)
        (< j@41@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (=>
  (and
    (<= 0 tid@40@01)
    (and
      (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@41@01)
        (< j@41@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
  (and
    (<= 0 tid@40@01)
    (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (<= 0 j@41@01)
    (< j@41@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01)
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
      (getVCTOption1 $Snap.unit output@28@01)
      j@41@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@41@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 tid@40@01)
      (and
        (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (and
          (<= 0 j@41@01)
          (< j@41@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
  (and
    (<= 0 tid@40@01)
    (and
      (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@41@01)
        (< j@41@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((tid@40@01 Int) (j@41@01 Int)) (!
  (and
    (=>
      (<= 0 tid@40@01)
      (and
        (getVCTOption1%precondition $Snap.unit output@28@01)
        (=>
          (and
            (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
            (<= 0 j@41@01))
          (getVCTOption1%precondition $Snap.unit output@28@01))))
    (=>
      (and
        (<= 0 tid@40@01)
        (and
          (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (<= 0 j@41@01)
            (< j@41@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
      (getVCTOption1%precondition $Snap.unit output@28@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@43@5@46@54_precondition|)))
(push) ; 3
(assert (not (forall ((tid@40@01 Int) (j@41@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 tid@40@01)
          (and
            (getVCTOption1%precondition $Snap.unit output@28@01)
            (=>
              (and
                (<
                  tid@40@01
                  (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
                (<= 0 j@41@01))
              (getVCTOption1%precondition $Snap.unit output@28@01))))
        (=>
          (and
            (<= 0 tid@40@01)
            (and
              (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
              (and
                (<= 0 j@41@01)
                (< j@41@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
          (getVCTOption1%precondition $Snap.unit output@28@01)))
      (and
        (<= 0 tid@40@01)
        (and
          (< tid@40@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (<= 0 j@41@01)
            (< j@41@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
        (getVCTOption1 $Snap.unit output@28@01)
        j@41@01))
      tid@40@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@43@5@46@54|))))
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
(declare-const pm@42@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@42@01  $FPM) r)
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      $k@34@01
      $Perm.No))
  :pattern (($FVF.perm_Integer__item (as pm@42@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r) r)
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r))
  :pattern (($FVF.perm_Integer__item (as pm@42@01  $FPM) r))
  :qid |qp.resTrgDef9|)))
; Assume upper permission bound for field Integer__item
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Integer__item (as pm@42@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall tid: Int, j: Int ::0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid)
(declare-const tid@43@01 Int)
(declare-const j@44@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|))
; [eval] 0 <= tid
(push) ; 4
; [then-branch: 23 | !(0 <= tid@43@01) | live]
; [else-branch: 23 | 0 <= tid@43@01 | live]
(push) ; 5
; [then-branch: 23 | !(0 <= tid@43@01)]
(assert (not (<= 0 tid@43@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 23 | 0 <= tid@43@01]
(assert (<= 0 tid@43@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] tid < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(set-option :timeout 0)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 6
; [then-branch: 24 | !(tid@43@01 < |getVCTOption1(_, output@28@01)|) | live]
; [else-branch: 24 | tid@43@01 < |getVCTOption1(_, output@28@01)| | live]
(push) ; 7
; [then-branch: 24 | !(tid@43@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 24 | tid@43@01 < |getVCTOption1(_, output@28@01)|]
(assert (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] 0 <= j
(set-option :timeout 0)
(push) ; 8
; [then-branch: 25 | !(0 <= j@44@01) | live]
; [else-branch: 25 | 0 <= j@44@01 | live]
(push) ; 9
; [then-branch: 25 | !(0 <= j@44@01)]
(assert (not (<= 0 j@44@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 25 | 0 <= j@44@01]
(assert (<= 0 j@44@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] j < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(set-option :timeout 0)
(push) ; 10
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@44@01) (not (<= 0 j@44@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (and
    (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (or (<= 0 j@44@01) (not (<= 0 j@44@01))))))
(assert (or
  (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (not (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 tid@43@01)
  (and
    (<= 0 tid@43@01)
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01)
    (=>
      (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (or (<= 0 j@44@01) (not (<= 0 j@44@01)))))
    (or
      (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (not (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(assert (or (<= 0 tid@43@01) (not (<= 0 tid@43@01))))
(push) ; 4
; [then-branch: 26 | 0 <= tid@43@01 && tid@43@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@44@01 && j@44@01 < |getVCTOption1(_, output@28@01)| | live]
; [else-branch: 26 | !(0 <= tid@43@01 && tid@43@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@44@01 && j@44@01 < |getVCTOption1(_, output@28@01)|) | live]
(push) ; 5
; [then-branch: 26 | 0 <= tid@43@01 && tid@43@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@44@01 && j@44@01 < |getVCTOption1(_, output@28@01)|]
(assert (and
  (<= 0 tid@43@01)
  (and
    (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (and
      (<= 0 j@44@01)
      (< j@44@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] getVCTOption1(output)[j].Integer__item == tid
; [eval] getVCTOption1(output)[j]
; [eval] getVCTOption1(output)
(set-option :timeout 0)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 6
(assert (not (>= j@44@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@38@01 r)
          (and
            (<= 0 (inv@37@01 r))
            (<
              (inv@37@01 r)
              (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
        (< $Perm.No $k@34@01)
        false)
      (=
        ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
        ($FVF.lookup_Integer__item $t@36@01 r)))
    :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
    :pattern (($FVF.lookup_Integer__item $t@36@01 r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
    :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
    :qid |qp.fvfResTrgDef7|))))
(assert ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
  (getVCTOption1 $Snap.unit output@28@01)
  j@44@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@44@01)))
(push) ; 6
(assert (not (ite
  (and
    (img@38@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@44@01))
    (and
      (<=
        0
        (inv@37@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@44@01)))
      (<
        (inv@37@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@44@01))
        (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
  (< $Perm.No $k@34@01)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 26 | !(0 <= tid@43@01 && tid@43@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@44@01 && j@44@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not
  (and
    (<= 0 tid@43@01)
    (and
      (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@44@01)
        (< j@44@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
; Assume upper permission bound for field Integer__item
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (=>
  (and
    (<= 0 tid@43@01)
    (and
      (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@44@01)
        (< j@44@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
  (and
    (<= 0 tid@43@01)
    (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (<= 0 j@44@01)
    (< j@44@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01)
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
      (getVCTOption1 $Snap.unit output@28@01)
      j@44@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@44@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 tid@43@01)
      (and
        (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (and
          (<= 0 j@44@01)
          (< j@44@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
  (and
    (<= 0 tid@43@01)
    (and
      (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@44@01)
        (< j@44@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((tid@43@01 Int) (j@44@01 Int)) (!
  (and
    (=>
      (<= 0 tid@43@01)
      (and
        (getVCTOption1%precondition $Snap.unit output@28@01)
        (=>
          (and
            (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
            (<= 0 j@44@01))
          (getVCTOption1%precondition $Snap.unit output@28@01))))
    (=>
      (and
        (<= 0 tid@43@01)
        (and
          (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (<= 0 j@44@01)
            (< j@44@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
      (getVCTOption1%precondition $Snap.unit output@28@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@43@5@46@54_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((tid@43@01 Int) (j@44@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 tid@43@01)
          (and
            (getVCTOption1%precondition $Snap.unit output@28@01)
            (=>
              (and
                (<
                  tid@43@01
                  (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
                (<= 0 j@44@01))
              (getVCTOption1%precondition $Snap.unit output@28@01))))
        (=>
          (and
            (<= 0 tid@43@01)
            (and
              (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
              (and
                (<= 0 j@44@01)
                (< j@44@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
          (getVCTOption1%precondition $Snap.unit output@28@01)))
      (and
        (<= 0 tid@43@01)
        (and
          (< tid@43@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (<= 0 j@44@01)
            (< j@44@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
        (getVCTOption1 $Snap.unit output@28@01)
        j@44@01))
      tid@43@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@43@5@46@54|))))
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
(declare-const pm@45@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Integer__item (as pm@45@01  $FPM) r)
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      $k@34@01
      $Perm.No))
  :pattern (($FVF.perm_Integer__item (as pm@45@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r) r)
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r))
  :pattern (($FVF.perm_Integer__item (as pm@45@01  $FPM) r))
  :qid |qp.resTrgDef11|)))
; Assume upper permission bound for field Integer__item
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_Integer__item (as pm@45@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall tid: Int, j: Int ::0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid)
(declare-const tid@46@01 Int)
(declare-const j@47@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|))
; [eval] 0 <= tid
(push) ; 4
; [then-branch: 27 | !(0 <= tid@46@01) | live]
; [else-branch: 27 | 0 <= tid@46@01 | live]
(push) ; 5
; [then-branch: 27 | !(0 <= tid@46@01)]
(assert (not (<= 0 tid@46@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 27 | 0 <= tid@46@01]
(assert (<= 0 tid@46@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] tid < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(set-option :timeout 0)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 6
; [then-branch: 28 | !(tid@46@01 < |getVCTOption1(_, output@28@01)|) | live]
; [else-branch: 28 | tid@46@01 < |getVCTOption1(_, output@28@01)| | live]
(push) ; 7
; [then-branch: 28 | !(tid@46@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 28 | tid@46@01 < |getVCTOption1(_, output@28@01)|]
(assert (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] 0 <= j
(set-option :timeout 0)
(push) ; 8
; [then-branch: 29 | !(0 <= j@47@01) | live]
; [else-branch: 29 | 0 <= j@47@01 | live]
(push) ; 9
; [then-branch: 29 | !(0 <= j@47@01)]
(assert (not (<= 0 j@47@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 29 | 0 <= j@47@01]
(assert (<= 0 j@47@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] j < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(set-option :timeout 0)
(push) ; 10
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@47@01) (not (<= 0 j@47@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (and
    (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (or (<= 0 j@47@01) (not (<= 0 j@47@01))))))
(assert (or
  (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (not (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 tid@46@01)
  (and
    (<= 0 tid@46@01)
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01)
    (=>
      (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (or (<= 0 j@47@01) (not (<= 0 j@47@01)))))
    (or
      (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (not (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(assert (or (<= 0 tid@46@01) (not (<= 0 tid@46@01))))
(push) ; 4
; [then-branch: 30 | 0 <= tid@46@01 && tid@46@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@47@01 && j@47@01 < |getVCTOption1(_, output@28@01)| | live]
; [else-branch: 30 | !(0 <= tid@46@01 && tid@46@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@47@01 && j@47@01 < |getVCTOption1(_, output@28@01)|) | live]
(push) ; 5
; [then-branch: 30 | 0 <= tid@46@01 && tid@46@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@47@01 && j@47@01 < |getVCTOption1(_, output@28@01)|]
(assert (and
  (<= 0 tid@46@01)
  (and
    (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (and
      (<= 0 j@47@01)
      (< j@47@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] getVCTOption1(output)[j].Integer__item == tid
; [eval] getVCTOption1(output)[j]
; [eval] getVCTOption1(output)
(set-option :timeout 0)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 6
(assert (not (>= j@47@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@38@01 r)
          (and
            (<= 0 (inv@37@01 r))
            (<
              (inv@37@01 r)
              (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
        (< $Perm.No $k@34@01)
        false)
      (=
        ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
        ($FVF.lookup_Integer__item $t@36@01 r)))
    :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
    :pattern (($FVF.lookup_Integer__item $t@36@01 r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
    :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
    :qid |qp.fvfResTrgDef7|))))
(assert ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
  (getVCTOption1 $Snap.unit output@28@01)
  j@47@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@47@01)))
(push) ; 6
(assert (not (ite
  (and
    (img@38@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@47@01))
    (and
      (<=
        0
        (inv@37@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@47@01)))
      (<
        (inv@37@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@47@01))
        (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
  (< $Perm.No $k@34@01)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 30 | !(0 <= tid@46@01 && tid@46@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@47@01 && j@47@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not
  (and
    (<= 0 tid@46@01)
    (and
      (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@47@01)
        (< j@47@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
; Assume upper permission bound for field Integer__item
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (=>
  (and
    (<= 0 tid@46@01)
    (and
      (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@47@01)
        (< j@47@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
  (and
    (<= 0 tid@46@01)
    (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (<= 0 j@47@01)
    (< j@47@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01)
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
      (getVCTOption1 $Snap.unit output@28@01)
      j@47@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@47@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 tid@46@01)
      (and
        (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (and
          (<= 0 j@47@01)
          (< j@47@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
  (and
    (<= 0 tid@46@01)
    (and
      (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@47@01)
        (< j@47@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((tid@46@01 Int) (j@47@01 Int)) (!
  (and
    (=>
      (<= 0 tid@46@01)
      (and
        (getVCTOption1%precondition $Snap.unit output@28@01)
        (=>
          (and
            (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
            (<= 0 j@47@01))
          (getVCTOption1%precondition $Snap.unit output@28@01))))
    (=>
      (and
        (<= 0 tid@46@01)
        (and
          (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (<= 0 j@47@01)
            (< j@47@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
      (getVCTOption1%precondition $Snap.unit output@28@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@43@5@46@54_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((tid@46@01 Int) (j@47@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 tid@46@01)
          (and
            (getVCTOption1%precondition $Snap.unit output@28@01)
            (=>
              (and
                (<
                  tid@46@01
                  (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
                (<= 0 j@47@01))
              (getVCTOption1%precondition $Snap.unit output@28@01))))
        (=>
          (and
            (<= 0 tid@46@01)
            (and
              (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
              (and
                (<= 0 j@47@01)
                (< j@47@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
          (getVCTOption1%precondition $Snap.unit output@28@01)))
      (and
        (<= 0 tid@46@01)
        (and
          (< tid@46@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (<= 0 j@47@01)
            (< j@47@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
        (getVCTOption1 $Snap.unit output@28@01)
        j@47@01))
      tid@46@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@43@5@46@54|))))
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
; Assume upper permission bound for field Integer__item
; [eval] (forall tid: Int, j: Int ::0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid)
(declare-const tid@48@01 Int)
(declare-const j@49@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|)) ==> getVCTOption1(output)[j].Integer__item == tid
; [eval] 0 <= tid && (tid < |getVCTOption1(output)| && (0 <= j && j < |getVCTOption1(output)|))
; [eval] 0 <= tid
(push) ; 4
; [then-branch: 31 | !(0 <= tid@48@01) | live]
; [else-branch: 31 | 0 <= tid@48@01 | live]
(push) ; 5
; [then-branch: 31 | !(0 <= tid@48@01)]
(assert (not (<= 0 tid@48@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 31 | 0 <= tid@48@01]
(assert (<= 0 tid@48@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] tid < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(set-option :timeout 0)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 6
; [then-branch: 32 | !(tid@48@01 < |getVCTOption1(_, output@28@01)|) | live]
; [else-branch: 32 | tid@48@01 < |getVCTOption1(_, output@28@01)| | live]
(push) ; 7
; [then-branch: 32 | !(tid@48@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 32 | tid@48@01 < |getVCTOption1(_, output@28@01)|]
(assert (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] 0 <= j
(set-option :timeout 0)
(push) ; 8
; [then-branch: 33 | !(0 <= j@49@01) | live]
; [else-branch: 33 | 0 <= j@49@01 | live]
(push) ; 9
; [then-branch: 33 | !(0 <= j@49@01)]
(assert (not (<= 0 j@49@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 33 | 0 <= j@49@01]
(assert (<= 0 j@49@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] j < |getVCTOption1(output)|
; [eval] |getVCTOption1(output)|
; [eval] getVCTOption1(output)
(set-option :timeout 0)
(push) ; 10
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@49@01) (not (<= 0 j@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (and
    (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (or (<= 0 j@49@01) (not (<= 0 j@49@01))))))
(assert (or
  (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
  (not (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 tid@48@01)
  (and
    (<= 0 tid@48@01)
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01)
    (=>
      (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (or (<= 0 j@49@01) (not (<= 0 j@49@01)))))
    (or
      (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (not (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(assert (or (<= 0 tid@48@01) (not (<= 0 tid@48@01))))
(push) ; 4
; [then-branch: 34 | 0 <= tid@48@01 && tid@48@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@49@01 && j@49@01 < |getVCTOption1(_, output@28@01)| | live]
; [else-branch: 34 | !(0 <= tid@48@01 && tid@48@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@49@01 && j@49@01 < |getVCTOption1(_, output@28@01)|) | live]
(push) ; 5
; [then-branch: 34 | 0 <= tid@48@01 && tid@48@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@49@01 && j@49@01 < |getVCTOption1(_, output@28@01)|]
(assert (and
  (<= 0 tid@48@01)
  (and
    (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (and
      (<= 0 j@49@01)
      (< j@49@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field Integer__item
; [eval] getVCTOption1(output)[j].Integer__item == tid
; [eval] getVCTOption1(output)[j]
; [eval] getVCTOption1(output)
(set-option :timeout 0)
(push) ; 6
; [eval] x != (VCTNone(): VCTOption[Seq[Ref]])
; [eval] (VCTNone(): VCTOption[Seq[Ref]])
(push) ; 7
(assert (not (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>))))
(assert (getVCTOption1%precondition $Snap.unit output@28@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
  (getVCTOption1%precondition $Snap.unit output@28@01)))
(push) ; 6
(assert (not (>= j@49@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@38@01 r)
          (and
            (<= 0 (inv@37@01 r))
            (<
              (inv@37@01 r)
              (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
        (< $Perm.No $k@34@01)
        false)
      (=
        ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
        ($FVF.lookup_Integer__item $t@36@01 r)))
    :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
    :pattern (($FVF.lookup_Integer__item $t@36@01 r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
    :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
    :qid |qp.fvfResTrgDef7|))))
(assert ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
  (getVCTOption1 $Snap.unit output@28@01)
  j@49@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@49@01)))
(push) ; 6
(assert (not (ite
  (and
    (img@38@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@49@01))
    (and
      (<=
        0
        (inv@37@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@49@01)))
      (<
        (inv@37@01 (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@49@01))
        (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
  (< $Perm.No $k@34@01)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 34 | !(0 <= tid@48@01 && tid@48@01 < |getVCTOption1(_, output@28@01)| && 0 <= j@49@01 && j@49@01 < |getVCTOption1(_, output@28@01)|)]
(assert (not
  (and
    (<= 0 tid@48@01)
    (and
      (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@49@01)
        (< j@49@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
; Assume upper permission bound for field Integer__item
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (=>
  (and
    (<= 0 tid@48@01)
    (and
      (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@49@01)
        (< j@49@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
  (and
    (<= 0 tid@48@01)
    (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (<= 0 j@49@01)
    (< j@49@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
    (not (= output@28@01 (as VCTNone<VCTOption<Seq<Ref>>>  VCTOption<Seq<Ref>>)))
    (getVCTOption1%precondition $Snap.unit output@28@01)
    ($FVF.loc_Integer__item ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
      (getVCTOption1 $Snap.unit output@28@01)
      j@49@01)) (Seq_index (getVCTOption1 $Snap.unit output@28@01) j@49@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 tid@48@01)
      (and
        (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
        (and
          (<= 0 j@49@01)
          (< j@49@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
  (and
    (<= 0 tid@48@01)
    (and
      (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
      (and
        (<= 0 j@49@01)
        (< j@49@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@38@01 r)
        (and
          (<= 0 (inv@37@01 r))
          (< (inv@37@01 r) (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))
      (< $Perm.No $k@34@01)
      false)
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r)
      ($FVF.lookup_Integer__item $t@36@01 r)))
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :pattern (($FVF.lookup_Integer__item $t@36@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_Integer__item ($FVF.lookup_Integer__item $t@36@01 r) r)
  :pattern (($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) r))
  :qid |qp.fvfResTrgDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((tid@48@01 Int) (j@49@01 Int)) (!
  (and
    (=>
      (<= 0 tid@48@01)
      (and
        (getVCTOption1%precondition $Snap.unit output@28@01)
        (=>
          (and
            (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
            (<= 0 j@49@01))
          (getVCTOption1%precondition $Snap.unit output@28@01))))
    (=>
      (and
        (<= 0 tid@48@01)
        (and
          (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (<= 0 j@49@01)
            (< j@49@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
      (getVCTOption1%precondition $Snap.unit output@28@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@43@5@46@54_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((tid@48@01 Int) (j@49@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 tid@48@01)
          (and
            (getVCTOption1%precondition $Snap.unit output@28@01)
            (=>
              (and
                (<
                  tid@48@01
                  (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
                (<= 0 j@49@01))
              (getVCTOption1%precondition $Snap.unit output@28@01))))
        (=>
          (and
            (<= 0 tid@48@01)
            (and
              (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
              (and
                (<= 0 j@49@01)
                (< j@49@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01))))))
          (getVCTOption1%precondition $Snap.unit output@28@01)))
      (and
        (<= 0 tid@48@01)
        (and
          (< tid@48@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))
          (and
            (<= 0 j@49@01)
            (< j@49@01 (Seq_length (getVCTOption1 $Snap.unit output@28@01)))))))
    (=
      ($FVF.lookup_Integer__item (as sm@39@01  $FVF<Integer__item>) (Seq_index
        (getVCTOption1 $Snap.unit output@28@01)
        j@49@01))
      tid@48@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0370.vpr@43@5@46@54|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
