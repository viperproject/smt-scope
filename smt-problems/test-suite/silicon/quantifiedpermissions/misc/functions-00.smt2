(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:38
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr
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
(declare-sort Set<Seq<$Ref>> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<f> 0)
(declare-sort $FVF<ss> 0)
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
(declare-fun $SortWrappers.Set<Seq<$Ref>>To$Snap (Set<Seq<$Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<$Ref>> ($Snap) Set<Seq<$Ref>>)
(assert (forall ((x Set<Seq<$Ref>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<$Ref>>($SortWrappers.Set<Seq<$Ref>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<$Ref>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<$Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<$Ref>>To$Snap($SortWrappers.$SnapToSet<Seq<$Ref>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<$Ref>> x))
    :qid |$Snap.Set<Seq<$Ref>>To$SnapToSet<Seq<$Ref>>|
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
(declare-fun $SortWrappers.$FVF<ss>To$Snap ($FVF<ss>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<ss> ($Snap) $FVF<ss>)
(assert (forall ((x $FVF<ss>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<ss>($SortWrappers.$FVF<ss>To$Snap x)))
    :pattern (($SortWrappers.$FVF<ss>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<ss>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<ss>To$Snap($SortWrappers.$SnapTo$FVF<ss> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<ss> x))
    :qid |$Snap.$FVF<ss>To$SnapTo$FVF<ss>|
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
(declare-fun Set_card (Set<Seq<$Ref>>) Int)
(declare-const Set_empty Set<Seq<$Ref>>)
(declare-fun Set_in (Seq<$Ref> Set<Seq<$Ref>>) Bool)
(declare-fun Set_singleton (Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_unionone (Set<Seq<$Ref>> Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_union (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_intersection (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_difference (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_subset (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_equal (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<$Ref>> Set<Seq<$Ref>>) Seq<$Ref>)
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
; /field_value_functions_declarations.smt2 [ss: Seq[Ref]]
(declare-fun $FVF.domain_ss ($FVF<ss>) Set<$Ref>)
(declare-fun $FVF.lookup_ss ($FVF<ss> $Ref) Seq<$Ref>)
(declare-fun $FVF.after_ss ($FVF<ss> $FVF<ss>) Bool)
(declare-fun $FVF.loc_ss (Seq<$Ref> $Ref) Bool)
(declare-fun $FVF.perm_ss ($FPM $Ref) $Perm)
(declare-const $fvfTOP_ss $FVF<ss>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun07 ($Snap Seq<$Ref> Int) Int)
(declare-fun fun07%limited ($Snap Seq<$Ref> Int) Int)
(declare-fun fun07%stateless (Seq<$Ref> Int) Bool)
(declare-fun fun07%precondition ($Snap Seq<$Ref> Int) Bool)
(declare-fun fun08 ($Snap Seq<$Ref> Int) Int)
(declare-fun fun08%limited ($Snap Seq<$Ref> Int) Int)
(declare-fun fun08%stateless (Seq<$Ref> Int) Bool)
(declare-fun fun08%precondition ($Snap Seq<$Ref> Int) Bool)
(declare-fun fun04 ($Snap $Ref Int Int) Int)
(declare-fun fun04%limited ($Snap $Ref Int Int) Int)
(declare-fun fun04%stateless ($Ref Int Int) Bool)
(declare-fun fun04%precondition ($Snap $Ref Int Int) Bool)
(declare-fun fun02 ($Snap Seq<$Ref>) Int)
(declare-fun fun02%limited ($Snap Seq<$Ref>) Int)
(declare-fun fun02%stateless (Seq<$Ref>) Bool)
(declare-fun fun02%precondition ($Snap Seq<$Ref>) Bool)
(declare-fun fun01 ($Snap Seq<$Ref>) Int)
(declare-fun fun01%limited ($Snap Seq<$Ref>) Int)
(declare-fun fun01%stateless (Seq<$Ref>) Bool)
(declare-fun fun01%precondition ($Snap Seq<$Ref>) Bool)
(declare-fun fun06 ($Snap Seq<$Ref> Int Int) Int)
(declare-fun fun06%limited ($Snap Seq<$Ref> Int Int) Int)
(declare-fun fun06%stateless (Seq<$Ref> Int Int) Bool)
(declare-fun fun06%precondition ($Snap Seq<$Ref> Int Int) Bool)
(declare-fun fun03 ($Snap Seq<$Ref> Int) Int)
(declare-fun fun03%limited ($Snap Seq<$Ref> Int) Int)
(declare-fun fun03%stateless (Seq<$Ref> Int) Bool)
(declare-fun fun03%precondition ($Snap Seq<$Ref> Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P02%trigger ($Snap Seq<$Ref> Int) Bool)
(declare-fun P01%trigger ($Snap $Ref Int) Bool)
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
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<$Ref>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<$Ref>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<$Ref>>)))
  )))
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<$Ref>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<$Ref>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<$Ref>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<$Ref>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<$Ref>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>) (y Seq<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
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
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<$Ref>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
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
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
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
; /field_value_functions_axioms.smt2 [ss: Seq[Ref]]
(assert (forall ((vs $FVF<ss>) (ws $FVF<ss>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_ss vs) ($FVF.domain_ss ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_ss vs))
            (= ($FVF.lookup_ss vs x) ($FVF.lookup_ss ws x)))
          :pattern (($FVF.lookup_ss vs x) ($FVF.lookup_ss ws x))
          :qid |qp.$FVF<ss>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<ss>To$Snap vs)
              ($SortWrappers.$FVF<ss>To$Snap ws)
              )
    :qid |qp.$FVF<ss>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_ss pm r))
    :pattern (($FVF.perm_ss pm r)))))
(assert (forall ((r $Ref) (f Seq<$Ref>)) (!
    (= ($FVF.loc_ss f r) true)
    :pattern (($FVF.loc_ss f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@24@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@25@00 ($Snap Seq<$Ref> Int $Ref) Bool)
(declare-fun inv@30@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@31@00 ($Snap Seq<$Ref> Int $Ref) Bool)
(declare-fun inv@36@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@37@00 ($Snap Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@32@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun sm@38@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun inv@42@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@43@00 ($Snap Seq<$Ref> Int $Ref) Bool)
(declare-fun inv@48@00 ($Snap $Ref Int Int $Ref) Int)
(declare-fun img@49@00 ($Snap $Ref Int Int $Ref) Bool)
(declare-fun inv@51@00 ($Snap $Ref Int Int $Ref) Int)
(declare-fun img@52@00 ($Snap $Ref Int Int $Ref) Bool)
(declare-fun sm@53@00 ($Snap $Ref Int Int) $FVF<f>)
(declare-fun inv@58@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@59@00 ($Snap Seq<$Ref> $Ref) Bool)
(declare-fun inv@63@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@64@00 ($Snap Seq<$Ref> $Ref) Bool)
(declare-fun inv@68@00 ($Snap Seq<$Ref> Int Int $Ref) Int)
(declare-fun img@69@00 ($Snap Seq<$Ref> Int Int $Ref) Bool)
(declare-fun inv@71@00 ($Snap Seq<$Ref> Int Int $Ref) Int)
(declare-fun img@72@00 ($Snap Seq<$Ref> Int Int $Ref) Bool)
(declare-fun sm@73@00 ($Snap Seq<$Ref> Int Int) $FVF<f>)
(declare-fun inv@78@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@79@00 ($Snap Seq<$Ref> Int $Ref) Bool)
(declare-fun inv@81@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@82@00 ($Snap Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@83@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (= (fun07%limited s@$ xs@0@00 j@1@00) (fun07 s@$ xs@0@00 j@1@00))
  :pattern ((fun07 s@$ xs@0@00 j@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (fun07%stateless xs@0@00 j@1@00)
  :pattern ((fun07%limited s@$ xs@0@00 j@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (let ((result@2@00 (fun07%limited s@$ xs@0@00 j@1@00))) (and
    (forall ((i@23@00 Int)) (!
      (=>
        (and (<= 0 i@23@00) (< i@23@00 (Seq_length xs@0@00)))
        (and
          (= (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00)) i@23@00)
          (img@25@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00))))
      :pattern ((Seq_index xs@0@00 i@23@00))
      :qid |quant-u-15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@25@00 s@$ xs@0@00 j@1@00 r)
          (and
            (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
            (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
        (= (Seq_index xs@0@00 (inv@24@00 s@$ xs@0@00 j@1@00 r)) r))
      :pattern ((inv@24@00 s@$ xs@0@00 j@1@00 r))
      :qid |f-fctOfInv|))
    (=> (fun07%precondition s@$ xs@0@00 j@1@00) (>= result@2@00 0))))
  :pattern ((fun07%limited s@$ xs@0@00 j@1@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (let ((result@2@00 (fun07%limited s@$ xs@0@00 j@1@00))) true)
  :pattern ((fun07%limited s@$ xs@0@00 j@1@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (and
    (forall ((i@23@00 Int)) (!
      (=>
        (and (<= 0 i@23@00) (< i@23@00 (Seq_length xs@0@00)))
        (and
          (= (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00)) i@23@00)
          (img@25@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00))))
      :pattern ((Seq_index xs@0@00 i@23@00))
      :qid |quant-u-15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@25@00 s@$ xs@0@00 j@1@00 r)
          (and
            (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
            (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
        (= (Seq_index xs@0@00 (inv@24@00 s@$ xs@0@00 j@1@00 r)) r))
      :pattern ((inv@24@00 s@$ xs@0@00 j@1@00 r))
      :qid |f-fctOfInv|))
    (forall ((i@29@00 Int)) (!
      (=>
        (and (<= 0 i@29@00) (< i@29@00 (Seq_length xs@0@00)))
        (and
          (= (inv@30@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@29@00)) i@29@00)
          (img@31@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@29@00))))
      :pattern ((Seq_index xs@0@00 i@29@00))
      :qid |f-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@31@00 s@$ xs@0@00 j@1@00 r)
          (and
            (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
            (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
        (= (Seq_index xs@0@00 (inv@30@00 s@$ xs@0@00 j@1@00 r)) r))
      :pattern ((inv@30@00 s@$ xs@0@00 j@1@00 r))
      :qid |f-fctOfInv|))
    (forall ((i@35@00 Int)) (!
      (=>
        (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00)))
        (and
          (= (inv@36@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00)) i@35@00)
          (img@37@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00))))
      :pattern ((Seq_index xs@0@00 i@35@00))
      :qid |f-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@37@00 s@$ xs@0@00 j@1@00 r)
          (and
            (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
            (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
        (= (Seq_index xs@0@00 (inv@36@00 s@$ xs@0@00 j@1@00 r)) r))
      :pattern ((inv@36@00 s@$ xs@0@00 j@1@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_f (sm@32@00 s@$ xs@0@00 j@1@00)))
          (and
            (and
              (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
            (img@31@00 s@$ xs@0@00 j@1@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
            (img@31@00 s@$ xs@0@00 j@1@00 r))
          (Set_in r ($FVF.domain_f (sm@32@00 s@$ xs@0@00 j@1@00)))))
      :pattern ((Set_in r ($FVF.domain_f (sm@32@00 s@$ xs@0@00 j@1@00))))
      :qid |qp.fvfDomDef1|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
            (img@31@00 s@$ xs@0@00 j@1@00 r))
          (and
            (img@25@00 s@$ xs@0@00 j@1@00 r)
            (and
              (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))))
        (=
          ($FVF.lookup_f (sm@32@00 s@$ xs@0@00 j@1@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_f (sm@32@00 s@$ xs@0@00 j@1@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_f (sm@38@00 s@$ xs@0@00 j@1@00)))
          (and
            (and
              (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
            (img@37@00 s@$ xs@0@00 j@1@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
            (img@37@00 s@$ xs@0@00 j@1@00 r))
          (Set_in r ($FVF.domain_f (sm@38@00 s@$ xs@0@00 j@1@00)))))
      :pattern ((Set_in r ($FVF.domain_f (sm@38@00 s@$ xs@0@00 j@1@00))))
      :qid |qp.fvfDomDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
            (img@37@00 s@$ xs@0@00 j@1@00 r))
          (and
            (img@25@00 s@$ xs@0@00 j@1@00 r)
            (and
              (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))))
        (=
          ($FVF.lookup_f (sm@38@00 s@$ xs@0@00 j@1@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_f (sm@38@00 s@$ xs@0@00 j@1@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef2|))
    (=>
      (fun07%precondition s@$ xs@0@00 j@1@00)
      (=
        (fun07 s@$ xs@0@00 j@1@00)
        (ite
          (< j@1@00 0)
          (fun07%limited ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<f>To$Snap (sm@32@00 s@$ xs@0@00 j@1@00))) xs@0@00 (+
            j@1@00
            1))
          (ite
            (<= (Seq_length xs@0@00) j@1@00)
            (fun07%limited ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<f>To$Snap (sm@38@00 s@$ xs@0@00 j@1@00))) xs@0@00 (-
              j@1@00
              1))
            (*
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) (Seq_index
                xs@0@00
                j@1@00))
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) (Seq_index
                xs@0@00
                j@1@00))))))))
  :pattern ((fun07 s@$ xs@0@00 j@1@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (=>
    (fun07%precondition s@$ xs@0@00 j@1@00)
    (ite
      (< j@1@00 0)
      (fun07%precondition ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (sm@32@00 s@$ xs@0@00 j@1@00))) xs@0@00 (+
        j@1@00
        1))
      (ite
        (<= (Seq_length xs@0@00) j@1@00)
        (fun07%precondition ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (sm@38@00 s@$ xs@0@00 j@1@00))) xs@0@00 (-
          j@1@00
          1))
        true)))
  :pattern ((fun07 s@$ xs@0@00 j@1@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (= (fun08%limited s@$ xs@3@00 i@4@00) (fun08 s@$ xs@3@00 i@4@00))
  :pattern ((fun08 s@$ xs@3@00 i@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (fun08%stateless xs@3@00 i@4@00)
  :pattern ((fun08%limited s@$ xs@3@00 i@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (let ((result@5@00 (fun08%limited s@$ xs@3@00 i@4@00))) (and
    (forall ((j@41@00 Int)) (!
      (=>
        (and (<= 0 j@41@00) (< j@41@00 (Seq_length xs@3@00)))
        (and
          (= (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@41@00)) j@41@00)
          (img@43@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@41@00))))
      :pattern ((Seq_index xs@3@00 j@41@00))
      :qid |quant-u-29|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@43@00 s@$ xs@3@00 i@4@00 r)
          (and
            (<= 0 (inv@42@00 s@$ xs@3@00 i@4@00 r))
            (< (inv@42@00 s@$ xs@3@00 i@4@00 r) (Seq_length xs@3@00))))
        (= (Seq_index xs@3@00 (inv@42@00 s@$ xs@3@00 i@4@00 r)) r))
      :pattern ((inv@42@00 s@$ xs@3@00 i@4@00 r))
      :qid |f-fctOfInv|))
    (=>
      (fun08%precondition s@$ xs@3@00 i@4@00)
      (>
        result@5@00
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
          xs@3@00
          i@4@00))))))
  :pattern ((fun08%limited s@$ xs@3@00 i@4@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (let ((result@5@00 (fun08%limited s@$ xs@3@00 i@4@00))) true)
  :pattern ((fun08%limited s@$ xs@3@00 i@4@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (and
    (forall ((j@41@00 Int)) (!
      (=>
        (and (<= 0 j@41@00) (< j@41@00 (Seq_length xs@3@00)))
        (and
          (= (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@41@00)) j@41@00)
          (img@43@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@41@00))))
      :pattern ((Seq_index xs@3@00 j@41@00))
      :qid |quant-u-29|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@43@00 s@$ xs@3@00 i@4@00 r)
          (and
            (<= 0 (inv@42@00 s@$ xs@3@00 i@4@00 r))
            (< (inv@42@00 s@$ xs@3@00 i@4@00 r) (Seq_length xs@3@00))))
        (= (Seq_index xs@3@00 (inv@42@00 s@$ xs@3@00 i@4@00 r)) r))
      :pattern ((inv@42@00 s@$ xs@3@00 i@4@00 r))
      :qid |f-fctOfInv|))
    (=>
      (fun08%precondition s@$ xs@3@00 i@4@00)
      (=
        (fun08 s@$ xs@3@00 i@4@00)
        (+
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
            xs@3@00
            i@4@00))
          1))))
  :pattern ((fun08 s@$ xs@3@00 i@4@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  true
  :pattern ((fun08 s@$ xs@3@00 i@4@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  (= (fun04%limited s@$ x@6@00 n@7@00 i@8@00) (fun04 s@$ x@6@00 n@7@00 i@8@00))
  :pattern ((fun04 s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  (fun04%stateless x@6@00 n@7@00 i@8@00)
  :pattern ((fun04%limited s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  (and
    (forall ((j@47@00 Int)) (!
      (=>
        (and (<= 0 j@47@00) (< j@47@00 3))
        (and
          (=
            (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              j@47@00))
            j@47@00)
          (img@49@00 s@$ x@6@00 n@7@00 i@8@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            j@47@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        j@47@00))
      :qid |quant-u-35|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@49@00 s@$ x@6@00 n@7@00 i@8@00 r)
          (and
            (<= 0 (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r))
            (< (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r) 3)))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r))
          r))
      :pattern ((inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r))
      :qid |f-fctOfInv|))
    (forall ((j@50@00 Int)) (!
      (=>
        (and (<= 3 j@50@00) (< j@50@00 n@7@00))
        (and
          (=
            (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              j@50@00))
            j@50@00)
          (img@52@00 s@$ x@6@00 n@7@00 i@8@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            j@50@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        j@50@00))
      :qid |quant-u-37|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@52@00 s@$ x@6@00 n@7@00 i@8@00 r)
          (and
            (<= 3 (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r))
            (< (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r) n@7@00)))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r))
          r))
      :pattern ((inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@49@00 s@$ x@6@00 n@7@00 i@8@00 r)
          (and
            (<= 0 (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r))
            (< (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r) 3)))
        (=
          ($FVF.lookup_f (sm@53@00 s@$ x@6@00 n@7@00 i@8@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r)))
      :pattern (($FVF.lookup_f (sm@53@00 s@$ x@6@00 n@7@00 i@8@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@52@00 s@$ x@6@00 n@7@00 i@8@00 r)
          (and
            (<= 3 (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r))
            (< (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r) n@7@00)))
        (=
          ($FVF.lookup_f (sm@53@00 s@$ x@6@00 n@7@00 i@8@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r)))
      :pattern (($FVF.lookup_f (sm@53@00 s@$ x@6@00 n@7@00 i@8@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r))
      :qid |qp.fvfValDef5|))
    (=>
      (fun04%precondition s@$ x@6@00 n@7@00 i@8@00)
      (=
        (fun04 s@$ x@6@00 n@7@00 i@8@00)
        ($FVF.lookup_f (sm@53@00 s@$ x@6@00 n@7@00 i@8@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@8@00)))))
  :pattern ((fun04 s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  true
  :pattern ((fun04 s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (= (fun02%limited s@$ xs@10@00) (fun02 s@$ xs@10@00))
  :pattern ((fun02 s@$ xs@10@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (fun02%stateless xs@10@00)
  :pattern ((fun02%limited s@$ xs@10@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (and
    (forall ((i@57@00 Int)) (!
      (=>
        (and (<= 0 i@57@00) (< i@57@00 (Seq_length xs@10@00)))
        (and
          (= (inv@58@00 s@$ xs@10@00 (Seq_index xs@10@00 i@57@00)) i@57@00)
          (img@59@00 s@$ xs@10@00 (Seq_index xs@10@00 i@57@00))))
      :pattern ((Seq_index xs@10@00 i@57@00))
      :qid |quant-u-42|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@59@00 s@$ xs@10@00 r)
          (and
            (<= 0 (inv@58@00 s@$ xs@10@00 r))
            (< (inv@58@00 s@$ xs@10@00 r) (Seq_length xs@10@00))))
        (= (Seq_index xs@10@00 (inv@58@00 s@$ xs@10@00 r)) r))
      :pattern ((inv@58@00 s@$ xs@10@00 r))
      :qid |f-fctOfInv|))
    (=>
      (fun02%precondition s@$ xs@10@00)
      (=
        (fun02 s@$ xs@10@00)
        (+
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
            xs@10@00
            0))
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
            xs@10@00
            1))))))
  :pattern ((fun02 s@$ xs@10@00))
  :qid |quant-u-43|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  true
  :pattern ((fun02 s@$ xs@10@00))
  :qid |quant-u-44|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (= (fun01%limited s@$ xs@12@00) (fun01 s@$ xs@12@00))
  :pattern ((fun01 s@$ xs@12@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (fun01%stateless xs@12@00)
  :pattern ((fun01%limited s@$ xs@12@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (and
    (forall ((i@62@00 Int)) (!
      (=>
        (and (<= 0 i@62@00) (< i@62@00 (Seq_length xs@12@00)))
        (and
          (= (inv@63@00 s@$ xs@12@00 (Seq_index xs@12@00 i@62@00)) i@62@00)
          (img@64@00 s@$ xs@12@00 (Seq_index xs@12@00 i@62@00))))
      :pattern ((Seq_index xs@12@00 i@62@00))
      :qid |quant-u-46|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@64@00 s@$ xs@12@00 r)
          (and
            (<= 0 (inv@63@00 s@$ xs@12@00 r))
            (< (inv@63@00 s@$ xs@12@00 r) (Seq_length xs@12@00))))
        (= (Seq_index xs@12@00 (inv@63@00 s@$ xs@12@00 r)) r))
      :pattern ((inv@63@00 s@$ xs@12@00 r))
      :qid |f-fctOfInv|))
    (=>
      (fun01%precondition s@$ xs@12@00)
      (=
        (fun01 s@$ xs@12@00)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
          xs@12@00
          0)))))
  :pattern ((fun01 s@$ xs@12@00))
  :qid |quant-u-47|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  true
  :pattern ((fun01 s@$ xs@12@00))
  :qid |quant-u-48|)))
(assert (forall ((s@$ $Snap) (xs@14@00 Seq<$Ref>) (n@15@00 Int) (i@16@00 Int)) (!
  (=
    (fun06%limited s@$ xs@14@00 n@15@00 i@16@00)
    (fun06 s@$ xs@14@00 n@15@00 i@16@00))
  :pattern ((fun06 s@$ xs@14@00 n@15@00 i@16@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (xs@14@00 Seq<$Ref>) (n@15@00 Int) (i@16@00 Int)) (!
  (fun06%stateless xs@14@00 n@15@00 i@16@00)
  :pattern ((fun06%limited s@$ xs@14@00 n@15@00 i@16@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (xs@14@00 Seq<$Ref>) (n@15@00 Int) (i@16@00 Int)) (!
  (and
    (forall ((j@67@00 Int)) (!
      (=>
        (and (<= 0 j@67@00) (< j@67@00 3))
        (and
          (=
            (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@67@00))
            j@67@00)
          (img@69@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@67@00))))
      :pattern ((Seq_index xs@14@00 j@67@00))
      :qid |quant-u-50|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@69@00 s@$ xs@14@00 n@15@00 i@16@00 r)
          (and
            (<= 0 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
            (< (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r) 3)))
        (= (Seq_index xs@14@00 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r)) r))
      :pattern ((inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
      :qid |f-fctOfInv|))
    (forall ((j@70@00 Int)) (!
      (=>
        (and (<= 3 j@70@00) (< j@70@00 n@15@00))
        (and
          (=
            (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@70@00))
            j@70@00)
          (img@72@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@70@00))))
      :pattern ((Seq_index xs@14@00 j@70@00))
      :qid |quant-u-52|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@72@00 s@$ xs@14@00 n@15@00 i@16@00 r)
          (and
            (<= 3 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
            (< (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r) n@15@00)))
        (= (Seq_index xs@14@00 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r)) r))
      :pattern ((inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@69@00 s@$ xs@14@00 n@15@00 i@16@00 r)
          (and
            (<= 0 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
            (< (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r) 3)))
        (=
          ($FVF.lookup_f (sm@73@00 s@$ xs@14@00 n@15@00 i@16@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
      :pattern (($FVF.lookup_f (sm@73@00 s@$ xs@14@00 n@15@00 i@16@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
      :qid |qp.fvfValDef7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@72@00 s@$ xs@14@00 n@15@00 i@16@00 r)
          (and
            (<= 3 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
            (< (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r) n@15@00)))
        (=
          ($FVF.lookup_f (sm@73@00 s@$ xs@14@00 n@15@00 i@16@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
      :pattern (($FVF.lookup_f (sm@73@00 s@$ xs@14@00 n@15@00 i@16@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
      :qid |qp.fvfValDef8|))
    (=>
      (fun06%precondition s@$ xs@14@00 n@15@00 i@16@00)
      (=
        (fun06 s@$ xs@14@00 n@15@00 i@16@00)
        ($FVF.lookup_f (sm@73@00 s@$ xs@14@00 n@15@00 i@16@00) (Seq_index
          xs@14@00
          i@16@00)))))
  :pattern ((fun06 s@$ xs@14@00 n@15@00 i@16@00))
  :qid |quant-u-54|)))
(assert (forall ((s@$ $Snap) (xs@14@00 Seq<$Ref>) (n@15@00 Int) (i@16@00 Int)) (!
  true
  :pattern ((fun06 s@$ xs@14@00 n@15@00 i@16@00))
  :qid |quant-u-55|)))
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  (= (fun03%limited s@$ xs@18@00 i@19@00) (fun03 s@$ xs@18@00 i@19@00))
  :pattern ((fun03 s@$ xs@18@00 i@19@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  (fun03%stateless xs@18@00 i@19@00)
  :pattern ((fun03%limited s@$ xs@18@00 i@19@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  (and
    (forall ((j@77@00 Int)) (!
      (=>
        (and (<= 0 j@77@00) (< j@77@00 3))
        (and
          (=
            (inv@78@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@77@00))
            j@77@00)
          (img@79@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@77@00))))
      :pattern ((Seq_index xs@18@00 j@77@00))
      :qid |quant-u-57|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@79@00 s@$ xs@18@00 i@19@00 r)
          (and
            (<= 0 (inv@78@00 s@$ xs@18@00 i@19@00 r))
            (< (inv@78@00 s@$ xs@18@00 i@19@00 r) 3)))
        (= (Seq_index xs@18@00 (inv@78@00 s@$ xs@18@00 i@19@00 r)) r))
      :pattern ((inv@78@00 s@$ xs@18@00 i@19@00 r))
      :qid |f-fctOfInv|))
    (forall ((j@80@00 Int)) (!
      (=>
        (and (<= 3 j@80@00) (< j@80@00 (Seq_length xs@18@00)))
        (and
          (=
            (inv@81@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@80@00))
            j@80@00)
          (img@82@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@80@00))))
      :pattern ((Seq_index xs@18@00 j@80@00))
      :qid |quant-u-59|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@82@00 s@$ xs@18@00 i@19@00 r)
          (and
            (<= 3 (inv@81@00 s@$ xs@18@00 i@19@00 r))
            (< (inv@81@00 s@$ xs@18@00 i@19@00 r) (Seq_length xs@18@00))))
        (= (Seq_index xs@18@00 (inv@81@00 s@$ xs@18@00 i@19@00 r)) r))
      :pattern ((inv@81@00 s@$ xs@18@00 i@19@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@79@00 s@$ xs@18@00 i@19@00 r)
          (and
            (<= 0 (inv@78@00 s@$ xs@18@00 i@19@00 r))
            (< (inv@78@00 s@$ xs@18@00 i@19@00 r) 3)))
        (=
          ($FVF.lookup_f (sm@83@00 s@$ xs@18@00 i@19@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_f (sm@83@00 s@$ xs@18@00 i@19@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef10|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@82@00 s@$ xs@18@00 i@19@00 r)
          (and
            (<= 3 (inv@81@00 s@$ xs@18@00 i@19@00 r))
            (< (inv@81@00 s@$ xs@18@00 i@19@00 r) (Seq_length xs@18@00))))
        (=
          ($FVF.lookup_f (sm@83@00 s@$ xs@18@00 i@19@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_f (sm@83@00 s@$ xs@18@00 i@19@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef11|))
    (=>
      (fun03%precondition s@$ xs@18@00 i@19@00)
      (=
        (fun03 s@$ xs@18@00 i@19@00)
        ($FVF.lookup_f (sm@83@00 s@$ xs@18@00 i@19@00) (Seq_index
          xs@18@00
          i@19@00)))))
  :pattern ((fun03 s@$ xs@18@00 i@19@00))
  :qid |quant-u-61|)))
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  true
  :pattern ((fun03 s@$ xs@18@00 i@19@00))
  :qid |quant-u-62|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
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
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@3@01 Int)
(declare-const j@4@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
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
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 1 | !(i@3@01 < |xs@1@01|) | live]
; [else-branch: 1 | i@3@01 < |xs@1@01| | live]
(push) ; 7
; [then-branch: 1 | !(i@3@01 < |xs@1@01|)]
(assert (not (< i@3@01 (Seq_length xs@1@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i@3@01 < |xs@1@01|]
(assert (< i@3@01 (Seq_length xs@1@01)))
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
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 3 | !(j@4@01 < |xs@1@01|) | live]
; [else-branch: 3 | j@4@01 < |xs@1@01| | live]
(push) ; 11
; [then-branch: 3 | !(j@4@01 < |xs@1@01|)]
(assert (not (< j@4@01 (Seq_length xs@1@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | j@4@01 < |xs@1@01|]
(assert (< j@4@01 (Seq_length xs@1@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@4@01 (Seq_length xs@1@01)) (not (< j@4@01 (Seq_length xs@1@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@4@01 0)
  (and
    (>= j@4@01 0)
    (or (< j@4@01 (Seq_length xs@1@01)) (not (< j@4@01 (Seq_length xs@1@01)))))))
(assert (or (>= j@4@01 0) (not (>= j@4@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@3@01 (Seq_length xs@1@01))
  (and
    (< i@3@01 (Seq_length xs@1@01))
    (=>
      (>= j@4@01 0)
      (and
        (>= j@4@01 0)
        (or
          (< j@4@01 (Seq_length xs@1@01))
          (not (< j@4@01 (Seq_length xs@1@01))))))
    (or (>= j@4@01 0) (not (>= j@4@01 0))))))
(assert (or (< i@3@01 (Seq_length xs@1@01)) (not (< i@3@01 (Seq_length xs@1@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@3@01 0)
  (and
    (>= i@3@01 0)
    (=>
      (< i@3@01 (Seq_length xs@1@01))
      (and
        (< i@3@01 (Seq_length xs@1@01))
        (=>
          (>= j@4@01 0)
          (and
            (>= j@4@01 0)
            (or
              (< j@4@01 (Seq_length xs@1@01))
              (not (< j@4@01 (Seq_length xs@1@01))))))
        (or (>= j@4@01 0) (not (>= j@4@01 0)))))
    (or (< i@3@01 (Seq_length xs@1@01)) (not (< i@3@01 (Seq_length xs@1@01)))))))
(assert (or (>= i@3@01 0) (not (>= i@3@01 0))))
(push) ; 4
; [then-branch: 4 | i@3@01 >= 0 && i@3@01 < |xs@1@01| && j@4@01 >= 0 && j@4@01 < |xs@1@01| && i@3@01 != j@4@01 | live]
; [else-branch: 4 | !(i@3@01 >= 0 && i@3@01 < |xs@1@01| && j@4@01 >= 0 && j@4@01 < |xs@1@01| && i@3@01 != j@4@01) | live]
(push) ; 5
; [then-branch: 4 | i@3@01 >= 0 && i@3@01 < |xs@1@01| && j@4@01 >= 0 && j@4@01 < |xs@1@01| && i@3@01 != j@4@01]
(assert (and
  (>= i@3@01 0)
  (and
    (< i@3@01 (Seq_length xs@1@01))
    (and
      (>= j@4@01 0)
      (and (< j@4@01 (Seq_length xs@1@01)) (not (= i@3@01 j@4@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@3@01 >= 0 && i@3@01 < |xs@1@01| && j@4@01 >= 0 && j@4@01 < |xs@1@01| && i@3@01 != j@4@01)]
(assert (not
  (and
    (>= i@3@01 0)
    (and
      (< i@3@01 (Seq_length xs@1@01))
      (and
        (>= j@4@01 0)
        (and (< j@4@01 (Seq_length xs@1@01)) (not (= i@3@01 j@4@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@3@01 0)
    (and
      (< i@3@01 (Seq_length xs@1@01))
      (and
        (>= j@4@01 0)
        (and (< j@4@01 (Seq_length xs@1@01)) (not (= i@3@01 j@4@01))))))
  (and
    (>= i@3@01 0)
    (< i@3@01 (Seq_length xs@1@01))
    (>= j@4@01 0)
    (< j@4@01 (Seq_length xs@1@01))
    (not (= i@3@01 j@4@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@3@01 0)
      (and
        (< i@3@01 (Seq_length xs@1@01))
        (and
          (>= j@4@01 0)
          (and (< j@4@01 (Seq_length xs@1@01)) (not (= i@3@01 j@4@01)))))))
  (and
    (>= i@3@01 0)
    (and
      (< i@3@01 (Seq_length xs@1@01))
      (and
        (>= j@4@01 0)
        (and (< j@4@01 (Seq_length xs@1@01)) (not (= i@3@01 j@4@01))))))))
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
          (< i@3@01 (Seq_length xs@1@01))
          (and
            (< i@3@01 (Seq_length xs@1@01))
            (=>
              (>= j@4@01 0)
              (and
                (>= j@4@01 0)
                (or
                  (< j@4@01 (Seq_length xs@1@01))
                  (not (< j@4@01 (Seq_length xs@1@01))))))
            (or (>= j@4@01 0) (not (>= j@4@01 0)))))
        (or
          (< i@3@01 (Seq_length xs@1@01))
          (not (< i@3@01 (Seq_length xs@1@01))))))
    (or (>= i@3@01 0) (not (>= i@3@01 0)))
    (=>
      (and
        (>= i@3@01 0)
        (and
          (< i@3@01 (Seq_length xs@1@01))
          (and
            (>= j@4@01 0)
            (and (< j@4@01 (Seq_length xs@1@01)) (not (= i@3@01 j@4@01))))))
      (and
        (>= i@3@01 0)
        (< i@3@01 (Seq_length xs@1@01))
        (>= j@4@01 0)
        (< j@4@01 (Seq_length xs@1@01))
        (not (= i@3@01 j@4@01))))
    (or
      (not
        (and
          (>= i@3@01 0)
          (and
            (< i@3@01 (Seq_length xs@1@01))
            (and
              (>= j@4@01 0)
              (and (< j@4@01 (Seq_length xs@1@01)) (not (= i@3@01 j@4@01)))))))
      (and
        (>= i@3@01 0)
        (and
          (< i@3@01 (Seq_length xs@1@01))
          (and
            (>= j@4@01 0)
            (and (< j@4@01 (Seq_length xs@1@01)) (not (= i@3@01 j@4@01))))))))
  :pattern ((Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@13@10@13@104-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (=>
    (and
      (>= i@3@01 0)
      (and
        (< i@3@01 (Seq_length xs@1@01))
        (and
          (>= j@4@01 0)
          (and (< j@4@01 (Seq_length xs@1@01)) (not (= i@3@01 j@4@01))))))
    (not (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))))
  :pattern ((Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@13@10@13@104|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
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
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
(assert (and (<= 0 i@5@01) (< i@5@01 (Seq_length xs@1@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@5@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@6@01 $FVF<f>)
(declare-fun inv@7@01 ($Ref) Int)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 (Seq_length xs@1@01)))
    (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
  :pattern ((Seq_index xs@1@01 i@5@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@5@01 Int) (i2@5@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@5@01) (< i1@5@01 (Seq_length xs@1@01)))
      (and (<= 0 i2@5@01) (< i2@5@01 (Seq_length xs@1@01)))
      (= (Seq_index xs@1@01 i1@5@01) (Seq_index xs@1@01 i2@5@01)))
    (= i1@5@01 i2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 (Seq_length xs@1@01)))
    (and
      (= (inv@7@01 (Seq_index xs@1@01 i@5@01)) i@5@01)
      (img@8@01 (Seq_index xs@1@01 i@5@01))))
  :pattern ((Seq_index xs@1@01 i@5@01))
  :qid |quant-u-74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@01 r)
      (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) (Seq_length xs@1@01))))
    (= (Seq_index xs@1@01 (inv@7@01 r)) r))
  :pattern ((inv@7@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 (Seq_length xs@1@01)))
    (not (= (Seq_index xs@1@01 i@5@01) $Ref.null)))
  :pattern ((Seq_index xs@1@01 i@5@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale |xs| > 3
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@1@01) 3))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale fun01(xs) == 5
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] fun01(xs) == 5
; [eval] fun01(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@11@01 Int)
(declare-const j@12@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 6 | !(i@11@01 >= 0) | live]
; [else-branch: 6 | i@11@01 >= 0 | live]
(push) ; 6
; [then-branch: 6 | !(i@11@01 >= 0)]
(assert (not (>= i@11@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | i@11@01 >= 0]
(assert (>= i@11@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 7 | !(i@11@01 < |xs@1@01|) | live]
; [else-branch: 7 | i@11@01 < |xs@1@01| | live]
(push) ; 8
; [then-branch: 7 | !(i@11@01 < |xs@1@01|)]
(assert (not (< i@11@01 (Seq_length xs@1@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 7 | i@11@01 < |xs@1@01|]
(assert (< i@11@01 (Seq_length xs@1@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 8 | !(j@12@01 >= 0) | live]
; [else-branch: 8 | j@12@01 >= 0 | live]
(push) ; 10
; [then-branch: 8 | !(j@12@01 >= 0)]
(assert (not (>= j@12@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 8 | j@12@01 >= 0]
(assert (>= j@12@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 9 | !(j@12@01 < |xs@1@01|) | live]
; [else-branch: 9 | j@12@01 < |xs@1@01| | live]
(push) ; 12
; [then-branch: 9 | !(j@12@01 < |xs@1@01|)]
(assert (not (< j@12@01 (Seq_length xs@1@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 9 | j@12@01 < |xs@1@01|]
(assert (< j@12@01 (Seq_length xs@1@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@12@01 (Seq_length xs@1@01)) (not (< j@12@01 (Seq_length xs@1@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@12@01 0)
  (and
    (>= j@12@01 0)
    (or (< j@12@01 (Seq_length xs@1@01)) (not (< j@12@01 (Seq_length xs@1@01)))))))
(assert (or (>= j@12@01 0) (not (>= j@12@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@11@01 (Seq_length xs@1@01))
  (and
    (< i@11@01 (Seq_length xs@1@01))
    (=>
      (>= j@12@01 0)
      (and
        (>= j@12@01 0)
        (or
          (< j@12@01 (Seq_length xs@1@01))
          (not (< j@12@01 (Seq_length xs@1@01))))))
    (or (>= j@12@01 0) (not (>= j@12@01 0))))))
(assert (or (< i@11@01 (Seq_length xs@1@01)) (not (< i@11@01 (Seq_length xs@1@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@11@01 0)
  (and
    (>= i@11@01 0)
    (=>
      (< i@11@01 (Seq_length xs@1@01))
      (and
        (< i@11@01 (Seq_length xs@1@01))
        (=>
          (>= j@12@01 0)
          (and
            (>= j@12@01 0)
            (or
              (< j@12@01 (Seq_length xs@1@01))
              (not (< j@12@01 (Seq_length xs@1@01))))))
        (or (>= j@12@01 0) (not (>= j@12@01 0)))))
    (or (< i@11@01 (Seq_length xs@1@01)) (not (< i@11@01 (Seq_length xs@1@01)))))))
(assert (or (>= i@11@01 0) (not (>= i@11@01 0))))
(push) ; 5
; [then-branch: 10 | i@11@01 >= 0 && i@11@01 < |xs@1@01| && j@12@01 >= 0 && j@12@01 < |xs@1@01| && i@11@01 != j@12@01 | live]
; [else-branch: 10 | !(i@11@01 >= 0 && i@11@01 < |xs@1@01| && j@12@01 >= 0 && j@12@01 < |xs@1@01| && i@11@01 != j@12@01) | live]
(push) ; 6
; [then-branch: 10 | i@11@01 >= 0 && i@11@01 < |xs@1@01| && j@12@01 >= 0 && j@12@01 < |xs@1@01| && i@11@01 != j@12@01]
(assert (and
  (>= i@11@01 0)
  (and
    (< i@11@01 (Seq_length xs@1@01))
    (and
      (>= j@12@01 0)
      (and (< j@12@01 (Seq_length xs@1@01)) (not (= i@11@01 j@12@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(i@11@01 >= 0 && i@11@01 < |xs@1@01| && j@12@01 >= 0 && j@12@01 < |xs@1@01| && i@11@01 != j@12@01)]
(assert (not
  (and
    (>= i@11@01 0)
    (and
      (< i@11@01 (Seq_length xs@1@01))
      (and
        (>= j@12@01 0)
        (and (< j@12@01 (Seq_length xs@1@01)) (not (= i@11@01 j@12@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@11@01 0)
    (and
      (< i@11@01 (Seq_length xs@1@01))
      (and
        (>= j@12@01 0)
        (and (< j@12@01 (Seq_length xs@1@01)) (not (= i@11@01 j@12@01))))))
  (and
    (>= i@11@01 0)
    (< i@11@01 (Seq_length xs@1@01))
    (>= j@12@01 0)
    (< j@12@01 (Seq_length xs@1@01))
    (not (= i@11@01 j@12@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@11@01 0)
      (and
        (< i@11@01 (Seq_length xs@1@01))
        (and
          (>= j@12@01 0)
          (and (< j@12@01 (Seq_length xs@1@01)) (not (= i@11@01 j@12@01)))))))
  (and
    (>= i@11@01 0)
    (and
      (< i@11@01 (Seq_length xs@1@01))
      (and
        (>= j@12@01 0)
        (and (< j@12@01 (Seq_length xs@1@01)) (not (= i@11@01 j@12@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (=>
    (and
      (>= i@11@01 0)
      (and
        (< i@11@01 (Seq_length xs@1@01))
        (and
          (>= j@12@01 0)
          (and (< j@12@01 (Seq_length xs@1@01)) (not (= i@11@01 j@12@01))))))
    (not (= (Seq_index xs@1@01 i@11@01) (Seq_index xs@1@01 j@12@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (=>
    (and
      (>= i@11@01 0)
      (and
        (< i@11@01 (Seq_length xs@1@01))
        (and
          (>= j@12@01 0)
          (and (< j@12@01 (Seq_length xs@1@01)) (not (= i@11@01 j@12@01))))))
    (not (= (Seq_index xs@1@01 i@11@01) (Seq_index xs@1@01 j@12@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106|)))
(declare-const i@13@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 11 | !(0 <= i@13@01) | live]
; [else-branch: 11 | 0 <= i@13@01 | live]
(push) ; 6
; [then-branch: 11 | !(0 <= i@13@01)]
(assert (not (<= 0 i@13@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | 0 <= i@13@01]
(assert (<= 0 i@13@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@13@01) (not (<= 0 i@13@01))))
(assert (and (<= 0 i@13@01) (< i@13@01 (Seq_length xs@1@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@13@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@14@01 ($Ref) Int)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (<= 0 i@13@01) (< i@13@01 (Seq_length xs@1@01)))
    (or (<= 0 i@13@01) (not (<= 0 i@13@01))))
  :pattern ((Seq_index xs@1@01 i@13@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@13@01 Int) (i2@13@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@13@01) (< i1@13@01 (Seq_length xs@1@01)))
      (and (<= 0 i2@13@01) (< i2@13@01 (Seq_length xs@1@01)))
      (= (Seq_index xs@1@01 i1@13@01) (Seq_index xs@1@01 i2@13@01)))
    (= i1@13@01 i2@13@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (<= 0 i@13@01) (< i@13@01 (Seq_length xs@1@01)))
    (and
      (= (inv@14@01 (Seq_index xs@1@01 i@13@01)) i@13@01)
      (img@15@01 (Seq_index xs@1@01 i@13@01))))
  :pattern ((Seq_index xs@1@01 i@13@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01))))
    (= (Seq_index xs@1@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@16@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01)))
      (img@15@01 r)
      (= r (Seq_index xs@1@01 (inv@14@01 r))))
    ($Perm.min
      (ite
        (and
          (img@8@01 r)
          (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) (Seq_length xs@1@01))))
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
          (img@8@01 r)
          (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) (Seq_length xs@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@16@01 r))
    $Perm.No)
  
  :qid |quant-u-77|))))
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
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01)))
      (img@15@01 r)
      (= r (Seq_index xs@1@01 (inv@14@01 r))))
    (= (- $Perm.Write (pTaken@16@01 r)) $Perm.No))
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@17@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01)))
        (img@15@01 r)))
    (=>
      (and
        (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01)))
        (img@15@01 r))
      (Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01)))
        (img@15@01 r))
      (and
        (img@8@01 r)
        (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) (Seq_length xs@1@01)))))
    (= ($FVF.lookup_f (as sm@17@01  $FVF<f>) r) ($FVF.lookup_f $t@6@01 r)))
  :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@6@01 r))
  :qid |qp.fvfValDef0|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun01%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@17@01  $FVF<f>))
    $Snap.unit)) xs@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (<= 0 i@13@01) (< i@13@01 (Seq_length xs@1@01)))
    (and
      (= (inv@14@01 (Seq_index xs@1@01 i@13@01)) i@13@01)
      (img@15@01 (Seq_index xs@1@01 i@13@01))))
  :pattern ((Seq_index xs@1@01 i@13@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01))))
    (= (Seq_index xs@1@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01)))
        (img@15@01 r)))
    (=>
      (and
        (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01)))
        (img@15@01 r))
      (Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@17@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length xs@1@01)))
        (img@15@01 r))
      (and
        (img@8@01 r)
        (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) (Seq_length xs@1@01)))))
    (= ($FVF.lookup_f (as sm@17@01  $FVF<f>) r) ($FVF.lookup_f $t@6@01 r)))
  :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@6@01 r))
  :qid |qp.fvfValDef0|)))
(assert (and
  (forall ((i@11@01 Int) (j@12@01 Int)) (!
    (=>
      (and
        (>= i@11@01 0)
        (and
          (< i@11@01 (Seq_length xs@1@01))
          (and
            (>= j@12@01 0)
            (and (< j@12@01 (Seq_length xs@1@01)) (not (= i@11@01 j@12@01))))))
      (not (= (Seq_index xs@1@01 i@11@01) (Seq_index xs@1@01 j@12@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106|))
  (forall ((i@13@01 Int)) (!
    (=>
      (and (<= 0 i@13@01) (< i@13@01 (Seq_length xs@1@01)))
      (or (<= 0 i@13@01) (not (<= 0 i@13@01))))
    :pattern ((Seq_index xs@1@01 i@13@01))
    :qid |f-aux|))
  (fun01%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@17@01  $FVF<f>))
      $Snap.unit)) xs@1@01)))
(assert (=
  (fun01 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@17@01  $FVF<f>))
      $Snap.unit)) xs@1@01)
  5))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert fun01(xs) == 5
; [eval] fun01(xs) == 5
; [eval] fun01(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@18@01 Int)
(declare-const j@19@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 12 | !(i@18@01 >= 0) | live]
; [else-branch: 12 | i@18@01 >= 0 | live]
(push) ; 6
; [then-branch: 12 | !(i@18@01 >= 0)]
(assert (not (>= i@18@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | i@18@01 >= 0]
(assert (>= i@18@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 13 | !(i@18@01 < |xs@1@01|) | live]
; [else-branch: 13 | i@18@01 < |xs@1@01| | live]
(push) ; 8
; [then-branch: 13 | !(i@18@01 < |xs@1@01|)]
(assert (not (< i@18@01 (Seq_length xs@1@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 13 | i@18@01 < |xs@1@01|]
(assert (< i@18@01 (Seq_length xs@1@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 14 | !(j@19@01 >= 0) | live]
; [else-branch: 14 | j@19@01 >= 0 | live]
(push) ; 10
; [then-branch: 14 | !(j@19@01 >= 0)]
(assert (not (>= j@19@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 14 | j@19@01 >= 0]
(assert (>= j@19@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 15 | !(j@19@01 < |xs@1@01|) | live]
; [else-branch: 15 | j@19@01 < |xs@1@01| | live]
(push) ; 12
; [then-branch: 15 | !(j@19@01 < |xs@1@01|)]
(assert (not (< j@19@01 (Seq_length xs@1@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 15 | j@19@01 < |xs@1@01|]
(assert (< j@19@01 (Seq_length xs@1@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@19@01 (Seq_length xs@1@01)) (not (< j@19@01 (Seq_length xs@1@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@19@01 0)
  (and
    (>= j@19@01 0)
    (or (< j@19@01 (Seq_length xs@1@01)) (not (< j@19@01 (Seq_length xs@1@01)))))))
(assert (or (>= j@19@01 0) (not (>= j@19@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@18@01 (Seq_length xs@1@01))
  (and
    (< i@18@01 (Seq_length xs@1@01))
    (=>
      (>= j@19@01 0)
      (and
        (>= j@19@01 0)
        (or
          (< j@19@01 (Seq_length xs@1@01))
          (not (< j@19@01 (Seq_length xs@1@01))))))
    (or (>= j@19@01 0) (not (>= j@19@01 0))))))
(assert (or (< i@18@01 (Seq_length xs@1@01)) (not (< i@18@01 (Seq_length xs@1@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@18@01 0)
  (and
    (>= i@18@01 0)
    (=>
      (< i@18@01 (Seq_length xs@1@01))
      (and
        (< i@18@01 (Seq_length xs@1@01))
        (=>
          (>= j@19@01 0)
          (and
            (>= j@19@01 0)
            (or
              (< j@19@01 (Seq_length xs@1@01))
              (not (< j@19@01 (Seq_length xs@1@01))))))
        (or (>= j@19@01 0) (not (>= j@19@01 0)))))
    (or (< i@18@01 (Seq_length xs@1@01)) (not (< i@18@01 (Seq_length xs@1@01)))))))
(assert (or (>= i@18@01 0) (not (>= i@18@01 0))))
(push) ; 5
; [then-branch: 16 | i@18@01 >= 0 && i@18@01 < |xs@1@01| && j@19@01 >= 0 && j@19@01 < |xs@1@01| && i@18@01 != j@19@01 | live]
; [else-branch: 16 | !(i@18@01 >= 0 && i@18@01 < |xs@1@01| && j@19@01 >= 0 && j@19@01 < |xs@1@01| && i@18@01 != j@19@01) | live]
(push) ; 6
; [then-branch: 16 | i@18@01 >= 0 && i@18@01 < |xs@1@01| && j@19@01 >= 0 && j@19@01 < |xs@1@01| && i@18@01 != j@19@01]
(assert (and
  (>= i@18@01 0)
  (and
    (< i@18@01 (Seq_length xs@1@01))
    (and
      (>= j@19@01 0)
      (and (< j@19@01 (Seq_length xs@1@01)) (not (= i@18@01 j@19@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 16 | !(i@18@01 >= 0 && i@18@01 < |xs@1@01| && j@19@01 >= 0 && j@19@01 < |xs@1@01| && i@18@01 != j@19@01)]
(assert (not
  (and
    (>= i@18@01 0)
    (and
      (< i@18@01 (Seq_length xs@1@01))
      (and
        (>= j@19@01 0)
        (and (< j@19@01 (Seq_length xs@1@01)) (not (= i@18@01 j@19@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@18@01 0)
    (and
      (< i@18@01 (Seq_length xs@1@01))
      (and
        (>= j@19@01 0)
        (and (< j@19@01 (Seq_length xs@1@01)) (not (= i@18@01 j@19@01))))))
  (and
    (>= i@18@01 0)
    (< i@18@01 (Seq_length xs@1@01))
    (>= j@19@01 0)
    (< j@19@01 (Seq_length xs@1@01))
    (not (= i@18@01 j@19@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@18@01 0)
      (and
        (< i@18@01 (Seq_length xs@1@01))
        (and
          (>= j@19@01 0)
          (and (< j@19@01 (Seq_length xs@1@01)) (not (= i@18@01 j@19@01)))))))
  (and
    (>= i@18@01 0)
    (and
      (< i@18@01 (Seq_length xs@1@01))
      (and
        (>= j@19@01 0)
        (and (< j@19@01 (Seq_length xs@1@01)) (not (= i@18@01 j@19@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@18@01 Int) (j@19@01 Int)) (!
  (=>
    (and
      (>= i@18@01 0)
      (and
        (< i@18@01 (Seq_length xs@1@01))
        (and
          (>= j@19@01 0)
          (and (< j@19@01 (Seq_length xs@1@01)) (not (= i@18@01 j@19@01))))))
    (not (= (Seq_index xs@1@01 i@18@01) (Seq_index xs@1@01 j@19@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@18@01 Int) (j@19@01 Int)) (!
  (=>
    (and
      (>= i@18@01 0)
      (and
        (< i@18@01 (Seq_length xs@1@01))
        (and
          (>= j@19@01 0)
          (and (< j@19@01 (Seq_length xs@1@01)) (not (= i@18@01 j@19@01))))))
    (not (= (Seq_index xs@1@01 i@18@01) (Seq_index xs@1@01 j@19@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106|)))
(declare-const i@20@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 17 | !(0 <= i@20@01) | live]
; [else-branch: 17 | 0 <= i@20@01 | live]
(push) ; 6
; [then-branch: 17 | !(0 <= i@20@01)]
(assert (not (<= 0 i@20@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 17 | 0 <= i@20@01]
(assert (<= 0 i@20@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
(assert (and (<= 0 i@20@01) (< i@20@01 (Seq_length xs@1@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@20@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@21@01 ($Ref) Int)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 0 i@20@01) (< i@20@01 (Seq_length xs@1@01)))
    (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
  :pattern ((Seq_index xs@1@01 i@20@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@20@01 Int) (i2@20@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@20@01) (< i1@20@01 (Seq_length xs@1@01)))
      (and (<= 0 i2@20@01) (< i2@20@01 (Seq_length xs@1@01)))
      (= (Seq_index xs@1@01 i1@20@01) (Seq_index xs@1@01 i2@20@01)))
    (= i1@20@01 i2@20@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 0 i@20@01) (< i@20@01 (Seq_length xs@1@01)))
    (and
      (= (inv@21@01 (Seq_index xs@1@01 i@20@01)) i@20@01)
      (img@22@01 (Seq_index xs@1@01 i@20@01))))
  :pattern ((Seq_index xs@1@01 i@20@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@01 r)
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01))))
    (= (Seq_index xs@1@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01)))
      (img@22@01 r)
      (= r (Seq_index xs@1@01 (inv@21@01 r))))
    ($Perm.min
      (ite
        (and
          (img@8@01 r)
          (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) (Seq_length xs@1@01))))
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
          (img@8@01 r)
          (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) (Seq_length xs@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@23@01 r))
    $Perm.No)
  
  :qid |quant-u-81|))))
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
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01)))
      (img@22@01 r)
      (= r (Seq_index xs@1@01 (inv@21@01 r))))
    (= (- $Perm.Write (pTaken@23@01 r)) $Perm.No))
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@24@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01)))
        (img@22@01 r)))
    (=>
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01)))
        (img@22@01 r))
      (Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01)))
        (img@22@01 r))
      (and
        (img@8@01 r)
        (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) (Seq_length xs@1@01)))))
    (= ($FVF.lookup_f (as sm@24@01  $FVF<f>) r) ($FVF.lookup_f $t@6@01 r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@6@01 r))
  :qid |qp.fvfValDef2|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun01%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@24@01  $FVF<f>))
    $Snap.unit)) xs@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 0 i@20@01) (< i@20@01 (Seq_length xs@1@01)))
    (and
      (= (inv@21@01 (Seq_index xs@1@01 i@20@01)) i@20@01)
      (img@22@01 (Seq_index xs@1@01 i@20@01))))
  :pattern ((Seq_index xs@1@01 i@20@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@01 r)
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01))))
    (= (Seq_index xs@1@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01)))
        (img@22@01 r)))
    (=>
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01)))
        (img@22@01 r))
      (Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@24@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (Seq_length xs@1@01)))
        (img@22@01 r))
      (and
        (img@8@01 r)
        (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) (Seq_length xs@1@01)))))
    (= ($FVF.lookup_f (as sm@24@01  $FVF<f>) r) ($FVF.lookup_f $t@6@01 r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@6@01 r))
  :qid |qp.fvfValDef2|)))
(assert (and
  (forall ((i@18@01 Int) (j@19@01 Int)) (!
    (=>
      (and
        (>= i@18@01 0)
        (and
          (< i@18@01 (Seq_length xs@1@01))
          (and
            (>= j@19@01 0)
            (and (< j@19@01 (Seq_length xs@1@01)) (not (= i@18@01 j@19@01))))))
      (not (= (Seq_index xs@1@01 i@18@01) (Seq_index xs@1@01 j@19@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106|))
  (forall ((i@20@01 Int)) (!
    (=>
      (and (<= 0 i@20@01) (< i@20@01 (Seq_length xs@1@01)))
      (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
    :pattern ((Seq_index xs@1@01 i@20@01))
    :qid |f-aux|))
  (fun01%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@24@01  $FVF<f>))
      $Snap.unit)) xs@1@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun01 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@24@01  $FVF<f>))
      $Snap.unit)) xs@1@01)
  5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun01 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@24@01  $FVF<f>))
      $Snap.unit)) xs@1@01)
  5))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@25@01 Seq<$Ref>)
(declare-const xs@26@01 Seq<$Ref>)
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
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@28@01 Int)
(declare-const j@29@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 18 | !(i@28@01 >= 0) | live]
; [else-branch: 18 | i@28@01 >= 0 | live]
(push) ; 5
; [then-branch: 18 | !(i@28@01 >= 0)]
(assert (not (>= i@28@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | i@28@01 >= 0]
(assert (>= i@28@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 19 | !(i@28@01 < |xs@26@01|) | live]
; [else-branch: 19 | i@28@01 < |xs@26@01| | live]
(push) ; 7
; [then-branch: 19 | !(i@28@01 < |xs@26@01|)]
(assert (not (< i@28@01 (Seq_length xs@26@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | i@28@01 < |xs@26@01|]
(assert (< i@28@01 (Seq_length xs@26@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 20 | !(j@29@01 >= 0) | live]
; [else-branch: 20 | j@29@01 >= 0 | live]
(push) ; 9
; [then-branch: 20 | !(j@29@01 >= 0)]
(assert (not (>= j@29@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 20 | j@29@01 >= 0]
(assert (>= j@29@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 21 | !(j@29@01 < |xs@26@01|) | live]
; [else-branch: 21 | j@29@01 < |xs@26@01| | live]
(push) ; 11
; [then-branch: 21 | !(j@29@01 < |xs@26@01|)]
(assert (not (< j@29@01 (Seq_length xs@26@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 21 | j@29@01 < |xs@26@01|]
(assert (< j@29@01 (Seq_length xs@26@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@29@01 (Seq_length xs@26@01)) (not (< j@29@01 (Seq_length xs@26@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@29@01 0)
  (and
    (>= j@29@01 0)
    (or
      (< j@29@01 (Seq_length xs@26@01))
      (not (< j@29@01 (Seq_length xs@26@01)))))))
(assert (or (>= j@29@01 0) (not (>= j@29@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@28@01 (Seq_length xs@26@01))
  (and
    (< i@28@01 (Seq_length xs@26@01))
    (=>
      (>= j@29@01 0)
      (and
        (>= j@29@01 0)
        (or
          (< j@29@01 (Seq_length xs@26@01))
          (not (< j@29@01 (Seq_length xs@26@01))))))
    (or (>= j@29@01 0) (not (>= j@29@01 0))))))
(assert (or (< i@28@01 (Seq_length xs@26@01)) (not (< i@28@01 (Seq_length xs@26@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@28@01 0)
  (and
    (>= i@28@01 0)
    (=>
      (< i@28@01 (Seq_length xs@26@01))
      (and
        (< i@28@01 (Seq_length xs@26@01))
        (=>
          (>= j@29@01 0)
          (and
            (>= j@29@01 0)
            (or
              (< j@29@01 (Seq_length xs@26@01))
              (not (< j@29@01 (Seq_length xs@26@01))))))
        (or (>= j@29@01 0) (not (>= j@29@01 0)))))
    (or
      (< i@28@01 (Seq_length xs@26@01))
      (not (< i@28@01 (Seq_length xs@26@01)))))))
(assert (or (>= i@28@01 0) (not (>= i@28@01 0))))
(push) ; 4
; [then-branch: 22 | i@28@01 >= 0 && i@28@01 < |xs@26@01| && j@29@01 >= 0 && j@29@01 < |xs@26@01| && i@28@01 != j@29@01 | live]
; [else-branch: 22 | !(i@28@01 >= 0 && i@28@01 < |xs@26@01| && j@29@01 >= 0 && j@29@01 < |xs@26@01| && i@28@01 != j@29@01) | live]
(push) ; 5
; [then-branch: 22 | i@28@01 >= 0 && i@28@01 < |xs@26@01| && j@29@01 >= 0 && j@29@01 < |xs@26@01| && i@28@01 != j@29@01]
(assert (and
  (>= i@28@01 0)
  (and
    (< i@28@01 (Seq_length xs@26@01))
    (and
      (>= j@29@01 0)
      (and (< j@29@01 (Seq_length xs@26@01)) (not (= i@28@01 j@29@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(i@28@01 >= 0 && i@28@01 < |xs@26@01| && j@29@01 >= 0 && j@29@01 < |xs@26@01| && i@28@01 != j@29@01)]
(assert (not
  (and
    (>= i@28@01 0)
    (and
      (< i@28@01 (Seq_length xs@26@01))
      (and
        (>= j@29@01 0)
        (and (< j@29@01 (Seq_length xs@26@01)) (not (= i@28@01 j@29@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@28@01 0)
    (and
      (< i@28@01 (Seq_length xs@26@01))
      (and
        (>= j@29@01 0)
        (and (< j@29@01 (Seq_length xs@26@01)) (not (= i@28@01 j@29@01))))))
  (and
    (>= i@28@01 0)
    (< i@28@01 (Seq_length xs@26@01))
    (>= j@29@01 0)
    (< j@29@01 (Seq_length xs@26@01))
    (not (= i@28@01 j@29@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@28@01 0)
      (and
        (< i@28@01 (Seq_length xs@26@01))
        (and
          (>= j@29@01 0)
          (and (< j@29@01 (Seq_length xs@26@01)) (not (= i@28@01 j@29@01)))))))
  (and
    (>= i@28@01 0)
    (and
      (< i@28@01 (Seq_length xs@26@01))
      (and
        (>= j@29@01 0)
        (and (< j@29@01 (Seq_length xs@26@01)) (not (= i@28@01 j@29@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@28@01 Int) (j@29@01 Int)) (!
  (and
    (=>
      (>= i@28@01 0)
      (and
        (>= i@28@01 0)
        (=>
          (< i@28@01 (Seq_length xs@26@01))
          (and
            (< i@28@01 (Seq_length xs@26@01))
            (=>
              (>= j@29@01 0)
              (and
                (>= j@29@01 0)
                (or
                  (< j@29@01 (Seq_length xs@26@01))
                  (not (< j@29@01 (Seq_length xs@26@01))))))
            (or (>= j@29@01 0) (not (>= j@29@01 0)))))
        (or
          (< i@28@01 (Seq_length xs@26@01))
          (not (< i@28@01 (Seq_length xs@26@01))))))
    (or (>= i@28@01 0) (not (>= i@28@01 0)))
    (=>
      (and
        (>= i@28@01 0)
        (and
          (< i@28@01 (Seq_length xs@26@01))
          (and
            (>= j@29@01 0)
            (and (< j@29@01 (Seq_length xs@26@01)) (not (= i@28@01 j@29@01))))))
      (and
        (>= i@28@01 0)
        (< i@28@01 (Seq_length xs@26@01))
        (>= j@29@01 0)
        (< j@29@01 (Seq_length xs@26@01))
        (not (= i@28@01 j@29@01))))
    (or
      (not
        (and
          (>= i@28@01 0)
          (and
            (< i@28@01 (Seq_length xs@26@01))
            (and
              (>= j@29@01 0)
              (and (< j@29@01 (Seq_length xs@26@01)) (not (= i@28@01 j@29@01)))))))
      (and
        (>= i@28@01 0)
        (and
          (< i@28@01 (Seq_length xs@26@01))
          (and
            (>= j@29@01 0)
            (and (< j@29@01 (Seq_length xs@26@01)) (not (= i@28@01 j@29@01))))))))
  :pattern ((Seq_index xs@26@01 i@28@01) (Seq_index xs@26@01 j@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@28@10@28@104-aux|)))
(assert (forall ((i@28@01 Int) (j@29@01 Int)) (!
  (=>
    (and
      (>= i@28@01 0)
      (and
        (< i@28@01 (Seq_length xs@26@01))
        (and
          (>= j@29@01 0)
          (and (< j@29@01 (Seq_length xs@26@01)) (not (= i@28@01 j@29@01))))))
    (not (= (Seq_index xs@26@01 i@28@01) (Seq_index xs@26@01 j@29@01))))
  :pattern ((Seq_index xs@26@01 i@28@01) (Seq_index xs@26@01 j@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@28@10@28@104|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@30@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 23 | !(0 <= i@30@01) | live]
; [else-branch: 23 | 0 <= i@30@01 | live]
(push) ; 5
; [then-branch: 23 | !(0 <= i@30@01)]
(assert (not (<= 0 i@30@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 23 | 0 <= i@30@01]
(assert (<= 0 i@30@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@30@01) (not (<= 0 i@30@01))))
(assert (and (<= 0 i@30@01) (< i@30@01 (Seq_length xs@26@01))))
; [eval] xs[i]
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
    (and (<= 0 i@30@01) (< i@30@01 (Seq_length xs@26@01)))
    (or (<= 0 i@30@01) (not (<= 0 i@30@01))))
  :pattern ((Seq_index xs@26@01 i@30@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@30@01 Int) (i2@30@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@30@01) (< i1@30@01 (Seq_length xs@26@01)))
      (and (<= 0 i2@30@01) (< i2@30@01 (Seq_length xs@26@01)))
      (= (Seq_index xs@26@01 i1@30@01) (Seq_index xs@26@01 i2@30@01)))
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
    (and (<= 0 i@30@01) (< i@30@01 (Seq_length xs@26@01)))
    (and
      (= (inv@32@01 (Seq_index xs@26@01 i@30@01)) i@30@01)
      (img@33@01 (Seq_index xs@26@01 i@30@01))))
  :pattern ((Seq_index xs@26@01 i@30@01))
  :qid |quant-u-84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@32@01 r)) r))
  :pattern ((inv@32@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@30@01 Int)) (!
  (=>
    (and (<= 0 i@30@01) (< i@30@01 (Seq_length xs@26@01)))
    (not (= (Seq_index xs@26@01 i@30@01) $Ref.null)))
  :pattern ((Seq_index xs@26@01 i@30@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale |xs| > 3
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@26@01) 3))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; xs[0].f := 3
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length xs@26@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@35@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@26@01 0))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
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
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@35@01 r))
    $Perm.No)
  
  :qid |quant-u-86|))))
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
  
  :qid |quant-u-87|))))
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
  (=> (= r (Seq_index xs@26@01 0)) (= (- $Perm.Write (pTaken@35@01 r)) $Perm.No))
  
  :qid |quant-u-88|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@36@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@36@01  $FVF<f>) (Seq_index xs@26@01 0)) 3))
; [exec]
; xs[1].f := 7
; [eval] xs[1]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 1 (Seq_length xs@26@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@37@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@26@01 1))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@38@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@26@01 1))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@37@01 r)))
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
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      (pTaken@37@01 r))
    $Perm.No)
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@37@01 r) $Perm.No)
  
  :qid |quant-u-91|))))
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
  (=> (= r (Seq_index xs@26@01 1)) (= (- $Perm.Write (pTaken@37@01 r)) $Perm.No))
  
  :qid |quant-u-92|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@39@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)) 7))
; [exec]
; assert fun02(xs) == 10
; [eval] fun02(xs) == 10
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@40@01 Int)
(declare-const j@41@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 24 | !(i@40@01 >= 0) | live]
; [else-branch: 24 | i@40@01 >= 0 | live]
(push) ; 6
; [then-branch: 24 | !(i@40@01 >= 0)]
(assert (not (>= i@40@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 24 | i@40@01 >= 0]
(assert (>= i@40@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 25 | !(i@40@01 < |xs@26@01|) | live]
; [else-branch: 25 | i@40@01 < |xs@26@01| | live]
(push) ; 8
; [then-branch: 25 | !(i@40@01 < |xs@26@01|)]
(assert (not (< i@40@01 (Seq_length xs@26@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 25 | i@40@01 < |xs@26@01|]
(assert (< i@40@01 (Seq_length xs@26@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 26 | !(j@41@01 >= 0) | live]
; [else-branch: 26 | j@41@01 >= 0 | live]
(push) ; 10
; [then-branch: 26 | !(j@41@01 >= 0)]
(assert (not (>= j@41@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 26 | j@41@01 >= 0]
(assert (>= j@41@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 27 | !(j@41@01 < |xs@26@01|) | live]
; [else-branch: 27 | j@41@01 < |xs@26@01| | live]
(push) ; 12
; [then-branch: 27 | !(j@41@01 < |xs@26@01|)]
(assert (not (< j@41@01 (Seq_length xs@26@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 27 | j@41@01 < |xs@26@01|]
(assert (< j@41@01 (Seq_length xs@26@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@41@01 (Seq_length xs@26@01)) (not (< j@41@01 (Seq_length xs@26@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@41@01 0)
  (and
    (>= j@41@01 0)
    (or
      (< j@41@01 (Seq_length xs@26@01))
      (not (< j@41@01 (Seq_length xs@26@01)))))))
(assert (or (>= j@41@01 0) (not (>= j@41@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@40@01 (Seq_length xs@26@01))
  (and
    (< i@40@01 (Seq_length xs@26@01))
    (=>
      (>= j@41@01 0)
      (and
        (>= j@41@01 0)
        (or
          (< j@41@01 (Seq_length xs@26@01))
          (not (< j@41@01 (Seq_length xs@26@01))))))
    (or (>= j@41@01 0) (not (>= j@41@01 0))))))
(assert (or (< i@40@01 (Seq_length xs@26@01)) (not (< i@40@01 (Seq_length xs@26@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@40@01 0)
  (and
    (>= i@40@01 0)
    (=>
      (< i@40@01 (Seq_length xs@26@01))
      (and
        (< i@40@01 (Seq_length xs@26@01))
        (=>
          (>= j@41@01 0)
          (and
            (>= j@41@01 0)
            (or
              (< j@41@01 (Seq_length xs@26@01))
              (not (< j@41@01 (Seq_length xs@26@01))))))
        (or (>= j@41@01 0) (not (>= j@41@01 0)))))
    (or
      (< i@40@01 (Seq_length xs@26@01))
      (not (< i@40@01 (Seq_length xs@26@01)))))))
(assert (or (>= i@40@01 0) (not (>= i@40@01 0))))
(push) ; 5
; [then-branch: 28 | i@40@01 >= 0 && i@40@01 < |xs@26@01| && j@41@01 >= 0 && j@41@01 < |xs@26@01| && i@40@01 != j@41@01 | live]
; [else-branch: 28 | !(i@40@01 >= 0 && i@40@01 < |xs@26@01| && j@41@01 >= 0 && j@41@01 < |xs@26@01| && i@40@01 != j@41@01) | live]
(push) ; 6
; [then-branch: 28 | i@40@01 >= 0 && i@40@01 < |xs@26@01| && j@41@01 >= 0 && j@41@01 < |xs@26@01| && i@40@01 != j@41@01]
(assert (and
  (>= i@40@01 0)
  (and
    (< i@40@01 (Seq_length xs@26@01))
    (and
      (>= j@41@01 0)
      (and (< j@41@01 (Seq_length xs@26@01)) (not (= i@40@01 j@41@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 28 | !(i@40@01 >= 0 && i@40@01 < |xs@26@01| && j@41@01 >= 0 && j@41@01 < |xs@26@01| && i@40@01 != j@41@01)]
(assert (not
  (and
    (>= i@40@01 0)
    (and
      (< i@40@01 (Seq_length xs@26@01))
      (and
        (>= j@41@01 0)
        (and (< j@41@01 (Seq_length xs@26@01)) (not (= i@40@01 j@41@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@40@01 0)
    (and
      (< i@40@01 (Seq_length xs@26@01))
      (and
        (>= j@41@01 0)
        (and (< j@41@01 (Seq_length xs@26@01)) (not (= i@40@01 j@41@01))))))
  (and
    (>= i@40@01 0)
    (< i@40@01 (Seq_length xs@26@01))
    (>= j@41@01 0)
    (< j@41@01 (Seq_length xs@26@01))
    (not (= i@40@01 j@41@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@40@01 0)
      (and
        (< i@40@01 (Seq_length xs@26@01))
        (and
          (>= j@41@01 0)
          (and (< j@41@01 (Seq_length xs@26@01)) (not (= i@40@01 j@41@01)))))))
  (and
    (>= i@40@01 0)
    (and
      (< i@40@01 (Seq_length xs@26@01))
      (and
        (>= j@41@01 0)
        (and (< j@41@01 (Seq_length xs@26@01)) (not (= i@40@01 j@41@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@40@01 Int) (j@41@01 Int)) (!
  (=>
    (and
      (>= i@40@01 0)
      (and
        (< i@40@01 (Seq_length xs@26@01))
        (and
          (>= j@41@01 0)
          (and (< j@41@01 (Seq_length xs@26@01)) (not (= i@40@01 j@41@01))))))
    (not (= (Seq_index xs@26@01 i@40@01) (Seq_index xs@26@01 j@41@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@40@01 Int) (j@41@01 Int)) (!
  (=>
    (and
      (>= i@40@01 0)
      (and
        (< i@40@01 (Seq_length xs@26@01))
        (and
          (>= j@41@01 0)
          (and (< j@41@01 (Seq_length xs@26@01)) (not (= i@40@01 j@41@01))))))
    (not (= (Seq_index xs@26@01 i@40@01) (Seq_index xs@26@01 j@41@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|)))
(declare-const i@42@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 29 | !(0 <= i@42@01) | live]
; [else-branch: 29 | 0 <= i@42@01 | live]
(push) ; 6
; [then-branch: 29 | !(0 <= i@42@01)]
(assert (not (<= 0 i@42@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 29 | 0 <= i@42@01]
(assert (<= 0 i@42@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@42@01) (not (<= 0 i@42@01))))
(assert (and (<= 0 i@42@01) (< i@42@01 (Seq_length xs@26@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@42@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@43@01 ($Ref) Int)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and (<= 0 i@42@01) (< i@42@01 (Seq_length xs@26@01)))
    (or (<= 0 i@42@01) (not (<= 0 i@42@01))))
  :pattern ((Seq_index xs@26@01 i@42@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@42@01 Int) (i2@42@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@42@01) (< i1@42@01 (Seq_length xs@26@01)))
      (and (<= 0 i2@42@01) (< i2@42@01 (Seq_length xs@26@01)))
      (= (Seq_index xs@26@01 i1@42@01) (Seq_index xs@26@01 i2@42@01)))
    (= i1@42@01 i2@42@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and (<= 0 i@42@01) (< i@42@01 (Seq_length xs@26@01)))
    (and
      (= (inv@43@01 (Seq_index xs@26@01 i@42@01)) i@42@01)
      (img@44@01 (Seq_index xs@26@01 i@42@01))))
  :pattern ((Seq_index xs@26@01 i@42@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@44@01 r)
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@43@01 r)) r))
  :pattern ((inv@43@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
      (img@44@01 r)
      (= r (Seq_index xs@26@01 (inv@43@01 r))))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
      (img@44@01 r)
      (= r (Seq_index xs@26@01 (inv@43@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@45@01 r)))
    $Perm.No))
(define-fun pTaken@47@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
      (img@44@01 r)
      (= r (Seq_index xs@26@01 (inv@43@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@45@01 r)) (pTaken@46@01 r)))
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
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      (pTaken@45@01 r))
    $Perm.No)
  
  :qid |quant-u-95|))))
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
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
      (img@44@01 r)
      (= r (Seq_index xs@26@01 (inv@43@01 r))))
    (= (- $Perm.Write (pTaken@45@01 r)) $Perm.No))
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (pTaken@46@01 (Seq_index xs@26@01 1)))
  $Perm.No)))
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
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
      (img@44@01 r)
      (= r (Seq_index xs@26@01 (inv@43@01 r))))
    (= (- (- $Perm.Write (pTaken@45@01 r)) (pTaken@46@01 r)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (pTaken@47@01 (Seq_index xs@26@01 0)))
  $Perm.No)))
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
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
      (img@44@01 r)
      (= r (Seq_index xs@26@01 (inv@43@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@45@01 r)) (pTaken@46@01 r)) (pTaken@47@01 r))
      $Perm.No))
  
  :qid |quant-u-100|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@48@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r)))
    (=>
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r))
      (Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>))))
  :qid |qp.fvfDomDef7|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@48@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef6|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@48@01  $FVF<f>))
    $Snap.unit)) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and (<= 0 i@42@01) (< i@42@01 (Seq_length xs@26@01)))
    (and
      (= (inv@43@01 (Seq_index xs@26@01 i@42@01)) i@42@01)
      (img@44@01 (Seq_index xs@26@01 i@42@01))))
  :pattern ((Seq_index xs@26@01 i@42@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@44@01 r)
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@43@01 r)) r))
  :pattern ((inv@43@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r)))
    (=>
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r))
      (Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>))))
  :qid |qp.fvfDomDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) (Seq_length xs@26@01)))
        (img@44@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@48@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef6|)))
(assert (and
  (forall ((i@40@01 Int) (j@41@01 Int)) (!
    (=>
      (and
        (>= i@40@01 0)
        (and
          (< i@40@01 (Seq_length xs@26@01))
          (and
            (>= j@41@01 0)
            (and (< j@41@01 (Seq_length xs@26@01)) (not (= i@40@01 j@41@01))))))
      (not (= (Seq_index xs@26@01 i@40@01) (Seq_index xs@26@01 j@41@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))
  (forall ((i@42@01 Int)) (!
    (=>
      (and (<= 0 i@42@01) (< i@42@01 (Seq_length xs@26@01)))
      (or (<= 0 i@42@01) (not (<= 0 i@42@01))))
    :pattern ((Seq_index xs@26@01 i@42@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@48@01  $FVF<f>))
      $Snap.unit)) xs@26@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@48@01  $FVF<f>))
      $Snap.unit)) xs@26@01)
  10)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@48@01  $FVF<f>))
      $Snap.unit)) xs@26@01)
  10))
; [exec]
; xs[0].f := xs[1].f
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@26@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@26@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@49@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@49@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@50@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@50@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
        (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@50@01  $FPM) (Seq_index xs@26@01 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@26@01 0))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@52@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@26@01 0))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@51@01 r)))
    $Perm.No))
(define-fun pTaken@53@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@26@01 0))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@51@01 r)) (pTaken@52@01 r)))
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
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (pTaken@51@01 (Seq_index xs@26@01 0)))
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
  (=> (= r (Seq_index xs@26@01 0)) (= (- $Perm.Write (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@54@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@54@01  $FVF<f>) (Seq_index xs@26@01 0))
  ($FVF.lookup_f (as sm@49@01  $FVF<f>) (Seq_index xs@26@01 1))))
; [exec]
; assert fun02(xs) == 14
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@55@01 Int)
(declare-const j@56@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 30 | !(i@55@01 >= 0) | live]
; [else-branch: 30 | i@55@01 >= 0 | live]
(push) ; 6
; [then-branch: 30 | !(i@55@01 >= 0)]
(assert (not (>= i@55@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 30 | i@55@01 >= 0]
(assert (>= i@55@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 31 | !(i@55@01 < |xs@26@01|) | live]
; [else-branch: 31 | i@55@01 < |xs@26@01| | live]
(push) ; 8
; [then-branch: 31 | !(i@55@01 < |xs@26@01|)]
(assert (not (< i@55@01 (Seq_length xs@26@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 31 | i@55@01 < |xs@26@01|]
(assert (< i@55@01 (Seq_length xs@26@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 32 | !(j@56@01 >= 0) | live]
; [else-branch: 32 | j@56@01 >= 0 | live]
(push) ; 10
; [then-branch: 32 | !(j@56@01 >= 0)]
(assert (not (>= j@56@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 32 | j@56@01 >= 0]
(assert (>= j@56@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 33 | !(j@56@01 < |xs@26@01|) | live]
; [else-branch: 33 | j@56@01 < |xs@26@01| | live]
(push) ; 12
; [then-branch: 33 | !(j@56@01 < |xs@26@01|)]
(assert (not (< j@56@01 (Seq_length xs@26@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 33 | j@56@01 < |xs@26@01|]
(assert (< j@56@01 (Seq_length xs@26@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@56@01 (Seq_length xs@26@01)) (not (< j@56@01 (Seq_length xs@26@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@56@01 0)
  (and
    (>= j@56@01 0)
    (or
      (< j@56@01 (Seq_length xs@26@01))
      (not (< j@56@01 (Seq_length xs@26@01)))))))
(assert (or (>= j@56@01 0) (not (>= j@56@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@55@01 (Seq_length xs@26@01))
  (and
    (< i@55@01 (Seq_length xs@26@01))
    (=>
      (>= j@56@01 0)
      (and
        (>= j@56@01 0)
        (or
          (< j@56@01 (Seq_length xs@26@01))
          (not (< j@56@01 (Seq_length xs@26@01))))))
    (or (>= j@56@01 0) (not (>= j@56@01 0))))))
(assert (or (< i@55@01 (Seq_length xs@26@01)) (not (< i@55@01 (Seq_length xs@26@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@55@01 0)
  (and
    (>= i@55@01 0)
    (=>
      (< i@55@01 (Seq_length xs@26@01))
      (and
        (< i@55@01 (Seq_length xs@26@01))
        (=>
          (>= j@56@01 0)
          (and
            (>= j@56@01 0)
            (or
              (< j@56@01 (Seq_length xs@26@01))
              (not (< j@56@01 (Seq_length xs@26@01))))))
        (or (>= j@56@01 0) (not (>= j@56@01 0)))))
    (or
      (< i@55@01 (Seq_length xs@26@01))
      (not (< i@55@01 (Seq_length xs@26@01)))))))
(assert (or (>= i@55@01 0) (not (>= i@55@01 0))))
(push) ; 5
; [then-branch: 34 | i@55@01 >= 0 && i@55@01 < |xs@26@01| && j@56@01 >= 0 && j@56@01 < |xs@26@01| && i@55@01 != j@56@01 | live]
; [else-branch: 34 | !(i@55@01 >= 0 && i@55@01 < |xs@26@01| && j@56@01 >= 0 && j@56@01 < |xs@26@01| && i@55@01 != j@56@01) | live]
(push) ; 6
; [then-branch: 34 | i@55@01 >= 0 && i@55@01 < |xs@26@01| && j@56@01 >= 0 && j@56@01 < |xs@26@01| && i@55@01 != j@56@01]
(assert (and
  (>= i@55@01 0)
  (and
    (< i@55@01 (Seq_length xs@26@01))
    (and
      (>= j@56@01 0)
      (and (< j@56@01 (Seq_length xs@26@01)) (not (= i@55@01 j@56@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 34 | !(i@55@01 >= 0 && i@55@01 < |xs@26@01| && j@56@01 >= 0 && j@56@01 < |xs@26@01| && i@55@01 != j@56@01)]
(assert (not
  (and
    (>= i@55@01 0)
    (and
      (< i@55@01 (Seq_length xs@26@01))
      (and
        (>= j@56@01 0)
        (and (< j@56@01 (Seq_length xs@26@01)) (not (= i@55@01 j@56@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@55@01 0)
    (and
      (< i@55@01 (Seq_length xs@26@01))
      (and
        (>= j@56@01 0)
        (and (< j@56@01 (Seq_length xs@26@01)) (not (= i@55@01 j@56@01))))))
  (and
    (>= i@55@01 0)
    (< i@55@01 (Seq_length xs@26@01))
    (>= j@56@01 0)
    (< j@56@01 (Seq_length xs@26@01))
    (not (= i@55@01 j@56@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@55@01 0)
      (and
        (< i@55@01 (Seq_length xs@26@01))
        (and
          (>= j@56@01 0)
          (and (< j@56@01 (Seq_length xs@26@01)) (not (= i@55@01 j@56@01)))))))
  (and
    (>= i@55@01 0)
    (and
      (< i@55@01 (Seq_length xs@26@01))
      (and
        (>= j@56@01 0)
        (and (< j@56@01 (Seq_length xs@26@01)) (not (= i@55@01 j@56@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@55@01 Int) (j@56@01 Int)) (!
  (=>
    (and
      (>= i@55@01 0)
      (and
        (< i@55@01 (Seq_length xs@26@01))
        (and
          (>= j@56@01 0)
          (and (< j@56@01 (Seq_length xs@26@01)) (not (= i@55@01 j@56@01))))))
    (not (= (Seq_index xs@26@01 i@55@01) (Seq_index xs@26@01 j@56@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@55@01 Int) (j@56@01 Int)) (!
  (=>
    (and
      (>= i@55@01 0)
      (and
        (< i@55@01 (Seq_length xs@26@01))
        (and
          (>= j@56@01 0)
          (and (< j@56@01 (Seq_length xs@26@01)) (not (= i@55@01 j@56@01))))))
    (not (= (Seq_index xs@26@01 i@55@01) (Seq_index xs@26@01 j@56@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|)))
(declare-const i@57@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 35 | !(0 <= i@57@01) | live]
; [else-branch: 35 | 0 <= i@57@01 | live]
(push) ; 6
; [then-branch: 35 | !(0 <= i@57@01)]
(assert (not (<= 0 i@57@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 35 | 0 <= i@57@01]
(assert (<= 0 i@57@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@57@01) (not (<= 0 i@57@01))))
(assert (and (<= 0 i@57@01) (< i@57@01 (Seq_length xs@26@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@58@01 ($Ref) Int)
(declare-fun img@59@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@57@01 Int)) (!
  (=>
    (and (<= 0 i@57@01) (< i@57@01 (Seq_length xs@26@01)))
    (or (<= 0 i@57@01) (not (<= 0 i@57@01))))
  :pattern ((Seq_index xs@26@01 i@57@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@57@01 Int) (i2@57@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@57@01) (< i1@57@01 (Seq_length xs@26@01)))
      (and (<= 0 i2@57@01) (< i2@57@01 (Seq_length xs@26@01)))
      (= (Seq_index xs@26@01 i1@57@01) (Seq_index xs@26@01 i2@57@01)))
    (= i1@57@01 i2@57@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@57@01 Int)) (!
  (=>
    (and (<= 0 i@57@01) (< i@57@01 (Seq_length xs@26@01)))
    (and
      (= (inv@58@01 (Seq_index xs@26@01 i@57@01)) i@57@01)
      (img@59@01 (Seq_index xs@26@01 i@57@01))))
  :pattern ((Seq_index xs@26@01 i@57@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@01 r)
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@58@01 r)) r))
  :pattern ((inv@58@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
      (img@59@01 r)
      (= r (Seq_index xs@26@01 (inv@58@01 r))))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
      (img@59@01 r)
      (= r (Seq_index xs@26@01 (inv@58@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@60@01 r)))
    $Perm.No))
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
      (img@59@01 r)
      (= r (Seq_index xs@26@01 (inv@58@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)))
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
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      (pTaken@60@01 r))
    $Perm.No)
  
  :qid |quant-u-106|))))
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
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
      (img@59@01 r)
      (= r (Seq_index xs@26@01 (inv@58@01 r))))
    (= (- $Perm.Write (pTaken@60@01 r)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (pTaken@61@01 (Seq_index xs@26@01 0)))
  $Perm.No)))
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
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
      (img@59@01 r)
      (= r (Seq_index xs@26@01 (inv@58@01 r))))
    (= (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)) $Perm.No))
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (pTaken@62@01 (Seq_index xs@26@01 1)))
  $Perm.No)))
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
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
      (img@59@01 r)
      (= r (Seq_index xs@26@01 (inv@58@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)) (pTaken@62@01 r))
      $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r)))
    (=>
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r))
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@54@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@54@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@63@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>))
    $Snap.unit)) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@57@01 Int)) (!
  (=>
    (and (<= 0 i@57@01) (< i@57@01 (Seq_length xs@26@01)))
    (and
      (= (inv@58@01 (Seq_index xs@26@01 i@57@01)) i@57@01)
      (img@59@01 (Seq_index xs@26@01 i@57@01))))
  :pattern ((Seq_index xs@26@01 i@57@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@01 r)
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@58@01 r)) r))
  :pattern ((inv@58@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r)))
    (=>
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r))
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@54@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@54@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@63@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (Seq_length xs@26@01)))
        (img@59@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
(assert (and
  (forall ((i@55@01 Int) (j@56@01 Int)) (!
    (=>
      (and
        (>= i@55@01 0)
        (and
          (< i@55@01 (Seq_length xs@26@01))
          (and
            (>= j@56@01 0)
            (and (< j@56@01 (Seq_length xs@26@01)) (not (= i@55@01 j@56@01))))))
      (not (= (Seq_index xs@26@01 i@55@01) (Seq_index xs@26@01 j@56@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))
  (forall ((i@57@01 Int)) (!
    (=>
      (and (<= 0 i@57@01) (< i@57@01 (Seq_length xs@26@01)))
      (or (<= 0 i@57@01) (not (<= 0 i@57@01))))
    :pattern ((Seq_index xs@26@01 i@57@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>))
      $Snap.unit)) xs@26@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>))
      $Snap.unit)) xs@26@01)
  14)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>))
      $Snap.unit)) xs@26@01)
  14))
; [exec]
; xs[0].f := xs[2].f
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@26@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] xs[2]
(push) ; 3
(assert (not (< 2 (Seq_length xs@26@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@64@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@64@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@54@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@54@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@64@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@64@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(declare-const pm@65@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@65@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@65@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@65@01  $FPM) (Seq_index xs@26@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@66@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@26@01 0))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@67@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@26@01 0))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@66@01 r)))
    $Perm.No))
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@26@01 0))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@66@01 r)) (pTaken@67@01 r)))
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
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (pTaken@66@01 (Seq_index xs@26@01 0)))
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
  (=> (= r (Seq_index xs@26@01 0)) (= (- $Perm.Write (pTaken@66@01 r)) $Perm.No))
  
  :qid |quant-u-114|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@69@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
  ($FVF.lookup_f (as sm@64@01  $FVF<f>) (Seq_index xs@26@01 2))))
; [exec]
; assert fun02(xs) == 14
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@70@01 Int)
(declare-const j@71@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 36 | !(i@70@01 >= 0) | live]
; [else-branch: 36 | i@70@01 >= 0 | live]
(push) ; 6
; [then-branch: 36 | !(i@70@01 >= 0)]
(assert (not (>= i@70@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 36 | i@70@01 >= 0]
(assert (>= i@70@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 37 | !(i@70@01 < |xs@26@01|) | live]
; [else-branch: 37 | i@70@01 < |xs@26@01| | live]
(push) ; 8
; [then-branch: 37 | !(i@70@01 < |xs@26@01|)]
(assert (not (< i@70@01 (Seq_length xs@26@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 37 | i@70@01 < |xs@26@01|]
(assert (< i@70@01 (Seq_length xs@26@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 38 | !(j@71@01 >= 0) | live]
; [else-branch: 38 | j@71@01 >= 0 | live]
(push) ; 10
; [then-branch: 38 | !(j@71@01 >= 0)]
(assert (not (>= j@71@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 38 | j@71@01 >= 0]
(assert (>= j@71@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 39 | !(j@71@01 < |xs@26@01|) | live]
; [else-branch: 39 | j@71@01 < |xs@26@01| | live]
(push) ; 12
; [then-branch: 39 | !(j@71@01 < |xs@26@01|)]
(assert (not (< j@71@01 (Seq_length xs@26@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 39 | j@71@01 < |xs@26@01|]
(assert (< j@71@01 (Seq_length xs@26@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@71@01 (Seq_length xs@26@01)) (not (< j@71@01 (Seq_length xs@26@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@71@01 0)
  (and
    (>= j@71@01 0)
    (or
      (< j@71@01 (Seq_length xs@26@01))
      (not (< j@71@01 (Seq_length xs@26@01)))))))
(assert (or (>= j@71@01 0) (not (>= j@71@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@70@01 (Seq_length xs@26@01))
  (and
    (< i@70@01 (Seq_length xs@26@01))
    (=>
      (>= j@71@01 0)
      (and
        (>= j@71@01 0)
        (or
          (< j@71@01 (Seq_length xs@26@01))
          (not (< j@71@01 (Seq_length xs@26@01))))))
    (or (>= j@71@01 0) (not (>= j@71@01 0))))))
(assert (or (< i@70@01 (Seq_length xs@26@01)) (not (< i@70@01 (Seq_length xs@26@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@70@01 0)
  (and
    (>= i@70@01 0)
    (=>
      (< i@70@01 (Seq_length xs@26@01))
      (and
        (< i@70@01 (Seq_length xs@26@01))
        (=>
          (>= j@71@01 0)
          (and
            (>= j@71@01 0)
            (or
              (< j@71@01 (Seq_length xs@26@01))
              (not (< j@71@01 (Seq_length xs@26@01))))))
        (or (>= j@71@01 0) (not (>= j@71@01 0)))))
    (or
      (< i@70@01 (Seq_length xs@26@01))
      (not (< i@70@01 (Seq_length xs@26@01)))))))
(assert (or (>= i@70@01 0) (not (>= i@70@01 0))))
(push) ; 5
; [then-branch: 40 | i@70@01 >= 0 && i@70@01 < |xs@26@01| && j@71@01 >= 0 && j@71@01 < |xs@26@01| && i@70@01 != j@71@01 | live]
; [else-branch: 40 | !(i@70@01 >= 0 && i@70@01 < |xs@26@01| && j@71@01 >= 0 && j@71@01 < |xs@26@01| && i@70@01 != j@71@01) | live]
(push) ; 6
; [then-branch: 40 | i@70@01 >= 0 && i@70@01 < |xs@26@01| && j@71@01 >= 0 && j@71@01 < |xs@26@01| && i@70@01 != j@71@01]
(assert (and
  (>= i@70@01 0)
  (and
    (< i@70@01 (Seq_length xs@26@01))
    (and
      (>= j@71@01 0)
      (and (< j@71@01 (Seq_length xs@26@01)) (not (= i@70@01 j@71@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 40 | !(i@70@01 >= 0 && i@70@01 < |xs@26@01| && j@71@01 >= 0 && j@71@01 < |xs@26@01| && i@70@01 != j@71@01)]
(assert (not
  (and
    (>= i@70@01 0)
    (and
      (< i@70@01 (Seq_length xs@26@01))
      (and
        (>= j@71@01 0)
        (and (< j@71@01 (Seq_length xs@26@01)) (not (= i@70@01 j@71@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@70@01 0)
    (and
      (< i@70@01 (Seq_length xs@26@01))
      (and
        (>= j@71@01 0)
        (and (< j@71@01 (Seq_length xs@26@01)) (not (= i@70@01 j@71@01))))))
  (and
    (>= i@70@01 0)
    (< i@70@01 (Seq_length xs@26@01))
    (>= j@71@01 0)
    (< j@71@01 (Seq_length xs@26@01))
    (not (= i@70@01 j@71@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@70@01 0)
      (and
        (< i@70@01 (Seq_length xs@26@01))
        (and
          (>= j@71@01 0)
          (and (< j@71@01 (Seq_length xs@26@01)) (not (= i@70@01 j@71@01)))))))
  (and
    (>= i@70@01 0)
    (and
      (< i@70@01 (Seq_length xs@26@01))
      (and
        (>= j@71@01 0)
        (and (< j@71@01 (Seq_length xs@26@01)) (not (= i@70@01 j@71@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@70@01 Int) (j@71@01 Int)) (!
  (=>
    (and
      (>= i@70@01 0)
      (and
        (< i@70@01 (Seq_length xs@26@01))
        (and
          (>= j@71@01 0)
          (and (< j@71@01 (Seq_length xs@26@01)) (not (= i@70@01 j@71@01))))))
    (not (= (Seq_index xs@26@01 i@70@01) (Seq_index xs@26@01 j@71@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@70@01 Int) (j@71@01 Int)) (!
  (=>
    (and
      (>= i@70@01 0)
      (and
        (< i@70@01 (Seq_length xs@26@01))
        (and
          (>= j@71@01 0)
          (and (< j@71@01 (Seq_length xs@26@01)) (not (= i@70@01 j@71@01))))))
    (not (= (Seq_index xs@26@01 i@70@01) (Seq_index xs@26@01 j@71@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|)))
(declare-const i@72@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 41 | !(0 <= i@72@01) | live]
; [else-branch: 41 | 0 <= i@72@01 | live]
(push) ; 6
; [then-branch: 41 | !(0 <= i@72@01)]
(assert (not (<= 0 i@72@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 41 | 0 <= i@72@01]
(assert (<= 0 i@72@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@72@01) (not (<= 0 i@72@01))))
(assert (and (<= 0 i@72@01) (< i@72@01 (Seq_length xs@26@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@72@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@73@01 ($Ref) Int)
(declare-fun img@74@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@72@01 Int)) (!
  (=>
    (and (<= 0 i@72@01) (< i@72@01 (Seq_length xs@26@01)))
    (or (<= 0 i@72@01) (not (<= 0 i@72@01))))
  :pattern ((Seq_index xs@26@01 i@72@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@72@01 Int) (i2@72@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@72@01) (< i1@72@01 (Seq_length xs@26@01)))
      (and (<= 0 i2@72@01) (< i2@72@01 (Seq_length xs@26@01)))
      (= (Seq_index xs@26@01 i1@72@01) (Seq_index xs@26@01 i2@72@01)))
    (= i1@72@01 i2@72@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@72@01 Int)) (!
  (=>
    (and (<= 0 i@72@01) (< i@72@01 (Seq_length xs@26@01)))
    (and
      (= (inv@73@01 (Seq_index xs@26@01 i@72@01)) i@72@01)
      (img@74@01 (Seq_index xs@26@01 i@72@01))))
  :pattern ((Seq_index xs@26@01 i@72@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@74@01 r)
      (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@73@01 r)) r))
  :pattern ((inv@73@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@75@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
      (img@74@01 r)
      (= r (Seq_index xs@26@01 (inv@73@01 r))))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@76@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
      (img@74@01 r)
      (= r (Seq_index xs@26@01 (inv@73@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@75@01 r)))
    $Perm.No))
(define-fun pTaken@77@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
      (img@74@01 r)
      (= r (Seq_index xs@26@01 (inv@73@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@75@01 r)) (pTaken@76@01 r)))
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
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      (pTaken@75@01 r))
    $Perm.No)
  
  :qid |quant-u-117|))))
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
      (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
      (img@74@01 r)
      (= r (Seq_index xs@26@01 (inv@73@01 r))))
    (= (- $Perm.Write (pTaken@75@01 r)) $Perm.No))
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (pTaken@76@01 (Seq_index xs@26@01 0)))
  $Perm.No)))
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
      (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
      (img@74@01 r)
      (= r (Seq_index xs@26@01 (inv@73@01 r))))
    (= (- (- $Perm.Write (pTaken@75@01 r)) (pTaken@76@01 r)) $Perm.No))
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (pTaken@77@01 (Seq_index xs@26@01 1)))
  $Perm.No)))
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
      (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
      (img@74@01 r)
      (= r (Seq_index xs@26@01 (inv@73@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@75@01 r)) (pTaken@76@01 r)) (pTaken@77@01 r))
      $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@78@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@78@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r)))
    (=>
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r))
      (Set_in r ($FVF.domain_f (as sm@78@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@78@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@78@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef22|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@78@01  $FVF<f>))
    $Snap.unit)) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@72@01 Int)) (!
  (=>
    (and (<= 0 i@72@01) (< i@72@01 (Seq_length xs@26@01)))
    (and
      (= (inv@73@01 (Seq_index xs@26@01 i@72@01)) i@72@01)
      (img@74@01 (Seq_index xs@26@01 i@72@01))))
  :pattern ((Seq_index xs@26@01 i@72@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@74@01 r)
      (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@73@01 r)) r))
  :pattern ((inv@73@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@78@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r)))
    (=>
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r))
      (Set_in r ($FVF.domain_f (as sm@78@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@78@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@73@01 r)) (< (inv@73@01 r) (Seq_length xs@26@01)))
        (img@74@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@78@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef22|)))
(assert (and
  (forall ((i@70@01 Int) (j@71@01 Int)) (!
    (=>
      (and
        (>= i@70@01 0)
        (and
          (< i@70@01 (Seq_length xs@26@01))
          (and
            (>= j@71@01 0)
            (and (< j@71@01 (Seq_length xs@26@01)) (not (= i@70@01 j@71@01))))))
      (not (= (Seq_index xs@26@01 i@70@01) (Seq_index xs@26@01 j@71@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))
  (forall ((i@72@01 Int)) (!
    (=>
      (and (<= 0 i@72@01) (< i@72@01 (Seq_length xs@26@01)))
      (or (<= 0 i@72@01) (not (<= 0 i@72@01))))
    :pattern ((Seq_index xs@26@01 i@72@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@78@01  $FVF<f>))
      $Snap.unit)) xs@26@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@78@01  $FVF<f>))
      $Snap.unit)) xs@26@01)
  14)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
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
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
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
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
(declare-const sm@79@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@79@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@79@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@79@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef26|)))
(declare-const pm@80@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@80@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef27|)))
(assert (<= ($FVF.perm_f (as pm@80@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@80@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@80@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@81@01 Int)
(declare-const j@82@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 42 | !(i@81@01 >= 0) | live]
; [else-branch: 42 | i@81@01 >= 0 | live]
(push) ; 6
; [then-branch: 42 | !(i@81@01 >= 0)]
(assert (not (>= i@81@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
(declare-const sm@83@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef30|)))
(declare-const pm@84@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@84@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@84@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@84@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 42 | i@81@01 >= 0]
(assert (>= i@81@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
(declare-const sm@85@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@85@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@85@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(declare-const pm@86@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@86@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@86@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 43 | !(i@81@01 < |xs@26@01|) | live]
; [else-branch: 43 | i@81@01 < |xs@26@01| | live]
(push) ; 8
; [then-branch: 43 | !(i@81@01 < |xs@26@01|)]
(assert (not (< i@81@01 (Seq_length xs@26@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 43 | i@81@01 < |xs@26@01|]
(assert (< i@81@01 (Seq_length xs@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 44 | !(j@82@01 >= 0) | live]
; [else-branch: 44 | j@82@01 >= 0 | live]
(push) ; 10
; [then-branch: 44 | !(j@82@01 >= 0)]
(assert (not (>= j@82@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 44 | j@82@01 >= 0]
(assert (>= j@82@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 45 | !(j@82@01 < |xs@26@01|) | live]
; [else-branch: 45 | j@82@01 < |xs@26@01| | live]
(push) ; 12
; [then-branch: 45 | !(j@82@01 < |xs@26@01|)]
(assert (not (< j@82@01 (Seq_length xs@26@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 45 | j@82@01 < |xs@26@01|]
(assert (< j@82@01 (Seq_length xs@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not (< j@82@01 (Seq_length xs@26@01)))
  (and
    (not (< j@82@01 (Seq_length xs@26@01)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
; Joined path conditions
(assert (=>
  (< j@82@01 (Seq_length xs@26@01))
  (and
    (< j@82@01 (Seq_length xs@26@01))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
(assert (or (< j@82@01 (Seq_length xs@26@01)) (not (< j@82@01 (Seq_length xs@26@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (not (>= j@82@01 0))
  (and
    (not (>= j@82@01 0))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))))
; Joined path conditions
(assert (=>
  (>= j@82@01 0)
  (and
    (>= j@82@01 0)
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (=>
      (not (< j@82@01 (Seq_length xs@26@01)))
      (and
        (not (< j@82@01 (Seq_length xs@26@01)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
    (=>
      (< j@82@01 (Seq_length xs@26@01))
      (and
        (< j@82@01 (Seq_length xs@26@01))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
    (or
      (< j@82@01 (Seq_length xs@26@01))
      (not (< j@82@01 (Seq_length xs@26@01)))))))
(assert (or (>= j@82@01 0) (not (>= j@82@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (< i@81@01 (Seq_length xs@26@01)))
  (and
    (not (< i@81@01 (Seq_length xs@26@01)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
; Joined path conditions
(assert (=>
  (< i@81@01 (Seq_length xs@26@01))
  (and
    (< i@81@01 (Seq_length xs@26@01))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (=>
      (not (>= j@82@01 0))
      (and
        (not (>= j@82@01 0))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
    (=>
      (>= j@82@01 0)
      (and
        (>= j@82@01 0)
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (=>
          (not (< j@82@01 (Seq_length xs@26@01)))
          (and
            (not (< j@82@01 (Seq_length xs@26@01)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
        (=>
          (< j@82@01 (Seq_length xs@26@01))
          (and
            (< j@82@01 (Seq_length xs@26@01))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
        (or
          (< j@82@01 (Seq_length xs@26@01))
          (not (< j@82@01 (Seq_length xs@26@01))))))
    (or (>= j@82@01 0) (not (>= j@82@01 0))))))
(assert (or (< i@81@01 (Seq_length xs@26@01)) (not (< i@81@01 (Seq_length xs@26@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (=>
  (not (>= i@81@01 0))
  (and
    (not (>= i@81@01 0))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@84@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@84@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@84@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@85@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@85@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@86@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@86@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(assert (=>
  (>= i@81@01 0)
  (and
    (>= i@81@01 0)
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write)
    (=>
      (not (< i@81@01 (Seq_length xs@26@01)))
      (and
        (not (< i@81@01 (Seq_length xs@26@01)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
    (=>
      (< i@81@01 (Seq_length xs@26@01))
      (and
        (< i@81@01 (Seq_length xs@26@01))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (=>
          (not (>= j@82@01 0))
          (and
            (not (>= j@82@01 0))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
        (=>
          (>= j@82@01 0)
          (and
            (>= j@82@01 0)
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (=>
              (not (< j@82@01 (Seq_length xs@26@01)))
              (and
                (not (< j@82@01 (Seq_length xs@26@01)))
                (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
                (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
            (=>
              (< j@82@01 (Seq_length xs@26@01))
              (and
                (< j@82@01 (Seq_length xs@26@01))
                (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
                (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
            (or
              (< j@82@01 (Seq_length xs@26@01))
              (not (< j@82@01 (Seq_length xs@26@01))))))
        (or (>= j@82@01 0) (not (>= j@82@01 0)))))
    (or
      (< i@81@01 (Seq_length xs@26@01))
      (not (< i@81@01 (Seq_length xs@26@01)))))))
(assert (or (>= i@81@01 0) (not (>= i@81@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 46 | i@81@01 >= 0 && i@81@01 < |xs@26@01| && j@82@01 >= 0 && j@82@01 < |xs@26@01| && i@81@01 != j@82@01 | live]
; [else-branch: 46 | !(i@81@01 >= 0 && i@81@01 < |xs@26@01| && j@82@01 >= 0 && j@82@01 < |xs@26@01| && i@81@01 != j@82@01) | live]
(push) ; 6
; [then-branch: 46 | i@81@01 >= 0 && i@81@01 < |xs@26@01| && j@82@01 >= 0 && j@82@01 < |xs@26@01| && i@81@01 != j@82@01]
(assert (and
  (>= i@81@01 0)
  (and
    (< i@81@01 (Seq_length xs@26@01))
    (and
      (>= j@82@01 0)
      (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 46 | !(i@81@01 >= 0 && i@81@01 < |xs@26@01| && j@82@01 >= 0 && j@82@01 < |xs@26@01| && i@81@01 != j@82@01)]
(assert (not
  (and
    (>= i@81@01 0)
    (and
      (< i@81@01 (Seq_length xs@26@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@81@01 0)
    (and
      (< i@81@01 (Seq_length xs@26@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01))))))
  (and
    (>= i@81@01 0)
    (< i@81@01 (Seq_length xs@26@01))
    (>= j@82@01 0)
    (< j@82@01 (Seq_length xs@26@01))
    (not (= i@81@01 j@82@01))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
; Joined path conditions
(assert (=>
  (not
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length xs@26@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01)))))))
  (and
    (not
      (and
        (>= i@81@01 0)
        (and
          (< i@81@01 (Seq_length xs@26@01))
          (and
            (>= j@82@01 0)
            (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01)))))))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@86@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
(assert (or
  (not
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length xs@26@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01)))))))
  (and
    (>= i@81@01 0)
    (and
      (< i@81@01 (Seq_length xs@26@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@85@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@85@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@86@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@86@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (=>
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length xs@26@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01))))))
    (not (= (Seq_index xs@26@01 i@81@01) (Seq_index xs@26@01 j@82@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (=>
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length xs@26@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01))))))
    (not (= (Seq_index xs@26@01 i@81@01) (Seq_index xs@26@01 j@82@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|)))
(declare-const i@87@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 47 | !(0 <= i@87@01) | live]
; [else-branch: 47 | 0 <= i@87@01 | live]
(push) ; 6
; [then-branch: 47 | !(0 <= i@87@01)]
(assert (not (<= 0 i@87@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@88@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@88@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@88@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@88@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@88@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 47 | 0 <= i@87@01]
(assert (<= 0 i@87@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@89@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@88@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@88@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (=>
  (not (<= 0 i@87@01))
  (and
    (not (<= 0 i@87@01))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@88@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@88@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
(assert (=>
  (<= 0 i@87@01)
  (and
    (<= 0 i@87@01)
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
(assert (or (<= 0 i@87@01) (not (<= 0 i@87@01))))
(assert (and (<= 0 i@87@01) (< i@87@01 (Seq_length xs@26@01))))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@87@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@90@01 ($Ref) Int)
(declare-fun img@91@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@88@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@88@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and (<= 0 i@87@01) (< i@87@01 (Seq_length xs@26@01)))
    (and
      (=>
        (not (<= 0 i@87@01))
        (and
          (not (<= 0 i@87@01))
          (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
          (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
            :pattern ((inv@32@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@88@01  $FPM) (Seq_index xs@26@01 1))
            $Perm.Write)
          (<=
            ($FVF.perm_f (as pm@88@01  $FPM) (Seq_index xs@26@01 0))
            $Perm.Write)))
      (=>
        (<= 0 i@87@01)
        (and
          (<= 0 i@87@01)
          (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
          (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
            :pattern ((inv@32@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@26@01 1))
            $Perm.Write)
          (<=
            ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@26@01 0))
            $Perm.Write)))
      (or (<= 0 i@87@01) (not (<= 0 i@87@01)))))
  :pattern ((Seq_index xs@26@01 i@87@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@87@01 Int) (i2@87@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@87@01) (< i1@87@01 (Seq_length xs@26@01)))
      (and (<= 0 i2@87@01) (< i2@87@01 (Seq_length xs@26@01)))
      (= (Seq_index xs@26@01 i1@87@01) (Seq_index xs@26@01 i2@87@01)))
    (= i1@87@01 i2@87@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and (<= 0 i@87@01) (< i@87@01 (Seq_length xs@26@01)))
    (and
      (= (inv@90@01 (Seq_index xs@26@01 i@87@01)) i@87@01)
      (img@91@01 (Seq_index xs@26@01 i@87@01))))
  :pattern ((Seq_index xs@26@01 i@87@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@91@01 r)
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@90@01 r)) r))
  :pattern ((inv@90@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@92@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
      (img@91@01 r)
      (= r (Seq_index xs@26@01 (inv@90@01 r))))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@93@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
      (img@91@01 r)
      (= r (Seq_index xs@26@01 (inv@90@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@92@01 r)))
    $Perm.No))
(define-fun pTaken@94@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
      (img@91@01 r)
      (= r (Seq_index xs@26@01 (inv@90@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@92@01 r)) (pTaken@93@01 r)))
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
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      (pTaken@92@01 r))
    $Perm.No)
  
  :qid |quant-u-125|))))
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
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
      (img@91@01 r)
      (= r (Seq_index xs@26@01 (inv@90@01 r))))
    (= (- $Perm.Write (pTaken@92@01 r)) $Perm.No))
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (pTaken@93@01 (Seq_index xs@26@01 1)))
  $Perm.No)))
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
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
      (img@91@01 r)
      (= r (Seq_index xs@26@01 (inv@90@01 r))))
    (= (- (- $Perm.Write (pTaken@92@01 r)) (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-128|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (pTaken@94@01 (Seq_index xs@26@01 0)))
  $Perm.No)))
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
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
      (img@91@01 r)
      (= r (Seq_index xs@26@01 (inv@90@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@92@01 r)) (pTaken@93@01 r)) (pTaken@94@01 r))
      $Perm.No))
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@95@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r)))
    (=>
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r))
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>))))
  :qid |qp.fvfDomDef41|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@95@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef40|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>))
    $Snap.unit)) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@85@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@85@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@86@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@86@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@88@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@88@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and (<= 0 i@87@01) (< i@87@01 (Seq_length xs@26@01)))
    (and
      (= (inv@90@01 (Seq_index xs@26@01 i@87@01)) i@87@01)
      (img@91@01 (Seq_index xs@26@01 i@87@01))))
  :pattern ((Seq_index xs@26@01 i@87@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@91@01 r)
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@90@01 r)) r))
  :pattern ((inv@90@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r)))
    (=>
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r))
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>))))
  :qid |qp.fvfDomDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@95@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length xs@26@01)))
        (img@91@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef40|)))
(assert (and
  (forall ((i@81@01 Int) (j@82@01 Int)) (!
    (=>
      (and
        (>= i@81@01 0)
        (and
          (< i@81@01 (Seq_length xs@26@01))
          (and
            (>= j@82@01 0)
            (and (< j@82@01 (Seq_length xs@26@01)) (not (= i@81@01 j@82@01))))))
      (not (= (Seq_index xs@26@01 i@81@01) (Seq_index xs@26@01 j@82@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))
  (forall ((i@87@01 Int)) (!
    (=>
      (and (<= 0 i@87@01) (< i@87@01 (Seq_length xs@26@01)))
      (and
        (=>
          (not (<= 0 i@87@01))
          (and
            (not (<= 0 i@87@01))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
              :pattern ((inv@32@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@88@01  $FPM) (Seq_index xs@26@01 1))
              $Perm.Write)
            (<=
              ($FVF.perm_f (as pm@88@01  $FPM) (Seq_index xs@26@01 0))
              $Perm.Write)))
        (=>
          (<= 0 i@87@01)
          (and
            (<= 0 i@87@01)
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
              :pattern ((inv@32@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@26@01 1))
              $Perm.Write)
            (<=
              ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@26@01 0))
              $Perm.Write)))
        (or (<= 0 i@87@01) (not (<= 0 i@87@01)))))
    :pattern ((Seq_index xs@26@01 i@87@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>))
      $Snap.unit)) xs@26@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>))
      $Snap.unit)) xs@26@01)
  14)))
(check-sat)
; unknown
(pop) ; 3
; 0,02s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
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
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
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
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
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
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
(declare-const sm@96@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@96@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@96@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@96@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@96@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@96@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@96@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef44|)))
(declare-const pm@97@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@97@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@97@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (<= ($FVF.perm_f (as pm@97@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@97@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@97@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@98@01 Int)
(declare-const j@99@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 48 | !(i@98@01 >= 0) | live]
; [else-branch: 48 | i@98@01 >= 0 | live]
(push) ; 6
; [then-branch: 48 | !(i@98@01 >= 0)]
(assert (not (>= i@98@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 48 | i@98@01 >= 0]
(assert (>= i@98@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 49 | !(i@98@01 < |xs@26@01|) | live]
; [else-branch: 49 | i@98@01 < |xs@26@01| | live]
(push) ; 8
; [then-branch: 49 | !(i@98@01 < |xs@26@01|)]
(assert (not (< i@98@01 (Seq_length xs@26@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
(declare-const sm@100@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(declare-const pm@101@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@101@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@101@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@101@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 49 | i@98@01 < |xs@26@01|]
(assert (< i@98@01 (Seq_length xs@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
(declare-const sm@102@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@102@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(declare-const pm@103@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@103@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@103@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@103@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@103@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@103@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 50 | !(j@99@01 >= 0) | live]
; [else-branch: 50 | j@99@01 >= 0 | live]
(push) ; 10
; [then-branch: 50 | !(j@99@01 >= 0)]
(assert (not (>= j@99@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 50 | j@99@01 >= 0]
(assert (>= j@99@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 51 | !(j@99@01 < |xs@26@01|) | live]
; [else-branch: 51 | j@99@01 < |xs@26@01| | live]
(push) ; 12
; [then-branch: 51 | !(j@99@01 < |xs@26@01|)]
(assert (not (< j@99@01 (Seq_length xs@26@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 51 | j@99@01 < |xs@26@01|]
(assert (< j@99@01 (Seq_length xs@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not (< j@99@01 (Seq_length xs@26@01)))
  (and
    (not (< j@99@01 (Seq_length xs@26@01)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))))
; Joined path conditions
(assert (=>
  (< j@99@01 (Seq_length xs@26@01))
  (and
    (< j@99@01 (Seq_length xs@26@01))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))))
(assert (or (< j@99@01 (Seq_length xs@26@01)) (not (< j@99@01 (Seq_length xs@26@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (not (>= j@99@01 0))
  (and
    (not (>= j@99@01 0))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
; Joined path conditions
(assert (=>
  (>= j@99@01 0)
  (and
    (>= j@99@01 0)
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (=>
      (not (< j@99@01 (Seq_length xs@26@01)))
      (and
        (not (< j@99@01 (Seq_length xs@26@01)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
    (=>
      (< j@99@01 (Seq_length xs@26@01))
      (and
        (< j@99@01 (Seq_length xs@26@01))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
    (or
      (< j@99@01 (Seq_length xs@26@01))
      (not (< j@99@01 (Seq_length xs@26@01)))))))
(assert (or (>= j@99@01 0) (not (>= j@99@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (=>
  (not (< i@98@01 (Seq_length xs@26@01)))
  (and
    (not (< i@98@01 (Seq_length xs@26@01)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@101@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@101@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@101@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@102@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@103@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@103@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (=>
  (< i@98@01 (Seq_length xs@26@01))
  (and
    (< i@98@01 (Seq_length xs@26@01))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@103@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@103@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@103@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write)
    (=>
      (not (>= j@99@01 0))
      (and
        (not (>= j@99@01 0))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
    (=>
      (>= j@99@01 0)
      (and
        (>= j@99@01 0)
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (=>
          (not (< j@99@01 (Seq_length xs@26@01)))
          (and
            (not (< j@99@01 (Seq_length xs@26@01)))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
        (=>
          (< j@99@01 (Seq_length xs@26@01))
          (and
            (< j@99@01 (Seq_length xs@26@01))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
        (or
          (< j@99@01 (Seq_length xs@26@01))
          (not (< j@99@01 (Seq_length xs@26@01))))))
    (or (>= j@99@01 0) (not (>= j@99@01 0))))))
(assert (or (< i@98@01 (Seq_length xs@26@01)) (not (< i@98@01 (Seq_length xs@26@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (>= i@98@01 0))
  (and
    (not (>= i@98@01 0))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@102@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@103@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@103@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (=>
  (>= i@98@01 0)
  (and
    (>= i@98@01 0)
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (=>
      (not (< i@98@01 (Seq_length xs@26@01)))
      (and
        (not (< i@98@01 (Seq_length xs@26@01)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@101@01  $FPM) r) $Perm.Write)
          :pattern ((inv@32@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@101@01  $FPM) (Seq_index xs@26@01 1))
          $Perm.Write)
        (<=
          ($FVF.perm_f (as pm@101@01  $FPM) (Seq_index xs@26@01 0))
          $Perm.Write)))
    (=>
      (< i@98@01 (Seq_length xs@26@01))
      (and
        (< i@98@01 (Seq_length xs@26@01))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@103@01  $FPM) r) $Perm.Write)
          :pattern ((inv@32@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@103@01  $FPM) (Seq_index xs@26@01 1))
          $Perm.Write)
        (<=
          ($FVF.perm_f (as pm@103@01  $FPM) (Seq_index xs@26@01 0))
          $Perm.Write)
        (=>
          (not (>= j@99@01 0))
          (and
            (not (>= j@99@01 0))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
        (=>
          (>= j@99@01 0)
          (and
            (>= j@99@01 0)
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (=>
              (not (< j@99@01 (Seq_length xs@26@01)))
              (and
                (not (< j@99@01 (Seq_length xs@26@01)))
                (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
                (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
            (=>
              (< j@99@01 (Seq_length xs@26@01))
              (and
                (< j@99@01 (Seq_length xs@26@01))
                (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
                (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
            (or
              (< j@99@01 (Seq_length xs@26@01))
              (not (< j@99@01 (Seq_length xs@26@01))))))
        (or (>= j@99@01 0) (not (>= j@99@01 0)))))
    (or
      (< i@98@01 (Seq_length xs@26@01))
      (not (< i@98@01 (Seq_length xs@26@01)))))))
(assert (or (>= i@98@01 0) (not (>= i@98@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 52 | i@98@01 >= 0 && i@98@01 < |xs@26@01| && j@99@01 >= 0 && j@99@01 < |xs@26@01| && i@98@01 != j@99@01 | live]
; [else-branch: 52 | !(i@98@01 >= 0 && i@98@01 < |xs@26@01| && j@99@01 >= 0 && j@99@01 < |xs@26@01| && i@98@01 != j@99@01) | live]
(push) ; 6
; [then-branch: 52 | i@98@01 >= 0 && i@98@01 < |xs@26@01| && j@99@01 >= 0 && j@99@01 < |xs@26@01| && i@98@01 != j@99@01]
(assert (and
  (>= i@98@01 0)
  (and
    (< i@98@01 (Seq_length xs@26@01))
    (and
      (>= j@99@01 0)
      (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 52 | !(i@98@01 >= 0 && i@98@01 < |xs@26@01| && j@99@01 >= 0 && j@99@01 < |xs@26@01| && i@98@01 != j@99@01)]
(assert (not
  (and
    (>= i@98@01 0)
    (and
      (< i@98@01 (Seq_length xs@26@01))
      (and
        (>= j@99@01 0)
        (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@98@01 0)
    (and
      (< i@98@01 (Seq_length xs@26@01))
      (and
        (>= j@99@01 0)
        (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01))))))
  (and
    (>= i@98@01 0)
    (< i@98@01 (Seq_length xs@26@01))
    (>= j@99@01 0)
    (< j@99@01 (Seq_length xs@26@01))
    (not (= i@98@01 j@99@01))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
; Joined path conditions
(assert (=>
  (not
    (and
      (>= i@98@01 0)
      (and
        (< i@98@01 (Seq_length xs@26@01))
        (and
          (>= j@99@01 0)
          (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01)))))))
  (and
    (not
      (and
        (>= i@98@01 0)
        (and
          (< i@98@01 (Seq_length xs@26@01))
          (and
            (>= j@99@01 0)
            (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01)))))))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
(assert (or
  (not
    (and
      (>= i@98@01 0)
      (and
        (< i@98@01 (Seq_length xs@26@01))
        (and
          (>= j@99@01 0)
          (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01)))))))
  (and
    (>= i@98@01 0)
    (and
      (< i@98@01 (Seq_length xs@26@01))
      (and
        (>= j@99@01 0)
        (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@102@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@103@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@103@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (=>
    (and
      (>= i@98@01 0)
      (and
        (< i@98@01 (Seq_length xs@26@01))
        (and
          (>= j@99@01 0)
          (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01))))))
    (not (= (Seq_index xs@26@01 i@98@01) (Seq_index xs@26@01 j@99@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (=>
    (and
      (>= i@98@01 0)
      (and
        (< i@98@01 (Seq_length xs@26@01))
        (and
          (>= j@99@01 0)
          (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01))))))
    (not (= (Seq_index xs@26@01 i@98@01) (Seq_index xs@26@01 j@99@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|)))
(declare-const i@104@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 53 | !(0 <= i@104@01) | live]
; [else-branch: 53 | 0 <= i@104@01 | live]
(push) ; 6
; [then-branch: 53 | !(0 <= i@104@01)]
(assert (not (<= 0 i@104@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 53 | 0 <= i@104@01]
(assert (<= 0 i@104@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (<= 0 i@104@01))
  (and
    (not (<= 0 i@104@01))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
; Joined path conditions
(assert (=>
  (<= 0 i@104@01)
  (and
    (<= 0 i@104@01)
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
(assert (or (<= 0 i@104@01) (not (<= 0 i@104@01))))
(assert (and (<= 0 i@104@01) (< i@104@01 (Seq_length xs@26@01))))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@104@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@105@01 ($Ref) Int)
(declare-fun img@106@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@104@01 Int)) (!
  (=>
    (and (<= 0 i@104@01) (< i@104@01 (Seq_length xs@26@01)))
    (and
      (=>
        (not (<= 0 i@104@01))
        (and
          (not (<= 0 i@104@01))
          (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
          (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
      (=>
        (<= 0 i@104@01)
        (and
          (<= 0 i@104@01)
          (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
          (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
      (or (<= 0 i@104@01) (not (<= 0 i@104@01)))))
  :pattern ((Seq_index xs@26@01 i@104@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@104@01 Int) (i2@104@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@104@01) (< i1@104@01 (Seq_length xs@26@01)))
      (and (<= 0 i2@104@01) (< i2@104@01 (Seq_length xs@26@01)))
      (= (Seq_index xs@26@01 i1@104@01) (Seq_index xs@26@01 i2@104@01)))
    (= i1@104@01 i2@104@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@104@01 Int)) (!
  (=>
    (and (<= 0 i@104@01) (< i@104@01 (Seq_length xs@26@01)))
    (and
      (= (inv@105@01 (Seq_index xs@26@01 i@104@01)) i@104@01)
      (img@106@01 (Seq_index xs@26@01 i@104@01))))
  :pattern ((Seq_index xs@26@01 i@104@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@106@01 r)
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@105@01 r)) r))
  :pattern ((inv@105@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@107@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
      (img@106@01 r)
      (= r (Seq_index xs@26@01 (inv@105@01 r))))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@108@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
      (img@106@01 r)
      (= r (Seq_index xs@26@01 (inv@105@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@107@01 r)))
    $Perm.No))
(define-fun pTaken@109@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
      (img@106@01 r)
      (= r (Seq_index xs@26@01 (inv@105@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@107@01 r)) (pTaken@108@01 r)))
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
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      (pTaken@107@01 r))
    $Perm.No)
  
  :qid |quant-u-133|))))
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
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
      (img@106@01 r)
      (= r (Seq_index xs@26@01 (inv@105@01 r))))
    (= (- $Perm.Write (pTaken@107@01 r)) $Perm.No))
  
  :qid |quant-u-134|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (pTaken@108@01 (Seq_index xs@26@01 0)))
  $Perm.No)))
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
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
      (img@106@01 r)
      (= r (Seq_index xs@26@01 (inv@105@01 r))))
    (= (- (- $Perm.Write (pTaken@107@01 r)) (pTaken@108@01 r)) $Perm.No))
  
  :qid |quant-u-136|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (pTaken@109@01 (Seq_index xs@26@01 1)))
  $Perm.No)))
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
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
      (img@106@01 r)
      (= r (Seq_index xs@26@01 (inv@105@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@107@01 r)) (pTaken@108@01 r))
        (pTaken@109@01 r))
      $Perm.No))
  
  :qid |quant-u-138|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@110@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@110@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r)))
    (=>
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r))
      (Set_in r ($FVF.domain_f (as sm@110@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@110@01  $FVF<f>))))
  :qid |qp.fvfDomDef57|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@110@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@110@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef56|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@110@01  $FVF<f>))
    $Snap.unit)) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@102@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@103@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@103@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (forall ((i@104@01 Int)) (!
  (=>
    (and (<= 0 i@104@01) (< i@104@01 (Seq_length xs@26@01)))
    (and
      (= (inv@105@01 (Seq_index xs@26@01 i@104@01)) i@104@01)
      (img@106@01 (Seq_index xs@26@01 i@104@01))))
  :pattern ((Seq_index xs@26@01 i@104@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@106@01 r)
      (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@105@01 r)) r))
  :pattern ((inv@105@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@110@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r)))
    (=>
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r))
      (Set_in r ($FVF.domain_f (as sm@110@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@110@01  $FVF<f>))))
  :qid |qp.fvfDomDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@110@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@110@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@105@01 r)) (< (inv@105@01 r) (Seq_length xs@26@01)))
        (img@106@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef56|)))
(assert (and
  (forall ((i@98@01 Int) (j@99@01 Int)) (!
    (=>
      (and
        (>= i@98@01 0)
        (and
          (< i@98@01 (Seq_length xs@26@01))
          (and
            (>= j@99@01 0)
            (and (< j@99@01 (Seq_length xs@26@01)) (not (= i@98@01 j@99@01))))))
      (not (= (Seq_index xs@26@01 i@98@01) (Seq_index xs@26@01 j@99@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))
  (forall ((i@104@01 Int)) (!
    (=>
      (and (<= 0 i@104@01) (< i@104@01 (Seq_length xs@26@01)))
      (and
        (=>
          (not (<= 0 i@104@01))
          (and
            (not (<= 0 i@104@01))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
        (=>
          (<= 0 i@104@01)
          (and
            (<= 0 i@104@01)
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
        (or (<= 0 i@104@01) (not (<= 0 i@104@01)))))
    :pattern ((Seq_index xs@26@01 i@104@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@110@01  $FVF<f>))
      $Snap.unit)) xs@26@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@110@01  $FVF<f>))
      $Snap.unit)) xs@26@01)
  14)))
(check-sat)
; unknown
(pop) ; 3
; 0,02s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
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
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@111@01 Int)
(declare-const j@112@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 54 | !(i@111@01 >= 0) | live]
; [else-branch: 54 | i@111@01 >= 0 | live]
(push) ; 6
; [then-branch: 54 | !(i@111@01 >= 0)]
(assert (not (>= i@111@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
(declare-const sm@113@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef60|)))
(declare-const pm@114@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@114@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@114@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@114@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@114@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 54 | i@111@01 >= 0]
(assert (>= i@111@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
(declare-const sm@115@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@115@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef64|)))
(declare-const pm@116@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@116@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@116@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 55 | !(i@111@01 < |xs@26@01|) | live]
; [else-branch: 55 | i@111@01 < |xs@26@01| | live]
(push) ; 8
; [then-branch: 55 | !(i@111@01 < |xs@26@01|)]
(assert (not (< i@111@01 (Seq_length xs@26@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 55 | i@111@01 < |xs@26@01|]
(assert (< i@111@01 (Seq_length xs@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 56 | !(j@112@01 >= 0) | live]
; [else-branch: 56 | j@112@01 >= 0 | live]
(push) ; 10
; [then-branch: 56 | !(j@112@01 >= 0)]
(assert (not (>= j@112@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 56 | j@112@01 >= 0]
(assert (>= j@112@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 57 | !(j@112@01 < |xs@26@01|) | live]
; [else-branch: 57 | j@112@01 < |xs@26@01| | live]
(push) ; 12
; [then-branch: 57 | !(j@112@01 < |xs@26@01|)]
(assert (not (< j@112@01 (Seq_length xs@26@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 57 | j@112@01 < |xs@26@01|]
(assert (< j@112@01 (Seq_length xs@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not (< j@112@01 (Seq_length xs@26@01)))
  (and
    (not (< j@112@01 (Seq_length xs@26@01)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
; Joined path conditions
(assert (=>
  (< j@112@01 (Seq_length xs@26@01))
  (and
    (< j@112@01 (Seq_length xs@26@01))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
(assert (or (< j@112@01 (Seq_length xs@26@01)) (not (< j@112@01 (Seq_length xs@26@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (not (>= j@112@01 0))
  (and
    (not (>= j@112@01 0))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1))))))
; Joined path conditions
(assert (=>
  (>= j@112@01 0)
  (and
    (>= j@112@01 0)
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (=>
      (not (< j@112@01 (Seq_length xs@26@01)))
      (and
        (not (< j@112@01 (Seq_length xs@26@01)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
    (=>
      (< j@112@01 (Seq_length xs@26@01))
      (and
        (< j@112@01 (Seq_length xs@26@01))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
    (or
      (< j@112@01 (Seq_length xs@26@01))
      (not (< j@112@01 (Seq_length xs@26@01)))))))
(assert (or (>= j@112@01 0) (not (>= j@112@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (< i@111@01 (Seq_length xs@26@01)))
  (and
    (not (< i@111@01 (Seq_length xs@26@01)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))))
; Joined path conditions
(assert (=>
  (< i@111@01 (Seq_length xs@26@01))
  (and
    (< i@111@01 (Seq_length xs@26@01))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (=>
      (not (>= j@112@01 0))
      (and
        (not (>= j@112@01 0))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
    (=>
      (>= j@112@01 0)
      (and
        (>= j@112@01 0)
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (=>
          (not (< j@112@01 (Seq_length xs@26@01)))
          (and
            (not (< j@112@01 (Seq_length xs@26@01)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
        (=>
          (< j@112@01 (Seq_length xs@26@01))
          (and
            (< j@112@01 (Seq_length xs@26@01))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
        (or
          (< j@112@01 (Seq_length xs@26@01))
          (not (< j@112@01 (Seq_length xs@26@01))))))
    (or (>= j@112@01 0) (not (>= j@112@01 0))))))
(assert (or (< i@111@01 (Seq_length xs@26@01)) (not (< i@111@01 (Seq_length xs@26@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@114@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
(assert (=>
  (not (>= i@111@01 0))
  (and
    (not (>= i@111@01 0))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@114@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@114@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@114@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@115@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@116@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
(assert (=>
  (>= i@111@01 0)
  (and
    (>= i@111@01 0)
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@116@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write)
    (=>
      (not (< i@111@01 (Seq_length xs@26@01)))
      (and
        (not (< i@111@01 (Seq_length xs@26@01)))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
    (=>
      (< i@111@01 (Seq_length xs@26@01))
      (and
        (< i@111@01 (Seq_length xs@26@01))
        (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
        (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
        (=>
          (not (>= j@112@01 0))
          (and
            (not (>= j@112@01 0))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
        (=>
          (>= j@112@01 0)
          (and
            (>= j@112@01 0)
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (=>
              (not (< j@112@01 (Seq_length xs@26@01)))
              (and
                (not (< j@112@01 (Seq_length xs@26@01)))
                (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
                (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
            (=>
              (< j@112@01 (Seq_length xs@26@01))
              (and
                (< j@112@01 (Seq_length xs@26@01))
                (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
                (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))))
            (or
              (< j@112@01 (Seq_length xs@26@01))
              (not (< j@112@01 (Seq_length xs@26@01))))))
        (or (>= j@112@01 0) (not (>= j@112@01 0)))))
    (or
      (< i@111@01 (Seq_length xs@26@01))
      (not (< i@111@01 (Seq_length xs@26@01)))))))
(assert (or (>= i@111@01 0) (not (>= i@111@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 58 | i@111@01 >= 0 && i@111@01 < |xs@26@01| && j@112@01 >= 0 && j@112@01 < |xs@26@01| && i@111@01 != j@112@01 | live]
; [else-branch: 58 | !(i@111@01 >= 0 && i@111@01 < |xs@26@01| && j@112@01 >= 0 && j@112@01 < |xs@26@01| && i@111@01 != j@112@01) | live]
(push) ; 6
; [then-branch: 58 | i@111@01 >= 0 && i@111@01 < |xs@26@01| && j@112@01 >= 0 && j@112@01 < |xs@26@01| && i@111@01 != j@112@01]
(assert (and
  (>= i@111@01 0)
  (and
    (< i@111@01 (Seq_length xs@26@01))
    (and
      (>= j@112@01 0)
      (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@116@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 58 | !(i@111@01 >= 0 && i@111@01 < |xs@26@01| && j@112@01 >= 0 && j@112@01 < |xs@26@01| && i@111@01 != j@112@01)]
(assert (not
  (and
    (>= i@111@01 0)
    (and
      (< i@111@01 (Seq_length xs@26@01))
      (and
        (>= j@112@01 0)
        (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@116@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@111@01 0)
    (and
      (< i@111@01 (Seq_length xs@26@01))
      (and
        (>= j@112@01 0)
        (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01))))))
  (and
    (>= i@111@01 0)
    (< i@111@01 (Seq_length xs@26@01))
    (>= j@112@01 0)
    (< j@112@01 (Seq_length xs@26@01))
    (not (= i@111@01 j@112@01))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@116@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
; Joined path conditions
(assert (=>
  (not
    (and
      (>= i@111@01 0)
      (and
        (< i@111@01 (Seq_length xs@26@01))
        (and
          (>= j@112@01 0)
          (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01)))))))
  (and
    (not
      (and
        (>= i@111@01 0)
        (and
          (< i@111@01 (Seq_length xs@26@01))
          (and
            (>= j@112@01 0)
            (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01)))))))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@116@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
(assert (or
  (not
    (and
      (>= i@111@01 0)
      (and
        (< i@111@01 (Seq_length xs@26@01))
        (and
          (>= j@112@01 0)
          (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01)))))))
  (and
    (>= i@111@01 0)
    (and
      (< i@111@01 (Seq_length xs@26@01))
      (and
        (>= j@112@01 0)
        (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@114@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@115@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@116@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@111@01 Int) (j@112@01 Int)) (!
  (=>
    (and
      (>= i@111@01 0)
      (and
        (< i@111@01 (Seq_length xs@26@01))
        (and
          (>= j@112@01 0)
          (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01))))))
    (not (= (Seq_index xs@26@01 i@111@01) (Seq_index xs@26@01 j@112@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@111@01 Int) (j@112@01 Int)) (!
  (=>
    (and
      (>= i@111@01 0)
      (and
        (< i@111@01 (Seq_length xs@26@01))
        (and
          (>= j@112@01 0)
          (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01))))))
    (not (= (Seq_index xs@26@01 i@111@01) (Seq_index xs@26@01 j@112@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|)))
(declare-const i@117@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 59 | !(0 <= i@117@01) | live]
; [else-branch: 59 | 0 <= i@117@01 | live]
(push) ; 6
; [then-branch: 59 | !(0 <= i@117@01)]
(assert (not (<= 0 i@117@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@118@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@118@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef66|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@118@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@118@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@118@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 59 | 0 <= i@117@01]
(assert (<= 0 i@117@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1))
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1))
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0))
    (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) (Seq_index xs@26@01 0))
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) (Seq_index xs@26@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
  (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@119@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@119@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@119@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@118@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef66|)))
(assert (=>
  (not (<= 0 i@117@01))
  (and
    (not (<= 0 i@117@01))
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@118@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@118@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@118@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@119@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
(assert (=>
  (<= 0 i@117@01)
  (and
    (<= 0 i@117@01)
    (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
    (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@119@01  $FPM) r) $Perm.Write)
      :pattern ((inv@32@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index xs@26@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index xs@26@01 0)) $Perm.Write))))
(assert (or (<= 0 i@117@01) (not (<= 0 i@117@01))))
(assert (and (<= 0 i@117@01) (< i@117@01 (Seq_length xs@26@01))))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@117@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@120@01 ($Ref) Int)
(declare-fun img@121@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@118@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef66|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@119@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@117@01 Int)) (!
  (=>
    (and (<= 0 i@117@01) (< i@117@01 (Seq_length xs@26@01)))
    (and
      (=>
        (not (<= 0 i@117@01))
        (and
          (not (<= 0 i@117@01))
          (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
          (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@118@01  $FPM) r) $Perm.Write)
            :pattern ((inv@32@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@118@01  $FPM) (Seq_index xs@26@01 1))
            $Perm.Write)
          (<=
            ($FVF.perm_f (as pm@118@01  $FPM) (Seq_index xs@26@01 0))
            $Perm.Write)))
      (=>
        (<= 0 i@117@01)
        (and
          (<= 0 i@117@01)
          (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
          (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@119@01  $FPM) r) $Perm.Write)
            :pattern ((inv@32@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index xs@26@01 1))
            $Perm.Write)
          (<=
            ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index xs@26@01 0))
            $Perm.Write)))
      (or (<= 0 i@117@01) (not (<= 0 i@117@01)))))
  :pattern ((Seq_index xs@26@01 i@117@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@117@01 Int) (i2@117@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@117@01) (< i1@117@01 (Seq_length xs@26@01)))
      (and (<= 0 i2@117@01) (< i2@117@01 (Seq_length xs@26@01)))
      (= (Seq_index xs@26@01 i1@117@01) (Seq_index xs@26@01 i2@117@01)))
    (= i1@117@01 i2@117@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@117@01 Int)) (!
  (=>
    (and (<= 0 i@117@01) (< i@117@01 (Seq_length xs@26@01)))
    (and
      (= (inv@120@01 (Seq_index xs@26@01 i@117@01)) i@117@01)
      (img@121@01 (Seq_index xs@26@01 i@117@01))))
  :pattern ((Seq_index xs@26@01 i@117@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@121@01 r)
      (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@120@01 r)) r))
  :pattern ((inv@120@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@122@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
      (img@121@01 r)
      (= r (Seq_index xs@26@01 (inv@120@01 r))))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@123@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
      (img@121@01 r)
      (= r (Seq_index xs@26@01 (inv@120@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@122@01 r)))
    $Perm.No))
(define-fun pTaken@124@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
      (img@121@01 r)
      (= r (Seq_index xs@26@01 (inv@120@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@122@01 r)) (pTaken@123@01 r)))
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
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
        $Perm.No)
      (pTaken@122@01 r))
    $Perm.No)
  
  :qid |quant-u-141|))))
(check-sat)
; unsat
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
      (img@121@01 r)
      (= r (Seq_index xs@26@01 (inv@120@01 r))))
    (= (- $Perm.Write (pTaken@122@01 r)) $Perm.No))
  
  :qid |quant-u-142|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 1)) $Perm.Write $Perm.No)
    (pTaken@123@01 (Seq_index xs@26@01 1)))
  $Perm.No)))
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
      (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
      (img@121@01 r)
      (= r (Seq_index xs@26@01 (inv@120@01 r))))
    (= (- (- $Perm.Write (pTaken@122@01 r)) (pTaken@123@01 r)) $Perm.No))
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)
    (pTaken@124@01 (Seq_index xs@26@01 0)))
  $Perm.No)))
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
      (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
      (img@121@01 r)
      (= r (Seq_index xs@26@01 (inv@120@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@122@01 r)) (pTaken@123@01 r))
        (pTaken@124@01 r))
      $Perm.No))
  
  :qid |quant-u-146|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@125@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@125@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r)))
    (=>
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r))
      (Set_in r ($FVF.domain_f (as sm@125@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@125@01  $FVF<f>))))
  :qid |qp.fvfDomDef71|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@125@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@125@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@125@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef70|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@125@01  $FVF<f>))
    $Snap.unit)) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@114@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@115@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 1))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@26@01 0))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@116@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@118@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef66|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@119@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@33@01 r)
            (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
          (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r))
          $Perm.No)
        (ite (= r (Seq_index xs@26@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@26@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
(assert (forall ((i@117@01 Int)) (!
  (=>
    (and (<= 0 i@117@01) (< i@117@01 (Seq_length xs@26@01)))
    (and
      (= (inv@120@01 (Seq_index xs@26@01 i@117@01)) i@117@01)
      (img@121@01 (Seq_index xs@26@01 i@117@01))))
  :pattern ((Seq_index xs@26@01 i@117@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@121@01 r)
      (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01))))
    (= (Seq_index xs@26@01 (inv@120@01 r)) r))
  :pattern ((inv@120@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@125@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r)))
    (=>
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r))
      (Set_in r ($FVF.domain_f (as sm@125@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@125@01  $FVF<f>))))
  :qid |qp.fvfDomDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r))
      (ite
        (and
          (img@33@01 r)
          (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (Seq_length xs@26@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@35@01 r)) (pTaken@37@01 r)))
        false))
    (= ($FVF.lookup_f (as sm@125@01  $FVF<f>) r) ($FVF.lookup_f $t@31@01 r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@31@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r))
      (= r (Seq_index xs@26@01 1)))
    (=
      ($FVF.lookup_f (as sm@125@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@120@01 r)) (< (inv@120@01 r) (Seq_length xs@26@01)))
        (img@121@01 r))
      (= r (Seq_index xs@26@01 0)))
    (=
      ($FVF.lookup_f (as sm@125@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef70|)))
(assert (and
  (forall ((i@111@01 Int) (j@112@01 Int)) (!
    (=>
      (and
        (>= i@111@01 0)
        (and
          (< i@111@01 (Seq_length xs@26@01))
          (and
            (>= j@112@01 0)
            (and (< j@112@01 (Seq_length xs@26@01)) (not (= i@111@01 j@112@01))))))
      (not (= (Seq_index xs@26@01 i@111@01) (Seq_index xs@26@01 j@112@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|))
  (forall ((i@117@01 Int)) (!
    (=>
      (and (<= 0 i@117@01) (< i@117@01 (Seq_length xs@26@01)))
      (and
        (=>
          (not (<= 0 i@117@01))
          (and
            (not (<= 0 i@117@01))
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@118@01  $FPM) r) $Perm.Write)
              :pattern ((inv@32@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@118@01  $FPM) (Seq_index xs@26@01 1))
              $Perm.Write)
            (<=
              ($FVF.perm_f (as pm@118@01  $FPM) (Seq_index xs@26@01 0))
              $Perm.Write)))
        (=>
          (<= 0 i@117@01)
          (and
            (<= 0 i@117@01)
            (not (= (Seq_index xs@26@01 1) (Seq_index xs@26@01 0)))
            (not (= (Seq_index xs@26@01 0) (Seq_index xs@26@01 1)))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@119@01  $FPM) r) $Perm.Write)
              :pattern ((inv@32@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index xs@26@01 1))
              $Perm.Write)
            (<=
              ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index xs@26@01 0))
              $Perm.Write)))
        (or (<= 0 i@117@01) (not (<= 0 i@117@01)))))
    :pattern ((Seq_index xs@26@01 i@117@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@125@01  $FVF<f>))
      $Snap.unit)) xs@26@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@125@01  $FVF<f>))
      $Snap.unit)) xs@26@01)
  14)))
(check-sat)
; unknown
(pop) ; 3
; 0,04s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const xs@126@01 Seq<$Ref>)
(declare-const xs@127@01 Seq<$Ref>)
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
; inhale |xs| > 6
(declare-const $t@128@01 $Snap)
(assert (= $t@128@01 $Snap.unit))
; [eval] |xs| > 6
; [eval] |xs|
(assert (> (Seq_length xs@127@01) 6))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int, j: Int ::
;     { xs[k], xs[j] }
;     k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==>
;     xs[k] != xs[j])
(declare-const $t@129@01 $Snap)
(assert (= $t@129@01 $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@130@01 Int)
(declare-const j@131@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 60 | !(k@130@01 >= 0) | live]
; [else-branch: 60 | k@130@01 >= 0 | live]
(push) ; 5
; [then-branch: 60 | !(k@130@01 >= 0)]
(assert (not (>= k@130@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 60 | k@130@01 >= 0]
(assert (>= k@130@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 61 | !(k@130@01 < |xs@127@01|) | live]
; [else-branch: 61 | k@130@01 < |xs@127@01| | live]
(push) ; 7
; [then-branch: 61 | !(k@130@01 < |xs@127@01|)]
(assert (not (< k@130@01 (Seq_length xs@127@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 61 | k@130@01 < |xs@127@01|]
(assert (< k@130@01 (Seq_length xs@127@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 62 | !(j@131@01 >= 0) | live]
; [else-branch: 62 | j@131@01 >= 0 | live]
(push) ; 9
; [then-branch: 62 | !(j@131@01 >= 0)]
(assert (not (>= j@131@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 62 | j@131@01 >= 0]
(assert (>= j@131@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 63 | !(j@131@01 < |xs@127@01|) | live]
; [else-branch: 63 | j@131@01 < |xs@127@01| | live]
(push) ; 11
; [then-branch: 63 | !(j@131@01 < |xs@127@01|)]
(assert (not (< j@131@01 (Seq_length xs@127@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 63 | j@131@01 < |xs@127@01|]
(assert (< j@131@01 (Seq_length xs@127@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@131@01 (Seq_length xs@127@01))
  (not (< j@131@01 (Seq_length xs@127@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@131@01 0)
  (and
    (>= j@131@01 0)
    (or
      (< j@131@01 (Seq_length xs@127@01))
      (not (< j@131@01 (Seq_length xs@127@01)))))))
(assert (or (>= j@131@01 0) (not (>= j@131@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@130@01 (Seq_length xs@127@01))
  (and
    (< k@130@01 (Seq_length xs@127@01))
    (=>
      (>= j@131@01 0)
      (and
        (>= j@131@01 0)
        (or
          (< j@131@01 (Seq_length xs@127@01))
          (not (< j@131@01 (Seq_length xs@127@01))))))
    (or (>= j@131@01 0) (not (>= j@131@01 0))))))
(assert (or
  (< k@130@01 (Seq_length xs@127@01))
  (not (< k@130@01 (Seq_length xs@127@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@130@01 0)
  (and
    (>= k@130@01 0)
    (=>
      (< k@130@01 (Seq_length xs@127@01))
      (and
        (< k@130@01 (Seq_length xs@127@01))
        (=>
          (>= j@131@01 0)
          (and
            (>= j@131@01 0)
            (or
              (< j@131@01 (Seq_length xs@127@01))
              (not (< j@131@01 (Seq_length xs@127@01))))))
        (or (>= j@131@01 0) (not (>= j@131@01 0)))))
    (or
      (< k@130@01 (Seq_length xs@127@01))
      (not (< k@130@01 (Seq_length xs@127@01)))))))
(assert (or (>= k@130@01 0) (not (>= k@130@01 0))))
(push) ; 4
; [then-branch: 64 | k@130@01 >= 0 && k@130@01 < |xs@127@01| && j@131@01 >= 0 && j@131@01 < |xs@127@01| && k@130@01 != j@131@01 | live]
; [else-branch: 64 | !(k@130@01 >= 0 && k@130@01 < |xs@127@01| && j@131@01 >= 0 && j@131@01 < |xs@127@01| && k@130@01 != j@131@01) | live]
(push) ; 5
; [then-branch: 64 | k@130@01 >= 0 && k@130@01 < |xs@127@01| && j@131@01 >= 0 && j@131@01 < |xs@127@01| && k@130@01 != j@131@01]
(assert (and
  (>= k@130@01 0)
  (and
    (< k@130@01 (Seq_length xs@127@01))
    (and
      (>= j@131@01 0)
      (and (< j@131@01 (Seq_length xs@127@01)) (not (= k@130@01 j@131@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 64 | !(k@130@01 >= 0 && k@130@01 < |xs@127@01| && j@131@01 >= 0 && j@131@01 < |xs@127@01| && k@130@01 != j@131@01)]
(assert (not
  (and
    (>= k@130@01 0)
    (and
      (< k@130@01 (Seq_length xs@127@01))
      (and
        (>= j@131@01 0)
        (and (< j@131@01 (Seq_length xs@127@01)) (not (= k@130@01 j@131@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@130@01 0)
    (and
      (< k@130@01 (Seq_length xs@127@01))
      (and
        (>= j@131@01 0)
        (and (< j@131@01 (Seq_length xs@127@01)) (not (= k@130@01 j@131@01))))))
  (and
    (>= k@130@01 0)
    (< k@130@01 (Seq_length xs@127@01))
    (>= j@131@01 0)
    (< j@131@01 (Seq_length xs@127@01))
    (not (= k@130@01 j@131@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@130@01 0)
      (and
        (< k@130@01 (Seq_length xs@127@01))
        (and
          (>= j@131@01 0)
          (and (< j@131@01 (Seq_length xs@127@01)) (not (= k@130@01 j@131@01)))))))
  (and
    (>= k@130@01 0)
    (and
      (< k@130@01 (Seq_length xs@127@01))
      (and
        (>= j@131@01 0)
        (and (< j@131@01 (Seq_length xs@127@01)) (not (= k@130@01 j@131@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@130@01 Int) (j@131@01 Int)) (!
  (and
    (=>
      (>= k@130@01 0)
      (and
        (>= k@130@01 0)
        (=>
          (< k@130@01 (Seq_length xs@127@01))
          (and
            (< k@130@01 (Seq_length xs@127@01))
            (=>
              (>= j@131@01 0)
              (and
                (>= j@131@01 0)
                (or
                  (< j@131@01 (Seq_length xs@127@01))
                  (not (< j@131@01 (Seq_length xs@127@01))))))
            (or (>= j@131@01 0) (not (>= j@131@01 0)))))
        (or
          (< k@130@01 (Seq_length xs@127@01))
          (not (< k@130@01 (Seq_length xs@127@01))))))
    (or (>= k@130@01 0) (not (>= k@130@01 0)))
    (=>
      (and
        (>= k@130@01 0)
        (and
          (< k@130@01 (Seq_length xs@127@01))
          (and
            (>= j@131@01 0)
            (and (< j@131@01 (Seq_length xs@127@01)) (not (= k@130@01 j@131@01))))))
      (and
        (>= k@130@01 0)
        (< k@130@01 (Seq_length xs@127@01))
        (>= j@131@01 0)
        (< j@131@01 (Seq_length xs@127@01))
        (not (= k@130@01 j@131@01))))
    (or
      (not
        (and
          (>= k@130@01 0)
          (and
            (< k@130@01 (Seq_length xs@127@01))
            (and
              (>= j@131@01 0)
              (and
                (< j@131@01 (Seq_length xs@127@01))
                (not (= k@130@01 j@131@01)))))))
      (and
        (>= k@130@01 0)
        (and
          (< k@130@01 (Seq_length xs@127@01))
          (and
            (>= j@131@01 0)
            (and (< j@131@01 (Seq_length xs@127@01)) (not (= k@130@01 j@131@01))))))))
  :pattern ((Seq_index xs@127@01 k@130@01) (Seq_index xs@127@01 j@131@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@54@10@54@104-aux|)))
(assert (forall ((k@130@01 Int) (j@131@01 Int)) (!
  (=>
    (and
      (>= k@130@01 0)
      (and
        (< k@130@01 (Seq_length xs@127@01))
        (and
          (>= j@131@01 0)
          (and (< j@131@01 (Seq_length xs@127@01)) (not (= k@130@01 j@131@01))))))
    (not (= (Seq_index xs@127@01 k@130@01) (Seq_index xs@127@01 j@131@01))))
  :pattern ((Seq_index xs@127@01 k@130@01) (Seq_index xs@127@01 j@131@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@54@10@54@104|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::0 <= j && j < 3 ==> acc(xs[j].f, write))
(declare-const j@132@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 65 | !(0 <= j@132@01) | live]
; [else-branch: 65 | 0 <= j@132@01 | live]
(push) ; 5
; [then-branch: 65 | !(0 <= j@132@01)]
(assert (not (<= 0 j@132@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 65 | 0 <= j@132@01]
(assert (<= 0 j@132@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@132@01) (not (<= 0 j@132@01))))
(assert (and (<= 0 j@132@01) (< j@132@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@132@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@132@01 (Seq_length xs@127@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@133@01 $FVF<f>)
(declare-fun inv@134@01 ($Ref) Int)
(declare-fun img@135@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@132@01 Int)) (!
  (=>
    (and (<= 0 j@132@01) (< j@132@01 3))
    (or (<= 0 j@132@01) (not (<= 0 j@132@01))))
  :pattern ((Seq_index xs@127@01 j@132@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@132@01 Int) (j2@132@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@132@01) (< j1@132@01 3))
      (and (<= 0 j2@132@01) (< j2@132@01 3))
      (= (Seq_index xs@127@01 j1@132@01) (Seq_index xs@127@01 j2@132@01)))
    (= j1@132@01 j2@132@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@132@01 Int)) (!
  (=>
    (and (<= 0 j@132@01) (< j@132@01 3))
    (and
      (= (inv@134@01 (Seq_index xs@127@01 j@132@01)) j@132@01)
      (img@135@01 (Seq_index xs@127@01 j@132@01))))
  :pattern ((Seq_index xs@127@01 j@132@01))
  :qid |quant-u-148|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3)))
    (= (Seq_index xs@127@01 (inv@134@01 r)) r))
  :pattern ((inv@134@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@132@01 Int)) (!
  (=>
    (and (<= 0 j@132@01) (< j@132@01 3))
    (not (= (Seq_index xs@127@01 j@132@01) $Ref.null)))
  :pattern ((Seq_index xs@127@01 j@132@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::3 <= j && j < |xs| ==> acc(xs[j].f, write))
(declare-const j@136@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < |xs|
; [eval] 3 <= j
(push) ; 4
; [then-branch: 66 | !(3 <= j@136@01) | live]
; [else-branch: 66 | 3 <= j@136@01 | live]
(push) ; 5
; [then-branch: 66 | !(3 <= j@136@01)]
(assert (not (<= 3 j@136@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 66 | 3 <= j@136@01]
(assert (<= 3 j@136@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@136@01) (not (<= 3 j@136@01))))
(assert (and (<= 3 j@136@01) (< j@136@01 (Seq_length xs@127@01))))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@136@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@137@01 $FVF<f>)
(declare-fun inv@138@01 ($Ref) Int)
(declare-fun img@139@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@136@01 Int)) (!
  (=>
    (and (<= 3 j@136@01) (< j@136@01 (Seq_length xs@127@01)))
    (or (<= 3 j@136@01) (not (<= 3 j@136@01))))
  :pattern ((Seq_index xs@127@01 j@136@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@136@01 Int) (j2@136@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@136@01) (< j1@136@01 (Seq_length xs@127@01)))
      (and (<= 3 j2@136@01) (< j2@136@01 (Seq_length xs@127@01)))
      (= (Seq_index xs@127@01 j1@136@01) (Seq_index xs@127@01 j2@136@01)))
    (= j1@136@01 j2@136@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@136@01 Int)) (!
  (=>
    (and (<= 3 j@136@01) (< j@136@01 (Seq_length xs@127@01)))
    (and
      (= (inv@138@01 (Seq_index xs@127@01 j@136@01)) j@136@01)
      (img@139@01 (Seq_index xs@127@01 j@136@01))))
  :pattern ((Seq_index xs@127@01 j@136@01))
  :qid |quant-u-150|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@139@01 r)
      (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
    (= (Seq_index xs@127@01 (inv@138@01 r)) r))
  :pattern ((inv@138@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@136@01 Int)) (!
  (=>
    (and (<= 3 j@136@01) (< j@136@01 (Seq_length xs@127@01)))
    (not (= (Seq_index xs@127@01 j@136@01) $Ref.null)))
  :pattern ((Seq_index xs@127@01 j@136@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@127@01 j@136@01) (Seq_index xs@127@01 j@132@01))
    (=
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
      (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3)))))
  
  :qid |quant-u-151|))))
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
; inhale xs[0].f < xs[1].f
(declare-const $t@140@01 $Snap)
(assert (= $t@140@01 $Snap.unit))
; [eval] xs[0].f < xs[1].f
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length xs@127@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@141@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3)))
    (= ($FVF.lookup_f (as sm@141@01  $FVF<f>) r) ($FVF.lookup_f $t@133@01 r)))
  :pattern (($FVF.lookup_f (as sm@141@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@133@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@139@01 r)
      (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
    (= ($FVF.lookup_f (as sm@141@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
  :pattern (($FVF.lookup_f (as sm@141@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@137@01 r))
  :qid |qp.fvfValDef73|)))
(declare-const pm@142@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@142@01  $FPM) r)
    (+
      (ite
        (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@139@01 r)
          (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@142@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@142@01  $FPM) (Seq_index xs@127@01 0)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@127@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3)))
      (= ($FVF.lookup_f (as sm@141@01  $FVF<f>) r) ($FVF.lookup_f $t@133@01 r)))
    :pattern (($FVF.lookup_f (as sm@141@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@133@01 r))
    :qid |qp.fvfValDef72|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
      (= ($FVF.lookup_f (as sm@141@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
    :pattern (($FVF.lookup_f (as sm@141@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@137@01 r))
    :qid |qp.fvfValDef73|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@135@01 (Seq_index xs@127@01 1))
        (and
          (<= 0 (inv@134@01 (Seq_index xs@127@01 1)))
          (< (inv@134@01 (Seq_index xs@127@01 1)) 3)))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@139@01 (Seq_index xs@127@01 1))
        (and
          (<= 3 (inv@138@01 (Seq_index xs@127@01 1)))
          (< (inv@138@01 (Seq_index xs@127@01 1)) (Seq_length xs@127@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<
  ($FVF.lookup_f (as sm@141@01  $FVF<f>) (Seq_index xs@127@01 0))
  ($FVF.lookup_f (as sm@141@01  $FVF<f>) (Seq_index xs@127@01 1))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert fun03(xs, 0) < fun03(xs, 1)
; [eval] fun03(xs, 0) < fun03(xs, 1)
; [eval] fun03(xs, 0)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 6
; [eval] |xs|
; [eval] (forall k: Int, j: Int ::k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@143@01 Int)
(declare-const j@144@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 67 | !(k@143@01 >= 0) | live]
; [else-branch: 67 | k@143@01 >= 0 | live]
(push) ; 6
; [then-branch: 67 | !(k@143@01 >= 0)]
(assert (not (>= k@143@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 67 | k@143@01 >= 0]
(assert (>= k@143@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 68 | !(k@143@01 < |xs@127@01|) | live]
; [else-branch: 68 | k@143@01 < |xs@127@01| | live]
(push) ; 8
; [then-branch: 68 | !(k@143@01 < |xs@127@01|)]
(assert (not (< k@143@01 (Seq_length xs@127@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 68 | k@143@01 < |xs@127@01|]
(assert (< k@143@01 (Seq_length xs@127@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 69 | !(j@144@01 >= 0) | live]
; [else-branch: 69 | j@144@01 >= 0 | live]
(push) ; 10
; [then-branch: 69 | !(j@144@01 >= 0)]
(assert (not (>= j@144@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 69 | j@144@01 >= 0]
(assert (>= j@144@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 70 | !(j@144@01 < |xs@127@01|) | live]
; [else-branch: 70 | j@144@01 < |xs@127@01| | live]
(push) ; 12
; [then-branch: 70 | !(j@144@01 < |xs@127@01|)]
(assert (not (< j@144@01 (Seq_length xs@127@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 70 | j@144@01 < |xs@127@01|]
(assert (< j@144@01 (Seq_length xs@127@01)))
; [eval] k != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@144@01 (Seq_length xs@127@01))
  (not (< j@144@01 (Seq_length xs@127@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@144@01 0)
  (and
    (>= j@144@01 0)
    (or
      (< j@144@01 (Seq_length xs@127@01))
      (not (< j@144@01 (Seq_length xs@127@01)))))))
(assert (or (>= j@144@01 0) (not (>= j@144@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@143@01 (Seq_length xs@127@01))
  (and
    (< k@143@01 (Seq_length xs@127@01))
    (=>
      (>= j@144@01 0)
      (and
        (>= j@144@01 0)
        (or
          (< j@144@01 (Seq_length xs@127@01))
          (not (< j@144@01 (Seq_length xs@127@01))))))
    (or (>= j@144@01 0) (not (>= j@144@01 0))))))
(assert (or
  (< k@143@01 (Seq_length xs@127@01))
  (not (< k@143@01 (Seq_length xs@127@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@143@01 0)
  (and
    (>= k@143@01 0)
    (=>
      (< k@143@01 (Seq_length xs@127@01))
      (and
        (< k@143@01 (Seq_length xs@127@01))
        (=>
          (>= j@144@01 0)
          (and
            (>= j@144@01 0)
            (or
              (< j@144@01 (Seq_length xs@127@01))
              (not (< j@144@01 (Seq_length xs@127@01))))))
        (or (>= j@144@01 0) (not (>= j@144@01 0)))))
    (or
      (< k@143@01 (Seq_length xs@127@01))
      (not (< k@143@01 (Seq_length xs@127@01)))))))
(assert (or (>= k@143@01 0) (not (>= k@143@01 0))))
(push) ; 5
; [then-branch: 71 | k@143@01 >= 0 && k@143@01 < |xs@127@01| && j@144@01 >= 0 && j@144@01 < |xs@127@01| && k@143@01 != j@144@01 | live]
; [else-branch: 71 | !(k@143@01 >= 0 && k@143@01 < |xs@127@01| && j@144@01 >= 0 && j@144@01 < |xs@127@01| && k@143@01 != j@144@01) | live]
(push) ; 6
; [then-branch: 71 | k@143@01 >= 0 && k@143@01 < |xs@127@01| && j@144@01 >= 0 && j@144@01 < |xs@127@01| && k@143@01 != j@144@01]
(assert (and
  (>= k@143@01 0)
  (and
    (< k@143@01 (Seq_length xs@127@01))
    (and
      (>= j@144@01 0)
      (and (< j@144@01 (Seq_length xs@127@01)) (not (= k@143@01 j@144@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 71 | !(k@143@01 >= 0 && k@143@01 < |xs@127@01| && j@144@01 >= 0 && j@144@01 < |xs@127@01| && k@143@01 != j@144@01)]
(assert (not
  (and
    (>= k@143@01 0)
    (and
      (< k@143@01 (Seq_length xs@127@01))
      (and
        (>= j@144@01 0)
        (and (< j@144@01 (Seq_length xs@127@01)) (not (= k@143@01 j@144@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= k@143@01 0)
    (and
      (< k@143@01 (Seq_length xs@127@01))
      (and
        (>= j@144@01 0)
        (and (< j@144@01 (Seq_length xs@127@01)) (not (= k@143@01 j@144@01))))))
  (and
    (>= k@143@01 0)
    (< k@143@01 (Seq_length xs@127@01))
    (>= j@144@01 0)
    (< j@144@01 (Seq_length xs@127@01))
    (not (= k@143@01 j@144@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@143@01 0)
      (and
        (< k@143@01 (Seq_length xs@127@01))
        (and
          (>= j@144@01 0)
          (and (< j@144@01 (Seq_length xs@127@01)) (not (= k@143@01 j@144@01)))))))
  (and
    (>= k@143@01 0)
    (and
      (< k@143@01 (Seq_length xs@127@01))
      (and
        (>= j@144@01 0)
        (and (< j@144@01 (Seq_length xs@127@01)) (not (= k@143@01 j@144@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@143@01 Int) (j@144@01 Int)) (!
  (=>
    (and
      (>= k@143@01 0)
      (and
        (< k@143@01 (Seq_length xs@127@01))
        (and
          (>= j@144@01 0)
          (and (< j@144@01 (Seq_length xs@127@01)) (not (= k@143@01 j@144@01))))))
    (not (= (Seq_index xs@127@01 k@143@01) (Seq_index xs@127@01 j@144@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@143@01 Int) (j@144@01 Int)) (!
  (=>
    (and
      (>= k@143@01 0)
      (and
        (< k@143@01 (Seq_length xs@127@01))
        (and
          (>= j@144@01 0)
          (and (< j@144@01 (Seq_length xs@127@01)) (not (= k@143@01 j@144@01))))))
    (not (= (Seq_index xs@127@01 k@143@01) (Seq_index xs@127@01 j@144@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106|)))
(declare-const j@145@01 Int)
(push) ; 4
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 5
; [then-branch: 72 | !(0 <= j@145@01) | live]
; [else-branch: 72 | 0 <= j@145@01 | live]
(push) ; 6
; [then-branch: 72 | !(0 <= j@145@01)]
(assert (not (<= 0 j@145@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 72 | 0 <= j@145@01]
(assert (<= 0 j@145@01))
; [eval] j < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@145@01) (not (<= 0 j@145@01))))
(assert (and (<= 0 j@145@01) (< j@145@01 3)))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@145@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@145@01 (Seq_length xs@127@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@146@01 ($Ref) Int)
(declare-fun img@147@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@145@01 Int)) (!
  (=>
    (and (<= 0 j@145@01) (< j@145@01 3))
    (or (<= 0 j@145@01) (not (<= 0 j@145@01))))
  :pattern ((Seq_index xs@127@01 j@145@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@145@01 Int) (j2@145@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@145@01) (< j1@145@01 3))
      (and (<= 0 j2@145@01) (< j2@145@01 3))
      (= (Seq_index xs@127@01 j1@145@01) (Seq_index xs@127@01 j2@145@01)))
    (= j1@145@01 j2@145@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@145@01 Int)) (!
  (=>
    (and (<= 0 j@145@01) (< j@145@01 3))
    (and
      (= (inv@146@01 (Seq_index xs@127@01 j@145@01)) j@145@01)
      (img@147@01 (Seq_index xs@127@01 j@145@01))))
  :pattern ((Seq_index xs@127@01 j@145@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)))
    (= (Seq_index xs@127@01 (inv@146@01 r)) r))
  :pattern ((inv@146@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@148@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3))
      (img@147@01 r)
      (= r (Seq_index xs@127@01 (inv@146@01 r))))
    ($Perm.min
      (ite
        (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@149@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3))
      (img@147@01 r)
      (= r (Seq_index xs@127@01 (inv@146@01 r))))
    ($Perm.min
      (ite
        (and
          (img@139@01 r)
          (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@148@01 r)))
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
        (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@148@01 r))
    $Perm.No)
  
  :qid |quant-u-154|))))
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
      (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3))
      (img@147@01 r)
      (= r (Seq_index xs@127@01 (inv@146@01 r))))
    (= (- $Perm.Write (pTaken@148@01 r)) $Perm.No))
  
  :qid |quant-u-155|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@150@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>)))
      (and (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)) (img@147@01 r)))
    (=>
      (and (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)) (img@147@01 r))
      (Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>))))
  :qid |qp.fvfDomDef77|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)) (img@147@01 r))
      (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3))))
    (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) r) ($FVF.lookup_f $t@133@01 r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@133@01 r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)) (img@147@01 r))
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01)))))
    (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@137@01 r))
  :qid |qp.fvfValDef76|)))
(declare-const j@151@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 3 <= j && j < |xs|
; [eval] 3 <= j
(push) ; 5
; [then-branch: 73 | !(3 <= j@151@01) | live]
; [else-branch: 73 | 3 <= j@151@01 | live]
(push) ; 6
; [then-branch: 73 | !(3 <= j@151@01)]
(assert (not (<= 3 j@151@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 73 | 3 <= j@151@01]
(assert (<= 3 j@151@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@151@01) (not (<= 3 j@151@01))))
(assert (and (<= 3 j@151@01) (< j@151@01 (Seq_length xs@127@01))))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@151@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@152@01 ($Ref) Int)
(declare-fun img@153@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@151@01 Int)) (!
  (=>
    (and (<= 3 j@151@01) (< j@151@01 (Seq_length xs@127@01)))
    (or (<= 3 j@151@01) (not (<= 3 j@151@01))))
  :pattern ((Seq_index xs@127@01 j@151@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@151@01 Int) (j2@151@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@151@01) (< j1@151@01 (Seq_length xs@127@01)))
      (and (<= 3 j2@151@01) (< j2@151@01 (Seq_length xs@127@01)))
      (= (Seq_index xs@127@01 j1@151@01) (Seq_index xs@127@01 j2@151@01)))
    (= j1@151@01 j2@151@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@151@01 Int)) (!
  (=>
    (and (<= 3 j@151@01) (< j@151@01 (Seq_length xs@127@01)))
    (and
      (= (inv@152@01 (Seq_index xs@127@01 j@151@01)) j@151@01)
      (img@153@01 (Seq_index xs@127@01 j@151@01))))
  :pattern ((Seq_index xs@127@01 j@151@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@153@01 r)
      (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01))))
    (= (Seq_index xs@127@01 (inv@152@01 r)) r))
  :pattern ((inv@152@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@154@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01)))
      (img@153@01 r)
      (= r (Seq_index xs@127@01 (inv@152@01 r))))
    ($Perm.min
      (ite
        (and
          (img@139@01 r)
          (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
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
          (img@139@01 r)
          (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@154@01 r))
    $Perm.No)
  
  :qid |quant-u-158|))))
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
      (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01)))
      (img@153@01 r)
      (= r (Seq_index xs@127@01 (inv@152@01 r))))
    (= (- $Perm.Write (pTaken@154@01 r)) $Perm.No))
  
  :qid |quant-u-159|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@155@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@155@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01)))
        (img@153@01 r)))
    (=>
      (and
        (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01)))
        (img@153@01 r))
      (Set_in r ($FVF.domain_f (as sm@155@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@155@01  $FVF<f>))))
  :qid |qp.fvfDomDef79|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01)))
        (img@153@01 r))
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01)))))
    (= ($FVF.lookup_f (as sm@155@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
  :pattern (($FVF.lookup_f (as sm@155@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@137@01 r))
  :qid |qp.fvfValDef78|)))
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length xs@127@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (Seq_length xs@127@01)))
(assert (fun03%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@150@01  $FVF<f>))
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@155@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@127@01 0))
(pop) ; 3
; Joined path conditions
(assert (forall ((j@145@01 Int)) (!
  (=>
    (and (<= 0 j@145@01) (< j@145@01 3))
    (and
      (= (inv@146@01 (Seq_index xs@127@01 j@145@01)) j@145@01)
      (img@147@01 (Seq_index xs@127@01 j@145@01))))
  :pattern ((Seq_index xs@127@01 j@145@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)))
    (= (Seq_index xs@127@01 (inv@146@01 r)) r))
  :pattern ((inv@146@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>)))
      (and (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)) (img@147@01 r)))
    (=>
      (and (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)) (img@147@01 r))
      (Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>))))
  :qid |qp.fvfDomDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)) (img@147@01 r))
      (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3))))
    (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) r) ($FVF.lookup_f $t@133@01 r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@133@01 r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) 3)) (img@147@01 r))
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01)))))
    (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@137@01 r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((j@151@01 Int)) (!
  (=>
    (and (<= 3 j@151@01) (< j@151@01 (Seq_length xs@127@01)))
    (and
      (= (inv@152@01 (Seq_index xs@127@01 j@151@01)) j@151@01)
      (img@153@01 (Seq_index xs@127@01 j@151@01))))
  :pattern ((Seq_index xs@127@01 j@151@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@153@01 r)
      (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01))))
    (= (Seq_index xs@127@01 (inv@152@01 r)) r))
  :pattern ((inv@152@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@155@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01)))
        (img@153@01 r)))
    (=>
      (and
        (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01)))
        (img@153@01 r))
      (Set_in r ($FVF.domain_f (as sm@155@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@155@01  $FVF<f>))))
  :qid |qp.fvfDomDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@152@01 r)) (< (inv@152@01 r) (Seq_length xs@127@01)))
        (img@153@01 r))
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01)))))
    (= ($FVF.lookup_f (as sm@155@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
  :pattern (($FVF.lookup_f (as sm@155@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@137@01 r))
  :qid |qp.fvfValDef78|)))
(assert (and
  (forall ((k@143@01 Int) (j@144@01 Int)) (!
    (=>
      (and
        (>= k@143@01 0)
        (and
          (< k@143@01 (Seq_length xs@127@01))
          (and
            (>= j@144@01 0)
            (and (< j@144@01 (Seq_length xs@127@01)) (not (= k@143@01 j@144@01))))))
      (not (= (Seq_index xs@127@01 k@143@01) (Seq_index xs@127@01 j@144@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106|))
  (forall ((j@145@01 Int)) (!
    (=>
      (and (<= 0 j@145@01) (< j@145@01 3))
      (or (<= 0 j@145@01) (not (<= 0 j@145@01))))
    :pattern ((Seq_index xs@127@01 j@145@01))
    :qid |f-aux|))
  (forall ((j@151@01 Int)) (!
    (=>
      (and (<= 3 j@151@01) (< j@151@01 (Seq_length xs@127@01)))
      (or (<= 3 j@151@01) (not (<= 3 j@151@01))))
    :pattern ((Seq_index xs@127@01 j@151@01))
    :qid |f-aux|))
  (< 0 (Seq_length xs@127@01))
  (fun03%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@150@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@155@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@127@01 0)))
; [eval] fun03(xs, 1)
(push) ; 3
; [eval] |xs| > 6
; [eval] |xs|
; [eval] (forall k: Int, j: Int ::k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@156@01 Int)
(declare-const j@157@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 74 | !(k@156@01 >= 0) | live]
; [else-branch: 74 | k@156@01 >= 0 | live]
(push) ; 6
; [then-branch: 74 | !(k@156@01 >= 0)]
(assert (not (>= k@156@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 74 | k@156@01 >= 0]
(assert (>= k@156@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 75 | !(k@156@01 < |xs@127@01|) | live]
; [else-branch: 75 | k@156@01 < |xs@127@01| | live]
(push) ; 8
; [then-branch: 75 | !(k@156@01 < |xs@127@01|)]
(assert (not (< k@156@01 (Seq_length xs@127@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 75 | k@156@01 < |xs@127@01|]
(assert (< k@156@01 (Seq_length xs@127@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 76 | !(j@157@01 >= 0) | live]
; [else-branch: 76 | j@157@01 >= 0 | live]
(push) ; 10
; [then-branch: 76 | !(j@157@01 >= 0)]
(assert (not (>= j@157@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 76 | j@157@01 >= 0]
(assert (>= j@157@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 77 | !(j@157@01 < |xs@127@01|) | live]
; [else-branch: 77 | j@157@01 < |xs@127@01| | live]
(push) ; 12
; [then-branch: 77 | !(j@157@01 < |xs@127@01|)]
(assert (not (< j@157@01 (Seq_length xs@127@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 77 | j@157@01 < |xs@127@01|]
(assert (< j@157@01 (Seq_length xs@127@01)))
; [eval] k != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@157@01 (Seq_length xs@127@01))
  (not (< j@157@01 (Seq_length xs@127@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@157@01 0)
  (and
    (>= j@157@01 0)
    (or
      (< j@157@01 (Seq_length xs@127@01))
      (not (< j@157@01 (Seq_length xs@127@01)))))))
(assert (or (>= j@157@01 0) (not (>= j@157@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@156@01 (Seq_length xs@127@01))
  (and
    (< k@156@01 (Seq_length xs@127@01))
    (=>
      (>= j@157@01 0)
      (and
        (>= j@157@01 0)
        (or
          (< j@157@01 (Seq_length xs@127@01))
          (not (< j@157@01 (Seq_length xs@127@01))))))
    (or (>= j@157@01 0) (not (>= j@157@01 0))))))
(assert (or
  (< k@156@01 (Seq_length xs@127@01))
  (not (< k@156@01 (Seq_length xs@127@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@156@01 0)
  (and
    (>= k@156@01 0)
    (=>
      (< k@156@01 (Seq_length xs@127@01))
      (and
        (< k@156@01 (Seq_length xs@127@01))
        (=>
          (>= j@157@01 0)
          (and
            (>= j@157@01 0)
            (or
              (< j@157@01 (Seq_length xs@127@01))
              (not (< j@157@01 (Seq_length xs@127@01))))))
        (or (>= j@157@01 0) (not (>= j@157@01 0)))))
    (or
      (< k@156@01 (Seq_length xs@127@01))
      (not (< k@156@01 (Seq_length xs@127@01)))))))
(assert (or (>= k@156@01 0) (not (>= k@156@01 0))))
(push) ; 5
; [then-branch: 78 | k@156@01 >= 0 && k@156@01 < |xs@127@01| && j@157@01 >= 0 && j@157@01 < |xs@127@01| && k@156@01 != j@157@01 | live]
; [else-branch: 78 | !(k@156@01 >= 0 && k@156@01 < |xs@127@01| && j@157@01 >= 0 && j@157@01 < |xs@127@01| && k@156@01 != j@157@01) | live]
(push) ; 6
; [then-branch: 78 | k@156@01 >= 0 && k@156@01 < |xs@127@01| && j@157@01 >= 0 && j@157@01 < |xs@127@01| && k@156@01 != j@157@01]
(assert (and
  (>= k@156@01 0)
  (and
    (< k@156@01 (Seq_length xs@127@01))
    (and
      (>= j@157@01 0)
      (and (< j@157@01 (Seq_length xs@127@01)) (not (= k@156@01 j@157@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 78 | !(k@156@01 >= 0 && k@156@01 < |xs@127@01| && j@157@01 >= 0 && j@157@01 < |xs@127@01| && k@156@01 != j@157@01)]
(assert (not
  (and
    (>= k@156@01 0)
    (and
      (< k@156@01 (Seq_length xs@127@01))
      (and
        (>= j@157@01 0)
        (and (< j@157@01 (Seq_length xs@127@01)) (not (= k@156@01 j@157@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= k@156@01 0)
    (and
      (< k@156@01 (Seq_length xs@127@01))
      (and
        (>= j@157@01 0)
        (and (< j@157@01 (Seq_length xs@127@01)) (not (= k@156@01 j@157@01))))))
  (and
    (>= k@156@01 0)
    (< k@156@01 (Seq_length xs@127@01))
    (>= j@157@01 0)
    (< j@157@01 (Seq_length xs@127@01))
    (not (= k@156@01 j@157@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@156@01 0)
      (and
        (< k@156@01 (Seq_length xs@127@01))
        (and
          (>= j@157@01 0)
          (and (< j@157@01 (Seq_length xs@127@01)) (not (= k@156@01 j@157@01)))))))
  (and
    (>= k@156@01 0)
    (and
      (< k@156@01 (Seq_length xs@127@01))
      (and
        (>= j@157@01 0)
        (and (< j@157@01 (Seq_length xs@127@01)) (not (= k@156@01 j@157@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@156@01 Int) (j@157@01 Int)) (!
  (=>
    (and
      (>= k@156@01 0)
      (and
        (< k@156@01 (Seq_length xs@127@01))
        (and
          (>= j@157@01 0)
          (and (< j@157@01 (Seq_length xs@127@01)) (not (= k@156@01 j@157@01))))))
    (not (= (Seq_index xs@127@01 k@156@01) (Seq_index xs@127@01 j@157@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@156@01 Int) (j@157@01 Int)) (!
  (=>
    (and
      (>= k@156@01 0)
      (and
        (< k@156@01 (Seq_length xs@127@01))
        (and
          (>= j@157@01 0)
          (and (< j@157@01 (Seq_length xs@127@01)) (not (= k@156@01 j@157@01))))))
    (not (= (Seq_index xs@127@01 k@156@01) (Seq_index xs@127@01 j@157@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106|)))
(declare-const j@158@01 Int)
(push) ; 4
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 5
; [then-branch: 79 | !(0 <= j@158@01) | live]
; [else-branch: 79 | 0 <= j@158@01 | live]
(push) ; 6
; [then-branch: 79 | !(0 <= j@158@01)]
(assert (not (<= 0 j@158@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 79 | 0 <= j@158@01]
(assert (<= 0 j@158@01))
; [eval] j < 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@158@01) (not (<= 0 j@158@01))))
(assert (and (<= 0 j@158@01) (< j@158@01 3)))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@158@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@158@01 (Seq_length xs@127@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@159@01 ($Ref) Int)
(declare-fun img@160@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@158@01 Int)) (!
  (=>
    (and (<= 0 j@158@01) (< j@158@01 3))
    (or (<= 0 j@158@01) (not (<= 0 j@158@01))))
  :pattern ((Seq_index xs@127@01 j@158@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@158@01 Int) (j2@158@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@158@01) (< j1@158@01 3))
      (and (<= 0 j2@158@01) (< j2@158@01 3))
      (= (Seq_index xs@127@01 j1@158@01) (Seq_index xs@127@01 j2@158@01)))
    (= j1@158@01 j2@158@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@158@01 Int)) (!
  (=>
    (and (<= 0 j@158@01) (< j@158@01 3))
    (and
      (= (inv@159@01 (Seq_index xs@127@01 j@158@01)) j@158@01)
      (img@160@01 (Seq_index xs@127@01 j@158@01))))
  :pattern ((Seq_index xs@127@01 j@158@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@160@01 r) (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)))
    (= (Seq_index xs@127@01 (inv@159@01 r)) r))
  :pattern ((inv@159@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@161@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3))
      (img@160@01 r)
      (= r (Seq_index xs@127@01 (inv@159@01 r))))
    ($Perm.min
      (ite
        (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@162@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3))
      (img@160@01 r)
      (= r (Seq_index xs@127@01 (inv@159@01 r))))
    ($Perm.min
      (ite
        (and
          (img@139@01 r)
          (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@161@01 r)))
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
        (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@161@01 r))
    $Perm.No)
  
  :qid |quant-u-162|))))
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
      (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3))
      (img@160@01 r)
      (= r (Seq_index xs@127@01 (inv@159@01 r))))
    (= (- $Perm.Write (pTaken@161@01 r)) $Perm.No))
  
  :qid |quant-u-163|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@163@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@163@01  $FVF<f>)))
      (and (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)) (img@160@01 r)))
    (=>
      (and (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)) (img@160@01 r))
      (Set_in r ($FVF.domain_f (as sm@163@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@163@01  $FVF<f>))))
  :qid |qp.fvfDomDef82|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)) (img@160@01 r))
      (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3))))
    (= ($FVF.lookup_f (as sm@163@01  $FVF<f>) r) ($FVF.lookup_f $t@133@01 r)))
  :pattern (($FVF.lookup_f (as sm@163@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@133@01 r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)) (img@160@01 r))
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01)))))
    (= ($FVF.lookup_f (as sm@163@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
  :pattern (($FVF.lookup_f (as sm@163@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@137@01 r))
  :qid |qp.fvfValDef81|)))
(declare-const j@164@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 3 <= j && j < |xs|
; [eval] 3 <= j
(push) ; 5
; [then-branch: 80 | !(3 <= j@164@01) | live]
; [else-branch: 80 | 3 <= j@164@01 | live]
(push) ; 6
; [then-branch: 80 | !(3 <= j@164@01)]
(assert (not (<= 3 j@164@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 80 | 3 <= j@164@01]
(assert (<= 3 j@164@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@164@01) (not (<= 3 j@164@01))))
(assert (and (<= 3 j@164@01) (< j@164@01 (Seq_length xs@127@01))))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@164@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@165@01 ($Ref) Int)
(declare-fun img@166@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@164@01 Int)) (!
  (=>
    (and (<= 3 j@164@01) (< j@164@01 (Seq_length xs@127@01)))
    (or (<= 3 j@164@01) (not (<= 3 j@164@01))))
  :pattern ((Seq_index xs@127@01 j@164@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@164@01 Int) (j2@164@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@164@01) (< j1@164@01 (Seq_length xs@127@01)))
      (and (<= 3 j2@164@01) (< j2@164@01 (Seq_length xs@127@01)))
      (= (Seq_index xs@127@01 j1@164@01) (Seq_index xs@127@01 j2@164@01)))
    (= j1@164@01 j2@164@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@164@01 Int)) (!
  (=>
    (and (<= 3 j@164@01) (< j@164@01 (Seq_length xs@127@01)))
    (and
      (= (inv@165@01 (Seq_index xs@127@01 j@164@01)) j@164@01)
      (img@166@01 (Seq_index xs@127@01 j@164@01))))
  :pattern ((Seq_index xs@127@01 j@164@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01))))
    (= (Seq_index xs@127@01 (inv@165@01 r)) r))
  :pattern ((inv@165@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@167@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01)))
      (img@166@01 r)
      (= r (Seq_index xs@127@01 (inv@165@01 r))))
    ($Perm.min
      (ite
        (and
          (img@139@01 r)
          (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
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
          (img@139@01 r)
          (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@167@01 r))
    $Perm.No)
  
  :qid |quant-u-166|))))
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
      (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01)))
      (img@166@01 r)
      (= r (Seq_index xs@127@01 (inv@165@01 r))))
    (= (- $Perm.Write (pTaken@167@01 r)) $Perm.No))
  
  :qid |quant-u-167|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@168@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@168@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01)))
        (img@166@01 r)))
    (=>
      (and
        (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01)))
        (img@166@01 r))
      (Set_in r ($FVF.domain_f (as sm@168@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@168@01  $FVF<f>))))
  :qid |qp.fvfDomDef84|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01)))
        (img@166@01 r))
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01)))))
    (= ($FVF.lookup_f (as sm@168@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@137@01 r))
  :qid |qp.fvfValDef83|)))
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 4
(assert (not (< 1 (Seq_length xs@127@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 1 (Seq_length xs@127@01)))
(assert (fun03%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@163@01  $FVF<f>))
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@168@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@127@01 1))
(pop) ; 3
; Joined path conditions
(assert (forall ((j@158@01 Int)) (!
  (=>
    (and (<= 0 j@158@01) (< j@158@01 3))
    (and
      (= (inv@159@01 (Seq_index xs@127@01 j@158@01)) j@158@01)
      (img@160@01 (Seq_index xs@127@01 j@158@01))))
  :pattern ((Seq_index xs@127@01 j@158@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@160@01 r) (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)))
    (= (Seq_index xs@127@01 (inv@159@01 r)) r))
  :pattern ((inv@159@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@163@01  $FVF<f>)))
      (and (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)) (img@160@01 r)))
    (=>
      (and (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)) (img@160@01 r))
      (Set_in r ($FVF.domain_f (as sm@163@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@163@01  $FVF<f>))))
  :qid |qp.fvfDomDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)) (img@160@01 r))
      (and (img@135@01 r) (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) 3))))
    (= ($FVF.lookup_f (as sm@163@01  $FVF<f>) r) ($FVF.lookup_f $t@133@01 r)))
  :pattern (($FVF.lookup_f (as sm@163@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@133@01 r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@159@01 r)) (< (inv@159@01 r) 3)) (img@160@01 r))
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01)))))
    (= ($FVF.lookup_f (as sm@163@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
  :pattern (($FVF.lookup_f (as sm@163@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@137@01 r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((j@164@01 Int)) (!
  (=>
    (and (<= 3 j@164@01) (< j@164@01 (Seq_length xs@127@01)))
    (and
      (= (inv@165@01 (Seq_index xs@127@01 j@164@01)) j@164@01)
      (img@166@01 (Seq_index xs@127@01 j@164@01))))
  :pattern ((Seq_index xs@127@01 j@164@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01))))
    (= (Seq_index xs@127@01 (inv@165@01 r)) r))
  :pattern ((inv@165@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@168@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01)))
        (img@166@01 r)))
    (=>
      (and
        (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01)))
        (img@166@01 r))
      (Set_in r ($FVF.domain_f (as sm@168@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@168@01  $FVF<f>))))
  :qid |qp.fvfDomDef84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@165@01 r)) (< (inv@165@01 r) (Seq_length xs@127@01)))
        (img@166@01 r))
      (and
        (img@139@01 r)
        (and (<= 3 (inv@138@01 r)) (< (inv@138@01 r) (Seq_length xs@127@01)))))
    (= ($FVF.lookup_f (as sm@168@01  $FVF<f>) r) ($FVF.lookup_f $t@137@01 r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@137@01 r))
  :qid |qp.fvfValDef83|)))
(assert (and
  (forall ((k@156@01 Int) (j@157@01 Int)) (!
    (=>
      (and
        (>= k@156@01 0)
        (and
          (< k@156@01 (Seq_length xs@127@01))
          (and
            (>= j@157@01 0)
            (and (< j@157@01 (Seq_length xs@127@01)) (not (= k@156@01 j@157@01))))))
      (not (= (Seq_index xs@127@01 k@156@01) (Seq_index xs@127@01 j@157@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106|))
  (forall ((j@158@01 Int)) (!
    (=>
      (and (<= 0 j@158@01) (< j@158@01 3))
      (or (<= 0 j@158@01) (not (<= 0 j@158@01))))
    :pattern ((Seq_index xs@127@01 j@158@01))
    :qid |f-aux|))
  (forall ((j@164@01 Int)) (!
    (=>
      (and (<= 3 j@164@01) (< j@164@01 (Seq_length xs@127@01)))
      (or (<= 3 j@164@01) (not (<= 3 j@164@01))))
    :pattern ((Seq_index xs@127@01 j@164@01))
    :qid |f-aux|))
  (< 1 (Seq_length xs@127@01))
  (fun03%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@163@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@168@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@127@01 1)))
(push) ; 3
(assert (not (<
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@150@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@155@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@127@01 0)
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@163@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@168@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@127@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@150@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@155@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@127@01 0)
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@163@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@168@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@127@01 1)))
(pop) ; 2
(pop) ; 1
; ---------- test06a ----------
(declare-const xs@169@01 Seq<$Ref>)
(declare-const n@170@01 Int)
(declare-const xs@171@01 Seq<$Ref>)
(declare-const n@172@01 Int)
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
; var v1: Int
(declare-const v1@173@01 Int)
; [exec]
; inhale |xs| == n && 6 < n
(declare-const $t@174@01 $Snap)
(assert (= $t@174@01 ($Snap.combine ($Snap.first $t@174@01) ($Snap.second $t@174@01))))
(assert (= ($Snap.first $t@174@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@171@01) n@172@01))
(assert (= ($Snap.second $t@174@01) $Snap.unit))
; [eval] 6 < n
(assert (< 6 n@172@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int, j: Int ::
;     { xs[k], xs[j] }
;     k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==>
;     xs[k] != xs[j])
(declare-const $t@175@01 $Snap)
(assert (= $t@175@01 $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@176@01 Int)
(declare-const j@177@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 81 | !(k@176@01 >= 0) | live]
; [else-branch: 81 | k@176@01 >= 0 | live]
(push) ; 5
; [then-branch: 81 | !(k@176@01 >= 0)]
(assert (not (>= k@176@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 81 | k@176@01 >= 0]
(assert (>= k@176@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 82 | !(k@176@01 < |xs@171@01|) | live]
; [else-branch: 82 | k@176@01 < |xs@171@01| | live]
(push) ; 7
; [then-branch: 82 | !(k@176@01 < |xs@171@01|)]
(assert (not (< k@176@01 (Seq_length xs@171@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 82 | k@176@01 < |xs@171@01|]
(assert (< k@176@01 (Seq_length xs@171@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 83 | !(j@177@01 >= 0) | live]
; [else-branch: 83 | j@177@01 >= 0 | live]
(push) ; 9
; [then-branch: 83 | !(j@177@01 >= 0)]
(assert (not (>= j@177@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 83 | j@177@01 >= 0]
(assert (>= j@177@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 84 | !(j@177@01 < |xs@171@01|) | live]
; [else-branch: 84 | j@177@01 < |xs@171@01| | live]
(push) ; 11
; [then-branch: 84 | !(j@177@01 < |xs@171@01|)]
(assert (not (< j@177@01 (Seq_length xs@171@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 84 | j@177@01 < |xs@171@01|]
(assert (< j@177@01 (Seq_length xs@171@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@177@01 (Seq_length xs@171@01))
  (not (< j@177@01 (Seq_length xs@171@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@177@01 0)
  (and
    (>= j@177@01 0)
    (or
      (< j@177@01 (Seq_length xs@171@01))
      (not (< j@177@01 (Seq_length xs@171@01)))))))
(assert (or (>= j@177@01 0) (not (>= j@177@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@176@01 (Seq_length xs@171@01))
  (and
    (< k@176@01 (Seq_length xs@171@01))
    (=>
      (>= j@177@01 0)
      (and
        (>= j@177@01 0)
        (or
          (< j@177@01 (Seq_length xs@171@01))
          (not (< j@177@01 (Seq_length xs@171@01))))))
    (or (>= j@177@01 0) (not (>= j@177@01 0))))))
(assert (or
  (< k@176@01 (Seq_length xs@171@01))
  (not (< k@176@01 (Seq_length xs@171@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@176@01 0)
  (and
    (>= k@176@01 0)
    (=>
      (< k@176@01 (Seq_length xs@171@01))
      (and
        (< k@176@01 (Seq_length xs@171@01))
        (=>
          (>= j@177@01 0)
          (and
            (>= j@177@01 0)
            (or
              (< j@177@01 (Seq_length xs@171@01))
              (not (< j@177@01 (Seq_length xs@171@01))))))
        (or (>= j@177@01 0) (not (>= j@177@01 0)))))
    (or
      (< k@176@01 (Seq_length xs@171@01))
      (not (< k@176@01 (Seq_length xs@171@01)))))))
(assert (or (>= k@176@01 0) (not (>= k@176@01 0))))
(push) ; 4
; [then-branch: 85 | k@176@01 >= 0 && k@176@01 < |xs@171@01| && j@177@01 >= 0 && j@177@01 < |xs@171@01| && k@176@01 != j@177@01 | live]
; [else-branch: 85 | !(k@176@01 >= 0 && k@176@01 < |xs@171@01| && j@177@01 >= 0 && j@177@01 < |xs@171@01| && k@176@01 != j@177@01) | live]
(push) ; 5
; [then-branch: 85 | k@176@01 >= 0 && k@176@01 < |xs@171@01| && j@177@01 >= 0 && j@177@01 < |xs@171@01| && k@176@01 != j@177@01]
(assert (and
  (>= k@176@01 0)
  (and
    (< k@176@01 (Seq_length xs@171@01))
    (and
      (>= j@177@01 0)
      (and (< j@177@01 (Seq_length xs@171@01)) (not (= k@176@01 j@177@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 85 | !(k@176@01 >= 0 && k@176@01 < |xs@171@01| && j@177@01 >= 0 && j@177@01 < |xs@171@01| && k@176@01 != j@177@01)]
(assert (not
  (and
    (>= k@176@01 0)
    (and
      (< k@176@01 (Seq_length xs@171@01))
      (and
        (>= j@177@01 0)
        (and (< j@177@01 (Seq_length xs@171@01)) (not (= k@176@01 j@177@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@176@01 0)
    (and
      (< k@176@01 (Seq_length xs@171@01))
      (and
        (>= j@177@01 0)
        (and (< j@177@01 (Seq_length xs@171@01)) (not (= k@176@01 j@177@01))))))
  (and
    (>= k@176@01 0)
    (< k@176@01 (Seq_length xs@171@01))
    (>= j@177@01 0)
    (< j@177@01 (Seq_length xs@171@01))
    (not (= k@176@01 j@177@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@176@01 0)
      (and
        (< k@176@01 (Seq_length xs@171@01))
        (and
          (>= j@177@01 0)
          (and (< j@177@01 (Seq_length xs@171@01)) (not (= k@176@01 j@177@01)))))))
  (and
    (>= k@176@01 0)
    (and
      (< k@176@01 (Seq_length xs@171@01))
      (and
        (>= j@177@01 0)
        (and (< j@177@01 (Seq_length xs@171@01)) (not (= k@176@01 j@177@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@176@01 Int) (j@177@01 Int)) (!
  (and
    (=>
      (>= k@176@01 0)
      (and
        (>= k@176@01 0)
        (=>
          (< k@176@01 (Seq_length xs@171@01))
          (and
            (< k@176@01 (Seq_length xs@171@01))
            (=>
              (>= j@177@01 0)
              (and
                (>= j@177@01 0)
                (or
                  (< j@177@01 (Seq_length xs@171@01))
                  (not (< j@177@01 (Seq_length xs@171@01))))))
            (or (>= j@177@01 0) (not (>= j@177@01 0)))))
        (or
          (< k@176@01 (Seq_length xs@171@01))
          (not (< k@176@01 (Seq_length xs@171@01))))))
    (or (>= k@176@01 0) (not (>= k@176@01 0)))
    (=>
      (and
        (>= k@176@01 0)
        (and
          (< k@176@01 (Seq_length xs@171@01))
          (and
            (>= j@177@01 0)
            (and (< j@177@01 (Seq_length xs@171@01)) (not (= k@176@01 j@177@01))))))
      (and
        (>= k@176@01 0)
        (< k@176@01 (Seq_length xs@171@01))
        (>= j@177@01 0)
        (< j@177@01 (Seq_length xs@171@01))
        (not (= k@176@01 j@177@01))))
    (or
      (not
        (and
          (>= k@176@01 0)
          (and
            (< k@176@01 (Seq_length xs@171@01))
            (and
              (>= j@177@01 0)
              (and
                (< j@177@01 (Seq_length xs@171@01))
                (not (= k@176@01 j@177@01)))))))
      (and
        (>= k@176@01 0)
        (and
          (< k@176@01 (Seq_length xs@171@01))
          (and
            (>= j@177@01 0)
            (and (< j@177@01 (Seq_length xs@171@01)) (not (= k@176@01 j@177@01))))))))
  :pattern ((Seq_index xs@171@01 k@176@01) (Seq_index xs@171@01 j@177@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@72@11@72@105-aux|)))
(assert (forall ((k@176@01 Int) (j@177@01 Int)) (!
  (=>
    (and
      (>= k@176@01 0)
      (and
        (< k@176@01 (Seq_length xs@171@01))
        (and
          (>= j@177@01 0)
          (and (< j@177@01 (Seq_length xs@171@01)) (not (= k@176@01 j@177@01))))))
    (not (= (Seq_index xs@171@01 k@176@01) (Seq_index xs@171@01 j@177@01))))
  :pattern ((Seq_index xs@171@01 k@176@01) (Seq_index xs@171@01 j@177@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@72@11@72@105|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::0 <= j && j < 3 ==> acc(xs[j].f, write))
(declare-const j@178@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 86 | !(0 <= j@178@01) | live]
; [else-branch: 86 | 0 <= j@178@01 | live]
(push) ; 5
; [then-branch: 86 | !(0 <= j@178@01)]
(assert (not (<= 0 j@178@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 86 | 0 <= j@178@01]
(assert (<= 0 j@178@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@178@01) (not (<= 0 j@178@01))))
(assert (and (<= 0 j@178@01) (< j@178@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@178@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@178@01 (Seq_length xs@171@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@179@01 $FVF<f>)
(declare-fun inv@180@01 ($Ref) Int)
(declare-fun img@181@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@178@01 Int)) (!
  (=>
    (and (<= 0 j@178@01) (< j@178@01 3))
    (or (<= 0 j@178@01) (not (<= 0 j@178@01))))
  :pattern ((Seq_index xs@171@01 j@178@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@178@01 Int) (j2@178@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@178@01) (< j1@178@01 3))
      (and (<= 0 j2@178@01) (< j2@178@01 3))
      (= (Seq_index xs@171@01 j1@178@01) (Seq_index xs@171@01 j2@178@01)))
    (= j1@178@01 j2@178@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@178@01 Int)) (!
  (=>
    (and (<= 0 j@178@01) (< j@178@01 3))
    (and
      (= (inv@180@01 (Seq_index xs@171@01 j@178@01)) j@178@01)
      (img@181@01 (Seq_index xs@171@01 j@178@01))))
  :pattern ((Seq_index xs@171@01 j@178@01))
  :qid |quant-u-169|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@181@01 r) (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) 3)))
    (= (Seq_index xs@171@01 (inv@180@01 r)) r))
  :pattern ((inv@180@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@178@01 Int)) (!
  (=>
    (and (<= 0 j@178@01) (< j@178@01 3))
    (not (= (Seq_index xs@171@01 j@178@01) $Ref.null)))
  :pattern ((Seq_index xs@171@01 j@178@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::3 <= j && j < n ==> acc(xs[j].f, write))
(declare-const j@182@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 87 | !(3 <= j@182@01) | live]
; [else-branch: 87 | 3 <= j@182@01 | live]
(push) ; 5
; [then-branch: 87 | !(3 <= j@182@01)]
(assert (not (<= 3 j@182@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 87 | 3 <= j@182@01]
(assert (<= 3 j@182@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@182@01) (not (<= 3 j@182@01))))
(assert (and (<= 3 j@182@01) (< j@182@01 n@172@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@182@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@182@01 (Seq_length xs@171@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@183@01 $FVF<f>)
(declare-fun inv@184@01 ($Ref) Int)
(declare-fun img@185@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@182@01 Int)) (!
  (=>
    (and (<= 3 j@182@01) (< j@182@01 n@172@01))
    (or (<= 3 j@182@01) (not (<= 3 j@182@01))))
  :pattern ((Seq_index xs@171@01 j@182@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@182@01 Int) (j2@182@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@182@01) (< j1@182@01 n@172@01))
      (and (<= 3 j2@182@01) (< j2@182@01 n@172@01))
      (= (Seq_index xs@171@01 j1@182@01) (Seq_index xs@171@01 j2@182@01)))
    (= j1@182@01 j2@182@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@182@01 Int)) (!
  (=>
    (and (<= 3 j@182@01) (< j@182@01 n@172@01))
    (and
      (= (inv@184@01 (Seq_index xs@171@01 j@182@01)) j@182@01)
      (img@185@01 (Seq_index xs@171@01 j@182@01))))
  :pattern ((Seq_index xs@171@01 j@182@01))
  :qid |quant-u-171|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@185@01 r) (and (<= 3 (inv@184@01 r)) (< (inv@184@01 r) n@172@01)))
    (= (Seq_index xs@171@01 (inv@184@01 r)) r))
  :pattern ((inv@184@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@182@01 Int)) (!
  (=>
    (and (<= 3 j@182@01) (< j@182@01 n@172@01))
    (not (= (Seq_index xs@171@01 j@182@01) $Ref.null)))
  :pattern ((Seq_index xs@171@01 j@182@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@171@01 j@182@01) (Seq_index xs@171@01 j@178@01))
    (=
      (and
        (img@185@01 r)
        (and (<= 3 (inv@184@01 r)) (< (inv@184@01 r) n@172@01)))
      (and (img@181@01 r) (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) 3)))))
  
  :qid |quant-u-172|))))
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
; v1 := xs[2].f
; [eval] xs[2]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 2 (Seq_length xs@171@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@186@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@181@01 r) (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) 3)))
    (= ($FVF.lookup_f (as sm@186@01  $FVF<f>) r) ($FVF.lookup_f $t@179@01 r)))
  :pattern (($FVF.lookup_f (as sm@186@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@179@01 r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@185@01 r) (and (<= 3 (inv@184@01 r)) (< (inv@184@01 r) n@172@01)))
    (= ($FVF.lookup_f (as sm@186@01  $FVF<f>) r) ($FVF.lookup_f $t@183@01 r)))
  :pattern (($FVF.lookup_f (as sm@186@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@183@01 r))
  :qid |qp.fvfValDef86|)))
(declare-const pm@187@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@187@01  $FPM) r)
    (+
      (ite
        (and (img@181@01 r) (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@185@01 r)
          (and (<= 3 (inv@184@01 r)) (< (inv@184@01 r) n@172@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@187@01  $FPM) r))
  :qid |qp.resPrmSumDef87|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@187@01  $FPM) (Seq_index xs@171@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const v1@188@01 Int)
(assert (= v1@188@01 ($FVF.lookup_f (as sm@186@01  $FVF<f>) (Seq_index xs@171@01 2))))
; [exec]
; fold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
(push) ; 3
(assert (not (<= 3 n@172@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 3 n@172@01))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@189@01 Int)
(declare-const j@190@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 88 | !(k@189@01 >= 0) | live]
; [else-branch: 88 | k@189@01 >= 0 | live]
(push) ; 5
; [then-branch: 88 | !(k@189@01 >= 0)]
(assert (not (>= k@189@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 88 | k@189@01 >= 0]
(assert (>= k@189@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 89 | !(k@189@01 < |xs@171@01|) | live]
; [else-branch: 89 | k@189@01 < |xs@171@01| | live]
(push) ; 7
; [then-branch: 89 | !(k@189@01 < |xs@171@01|)]
(assert (not (< k@189@01 (Seq_length xs@171@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 89 | k@189@01 < |xs@171@01|]
(assert (< k@189@01 (Seq_length xs@171@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 90 | !(j@190@01 >= 0) | live]
; [else-branch: 90 | j@190@01 >= 0 | live]
(push) ; 9
; [then-branch: 90 | !(j@190@01 >= 0)]
(assert (not (>= j@190@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 90 | j@190@01 >= 0]
(assert (>= j@190@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 91 | !(j@190@01 < |xs@171@01|) | live]
; [else-branch: 91 | j@190@01 < |xs@171@01| | live]
(push) ; 11
; [then-branch: 91 | !(j@190@01 < |xs@171@01|)]
(assert (not (< j@190@01 (Seq_length xs@171@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 91 | j@190@01 < |xs@171@01|]
(assert (< j@190@01 (Seq_length xs@171@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@190@01 (Seq_length xs@171@01))
  (not (< j@190@01 (Seq_length xs@171@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@190@01 0)
  (and
    (>= j@190@01 0)
    (or
      (< j@190@01 (Seq_length xs@171@01))
      (not (< j@190@01 (Seq_length xs@171@01)))))))
(assert (or (>= j@190@01 0) (not (>= j@190@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@189@01 (Seq_length xs@171@01))
  (and
    (< k@189@01 (Seq_length xs@171@01))
    (=>
      (>= j@190@01 0)
      (and
        (>= j@190@01 0)
        (or
          (< j@190@01 (Seq_length xs@171@01))
          (not (< j@190@01 (Seq_length xs@171@01))))))
    (or (>= j@190@01 0) (not (>= j@190@01 0))))))
(assert (or
  (< k@189@01 (Seq_length xs@171@01))
  (not (< k@189@01 (Seq_length xs@171@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@189@01 0)
  (and
    (>= k@189@01 0)
    (=>
      (< k@189@01 (Seq_length xs@171@01))
      (and
        (< k@189@01 (Seq_length xs@171@01))
        (=>
          (>= j@190@01 0)
          (and
            (>= j@190@01 0)
            (or
              (< j@190@01 (Seq_length xs@171@01))
              (not (< j@190@01 (Seq_length xs@171@01))))))
        (or (>= j@190@01 0) (not (>= j@190@01 0)))))
    (or
      (< k@189@01 (Seq_length xs@171@01))
      (not (< k@189@01 (Seq_length xs@171@01)))))))
(assert (or (>= k@189@01 0) (not (>= k@189@01 0))))
(push) ; 4
; [then-branch: 92 | k@189@01 >= 0 && k@189@01 < |xs@171@01| && j@190@01 >= 0 && j@190@01 < |xs@171@01| && k@189@01 != j@190@01 | live]
; [else-branch: 92 | !(k@189@01 >= 0 && k@189@01 < |xs@171@01| && j@190@01 >= 0 && j@190@01 < |xs@171@01| && k@189@01 != j@190@01) | live]
(push) ; 5
; [then-branch: 92 | k@189@01 >= 0 && k@189@01 < |xs@171@01| && j@190@01 >= 0 && j@190@01 < |xs@171@01| && k@189@01 != j@190@01]
(assert (and
  (>= k@189@01 0)
  (and
    (< k@189@01 (Seq_length xs@171@01))
    (and
      (>= j@190@01 0)
      (and (< j@190@01 (Seq_length xs@171@01)) (not (= k@189@01 j@190@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 92 | !(k@189@01 >= 0 && k@189@01 < |xs@171@01| && j@190@01 >= 0 && j@190@01 < |xs@171@01| && k@189@01 != j@190@01)]
(assert (not
  (and
    (>= k@189@01 0)
    (and
      (< k@189@01 (Seq_length xs@171@01))
      (and
        (>= j@190@01 0)
        (and (< j@190@01 (Seq_length xs@171@01)) (not (= k@189@01 j@190@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@189@01 0)
    (and
      (< k@189@01 (Seq_length xs@171@01))
      (and
        (>= j@190@01 0)
        (and (< j@190@01 (Seq_length xs@171@01)) (not (= k@189@01 j@190@01))))))
  (and
    (>= k@189@01 0)
    (< k@189@01 (Seq_length xs@171@01))
    (>= j@190@01 0)
    (< j@190@01 (Seq_length xs@171@01))
    (not (= k@189@01 j@190@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@189@01 0)
      (and
        (< k@189@01 (Seq_length xs@171@01))
        (and
          (>= j@190@01 0)
          (and (< j@190@01 (Seq_length xs@171@01)) (not (= k@189@01 j@190@01)))))))
  (and
    (>= k@189@01 0)
    (and
      (< k@189@01 (Seq_length xs@171@01))
      (and
        (>= j@190@01 0)
        (and (< j@190@01 (Seq_length xs@171@01)) (not (= k@189@01 j@190@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@189@01 Int) (j@190@01 Int)) (!
  (and
    (=>
      (>= k@189@01 0)
      (and
        (>= k@189@01 0)
        (=>
          (< k@189@01 (Seq_length xs@171@01))
          (and
            (< k@189@01 (Seq_length xs@171@01))
            (=>
              (>= j@190@01 0)
              (and
                (>= j@190@01 0)
                (or
                  (< j@190@01 (Seq_length xs@171@01))
                  (not (< j@190@01 (Seq_length xs@171@01))))))
            (or (>= j@190@01 0) (not (>= j@190@01 0)))))
        (or
          (< k@189@01 (Seq_length xs@171@01))
          (not (< k@189@01 (Seq_length xs@171@01))))))
    (or (>= k@189@01 0) (not (>= k@189@01 0)))
    (=>
      (and
        (>= k@189@01 0)
        (and
          (< k@189@01 (Seq_length xs@171@01))
          (and
            (>= j@190@01 0)
            (and (< j@190@01 (Seq_length xs@171@01)) (not (= k@189@01 j@190@01))))))
      (and
        (>= k@189@01 0)
        (< k@189@01 (Seq_length xs@171@01))
        (>= j@190@01 0)
        (< j@190@01 (Seq_length xs@171@01))
        (not (= k@189@01 j@190@01))))
    (or
      (not
        (and
          (>= k@189@01 0)
          (and
            (< k@189@01 (Seq_length xs@171@01))
            (and
              (>= j@190@01 0)
              (and
                (< j@190@01 (Seq_length xs@171@01))
                (not (= k@189@01 j@190@01)))))))
      (and
        (>= k@189@01 0)
        (and
          (< k@189@01 (Seq_length xs@171@01))
          (and
            (>= j@190@01 0)
            (and (< j@190@01 (Seq_length xs@171@01)) (not (= k@189@01 j@190@01))))))))
  :pattern ((Seq_index xs@171@01 k@189@01) (Seq_index xs@171@01 j@190@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(push) ; 3
(assert (not (forall ((k@189@01 Int) (j@190@01 Int)) (!
  (=>
    (and
      (>= k@189@01 0)
      (and
        (< k@189@01 (Seq_length xs@171@01))
        (and
          (>= j@190@01 0)
          (and (< j@190@01 (Seq_length xs@171@01)) (not (= k@189@01 j@190@01))))))
    (not (= (Seq_index xs@171@01 k@189@01) (Seq_index xs@171@01 j@190@01))))
  :pattern ((Seq_index xs@171@01 k@189@01) (Seq_index xs@171@01 j@190@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@189@01 Int) (j@190@01 Int)) (!
  (=>
    (and
      (>= k@189@01 0)
      (and
        (< k@189@01 (Seq_length xs@171@01))
        (and
          (>= j@190@01 0)
          (and (< j@190@01 (Seq_length xs@171@01)) (not (= k@189@01 j@190@01))))))
    (not (= (Seq_index xs@171@01 k@189@01) (Seq_index xs@171@01 j@190@01))))
  :pattern ((Seq_index xs@171@01 k@189@01) (Seq_index xs@171@01 j@190@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(declare-const j@191@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 93 | !(0 <= j@191@01) | live]
; [else-branch: 93 | 0 <= j@191@01 | live]
(push) ; 5
; [then-branch: 93 | !(0 <= j@191@01)]
(assert (not (<= 0 j@191@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 93 | 0 <= j@191@01]
(assert (<= 0 j@191@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@191@01) (not (<= 0 j@191@01))))
(assert (and (<= 0 j@191@01) (< j@191@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@191@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@191@01 (Seq_length xs@171@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@192@01 ($Ref) Int)
(declare-fun img@193@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@191@01 Int)) (!
  (=>
    (and (<= 0 j@191@01) (< j@191@01 3))
    (or (<= 0 j@191@01) (not (<= 0 j@191@01))))
  :pattern ((Seq_index xs@171@01 j@191@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@191@01 Int) (j2@191@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@191@01) (< j1@191@01 3))
      (and (<= 0 j2@191@01) (< j2@191@01 3))
      (= (Seq_index xs@171@01 j1@191@01) (Seq_index xs@171@01 j2@191@01)))
    (= j1@191@01 j2@191@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@191@01 Int)) (!
  (=>
    (and (<= 0 j@191@01) (< j@191@01 3))
    (and
      (= (inv@192@01 (Seq_index xs@171@01 j@191@01)) j@191@01)
      (img@193@01 (Seq_index xs@171@01 j@191@01))))
  :pattern ((Seq_index xs@171@01 j@191@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@193@01 r) (and (<= 0 (inv@192@01 r)) (< (inv@192@01 r) 3)))
    (= (Seq_index xs@171@01 (inv@192@01 r)) r))
  :pattern ((inv@192@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@194@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@192@01 r)) (< (inv@192@01 r) 3))
      (img@193@01 r)
      (= r (Seq_index xs@171@01 (inv@192@01 r))))
    ($Perm.min
      (ite
        (and (img@181@01 r) (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@195@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@192@01 r)) (< (inv@192@01 r) 3))
      (img@193@01 r)
      (= r (Seq_index xs@171@01 (inv@192@01 r))))
    ($Perm.min
      (ite
        (and
          (img@185@01 r)
          (and (<= 3 (inv@184@01 r)) (< (inv@184@01 r) n@172@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@194@01 r)))
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
        (and (img@181@01 r) (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@194@01 r))
    $Perm.No)
  
  :qid |quant-u-175|))))
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
      (and (<= 0 (inv@192@01 r)) (< (inv@192@01 r) 3))
      (img@193@01 r)
      (= r (Seq_index xs@171@01 (inv@192@01 r))))
    (= (- $Perm.Write (pTaken@194@01 r)) $Perm.No))
  
  :qid |quant-u-176|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@196@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@196@01  $FVF<f>)))
      (and (and (<= 0 (inv@192@01 r)) (< (inv@192@01 r) 3)) (img@193@01 r)))
    (=>
      (and (and (<= 0 (inv@192@01 r)) (< (inv@192@01 r) 3)) (img@193@01 r))
      (Set_in r ($FVF.domain_f (as sm@196@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@196@01  $FVF<f>))))
  :qid |qp.fvfDomDef90|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@192@01 r)) (< (inv@192@01 r) 3)) (img@193@01 r))
      (and (img@181@01 r) (and (<= 0 (inv@180@01 r)) (< (inv@180@01 r) 3))))
    (= ($FVF.lookup_f (as sm@196@01  $FVF<f>) r) ($FVF.lookup_f $t@179@01 r)))
  :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@179@01 r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@192@01 r)) (< (inv@192@01 r) 3)) (img@193@01 r))
      (and
        (img@185@01 r)
        (and (<= 3 (inv@184@01 r)) (< (inv@184@01 r) n@172@01))))
    (= ($FVF.lookup_f (as sm@196@01  $FVF<f>) r) ($FVF.lookup_f $t@183@01 r)))
  :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@183@01 r))
  :qid |qp.fvfValDef89|)))
(declare-const j@197@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 94 | !(3 <= j@197@01) | live]
; [else-branch: 94 | 3 <= j@197@01 | live]
(push) ; 5
; [then-branch: 94 | !(3 <= j@197@01)]
(assert (not (<= 3 j@197@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 94 | 3 <= j@197@01]
(assert (<= 3 j@197@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@197@01) (not (<= 3 j@197@01))))
(assert (and (<= 3 j@197@01) (< j@197@01 n@172@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@197@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@197@01 (Seq_length xs@171@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@198@01 ($Ref) Int)
(declare-fun img@199@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@197@01 Int)) (!
  (=>
    (and (<= 3 j@197@01) (< j@197@01 n@172@01))
    (or (<= 3 j@197@01) (not (<= 3 j@197@01))))
  :pattern ((Seq_index xs@171@01 j@197@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@197@01 Int) (j2@197@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@197@01) (< j1@197@01 n@172@01))
      (and (<= 3 j2@197@01) (< j2@197@01 n@172@01))
      (= (Seq_index xs@171@01 j1@197@01) (Seq_index xs@171@01 j2@197@01)))
    (= j1@197@01 j2@197@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@197@01 Int)) (!
  (=>
    (and (<= 3 j@197@01) (< j@197@01 n@172@01))
    (and
      (= (inv@198@01 (Seq_index xs@171@01 j@197@01)) j@197@01)
      (img@199@01 (Seq_index xs@171@01 j@197@01))))
  :pattern ((Seq_index xs@171@01 j@197@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@199@01 r) (and (<= 3 (inv@198@01 r)) (< (inv@198@01 r) n@172@01)))
    (= (Seq_index xs@171@01 (inv@198@01 r)) r))
  :pattern ((inv@198@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@200@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@198@01 r)) (< (inv@198@01 r) n@172@01))
      (img@199@01 r)
      (= r (Seq_index xs@171@01 (inv@198@01 r))))
    ($Perm.min
      (ite
        (and
          (img@185@01 r)
          (and (<= 3 (inv@184@01 r)) (< (inv@184@01 r) n@172@01)))
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
          (img@185@01 r)
          (and (<= 3 (inv@184@01 r)) (< (inv@184@01 r) n@172@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@200@01 r))
    $Perm.No)
  
  :qid |quant-u-179|))))
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
      (and (<= 3 (inv@198@01 r)) (< (inv@198@01 r) n@172@01))
      (img@199@01 r)
      (= r (Seq_index xs@171@01 (inv@198@01 r))))
    (= (- $Perm.Write (pTaken@200@01 r)) $Perm.No))
  
  :qid |quant-u-180|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@201@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@201@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@198@01 r)) (< (inv@198@01 r) n@172@01))
        (img@199@01 r)))
    (=>
      (and
        (and (<= 3 (inv@198@01 r)) (< (inv@198@01 r) n@172@01))
        (img@199@01 r))
      (Set_in r ($FVF.domain_f (as sm@201@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@201@01  $FVF<f>))))
  :qid |qp.fvfDomDef92|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@198@01 r)) (< (inv@198@01 r) n@172@01))
        (img@199@01 r))
      (and
        (img@185@01 r)
        (and (<= 3 (inv@184@01 r)) (< (inv@184@01 r) n@172@01))))
    (= ($FVF.lookup_f (as sm@201@01  $FVF<f>) r) ($FVF.lookup_f $t@183@01 r)))
  :pattern (($FVF.lookup_f (as sm@201@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@183@01 r))
  :qid |qp.fvfValDef91|)))
(assert (P02%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@196@01  $FVF<f>))
        ($SortWrappers.$FVF<f>To$Snap (as sm@201@01  $FVF<f>)))))) xs@171@01 n@172@01))
; [exec]
; unfold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@202@01 Int)
(declare-const j@203@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 95 | !(k@202@01 >= 0) | live]
; [else-branch: 95 | k@202@01 >= 0 | live]
(push) ; 5
; [then-branch: 95 | !(k@202@01 >= 0)]
(assert (not (>= k@202@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 95 | k@202@01 >= 0]
(assert (>= k@202@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 96 | !(k@202@01 < |xs@171@01|) | live]
; [else-branch: 96 | k@202@01 < |xs@171@01| | live]
(push) ; 7
; [then-branch: 96 | !(k@202@01 < |xs@171@01|)]
(assert (not (< k@202@01 (Seq_length xs@171@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 96 | k@202@01 < |xs@171@01|]
(assert (< k@202@01 (Seq_length xs@171@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 97 | !(j@203@01 >= 0) | live]
; [else-branch: 97 | j@203@01 >= 0 | live]
(push) ; 9
; [then-branch: 97 | !(j@203@01 >= 0)]
(assert (not (>= j@203@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 97 | j@203@01 >= 0]
(assert (>= j@203@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 98 | !(j@203@01 < |xs@171@01|) | live]
; [else-branch: 98 | j@203@01 < |xs@171@01| | live]
(push) ; 11
; [then-branch: 98 | !(j@203@01 < |xs@171@01|)]
(assert (not (< j@203@01 (Seq_length xs@171@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 98 | j@203@01 < |xs@171@01|]
(assert (< j@203@01 (Seq_length xs@171@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@203@01 (Seq_length xs@171@01))
  (not (< j@203@01 (Seq_length xs@171@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@203@01 0)
  (and
    (>= j@203@01 0)
    (or
      (< j@203@01 (Seq_length xs@171@01))
      (not (< j@203@01 (Seq_length xs@171@01)))))))
(assert (or (>= j@203@01 0) (not (>= j@203@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@202@01 (Seq_length xs@171@01))
  (and
    (< k@202@01 (Seq_length xs@171@01))
    (=>
      (>= j@203@01 0)
      (and
        (>= j@203@01 0)
        (or
          (< j@203@01 (Seq_length xs@171@01))
          (not (< j@203@01 (Seq_length xs@171@01))))))
    (or (>= j@203@01 0) (not (>= j@203@01 0))))))
(assert (or
  (< k@202@01 (Seq_length xs@171@01))
  (not (< k@202@01 (Seq_length xs@171@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@202@01 0)
  (and
    (>= k@202@01 0)
    (=>
      (< k@202@01 (Seq_length xs@171@01))
      (and
        (< k@202@01 (Seq_length xs@171@01))
        (=>
          (>= j@203@01 0)
          (and
            (>= j@203@01 0)
            (or
              (< j@203@01 (Seq_length xs@171@01))
              (not (< j@203@01 (Seq_length xs@171@01))))))
        (or (>= j@203@01 0) (not (>= j@203@01 0)))))
    (or
      (< k@202@01 (Seq_length xs@171@01))
      (not (< k@202@01 (Seq_length xs@171@01)))))))
(assert (or (>= k@202@01 0) (not (>= k@202@01 0))))
(push) ; 4
; [then-branch: 99 | k@202@01 >= 0 && k@202@01 < |xs@171@01| && j@203@01 >= 0 && j@203@01 < |xs@171@01| && k@202@01 != j@203@01 | live]
; [else-branch: 99 | !(k@202@01 >= 0 && k@202@01 < |xs@171@01| && j@203@01 >= 0 && j@203@01 < |xs@171@01| && k@202@01 != j@203@01) | live]
(push) ; 5
; [then-branch: 99 | k@202@01 >= 0 && k@202@01 < |xs@171@01| && j@203@01 >= 0 && j@203@01 < |xs@171@01| && k@202@01 != j@203@01]
(assert (and
  (>= k@202@01 0)
  (and
    (< k@202@01 (Seq_length xs@171@01))
    (and
      (>= j@203@01 0)
      (and (< j@203@01 (Seq_length xs@171@01)) (not (= k@202@01 j@203@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 99 | !(k@202@01 >= 0 && k@202@01 < |xs@171@01| && j@203@01 >= 0 && j@203@01 < |xs@171@01| && k@202@01 != j@203@01)]
(assert (not
  (and
    (>= k@202@01 0)
    (and
      (< k@202@01 (Seq_length xs@171@01))
      (and
        (>= j@203@01 0)
        (and (< j@203@01 (Seq_length xs@171@01)) (not (= k@202@01 j@203@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@202@01 0)
    (and
      (< k@202@01 (Seq_length xs@171@01))
      (and
        (>= j@203@01 0)
        (and (< j@203@01 (Seq_length xs@171@01)) (not (= k@202@01 j@203@01))))))
  (and
    (>= k@202@01 0)
    (< k@202@01 (Seq_length xs@171@01))
    (>= j@203@01 0)
    (< j@203@01 (Seq_length xs@171@01))
    (not (= k@202@01 j@203@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@202@01 0)
      (and
        (< k@202@01 (Seq_length xs@171@01))
        (and
          (>= j@203@01 0)
          (and (< j@203@01 (Seq_length xs@171@01)) (not (= k@202@01 j@203@01)))))))
  (and
    (>= k@202@01 0)
    (and
      (< k@202@01 (Seq_length xs@171@01))
      (and
        (>= j@203@01 0)
        (and (< j@203@01 (Seq_length xs@171@01)) (not (= k@202@01 j@203@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@202@01 Int) (j@203@01 Int)) (!
  (and
    (=>
      (>= k@202@01 0)
      (and
        (>= k@202@01 0)
        (=>
          (< k@202@01 (Seq_length xs@171@01))
          (and
            (< k@202@01 (Seq_length xs@171@01))
            (=>
              (>= j@203@01 0)
              (and
                (>= j@203@01 0)
                (or
                  (< j@203@01 (Seq_length xs@171@01))
                  (not (< j@203@01 (Seq_length xs@171@01))))))
            (or (>= j@203@01 0) (not (>= j@203@01 0)))))
        (or
          (< k@202@01 (Seq_length xs@171@01))
          (not (< k@202@01 (Seq_length xs@171@01))))))
    (or (>= k@202@01 0) (not (>= k@202@01 0)))
    (=>
      (and
        (>= k@202@01 0)
        (and
          (< k@202@01 (Seq_length xs@171@01))
          (and
            (>= j@203@01 0)
            (and (< j@203@01 (Seq_length xs@171@01)) (not (= k@202@01 j@203@01))))))
      (and
        (>= k@202@01 0)
        (< k@202@01 (Seq_length xs@171@01))
        (>= j@203@01 0)
        (< j@203@01 (Seq_length xs@171@01))
        (not (= k@202@01 j@203@01))))
    (or
      (not
        (and
          (>= k@202@01 0)
          (and
            (< k@202@01 (Seq_length xs@171@01))
            (and
              (>= j@203@01 0)
              (and
                (< j@203@01 (Seq_length xs@171@01))
                (not (= k@202@01 j@203@01)))))))
      (and
        (>= k@202@01 0)
        (and
          (< k@202@01 (Seq_length xs@171@01))
          (and
            (>= j@203@01 0)
            (and (< j@203@01 (Seq_length xs@171@01)) (not (= k@202@01 j@203@01))))))))
  :pattern ((Seq_index xs@171@01 k@202@01) (Seq_index xs@171@01 j@203@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(assert (forall ((k@202@01 Int) (j@203@01 Int)) (!
  (=>
    (and
      (>= k@202@01 0)
      (and
        (< k@202@01 (Seq_length xs@171@01))
        (and
          (>= j@203@01 0)
          (and (< j@203@01 (Seq_length xs@171@01)) (not (= k@202@01 j@203@01))))))
    (not (= (Seq_index xs@171@01 k@202@01) (Seq_index xs@171@01 j@203@01))))
  :pattern ((Seq_index xs@171@01 k@202@01) (Seq_index xs@171@01 j@203@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(declare-const j@204@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 100 | !(0 <= j@204@01) | live]
; [else-branch: 100 | 0 <= j@204@01 | live]
(push) ; 5
; [then-branch: 100 | !(0 <= j@204@01)]
(assert (not (<= 0 j@204@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 100 | 0 <= j@204@01]
(assert (<= 0 j@204@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@204@01) (not (<= 0 j@204@01))))
(assert (and (<= 0 j@204@01) (< j@204@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@204@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@204@01 (Seq_length xs@171@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@205@01 ($Ref) Int)
(declare-fun img@206@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@204@01 Int)) (!
  (=>
    (and (<= 0 j@204@01) (< j@204@01 3))
    (or (<= 0 j@204@01) (not (<= 0 j@204@01))))
  :pattern ((Seq_index xs@171@01 j@204@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@204@01 Int) (j2@204@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@204@01) (< j1@204@01 3))
      (and (<= 0 j2@204@01) (< j2@204@01 3))
      (= (Seq_index xs@171@01 j1@204@01) (Seq_index xs@171@01 j2@204@01)))
    (= j1@204@01 j2@204@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@204@01 Int)) (!
  (=>
    (and (<= 0 j@204@01) (< j@204@01 3))
    (and
      (= (inv@205@01 (Seq_index xs@171@01 j@204@01)) j@204@01)
      (img@206@01 (Seq_index xs@171@01 j@204@01))))
  :pattern ((Seq_index xs@171@01 j@204@01))
  :qid |quant-u-182|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@206@01 r) (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) 3)))
    (= (Seq_index xs@171@01 (inv@205@01 r)) r))
  :pattern ((inv@205@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@204@01 Int)) (!
  (=>
    (and (<= 0 j@204@01) (< j@204@01 3))
    (not (= (Seq_index xs@171@01 j@204@01) $Ref.null)))
  :pattern ((Seq_index xs@171@01 j@204@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@207@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 101 | !(3 <= j@207@01) | live]
; [else-branch: 101 | 3 <= j@207@01 | live]
(push) ; 5
; [then-branch: 101 | !(3 <= j@207@01)]
(assert (not (<= 3 j@207@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 101 | 3 <= j@207@01]
(assert (<= 3 j@207@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@207@01) (not (<= 3 j@207@01))))
(assert (and (<= 3 j@207@01) (< j@207@01 n@172@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@207@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@207@01 (Seq_length xs@171@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@208@01 ($Ref) Int)
(declare-fun img@209@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@207@01 Int)) (!
  (=>
    (and (<= 3 j@207@01) (< j@207@01 n@172@01))
    (or (<= 3 j@207@01) (not (<= 3 j@207@01))))
  :pattern ((Seq_index xs@171@01 j@207@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@207@01 Int) (j2@207@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@207@01) (< j1@207@01 n@172@01))
      (and (<= 3 j2@207@01) (< j2@207@01 n@172@01))
      (= (Seq_index xs@171@01 j1@207@01) (Seq_index xs@171@01 j2@207@01)))
    (= j1@207@01 j2@207@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@207@01 Int)) (!
  (=>
    (and (<= 3 j@207@01) (< j@207@01 n@172@01))
    (and
      (= (inv@208@01 (Seq_index xs@171@01 j@207@01)) j@207@01)
      (img@209@01 (Seq_index xs@171@01 j@207@01))))
  :pattern ((Seq_index xs@171@01 j@207@01))
  :qid |quant-u-184|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@209@01 r) (and (<= 3 (inv@208@01 r)) (< (inv@208@01 r) n@172@01)))
    (= (Seq_index xs@171@01 (inv@208@01 r)) r))
  :pattern ((inv@208@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@207@01 Int)) (!
  (=>
    (and (<= 3 j@207@01) (< j@207@01 n@172@01))
    (not (= (Seq_index xs@171@01 j@207@01) $Ref.null)))
  :pattern ((Seq_index xs@171@01 j@207@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@171@01 j@207@01) (Seq_index xs@171@01 j@204@01))
    (=
      (and
        (img@209@01 r)
        (and (<= 3 (inv@208@01 r)) (< (inv@208@01 r) n@172@01)))
      (and (img@206@01 r) (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) 3)))))
  
  :qid |quant-u-185|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
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
    (= (Seq_index xs@171@01 j@204@01) (Seq_index xs@171@01 j@207@01))
    (=
      (and (img@206@01 r) (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) 3)))
      (and
        (img@209@01 r)
        (and (<= 3 (inv@208@01 r)) (< (inv@208@01 r) n@172@01)))))
  
  :qid |quant-u-186|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@210@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@206@01 r) (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) 3)))
    (=
      ($FVF.lookup_f (as sm@210@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@196@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@209@01 r) (and (<= 3 (inv@208@01 r)) (< (inv@208@01 r) n@172@01)))
    (=
      ($FVF.lookup_f (as sm@210@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@201@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@201@01  $FVF<f>) r))
  :qid |qp.fvfValDef94|)))
(declare-const pm@211@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@211@01  $FPM) r)
    (+
      (ite
        (and (img@206@01 r) (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@209@01 r)
          (and (<= 3 (inv@208@01 r)) (< (inv@208@01 r) n@172@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@211@01  $FPM) r))
  :qid |qp.resPrmSumDef95|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@211@01  $FPM) r) $Perm.Write)
  :pattern ((inv@205@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@211@01  $FPM) r) $Perm.Write)
  :pattern ((inv@208@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test06b ----------
(declare-const xs@212@01 Seq<$Ref>)
(declare-const n@213@01 Int)
(declare-const xs@214@01 Seq<$Ref>)
(declare-const n@215@01 Int)
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
; var v1: Int
(declare-const v1@216@01 Int)
; [exec]
; var v2: Int
(declare-const v2@217@01 Int)
; [exec]
; inhale acc(P02(xs, n), write)
(declare-const $t@218@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 6 < n
(declare-const $t@219@01 $Snap)
(assert (= $t@219@01 $Snap.unit))
; [eval] 6 < n
(assert (< 6 n@215@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(P02(xs, n), write)
(assert (= $t@218@01 ($Snap.combine ($Snap.first $t@218@01) ($Snap.second $t@218@01))))
(assert (= ($Snap.first $t@218@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@214@01) n@215@01))
(assert (=
  ($Snap.second $t@218@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@218@01))
    ($Snap.second ($Snap.second $t@218@01)))))
(assert (= ($Snap.first ($Snap.second $t@218@01)) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@215@01))
(assert (=
  ($Snap.second ($Snap.second $t@218@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@218@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@218@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@218@01))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@220@01 Int)
(declare-const j@221@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 102 | !(k@220@01 >= 0) | live]
; [else-branch: 102 | k@220@01 >= 0 | live]
(push) ; 5
; [then-branch: 102 | !(k@220@01 >= 0)]
(assert (not (>= k@220@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 102 | k@220@01 >= 0]
(assert (>= k@220@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 103 | !(k@220@01 < |xs@214@01|) | live]
; [else-branch: 103 | k@220@01 < |xs@214@01| | live]
(push) ; 7
; [then-branch: 103 | !(k@220@01 < |xs@214@01|)]
(assert (not (< k@220@01 (Seq_length xs@214@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 103 | k@220@01 < |xs@214@01|]
(assert (< k@220@01 (Seq_length xs@214@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 104 | !(j@221@01 >= 0) | live]
; [else-branch: 104 | j@221@01 >= 0 | live]
(push) ; 9
; [then-branch: 104 | !(j@221@01 >= 0)]
(assert (not (>= j@221@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 104 | j@221@01 >= 0]
(assert (>= j@221@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 105 | !(j@221@01 < |xs@214@01|) | live]
; [else-branch: 105 | j@221@01 < |xs@214@01| | live]
(push) ; 11
; [then-branch: 105 | !(j@221@01 < |xs@214@01|)]
(assert (not (< j@221@01 (Seq_length xs@214@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 105 | j@221@01 < |xs@214@01|]
(assert (< j@221@01 (Seq_length xs@214@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@221@01 (Seq_length xs@214@01))
  (not (< j@221@01 (Seq_length xs@214@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@221@01 0)
  (and
    (>= j@221@01 0)
    (or
      (< j@221@01 (Seq_length xs@214@01))
      (not (< j@221@01 (Seq_length xs@214@01)))))))
(assert (or (>= j@221@01 0) (not (>= j@221@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@220@01 (Seq_length xs@214@01))
  (and
    (< k@220@01 (Seq_length xs@214@01))
    (=>
      (>= j@221@01 0)
      (and
        (>= j@221@01 0)
        (or
          (< j@221@01 (Seq_length xs@214@01))
          (not (< j@221@01 (Seq_length xs@214@01))))))
    (or (>= j@221@01 0) (not (>= j@221@01 0))))))
(assert (or
  (< k@220@01 (Seq_length xs@214@01))
  (not (< k@220@01 (Seq_length xs@214@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@220@01 0)
  (and
    (>= k@220@01 0)
    (=>
      (< k@220@01 (Seq_length xs@214@01))
      (and
        (< k@220@01 (Seq_length xs@214@01))
        (=>
          (>= j@221@01 0)
          (and
            (>= j@221@01 0)
            (or
              (< j@221@01 (Seq_length xs@214@01))
              (not (< j@221@01 (Seq_length xs@214@01))))))
        (or (>= j@221@01 0) (not (>= j@221@01 0)))))
    (or
      (< k@220@01 (Seq_length xs@214@01))
      (not (< k@220@01 (Seq_length xs@214@01)))))))
(assert (or (>= k@220@01 0) (not (>= k@220@01 0))))
(push) ; 4
; [then-branch: 106 | k@220@01 >= 0 && k@220@01 < |xs@214@01| && j@221@01 >= 0 && j@221@01 < |xs@214@01| && k@220@01 != j@221@01 | live]
; [else-branch: 106 | !(k@220@01 >= 0 && k@220@01 < |xs@214@01| && j@221@01 >= 0 && j@221@01 < |xs@214@01| && k@220@01 != j@221@01) | live]
(push) ; 5
; [then-branch: 106 | k@220@01 >= 0 && k@220@01 < |xs@214@01| && j@221@01 >= 0 && j@221@01 < |xs@214@01| && k@220@01 != j@221@01]
(assert (and
  (>= k@220@01 0)
  (and
    (< k@220@01 (Seq_length xs@214@01))
    (and
      (>= j@221@01 0)
      (and (< j@221@01 (Seq_length xs@214@01)) (not (= k@220@01 j@221@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 106 | !(k@220@01 >= 0 && k@220@01 < |xs@214@01| && j@221@01 >= 0 && j@221@01 < |xs@214@01| && k@220@01 != j@221@01)]
(assert (not
  (and
    (>= k@220@01 0)
    (and
      (< k@220@01 (Seq_length xs@214@01))
      (and
        (>= j@221@01 0)
        (and (< j@221@01 (Seq_length xs@214@01)) (not (= k@220@01 j@221@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@220@01 0)
    (and
      (< k@220@01 (Seq_length xs@214@01))
      (and
        (>= j@221@01 0)
        (and (< j@221@01 (Seq_length xs@214@01)) (not (= k@220@01 j@221@01))))))
  (and
    (>= k@220@01 0)
    (< k@220@01 (Seq_length xs@214@01))
    (>= j@221@01 0)
    (< j@221@01 (Seq_length xs@214@01))
    (not (= k@220@01 j@221@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@220@01 0)
      (and
        (< k@220@01 (Seq_length xs@214@01))
        (and
          (>= j@221@01 0)
          (and (< j@221@01 (Seq_length xs@214@01)) (not (= k@220@01 j@221@01)))))))
  (and
    (>= k@220@01 0)
    (and
      (< k@220@01 (Seq_length xs@214@01))
      (and
        (>= j@221@01 0)
        (and (< j@221@01 (Seq_length xs@214@01)) (not (= k@220@01 j@221@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@220@01 Int) (j@221@01 Int)) (!
  (and
    (=>
      (>= k@220@01 0)
      (and
        (>= k@220@01 0)
        (=>
          (< k@220@01 (Seq_length xs@214@01))
          (and
            (< k@220@01 (Seq_length xs@214@01))
            (=>
              (>= j@221@01 0)
              (and
                (>= j@221@01 0)
                (or
                  (< j@221@01 (Seq_length xs@214@01))
                  (not (< j@221@01 (Seq_length xs@214@01))))))
            (or (>= j@221@01 0) (not (>= j@221@01 0)))))
        (or
          (< k@220@01 (Seq_length xs@214@01))
          (not (< k@220@01 (Seq_length xs@214@01))))))
    (or (>= k@220@01 0) (not (>= k@220@01 0)))
    (=>
      (and
        (>= k@220@01 0)
        (and
          (< k@220@01 (Seq_length xs@214@01))
          (and
            (>= j@221@01 0)
            (and (< j@221@01 (Seq_length xs@214@01)) (not (= k@220@01 j@221@01))))))
      (and
        (>= k@220@01 0)
        (< k@220@01 (Seq_length xs@214@01))
        (>= j@221@01 0)
        (< j@221@01 (Seq_length xs@214@01))
        (not (= k@220@01 j@221@01))))
    (or
      (not
        (and
          (>= k@220@01 0)
          (and
            (< k@220@01 (Seq_length xs@214@01))
            (and
              (>= j@221@01 0)
              (and
                (< j@221@01 (Seq_length xs@214@01))
                (not (= k@220@01 j@221@01)))))))
      (and
        (>= k@220@01 0)
        (and
          (< k@220@01 (Seq_length xs@214@01))
          (and
            (>= j@221@01 0)
            (and (< j@221@01 (Seq_length xs@214@01)) (not (= k@220@01 j@221@01))))))))
  :pattern ((Seq_index xs@214@01 k@220@01) (Seq_index xs@214@01 j@221@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(assert (forall ((k@220@01 Int) (j@221@01 Int)) (!
  (=>
    (and
      (>= k@220@01 0)
      (and
        (< k@220@01 (Seq_length xs@214@01))
        (and
          (>= j@221@01 0)
          (and (< j@221@01 (Seq_length xs@214@01)) (not (= k@220@01 j@221@01))))))
    (not (= (Seq_index xs@214@01 k@220@01) (Seq_index xs@214@01 j@221@01))))
  :pattern ((Seq_index xs@214@01 k@220@01) (Seq_index xs@214@01 j@221@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@218@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@218@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01)))))))
(declare-const j@222@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 107 | !(0 <= j@222@01) | live]
; [else-branch: 107 | 0 <= j@222@01 | live]
(push) ; 5
; [then-branch: 107 | !(0 <= j@222@01)]
(assert (not (<= 0 j@222@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 107 | 0 <= j@222@01]
(assert (<= 0 j@222@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@222@01) (not (<= 0 j@222@01))))
(assert (and (<= 0 j@222@01) (< j@222@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@222@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@222@01 (Seq_length xs@214@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@223@01 ($Ref) Int)
(declare-fun img@224@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@222@01 Int)) (!
  (=>
    (and (<= 0 j@222@01) (< j@222@01 3))
    (or (<= 0 j@222@01) (not (<= 0 j@222@01))))
  :pattern ((Seq_index xs@214@01 j@222@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@222@01 Int) (j2@222@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@222@01) (< j1@222@01 3))
      (and (<= 0 j2@222@01) (< j2@222@01 3))
      (= (Seq_index xs@214@01 j1@222@01) (Seq_index xs@214@01 j2@222@01)))
    (= j1@222@01 j2@222@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@222@01 Int)) (!
  (=>
    (and (<= 0 j@222@01) (< j@222@01 3))
    (and
      (= (inv@223@01 (Seq_index xs@214@01 j@222@01)) j@222@01)
      (img@224@01 (Seq_index xs@214@01 j@222@01))))
  :pattern ((Seq_index xs@214@01 j@222@01))
  :qid |quant-u-188|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@224@01 r) (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) 3)))
    (= (Seq_index xs@214@01 (inv@223@01 r)) r))
  :pattern ((inv@223@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@222@01 Int)) (!
  (=>
    (and (<= 0 j@222@01) (< j@222@01 3))
    (not (= (Seq_index xs@214@01 j@222@01) $Ref.null)))
  :pattern ((Seq_index xs@214@01 j@222@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@225@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 108 | !(3 <= j@225@01) | live]
; [else-branch: 108 | 3 <= j@225@01 | live]
(push) ; 5
; [then-branch: 108 | !(3 <= j@225@01)]
(assert (not (<= 3 j@225@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 108 | 3 <= j@225@01]
(assert (<= 3 j@225@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@225@01) (not (<= 3 j@225@01))))
(assert (and (<= 3 j@225@01) (< j@225@01 n@215@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@225@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@225@01 (Seq_length xs@214@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@226@01 ($Ref) Int)
(declare-fun img@227@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@225@01 Int)) (!
  (=>
    (and (<= 3 j@225@01) (< j@225@01 n@215@01))
    (or (<= 3 j@225@01) (not (<= 3 j@225@01))))
  :pattern ((Seq_index xs@214@01 j@225@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@225@01 Int) (j2@225@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@225@01) (< j1@225@01 n@215@01))
      (and (<= 3 j2@225@01) (< j2@225@01 n@215@01))
      (= (Seq_index xs@214@01 j1@225@01) (Seq_index xs@214@01 j2@225@01)))
    (= j1@225@01 j2@225@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@225@01 Int)) (!
  (=>
    (and (<= 3 j@225@01) (< j@225@01 n@215@01))
    (and
      (= (inv@226@01 (Seq_index xs@214@01 j@225@01)) j@225@01)
      (img@227@01 (Seq_index xs@214@01 j@225@01))))
  :pattern ((Seq_index xs@214@01 j@225@01))
  :qid |quant-u-190|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@227@01 r) (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01)))
    (= (Seq_index xs@214@01 (inv@226@01 r)) r))
  :pattern ((inv@226@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@225@01 Int)) (!
  (=>
    (and (<= 3 j@225@01) (< j@225@01 n@215@01))
    (not (= (Seq_index xs@214@01 j@225@01) $Ref.null)))
  :pattern ((Seq_index xs@214@01 j@225@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@214@01 j@225@01) (Seq_index xs@214@01 j@222@01))
    (=
      (and
        (img@227@01 r)
        (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01)))
      (and (img@224@01 r) (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) 3)))))
  
  :qid |quant-u-191|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P02%trigger $t@218@01 xs@214@01 n@215@01))
; [exec]
; v1 := xs[2].f
; [eval] xs[2]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 2 (Seq_length xs@214@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@228@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@224@01 r) (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) 3)))
    (=
      ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r))
  :qid |qp.fvfValDef96|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@227@01 r) (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01)))
    (=
      ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r))
  :qid |qp.fvfValDef97|)))
(declare-const pm@229@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@229@01  $FPM) r)
    (+
      (ite
        (and (img@224@01 r) (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@227@01 r)
          (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef98|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@229@01  $FPM) (Seq_index xs@214@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const v1@230@01 Int)
(assert (= v1@230@01 ($FVF.lookup_f (as sm@228@01  $FVF<f>) (Seq_index xs@214@01 2))))
; [exec]
; v2 := xs[1].f
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@214@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@224@01 r) (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) 3)))
      (=
        ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r))
    :qid |qp.fvfValDef96|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@227@01 r)
        (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01)))
      (=
        ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r))
    :qid |qp.fvfValDef97|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@224@01 (Seq_index xs@214@01 1))
        (and
          (<= 0 (inv@223@01 (Seq_index xs@214@01 1)))
          (< (inv@223@01 (Seq_index xs@214@01 1)) 3)))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@227@01 (Seq_index xs@214@01 1))
        (and
          (<= 3 (inv@226@01 (Seq_index xs@214@01 1)))
          (< (inv@226@01 (Seq_index xs@214@01 1)) n@215@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const v2@231@01 Int)
(assert (= v2@231@01 ($FVF.lookup_f (as sm@228@01  $FVF<f>) (Seq_index xs@214@01 1))))
; [exec]
; fold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@232@01 Int)
(declare-const j@233@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 109 | !(k@232@01 >= 0) | live]
; [else-branch: 109 | k@232@01 >= 0 | live]
(push) ; 5
; [then-branch: 109 | !(k@232@01 >= 0)]
(assert (not (>= k@232@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 109 | k@232@01 >= 0]
(assert (>= k@232@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 110 | !(k@232@01 < |xs@214@01|) | live]
; [else-branch: 110 | k@232@01 < |xs@214@01| | live]
(push) ; 7
; [then-branch: 110 | !(k@232@01 < |xs@214@01|)]
(assert (not (< k@232@01 (Seq_length xs@214@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 110 | k@232@01 < |xs@214@01|]
(assert (< k@232@01 (Seq_length xs@214@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 111 | !(j@233@01 >= 0) | live]
; [else-branch: 111 | j@233@01 >= 0 | live]
(push) ; 9
; [then-branch: 111 | !(j@233@01 >= 0)]
(assert (not (>= j@233@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 111 | j@233@01 >= 0]
(assert (>= j@233@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 112 | !(j@233@01 < |xs@214@01|) | live]
; [else-branch: 112 | j@233@01 < |xs@214@01| | live]
(push) ; 11
; [then-branch: 112 | !(j@233@01 < |xs@214@01|)]
(assert (not (< j@233@01 (Seq_length xs@214@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 112 | j@233@01 < |xs@214@01|]
(assert (< j@233@01 (Seq_length xs@214@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@233@01 (Seq_length xs@214@01))
  (not (< j@233@01 (Seq_length xs@214@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@233@01 0)
  (and
    (>= j@233@01 0)
    (or
      (< j@233@01 (Seq_length xs@214@01))
      (not (< j@233@01 (Seq_length xs@214@01)))))))
(assert (or (>= j@233@01 0) (not (>= j@233@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@232@01 (Seq_length xs@214@01))
  (and
    (< k@232@01 (Seq_length xs@214@01))
    (=>
      (>= j@233@01 0)
      (and
        (>= j@233@01 0)
        (or
          (< j@233@01 (Seq_length xs@214@01))
          (not (< j@233@01 (Seq_length xs@214@01))))))
    (or (>= j@233@01 0) (not (>= j@233@01 0))))))
(assert (or
  (< k@232@01 (Seq_length xs@214@01))
  (not (< k@232@01 (Seq_length xs@214@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@232@01 0)
  (and
    (>= k@232@01 0)
    (=>
      (< k@232@01 (Seq_length xs@214@01))
      (and
        (< k@232@01 (Seq_length xs@214@01))
        (=>
          (>= j@233@01 0)
          (and
            (>= j@233@01 0)
            (or
              (< j@233@01 (Seq_length xs@214@01))
              (not (< j@233@01 (Seq_length xs@214@01))))))
        (or (>= j@233@01 0) (not (>= j@233@01 0)))))
    (or
      (< k@232@01 (Seq_length xs@214@01))
      (not (< k@232@01 (Seq_length xs@214@01)))))))
(assert (or (>= k@232@01 0) (not (>= k@232@01 0))))
(push) ; 4
; [then-branch: 113 | k@232@01 >= 0 && k@232@01 < |xs@214@01| && j@233@01 >= 0 && j@233@01 < |xs@214@01| && k@232@01 != j@233@01 | live]
; [else-branch: 113 | !(k@232@01 >= 0 && k@232@01 < |xs@214@01| && j@233@01 >= 0 && j@233@01 < |xs@214@01| && k@232@01 != j@233@01) | live]
(push) ; 5
; [then-branch: 113 | k@232@01 >= 0 && k@232@01 < |xs@214@01| && j@233@01 >= 0 && j@233@01 < |xs@214@01| && k@232@01 != j@233@01]
(assert (and
  (>= k@232@01 0)
  (and
    (< k@232@01 (Seq_length xs@214@01))
    (and
      (>= j@233@01 0)
      (and (< j@233@01 (Seq_length xs@214@01)) (not (= k@232@01 j@233@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 113 | !(k@232@01 >= 0 && k@232@01 < |xs@214@01| && j@233@01 >= 0 && j@233@01 < |xs@214@01| && k@232@01 != j@233@01)]
(assert (not
  (and
    (>= k@232@01 0)
    (and
      (< k@232@01 (Seq_length xs@214@01))
      (and
        (>= j@233@01 0)
        (and (< j@233@01 (Seq_length xs@214@01)) (not (= k@232@01 j@233@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@232@01 0)
    (and
      (< k@232@01 (Seq_length xs@214@01))
      (and
        (>= j@233@01 0)
        (and (< j@233@01 (Seq_length xs@214@01)) (not (= k@232@01 j@233@01))))))
  (and
    (>= k@232@01 0)
    (< k@232@01 (Seq_length xs@214@01))
    (>= j@233@01 0)
    (< j@233@01 (Seq_length xs@214@01))
    (not (= k@232@01 j@233@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@232@01 0)
      (and
        (< k@232@01 (Seq_length xs@214@01))
        (and
          (>= j@233@01 0)
          (and (< j@233@01 (Seq_length xs@214@01)) (not (= k@232@01 j@233@01)))))))
  (and
    (>= k@232@01 0)
    (and
      (< k@232@01 (Seq_length xs@214@01))
      (and
        (>= j@233@01 0)
        (and (< j@233@01 (Seq_length xs@214@01)) (not (= k@232@01 j@233@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@232@01 Int) (j@233@01 Int)) (!
  (and
    (=>
      (>= k@232@01 0)
      (and
        (>= k@232@01 0)
        (=>
          (< k@232@01 (Seq_length xs@214@01))
          (and
            (< k@232@01 (Seq_length xs@214@01))
            (=>
              (>= j@233@01 0)
              (and
                (>= j@233@01 0)
                (or
                  (< j@233@01 (Seq_length xs@214@01))
                  (not (< j@233@01 (Seq_length xs@214@01))))))
            (or (>= j@233@01 0) (not (>= j@233@01 0)))))
        (or
          (< k@232@01 (Seq_length xs@214@01))
          (not (< k@232@01 (Seq_length xs@214@01))))))
    (or (>= k@232@01 0) (not (>= k@232@01 0)))
    (=>
      (and
        (>= k@232@01 0)
        (and
          (< k@232@01 (Seq_length xs@214@01))
          (and
            (>= j@233@01 0)
            (and (< j@233@01 (Seq_length xs@214@01)) (not (= k@232@01 j@233@01))))))
      (and
        (>= k@232@01 0)
        (< k@232@01 (Seq_length xs@214@01))
        (>= j@233@01 0)
        (< j@233@01 (Seq_length xs@214@01))
        (not (= k@232@01 j@233@01))))
    (or
      (not
        (and
          (>= k@232@01 0)
          (and
            (< k@232@01 (Seq_length xs@214@01))
            (and
              (>= j@233@01 0)
              (and
                (< j@233@01 (Seq_length xs@214@01))
                (not (= k@232@01 j@233@01)))))))
      (and
        (>= k@232@01 0)
        (and
          (< k@232@01 (Seq_length xs@214@01))
          (and
            (>= j@233@01 0)
            (and (< j@233@01 (Seq_length xs@214@01)) (not (= k@232@01 j@233@01))))))))
  :pattern ((Seq_index xs@214@01 k@232@01) (Seq_index xs@214@01 j@233@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(push) ; 3
(assert (not (forall ((k@232@01 Int) (j@233@01 Int)) (!
  (=>
    (and
      (>= k@232@01 0)
      (and
        (< k@232@01 (Seq_length xs@214@01))
        (and
          (>= j@233@01 0)
          (and (< j@233@01 (Seq_length xs@214@01)) (not (= k@232@01 j@233@01))))))
    (not (= (Seq_index xs@214@01 k@232@01) (Seq_index xs@214@01 j@233@01))))
  :pattern ((Seq_index xs@214@01 k@232@01) (Seq_index xs@214@01 j@233@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@232@01 Int) (j@233@01 Int)) (!
  (=>
    (and
      (>= k@232@01 0)
      (and
        (< k@232@01 (Seq_length xs@214@01))
        (and
          (>= j@233@01 0)
          (and (< j@233@01 (Seq_length xs@214@01)) (not (= k@232@01 j@233@01))))))
    (not (= (Seq_index xs@214@01 k@232@01) (Seq_index xs@214@01 j@233@01))))
  :pattern ((Seq_index xs@214@01 k@232@01) (Seq_index xs@214@01 j@233@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(declare-const j@234@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 114 | !(0 <= j@234@01) | live]
; [else-branch: 114 | 0 <= j@234@01 | live]
(push) ; 5
; [then-branch: 114 | !(0 <= j@234@01)]
(assert (not (<= 0 j@234@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 114 | 0 <= j@234@01]
(assert (<= 0 j@234@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@234@01) (not (<= 0 j@234@01))))
(assert (and (<= 0 j@234@01) (< j@234@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@234@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@234@01 (Seq_length xs@214@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@235@01 ($Ref) Int)
(declare-fun img@236@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@234@01 Int)) (!
  (=>
    (and (<= 0 j@234@01) (< j@234@01 3))
    (or (<= 0 j@234@01) (not (<= 0 j@234@01))))
  :pattern ((Seq_index xs@214@01 j@234@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@234@01 Int) (j2@234@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@234@01) (< j1@234@01 3))
      (and (<= 0 j2@234@01) (< j2@234@01 3))
      (= (Seq_index xs@214@01 j1@234@01) (Seq_index xs@214@01 j2@234@01)))
    (= j1@234@01 j2@234@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@234@01 Int)) (!
  (=>
    (and (<= 0 j@234@01) (< j@234@01 3))
    (and
      (= (inv@235@01 (Seq_index xs@214@01 j@234@01)) j@234@01)
      (img@236@01 (Seq_index xs@214@01 j@234@01))))
  :pattern ((Seq_index xs@214@01 j@234@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@236@01 r) (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) 3)))
    (= (Seq_index xs@214@01 (inv@235@01 r)) r))
  :pattern ((inv@235@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@237@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) 3))
      (img@236@01 r)
      (= r (Seq_index xs@214@01 (inv@235@01 r))))
    ($Perm.min
      (ite
        (and (img@224@01 r) (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@238@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) 3))
      (img@236@01 r)
      (= r (Seq_index xs@214@01 (inv@235@01 r))))
    ($Perm.min
      (ite
        (and
          (img@227@01 r)
          (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@237@01 r)))
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
        (and (img@224@01 r) (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@237@01 r))
    $Perm.No)
  
  :qid |quant-u-194|))))
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
      (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) 3))
      (img@236@01 r)
      (= r (Seq_index xs@214@01 (inv@235@01 r))))
    (= (- $Perm.Write (pTaken@237@01 r)) $Perm.No))
  
  :qid |quant-u-195|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@239@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@239@01  $FVF<f>)))
      (and (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) 3)) (img@236@01 r)))
    (=>
      (and (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) 3)) (img@236@01 r))
      (Set_in r ($FVF.domain_f (as sm@239@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@239@01  $FVF<f>))))
  :qid |qp.fvfDomDef101|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) 3)) (img@236@01 r))
      (and (img@224@01 r) (and (<= 0 (inv@223@01 r)) (< (inv@223@01 r) 3))))
    (=
      ($FVF.lookup_f (as sm@239@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@239@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@235@01 r)) (< (inv@235@01 r) 3)) (img@236@01 r))
      (and
        (img@227@01 r)
        (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01))))
    (=
      ($FVF.lookup_f (as sm@239@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@239@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r))
  :qid |qp.fvfValDef100|)))
(declare-const j@240@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 115 | !(3 <= j@240@01) | live]
; [else-branch: 115 | 3 <= j@240@01 | live]
(push) ; 5
; [then-branch: 115 | !(3 <= j@240@01)]
(assert (not (<= 3 j@240@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 115 | 3 <= j@240@01]
(assert (<= 3 j@240@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@240@01) (not (<= 3 j@240@01))))
(assert (and (<= 3 j@240@01) (< j@240@01 n@215@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@240@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@240@01 (Seq_length xs@214@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@241@01 ($Ref) Int)
(declare-fun img@242@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@240@01 Int)) (!
  (=>
    (and (<= 3 j@240@01) (< j@240@01 n@215@01))
    (or (<= 3 j@240@01) (not (<= 3 j@240@01))))
  :pattern ((Seq_index xs@214@01 j@240@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@240@01 Int) (j2@240@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@240@01) (< j1@240@01 n@215@01))
      (and (<= 3 j2@240@01) (< j2@240@01 n@215@01))
      (= (Seq_index xs@214@01 j1@240@01) (Seq_index xs@214@01 j2@240@01)))
    (= j1@240@01 j2@240@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@240@01 Int)) (!
  (=>
    (and (<= 3 j@240@01) (< j@240@01 n@215@01))
    (and
      (= (inv@241@01 (Seq_index xs@214@01 j@240@01)) j@240@01)
      (img@242@01 (Seq_index xs@214@01 j@240@01))))
  :pattern ((Seq_index xs@214@01 j@240@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@242@01 r) (and (<= 3 (inv@241@01 r)) (< (inv@241@01 r) n@215@01)))
    (= (Seq_index xs@214@01 (inv@241@01 r)) r))
  :pattern ((inv@241@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@243@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@241@01 r)) (< (inv@241@01 r) n@215@01))
      (img@242@01 r)
      (= r (Seq_index xs@214@01 (inv@241@01 r))))
    ($Perm.min
      (ite
        (and
          (img@227@01 r)
          (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01)))
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
          (img@227@01 r)
          (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@243@01 r))
    $Perm.No)
  
  :qid |quant-u-198|))))
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
      (and (<= 3 (inv@241@01 r)) (< (inv@241@01 r) n@215@01))
      (img@242@01 r)
      (= r (Seq_index xs@214@01 (inv@241@01 r))))
    (= (- $Perm.Write (pTaken@243@01 r)) $Perm.No))
  
  :qid |quant-u-199|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@244@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@244@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@241@01 r)) (< (inv@241@01 r) n@215@01))
        (img@242@01 r)))
    (=>
      (and
        (and (<= 3 (inv@241@01 r)) (< (inv@241@01 r) n@215@01))
        (img@242@01 r))
      (Set_in r ($FVF.domain_f (as sm@244@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@244@01  $FVF<f>))))
  :qid |qp.fvfDomDef103|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@241@01 r)) (< (inv@241@01 r) n@215@01))
        (img@242@01 r))
      (and
        (img@227@01 r)
        (and (<= 3 (inv@226@01 r)) (< (inv@226@01 r) n@215@01))))
    (=
      ($FVF.lookup_f (as sm@244@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@244@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01))))) r))
  :qid |qp.fvfValDef102|)))
(assert (P02%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@239@01  $FVF<f>))
        ($SortWrappers.$FVF<f>To$Snap (as sm@244@01  $FVF<f>)))))) xs@214@01 n@215@01))
; [exec]
; unfold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@245@01 Int)
(declare-const j@246@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 116 | !(k@245@01 >= 0) | live]
; [else-branch: 116 | k@245@01 >= 0 | live]
(push) ; 5
; [then-branch: 116 | !(k@245@01 >= 0)]
(assert (not (>= k@245@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 116 | k@245@01 >= 0]
(assert (>= k@245@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 117 | !(k@245@01 < |xs@214@01|) | live]
; [else-branch: 117 | k@245@01 < |xs@214@01| | live]
(push) ; 7
; [then-branch: 117 | !(k@245@01 < |xs@214@01|)]
(assert (not (< k@245@01 (Seq_length xs@214@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 117 | k@245@01 < |xs@214@01|]
(assert (< k@245@01 (Seq_length xs@214@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 118 | !(j@246@01 >= 0) | live]
; [else-branch: 118 | j@246@01 >= 0 | live]
(push) ; 9
; [then-branch: 118 | !(j@246@01 >= 0)]
(assert (not (>= j@246@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 118 | j@246@01 >= 0]
(assert (>= j@246@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 119 | !(j@246@01 < |xs@214@01|) | live]
; [else-branch: 119 | j@246@01 < |xs@214@01| | live]
(push) ; 11
; [then-branch: 119 | !(j@246@01 < |xs@214@01|)]
(assert (not (< j@246@01 (Seq_length xs@214@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 119 | j@246@01 < |xs@214@01|]
(assert (< j@246@01 (Seq_length xs@214@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@246@01 (Seq_length xs@214@01))
  (not (< j@246@01 (Seq_length xs@214@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@246@01 0)
  (and
    (>= j@246@01 0)
    (or
      (< j@246@01 (Seq_length xs@214@01))
      (not (< j@246@01 (Seq_length xs@214@01)))))))
(assert (or (>= j@246@01 0) (not (>= j@246@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@245@01 (Seq_length xs@214@01))
  (and
    (< k@245@01 (Seq_length xs@214@01))
    (=>
      (>= j@246@01 0)
      (and
        (>= j@246@01 0)
        (or
          (< j@246@01 (Seq_length xs@214@01))
          (not (< j@246@01 (Seq_length xs@214@01))))))
    (or (>= j@246@01 0) (not (>= j@246@01 0))))))
(assert (or
  (< k@245@01 (Seq_length xs@214@01))
  (not (< k@245@01 (Seq_length xs@214@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@245@01 0)
  (and
    (>= k@245@01 0)
    (=>
      (< k@245@01 (Seq_length xs@214@01))
      (and
        (< k@245@01 (Seq_length xs@214@01))
        (=>
          (>= j@246@01 0)
          (and
            (>= j@246@01 0)
            (or
              (< j@246@01 (Seq_length xs@214@01))
              (not (< j@246@01 (Seq_length xs@214@01))))))
        (or (>= j@246@01 0) (not (>= j@246@01 0)))))
    (or
      (< k@245@01 (Seq_length xs@214@01))
      (not (< k@245@01 (Seq_length xs@214@01)))))))
(assert (or (>= k@245@01 0) (not (>= k@245@01 0))))
(push) ; 4
; [then-branch: 120 | k@245@01 >= 0 && k@245@01 < |xs@214@01| && j@246@01 >= 0 && j@246@01 < |xs@214@01| && k@245@01 != j@246@01 | live]
; [else-branch: 120 | !(k@245@01 >= 0 && k@245@01 < |xs@214@01| && j@246@01 >= 0 && j@246@01 < |xs@214@01| && k@245@01 != j@246@01) | live]
(push) ; 5
; [then-branch: 120 | k@245@01 >= 0 && k@245@01 < |xs@214@01| && j@246@01 >= 0 && j@246@01 < |xs@214@01| && k@245@01 != j@246@01]
(assert (and
  (>= k@245@01 0)
  (and
    (< k@245@01 (Seq_length xs@214@01))
    (and
      (>= j@246@01 0)
      (and (< j@246@01 (Seq_length xs@214@01)) (not (= k@245@01 j@246@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 120 | !(k@245@01 >= 0 && k@245@01 < |xs@214@01| && j@246@01 >= 0 && j@246@01 < |xs@214@01| && k@245@01 != j@246@01)]
(assert (not
  (and
    (>= k@245@01 0)
    (and
      (< k@245@01 (Seq_length xs@214@01))
      (and
        (>= j@246@01 0)
        (and (< j@246@01 (Seq_length xs@214@01)) (not (= k@245@01 j@246@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@245@01 0)
    (and
      (< k@245@01 (Seq_length xs@214@01))
      (and
        (>= j@246@01 0)
        (and (< j@246@01 (Seq_length xs@214@01)) (not (= k@245@01 j@246@01))))))
  (and
    (>= k@245@01 0)
    (< k@245@01 (Seq_length xs@214@01))
    (>= j@246@01 0)
    (< j@246@01 (Seq_length xs@214@01))
    (not (= k@245@01 j@246@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@245@01 0)
      (and
        (< k@245@01 (Seq_length xs@214@01))
        (and
          (>= j@246@01 0)
          (and (< j@246@01 (Seq_length xs@214@01)) (not (= k@245@01 j@246@01)))))))
  (and
    (>= k@245@01 0)
    (and
      (< k@245@01 (Seq_length xs@214@01))
      (and
        (>= j@246@01 0)
        (and (< j@246@01 (Seq_length xs@214@01)) (not (= k@245@01 j@246@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@245@01 Int) (j@246@01 Int)) (!
  (and
    (=>
      (>= k@245@01 0)
      (and
        (>= k@245@01 0)
        (=>
          (< k@245@01 (Seq_length xs@214@01))
          (and
            (< k@245@01 (Seq_length xs@214@01))
            (=>
              (>= j@246@01 0)
              (and
                (>= j@246@01 0)
                (or
                  (< j@246@01 (Seq_length xs@214@01))
                  (not (< j@246@01 (Seq_length xs@214@01))))))
            (or (>= j@246@01 0) (not (>= j@246@01 0)))))
        (or
          (< k@245@01 (Seq_length xs@214@01))
          (not (< k@245@01 (Seq_length xs@214@01))))))
    (or (>= k@245@01 0) (not (>= k@245@01 0)))
    (=>
      (and
        (>= k@245@01 0)
        (and
          (< k@245@01 (Seq_length xs@214@01))
          (and
            (>= j@246@01 0)
            (and (< j@246@01 (Seq_length xs@214@01)) (not (= k@245@01 j@246@01))))))
      (and
        (>= k@245@01 0)
        (< k@245@01 (Seq_length xs@214@01))
        (>= j@246@01 0)
        (< j@246@01 (Seq_length xs@214@01))
        (not (= k@245@01 j@246@01))))
    (or
      (not
        (and
          (>= k@245@01 0)
          (and
            (< k@245@01 (Seq_length xs@214@01))
            (and
              (>= j@246@01 0)
              (and
                (< j@246@01 (Seq_length xs@214@01))
                (not (= k@245@01 j@246@01)))))))
      (and
        (>= k@245@01 0)
        (and
          (< k@245@01 (Seq_length xs@214@01))
          (and
            (>= j@246@01 0)
            (and (< j@246@01 (Seq_length xs@214@01)) (not (= k@245@01 j@246@01))))))))
  :pattern ((Seq_index xs@214@01 k@245@01) (Seq_index xs@214@01 j@246@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(assert (forall ((k@245@01 Int) (j@246@01 Int)) (!
  (=>
    (and
      (>= k@245@01 0)
      (and
        (< k@245@01 (Seq_length xs@214@01))
        (and
          (>= j@246@01 0)
          (and (< j@246@01 (Seq_length xs@214@01)) (not (= k@245@01 j@246@01))))))
    (not (= (Seq_index xs@214@01 k@245@01) (Seq_index xs@214@01 j@246@01))))
  :pattern ((Seq_index xs@214@01 k@245@01) (Seq_index xs@214@01 j@246@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(declare-const j@247@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 121 | !(0 <= j@247@01) | live]
; [else-branch: 121 | 0 <= j@247@01 | live]
(push) ; 5
; [then-branch: 121 | !(0 <= j@247@01)]
(assert (not (<= 0 j@247@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 121 | 0 <= j@247@01]
(assert (<= 0 j@247@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@247@01) (not (<= 0 j@247@01))))
(assert (and (<= 0 j@247@01) (< j@247@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@247@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@247@01 (Seq_length xs@214@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@248@01 ($Ref) Int)
(declare-fun img@249@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@247@01 Int)) (!
  (=>
    (and (<= 0 j@247@01) (< j@247@01 3))
    (or (<= 0 j@247@01) (not (<= 0 j@247@01))))
  :pattern ((Seq_index xs@214@01 j@247@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@247@01 Int) (j2@247@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@247@01) (< j1@247@01 3))
      (and (<= 0 j2@247@01) (< j2@247@01 3))
      (= (Seq_index xs@214@01 j1@247@01) (Seq_index xs@214@01 j2@247@01)))
    (= j1@247@01 j2@247@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@247@01 Int)) (!
  (=>
    (and (<= 0 j@247@01) (< j@247@01 3))
    (and
      (= (inv@248@01 (Seq_index xs@214@01 j@247@01)) j@247@01)
      (img@249@01 (Seq_index xs@214@01 j@247@01))))
  :pattern ((Seq_index xs@214@01 j@247@01))
  :qid |quant-u-201|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@249@01 r) (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) 3)))
    (= (Seq_index xs@214@01 (inv@248@01 r)) r))
  :pattern ((inv@248@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@247@01 Int)) (!
  (=>
    (and (<= 0 j@247@01) (< j@247@01 3))
    (not (= (Seq_index xs@214@01 j@247@01) $Ref.null)))
  :pattern ((Seq_index xs@214@01 j@247@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@250@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 122 | !(3 <= j@250@01) | live]
; [else-branch: 122 | 3 <= j@250@01 | live]
(push) ; 5
; [then-branch: 122 | !(3 <= j@250@01)]
(assert (not (<= 3 j@250@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 122 | 3 <= j@250@01]
(assert (<= 3 j@250@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@250@01) (not (<= 3 j@250@01))))
(assert (and (<= 3 j@250@01) (< j@250@01 n@215@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@250@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@250@01 (Seq_length xs@214@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@251@01 ($Ref) Int)
(declare-fun img@252@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@250@01 Int)) (!
  (=>
    (and (<= 3 j@250@01) (< j@250@01 n@215@01))
    (or (<= 3 j@250@01) (not (<= 3 j@250@01))))
  :pattern ((Seq_index xs@214@01 j@250@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@250@01 Int) (j2@250@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@250@01) (< j1@250@01 n@215@01))
      (and (<= 3 j2@250@01) (< j2@250@01 n@215@01))
      (= (Seq_index xs@214@01 j1@250@01) (Seq_index xs@214@01 j2@250@01)))
    (= j1@250@01 j2@250@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@250@01 Int)) (!
  (=>
    (and (<= 3 j@250@01) (< j@250@01 n@215@01))
    (and
      (= (inv@251@01 (Seq_index xs@214@01 j@250@01)) j@250@01)
      (img@252@01 (Seq_index xs@214@01 j@250@01))))
  :pattern ((Seq_index xs@214@01 j@250@01))
  :qid |quant-u-203|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@252@01 r) (and (<= 3 (inv@251@01 r)) (< (inv@251@01 r) n@215@01)))
    (= (Seq_index xs@214@01 (inv@251@01 r)) r))
  :pattern ((inv@251@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@250@01 Int)) (!
  (=>
    (and (<= 3 j@250@01) (< j@250@01 n@215@01))
    (not (= (Seq_index xs@214@01 j@250@01) $Ref.null)))
  :pattern ((Seq_index xs@214@01 j@250@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@214@01 j@250@01) (Seq_index xs@214@01 j@247@01))
    (=
      (and
        (img@252@01 r)
        (and (<= 3 (inv@251@01 r)) (< (inv@251@01 r) n@215@01)))
      (and (img@249@01 r) (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) 3)))))
  
  :qid |quant-u-204|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
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
    (= (Seq_index xs@214@01 j@247@01) (Seq_index xs@214@01 j@250@01))
    (=
      (and (img@249@01 r) (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) 3)))
      (and
        (img@252@01 r)
        (and (<= 3 (inv@251@01 r)) (< (inv@251@01 r) n@215@01)))))
  
  :qid |quant-u-205|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@253@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@249@01 r) (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) 3)))
    (=
      ($FVF.lookup_f (as sm@253@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@239@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@253@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@239@01  $FVF<f>) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@252@01 r) (and (<= 3 (inv@251@01 r)) (< (inv@251@01 r) n@215@01)))
    (=
      ($FVF.lookup_f (as sm@253@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@244@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@253@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@244@01  $FVF<f>) r))
  :qid |qp.fvfValDef105|)))
(declare-const pm@254@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@254@01  $FPM) r)
    (+
      (ite
        (and (img@249@01 r) (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@252@01 r)
          (and (<= 3 (inv@251@01 r)) (< (inv@251@01 r) n@215@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@254@01  $FPM) r))
  :qid |qp.resPrmSumDef106|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@254@01  $FPM) r) $Perm.Write)
  :pattern ((inv@248@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@254@01  $FPM) r) $Perm.Write)
  :pattern ((inv@251@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const xs@255@01 Seq<$Ref>)
(declare-const n@256@01 Int)
(declare-const i@257@01 Int)
(declare-const xs@258@01 Seq<$Ref>)
(declare-const n@259@01 Int)
(declare-const i@260@01 Int)
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
; var v1: Int
(declare-const v1@261@01 Int)
; [exec]
; var v2: Int
(declare-const v2@262@01 Int)
; [exec]
; inhale acc(P02(xs, n), write)
(declare-const $t@263@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 6 < n
(declare-const $t@264@01 $Snap)
(assert (= $t@264@01 $Snap.unit))
; [eval] 6 < n
(assert (< 6 n@259@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale i == 4
(declare-const $t@265@01 $Snap)
(assert (= $t@265@01 $Snap.unit))
; [eval] i == 4
(assert (= i@260@01 4))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(P02(xs, n), write)
(assert (= $t@263@01 ($Snap.combine ($Snap.first $t@263@01) ($Snap.second $t@263@01))))
(assert (= ($Snap.first $t@263@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@258@01) n@259@01))
(assert (=
  ($Snap.second $t@263@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@263@01))
    ($Snap.second ($Snap.second $t@263@01)))))
(assert (= ($Snap.first ($Snap.second $t@263@01)) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@259@01))
(assert (=
  ($Snap.second ($Snap.second $t@263@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@263@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@263@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@263@01))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@266@01 Int)
(declare-const j@267@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 123 | !(k@266@01 >= 0) | live]
; [else-branch: 123 | k@266@01 >= 0 | live]
(push) ; 5
; [then-branch: 123 | !(k@266@01 >= 0)]
(assert (not (>= k@266@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 123 | k@266@01 >= 0]
(assert (>= k@266@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 124 | !(k@266@01 < |xs@258@01|) | live]
; [else-branch: 124 | k@266@01 < |xs@258@01| | live]
(push) ; 7
; [then-branch: 124 | !(k@266@01 < |xs@258@01|)]
(assert (not (< k@266@01 (Seq_length xs@258@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 124 | k@266@01 < |xs@258@01|]
(assert (< k@266@01 (Seq_length xs@258@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 125 | !(j@267@01 >= 0) | live]
; [else-branch: 125 | j@267@01 >= 0 | live]
(push) ; 9
; [then-branch: 125 | !(j@267@01 >= 0)]
(assert (not (>= j@267@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 125 | j@267@01 >= 0]
(assert (>= j@267@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 126 | !(j@267@01 < |xs@258@01|) | live]
; [else-branch: 126 | j@267@01 < |xs@258@01| | live]
(push) ; 11
; [then-branch: 126 | !(j@267@01 < |xs@258@01|)]
(assert (not (< j@267@01 (Seq_length xs@258@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 126 | j@267@01 < |xs@258@01|]
(assert (< j@267@01 (Seq_length xs@258@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@267@01 (Seq_length xs@258@01))
  (not (< j@267@01 (Seq_length xs@258@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@267@01 0)
  (and
    (>= j@267@01 0)
    (or
      (< j@267@01 (Seq_length xs@258@01))
      (not (< j@267@01 (Seq_length xs@258@01)))))))
(assert (or (>= j@267@01 0) (not (>= j@267@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@266@01 (Seq_length xs@258@01))
  (and
    (< k@266@01 (Seq_length xs@258@01))
    (=>
      (>= j@267@01 0)
      (and
        (>= j@267@01 0)
        (or
          (< j@267@01 (Seq_length xs@258@01))
          (not (< j@267@01 (Seq_length xs@258@01))))))
    (or (>= j@267@01 0) (not (>= j@267@01 0))))))
(assert (or
  (< k@266@01 (Seq_length xs@258@01))
  (not (< k@266@01 (Seq_length xs@258@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@266@01 0)
  (and
    (>= k@266@01 0)
    (=>
      (< k@266@01 (Seq_length xs@258@01))
      (and
        (< k@266@01 (Seq_length xs@258@01))
        (=>
          (>= j@267@01 0)
          (and
            (>= j@267@01 0)
            (or
              (< j@267@01 (Seq_length xs@258@01))
              (not (< j@267@01 (Seq_length xs@258@01))))))
        (or (>= j@267@01 0) (not (>= j@267@01 0)))))
    (or
      (< k@266@01 (Seq_length xs@258@01))
      (not (< k@266@01 (Seq_length xs@258@01)))))))
(assert (or (>= k@266@01 0) (not (>= k@266@01 0))))
(push) ; 4
; [then-branch: 127 | k@266@01 >= 0 && k@266@01 < |xs@258@01| && j@267@01 >= 0 && j@267@01 < |xs@258@01| && k@266@01 != j@267@01 | live]
; [else-branch: 127 | !(k@266@01 >= 0 && k@266@01 < |xs@258@01| && j@267@01 >= 0 && j@267@01 < |xs@258@01| && k@266@01 != j@267@01) | live]
(push) ; 5
; [then-branch: 127 | k@266@01 >= 0 && k@266@01 < |xs@258@01| && j@267@01 >= 0 && j@267@01 < |xs@258@01| && k@266@01 != j@267@01]
(assert (and
  (>= k@266@01 0)
  (and
    (< k@266@01 (Seq_length xs@258@01))
    (and
      (>= j@267@01 0)
      (and (< j@267@01 (Seq_length xs@258@01)) (not (= k@266@01 j@267@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 127 | !(k@266@01 >= 0 && k@266@01 < |xs@258@01| && j@267@01 >= 0 && j@267@01 < |xs@258@01| && k@266@01 != j@267@01)]
(assert (not
  (and
    (>= k@266@01 0)
    (and
      (< k@266@01 (Seq_length xs@258@01))
      (and
        (>= j@267@01 0)
        (and (< j@267@01 (Seq_length xs@258@01)) (not (= k@266@01 j@267@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@266@01 0)
    (and
      (< k@266@01 (Seq_length xs@258@01))
      (and
        (>= j@267@01 0)
        (and (< j@267@01 (Seq_length xs@258@01)) (not (= k@266@01 j@267@01))))))
  (and
    (>= k@266@01 0)
    (< k@266@01 (Seq_length xs@258@01))
    (>= j@267@01 0)
    (< j@267@01 (Seq_length xs@258@01))
    (not (= k@266@01 j@267@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@266@01 0)
      (and
        (< k@266@01 (Seq_length xs@258@01))
        (and
          (>= j@267@01 0)
          (and (< j@267@01 (Seq_length xs@258@01)) (not (= k@266@01 j@267@01)))))))
  (and
    (>= k@266@01 0)
    (and
      (< k@266@01 (Seq_length xs@258@01))
      (and
        (>= j@267@01 0)
        (and (< j@267@01 (Seq_length xs@258@01)) (not (= k@266@01 j@267@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@266@01 Int) (j@267@01 Int)) (!
  (and
    (=>
      (>= k@266@01 0)
      (and
        (>= k@266@01 0)
        (=>
          (< k@266@01 (Seq_length xs@258@01))
          (and
            (< k@266@01 (Seq_length xs@258@01))
            (=>
              (>= j@267@01 0)
              (and
                (>= j@267@01 0)
                (or
                  (< j@267@01 (Seq_length xs@258@01))
                  (not (< j@267@01 (Seq_length xs@258@01))))))
            (or (>= j@267@01 0) (not (>= j@267@01 0)))))
        (or
          (< k@266@01 (Seq_length xs@258@01))
          (not (< k@266@01 (Seq_length xs@258@01))))))
    (or (>= k@266@01 0) (not (>= k@266@01 0)))
    (=>
      (and
        (>= k@266@01 0)
        (and
          (< k@266@01 (Seq_length xs@258@01))
          (and
            (>= j@267@01 0)
            (and (< j@267@01 (Seq_length xs@258@01)) (not (= k@266@01 j@267@01))))))
      (and
        (>= k@266@01 0)
        (< k@266@01 (Seq_length xs@258@01))
        (>= j@267@01 0)
        (< j@267@01 (Seq_length xs@258@01))
        (not (= k@266@01 j@267@01))))
    (or
      (not
        (and
          (>= k@266@01 0)
          (and
            (< k@266@01 (Seq_length xs@258@01))
            (and
              (>= j@267@01 0)
              (and
                (< j@267@01 (Seq_length xs@258@01))
                (not (= k@266@01 j@267@01)))))))
      (and
        (>= k@266@01 0)
        (and
          (< k@266@01 (Seq_length xs@258@01))
          (and
            (>= j@267@01 0)
            (and (< j@267@01 (Seq_length xs@258@01)) (not (= k@266@01 j@267@01))))))))
  :pattern ((Seq_index xs@258@01 k@266@01) (Seq_index xs@258@01 j@267@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(assert (forall ((k@266@01 Int) (j@267@01 Int)) (!
  (=>
    (and
      (>= k@266@01 0)
      (and
        (< k@266@01 (Seq_length xs@258@01))
        (and
          (>= j@267@01 0)
          (and (< j@267@01 (Seq_length xs@258@01)) (not (= k@266@01 j@267@01))))))
    (not (= (Seq_index xs@258@01 k@266@01) (Seq_index xs@258@01 j@267@01))))
  :pattern ((Seq_index xs@258@01 k@266@01) (Seq_index xs@258@01 j@267@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@263@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@263@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@263@01)))))))
(declare-const j@268@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 128 | !(0 <= j@268@01) | live]
; [else-branch: 128 | 0 <= j@268@01 | live]
(push) ; 5
; [then-branch: 128 | !(0 <= j@268@01)]
(assert (not (<= 0 j@268@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 128 | 0 <= j@268@01]
(assert (<= 0 j@268@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@268@01) (not (<= 0 j@268@01))))
(assert (and (<= 0 j@268@01) (< j@268@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@268@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@268@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@269@01 ($Ref) Int)
(declare-fun img@270@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@268@01 Int)) (!
  (=>
    (and (<= 0 j@268@01) (< j@268@01 3))
    (or (<= 0 j@268@01) (not (<= 0 j@268@01))))
  :pattern ((Seq_index xs@258@01 j@268@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@268@01 Int) (j2@268@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@268@01) (< j1@268@01 3))
      (and (<= 0 j2@268@01) (< j2@268@01 3))
      (= (Seq_index xs@258@01 j1@268@01) (Seq_index xs@258@01 j2@268@01)))
    (= j1@268@01 j2@268@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@268@01 Int)) (!
  (=>
    (and (<= 0 j@268@01) (< j@268@01 3))
    (and
      (= (inv@269@01 (Seq_index xs@258@01 j@268@01)) j@268@01)
      (img@270@01 (Seq_index xs@258@01 j@268@01))))
  :pattern ((Seq_index xs@258@01 j@268@01))
  :qid |quant-u-207|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@270@01 r) (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)))
    (= (Seq_index xs@258@01 (inv@269@01 r)) r))
  :pattern ((inv@269@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@268@01 Int)) (!
  (=>
    (and (<= 0 j@268@01) (< j@268@01 3))
    (not (= (Seq_index xs@258@01 j@268@01) $Ref.null)))
  :pattern ((Seq_index xs@258@01 j@268@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@271@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 129 | !(3 <= j@271@01) | live]
; [else-branch: 129 | 3 <= j@271@01 | live]
(push) ; 5
; [then-branch: 129 | !(3 <= j@271@01)]
(assert (not (<= 3 j@271@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 129 | 3 <= j@271@01]
(assert (<= 3 j@271@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@271@01) (not (<= 3 j@271@01))))
(assert (and (<= 3 j@271@01) (< j@271@01 n@259@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@271@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@271@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@272@01 ($Ref) Int)
(declare-fun img@273@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@271@01 Int)) (!
  (=>
    (and (<= 3 j@271@01) (< j@271@01 n@259@01))
    (or (<= 3 j@271@01) (not (<= 3 j@271@01))))
  :pattern ((Seq_index xs@258@01 j@271@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@271@01 Int) (j2@271@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@271@01) (< j1@271@01 n@259@01))
      (and (<= 3 j2@271@01) (< j2@271@01 n@259@01))
      (= (Seq_index xs@258@01 j1@271@01) (Seq_index xs@258@01 j2@271@01)))
    (= j1@271@01 j2@271@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@271@01 Int)) (!
  (=>
    (and (<= 3 j@271@01) (< j@271@01 n@259@01))
    (and
      (= (inv@272@01 (Seq_index xs@258@01 j@271@01)) j@271@01)
      (img@273@01 (Seq_index xs@258@01 j@271@01))))
  :pattern ((Seq_index xs@258@01 j@271@01))
  :qid |quant-u-209|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@273@01 r) (and (<= 3 (inv@272@01 r)) (< (inv@272@01 r) n@259@01)))
    (= (Seq_index xs@258@01 (inv@272@01 r)) r))
  :pattern ((inv@272@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@271@01 Int)) (!
  (=>
    (and (<= 3 j@271@01) (< j@271@01 n@259@01))
    (not (= (Seq_index xs@258@01 j@271@01) $Ref.null)))
  :pattern ((Seq_index xs@258@01 j@271@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@258@01 j@271@01) (Seq_index xs@258@01 j@268@01))
    (=
      (and
        (img@273@01 r)
        (and (<= 3 (inv@272@01 r)) (< (inv@272@01 r) n@259@01)))
      (and (img@270@01 r) (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)))))
  
  :qid |quant-u-210|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P02%trigger $t@263@01 xs@258@01 n@259@01))
; [exec]
; v1 := xs[i].f
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@260@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@260@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@274@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@270@01 r) (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)))
    (=
      ($FVF.lookup_f (as sm@274@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@274@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@273@01 r) (and (<= 3 (inv@272@01 r)) (< (inv@272@01 r) n@259@01)))
    (=
      ($FVF.lookup_f (as sm@274@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@274@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r))
  :qid |qp.fvfValDef108|)))
(declare-const pm@275@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@275@01  $FPM) r)
    (+
      (ite
        (and (img@270@01 r) (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@273@01 r)
          (and (<= 3 (inv@272@01 r)) (< (inv@272@01 r) n@259@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@275@01  $FPM) r))
  :qid |qp.resPrmSumDef109|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@275@01  $FPM) (Seq_index xs@258@01 i@260@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const v1@276@01 Int)
(assert (=
  v1@276@01
  ($FVF.lookup_f (as sm@274@01  $FVF<f>) (Seq_index xs@258@01 i@260@01))))
; [exec]
; fold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@277@01 Int)
(declare-const j@278@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 130 | !(k@277@01 >= 0) | live]
; [else-branch: 130 | k@277@01 >= 0 | live]
(push) ; 5
; [then-branch: 130 | !(k@277@01 >= 0)]
(assert (not (>= k@277@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 130 | k@277@01 >= 0]
(assert (>= k@277@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 131 | !(k@277@01 < |xs@258@01|) | live]
; [else-branch: 131 | k@277@01 < |xs@258@01| | live]
(push) ; 7
; [then-branch: 131 | !(k@277@01 < |xs@258@01|)]
(assert (not (< k@277@01 (Seq_length xs@258@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 131 | k@277@01 < |xs@258@01|]
(assert (< k@277@01 (Seq_length xs@258@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 132 | !(j@278@01 >= 0) | live]
; [else-branch: 132 | j@278@01 >= 0 | live]
(push) ; 9
; [then-branch: 132 | !(j@278@01 >= 0)]
(assert (not (>= j@278@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 132 | j@278@01 >= 0]
(assert (>= j@278@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 133 | !(j@278@01 < |xs@258@01|) | live]
; [else-branch: 133 | j@278@01 < |xs@258@01| | live]
(push) ; 11
; [then-branch: 133 | !(j@278@01 < |xs@258@01|)]
(assert (not (< j@278@01 (Seq_length xs@258@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 133 | j@278@01 < |xs@258@01|]
(assert (< j@278@01 (Seq_length xs@258@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@278@01 (Seq_length xs@258@01))
  (not (< j@278@01 (Seq_length xs@258@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@278@01 0)
  (and
    (>= j@278@01 0)
    (or
      (< j@278@01 (Seq_length xs@258@01))
      (not (< j@278@01 (Seq_length xs@258@01)))))))
(assert (or (>= j@278@01 0) (not (>= j@278@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@277@01 (Seq_length xs@258@01))
  (and
    (< k@277@01 (Seq_length xs@258@01))
    (=>
      (>= j@278@01 0)
      (and
        (>= j@278@01 0)
        (or
          (< j@278@01 (Seq_length xs@258@01))
          (not (< j@278@01 (Seq_length xs@258@01))))))
    (or (>= j@278@01 0) (not (>= j@278@01 0))))))
(assert (or
  (< k@277@01 (Seq_length xs@258@01))
  (not (< k@277@01 (Seq_length xs@258@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@277@01 0)
  (and
    (>= k@277@01 0)
    (=>
      (< k@277@01 (Seq_length xs@258@01))
      (and
        (< k@277@01 (Seq_length xs@258@01))
        (=>
          (>= j@278@01 0)
          (and
            (>= j@278@01 0)
            (or
              (< j@278@01 (Seq_length xs@258@01))
              (not (< j@278@01 (Seq_length xs@258@01))))))
        (or (>= j@278@01 0) (not (>= j@278@01 0)))))
    (or
      (< k@277@01 (Seq_length xs@258@01))
      (not (< k@277@01 (Seq_length xs@258@01)))))))
(assert (or (>= k@277@01 0) (not (>= k@277@01 0))))
(push) ; 4
; [then-branch: 134 | k@277@01 >= 0 && k@277@01 < |xs@258@01| && j@278@01 >= 0 && j@278@01 < |xs@258@01| && k@277@01 != j@278@01 | live]
; [else-branch: 134 | !(k@277@01 >= 0 && k@277@01 < |xs@258@01| && j@278@01 >= 0 && j@278@01 < |xs@258@01| && k@277@01 != j@278@01) | live]
(push) ; 5
; [then-branch: 134 | k@277@01 >= 0 && k@277@01 < |xs@258@01| && j@278@01 >= 0 && j@278@01 < |xs@258@01| && k@277@01 != j@278@01]
(assert (and
  (>= k@277@01 0)
  (and
    (< k@277@01 (Seq_length xs@258@01))
    (and
      (>= j@278@01 0)
      (and (< j@278@01 (Seq_length xs@258@01)) (not (= k@277@01 j@278@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 134 | !(k@277@01 >= 0 && k@277@01 < |xs@258@01| && j@278@01 >= 0 && j@278@01 < |xs@258@01| && k@277@01 != j@278@01)]
(assert (not
  (and
    (>= k@277@01 0)
    (and
      (< k@277@01 (Seq_length xs@258@01))
      (and
        (>= j@278@01 0)
        (and (< j@278@01 (Seq_length xs@258@01)) (not (= k@277@01 j@278@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@277@01 0)
    (and
      (< k@277@01 (Seq_length xs@258@01))
      (and
        (>= j@278@01 0)
        (and (< j@278@01 (Seq_length xs@258@01)) (not (= k@277@01 j@278@01))))))
  (and
    (>= k@277@01 0)
    (< k@277@01 (Seq_length xs@258@01))
    (>= j@278@01 0)
    (< j@278@01 (Seq_length xs@258@01))
    (not (= k@277@01 j@278@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@277@01 0)
      (and
        (< k@277@01 (Seq_length xs@258@01))
        (and
          (>= j@278@01 0)
          (and (< j@278@01 (Seq_length xs@258@01)) (not (= k@277@01 j@278@01)))))))
  (and
    (>= k@277@01 0)
    (and
      (< k@277@01 (Seq_length xs@258@01))
      (and
        (>= j@278@01 0)
        (and (< j@278@01 (Seq_length xs@258@01)) (not (= k@277@01 j@278@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@277@01 Int) (j@278@01 Int)) (!
  (and
    (=>
      (>= k@277@01 0)
      (and
        (>= k@277@01 0)
        (=>
          (< k@277@01 (Seq_length xs@258@01))
          (and
            (< k@277@01 (Seq_length xs@258@01))
            (=>
              (>= j@278@01 0)
              (and
                (>= j@278@01 0)
                (or
                  (< j@278@01 (Seq_length xs@258@01))
                  (not (< j@278@01 (Seq_length xs@258@01))))))
            (or (>= j@278@01 0) (not (>= j@278@01 0)))))
        (or
          (< k@277@01 (Seq_length xs@258@01))
          (not (< k@277@01 (Seq_length xs@258@01))))))
    (or (>= k@277@01 0) (not (>= k@277@01 0)))
    (=>
      (and
        (>= k@277@01 0)
        (and
          (< k@277@01 (Seq_length xs@258@01))
          (and
            (>= j@278@01 0)
            (and (< j@278@01 (Seq_length xs@258@01)) (not (= k@277@01 j@278@01))))))
      (and
        (>= k@277@01 0)
        (< k@277@01 (Seq_length xs@258@01))
        (>= j@278@01 0)
        (< j@278@01 (Seq_length xs@258@01))
        (not (= k@277@01 j@278@01))))
    (or
      (not
        (and
          (>= k@277@01 0)
          (and
            (< k@277@01 (Seq_length xs@258@01))
            (and
              (>= j@278@01 0)
              (and
                (< j@278@01 (Seq_length xs@258@01))
                (not (= k@277@01 j@278@01)))))))
      (and
        (>= k@277@01 0)
        (and
          (< k@277@01 (Seq_length xs@258@01))
          (and
            (>= j@278@01 0)
            (and (< j@278@01 (Seq_length xs@258@01)) (not (= k@277@01 j@278@01))))))))
  :pattern ((Seq_index xs@258@01 k@277@01) (Seq_index xs@258@01 j@278@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(push) ; 3
(assert (not (forall ((k@277@01 Int) (j@278@01 Int)) (!
  (=>
    (and
      (>= k@277@01 0)
      (and
        (< k@277@01 (Seq_length xs@258@01))
        (and
          (>= j@278@01 0)
          (and (< j@278@01 (Seq_length xs@258@01)) (not (= k@277@01 j@278@01))))))
    (not (= (Seq_index xs@258@01 k@277@01) (Seq_index xs@258@01 j@278@01))))
  :pattern ((Seq_index xs@258@01 k@277@01) (Seq_index xs@258@01 j@278@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@277@01 Int) (j@278@01 Int)) (!
  (=>
    (and
      (>= k@277@01 0)
      (and
        (< k@277@01 (Seq_length xs@258@01))
        (and
          (>= j@278@01 0)
          (and (< j@278@01 (Seq_length xs@258@01)) (not (= k@277@01 j@278@01))))))
    (not (= (Seq_index xs@258@01 k@277@01) (Seq_index xs@258@01 j@278@01))))
  :pattern ((Seq_index xs@258@01 k@277@01) (Seq_index xs@258@01 j@278@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(declare-const j@279@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 135 | !(0 <= j@279@01) | live]
; [else-branch: 135 | 0 <= j@279@01 | live]
(push) ; 5
; [then-branch: 135 | !(0 <= j@279@01)]
(assert (not (<= 0 j@279@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 135 | 0 <= j@279@01]
(assert (<= 0 j@279@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@279@01) (not (<= 0 j@279@01))))
(assert (and (<= 0 j@279@01) (< j@279@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@279@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@279@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@280@01 ($Ref) Int)
(declare-fun img@281@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@279@01 Int)) (!
  (=>
    (and (<= 0 j@279@01) (< j@279@01 3))
    (or (<= 0 j@279@01) (not (<= 0 j@279@01))))
  :pattern ((Seq_index xs@258@01 j@279@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@279@01 Int) (j2@279@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@279@01) (< j1@279@01 3))
      (and (<= 0 j2@279@01) (< j2@279@01 3))
      (= (Seq_index xs@258@01 j1@279@01) (Seq_index xs@258@01 j2@279@01)))
    (= j1@279@01 j2@279@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@279@01 Int)) (!
  (=>
    (and (<= 0 j@279@01) (< j@279@01 3))
    (and
      (= (inv@280@01 (Seq_index xs@258@01 j@279@01)) j@279@01)
      (img@281@01 (Seq_index xs@258@01 j@279@01))))
  :pattern ((Seq_index xs@258@01 j@279@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@281@01 r) (and (<= 0 (inv@280@01 r)) (< (inv@280@01 r) 3)))
    (= (Seq_index xs@258@01 (inv@280@01 r)) r))
  :pattern ((inv@280@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@282@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@280@01 r)) (< (inv@280@01 r) 3))
      (img@281@01 r)
      (= r (Seq_index xs@258@01 (inv@280@01 r))))
    ($Perm.min
      (ite
        (and (img@270@01 r) (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@283@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@280@01 r)) (< (inv@280@01 r) 3))
      (img@281@01 r)
      (= r (Seq_index xs@258@01 (inv@280@01 r))))
    ($Perm.min
      (ite
        (and
          (img@273@01 r)
          (and (<= 3 (inv@272@01 r)) (< (inv@272@01 r) n@259@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@282@01 r)))
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
        (and (img@270@01 r) (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@282@01 r))
    $Perm.No)
  
  :qid |quant-u-213|))))
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
      (and (<= 0 (inv@280@01 r)) (< (inv@280@01 r) 3))
      (img@281@01 r)
      (= r (Seq_index xs@258@01 (inv@280@01 r))))
    (= (- $Perm.Write (pTaken@282@01 r)) $Perm.No))
  
  :qid |quant-u-214|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@284@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@284@01  $FVF<f>)))
      (and (and (<= 0 (inv@280@01 r)) (< (inv@280@01 r) 3)) (img@281@01 r)))
    (=>
      (and (and (<= 0 (inv@280@01 r)) (< (inv@280@01 r) 3)) (img@281@01 r))
      (Set_in r ($FVF.domain_f (as sm@284@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@284@01  $FVF<f>))))
  :qid |qp.fvfDomDef112|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@280@01 r)) (< (inv@280@01 r) 3)) (img@281@01 r))
      (and (img@270@01 r) (and (<= 0 (inv@269@01 r)) (< (inv@269@01 r) 3))))
    (=
      ($FVF.lookup_f (as sm@284@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@284@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@280@01 r)) (< (inv@280@01 r) 3)) (img@281@01 r))
      (and
        (img@273@01 r)
        (and (<= 3 (inv@272@01 r)) (< (inv@272@01 r) n@259@01))))
    (=
      ($FVF.lookup_f (as sm@284@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@284@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r))
  :qid |qp.fvfValDef111|)))
(declare-const j@285@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 136 | !(3 <= j@285@01) | live]
; [else-branch: 136 | 3 <= j@285@01 | live]
(push) ; 5
; [then-branch: 136 | !(3 <= j@285@01)]
(assert (not (<= 3 j@285@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 136 | 3 <= j@285@01]
(assert (<= 3 j@285@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@285@01) (not (<= 3 j@285@01))))
(assert (and (<= 3 j@285@01) (< j@285@01 n@259@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@285@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@285@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@286@01 ($Ref) Int)
(declare-fun img@287@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@285@01 Int)) (!
  (=>
    (and (<= 3 j@285@01) (< j@285@01 n@259@01))
    (or (<= 3 j@285@01) (not (<= 3 j@285@01))))
  :pattern ((Seq_index xs@258@01 j@285@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@285@01 Int) (j2@285@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@285@01) (< j1@285@01 n@259@01))
      (and (<= 3 j2@285@01) (< j2@285@01 n@259@01))
      (= (Seq_index xs@258@01 j1@285@01) (Seq_index xs@258@01 j2@285@01)))
    (= j1@285@01 j2@285@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@285@01 Int)) (!
  (=>
    (and (<= 3 j@285@01) (< j@285@01 n@259@01))
    (and
      (= (inv@286@01 (Seq_index xs@258@01 j@285@01)) j@285@01)
      (img@287@01 (Seq_index xs@258@01 j@285@01))))
  :pattern ((Seq_index xs@258@01 j@285@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@287@01 r) (and (<= 3 (inv@286@01 r)) (< (inv@286@01 r) n@259@01)))
    (= (Seq_index xs@258@01 (inv@286@01 r)) r))
  :pattern ((inv@286@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@288@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@286@01 r)) (< (inv@286@01 r) n@259@01))
      (img@287@01 r)
      (= r (Seq_index xs@258@01 (inv@286@01 r))))
    ($Perm.min
      (ite
        (and
          (img@273@01 r)
          (and (<= 3 (inv@272@01 r)) (< (inv@272@01 r) n@259@01)))
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
          (img@273@01 r)
          (and (<= 3 (inv@272@01 r)) (< (inv@272@01 r) n@259@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@288@01 r))
    $Perm.No)
  
  :qid |quant-u-217|))))
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
      (and (<= 3 (inv@286@01 r)) (< (inv@286@01 r) n@259@01))
      (img@287@01 r)
      (= r (Seq_index xs@258@01 (inv@286@01 r))))
    (= (- $Perm.Write (pTaken@288@01 r)) $Perm.No))
  
  :qid |quant-u-218|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@289@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@289@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@286@01 r)) (< (inv@286@01 r) n@259@01))
        (img@287@01 r)))
    (=>
      (and
        (and (<= 3 (inv@286@01 r)) (< (inv@286@01 r) n@259@01))
        (img@287@01 r))
      (Set_in r ($FVF.domain_f (as sm@289@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@289@01  $FVF<f>))))
  :qid |qp.fvfDomDef114|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@286@01 r)) (< (inv@286@01 r) n@259@01))
        (img@287@01 r))
      (and
        (img@273@01 r)
        (and (<= 3 (inv@272@01 r)) (< (inv@272@01 r) n@259@01))))
    (=
      ($FVF.lookup_f (as sm@289@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@289@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@263@01))))) r))
  :qid |qp.fvfValDef113|)))
(assert (P02%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@284@01  $FVF<f>))
        ($SortWrappers.$FVF<f>To$Snap (as sm@289@01  $FVF<f>)))))) xs@258@01 n@259@01))
; [exec]
; assert v1 == fun06(xs, n, i)
; [eval] v1 == fun06(xs, n, i)
; [eval] fun06(xs, n, i)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
(push) ; 4
(assert (not (< 0 i@260@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 i@260@01))
; [eval] i < n
(push) ; 4
(assert (not (< i@260@01 n@259@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< i@260@01 n@259@01))
(assert (fun06%precondition ($Snap.combine
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@284@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@289@01  $FVF<f>))))))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@258@01 n@259@01 i@260@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 0 i@260@01)
  (< i@260@01 n@259@01)
  (fun06%precondition ($Snap.combine
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@284@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@289@01  $FVF<f>))))))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@258@01 n@259@01 i@260@01)))
(push) ; 3
(assert (not (=
  v1@276@01
  (fun06 ($Snap.combine
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@284@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@289@01  $FVF<f>))))))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@258@01 n@259@01 i@260@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  v1@276@01
  (fun06 ($Snap.combine
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@284@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@289@01  $FVF<f>))))))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@258@01 n@259@01 i@260@01)))
; [exec]
; unfold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@290@01 Int)
(declare-const j@291@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 137 | !(k@290@01 >= 0) | live]
; [else-branch: 137 | k@290@01 >= 0 | live]
(push) ; 5
; [then-branch: 137 | !(k@290@01 >= 0)]
(assert (not (>= k@290@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 137 | k@290@01 >= 0]
(assert (>= k@290@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 138 | !(k@290@01 < |xs@258@01|) | live]
; [else-branch: 138 | k@290@01 < |xs@258@01| | live]
(push) ; 7
; [then-branch: 138 | !(k@290@01 < |xs@258@01|)]
(assert (not (< k@290@01 (Seq_length xs@258@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 138 | k@290@01 < |xs@258@01|]
(assert (< k@290@01 (Seq_length xs@258@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 139 | !(j@291@01 >= 0) | live]
; [else-branch: 139 | j@291@01 >= 0 | live]
(push) ; 9
; [then-branch: 139 | !(j@291@01 >= 0)]
(assert (not (>= j@291@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 139 | j@291@01 >= 0]
(assert (>= j@291@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 140 | !(j@291@01 < |xs@258@01|) | live]
; [else-branch: 140 | j@291@01 < |xs@258@01| | live]
(push) ; 11
; [then-branch: 140 | !(j@291@01 < |xs@258@01|)]
(assert (not (< j@291@01 (Seq_length xs@258@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 140 | j@291@01 < |xs@258@01|]
(assert (< j@291@01 (Seq_length xs@258@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@291@01 (Seq_length xs@258@01))
  (not (< j@291@01 (Seq_length xs@258@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@291@01 0)
  (and
    (>= j@291@01 0)
    (or
      (< j@291@01 (Seq_length xs@258@01))
      (not (< j@291@01 (Seq_length xs@258@01)))))))
(assert (or (>= j@291@01 0) (not (>= j@291@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@290@01 (Seq_length xs@258@01))
  (and
    (< k@290@01 (Seq_length xs@258@01))
    (=>
      (>= j@291@01 0)
      (and
        (>= j@291@01 0)
        (or
          (< j@291@01 (Seq_length xs@258@01))
          (not (< j@291@01 (Seq_length xs@258@01))))))
    (or (>= j@291@01 0) (not (>= j@291@01 0))))))
(assert (or
  (< k@290@01 (Seq_length xs@258@01))
  (not (< k@290@01 (Seq_length xs@258@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@290@01 0)
  (and
    (>= k@290@01 0)
    (=>
      (< k@290@01 (Seq_length xs@258@01))
      (and
        (< k@290@01 (Seq_length xs@258@01))
        (=>
          (>= j@291@01 0)
          (and
            (>= j@291@01 0)
            (or
              (< j@291@01 (Seq_length xs@258@01))
              (not (< j@291@01 (Seq_length xs@258@01))))))
        (or (>= j@291@01 0) (not (>= j@291@01 0)))))
    (or
      (< k@290@01 (Seq_length xs@258@01))
      (not (< k@290@01 (Seq_length xs@258@01)))))))
(assert (or (>= k@290@01 0) (not (>= k@290@01 0))))
(push) ; 4
; [then-branch: 141 | k@290@01 >= 0 && k@290@01 < |xs@258@01| && j@291@01 >= 0 && j@291@01 < |xs@258@01| && k@290@01 != j@291@01 | live]
; [else-branch: 141 | !(k@290@01 >= 0 && k@290@01 < |xs@258@01| && j@291@01 >= 0 && j@291@01 < |xs@258@01| && k@290@01 != j@291@01) | live]
(push) ; 5
; [then-branch: 141 | k@290@01 >= 0 && k@290@01 < |xs@258@01| && j@291@01 >= 0 && j@291@01 < |xs@258@01| && k@290@01 != j@291@01]
(assert (and
  (>= k@290@01 0)
  (and
    (< k@290@01 (Seq_length xs@258@01))
    (and
      (>= j@291@01 0)
      (and (< j@291@01 (Seq_length xs@258@01)) (not (= k@290@01 j@291@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 141 | !(k@290@01 >= 0 && k@290@01 < |xs@258@01| && j@291@01 >= 0 && j@291@01 < |xs@258@01| && k@290@01 != j@291@01)]
(assert (not
  (and
    (>= k@290@01 0)
    (and
      (< k@290@01 (Seq_length xs@258@01))
      (and
        (>= j@291@01 0)
        (and (< j@291@01 (Seq_length xs@258@01)) (not (= k@290@01 j@291@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@290@01 0)
    (and
      (< k@290@01 (Seq_length xs@258@01))
      (and
        (>= j@291@01 0)
        (and (< j@291@01 (Seq_length xs@258@01)) (not (= k@290@01 j@291@01))))))
  (and
    (>= k@290@01 0)
    (< k@290@01 (Seq_length xs@258@01))
    (>= j@291@01 0)
    (< j@291@01 (Seq_length xs@258@01))
    (not (= k@290@01 j@291@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@290@01 0)
      (and
        (< k@290@01 (Seq_length xs@258@01))
        (and
          (>= j@291@01 0)
          (and (< j@291@01 (Seq_length xs@258@01)) (not (= k@290@01 j@291@01)))))))
  (and
    (>= k@290@01 0)
    (and
      (< k@290@01 (Seq_length xs@258@01))
      (and
        (>= j@291@01 0)
        (and (< j@291@01 (Seq_length xs@258@01)) (not (= k@290@01 j@291@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@290@01 Int) (j@291@01 Int)) (!
  (and
    (=>
      (>= k@290@01 0)
      (and
        (>= k@290@01 0)
        (=>
          (< k@290@01 (Seq_length xs@258@01))
          (and
            (< k@290@01 (Seq_length xs@258@01))
            (=>
              (>= j@291@01 0)
              (and
                (>= j@291@01 0)
                (or
                  (< j@291@01 (Seq_length xs@258@01))
                  (not (< j@291@01 (Seq_length xs@258@01))))))
            (or (>= j@291@01 0) (not (>= j@291@01 0)))))
        (or
          (< k@290@01 (Seq_length xs@258@01))
          (not (< k@290@01 (Seq_length xs@258@01))))))
    (or (>= k@290@01 0) (not (>= k@290@01 0)))
    (=>
      (and
        (>= k@290@01 0)
        (and
          (< k@290@01 (Seq_length xs@258@01))
          (and
            (>= j@291@01 0)
            (and (< j@291@01 (Seq_length xs@258@01)) (not (= k@290@01 j@291@01))))))
      (and
        (>= k@290@01 0)
        (< k@290@01 (Seq_length xs@258@01))
        (>= j@291@01 0)
        (< j@291@01 (Seq_length xs@258@01))
        (not (= k@290@01 j@291@01))))
    (or
      (not
        (and
          (>= k@290@01 0)
          (and
            (< k@290@01 (Seq_length xs@258@01))
            (and
              (>= j@291@01 0)
              (and
                (< j@291@01 (Seq_length xs@258@01))
                (not (= k@290@01 j@291@01)))))))
      (and
        (>= k@290@01 0)
        (and
          (< k@290@01 (Seq_length xs@258@01))
          (and
            (>= j@291@01 0)
            (and (< j@291@01 (Seq_length xs@258@01)) (not (= k@290@01 j@291@01))))))))
  :pattern ((Seq_index xs@258@01 k@290@01) (Seq_index xs@258@01 j@291@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(assert (forall ((k@290@01 Int) (j@291@01 Int)) (!
  (=>
    (and
      (>= k@290@01 0)
      (and
        (< k@290@01 (Seq_length xs@258@01))
        (and
          (>= j@291@01 0)
          (and (< j@291@01 (Seq_length xs@258@01)) (not (= k@290@01 j@291@01))))))
    (not (= (Seq_index xs@258@01 k@290@01) (Seq_index xs@258@01 j@291@01))))
  :pattern ((Seq_index xs@258@01 k@290@01) (Seq_index xs@258@01 j@291@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(declare-const j@292@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 142 | !(0 <= j@292@01) | live]
; [else-branch: 142 | 0 <= j@292@01 | live]
(push) ; 5
; [then-branch: 142 | !(0 <= j@292@01)]
(assert (not (<= 0 j@292@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 142 | 0 <= j@292@01]
(assert (<= 0 j@292@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@292@01) (not (<= 0 j@292@01))))
(assert (and (<= 0 j@292@01) (< j@292@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@292@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@292@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@293@01 ($Ref) Int)
(declare-fun img@294@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@292@01 Int)) (!
  (=>
    (and (<= 0 j@292@01) (< j@292@01 3))
    (or (<= 0 j@292@01) (not (<= 0 j@292@01))))
  :pattern ((Seq_index xs@258@01 j@292@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@292@01 Int) (j2@292@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@292@01) (< j1@292@01 3))
      (and (<= 0 j2@292@01) (< j2@292@01 3))
      (= (Seq_index xs@258@01 j1@292@01) (Seq_index xs@258@01 j2@292@01)))
    (= j1@292@01 j2@292@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@292@01 Int)) (!
  (=>
    (and (<= 0 j@292@01) (< j@292@01 3))
    (and
      (= (inv@293@01 (Seq_index xs@258@01 j@292@01)) j@292@01)
      (img@294@01 (Seq_index xs@258@01 j@292@01))))
  :pattern ((Seq_index xs@258@01 j@292@01))
  :qid |quant-u-220|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@294@01 r) (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)))
    (= (Seq_index xs@258@01 (inv@293@01 r)) r))
  :pattern ((inv@293@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@292@01 Int)) (!
  (=>
    (and (<= 0 j@292@01) (< j@292@01 3))
    (not (= (Seq_index xs@258@01 j@292@01) $Ref.null)))
  :pattern ((Seq_index xs@258@01 j@292@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@295@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 143 | !(3 <= j@295@01) | live]
; [else-branch: 143 | 3 <= j@295@01 | live]
(push) ; 5
; [then-branch: 143 | !(3 <= j@295@01)]
(assert (not (<= 3 j@295@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 143 | 3 <= j@295@01]
(assert (<= 3 j@295@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@295@01) (not (<= 3 j@295@01))))
(assert (and (<= 3 j@295@01) (< j@295@01 n@259@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@295@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@295@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@296@01 ($Ref) Int)
(declare-fun img@297@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@295@01 Int)) (!
  (=>
    (and (<= 3 j@295@01) (< j@295@01 n@259@01))
    (or (<= 3 j@295@01) (not (<= 3 j@295@01))))
  :pattern ((Seq_index xs@258@01 j@295@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@295@01 Int) (j2@295@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@295@01) (< j1@295@01 n@259@01))
      (and (<= 3 j2@295@01) (< j2@295@01 n@259@01))
      (= (Seq_index xs@258@01 j1@295@01) (Seq_index xs@258@01 j2@295@01)))
    (= j1@295@01 j2@295@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@295@01 Int)) (!
  (=>
    (and (<= 3 j@295@01) (< j@295@01 n@259@01))
    (and
      (= (inv@296@01 (Seq_index xs@258@01 j@295@01)) j@295@01)
      (img@297@01 (Seq_index xs@258@01 j@295@01))))
  :pattern ((Seq_index xs@258@01 j@295@01))
  :qid |quant-u-222|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@297@01 r) (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
    (= (Seq_index xs@258@01 (inv@296@01 r)) r))
  :pattern ((inv@296@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@295@01 Int)) (!
  (=>
    (and (<= 3 j@295@01) (< j@295@01 n@259@01))
    (not (= (Seq_index xs@258@01 j@295@01) $Ref.null)))
  :pattern ((Seq_index xs@258@01 j@295@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@258@01 j@295@01) (Seq_index xs@258@01 j@292@01))
    (=
      (and
        (img@297@01 r)
        (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
      (and (img@294@01 r) (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)))))
  
  :qid |quant-u-223|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; xs[i].f := 0
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@260@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@260@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@298@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@258@01 i@260@01))
    ($Perm.min
      (ite
        (and (img@294@01 r) (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@299@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@258@01 i@260@01))
    ($Perm.min
      (ite
        (and
          (img@297@01 r)
          (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@298@01 r)))
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
        (and (img@294@01 r) (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@298@01 r))
    $Perm.No)
  
  :qid |quant-u-225|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@298@01 r) $Perm.No)
  
  :qid |quant-u-226|))))
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
    (= r (Seq_index xs@258@01 i@260@01))
    (= (- $Perm.Write (pTaken@298@01 r)) $Perm.No))
  
  :qid |quant-u-227|))))
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
          (img@297@01 r)
          (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@299@01 r))
    $Perm.No)
  
  :qid |quant-u-228|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@299@01 r) $Perm.No)
  
  :qid |quant-u-229|))))
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
    (= r (Seq_index xs@258@01 i@260@01))
    (= (- (- $Perm.Write (pTaken@298@01 r)) (pTaken@299@01 r)) $Perm.No))
  
  :qid |quant-u-230|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@300@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@300@01  $FVF<f>) (Seq_index xs@258@01 i@260@01)) 0))
; [exec]
; fold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@301@01 Int)
(declare-const j@302@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 144 | !(k@301@01 >= 0) | live]
; [else-branch: 144 | k@301@01 >= 0 | live]
(push) ; 5
; [then-branch: 144 | !(k@301@01 >= 0)]
(assert (not (>= k@301@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 144 | k@301@01 >= 0]
(assert (>= k@301@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 145 | !(k@301@01 < |xs@258@01|) | live]
; [else-branch: 145 | k@301@01 < |xs@258@01| | live]
(push) ; 7
; [then-branch: 145 | !(k@301@01 < |xs@258@01|)]
(assert (not (< k@301@01 (Seq_length xs@258@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 145 | k@301@01 < |xs@258@01|]
(assert (< k@301@01 (Seq_length xs@258@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 146 | !(j@302@01 >= 0) | live]
; [else-branch: 146 | j@302@01 >= 0 | live]
(push) ; 9
; [then-branch: 146 | !(j@302@01 >= 0)]
(assert (not (>= j@302@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 146 | j@302@01 >= 0]
(assert (>= j@302@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 147 | !(j@302@01 < |xs@258@01|) | live]
; [else-branch: 147 | j@302@01 < |xs@258@01| | live]
(push) ; 11
; [then-branch: 147 | !(j@302@01 < |xs@258@01|)]
(assert (not (< j@302@01 (Seq_length xs@258@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 147 | j@302@01 < |xs@258@01|]
(assert (< j@302@01 (Seq_length xs@258@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@302@01 (Seq_length xs@258@01))
  (not (< j@302@01 (Seq_length xs@258@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@302@01 0)
  (and
    (>= j@302@01 0)
    (or
      (< j@302@01 (Seq_length xs@258@01))
      (not (< j@302@01 (Seq_length xs@258@01)))))))
(assert (or (>= j@302@01 0) (not (>= j@302@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@301@01 (Seq_length xs@258@01))
  (and
    (< k@301@01 (Seq_length xs@258@01))
    (=>
      (>= j@302@01 0)
      (and
        (>= j@302@01 0)
        (or
          (< j@302@01 (Seq_length xs@258@01))
          (not (< j@302@01 (Seq_length xs@258@01))))))
    (or (>= j@302@01 0) (not (>= j@302@01 0))))))
(assert (or
  (< k@301@01 (Seq_length xs@258@01))
  (not (< k@301@01 (Seq_length xs@258@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@301@01 0)
  (and
    (>= k@301@01 0)
    (=>
      (< k@301@01 (Seq_length xs@258@01))
      (and
        (< k@301@01 (Seq_length xs@258@01))
        (=>
          (>= j@302@01 0)
          (and
            (>= j@302@01 0)
            (or
              (< j@302@01 (Seq_length xs@258@01))
              (not (< j@302@01 (Seq_length xs@258@01))))))
        (or (>= j@302@01 0) (not (>= j@302@01 0)))))
    (or
      (< k@301@01 (Seq_length xs@258@01))
      (not (< k@301@01 (Seq_length xs@258@01)))))))
(assert (or (>= k@301@01 0) (not (>= k@301@01 0))))
(push) ; 4
; [then-branch: 148 | k@301@01 >= 0 && k@301@01 < |xs@258@01| && j@302@01 >= 0 && j@302@01 < |xs@258@01| && k@301@01 != j@302@01 | live]
; [else-branch: 148 | !(k@301@01 >= 0 && k@301@01 < |xs@258@01| && j@302@01 >= 0 && j@302@01 < |xs@258@01| && k@301@01 != j@302@01) | live]
(push) ; 5
; [then-branch: 148 | k@301@01 >= 0 && k@301@01 < |xs@258@01| && j@302@01 >= 0 && j@302@01 < |xs@258@01| && k@301@01 != j@302@01]
(assert (and
  (>= k@301@01 0)
  (and
    (< k@301@01 (Seq_length xs@258@01))
    (and
      (>= j@302@01 0)
      (and (< j@302@01 (Seq_length xs@258@01)) (not (= k@301@01 j@302@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 148 | !(k@301@01 >= 0 && k@301@01 < |xs@258@01| && j@302@01 >= 0 && j@302@01 < |xs@258@01| && k@301@01 != j@302@01)]
(assert (not
  (and
    (>= k@301@01 0)
    (and
      (< k@301@01 (Seq_length xs@258@01))
      (and
        (>= j@302@01 0)
        (and (< j@302@01 (Seq_length xs@258@01)) (not (= k@301@01 j@302@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@301@01 0)
    (and
      (< k@301@01 (Seq_length xs@258@01))
      (and
        (>= j@302@01 0)
        (and (< j@302@01 (Seq_length xs@258@01)) (not (= k@301@01 j@302@01))))))
  (and
    (>= k@301@01 0)
    (< k@301@01 (Seq_length xs@258@01))
    (>= j@302@01 0)
    (< j@302@01 (Seq_length xs@258@01))
    (not (= k@301@01 j@302@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@301@01 0)
      (and
        (< k@301@01 (Seq_length xs@258@01))
        (and
          (>= j@302@01 0)
          (and (< j@302@01 (Seq_length xs@258@01)) (not (= k@301@01 j@302@01)))))))
  (and
    (>= k@301@01 0)
    (and
      (< k@301@01 (Seq_length xs@258@01))
      (and
        (>= j@302@01 0)
        (and (< j@302@01 (Seq_length xs@258@01)) (not (= k@301@01 j@302@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@301@01 Int) (j@302@01 Int)) (!
  (and
    (=>
      (>= k@301@01 0)
      (and
        (>= k@301@01 0)
        (=>
          (< k@301@01 (Seq_length xs@258@01))
          (and
            (< k@301@01 (Seq_length xs@258@01))
            (=>
              (>= j@302@01 0)
              (and
                (>= j@302@01 0)
                (or
                  (< j@302@01 (Seq_length xs@258@01))
                  (not (< j@302@01 (Seq_length xs@258@01))))))
            (or (>= j@302@01 0) (not (>= j@302@01 0)))))
        (or
          (< k@301@01 (Seq_length xs@258@01))
          (not (< k@301@01 (Seq_length xs@258@01))))))
    (or (>= k@301@01 0) (not (>= k@301@01 0)))
    (=>
      (and
        (>= k@301@01 0)
        (and
          (< k@301@01 (Seq_length xs@258@01))
          (and
            (>= j@302@01 0)
            (and (< j@302@01 (Seq_length xs@258@01)) (not (= k@301@01 j@302@01))))))
      (and
        (>= k@301@01 0)
        (< k@301@01 (Seq_length xs@258@01))
        (>= j@302@01 0)
        (< j@302@01 (Seq_length xs@258@01))
        (not (= k@301@01 j@302@01))))
    (or
      (not
        (and
          (>= k@301@01 0)
          (and
            (< k@301@01 (Seq_length xs@258@01))
            (and
              (>= j@302@01 0)
              (and
                (< j@302@01 (Seq_length xs@258@01))
                (not (= k@301@01 j@302@01)))))))
      (and
        (>= k@301@01 0)
        (and
          (< k@301@01 (Seq_length xs@258@01))
          (and
            (>= j@302@01 0)
            (and (< j@302@01 (Seq_length xs@258@01)) (not (= k@301@01 j@302@01))))))))
  :pattern ((Seq_index xs@258@01 k@301@01) (Seq_index xs@258@01 j@302@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(push) ; 3
(assert (not (forall ((k@301@01 Int) (j@302@01 Int)) (!
  (=>
    (and
      (>= k@301@01 0)
      (and
        (< k@301@01 (Seq_length xs@258@01))
        (and
          (>= j@302@01 0)
          (and (< j@302@01 (Seq_length xs@258@01)) (not (= k@301@01 j@302@01))))))
    (not (= (Seq_index xs@258@01 k@301@01) (Seq_index xs@258@01 j@302@01))))
  :pattern ((Seq_index xs@258@01 k@301@01) (Seq_index xs@258@01 j@302@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@301@01 Int) (j@302@01 Int)) (!
  (=>
    (and
      (>= k@301@01 0)
      (and
        (< k@301@01 (Seq_length xs@258@01))
        (and
          (>= j@302@01 0)
          (and (< j@302@01 (Seq_length xs@258@01)) (not (= k@301@01 j@302@01))))))
    (not (= (Seq_index xs@258@01 k@301@01) (Seq_index xs@258@01 j@302@01))))
  :pattern ((Seq_index xs@258@01 k@301@01) (Seq_index xs@258@01 j@302@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(declare-const j@303@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 149 | !(0 <= j@303@01) | live]
; [else-branch: 149 | 0 <= j@303@01 | live]
(push) ; 5
; [then-branch: 149 | !(0 <= j@303@01)]
(assert (not (<= 0 j@303@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 149 | 0 <= j@303@01]
(assert (<= 0 j@303@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@303@01) (not (<= 0 j@303@01))))
(assert (and (<= 0 j@303@01) (< j@303@01 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@303@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@303@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@304@01 ($Ref) Int)
(declare-fun img@305@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@303@01 Int)) (!
  (=>
    (and (<= 0 j@303@01) (< j@303@01 3))
    (or (<= 0 j@303@01) (not (<= 0 j@303@01))))
  :pattern ((Seq_index xs@258@01 j@303@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@303@01 Int) (j2@303@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@303@01) (< j1@303@01 3))
      (and (<= 0 j2@303@01) (< j2@303@01 3))
      (= (Seq_index xs@258@01 j1@303@01) (Seq_index xs@258@01 j2@303@01)))
    (= j1@303@01 j2@303@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@303@01 Int)) (!
  (=>
    (and (<= 0 j@303@01) (< j@303@01 3))
    (and
      (= (inv@304@01 (Seq_index xs@258@01 j@303@01)) j@303@01)
      (img@305@01 (Seq_index xs@258@01 j@303@01))))
  :pattern ((Seq_index xs@258@01 j@303@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@305@01 r) (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3)))
    (= (Seq_index xs@258@01 (inv@304@01 r)) r))
  :pattern ((inv@304@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@306@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3))
      (img@305@01 r)
      (= r (Seq_index xs@258@01 (inv@304@01 r))))
    ($Perm.min
      (ite
        (and
          (img@297@01 r)
          (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
        (- $Perm.Write (pTaken@299@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@307@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3))
      (img@305@01 r)
      (= r (Seq_index xs@258@01 (inv@304@01 r))))
    ($Perm.min
      (ite
        (and (img@294@01 r) (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@306@01 r)))
    $Perm.No))
(define-fun pTaken@308@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3))
      (img@305@01 r)
      (= r (Seq_index xs@258@01 (inv@304@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@258@01 i@260@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@306@01 r)) (pTaken@307@01 r)))
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
          (img@297@01 r)
          (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
        (- $Perm.Write (pTaken@299@01 r))
        $Perm.No)
      (pTaken@306@01 r))
    $Perm.No)
  
  :qid |quant-u-233|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@306@01 r) $Perm.No)
  
  :qid |quant-u-234|))))
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
      (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3))
      (img@305@01 r)
      (= r (Seq_index xs@258@01 (inv@304@01 r))))
    (= (- $Perm.Write (pTaken@306@01 r)) $Perm.No))
  
  :qid |quant-u-235|))))
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
        (and (img@294@01 r) (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@307@01 r))
    $Perm.No)
  
  :qid |quant-u-236|))))
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
      (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3))
      (img@305@01 r)
      (= r (Seq_index xs@258@01 (inv@304@01 r))))
    (= (- (- $Perm.Write (pTaken@306@01 r)) (pTaken@307@01 r)) $Perm.No))
  
  :qid |quant-u-237|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@309@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@309@01  $FVF<f>)))
      (and (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3)) (img@305@01 r)))
    (=>
      (and (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3)) (img@305@01 r))
      (Set_in r ($FVF.domain_f (as sm@309@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@309@01  $FVF<f>))))
  :qid |qp.fvfDomDef118|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3)) (img@305@01 r))
      (= r (Seq_index xs@258@01 i@260@01)))
    (=
      ($FVF.lookup_f (as sm@309@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@300@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@309@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@300@01  $FVF<f>) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3)) (img@305@01 r))
      (ite
        (and
          (img@297@01 r)
          (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
        (< $Perm.No (- $Perm.Write (pTaken@299@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@309@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@289@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@309@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@289@01  $FVF<f>) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@304@01 r)) (< (inv@304@01 r) 3)) (img@305@01 r))
      (and (img@294@01 r) (and (<= 0 (inv@293@01 r)) (< (inv@293@01 r) 3))))
    (=
      ($FVF.lookup_f (as sm@309@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@284@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@309@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@284@01  $FVF<f>) r))
  :qid |qp.fvfValDef117|)))
(declare-const j@310@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 150 | !(3 <= j@310@01) | live]
; [else-branch: 150 | 3 <= j@310@01 | live]
(push) ; 5
; [then-branch: 150 | !(3 <= j@310@01)]
(assert (not (<= 3 j@310@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 150 | 3 <= j@310@01]
(assert (<= 3 j@310@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@310@01) (not (<= 3 j@310@01))))
(assert (and (<= 3 j@310@01) (< j@310@01 n@259@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@310@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@310@01 (Seq_length xs@258@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@311@01 ($Ref) Int)
(declare-fun img@312@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@310@01 Int)) (!
  (=>
    (and (<= 3 j@310@01) (< j@310@01 n@259@01))
    (or (<= 3 j@310@01) (not (<= 3 j@310@01))))
  :pattern ((Seq_index xs@258@01 j@310@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@310@01 Int) (j2@310@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@310@01) (< j1@310@01 n@259@01))
      (and (<= 3 j2@310@01) (< j2@310@01 n@259@01))
      (= (Seq_index xs@258@01 j1@310@01) (Seq_index xs@258@01 j2@310@01)))
    (= j1@310@01 j2@310@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@310@01 Int)) (!
  (=>
    (and (<= 3 j@310@01) (< j@310@01 n@259@01))
    (and
      (= (inv@311@01 (Seq_index xs@258@01 j@310@01)) j@310@01)
      (img@312@01 (Seq_index xs@258@01 j@310@01))))
  :pattern ((Seq_index xs@258@01 j@310@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@312@01 r) (and (<= 3 (inv@311@01 r)) (< (inv@311@01 r) n@259@01)))
    (= (Seq_index xs@258@01 (inv@311@01 r)) r))
  :pattern ((inv@311@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@313@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@311@01 r)) (< (inv@311@01 r) n@259@01))
      (img@312@01 r)
      (= r (Seq_index xs@258@01 (inv@311@01 r))))
    ($Perm.min
      (ite
        (and
          (img@297@01 r)
          (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
        (- $Perm.Write (pTaken@299@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@314@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@311@01 r)) (< (inv@311@01 r) n@259@01))
      (img@312@01 r)
      (= r (Seq_index xs@258@01 (inv@311@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@258@01 i@260@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@313@01 r)))
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
          (img@297@01 r)
          (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
        (- $Perm.Write (pTaken@299@01 r))
        $Perm.No)
      (pTaken@313@01 r))
    $Perm.No)
  
  :qid |quant-u-240|))))
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
      (and (<= 3 (inv@311@01 r)) (< (inv@311@01 r) n@259@01))
      (img@312@01 r)
      (= r (Seq_index xs@258@01 (inv@311@01 r))))
    (= (- $Perm.Write (pTaken@313@01 r)) $Perm.No))
  
  :qid |quant-u-241|))))
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
      (= (Seq_index xs@258@01 i@260@01) (Seq_index xs@258@01 i@260@01))
      $Perm.Write
      $Perm.No)
    (pTaken@314@01 (Seq_index xs@258@01 i@260@01)))
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
      (and (<= 3 (inv@311@01 r)) (< (inv@311@01 r) n@259@01))
      (img@312@01 r)
      (= r (Seq_index xs@258@01 (inv@311@01 r))))
    (= (- (- $Perm.Write (pTaken@313@01 r)) (pTaken@314@01 r)) $Perm.No))
  
  :qid |quant-u-243|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@315@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@315@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@311@01 r)) (< (inv@311@01 r) n@259@01))
        (img@312@01 r)))
    (=>
      (and
        (and (<= 3 (inv@311@01 r)) (< (inv@311@01 r) n@259@01))
        (img@312@01 r))
      (Set_in r ($FVF.domain_f (as sm@315@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@315@01  $FVF<f>))))
  :qid |qp.fvfDomDef121|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@311@01 r)) (< (inv@311@01 r) n@259@01))
        (img@312@01 r))
      (= r (Seq_index xs@258@01 i@260@01)))
    (=
      ($FVF.lookup_f (as sm@315@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@300@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@315@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@300@01  $FVF<f>) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@311@01 r)) (< (inv@311@01 r) n@259@01))
        (img@312@01 r))
      (ite
        (and
          (img@297@01 r)
          (and (<= 3 (inv@296@01 r)) (< (inv@296@01 r) n@259@01)))
        (< $Perm.No (- $Perm.Write (pTaken@299@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@315@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@289@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@315@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@289@01  $FVF<f>) r))
  :qid |qp.fvfValDef120|)))
(assert (P02%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@309@01  $FVF<f>))
        ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>)))))) xs@258@01 n@259@01))
; [exec]
; v2 := fun06(xs, n, i)
; [eval] fun06(xs, n, i)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(assert (fun06%precondition ($Snap.combine
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@309@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>))))))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@258@01 n@259@01 i@260@01))
(pop) ; 3
; Joined path conditions
(assert (fun06%precondition ($Snap.combine
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@309@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>))))))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@258@01 n@259@01 i@260@01))
(declare-const v2@316@01 Int)
(assert (=
  v2@316@01
  (fun06 ($Snap.combine
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@309@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>))))))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@258@01 n@259@01 i@260@01)))
; [exec]
; assert v2 == 0
; [eval] v2 == 0
(push) ; 3
(assert (not (= v2@316@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= v2@316@01 0))
; [exec]
; assert v2 == v1
; [eval] v2 == v1
(push) ; 3
(assert (not (= v2@316@01 v1@276@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 == v1
(set-option :timeout 0)
(push) ; 3
(assert (not (= v2@316@01 v1@276@01)))
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
; [eval] v2 == v1
(set-option :timeout 0)
(push) ; 3
(assert (not (= v2@316@01 v1@276@01)))
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
; [eval] v2 == v1
(set-option :timeout 0)
(push) ; 3
(assert (not (= v2@316@01 v1@276@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@317@01 $Ref)
(declare-const n@318@01 Int)
(declare-const x@319@01 $Ref)
(declare-const n@320@01 Int)
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
; var v1: Int
(declare-const v1@321@01 Int)
; [exec]
; var v2: Int
(declare-const v2@322@01 Int)
; [exec]
; inhale acc(P01(x, n), write)
(declare-const $t@323@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 6 < n
(declare-const $t@324@01 $Snap)
(assert (= $t@324@01 $Snap.unit))
; [eval] 6 < n
(assert (< 6 n@320@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(P01(x, n), write)
(assert (= $t@323@01 ($Snap.combine ($Snap.first $t@323@01) ($Snap.second $t@323@01))))
(assert (not (= x@319@01 $Ref.null)))
(assert (=
  ($Snap.second $t@323@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@323@01))
    ($Snap.second ($Snap.second $t@323@01)))))
(assert (= ($Snap.first ($Snap.second $t@323@01)) $Snap.unit))
; [eval] |x.ss| == n
; [eval] |x.ss|
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))
  n@320@01))
(assert (=
  ($Snap.second ($Snap.second $t@323@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@323@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@323@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@323@01))) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@320@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@323@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@323@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@323@01))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@325@01 Int)
(declare-const j@326@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 151 | !(k@325@01 >= 0) | live]
; [else-branch: 151 | k@325@01 >= 0 | live]
(push) ; 5
; [then-branch: 151 | !(k@325@01 >= 0)]
(assert (not (>= k@325@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 151 | k@325@01 >= 0]
(assert (>= k@325@01 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 6
; [then-branch: 152 | !(k@325@01 < |First:($t@323@01)|) | live]
; [else-branch: 152 | k@325@01 < |First:($t@323@01)| | live]
(push) ; 7
; [then-branch: 152 | !(k@325@01 < |First:($t@323@01)|)]
(assert (not
  (<
    k@325@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(pop) ; 7
(push) ; 7
; [else-branch: 152 | k@325@01 < |First:($t@323@01)|]
(assert (<
  k@325@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 153 | !(j@326@01 >= 0) | live]
; [else-branch: 153 | j@326@01 >= 0 | live]
(push) ; 9
; [then-branch: 153 | !(j@326@01 >= 0)]
(assert (not (>= j@326@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 153 | j@326@01 >= 0]
(assert (>= j@326@01 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 10
; [then-branch: 154 | !(j@326@01 < |First:($t@323@01)|) | live]
; [else-branch: 154 | j@326@01 < |First:($t@323@01)| | live]
(push) ; 11
; [then-branch: 154 | !(j@326@01 < |First:($t@323@01)|)]
(assert (not
  (<
    j@326@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(pop) ; 11
(push) ; 11
; [else-branch: 154 | j@326@01 < |First:($t@323@01)|]
(assert (<
  j@326@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@326@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (not
    (<
      j@326@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@326@01 0)
  (and
    (>= j@326@01 0)
    (or
      (<
        j@326@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (not
        (<
          j@326@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))))
(assert (or (>= j@326@01 0) (not (>= j@326@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    k@325@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (and
    (<
      k@325@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (=>
      (>= j@326@01 0)
      (and
        (>= j@326@01 0)
        (or
          (<
            j@326@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not
            (<
              j@326@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
    (or (>= j@326@01 0) (not (>= j@326@01 0))))))
(assert (or
  (<
    k@325@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (not
    (<
      k@325@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@325@01 0)
  (and
    (>= k@325@01 0)
    (=>
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (=>
          (>= j@326@01 0)
          (and
            (>= j@326@01 0)
            (or
              (<
                j@326@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not
                (<
                  j@326@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
        (or (>= j@326@01 0) (not (>= j@326@01 0)))))
    (or
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (not
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))))
(assert (or (>= k@325@01 0) (not (>= k@325@01 0))))
(push) ; 4
; [then-branch: 155 | k@325@01 >= 0 && k@325@01 < |First:($t@323@01)| && j@326@01 >= 0 && j@326@01 < |First:($t@323@01)| && k@325@01 != j@326@01 | live]
; [else-branch: 155 | !(k@325@01 >= 0 && k@325@01 < |First:($t@323@01)| && j@326@01 >= 0 && j@326@01 < |First:($t@323@01)| && k@325@01 != j@326@01) | live]
(push) ; 5
; [then-branch: 155 | k@325@01 >= 0 && k@325@01 < |First:($t@323@01)| && j@326@01 >= 0 && j@326@01 < |First:($t@323@01)| && k@325@01 != j@326@01]
(assert (and
  (>= k@325@01 0)
  (and
    (<
      k@325@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (and
      (>= j@326@01 0)
      (and
        (<
          j@326@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (not (= k@325@01 j@326@01)))))))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 5
(push) ; 5
; [else-branch: 155 | !(k@325@01 >= 0 && k@325@01 < |First:($t@323@01)| && j@326@01 >= 0 && j@326@01 < |First:($t@323@01)| && k@325@01 != j@326@01)]
(assert (not
  (and
    (>= k@325@01 0)
    (and
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@326@01 0)
        (and
          (<
            j@326@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@325@01 j@326@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@325@01 0)
    (and
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@326@01 0)
        (and
          (<
            j@326@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@325@01 j@326@01))))))
  (and
    (>= k@325@01 0)
    (<
      k@325@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (>= j@326@01 0)
    (<
      j@326@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (not (= k@325@01 j@326@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@325@01 0)
      (and
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@326@01 0)
          (and
            (<
              j@326@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@325@01 j@326@01)))))))
  (and
    (>= k@325@01 0)
    (and
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@326@01 0)
        (and
          (<
            j@326@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@325@01 j@326@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@325@01 Int) (j@326@01 Int)) (!
  (and
    (=>
      (>= k@325@01 0)
      (and
        (>= k@325@01 0)
        (=>
          (<
            k@325@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (<
              k@325@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (=>
              (>= j@326@01 0)
              (and
                (>= j@326@01 0)
                (or
                  (<
                    j@326@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
                  (not
                    (<
                      j@326@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
            (or (>= j@326@01 0) (not (>= j@326@01 0)))))
        (or
          (<
            k@325@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not
            (<
              k@325@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
    (or (>= k@325@01 0) (not (>= k@325@01 0)))
    (=>
      (and
        (>= k@325@01 0)
        (and
          (<
            k@325@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (>= j@326@01 0)
            (and
              (<
                j@326@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not (= k@325@01 j@326@01))))))
      (and
        (>= k@325@01 0)
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (>= j@326@01 0)
        (<
          j@326@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (not (= k@325@01 j@326@01))))
    (or
      (not
        (and
          (>= k@325@01 0)
          (and
            (<
              k@325@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (and
              (>= j@326@01 0)
              (and
                (<
                  j@326@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
                (not (= k@325@01 j@326@01)))))))
      (and
        (>= k@325@01 0)
        (and
          (<
            k@325@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (>= j@326@01 0)
            (and
              (<
                j@326@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not (= k@325@01 j@326@01))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@325@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@326@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109-aux|)))
(assert (forall ((k@325@01 Int) (j@326@01 Int)) (!
  (=>
    (and
      (>= k@325@01 0)
      (and
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@326@01 0)
          (and
            (<
              j@326@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@325@01 j@326@01))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          k@325@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@326@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@325@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@326@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01))))))))
(declare-const j@327@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 156 | !(0 <= j@327@01) | live]
; [else-branch: 156 | 0 <= j@327@01 | live]
(push) ; 5
; [then-branch: 156 | !(0 <= j@327@01)]
(assert (not (<= 0 j@327@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 156 | 0 <= j@327@01]
(assert (<= 0 j@327@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@327@01) (not (<= 0 j@327@01))))
(assert (and (<= 0 j@327@01) (< j@327@01 3)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@327@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@327@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@328@01 ($Ref) Int)
(declare-fun img@329@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@327@01 Int)) (!
  (=>
    (and (<= 0 j@327@01) (< j@327@01 3))
    (or (<= 0 j@327@01) (not (<= 0 j@327@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@327@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@327@01 Int) (j2@327@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@327@01) (< j1@327@01 3))
      (and (<= 0 j2@327@01) (< j2@327@01 3))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j1@327@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j2@327@01)))
    (= j1@327@01 j2@327@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@327@01 Int)) (!
  (=>
    (and (<= 0 j@327@01) (< j@327@01 3))
    (and
      (=
        (inv@328@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@327@01))
        j@327@01)
      (img@329@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@327@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@327@01))
  :qid |quant-u-245|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        (inv@328@01 r))
      r))
  :pattern ((inv@328@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@327@01 Int)) (!
  (=>
    (and (<= 0 j@327@01) (< j@327@01 3))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@327@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@327@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@330@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 157 | !(3 <= j@330@01) | live]
; [else-branch: 157 | 3 <= j@330@01 | live]
(push) ; 5
; [then-branch: 157 | !(3 <= j@330@01)]
(assert (not (<= 3 j@330@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 157 | 3 <= j@330@01]
(assert (<= 3 j@330@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@330@01) (not (<= 3 j@330@01))))
(assert (and (<= 3 j@330@01) (< j@330@01 n@320@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@330@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@330@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@331@01 ($Ref) Int)
(declare-fun img@332@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@330@01 Int)) (!
  (=>
    (and (<= 3 j@330@01) (< j@330@01 n@320@01))
    (or (<= 3 j@330@01) (not (<= 3 j@330@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@330@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@330@01 Int) (j2@330@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@330@01) (< j1@330@01 n@320@01))
      (and (<= 3 j2@330@01) (< j2@330@01 n@320@01))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j1@330@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j2@330@01)))
    (= j1@330@01 j2@330@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@330@01 Int)) (!
  (=>
    (and (<= 3 j@330@01) (< j@330@01 n@320@01))
    (and
      (=
        (inv@331@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@330@01))
        j@330@01)
      (img@332@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@330@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@330@01))
  :qid |quant-u-247|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@332@01 r) (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        (inv@331@01 r))
      r))
  :pattern ((inv@331@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@330@01 Int)) (!
  (=>
    (and (<= 3 j@330@01) (< j@330@01 n@320@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@330@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@330@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@330@01)
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@327@01))
    (=
      (and
        (img@332@01 r)
        (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01)))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))))
  
  :qid |quant-u-248|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P01%trigger $t@323@01 x@319@01 n@320@01))
; [exec]
; v1 := x.ss[2].f
; [eval] x.ss[2]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 2 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@333@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
    (=
      ($FVF.lookup_f (as sm@333@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@333@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@332@01 r) (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01)))
    (=
      ($FVF.lookup_f (as sm@333@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@333@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r))
  :qid |qp.fvfValDef123|)))
(declare-const pm@334@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@334@01  $FPM) r)
    (+
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@332@01 r)
          (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@334@01  $FPM) r))
  :qid |qp.resPrmSumDef124|)))
(push) ; 3
(assert (not (<
  $Perm.No
  ($FVF.perm_f (as pm@334@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const v1@335@01 Int)
(assert (=
  v1@335@01
  ($FVF.lookup_f (as sm@333@01  $FVF<f>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    2))))
; [exec]
; v2 := x.ss[4].f
; [eval] x.ss[4]
(push) ; 3
(assert (not (< 4 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
      (=
        ($FVF.lookup_f (as sm@333@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r)))
    :pattern (($FVF.lookup_f (as sm@333@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r))
    :qid |qp.fvfValDef122|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@332@01 r)
        (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01)))
      (=
        ($FVF.lookup_f (as sm@333@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r)))
    :pattern (($FVF.lookup_f (as sm@333@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r))
    :qid |qp.fvfValDef123|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@329@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          4))
        (and
          (<=
            0
            (inv@328@01 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
              4)))
          (<
            (inv@328@01 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
              4))
            3)))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@332@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          4))
        (and
          (<=
            3
            (inv@331@01 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
              4)))
          (<
            (inv@331@01 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
              4))
            n@320@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const v2@336@01 Int)
(assert (=
  v2@336@01
  ($FVF.lookup_f (as sm@333@01  $FVF<f>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    4))))
; [exec]
; fold acc(P01(x, n), write)
; [eval] |x.ss| == n
; [eval] |x.ss|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@337@01 Int)
(declare-const j@338@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 158 | !(k@337@01 >= 0) | live]
; [else-branch: 158 | k@337@01 >= 0 | live]
(push) ; 5
; [then-branch: 158 | !(k@337@01 >= 0)]
(assert (not (>= k@337@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 158 | k@337@01 >= 0]
(assert (>= k@337@01 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 6
; [then-branch: 159 | !(k@337@01 < |First:($t@323@01)|) | live]
; [else-branch: 159 | k@337@01 < |First:($t@323@01)| | live]
(push) ; 7
; [then-branch: 159 | !(k@337@01 < |First:($t@323@01)|)]
(assert (not
  (<
    k@337@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(pop) ; 7
(push) ; 7
; [else-branch: 159 | k@337@01 < |First:($t@323@01)|]
(assert (<
  k@337@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 160 | !(j@338@01 >= 0) | live]
; [else-branch: 160 | j@338@01 >= 0 | live]
(push) ; 9
; [then-branch: 160 | !(j@338@01 >= 0)]
(assert (not (>= j@338@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 160 | j@338@01 >= 0]
(assert (>= j@338@01 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 10
; [then-branch: 161 | !(j@338@01 < |First:($t@323@01)|) | live]
; [else-branch: 161 | j@338@01 < |First:($t@323@01)| | live]
(push) ; 11
; [then-branch: 161 | !(j@338@01 < |First:($t@323@01)|)]
(assert (not
  (<
    j@338@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(pop) ; 11
(push) ; 11
; [else-branch: 161 | j@338@01 < |First:($t@323@01)|]
(assert (<
  j@338@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@338@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (not
    (<
      j@338@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@338@01 0)
  (and
    (>= j@338@01 0)
    (or
      (<
        j@338@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (not
        (<
          j@338@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))))
(assert (or (>= j@338@01 0) (not (>= j@338@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    k@337@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (and
    (<
      k@337@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (=>
      (>= j@338@01 0)
      (and
        (>= j@338@01 0)
        (or
          (<
            j@338@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not
            (<
              j@338@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
    (or (>= j@338@01 0) (not (>= j@338@01 0))))))
(assert (or
  (<
    k@337@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (not
    (<
      k@337@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@337@01 0)
  (and
    (>= k@337@01 0)
    (=>
      (<
        k@337@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (<
          k@337@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (=>
          (>= j@338@01 0)
          (and
            (>= j@338@01 0)
            (or
              (<
                j@338@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not
                (<
                  j@338@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
        (or (>= j@338@01 0) (not (>= j@338@01 0)))))
    (or
      (<
        k@337@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (not
        (<
          k@337@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))))
(assert (or (>= k@337@01 0) (not (>= k@337@01 0))))
(push) ; 4
; [then-branch: 162 | k@337@01 >= 0 && k@337@01 < |First:($t@323@01)| && j@338@01 >= 0 && j@338@01 < |First:($t@323@01)| && k@337@01 != j@338@01 | live]
; [else-branch: 162 | !(k@337@01 >= 0 && k@337@01 < |First:($t@323@01)| && j@338@01 >= 0 && j@338@01 < |First:($t@323@01)| && k@337@01 != j@338@01) | live]
(push) ; 5
; [then-branch: 162 | k@337@01 >= 0 && k@337@01 < |First:($t@323@01)| && j@338@01 >= 0 && j@338@01 < |First:($t@323@01)| && k@337@01 != j@338@01]
(assert (and
  (>= k@337@01 0)
  (and
    (<
      k@337@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (and
      (>= j@338@01 0)
      (and
        (<
          j@338@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (not (= k@337@01 j@338@01)))))))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 5
(push) ; 5
; [else-branch: 162 | !(k@337@01 >= 0 && k@337@01 < |First:($t@323@01)| && j@338@01 >= 0 && j@338@01 < |First:($t@323@01)| && k@337@01 != j@338@01)]
(assert (not
  (and
    (>= k@337@01 0)
    (and
      (<
        k@337@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@338@01 0)
        (and
          (<
            j@338@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@337@01 j@338@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@337@01 0)
    (and
      (<
        k@337@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@338@01 0)
        (and
          (<
            j@338@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@337@01 j@338@01))))))
  (and
    (>= k@337@01 0)
    (<
      k@337@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (>= j@338@01 0)
    (<
      j@338@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (not (= k@337@01 j@338@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@337@01 0)
      (and
        (<
          k@337@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@338@01 0)
          (and
            (<
              j@338@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@337@01 j@338@01)))))))
  (and
    (>= k@337@01 0)
    (and
      (<
        k@337@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@338@01 0)
        (and
          (<
            j@338@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@337@01 j@338@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@337@01 Int) (j@338@01 Int)) (!
  (and
    (=>
      (>= k@337@01 0)
      (and
        (>= k@337@01 0)
        (=>
          (<
            k@337@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (<
              k@337@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (=>
              (>= j@338@01 0)
              (and
                (>= j@338@01 0)
                (or
                  (<
                    j@338@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
                  (not
                    (<
                      j@338@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
            (or (>= j@338@01 0) (not (>= j@338@01 0)))))
        (or
          (<
            k@337@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not
            (<
              k@337@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
    (or (>= k@337@01 0) (not (>= k@337@01 0)))
    (=>
      (and
        (>= k@337@01 0)
        (and
          (<
            k@337@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (>= j@338@01 0)
            (and
              (<
                j@338@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not (= k@337@01 j@338@01))))))
      (and
        (>= k@337@01 0)
        (<
          k@337@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (>= j@338@01 0)
        (<
          j@338@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (not (= k@337@01 j@338@01))))
    (or
      (not
        (and
          (>= k@337@01 0)
          (and
            (<
              k@337@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (and
              (>= j@338@01 0)
              (and
                (<
                  j@338@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
                (not (= k@337@01 j@338@01)))))))
      (and
        (>= k@337@01 0)
        (and
          (<
            k@337@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (>= j@338@01 0)
            (and
              (<
                j@338@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not (= k@337@01 j@338@01))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@337@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@338@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109-aux|)))
(push) ; 3
(assert (not (forall ((k@337@01 Int) (j@338@01 Int)) (!
  (=>
    (and
      (>= k@337@01 0)
      (and
        (<
          k@337@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@338@01 0)
          (and
            (<
              j@338@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@337@01 j@338@01))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          k@337@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@338@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@337@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@338@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@337@01 Int) (j@338@01 Int)) (!
  (=>
    (and
      (>= k@337@01 0)
      (and
        (<
          k@337@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@338@01 0)
          (and
            (<
              j@338@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@337@01 j@338@01))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          k@337@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@338@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@337@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@338@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109|)))
(declare-const j@339@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 163 | !(0 <= j@339@01) | live]
; [else-branch: 163 | 0 <= j@339@01 | live]
(push) ; 5
; [then-branch: 163 | !(0 <= j@339@01)]
(assert (not (<= 0 j@339@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 163 | 0 <= j@339@01]
(assert (<= 0 j@339@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@339@01) (not (<= 0 j@339@01))))
(assert (and (<= 0 j@339@01) (< j@339@01 3)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@339@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@339@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@340@01 ($Ref) Int)
(declare-fun img@341@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@339@01 Int)) (!
  (=>
    (and (<= 0 j@339@01) (< j@339@01 3))
    (or (<= 0 j@339@01) (not (<= 0 j@339@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@339@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@339@01 Int) (j2@339@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@339@01) (< j1@339@01 3))
      (and (<= 0 j2@339@01) (< j2@339@01 3))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j1@339@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j2@339@01)))
    (= j1@339@01 j2@339@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@339@01 Int)) (!
  (=>
    (and (<= 0 j@339@01) (< j@339@01 3))
    (and
      (=
        (inv@340@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@339@01))
        j@339@01)
      (img@341@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@339@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@339@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@341@01 r) (and (<= 0 (inv@340@01 r)) (< (inv@340@01 r) 3)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        (inv@340@01 r))
      r))
  :pattern ((inv@340@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@342@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@340@01 r)) (< (inv@340@01 r) 3))
      (img@341@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@340@01 r))))
    ($Perm.min
      (ite
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@343@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@340@01 r)) (< (inv@340@01 r) 3))
      (img@341@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@340@01 r))))
    ($Perm.min
      (ite
        (and
          (img@332@01 r)
          (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@342@01 r)))
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
        (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@342@01 r))
    $Perm.No)
  
  :qid |quant-u-251|))))
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
      (and (<= 0 (inv@340@01 r)) (< (inv@340@01 r) 3))
      (img@341@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@340@01 r))))
    (= (- $Perm.Write (pTaken@342@01 r)) $Perm.No))
  
  :qid |quant-u-252|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@344@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@344@01  $FVF<f>)))
      (and (and (<= 0 (inv@340@01 r)) (< (inv@340@01 r) 3)) (img@341@01 r)))
    (=>
      (and (and (<= 0 (inv@340@01 r)) (< (inv@340@01 r) 3)) (img@341@01 r))
      (Set_in r ($FVF.domain_f (as sm@344@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@344@01  $FVF<f>))))
  :qid |qp.fvfDomDef127|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@340@01 r)) (< (inv@340@01 r) 3)) (img@341@01 r))
      (and (img@329@01 r) (and (<= 0 (inv@328@01 r)) (< (inv@328@01 r) 3))))
    (=
      ($FVF.lookup_f (as sm@344@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@344@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r))
  :qid |qp.fvfValDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@340@01 r)) (< (inv@340@01 r) 3)) (img@341@01 r))
      (and
        (img@332@01 r)
        (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01))))
    (=
      ($FVF.lookup_f (as sm@344@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@344@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r))
  :qid |qp.fvfValDef126|)))
(declare-const j@345@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 164 | !(3 <= j@345@01) | live]
; [else-branch: 164 | 3 <= j@345@01 | live]
(push) ; 5
; [then-branch: 164 | !(3 <= j@345@01)]
(assert (not (<= 3 j@345@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 164 | 3 <= j@345@01]
(assert (<= 3 j@345@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@345@01) (not (<= 3 j@345@01))))
(assert (and (<= 3 j@345@01) (< j@345@01 n@320@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@345@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@345@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@346@01 ($Ref) Int)
(declare-fun img@347@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@345@01 Int)) (!
  (=>
    (and (<= 3 j@345@01) (< j@345@01 n@320@01))
    (or (<= 3 j@345@01) (not (<= 3 j@345@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@345@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@345@01 Int) (j2@345@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@345@01) (< j1@345@01 n@320@01))
      (and (<= 3 j2@345@01) (< j2@345@01 n@320@01))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j1@345@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j2@345@01)))
    (= j1@345@01 j2@345@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@345@01 Int)) (!
  (=>
    (and (<= 3 j@345@01) (< j@345@01 n@320@01))
    (and
      (=
        (inv@346@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@345@01))
        j@345@01)
      (img@347@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@345@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@345@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@347@01 r) (and (<= 3 (inv@346@01 r)) (< (inv@346@01 r) n@320@01)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        (inv@346@01 r))
      r))
  :pattern ((inv@346@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@348@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@346@01 r)) (< (inv@346@01 r) n@320@01))
      (img@347@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@346@01 r))))
    ($Perm.min
      (ite
        (and
          (img@332@01 r)
          (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01)))
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
          (img@332@01 r)
          (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@348@01 r))
    $Perm.No)
  
  :qid |quant-u-255|))))
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
      (and (<= 3 (inv@346@01 r)) (< (inv@346@01 r) n@320@01))
      (img@347@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@346@01 r))))
    (= (- $Perm.Write (pTaken@348@01 r)) $Perm.No))
  
  :qid |quant-u-256|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@349@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@349@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@346@01 r)) (< (inv@346@01 r) n@320@01))
        (img@347@01 r)))
    (=>
      (and
        (and (<= 3 (inv@346@01 r)) (< (inv@346@01 r) n@320@01))
        (img@347@01 r))
      (Set_in r ($FVF.domain_f (as sm@349@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@349@01  $FVF<f>))))
  :qid |qp.fvfDomDef129|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@346@01 r)) (< (inv@346@01 r) n@320@01))
        (img@347@01 r))
      (and
        (img@332@01 r)
        (and (<= 3 (inv@331@01 r)) (< (inv@331@01 r) n@320@01))))
    (=
      ($FVF.lookup_f (as sm@349@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@349@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))) r))
  :qid |qp.fvfValDef128|)))
(assert (P01%trigger ($Snap.combine
  ($Snap.first $t@323@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@344@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>))))))) x@319@01 n@320@01))
; [exec]
; assert v1 == fun04(x, n, 2)
; [eval] v1 == fun04(x, n, 2)
; [eval] fun04(x, n, 2)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(push) ; 4
(assert (not (< 2 n@320@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 2 n@320@01))
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@323@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@344@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 2))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 2 n@320@01)
  (fun04%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@344@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 2)))
(push) ; 3
(assert (not (=
  v1@335@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@344@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  v1@335@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@344@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 2)))
; [exec]
; assert v2 == fun04(x, n, 4)
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(push) ; 4
(assert (not (< 4 n@320@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 4 n@320@01))
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@323@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@344@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 4 n@320@01)
  (fun04%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@344@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4)))
(push) ; 3
(assert (not (=
  v2@336@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@344@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  v2@336@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@344@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@349@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4)))
; [exec]
; unfold acc(P01(x, n), write)
; [eval] |x.ss| == n
; [eval] |x.ss|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@350@01 Int)
(declare-const j@351@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 165 | !(k@350@01 >= 0) | live]
; [else-branch: 165 | k@350@01 >= 0 | live]
(push) ; 5
; [then-branch: 165 | !(k@350@01 >= 0)]
(assert (not (>= k@350@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 165 | k@350@01 >= 0]
(assert (>= k@350@01 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 6
; [then-branch: 166 | !(k@350@01 < |First:($t@323@01)|) | live]
; [else-branch: 166 | k@350@01 < |First:($t@323@01)| | live]
(push) ; 7
; [then-branch: 166 | !(k@350@01 < |First:($t@323@01)|)]
(assert (not
  (<
    k@350@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(pop) ; 7
(push) ; 7
; [else-branch: 166 | k@350@01 < |First:($t@323@01)|]
(assert (<
  k@350@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 167 | !(j@351@01 >= 0) | live]
; [else-branch: 167 | j@351@01 >= 0 | live]
(push) ; 9
; [then-branch: 167 | !(j@351@01 >= 0)]
(assert (not (>= j@351@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 167 | j@351@01 >= 0]
(assert (>= j@351@01 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 10
; [then-branch: 168 | !(j@351@01 < |First:($t@323@01)|) | live]
; [else-branch: 168 | j@351@01 < |First:($t@323@01)| | live]
(push) ; 11
; [then-branch: 168 | !(j@351@01 < |First:($t@323@01)|)]
(assert (not
  (<
    j@351@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(pop) ; 11
(push) ; 11
; [else-branch: 168 | j@351@01 < |First:($t@323@01)|]
(assert (<
  j@351@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@351@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (not
    (<
      j@351@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@351@01 0)
  (and
    (>= j@351@01 0)
    (or
      (<
        j@351@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (not
        (<
          j@351@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))))
(assert (or (>= j@351@01 0) (not (>= j@351@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    k@350@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (and
    (<
      k@350@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (=>
      (>= j@351@01 0)
      (and
        (>= j@351@01 0)
        (or
          (<
            j@351@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not
            (<
              j@351@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
    (or (>= j@351@01 0) (not (>= j@351@01 0))))))
(assert (or
  (<
    k@350@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (not
    (<
      k@350@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@350@01 0)
  (and
    (>= k@350@01 0)
    (=>
      (<
        k@350@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (<
          k@350@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (=>
          (>= j@351@01 0)
          (and
            (>= j@351@01 0)
            (or
              (<
                j@351@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not
                (<
                  j@351@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
        (or (>= j@351@01 0) (not (>= j@351@01 0)))))
    (or
      (<
        k@350@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (not
        (<
          k@350@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))))
(assert (or (>= k@350@01 0) (not (>= k@350@01 0))))
(push) ; 4
; [then-branch: 169 | k@350@01 >= 0 && k@350@01 < |First:($t@323@01)| && j@351@01 >= 0 && j@351@01 < |First:($t@323@01)| && k@350@01 != j@351@01 | live]
; [else-branch: 169 | !(k@350@01 >= 0 && k@350@01 < |First:($t@323@01)| && j@351@01 >= 0 && j@351@01 < |First:($t@323@01)| && k@350@01 != j@351@01) | live]
(push) ; 5
; [then-branch: 169 | k@350@01 >= 0 && k@350@01 < |First:($t@323@01)| && j@351@01 >= 0 && j@351@01 < |First:($t@323@01)| && k@350@01 != j@351@01]
(assert (and
  (>= k@350@01 0)
  (and
    (<
      k@350@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (and
      (>= j@351@01 0)
      (and
        (<
          j@351@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (not (= k@350@01 j@351@01)))))))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 5
(push) ; 5
; [else-branch: 169 | !(k@350@01 >= 0 && k@350@01 < |First:($t@323@01)| && j@351@01 >= 0 && j@351@01 < |First:($t@323@01)| && k@350@01 != j@351@01)]
(assert (not
  (and
    (>= k@350@01 0)
    (and
      (<
        k@350@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@351@01 0)
        (and
          (<
            j@351@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@350@01 j@351@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@350@01 0)
    (and
      (<
        k@350@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@351@01 0)
        (and
          (<
            j@351@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@350@01 j@351@01))))))
  (and
    (>= k@350@01 0)
    (<
      k@350@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (>= j@351@01 0)
    (<
      j@351@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (not (= k@350@01 j@351@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@350@01 0)
      (and
        (<
          k@350@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@351@01 0)
          (and
            (<
              j@351@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@350@01 j@351@01)))))))
  (and
    (>= k@350@01 0)
    (and
      (<
        k@350@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@351@01 0)
        (and
          (<
            j@351@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@350@01 j@351@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@350@01 Int) (j@351@01 Int)) (!
  (and
    (=>
      (>= k@350@01 0)
      (and
        (>= k@350@01 0)
        (=>
          (<
            k@350@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (<
              k@350@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (=>
              (>= j@351@01 0)
              (and
                (>= j@351@01 0)
                (or
                  (<
                    j@351@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
                  (not
                    (<
                      j@351@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
            (or (>= j@351@01 0) (not (>= j@351@01 0)))))
        (or
          (<
            k@350@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not
            (<
              k@350@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
    (or (>= k@350@01 0) (not (>= k@350@01 0)))
    (=>
      (and
        (>= k@350@01 0)
        (and
          (<
            k@350@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (>= j@351@01 0)
            (and
              (<
                j@351@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not (= k@350@01 j@351@01))))))
      (and
        (>= k@350@01 0)
        (<
          k@350@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (>= j@351@01 0)
        (<
          j@351@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (not (= k@350@01 j@351@01))))
    (or
      (not
        (and
          (>= k@350@01 0)
          (and
            (<
              k@350@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (and
              (>= j@351@01 0)
              (and
                (<
                  j@351@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
                (not (= k@350@01 j@351@01)))))))
      (and
        (>= k@350@01 0)
        (and
          (<
            k@350@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (>= j@351@01 0)
            (and
              (<
                j@351@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not (= k@350@01 j@351@01))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@350@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@351@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109-aux|)))
(assert (forall ((k@350@01 Int) (j@351@01 Int)) (!
  (=>
    (and
      (>= k@350@01 0)
      (and
        (<
          k@350@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@351@01 0)
          (and
            (<
              j@351@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@350@01 j@351@01))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          k@350@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@351@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@350@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@351@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109|)))
(declare-const j@352@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 170 | !(0 <= j@352@01) | live]
; [else-branch: 170 | 0 <= j@352@01 | live]
(push) ; 5
; [then-branch: 170 | !(0 <= j@352@01)]
(assert (not (<= 0 j@352@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 170 | 0 <= j@352@01]
(assert (<= 0 j@352@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@352@01) (not (<= 0 j@352@01))))
(assert (and (<= 0 j@352@01) (< j@352@01 3)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@352@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@352@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@353@01 ($Ref) Int)
(declare-fun img@354@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@352@01 Int)) (!
  (=>
    (and (<= 0 j@352@01) (< j@352@01 3))
    (or (<= 0 j@352@01) (not (<= 0 j@352@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@352@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@352@01 Int) (j2@352@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@352@01) (< j1@352@01 3))
      (and (<= 0 j2@352@01) (< j2@352@01 3))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j1@352@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j2@352@01)))
    (= j1@352@01 j2@352@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@352@01 Int)) (!
  (=>
    (and (<= 0 j@352@01) (< j@352@01 3))
    (and
      (=
        (inv@353@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@352@01))
        j@352@01)
      (img@354@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@352@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@352@01))
  :qid |quant-u-258|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@354@01 r) (and (<= 0 (inv@353@01 r)) (< (inv@353@01 r) 3)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        (inv@353@01 r))
      r))
  :pattern ((inv@353@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@352@01 Int)) (!
  (=>
    (and (<= 0 j@352@01) (< j@352@01 3))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@352@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@352@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@355@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 171 | !(3 <= j@355@01) | live]
; [else-branch: 171 | 3 <= j@355@01 | live]
(push) ; 5
; [then-branch: 171 | !(3 <= j@355@01)]
(assert (not (<= 3 j@355@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 171 | 3 <= j@355@01]
(assert (<= 3 j@355@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@355@01) (not (<= 3 j@355@01))))
(assert (and (<= 3 j@355@01) (< j@355@01 n@320@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@355@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@355@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@356@01 ($Ref) Int)
(declare-fun img@357@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@355@01 Int)) (!
  (=>
    (and (<= 3 j@355@01) (< j@355@01 n@320@01))
    (or (<= 3 j@355@01) (not (<= 3 j@355@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@355@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@355@01 Int) (j2@355@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@355@01) (< j1@355@01 n@320@01))
      (and (<= 3 j2@355@01) (< j2@355@01 n@320@01))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j1@355@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j2@355@01)))
    (= j1@355@01 j2@355@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@355@01 Int)) (!
  (=>
    (and (<= 3 j@355@01) (< j@355@01 n@320@01))
    (and
      (=
        (inv@356@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@355@01))
        j@355@01)
      (img@357@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@355@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@355@01))
  :qid |quant-u-260|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@357@01 r) (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        (inv@356@01 r))
      r))
  :pattern ((inv@356@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@355@01 Int)) (!
  (=>
    (and (<= 3 j@355@01) (< j@355@01 n@320@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@355@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@355@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@355@01)
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@352@01))
    (=
      (and
        (img@357@01 r)
        (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
      (and (img@354@01 r) (and (<= 0 (inv@353@01 r)) (< (inv@353@01 r) 3)))))
  
  :qid |quant-u-261|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; x.ss[4].f := 0
; [eval] x.ss[4]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 4 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@358@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4))
    ($Perm.min
      (ite
        (and (img@354@01 r) (and (<= 0 (inv@353@01 r)) (< (inv@353@01 r) 3)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@359@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4))
    ($Perm.min
      (ite
        (and
          (img@357@01 r)
          (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@358@01 r)))
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
        (and (img@354@01 r) (and (<= 0 (inv@353@01 r)) (< (inv@353@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@358@01 r))
    $Perm.No)
  
  :qid |quant-u-263|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@358@01 r) $Perm.No)
  
  :qid |quant-u-264|))))
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
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4))
    (= (- $Perm.Write (pTaken@358@01 r)) $Perm.No))
  
  :qid |quant-u-265|))))
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
          (img@357@01 r)
          (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@359@01 r))
    $Perm.No)
  
  :qid |quant-u-266|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@359@01 r) $Perm.No)
  
  :qid |quant-u-267|))))
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
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4))
    (= (- (- $Perm.Write (pTaken@358@01 r)) (pTaken@359@01 r)) $Perm.No))
  
  :qid |quant-u-268|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@360@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@360@01  $FVF<f>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    4))
  0))
; [exec]
; fold acc(P01(x, n), write)
; [eval] |x.ss| == n
; [eval] |x.ss|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@361@01 Int)
(declare-const j@362@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 172 | !(k@361@01 >= 0) | live]
; [else-branch: 172 | k@361@01 >= 0 | live]
(push) ; 5
; [then-branch: 172 | !(k@361@01 >= 0)]
(assert (not (>= k@361@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 172 | k@361@01 >= 0]
(assert (>= k@361@01 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 6
; [then-branch: 173 | !(k@361@01 < |First:($t@323@01)|) | live]
; [else-branch: 173 | k@361@01 < |First:($t@323@01)| | live]
(push) ; 7
; [then-branch: 173 | !(k@361@01 < |First:($t@323@01)|)]
(assert (not
  (<
    k@361@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(pop) ; 7
(push) ; 7
; [else-branch: 173 | k@361@01 < |First:($t@323@01)|]
(assert (<
  k@361@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 174 | !(j@362@01 >= 0) | live]
; [else-branch: 174 | j@362@01 >= 0 | live]
(push) ; 9
; [then-branch: 174 | !(j@362@01 >= 0)]
(assert (not (>= j@362@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 174 | j@362@01 >= 0]
(assert (>= j@362@01 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 10
; [then-branch: 175 | !(j@362@01 < |First:($t@323@01)|) | live]
; [else-branch: 175 | j@362@01 < |First:($t@323@01)| | live]
(push) ; 11
; [then-branch: 175 | !(j@362@01 < |First:($t@323@01)|)]
(assert (not
  (<
    j@362@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(pop) ; 11
(push) ; 11
; [else-branch: 175 | j@362@01 < |First:($t@323@01)|]
(assert (<
  j@362@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@362@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (not
    (<
      j@362@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@362@01 0)
  (and
    (>= j@362@01 0)
    (or
      (<
        j@362@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (not
        (<
          j@362@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))))
(assert (or (>= j@362@01 0) (not (>= j@362@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    k@361@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (and
    (<
      k@361@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (=>
      (>= j@362@01 0)
      (and
        (>= j@362@01 0)
        (or
          (<
            j@362@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not
            (<
              j@362@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
    (or (>= j@362@01 0) (not (>= j@362@01 0))))))
(assert (or
  (<
    k@361@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
  (not
    (<
      k@361@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@361@01 0)
  (and
    (>= k@361@01 0)
    (=>
      (<
        k@361@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (<
          k@361@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (=>
          (>= j@362@01 0)
          (and
            (>= j@362@01 0)
            (or
              (<
                j@362@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not
                (<
                  j@362@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
        (or (>= j@362@01 0) (not (>= j@362@01 0)))))
    (or
      (<
        k@361@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (not
        (<
          k@361@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)))))))))
(assert (or (>= k@361@01 0) (not (>= k@361@01 0))))
(push) ; 4
; [then-branch: 176 | k@361@01 >= 0 && k@361@01 < |First:($t@323@01)| && j@362@01 >= 0 && j@362@01 < |First:($t@323@01)| && k@361@01 != j@362@01 | live]
; [else-branch: 176 | !(k@361@01 >= 0 && k@361@01 < |First:($t@323@01)| && j@362@01 >= 0 && j@362@01 < |First:($t@323@01)| && k@361@01 != j@362@01) | live]
(push) ; 5
; [then-branch: 176 | k@361@01 >= 0 && k@361@01 < |First:($t@323@01)| && j@362@01 >= 0 && j@362@01 < |First:($t@323@01)| && k@361@01 != j@362@01]
(assert (and
  (>= k@361@01 0)
  (and
    (<
      k@361@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (and
      (>= j@362@01 0)
      (and
        (<
          j@362@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (not (= k@361@01 j@362@01)))))))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 5
(push) ; 5
; [else-branch: 176 | !(k@361@01 >= 0 && k@361@01 < |First:($t@323@01)| && j@362@01 >= 0 && j@362@01 < |First:($t@323@01)| && k@361@01 != j@362@01)]
(assert (not
  (and
    (>= k@361@01 0)
    (and
      (<
        k@361@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@362@01 0)
        (and
          (<
            j@362@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@361@01 j@362@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@361@01 0)
    (and
      (<
        k@361@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@362@01 0)
        (and
          (<
            j@362@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@361@01 j@362@01))))))
  (and
    (>= k@361@01 0)
    (<
      k@361@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (>= j@362@01 0)
    (<
      j@362@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
    (not (= k@361@01 j@362@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@361@01 0)
      (and
        (<
          k@361@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@362@01 0)
          (and
            (<
              j@362@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@361@01 j@362@01)))))))
  (and
    (>= k@361@01 0)
    (and
      (<
        k@361@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
      (and
        (>= j@362@01 0)
        (and
          (<
            j@362@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not (= k@361@01 j@362@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@361@01 Int) (j@362@01 Int)) (!
  (and
    (=>
      (>= k@361@01 0)
      (and
        (>= k@361@01 0)
        (=>
          (<
            k@361@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (<
              k@361@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (=>
              (>= j@362@01 0)
              (and
                (>= j@362@01 0)
                (or
                  (<
                    j@362@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
                  (not
                    (<
                      j@362@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
            (or (>= j@362@01 0) (not (>= j@362@01 0)))))
        (or
          (<
            k@361@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (not
            (<
              k@361@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))))
    (or (>= k@361@01 0) (not (>= k@361@01 0)))
    (=>
      (and
        (>= k@361@01 0)
        (and
          (<
            k@361@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (>= j@362@01 0)
            (and
              (<
                j@362@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not (= k@361@01 j@362@01))))))
      (and
        (>= k@361@01 0)
        (<
          k@361@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (>= j@362@01 0)
        (<
          j@362@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (not (= k@361@01 j@362@01))))
    (or
      (not
        (and
          (>= k@361@01 0)
          (and
            (<
              k@361@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (and
              (>= j@362@01 0)
              (and
                (<
                  j@362@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
                (not (= k@361@01 j@362@01)))))))
      (and
        (>= k@361@01 0)
        (and
          (<
            k@361@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
          (and
            (>= j@362@01 0)
            (and
              (<
                j@362@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
              (not (= k@361@01 j@362@01))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@361@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@362@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109-aux|)))
(push) ; 3
(assert (not (forall ((k@361@01 Int) (j@362@01 Int)) (!
  (=>
    (and
      (>= k@361@01 0)
      (and
        (<
          k@361@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@362@01 0)
          (and
            (<
              j@362@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@361@01 j@362@01))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          k@361@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@362@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@361@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@362@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@361@01 Int) (j@362@01 Int)) (!
  (=>
    (and
      (>= k@361@01 0)
      (and
        (<
          k@361@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
        (and
          (>= j@362@01 0)
          (and
            (<
              j@362@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))
            (not (= k@361@01 j@362@01))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          k@361@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@362@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    k@361@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@362@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109|)))
(declare-const j@363@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 177 | !(0 <= j@363@01) | live]
; [else-branch: 177 | 0 <= j@363@01 | live]
(push) ; 5
; [then-branch: 177 | !(0 <= j@363@01)]
(assert (not (<= 0 j@363@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 177 | 0 <= j@363@01]
(assert (<= 0 j@363@01))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@363@01) (not (<= 0 j@363@01))))
(assert (and (<= 0 j@363@01) (< j@363@01 3)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@363@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@363@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@364@01 ($Ref) Int)
(declare-fun img@365@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@363@01 Int)) (!
  (=>
    (and (<= 0 j@363@01) (< j@363@01 3))
    (or (<= 0 j@363@01) (not (<= 0 j@363@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@363@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@363@01 Int) (j2@363@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@363@01) (< j1@363@01 3))
      (and (<= 0 j2@363@01) (< j2@363@01 3))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j1@363@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j2@363@01)))
    (= j1@363@01 j2@363@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@363@01 Int)) (!
  (=>
    (and (<= 0 j@363@01) (< j@363@01 3))
    (and
      (=
        (inv@364@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@363@01))
        j@363@01)
      (img@365@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@363@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@363@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@365@01 r) (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        (inv@364@01 r))
      r))
  :pattern ((inv@364@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@366@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3))
      (img@365@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@364@01 r))))
    ($Perm.min
      (ite
        (and
          (img@357@01 r)
          (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
        (- $Perm.Write (pTaken@359@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@367@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3))
      (img@365@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@364@01 r))))
    ($Perm.min
      (ite
        (and (img@354@01 r) (and (<= 0 (inv@353@01 r)) (< (inv@353@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@366@01 r)))
    $Perm.No))
(define-fun pTaken@368@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3))
      (img@365@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@364@01 r))))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@366@01 r)) (pTaken@367@01 r)))
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
          (img@357@01 r)
          (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
        (- $Perm.Write (pTaken@359@01 r))
        $Perm.No)
      (pTaken@366@01 r))
    $Perm.No)
  
  :qid |quant-u-271|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@366@01 r) $Perm.No)
  
  :qid |quant-u-272|))))
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
      (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3))
      (img@365@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@364@01 r))))
    (= (- $Perm.Write (pTaken@366@01 r)) $Perm.No))
  
  :qid |quant-u-273|))))
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
        (and (img@354@01 r) (and (<= 0 (inv@353@01 r)) (< (inv@353@01 r) 3)))
        $Perm.Write
        $Perm.No)
      (pTaken@367@01 r))
    $Perm.No)
  
  :qid |quant-u-274|))))
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
      (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3))
      (img@365@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@364@01 r))))
    (= (- (- $Perm.Write (pTaken@366@01 r)) (pTaken@367@01 r)) $Perm.No))
  
  :qid |quant-u-275|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@369@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@369@01  $FVF<f>)))
      (and (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3)) (img@365@01 r)))
    (=>
      (and (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3)) (img@365@01 r))
      (Set_in r ($FVF.domain_f (as sm@369@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@369@01  $FVF<f>))))
  :qid |qp.fvfDomDef133|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3)) (img@365@01 r))
      (=
        r
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4)))
    (=
      ($FVF.lookup_f (as sm@369@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@360@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@369@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@360@01  $FVF<f>) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3)) (img@365@01 r))
      (ite
        (and
          (img@357@01 r)
          (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
        (< $Perm.No (- $Perm.Write (pTaken@359@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@369@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@349@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@369@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@349@01  $FVF<f>) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (and (<= 0 (inv@364@01 r)) (< (inv@364@01 r) 3)) (img@365@01 r))
      (and (img@354@01 r) (and (<= 0 (inv@353@01 r)) (< (inv@353@01 r) 3))))
    (=
      ($FVF.lookup_f (as sm@369@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@344@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@369@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@344@01  $FVF<f>) r))
  :qid |qp.fvfValDef132|)))
(declare-const j@370@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 178 | !(3 <= j@370@01) | live]
; [else-branch: 178 | 3 <= j@370@01 | live]
(push) ; 5
; [then-branch: 178 | !(3 <= j@370@01)]
(assert (not (<= 3 j@370@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 178 | 3 <= j@370@01]
(assert (<= 3 j@370@01))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@370@01) (not (<= 3 j@370@01))))
(assert (and (<= 3 j@370@01) (< j@370@01 n@320@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@370@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@370@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@371@01 ($Ref) Int)
(declare-fun img@372@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@370@01 Int)) (!
  (=>
    (and (<= 3 j@370@01) (< j@370@01 n@320@01))
    (or (<= 3 j@370@01) (not (<= 3 j@370@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@370@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@370@01 Int) (j2@370@01 Int)) (!
  (=>
    (and
      (and (<= 3 j1@370@01) (< j1@370@01 n@320@01))
      (and (<= 3 j2@370@01) (< j2@370@01 n@320@01))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j1@370@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j2@370@01)))
    (= j1@370@01 j2@370@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@370@01 Int)) (!
  (=>
    (and (<= 3 j@370@01) (< j@370@01 n@320@01))
    (and
      (=
        (inv@371@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          j@370@01))
        j@370@01)
      (img@372@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        j@370@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
    j@370@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@372@01 r) (and (<= 3 (inv@371@01 r)) (< (inv@371@01 r) n@320@01)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
        (inv@371@01 r))
      r))
  :pattern ((inv@371@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@373@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@371@01 r)) (< (inv@371@01 r) n@320@01))
      (img@372@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@371@01 r))))
    ($Perm.min
      (ite
        (and
          (img@357@01 r)
          (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
        (- $Perm.Write (pTaken@359@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@374@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 3 (inv@371@01 r)) (< (inv@371@01 r) n@320@01))
      (img@372@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@371@01 r))))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@373@01 r)))
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
          (img@357@01 r)
          (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
        (- $Perm.Write (pTaken@359@01 r))
        $Perm.No)
      (pTaken@373@01 r))
    $Perm.No)
  
  :qid |quant-u-278|))))
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
      (and (<= 3 (inv@371@01 r)) (< (inv@371@01 r) n@320@01))
      (img@372@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@371@01 r))))
    (= (- $Perm.Write (pTaken@373@01 r)) $Perm.No))
  
  :qid |quant-u-279|))))
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
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4))
      $Perm.Write
      $Perm.No)
    (pTaken@374@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
      4)))
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
      (and (<= 3 (inv@371@01 r)) (< (inv@371@01 r) n@320@01))
      (img@372@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01))
          (inv@371@01 r))))
    (= (- (- $Perm.Write (pTaken@373@01 r)) (pTaken@374@01 r)) $Perm.No))
  
  :qid |quant-u-281|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@375@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@375@01  $FVF<f>)))
      (and
        (and (<= 3 (inv@371@01 r)) (< (inv@371@01 r) n@320@01))
        (img@372@01 r)))
    (=>
      (and
        (and (<= 3 (inv@371@01 r)) (< (inv@371@01 r) n@320@01))
        (img@372@01 r))
      (Set_in r ($FVF.domain_f (as sm@375@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@375@01  $FVF<f>))))
  :qid |qp.fvfDomDef136|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@371@01 r)) (< (inv@371@01 r) n@320@01))
        (img@372@01 r))
      (=
        r
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@323@01)) 4)))
    (=
      ($FVF.lookup_f (as sm@375@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@360@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@375@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@360@01  $FVF<f>) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 3 (inv@371@01 r)) (< (inv@371@01 r) n@320@01))
        (img@372@01 r))
      (ite
        (and
          (img@357@01 r)
          (and (<= 3 (inv@356@01 r)) (< (inv@356@01 r) n@320@01)))
        (< $Perm.No (- $Perm.Write (pTaken@359@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@375@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@349@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@375@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@349@01  $FVF<f>) r))
  :qid |qp.fvfValDef135|)))
(assert (P01%trigger ($Snap.combine
  ($Snap.first $t@323@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>))))))) x@319@01 n@320@01))
; [exec]
; assert v1 == fun04(x, n, 2)
; [eval] v1 == fun04(x, n, 2)
; [eval] fun04(x, n, 2)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@323@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 2))
(pop) ; 3
; Joined path conditions
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@323@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 2))
(push) ; 3
(assert (not (=
  v1@335@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  v1@335@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 2)))
; [exec]
; assert v2 == fun04(x, n, 4)
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@323@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4))
(pop) ; 3
; Joined path conditions
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@323@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4))
(push) ; 3
(assert (not (=
  v2@336@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  v2@336@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4))))
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
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  v2@336@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4))))
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
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  v2@336@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@323@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@369@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@375@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@319@01 n@320@01 4))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const xs@376@01 Seq<$Ref>)
(declare-const xs@377@01 Seq<$Ref>)
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
; inhale (forall k: Int, j: Int ::
;     { xs[k], xs[j] }
;     k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==>
;     xs[k] != xs[j])
(declare-const $t@378@01 $Snap)
(assert (= $t@378@01 $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@379@01 Int)
(declare-const j@380@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 179 | !(k@379@01 >= 0) | live]
; [else-branch: 179 | k@379@01 >= 0 | live]
(push) ; 5
; [then-branch: 179 | !(k@379@01 >= 0)]
(assert (not (>= k@379@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 179 | k@379@01 >= 0]
(assert (>= k@379@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 180 | !(k@379@01 < |xs@377@01|) | live]
; [else-branch: 180 | k@379@01 < |xs@377@01| | live]
(push) ; 7
; [then-branch: 180 | !(k@379@01 < |xs@377@01|)]
(assert (not (< k@379@01 (Seq_length xs@377@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 180 | k@379@01 < |xs@377@01|]
(assert (< k@379@01 (Seq_length xs@377@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 181 | !(j@380@01 >= 0) | live]
; [else-branch: 181 | j@380@01 >= 0 | live]
(push) ; 9
; [then-branch: 181 | !(j@380@01 >= 0)]
(assert (not (>= j@380@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 181 | j@380@01 >= 0]
(assert (>= j@380@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 182 | !(j@380@01 < |xs@377@01|) | live]
; [else-branch: 182 | j@380@01 < |xs@377@01| | live]
(push) ; 11
; [then-branch: 182 | !(j@380@01 < |xs@377@01|)]
(assert (not (< j@380@01 (Seq_length xs@377@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 182 | j@380@01 < |xs@377@01|]
(assert (< j@380@01 (Seq_length xs@377@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@380@01 (Seq_length xs@377@01))
  (not (< j@380@01 (Seq_length xs@377@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@380@01 0)
  (and
    (>= j@380@01 0)
    (or
      (< j@380@01 (Seq_length xs@377@01))
      (not (< j@380@01 (Seq_length xs@377@01)))))))
(assert (or (>= j@380@01 0) (not (>= j@380@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@379@01 (Seq_length xs@377@01))
  (and
    (< k@379@01 (Seq_length xs@377@01))
    (=>
      (>= j@380@01 0)
      (and
        (>= j@380@01 0)
        (or
          (< j@380@01 (Seq_length xs@377@01))
          (not (< j@380@01 (Seq_length xs@377@01))))))
    (or (>= j@380@01 0) (not (>= j@380@01 0))))))
(assert (or
  (< k@379@01 (Seq_length xs@377@01))
  (not (< k@379@01 (Seq_length xs@377@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@379@01 0)
  (and
    (>= k@379@01 0)
    (=>
      (< k@379@01 (Seq_length xs@377@01))
      (and
        (< k@379@01 (Seq_length xs@377@01))
        (=>
          (>= j@380@01 0)
          (and
            (>= j@380@01 0)
            (or
              (< j@380@01 (Seq_length xs@377@01))
              (not (< j@380@01 (Seq_length xs@377@01))))))
        (or (>= j@380@01 0) (not (>= j@380@01 0)))))
    (or
      (< k@379@01 (Seq_length xs@377@01))
      (not (< k@379@01 (Seq_length xs@377@01)))))))
(assert (or (>= k@379@01 0) (not (>= k@379@01 0))))
(push) ; 4
; [then-branch: 183 | k@379@01 >= 0 && k@379@01 < |xs@377@01| && j@380@01 >= 0 && j@380@01 < |xs@377@01| && k@379@01 != j@380@01 | live]
; [else-branch: 183 | !(k@379@01 >= 0 && k@379@01 < |xs@377@01| && j@380@01 >= 0 && j@380@01 < |xs@377@01| && k@379@01 != j@380@01) | live]
(push) ; 5
; [then-branch: 183 | k@379@01 >= 0 && k@379@01 < |xs@377@01| && j@380@01 >= 0 && j@380@01 < |xs@377@01| && k@379@01 != j@380@01]
(assert (and
  (>= k@379@01 0)
  (and
    (< k@379@01 (Seq_length xs@377@01))
    (and
      (>= j@380@01 0)
      (and (< j@380@01 (Seq_length xs@377@01)) (not (= k@379@01 j@380@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 183 | !(k@379@01 >= 0 && k@379@01 < |xs@377@01| && j@380@01 >= 0 && j@380@01 < |xs@377@01| && k@379@01 != j@380@01)]
(assert (not
  (and
    (>= k@379@01 0)
    (and
      (< k@379@01 (Seq_length xs@377@01))
      (and
        (>= j@380@01 0)
        (and (< j@380@01 (Seq_length xs@377@01)) (not (= k@379@01 j@380@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@379@01 0)
    (and
      (< k@379@01 (Seq_length xs@377@01))
      (and
        (>= j@380@01 0)
        (and (< j@380@01 (Seq_length xs@377@01)) (not (= k@379@01 j@380@01))))))
  (and
    (>= k@379@01 0)
    (< k@379@01 (Seq_length xs@377@01))
    (>= j@380@01 0)
    (< j@380@01 (Seq_length xs@377@01))
    (not (= k@379@01 j@380@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@379@01 0)
      (and
        (< k@379@01 (Seq_length xs@377@01))
        (and
          (>= j@380@01 0)
          (and (< j@380@01 (Seq_length xs@377@01)) (not (= k@379@01 j@380@01)))))))
  (and
    (>= k@379@01 0)
    (and
      (< k@379@01 (Seq_length xs@377@01))
      (and
        (>= j@380@01 0)
        (and (< j@380@01 (Seq_length xs@377@01)) (not (= k@379@01 j@380@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@379@01 Int) (j@380@01 Int)) (!
  (and
    (=>
      (>= k@379@01 0)
      (and
        (>= k@379@01 0)
        (=>
          (< k@379@01 (Seq_length xs@377@01))
          (and
            (< k@379@01 (Seq_length xs@377@01))
            (=>
              (>= j@380@01 0)
              (and
                (>= j@380@01 0)
                (or
                  (< j@380@01 (Seq_length xs@377@01))
                  (not (< j@380@01 (Seq_length xs@377@01))))))
            (or (>= j@380@01 0) (not (>= j@380@01 0)))))
        (or
          (< k@379@01 (Seq_length xs@377@01))
          (not (< k@379@01 (Seq_length xs@377@01))))))
    (or (>= k@379@01 0) (not (>= k@379@01 0)))
    (=>
      (and
        (>= k@379@01 0)
        (and
          (< k@379@01 (Seq_length xs@377@01))
          (and
            (>= j@380@01 0)
            (and (< j@380@01 (Seq_length xs@377@01)) (not (= k@379@01 j@380@01))))))
      (and
        (>= k@379@01 0)
        (< k@379@01 (Seq_length xs@377@01))
        (>= j@380@01 0)
        (< j@380@01 (Seq_length xs@377@01))
        (not (= k@379@01 j@380@01))))
    (or
      (not
        (and
          (>= k@379@01 0)
          (and
            (< k@379@01 (Seq_length xs@377@01))
            (and
              (>= j@380@01 0)
              (and
                (< j@380@01 (Seq_length xs@377@01))
                (not (= k@379@01 j@380@01)))))))
      (and
        (>= k@379@01 0)
        (and
          (< k@379@01 (Seq_length xs@377@01))
          (and
            (>= j@380@01 0)
            (and (< j@380@01 (Seq_length xs@377@01)) (not (= k@379@01 j@380@01))))))))
  :pattern ((Seq_index xs@377@01 k@379@01) (Seq_index xs@377@01 j@380@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@185@10@185@104-aux|)))
(assert (forall ((k@379@01 Int) (j@380@01 Int)) (!
  (=>
    (and
      (>= k@379@01 0)
      (and
        (< k@379@01 (Seq_length xs@377@01))
        (and
          (>= j@380@01 0)
          (and (< j@380@01 (Seq_length xs@377@01)) (not (= k@379@01 j@380@01))))))
    (not (= (Seq_index xs@377@01 k@379@01) (Seq_index xs@377@01 j@380@01))))
  :pattern ((Seq_index xs@377@01 k@379@01) (Seq_index xs@377@01 j@380@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@185@10@185@104|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@381@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 184 | !(0 <= i@381@01) | live]
; [else-branch: 184 | 0 <= i@381@01 | live]
(push) ; 5
; [then-branch: 184 | !(0 <= i@381@01)]
(assert (not (<= 0 i@381@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 184 | 0 <= i@381@01]
(assert (<= 0 i@381@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@381@01) (not (<= 0 i@381@01))))
(assert (and (<= 0 i@381@01) (< i@381@01 (Seq_length xs@377@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@381@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@382@01 $FVF<f>)
(declare-fun inv@383@01 ($Ref) Int)
(declare-fun img@384@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@381@01 Int)) (!
  (=>
    (and (<= 0 i@381@01) (< i@381@01 (Seq_length xs@377@01)))
    (or (<= 0 i@381@01) (not (<= 0 i@381@01))))
  :pattern ((Seq_index xs@377@01 i@381@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@381@01 Int) (i2@381@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@381@01) (< i1@381@01 (Seq_length xs@377@01)))
      (and (<= 0 i2@381@01) (< i2@381@01 (Seq_length xs@377@01)))
      (= (Seq_index xs@377@01 i1@381@01) (Seq_index xs@377@01 i2@381@01)))
    (= i1@381@01 i2@381@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@381@01 Int)) (!
  (=>
    (and (<= 0 i@381@01) (< i@381@01 (Seq_length xs@377@01)))
    (and
      (= (inv@383@01 (Seq_index xs@377@01 i@381@01)) i@381@01)
      (img@384@01 (Seq_index xs@377@01 i@381@01))))
  :pattern ((Seq_index xs@377@01 i@381@01))
  :qid |quant-u-283|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@384@01 r)
      (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@383@01 r)) r))
  :pattern ((inv@383@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@381@01 Int)) (!
  (=>
    (and (<= 0 i@381@01) (< i@381@01 (Seq_length xs@377@01)))
    (not (= (Seq_index xs@377@01 i@381@01) $Ref.null)))
  :pattern ((Seq_index xs@377@01 i@381@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale |xs| > 3
(declare-const $t@385@01 $Snap)
(assert (= $t@385@01 $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@377@01) 3))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert fun07(xs, -10) >= 0
; [eval] fun07(xs, -10) >= 0
; [eval] fun07(xs, -10)
; [eval] -10
(set-option :timeout 0)
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@386@01 Int)
(declare-const i@387@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 185 | !(k@386@01 >= 0) | live]
; [else-branch: 185 | k@386@01 >= 0 | live]
(push) ; 6
; [then-branch: 185 | !(k@386@01 >= 0)]
(assert (not (>= k@386@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 185 | k@386@01 >= 0]
(assert (>= k@386@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 186 | !(k@386@01 < |xs@377@01|) | live]
; [else-branch: 186 | k@386@01 < |xs@377@01| | live]
(push) ; 8
; [then-branch: 186 | !(k@386@01 < |xs@377@01|)]
(assert (not (< k@386@01 (Seq_length xs@377@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 186 | k@386@01 < |xs@377@01|]
(assert (< k@386@01 (Seq_length xs@377@01)))
; [eval] i >= 0
(push) ; 9
; [then-branch: 187 | !(i@387@01 >= 0) | live]
; [else-branch: 187 | i@387@01 >= 0 | live]
(push) ; 10
; [then-branch: 187 | !(i@387@01 >= 0)]
(assert (not (>= i@387@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 187 | i@387@01 >= 0]
(assert (>= i@387@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 188 | !(i@387@01 < |xs@377@01|) | live]
; [else-branch: 188 | i@387@01 < |xs@377@01| | live]
(push) ; 12
; [then-branch: 188 | !(i@387@01 < |xs@377@01|)]
(assert (not (< i@387@01 (Seq_length xs@377@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 188 | i@387@01 < |xs@377@01|]
(assert (< i@387@01 (Seq_length xs@377@01)))
; [eval] k != i
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< i@387@01 (Seq_length xs@377@01))
  (not (< i@387@01 (Seq_length xs@377@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@387@01 0)
  (and
    (>= i@387@01 0)
    (or
      (< i@387@01 (Seq_length xs@377@01))
      (not (< i@387@01 (Seq_length xs@377@01)))))))
(assert (or (>= i@387@01 0) (not (>= i@387@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@386@01 (Seq_length xs@377@01))
  (and
    (< k@386@01 (Seq_length xs@377@01))
    (=>
      (>= i@387@01 0)
      (and
        (>= i@387@01 0)
        (or
          (< i@387@01 (Seq_length xs@377@01))
          (not (< i@387@01 (Seq_length xs@377@01))))))
    (or (>= i@387@01 0) (not (>= i@387@01 0))))))
(assert (or
  (< k@386@01 (Seq_length xs@377@01))
  (not (< k@386@01 (Seq_length xs@377@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@386@01 0)
  (and
    (>= k@386@01 0)
    (=>
      (< k@386@01 (Seq_length xs@377@01))
      (and
        (< k@386@01 (Seq_length xs@377@01))
        (=>
          (>= i@387@01 0)
          (and
            (>= i@387@01 0)
            (or
              (< i@387@01 (Seq_length xs@377@01))
              (not (< i@387@01 (Seq_length xs@377@01))))))
        (or (>= i@387@01 0) (not (>= i@387@01 0)))))
    (or
      (< k@386@01 (Seq_length xs@377@01))
      (not (< k@386@01 (Seq_length xs@377@01)))))))
(assert (or (>= k@386@01 0) (not (>= k@386@01 0))))
(push) ; 5
; [then-branch: 189 | k@386@01 >= 0 && k@386@01 < |xs@377@01| && i@387@01 >= 0 && i@387@01 < |xs@377@01| && k@386@01 != i@387@01 | live]
; [else-branch: 189 | !(k@386@01 >= 0 && k@386@01 < |xs@377@01| && i@387@01 >= 0 && i@387@01 < |xs@377@01| && k@386@01 != i@387@01) | live]
(push) ; 6
; [then-branch: 189 | k@386@01 >= 0 && k@386@01 < |xs@377@01| && i@387@01 >= 0 && i@387@01 < |xs@377@01| && k@386@01 != i@387@01]
(assert (and
  (>= k@386@01 0)
  (and
    (< k@386@01 (Seq_length xs@377@01))
    (and
      (>= i@387@01 0)
      (and (< i@387@01 (Seq_length xs@377@01)) (not (= k@386@01 i@387@01)))))))
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(push) ; 6
; [else-branch: 189 | !(k@386@01 >= 0 && k@386@01 < |xs@377@01| && i@387@01 >= 0 && i@387@01 < |xs@377@01| && k@386@01 != i@387@01)]
(assert (not
  (and
    (>= k@386@01 0)
    (and
      (< k@386@01 (Seq_length xs@377@01))
      (and
        (>= i@387@01 0)
        (and (< i@387@01 (Seq_length xs@377@01)) (not (= k@386@01 i@387@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= k@386@01 0)
    (and
      (< k@386@01 (Seq_length xs@377@01))
      (and
        (>= i@387@01 0)
        (and (< i@387@01 (Seq_length xs@377@01)) (not (= k@386@01 i@387@01))))))
  (and
    (>= k@386@01 0)
    (< k@386@01 (Seq_length xs@377@01))
    (>= i@387@01 0)
    (< i@387@01 (Seq_length xs@377@01))
    (not (= k@386@01 i@387@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@386@01 0)
      (and
        (< k@386@01 (Seq_length xs@377@01))
        (and
          (>= i@387@01 0)
          (and (< i@387@01 (Seq_length xs@377@01)) (not (= k@386@01 i@387@01)))))))
  (and
    (>= k@386@01 0)
    (and
      (< k@386@01 (Seq_length xs@377@01))
      (and
        (>= i@387@01 0)
        (and (< i@387@01 (Seq_length xs@377@01)) (not (= k@386@01 i@387@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@386@01 Int) (i@387@01 Int)) (!
  (=>
    (and
      (>= k@386@01 0)
      (and
        (< k@386@01 (Seq_length xs@377@01))
        (and
          (>= i@387@01 0)
          (and (< i@387@01 (Seq_length xs@377@01)) (not (= k@386@01 i@387@01))))))
    (not (= (Seq_index xs@377@01 k@386@01) (Seq_index xs@377@01 i@387@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@386@01 Int) (i@387@01 Int)) (!
  (=>
    (and
      (>= k@386@01 0)
      (and
        (< k@386@01 (Seq_length xs@377@01))
        (and
          (>= i@387@01 0)
          (and (< i@387@01 (Seq_length xs@377@01)) (not (= k@386@01 i@387@01))))))
    (not (= (Seq_index xs@377@01 k@386@01) (Seq_index xs@377@01 i@387@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|)))
(declare-const i@388@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 190 | !(0 <= i@388@01) | live]
; [else-branch: 190 | 0 <= i@388@01 | live]
(push) ; 6
; [then-branch: 190 | !(0 <= i@388@01)]
(assert (not (<= 0 i@388@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 190 | 0 <= i@388@01]
(assert (<= 0 i@388@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@388@01) (not (<= 0 i@388@01))))
(assert (and (<= 0 i@388@01) (< i@388@01 (Seq_length xs@377@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@388@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@389@01 ($Ref) Int)
(declare-fun img@390@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@388@01 Int)) (!
  (=>
    (and (<= 0 i@388@01) (< i@388@01 (Seq_length xs@377@01)))
    (or (<= 0 i@388@01) (not (<= 0 i@388@01))))
  :pattern ((Seq_index xs@377@01 i@388@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@388@01 Int) (i2@388@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@388@01) (< i1@388@01 (Seq_length xs@377@01)))
      (and (<= 0 i2@388@01) (< i2@388@01 (Seq_length xs@377@01)))
      (= (Seq_index xs@377@01 i1@388@01) (Seq_index xs@377@01 i2@388@01)))
    (= i1@388@01 i2@388@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@388@01 Int)) (!
  (=>
    (and (<= 0 i@388@01) (< i@388@01 (Seq_length xs@377@01)))
    (and
      (= (inv@389@01 (Seq_index xs@377@01 i@388@01)) i@388@01)
      (img@390@01 (Seq_index xs@377@01 i@388@01))))
  :pattern ((Seq_index xs@377@01 i@388@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@390@01 r)
      (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@389@01 r)) r))
  :pattern ((inv@389@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@391@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01)))
      (img@390@01 r)
      (= r (Seq_index xs@377@01 (inv@389@01 r))))
    ($Perm.min
      (ite
        (and
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
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
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@391@01 r))
    $Perm.No)
  
  :qid |quant-u-286|))))
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
      (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01)))
      (img@390@01 r)
      (= r (Seq_index xs@377@01 (inv@389@01 r))))
    (= (- $Perm.Write (pTaken@391@01 r)) $Perm.No))
  
  :qid |quant-u-287|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@392@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@392@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01)))
        (img@390@01 r)))
    (=>
      (and
        (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01)))
        (img@390@01 r))
      (Set_in r ($FVF.domain_f (as sm@392@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@392@01  $FVF<f>))))
  :qid |qp.fvfDomDef138|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01)))
        (img@390@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef137|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@392@01  $FVF<f>))) xs@377@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@388@01 Int)) (!
  (=>
    (and (<= 0 i@388@01) (< i@388@01 (Seq_length xs@377@01)))
    (and
      (= (inv@389@01 (Seq_index xs@377@01 i@388@01)) i@388@01)
      (img@390@01 (Seq_index xs@377@01 i@388@01))))
  :pattern ((Seq_index xs@377@01 i@388@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@390@01 r)
      (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@389@01 r)) r))
  :pattern ((inv@389@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@392@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01)))
        (img@390@01 r)))
    (=>
      (and
        (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01)))
        (img@390@01 r))
      (Set_in r ($FVF.domain_f (as sm@392@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@392@01  $FVF<f>))))
  :qid |qp.fvfDomDef138|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@389@01 r)) (< (inv@389@01 r) (Seq_length xs@377@01)))
        (img@390@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef137|)))
(assert (and
  (forall ((k@386@01 Int) (i@387@01 Int)) (!
    (=>
      (and
        (>= k@386@01 0)
        (and
          (< k@386@01 (Seq_length xs@377@01))
          (and
            (>= i@387@01 0)
            (and (< i@387@01 (Seq_length xs@377@01)) (not (= k@386@01 i@387@01))))))
      (not (= (Seq_index xs@377@01 k@386@01) (Seq_index xs@377@01 i@387@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
  (forall ((i@388@01 Int)) (!
    (=>
      (and (<= 0 i@388@01) (< i@388@01 (Seq_length xs@377@01)))
      (or (<= 0 i@388@01) (not (<= 0 i@388@01))))
    :pattern ((Seq_index xs@377@01 i@388@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@392@01  $FVF<f>))) xs@377@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>=
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@392@01  $FVF<f>))) xs@377@01 (- 0 10))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>=
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@392@01  $FVF<f>))) xs@377@01 (- 0 10))
  0))
; [exec]
; assert fun08(xs, 2) > xs[2].f
; [eval] fun08(xs, 2) > xs[2].f
; [eval] fun08(xs, 2)
(push) ; 3
; [eval] (forall k: Int, j: Int ::k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@393@01 Int)
(declare-const j@394@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 191 | !(k@393@01 >= 0) | live]
; [else-branch: 191 | k@393@01 >= 0 | live]
(push) ; 6
; [then-branch: 191 | !(k@393@01 >= 0)]
(assert (not (>= k@393@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 191 | k@393@01 >= 0]
(assert (>= k@393@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 192 | !(k@393@01 < |xs@377@01|) | live]
; [else-branch: 192 | k@393@01 < |xs@377@01| | live]
(push) ; 8
; [then-branch: 192 | !(k@393@01 < |xs@377@01|)]
(assert (not (< k@393@01 (Seq_length xs@377@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 192 | k@393@01 < |xs@377@01|]
(assert (< k@393@01 (Seq_length xs@377@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 193 | !(j@394@01 >= 0) | live]
; [else-branch: 193 | j@394@01 >= 0 | live]
(push) ; 10
; [then-branch: 193 | !(j@394@01 >= 0)]
(assert (not (>= j@394@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 193 | j@394@01 >= 0]
(assert (>= j@394@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 194 | !(j@394@01 < |xs@377@01|) | live]
; [else-branch: 194 | j@394@01 < |xs@377@01| | live]
(push) ; 12
; [then-branch: 194 | !(j@394@01 < |xs@377@01|)]
(assert (not (< j@394@01 (Seq_length xs@377@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 194 | j@394@01 < |xs@377@01|]
(assert (< j@394@01 (Seq_length xs@377@01)))
; [eval] k != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@394@01 (Seq_length xs@377@01))
  (not (< j@394@01 (Seq_length xs@377@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@394@01 0)
  (and
    (>= j@394@01 0)
    (or
      (< j@394@01 (Seq_length xs@377@01))
      (not (< j@394@01 (Seq_length xs@377@01)))))))
(assert (or (>= j@394@01 0) (not (>= j@394@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@393@01 (Seq_length xs@377@01))
  (and
    (< k@393@01 (Seq_length xs@377@01))
    (=>
      (>= j@394@01 0)
      (and
        (>= j@394@01 0)
        (or
          (< j@394@01 (Seq_length xs@377@01))
          (not (< j@394@01 (Seq_length xs@377@01))))))
    (or (>= j@394@01 0) (not (>= j@394@01 0))))))
(assert (or
  (< k@393@01 (Seq_length xs@377@01))
  (not (< k@393@01 (Seq_length xs@377@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@393@01 0)
  (and
    (>= k@393@01 0)
    (=>
      (< k@393@01 (Seq_length xs@377@01))
      (and
        (< k@393@01 (Seq_length xs@377@01))
        (=>
          (>= j@394@01 0)
          (and
            (>= j@394@01 0)
            (or
              (< j@394@01 (Seq_length xs@377@01))
              (not (< j@394@01 (Seq_length xs@377@01))))))
        (or (>= j@394@01 0) (not (>= j@394@01 0)))))
    (or
      (< k@393@01 (Seq_length xs@377@01))
      (not (< k@393@01 (Seq_length xs@377@01)))))))
(assert (or (>= k@393@01 0) (not (>= k@393@01 0))))
(push) ; 5
; [then-branch: 195 | k@393@01 >= 0 && k@393@01 < |xs@377@01| && j@394@01 >= 0 && j@394@01 < |xs@377@01| && k@393@01 != j@394@01 | live]
; [else-branch: 195 | !(k@393@01 >= 0 && k@393@01 < |xs@377@01| && j@394@01 >= 0 && j@394@01 < |xs@377@01| && k@393@01 != j@394@01) | live]
(push) ; 6
; [then-branch: 195 | k@393@01 >= 0 && k@393@01 < |xs@377@01| && j@394@01 >= 0 && j@394@01 < |xs@377@01| && k@393@01 != j@394@01]
(assert (and
  (>= k@393@01 0)
  (and
    (< k@393@01 (Seq_length xs@377@01))
    (and
      (>= j@394@01 0)
      (and (< j@394@01 (Seq_length xs@377@01)) (not (= k@393@01 j@394@01)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 195 | !(k@393@01 >= 0 && k@393@01 < |xs@377@01| && j@394@01 >= 0 && j@394@01 < |xs@377@01| && k@393@01 != j@394@01)]
(assert (not
  (and
    (>= k@393@01 0)
    (and
      (< k@393@01 (Seq_length xs@377@01))
      (and
        (>= j@394@01 0)
        (and (< j@394@01 (Seq_length xs@377@01)) (not (= k@393@01 j@394@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= k@393@01 0)
    (and
      (< k@393@01 (Seq_length xs@377@01))
      (and
        (>= j@394@01 0)
        (and (< j@394@01 (Seq_length xs@377@01)) (not (= k@393@01 j@394@01))))))
  (and
    (>= k@393@01 0)
    (< k@393@01 (Seq_length xs@377@01))
    (>= j@394@01 0)
    (< j@394@01 (Seq_length xs@377@01))
    (not (= k@393@01 j@394@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@393@01 0)
      (and
        (< k@393@01 (Seq_length xs@377@01))
        (and
          (>= j@394@01 0)
          (and (< j@394@01 (Seq_length xs@377@01)) (not (= k@393@01 j@394@01)))))))
  (and
    (>= k@393@01 0)
    (and
      (< k@393@01 (Seq_length xs@377@01))
      (and
        (>= j@394@01 0)
        (and (< j@394@01 (Seq_length xs@377@01)) (not (= k@393@01 j@394@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@393@01 Int) (j@394@01 Int)) (!
  (=>
    (and
      (>= k@393@01 0)
      (and
        (< k@393@01 (Seq_length xs@377@01))
        (and
          (>= j@394@01 0)
          (and (< j@394@01 (Seq_length xs@377@01)) (not (= k@393@01 j@394@01))))))
    (not (= (Seq_index xs@377@01 k@393@01) (Seq_index xs@377@01 j@394@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@178@12@178@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@393@01 Int) (j@394@01 Int)) (!
  (=>
    (and
      (>= k@393@01 0)
      (and
        (< k@393@01 (Seq_length xs@377@01))
        (and
          (>= j@394@01 0)
          (and (< j@394@01 (Seq_length xs@377@01)) (not (= k@393@01 j@394@01))))))
    (not (= (Seq_index xs@377@01 k@393@01) (Seq_index xs@377@01 j@394@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@178@12@178@106|)))
(declare-const j@395@01 Int)
(push) ; 4
; [eval] 0 <= j && j < |xs|
; [eval] 0 <= j
(push) ; 5
; [then-branch: 196 | !(0 <= j@395@01) | live]
; [else-branch: 196 | 0 <= j@395@01 | live]
(push) ; 6
; [then-branch: 196 | !(0 <= j@395@01)]
(assert (not (<= 0 j@395@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 196 | 0 <= j@395@01]
(assert (<= 0 j@395@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@395@01) (not (<= 0 j@395@01))))
(assert (and (<= 0 j@395@01) (< j@395@01 (Seq_length xs@377@01))))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@395@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@396@01 ($Ref) Int)
(declare-fun img@397@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@395@01 Int)) (!
  (=>
    (and (<= 0 j@395@01) (< j@395@01 (Seq_length xs@377@01)))
    (or (<= 0 j@395@01) (not (<= 0 j@395@01))))
  :pattern ((Seq_index xs@377@01 j@395@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@395@01 Int) (j2@395@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@395@01) (< j1@395@01 (Seq_length xs@377@01)))
      (and (<= 0 j2@395@01) (< j2@395@01 (Seq_length xs@377@01)))
      (= (Seq_index xs@377@01 j1@395@01) (Seq_index xs@377@01 j2@395@01)))
    (= j1@395@01 j2@395@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@395@01 Int)) (!
  (=>
    (and (<= 0 j@395@01) (< j@395@01 (Seq_length xs@377@01)))
    (and
      (= (inv@396@01 (Seq_index xs@377@01 j@395@01)) j@395@01)
      (img@397@01 (Seq_index xs@377@01 j@395@01))))
  :pattern ((Seq_index xs@377@01 j@395@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@397@01 r)
      (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@396@01 r)) r))
  :pattern ((inv@396@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@398@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01)))
      (img@397@01 r)
      (= r (Seq_index xs@377@01 (inv@396@01 r))))
    ($Perm.min
      (ite
        (and
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
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
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@398@01 r))
    $Perm.No)
  
  :qid |quant-u-290|))))
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
      (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01)))
      (img@397@01 r)
      (= r (Seq_index xs@377@01 (inv@396@01 r))))
    (= (- $Perm.Write (pTaken@398@01 r)) $Perm.No))
  
  :qid |quant-u-291|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@399@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@399@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01)))
        (img@397@01 r)))
    (=>
      (and
        (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01)))
        (img@397@01 r))
      (Set_in r ($FVF.domain_f (as sm@399@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@399@01  $FVF<f>))))
  :qid |qp.fvfDomDef140|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01)))
        (img@397@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@399@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@399@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef139|)))
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 4
(assert (not (< 2 (Seq_length xs@377@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 2 (Seq_length xs@377@01)))
(assert (fun08%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@399@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit))) xs@377@01 2))
(pop) ; 3
; Joined path conditions
(assert (forall ((j@395@01 Int)) (!
  (=>
    (and (<= 0 j@395@01) (< j@395@01 (Seq_length xs@377@01)))
    (and
      (= (inv@396@01 (Seq_index xs@377@01 j@395@01)) j@395@01)
      (img@397@01 (Seq_index xs@377@01 j@395@01))))
  :pattern ((Seq_index xs@377@01 j@395@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@397@01 r)
      (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@396@01 r)) r))
  :pattern ((inv@396@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@399@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01)))
        (img@397@01 r)))
    (=>
      (and
        (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01)))
        (img@397@01 r))
      (Set_in r ($FVF.domain_f (as sm@399@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@399@01  $FVF<f>))))
  :qid |qp.fvfDomDef140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@396@01 r)) (< (inv@396@01 r) (Seq_length xs@377@01)))
        (img@397@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@399@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@399@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef139|)))
(assert (and
  (forall ((k@393@01 Int) (j@394@01 Int)) (!
    (=>
      (and
        (>= k@393@01 0)
        (and
          (< k@393@01 (Seq_length xs@377@01))
          (and
            (>= j@394@01 0)
            (and (< j@394@01 (Seq_length xs@377@01)) (not (= k@393@01 j@394@01))))))
      (not (= (Seq_index xs@377@01 k@393@01) (Seq_index xs@377@01 j@394@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@178@12@178@106|))
  (forall ((j@395@01 Int)) (!
    (=>
      (and (<= 0 j@395@01) (< j@395@01 (Seq_length xs@377@01)))
      (or (<= 0 j@395@01) (not (<= 0 j@395@01))))
    :pattern ((Seq_index xs@377@01 j@395@01))
    :qid |f-aux|))
  (< 2 (Seq_length xs@377@01))
  (fun08%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@399@01  $FVF<f>))
      ($Snap.combine $Snap.unit $Snap.unit))) xs@377@01 2)))
; [eval] xs[2]
(push) ; 3
(assert (not (and
  (img@384@01 (Seq_index xs@377@01 2))
  (and
    (<= 0 (inv@383@01 (Seq_index xs@377@01 2)))
    (< (inv@383@01 (Seq_index xs@377@01 2)) (Seq_length xs@377@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>
  (fun08 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@399@01  $FVF<f>))
      ($Snap.combine $Snap.unit $Snap.unit))) xs@377@01 2)
  ($FVF.lookup_f $t@382@01 (Seq_index xs@377@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>
  (fun08 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@399@01  $FVF<f>))
      ($Snap.combine $Snap.unit $Snap.unit))) xs@377@01 2)
  ($FVF.lookup_f $t@382@01 (Seq_index xs@377@01 2))))
; [exec]
; assert fun07(xs, -10) > 0
; [eval] fun07(xs, -10) > 0
; [eval] fun07(xs, -10)
; [eval] -10
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@400@01 Int)
(declare-const i@401@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 197 | !(k@400@01 >= 0) | live]
; [else-branch: 197 | k@400@01 >= 0 | live]
(push) ; 6
; [then-branch: 197 | !(k@400@01 >= 0)]
(assert (not (>= k@400@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 197 | k@400@01 >= 0]
(assert (>= k@400@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 198 | !(k@400@01 < |xs@377@01|) | live]
; [else-branch: 198 | k@400@01 < |xs@377@01| | live]
(push) ; 8
; [then-branch: 198 | !(k@400@01 < |xs@377@01|)]
(assert (not (< k@400@01 (Seq_length xs@377@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 198 | k@400@01 < |xs@377@01|]
(assert (< k@400@01 (Seq_length xs@377@01)))
; [eval] i >= 0
(push) ; 9
; [then-branch: 199 | !(i@401@01 >= 0) | live]
; [else-branch: 199 | i@401@01 >= 0 | live]
(push) ; 10
; [then-branch: 199 | !(i@401@01 >= 0)]
(assert (not (>= i@401@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 199 | i@401@01 >= 0]
(assert (>= i@401@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 200 | !(i@401@01 < |xs@377@01|) | live]
; [else-branch: 200 | i@401@01 < |xs@377@01| | live]
(push) ; 12
; [then-branch: 200 | !(i@401@01 < |xs@377@01|)]
(assert (not (< i@401@01 (Seq_length xs@377@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 200 | i@401@01 < |xs@377@01|]
(assert (< i@401@01 (Seq_length xs@377@01)))
; [eval] k != i
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< i@401@01 (Seq_length xs@377@01))
  (not (< i@401@01 (Seq_length xs@377@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@401@01 0)
  (and
    (>= i@401@01 0)
    (or
      (< i@401@01 (Seq_length xs@377@01))
      (not (< i@401@01 (Seq_length xs@377@01)))))))
(assert (or (>= i@401@01 0) (not (>= i@401@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@400@01 (Seq_length xs@377@01))
  (and
    (< k@400@01 (Seq_length xs@377@01))
    (=>
      (>= i@401@01 0)
      (and
        (>= i@401@01 0)
        (or
          (< i@401@01 (Seq_length xs@377@01))
          (not (< i@401@01 (Seq_length xs@377@01))))))
    (or (>= i@401@01 0) (not (>= i@401@01 0))))))
(assert (or
  (< k@400@01 (Seq_length xs@377@01))
  (not (< k@400@01 (Seq_length xs@377@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@400@01 0)
  (and
    (>= k@400@01 0)
    (=>
      (< k@400@01 (Seq_length xs@377@01))
      (and
        (< k@400@01 (Seq_length xs@377@01))
        (=>
          (>= i@401@01 0)
          (and
            (>= i@401@01 0)
            (or
              (< i@401@01 (Seq_length xs@377@01))
              (not (< i@401@01 (Seq_length xs@377@01))))))
        (or (>= i@401@01 0) (not (>= i@401@01 0)))))
    (or
      (< k@400@01 (Seq_length xs@377@01))
      (not (< k@400@01 (Seq_length xs@377@01)))))))
(assert (or (>= k@400@01 0) (not (>= k@400@01 0))))
(push) ; 5
; [then-branch: 201 | k@400@01 >= 0 && k@400@01 < |xs@377@01| && i@401@01 >= 0 && i@401@01 < |xs@377@01| && k@400@01 != i@401@01 | live]
; [else-branch: 201 | !(k@400@01 >= 0 && k@400@01 < |xs@377@01| && i@401@01 >= 0 && i@401@01 < |xs@377@01| && k@400@01 != i@401@01) | live]
(push) ; 6
; [then-branch: 201 | k@400@01 >= 0 && k@400@01 < |xs@377@01| && i@401@01 >= 0 && i@401@01 < |xs@377@01| && k@400@01 != i@401@01]
(assert (and
  (>= k@400@01 0)
  (and
    (< k@400@01 (Seq_length xs@377@01))
    (and
      (>= i@401@01 0)
      (and (< i@401@01 (Seq_length xs@377@01)) (not (= k@400@01 i@401@01)))))))
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(push) ; 6
; [else-branch: 201 | !(k@400@01 >= 0 && k@400@01 < |xs@377@01| && i@401@01 >= 0 && i@401@01 < |xs@377@01| && k@400@01 != i@401@01)]
(assert (not
  (and
    (>= k@400@01 0)
    (and
      (< k@400@01 (Seq_length xs@377@01))
      (and
        (>= i@401@01 0)
        (and (< i@401@01 (Seq_length xs@377@01)) (not (= k@400@01 i@401@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= k@400@01 0)
    (and
      (< k@400@01 (Seq_length xs@377@01))
      (and
        (>= i@401@01 0)
        (and (< i@401@01 (Seq_length xs@377@01)) (not (= k@400@01 i@401@01))))))
  (and
    (>= k@400@01 0)
    (< k@400@01 (Seq_length xs@377@01))
    (>= i@401@01 0)
    (< i@401@01 (Seq_length xs@377@01))
    (not (= k@400@01 i@401@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@400@01 0)
      (and
        (< k@400@01 (Seq_length xs@377@01))
        (and
          (>= i@401@01 0)
          (and (< i@401@01 (Seq_length xs@377@01)) (not (= k@400@01 i@401@01)))))))
  (and
    (>= k@400@01 0)
    (and
      (< k@400@01 (Seq_length xs@377@01))
      (and
        (>= i@401@01 0)
        (and (< i@401@01 (Seq_length xs@377@01)) (not (= k@400@01 i@401@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@400@01 Int) (i@401@01 Int)) (!
  (=>
    (and
      (>= k@400@01 0)
      (and
        (< k@400@01 (Seq_length xs@377@01))
        (and
          (>= i@401@01 0)
          (and (< i@401@01 (Seq_length xs@377@01)) (not (= k@400@01 i@401@01))))))
    (not (= (Seq_index xs@377@01 k@400@01) (Seq_index xs@377@01 i@401@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@400@01 Int) (i@401@01 Int)) (!
  (=>
    (and
      (>= k@400@01 0)
      (and
        (< k@400@01 (Seq_length xs@377@01))
        (and
          (>= i@401@01 0)
          (and (< i@401@01 (Seq_length xs@377@01)) (not (= k@400@01 i@401@01))))))
    (not (= (Seq_index xs@377@01 k@400@01) (Seq_index xs@377@01 i@401@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|)))
(declare-const i@402@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 202 | !(0 <= i@402@01) | live]
; [else-branch: 202 | 0 <= i@402@01 | live]
(push) ; 6
; [then-branch: 202 | !(0 <= i@402@01)]
(assert (not (<= 0 i@402@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 202 | 0 <= i@402@01]
(assert (<= 0 i@402@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@402@01) (not (<= 0 i@402@01))))
(assert (and (<= 0 i@402@01) (< i@402@01 (Seq_length xs@377@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@402@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@403@01 ($Ref) Int)
(declare-fun img@404@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@402@01 Int)) (!
  (=>
    (and (<= 0 i@402@01) (< i@402@01 (Seq_length xs@377@01)))
    (or (<= 0 i@402@01) (not (<= 0 i@402@01))))
  :pattern ((Seq_index xs@377@01 i@402@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@402@01 Int) (i2@402@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@402@01) (< i1@402@01 (Seq_length xs@377@01)))
      (and (<= 0 i2@402@01) (< i2@402@01 (Seq_length xs@377@01)))
      (= (Seq_index xs@377@01 i1@402@01) (Seq_index xs@377@01 i2@402@01)))
    (= i1@402@01 i2@402@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@402@01 Int)) (!
  (=>
    (and (<= 0 i@402@01) (< i@402@01 (Seq_length xs@377@01)))
    (and
      (= (inv@403@01 (Seq_index xs@377@01 i@402@01)) i@402@01)
      (img@404@01 (Seq_index xs@377@01 i@402@01))))
  :pattern ((Seq_index xs@377@01 i@402@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@404@01 r)
      (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@403@01 r)) r))
  :pattern ((inv@403@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@405@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01)))
      (img@404@01 r)
      (= r (Seq_index xs@377@01 (inv@403@01 r))))
    ($Perm.min
      (ite
        (and
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
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
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@405@01 r))
    $Perm.No)
  
  :qid |quant-u-294|))))
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
      (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01)))
      (img@404@01 r)
      (= r (Seq_index xs@377@01 (inv@403@01 r))))
    (= (- $Perm.Write (pTaken@405@01 r)) $Perm.No))
  
  :qid |quant-u-295|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@406@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@406@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01)))
        (img@404@01 r)))
    (=>
      (and
        (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01)))
        (img@404@01 r))
      (Set_in r ($FVF.domain_f (as sm@406@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@406@01  $FVF<f>))))
  :qid |qp.fvfDomDef142|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01)))
        (img@404@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@406@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@406@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef141|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@406@01  $FVF<f>))) xs@377@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@402@01 Int)) (!
  (=>
    (and (<= 0 i@402@01) (< i@402@01 (Seq_length xs@377@01)))
    (and
      (= (inv@403@01 (Seq_index xs@377@01 i@402@01)) i@402@01)
      (img@404@01 (Seq_index xs@377@01 i@402@01))))
  :pattern ((Seq_index xs@377@01 i@402@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@404@01 r)
      (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@403@01 r)) r))
  :pattern ((inv@403@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@406@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01)))
        (img@404@01 r)))
    (=>
      (and
        (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01)))
        (img@404@01 r))
      (Set_in r ($FVF.domain_f (as sm@406@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@406@01  $FVF<f>))))
  :qid |qp.fvfDomDef142|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@403@01 r)) (< (inv@403@01 r) (Seq_length xs@377@01)))
        (img@404@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@406@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@406@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef141|)))
(assert (and
  (forall ((k@400@01 Int) (i@401@01 Int)) (!
    (=>
      (and
        (>= k@400@01 0)
        (and
          (< k@400@01 (Seq_length xs@377@01))
          (and
            (>= i@401@01 0)
            (and (< i@401@01 (Seq_length xs@377@01)) (not (= k@400@01 i@401@01))))))
      (not (= (Seq_index xs@377@01 k@400@01) (Seq_index xs@377@01 i@401@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
  (forall ((i@402@01 Int)) (!
    (=>
      (and (<= 0 i@402@01) (< i@402@01 (Seq_length xs@377@01)))
      (or (<= 0 i@402@01) (not (<= 0 i@402@01))))
    :pattern ((Seq_index xs@377@01 i@402@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@406@01  $FVF<f>))) xs@377@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@406@01  $FVF<f>))) xs@377@01 (- 0 10))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@407@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@384@01 r)
      (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
    (= ($FVF.lookup_f (as sm@407@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@407@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef143|)))
(declare-const pm@408@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@408@01  $FPM) r)
    (ite
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@408@01  $FPM) r))
  :qid |qp.resPrmSumDef144|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@408@01  $FPM) r) $Perm.Write)
  :pattern ((inv@383@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun07(xs, -10) > 0
; [eval] fun07(xs, -10)
; [eval] -10
(set-option :timeout 0)
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@409@01 Int)
(declare-const i@410@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 203 | !(k@409@01 >= 0) | live]
; [else-branch: 203 | k@409@01 >= 0 | live]
(push) ; 6
; [then-branch: 203 | !(k@409@01 >= 0)]
(assert (not (>= k@409@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 203 | k@409@01 >= 0]
(assert (>= k@409@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 204 | !(k@409@01 < |xs@377@01|) | live]
; [else-branch: 204 | k@409@01 < |xs@377@01| | live]
(push) ; 8
; [then-branch: 204 | !(k@409@01 < |xs@377@01|)]
(assert (not (< k@409@01 (Seq_length xs@377@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 204 | k@409@01 < |xs@377@01|]
(assert (< k@409@01 (Seq_length xs@377@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 205 | !(i@410@01 >= 0) | live]
; [else-branch: 205 | i@410@01 >= 0 | live]
(push) ; 10
; [then-branch: 205 | !(i@410@01 >= 0)]
(assert (not (>= i@410@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 205 | i@410@01 >= 0]
(assert (>= i@410@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 206 | !(i@410@01 < |xs@377@01|) | live]
; [else-branch: 206 | i@410@01 < |xs@377@01| | live]
(push) ; 12
; [then-branch: 206 | !(i@410@01 < |xs@377@01|)]
(assert (not (< i@410@01 (Seq_length xs@377@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 206 | i@410@01 < |xs@377@01|]
(assert (< i@410@01 (Seq_length xs@377@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k != i
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< i@410@01 (Seq_length xs@377@01))
  (not (< i@410@01 (Seq_length xs@377@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@410@01 0)
  (and
    (>= i@410@01 0)
    (or
      (< i@410@01 (Seq_length xs@377@01))
      (not (< i@410@01 (Seq_length xs@377@01)))))))
(assert (or (>= i@410@01 0) (not (>= i@410@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@409@01 (Seq_length xs@377@01))
  (and
    (< k@409@01 (Seq_length xs@377@01))
    (=>
      (>= i@410@01 0)
      (and
        (>= i@410@01 0)
        (or
          (< i@410@01 (Seq_length xs@377@01))
          (not (< i@410@01 (Seq_length xs@377@01))))))
    (or (>= i@410@01 0) (not (>= i@410@01 0))))))
(assert (or
  (< k@409@01 (Seq_length xs@377@01))
  (not (< k@409@01 (Seq_length xs@377@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@409@01 0)
  (and
    (>= k@409@01 0)
    (=>
      (< k@409@01 (Seq_length xs@377@01))
      (and
        (< k@409@01 (Seq_length xs@377@01))
        (=>
          (>= i@410@01 0)
          (and
            (>= i@410@01 0)
            (or
              (< i@410@01 (Seq_length xs@377@01))
              (not (< i@410@01 (Seq_length xs@377@01))))))
        (or (>= i@410@01 0) (not (>= i@410@01 0)))))
    (or
      (< k@409@01 (Seq_length xs@377@01))
      (not (< k@409@01 (Seq_length xs@377@01)))))))
(assert (or (>= k@409@01 0) (not (>= k@409@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 207 | k@409@01 >= 0 && k@409@01 < |xs@377@01| && i@410@01 >= 0 && i@410@01 < |xs@377@01| && k@409@01 != i@410@01 | live]
; [else-branch: 207 | !(k@409@01 >= 0 && k@409@01 < |xs@377@01| && i@410@01 >= 0 && i@410@01 < |xs@377@01| && k@409@01 != i@410@01) | live]
(push) ; 6
; [then-branch: 207 | k@409@01 >= 0 && k@409@01 < |xs@377@01| && i@410@01 >= 0 && i@410@01 < |xs@377@01| && k@409@01 != i@410@01]
(assert (and
  (>= k@409@01 0)
  (and
    (< k@409@01 (Seq_length xs@377@01))
    (and
      (>= i@410@01 0)
      (and (< i@410@01 (Seq_length xs@377@01)) (not (= k@409@01 i@410@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 207 | !(k@409@01 >= 0 && k@409@01 < |xs@377@01| && i@410@01 >= 0 && i@410@01 < |xs@377@01| && k@409@01 != i@410@01)]
(assert (not
  (and
    (>= k@409@01 0)
    (and
      (< k@409@01 (Seq_length xs@377@01))
      (and
        (>= i@410@01 0)
        (and (< i@410@01 (Seq_length xs@377@01)) (not (= k@409@01 i@410@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= k@409@01 0)
    (and
      (< k@409@01 (Seq_length xs@377@01))
      (and
        (>= i@410@01 0)
        (and (< i@410@01 (Seq_length xs@377@01)) (not (= k@409@01 i@410@01))))))
  (and
    (>= k@409@01 0)
    (< k@409@01 (Seq_length xs@377@01))
    (>= i@410@01 0)
    (< i@410@01 (Seq_length xs@377@01))
    (not (= k@409@01 i@410@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@409@01 0)
      (and
        (< k@409@01 (Seq_length xs@377@01))
        (and
          (>= i@410@01 0)
          (and (< i@410@01 (Seq_length xs@377@01)) (not (= k@409@01 i@410@01)))))))
  (and
    (>= k@409@01 0)
    (and
      (< k@409@01 (Seq_length xs@377@01))
      (and
        (>= i@410@01 0)
        (and (< i@410@01 (Seq_length xs@377@01)) (not (= k@409@01 i@410@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((k@409@01 Int) (i@410@01 Int)) (!
  (=>
    (and
      (>= k@409@01 0)
      (and
        (< k@409@01 (Seq_length xs@377@01))
        (and
          (>= i@410@01 0)
          (and (< i@410@01 (Seq_length xs@377@01)) (not (= k@409@01 i@410@01))))))
    (not (= (Seq_index xs@377@01 k@409@01) (Seq_index xs@377@01 i@410@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@409@01 Int) (i@410@01 Int)) (!
  (=>
    (and
      (>= k@409@01 0)
      (and
        (< k@409@01 (Seq_length xs@377@01))
        (and
          (>= i@410@01 0)
          (and (< i@410@01 (Seq_length xs@377@01)) (not (= k@409@01 i@410@01))))))
    (not (= (Seq_index xs@377@01 k@409@01) (Seq_index xs@377@01 i@410@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|)))
(declare-const i@411@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 208 | !(0 <= i@411@01) | live]
; [else-branch: 208 | 0 <= i@411@01 | live]
(push) ; 6
; [then-branch: 208 | !(0 <= i@411@01)]
(assert (not (<= 0 i@411@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 208 | 0 <= i@411@01]
(assert (<= 0 i@411@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@411@01) (not (<= 0 i@411@01))))
(assert (and (<= 0 i@411@01) (< i@411@01 (Seq_length xs@377@01))))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@411@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@412@01 ($Ref) Int)
(declare-fun img@413@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@411@01 Int)) (!
  (=>
    (and (<= 0 i@411@01) (< i@411@01 (Seq_length xs@377@01)))
    (or (<= 0 i@411@01) (not (<= 0 i@411@01))))
  :pattern ((Seq_index xs@377@01 i@411@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@411@01 Int) (i2@411@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@411@01) (< i1@411@01 (Seq_length xs@377@01)))
      (and (<= 0 i2@411@01) (< i2@411@01 (Seq_length xs@377@01)))
      (= (Seq_index xs@377@01 i1@411@01) (Seq_index xs@377@01 i2@411@01)))
    (= i1@411@01 i2@411@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@411@01 Int)) (!
  (=>
    (and (<= 0 i@411@01) (< i@411@01 (Seq_length xs@377@01)))
    (and
      (= (inv@412@01 (Seq_index xs@377@01 i@411@01)) i@411@01)
      (img@413@01 (Seq_index xs@377@01 i@411@01))))
  :pattern ((Seq_index xs@377@01 i@411@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@413@01 r)
      (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@412@01 r)) r))
  :pattern ((inv@412@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@414@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01)))
      (img@413@01 r)
      (= r (Seq_index xs@377@01 (inv@412@01 r))))
    ($Perm.min
      (ite
        (and
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
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
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@414@01 r))
    $Perm.No)
  
  :qid |quant-u-298|))))
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
      (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01)))
      (img@413@01 r)
      (= r (Seq_index xs@377@01 (inv@412@01 r))))
    (= (- $Perm.Write (pTaken@414@01 r)) $Perm.No))
  
  :qid |quant-u-299|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@415@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@415@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01)))
        (img@413@01 r)))
    (=>
      (and
        (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01)))
        (img@413@01 r))
      (Set_in r ($FVF.domain_f (as sm@415@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@415@01  $FVF<f>))))
  :qid |qp.fvfDomDef146|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01)))
        (img@413@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@415@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@415@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef145|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@415@01  $FVF<f>))) xs@377@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@411@01 Int)) (!
  (=>
    (and (<= 0 i@411@01) (< i@411@01 (Seq_length xs@377@01)))
    (and
      (= (inv@412@01 (Seq_index xs@377@01 i@411@01)) i@411@01)
      (img@413@01 (Seq_index xs@377@01 i@411@01))))
  :pattern ((Seq_index xs@377@01 i@411@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@413@01 r)
      (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@412@01 r)) r))
  :pattern ((inv@412@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@415@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01)))
        (img@413@01 r)))
    (=>
      (and
        (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01)))
        (img@413@01 r))
      (Set_in r ($FVF.domain_f (as sm@415@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@415@01  $FVF<f>))))
  :qid |qp.fvfDomDef146|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@412@01 r)) (< (inv@412@01 r) (Seq_length xs@377@01)))
        (img@413@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@415@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@415@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef145|)))
(assert (and
  (forall ((k@409@01 Int) (i@410@01 Int)) (!
    (=>
      (and
        (>= k@409@01 0)
        (and
          (< k@409@01 (Seq_length xs@377@01))
          (and
            (>= i@410@01 0)
            (and (< i@410@01 (Seq_length xs@377@01)) (not (= k@409@01 i@410@01))))))
      (not (= (Seq_index xs@377@01 k@409@01) (Seq_index xs@377@01 i@410@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
  (forall ((i@411@01 Int)) (!
    (=>
      (and (<= 0 i@411@01) (< i@411@01 (Seq_length xs@377@01)))
      (or (<= 0 i@411@01) (not (<= 0 i@411@01))))
    :pattern ((Seq_index xs@377@01 i@411@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@415@01  $FVF<f>))) xs@377@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@415@01  $FVF<f>))) xs@377@01 (- 0 10))
  0)))
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
(declare-const sm@416@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@384@01 r)
      (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
    (= ($FVF.lookup_f (as sm@416@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@416@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef147|)))
(declare-const pm@417@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@417@01  $FPM) r)
    (ite
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@417@01  $FPM) r))
  :qid |qp.resPrmSumDef148|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@417@01  $FPM) r) $Perm.Write)
  :pattern ((inv@383@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun07(xs, -10) > 0
; [eval] fun07(xs, -10)
; [eval] -10
(set-option :timeout 0)
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@418@01 Int)
(declare-const i@419@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 209 | !(k@418@01 >= 0) | live]
; [else-branch: 209 | k@418@01 >= 0 | live]
(push) ; 6
; [then-branch: 209 | !(k@418@01 >= 0)]
(assert (not (>= k@418@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 209 | k@418@01 >= 0]
(assert (>= k@418@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 210 | !(k@418@01 < |xs@377@01|) | live]
; [else-branch: 210 | k@418@01 < |xs@377@01| | live]
(push) ; 8
; [then-branch: 210 | !(k@418@01 < |xs@377@01|)]
(assert (not (< k@418@01 (Seq_length xs@377@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 210 | k@418@01 < |xs@377@01|]
(assert (< k@418@01 (Seq_length xs@377@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 211 | !(i@419@01 >= 0) | live]
; [else-branch: 211 | i@419@01 >= 0 | live]
(push) ; 10
; [then-branch: 211 | !(i@419@01 >= 0)]
(assert (not (>= i@419@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 211 | i@419@01 >= 0]
(assert (>= i@419@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 212 | !(i@419@01 < |xs@377@01|) | live]
; [else-branch: 212 | i@419@01 < |xs@377@01| | live]
(push) ; 12
; [then-branch: 212 | !(i@419@01 < |xs@377@01|)]
(assert (not (< i@419@01 (Seq_length xs@377@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 212 | i@419@01 < |xs@377@01|]
(assert (< i@419@01 (Seq_length xs@377@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k != i
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< i@419@01 (Seq_length xs@377@01))
  (not (< i@419@01 (Seq_length xs@377@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@419@01 0)
  (and
    (>= i@419@01 0)
    (or
      (< i@419@01 (Seq_length xs@377@01))
      (not (< i@419@01 (Seq_length xs@377@01)))))))
(assert (or (>= i@419@01 0) (not (>= i@419@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@418@01 (Seq_length xs@377@01))
  (and
    (< k@418@01 (Seq_length xs@377@01))
    (=>
      (>= i@419@01 0)
      (and
        (>= i@419@01 0)
        (or
          (< i@419@01 (Seq_length xs@377@01))
          (not (< i@419@01 (Seq_length xs@377@01))))))
    (or (>= i@419@01 0) (not (>= i@419@01 0))))))
(assert (or
  (< k@418@01 (Seq_length xs@377@01))
  (not (< k@418@01 (Seq_length xs@377@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@418@01 0)
  (and
    (>= k@418@01 0)
    (=>
      (< k@418@01 (Seq_length xs@377@01))
      (and
        (< k@418@01 (Seq_length xs@377@01))
        (=>
          (>= i@419@01 0)
          (and
            (>= i@419@01 0)
            (or
              (< i@419@01 (Seq_length xs@377@01))
              (not (< i@419@01 (Seq_length xs@377@01))))))
        (or (>= i@419@01 0) (not (>= i@419@01 0)))))
    (or
      (< k@418@01 (Seq_length xs@377@01))
      (not (< k@418@01 (Seq_length xs@377@01)))))))
(assert (or (>= k@418@01 0) (not (>= k@418@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 213 | k@418@01 >= 0 && k@418@01 < |xs@377@01| && i@419@01 >= 0 && i@419@01 < |xs@377@01| && k@418@01 != i@419@01 | live]
; [else-branch: 213 | !(k@418@01 >= 0 && k@418@01 < |xs@377@01| && i@419@01 >= 0 && i@419@01 < |xs@377@01| && k@418@01 != i@419@01) | live]
(push) ; 6
; [then-branch: 213 | k@418@01 >= 0 && k@418@01 < |xs@377@01| && i@419@01 >= 0 && i@419@01 < |xs@377@01| && k@418@01 != i@419@01]
(assert (and
  (>= k@418@01 0)
  (and
    (< k@418@01 (Seq_length xs@377@01))
    (and
      (>= i@419@01 0)
      (and (< i@419@01 (Seq_length xs@377@01)) (not (= k@418@01 i@419@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 213 | !(k@418@01 >= 0 && k@418@01 < |xs@377@01| && i@419@01 >= 0 && i@419@01 < |xs@377@01| && k@418@01 != i@419@01)]
(assert (not
  (and
    (>= k@418@01 0)
    (and
      (< k@418@01 (Seq_length xs@377@01))
      (and
        (>= i@419@01 0)
        (and (< i@419@01 (Seq_length xs@377@01)) (not (= k@418@01 i@419@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= k@418@01 0)
    (and
      (< k@418@01 (Seq_length xs@377@01))
      (and
        (>= i@419@01 0)
        (and (< i@419@01 (Seq_length xs@377@01)) (not (= k@418@01 i@419@01))))))
  (and
    (>= k@418@01 0)
    (< k@418@01 (Seq_length xs@377@01))
    (>= i@419@01 0)
    (< i@419@01 (Seq_length xs@377@01))
    (not (= k@418@01 i@419@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@418@01 0)
      (and
        (< k@418@01 (Seq_length xs@377@01))
        (and
          (>= i@419@01 0)
          (and (< i@419@01 (Seq_length xs@377@01)) (not (= k@418@01 i@419@01)))))))
  (and
    (>= k@418@01 0)
    (and
      (< k@418@01 (Seq_length xs@377@01))
      (and
        (>= i@419@01 0)
        (and (< i@419@01 (Seq_length xs@377@01)) (not (= k@418@01 i@419@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((k@418@01 Int) (i@419@01 Int)) (!
  (=>
    (and
      (>= k@418@01 0)
      (and
        (< k@418@01 (Seq_length xs@377@01))
        (and
          (>= i@419@01 0)
          (and (< i@419@01 (Seq_length xs@377@01)) (not (= k@418@01 i@419@01))))))
    (not (= (Seq_index xs@377@01 k@418@01) (Seq_index xs@377@01 i@419@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@418@01 Int) (i@419@01 Int)) (!
  (=>
    (and
      (>= k@418@01 0)
      (and
        (< k@418@01 (Seq_length xs@377@01))
        (and
          (>= i@419@01 0)
          (and (< i@419@01 (Seq_length xs@377@01)) (not (= k@418@01 i@419@01))))))
    (not (= (Seq_index xs@377@01 k@418@01) (Seq_index xs@377@01 i@419@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|)))
(declare-const i@420@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 214 | !(0 <= i@420@01) | live]
; [else-branch: 214 | 0 <= i@420@01 | live]
(push) ; 6
; [then-branch: 214 | !(0 <= i@420@01)]
(assert (not (<= 0 i@420@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 214 | 0 <= i@420@01]
(assert (<= 0 i@420@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@420@01) (not (<= 0 i@420@01))))
(assert (and (<= 0 i@420@01) (< i@420@01 (Seq_length xs@377@01))))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@420@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@421@01 ($Ref) Int)
(declare-fun img@422@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@420@01 Int)) (!
  (=>
    (and (<= 0 i@420@01) (< i@420@01 (Seq_length xs@377@01)))
    (or (<= 0 i@420@01) (not (<= 0 i@420@01))))
  :pattern ((Seq_index xs@377@01 i@420@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@420@01 Int) (i2@420@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@420@01) (< i1@420@01 (Seq_length xs@377@01)))
      (and (<= 0 i2@420@01) (< i2@420@01 (Seq_length xs@377@01)))
      (= (Seq_index xs@377@01 i1@420@01) (Seq_index xs@377@01 i2@420@01)))
    (= i1@420@01 i2@420@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@420@01 Int)) (!
  (=>
    (and (<= 0 i@420@01) (< i@420@01 (Seq_length xs@377@01)))
    (and
      (= (inv@421@01 (Seq_index xs@377@01 i@420@01)) i@420@01)
      (img@422@01 (Seq_index xs@377@01 i@420@01))))
  :pattern ((Seq_index xs@377@01 i@420@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@422@01 r)
      (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@421@01 r)) r))
  :pattern ((inv@421@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@423@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01)))
      (img@422@01 r)
      (= r (Seq_index xs@377@01 (inv@421@01 r))))
    ($Perm.min
      (ite
        (and
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
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
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@423@01 r))
    $Perm.No)
  
  :qid |quant-u-302|))))
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
      (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01)))
      (img@422@01 r)
      (= r (Seq_index xs@377@01 (inv@421@01 r))))
    (= (- $Perm.Write (pTaken@423@01 r)) $Perm.No))
  
  :qid |quant-u-303|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@424@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@424@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01)))
        (img@422@01 r)))
    (=>
      (and
        (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01)))
        (img@422@01 r))
      (Set_in r ($FVF.domain_f (as sm@424@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@424@01  $FVF<f>))))
  :qid |qp.fvfDomDef150|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01)))
        (img@422@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@424@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef149|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@424@01  $FVF<f>))) xs@377@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@420@01 Int)) (!
  (=>
    (and (<= 0 i@420@01) (< i@420@01 (Seq_length xs@377@01)))
    (and
      (= (inv@421@01 (Seq_index xs@377@01 i@420@01)) i@420@01)
      (img@422@01 (Seq_index xs@377@01 i@420@01))))
  :pattern ((Seq_index xs@377@01 i@420@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@422@01 r)
      (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@421@01 r)) r))
  :pattern ((inv@421@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@424@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01)))
        (img@422@01 r)))
    (=>
      (and
        (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01)))
        (img@422@01 r))
      (Set_in r ($FVF.domain_f (as sm@424@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@424@01  $FVF<f>))))
  :qid |qp.fvfDomDef150|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@421@01 r)) (< (inv@421@01 r) (Seq_length xs@377@01)))
        (img@422@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@424@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef149|)))
(assert (and
  (forall ((k@418@01 Int) (i@419@01 Int)) (!
    (=>
      (and
        (>= k@418@01 0)
        (and
          (< k@418@01 (Seq_length xs@377@01))
          (and
            (>= i@419@01 0)
            (and (< i@419@01 (Seq_length xs@377@01)) (not (= k@418@01 i@419@01))))))
      (not (= (Seq_index xs@377@01 k@418@01) (Seq_index xs@377@01 i@419@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
  (forall ((i@420@01 Int)) (!
    (=>
      (and (<= 0 i@420@01) (< i@420@01 (Seq_length xs@377@01)))
      (or (<= 0 i@420@01) (not (<= 0 i@420@01))))
    :pattern ((Seq_index xs@377@01 i@420@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@424@01  $FVF<f>))) xs@377@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@424@01  $FVF<f>))) xs@377@01 (- 0 10))
  0)))
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
; [eval] fun07(xs, -10) > 0
; [eval] fun07(xs, -10)
; [eval] -10
(set-option :timeout 0)
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@425@01 Int)
(declare-const i@426@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 215 | !(k@425@01 >= 0) | live]
; [else-branch: 215 | k@425@01 >= 0 | live]
(push) ; 6
; [then-branch: 215 | !(k@425@01 >= 0)]
(assert (not (>= k@425@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 215 | k@425@01 >= 0]
(assert (>= k@425@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 216 | !(k@425@01 < |xs@377@01|) | live]
; [else-branch: 216 | k@425@01 < |xs@377@01| | live]
(push) ; 8
; [then-branch: 216 | !(k@425@01 < |xs@377@01|)]
(assert (not (< k@425@01 (Seq_length xs@377@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 216 | k@425@01 < |xs@377@01|]
(assert (< k@425@01 (Seq_length xs@377@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 217 | !(i@426@01 >= 0) | live]
; [else-branch: 217 | i@426@01 >= 0 | live]
(push) ; 10
; [then-branch: 217 | !(i@426@01 >= 0)]
(assert (not (>= i@426@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 217 | i@426@01 >= 0]
(assert (>= i@426@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 218 | !(i@426@01 < |xs@377@01|) | live]
; [else-branch: 218 | i@426@01 < |xs@377@01| | live]
(push) ; 12
; [then-branch: 218 | !(i@426@01 < |xs@377@01|)]
(assert (not (< i@426@01 (Seq_length xs@377@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 218 | i@426@01 < |xs@377@01|]
(assert (< i@426@01 (Seq_length xs@377@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k != i
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< i@426@01 (Seq_length xs@377@01))
  (not (< i@426@01 (Seq_length xs@377@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@426@01 0)
  (and
    (>= i@426@01 0)
    (or
      (< i@426@01 (Seq_length xs@377@01))
      (not (< i@426@01 (Seq_length xs@377@01)))))))
(assert (or (>= i@426@01 0) (not (>= i@426@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@425@01 (Seq_length xs@377@01))
  (and
    (< k@425@01 (Seq_length xs@377@01))
    (=>
      (>= i@426@01 0)
      (and
        (>= i@426@01 0)
        (or
          (< i@426@01 (Seq_length xs@377@01))
          (not (< i@426@01 (Seq_length xs@377@01))))))
    (or (>= i@426@01 0) (not (>= i@426@01 0))))))
(assert (or
  (< k@425@01 (Seq_length xs@377@01))
  (not (< k@425@01 (Seq_length xs@377@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@425@01 0)
  (and
    (>= k@425@01 0)
    (=>
      (< k@425@01 (Seq_length xs@377@01))
      (and
        (< k@425@01 (Seq_length xs@377@01))
        (=>
          (>= i@426@01 0)
          (and
            (>= i@426@01 0)
            (or
              (< i@426@01 (Seq_length xs@377@01))
              (not (< i@426@01 (Seq_length xs@377@01))))))
        (or (>= i@426@01 0) (not (>= i@426@01 0)))))
    (or
      (< k@425@01 (Seq_length xs@377@01))
      (not (< k@425@01 (Seq_length xs@377@01)))))))
(assert (or (>= k@425@01 0) (not (>= k@425@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 219 | k@425@01 >= 0 && k@425@01 < |xs@377@01| && i@426@01 >= 0 && i@426@01 < |xs@377@01| && k@425@01 != i@426@01 | live]
; [else-branch: 219 | !(k@425@01 >= 0 && k@425@01 < |xs@377@01| && i@426@01 >= 0 && i@426@01 < |xs@377@01| && k@425@01 != i@426@01) | live]
(push) ; 6
; [then-branch: 219 | k@425@01 >= 0 && k@425@01 < |xs@377@01| && i@426@01 >= 0 && i@426@01 < |xs@377@01| && k@425@01 != i@426@01]
(assert (and
  (>= k@425@01 0)
  (and
    (< k@425@01 (Seq_length xs@377@01))
    (and
      (>= i@426@01 0)
      (and (< i@426@01 (Seq_length xs@377@01)) (not (= k@425@01 i@426@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 219 | !(k@425@01 >= 0 && k@425@01 < |xs@377@01| && i@426@01 >= 0 && i@426@01 < |xs@377@01| && k@425@01 != i@426@01)]
(assert (not
  (and
    (>= k@425@01 0)
    (and
      (< k@425@01 (Seq_length xs@377@01))
      (and
        (>= i@426@01 0)
        (and (< i@426@01 (Seq_length xs@377@01)) (not (= k@425@01 i@426@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= k@425@01 0)
    (and
      (< k@425@01 (Seq_length xs@377@01))
      (and
        (>= i@426@01 0)
        (and (< i@426@01 (Seq_length xs@377@01)) (not (= k@425@01 i@426@01))))))
  (and
    (>= k@425@01 0)
    (< k@425@01 (Seq_length xs@377@01))
    (>= i@426@01 0)
    (< i@426@01 (Seq_length xs@377@01))
    (not (= k@425@01 i@426@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@425@01 0)
      (and
        (< k@425@01 (Seq_length xs@377@01))
        (and
          (>= i@426@01 0)
          (and (< i@426@01 (Seq_length xs@377@01)) (not (= k@425@01 i@426@01)))))))
  (and
    (>= k@425@01 0)
    (and
      (< k@425@01 (Seq_length xs@377@01))
      (and
        (>= i@426@01 0)
        (and (< i@426@01 (Seq_length xs@377@01)) (not (= k@425@01 i@426@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((k@425@01 Int) (i@426@01 Int)) (!
  (=>
    (and
      (>= k@425@01 0)
      (and
        (< k@425@01 (Seq_length xs@377@01))
        (and
          (>= i@426@01 0)
          (and (< i@426@01 (Seq_length xs@377@01)) (not (= k@425@01 i@426@01))))))
    (not (= (Seq_index xs@377@01 k@425@01) (Seq_index xs@377@01 i@426@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@425@01 Int) (i@426@01 Int)) (!
  (=>
    (and
      (>= k@425@01 0)
      (and
        (< k@425@01 (Seq_length xs@377@01))
        (and
          (>= i@426@01 0)
          (and (< i@426@01 (Seq_length xs@377@01)) (not (= k@425@01 i@426@01))))))
    (not (= (Seq_index xs@377@01 k@425@01) (Seq_index xs@377@01 i@426@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|)))
(declare-const i@427@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 220 | !(0 <= i@427@01) | live]
; [else-branch: 220 | 0 <= i@427@01 | live]
(push) ; 6
; [then-branch: 220 | !(0 <= i@427@01)]
(assert (not (<= 0 i@427@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 220 | 0 <= i@427@01]
(assert (<= 0 i@427@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@427@01) (not (<= 0 i@427@01))))
(assert (and (<= 0 i@427@01) (< i@427@01 (Seq_length xs@377@01))))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@427@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@428@01 ($Ref) Int)
(declare-fun img@429@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@427@01 Int)) (!
  (=>
    (and (<= 0 i@427@01) (< i@427@01 (Seq_length xs@377@01)))
    (or (<= 0 i@427@01) (not (<= 0 i@427@01))))
  :pattern ((Seq_index xs@377@01 i@427@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@427@01 Int) (i2@427@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@427@01) (< i1@427@01 (Seq_length xs@377@01)))
      (and (<= 0 i2@427@01) (< i2@427@01 (Seq_length xs@377@01)))
      (= (Seq_index xs@377@01 i1@427@01) (Seq_index xs@377@01 i2@427@01)))
    (= i1@427@01 i2@427@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@427@01 Int)) (!
  (=>
    (and (<= 0 i@427@01) (< i@427@01 (Seq_length xs@377@01)))
    (and
      (= (inv@428@01 (Seq_index xs@377@01 i@427@01)) i@427@01)
      (img@429@01 (Seq_index xs@377@01 i@427@01))))
  :pattern ((Seq_index xs@377@01 i@427@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@429@01 r)
      (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@428@01 r)) r))
  :pattern ((inv@428@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@430@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01)))
      (img@429@01 r)
      (= r (Seq_index xs@377@01 (inv@428@01 r))))
    ($Perm.min
      (ite
        (and
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
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
          (img@384@01 r)
          (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@430@01 r))
    $Perm.No)
  
  :qid |quant-u-306|))))
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
      (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01)))
      (img@429@01 r)
      (= r (Seq_index xs@377@01 (inv@428@01 r))))
    (= (- $Perm.Write (pTaken@430@01 r)) $Perm.No))
  
  :qid |quant-u-307|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@431@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@431@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01)))
        (img@429@01 r)))
    (=>
      (and
        (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01)))
        (img@429@01 r))
      (Set_in r ($FVF.domain_f (as sm@431@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@431@01  $FVF<f>))))
  :qid |qp.fvfDomDef152|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01)))
        (img@429@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@431@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@431@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef151|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@431@01  $FVF<f>))) xs@377@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@427@01 Int)) (!
  (=>
    (and (<= 0 i@427@01) (< i@427@01 (Seq_length xs@377@01)))
    (and
      (= (inv@428@01 (Seq_index xs@377@01 i@427@01)) i@427@01)
      (img@429@01 (Seq_index xs@377@01 i@427@01))))
  :pattern ((Seq_index xs@377@01 i@427@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@429@01 r)
      (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01))))
    (= (Seq_index xs@377@01 (inv@428@01 r)) r))
  :pattern ((inv@428@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@431@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01)))
        (img@429@01 r)))
    (=>
      (and
        (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01)))
        (img@429@01 r))
      (Set_in r ($FVF.domain_f (as sm@431@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@431@01  $FVF<f>))))
  :qid |qp.fvfDomDef152|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@428@01 r)) (< (inv@428@01 r) (Seq_length xs@377@01)))
        (img@429@01 r))
      (and
        (img@384@01 r)
        (and (<= 0 (inv@383@01 r)) (< (inv@383@01 r) (Seq_length xs@377@01)))))
    (= ($FVF.lookup_f (as sm@431@01  $FVF<f>) r) ($FVF.lookup_f $t@382@01 r)))
  :pattern (($FVF.lookup_f (as sm@431@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@382@01 r))
  :qid |qp.fvfValDef151|)))
(assert (and
  (forall ((k@425@01 Int) (i@426@01 Int)) (!
    (=>
      (and
        (>= k@425@01 0)
        (and
          (< k@425@01 (Seq_length xs@377@01))
          (and
            (>= i@426@01 0)
            (and (< i@426@01 (Seq_length xs@377@01)) (not (= k@425@01 i@426@01))))))
      (not (= (Seq_index xs@377@01 k@425@01) (Seq_index xs@377@01 i@426@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
  (forall ((i@427@01 Int)) (!
    (=>
      (and (<= 0 i@427@01) (< i@427@01 (Seq_length xs@377@01)))
      (or (<= 0 i@427@01) (not (<= 0 i@427@01))))
    :pattern ((Seq_index xs@377@01 i@427@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@431@01  $FVF<f>))) xs@377@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@431@01  $FVF<f>))) xs@377@01 (- 0 10))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
