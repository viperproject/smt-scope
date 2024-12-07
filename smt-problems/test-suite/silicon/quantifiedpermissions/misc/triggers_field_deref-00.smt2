(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:19:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr
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
(declare-sort Dummy 0)
(declare-sort $FVF<f> 0)
(declare-sort $FVF<g> 0)
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
(declare-fun fun01<Bool> ($Ref) Bool)
(declare-fun fun02<Int> (Int) Int)
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /field_value_functions_declarations.smt2 [g: Int]
(declare-fun $FVF.domain_g ($FVF<g>) Set<$Ref>)
(declare-fun $FVF.lookup_g ($FVF<g> $Ref) Int)
(declare-fun $FVF.after_g ($FVF<g> $FVF<g>) Bool)
(declare-fun $FVF.loc_g (Int $Ref) Bool)
(declare-fun $FVF.perm_g ($FPM $Ref) $Perm)
(declare-const $fvfTOP_g $FVF<g>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun inv ($Snap Int) Bool)
(declare-fun inv%limited ($Snap Int) Bool)
(declare-fun inv%stateless (Int) Bool)
(declare-fun inv%precondition ($Snap Int) Bool)
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
; /field_value_functions_axioms.smt2 [g: Int]
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
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_g f r) true)
    :pattern (($FVF.loc_g f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (v@0@00 Int)) (!
  (= (inv%limited s@$ v@0@00) (inv s@$ v@0@00))
  :pattern ((inv s@$ v@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (v@0@00 Int)) (!
  (inv%stateless v@0@00)
  :pattern ((inv%limited s@$ v@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (v@0@00 Int)) (!
  (=> (inv%precondition s@$ v@0@00) (= (inv s@$ v@0@00) (= v@0@00 0)))
  :pattern ((inv s@$ v@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (v@0@00 Int)) (!
  true
  :pattern ((inv s@$ v@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const x@2@01 $Ref)
(declare-const y@3@01 $Ref)
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
; inhale (forall z: Ref ::z == x || z == y ==> acc(z.f, write))
(declare-const z@4@01 $Ref)
(push) ; 3
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 0 | z@4@01 == x@2@01 | live]
; [else-branch: 0 | z@4@01 != x@2@01 | live]
(push) ; 5
; [then-branch: 0 | z@4@01 == x@2@01]
(assert (= z@4@01 x@2@01))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | z@4@01 != x@2@01]
(assert (not (= z@4@01 x@2@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@4@01 x@2@01)) (= z@4@01 x@2@01)))
(assert (or (= z@4@01 x@2@01) (= z@4@01 y@3@01)))
(pop) ; 3
(declare-const $t@5@01 $FVF<f>)
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@4@01 $Ref)) (!
  (=>
    (or (= z@4@01 x@2@01) (= z@4@01 y@3@01))
    (or (not (= z@4@01 x@2@01)) (= z@4@01 x@2@01)))
  :pattern ((inv@6@01 z@4@01))
  :pattern ((img@7@01 z@4@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@4@01 $Ref) (z2@4@01 $Ref)) (!
  (=>
    (and
      (or (= z1@4@01 x@2@01) (= z1@4@01 y@3@01))
      (or (= z2@4@01 x@2@01) (= z2@4@01 y@3@01))
      (= z1@4@01 z2@4@01))
    (= z1@4@01 z2@4@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@4@01 $Ref)) (!
  (=>
    (or (= z@4@01 x@2@01) (= z@4@01 y@3@01))
    (and (= (inv@6@01 z@4@01) z@4@01) (img@7@01 z@4@01)))
  :pattern ((inv@6@01 z@4@01))
  :pattern ((img@7@01 z@4@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (or (= (inv@6@01 r) x@2@01) (= (inv@6@01 r) y@3@01)))
    (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@4@01 $Ref)) (!
  (=> (or (= z@4@01 x@2@01) (= z@4@01 y@3@01)) (not (= z@4@01 $Ref.null)))
  :pattern ((inv@6@01 z@4@01))
  :pattern ((img@7@01 z@4@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@8@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (or (= (inv@6@01 r) x@2@01) (= (inv@6@01 r) y@3@01)))
    (= ($FVF.lookup_f (as sm@8@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@5@01 r) r)
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (or (= (inv@6@01 r) x@2@01) (= (inv@6@01 r) y@3@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) r) r))
  :pattern ((inv@6@01 r))
  :qid |quant-u-6|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@2@01 $Ref.null)))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@3@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref :: { z.f } z == x || z == y ==> z.f > 0)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] (forall z: Ref :: { z.f } z == x || z == y ==> z.f > 0)
(declare-const z@11@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> z.f > 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 1 | z@11@01 == x@2@01 | live]
; [else-branch: 1 | z@11@01 != x@2@01 | live]
(push) ; 5
; [then-branch: 1 | z@11@01 == x@2@01]
(assert (= z@11@01 x@2@01))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | z@11@01 != x@2@01]
(assert (not (= z@11@01 x@2@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@11@01 x@2@01)) (= z@11@01 x@2@01)))
(push) ; 4
; [then-branch: 2 | z@11@01 == x@2@01 || z@11@01 == y@3@01 | live]
; [else-branch: 2 | !(z@11@01 == x@2@01 || z@11@01 == y@3@01) | live]
(push) ; 5
; [then-branch: 2 | z@11@01 == x@2@01 || z@11@01 == y@3@01]
(assert (or (= z@11@01 x@2@01) (= z@11@01 y@3@01)))
; [eval] z.f > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@7@01 r) (or (= (inv@6@01 r) x@2@01) (= (inv@6@01 r) y@3@01)))
      (= ($FVF.lookup_f (as sm@8@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@5@01 r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@5@01 r) r)
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) z@11@01) z@11@01))
(push) ; 6
(assert (not (and
  (img@7@01 z@11@01)
  (or (= (inv@6@01 z@11@01) x@2@01) (= (inv@6@01 z@11@01) y@3@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(z@11@01 == x@2@01 || z@11@01 == y@3@01)]
(assert (not (or (= z@11@01 x@2@01) (= z@11@01 y@3@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (or (= (inv@6@01 r) x@2@01) (= (inv@6@01 r) y@3@01)))
    (= ($FVF.lookup_f (as sm@8@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@5@01 r) r)
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (=>
  (or (= z@11@01 x@2@01) (= z@11@01 y@3@01))
  (and
    (or (= z@11@01 x@2@01) (= z@11@01 y@3@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) z@11@01) z@11@01))))
; Joined path conditions
(assert (or
  (not (or (= z@11@01 x@2@01) (= z@11@01 y@3@01)))
  (or (= z@11@01 x@2@01) (= z@11@01 y@3@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (or (= (inv@6@01 r) x@2@01) (= (inv@6@01 r) y@3@01)))
    (= ($FVF.lookup_f (as sm@8@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@5@01 r) r)
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef1|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@11@01 $Ref)) (!
  (and
    (or (not (= z@11@01 x@2@01)) (= z@11@01 x@2@01))
    (=>
      (or (= z@11@01 x@2@01) (= z@11@01 y@3@01))
      (and
        (or (= z@11@01 x@2@01) (= z@11@01 y@3@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) z@11@01) z@11@01)))
    (or
      (not (or (= z@11@01 x@2@01) (= z@11@01 y@3@01)))
      (or (= z@11@01 x@2@01) (= z@11@01 y@3@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) z@11@01) z@11@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@15@10@15@61-aux|)))
(assert (forall ((z@11@01 $Ref)) (!
  (=>
    (or (= z@11@01 x@2@01) (= z@11@01 y@3@01))
    (> ($FVF.lookup_f (as sm@8@01  $FVF<f>) z@11@01) 0))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) z@11@01) z@11@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@15@10@15@61|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x.f > 0
; [eval] x.f > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@7@01 r) (or (= (inv@6@01 r) x@2@01) (= (inv@6@01 r) y@3@01)))
      (= ($FVF.lookup_f (as sm@8@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@5@01 r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@5@01 r) r)
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) x@2@01) x@2@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@7@01 x@2@01)
  (or (= (inv@6@01 x@2@01) x@2@01) (= (inv@6@01 x@2@01) y@3@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> ($FVF.lookup_f (as sm@8@01  $FVF<f>) x@2@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($FVF.lookup_f (as sm@8@01  $FVF<f>) x@2@01) 0))
(pop) ; 2
(pop) ; 1
; ---------- test01b ----------
(declare-const x@12@01 $Ref)
(declare-const y@13@01 $Ref)
(declare-const x@14@01 $Ref)
(declare-const y@15@01 $Ref)
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
; inhale (forall z: Ref ::z == x || z == y ==> acc(z.f, write))
(declare-const z@16@01 $Ref)
(push) ; 3
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 3 | z@16@01 == x@14@01 | live]
; [else-branch: 3 | z@16@01 != x@14@01 | live]
(push) ; 5
; [then-branch: 3 | z@16@01 == x@14@01]
(assert (= z@16@01 x@14@01))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | z@16@01 != x@14@01]
(assert (not (= z@16@01 x@14@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@16@01 x@14@01)) (= z@16@01 x@14@01)))
(assert (or (= z@16@01 x@14@01) (= z@16@01 y@15@01)))
(pop) ; 3
(declare-const $t@17@01 $FVF<f>)
(declare-fun inv@18@01 ($Ref) $Ref)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@16@01 $Ref)) (!
  (=>
    (or (= z@16@01 x@14@01) (= z@16@01 y@15@01))
    (or (not (= z@16@01 x@14@01)) (= z@16@01 x@14@01)))
  :pattern ((inv@18@01 z@16@01))
  :pattern ((img@19@01 z@16@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@16@01 $Ref) (z2@16@01 $Ref)) (!
  (=>
    (and
      (or (= z1@16@01 x@14@01) (= z1@16@01 y@15@01))
      (or (= z2@16@01 x@14@01) (= z2@16@01 y@15@01))
      (= z1@16@01 z2@16@01))
    (= z1@16@01 z2@16@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@16@01 $Ref)) (!
  (=>
    (or (= z@16@01 x@14@01) (= z@16@01 y@15@01))
    (and (= (inv@18@01 z@16@01) z@16@01) (img@19@01 z@16@01)))
  :pattern ((inv@18@01 z@16@01))
  :pattern ((img@19@01 z@16@01))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (or (= (inv@18@01 r) x@14@01) (= (inv@18@01 r) y@15@01)))
    (= (inv@18@01 r) r))
  :pattern ((inv@18@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@16@01 $Ref)) (!
  (=> (or (= z@16@01 x@14@01) (= z@16@01 y@15@01)) (not (= z@16@01 $Ref.null)))
  :pattern ((inv@18@01 z@16@01))
  :pattern ((img@19@01 z@16@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (or (= (inv@18@01 r) x@14@01) (= (inv@18@01 r) y@15@01)))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r)
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (or (= (inv@18@01 r) x@14@01) (= (inv@18@01 r) y@15@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
  :pattern ((inv@18@01 r))
  :qid |quant-u-9|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == x || z == y ==> acc(z.g, write))
(declare-const z@21@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 4 | z@21@01 == x@14@01 | live]
; [else-branch: 4 | z@21@01 != x@14@01 | live]
(push) ; 5
; [then-branch: 4 | z@21@01 == x@14@01]
(assert (= z@21@01 x@14@01))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | z@21@01 != x@14@01]
(assert (not (= z@21@01 x@14@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@21@01 x@14@01)) (= z@21@01 x@14@01)))
(assert (or (= z@21@01 x@14@01) (= z@21@01 y@15@01)))
(pop) ; 3
(declare-const $t@22@01 $FVF<g>)
(declare-fun inv@23@01 ($Ref) $Ref)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@21@01 $Ref)) (!
  (=>
    (or (= z@21@01 x@14@01) (= z@21@01 y@15@01))
    (or (not (= z@21@01 x@14@01)) (= z@21@01 x@14@01)))
  :pattern ((inv@23@01 z@21@01))
  :pattern ((img@24@01 z@21@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@21@01 $Ref) (z2@21@01 $Ref)) (!
  (=>
    (and
      (or (= z1@21@01 x@14@01) (= z1@21@01 y@15@01))
      (or (= z2@21@01 x@14@01) (= z2@21@01 y@15@01))
      (= z1@21@01 z2@21@01))
    (= z1@21@01 z2@21@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@21@01 $Ref)) (!
  (=>
    (or (= z@21@01 x@14@01) (= z@21@01 y@15@01))
    (and (= (inv@23@01 z@21@01) z@21@01) (img@24@01 z@21@01)))
  :pattern ((inv@23@01 z@21@01))
  :pattern ((img@24@01 z@21@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@24@01 r) (or (= (inv@23@01 r) x@14@01) (= (inv@23@01 r) y@15@01)))
    (= (inv@23@01 r) r))
  :pattern ((inv@23@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@21@01 $Ref)) (!
  (=> (or (= z@21@01 x@14@01) (= z@21@01 y@15@01)) (not (= z@21@01 $Ref.null)))
  :pattern ((inv@23@01 z@21@01))
  :pattern ((img@24@01 z@21@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.first $t@25@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@14@01 $Ref.null)))
(assert (= ($Snap.second $t@25@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@15@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { z.f }
;     z == x || z == y ==> fun02(z.g) > 0 && fun02(z.f) > 0)
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] (forall z: Ref :: { z.f } z == x || z == y ==> fun02(z.g) > 0 && fun02(z.f) > 0)
(declare-const z@27@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> fun02(z.g) > 0 && fun02(z.f) > 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 5 | z@27@01 == x@14@01 | live]
; [else-branch: 5 | z@27@01 != x@14@01 | live]
(push) ; 5
; [then-branch: 5 | z@27@01 == x@14@01]
(assert (= z@27@01 x@14@01))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | z@27@01 != x@14@01]
(assert (not (= z@27@01 x@14@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@27@01 x@14@01)) (= z@27@01 x@14@01)))
(push) ; 4
; [then-branch: 6 | z@27@01 == x@14@01 || z@27@01 == y@15@01 | live]
; [else-branch: 6 | !(z@27@01 == x@14@01 || z@27@01 == y@15@01) | live]
(push) ; 5
; [then-branch: 6 | z@27@01 == x@14@01 || z@27@01 == y@15@01]
(assert (or (= z@27@01 x@14@01) (= z@27@01 y@15@01)))
; [eval] fun02(z.g) > 0 && fun02(z.f) > 0
; [eval] fun02(z.g) > 0
; [eval] fun02(z.g)
(push) ; 6
(assert (not (and
  (img@24@01 z@27@01)
  (or (= (inv@23@01 z@27@01) x@14@01) (= (inv@23@01 z@27@01) y@15@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 7 | !(fun02[Int](Lookup(g, $t@22@01, z@27@01)) > 0) | live]
; [else-branch: 7 | fun02[Int](Lookup(g, $t@22@01, z@27@01)) > 0 | live]
(push) ; 7
; [then-branch: 7 | !(fun02[Int](Lookup(g, $t@22@01, z@27@01)) > 0)]
(assert (not (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | fun02[Int](Lookup(g, $t@22@01, z@27@01)) > 0]
(assert (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0))
; [eval] fun02(z.f) > 0
; [eval] fun02(z.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@19@01 r)
        (or (= (inv@18@01 r) x@14@01) (= (inv@18@01 r) y@15@01)))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@17@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r)
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) z@27@01) z@27@01))
(push) ; 8
(assert (not (and
  (img@19@01 z@27@01)
  (or (= (inv@18@01 z@27@01) x@14@01) (= (inv@18@01 z@27@01) y@15@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (or (= (inv@18@01 r) x@14@01) (= (inv@18@01 r) y@15@01)))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r)
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (=>
  (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
  (and
    (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) z@27@01) z@27@01))))
(assert (or
  (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
  (not (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0))))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(z@27@01 == x@14@01 || z@27@01 == y@15@01)]
(assert (not (or (= z@27@01 x@14@01) (= z@27@01 y@15@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (or (= (inv@18@01 r) x@14@01) (= (inv@18@01 r) y@15@01)))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r)
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (=>
  (or (= z@27@01 x@14@01) (= z@27@01 y@15@01))
  (and
    (or (= z@27@01 x@14@01) (= z@27@01 y@15@01))
    (=>
      (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
      (and
        (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
        ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) z@27@01) z@27@01)))
    (or
      (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
      (not (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0))))))
; Joined path conditions
(assert (or
  (not (or (= z@27@01 x@14@01) (= z@27@01 y@15@01)))
  (or (= z@27@01 x@14@01) (= z@27@01 y@15@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (or (= (inv@18@01 r) x@14@01) (= (inv@18@01 r) y@15@01)))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r)
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@27@01 $Ref)) (!
  (and
    (or (not (= z@27@01 x@14@01)) (= z@27@01 x@14@01))
    (=>
      (or (= z@27@01 x@14@01) (= z@27@01 y@15@01))
      (and
        (or (= z@27@01 x@14@01) (= z@27@01 y@15@01))
        (=>
          (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
          (and
            (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
            ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) z@27@01) z@27@01)))
        (or
          (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
          (not (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)))))
    (or
      (not (or (= z@27@01 x@14@01) (= z@27@01 y@15@01)))
      (or (= z@27@01 x@14@01) (= z@27@01 y@15@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) z@27@01) z@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@24@10@24@86-aux|)))
(assert (forall ((z@27@01 $Ref)) (!
  (=>
    (or (= z@27@01 x@14@01) (= z@27@01 y@15@01))
    (and
      (> (fun02<Int> ($FVF.lookup_g $t@22@01 z@27@01)) 0)
      (> (fun02<Int> ($FVF.lookup_f (as sm@20@01  $FVF<f>) z@27@01)) 0)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) z@27@01) z@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@24@10@24@86|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert fun02(x.g) > 0
; [eval] fun02(x.g) > 0
; [eval] fun02(x.g)
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@24@01 x@14@01)
  (or (= (inv@23@01 x@14@01) x@14@01) (= (inv@23@01 x@14@01) y@15@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> (fun02<Int> ($FVF.lookup_g $t@22@01 x@14@01)) 0)))
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
(declare-const pm@28@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@28@01  $FPM) r)
    (ite
      (and
        (img@19@01 r)
        (or (= (inv@18@01 r) x@14@01) (= (inv@18@01 r) y@15@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@28@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.perm_f (as pm@28@01  $FPM) r))
  :qid |qp.resTrgDef5|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@28@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@29@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@24@01 r) (or (= (inv@23@01 r) x@14@01) (= (inv@23@01 r) y@15@01)))
    (= ($FVF.lookup_g (as sm@29@01  $FVF<g>) r) ($FVF.lookup_g $t@22@01 r)))
  :pattern (($FVF.lookup_g (as sm@29@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@22@01 r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@30@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@30@01  $FPM) r)
    (ite
      (and
        (img@24@01 r)
        (or (= (inv@23@01 r) x@14@01) (= (inv@23@01 r) y@15@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@30@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Assume upper permission bound for field g
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_g (as pm@30@01  $FPM) r) $Perm.Write)
  :pattern ((inv@23@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun02(x.g) > 0
; [eval] fun02(x.g)
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@24@01 x@14@01)
  (or (= (inv@23@01 x@14@01) x@14@01) (= (inv@23@01 x@14@01) y@15@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> (fun02<Int> ($FVF.lookup_g (as sm@29@01  $FVF<g>) x@14@01)) 0)))
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
(declare-const pm@31@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@31@01  $FPM) r)
    (ite
      (and
        (img@19@01 r)
        (or (= (inv@18@01 r) x@14@01) (= (inv@18@01 r) y@15@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.perm_f (as pm@31@01  $FPM) r))
  :qid |qp.resTrgDef9|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@31@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@32@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@24@01 r) (or (= (inv@23@01 r) x@14@01) (= (inv@23@01 r) y@15@01)))
    (= ($FVF.lookup_g (as sm@32@01  $FVF<g>) r) ($FVF.lookup_g $t@22@01 r)))
  :pattern (($FVF.lookup_g (as sm@32@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@22@01 r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@33@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@33@01  $FPM) r)
    (ite
      (and
        (img@24@01 r)
        (or (= (inv@23@01 r) x@14@01) (= (inv@23@01 r) y@15@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
; Assume upper permission bound for field g
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_g (as pm@33@01  $FPM) r) $Perm.Write)
  :pattern ((inv@23@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun02(x.g) > 0
; [eval] fun02(x.g)
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@24@01 x@14@01)
  (or (= (inv@23@01 x@14@01) x@14@01) (= (inv@23@01 x@14@01) y@15@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> (fun02<Int> ($FVF.lookup_g (as sm@32@01  $FVF<g>) x@14@01)) 0)))
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
; Definitional axioms for snapshot map values
; Assume upper permission bound for field g
; [eval] fun02(x.g) > 0
; [eval] fun02(x.g)
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@24@01 x@14@01)
  (or (= (inv@23@01 x@14@01) x@14@01) (= (inv@23@01 x@14@01) y@15@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> (fun02<Int> ($FVF.lookup_g (as sm@32@01  $FVF<g>) x@14@01)) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@34@01 $Ref)
(declare-const y@35@01 $Ref)
(declare-const x@36@01 $Ref)
(declare-const y@37@01 $Ref)
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
; inhale (forall z: Ref ::z == x || z == y ==> acc(z.f, write))
(declare-const z@38@01 $Ref)
(push) ; 3
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 8 | z@38@01 == x@36@01 | live]
; [else-branch: 8 | z@38@01 != x@36@01 | live]
(push) ; 5
; [then-branch: 8 | z@38@01 == x@36@01]
(assert (= z@38@01 x@36@01))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | z@38@01 != x@36@01]
(assert (not (= z@38@01 x@36@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@38@01 x@36@01)) (= z@38@01 x@36@01)))
(assert (or (= z@38@01 x@36@01) (= z@38@01 y@37@01)))
(pop) ; 3
(declare-const $t@39@01 $FVF<f>)
(declare-fun inv@40@01 ($Ref) $Ref)
(declare-fun img@41@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@38@01 $Ref)) (!
  (=>
    (or (= z@38@01 x@36@01) (= z@38@01 y@37@01))
    (or (not (= z@38@01 x@36@01)) (= z@38@01 x@36@01)))
  :pattern ((inv@40@01 z@38@01))
  :pattern ((img@41@01 z@38@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@38@01 $Ref) (z2@38@01 $Ref)) (!
  (=>
    (and
      (or (= z1@38@01 x@36@01) (= z1@38@01 y@37@01))
      (or (= z2@38@01 x@36@01) (= z2@38@01 y@37@01))
      (= z1@38@01 z2@38@01))
    (= z1@38@01 z2@38@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@38@01 $Ref)) (!
  (=>
    (or (= z@38@01 x@36@01) (= z@38@01 y@37@01))
    (and (= (inv@40@01 z@38@01) z@38@01) (img@41@01 z@38@01)))
  :pattern ((inv@40@01 z@38@01))
  :pattern ((img@41@01 z@38@01))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@41@01 r) (or (= (inv@40@01 r) x@36@01) (= (inv@40@01 r) y@37@01)))
    (= (inv@40@01 r) r))
  :pattern ((inv@40@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@38@01 $Ref)) (!
  (=> (or (= z@38@01 x@36@01) (= z@38@01 y@37@01)) (not (= z@38@01 $Ref.null)))
  :pattern ((inv@40@01 z@38@01))
  :pattern ((img@41@01 z@38@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@42@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@41@01 r) (or (= (inv@40@01 r) x@36@01) (= (inv@40@01 r) y@37@01)))
    (= ($FVF.lookup_f (as sm@42@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@39@01 r) r)
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (or (= (inv@40@01 r) x@36@01) (= (inv@40@01 r) y@37@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@42@01  $FVF<f>) r) r))
  :pattern ((inv@40@01 r))
  :qid |quant-u-14|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == x || z == y ==> acc(z.g, write))
(declare-const z@43@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 9 | z@43@01 == x@36@01 | live]
; [else-branch: 9 | z@43@01 != x@36@01 | live]
(push) ; 5
; [then-branch: 9 | z@43@01 == x@36@01]
(assert (= z@43@01 x@36@01))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | z@43@01 != x@36@01]
(assert (not (= z@43@01 x@36@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@43@01 x@36@01)) (= z@43@01 x@36@01)))
(assert (or (= z@43@01 x@36@01) (= z@43@01 y@37@01)))
(pop) ; 3
(declare-const $t@44@01 $FVF<g>)
(declare-fun inv@45@01 ($Ref) $Ref)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@43@01 $Ref)) (!
  (=>
    (or (= z@43@01 x@36@01) (= z@43@01 y@37@01))
    (or (not (= z@43@01 x@36@01)) (= z@43@01 x@36@01)))
  :pattern ((inv@45@01 z@43@01))
  :pattern ((img@46@01 z@43@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@43@01 $Ref) (z2@43@01 $Ref)) (!
  (=>
    (and
      (or (= z1@43@01 x@36@01) (= z1@43@01 y@37@01))
      (or (= z2@43@01 x@36@01) (= z2@43@01 y@37@01))
      (= z1@43@01 z2@43@01))
    (= z1@43@01 z2@43@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@43@01 $Ref)) (!
  (=>
    (or (= z@43@01 x@36@01) (= z@43@01 y@37@01))
    (and (= (inv@45@01 z@43@01) z@43@01) (img@46@01 z@43@01)))
  :pattern ((inv@45@01 z@43@01))
  :pattern ((img@46@01 z@43@01))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@46@01 r) (or (= (inv@45@01 r) x@36@01) (= (inv@45@01 r) y@37@01)))
    (= (inv@45@01 r) r))
  :pattern ((inv@45@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@43@01 $Ref)) (!
  (=> (or (= z@43@01 x@36@01) (= z@43@01 y@37@01)) (not (= z@43@01 $Ref.null)))
  :pattern ((inv@45@01 z@43@01))
  :pattern ((img@46@01 z@43@01))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@47@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@46@01 r) (or (= (inv@45@01 r) x@36@01) (= (inv@45@01 r) y@37@01)))
    (= ($FVF.lookup_g (as sm@47@01  $FVF<g>) r) ($FVF.lookup_g $t@44@01 r)))
  :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@44@01 r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g $t@44@01 r) r)
  :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (or (= (inv@45@01 r) x@36@01) (= (inv@45@01 r) y@37@01))
    ($FVF.loc_g ($FVF.lookup_g (as sm@47@01  $FVF<g>) r) r))
  :pattern ((inv@45@01 r))
  :qid |quant-u-17|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(assert (= ($Snap.first $t@48@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@36@01 $Ref.null)))
(assert (= ($Snap.second $t@48@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@37@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { fun01(z), z.f, z.g }
;     z == x || z == y ==> z.f + z.g > 0)
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 $Snap.unit))
; [eval] (forall z: Ref :: { fun01(z), z.f, z.g } z == x || z == y ==> z.f + z.g > 0)
(declare-const z@50@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> z.f + z.g > 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 10 | z@50@01 == x@36@01 | live]
; [else-branch: 10 | z@50@01 != x@36@01 | live]
(push) ; 5
; [then-branch: 10 | z@50@01 == x@36@01]
(assert (= z@50@01 x@36@01))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | z@50@01 != x@36@01]
(assert (not (= z@50@01 x@36@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@50@01 x@36@01)) (= z@50@01 x@36@01)))
(push) ; 4
; [then-branch: 11 | z@50@01 == x@36@01 || z@50@01 == y@37@01 | live]
; [else-branch: 11 | !(z@50@01 == x@36@01 || z@50@01 == y@37@01) | live]
(push) ; 5
; [then-branch: 11 | z@50@01 == x@36@01 || z@50@01 == y@37@01]
(assert (or (= z@50@01 x@36@01) (= z@50@01 y@37@01)))
; [eval] z.f + z.g > 0
; [eval] z.f + z.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@41@01 r)
        (or (= (inv@40@01 r) x@36@01) (= (inv@40@01 r) y@37@01)))
      (= ($FVF.lookup_f (as sm@42@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
    :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@39@01 r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@39@01 r) r)
    :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef13|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@42@01  $FVF<f>) z@50@01) z@50@01))
(push) ; 6
(assert (not (and
  (img@41@01 z@50@01)
  (or (= (inv@40@01 z@50@01) x@36@01) (= (inv@40@01 z@50@01) y@37@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@46@01 r)
        (or (= (inv@45@01 r) x@36@01) (= (inv@45@01 r) y@37@01)))
      (= ($FVF.lookup_g (as sm@47@01  $FVF<g>) r) ($FVF.lookup_g $t@44@01 r)))
    :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@44@01 r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    ($FVF.loc_g ($FVF.lookup_g $t@44@01 r) r)
    :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef15|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@47@01  $FVF<g>) z@50@01) z@50@01))
(push) ; 6
(assert (not (and
  (img@46@01 z@50@01)
  (or (= (inv@45@01 z@50@01) x@36@01) (= (inv@45@01 z@50@01) y@37@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(z@50@01 == x@36@01 || z@50@01 == y@37@01)]
(assert (not (or (= z@50@01 x@36@01) (= z@50@01 y@37@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@41@01 r) (or (= (inv@40@01 r) x@36@01) (= (inv@40@01 r) y@37@01)))
    (= ($FVF.lookup_f (as sm@42@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@39@01 r) r)
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@46@01 r) (or (= (inv@45@01 r) x@36@01) (= (inv@45@01 r) y@37@01)))
    (= ($FVF.lookup_g (as sm@47@01  $FVF<g>) r) ($FVF.lookup_g $t@44@01 r)))
  :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@44@01 r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g $t@44@01 r) r)
  :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (=>
  (or (= z@50@01 x@36@01) (= z@50@01 y@37@01))
  (and
    (or (= z@50@01 x@36@01) (= z@50@01 y@37@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@42@01  $FVF<f>) z@50@01) z@50@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@47@01  $FVF<g>) z@50@01) z@50@01))))
; Joined path conditions
(assert (or
  (not (or (= z@50@01 x@36@01) (= z@50@01 y@37@01)))
  (or (= z@50@01 x@36@01) (= z@50@01 y@37@01))))
; [eval] fun01(z)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@41@01 r) (or (= (inv@40@01 r) x@36@01) (= (inv@40@01 r) y@37@01)))
    (= ($FVF.lookup_f (as sm@42@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@39@01 r) r)
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@46@01 r) (or (= (inv@45@01 r) x@36@01) (= (inv@45@01 r) y@37@01)))
    (= ($FVF.lookup_g (as sm@47@01  $FVF<g>) r) ($FVF.lookup_g $t@44@01 r)))
  :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@44@01 r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g $t@44@01 r) r)
  :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef15|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@50@01 $Ref)) (!
  (and
    (or (not (= z@50@01 x@36@01)) (= z@50@01 x@36@01))
    (=>
      (or (= z@50@01 x@36@01) (= z@50@01 y@37@01))
      (and
        (or (= z@50@01 x@36@01) (= z@50@01 y@37@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@42@01  $FVF<f>) z@50@01) z@50@01)
        ($FVF.loc_g ($FVF.lookup_g (as sm@47@01  $FVF<g>) z@50@01) z@50@01)))
    (or
      (not (or (= z@50@01 x@36@01) (= z@50@01 y@37@01)))
      (or (= z@50@01 x@36@01) (= z@50@01 y@37@01))))
  :pattern ((fun01<Bool> z@50@01) ($FVF.loc_f ($FVF.lookup_f (as sm@42@01  $FVF<f>) z@50@01) z@50@01) ($FVF.loc_g ($FVF.lookup_g (as sm@47@01  $FVF<g>) z@50@01) z@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@34@10@34@82-aux|)))
(assert (forall ((z@50@01 $Ref)) (!
  (=>
    (or (= z@50@01 x@36@01) (= z@50@01 y@37@01))
    (>
      (+
        ($FVF.lookup_f (as sm@42@01  $FVF<f>) z@50@01)
        ($FVF.lookup_g (as sm@47@01  $FVF<g>) z@50@01))
      0))
  :pattern ((fun01<Bool> z@50@01) ($FVF.loc_f ($FVF.lookup_f (as sm@42@01  $FVF<f>) z@50@01) z@50@01) ($FVF.loc_g ($FVF.lookup_g (as sm@47@01  $FVF<g>) z@50@01) z@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@34@10@34@82|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun01(x)
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 $Snap.unit))
; [eval] fun01(x)
(assert (fun01<Bool> x@36@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert x.f + x.g > 0
; [eval] x.f + x.g > 0
; [eval] x.f + x.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@41@01 r)
        (or (= (inv@40@01 r) x@36@01) (= (inv@40@01 r) y@37@01)))
      (= ($FVF.lookup_f (as sm@42@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
    :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@39@01 r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@39@01 r) r)
    :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef13|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@42@01  $FVF<f>) x@36@01) x@36@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@41@01 x@36@01)
  (or (= (inv@40@01 x@36@01) x@36@01) (= (inv@40@01 x@36@01) y@37@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@46@01 r)
        (or (= (inv@45@01 r) x@36@01) (= (inv@45@01 r) y@37@01)))
      (= ($FVF.lookup_g (as sm@47@01  $FVF<g>) r) ($FVF.lookup_g $t@44@01 r)))
    :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@44@01 r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    ($FVF.loc_g ($FVF.lookup_g $t@44@01 r) r)
    :pattern (($FVF.lookup_g (as sm@47@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef15|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@47@01  $FVF<g>) x@36@01) x@36@01))
(push) ; 3
(assert (not (and
  (img@46@01 x@36@01)
  (or (= (inv@45@01 x@36@01) x@36@01) (= (inv@45@01 x@36@01) y@37@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>
  (+
    ($FVF.lookup_f (as sm@42@01  $FVF<f>) x@36@01)
    ($FVF.lookup_g (as sm@47@01  $FVF<g>) x@36@01))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>
  (+
    ($FVF.lookup_f (as sm@42@01  $FVF<f>) x@36@01)
    ($FVF.lookup_g (as sm@47@01  $FVF<g>) x@36@01))
  0))
(pop) ; 2
(pop) ; 1
; ---------- test02b ----------
(declare-const x@52@01 $Ref)
(declare-const y@53@01 $Ref)
(declare-const x@54@01 $Ref)
(declare-const y@55@01 $Ref)
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
; inhale (forall z: Ref ::z == x || z == y ==> acc(z.f, write))
(declare-const z@56@01 $Ref)
(push) ; 3
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 12 | z@56@01 == x@54@01 | live]
; [else-branch: 12 | z@56@01 != x@54@01 | live]
(push) ; 5
; [then-branch: 12 | z@56@01 == x@54@01]
(assert (= z@56@01 x@54@01))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | z@56@01 != x@54@01]
(assert (not (= z@56@01 x@54@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@56@01 x@54@01)) (= z@56@01 x@54@01)))
(assert (or (= z@56@01 x@54@01) (= z@56@01 y@55@01)))
(pop) ; 3
(declare-const $t@57@01 $FVF<f>)
(declare-fun inv@58@01 ($Ref) $Ref)
(declare-fun img@59@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@56@01 $Ref)) (!
  (=>
    (or (= z@56@01 x@54@01) (= z@56@01 y@55@01))
    (or (not (= z@56@01 x@54@01)) (= z@56@01 x@54@01)))
  :pattern ((inv@58@01 z@56@01))
  :pattern ((img@59@01 z@56@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@56@01 $Ref) (z2@56@01 $Ref)) (!
  (=>
    (and
      (or (= z1@56@01 x@54@01) (= z1@56@01 y@55@01))
      (or (= z2@56@01 x@54@01) (= z2@56@01 y@55@01))
      (= z1@56@01 z2@56@01))
    (= z1@56@01 z2@56@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@56@01 $Ref)) (!
  (=>
    (or (= z@56@01 x@54@01) (= z@56@01 y@55@01))
    (and (= (inv@58@01 z@56@01) z@56@01) (img@59@01 z@56@01)))
  :pattern ((inv@58@01 z@56@01))
  :pattern ((img@59@01 z@56@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@59@01 r) (or (= (inv@58@01 r) x@54@01) (= (inv@58@01 r) y@55@01)))
    (= (inv@58@01 r) r))
  :pattern ((inv@58@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@56@01 $Ref)) (!
  (=> (or (= z@56@01 x@54@01) (= z@56@01 y@55@01)) (not (= z@56@01 $Ref.null)))
  :pattern ((inv@58@01 z@56@01))
  :pattern ((img@59@01 z@56@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@60@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@59@01 r) (or (= (inv@58@01 r) x@54@01) (= (inv@58@01 r) y@55@01)))
    (= ($FVF.lookup_f (as sm@60@01  $FVF<f>) r) ($FVF.lookup_f $t@57@01 r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@57@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@57@01 r) r)
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (or (= (inv@58@01 r) x@54@01) (= (inv@58@01 r) y@55@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@60@01  $FVF<f>) r) r))
  :pattern ((inv@58@01 r))
  :qid |quant-u-20|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == x ==> acc(z.g, write))
(declare-const z@61@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x
(assert (= z@61@01 x@54@01))
(pop) ; 3
(declare-const $t@62@01 $FVF<g>)
(declare-fun inv@63@01 ($Ref) $Ref)
(declare-fun img@64@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@61@01 $Ref) (z2@61@01 $Ref)) (!
  (=>
    (and (= z1@61@01 x@54@01) (= z2@61@01 x@54@01) (= z1@61@01 z2@61@01))
    (= z1@61@01 z2@61@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@61@01 $Ref)) (!
  (=>
    (= z@61@01 x@54@01)
    (and (= (inv@63@01 z@61@01) z@61@01) (img@64@01 z@61@01)))
  :pattern ((inv@63@01 z@61@01))
  :pattern ((img@64@01 z@61@01))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@64@01 r) (= (inv@63@01 r) x@54@01)) (= (inv@63@01 r) r))
  :pattern ((inv@63@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@61@01 $Ref)) (!
  (=> (= z@61@01 x@54@01) (not (= z@61@01 $Ref.null)))
  :pattern ((inv@63@01 z@61@01))
  :pattern ((img@64@01 z@61@01))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@65@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@64@01 r) (= (inv@63@01 r) x@54@01))
    (= ($FVF.lookup_g (as sm@65@01  $FVF<g>) r) ($FVF.lookup_g $t@62@01 r)))
  :pattern (($FVF.lookup_g (as sm@65@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@62@01 r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g $t@62@01 r) r)
  :pattern (($FVF.lookup_g (as sm@65@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@63@01 r) x@54@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@65@01  $FVF<g>) r) r))
  :pattern ((inv@63@01 r))
  :qid |quant-u-23|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.g, write))
(declare-const z@66@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@66@01 y@55@01))
(pop) ; 3
(declare-const $t@67@01 $FVF<g>)
(declare-fun inv@68@01 ($Ref) $Ref)
(declare-fun img@69@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@66@01 $Ref) (z2@66@01 $Ref)) (!
  (=>
    (and (= z1@66@01 y@55@01) (= z2@66@01 y@55@01) (= z1@66@01 z2@66@01))
    (= z1@66@01 z2@66@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@66@01 $Ref)) (!
  (=>
    (= z@66@01 y@55@01)
    (and (= (inv@68@01 z@66@01) z@66@01) (img@69@01 z@66@01)))
  :pattern ((inv@68@01 z@66@01))
  :pattern ((img@69@01 z@66@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@69@01 r) (= (inv@68@01 r) y@55@01)) (= (inv@68@01 r) r))
  :pattern ((inv@68@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@66@01 $Ref)) (!
  (=> (= z@66@01 y@55@01) (not (= z@66@01 $Ref.null)))
  :pattern ((inv@68@01 z@66@01))
  :pattern ((img@69@01 z@66@01))
  :qid |g-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@66@01 z@61@01)
    (=
      (and (img@69@01 r) (= (inv@68@01 r) y@55@01))
      (and (img@64@01 r) (= (inv@63@01 r) x@54@01))))
  
  :qid |quant-u-26|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@70@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@64@01 r) (= (inv@63@01 r) x@54@01))
    (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@62@01 r)))
  :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@62@01 r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@69@01 r) (= (inv@68@01 r) y@55@01))
    (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@67@01 r)))
  :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@67@01 r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@62@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@67@01 r) r))
  :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@68@01 r) y@55@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) r))
  :pattern ((inv@68@01 r))
  :qid |quant-u-27|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 ($Snap.combine ($Snap.first $t@71@01) ($Snap.second $t@71@01))))
(assert (= ($Snap.first $t@71@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@54@01 $Ref.null)))
(assert (= ($Snap.second $t@71@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@55@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { fun01(z), z.f, z.g }
;     z == x || z == y ==> z.f + z.g > 0)
(declare-const $t@72@01 $Snap)
(assert (= $t@72@01 $Snap.unit))
; [eval] (forall z: Ref :: { fun01(z), z.f, z.g } z == x || z == y ==> z.f + z.g > 0)
(declare-const z@73@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> z.f + z.g > 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 13 | z@73@01 == x@54@01 | live]
; [else-branch: 13 | z@73@01 != x@54@01 | live]
(push) ; 5
; [then-branch: 13 | z@73@01 == x@54@01]
(assert (= z@73@01 x@54@01))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | z@73@01 != x@54@01]
(assert (not (= z@73@01 x@54@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@73@01 x@54@01)) (= z@73@01 x@54@01)))
(push) ; 4
; [then-branch: 14 | z@73@01 == x@54@01 || z@73@01 == y@55@01 | live]
; [else-branch: 14 | !(z@73@01 == x@54@01 || z@73@01 == y@55@01) | live]
(push) ; 5
; [then-branch: 14 | z@73@01 == x@54@01 || z@73@01 == y@55@01]
(assert (or (= z@73@01 x@54@01) (= z@73@01 y@55@01)))
; [eval] z.f + z.g > 0
; [eval] z.f + z.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@59@01 r)
        (or (= (inv@58@01 r) x@54@01) (= (inv@58@01 r) y@55@01)))
      (= ($FVF.lookup_f (as sm@60@01  $FVF<f>) r) ($FVF.lookup_f $t@57@01 r)))
    :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@57@01 r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@57@01 r) r)
    :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef17|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@60@01  $FVF<f>) z@73@01) z@73@01))
(push) ; 6
(assert (not (and
  (img@59@01 z@73@01)
  (or (= (inv@58@01 z@73@01) x@54@01) (= (inv@58@01 z@73@01) y@55@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@64@01 r) (= (inv@63@01 r) x@54@01))
      (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@62@01 r)))
    :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@62@01 r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@69@01 r) (= (inv@68@01 r) y@55@01))
      (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@67@01 r)))
    :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@67@01 r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@62@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@67@01 r) r))
    :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef22|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@70@01  $FVF<g>) z@73@01) z@73@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@64@01 z@73@01) (= (inv@63@01 z@73@01) x@54@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@69@01 z@73@01) (= (inv@68@01 z@73@01) y@55@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(z@73@01 == x@54@01 || z@73@01 == y@55@01)]
(assert (not (or (= z@73@01 x@54@01) (= z@73@01 y@55@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@59@01 r) (or (= (inv@58@01 r) x@54@01) (= (inv@58@01 r) y@55@01)))
    (= ($FVF.lookup_f (as sm@60@01  $FVF<f>) r) ($FVF.lookup_f $t@57@01 r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@57@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@57@01 r) r)
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@64@01 r) (= (inv@63@01 r) x@54@01))
    (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@62@01 r)))
  :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@62@01 r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@69@01 r) (= (inv@68@01 r) y@55@01))
    (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@67@01 r)))
  :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@67@01 r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@62@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@67@01 r) r))
  :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (=>
  (or (= z@73@01 x@54@01) (= z@73@01 y@55@01))
  (and
    (or (= z@73@01 x@54@01) (= z@73@01 y@55@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@60@01  $FVF<f>) z@73@01) z@73@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@70@01  $FVF<g>) z@73@01) z@73@01))))
; Joined path conditions
(assert (or
  (not (or (= z@73@01 x@54@01) (= z@73@01 y@55@01)))
  (or (= z@73@01 x@54@01) (= z@73@01 y@55@01))))
; [eval] fun01(z)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@59@01 r) (or (= (inv@58@01 r) x@54@01) (= (inv@58@01 r) y@55@01)))
    (= ($FVF.lookup_f (as sm@60@01  $FVF<f>) r) ($FVF.lookup_f $t@57@01 r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@57@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@57@01 r) r)
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@64@01 r) (= (inv@63@01 r) x@54@01))
    (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@62@01 r)))
  :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@62@01 r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@69@01 r) (= (inv@68@01 r) y@55@01))
    (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@67@01 r)))
  :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@67@01 r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@62@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@67@01 r) r))
  :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef22|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@73@01 $Ref)) (!
  (and
    (or (not (= z@73@01 x@54@01)) (= z@73@01 x@54@01))
    (=>
      (or (= z@73@01 x@54@01) (= z@73@01 y@55@01))
      (and
        (or (= z@73@01 x@54@01) (= z@73@01 y@55@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@60@01  $FVF<f>) z@73@01) z@73@01)
        ($FVF.loc_g ($FVF.lookup_g (as sm@70@01  $FVF<g>) z@73@01) z@73@01)))
    (or
      (not (or (= z@73@01 x@54@01) (= z@73@01 y@55@01)))
      (or (= z@73@01 x@54@01) (= z@73@01 y@55@01))))
  :pattern ((fun01<Bool> z@73@01) ($FVF.loc_f ($FVF.lookup_f (as sm@60@01  $FVF<f>) z@73@01) z@73@01) ($FVF.loc_g ($FVF.lookup_g (as sm@70@01  $FVF<g>) z@73@01) z@73@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@45@10@45@82-aux|)))
(assert (forall ((z@73@01 $Ref)) (!
  (=>
    (or (= z@73@01 x@54@01) (= z@73@01 y@55@01))
    (>
      (+
        ($FVF.lookup_f (as sm@60@01  $FVF<f>) z@73@01)
        ($FVF.lookup_g (as sm@70@01  $FVF<g>) z@73@01))
      0))
  :pattern ((fun01<Bool> z@73@01) ($FVF.loc_f ($FVF.lookup_f (as sm@60@01  $FVF<f>) z@73@01) z@73@01) ($FVF.loc_g ($FVF.lookup_g (as sm@70@01  $FVF<g>) z@73@01) z@73@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@45@10@45@82|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun01(x)
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
; [eval] fun01(x)
(assert (fun01<Bool> x@54@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert x.f + x.g > 0
; [eval] x.f + x.g > 0
; [eval] x.f + x.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@59@01 r)
        (or (= (inv@58@01 r) x@54@01) (= (inv@58@01 r) y@55@01)))
      (= ($FVF.lookup_f (as sm@60@01  $FVF<f>) r) ($FVF.lookup_f $t@57@01 r)))
    :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@57@01 r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@57@01 r) r)
    :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef17|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@60@01  $FVF<f>) x@54@01) x@54@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@59@01 x@54@01)
  (or (= (inv@58@01 x@54@01) x@54@01) (= (inv@58@01 x@54@01) y@55@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@64@01 r) (= (inv@63@01 r) x@54@01))
      (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@62@01 r)))
    :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@62@01 r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@69@01 r) (= (inv@68@01 r) y@55@01))
      (= ($FVF.lookup_g (as sm@70@01  $FVF<g>) r) ($FVF.lookup_g $t@67@01 r)))
    :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@67@01 r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@62@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@67@01 r) r))
    :pattern (($FVF.lookup_g (as sm@70@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef22|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@70@01  $FVF<g>) x@54@01) x@54@01))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@64@01 x@54@01) (= (inv@63@01 x@54@01) x@54@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@69@01 x@54@01) (= (inv@68@01 x@54@01) y@55@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>
  (+
    ($FVF.lookup_f (as sm@60@01  $FVF<f>) x@54@01)
    ($FVF.lookup_g (as sm@70@01  $FVF<g>) x@54@01))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>
  (+
    ($FVF.lookup_f (as sm@60@01  $FVF<f>) x@54@01)
    ($FVF.lookup_g (as sm@70@01  $FVF<g>) x@54@01))
  0))
(pop) ; 2
(pop) ; 1
; ---------- test02c ----------
(declare-const x@75@01 $Ref)
(declare-const y@76@01 $Ref)
(declare-const x@77@01 $Ref)
(declare-const y@78@01 $Ref)
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
; inhale (forall z: Ref ::z == x ==> acc(z.f, write))
(declare-const z@79@01 $Ref)
(push) ; 3
; [eval] z == x
(assert (= z@79@01 x@77@01))
(pop) ; 3
(declare-const $t@80@01 $FVF<f>)
(declare-fun inv@81@01 ($Ref) $Ref)
(declare-fun img@82@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@79@01 $Ref) (z2@79@01 $Ref)) (!
  (=>
    (and (= z1@79@01 x@77@01) (= z2@79@01 x@77@01) (= z1@79@01 z2@79@01))
    (= z1@79@01 z2@79@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@79@01 $Ref)) (!
  (=>
    (= z@79@01 x@77@01)
    (and (= (inv@81@01 z@79@01) z@79@01) (img@82@01 z@79@01)))
  :pattern ((inv@81@01 z@79@01))
  :pattern ((img@82@01 z@79@01))
  :qid |quant-u-29|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@82@01 r) (= (inv@81@01 r) x@77@01)) (= (inv@81@01 r) r))
  :pattern ((inv@81@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@79@01 $Ref)) (!
  (=> (= z@79@01 x@77@01) (not (= z@79@01 $Ref.null)))
  :pattern ((inv@81@01 z@79@01))
  :pattern ((img@82@01 z@79@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@83@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@82@01 r) (= (inv@81@01 r) x@77@01))
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@80@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@80@01 r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@80@01 r) r)
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@81@01 r) x@77@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) r))
  :pattern ((inv@81@01 r))
  :qid |quant-u-30|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.f, write))
(declare-const z@84@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@84@01 y@78@01))
(pop) ; 3
(declare-const $t@85@01 $FVF<f>)
(declare-fun inv@86@01 ($Ref) $Ref)
(declare-fun img@87@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@84@01 $Ref) (z2@84@01 $Ref)) (!
  (=>
    (and (= z1@84@01 y@78@01) (= z2@84@01 y@78@01) (= z1@84@01 z2@84@01))
    (= z1@84@01 z2@84@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@84@01 $Ref)) (!
  (=>
    (= z@84@01 y@78@01)
    (and (= (inv@86@01 z@84@01) z@84@01) (img@87@01 z@84@01)))
  :pattern ((inv@86@01 z@84@01))
  :pattern ((img@87@01 z@84@01))
  :qid |quant-u-32|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@87@01 r) (= (inv@86@01 r) y@78@01)) (= (inv@86@01 r) r))
  :pattern ((inv@86@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@84@01 $Ref)) (!
  (=> (= z@84@01 y@78@01) (not (= z@84@01 $Ref.null)))
  :pattern ((inv@86@01 z@84@01))
  :pattern ((img@87@01 z@84@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@84@01 z@79@01)
    (=
      (and (img@87@01 r) (= (inv@86@01 r) y@78@01))
      (and (img@82@01 r) (= (inv@81@01 r) x@77@01))))
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@88@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@82@01 r) (= (inv@81@01 r) x@77@01))
    (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@80@01 r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@80@01 r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@87@01 r) (= (inv@86@01 r) y@78@01))
    (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@85@01 r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@85@01 r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@80@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@85@01 r) r))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@86@01 r) y@78@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) r))
  :pattern ((inv@86@01 r))
  :qid |quant-u-34|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == x ==> acc(z.g, write))
(declare-const z@89@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x
(assert (= z@89@01 x@77@01))
(pop) ; 3
(declare-const $t@90@01 $FVF<g>)
(declare-fun inv@91@01 ($Ref) $Ref)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@89@01 $Ref) (z2@89@01 $Ref)) (!
  (=>
    (and (= z1@89@01 x@77@01) (= z2@89@01 x@77@01) (= z1@89@01 z2@89@01))
    (= z1@89@01 z2@89@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@89@01 $Ref)) (!
  (=>
    (= z@89@01 x@77@01)
    (and (= (inv@91@01 z@89@01) z@89@01) (img@92@01 z@89@01)))
  :pattern ((inv@91@01 z@89@01))
  :pattern ((img@92@01 z@89@01))
  :qid |quant-u-36|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@92@01 r) (= (inv@91@01 r) x@77@01)) (= (inv@91@01 r) r))
  :pattern ((inv@91@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@89@01 $Ref)) (!
  (=> (= z@89@01 x@77@01) (not (= z@89@01 $Ref.null)))
  :pattern ((inv@91@01 z@89@01))
  :pattern ((img@92@01 z@89@01))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@93@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@92@01 r) (= (inv@91@01 r) x@77@01))
    (= ($FVF.lookup_g (as sm@93@01  $FVF<g>) r) ($FVF.lookup_g $t@90@01 r)))
  :pattern (($FVF.lookup_g (as sm@93@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@90@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g $t@90@01 r) r)
  :pattern (($FVF.lookup_g (as sm@93@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@91@01 r) x@77@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@93@01  $FVF<g>) r) r))
  :pattern ((inv@91@01 r))
  :qid |quant-u-37|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.g, write))
(declare-const z@94@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@94@01 y@78@01))
(pop) ; 3
(declare-const $t@95@01 $FVF<g>)
(declare-fun inv@96@01 ($Ref) $Ref)
(declare-fun img@97@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@94@01 $Ref) (z2@94@01 $Ref)) (!
  (=>
    (and (= z1@94@01 y@78@01) (= z2@94@01 y@78@01) (= z1@94@01 z2@94@01))
    (= z1@94@01 z2@94@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@94@01 $Ref)) (!
  (=>
    (= z@94@01 y@78@01)
    (and (= (inv@96@01 z@94@01) z@94@01) (img@97@01 z@94@01)))
  :pattern ((inv@96@01 z@94@01))
  :pattern ((img@97@01 z@94@01))
  :qid |quant-u-39|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@97@01 r) (= (inv@96@01 r) y@78@01)) (= (inv@96@01 r) r))
  :pattern ((inv@96@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@94@01 $Ref)) (!
  (=> (= z@94@01 y@78@01) (not (= z@94@01 $Ref.null)))
  :pattern ((inv@96@01 z@94@01))
  :pattern ((img@97@01 z@94@01))
  :qid |g-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@94@01 z@89@01)
    (=
      (and (img@97@01 r) (= (inv@96@01 r) y@78@01))
      (and (img@92@01 r) (= (inv@91@01 r) x@77@01))))
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@98@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@92@01 r) (= (inv@91@01 r) x@77@01))
    (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@90@01 r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@90@01 r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@97@01 r) (= (inv@96@01 r) y@78@01))
    (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@95@01 r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@95@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@90@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@95@01 r) r))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@96@01 r) y@78@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) r))
  :pattern ((inv@96@01 r))
  :qid |quant-u-41|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@99@01 $Snap)
(assert (= $t@99@01 ($Snap.combine ($Snap.first $t@99@01) ($Snap.second $t@99@01))))
(assert (= ($Snap.first $t@99@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@77@01 $Ref.null)))
(assert (= ($Snap.second $t@99@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@78@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { fun01(z), z.f, z.g }
;     z == x || z == y ==> z.f + z.g > 0)
(declare-const $t@100@01 $Snap)
(assert (= $t@100@01 $Snap.unit))
; [eval] (forall z: Ref :: { fun01(z), z.f, z.g } z == x || z == y ==> z.f + z.g > 0)
(declare-const z@101@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> z.f + z.g > 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 15 | z@101@01 == x@77@01 | live]
; [else-branch: 15 | z@101@01 != x@77@01 | live]
(push) ; 5
; [then-branch: 15 | z@101@01 == x@77@01]
(assert (= z@101@01 x@77@01))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | z@101@01 != x@77@01]
(assert (not (= z@101@01 x@77@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@101@01 x@77@01)) (= z@101@01 x@77@01)))
(push) ; 4
; [then-branch: 16 | z@101@01 == x@77@01 || z@101@01 == y@78@01 | live]
; [else-branch: 16 | !(z@101@01 == x@77@01 || z@101@01 == y@78@01) | live]
(push) ; 5
; [then-branch: 16 | z@101@01 == x@77@01 || z@101@01 == y@78@01]
(assert (or (= z@101@01 x@77@01) (= z@101@01 y@78@01)))
; [eval] z.f + z.g > 0
; [eval] z.f + z.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@82@01 r) (= (inv@81@01 r) x@77@01))
      (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@80@01 r)))
    :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@80@01 r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@87@01 r) (= (inv@86@01 r) y@78@01))
      (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@85@01 r)))
    :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@85@01 r))
    :qid |qp.fvfValDef26|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@80@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@85@01 r) r))
    :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef27|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@88@01  $FVF<f>) z@101@01) z@101@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@82@01 z@101@01) (= (inv@81@01 z@101@01) x@77@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@87@01 z@101@01) (= (inv@86@01 z@101@01) y@78@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@92@01 r) (= (inv@91@01 r) x@77@01))
      (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@90@01 r)))
    :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@90@01 r))
    :qid |qp.fvfValDef30|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@97@01 r) (= (inv@96@01 r) y@78@01))
      (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@95@01 r)))
    :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@95@01 r))
    :qid |qp.fvfValDef31|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@90@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@95@01 r) r))
    :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef32|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@98@01  $FVF<g>) z@101@01) z@101@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@92@01 z@101@01) (= (inv@91@01 z@101@01) x@77@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@97@01 z@101@01) (= (inv@96@01 z@101@01) y@78@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 16 | !(z@101@01 == x@77@01 || z@101@01 == y@78@01)]
(assert (not (or (= z@101@01 x@77@01) (= z@101@01 y@78@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@82@01 r) (= (inv@81@01 r) x@77@01))
    (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@80@01 r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@80@01 r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@87@01 r) (= (inv@86@01 r) y@78@01))
    (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@85@01 r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@85@01 r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@80@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@85@01 r) r))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@92@01 r) (= (inv@91@01 r) x@77@01))
    (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@90@01 r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@90@01 r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@97@01 r) (= (inv@96@01 r) y@78@01))
    (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@95@01 r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@95@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@90@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@95@01 r) r))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (=>
  (or (= z@101@01 x@77@01) (= z@101@01 y@78@01))
  (and
    (or (= z@101@01 x@77@01) (= z@101@01 y@78@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@88@01  $FVF<f>) z@101@01) z@101@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@98@01  $FVF<g>) z@101@01) z@101@01))))
; Joined path conditions
(assert (or
  (not (or (= z@101@01 x@77@01) (= z@101@01 y@78@01)))
  (or (= z@101@01 x@77@01) (= z@101@01 y@78@01))))
; [eval] fun01(z)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@82@01 r) (= (inv@81@01 r) x@77@01))
    (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@80@01 r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@80@01 r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@87@01 r) (= (inv@86@01 r) y@78@01))
    (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@85@01 r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@85@01 r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@80@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@85@01 r) r))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@92@01 r) (= (inv@91@01 r) x@77@01))
    (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@90@01 r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@90@01 r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@97@01 r) (= (inv@96@01 r) y@78@01))
    (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@95@01 r)))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@95@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@90@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@95@01 r) r))
  :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef32|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@101@01 $Ref)) (!
  (and
    (or (not (= z@101@01 x@77@01)) (= z@101@01 x@77@01))
    (=>
      (or (= z@101@01 x@77@01) (= z@101@01 y@78@01))
      (and
        (or (= z@101@01 x@77@01) (= z@101@01 y@78@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@88@01  $FVF<f>) z@101@01) z@101@01)
        ($FVF.loc_g ($FVF.lookup_g (as sm@98@01  $FVF<g>) z@101@01) z@101@01)))
    (or
      (not (or (= z@101@01 x@77@01) (= z@101@01 y@78@01)))
      (or (= z@101@01 x@77@01) (= z@101@01 y@78@01))))
  :pattern ((fun01<Bool> z@101@01) ($FVF.loc_f ($FVF.lookup_f (as sm@88@01  $FVF<f>) z@101@01) z@101@01) ($FVF.loc_g ($FVF.lookup_g (as sm@98@01  $FVF<g>) z@101@01) z@101@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@58@10@58@82-aux|)))
(assert (forall ((z@101@01 $Ref)) (!
  (=>
    (or (= z@101@01 x@77@01) (= z@101@01 y@78@01))
    (>
      (+
        ($FVF.lookup_f (as sm@88@01  $FVF<f>) z@101@01)
        ($FVF.lookup_g (as sm@98@01  $FVF<g>) z@101@01))
      0))
  :pattern ((fun01<Bool> z@101@01) ($FVF.loc_f ($FVF.lookup_f (as sm@88@01  $FVF<f>) z@101@01) z@101@01) ($FVF.loc_g ($FVF.lookup_g (as sm@98@01  $FVF<g>) z@101@01) z@101@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@58@10@58@82|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun01(x)
(declare-const $t@102@01 $Snap)
(assert (= $t@102@01 $Snap.unit))
; [eval] fun01(x)
(assert (fun01<Bool> x@77@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert x.f + x.g > 0
; [eval] x.f + x.g > 0
; [eval] x.f + x.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@82@01 r) (= (inv@81@01 r) x@77@01))
      (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@80@01 r)))
    :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@80@01 r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@87@01 r) (= (inv@86@01 r) y@78@01))
      (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@85@01 r)))
    :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@85@01 r))
    :qid |qp.fvfValDef26|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@80@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@85@01 r) r))
    :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef27|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@88@01  $FVF<f>) x@77@01) x@77@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@82@01 x@77@01) (= (inv@81@01 x@77@01) x@77@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@87@01 x@77@01) (= (inv@86@01 x@77@01) y@78@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@92@01 r) (= (inv@91@01 r) x@77@01))
      (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@90@01 r)))
    :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@90@01 r))
    :qid |qp.fvfValDef30|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@97@01 r) (= (inv@96@01 r) y@78@01))
      (= ($FVF.lookup_g (as sm@98@01  $FVF<g>) r) ($FVF.lookup_g $t@95@01 r)))
    :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@95@01 r))
    :qid |qp.fvfValDef31|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@90@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@95@01 r) r))
    :pattern (($FVF.lookup_g (as sm@98@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef32|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@98@01  $FVF<g>) x@77@01) x@77@01))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@92@01 x@77@01) (= (inv@91@01 x@77@01) x@77@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@97@01 x@77@01) (= (inv@96@01 x@77@01) y@78@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>
  (+
    ($FVF.lookup_f (as sm@88@01  $FVF<f>) x@77@01)
    ($FVF.lookup_g (as sm@98@01  $FVF<g>) x@77@01))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>
  (+
    ($FVF.lookup_f (as sm@88@01  $FVF<f>) x@77@01)
    ($FVF.lookup_g (as sm@98@01  $FVF<g>) x@77@01))
  0))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@103@01 $Ref)
(declare-const y@104@01 $Ref)
(declare-const x@105@01 $Ref)
(declare-const y@106@01 $Ref)
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
; inhale (forall z: Ref ::z == x ==> acc(z.f, write))
(declare-const z@107@01 $Ref)
(push) ; 3
; [eval] z == x
(assert (= z@107@01 x@105@01))
(pop) ; 3
(declare-const $t@108@01 $FVF<f>)
(declare-fun inv@109@01 ($Ref) $Ref)
(declare-fun img@110@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@107@01 $Ref) (z2@107@01 $Ref)) (!
  (=>
    (and (= z1@107@01 x@105@01) (= z2@107@01 x@105@01) (= z1@107@01 z2@107@01))
    (= z1@107@01 z2@107@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@107@01 $Ref)) (!
  (=>
    (= z@107@01 x@105@01)
    (and (= (inv@109@01 z@107@01) z@107@01) (img@110@01 z@107@01)))
  :pattern ((inv@109@01 z@107@01))
  :pattern ((img@110@01 z@107@01))
  :qid |quant-u-43|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@110@01 r) (= (inv@109@01 r) x@105@01)) (= (inv@109@01 r) r))
  :pattern ((inv@109@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@107@01 $Ref)) (!
  (=> (= z@107@01 x@105@01) (not (= z@107@01 $Ref.null)))
  :pattern ((inv@109@01 z@107@01))
  :pattern ((img@110@01 z@107@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@111@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@110@01 r) (= (inv@109@01 r) x@105@01))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) ($FVF.lookup_f $t@108@01 r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@108@01 r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@108@01 r) r)
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@109@01 r) x@105@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) r))
  :pattern ((inv@109@01 r))
  :qid |quant-u-44|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.f, write))
(declare-const z@112@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@112@01 y@106@01))
(pop) ; 3
(declare-const $t@113@01 $FVF<f>)
(declare-fun inv@114@01 ($Ref) $Ref)
(declare-fun img@115@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@112@01 $Ref) (z2@112@01 $Ref)) (!
  (=>
    (and (= z1@112@01 y@106@01) (= z2@112@01 y@106@01) (= z1@112@01 z2@112@01))
    (= z1@112@01 z2@112@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@112@01 $Ref)) (!
  (=>
    (= z@112@01 y@106@01)
    (and (= (inv@114@01 z@112@01) z@112@01) (img@115@01 z@112@01)))
  :pattern ((inv@114@01 z@112@01))
  :pattern ((img@115@01 z@112@01))
  :qid |quant-u-46|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@115@01 r) (= (inv@114@01 r) y@106@01)) (= (inv@114@01 r) r))
  :pattern ((inv@114@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@112@01 $Ref)) (!
  (=> (= z@112@01 y@106@01) (not (= z@112@01 $Ref.null)))
  :pattern ((inv@114@01 z@112@01))
  :pattern ((img@115@01 z@112@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@112@01 z@107@01)
    (=
      (and (img@115@01 r) (= (inv@114@01 r) y@106@01))
      (and (img@110@01 r) (= (inv@109@01 r) x@105@01))))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@116@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@110@01 r) (= (inv@109@01 r) x@105@01))
    (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@108@01 r)))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@108@01 r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@115@01 r) (= (inv@114@01 r) y@106@01))
    (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@113@01 r)))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@113@01 r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@108@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@113@01 r) r))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@114@01 r) y@106@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) r))
  :pattern ((inv@114@01 r))
  :qid |quant-u-48|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == x ==> acc(z.g, write))
(declare-const z@117@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x
(assert (= z@117@01 x@105@01))
(pop) ; 3
(declare-const $t@118@01 $FVF<g>)
(declare-fun inv@119@01 ($Ref) $Ref)
(declare-fun img@120@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@117@01 $Ref) (z2@117@01 $Ref)) (!
  (=>
    (and (= z1@117@01 x@105@01) (= z2@117@01 x@105@01) (= z1@117@01 z2@117@01))
    (= z1@117@01 z2@117@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@117@01 $Ref)) (!
  (=>
    (= z@117@01 x@105@01)
    (and (= (inv@119@01 z@117@01) z@117@01) (img@120@01 z@117@01)))
  :pattern ((inv@119@01 z@117@01))
  :pattern ((img@120@01 z@117@01))
  :qid |quant-u-50|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@120@01 r) (= (inv@119@01 r) x@105@01)) (= (inv@119@01 r) r))
  :pattern ((inv@119@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@117@01 $Ref)) (!
  (=> (= z@117@01 x@105@01) (not (= z@117@01 $Ref.null)))
  :pattern ((inv@119@01 z@117@01))
  :pattern ((img@120@01 z@117@01))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@121@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@120@01 r) (= (inv@119@01 r) x@105@01))
    (= ($FVF.lookup_g (as sm@121@01  $FVF<g>) r) ($FVF.lookup_g $t@118@01 r)))
  :pattern (($FVF.lookup_g (as sm@121@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@118@01 r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g $t@118@01 r) r)
  :pattern (($FVF.lookup_g (as sm@121@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@119@01 r) x@105@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@121@01  $FVF<g>) r) r))
  :pattern ((inv@119@01 r))
  :qid |quant-u-51|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.g, write))
(declare-const z@122@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@122@01 y@106@01))
(pop) ; 3
(declare-const $t@123@01 $FVF<g>)
(declare-fun inv@124@01 ($Ref) $Ref)
(declare-fun img@125@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@122@01 $Ref) (z2@122@01 $Ref)) (!
  (=>
    (and (= z1@122@01 y@106@01) (= z2@122@01 y@106@01) (= z1@122@01 z2@122@01))
    (= z1@122@01 z2@122@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@122@01 $Ref)) (!
  (=>
    (= z@122@01 y@106@01)
    (and (= (inv@124@01 z@122@01) z@122@01) (img@125@01 z@122@01)))
  :pattern ((inv@124@01 z@122@01))
  :pattern ((img@125@01 z@122@01))
  :qid |quant-u-53|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@125@01 r) (= (inv@124@01 r) y@106@01)) (= (inv@124@01 r) r))
  :pattern ((inv@124@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@122@01 $Ref)) (!
  (=> (= z@122@01 y@106@01) (not (= z@122@01 $Ref.null)))
  :pattern ((inv@124@01 z@122@01))
  :pattern ((img@125@01 z@122@01))
  :qid |g-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@122@01 z@117@01)
    (=
      (and (img@125@01 r) (= (inv@124@01 r) y@106@01))
      (and (img@120@01 r) (= (inv@119@01 r) x@105@01))))
  
  :qid |quant-u-54|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@126@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@120@01 r) (= (inv@119@01 r) x@105@01))
    (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@118@01 r)))
  :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@118@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@125@01 r) (= (inv@124@01 r) y@106@01))
    (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@123@01 r)))
  :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@123@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@118@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@123@01 r) r))
  :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@124@01 r) y@106@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) r))
  :pattern ((inv@124@01 r))
  :qid |quant-u-55|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@127@01 $Snap)
(assert (= $t@127@01 ($Snap.combine ($Snap.first $t@127@01) ($Snap.second $t@127@01))))
(assert (= ($Snap.first $t@127@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@105@01 $Ref.null)))
(assert (= ($Snap.second $t@127@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@106@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { fun01(z), z.f, z.g }
;     z == x || z == y ==> z.f + z.g + z.f > 0)
(declare-const $t@128@01 $Snap)
(assert (= $t@128@01 $Snap.unit))
; [eval] (forall z: Ref :: { fun01(z), z.f, z.g } z == x || z == y ==> z.f + z.g + z.f > 0)
(declare-const z@129@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> z.f + z.g + z.f > 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 17 | z@129@01 == x@105@01 | live]
; [else-branch: 17 | z@129@01 != x@105@01 | live]
(push) ; 5
; [then-branch: 17 | z@129@01 == x@105@01]
(assert (= z@129@01 x@105@01))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | z@129@01 != x@105@01]
(assert (not (= z@129@01 x@105@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@129@01 x@105@01)) (= z@129@01 x@105@01)))
(push) ; 4
; [then-branch: 18 | z@129@01 == x@105@01 || z@129@01 == y@106@01 | live]
; [else-branch: 18 | !(z@129@01 == x@105@01 || z@129@01 == y@106@01) | live]
(push) ; 5
; [then-branch: 18 | z@129@01 == x@105@01 || z@129@01 == y@106@01]
(assert (or (= z@129@01 x@105@01) (= z@129@01 y@106@01)))
; [eval] z.f + z.g + z.f > 0
; [eval] z.f + z.g + z.f
; [eval] z.f + z.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@110@01 r) (= (inv@109@01 r) x@105@01))
      (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@108@01 r)))
    :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@108@01 r))
    :qid |qp.fvfValDef35|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@115@01 r) (= (inv@114@01 r) y@106@01))
      (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@113@01 r)))
    :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@113@01 r))
    :qid |qp.fvfValDef36|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@108@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@113@01 r) r))
    :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef37|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@116@01  $FVF<f>) z@129@01) z@129@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@110@01 z@129@01) (= (inv@109@01 z@129@01) x@105@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@115@01 z@129@01) (= (inv@114@01 z@129@01) y@106@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@120@01 r) (= (inv@119@01 r) x@105@01))
      (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@118@01 r)))
    :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@118@01 r))
    :qid |qp.fvfValDef40|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@125@01 r) (= (inv@124@01 r) y@106@01))
      (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@123@01 r)))
    :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@123@01 r))
    :qid |qp.fvfValDef41|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@118@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@123@01 r) r))
    :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef42|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@126@01  $FVF<g>) z@129@01) z@129@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@120@01 z@129@01) (= (inv@119@01 z@129@01) x@105@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@125@01 z@129@01) (= (inv@124@01 z@129@01) y@106@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@110@01 r) (= (inv@109@01 r) x@105@01))
      (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@108@01 r)))
    :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@108@01 r))
    :qid |qp.fvfValDef35|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@115@01 r) (= (inv@114@01 r) y@106@01))
      (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@113@01 r)))
    :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@113@01 r))
    :qid |qp.fvfValDef36|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@108@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@113@01 r) r))
    :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef37|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@110@01 z@129@01) (= (inv@109@01 z@129@01) x@105@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@115@01 z@129@01) (= (inv@114@01 z@129@01) y@106@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(z@129@01 == x@105@01 || z@129@01 == y@106@01)]
(assert (not (or (= z@129@01 x@105@01) (= z@129@01 y@106@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@110@01 r) (= (inv@109@01 r) x@105@01))
    (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@108@01 r)))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@108@01 r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@115@01 r) (= (inv@114@01 r) y@106@01))
    (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@113@01 r)))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@113@01 r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@108@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@113@01 r) r))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@120@01 r) (= (inv@119@01 r) x@105@01))
    (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@118@01 r)))
  :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@118@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@125@01 r) (= (inv@124@01 r) y@106@01))
    (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@123@01 r)))
  :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@123@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@118@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@123@01 r) r))
  :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef42|)))
(assert (=>
  (or (= z@129@01 x@105@01) (= z@129@01 y@106@01))
  (and
    (or (= z@129@01 x@105@01) (= z@129@01 y@106@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@116@01  $FVF<f>) z@129@01) z@129@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@126@01  $FVF<g>) z@129@01) z@129@01))))
; Joined path conditions
(assert (or
  (not (or (= z@129@01 x@105@01) (= z@129@01 y@106@01)))
  (or (= z@129@01 x@105@01) (= z@129@01 y@106@01))))
; [eval] fun01(z)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@110@01 r) (= (inv@109@01 r) x@105@01))
    (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@108@01 r)))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@108@01 r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@115@01 r) (= (inv@114@01 r) y@106@01))
    (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@113@01 r)))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@113@01 r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@108@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@113@01 r) r))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@120@01 r) (= (inv@119@01 r) x@105@01))
    (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@118@01 r)))
  :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@118@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@125@01 r) (= (inv@124@01 r) y@106@01))
    (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@123@01 r)))
  :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@123@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@118@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@123@01 r) r))
  :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef42|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@129@01 $Ref)) (!
  (and
    (or (not (= z@129@01 x@105@01)) (= z@129@01 x@105@01))
    (=>
      (or (= z@129@01 x@105@01) (= z@129@01 y@106@01))
      (and
        (or (= z@129@01 x@105@01) (= z@129@01 y@106@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@116@01  $FVF<f>) z@129@01) z@129@01)
        ($FVF.loc_g ($FVF.lookup_g (as sm@126@01  $FVF<g>) z@129@01) z@129@01)))
    (or
      (not (or (= z@129@01 x@105@01) (= z@129@01 y@106@01)))
      (or (= z@129@01 x@105@01) (= z@129@01 y@106@01))))
  :pattern ((fun01<Bool> z@129@01) ($FVF.loc_f ($FVF.lookup_f (as sm@116@01  $FVF<f>) z@129@01) z@129@01) ($FVF.loc_g ($FVF.lookup_g (as sm@126@01  $FVF<g>) z@129@01) z@129@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@71@10@71@88-aux|)))
(assert (forall ((z@129@01 $Ref)) (!
  (=>
    (or (= z@129@01 x@105@01) (= z@129@01 y@106@01))
    (>
      (+
        (+
          ($FVF.lookup_f (as sm@116@01  $FVF<f>) z@129@01)
          ($FVF.lookup_g (as sm@126@01  $FVF<g>) z@129@01))
        ($FVF.lookup_f (as sm@116@01  $FVF<f>) z@129@01))
      0))
  :pattern ((fun01<Bool> z@129@01) ($FVF.loc_f ($FVF.lookup_f (as sm@116@01  $FVF<f>) z@129@01) z@129@01) ($FVF.loc_g ($FVF.lookup_g (as sm@126@01  $FVF<g>) z@129@01) z@129@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@71@10@71@88|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun01(x)
(declare-const $t@130@01 $Snap)
(assert (= $t@130@01 $Snap.unit))
; [eval] fun01(x)
(assert (fun01<Bool> x@105@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert 2 * x.f + x.g > 0
; [eval] 2 * x.f + x.g > 0
; [eval] 2 * x.f + x.g
; [eval] 2 * x.f
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@110@01 r) (= (inv@109@01 r) x@105@01))
      (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@108@01 r)))
    :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@108@01 r))
    :qid |qp.fvfValDef35|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@115@01 r) (= (inv@114@01 r) y@106@01))
      (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r) ($FVF.lookup_f $t@113@01 r)))
    :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@113@01 r))
    :qid |qp.fvfValDef36|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@108@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@113@01 r) r))
    :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef37|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@116@01  $FVF<f>) x@105@01) x@105@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@110@01 x@105@01) (= (inv@109@01 x@105@01) x@105@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@115@01 x@105@01) (= (inv@114@01 x@105@01) y@106@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@120@01 r) (= (inv@119@01 r) x@105@01))
      (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@118@01 r)))
    :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@118@01 r))
    :qid |qp.fvfValDef40|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@125@01 r) (= (inv@124@01 r) y@106@01))
      (= ($FVF.lookup_g (as sm@126@01  $FVF<g>) r) ($FVF.lookup_g $t@123@01 r)))
    :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@123@01 r))
    :qid |qp.fvfValDef41|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@118@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@123@01 r) r))
    :pattern (($FVF.lookup_g (as sm@126@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef42|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@126@01  $FVF<g>) x@105@01) x@105@01))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@120@01 x@105@01) (= (inv@119@01 x@105@01) x@105@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@125@01 x@105@01) (= (inv@124@01 x@105@01) y@106@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>
  (+
    (* 2 ($FVF.lookup_f (as sm@116@01  $FVF<f>) x@105@01))
    ($FVF.lookup_g (as sm@126@01  $FVF<g>) x@105@01))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>
  (+
    (* 2 ($FVF.lookup_f (as sm@116@01  $FVF<f>) x@105@01))
    ($FVF.lookup_g (as sm@126@01  $FVF<g>) x@105@01))
  0))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@131@01 $Ref)
(declare-const y@132@01 $Ref)
(declare-const x@133@01 $Ref)
(declare-const y@134@01 $Ref)
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
; inhale (forall z: Ref ::z == x || z == y ==> acc(z.f, write))
(declare-const z@135@01 $Ref)
(push) ; 3
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 19 | z@135@01 == x@133@01 | live]
; [else-branch: 19 | z@135@01 != x@133@01 | live]
(push) ; 5
; [then-branch: 19 | z@135@01 == x@133@01]
(assert (= z@135@01 x@133@01))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | z@135@01 != x@133@01]
(assert (not (= z@135@01 x@133@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@135@01 x@133@01)) (= z@135@01 x@133@01)))
(assert (or (= z@135@01 x@133@01) (= z@135@01 y@134@01)))
(pop) ; 3
(declare-const $t@136@01 $FVF<f>)
(declare-fun inv@137@01 ($Ref) $Ref)
(declare-fun img@138@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@135@01 $Ref)) (!
  (=>
    (or (= z@135@01 x@133@01) (= z@135@01 y@134@01))
    (or (not (= z@135@01 x@133@01)) (= z@135@01 x@133@01)))
  :pattern ((inv@137@01 z@135@01))
  :pattern ((img@138@01 z@135@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@135@01 $Ref) (z2@135@01 $Ref)) (!
  (=>
    (and
      (or (= z1@135@01 x@133@01) (= z1@135@01 y@134@01))
      (or (= z2@135@01 x@133@01) (= z2@135@01 y@134@01))
      (= z1@135@01 z2@135@01))
    (= z1@135@01 z2@135@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@135@01 $Ref)) (!
  (=>
    (or (= z@135@01 x@133@01) (= z@135@01 y@134@01))
    (and (= (inv@137@01 z@135@01) z@135@01) (img@138@01 z@135@01)))
  :pattern ((inv@137@01 z@135@01))
  :pattern ((img@138@01 z@135@01))
  :qid |quant-u-57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@138@01 r)
      (or (= (inv@137@01 r) x@133@01) (= (inv@137@01 r) y@134@01)))
    (= (inv@137@01 r) r))
  :pattern ((inv@137@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@135@01 $Ref)) (!
  (=>
    (or (= z@135@01 x@133@01) (= z@135@01 y@134@01))
    (not (= z@135@01 $Ref.null)))
  :pattern ((inv@137@01 z@135@01))
  :pattern ((img@138@01 z@135@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@139@01 $Snap)
(assert (= $t@139@01 ($Snap.combine ($Snap.first $t@139@01) ($Snap.second $t@139@01))))
(assert (= ($Snap.first $t@139@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@133@01 $Ref.null)))
(assert (= ($Snap.second $t@139@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@134@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { fun02(z.f) }
;     z == x || z == y ==> fun02(z.f) == 0)
(declare-const $t@140@01 $Snap)
(assert (= $t@140@01 $Snap.unit))
; [eval] (forall z: Ref :: { fun02(z.f) } z == x || z == y ==> fun02(z.f) == 0)
(declare-const z@141@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> fun02(z.f) == 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 20 | z@141@01 == x@133@01 | live]
; [else-branch: 20 | z@141@01 != x@133@01 | live]
(push) ; 5
; [then-branch: 20 | z@141@01 == x@133@01]
(assert (= z@141@01 x@133@01))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | z@141@01 != x@133@01]
(assert (not (= z@141@01 x@133@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@141@01 x@133@01)) (= z@141@01 x@133@01)))
(push) ; 4
; [then-branch: 21 | z@141@01 == x@133@01 || z@141@01 == y@134@01 | live]
; [else-branch: 21 | !(z@141@01 == x@133@01 || z@141@01 == y@134@01) | live]
(push) ; 5
; [then-branch: 21 | z@141@01 == x@133@01 || z@141@01 == y@134@01]
(assert (or (= z@141@01 x@133@01) (= z@141@01 y@134@01)))
; [eval] fun02(z.f) == 0
; [eval] fun02(z.f)
(push) ; 6
(assert (not (and
  (img@138@01 z@141@01)
  (or (= (inv@137@01 z@141@01) x@133@01) (= (inv@137@01 z@141@01) y@134@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 21 | !(z@141@01 == x@133@01 || z@141@01 == y@134@01)]
(assert (not (or (= z@141@01 x@133@01) (= z@141@01 y@134@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (or (= z@141@01 x@133@01) (= z@141@01 y@134@01)))
  (or (= z@141@01 x@133@01) (= z@141@01 y@134@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@141@01 $Ref)) (!
  (and
    (or (not (= z@141@01 x@133@01)) (= z@141@01 x@133@01))
    (or
      (not (or (= z@141@01 x@133@01) (= z@141@01 y@134@01)))
      (or (= z@141@01 x@133@01) (= z@141@01 y@134@01))))
  :pattern ((fun02<Int> ($FVF.lookup_f $t@136@01 z@141@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@80@10@80@76-aux|)))
(assert (forall ((z@141@01 $Ref)) (!
  (=>
    (or (= z@141@01 x@133@01) (= z@141@01 y@134@01))
    (= (fun02<Int> ($FVF.lookup_f $t@136@01 z@141@01)) 0))
  :pattern ((fun02<Int> ($FVF.lookup_f $t@136@01 z@141@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@80@10@80@76|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert fun02(x.f) >= 0
; [eval] fun02(x.f) >= 0
; [eval] fun02(x.f)
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@138@01 x@133@01)
  (or (= (inv@137@01 x@133@01) x@133@01) (= (inv@137@01 x@133@01) y@134@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>= (fun02<Int> ($FVF.lookup_f $t@136@01 x@133@01)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= (fun02<Int> ($FVF.lookup_f $t@136@01 x@133@01)) 0))
(pop) ; 2
(pop) ; 1
; ---------- test04b ----------
(declare-const x@142@01 $Ref)
(declare-const y@143@01 $Ref)
(declare-const x@144@01 $Ref)
(declare-const y@145@01 $Ref)
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
; inhale (forall z: Ref ::z == x || z == y ==> acc(z.f, write))
(declare-const z@146@01 $Ref)
(push) ; 3
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 22 | z@146@01 == x@144@01 | live]
; [else-branch: 22 | z@146@01 != x@144@01 | live]
(push) ; 5
; [then-branch: 22 | z@146@01 == x@144@01]
(assert (= z@146@01 x@144@01))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | z@146@01 != x@144@01]
(assert (not (= z@146@01 x@144@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@146@01 x@144@01)) (= z@146@01 x@144@01)))
(assert (or (= z@146@01 x@144@01) (= z@146@01 y@145@01)))
(pop) ; 3
(declare-const $t@147@01 $FVF<f>)
(declare-fun inv@148@01 ($Ref) $Ref)
(declare-fun img@149@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@146@01 $Ref)) (!
  (=>
    (or (= z@146@01 x@144@01) (= z@146@01 y@145@01))
    (or (not (= z@146@01 x@144@01)) (= z@146@01 x@144@01)))
  :pattern ((inv@148@01 z@146@01))
  :pattern ((img@149@01 z@146@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@146@01 $Ref) (z2@146@01 $Ref)) (!
  (=>
    (and
      (or (= z1@146@01 x@144@01) (= z1@146@01 y@145@01))
      (or (= z2@146@01 x@144@01) (= z2@146@01 y@145@01))
      (= z1@146@01 z2@146@01))
    (= z1@146@01 z2@146@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@146@01 $Ref)) (!
  (=>
    (or (= z@146@01 x@144@01) (= z@146@01 y@145@01))
    (and (= (inv@148@01 z@146@01) z@146@01) (img@149@01 z@146@01)))
  :pattern ((inv@148@01 z@146@01))
  :pattern ((img@149@01 z@146@01))
  :qid |quant-u-59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@149@01 r)
      (or (= (inv@148@01 r) x@144@01) (= (inv@148@01 r) y@145@01)))
    (= (inv@148@01 r) r))
  :pattern ((inv@148@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@146@01 $Ref)) (!
  (=>
    (or (= z@146@01 x@144@01) (= z@146@01 y@145@01))
    (not (= z@146@01 $Ref.null)))
  :pattern ((inv@148@01 z@146@01))
  :pattern ((img@149@01 z@146@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@150@01 $Snap)
(assert (= $t@150@01 ($Snap.combine ($Snap.first $t@150@01) ($Snap.second $t@150@01))))
(assert (= ($Snap.first $t@150@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@144@01 $Ref.null)))
(assert (= ($Snap.second $t@150@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@145@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref :: { inv(z.f) } z == x || z == y ==> inv(z.f))
(declare-const $t@151@01 $Snap)
(assert (= $t@151@01 $Snap.unit))
; [eval] (forall z: Ref :: { inv(z.f) } z == x || z == y ==> inv(z.f))
(declare-const z@152@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> inv(z.f)
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 23 | z@152@01 == x@144@01 | live]
; [else-branch: 23 | z@152@01 != x@144@01 | live]
(push) ; 5
; [then-branch: 23 | z@152@01 == x@144@01]
(assert (= z@152@01 x@144@01))
(pop) ; 5
(push) ; 5
; [else-branch: 23 | z@152@01 != x@144@01]
(assert (not (= z@152@01 x@144@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@152@01 x@144@01)) (= z@152@01 x@144@01)))
(push) ; 4
; [then-branch: 24 | z@152@01 == x@144@01 || z@152@01 == y@145@01 | live]
; [else-branch: 24 | !(z@152@01 == x@144@01 || z@152@01 == y@145@01) | live]
(push) ; 5
; [then-branch: 24 | z@152@01 == x@144@01 || z@152@01 == y@145@01]
(assert (or (= z@152@01 x@144@01) (= z@152@01 y@145@01)))
; [eval] inv(z.f)
(push) ; 6
(assert (not (and
  (img@149@01 z@152@01)
  (or (= (inv@148@01 z@152@01) x@144@01) (= (inv@148@01 z@152@01) y@145@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (inv%precondition $Snap.unit ($FVF.lookup_f $t@147@01 z@152@01)))
(pop) ; 6
; Joined path conditions
(assert (inv%precondition $Snap.unit ($FVF.lookup_f $t@147@01 z@152@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | !(z@152@01 == x@144@01 || z@152@01 == y@145@01)]
(assert (not (or (= z@152@01 x@144@01) (= z@152@01 y@145@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (or (= z@152@01 x@144@01) (= z@152@01 y@145@01))
  (and
    (or (= z@152@01 x@144@01) (= z@152@01 y@145@01))
    (inv%precondition $Snap.unit ($FVF.lookup_f $t@147@01 z@152@01)))))
; Joined path conditions
(assert (or
  (not (or (= z@152@01 x@144@01) (= z@152@01 y@145@01)))
  (or (= z@152@01 x@144@01) (= z@152@01 y@145@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@152@01 $Ref)) (!
  (and
    (or (not (= z@152@01 x@144@01)) (= z@152@01 x@144@01))
    (=>
      (or (= z@152@01 x@144@01) (= z@152@01 y@145@01))
      (and
        (or (= z@152@01 x@144@01) (= z@152@01 y@145@01))
        (inv%precondition $Snap.unit ($FVF.lookup_f $t@147@01 z@152@01))))
    (or
      (not (or (= z@152@01 x@144@01) (= z@152@01 y@145@01)))
      (or (= z@152@01 x@144@01) (= z@152@01 y@145@01))))
  :pattern ((inv%limited $Snap.unit ($FVF.lookup_f $t@147@01 z@152@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@90@10@90@67-aux|)))
(assert (forall ((z@152@01 $Ref)) (!
  (=>
    (or (= z@152@01 x@144@01) (= z@152@01 y@145@01))
    (inv $Snap.unit ($FVF.lookup_f $t@147@01 z@152@01)))
  :pattern ((inv%limited $Snap.unit ($FVF.lookup_f $t@147@01 z@152@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@90@10@90@67|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x.f == 0
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@149@01 x@144@01)
  (or (= (inv@148@01 x@144@01) x@144@01) (= (inv@148@01 x@144@01) y@145@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_f $t@147@01 x@144@01) 0)))
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
(declare-const sm@153@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@149@01 r)
      (or (= (inv@148@01 r) x@144@01) (= (inv@148@01 r) y@145@01)))
    (= ($FVF.lookup_f (as sm@153@01  $FVF<f>) r) ($FVF.lookup_f $t@147@01 r)))
  :pattern (($FVF.lookup_f (as sm@153@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@147@01 r))
  :qid |qp.fvfValDef43|)))
(declare-const pm@154@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@154@01  $FPM) r)
    (ite
      (and
        (img@149@01 r)
        (or (= (inv@148@01 r) x@144@01) (= (inv@148@01 r) y@145@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@154@01  $FPM) r))
  :qid |qp.resPrmSumDef44|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@154@01  $FPM) r) $Perm.Write)
  :pattern ((inv@148@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@149@01 x@144@01)
  (or (= (inv@148@01 x@144@01) x@144@01) (= (inv@148@01 x@144@01) y@145@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_f (as sm@153@01  $FVF<f>) x@144@01) 0)))
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
(declare-const sm@155@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@149@01 r)
      (or (= (inv@148@01 r) x@144@01) (= (inv@148@01 r) y@145@01)))
    (= ($FVF.lookup_f (as sm@155@01  $FVF<f>) r) ($FVF.lookup_f $t@147@01 r)))
  :pattern (($FVF.lookup_f (as sm@155@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@147@01 r))
  :qid |qp.fvfValDef45|)))
(declare-const pm@156@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@156@01  $FPM) r)
    (ite
      (and
        (img@149@01 r)
        (or (= (inv@148@01 r) x@144@01) (= (inv@148@01 r) y@145@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@156@01  $FPM) r))
  :qid |qp.resPrmSumDef46|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@156@01  $FPM) r) $Perm.Write)
  :pattern ((inv@148@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@149@01 x@144@01)
  (or (= (inv@148@01 x@144@01) x@144@01) (= (inv@148@01 x@144@01) y@145@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_f (as sm@155@01  $FVF<f>) x@144@01) 0)))
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
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@149@01 x@144@01)
  (or (= (inv@148@01 x@144@01) x@144@01) (= (inv@148@01 x@144@01) y@145@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_f (as sm@155@01  $FVF<f>) x@144@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04c ----------
(declare-const x@157@01 $Ref)
(declare-const y@158@01 $Ref)
(declare-const x@159@01 $Ref)
(declare-const y@160@01 $Ref)
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
; inhale (forall z: Ref ::z == x || z == y ==> acc(z.f, write))
(declare-const z@161@01 $Ref)
(push) ; 3
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 25 | z@161@01 == x@159@01 | live]
; [else-branch: 25 | z@161@01 != x@159@01 | live]
(push) ; 5
; [then-branch: 25 | z@161@01 == x@159@01]
(assert (= z@161@01 x@159@01))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | z@161@01 != x@159@01]
(assert (not (= z@161@01 x@159@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@161@01 x@159@01)) (= z@161@01 x@159@01)))
(assert (or (= z@161@01 x@159@01) (= z@161@01 y@160@01)))
(pop) ; 3
(declare-const $t@162@01 $FVF<f>)
(declare-fun inv@163@01 ($Ref) $Ref)
(declare-fun img@164@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@161@01 $Ref)) (!
  (=>
    (or (= z@161@01 x@159@01) (= z@161@01 y@160@01))
    (or (not (= z@161@01 x@159@01)) (= z@161@01 x@159@01)))
  :pattern ((inv@163@01 z@161@01))
  :pattern ((img@164@01 z@161@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@161@01 $Ref) (z2@161@01 $Ref)) (!
  (=>
    (and
      (or (= z1@161@01 x@159@01) (= z1@161@01 y@160@01))
      (or (= z2@161@01 x@159@01) (= z2@161@01 y@160@01))
      (= z1@161@01 z2@161@01))
    (= z1@161@01 z2@161@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@161@01 $Ref)) (!
  (=>
    (or (= z@161@01 x@159@01) (= z@161@01 y@160@01))
    (and (= (inv@163@01 z@161@01) z@161@01) (img@164@01 z@161@01)))
  :pattern ((inv@163@01 z@161@01))
  :pattern ((img@164@01 z@161@01))
  :qid |quant-u-61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@164@01 r)
      (or (= (inv@163@01 r) x@159@01) (= (inv@163@01 r) y@160@01)))
    (= (inv@163@01 r) r))
  :pattern ((inv@163@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@161@01 $Ref)) (!
  (=>
    (or (= z@161@01 x@159@01) (= z@161@01 y@160@01))
    (not (= z@161@01 $Ref.null)))
  :pattern ((inv@163@01 z@161@01))
  :pattern ((img@164@01 z@161@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@165@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@164@01 r)
      (or (= (inv@163@01 r) x@159@01) (= (inv@163@01 r) y@160@01)))
    (= ($FVF.lookup_f (as sm@165@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@162@01 r) r)
  :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (or (= (inv@163@01 r) x@159@01) (= (inv@163@01 r) y@160@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@165@01  $FVF<f>) r) r))
  :pattern ((inv@163@01 r))
  :qid |quant-u-62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@166@01 $Snap)
(assert (= $t@166@01 ($Snap.combine ($Snap.first $t@166@01) ($Snap.second $t@166@01))))
(assert (= ($Snap.first $t@166@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@159@01 $Ref.null)))
(assert (= ($Snap.second $t@166@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@160@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref :: { z.f } z == x || z == y ==> inv(z.f))
(declare-const $t@167@01 $Snap)
(assert (= $t@167@01 $Snap.unit))
; [eval] (forall z: Ref :: { z.f } z == x || z == y ==> inv(z.f))
(declare-const z@168@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> inv(z.f)
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 26 | z@168@01 == x@159@01 | live]
; [else-branch: 26 | z@168@01 != x@159@01 | live]
(push) ; 5
; [then-branch: 26 | z@168@01 == x@159@01]
(assert (= z@168@01 x@159@01))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | z@168@01 != x@159@01]
(assert (not (= z@168@01 x@159@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@168@01 x@159@01)) (= z@168@01 x@159@01)))
(push) ; 4
; [then-branch: 27 | z@168@01 == x@159@01 || z@168@01 == y@160@01 | live]
; [else-branch: 27 | !(z@168@01 == x@159@01 || z@168@01 == y@160@01) | live]
(push) ; 5
; [then-branch: 27 | z@168@01 == x@159@01 || z@168@01 == y@160@01]
(assert (or (= z@168@01 x@159@01) (= z@168@01 y@160@01)))
; [eval] inv(z.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@164@01 r)
        (or (= (inv@163@01 r) x@159@01) (= (inv@163@01 r) y@160@01)))
      (= ($FVF.lookup_f (as sm@165@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
    :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@162@01 r))
    :qid |qp.fvfValDef47|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@162@01 r) r)
    :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef48|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01) z@168@01))
(push) ; 6
(assert (not (and
  (img@164@01 z@168@01)
  (or (= (inv@163@01 z@168@01) x@159@01) (= (inv@163@01 z@168@01) y@160@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (inv%precondition $Snap.unit ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01)))
(pop) ; 6
; Joined path conditions
(assert (inv%precondition $Snap.unit ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | !(z@168@01 == x@159@01 || z@168@01 == y@160@01)]
(assert (not (or (= z@168@01 x@159@01) (= z@168@01 y@160@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@164@01 r)
      (or (= (inv@163@01 r) x@159@01) (= (inv@163@01 r) y@160@01)))
    (= ($FVF.lookup_f (as sm@165@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@162@01 r) r)
  :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (=>
  (or (= z@168@01 x@159@01) (= z@168@01 y@160@01))
  (and
    (or (= z@168@01 x@159@01) (= z@168@01 y@160@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01) z@168@01)
    (inv%precondition $Snap.unit ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01)))))
; Joined path conditions
(assert (or
  (not (or (= z@168@01 x@159@01) (= z@168@01 y@160@01)))
  (or (= z@168@01 x@159@01) (= z@168@01 y@160@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@164@01 r)
      (or (= (inv@163@01 r) x@159@01) (= (inv@163@01 r) y@160@01)))
    (= ($FVF.lookup_f (as sm@165@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
  :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@162@01 r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@162@01 r) r)
  :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef48|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@168@01 $Ref)) (!
  (and
    (or (not (= z@168@01 x@159@01)) (= z@168@01 x@159@01))
    (=>
      (or (= z@168@01 x@159@01) (= z@168@01 y@160@01))
      (and
        (or (= z@168@01 x@159@01) (= z@168@01 y@160@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01) z@168@01)
        (inv%precondition $Snap.unit ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01))))
    (or
      (not (or (= z@168@01 x@159@01) (= z@168@01 y@160@01)))
      (or (= z@168@01 x@159@01) (= z@168@01 y@160@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01) z@168@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@99@10@99@62-aux|)))
(assert (forall ((z@168@01 $Ref)) (!
  (=>
    (or (= z@168@01 x@159@01) (= z@168@01 y@160@01))
    (inv $Snap.unit ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@165@01  $FVF<f>) z@168@01) z@168@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@99@10@99@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x.f == 0
; [eval] x.f == 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@164@01 r)
        (or (= (inv@163@01 r) x@159@01) (= (inv@163@01 r) y@160@01)))
      (= ($FVF.lookup_f (as sm@165@01  $FVF<f>) r) ($FVF.lookup_f $t@162@01 r)))
    :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@162@01 r))
    :qid |qp.fvfValDef47|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@162@01 r) r)
    :pattern (($FVF.lookup_f (as sm@165@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef48|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@165@01  $FVF<f>) x@159@01) x@159@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@164@01 x@159@01)
  (or (= (inv@163@01 x@159@01) x@159@01) (= (inv@163@01 x@159@01) y@160@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_f (as sm@165@01  $FVF<f>) x@159@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@165@01  $FVF<f>) x@159@01) 0))
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const x@169@01 $Ref)
(declare-const y@170@01 $Ref)
(declare-const x@171@01 $Ref)
(declare-const y@172@01 $Ref)
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
; inhale (forall z: Ref ::z == x ==> acc(z.f, write))
(declare-const z@173@01 $Ref)
(push) ; 3
; [eval] z == x
(assert (= z@173@01 x@171@01))
(pop) ; 3
(declare-const $t@174@01 $FVF<f>)
(declare-fun inv@175@01 ($Ref) $Ref)
(declare-fun img@176@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@173@01 $Ref) (z2@173@01 $Ref)) (!
  (=>
    (and (= z1@173@01 x@171@01) (= z2@173@01 x@171@01) (= z1@173@01 z2@173@01))
    (= z1@173@01 z2@173@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@173@01 $Ref)) (!
  (=>
    (= z@173@01 x@171@01)
    (and (= (inv@175@01 z@173@01) z@173@01) (img@176@01 z@173@01)))
  :pattern ((inv@175@01 z@173@01))
  :pattern ((img@176@01 z@173@01))
  :qid |quant-u-64|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@176@01 r) (= (inv@175@01 r) x@171@01)) (= (inv@175@01 r) r))
  :pattern ((inv@175@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@173@01 $Ref)) (!
  (=> (= z@173@01 x@171@01) (not (= z@173@01 $Ref.null)))
  :pattern ((inv@175@01 z@173@01))
  :pattern ((img@176@01 z@173@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@177@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@176@01 r) (= (inv@175@01 r) x@171@01))
    (= ($FVF.lookup_f (as sm@177@01  $FVF<f>) r) ($FVF.lookup_f $t@174@01 r)))
  :pattern (($FVF.lookup_f (as sm@177@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@174@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@174@01 r) r)
  :pattern (($FVF.lookup_f (as sm@177@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@175@01 r) x@171@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@177@01  $FVF<f>) r) r))
  :pattern ((inv@175@01 r))
  :qid |quant-u-65|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.f, write))
(declare-const z@178@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@178@01 y@172@01))
(pop) ; 3
(declare-const $t@179@01 $FVF<f>)
(declare-fun inv@180@01 ($Ref) $Ref)
(declare-fun img@181@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@178@01 $Ref) (z2@178@01 $Ref)) (!
  (=>
    (and (= z1@178@01 y@172@01) (= z2@178@01 y@172@01) (= z1@178@01 z2@178@01))
    (= z1@178@01 z2@178@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@178@01 $Ref)) (!
  (=>
    (= z@178@01 y@172@01)
    (and (= (inv@180@01 z@178@01) z@178@01) (img@181@01 z@178@01)))
  :pattern ((inv@180@01 z@178@01))
  :pattern ((img@181@01 z@178@01))
  :qid |quant-u-67|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@181@01 r) (= (inv@180@01 r) y@172@01)) (= (inv@180@01 r) r))
  :pattern ((inv@180@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@178@01 $Ref)) (!
  (=> (= z@178@01 y@172@01) (not (= z@178@01 $Ref.null)))
  :pattern ((inv@180@01 z@178@01))
  :pattern ((img@181@01 z@178@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@178@01 z@173@01)
    (=
      (and (img@181@01 r) (= (inv@180@01 r) y@172@01))
      (and (img@176@01 r) (= (inv@175@01 r) x@171@01))))
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@182@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@176@01 r) (= (inv@175@01 r) x@171@01))
    (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@174@01 r)))
  :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@174@01 r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@181@01 r) (= (inv@180@01 r) y@172@01))
    (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@179@01 r)))
  :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@179@01 r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@174@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@179@01 r) r))
  :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@180@01 r) y@172@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) r))
  :pattern ((inv@180@01 r))
  :qid |quant-u-69|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == x ==> acc(z.g, write))
(declare-const z@183@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x
(assert (= z@183@01 x@171@01))
(pop) ; 3
(declare-const $t@184@01 $FVF<g>)
(declare-fun inv@185@01 ($Ref) $Ref)
(declare-fun img@186@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@183@01 $Ref) (z2@183@01 $Ref)) (!
  (=>
    (and (= z1@183@01 x@171@01) (= z2@183@01 x@171@01) (= z1@183@01 z2@183@01))
    (= z1@183@01 z2@183@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@183@01 $Ref)) (!
  (=>
    (= z@183@01 x@171@01)
    (and (= (inv@185@01 z@183@01) z@183@01) (img@186@01 z@183@01)))
  :pattern ((inv@185@01 z@183@01))
  :pattern ((img@186@01 z@183@01))
  :qid |quant-u-71|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@186@01 r) (= (inv@185@01 r) x@171@01)) (= (inv@185@01 r) r))
  :pattern ((inv@185@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@183@01 $Ref)) (!
  (=> (= z@183@01 x@171@01) (not (= z@183@01 $Ref.null)))
  :pattern ((inv@185@01 z@183@01))
  :pattern ((img@186@01 z@183@01))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@187@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@186@01 r) (= (inv@185@01 r) x@171@01))
    (= ($FVF.lookup_g (as sm@187@01  $FVF<g>) r) ($FVF.lookup_g $t@184@01 r)))
  :pattern (($FVF.lookup_g (as sm@187@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@184@01 r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g $t@184@01 r) r)
  :pattern (($FVF.lookup_g (as sm@187@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@185@01 r) x@171@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@187@01  $FVF<g>) r) r))
  :pattern ((inv@185@01 r))
  :qid |quant-u-72|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.g, write))
(declare-const z@188@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@188@01 y@172@01))
(pop) ; 3
(declare-const $t@189@01 $FVF<g>)
(declare-fun inv@190@01 ($Ref) $Ref)
(declare-fun img@191@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@188@01 $Ref) (z2@188@01 $Ref)) (!
  (=>
    (and (= z1@188@01 y@172@01) (= z2@188@01 y@172@01) (= z1@188@01 z2@188@01))
    (= z1@188@01 z2@188@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@188@01 $Ref)) (!
  (=>
    (= z@188@01 y@172@01)
    (and (= (inv@190@01 z@188@01) z@188@01) (img@191@01 z@188@01)))
  :pattern ((inv@190@01 z@188@01))
  :pattern ((img@191@01 z@188@01))
  :qid |quant-u-74|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@191@01 r) (= (inv@190@01 r) y@172@01)) (= (inv@190@01 r) r))
  :pattern ((inv@190@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@188@01 $Ref)) (!
  (=> (= z@188@01 y@172@01) (not (= z@188@01 $Ref.null)))
  :pattern ((inv@190@01 z@188@01))
  :pattern ((img@191@01 z@188@01))
  :qid |g-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@188@01 z@183@01)
    (=
      (and (img@191@01 r) (= (inv@190@01 r) y@172@01))
      (and (img@186@01 r) (= (inv@185@01 r) x@171@01))))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@192@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@186@01 r) (= (inv@185@01 r) x@171@01))
    (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@184@01 r)))
  :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@184@01 r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@191@01 r) (= (inv@190@01 r) y@172@01))
    (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@189@01 r)))
  :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@189@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@184@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@189@01 r) r))
  :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@190@01 r) y@172@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) r))
  :pattern ((inv@190@01 r))
  :qid |quant-u-76|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@193@01 $Snap)
(assert (= $t@193@01 ($Snap.combine ($Snap.first $t@193@01) ($Snap.second $t@193@01))))
(assert (= ($Snap.first $t@193@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@171@01 $Ref.null)))
(assert (= ($Snap.second $t@193@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@172@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { fun01(z), z.f, z.g }
;     z == x || z == y ==> z.f + z.g + z.f > 0)
(declare-const $t@194@01 $Snap)
(assert (= $t@194@01 $Snap.unit))
; [eval] (forall z: Ref :: { fun01(z), z.f, z.g } z == x || z == y ==> z.f + z.g + z.f > 0)
(declare-const z@195@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> z.f + z.g + z.f > 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 28 | z@195@01 == x@171@01 | live]
; [else-branch: 28 | z@195@01 != x@171@01 | live]
(push) ; 5
; [then-branch: 28 | z@195@01 == x@171@01]
(assert (= z@195@01 x@171@01))
(pop) ; 5
(push) ; 5
; [else-branch: 28 | z@195@01 != x@171@01]
(assert (not (= z@195@01 x@171@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@195@01 x@171@01)) (= z@195@01 x@171@01)))
(push) ; 4
; [then-branch: 29 | z@195@01 == x@171@01 || z@195@01 == y@172@01 | live]
; [else-branch: 29 | !(z@195@01 == x@171@01 || z@195@01 == y@172@01) | live]
(push) ; 5
; [then-branch: 29 | z@195@01 == x@171@01 || z@195@01 == y@172@01]
(assert (or (= z@195@01 x@171@01) (= z@195@01 y@172@01)))
; [eval] z.f + z.g + z.f > 0
; [eval] z.f + z.g + z.f
; [eval] z.f + z.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@176@01 r) (= (inv@175@01 r) x@171@01))
      (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@174@01 r)))
    :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@174@01 r))
    :qid |qp.fvfValDef51|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@181@01 r) (= (inv@180@01 r) y@172@01))
      (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@179@01 r)))
    :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@179@01 r))
    :qid |qp.fvfValDef52|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@174@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@179@01 r) r))
    :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef53|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@182@01  $FVF<f>) z@195@01) z@195@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@176@01 z@195@01) (= (inv@175@01 z@195@01) x@171@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@181@01 z@195@01) (= (inv@180@01 z@195@01) y@172@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@186@01 r) (= (inv@185@01 r) x@171@01))
      (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@184@01 r)))
    :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@184@01 r))
    :qid |qp.fvfValDef56|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@191@01 r) (= (inv@190@01 r) y@172@01))
      (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@189@01 r)))
    :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@189@01 r))
    :qid |qp.fvfValDef57|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@184@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@189@01 r) r))
    :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef58|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@192@01  $FVF<g>) z@195@01) z@195@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@186@01 z@195@01) (= (inv@185@01 z@195@01) x@171@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@191@01 z@195@01) (= (inv@190@01 z@195@01) y@172@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@176@01 r) (= (inv@175@01 r) x@171@01))
      (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@174@01 r)))
    :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@174@01 r))
    :qid |qp.fvfValDef51|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@181@01 r) (= (inv@180@01 r) y@172@01))
      (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@179@01 r)))
    :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@179@01 r))
    :qid |qp.fvfValDef52|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@174@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@179@01 r) r))
    :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef53|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@176@01 z@195@01) (= (inv@175@01 z@195@01) x@171@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@181@01 z@195@01) (= (inv@180@01 z@195@01) y@172@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 29 | !(z@195@01 == x@171@01 || z@195@01 == y@172@01)]
(assert (not (or (= z@195@01 x@171@01) (= z@195@01 y@172@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@176@01 r) (= (inv@175@01 r) x@171@01))
    (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@174@01 r)))
  :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@174@01 r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@181@01 r) (= (inv@180@01 r) y@172@01))
    (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@179@01 r)))
  :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@179@01 r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@174@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@179@01 r) r))
  :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@186@01 r) (= (inv@185@01 r) x@171@01))
    (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@184@01 r)))
  :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@184@01 r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@191@01 r) (= (inv@190@01 r) y@172@01))
    (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@189@01 r)))
  :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@189@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@184@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@189@01 r) r))
  :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef58|)))
(assert (=>
  (or (= z@195@01 x@171@01) (= z@195@01 y@172@01))
  (and
    (or (= z@195@01 x@171@01) (= z@195@01 y@172@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@182@01  $FVF<f>) z@195@01) z@195@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@192@01  $FVF<g>) z@195@01) z@195@01))))
; Joined path conditions
(assert (or
  (not (or (= z@195@01 x@171@01) (= z@195@01 y@172@01)))
  (or (= z@195@01 x@171@01) (= z@195@01 y@172@01))))
; [eval] fun01(z)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@176@01 r) (= (inv@175@01 r) x@171@01))
    (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@174@01 r)))
  :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@174@01 r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@181@01 r) (= (inv@180@01 r) y@172@01))
    (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@179@01 r)))
  :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@179@01 r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@174@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@179@01 r) r))
  :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@186@01 r) (= (inv@185@01 r) x@171@01))
    (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@184@01 r)))
  :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@184@01 r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@191@01 r) (= (inv@190@01 r) y@172@01))
    (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@189@01 r)))
  :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@189@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@184@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@189@01 r) r))
  :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef58|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@195@01 $Ref)) (!
  (and
    (or (not (= z@195@01 x@171@01)) (= z@195@01 x@171@01))
    (=>
      (or (= z@195@01 x@171@01) (= z@195@01 y@172@01))
      (and
        (or (= z@195@01 x@171@01) (= z@195@01 y@172@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@182@01  $FVF<f>) z@195@01) z@195@01)
        ($FVF.loc_g ($FVF.lookup_g (as sm@192@01  $FVF<g>) z@195@01) z@195@01)))
    (or
      (not (or (= z@195@01 x@171@01) (= z@195@01 y@172@01)))
      (or (= z@195@01 x@171@01) (= z@195@01 y@172@01))))
  :pattern ((fun01<Bool> z@195@01) ($FVF.loc_f ($FVF.lookup_f (as sm@182@01  $FVF<f>) z@195@01) z@195@01) ($FVF.loc_g ($FVF.lookup_g (as sm@192@01  $FVF<g>) z@195@01) z@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@111@10@111@88-aux|)))
(assert (forall ((z@195@01 $Ref)) (!
  (=>
    (or (= z@195@01 x@171@01) (= z@195@01 y@172@01))
    (>
      (+
        (+
          ($FVF.lookup_f (as sm@182@01  $FVF<f>) z@195@01)
          ($FVF.lookup_g (as sm@192@01  $FVF<g>) z@195@01))
        ($FVF.lookup_f (as sm@182@01  $FVF<f>) z@195@01))
      0))
  :pattern ((fun01<Bool> z@195@01) ($FVF.loc_f ($FVF.lookup_f (as sm@182@01  $FVF<f>) z@195@01) z@195@01) ($FVF.loc_g ($FVF.lookup_g (as sm@192@01  $FVF<g>) z@195@01) z@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@111@10@111@88|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun01(x)
(declare-const $t@196@01 $Snap)
(assert (= $t@196@01 $Snap.unit))
; [eval] fun01(x)
(assert (fun01<Bool> x@171@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert 2 * x.f + x.g > 0
; [eval] 2 * x.f + x.g > 0
; [eval] 2 * x.f + x.g
; [eval] 2 * x.f
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@176@01 r) (= (inv@175@01 r) x@171@01))
      (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@174@01 r)))
    :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@174@01 r))
    :qid |qp.fvfValDef51|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@181@01 r) (= (inv@180@01 r) y@172@01))
      (= ($FVF.lookup_f (as sm@182@01  $FVF<f>) r) ($FVF.lookup_f $t@179@01 r)))
    :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@179@01 r))
    :qid |qp.fvfValDef52|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@174@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@179@01 r) r))
    :pattern (($FVF.lookup_f (as sm@182@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef53|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@182@01  $FVF<f>) x@171@01) x@171@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@176@01 x@171@01) (= (inv@175@01 x@171@01) x@171@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@181@01 x@171@01) (= (inv@180@01 x@171@01) y@172@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@186@01 r) (= (inv@185@01 r) x@171@01))
      (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@184@01 r)))
    :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@184@01 r))
    :qid |qp.fvfValDef56|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@191@01 r) (= (inv@190@01 r) y@172@01))
      (= ($FVF.lookup_g (as sm@192@01  $FVF<g>) r) ($FVF.lookup_g $t@189@01 r)))
    :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@189@01 r))
    :qid |qp.fvfValDef57|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@184@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@189@01 r) r))
    :pattern (($FVF.lookup_g (as sm@192@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef58|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@192@01  $FVF<g>) x@171@01) x@171@01))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@186@01 x@171@01) (= (inv@185@01 x@171@01) x@171@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@191@01 x@171@01) (= (inv@190@01 x@171@01) y@172@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>
  (+
    (* 2 ($FVF.lookup_f (as sm@182@01  $FVF<f>) x@171@01))
    ($FVF.lookup_g (as sm@192@01  $FVF<g>) x@171@01))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>
  (+
    (* 2 ($FVF.lookup_f (as sm@182@01  $FVF<f>) x@171@01))
    ($FVF.lookup_g (as sm@192@01  $FVF<g>) x@171@01))
  0))
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
(declare-const x@197@01 $Ref)
(declare-const y@198@01 $Ref)
(declare-const x@199@01 $Ref)
(declare-const y@200@01 $Ref)
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
; inhale (forall z: Ref ::z == x ==> acc(z.f, write))
(declare-const z@201@01 $Ref)
(push) ; 3
; [eval] z == x
(assert (= z@201@01 x@199@01))
(pop) ; 3
(declare-const $t@202@01 $FVF<f>)
(declare-fun inv@203@01 ($Ref) $Ref)
(declare-fun img@204@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@201@01 $Ref) (z2@201@01 $Ref)) (!
  (=>
    (and (= z1@201@01 x@199@01) (= z2@201@01 x@199@01) (= z1@201@01 z2@201@01))
    (= z1@201@01 z2@201@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@201@01 $Ref)) (!
  (=>
    (= z@201@01 x@199@01)
    (and (= (inv@203@01 z@201@01) z@201@01) (img@204@01 z@201@01)))
  :pattern ((inv@203@01 z@201@01))
  :pattern ((img@204@01 z@201@01))
  :qid |quant-u-78|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@204@01 r) (= (inv@203@01 r) x@199@01)) (= (inv@203@01 r) r))
  :pattern ((inv@203@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@201@01 $Ref)) (!
  (=> (= z@201@01 x@199@01) (not (= z@201@01 $Ref.null)))
  :pattern ((inv@203@01 z@201@01))
  :pattern ((img@204@01 z@201@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@205@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@204@01 r) (= (inv@203@01 r) x@199@01))
    (= ($FVF.lookup_f (as sm@205@01  $FVF<f>) r) ($FVF.lookup_f $t@202@01 r)))
  :pattern (($FVF.lookup_f (as sm@205@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@202@01 r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@202@01 r) r)
  :pattern (($FVF.lookup_f (as sm@205@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@203@01 r) x@199@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@205@01  $FVF<f>) r) r))
  :pattern ((inv@203@01 r))
  :qid |quant-u-79|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.f, write))
(declare-const z@206@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@206@01 y@200@01))
(pop) ; 3
(declare-const $t@207@01 $FVF<f>)
(declare-fun inv@208@01 ($Ref) $Ref)
(declare-fun img@209@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@206@01 $Ref) (z2@206@01 $Ref)) (!
  (=>
    (and (= z1@206@01 y@200@01) (= z2@206@01 y@200@01) (= z1@206@01 z2@206@01))
    (= z1@206@01 z2@206@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@206@01 $Ref)) (!
  (=>
    (= z@206@01 y@200@01)
    (and (= (inv@208@01 z@206@01) z@206@01) (img@209@01 z@206@01)))
  :pattern ((inv@208@01 z@206@01))
  :pattern ((img@209@01 z@206@01))
  :qid |quant-u-81|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@209@01 r) (= (inv@208@01 r) y@200@01)) (= (inv@208@01 r) r))
  :pattern ((inv@208@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@206@01 $Ref)) (!
  (=> (= z@206@01 y@200@01) (not (= z@206@01 $Ref.null)))
  :pattern ((inv@208@01 z@206@01))
  :pattern ((img@209@01 z@206@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@206@01 z@201@01)
    (=
      (and (img@209@01 r) (= (inv@208@01 r) y@200@01))
      (and (img@204@01 r) (= (inv@203@01 r) x@199@01))))
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@210@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@204@01 r) (= (inv@203@01 r) x@199@01))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@202@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@202@01 r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@209@01 r) (= (inv@208@01 r) y@200@01))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@207@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@207@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@202@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@207@01 r) r))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@208@01 r) y@200@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) r))
  :pattern ((inv@208@01 r))
  :qid |quant-u-83|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == x ==> acc(z.g, write))
(declare-const z@211@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x
(assert (= z@211@01 x@199@01))
(pop) ; 3
(declare-const $t@212@01 $FVF<g>)
(declare-fun inv@213@01 ($Ref) $Ref)
(declare-fun img@214@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@211@01 $Ref) (z2@211@01 $Ref)) (!
  (=>
    (and (= z1@211@01 x@199@01) (= z2@211@01 x@199@01) (= z1@211@01 z2@211@01))
    (= z1@211@01 z2@211@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@211@01 $Ref)) (!
  (=>
    (= z@211@01 x@199@01)
    (and (= (inv@213@01 z@211@01) z@211@01) (img@214@01 z@211@01)))
  :pattern ((inv@213@01 z@211@01))
  :pattern ((img@214@01 z@211@01))
  :qid |quant-u-85|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@214@01 r) (= (inv@213@01 r) x@199@01)) (= (inv@213@01 r) r))
  :pattern ((inv@213@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@211@01 $Ref)) (!
  (=> (= z@211@01 x@199@01) (not (= z@211@01 $Ref.null)))
  :pattern ((inv@213@01 z@211@01))
  :pattern ((img@214@01 z@211@01))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@215@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@214@01 r) (= (inv@213@01 r) x@199@01))
    (= ($FVF.lookup_g (as sm@215@01  $FVF<g>) r) ($FVF.lookup_g $t@212@01 r)))
  :pattern (($FVF.lookup_g (as sm@215@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@212@01 r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g $t@212@01 r) r)
  :pattern (($FVF.lookup_g (as sm@215@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@213@01 r) x@199@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@215@01  $FVF<g>) r) r))
  :pattern ((inv@213@01 r))
  :qid |quant-u-86|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.g, write))
(declare-const z@216@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@216@01 y@200@01))
(pop) ; 3
(declare-const $t@217@01 $FVF<g>)
(declare-fun inv@218@01 ($Ref) $Ref)
(declare-fun img@219@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@216@01 $Ref) (z2@216@01 $Ref)) (!
  (=>
    (and (= z1@216@01 y@200@01) (= z2@216@01 y@200@01) (= z1@216@01 z2@216@01))
    (= z1@216@01 z2@216@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@216@01 $Ref)) (!
  (=>
    (= z@216@01 y@200@01)
    (and (= (inv@218@01 z@216@01) z@216@01) (img@219@01 z@216@01)))
  :pattern ((inv@218@01 z@216@01))
  :pattern ((img@219@01 z@216@01))
  :qid |quant-u-88|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@219@01 r) (= (inv@218@01 r) y@200@01)) (= (inv@218@01 r) r))
  :pattern ((inv@218@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@216@01 $Ref)) (!
  (=> (= z@216@01 y@200@01) (not (= z@216@01 $Ref.null)))
  :pattern ((inv@218@01 z@216@01))
  :pattern ((img@219@01 z@216@01))
  :qid |g-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@216@01 z@211@01)
    (=
      (and (img@219@01 r) (= (inv@218@01 r) y@200@01))
      (and (img@214@01 r) (= (inv@213@01 r) x@199@01))))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@220@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@214@01 r) (= (inv@213@01 r) x@199@01))
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@212@01 r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@212@01 r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@219@01 r) (= (inv@218@01 r) y@200@01))
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@217@01 r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@217@01 r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@212@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@217@01 r) r))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@218@01 r) y@200@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) r))
  :pattern ((inv@218@01 r))
  :qid |quant-u-90|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@221@01 $Snap)
(assert (= $t@221@01 ($Snap.combine ($Snap.first $t@221@01) ($Snap.second $t@221@01))))
(assert (= ($Snap.first $t@221@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@199@01 $Ref.null)))
(assert (= ($Snap.second $t@221@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@200@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { z.f, z.g }
;     z == x || z == y ==> z.f > 0 && z.g > 0)
(declare-const $t@222@01 $Snap)
(assert (= $t@222@01 $Snap.unit))
; [eval] (forall z: Ref :: { z.f, z.g } z == x || z == y ==> z.f > 0 && z.g > 0)
(declare-const z@223@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> z.f > 0 && z.g > 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 30 | z@223@01 == x@199@01 | live]
; [else-branch: 30 | z@223@01 != x@199@01 | live]
(push) ; 5
; [then-branch: 30 | z@223@01 == x@199@01]
(assert (= z@223@01 x@199@01))
(pop) ; 5
(push) ; 5
; [else-branch: 30 | z@223@01 != x@199@01]
(assert (not (= z@223@01 x@199@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@223@01 x@199@01)) (= z@223@01 x@199@01)))
(push) ; 4
; [then-branch: 31 | z@223@01 == x@199@01 || z@223@01 == y@200@01 | live]
; [else-branch: 31 | !(z@223@01 == x@199@01 || z@223@01 == y@200@01) | live]
(push) ; 5
; [then-branch: 31 | z@223@01 == x@199@01 || z@223@01 == y@200@01]
(assert (or (= z@223@01 x@199@01) (= z@223@01 y@200@01)))
; [eval] z.f > 0 && z.g > 0
; [eval] z.f > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@204@01 r) (= (inv@203@01 r) x@199@01))
      (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@202@01 r)))
    :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@202@01 r))
    :qid |qp.fvfValDef61|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@209@01 r) (= (inv@208@01 r) y@200@01))
      (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@207@01 r)))
    :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@207@01 r))
    :qid |qp.fvfValDef62|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@202@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@207@01 r) r))
    :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef63|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) z@223@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@204@01 z@223@01) (= (inv@203@01 z@223@01) x@199@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@209@01 z@223@01) (= (inv@208@01 z@223@01) y@200@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 32 | !(Lookup(f, sm@210@01, z@223@01) > 0) | live]
; [else-branch: 32 | Lookup(f, sm@210@01, z@223@01) > 0 | live]
(push) ; 7
; [then-branch: 32 | !(Lookup(f, sm@210@01, z@223@01) > 0)]
(assert (not (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 32 | Lookup(f, sm@210@01, z@223@01) > 0]
(assert (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0))
; [eval] z.g > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@214@01 r) (= (inv@213@01 r) x@199@01))
      (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@212@01 r)))
    :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@212@01 r))
    :qid |qp.fvfValDef66|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@219@01 r) (= (inv@218@01 r) y@200@01))
      (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@217@01 r)))
    :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@217@01 r))
    :qid |qp.fvfValDef67|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@212@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@217@01 r) r))
    :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef68|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@220@01  $FVF<g>) z@223@01) z@223@01))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@214@01 z@223@01) (= (inv@213@01 z@223@01) x@199@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@219@01 z@223@01) (= (inv@218@01 z@223@01) y@200@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@214@01 r) (= (inv@213@01 r) x@199@01))
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@212@01 r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@212@01 r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@219@01 r) (= (inv@218@01 r) y@200@01))
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@217@01 r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@217@01 r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@212@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@217@01 r) r))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef68|)))
(assert (=>
  (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
  (and
    (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
    ($FVF.loc_g ($FVF.lookup_g (as sm@220@01  $FVF<g>) z@223@01) z@223@01))))
(assert (or
  (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
  (not (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0))))
(pop) ; 5
(push) ; 5
; [else-branch: 31 | !(z@223@01 == x@199@01 || z@223@01 == y@200@01)]
(assert (not (or (= z@223@01 x@199@01) (= z@223@01 y@200@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@204@01 r) (= (inv@203@01 r) x@199@01))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@202@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@202@01 r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@209@01 r) (= (inv@208@01 r) y@200@01))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@207@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@207@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@202@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@207@01 r) r))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@214@01 r) (= (inv@213@01 r) x@199@01))
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@212@01 r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@212@01 r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@219@01 r) (= (inv@218@01 r) y@200@01))
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@217@01 r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@217@01 r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@212@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@217@01 r) r))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef68|)))
(assert (=>
  (or (= z@223@01 x@199@01) (= z@223@01 y@200@01))
  (and
    (or (= z@223@01 x@199@01) (= z@223@01 y@200@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) z@223@01)
    (=>
      (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
      (and
        (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
        ($FVF.loc_g ($FVF.lookup_g (as sm@220@01  $FVF<g>) z@223@01) z@223@01)))
    (or
      (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
      (not (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0))))))
; Joined path conditions
(assert (or
  (not (or (= z@223@01 x@199@01) (= z@223@01 y@200@01)))
  (or (= z@223@01 x@199@01) (= z@223@01 y@200@01))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@204@01 r) (= (inv@203@01 r) x@199@01))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@202@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@202@01 r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@209@01 r) (= (inv@208@01 r) y@200@01))
    (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@207@01 r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@207@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@202@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@207@01 r) r))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@214@01 r) (= (inv@213@01 r) x@199@01))
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@212@01 r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@212@01 r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@219@01 r) (= (inv@218@01 r) y@200@01))
    (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@217@01 r)))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@217@01 r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@212@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@217@01 r) r))
  :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef68|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@223@01 $Ref)) (!
  (and
    (or (not (= z@223@01 x@199@01)) (= z@223@01 x@199@01))
    (=>
      (or (= z@223@01 x@199@01) (= z@223@01 y@200@01))
      (and
        (or (= z@223@01 x@199@01) (= z@223@01 y@200@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) z@223@01)
        (=>
          (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
          (and
            (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
            ($FVF.loc_g ($FVF.lookup_g (as sm@220@01  $FVF<g>) z@223@01) z@223@01)))
        (or
          (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
          (not (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)))))
    (or
      (not (or (= z@223@01 x@199@01) (= z@223@01 y@200@01)))
      (or (= z@223@01 x@199@01) (= z@223@01 y@200@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) z@223@01) ($FVF.loc_g ($FVF.lookup_g (as sm@220@01  $FVF<g>) z@223@01) z@223@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@123@10@123@77-aux|)))
(assert (forall ((z@223@01 $Ref)) (!
  (=>
    (or (= z@223@01 x@199@01) (= z@223@01 y@200@01))
    (and
      (> ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) 0)
      (> ($FVF.lookup_g (as sm@220@01  $FVF<g>) z@223@01) 0)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@210@01  $FVF<f>) z@223@01) z@223@01) ($FVF.loc_g ($FVF.lookup_g (as sm@220@01  $FVF<g>) z@223@01) z@223@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@123@10@123@77|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun02(y.f) == 42
(declare-const $t@224@01 $Snap)
(assert (= $t@224@01 $Snap.unit))
; [eval] fun02(y.f) == 42
; [eval] fun02(y.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@204@01 r) (= (inv@203@01 r) x@199@01))
      (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@202@01 r)))
    :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@202@01 r))
    :qid |qp.fvfValDef61|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@209@01 r) (= (inv@208@01 r) y@200@01))
      (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) r) ($FVF.lookup_f $t@207@01 r)))
    :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@207@01 r))
    :qid |qp.fvfValDef62|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@202@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@207@01 r) r))
    :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef63|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@210@01  $FVF<f>) y@200@01) y@200@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@204@01 y@200@01) (= (inv@203@01 y@200@01) x@199@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@209@01 y@200@01) (= (inv@208@01 y@200@01) y@200@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fun02<Int> ($FVF.lookup_f (as sm@210@01  $FVF<f>) y@200@01)) 42))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert y.g > 0
; [eval] y.g > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@214@01 r) (= (inv@213@01 r) x@199@01))
      (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@212@01 r)))
    :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@212@01 r))
    :qid |qp.fvfValDef66|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@219@01 r) (= (inv@218@01 r) y@200@01))
      (= ($FVF.lookup_g (as sm@220@01  $FVF<g>) r) ($FVF.lookup_g $t@217@01 r)))
    :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@217@01 r))
    :qid |qp.fvfValDef67|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@212@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@217@01 r) r))
    :pattern (($FVF.lookup_g (as sm@220@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef68|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@220@01  $FVF<g>) y@200@01) y@200@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@214@01 y@200@01) (= (inv@213@01 y@200@01) x@199@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@219@01 y@200@01) (= (inv@218@01 y@200@01) y@200@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> ($FVF.lookup_g (as sm@220@01  $FVF<g>) y@200@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($FVF.lookup_g (as sm@220@01  $FVF<g>) y@200@01) 0))
(pop) ; 2
(pop) ; 1
; ---------- test06b ----------
(declare-const x@225@01 $Ref)
(declare-const y@226@01 $Ref)
(declare-const x@227@01 $Ref)
(declare-const y@228@01 $Ref)
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
; inhale (forall z: Ref ::z == x ==> acc(z.f, write))
(declare-const z@229@01 $Ref)
(push) ; 3
; [eval] z == x
(assert (= z@229@01 x@227@01))
(pop) ; 3
(declare-const $t@230@01 $FVF<f>)
(declare-fun inv@231@01 ($Ref) $Ref)
(declare-fun img@232@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@229@01 $Ref) (z2@229@01 $Ref)) (!
  (=>
    (and (= z1@229@01 x@227@01) (= z2@229@01 x@227@01) (= z1@229@01 z2@229@01))
    (= z1@229@01 z2@229@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@229@01 $Ref)) (!
  (=>
    (= z@229@01 x@227@01)
    (and (= (inv@231@01 z@229@01) z@229@01) (img@232@01 z@229@01)))
  :pattern ((inv@231@01 z@229@01))
  :pattern ((img@232@01 z@229@01))
  :qid |quant-u-92|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@232@01 r) (= (inv@231@01 r) x@227@01)) (= (inv@231@01 r) r))
  :pattern ((inv@231@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@229@01 $Ref)) (!
  (=> (= z@229@01 x@227@01) (not (= z@229@01 $Ref.null)))
  :pattern ((inv@231@01 z@229@01))
  :pattern ((img@232@01 z@229@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@233@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@232@01 r) (= (inv@231@01 r) x@227@01))
    (= ($FVF.lookup_f (as sm@233@01  $FVF<f>) r) ($FVF.lookup_f $t@230@01 r)))
  :pattern (($FVF.lookup_f (as sm@233@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@230@01 r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@230@01 r) r)
  :pattern (($FVF.lookup_f (as sm@233@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@231@01 r) x@227@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@233@01  $FVF<f>) r) r))
  :pattern ((inv@231@01 r))
  :qid |quant-u-93|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.f, write))
(declare-const z@234@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@234@01 y@228@01))
(pop) ; 3
(declare-const $t@235@01 $FVF<f>)
(declare-fun inv@236@01 ($Ref) $Ref)
(declare-fun img@237@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@234@01 $Ref) (z2@234@01 $Ref)) (!
  (=>
    (and (= z1@234@01 y@228@01) (= z2@234@01 y@228@01) (= z1@234@01 z2@234@01))
    (= z1@234@01 z2@234@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@234@01 $Ref)) (!
  (=>
    (= z@234@01 y@228@01)
    (and (= (inv@236@01 z@234@01) z@234@01) (img@237@01 z@234@01)))
  :pattern ((inv@236@01 z@234@01))
  :pattern ((img@237@01 z@234@01))
  :qid |quant-u-95|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@237@01 r) (= (inv@236@01 r) y@228@01)) (= (inv@236@01 r) r))
  :pattern ((inv@236@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@234@01 $Ref)) (!
  (=> (= z@234@01 y@228@01) (not (= z@234@01 $Ref.null)))
  :pattern ((inv@236@01 z@234@01))
  :pattern ((img@237@01 z@234@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@234@01 z@229@01)
    (=
      (and (img@237@01 r) (= (inv@236@01 r) y@228@01))
      (and (img@232@01 r) (= (inv@231@01 r) x@227@01))))
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@238@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@232@01 r) (= (inv@231@01 r) x@227@01))
    (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@230@01 r)))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@230@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@237@01 r) (= (inv@236@01 r) y@228@01))
    (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@235@01 r)))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@235@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@230@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@235@01 r) r))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@236@01 r) y@228@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) r))
  :pattern ((inv@236@01 r))
  :qid |quant-u-97|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == x ==> acc(z.g, write))
(declare-const z@239@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x
(assert (= z@239@01 x@227@01))
(pop) ; 3
(declare-const $t@240@01 $FVF<g>)
(declare-fun inv@241@01 ($Ref) $Ref)
(declare-fun img@242@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@239@01 $Ref) (z2@239@01 $Ref)) (!
  (=>
    (and (= z1@239@01 x@227@01) (= z2@239@01 x@227@01) (= z1@239@01 z2@239@01))
    (= z1@239@01 z2@239@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@239@01 $Ref)) (!
  (=>
    (= z@239@01 x@227@01)
    (and (= (inv@241@01 z@239@01) z@239@01) (img@242@01 z@239@01)))
  :pattern ((inv@241@01 z@239@01))
  :pattern ((img@242@01 z@239@01))
  :qid |quant-u-99|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@242@01 r) (= (inv@241@01 r) x@227@01)) (= (inv@241@01 r) r))
  :pattern ((inv@241@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@239@01 $Ref)) (!
  (=> (= z@239@01 x@227@01) (not (= z@239@01 $Ref.null)))
  :pattern ((inv@241@01 z@239@01))
  :pattern ((img@242@01 z@239@01))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@243@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
    (= ($FVF.lookup_g (as sm@243@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
  :pattern (($FVF.lookup_g (as sm@243@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@240@01 r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
  :pattern (($FVF.lookup_g (as sm@243@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@241@01 r) x@227@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@243@01  $FVF<g>) r) r))
  :pattern ((inv@241@01 r))
  :qid |quant-u-100|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::z == y ==> acc(z.g, write))
(declare-const z@244@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == y
(assert (= z@244@01 y@228@01))
(pop) ; 3
(declare-const $t@245@01 $FVF<g>)
(declare-fun inv@246@01 ($Ref) $Ref)
(declare-fun img@247@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@244@01 $Ref) (z2@244@01 $Ref)) (!
  (=>
    (and (= z1@244@01 y@228@01) (= z2@244@01 y@228@01) (= z1@244@01 z2@244@01))
    (= z1@244@01 z2@244@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@244@01 $Ref)) (!
  (=>
    (= z@244@01 y@228@01)
    (and (= (inv@246@01 z@244@01) z@244@01) (img@247@01 z@244@01)))
  :pattern ((inv@246@01 z@244@01))
  :pattern ((img@247@01 z@244@01))
  :qid |quant-u-102|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@247@01 r) (= (inv@246@01 r) y@228@01)) (= (inv@246@01 r) r))
  :pattern ((inv@246@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@244@01 $Ref)) (!
  (=> (= z@244@01 y@228@01) (not (= z@244@01 $Ref.null)))
  :pattern ((inv@246@01 z@244@01))
  :pattern ((img@247@01 z@244@01))
  :qid |g-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@244@01 z@239@01)
    (=
      (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
      (and (img@242@01 r) (= (inv@241@01 r) x@227@01))))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@248@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
    (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@240@01 r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
    (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@245@01 r)))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@245@01 r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@246@01 r) y@228@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) r))
  :pattern ((inv@246@01 r))
  :qid |quant-u-104|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null && y != null
(declare-const $t@249@01 $Snap)
(assert (= $t@249@01 ($Snap.combine ($Snap.first $t@249@01) ($Snap.second $t@249@01))))
(assert (= ($Snap.first $t@249@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@227@01 $Ref.null)))
(assert (= ($Snap.second $t@249@01) $Snap.unit))
; [eval] y != null
(assert (not (= y@228@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { z.f, z.g }
;     z == x || z == y ==> z.f > 0 && z.g > 0)
(declare-const $t@250@01 $Snap)
(assert (= $t@250@01 $Snap.unit))
; [eval] (forall z: Ref :: { z.f, z.g } z == x || z == y ==> z.f > 0 && z.g > 0)
(declare-const z@251@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] z == x || z == y ==> z.f > 0 && z.g > 0
; [eval] z == x || z == y
; [eval] z == x
(push) ; 4
; [then-branch: 33 | z@251@01 == x@227@01 | live]
; [else-branch: 33 | z@251@01 != x@227@01 | live]
(push) ; 5
; [then-branch: 33 | z@251@01 == x@227@01]
(assert (= z@251@01 x@227@01))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | z@251@01 != x@227@01]
(assert (not (= z@251@01 x@227@01)))
; [eval] z == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@251@01 x@227@01)) (= z@251@01 x@227@01)))
(push) ; 4
; [then-branch: 34 | z@251@01 == x@227@01 || z@251@01 == y@228@01 | live]
; [else-branch: 34 | !(z@251@01 == x@227@01 || z@251@01 == y@228@01) | live]
(push) ; 5
; [then-branch: 34 | z@251@01 == x@227@01 || z@251@01 == y@228@01]
(assert (or (= z@251@01 x@227@01) (= z@251@01 y@228@01)))
; [eval] z.f > 0 && z.g > 0
; [eval] z.f > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@232@01 r) (= (inv@231@01 r) x@227@01))
      (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@230@01 r)))
    :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@230@01 r))
    :qid |qp.fvfValDef71|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@237@01 r) (= (inv@236@01 r) y@228@01))
      (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@235@01 r)))
    :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@235@01 r))
    :qid |qp.fvfValDef72|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@230@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@235@01 r) r))
    :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef73|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) z@251@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@232@01 z@251@01) (= (inv@231@01 z@251@01) x@227@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@237@01 z@251@01) (= (inv@236@01 z@251@01) y@228@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 35 | !(Lookup(f, sm@238@01, z@251@01) > 0) | live]
; [else-branch: 35 | Lookup(f, sm@238@01, z@251@01) > 0 | live]
(push) ; 7
; [then-branch: 35 | !(Lookup(f, sm@238@01, z@251@01) > 0)]
(assert (not (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 35 | Lookup(f, sm@238@01, z@251@01) > 0]
(assert (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0))
; [eval] z.g > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
      (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
    :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@240@01 r))
    :qid |qp.fvfValDef76|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
      (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@245@01 r)))
    :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@245@01 r))
    :qid |qp.fvfValDef77|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r))
    :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef78|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) z@251@01) z@251@01))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@242@01 z@251@01) (= (inv@241@01 z@251@01) x@227@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@247@01 z@251@01) (= (inv@246@01 z@251@01) y@228@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
    (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@240@01 r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
    (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@245@01 r)))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@245@01 r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef78|)))
(assert (=>
  (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
  (and
    (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
    ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) z@251@01) z@251@01))))
(assert (or
  (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
  (not (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0))))
(pop) ; 5
(push) ; 5
; [else-branch: 34 | !(z@251@01 == x@227@01 || z@251@01 == y@228@01)]
(assert (not (or (= z@251@01 x@227@01) (= z@251@01 y@228@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@232@01 r) (= (inv@231@01 r) x@227@01))
    (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@230@01 r)))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@230@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@237@01 r) (= (inv@236@01 r) y@228@01))
    (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@235@01 r)))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@235@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@230@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@235@01 r) r))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
    (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@240@01 r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
    (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@245@01 r)))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@245@01 r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef78|)))
(assert (=>
  (or (= z@251@01 x@227@01) (= z@251@01 y@228@01))
  (and
    (or (= z@251@01 x@227@01) (= z@251@01 y@228@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) z@251@01)
    (=>
      (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
      (and
        (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
        ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) z@251@01) z@251@01)))
    (or
      (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
      (not (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0))))))
; Joined path conditions
(assert (or
  (not (or (= z@251@01 x@227@01) (= z@251@01 y@228@01)))
  (or (= z@251@01 x@227@01) (= z@251@01 y@228@01))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@232@01 r) (= (inv@231@01 r) x@227@01))
    (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@230@01 r)))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@230@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@237@01 r) (= (inv@236@01 r) y@228@01))
    (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@235@01 r)))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@235@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@230@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@235@01 r) r))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
    (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@240@01 r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
    (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@245@01 r)))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@245@01 r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r))
  :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef78|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@251@01 $Ref)) (!
  (and
    (or (not (= z@251@01 x@227@01)) (= z@251@01 x@227@01))
    (=>
      (or (= z@251@01 x@227@01) (= z@251@01 y@228@01))
      (and
        (or (= z@251@01 x@227@01) (= z@251@01 y@228@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) z@251@01)
        (=>
          (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
          (and
            (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
            ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) z@251@01) z@251@01)))
        (or
          (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
          (not (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)))))
    (or
      (not (or (= z@251@01 x@227@01) (= z@251@01 y@228@01)))
      (or (= z@251@01 x@227@01) (= z@251@01 y@228@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) z@251@01) ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) z@251@01) z@251@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@135@10@135@77-aux|)))
(assert (forall ((z@251@01 $Ref)) (!
  (=>
    (or (= z@251@01 x@227@01) (= z@251@01 y@228@01))
    (and
      (> ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) 0)
      (> ($FVF.lookup_g (as sm@248@01  $FVF<g>) z@251@01) 0)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) z@251@01) z@251@01) ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) z@251@01) z@251@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@135@10@135@77|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun02(x.f) == 42
(declare-const $t@252@01 $Snap)
(assert (= $t@252@01 $Snap.unit))
; [eval] fun02(x.f) == 42
; [eval] fun02(x.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@232@01 r) (= (inv@231@01 r) x@227@01))
      (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@230@01 r)))
    :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@230@01 r))
    :qid |qp.fvfValDef71|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@237@01 r) (= (inv@236@01 r) y@228@01))
      (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) ($FVF.lookup_f $t@235@01 r)))
    :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@235@01 r))
    :qid |qp.fvfValDef72|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@230@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@235@01 r) r))
    :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef73|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) x@227@01) x@227@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@232@01 x@227@01) (= (inv@231@01 x@227@01) x@227@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@237@01 x@227@01) (= (inv@236@01 x@227@01) y@228@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fun02<Int> ($FVF.lookup_f (as sm@238@01  $FVF<f>) x@227@01)) 42))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert y.g > 0
; [eval] y.g > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
      (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
    :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@240@01 r))
    :qid |qp.fvfValDef76|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
      (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@245@01 r)))
    :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@245@01 r))
    :qid |qp.fvfValDef77|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r))
    :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef78|))))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) y@228@01) y@228@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@242@01 y@228@01) (= (inv@241@01 y@228@01) x@227@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@247@01 y@228@01) (= (inv@246@01 y@228@01) y@228@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> ($FVF.lookup_g (as sm@248@01  $FVF<g>) y@228@01) 0)))
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
    (= z@239@01 z@244@01)
    (=
      (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
      (and (img@247@01 r) (= (inv@246@01 r) y@228@01))))
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@229@01 z@234@01)
    (=
      (and (img@232@01 r) (= (inv@231@01 r) x@227@01))
      (and (img@237@01 r) (= (inv@236@01 r) y@228@01))))
  
  :qid |quant-u-106|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(declare-const pm@253@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@253@01  $FPM) r)
    (+
      (ite (and (img@232@01 r) (= (inv@231@01 r) x@227@01)) $Perm.Write $Perm.No)
      (ite (and (img@237@01 r) (= (inv@236@01 r) y@228@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@253@01  $FPM) r))
  :qid |qp.resPrmSumDef79|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@230@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@235@01 r) r))
  :pattern (($FVF.perm_f (as pm@253@01  $FPM) r))
  :qid |qp.resTrgDef80|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@253@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@254@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@254@01  $FPM) r)
    (+
      (ite (and (img@242@01 r) (= (inv@241@01 r) x@227@01)) $Perm.Write $Perm.No)
      (ite (and (img@247@01 r) (= (inv@246@01 r) y@228@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@254@01  $FPM) r))
  :qid |qp.resPrmSumDef81|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r))
  :pattern (($FVF.perm_g (as pm@254@01  $FPM) r))
  :qid |qp.resTrgDef82|)))
; Assume upper permission bound for field g
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_g (as pm@254@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] y.g > 0
(declare-const sm@255@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
    (= ($FVF.lookup_g (as sm@255@01  $FVF<g>) r) ($FVF.lookup_g $t@245@01 r)))
  :pattern (($FVF.lookup_g (as sm@255@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@245@01 r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
    (= ($FVF.lookup_g (as sm@255@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
  :pattern (($FVF.lookup_g (as sm@255@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@240@01 r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r))
  :pattern (($FVF.lookup_g (as sm@255@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef85|)))
(declare-const pm@256@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@256@01  $FPM) r)
    (+
      (ite (and (img@247@01 r) (= (inv@246@01 r) y@228@01)) $Perm.Write $Perm.No)
      (ite (and (img@242@01 r) (= (inv@241@01 r) x@227@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@256@01  $FPM) r))
  :qid |qp.resPrmSumDef86|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g (as sm@255@01  $FVF<g>) r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r))
  :pattern (($FVF.perm_g (as pm@256@01  $FPM) r))
  :qid |qp.resTrgDef87|)))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@255@01  $FVF<g>) y@228@01) y@228@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@256@01  $FPM) y@228@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> ($FVF.lookup_g (as sm@255@01  $FVF<g>) y@228@01) 0)))
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
    (= z@239@01 z@244@01)
    (=
      (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
      (and (img@247@01 r) (= (inv@246@01 r) y@228@01))))
  
  :qid |quant-u-107|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@229@01 z@234@01)
    (=
      (and (img@232@01 r) (= (inv@231@01 r) x@227@01))
      (and (img@237@01 r) (= (inv@236@01 r) y@228@01))))
  
  :qid |quant-u-108|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(declare-const pm@257@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@257@01  $FPM) r)
    (+
      (ite (and (img@232@01 r) (= (inv@231@01 r) x@227@01)) $Perm.Write $Perm.No)
      (ite (and (img@237@01 r) (= (inv@236@01 r) y@228@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@257@01  $FPM) r))
  :qid |qp.resPrmSumDef88|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@230@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@235@01 r) r))
  :pattern (($FVF.perm_f (as pm@257@01  $FPM) r))
  :qid |qp.resTrgDef89|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@257@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@238@01  $FVF<f>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@258@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@258@01  $FPM) r)
    (+
      (ite (and (img@242@01 r) (= (inv@241@01 r) x@227@01)) $Perm.Write $Perm.No)
      (ite (and (img@247@01 r) (= (inv@246@01 r) y@228@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@258@01  $FPM) r))
  :qid |qp.resPrmSumDef90|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r))
  :pattern (($FVF.perm_g (as pm@258@01  $FPM) r))
  :qid |qp.resTrgDef91|)))
; Assume upper permission bound for field g
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_g (as pm@258@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_g ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] y.g > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
      (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
    :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@240@01 r))
    :qid |qp.fvfValDef76|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
      (= ($FVF.lookup_g (as sm@248@01  $FVF<g>) r) ($FVF.lookup_g $t@245@01 r)))
    :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g $t@245@01 r))
    :qid |qp.fvfValDef77|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r)
      ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r))
    :pattern (($FVF.lookup_g (as sm@248@01  $FVF<g>) r))
    :qid |qp.fvfResTrgDef78|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@242@01 y@228@01) (= (inv@241@01 y@228@01) x@227@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@247@01 y@228@01) (= (inv@246@01 y@228@01) y@228@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> ($FVF.lookup_g (as sm@248@01  $FVF<g>) y@228@01) 0)))
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
    (= z@239@01 z@244@01)
    (=
      (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
      (and (img@247@01 r) (= (inv@246@01 r) y@228@01))))
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= z@229@01 z@234@01)
    (=
      (and (img@232@01 r) (= (inv@231@01 r) x@227@01))
      (and (img@237@01 r) (= (inv@236@01 r) y@228@01))))
  
  :qid |quant-u-110|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Definitional axioms for snapshot map values
; Assume upper permission bound for field g
; [eval] y.g > 0
(declare-const sm@259@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@247@01 r) (= (inv@246@01 r) y@228@01))
    (= ($FVF.lookup_g (as sm@259@01  $FVF<g>) r) ($FVF.lookup_g $t@245@01 r)))
  :pattern (($FVF.lookup_g (as sm@259@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@245@01 r))
  :qid |qp.fvfValDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@242@01 r) (= (inv@241@01 r) x@227@01))
    (= ($FVF.lookup_g (as sm@259@01  $FVF<g>) r) ($FVF.lookup_g $t@240@01 r)))
  :pattern (($FVF.lookup_g (as sm@259@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@240@01 r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r))
  :pattern (($FVF.lookup_g (as sm@259@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef94|)))
(declare-const pm@260@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@260@01  $FPM) r)
    (+
      (ite (and (img@247@01 r) (= (inv@246@01 r) y@228@01)) $Perm.Write $Perm.No)
      (ite (and (img@242@01 r) (= (inv@241@01 r) x@227@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@260@01  $FPM) r))
  :qid |qp.resPrmSumDef95|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g (as sm@259@01  $FVF<g>) r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@245@01 r) r)
    ($FVF.loc_g ($FVF.lookup_g $t@240@01 r) r))
  :pattern (($FVF.perm_g (as pm@260@01  $FPM) r))
  :qid |qp.resTrgDef96|)))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@259@01  $FVF<g>) y@228@01) y@228@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@260@01  $FPM) y@228@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> ($FVF.lookup_g (as sm@259@01  $FVF<g>) y@228@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test07a ----------
(declare-const xs@261@01 Seq<$Ref>)
(declare-const xs@262@01 Seq<$Ref>)
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
;     { (i in [0..|xs|)), (j in [0..|xs|)) }
;     { (i in [0..|xs|)), xs[j] }
;     { (j in [0..|xs|)), xs[i] }
;     { xs[i], xs[j] }
;     (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const $t@263@01 $Snap)
(assert (= $t@263@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@264@01 Int)
(declare-const j@265@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 36 | !(i@264@01 in [0..|xs@262@01|]) | live]
; [else-branch: 36 | i@264@01 in [0..|xs@262@01|] | live]
(push) ; 5
; [then-branch: 36 | !(i@264@01 in [0..|xs@262@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | i@264@01 in [0..|xs@262@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 37 | !(j@265@01 in [0..|xs@262@01|]) | live]
; [else-branch: 37 | j@265@01 in [0..|xs@262@01|] | live]
(push) ; 7
; [then-branch: 37 | !(j@265@01 in [0..|xs@262@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 37 | j@265@01 in [0..|xs@262@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01))))
(push) ; 4
; [then-branch: 38 | i@264@01 in [0..|xs@262@01|] && j@265@01 in [0..|xs@262@01|] && i@264@01 != j@265@01 | live]
; [else-branch: 38 | !(i@264@01 in [0..|xs@262@01|] && j@265@01 in [0..|xs@262@01|] && i@264@01 != j@265@01) | live]
(push) ; 5
; [then-branch: 38 | i@264@01 in [0..|xs@262@01|] && j@265@01 in [0..|xs@262@01|] && i@264@01 != j@265@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
    (not (= i@264@01 j@265@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@264@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@264@01 (Seq_length xs@262@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@265@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@265@01 (Seq_length xs@262@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 38 | !(i@264@01 in [0..|xs@262@01|] && j@265@01 in [0..|xs@262@01|] && i@264@01 != j@265@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
      (not (= i@264@01 j@265@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
      (not (= i@264@01 j@265@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
    (not (= i@264@01 j@265@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
        (not (= i@264@01 j@265@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
      (not (= i@264@01 j@265@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@264@01 Int) (j@265@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
        (not (= i@264@01 j@265@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
            (not (= i@264@01 j@265@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@262@01))
    j@265@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@262@01))
    j@265@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@143@11@143@97-aux|)))
(assert (forall ((i@264@01 Int) (j@265@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
        (not (= i@264@01 j@265@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
            (not (= i@264@01 j@265@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@262@01))
    j@265@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@143@11@143@97-aux|)))
(assert (forall ((i@264@01 Int) (j@265@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
        (not (= i@264@01 j@265@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
            (not (= i@264@01 j@265@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_index
    xs@262@01
    j@265@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_index
    xs@262@01
    j@265@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@143@11@143@97-aux|)))
(assert (forall ((i@264@01 Int) (j@265@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
        (not (= i@264@01 j@265@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
            (not (= i@264@01 j@265@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_index
    xs@262@01
    j@265@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@143@11@143@97-aux|)))
(assert (forall ((i@264@01 Int) (j@265@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
        (not (= i@264@01 j@265@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
            (not (= i@264@01 j@265@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01) (Seq_index
    xs@262@01
    i@264@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@262@01)) j@265@01) (Seq_index
    xs@262@01
    i@264@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@143@11@143@97-aux|)))
(assert (forall ((i@264@01 Int) (j@265@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
        (not (= i@264@01 j@265@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
            (not (= i@264@01 j@265@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@262@01)) j@265@01) (Seq_index
    xs@262@01
    i@264@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@143@11@143@97-aux|)))
(assert (forall ((i@264@01 Int) (j@265@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
        (not (= i@264@01 j@265@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
            (not (= i@264@01 j@265@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
          (not (= i@264@01 j@265@01))))))
  :pattern ((Seq_index xs@262@01 i@264@01) (Seq_index xs@262@01 j@265@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@143@11@143@97-aux|)))
(assert (forall ((i@264@01 Int) (j@265@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01)
        (not (= i@264@01 j@265@01))))
    (not (= (Seq_index xs@262@01 i@264@01) (Seq_index xs@262@01 j@265@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@262@01))
    j@265@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@262@01))
    j@265@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_index
    xs@262@01
    j@265@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@262@01)) i@264@01) (Seq_index
    xs@262@01
    j@265@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@262@01)) j@265@01) (Seq_index
    xs@262@01
    i@264@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@262@01)) j@265@01) (Seq_index
    xs@262@01
    i@264@01))
  :pattern ((Seq_index xs@262@01 i@264@01) (Seq_index xs@262@01 j@265@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@143@11@143@97|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Int ::(x in [0..|xs|)) ==> acc(xs[x].f, write))
(declare-const x@266@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) x@266@01))
; [eval] xs[x]
(push) ; 4
(assert (not (>= x@266@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< x@266@01 (Seq_length xs@262@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@267@01 $FVF<f>)
(declare-fun inv@268@01 ($Ref) Int)
(declare-fun img@269@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@266@01 Int) (x2@266@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) x1@266@01)
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) x2@266@01)
      (= (Seq_index xs@262@01 x1@266@01) (Seq_index xs@262@01 x2@266@01)))
    (= x1@266@01 x2@266@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@266@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) x@266@01)
    (and
      (= (inv@268@01 (Seq_index xs@262@01 x@266@01)) x@266@01)
      (img@269@01 (Seq_index xs@262@01 x@266@01))))
  :pattern ((Seq_index xs@262@01 x@266@01))
  :qid |quant-u-112|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@269@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) (inv@268@01 r)))
    (= (Seq_index xs@262@01 (inv@268@01 r)) r))
  :pattern ((inv@268@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@266@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) x@266@01)
    (not (= (Seq_index xs@262@01 x@266@01) $Ref.null)))
  :pattern ((Seq_index xs@262@01 x@266@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@270@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@269@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) (inv@268@01 r)))
    (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) r) ($FVF.lookup_f $t@267@01 r)))
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@267@01 r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@267@01 r) r)
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) (inv@268@01 r))
    ($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) r) r))
  :pattern ((inv@268@01 r))
  :qid |quant-u-113|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Int :: { xs[x].f } 0 <= x && x < |xs| ==> xs[x].f == 0)
(declare-const $t@271@01 $Snap)
(assert (= $t@271@01 $Snap.unit))
; [eval] (forall x: Int :: { xs[x].f } 0 <= x && x < |xs| ==> xs[x].f == 0)
(declare-const x@272@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= x && x < |xs| ==> xs[x].f == 0
; [eval] 0 <= x && x < |xs|
; [eval] 0 <= x
(push) ; 4
; [then-branch: 39 | !(0 <= x@272@01) | live]
; [else-branch: 39 | 0 <= x@272@01 | live]
(push) ; 5
; [then-branch: 39 | !(0 <= x@272@01)]
(assert (not (<= 0 x@272@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | 0 <= x@272@01]
(assert (<= 0 x@272@01))
; [eval] x < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@272@01) (not (<= 0 x@272@01))))
(push) ; 4
; [then-branch: 40 | 0 <= x@272@01 && x@272@01 < |xs@262@01| | live]
; [else-branch: 40 | !(0 <= x@272@01 && x@272@01 < |xs@262@01|) | live]
(push) ; 5
; [then-branch: 40 | 0 <= x@272@01 && x@272@01 < |xs@262@01|]
(assert (and (<= 0 x@272@01) (< x@272@01 (Seq_length xs@262@01))))
; [eval] xs[x].f == 0
; [eval] xs[x]
(push) ; 6
(assert (not (>= x@272@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@269@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) (inv@268@01 r)))
      (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) r) ($FVF.lookup_f $t@267@01 r)))
    :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@267@01 r))
    :qid |qp.fvfValDef97|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@267@01 r) r)
    :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef98|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index xs@262@01 x@272@01)) (Seq_index
  xs@262@01
  x@272@01)))
(push) ; 6
(assert (not (and
  (img@269@01 (Seq_index xs@262@01 x@272@01))
  (Seq_contains
    (Seq_range 0 (Seq_length xs@262@01))
    (inv@268@01 (Seq_index xs@262@01 x@272@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 40 | !(0 <= x@272@01 && x@272@01 < |xs@262@01|)]
(assert (not (and (<= 0 x@272@01) (< x@272@01 (Seq_length xs@262@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@269@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) (inv@268@01 r)))
    (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) r) ($FVF.lookup_f $t@267@01 r)))
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@267@01 r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@267@01 r) r)
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef98|)))
(assert (=>
  (and (<= 0 x@272@01) (< x@272@01 (Seq_length xs@262@01)))
  (and
    (<= 0 x@272@01)
    (< x@272@01 (Seq_length xs@262@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index
      xs@262@01
      x@272@01)) (Seq_index xs@262@01 x@272@01)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 x@272@01) (< x@272@01 (Seq_length xs@262@01))))
  (and (<= 0 x@272@01) (< x@272@01 (Seq_length xs@262@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@269@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) (inv@268@01 r)))
    (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) r) ($FVF.lookup_f $t@267@01 r)))
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@267@01 r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@267@01 r) r)
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef98|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@272@01 Int)) (!
  (and
    (or (<= 0 x@272@01) (not (<= 0 x@272@01)))
    (=>
      (and (<= 0 x@272@01) (< x@272@01 (Seq_length xs@262@01)))
      (and
        (<= 0 x@272@01)
        (< x@272@01 (Seq_length xs@262@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index
          xs@262@01
          x@272@01)) (Seq_index xs@262@01 x@272@01))))
    (or
      (not (and (<= 0 x@272@01) (< x@272@01 (Seq_length xs@262@01))))
      (and (<= 0 x@272@01) (< x@272@01 (Seq_length xs@262@01)))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index
    xs@262@01
    x@272@01)) (Seq_index xs@262@01 x@272@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@146@11@146@79-aux|)))
(assert (forall ((x@272@01 Int)) (!
  (=>
    (and (<= 0 x@272@01) (< x@272@01 (Seq_length xs@262@01)))
    (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index xs@262@01 x@272@01)) 0))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index
    xs@262@01
    x@272@01)) (Seq_index xs@262@01 x@272@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@146@11@146@79|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall x: Int :: { xs[x].f } 0 <= x && x < |xs| ==> xs[x].f == 0)
; [eval] (forall x: Int :: { xs[x].f } 0 <= x && x < |xs| ==> xs[x].f == 0)
(declare-const x@273@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= x && x < |xs| ==> xs[x].f == 0
; [eval] 0 <= x && x < |xs|
; [eval] 0 <= x
(push) ; 4
; [then-branch: 41 | !(0 <= x@273@01) | live]
; [else-branch: 41 | 0 <= x@273@01 | live]
(push) ; 5
; [then-branch: 41 | !(0 <= x@273@01)]
(assert (not (<= 0 x@273@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 41 | 0 <= x@273@01]
(assert (<= 0 x@273@01))
; [eval] x < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@273@01) (not (<= 0 x@273@01))))
(push) ; 4
; [then-branch: 42 | 0 <= x@273@01 && x@273@01 < |xs@262@01| | live]
; [else-branch: 42 | !(0 <= x@273@01 && x@273@01 < |xs@262@01|) | live]
(push) ; 5
; [then-branch: 42 | 0 <= x@273@01 && x@273@01 < |xs@262@01|]
(assert (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01))))
; [eval] xs[x].f == 0
; [eval] xs[x]
(push) ; 6
(assert (not (>= x@273@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@269@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) (inv@268@01 r)))
      (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) r) ($FVF.lookup_f $t@267@01 r)))
    :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@267@01 r))
    :qid |qp.fvfValDef97|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@267@01 r) r)
    :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef98|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index xs@262@01 x@273@01)) (Seq_index
  xs@262@01
  x@273@01)))
(push) ; 6
(assert (not (and
  (img@269@01 (Seq_index xs@262@01 x@273@01))
  (Seq_contains
    (Seq_range 0 (Seq_length xs@262@01))
    (inv@268@01 (Seq_index xs@262@01 x@273@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 42 | !(0 <= x@273@01 && x@273@01 < |xs@262@01|)]
(assert (not (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@269@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) (inv@268@01 r)))
    (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) r) ($FVF.lookup_f $t@267@01 r)))
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@267@01 r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@267@01 r) r)
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef98|)))
(assert (=>
  (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01)))
  (and
    (<= 0 x@273@01)
    (< x@273@01 (Seq_length xs@262@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index
      xs@262@01
      x@273@01)) (Seq_index xs@262@01 x@273@01)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01))))
  (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@269@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@262@01)) (inv@268@01 r)))
    (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) r) ($FVF.lookup_f $t@267@01 r)))
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@267@01 r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@267@01 r) r)
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef98|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@273@01 Int)) (!
  (and
    (or (<= 0 x@273@01) (not (<= 0 x@273@01)))
    (=>
      (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01)))
      (and
        (<= 0 x@273@01)
        (< x@273@01 (Seq_length xs@262@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index
          xs@262@01
          x@273@01)) (Seq_index xs@262@01 x@273@01))))
    (or
      (not (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01))))
      (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01)))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index
    xs@262@01
    x@273@01)) (Seq_index xs@262@01 x@273@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@147@11@147@79-aux|)))
(push) ; 3
(assert (not (forall ((x@273@01 Int)) (!
  (=>
    (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01)))
    (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index xs@262@01 x@273@01)) 0))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index
    xs@262@01
    x@273@01)) (Seq_index xs@262@01 x@273@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@147@11@147@79|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@273@01 Int)) (!
  (=>
    (and (<= 0 x@273@01) (< x@273@01 (Seq_length xs@262@01)))
    (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index xs@262@01 x@273@01)) 0))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index
    xs@262@01
    x@273@01)) (Seq_index xs@262@01 x@273@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@147@11@147@79|)))
(pop) ; 2
(pop) ; 1
; ---------- test07b ----------
(declare-const xs@274@01 Seq<$Ref>)
(declare-const xs@275@01 Seq<$Ref>)
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
;     { (i in [0..|xs|)), (j in [0..|xs|)) }
;     { (i in [0..|xs|)), xs[j] }
;     { (j in [0..|xs|)), xs[i] }
;     { xs[i], xs[j] }
;     (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const $t@276@01 $Snap)
(assert (= $t@276@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@277@01 Int)
(declare-const j@278@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 43 | !(i@277@01 in [0..|xs@275@01|]) | live]
; [else-branch: 43 | i@277@01 in [0..|xs@275@01|] | live]
(push) ; 5
; [then-branch: 43 | !(i@277@01 in [0..|xs@275@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 43 | i@277@01 in [0..|xs@275@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 44 | !(j@278@01 in [0..|xs@275@01|]) | live]
; [else-branch: 44 | j@278@01 in [0..|xs@275@01|] | live]
(push) ; 7
; [then-branch: 44 | !(j@278@01 in [0..|xs@275@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 44 | j@278@01 in [0..|xs@275@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01))))
(push) ; 4
; [then-branch: 45 | i@277@01 in [0..|xs@275@01|] && j@278@01 in [0..|xs@275@01|] && i@277@01 != j@278@01 | live]
; [else-branch: 45 | !(i@277@01 in [0..|xs@275@01|] && j@278@01 in [0..|xs@275@01|] && i@277@01 != j@278@01) | live]
(push) ; 5
; [then-branch: 45 | i@277@01 in [0..|xs@275@01|] && j@278@01 in [0..|xs@275@01|] && i@277@01 != j@278@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
    (not (= i@277@01 j@278@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@277@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@277@01 (Seq_length xs@275@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@278@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@278@01 (Seq_length xs@275@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 45 | !(i@277@01 in [0..|xs@275@01|] && j@278@01 in [0..|xs@275@01|] && i@277@01 != j@278@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
      (not (= i@277@01 j@278@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
      (not (= i@277@01 j@278@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
    (not (= i@277@01 j@278@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
        (not (= i@277@01 j@278@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
      (not (= i@277@01 j@278@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@277@01 Int) (j@278@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
        (not (= i@277@01 j@278@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
            (not (= i@277@01 j@278@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@275@01))
    j@278@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@275@01))
    j@278@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@151@11@151@97-aux|)))
(assert (forall ((i@277@01 Int) (j@278@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
        (not (= i@277@01 j@278@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
            (not (= i@277@01 j@278@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@275@01))
    j@278@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@151@11@151@97-aux|)))
(assert (forall ((i@277@01 Int) (j@278@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
        (not (= i@277@01 j@278@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
            (not (= i@277@01 j@278@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_index
    xs@275@01
    j@278@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_index
    xs@275@01
    j@278@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@151@11@151@97-aux|)))
(assert (forall ((i@277@01 Int) (j@278@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
        (not (= i@277@01 j@278@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
            (not (= i@277@01 j@278@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_index
    xs@275@01
    j@278@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@151@11@151@97-aux|)))
(assert (forall ((i@277@01 Int) (j@278@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
        (not (= i@277@01 j@278@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
            (not (= i@277@01 j@278@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01) (Seq_index
    xs@275@01
    i@277@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@275@01)) j@278@01) (Seq_index
    xs@275@01
    i@277@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@151@11@151@97-aux|)))
(assert (forall ((i@277@01 Int) (j@278@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
        (not (= i@277@01 j@278@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
            (not (= i@277@01 j@278@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@275@01)) j@278@01) (Seq_index
    xs@275@01
    i@277@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@151@11@151@97-aux|)))
(assert (forall ((i@277@01 Int) (j@278@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
        (not (= i@277@01 j@278@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
            (not (= i@277@01 j@278@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
          (not (= i@277@01 j@278@01))))))
  :pattern ((Seq_index xs@275@01 i@277@01) (Seq_index xs@275@01 j@278@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@151@11@151@97-aux|)))
(assert (forall ((i@277@01 Int) (j@278@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01)
        (not (= i@277@01 j@278@01))))
    (not (= (Seq_index xs@275@01 i@277@01) (Seq_index xs@275@01 j@278@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@275@01))
    j@278@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@275@01))
    j@278@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_index
    xs@275@01
    j@278@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@275@01)) i@277@01) (Seq_index
    xs@275@01
    j@278@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@275@01)) j@278@01) (Seq_index
    xs@275@01
    i@277@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@275@01)) j@278@01) (Seq_index
    xs@275@01
    i@277@01))
  :pattern ((Seq_index xs@275@01 i@277@01) (Seq_index xs@275@01 j@278@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@151@11@151@97|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Int ::(x in [0..|xs|)) ==> acc(xs[x].f, write))
(declare-const x@279@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) x@279@01))
; [eval] xs[x]
(push) ; 4
(assert (not (>= x@279@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< x@279@01 (Seq_length xs@275@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@280@01 $FVF<f>)
(declare-fun inv@281@01 ($Ref) Int)
(declare-fun img@282@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@279@01 Int) (x2@279@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) x1@279@01)
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) x2@279@01)
      (= (Seq_index xs@275@01 x1@279@01) (Seq_index xs@275@01 x2@279@01)))
    (= x1@279@01 x2@279@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@279@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) x@279@01)
    (and
      (= (inv@281@01 (Seq_index xs@275@01 x@279@01)) x@279@01)
      (img@282@01 (Seq_index xs@275@01 x@279@01))))
  :pattern ((Seq_index xs@275@01 x@279@01))
  :qid |quant-u-115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@282@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) (inv@281@01 r)))
    (= (Seq_index xs@275@01 (inv@281@01 r)) r))
  :pattern ((inv@281@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@279@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@275@01)) x@279@01)
    (not (= (Seq_index xs@275@01 x@279@01) $Ref.null)))
  :pattern ((Seq_index xs@275@01 x@279@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Int :: { xs[x] } 0 <= x && x < |xs| ==> xs[x].f == 0)
(declare-const $t@283@01 $Snap)
(assert (= $t@283@01 $Snap.unit))
; [eval] (forall x: Int :: { xs[x] } 0 <= x && x < |xs| ==> xs[x].f == 0)
(declare-const x@284@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= x && x < |xs| ==> xs[x].f == 0
; [eval] 0 <= x && x < |xs|
; [eval] 0 <= x
(push) ; 4
; [then-branch: 46 | !(0 <= x@284@01) | live]
; [else-branch: 46 | 0 <= x@284@01 | live]
(push) ; 5
; [then-branch: 46 | !(0 <= x@284@01)]
(assert (not (<= 0 x@284@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 46 | 0 <= x@284@01]
(assert (<= 0 x@284@01))
; [eval] x < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@284@01) (not (<= 0 x@284@01))))
(push) ; 4
; [then-branch: 47 | 0 <= x@284@01 && x@284@01 < |xs@275@01| | live]
; [else-branch: 47 | !(0 <= x@284@01 && x@284@01 < |xs@275@01|) | live]
(push) ; 5
; [then-branch: 47 | 0 <= x@284@01 && x@284@01 < |xs@275@01|]
(assert (and (<= 0 x@284@01) (< x@284@01 (Seq_length xs@275@01))))
; [eval] xs[x].f == 0
; [eval] xs[x]
(push) ; 6
(assert (not (>= x@284@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@282@01 (Seq_index xs@275@01 x@284@01))
  (Seq_contains
    (Seq_range 0 (Seq_length xs@275@01))
    (inv@281@01 (Seq_index xs@275@01 x@284@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 47 | !(0 <= x@284@01 && x@284@01 < |xs@275@01|)]
(assert (not (and (<= 0 x@284@01) (< x@284@01 (Seq_length xs@275@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 x@284@01) (< x@284@01 (Seq_length xs@275@01))))
  (and (<= 0 x@284@01) (< x@284@01 (Seq_length xs@275@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@284@01 Int)) (!
  (and
    (or (<= 0 x@284@01) (not (<= 0 x@284@01)))
    (or
      (not (and (<= 0 x@284@01) (< x@284@01 (Seq_length xs@275@01))))
      (and (<= 0 x@284@01) (< x@284@01 (Seq_length xs@275@01)))))
  :pattern ((Seq_index xs@275@01 x@284@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@154@11@154@69-aux|)))
(assert (forall ((x@284@01 Int)) (!
  (=>
    (and (<= 0 x@284@01) (< x@284@01 (Seq_length xs@275@01)))
    (= ($FVF.lookup_f $t@280@01 (Seq_index xs@275@01 x@284@01)) 0))
  :pattern ((Seq_index xs@275@01 x@284@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@154@11@154@69|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall x: Int :: { xs[x] } 0 <= x && x < |xs| ==> xs[x].f == 0)
; [eval] (forall x: Int :: { xs[x] } 0 <= x && x < |xs| ==> xs[x].f == 0)
(declare-const x@285@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= x && x < |xs| ==> xs[x].f == 0
; [eval] 0 <= x && x < |xs|
; [eval] 0 <= x
(push) ; 4
; [then-branch: 48 | !(0 <= x@285@01) | live]
; [else-branch: 48 | 0 <= x@285@01 | live]
(push) ; 5
; [then-branch: 48 | !(0 <= x@285@01)]
(assert (not (<= 0 x@285@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | 0 <= x@285@01]
(assert (<= 0 x@285@01))
; [eval] x < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@285@01) (not (<= 0 x@285@01))))
(push) ; 4
; [then-branch: 49 | 0 <= x@285@01 && x@285@01 < |xs@275@01| | live]
; [else-branch: 49 | !(0 <= x@285@01 && x@285@01 < |xs@275@01|) | live]
(push) ; 5
; [then-branch: 49 | 0 <= x@285@01 && x@285@01 < |xs@275@01|]
(assert (and (<= 0 x@285@01) (< x@285@01 (Seq_length xs@275@01))))
; [eval] xs[x].f == 0
; [eval] xs[x]
(push) ; 6
(assert (not (>= x@285@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@282@01 (Seq_index xs@275@01 x@285@01))
  (Seq_contains
    (Seq_range 0 (Seq_length xs@275@01))
    (inv@281@01 (Seq_index xs@275@01 x@285@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 49 | !(0 <= x@285@01 && x@285@01 < |xs@275@01|)]
(assert (not (and (<= 0 x@285@01) (< x@285@01 (Seq_length xs@275@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 x@285@01) (< x@285@01 (Seq_length xs@275@01))))
  (and (<= 0 x@285@01) (< x@285@01 (Seq_length xs@275@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@285@01 Int)) (!
  (and
    (or (<= 0 x@285@01) (not (<= 0 x@285@01)))
    (or
      (not (and (<= 0 x@285@01) (< x@285@01 (Seq_length xs@275@01))))
      (and (<= 0 x@285@01) (< x@285@01 (Seq_length xs@275@01)))))
  :pattern ((Seq_index xs@275@01 x@285@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@155@11@155@69-aux|)))
(push) ; 3
(assert (not (forall ((x@285@01 Int)) (!
  (=>
    (and (<= 0 x@285@01) (< x@285@01 (Seq_length xs@275@01)))
    (= ($FVF.lookup_f $t@280@01 (Seq_index xs@275@01 x@285@01)) 0))
  :pattern ((Seq_index xs@275@01 x@285@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@155@11@155@69|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@285@01 Int)) (!
  (=>
    (and (<= 0 x@285@01) (< x@285@01 (Seq_length xs@275@01)))
    (= ($FVF.lookup_f $t@280@01 (Seq_index xs@275@01 x@285@01)) 0))
  :pattern ((Seq_index xs@275@01 x@285@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/triggers_field_deref.vpr@155@11@155@69|)))
(pop) ; 2
(pop) ; 1
