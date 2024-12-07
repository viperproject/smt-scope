(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:17:56
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<g> 0)
(declare-sort $FVF<f> 0)
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
; /field_value_functions_declarations.smt2 [g: Ref]
(declare-fun $FVF.domain_g ($FVF<g>) Set<$Ref>)
(declare-fun $FVF.lookup_g ($FVF<g> $Ref) $Ref)
(declare-fun $FVF.after_g ($FVF<g> $FVF<g>) Bool)
(declare-fun $FVF.loc_g ($Ref $Ref) Bool)
(declare-fun $FVF.perm_g ($FPM $Ref) $Perm)
(declare-const $fvfTOP_g $FVF<g>)
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; Declaring symbols related to program functions (from program analysis)
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
; /field_value_functions_axioms.smt2 [g: Ref]
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
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_g f r) true)
    :pattern (($FVF.loc_g f r)))))
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
; ---------- test01 ----------
(declare-const x1@0@01 $Ref)
(declare-const x2@1@01 $Ref)
(declare-const x1@2@01 $Ref)
(declare-const x2@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const sm@5@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01))))
(assert (not (= x1@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(declare-const sm@6@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@6@01  $FVF<f>) ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
    ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
  (not (= ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(declare-const sm@7@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@7@01  $FVF<g>) x2@3@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x2@3@01 x1@2@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x2@3@01 $Ref.null)))
(declare-const sm@8@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@2@01)
    (=
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@5@01  $FVF<g>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@3@01)
    (=
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@7@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@7@01  $FVF<g>) r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@9@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@9@01  $FPM) r)
    (+
      (ite (= r x1@2@01) $Perm.Write $Perm.No)
      (ite (= r x2@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@9@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@9@01  $FPM) x2@3@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@10@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@10@01  $FVF<f>) ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
  ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
    ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
  (not (= ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(declare-const x@12@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@12@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
(pop) ; 3
(declare-fun inv@13@01 ($Ref) $Ref)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@12@01 $Ref) (x2@12@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@12@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (Set_in x2@12@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (= x1@12@01 x2@12@01))
    (= x1@12@01 x2@12@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Set_in x@12@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
    (and (= (inv@13@01 x@12@01) x@12@01) (img@14@01 x@12@01)))
  :pattern ((Set_in x@12@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
  :pattern ((inv@13@01 x@12@01))
  :pattern ((img@14@01 x@12@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@01 r)
      (Set_in (inv@13@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
    (= (inv@13@01 r) r))
  :pattern ((inv@13@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Set_in x@12@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
    (not (= x@12@01 $Ref.null)))
  :pattern ((Set_in x@12@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
  :pattern ((inv@13@01 x@12@01))
  :pattern ((img@14@01 x@12@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@11@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@01))
    ($Snap.second ($Snap.second $t@11@01)))))
(assert (= ($Snap.first ($Snap.second $t@11@01)) $Snap.unit))
; [eval] x1.g != x2.g
(push) ; 3
(assert (not (and
  (img@14@01 x1@2@01)
  (Set_in (inv@13@01 x1@2@01) (Set_unionone (Set_singleton x1@2@01) x2@3@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@14@01 x2@3@01)
  (Set_in (inv@13@01 x2@3@01) (Set_unionone (Set_singleton x1@2@01) x2@3@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) x1@2@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) x2@3@01))))
(declare-const x@15@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@15@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
(push) ; 4
(assert (not (and
  (img@14@01 x@15@01)
  (Set_in (inv@13@01 x@15@01) (Set_unionone (Set_singleton x1@2@01) x2@3@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@16@01 ($Ref) $Ref)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@15@01 $Ref) (x2@15@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@15@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (Set_in x2@15@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) x1@15@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) x2@15@01)))
    (= x1@15@01 x2@15@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@15@01 $Ref)) (!
  (=>
    (Set_in x@15@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
    (and
      (=
        (inv@16@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) x@15@01))
        x@15@01)
      (img@17@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) x@15@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) x@15@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@01 r)
      (Set_in (inv@16@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) (inv@16@01 r))
      r))
  :pattern ((inv@16@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@15@01 $Ref)) (!
  (=>
    (Set_in x@15@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) x@15@01)
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@11@01)) x@15@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@18@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@18@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
(pop) ; 3
(declare-fun inv@19@01 ($Ref) $Ref)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@18@01 $Ref) (x2@18@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@18@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (Set_in x2@18@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (= x1@18@01 x2@18@01))
    (= x1@18@01 x2@18@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@18@01 $Ref)) (!
  (=>
    (Set_in x@18@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
    (and (= (inv@19@01 x@18@01) x@18@01) (img@20@01 x@18@01)))
  :pattern ((Set_in x@18@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
  :pattern ((inv@19@01 x@18@01))
  :pattern ((img@20@01 x@18@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (Set_in (inv@19@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
    (= (inv@19@01 r) r))
  :pattern ((inv@19@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@19@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (img@20@01 r)
      (= r (inv@19@01 r)))
    ($Perm.min (ite (= r x1@2@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@22@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@19@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (img@20@01 r)
      (= r (inv@19@01 r)))
    ($Perm.min
      (ite (= r x2@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@21@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@21@01 x1@2@01)) $Perm.No)))
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
      (Set_in (inv@19@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (img@20@01 r)
      (= r (inv@19@01 r)))
    (= (- $Perm.Write (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@22@01 x2@3@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@22@01 r) $Perm.No)
  
  :qid |quant-u-9|))))
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
      (Set_in (inv@19@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (img@20@01 r)
      (= r (inv@19@01 r)))
    (= (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@22@01 r)) $Perm.No))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] x1.g != x2.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@2@01)
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@5@01  $FVF<g>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@3@01)
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@7@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@7@01  $FVF<g>) r))
    :qid |qp.fvfValDef1|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No (+ $Perm.Write (ite (= x1@2@01 x2@3@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@2@01)
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@5@01  $FVF<g>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@3@01)
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@7@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@7@01  $FVF<g>) r))
    :qid |qp.fvfValDef1|))))
(push) ; 3
(assert (not (< $Perm.No (+ (ite (= x2@3@01 x1@2@01) $Perm.Write $Perm.No) $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@8@01  $FVF<g>) x1@2@01)
    ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
  ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x1@2@01 x2@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
    ($FVF.lookup_g (as sm@7@01  $FVF<g>) x2@3@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@7@01  $FVF<g>) x2@3@01)
    ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
    (=
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)))
  (not
    (=
      ($FVF.lookup_f (as sm@6@01  $FVF<f>) ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
    (=
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)))
  (not
    (=
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
      ($FVF.lookup_f (as sm@6@01  $FVF<f>) ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and (not (= x1@2@01 x2@3@01)) (not (= x2@3@01 x1@2@01)))
  (and
    (not
      (=
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)))
    (not
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))))))
(declare-const sm@23@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
    (=
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@6@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@6@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
    (=
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@24@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@24@01  $FPM) r)
    (+
      (ite
        (= r ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= r ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@24@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (<=
  ($FVF.perm_f (as pm@24@01  $FPM) ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
  $Perm.Write))
(assert (<=
  ($FVF.perm_f (as pm@24@01  $FPM) ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
  $Perm.Write))
; Definitional axioms for snapshot map values
(assert (<= ($FVF.perm_g (as pm@9@01  $FPM) x1@2@01) $Perm.Write))
(assert (<= ($FVF.perm_g (as pm@9@01  $FPM) x2@3@01) $Perm.Write))
; [eval] x1.g != x2.g
(declare-const sm@25@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@3@01)
    (=
      ($FVF.lookup_g (as sm@25@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@7@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@25@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@7@01  $FVF<g>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@2@01)
    (=
      ($FVF.lookup_g (as sm@25@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@25@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@5@01  $FVF<g>) r))
  :qid |qp.fvfValDef7|)))
(declare-const pm@26@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@26@01  $FPM) r)
    (+
      (ite (= r x2@3@01) $Perm.Write $Perm.No)
      (ite (= r x1@2@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@26@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@26@01  $FPM) x1@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x2@3@01)
      (=
        ($FVF.lookup_g (as sm@25@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@7@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@25@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@7@01  $FVF<g>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (= r x1@2@01)
      (=
        ($FVF.lookup_g (as sm@25@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@25@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@5@01  $FVF<g>) r))
    :qid |qp.fvfValDef7|))))
(push) ; 3
(assert (not (< $Perm.No (+ $Perm.Write (ite (= x2@3@01 x1@2@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@25@01  $FVF<g>) x1@2@01)
    ($FVF.lookup_g (as sm@25@01  $FVF<g>) x2@3@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g (as sm@25@01  $FVF<g>) x1@2@01)
    ($FVF.lookup_g (as sm@25@01  $FVF<g>) x2@3@01))))
(declare-const x@27@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@27@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@2@01)
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@5@01  $FVF<g>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@3@01)
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@7@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@7@01  $FVF<g>) r))
    :qid |qp.fvfValDef1|))))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite (= x@27@01 x1@2@01) $Perm.Write $Perm.No)
    (ite (= x@27@01 x2@3@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@28@01 ($Ref) $Ref)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@2@01)
    (=
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@5@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@5@01  $FVF<g>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@3@01)
    (=
      ($FVF.lookup_g (as sm@8@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@7@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@7@01  $FVF<g>) r))
  :qid |qp.fvfValDef1|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@27@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (Set_in x2@27@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x1@27@01)
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@27@01)))
    (= x1@27@01 x2@27@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Set_in x@27@01 (Set_unionone (Set_singleton x1@2@01) x2@3@01))
    (and
      (= (inv@28@01 ($FVF.lookup_g (as sm@8@01  $FVF<g>) x@27@01)) x@27@01)
      (img@29@01 ($FVF.lookup_g (as sm@8@01  $FVF<g>) x@27@01))))
  :pattern (($FVF.lookup_g (as sm@8@01  $FVF<g>) x@27@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@01 r)
      (Set_in (inv@28@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01)))
    (= ($FVF.lookup_g (as sm@8@01  $FVF<g>) (inv@28@01 r)) r))
  :pattern ((inv@28@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@28@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (img@29@01 r)
      (= r ($FVF.lookup_g (as sm@8@01  $FVF<g>) (inv@28@01 r))))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@28@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (img@29@01 r)
      (= r ($FVF.lookup_g (as sm@8@01  $FVF<g>) (inv@28@01 r))))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@30@01 r)))
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
(assert (not (=
  (-
    (ite
      (=
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)
        ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
      $Perm.Write
      $Perm.No)
    (pTaken@30@01 ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01)))
  $Perm.No)))
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
      (Set_in (inv@28@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (img@29@01 r)
      (= r ($FVF.lookup_g (as sm@8@01  $FVF<g>) (inv@28@01 r))))
    (= (- $Perm.Write (pTaken@30@01 r)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)
        ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
      $Perm.Write
      $Perm.No)
    (pTaken@31@01 ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01)))
  $Perm.No)))
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
      (Set_in (inv@28@01 r) (Set_unionone (Set_singleton x1@2@01) x2@3@01))
      (img@29@01 r)
      (= r ($FVF.lookup_g (as sm@8@01  $FVF<g>) (inv@28@01 r))))
    (= (- (- $Perm.Write (pTaken@30@01 r)) (pTaken@31@01 r)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@32@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@8@01  $FVF<g>) x2@3@01))
    (=
      ($FVF.lookup_f (as sm@32@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@32@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@5@01  $FVF<g>) x1@2@01))
    (=
      ($FVF.lookup_f (as sm@32@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@6@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@32@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@6@01  $FVF<f>) r))
  :qid |qp.fvfValDef10|)))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x1@33@01 $Ref)
(declare-const x2@34@01 $Ref)
(declare-const x1@35@01 $Ref)
(declare-const x2@36@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(declare-const sm@38@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@37@01))))
(assert (not (= x1@35@01 $Ref.null)))
(assert (=
  ($Snap.second $t@37@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@37@01))
    ($Snap.second ($Snap.second $t@37@01)))))
(declare-const sm@39@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@39@01  $FVF<f>) ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@37@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
    ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
  (not (= ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@37@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@37@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@37@01))))))
(declare-const sm@40@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@40@01  $FVF<g>) x2@36@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@37@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x2@36@01 x1@35@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x2@36@01 $Ref.null)))
(declare-const sm@41@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@35@01)
    (=
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@36@01)
    (=
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@40@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@40@01  $FVF<g>) r))
  :qid |qp.fvfValDef12|)))
(declare-const pm@42@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@42@01  $FPM) r)
    (+
      (ite (= r x1@35@01) $Perm.Write $Perm.No)
      (ite (= r x2@36@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@42@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@42@01  $FPM) x2@36@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@43@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@43@01  $FVF<f>) ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second $t@37@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
  ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
    ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
  (not (= ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(declare-const x@45@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@45@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
(pop) ; 3
(declare-fun inv@46@01 ($Ref) $Ref)
(declare-fun img@47@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@45@01 $Ref) (x2@45@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@45@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (Set_in x2@45@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (= x1@45@01 x2@45@01))
    (= x1@45@01 x2@45@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (Set_in x@45@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
    (and (= (inv@46@01 x@45@01) x@45@01) (img@47@01 x@45@01)))
  :pattern ((Set_in x@45@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
  :pattern ((inv@46@01 x@45@01))
  :pattern ((img@47@01 x@45@01))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@01 r)
      (Set_in (inv@46@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
    (= (inv@46@01 r) r))
  :pattern ((inv@46@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (Set_in x@45@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
    (not (= x@45@01 $Ref.null)))
  :pattern ((Set_in x@45@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
  :pattern ((inv@46@01 x@45@01))
  :pattern ((img@47@01 x@45@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(assert (= ($Snap.first ($Snap.second $t@44@01)) $Snap.unit))
; [eval] x1.g != x2.g
(push) ; 3
(assert (not (and
  (img@47@01 x1@35@01)
  (Set_in (inv@46@01 x1@35@01) (Set_unionone (Set_singleton x1@35@01) x2@36@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@47@01 x2@36@01)
  (Set_in (inv@46@01 x2@36@01) (Set_unionone (Set_singleton x1@35@01) x2@36@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) x1@35@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) x2@36@01))))
(declare-const x@48@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@48@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
(push) ; 4
(assert (not (and
  (img@47@01 x@48@01)
  (Set_in (inv@46@01 x@48@01) (Set_unionone (Set_singleton x1@35@01) x2@36@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@49@01 ($Ref) $Ref)
(declare-fun img@50@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@48@01 $Ref) (x2@48@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@48@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (Set_in x2@48@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) x1@48@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) x2@48@01)))
    (= x1@48@01 x2@48@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@48@01 $Ref)) (!
  (=>
    (Set_in x@48@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
    (and
      (=
        (inv@49@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) x@48@01))
        x@48@01)
      (img@50@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) x@48@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) x@48@01))
  :qid |quant-u-20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (Set_in (inv@49@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) (inv@49@01 r))
      r))
  :pattern ((inv@49@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@48@01 $Ref)) (!
  (=>
    (Set_in x@48@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) x@48@01)
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@44@01)) x@48@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@51@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@51@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
(pop) ; 3
(declare-fun inv@52@01 ($Ref) $Ref)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@51@01 $Ref) (x2@51@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@51@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (Set_in x2@51@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (= x1@51@01 x2@51@01))
    (= x1@51@01 x2@51@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@51@01 $Ref)) (!
  (=>
    (Set_in x@51@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
    (and (= (inv@52@01 x@51@01) x@51@01) (img@53@01 x@51@01)))
  :pattern ((Set_in x@51@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
  :pattern ((inv@52@01 x@51@01))
  :pattern ((img@53@01 x@51@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (Set_in (inv@52@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
    (= (inv@52@01 r) r))
  :pattern ((inv@52@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@52@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (img@53@01 r)
      (= r (inv@52@01 r)))
    ($Perm.min
      (ite (= r x1@35@01) $Perm.Write $Perm.No)
      (/ (to_real 2) (to_real 3)))
    $Perm.No))
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@52@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (img@53@01 r)
      (= r (inv@52@01 r)))
    ($Perm.min
      (ite (= r x2@36@01) $Perm.Write $Perm.No)
      (- (/ (to_real 2) (to_real 3)) (pTaken@54@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@54@01 x1@35@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@54@01 r) $Perm.No)
  
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
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@52@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (img@53@01 r)
      (= r (inv@52@01 r)))
    (= (- (/ (to_real 2) (to_real 3)) (pTaken@54@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@55@01 x2@36@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@55@01 r) $Perm.No)
  
  :qid |quant-u-27|))))
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
      (Set_in (inv@52@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (img@53@01 r)
      (= r (inv@52@01 r)))
    (=
      (- (- (/ (to_real 2) (to_real 3)) (pTaken@54@01 r)) (pTaken@55@01 r))
      $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] x1.g != x2.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@35@01)
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@36@01)
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@40@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@40@01  $FVF<g>) r))
    :qid |qp.fvfValDef12|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No (+ $Perm.Write (ite (= x1@35@01 x2@36@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@35@01)
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@36@01)
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@40@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@40@01  $FVF<g>) r))
    :qid |qp.fvfValDef12|))))
(push) ; 3
(assert (not (< $Perm.No (+ (ite (= x2@36@01 x1@35@01) $Perm.Write $Perm.No) $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@41@01  $FVF<g>) x1@35@01)
    ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
  ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x1@35@01 x2@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
    ($FVF.lookup_g (as sm@40@01  $FVF<g>) x2@36@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@40@01  $FVF<g>) x2@36@01)
    ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
    (=
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
    (=
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)))
  (not
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and (not (= x1@35@01 x2@36@01)) (not (= x2@36@01 x1@35@01)))
  (and
    (not
      (=
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)))
    (not
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))))))
(declare-const sm@56@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :qid |qp.fvfValDef15|)))
(declare-const pm@57@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@57@01  $FPM) r)
    (+
      (ite
        (= r ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (ite
        (= r ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(assert (<=
  ($FVF.perm_f (as pm@57@01  $FPM) ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
  $Perm.Write))
(assert (<=
  ($FVF.perm_f (as pm@57@01  $FPM) ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
  $Perm.Write))
; Definitional axioms for snapshot map values
(assert (<= ($FVF.perm_g (as pm@42@01  $FPM) x1@35@01) $Perm.Write))
(assert (<= ($FVF.perm_g (as pm@42@01  $FPM) x2@36@01) $Perm.Write))
; [eval] x1.g != x2.g
(declare-const sm@58@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@36@01)
    (=
      ($FVF.lookup_g (as sm@58@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@40@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@58@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@40@01  $FVF<g>) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@35@01)
    (=
      ($FVF.lookup_g (as sm@58@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@58@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
  :qid |qp.fvfValDef18|)))
(declare-const pm@59@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@59@01  $FPM) r)
    (+
      (ite (= r x2@36@01) $Perm.Write $Perm.No)
      (ite (= r x1@35@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@59@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@59@01  $FPM) x1@35@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x2@36@01)
      (=
        ($FVF.lookup_g (as sm@58@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@40@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@58@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@40@01  $FVF<g>) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (= r x1@35@01)
      (=
        ($FVF.lookup_g (as sm@58@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@58@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
    :qid |qp.fvfValDef18|))))
(push) ; 3
(assert (not (< $Perm.No (+ $Perm.Write (ite (= x2@36@01 x1@35@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@58@01  $FVF<g>) x1@35@01)
    ($FVF.lookup_g (as sm@58@01  $FVF<g>) x2@36@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g (as sm@58@01  $FVF<g>) x1@35@01)
    ($FVF.lookup_g (as sm@58@01  $FVF<g>) x2@36@01))))
(declare-const x@60@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@60@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@35@01)
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@36@01)
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@40@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@40@01  $FVF<g>) r))
    :qid |qp.fvfValDef12|))))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite (= x@60@01 x1@35@01) $Perm.Write $Perm.No)
    (ite (= x@60@01 x2@36@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@61@01 ($Ref) $Ref)
(declare-fun img@62@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@35@01)
    (=
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@36@01)
    (=
      ($FVF.lookup_g (as sm@41@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@40@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@40@01  $FVF<g>) r))
  :qid |qp.fvfValDef12|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@60@01 $Ref) (x2@60@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@60@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (Set_in x2@60@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x1@60@01)
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@60@01)))
    (= x1@60@01 x2@60@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@60@01 $Ref)) (!
  (=>
    (Set_in x@60@01 (Set_unionone (Set_singleton x1@35@01) x2@36@01))
    (and
      (= (inv@61@01 ($FVF.lookup_g (as sm@41@01  $FVF<g>) x@60@01)) x@60@01)
      (img@62@01 ($FVF.lookup_g (as sm@41@01  $FVF<g>) x@60@01))))
  :pattern (($FVF.lookup_g (as sm@41@01  $FVF<g>) x@60@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@01 r)
      (Set_in (inv@61@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01)))
    (= ($FVF.lookup_g (as sm@41@01  $FVF<g>) (inv@61@01 r)) r))
  :pattern ((inv@61@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@61@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (img@62@01 r)
      (= r ($FVF.lookup_g (as sm@41@01  $FVF<g>) (inv@61@01 r))))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (/ (to_real 2) (to_real 3)))
    $Perm.No))
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@61@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (img@62@01 r)
      (= r ($FVF.lookup_g (as sm@41@01  $FVF<g>) (inv@61@01 r))))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (- (/ (to_real 2) (to_real 3)) (pTaken@63@01 r)))
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
(assert (not (=
  (-
    (ite
      (=
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)
        ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)
    (pTaken@63@01 ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01)))
  $Perm.No)))
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
      (Set_in (inv@61@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (img@62@01 r)
      (= r ($FVF.lookup_g (as sm@41@01  $FVF<g>) (inv@61@01 r))))
    (= (- (/ (to_real 2) (to_real 3)) (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)
        ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)
    (pTaken@64@01 ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01)))
  $Perm.No)))
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
      (Set_in (inv@61@01 r) (Set_unionone (Set_singleton x1@35@01) x2@36@01))
      (img@62@01 r)
      (= r ($FVF.lookup_g (as sm@41@01  $FVF<g>) (inv@61@01 r))))
    (=
      (- (- (/ (to_real 2) (to_real 3)) (pTaken@63@01 r)) (pTaken@64@01 r))
      $Perm.No))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@65@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@41@01  $FVF<g>) x2@36@01))
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@38@01  $FVF<g>) x1@35@01))
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const xs@66@01 Seq<$Ref>)
(declare-const xs@67@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 ($Snap.combine ($Snap.first $t@68@01) ($Snap.second $t@68@01))))
(assert (= ($Snap.first $t@68@01) $Snap.unit))
; [eval] |xs| > 1
; [eval] |xs|
(assert (> (Seq_length xs@67@01) 1))
(assert (=
  ($Snap.second $t@68@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@68@01))
    ($Snap.second ($Snap.second $t@68@01)))))
(assert (= ($Snap.first ($Snap.second $t@68@01)) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..|xs|)), (i2 in [0..|xs|)) } { (i1 in [0..|xs|)), xs[i2] } { (i2 in [0..|xs|)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..|xs|)) && ((i2 in [0..|xs|)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@69@01 Int)
(declare-const i2@70@01 Int)
(push) ; 2
; [eval] (i1 in [0..|xs|)) && ((i2 in [0..|xs|)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..|xs|)) && ((i2 in [0..|xs|)) && i1 != i2)
; [eval] (i1 in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 3
; [then-branch: 0 | !(i1@69@01 in [0..|xs@67@01|]) | live]
; [else-branch: 0 | i1@69@01 in [0..|xs@67@01|] | live]
(push) ; 4
; [then-branch: 0 | !(i1@69@01 in [0..|xs@67@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | i1@69@01 in [0..|xs@67@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01))
; [eval] (i2 in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 5
; [then-branch: 1 | !(i2@70@01 in [0..|xs@67@01|]) | live]
; [else-branch: 1 | i2@70@01 in [0..|xs@67@01|] | live]
(push) ; 6
; [then-branch: 1 | !(i2@70@01 in [0..|xs@67@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i2@70@01 in [0..|xs@67@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01))))
(push) ; 3
; [then-branch: 2 | i1@69@01 in [0..|xs@67@01|] && i2@70@01 in [0..|xs@67@01|] && i1@69@01 != i2@70@01 | live]
; [else-branch: 2 | !(i1@69@01 in [0..|xs@67@01|] && i2@70@01 in [0..|xs@67@01|] && i1@69@01 != i2@70@01) | live]
(push) ; 4
; [then-branch: 2 | i1@69@01 in [0..|xs@67@01|] && i2@70@01 in [0..|xs@67@01|] && i1@69@01 != i2@70@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
    (not (= i1@69@01 i2@70@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@69@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@69@01 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@70@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@70@01 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(i1@69@01 in [0..|xs@67@01|] && i2@70@01 in [0..|xs@67@01|] && i1@69@01 != i2@70@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
      (not (= i1@69@01 i2@70@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
      (not (= i1@69@01 i2@70@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
    (not (= i1@69@01 i2@70@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
        (not (= i1@69@01 i2@70@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
      (not (= i1@69@01 i2@70@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@69@01 Int) (i2@70@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
        (not (= i1@69@01 i2@70@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
            (not (= i1@69@01 i2@70@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@67@01))
    i2@70@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@67@01))
    i2@70@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@32@12@32@106-aux|)))
(assert (forall ((i1@69@01 Int) (i2@70@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
        (not (= i1@69@01 i2@70@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
            (not (= i1@69@01 i2@70@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@67@01))
    i2@70@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@32@12@32@106-aux|)))
(assert (forall ((i1@69@01 Int) (i2@70@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
        (not (= i1@69@01 i2@70@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
            (not (= i1@69@01 i2@70@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_index
    xs@67@01
    i2@70@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_index
    xs@67@01
    i2@70@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@32@12@32@106-aux|)))
(assert (forall ((i1@69@01 Int) (i2@70@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
        (not (= i1@69@01 i2@70@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
            (not (= i1@69@01 i2@70@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_index
    xs@67@01
    i2@70@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@32@12@32@106-aux|)))
(assert (forall ((i1@69@01 Int) (i2@70@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
        (not (= i1@69@01 i2@70@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
            (not (= i1@69@01 i2@70@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01) (Seq_index
    xs@67@01
    i1@69@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i2@70@01) (Seq_index
    xs@67@01
    i1@69@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@32@12@32@106-aux|)))
(assert (forall ((i1@69@01 Int) (i2@70@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
        (not (= i1@69@01 i2@70@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
            (not (= i1@69@01 i2@70@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i2@70@01) (Seq_index
    xs@67@01
    i1@69@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@32@12@32@106-aux|)))
(assert (forall ((i1@69@01 Int) (i2@70@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
        (not (= i1@69@01 i2@70@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
            (not (= i1@69@01 i2@70@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
          (not (= i1@69@01 i2@70@01))))))
  :pattern ((Seq_index xs@67@01 i1@69@01) (Seq_index xs@67@01 i2@70@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@32@12@32@106-aux|)))
(assert (forall ((i1@69@01 Int) (i2@70@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01)
        (not (= i1@69@01 i2@70@01))))
    (not (= (Seq_index xs@67@01 i1@69@01) (Seq_index xs@67@01 i2@70@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@67@01))
    i2@70@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@67@01))
    i2@70@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_index
    xs@67@01
    i2@70@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@69@01) (Seq_index
    xs@67@01
    i2@70@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@70@01) (Seq_index
    xs@67@01
    i1@69@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i2@70@01) (Seq_index
    xs@67@01
    i1@69@01))
  :pattern ((Seq_index xs@67@01 i1@69@01) (Seq_index xs@67@01 i2@70@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@32@12@32@106|)))
(assert (=
  ($Snap.second ($Snap.second $t@68@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@68@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))
(declare-const i@71@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 3 | !(0 <= i@71@01) | live]
; [else-branch: 3 | 0 <= i@71@01 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= i@71@01)]
(assert (not (<= 0 i@71@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= i@71@01]
(assert (<= 0 i@71@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@71@01) (not (<= 0 i@71@01))))
(assert (and (<= 0 i@71@01) (< i@71@01 (Seq_length xs@67@01))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@71@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@72@01 ($Ref) Int)
(declare-fun img@73@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@71@01 Int)) (!
  (=>
    (and (<= 0 i@71@01) (< i@71@01 (Seq_length xs@67@01)))
    (or (<= 0 i@71@01) (not (<= 0 i@71@01))))
  :pattern ((Seq_index xs@67@01 i@71@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@71@01 Int) (i2@71@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@71@01) (< i1@71@01 (Seq_length xs@67@01)))
      (and (<= 0 i2@71@01) (< i2@71@01 (Seq_length xs@67@01)))
      (= (Seq_index xs@67@01 i1@71@01) (Seq_index xs@67@01 i2@71@01)))
    (= i1@71@01 i2@71@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@71@01 Int)) (!
  (=>
    (and (<= 0 i@71@01) (< i@71@01 (Seq_length xs@67@01)))
    (and
      (= (inv@72@01 (Seq_index xs@67@01 i@71@01)) i@71@01)
      (img@73@01 (Seq_index xs@67@01 i@71@01))))
  :pattern ((Seq_index xs@67@01 i@71@01))
  :qid |quant-u-36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@01 r)
      (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) (Seq_length xs@67@01))))
    (= (Seq_index xs@67@01 (inv@72@01 r)) r))
  :pattern ((inv@72@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@71@01 Int)) (!
  (=>
    (and (<= 0 i@71@01) (< i@71@01 (Seq_length xs@67@01)))
    (not (= (Seq_index xs@67@01 i@71@01) $Ref.null)))
  :pattern ((Seq_index xs@67@01 i@71@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@68@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))
  $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..|xs|)), (i2 in [0..|xs|)) } { (i1 in [0..|xs|)), xs[i2] } { (i2 in [0..|xs|)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..|xs|)) && ((i2 in [0..|xs|)) && i1 != i2) ==> xs[i1].g != xs[i2].g)
(declare-const i1@74@01 Int)
(declare-const i2@75@01 Int)
(push) ; 2
; [eval] (i1 in [0..|xs|)) && ((i2 in [0..|xs|)) && i1 != i2) ==> xs[i1].g != xs[i2].g
; [eval] (i1 in [0..|xs|)) && ((i2 in [0..|xs|)) && i1 != i2)
; [eval] (i1 in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 3
; [then-branch: 4 | !(i1@74@01 in [0..|xs@67@01|]) | live]
; [else-branch: 4 | i1@74@01 in [0..|xs@67@01|] | live]
(push) ; 4
; [then-branch: 4 | !(i1@74@01 in [0..|xs@67@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | i1@74@01 in [0..|xs@67@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01))
; [eval] (i2 in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 5
; [then-branch: 5 | !(i2@75@01 in [0..|xs@67@01|]) | live]
; [else-branch: 5 | i2@75@01 in [0..|xs@67@01|] | live]
(push) ; 6
; [then-branch: 5 | !(i2@75@01 in [0..|xs@67@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | i2@75@01 in [0..|xs@67@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01))))
(push) ; 3
; [then-branch: 6 | i1@74@01 in [0..|xs@67@01|] && i2@75@01 in [0..|xs@67@01|] && i1@74@01 != i2@75@01 | live]
; [else-branch: 6 | !(i1@74@01 in [0..|xs@67@01|] && i2@75@01 in [0..|xs@67@01|] && i1@74@01 != i2@75@01) | live]
(push) ; 4
; [then-branch: 6 | i1@74@01 in [0..|xs@67@01|] && i2@75@01 in [0..|xs@67@01|] && i1@74@01 != i2@75@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
    (not (= i1@74@01 i2@75@01)))))
; [eval] xs[i1].g != xs[i2].g
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@74@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@74@01 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@73@01 (Seq_index xs@67@01 i1@74@01))
  (and
    (<= 0 (inv@72@01 (Seq_index xs@67@01 i1@74@01)))
    (< (inv@72@01 (Seq_index xs@67@01 i1@74@01)) (Seq_length xs@67@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@75@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@75@01 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@73@01 (Seq_index xs@67@01 i2@75@01))
  (and
    (<= 0 (inv@72@01 (Seq_index xs@67@01 i2@75@01)))
    (< (inv@72@01 (Seq_index xs@67@01 i2@75@01)) (Seq_length xs@67@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(i1@74@01 in [0..|xs@67@01|] && i2@75@01 in [0..|xs@67@01|] && i1@74@01 != i2@75@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
      (not (= i1@74@01 i2@75@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
      (not (= i1@74@01 i2@75@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
    (not (= i1@74@01 i2@75@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
        (not (= i1@74@01 i2@75@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
      (not (= i1@74@01 i2@75@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@74@01 Int) (i2@75@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
        (not (= i1@74@01 i2@75@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
            (not (= i1@74@01 i2@75@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@67@01))
    i2@75@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@67@01))
    i2@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@34@12@34@110-aux|)))
(assert (forall ((i1@74@01 Int) (i2@75@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
        (not (= i1@74@01 i2@75@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
            (not (= i1@74@01 i2@75@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@67@01))
    i2@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@34@12@34@110-aux|)))
(assert (forall ((i1@74@01 Int) (i2@75@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
        (not (= i1@74@01 i2@75@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
            (not (= i1@74@01 i2@75@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_index
    xs@67@01
    i2@75@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_index
    xs@67@01
    i2@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@34@12@34@110-aux|)))
(assert (forall ((i1@74@01 Int) (i2@75@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
        (not (= i1@74@01 i2@75@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
            (not (= i1@74@01 i2@75@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_index
    xs@67@01
    i2@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@34@12@34@110-aux|)))
(assert (forall ((i1@74@01 Int) (i2@75@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
        (not (= i1@74@01 i2@75@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
            (not (= i1@74@01 i2@75@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01) (Seq_index
    xs@67@01
    i1@74@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i2@75@01) (Seq_index
    xs@67@01
    i1@74@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@34@12@34@110-aux|)))
(assert (forall ((i1@74@01 Int) (i2@75@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
        (not (= i1@74@01 i2@75@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
            (not (= i1@74@01 i2@75@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i2@75@01) (Seq_index
    xs@67@01
    i1@74@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@34@12@34@110-aux|)))
(assert (forall ((i1@74@01 Int) (i2@75@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
        (not (= i1@74@01 i2@75@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
            (not (= i1@74@01 i2@75@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
          (not (= i1@74@01 i2@75@01))))))
  :pattern ((Seq_index xs@67@01 i1@74@01) (Seq_index xs@67@01 i2@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@34@12@34@110-aux|)))
(assert (forall ((i1@74@01 Int) (i2@75@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01)
        (not (= i1@74@01 i2@75@01))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
          xs@67@01
          i1@74@01))
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
          xs@67@01
          i2@75@01)))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@67@01))
    i2@75@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@67@01))
    i2@75@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_index
    xs@67@01
    i2@75@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i1@74@01) (Seq_index
    xs@67@01
    i2@75@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@67@01)) i2@75@01) (Seq_index
    xs@67@01
    i1@74@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@67@01)) i2@75@01) (Seq_index
    xs@67@01
    i1@74@01))
  :pattern ((Seq_index xs@67@01 i1@74@01) (Seq_index xs@67@01 i2@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@34@12@34@110|)))
(declare-const i@76@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 7 | !(0 <= i@76@01) | live]
; [else-branch: 7 | 0 <= i@76@01 | live]
(push) ; 4
; [then-branch: 7 | !(0 <= i@76@01)]
(assert (not (<= 0 i@76@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | 0 <= i@76@01]
(assert (<= 0 i@76@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@76@01) (not (<= 0 i@76@01))))
(assert (and (<= 0 i@76@01) (< i@76@01 (Seq_length xs@67@01))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@76@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@73@01 (Seq_index xs@67@01 i@76@01))
  (and
    (<= 0 (inv@72@01 (Seq_index xs@67@01 i@76@01)))
    (< (inv@72@01 (Seq_index xs@67@01 i@76@01)) (Seq_length xs@67@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@77@01 ($Ref) Int)
(declare-fun img@78@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@76@01 Int)) (!
  (=>
    (and (<= 0 i@76@01) (< i@76@01 (Seq_length xs@67@01)))
    (or (<= 0 i@76@01) (not (<= 0 i@76@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
    xs@67@01
    i@76@01)))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@76@01 Int) (i2@76@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@76@01) (< i1@76@01 (Seq_length xs@67@01)))
      (and (<= 0 i2@76@01) (< i2@76@01 (Seq_length xs@67@01)))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
          xs@67@01
          i1@76@01))
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
          xs@67@01
          i2@76@01))))
    (= i1@76@01 i2@76@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@76@01 Int)) (!
  (=>
    (and (<= 0 i@76@01) (< i@76@01 (Seq_length xs@67@01)))
    (and
      (=
        (inv@77@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
          xs@67@01
          i@76@01)))
        i@76@01)
      (img@78@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
        xs@67@01
        i@76@01)))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
    xs@67@01
    i@76@01)))
  :qid |quant-u-38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@78@01 r)
      (and (<= 0 (inv@77@01 r)) (< (inv@77@01 r) (Seq_length xs@67@01))))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
        xs@67@01
        (inv@77@01 r)))
      r))
  :pattern ((inv@77@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@76@01 Int)) (!
  (=>
    (and (<= 0 i@76@01) (< i@76@01 (Seq_length xs@67@01)))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
          xs@67@01
          i@76@01))
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second ($Snap.second $t@68@01)))) (Seq_index
    xs@67@01
    i@76@01)))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 $Snap.unit))
; [eval] xs[0] != xs[1]
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index xs@67@01 0) (Seq_index xs@67@01 1))))
(pop) ; 2
(push) ; 2
; [exec]
; assert xs[0] != xs[1]
; [eval] xs[0] != xs[1]
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not (= (Seq_index xs@67@01 0) (Seq_index xs@67@01 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index xs@67@01 0) (Seq_index xs@67@01 1))))
; [eval] xs[0] != xs[1]
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const xs@80@01 Seq<$Ref>)
(declare-const ys@81@01 Seq<$Ref>)
(declare-const xs@82@01 Seq<$Ref>)
(declare-const ys@83@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@84@01 $Snap)
(assert (= $t@84@01 ($Snap.combine ($Snap.first $t@84@01) ($Snap.second $t@84@01))))
(assert (= ($Snap.first $t@84@01) $Snap.unit))
; [eval] |xs| > 0
; [eval] |xs|
(assert (> (Seq_length xs@82@01) 0))
(assert (=
  ($Snap.second $t@84@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@84@01))
    ($Snap.second ($Snap.second $t@84@01)))))
(assert (= ($Snap.first ($Snap.second $t@84@01)) $Snap.unit))
; [eval] |ys| > 0
; [eval] |ys|
(assert (> (Seq_length ys@83@01) 0))
(assert (=
  ($Snap.second ($Snap.second $t@84@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@84@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@84@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@84@01))) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..|xs|)), (i2 in [0..|xs|)) } { (i1 in [0..|xs|)), xs[i2] } { (i2 in [0..|xs|)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..|xs|)) && ((i2 in [0..|xs|)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@85@01 Int)
(declare-const i2@86@01 Int)
(push) ; 2
; [eval] (i1 in [0..|xs|)) && ((i2 in [0..|xs|)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..|xs|)) && ((i2 in [0..|xs|)) && i1 != i2)
; [eval] (i1 in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 3
; [then-branch: 8 | !(i1@85@01 in [0..|xs@82@01|]) | live]
; [else-branch: 8 | i1@85@01 in [0..|xs@82@01|] | live]
(push) ; 4
; [then-branch: 8 | !(i1@85@01 in [0..|xs@82@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | i1@85@01 in [0..|xs@82@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01))
; [eval] (i2 in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 5
; [then-branch: 9 | !(i2@86@01 in [0..|xs@82@01|]) | live]
; [else-branch: 9 | i2@86@01 in [0..|xs@82@01|] | live]
(push) ; 6
; [then-branch: 9 | !(i2@86@01 in [0..|xs@82@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | i2@86@01 in [0..|xs@82@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01))))
(push) ; 3
; [then-branch: 10 | i1@85@01 in [0..|xs@82@01|] && i2@86@01 in [0..|xs@82@01|] && i1@85@01 != i2@86@01 | live]
; [else-branch: 10 | !(i1@85@01 in [0..|xs@82@01|] && i2@86@01 in [0..|xs@82@01|] && i1@85@01 != i2@86@01) | live]
(push) ; 4
; [then-branch: 10 | i1@85@01 in [0..|xs@82@01|] && i2@86@01 in [0..|xs@82@01|] && i1@85@01 != i2@86@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
    (not (= i1@85@01 i2@86@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@85@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@85@01 (Seq_length xs@82@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@86@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@86@01 (Seq_length xs@82@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(i1@85@01 in [0..|xs@82@01|] && i2@86@01 in [0..|xs@82@01|] && i1@85@01 != i2@86@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
      (not (= i1@85@01 i2@86@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
      (not (= i1@85@01 i2@86@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
    (not (= i1@85@01 i2@86@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
        (not (= i1@85@01 i2@86@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
      (not (= i1@85@01 i2@86@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@85@01 Int) (i2@86@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
        (not (= i1@85@01 i2@86@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
            (not (= i1@85@01 i2@86@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@82@01))
    i2@86@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@82@01))
    i2@86@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@44@12@44@106-aux|)))
(assert (forall ((i1@85@01 Int) (i2@86@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
        (not (= i1@85@01 i2@86@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
            (not (= i1@85@01 i2@86@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@82@01))
    i2@86@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@44@12@44@106-aux|)))
(assert (forall ((i1@85@01 Int) (i2@86@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
        (not (= i1@85@01 i2@86@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
            (not (= i1@85@01 i2@86@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_index
    xs@82@01
    i2@86@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_index
    xs@82@01
    i2@86@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@44@12@44@106-aux|)))
(assert (forall ((i1@85@01 Int) (i2@86@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
        (not (= i1@85@01 i2@86@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
            (not (= i1@85@01 i2@86@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_index
    xs@82@01
    i2@86@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@44@12@44@106-aux|)))
(assert (forall ((i1@85@01 Int) (i2@86@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
        (not (= i1@85@01 i2@86@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
            (not (= i1@85@01 i2@86@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01) (Seq_index
    xs@82@01
    i1@85@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@82@01)) i2@86@01) (Seq_index
    xs@82@01
    i1@85@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@44@12@44@106-aux|)))
(assert (forall ((i1@85@01 Int) (i2@86@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
        (not (= i1@85@01 i2@86@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
            (not (= i1@85@01 i2@86@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@82@01)) i2@86@01) (Seq_index
    xs@82@01
    i1@85@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@44@12@44@106-aux|)))
(assert (forall ((i1@85@01 Int) (i2@86@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
        (not (= i1@85@01 i2@86@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
            (not (= i1@85@01 i2@86@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
          (not (= i1@85@01 i2@86@01))))))
  :pattern ((Seq_index xs@82@01 i1@85@01) (Seq_index xs@82@01 i2@86@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@44@12@44@106-aux|)))
(assert (forall ((i1@85@01 Int) (i2@86@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01)
        (not (= i1@85@01 i2@86@01))))
    (not (= (Seq_index xs@82@01 i1@85@01) (Seq_index xs@82@01 i2@86@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@82@01))
    i2@86@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@82@01))
    i2@86@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_index
    xs@82@01
    i2@86@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@82@01)) i1@85@01) (Seq_index
    xs@82@01
    i2@86@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@82@01)) i2@86@01) (Seq_index
    xs@82@01
    i1@85@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@82@01)) i2@86@01) (Seq_index
    xs@82@01
    i1@85@01))
  :pattern ((Seq_index xs@82@01 i1@85@01) (Seq_index xs@82@01 i2@86@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@44@12@44@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@84@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@84@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@84@01)))))))
(declare-const i@87@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 11 | !(0 <= i@87@01) | live]
; [else-branch: 11 | 0 <= i@87@01 | live]
(push) ; 4
; [then-branch: 11 | !(0 <= i@87@01)]
(assert (not (<= 0 i@87@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | 0 <= i@87@01]
(assert (<= 0 i@87@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@87@01) (not (<= 0 i@87@01))))
(assert (and (<= 0 i@87@01) (< i@87@01 (Seq_length xs@82@01))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@87@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@88@01 ($Ref) Int)
(declare-fun img@89@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and (<= 0 i@87@01) (< i@87@01 (Seq_length xs@82@01)))
    (or (<= 0 i@87@01) (not (<= 0 i@87@01))))
  :pattern ((Seq_index xs@82@01 i@87@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@87@01 Int) (i2@87@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@87@01) (< i1@87@01 (Seq_length xs@82@01)))
      (and (<= 0 i2@87@01) (< i2@87@01 (Seq_length xs@82@01)))
      (= (Seq_index xs@82@01 i1@87@01) (Seq_index xs@82@01 i2@87@01)))
    (= i1@87@01 i2@87@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and (<= 0 i@87@01) (< i@87@01 (Seq_length xs@82@01)))
    (and
      (= (inv@88@01 (Seq_index xs@82@01 i@87@01)) i@87@01)
      (img@89@01 (Seq_index xs@82@01 i@87@01))))
  :pattern ((Seq_index xs@82@01 i@87@01))
  :qid |quant-u-40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@89@01 r)
      (and (<= 0 (inv@88@01 r)) (< (inv@88@01 r) (Seq_length xs@82@01))))
    (= (Seq_index xs@82@01 (inv@88@01 r)) r))
  :pattern ((inv@88@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and (<= 0 i@87@01) (< i@87@01 (Seq_length xs@82@01)))
    (not (= (Seq_index xs@82@01 i@87@01) $Ref.null)))
  :pattern ((Seq_index xs@82@01 i@87@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@84@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@84@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@84@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@84@01)))))
  $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..|ys|)), (i2 in [0..|ys|)) } { (i1 in [0..|ys|)), ys[i2] } { (i2 in [0..|ys|)), ys[i1] } { ys[i1], ys[i2] } (i1 in [0..|ys|)) && ((i2 in [0..|ys|)) && i1 != i2) ==> ys[i1] != ys[i2])
(declare-const i1@90@01 Int)
(declare-const i2@91@01 Int)
(push) ; 2
; [eval] (i1 in [0..|ys|)) && ((i2 in [0..|ys|)) && i1 != i2) ==> ys[i1] != ys[i2]
; [eval] (i1 in [0..|ys|)) && ((i2 in [0..|ys|)) && i1 != i2)
; [eval] (i1 in [0..|ys|))
; [eval] [0..|ys|)
; [eval] |ys|
(push) ; 3
; [then-branch: 12 | !(i1@90@01 in [0..|ys@83@01|]) | live]
; [else-branch: 12 | i1@90@01 in [0..|ys@83@01|] | live]
(push) ; 4
; [then-branch: 12 | !(i1@90@01 in [0..|ys@83@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | i1@90@01 in [0..|ys@83@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01))
; [eval] (i2 in [0..|ys|))
; [eval] [0..|ys|)
; [eval] |ys|
(push) ; 5
; [then-branch: 13 | !(i2@91@01 in [0..|ys@83@01|]) | live]
; [else-branch: 13 | i2@91@01 in [0..|ys@83@01|] | live]
(push) ; 6
; [then-branch: 13 | !(i2@91@01 in [0..|ys@83@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | i2@91@01 in [0..|ys@83@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
  (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
      (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
  (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01))))
(push) ; 3
; [then-branch: 14 | i1@90@01 in [0..|ys@83@01|] && i2@91@01 in [0..|ys@83@01|] && i1@90@01 != i2@91@01 | live]
; [else-branch: 14 | !(i1@90@01 in [0..|ys@83@01|] && i2@91@01 in [0..|ys@83@01|] && i1@90@01 != i2@91@01) | live]
(push) ; 4
; [then-branch: 14 | i1@90@01 in [0..|ys@83@01|] && i2@91@01 in [0..|ys@83@01|] && i1@90@01 != i2@91@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
    (not (= i1@90@01 i2@91@01)))))
; [eval] ys[i1] != ys[i2]
; [eval] ys[i1]
(push) ; 5
(assert (not (>= i1@90@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@90@01 (Seq_length ys@83@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ys[i2]
(push) ; 5
(assert (not (>= i2@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@91@01 (Seq_length ys@83@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(i1@90@01 in [0..|ys@83@01|] && i2@91@01 in [0..|ys@83@01|] && i1@90@01 != i2@91@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
      (not (= i1@90@01 i2@91@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
      (not (= i1@90@01 i2@91@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
    (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
    (not (= i1@90@01 i2@91@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
        (not (= i1@90@01 i2@91@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
      (not (= i1@90@01 i2@91@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@90@01 Int) (i2@91@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
        (not (= i1@90@01 i2@91@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
            (not (= i1@90@01 i2@91@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_contains
    (Seq_range 0 (Seq_length ys@83@01))
    i2@91@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length ys@83@01))
    i2@91@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@46@12@46@106-aux|)))
(assert (forall ((i1@90@01 Int) (i2@91@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
        (not (= i1@90@01 i2@91@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
            (not (= i1@90@01 i2@91@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length ys@83@01))
    i2@91@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@46@12@46@106-aux|)))
(assert (forall ((i1@90@01 Int) (i2@91@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
        (not (= i1@90@01 i2@91@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
            (not (= i1@90@01 i2@91@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_index
    ys@83@01
    i2@91@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_index
    ys@83@01
    i2@91@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@46@12@46@106-aux|)))
(assert (forall ((i1@90@01 Int) (i2@91@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
        (not (= i1@90@01 i2@91@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
            (not (= i1@90@01 i2@91@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_index
    ys@83@01
    i2@91@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@46@12@46@106-aux|)))
(assert (forall ((i1@90@01 Int) (i2@91@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
        (not (= i1@90@01 i2@91@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
            (not (= i1@90@01 i2@91@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01) (Seq_index
    ys@83@01
    i1@90@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length ys@83@01)) i2@91@01) (Seq_index
    ys@83@01
    i1@90@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@46@12@46@106-aux|)))
(assert (forall ((i1@90@01 Int) (i2@91@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
        (not (= i1@90@01 i2@91@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
            (not (= i1@90@01 i2@91@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length ys@83@01)) i2@91@01) (Seq_index
    ys@83@01
    i1@90@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@46@12@46@106-aux|)))
(assert (forall ((i1@90@01 Int) (i2@91@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (not (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
        (not (= i1@90@01 i2@91@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
            (not (= i1@90@01 i2@91@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
          (not (= i1@90@01 i2@91@01))))))
  :pattern ((Seq_index ys@83@01 i1@90@01) (Seq_index ys@83@01 i2@91@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@46@12@46@106-aux|)))
(assert (forall ((i1@90@01 Int) (i2@91@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01)
        (not (= i1@90@01 i2@91@01))))
    (not (= (Seq_index ys@83@01 i1@90@01) (Seq_index ys@83@01 i2@91@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_contains
    (Seq_range 0 (Seq_length ys@83@01))
    i2@91@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length ys@83@01))
    i2@91@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_index
    ys@83@01
    i2@91@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length ys@83@01)) i1@90@01) (Seq_index
    ys@83@01
    i2@91@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length ys@83@01)) i2@91@01) (Seq_index
    ys@83@01
    i1@90@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length ys@83@01)) i2@91@01) (Seq_index
    ys@83@01
    i1@90@01))
  :pattern ((Seq_index ys@83@01 i1@90@01) (Seq_index ys@83@01 i2@91@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0149.vpr@46@12@46@106|)))
(declare-const i@92@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |ys|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 15 | !(0 <= i@92@01) | live]
; [else-branch: 15 | 0 <= i@92@01 | live]
(push) ; 4
; [then-branch: 15 | !(0 <= i@92@01)]
(assert (not (<= 0 i@92@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | 0 <= i@92@01]
(assert (<= 0 i@92@01))
; [eval] i < |ys|
; [eval] |ys|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@92@01) (not (<= 0 i@92@01))))
(assert (and (<= 0 i@92@01) (< i@92@01 (Seq_length ys@83@01))))
; [eval] ys[i]
(push) ; 3
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@93@01 ($Ref) Int)
(declare-fun img@94@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@92@01 Int)) (!
  (=>
    (and (<= 0 i@92@01) (< i@92@01 (Seq_length ys@83@01)))
    (or (<= 0 i@92@01) (not (<= 0 i@92@01))))
  :pattern ((Seq_index ys@83@01 i@92@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@92@01 Int) (i2@92@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@92@01) (< i1@92@01 (Seq_length ys@83@01)))
      (and (<= 0 i2@92@01) (< i2@92@01 (Seq_length ys@83@01)))
      (= (Seq_index ys@83@01 i1@92@01) (Seq_index ys@83@01 i2@92@01)))
    (= i1@92@01 i2@92@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@92@01 Int)) (!
  (=>
    (and (<= 0 i@92@01) (< i@92@01 (Seq_length ys@83@01)))
    (and
      (= (inv@93@01 (Seq_index ys@83@01 i@92@01)) i@92@01)
      (img@94@01 (Seq_index ys@83@01 i@92@01))))
  :pattern ((Seq_index ys@83@01 i@92@01))
  :qid |quant-u-42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@94@01 r)
      (and (<= 0 (inv@93@01 r)) (< (inv@93@01 r) (Seq_length ys@83@01))))
    (= (Seq_index ys@83@01 (inv@93@01 r)) r))
  :pattern ((inv@93@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@92@01 Int)) (!
  (=>
    (and (<= 0 i@92@01) (< i@92@01 (Seq_length ys@83@01)))
    (not (= (Seq_index ys@83@01 i@92@01) $Ref.null)))
  :pattern ((Seq_index ys@83@01 i@92@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@83@01 i@92@01) (Seq_index xs@82@01 i@87@01))
    (=
      (and
        (img@94@01 r)
        (and (<= 0 (inv@93@01 r)) (< (inv@93@01 r) (Seq_length ys@83@01))))
      (and
        (img@89@01 r)
        (and (<= 0 (inv@88@01 r)) (< (inv@88@01 r) (Seq_length xs@82@01))))))
  
  :qid |quant-u-43|))))
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
; assert xs[0] != ys[0]
; [eval] xs[0] != ys[0]
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@82@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] ys[0]
(push) ; 3
(assert (not (< 0 (Seq_length ys@83@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not (= (Seq_index xs@82@01 0) (Seq_index ys@83@01 0)))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@82@01 i@87@01) (Seq_index ys@83@01 i@92@01))
    (=
      (and
        (img@89@01 r)
        (and (<= 0 (inv@88@01 r)) (< (inv@88@01 r) (Seq_length xs@82@01))))
      (and
        (img@94@01 r)
        (and (<= 0 (inv@93@01 r)) (< (inv@93@01 r) (Seq_length ys@83@01))))))
  
  :qid |quant-u-44|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@95@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@89@01 r)
      (and (<= 0 (inv@88@01 r)) (< (inv@88@01 r) (Seq_length xs@82@01))))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@84@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@84@01))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@94@01 r)
      (and (<= 0 (inv@93@01 r)) (< (inv@93@01 r) (Seq_length ys@83@01))))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@84@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@84@01)))))) r))
  :qid |qp.fvfValDef23|)))
(declare-const pm@96@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@96@01  $FPM) r)
    (+
      (ite
        (and
          (img@89@01 r)
          (and (<= 0 (inv@88@01 r)) (< (inv@88@01 r) (Seq_length xs@82@01))))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (ite
        (and
          (img@94@01 r)
          (and (<= 0 (inv@93@01 r)) (< (inv@93@01 r) (Seq_length ys@83@01))))
        (/ (to_real 2) (to_real 3))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@96@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@96@01  $FPM) r) $Perm.Write)
  :pattern ((inv@88@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@96@01  $FPM) r) $Perm.Write)
  :pattern ((inv@93@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] xs[0] != ys[0]
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length xs@82@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] ys[0]
(push) ; 3
(assert (not (< 0 (Seq_length ys@83@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not (= (Seq_index xs@82@01 0) (Seq_index ys@83@01 0)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index xs@82@01 0) (Seq_index ys@83@01 0))))
(pop) ; 2
(pop) ; 1
