(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0314d.vpr
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
(declare-const xs@0@01 Seq<$Ref>)
(declare-const p@1@01 $Perm)
(declare-const xs@2@01 Seq<$Ref>)
(declare-const p@3@01 $Perm)
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
; var k: Int
(declare-const k@4@01 Int)
; [exec]
; inhale none < p && p < write
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.first $t@5@01) $Snap.unit))
; [eval] none < p
(assert (< $Perm.No p@3@01))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] p < write
(assert (< p@3@01 $Perm.Write))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@7@01 Int)
(declare-const j@8@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 0 | !(i@7@01 >= 0) | live]
; [else-branch: 0 | i@7@01 >= 0 | live]
(push) ; 5
; [then-branch: 0 | !(i@7@01 >= 0)]
(assert (not (>= i@7@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i@7@01 >= 0]
(assert (>= i@7@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 1 | !(i@7@01 < |xs@2@01|) | live]
; [else-branch: 1 | i@7@01 < |xs@2@01| | live]
(push) ; 7
; [then-branch: 1 | !(i@7@01 < |xs@2@01|)]
(assert (not (< i@7@01 (Seq_length xs@2@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i@7@01 < |xs@2@01|]
(assert (< i@7@01 (Seq_length xs@2@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 2 | !(j@8@01 >= 0) | live]
; [else-branch: 2 | j@8@01 >= 0 | live]
(push) ; 9
; [then-branch: 2 | !(j@8@01 >= 0)]
(assert (not (>= j@8@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | j@8@01 >= 0]
(assert (>= j@8@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 3 | !(j@8@01 < |xs@2@01|) | live]
; [else-branch: 3 | j@8@01 < |xs@2@01| | live]
(push) ; 11
; [then-branch: 3 | !(j@8@01 < |xs@2@01|)]
(assert (not (< j@8@01 (Seq_length xs@2@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | j@8@01 < |xs@2@01|]
(assert (< j@8@01 (Seq_length xs@2@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@8@01 (Seq_length xs@2@01)) (not (< j@8@01 (Seq_length xs@2@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@8@01 0)
  (and
    (>= j@8@01 0)
    (or (< j@8@01 (Seq_length xs@2@01)) (not (< j@8@01 (Seq_length xs@2@01)))))))
(assert (or (>= j@8@01 0) (not (>= j@8@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@7@01 (Seq_length xs@2@01))
  (and
    (< i@7@01 (Seq_length xs@2@01))
    (=>
      (>= j@8@01 0)
      (and
        (>= j@8@01 0)
        (or
          (< j@8@01 (Seq_length xs@2@01))
          (not (< j@8@01 (Seq_length xs@2@01))))))
    (or (>= j@8@01 0) (not (>= j@8@01 0))))))
(assert (or (< i@7@01 (Seq_length xs@2@01)) (not (< i@7@01 (Seq_length xs@2@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@7@01 0)
  (and
    (>= i@7@01 0)
    (=>
      (< i@7@01 (Seq_length xs@2@01))
      (and
        (< i@7@01 (Seq_length xs@2@01))
        (=>
          (>= j@8@01 0)
          (and
            (>= j@8@01 0)
            (or
              (< j@8@01 (Seq_length xs@2@01))
              (not (< j@8@01 (Seq_length xs@2@01))))))
        (or (>= j@8@01 0) (not (>= j@8@01 0)))))
    (or (< i@7@01 (Seq_length xs@2@01)) (not (< i@7@01 (Seq_length xs@2@01)))))))
(assert (or (>= i@7@01 0) (not (>= i@7@01 0))))
(push) ; 4
; [then-branch: 4 | i@7@01 >= 0 && i@7@01 < |xs@2@01| && j@8@01 >= 0 && j@8@01 < |xs@2@01| && i@7@01 != j@8@01 | live]
; [else-branch: 4 | !(i@7@01 >= 0 && i@7@01 < |xs@2@01| && j@8@01 >= 0 && j@8@01 < |xs@2@01| && i@7@01 != j@8@01) | live]
(push) ; 5
; [then-branch: 4 | i@7@01 >= 0 && i@7@01 < |xs@2@01| && j@8@01 >= 0 && j@8@01 < |xs@2@01| && i@7@01 != j@8@01]
(assert (and
  (>= i@7@01 0)
  (and
    (< i@7@01 (Seq_length xs@2@01))
    (and
      (>= j@8@01 0)
      (and (< j@8@01 (Seq_length xs@2@01)) (not (= i@7@01 j@8@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@7@01 >= 0 && i@7@01 < |xs@2@01| && j@8@01 >= 0 && j@8@01 < |xs@2@01| && i@7@01 != j@8@01)]
(assert (not
  (and
    (>= i@7@01 0)
    (and
      (< i@7@01 (Seq_length xs@2@01))
      (and
        (>= j@8@01 0)
        (and (< j@8@01 (Seq_length xs@2@01)) (not (= i@7@01 j@8@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@7@01 0)
    (and
      (< i@7@01 (Seq_length xs@2@01))
      (and
        (>= j@8@01 0)
        (and (< j@8@01 (Seq_length xs@2@01)) (not (= i@7@01 j@8@01))))))
  (and
    (>= i@7@01 0)
    (< i@7@01 (Seq_length xs@2@01))
    (>= j@8@01 0)
    (< j@8@01 (Seq_length xs@2@01))
    (not (= i@7@01 j@8@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@7@01 0)
      (and
        (< i@7@01 (Seq_length xs@2@01))
        (and
          (>= j@8@01 0)
          (and (< j@8@01 (Seq_length xs@2@01)) (not (= i@7@01 j@8@01)))))))
  (and
    (>= i@7@01 0)
    (and
      (< i@7@01 (Seq_length xs@2@01))
      (and
        (>= j@8@01 0)
        (and (< j@8@01 (Seq_length xs@2@01)) (not (= i@7@01 j@8@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@7@01 Int) (j@8@01 Int)) (!
  (and
    (=>
      (>= i@7@01 0)
      (and
        (>= i@7@01 0)
        (=>
          (< i@7@01 (Seq_length xs@2@01))
          (and
            (< i@7@01 (Seq_length xs@2@01))
            (=>
              (>= j@8@01 0)
              (and
                (>= j@8@01 0)
                (or
                  (< j@8@01 (Seq_length xs@2@01))
                  (not (< j@8@01 (Seq_length xs@2@01))))))
            (or (>= j@8@01 0) (not (>= j@8@01 0)))))
        (or
          (< i@7@01 (Seq_length xs@2@01))
          (not (< i@7@01 (Seq_length xs@2@01))))))
    (or (>= i@7@01 0) (not (>= i@7@01 0)))
    (=>
      (and
        (>= i@7@01 0)
        (and
          (< i@7@01 (Seq_length xs@2@01))
          (and
            (>= j@8@01 0)
            (and (< j@8@01 (Seq_length xs@2@01)) (not (= i@7@01 j@8@01))))))
      (and
        (>= i@7@01 0)
        (< i@7@01 (Seq_length xs@2@01))
        (>= j@8@01 0)
        (< j@8@01 (Seq_length xs@2@01))
        (not (= i@7@01 j@8@01))))
    (or
      (not
        (and
          (>= i@7@01 0)
          (and
            (< i@7@01 (Seq_length xs@2@01))
            (and
              (>= j@8@01 0)
              (and (< j@8@01 (Seq_length xs@2@01)) (not (= i@7@01 j@8@01)))))))
      (and
        (>= i@7@01 0)
        (and
          (< i@7@01 (Seq_length xs@2@01))
          (and
            (>= j@8@01 0)
            (and (< j@8@01 (Seq_length xs@2@01)) (not (= i@7@01 j@8@01))))))))
  :pattern ((Seq_index xs@2@01 i@7@01) (Seq_index xs@2@01 j@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314d.vpr@8@10@8@102-aux|)))
(assert (forall ((i@7@01 Int) (j@8@01 Int)) (!
  (=>
    (and
      (>= i@7@01 0)
      (and
        (< i@7@01 (Seq_length xs@2@01))
        (and
          (>= j@8@01 0)
          (and (< j@8@01 (Seq_length xs@2@01)) (not (= i@7@01 j@8@01))))))
    (not (= (Seq_index xs@2@01 i@7@01) (Seq_index xs@2@01 j@8@01))))
  :pattern ((Seq_index xs@2@01 i@7@01) (Seq_index xs@2@01 j@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314d.vpr@8@10@8@102|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { xs[i].f }
;     0 <= i && i < |xs| ==> acc(xs[i].f, p))
(declare-const i@9@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | !(0 <= i@9@01) | live]
; [else-branch: 5 | 0 <= i@9@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= i@9@01)]
(assert (not (<= 0 i@9@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= i@9@01]
(assert (<= 0 i@9@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
(assert (and (<= 0 i@9@01) (< i@9@01 (Seq_length xs@2@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@9@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const sm@10@01 $FVF<f>)
; Definitional axioms for snapshot map values
; [eval] xs[i]
(pop) ; 3
(declare-const $t@11@01 $FVF<f>)
(declare-fun inv@12@01 ($Ref) Int)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 (Seq_length xs@2@01)))
    (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@11@01 (Seq_index xs@2@01 i@9@01)) (Seq_index
    xs@2@01
    i@9@01)))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 (Seq_length xs@2@01)))
    (or (= p@3@01 $Perm.No) (< $Perm.No p@3@01)))
  
  :qid |quant-u-0|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@9@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@9@01) (< i1@9@01 (Seq_length xs@2@01)))
        (< $Perm.No p@3@01))
      (and
        (and (<= 0 i2@9@01) (< i2@9@01 (Seq_length xs@2@01)))
        (< $Perm.No p@3@01))
      (= (Seq_index xs@2@01 i1@9@01) (Seq_index xs@2@01 i2@9@01)))
    (= i1@9@01 i2@9@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (and (<= 0 i@9@01) (< i@9@01 (Seq_length xs@2@01))) (< $Perm.No p@3@01))
    (and
      (= (inv@12@01 (Seq_index xs@2@01 i@9@01)) i@9@01)
      (img@13@01 (Seq_index xs@2@01 i@9@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@11@01 (Seq_index xs@2@01 i@9@01)) (Seq_index
    xs@2@01
    i@9@01)))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (and
        (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01)))
        (< $Perm.No p@3@01)))
    (= (Seq_index xs@2@01 (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@9@01 Int)) (!
  (<= $Perm.No p@3@01)
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@11@01 (Seq_index xs@2@01 i@9@01)) (Seq_index
    xs@2@01
    i@9@01)))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@9@01 Int)) (!
  (<= p@3@01 $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@11@01 (Seq_index xs@2@01 i@9@01)) (Seq_index
    xs@2@01
    i@9@01)))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (and (<= 0 i@9@01) (< i@9@01 (Seq_length xs@2@01))) (< $Perm.No p@3@01))
    (not (= (Seq_index xs@2@01 i@9@01) $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@11@01 (Seq_index xs@2@01 i@9@01)) (Seq_index
    xs@2@01
    i@9@01)))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@14@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@13@01 r)
        (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01))))
      (< $Perm.No p@3@01)
      false)
    (= ($FVF.lookup_f (as sm@14@01  $FVF<f>) r) ($FVF.lookup_f $t@11@01 r)))
  :pattern (($FVF.lookup_f (as sm@14@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@11@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@11@01 r) r)
  :pattern (($FVF.lookup_f (as sm@14@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01)))
    ($FVF.loc_f ($FVF.lookup_f (as sm@14@01  $FVF<f>) r) r))
  :pattern ((inv@12@01 r))
  :qid |quant-u-2|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 0 <= k
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] 0 <= k
(assert (<= 0 k@4@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale k < |xs|
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] k < |xs|
; [eval] |xs|
(assert (< k@4@01 (Seq_length xs@2@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale (forall i: Int ::
;     { xs[i].f }
;     k <= i && i < |xs| ==> acc(xs[i].f, p / 2))
(declare-const i@17@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k <= i && i < |xs|
; [eval] k <= i
(push) ; 4
; [then-branch: 6 | !(k@4@01 <= i@17@01) | live]
; [else-branch: 6 | k@4@01 <= i@17@01 | live]
(push) ; 5
; [then-branch: 6 | !(k@4@01 <= i@17@01)]
(assert (not (<= k@4@01 i@17@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | k@4@01 <= i@17@01]
(assert (<= k@4@01 i@17@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= k@4@01 i@17@01) (not (<= k@4@01 i@17@01))))
(assert (and (<= k@4@01 i@17@01) (< i@17@01 (Seq_length xs@2@01))))
; [eval] p / 2
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@17@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; [eval] xs[i]
(pop) ; 3
(declare-fun inv@18@01 ($Ref) Int)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and (<= k@4@01 i@17@01) (< i@17@01 (Seq_length xs@2@01)))
    (or (<= k@4@01 i@17@01) (not (<= k@4@01 i@17@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@14@01  $FVF<f>) (Seq_index
    xs@2@01
    i@17@01)) (Seq_index xs@2@01 i@17@01)))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((i@17@01 Int)) (!
  (=>
    (and (<= k@4@01 i@17@01) (< i@17@01 (Seq_length xs@2@01)))
    (or (= (/ p@3@01 (to_real 2)) $Perm.No) (< $Perm.No (/ p@3@01 (to_real 2)))))
  
  :qid |quant-u-3|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@17@01 Int) (i2@17@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (<= k@4@01 i1@17@01) (< i1@17@01 (Seq_length xs@2@01)))
          ($FVF.loc_f ($FVF.lookup_f (as sm@14@01  $FVF<f>) (Seq_index
            xs@2@01
            i1@17@01)) (Seq_index xs@2@01 i1@17@01)))
        (< $Perm.No (/ p@3@01 (to_real 2))))
      (and
        (and
          (and (<= k@4@01 i2@17@01) (< i2@17@01 (Seq_length xs@2@01)))
          ($FVF.loc_f ($FVF.lookup_f (as sm@14@01  $FVF<f>) (Seq_index
            xs@2@01
            i2@17@01)) (Seq_index xs@2@01 i2@17@01)))
        (< $Perm.No (/ p@3@01 (to_real 2))))
      (= (Seq_index xs@2@01 i1@17@01) (Seq_index xs@2@01 i2@17@01)))
    (= i1@17@01 i2@17@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and
      (and (<= k@4@01 i@17@01) (< i@17@01 (Seq_length xs@2@01)))
      (< $Perm.No (/ p@3@01 (to_real 2))))
    (and
      (= (inv@18@01 (Seq_index xs@2@01 i@17@01)) i@17@01)
      (img@19@01 (Seq_index xs@2@01 i@17@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@14@01  $FVF<f>) (Seq_index
    xs@2@01
    i@17@01)) (Seq_index xs@2@01 i@17@01)))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (and
        (and (<= k@4@01 (inv@18@01 r)) (< (inv@18@01 r) (Seq_length xs@2@01)))
        (< $Perm.No (/ p@3@01 (to_real 2)))))
    (= (Seq_index xs@2@01 (inv@18@01 r)) r))
  :pattern ((inv@18@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= k@4@01 (inv@18@01 r)) (< (inv@18@01 r) (Seq_length xs@2@01)))
    ($FVF.loc_f ($FVF.lookup_f (as sm@14@01  $FVF<f>) r) r))
  :pattern ((inv@18@01 r))
  :qid |quant-u-4|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= k@4@01 (inv@18@01 r)) (< (inv@18@01 r) (Seq_length xs@2@01)))
      (img@19@01 r)
      (= r (Seq_index xs@2@01 (inv@18@01 r))))
    ($Perm.min
      (ite
        (and
          (img@13@01 r)
          (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01))))
        p@3@01
        $Perm.No)
      (/ p@3@01 (to_real 2)))
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
          (img@13@01 r)
          (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01))))
        p@3@01
        $Perm.No)
      (pTaken@20@01 r))
    $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@20@01 r) $Perm.No)
  
  :qid |quant-u-7|))))
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
      (and (<= k@4@01 (inv@18@01 r)) (< (inv@18@01 r) (Seq_length xs@2@01)))
      (img@19@01 r)
      (= r (Seq_index xs@2@01 (inv@18@01 r))))
    (= (- (/ p@3@01 (to_real 2)) (pTaken@20@01 r)) $Perm.No))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; inhale (forall i: Int ::
;     { xs[i].f }
;     k <= i && i < |xs| ==> acc(xs[i].f, p / 2))
(declare-const i@21@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k <= i && i < |xs|
; [eval] k <= i
(push) ; 4
; [then-branch: 7 | !(k@4@01 <= i@21@01) | live]
; [else-branch: 7 | k@4@01 <= i@21@01 | live]
(push) ; 5
; [then-branch: 7 | !(k@4@01 <= i@21@01)]
(assert (not (<= k@4@01 i@21@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | k@4@01 <= i@21@01]
(assert (<= k@4@01 i@21@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= k@4@01 i@21@01) (not (<= k@4@01 i@21@01))))
(assert (and (<= k@4@01 i@21@01) (< i@21@01 (Seq_length xs@2@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@21@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] p / 2
(declare-const sm@22@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@13@01 r)
        (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01))))
      (< $Perm.No (- p@3@01 (pTaken@20@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@22@01  $FVF<f>) r) ($FVF.lookup_f $t@11@01 r)))
  :pattern (($FVF.lookup_f (as sm@22@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@11@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@11@01 r) r)
  :pattern (($FVF.lookup_f (as sm@22@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef4|)))
; [eval] xs[i]
(pop) ; 3
(declare-const $t@23@01 $FVF<f>)
(declare-fun inv@24@01 ($Ref) Int)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@13@01 r)
        (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01))))
      (< $Perm.No (- p@3@01 (pTaken@20@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@22@01  $FVF<f>) r) ($FVF.lookup_f $t@11@01 r)))
  :pattern (($FVF.lookup_f (as sm@22@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@11@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@11@01 r) r)
  :pattern (($FVF.lookup_f (as sm@22@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef4|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and (<= k@4@01 i@21@01) (< i@21@01 (Seq_length xs@2@01)))
    (or (<= k@4@01 i@21@01) (not (<= k@4@01 i@21@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@23@01 (Seq_index xs@2@01 i@21@01)) (Seq_index
    xs@2@01
    i@21@01)))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((i@21@01 Int)) (!
  (=>
    (and (<= k@4@01 i@21@01) (< i@21@01 (Seq_length xs@2@01)))
    (or (= (/ p@3@01 (to_real 2)) $Perm.No) (< $Perm.No (/ p@3@01 (to_real 2)))))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@21@01 Int) (i2@21@01 Int)) (!
  (=>
    (and
      (and
        (and (<= k@4@01 i1@21@01) (< i1@21@01 (Seq_length xs@2@01)))
        (< $Perm.No (/ p@3@01 (to_real 2))))
      (and
        (and (<= k@4@01 i2@21@01) (< i2@21@01 (Seq_length xs@2@01)))
        (< $Perm.No (/ p@3@01 (to_real 2))))
      (= (Seq_index xs@2@01 i1@21@01) (Seq_index xs@2@01 i2@21@01)))
    (= i1@21@01 i2@21@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and
      (and (<= k@4@01 i@21@01) (< i@21@01 (Seq_length xs@2@01)))
      (< $Perm.No (/ p@3@01 (to_real 2))))
    (and
      (= (inv@24@01 (Seq_index xs@2@01 i@21@01)) i@21@01)
      (img@25@01 (Seq_index xs@2@01 i@21@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@23@01 (Seq_index xs@2@01 i@21@01)) (Seq_index
    xs@2@01
    i@21@01)))
  :qid |quant-u-10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@01 r)
      (and
        (and (<= k@4@01 (inv@24@01 r)) (< (inv@24@01 r) (Seq_length xs@2@01)))
        (< $Perm.No (/ p@3@01 (to_real 2)))))
    (= (Seq_index xs@2@01 (inv@24@01 r)) r))
  :pattern ((inv@24@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@21@01 Int)) (!
  (<= $Perm.No (/ p@3@01 (to_real 2)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@23@01 (Seq_index xs@2@01 i@21@01)) (Seq_index
    xs@2@01
    i@21@01)))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@21@01 Int)) (!
  (<= (/ p@3@01 (to_real 2)) $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@23@01 (Seq_index xs@2@01 i@21@01)) (Seq_index
    xs@2@01
    i@21@01)))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and
      (and (<= k@4@01 i@21@01) (< i@21@01 (Seq_length xs@2@01)))
      (< $Perm.No (/ p@3@01 (to_real 2))))
    (not (= (Seq_index xs@2@01 i@21@01) $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@23@01 (Seq_index xs@2@01 i@21@01)) (Seq_index
    xs@2@01
    i@21@01)))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@2@01 i@21@01) (Seq_index xs@2@01 i@9@01))
    (=
      (and
        (img@25@01 r)
        (and (<= k@4@01 (inv@24@01 r)) (< (inv@24@01 r) (Seq_length xs@2@01))))
      (and
        (img@13@01 r)
        (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01))))))
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@26@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@13@01 r)
        (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01))))
      (< $Perm.No (- p@3@01 (pTaken@20@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@26@01  $FVF<f>) r) ($FVF.lookup_f $t@11@01 r)))
  :pattern (($FVF.lookup_f (as sm@26@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@11@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@25@01 r)
        (and (<= k@4@01 (inv@24@01 r)) (< (inv@24@01 r) (Seq_length xs@2@01))))
      (< $Perm.No (/ p@3@01 (to_real 2)))
      false)
    (= ($FVF.lookup_f (as sm@26@01  $FVF<f>) r) ($FVF.lookup_f $t@23@01 r)))
  :pattern (($FVF.lookup_f (as sm@26@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@23@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@11@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@23@01 r) r))
  :pattern (($FVF.lookup_f (as sm@26@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= k@4@01 (inv@24@01 r)) (< (inv@24@01 r) (Seq_length xs@2@01)))
    ($FVF.loc_f ($FVF.lookup_f (as sm@26@01  $FVF<f>) r) r))
  :pattern ((inv@24@01 r))
  :qid |quant-u-12|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall i: Int ::
;     { xs[i].f }
;     0 <= i && i < |xs| ==> acc(xs[i].f, p))
(declare-const i@27@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 8 | !(0 <= i@27@01) | live]
; [else-branch: 8 | 0 <= i@27@01 | live]
(push) ; 5
; [then-branch: 8 | !(0 <= i@27@01)]
(assert (not (<= 0 i@27@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | 0 <= i@27@01]
(assert (<= 0 i@27@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@27@01) (not (<= 0 i@27@01))))
(assert (and (<= 0 i@27@01) (< i@27@01 (Seq_length xs@2@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@27@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; [eval] xs[i]
(pop) ; 3
(declare-fun inv@28@01 ($Ref) Int)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (Seq_length xs@2@01)))
    (or (<= 0 i@27@01) (not (<= 0 i@27@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@26@01  $FVF<f>) (Seq_index
    xs@2@01
    i@27@01)) (Seq_index xs@2@01 i@27@01)))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (Seq_length xs@2@01)))
    (or (= p@3@01 $Perm.No) (< $Perm.No p@3@01)))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@27@01 Int) (i2@27@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (<= 0 i1@27@01) (< i1@27@01 (Seq_length xs@2@01)))
          ($FVF.loc_f ($FVF.lookup_f (as sm@26@01  $FVF<f>) (Seq_index
            xs@2@01
            i1@27@01)) (Seq_index xs@2@01 i1@27@01)))
        (< $Perm.No p@3@01))
      (and
        (and
          (and (<= 0 i2@27@01) (< i2@27@01 (Seq_length xs@2@01)))
          ($FVF.loc_f ($FVF.lookup_f (as sm@26@01  $FVF<f>) (Seq_index
            xs@2@01
            i2@27@01)) (Seq_index xs@2@01 i2@27@01)))
        (< $Perm.No p@3@01))
      (= (Seq_index xs@2@01 i1@27@01) (Seq_index xs@2@01 i2@27@01)))
    (= i1@27@01 i2@27@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and
      (and (<= 0 i@27@01) (< i@27@01 (Seq_length xs@2@01)))
      (< $Perm.No p@3@01))
    (and
      (= (inv@28@01 (Seq_index xs@2@01 i@27@01)) i@27@01)
      (img@29@01 (Seq_index xs@2@01 i@27@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@26@01  $FVF<f>) (Seq_index
    xs@2@01
    i@27@01)) (Seq_index xs@2@01 i@27@01)))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@01 r)
      (and
        (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (Seq_length xs@2@01)))
        (< $Perm.No p@3@01)))
    (= (Seq_index xs@2@01 (inv@28@01 r)) r))
  :pattern ((inv@28@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (Seq_length xs@2@01)))
    ($FVF.loc_f ($FVF.lookup_f (as sm@26@01  $FVF<f>) r) r))
  :pattern ((inv@28@01 r))
  :qid |quant-u-14|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (Seq_length xs@2@01)))
      (img@29@01 r)
      (= r (Seq_index xs@2@01 (inv@28@01 r))))
    ($Perm.min
      (ite
        (and
          (img@13@01 r)
          (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01))))
        (- p@3@01 (pTaken@20@01 r))
        $Perm.No)
      p@3@01)
    $Perm.No))
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (Seq_length xs@2@01)))
      (img@29@01 r)
      (= r (Seq_index xs@2@01 (inv@28@01 r))))
    ($Perm.min
      (ite
        (and
          (img@25@01 r)
          (and (<= k@4@01 (inv@24@01 r)) (< (inv@24@01 r) (Seq_length xs@2@01))))
        (/ p@3@01 (to_real 2))
        $Perm.No)
      (- p@3@01 (pTaken@30@01 r)))
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
          (img@13@01 r)
          (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) (Seq_length xs@2@01))))
        (- p@3@01 (pTaken@20@01 r))
        $Perm.No)
      (pTaken@30@01 r))
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
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (Seq_length xs@2@01)))
      (img@29@01 r)
      (= r (Seq_index xs@2@01 (inv@28@01 r))))
    (= (- p@3@01 (pTaken@30@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@25@01 r)
          (and (<= k@4@01 (inv@24@01 r)) (< (inv@24@01 r) (Seq_length xs@2@01))))
        (/ p@3@01 (to_real 2))
        $Perm.No)
      (pTaken@31@01 r))
    $Perm.No)
  
  :qid |quant-u-18|))))
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
      (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) (Seq_length xs@2@01)))
      (img@29@01 r)
      (= r (Seq_index xs@2@01 (inv@28@01 r))))
    (= (- (- p@3@01 (pTaken@30@01 r)) (pTaken@31@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@32@01 Seq<$Ref>)
(declare-const p@33@01 $Perm)
(declare-const xs@34@01 Seq<$Ref>)
(declare-const p@35@01 $Perm)
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
; var k: Int
(declare-const k@36@01 Int)
; [exec]
; inhale none < p && p < write
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(assert (= ($Snap.first $t@37@01) $Snap.unit))
; [eval] none < p
(assert (< $Perm.No p@35@01))
(assert (= ($Snap.second $t@37@01) $Snap.unit))
; [eval] p < write
(assert (< p@35@01 $Perm.Write))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@39@01 Int)
(declare-const j@40@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 9 | !(i@39@01 >= 0) | live]
; [else-branch: 9 | i@39@01 >= 0 | live]
(push) ; 5
; [then-branch: 9 | !(i@39@01 >= 0)]
(assert (not (>= i@39@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | i@39@01 >= 0]
(assert (>= i@39@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 10 | !(i@39@01 < |xs@34@01|) | live]
; [else-branch: 10 | i@39@01 < |xs@34@01| | live]
(push) ; 7
; [then-branch: 10 | !(i@39@01 < |xs@34@01|)]
(assert (not (< i@39@01 (Seq_length xs@34@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | i@39@01 < |xs@34@01|]
(assert (< i@39@01 (Seq_length xs@34@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 11 | !(j@40@01 >= 0) | live]
; [else-branch: 11 | j@40@01 >= 0 | live]
(push) ; 9
; [then-branch: 11 | !(j@40@01 >= 0)]
(assert (not (>= j@40@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 11 | j@40@01 >= 0]
(assert (>= j@40@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 12 | !(j@40@01 < |xs@34@01|) | live]
; [else-branch: 12 | j@40@01 < |xs@34@01| | live]
(push) ; 11
; [then-branch: 12 | !(j@40@01 < |xs@34@01|)]
(assert (not (< j@40@01 (Seq_length xs@34@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 12 | j@40@01 < |xs@34@01|]
(assert (< j@40@01 (Seq_length xs@34@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@40@01 (Seq_length xs@34@01)) (not (< j@40@01 (Seq_length xs@34@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@40@01 0)
  (and
    (>= j@40@01 0)
    (or
      (< j@40@01 (Seq_length xs@34@01))
      (not (< j@40@01 (Seq_length xs@34@01)))))))
(assert (or (>= j@40@01 0) (not (>= j@40@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@39@01 (Seq_length xs@34@01))
  (and
    (< i@39@01 (Seq_length xs@34@01))
    (=>
      (>= j@40@01 0)
      (and
        (>= j@40@01 0)
        (or
          (< j@40@01 (Seq_length xs@34@01))
          (not (< j@40@01 (Seq_length xs@34@01))))))
    (or (>= j@40@01 0) (not (>= j@40@01 0))))))
(assert (or (< i@39@01 (Seq_length xs@34@01)) (not (< i@39@01 (Seq_length xs@34@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@39@01 0)
  (and
    (>= i@39@01 0)
    (=>
      (< i@39@01 (Seq_length xs@34@01))
      (and
        (< i@39@01 (Seq_length xs@34@01))
        (=>
          (>= j@40@01 0)
          (and
            (>= j@40@01 0)
            (or
              (< j@40@01 (Seq_length xs@34@01))
              (not (< j@40@01 (Seq_length xs@34@01))))))
        (or (>= j@40@01 0) (not (>= j@40@01 0)))))
    (or
      (< i@39@01 (Seq_length xs@34@01))
      (not (< i@39@01 (Seq_length xs@34@01)))))))
(assert (or (>= i@39@01 0) (not (>= i@39@01 0))))
(push) ; 4
; [then-branch: 13 | i@39@01 >= 0 && i@39@01 < |xs@34@01| && j@40@01 >= 0 && j@40@01 < |xs@34@01| && i@39@01 != j@40@01 | live]
; [else-branch: 13 | !(i@39@01 >= 0 && i@39@01 < |xs@34@01| && j@40@01 >= 0 && j@40@01 < |xs@34@01| && i@39@01 != j@40@01) | live]
(push) ; 5
; [then-branch: 13 | i@39@01 >= 0 && i@39@01 < |xs@34@01| && j@40@01 >= 0 && j@40@01 < |xs@34@01| && i@39@01 != j@40@01]
(assert (and
  (>= i@39@01 0)
  (and
    (< i@39@01 (Seq_length xs@34@01))
    (and
      (>= j@40@01 0)
      (and (< j@40@01 (Seq_length xs@34@01)) (not (= i@39@01 j@40@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(i@39@01 >= 0 && i@39@01 < |xs@34@01| && j@40@01 >= 0 && j@40@01 < |xs@34@01| && i@39@01 != j@40@01)]
(assert (not
  (and
    (>= i@39@01 0)
    (and
      (< i@39@01 (Seq_length xs@34@01))
      (and
        (>= j@40@01 0)
        (and (< j@40@01 (Seq_length xs@34@01)) (not (= i@39@01 j@40@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@39@01 0)
    (and
      (< i@39@01 (Seq_length xs@34@01))
      (and
        (>= j@40@01 0)
        (and (< j@40@01 (Seq_length xs@34@01)) (not (= i@39@01 j@40@01))))))
  (and
    (>= i@39@01 0)
    (< i@39@01 (Seq_length xs@34@01))
    (>= j@40@01 0)
    (< j@40@01 (Seq_length xs@34@01))
    (not (= i@39@01 j@40@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@39@01 0)
      (and
        (< i@39@01 (Seq_length xs@34@01))
        (and
          (>= j@40@01 0)
          (and (< j@40@01 (Seq_length xs@34@01)) (not (= i@39@01 j@40@01)))))))
  (and
    (>= i@39@01 0)
    (and
      (< i@39@01 (Seq_length xs@34@01))
      (and
        (>= j@40@01 0)
        (and (< j@40@01 (Seq_length xs@34@01)) (not (= i@39@01 j@40@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (and
    (=>
      (>= i@39@01 0)
      (and
        (>= i@39@01 0)
        (=>
          (< i@39@01 (Seq_length xs@34@01))
          (and
            (< i@39@01 (Seq_length xs@34@01))
            (=>
              (>= j@40@01 0)
              (and
                (>= j@40@01 0)
                (or
                  (< j@40@01 (Seq_length xs@34@01))
                  (not (< j@40@01 (Seq_length xs@34@01))))))
            (or (>= j@40@01 0) (not (>= j@40@01 0)))))
        (or
          (< i@39@01 (Seq_length xs@34@01))
          (not (< i@39@01 (Seq_length xs@34@01))))))
    (or (>= i@39@01 0) (not (>= i@39@01 0)))
    (=>
      (and
        (>= i@39@01 0)
        (and
          (< i@39@01 (Seq_length xs@34@01))
          (and
            (>= j@40@01 0)
            (and (< j@40@01 (Seq_length xs@34@01)) (not (= i@39@01 j@40@01))))))
      (and
        (>= i@39@01 0)
        (< i@39@01 (Seq_length xs@34@01))
        (>= j@40@01 0)
        (< j@40@01 (Seq_length xs@34@01))
        (not (= i@39@01 j@40@01))))
    (or
      (not
        (and
          (>= i@39@01 0)
          (and
            (< i@39@01 (Seq_length xs@34@01))
            (and
              (>= j@40@01 0)
              (and (< j@40@01 (Seq_length xs@34@01)) (not (= i@39@01 j@40@01)))))))
      (and
        (>= i@39@01 0)
        (and
          (< i@39@01 (Seq_length xs@34@01))
          (and
            (>= j@40@01 0)
            (and (< j@40@01 (Seq_length xs@34@01)) (not (= i@39@01 j@40@01))))))))
  :pattern ((Seq_index xs@34@01 i@39@01) (Seq_index xs@34@01 j@40@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314d.vpr@22@10@22@102-aux|)))
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (=>
    (and
      (>= i@39@01 0)
      (and
        (< i@39@01 (Seq_length xs@34@01))
        (and
          (>= j@40@01 0)
          (and (< j@40@01 (Seq_length xs@34@01)) (not (= i@39@01 j@40@01))))))
    (not (= (Seq_index xs@34@01 i@39@01) (Seq_index xs@34@01 j@40@01))))
  :pattern ((Seq_index xs@34@01 i@39@01) (Seq_index xs@34@01 j@40@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314d.vpr@22@10@22@102|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int :: { xs[i] } 0 <= i && i < |xs| ==> acc(xs[i].f, p))
(declare-const i@41@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 14 | !(0 <= i@41@01) | live]
; [else-branch: 14 | 0 <= i@41@01 | live]
(push) ; 5
; [then-branch: 14 | !(0 <= i@41@01)]
(assert (not (<= 0 i@41@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | 0 <= i@41@01]
(assert (<= 0 i@41@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@41@01) (not (<= 0 i@41@01))))
(assert (and (<= 0 i@41@01) (< i@41@01 (Seq_length xs@34@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@41@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@42@01 $FVF<f>)
(declare-fun inv@43@01 ($Ref) Int)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@41@01 Int)) (!
  (=>
    (and (<= 0 i@41@01) (< i@41@01 (Seq_length xs@34@01)))
    (or (<= 0 i@41@01) (not (<= 0 i@41@01))))
  :pattern ((Seq_index xs@34@01 i@41@01))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((i@41@01 Int)) (!
  (=>
    (and (<= 0 i@41@01) (< i@41@01 (Seq_length xs@34@01)))
    (or (= p@35@01 $Perm.No) (< $Perm.No p@35@01)))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@41@01 Int) (i2@41@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@41@01) (< i1@41@01 (Seq_length xs@34@01)))
        (< $Perm.No p@35@01))
      (and
        (and (<= 0 i2@41@01) (< i2@41@01 (Seq_length xs@34@01)))
        (< $Perm.No p@35@01))
      (= (Seq_index xs@34@01 i1@41@01) (Seq_index xs@34@01 i2@41@01)))
    (= i1@41@01 i2@41@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@41@01 Int)) (!
  (=>
    (and
      (and (<= 0 i@41@01) (< i@41@01 (Seq_length xs@34@01)))
      (< $Perm.No p@35@01))
    (and
      (= (inv@43@01 (Seq_index xs@34@01 i@41@01)) i@41@01)
      (img@44@01 (Seq_index xs@34@01 i@41@01))))
  :pattern ((Seq_index xs@34@01 i@41@01))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@44@01 r)
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@34@01)))
        (< $Perm.No p@35@01)))
    (= (Seq_index xs@34@01 (inv@43@01 r)) r))
  :pattern ((inv@43@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@41@01 Int)) (!
  (<= $Perm.No p@35@01)
  :pattern ((Seq_index xs@34@01 i@41@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@41@01 Int)) (!
  (<= p@35@01 $Perm.Write)
  :pattern ((Seq_index xs@34@01 i@41@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@41@01 Int)) (!
  (=>
    (and
      (and (<= 0 i@41@01) (< i@41@01 (Seq_length xs@34@01)))
      (< $Perm.No p@35@01))
    (not (= (Seq_index xs@34@01 i@41@01) $Ref.null)))
  :pattern ((Seq_index xs@34@01 i@41@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 0 <= k
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 $Snap.unit))
; [eval] 0 <= k
(assert (<= 0 k@36@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale k < |xs|
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 $Snap.unit))
; [eval] k < |xs|
; [eval] |xs|
(assert (< k@36@01 (Seq_length xs@34@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale (forall i: Int ::
;     { xs[i] }
;     k <= i && i < |xs| ==> acc(xs[i].f, p / 2))
(declare-const i@47@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k <= i && i < |xs|
; [eval] k <= i
(push) ; 4
; [then-branch: 15 | !(k@36@01 <= i@47@01) | live]
; [else-branch: 15 | k@36@01 <= i@47@01 | live]
(push) ; 5
; [then-branch: 15 | !(k@36@01 <= i@47@01)]
(assert (not (<= k@36@01 i@47@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | k@36@01 <= i@47@01]
(assert (<= k@36@01 i@47@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= k@36@01 i@47@01) (not (<= k@36@01 i@47@01))))
(assert (and (<= k@36@01 i@47@01) (< i@47@01 (Seq_length xs@34@01))))
; [eval] p / 2
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@47@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@48@01 ($Ref) Int)
(declare-fun img@49@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@47@01 Int)) (!
  (=>
    (and (<= k@36@01 i@47@01) (< i@47@01 (Seq_length xs@34@01)))
    (or (<= k@36@01 i@47@01) (not (<= k@36@01 i@47@01))))
  :pattern ((Seq_index xs@34@01 i@47@01))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((i@47@01 Int)) (!
  (=>
    (and (<= k@36@01 i@47@01) (< i@47@01 (Seq_length xs@34@01)))
    (or
      (= (/ p@35@01 (to_real 2)) $Perm.No)
      (< $Perm.No (/ p@35@01 (to_real 2)))))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@47@01 Int) (i2@47@01 Int)) (!
  (=>
    (and
      (and
        (and (<= k@36@01 i1@47@01) (< i1@47@01 (Seq_length xs@34@01)))
        (< $Perm.No (/ p@35@01 (to_real 2))))
      (and
        (and (<= k@36@01 i2@47@01) (< i2@47@01 (Seq_length xs@34@01)))
        (< $Perm.No (/ p@35@01 (to_real 2))))
      (= (Seq_index xs@34@01 i1@47@01) (Seq_index xs@34@01 i2@47@01)))
    (= i1@47@01 i2@47@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@47@01 Int)) (!
  (=>
    (and
      (and (<= k@36@01 i@47@01) (< i@47@01 (Seq_length xs@34@01)))
      (< $Perm.No (/ p@35@01 (to_real 2))))
    (and
      (= (inv@48@01 (Seq_index xs@34@01 i@47@01)) i@47@01)
      (img@49@01 (Seq_index xs@34@01 i@47@01))))
  :pattern ((Seq_index xs@34@01 i@47@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@49@01 r)
      (and
        (and (<= k@36@01 (inv@48@01 r)) (< (inv@48@01 r) (Seq_length xs@34@01)))
        (< $Perm.No (/ p@35@01 (to_real 2)))))
    (= (Seq_index xs@34@01 (inv@48@01 r)) r))
  :pattern ((inv@48@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= k@36@01 (inv@48@01 r)) (< (inv@48@01 r) (Seq_length xs@34@01)))
      (img@49@01 r)
      (= r (Seq_index xs@34@01 (inv@48@01 r))))
    ($Perm.min
      (ite
        (and
          (img@44@01 r)
          (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@34@01))))
        p@35@01
        $Perm.No)
      (/ p@35@01 (to_real 2)))
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
          (img@44@01 r)
          (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@34@01))))
        p@35@01
        $Perm.No)
      (pTaken@50@01 r))
    $Perm.No)
  
  :qid |quant-u-24|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@50@01 r) $Perm.No)
  
  :qid |quant-u-25|))))
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
      (and (<= k@36@01 (inv@48@01 r)) (< (inv@48@01 r) (Seq_length xs@34@01)))
      (img@49@01 r)
      (= r (Seq_index xs@34@01 (inv@48@01 r))))
    (= (- (/ p@35@01 (to_real 2)) (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@51@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@44@01 r)
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@34@01))))
      (< $Perm.No p@35@01)
      false)
    (= ($FVF.lookup_f (as sm@51@01  $FVF<f>) r) ($FVF.lookup_f $t@42@01 r)))
  :pattern (($FVF.lookup_f (as sm@51@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@42@01 r))
  :qid |qp.fvfValDef8|)))
; [exec]
; inhale (forall i: Int ::
;     { xs[i] }
;     k <= i && i < |xs| ==> acc(xs[i].f, p / 2))
(declare-const i@52@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k <= i && i < |xs|
; [eval] k <= i
(push) ; 4
; [then-branch: 16 | !(k@36@01 <= i@52@01) | live]
; [else-branch: 16 | k@36@01 <= i@52@01 | live]
(push) ; 5
; [then-branch: 16 | !(k@36@01 <= i@52@01)]
(assert (not (<= k@36@01 i@52@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | k@36@01 <= i@52@01]
(assert (<= k@36@01 i@52@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= k@36@01 i@52@01) (not (<= k@36@01 i@52@01))))
(assert (and (<= k@36@01 i@52@01) (< i@52@01 (Seq_length xs@34@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@52@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] p / 2
(pop) ; 3
(declare-const $t@53@01 $FVF<f>)
(declare-fun inv@54@01 ($Ref) Int)
(declare-fun img@55@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= k@36@01 i@52@01) (< i@52@01 (Seq_length xs@34@01)))
    (or (<= k@36@01 i@52@01) (not (<= k@36@01 i@52@01))))
  :pattern ((Seq_index xs@34@01 i@52@01))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((i@52@01 Int)) (!
  (=>
    (and (<= k@36@01 i@52@01) (< i@52@01 (Seq_length xs@34@01)))
    (or
      (= (/ p@35@01 (to_real 2)) $Perm.No)
      (< $Perm.No (/ p@35@01 (to_real 2)))))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@52@01 Int) (i2@52@01 Int)) (!
  (=>
    (and
      (and
        (and (<= k@36@01 i1@52@01) (< i1@52@01 (Seq_length xs@34@01)))
        (< $Perm.No (/ p@35@01 (to_real 2))))
      (and
        (and (<= k@36@01 i2@52@01) (< i2@52@01 (Seq_length xs@34@01)))
        (< $Perm.No (/ p@35@01 (to_real 2))))
      (= (Seq_index xs@34@01 i1@52@01) (Seq_index xs@34@01 i2@52@01)))
    (= i1@52@01 i2@52@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and
      (and (<= k@36@01 i@52@01) (< i@52@01 (Seq_length xs@34@01)))
      (< $Perm.No (/ p@35@01 (to_real 2))))
    (and
      (= (inv@54@01 (Seq_index xs@34@01 i@52@01)) i@52@01)
      (img@55@01 (Seq_index xs@34@01 i@52@01))))
  :pattern ((Seq_index xs@34@01 i@52@01))
  :qid |quant-u-28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@55@01 r)
      (and
        (and (<= k@36@01 (inv@54@01 r)) (< (inv@54@01 r) (Seq_length xs@34@01)))
        (< $Perm.No (/ p@35@01 (to_real 2)))))
    (= (Seq_index xs@34@01 (inv@54@01 r)) r))
  :pattern ((inv@54@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@52@01 Int)) (!
  (<= $Perm.No (/ p@35@01 (to_real 2)))
  :pattern ((Seq_index xs@34@01 i@52@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@52@01 Int)) (!
  (<= (/ p@35@01 (to_real 2)) $Perm.Write)
  :pattern ((Seq_index xs@34@01 i@52@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and
      (and (<= k@36@01 i@52@01) (< i@52@01 (Seq_length xs@34@01)))
      (< $Perm.No (/ p@35@01 (to_real 2))))
    (not (= (Seq_index xs@34@01 i@52@01) $Ref.null)))
  :pattern ((Seq_index xs@34@01 i@52@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@34@01 i@52@01) (Seq_index xs@34@01 i@41@01))
    (=
      (and
        (img@55@01 r)
        (and (<= k@36@01 (inv@54@01 r)) (< (inv@54@01 r) (Seq_length xs@34@01))))
      (and
        (img@44@01 r)
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@34@01))))))
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall i: Int :: { xs[i] } 0 <= i && i < |xs| ==> acc(xs[i].f, p))
(declare-const i@56@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 17 | !(0 <= i@56@01) | live]
; [else-branch: 17 | 0 <= i@56@01 | live]
(push) ; 5
; [then-branch: 17 | !(0 <= i@56@01)]
(assert (not (<= 0 i@56@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | 0 <= i@56@01]
(assert (<= 0 i@56@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@56@01) (not (<= 0 i@56@01))))
(assert (and (<= 0 i@56@01) (< i@56@01 (Seq_length xs@34@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@56@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@57@01 ($Ref) Int)
(declare-fun img@58@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 (Seq_length xs@34@01)))
    (or (<= 0 i@56@01) (not (<= 0 i@56@01))))
  :pattern ((Seq_index xs@34@01 i@56@01))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 (Seq_length xs@34@01)))
    (or (= p@35@01 $Perm.No) (< $Perm.No p@35@01)))
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@56@01 Int) (i2@56@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@56@01) (< i1@56@01 (Seq_length xs@34@01)))
        (< $Perm.No p@35@01))
      (and
        (and (<= 0 i2@56@01) (< i2@56@01 (Seq_length xs@34@01)))
        (< $Perm.No p@35@01))
      (= (Seq_index xs@34@01 i1@56@01) (Seq_index xs@34@01 i2@56@01)))
    (= i1@56@01 i2@56@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and
      (and (<= 0 i@56@01) (< i@56@01 (Seq_length xs@34@01)))
      (< $Perm.No p@35@01))
    (and
      (= (inv@57@01 (Seq_index xs@34@01 i@56@01)) i@56@01)
      (img@58@01 (Seq_index xs@34@01 i@56@01))))
  :pattern ((Seq_index xs@34@01 i@56@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and
        (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (Seq_length xs@34@01)))
        (< $Perm.No p@35@01)))
    (= (Seq_index xs@34@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@59@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (Seq_length xs@34@01)))
      (img@58@01 r)
      (= r (Seq_index xs@34@01 (inv@57@01 r))))
    ($Perm.min
      (ite
        (and
          (img@44@01 r)
          (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@34@01))))
        (- p@35@01 (pTaken@50@01 r))
        $Perm.No)
      p@35@01)
    $Perm.No))
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (Seq_length xs@34@01)))
      (img@58@01 r)
      (= r (Seq_index xs@34@01 (inv@57@01 r))))
    ($Perm.min
      (ite
        (and
          (img@55@01 r)
          (and
            (<= k@36@01 (inv@54@01 r))
            (< (inv@54@01 r) (Seq_length xs@34@01))))
        (/ p@35@01 (to_real 2))
        $Perm.No)
      (- p@35@01 (pTaken@59@01 r)))
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
          (img@44@01 r)
          (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@34@01))))
        (- p@35@01 (pTaken@50@01 r))
        $Perm.No)
      (pTaken@59@01 r))
    $Perm.No)
  
  :qid |quant-u-32|))))
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
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (Seq_length xs@34@01)))
      (img@58@01 r)
      (= r (Seq_index xs@34@01 (inv@57@01 r))))
    (= (- p@35@01 (pTaken@59@01 r)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@55@01 r)
          (and
            (<= k@36@01 (inv@54@01 r))
            (< (inv@54@01 r) (Seq_length xs@34@01))))
        (/ p@35@01 (to_real 2))
        $Perm.No)
      (pTaken@60@01 r))
    $Perm.No)
  
  :qid |quant-u-34|))))
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
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (Seq_length xs@34@01)))
      (img@58@01 r)
      (= r (Seq_index xs@34@01 (inv@57@01 r))))
    (= (- (- p@35@01 (pTaken@59@01 r)) (pTaken@60@01 r)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@61@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@44@01 r)
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@34@01))))
      (< $Perm.No (- p@35@01 (pTaken@50@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@61@01  $FVF<f>) r) ($FVF.lookup_f $t@42@01 r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@42@01 r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@55@01 r)
        (and (<= k@36@01 (inv@54@01 r)) (< (inv@54@01 r) (Seq_length xs@34@01))))
      (< $Perm.No (/ p@35@01 (to_real 2)))
      false)
    (= ($FVF.lookup_f (as sm@61@01  $FVF<f>) r) ($FVF.lookup_f $t@53@01 r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@53@01 r))
  :qid |qp.fvfValDef10|)))
(pop) ; 2
(pop) ; 1
