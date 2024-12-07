(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:05
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersInhaleExhale.vpr
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
; ---------- m7 ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const xs@1@01 Seq<$Ref>)
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
; var v: Int
(declare-const v@2@01 Int)
; [exec]
; inhale |xs| >= 1
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] |xs| >= 1
; [eval] |xs|
(assert (>= (Seq_length xs@1@01) 1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@5@01 Int)
(declare-const j@6@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 0 | !(i@5@01 >= 0) | live]
; [else-branch: 0 | i@5@01 >= 0 | live]
(push) ; 5
; [then-branch: 0 | !(i@5@01 >= 0)]
(assert (not (>= i@5@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i@5@01 >= 0]
(assert (>= i@5@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 1 | !(i@5@01 < |xs@1@01|) | live]
; [else-branch: 1 | i@5@01 < |xs@1@01| | live]
(push) ; 7
; [then-branch: 1 | !(i@5@01 < |xs@1@01|)]
(assert (not (< i@5@01 (Seq_length xs@1@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i@5@01 < |xs@1@01|]
(assert (< i@5@01 (Seq_length xs@1@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 2 | !(j@6@01 >= 0) | live]
; [else-branch: 2 | j@6@01 >= 0 | live]
(push) ; 9
; [then-branch: 2 | !(j@6@01 >= 0)]
(assert (not (>= j@6@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | j@6@01 >= 0]
(assert (>= j@6@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 3 | !(j@6@01 < |xs@1@01|) | live]
; [else-branch: 3 | j@6@01 < |xs@1@01| | live]
(push) ; 11
; [then-branch: 3 | !(j@6@01 < |xs@1@01|)]
(assert (not (< j@6@01 (Seq_length xs@1@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | j@6@01 < |xs@1@01|]
(assert (< j@6@01 (Seq_length xs@1@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@6@01 (Seq_length xs@1@01)) (not (< j@6@01 (Seq_length xs@1@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@6@01 0)
  (and
    (>= j@6@01 0)
    (or (< j@6@01 (Seq_length xs@1@01)) (not (< j@6@01 (Seq_length xs@1@01)))))))
(assert (or (>= j@6@01 0) (not (>= j@6@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@5@01 (Seq_length xs@1@01))
  (and
    (< i@5@01 (Seq_length xs@1@01))
    (=>
      (>= j@6@01 0)
      (and
        (>= j@6@01 0)
        (or
          (< j@6@01 (Seq_length xs@1@01))
          (not (< j@6@01 (Seq_length xs@1@01))))))
    (or (>= j@6@01 0) (not (>= j@6@01 0))))))
(assert (or (< i@5@01 (Seq_length xs@1@01)) (not (< i@5@01 (Seq_length xs@1@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@5@01 0)
  (and
    (>= i@5@01 0)
    (=>
      (< i@5@01 (Seq_length xs@1@01))
      (and
        (< i@5@01 (Seq_length xs@1@01))
        (=>
          (>= j@6@01 0)
          (and
            (>= j@6@01 0)
            (or
              (< j@6@01 (Seq_length xs@1@01))
              (not (< j@6@01 (Seq_length xs@1@01))))))
        (or (>= j@6@01 0) (not (>= j@6@01 0)))))
    (or (< i@5@01 (Seq_length xs@1@01)) (not (< i@5@01 (Seq_length xs@1@01)))))))
(assert (or (>= i@5@01 0) (not (>= i@5@01 0))))
(push) ; 4
; [then-branch: 4 | i@5@01 >= 0 && i@5@01 < |xs@1@01| && j@6@01 >= 0 && j@6@01 < |xs@1@01| && i@5@01 != j@6@01 | live]
; [else-branch: 4 | !(i@5@01 >= 0 && i@5@01 < |xs@1@01| && j@6@01 >= 0 && j@6@01 < |xs@1@01| && i@5@01 != j@6@01) | live]
(push) ; 5
; [then-branch: 4 | i@5@01 >= 0 && i@5@01 < |xs@1@01| && j@6@01 >= 0 && j@6@01 < |xs@1@01| && i@5@01 != j@6@01]
(assert (and
  (>= i@5@01 0)
  (and
    (< i@5@01 (Seq_length xs@1@01))
    (and
      (>= j@6@01 0)
      (and (< j@6@01 (Seq_length xs@1@01)) (not (= i@5@01 j@6@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@5@01 >= 0 && i@5@01 < |xs@1@01| && j@6@01 >= 0 && j@6@01 < |xs@1@01| && i@5@01 != j@6@01)]
(assert (not
  (and
    (>= i@5@01 0)
    (and
      (< i@5@01 (Seq_length xs@1@01))
      (and
        (>= j@6@01 0)
        (and (< j@6@01 (Seq_length xs@1@01)) (not (= i@5@01 j@6@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@5@01 0)
    (and
      (< i@5@01 (Seq_length xs@1@01))
      (and
        (>= j@6@01 0)
        (and (< j@6@01 (Seq_length xs@1@01)) (not (= i@5@01 j@6@01))))))
  (and
    (>= i@5@01 0)
    (< i@5@01 (Seq_length xs@1@01))
    (>= j@6@01 0)
    (< j@6@01 (Seq_length xs@1@01))
    (not (= i@5@01 j@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@5@01 0)
      (and
        (< i@5@01 (Seq_length xs@1@01))
        (and
          (>= j@6@01 0)
          (and (< j@6@01 (Seq_length xs@1@01)) (not (= i@5@01 j@6@01)))))))
  (and
    (>= i@5@01 0)
    (and
      (< i@5@01 (Seq_length xs@1@01))
      (and
        (>= j@6@01 0)
        (and (< j@6@01 (Seq_length xs@1@01)) (not (= i@5@01 j@6@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@5@01 Int) (j@6@01 Int)) (!
  (and
    (=>
      (>= i@5@01 0)
      (and
        (>= i@5@01 0)
        (=>
          (< i@5@01 (Seq_length xs@1@01))
          (and
            (< i@5@01 (Seq_length xs@1@01))
            (=>
              (>= j@6@01 0)
              (and
                (>= j@6@01 0)
                (or
                  (< j@6@01 (Seq_length xs@1@01))
                  (not (< j@6@01 (Seq_length xs@1@01))))))
            (or (>= j@6@01 0) (not (>= j@6@01 0)))))
        (or
          (< i@5@01 (Seq_length xs@1@01))
          (not (< i@5@01 (Seq_length xs@1@01))))))
    (or (>= i@5@01 0) (not (>= i@5@01 0)))
    (=>
      (and
        (>= i@5@01 0)
        (and
          (< i@5@01 (Seq_length xs@1@01))
          (and
            (>= j@6@01 0)
            (and (< j@6@01 (Seq_length xs@1@01)) (not (= i@5@01 j@6@01))))))
      (and
        (>= i@5@01 0)
        (< i@5@01 (Seq_length xs@1@01))
        (>= j@6@01 0)
        (< j@6@01 (Seq_length xs@1@01))
        (not (= i@5@01 j@6@01))))
    (or
      (not
        (and
          (>= i@5@01 0)
          (and
            (< i@5@01 (Seq_length xs@1@01))
            (and
              (>= j@6@01 0)
              (and (< j@6@01 (Seq_length xs@1@01)) (not (= i@5@01 j@6@01)))))))
      (and
        (>= i@5@01 0)
        (and
          (< i@5@01 (Seq_length xs@1@01))
          (and
            (>= j@6@01 0)
            (and (< j@6@01 (Seq_length xs@1@01)) (not (= i@5@01 j@6@01))))))))
  :pattern ((Seq_index xs@1@01 i@5@01) (Seq_index xs@1@01 j@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersInhaleExhale.vpr@9@9@9@101-aux|)))
(assert (forall ((i@5@01 Int) (j@6@01 Int)) (!
  (=>
    (and
      (>= i@5@01 0)
      (and
        (< i@5@01 (Seq_length xs@1@01))
        (and
          (>= j@6@01 0)
          (and (< j@6@01 (Seq_length xs@1@01)) (not (= i@5@01 j@6@01))))))
    (not (= (Seq_index xs@1@01 i@5@01) (Seq_index xs@1@01 j@6@01))))
  :pattern ((Seq_index xs@1@01 i@5@01) (Seq_index xs@1@01 j@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersInhaleExhale.vpr@9@9@9@101|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { xs[i].f }
;     0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@7@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
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
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@7@01) (not (<= 0 i@7@01))))
(assert (and (<= 0 i@7@01) (< i@7@01 (Seq_length xs@1@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@7@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const sm@8@01 $FVF<f>)
; Definitional axioms for snapshot map values
; [eval] xs[i]
(pop) ; 3
(declare-const $t@9@01 $FVF<f>)
(declare-fun inv@10@01 ($Ref) Int)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@7@01 Int)) (!
  (=>
    (and (<= 0 i@7@01) (< i@7@01 (Seq_length xs@1@01)))
    (or (<= 0 i@7@01) (not (<= 0 i@7@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@9@01 (Seq_index xs@1@01 i@7@01)) (Seq_index
    xs@1@01
    i@7@01)))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@7@01 Int) (i2@7@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@7@01) (< i1@7@01 (Seq_length xs@1@01)))
      (and (<= 0 i2@7@01) (< i2@7@01 (Seq_length xs@1@01)))
      (= (Seq_index xs@1@01 i1@7@01) (Seq_index xs@1@01 i2@7@01)))
    (= i1@7@01 i2@7@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@7@01 Int)) (!
  (=>
    (and (<= 0 i@7@01) (< i@7@01 (Seq_length xs@1@01)))
    (and
      (= (inv@10@01 (Seq_index xs@1@01 i@7@01)) i@7@01)
      (img@11@01 (Seq_index xs@1@01 i@7@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@9@01 (Seq_index xs@1@01 i@7@01)) (Seq_index
    xs@1@01
    i@7@01)))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length xs@1@01))))
    (= (Seq_index xs@1@01 (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@7@01 Int)) (!
  (=>
    (and (<= 0 i@7@01) (< i@7@01 (Seq_length xs@1@01)))
    (not (= (Seq_index xs@1@01 i@7@01) $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@9@01 (Seq_index xs@1@01 i@7@01)) (Seq_index
    xs@1@01
    i@7@01)))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@12@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length xs@1@01))))
    (= ($FVF.lookup_f (as sm@12@01  $FVF<f>) r) ($FVF.lookup_f $t@9@01 r)))
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@9@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@9@01 r) r)
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length xs@1@01)))
    ($FVF.loc_f ($FVF.lookup_f (as sm@12@01  $FVF<f>) r) r))
  :pattern ((inv@10@01 r))
  :qid |quant-u-2|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; v := xs[0].f
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@11@01 r)
        (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length xs@1@01))))
      (= ($FVF.lookup_f (as sm@12@01  $FVF<f>) r) ($FVF.lookup_f $t@9@01 r)))
    :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@9@01 r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@9@01 r) r)
    :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@12@01  $FVF<f>) (Seq_index xs@1@01 0)) (Seq_index
  xs@1@01
  0)))
(push) ; 3
(assert (not (and
  (img@11@01 (Seq_index xs@1@01 0))
  (and
    (<= 0 (inv@10@01 (Seq_index xs@1@01 0)))
    (< (inv@10@01 (Seq_index xs@1@01 0)) (Seq_length xs@1@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const v@13@01 Int)
(assert (= v@13@01 ($FVF.lookup_f (as sm@12@01  $FVF<f>) (Seq_index xs@1@01 0))))
; [exec]
; assert perm(xs[0].f) >= write
; [eval] perm(xs[0].f) >= write
; [eval] perm(xs[0].f)
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(declare-const pm@14@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@14@01  $FPM) r)
    (ite
      (and
        (img@11@01 r)
        (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length xs@1@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@14@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@12@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@9@01 r) r))
  :pattern (($FVF.perm_f (as pm@14@01  $FPM) r))
  :qid |qp.resTrgDef4|)))
; perm(xs[0].f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@14@01  $FPM) (Seq_index xs@1@01 0)) $Perm.Write))
(push) ; 3
(assert (not (>= ($FVF.perm_f (as pm@14@01  $FPM) (Seq_index xs@1@01 0)) $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= ($FVF.perm_f (as pm@14@01  $FPM) (Seq_index xs@1@01 0)) $Perm.Write))
; [exec]
; exhale (forall i: Int ::
;     { xs[i].f }
;     0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@15@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 6 | !(0 <= i@15@01) | live]
; [else-branch: 6 | 0 <= i@15@01 | live]
(push) ; 5
; [then-branch: 6 | !(0 <= i@15@01)]
(assert (not (<= 0 i@15@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 <= i@15@01]
(assert (<= 0 i@15@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
(assert (and (<= 0 i@15@01) (< i@15@01 (Seq_length xs@1@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; [eval] xs[i]
(pop) ; 3
(declare-fun inv@16@01 ($Ref) Int)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 (Seq_length xs@1@01)))
    (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@12@01  $FVF<f>) (Seq_index
    xs@1@01
    i@15@01)) (Seq_index xs@1@01 i@15@01)))
  :qid |f-aux|)))
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@15@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@15@01) (< i1@15@01 (Seq_length xs@1@01)))
        ($FVF.loc_f ($FVF.lookup_f (as sm@12@01  $FVF<f>) (Seq_index
          xs@1@01
          i1@15@01)) (Seq_index xs@1@01 i1@15@01)))
      (and
        (and (<= 0 i2@15@01) (< i2@15@01 (Seq_length xs@1@01)))
        ($FVF.loc_f ($FVF.lookup_f (as sm@12@01  $FVF<f>) (Seq_index
          xs@1@01
          i2@15@01)) (Seq_index xs@1@01 i2@15@01)))
      (= (Seq_index xs@1@01 i1@15@01) (Seq_index xs@1@01 i2@15@01)))
    (= i1@15@01 i2@15@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 (Seq_length xs@1@01)))
    (and
      (= (inv@16@01 (Seq_index xs@1@01 i@15@01)) i@15@01)
      (img@17@01 (Seq_index xs@1@01 i@15@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@12@01  $FVF<f>) (Seq_index
    xs@1@01
    i@15@01)) (Seq_index xs@1@01 i@15@01)))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@01 r)
      (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) (Seq_length xs@1@01))))
    (= (Seq_index xs@1@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) (Seq_length xs@1@01)))
    ($FVF.loc_f ($FVF.lookup_f (as sm@12@01  $FVF<f>) r) r))
  :pattern ((inv@16@01 r))
  :qid |quant-u-4|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) (Seq_length xs@1@01)))
      (img@17@01 r)
      (= r (Seq_index xs@1@01 (inv@16@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length xs@1@01))))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@11@01 r)
          (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length xs@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@18@01 r))
    $Perm.No)
  
  :qid |quant-u-6|))))
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
      (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) (Seq_length xs@1@01)))
      (img@17@01 r)
      (= r (Seq_index xs@1@01 (inv@16@01 r))))
    (= (- $Perm.Write (pTaken@18@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; assert (forall i: Int ::
;     { xs[i] }
;     0 <= i && i < |xs| ==> perm(xs[i].f) == none)
; [eval] (forall i: Int :: { xs[i] } 0 <= i && i < |xs| ==> perm(xs[i].f) == none)
(declare-const i@19@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs| ==> perm(xs[i].f) == none
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 7 | !(0 <= i@19@01) | live]
; [else-branch: 7 | 0 <= i@19@01 | live]
(push) ; 5
; [then-branch: 7 | !(0 <= i@19@01)]
(assert (not (<= 0 i@19@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | 0 <= i@19@01]
(assert (<= 0 i@19@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
(push) ; 4
; [then-branch: 8 | 0 <= i@19@01 && i@19@01 < |xs@1@01| | live]
; [else-branch: 8 | !(0 <= i@19@01 && i@19@01 < |xs@1@01|) | live]
(push) ; 5
; [then-branch: 8 | 0 <= i@19@01 && i@19@01 < |xs@1@01|]
(assert (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01))))
; [eval] perm(xs[i].f) == none
; [eval] perm(xs[i].f)
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@19@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-const pm@21@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@21@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@21@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r)
  :pattern (($FVF.perm_f (as pm@21@01  $FPM) r))
  :qid |qp.resTrgDef7|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) (Seq_index xs@1@01 i@19@01)) (Seq_index
  xs@1@01
  i@19@01)))
; perm(xs[i].f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@21@01  $FPM) (Seq_index xs@1@01 i@19@01)) $Perm.Write))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(0 <= i@19@01 && i@19@01 < |xs@1@01|)]
(assert (not (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@21@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@21@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r)
  :pattern (($FVF.perm_f (as pm@21@01  $FPM) r))
  :qid |qp.resTrgDef7|)))
(assert (=>
  (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01)))
  (and
    (<= 0 i@19@01)
    (< i@19@01 (Seq_length xs@1@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) (Seq_index xs@1@01 i@19@01)) (Seq_index
      xs@1@01
      i@19@01))
    (<=
      ($FVF.perm_f (as pm@21@01  $FPM) (Seq_index xs@1@01 i@19@01))
      $Perm.Write))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01))))
  (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@21@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@21@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r)
  :pattern (($FVF.perm_f (as pm@21@01  $FPM) r))
  :qid |qp.resTrgDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@19@01 Int)) (!
  (and
    (or (<= 0 i@19@01) (not (<= 0 i@19@01)))
    (=>
      (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01)))
      (and
        (<= 0 i@19@01)
        (< i@19@01 (Seq_length xs@1@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) (Seq_index
          xs@1@01
          i@19@01)) (Seq_index xs@1@01 i@19@01))
        (<=
          ($FVF.perm_f (as pm@21@01  $FPM) (Seq_index xs@1@01 i@19@01))
          $Perm.Write)))
    (or
      (not (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01))))
      (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01)))))
  :pattern ((Seq_index xs@1@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersInhaleExhale.vpr@17@12@17@73-aux|)))
(push) ; 3
(assert (not (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01)))
    (= ($FVF.perm_f (as pm@21@01  $FPM) (Seq_index xs@1@01 i@19@01)) $Perm.No))
  :pattern ((Seq_index xs@1@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersInhaleExhale.vpr@17@12@17@73|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 (Seq_length xs@1@01)))
    (= ($FVF.perm_f (as pm@21@01  $FPM) (Seq_index xs@1@01 i@19@01)) $Perm.No))
  :pattern ((Seq_index xs@1@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersInhaleExhale.vpr@17@12@17@73|)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const xs@22@01 Set<$Ref>)
(declare-const ys@23@01 Set<$Ref>)
(declare-const xs@24@01 Set<$Ref>)
(declare-const ys@25@01 Set<$Ref>)
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
; var a: Ref
(declare-const a@26@01 $Ref)
; [exec]
; inhale (forall x: Ref :: { x.f } (x in xs) ==> acc(x.f, write))
(declare-const x@27@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@27@01 xs@24@01))
(declare-const sm@28@01 $FVF<f>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@29@01 $FVF<f>)
(declare-fun inv@30@01 ($Ref) $Ref)
(declare-fun img@31@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@27@01 xs@24@01)
      (Set_in x2@27@01 xs@24@01)
      (= x1@27@01 x2@27@01))
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
    (Set_in x@27@01 xs@24@01)
    (and (= (inv@30@01 x@27@01) x@27@01) (img@31@01 x@27@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@29@01 x@27@01) x@27@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@31@01 r) (Set_in (inv@30@01 r) xs@24@01)) (= (inv@30@01 r) r))
  :pattern ((inv@30@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@27@01 $Ref)) (!
  (=> (Set_in x@27@01 xs@24@01) (not (= x@27@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@29@01 x@27@01) x@27@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@32@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (Set_in (inv@30@01 r) xs@24@01))
    (= ($FVF.lookup_f (as sm@32@01  $FVF<f>) r) ($FVF.lookup_f $t@29@01 r)))
  :pattern (($FVF.lookup_f (as sm@32@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@29@01 r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@29@01 r) r)
  :pattern (($FVF.lookup_f (as sm@32@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@30@01 r) xs@24@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@32@01  $FVF<f>) r) r))
  :pattern ((inv@30@01 r))
  :qid |quant-u-10|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall y: Ref :: { y.f } (y in ys) ==> acc(y.f, write))
(declare-const y@33@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (y in ys)
(assert (Set_in y@33@01 ys@25@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@34@01 $FVF<f>)
(declare-fun inv@35@01 ($Ref) $Ref)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((y1@33@01 $Ref) (y2@33@01 $Ref)) (!
  (=>
    (and
      (Set_in y1@33@01 ys@25@01)
      (Set_in y2@33@01 ys@25@01)
      (= y1@33@01 y2@33@01))
    (= y1@33@01 y2@33@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@33@01 $Ref)) (!
  (=>
    (Set_in y@33@01 ys@25@01)
    (and (= (inv@35@01 y@33@01) y@33@01) (img@36@01 y@33@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@34@01 y@33@01) y@33@01))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@36@01 r) (Set_in (inv@35@01 r) ys@25@01)) (= (inv@35@01 r) r))
  :pattern ((inv@35@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@33@01 $Ref)) (!
  (=> (Set_in y@33@01 ys@25@01) (not (= y@33@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@34@01 y@33@01) y@33@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= y@33@01 x@27@01)
    (=
      (and (img@36@01 r) (Set_in (inv@35@01 r) ys@25@01))
      (and (img@31@01 r) (Set_in (inv@30@01 r) xs@24@01))))
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@37@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (Set_in (inv@30@01 r) xs@24@01))
    (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@29@01 r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@29@01 r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (Set_in (inv@35@01 r) ys@25@01))
    (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@29@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@35@01 r) ys@25@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) r))
  :pattern ((inv@35@01 r))
  :qid |quant-u-14|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (a in xs)
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 $Snap.unit))
; [eval] (a in xs)
(assert (Set_in a@26@01 xs@24@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (a in ys)
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 $Snap.unit))
; [eval] (a in ys)
(assert (Set_in a@26@01 ys@25@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert perm(a.f) == 2 * write
; [eval] perm(a.f) == 2 * write
; [eval] perm(a.f)
; Definitional axioms for snapshot map values
(declare-const pm@40@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@40@01  $FPM) r)
    (+
      (ite
        (and (img@31@01 r) (Set_in (inv@30@01 r) xs@24@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@36@01 r) (Set_in (inv@35@01 r) ys@25@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@40@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@29@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r))
  :pattern (($FVF.perm_f (as pm@40@01  $FPM) r))
  :qid |qp.resTrgDef15|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) a@26@01) a@26@01))
; perm(a.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@40@01  $FPM) a@26@01) $Perm.Write))
; [eval] 2 * write
(set-option :timeout 0)
(push) ; 3
(assert (not (= ($FVF.perm_f (as pm@40@01  $FPM) a@26@01) (/ (to_real 2) (to_real 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.perm_f (as pm@40@01  $FPM) a@26@01) (/ (to_real 2) (to_real 1))))
; [exec]
; assert false
(check-sat)
; unsat
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const xs@41@01 Seq<$Ref>)
(declare-const xs@42@01 Seq<$Ref>)
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
; var y: Ref
(declare-const y@43@01 $Ref)
; [exec]
; var z: Ref
(declare-const z@44@01 $Ref)
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@45@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@42@01 x@45@01))
(pop) ; 3
(declare-const $t@46@01 $FVF<f>)
(declare-fun inv@47@01 ($Ref) $Ref)
(declare-fun img@48@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@45@01 $Ref) (x2@45@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@42@01 x1@45@01)
      (Seq_contains xs@42@01 x2@45@01)
      (= x1@45@01 x2@45@01))
    (= x1@45@01 x2@45@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (Seq_contains xs@42@01 x@45@01)
    (and (= (inv@47@01 x@45@01) x@45@01) (img@48@01 x@45@01)))
  :pattern ((Seq_contains xs@42@01 x@45@01))
  :pattern ((Seq_contains_trigger xs@42@01 x@45@01))
  :pattern ((Seq_contains_trigger xs@42@01 x@45@01))
  :pattern ((inv@47@01 x@45@01))
  :pattern ((img@48@01 x@45@01))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@48@01 r) (Seq_contains xs@42@01 (inv@47@01 r)))
    (= (inv@47@01 r) r))
  :pattern ((inv@47@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@45@01 $Ref)) (!
  (=> (Seq_contains xs@42@01 x@45@01) (not (= x@45@01 $Ref.null)))
  :pattern ((Seq_contains xs@42@01 x@45@01))
  :pattern ((Seq_contains_trigger xs@42@01 x@45@01))
  :pattern ((Seq_contains_trigger xs@42@01 x@45@01))
  :pattern ((inv@47@01 x@45@01))
  :pattern ((img@48@01 x@45@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@49@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@48@01 r) (Seq_contains xs@42@01 (inv@47@01 r)))
    (= ($FVF.lookup_f (as sm@49@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@46@01 r) r)
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains xs@42@01 (inv@47@01 r))
    ($FVF.loc_f ($FVF.lookup_f (as sm@49@01  $FVF<f>) r) r))
  :pattern ((inv@47@01 r))
  :qid |quant-u-17|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref :: { x.f } (x in xs) ==> x != y)
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 $Snap.unit))
; [eval] (forall x: Ref :: { x.f } (x in xs) ==> x != y)
(declare-const x@51@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> x != y
; [eval] (x in xs)
(push) ; 4
; [then-branch: 9 | x@51@01 in xs@42@01 | live]
; [else-branch: 9 | !(x@51@01 in xs@42@01) | live]
(push) ; 5
; [then-branch: 9 | x@51@01 in xs@42@01]
(assert (Seq_contains xs@42@01 x@51@01))
; [eval] x != y
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(x@51@01 in xs@42@01)]
(assert (not (Seq_contains xs@42@01 x@51@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Seq_contains xs@42@01 x@51@01)) (Seq_contains xs@42@01 x@51@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@51@01 $Ref)) (!
  (or (not (Seq_contains xs@42@01 x@51@01)) (Seq_contains xs@42@01 x@51@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@49@01  $FVF<f>) x@51@01) x@51@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersInhaleExhale.vpr@35@12@35@53-aux|)))
(assert (forall ((x@51@01 $Ref)) (!
  (=> (Seq_contains xs@42@01 x@51@01) (not (= x@51@01 y@43@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@49@01  $FVF<f>) x@51@01) x@51@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersInhaleExhale.vpr@35@12@35@53|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (z in xs)
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 $Snap.unit))
; [eval] (z in xs)
(assert (Seq_contains xs@42@01 z@44@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert z != y
; [eval] z != y
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= z@44@01 y@43@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@44@01 y@43@01)))
(pop) ; 2
(pop) ; 1
