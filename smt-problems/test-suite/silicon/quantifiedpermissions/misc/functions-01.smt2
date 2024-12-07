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
; ---------- FUNCTION fun07----------
(declare-fun xs@0@00 () Seq<$Ref>)
(declare-fun j@1@00 () Int)
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] (forall k: Int, i: Int :: { xs[k], xs[i] } k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@21@00 Int)
(declare-const i@22@00 Int)
(push) ; 2
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 0 | !(k@21@00 >= 0) | live]
; [else-branch: 0 | k@21@00 >= 0 | live]
(push) ; 4
; [then-branch: 0 | !(k@21@00 >= 0)]
(assert (not (>= k@21@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | k@21@00 >= 0]
(assert (>= k@21@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 1 | !(k@21@00 < |xs@0@00|) | live]
; [else-branch: 1 | k@21@00 < |xs@0@00| | live]
(push) ; 6
; [then-branch: 1 | !(k@21@00 < |xs@0@00|)]
(assert (not (< k@21@00 (Seq_length xs@0@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | k@21@00 < |xs@0@00|]
(assert (< k@21@00 (Seq_length xs@0@00)))
; [eval] i >= 0
(push) ; 7
; [then-branch: 2 | !(i@22@00 >= 0) | live]
; [else-branch: 2 | i@22@00 >= 0 | live]
(push) ; 8
; [then-branch: 2 | !(i@22@00 >= 0)]
(assert (not (>= i@22@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | i@22@00 >= 0]
(assert (>= i@22@00 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 3 | !(i@22@00 < |xs@0@00|) | live]
; [else-branch: 3 | i@22@00 < |xs@0@00| | live]
(push) ; 10
; [then-branch: 3 | !(i@22@00 < |xs@0@00|)]
(assert (not (< i@22@00 (Seq_length xs@0@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | i@22@00 < |xs@0@00|]
(assert (< i@22@00 (Seq_length xs@0@00)))
; [eval] k != i
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< i@22@00 (Seq_length xs@0@00)) (not (< i@22@00 (Seq_length xs@0@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@22@00 0)
  (and
    (>= i@22@00 0)
    (or (< i@22@00 (Seq_length xs@0@00)) (not (< i@22@00 (Seq_length xs@0@00)))))))
(assert (or (>= i@22@00 0) (not (>= i@22@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@21@00 (Seq_length xs@0@00))
  (and
    (< k@21@00 (Seq_length xs@0@00))
    (=>
      (>= i@22@00 0)
      (and
        (>= i@22@00 0)
        (or
          (< i@22@00 (Seq_length xs@0@00))
          (not (< i@22@00 (Seq_length xs@0@00))))))
    (or (>= i@22@00 0) (not (>= i@22@00 0))))))
(assert (or (< k@21@00 (Seq_length xs@0@00)) (not (< k@21@00 (Seq_length xs@0@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@21@00 0)
  (and
    (>= k@21@00 0)
    (=>
      (< k@21@00 (Seq_length xs@0@00))
      (and
        (< k@21@00 (Seq_length xs@0@00))
        (=>
          (>= i@22@00 0)
          (and
            (>= i@22@00 0)
            (or
              (< i@22@00 (Seq_length xs@0@00))
              (not (< i@22@00 (Seq_length xs@0@00))))))
        (or (>= i@22@00 0) (not (>= i@22@00 0)))))
    (or (< k@21@00 (Seq_length xs@0@00)) (not (< k@21@00 (Seq_length xs@0@00)))))))
(assert (or (>= k@21@00 0) (not (>= k@21@00 0))))
(push) ; 3
; [then-branch: 4 | k@21@00 >= 0 && k@21@00 < |xs@0@00| && i@22@00 >= 0 && i@22@00 < |xs@0@00| && k@21@00 != i@22@00 | live]
; [else-branch: 4 | !(k@21@00 >= 0 && k@21@00 < |xs@0@00| && i@22@00 >= 0 && i@22@00 < |xs@0@00| && k@21@00 != i@22@00) | live]
(push) ; 4
; [then-branch: 4 | k@21@00 >= 0 && k@21@00 < |xs@0@00| && i@22@00 >= 0 && i@22@00 < |xs@0@00| && k@21@00 != i@22@00]
(assert (and
  (>= k@21@00 0)
  (and
    (< k@21@00 (Seq_length xs@0@00))
    (and
      (>= i@22@00 0)
      (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00)))))))
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(k@21@00 >= 0 && k@21@00 < |xs@0@00| && i@22@00 >= 0 && i@22@00 < |xs@0@00| && k@21@00 != i@22@00)]
(assert (not
  (and
    (>= k@21@00 0)
    (and
      (< k@21@00 (Seq_length xs@0@00))
      (and
        (>= i@22@00 0)
        (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@21@00 0)
    (and
      (< k@21@00 (Seq_length xs@0@00))
      (and
        (>= i@22@00 0)
        (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00))))))
  (and
    (>= k@21@00 0)
    (< k@21@00 (Seq_length xs@0@00))
    (>= i@22@00 0)
    (< i@22@00 (Seq_length xs@0@00))
    (not (= k@21@00 i@22@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@21@00 0)
      (and
        (< k@21@00 (Seq_length xs@0@00))
        (and
          (>= i@22@00 0)
          (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00)))))))
  (and
    (>= k@21@00 0)
    (and
      (< k@21@00 (Seq_length xs@0@00))
      (and
        (>= i@22@00 0)
        (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@21@00 Int) (i@22@00 Int)) (!
  (and
    (=>
      (>= k@21@00 0)
      (and
        (>= k@21@00 0)
        (=>
          (< k@21@00 (Seq_length xs@0@00))
          (and
            (< k@21@00 (Seq_length xs@0@00))
            (=>
              (>= i@22@00 0)
              (and
                (>= i@22@00 0)
                (or
                  (< i@22@00 (Seq_length xs@0@00))
                  (not (< i@22@00 (Seq_length xs@0@00))))))
            (or (>= i@22@00 0) (not (>= i@22@00 0)))))
        (or
          (< k@21@00 (Seq_length xs@0@00))
          (not (< k@21@00 (Seq_length xs@0@00))))))
    (or (>= k@21@00 0) (not (>= k@21@00 0)))
    (=>
      (and
        (>= k@21@00 0)
        (and
          (< k@21@00 (Seq_length xs@0@00))
          (and
            (>= i@22@00 0)
            (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00))))))
      (and
        (>= k@21@00 0)
        (< k@21@00 (Seq_length xs@0@00))
        (>= i@22@00 0)
        (< i@22@00 (Seq_length xs@0@00))
        (not (= k@21@00 i@22@00))))
    (or
      (not
        (and
          (>= k@21@00 0)
          (and
            (< k@21@00 (Seq_length xs@0@00))
            (and
              (>= i@22@00 0)
              (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00)))))))
      (and
        (>= k@21@00 0)
        (and
          (< k@21@00 (Seq_length xs@0@00))
          (and
            (>= i@22@00 0)
            (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00))))))))
  :pattern ((Seq_index xs@0@00 k@21@00) (Seq_index xs@0@00 i@22@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106-aux|)))
(assert (forall ((k@21@00 Int) (i@22@00 Int)) (!
  (=>
    (and
      (>= k@21@00 0)
      (and
        (< k@21@00 (Seq_length xs@0@00))
        (and
          (>= i@22@00 0)
          (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00))))))
    (not (= (Seq_index xs@0@00 k@21@00) (Seq_index xs@0@00 i@22@00))))
  :pattern ((Seq_index xs@0@00 k@21@00) (Seq_index xs@0@00 i@22@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|)))
(declare-const i@23@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 5 | !(0 <= i@23@00) | live]
; [else-branch: 5 | 0 <= i@23@00 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= i@23@00)]
(assert (not (<= 0 i@23@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= i@23@00]
(assert (<= 0 i@23@00))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@23@00) (not (<= 0 i@23@00))))
(assert (and (<= 0 i@23@00) (< i@23@00 (Seq_length xs@0@00))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@23@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@24@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@25@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@23@00 Int)) (!
  (=>
    (and (<= 0 i@23@00) (< i@23@00 (Seq_length xs@0@00)))
    (or (<= 0 i@23@00) (not (<= 0 i@23@00))))
  :pattern ((Seq_index xs@0@00 i@23@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@23@00 Int) (i2@23@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@23@00) (< i1@23@00 (Seq_length xs@0@00)))
      (and (<= 0 i2@23@00) (< i2@23@00 (Seq_length xs@0@00)))
      (= (Seq_index xs@0@00 i1@23@00) (Seq_index xs@0@00 i2@23@00)))
    (= i1@23@00 i2@23@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@23@00 Int)) (!
  (=>
    (and (<= 0 i@23@00) (< i@23@00 (Seq_length xs@0@00)))
    (and
      (= (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00)) i@23@00)
      (img@25@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00))))
  :pattern ((Seq_index xs@0@00 i@23@00))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ xs@0@00 j@1@00 r)
      (and
        (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@24@00 s@$ xs@0@00 j@1@00 r)) r))
  :pattern ((inv@24@00 s@$ xs@0@00 j@1@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@23@00 Int)) (!
  (=>
    (and (<= 0 i@23@00) (< i@23@00 (Seq_length xs@0@00)))
    (not (= (Seq_index xs@0@00 i@23@00) $Ref.null)))
  :pattern ((Seq_index xs@0@00 i@23@00))
  :qid |f-permImpliesNonNull|)))
(declare-const $t@26@00 $Snap)
(assert (= $t@26@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@2@00 0))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ xs@0@00 j@1@00 r)
      (and
        (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@24@00 s@$ xs@0@00 j@1@00 r)) r))
  :pattern ((inv@24@00 s@$ xs@0@00 j@1@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@23@00 Int)) (!
  (=>
    (and (<= 0 i@23@00) (< i@23@00 (Seq_length xs@0@00)))
    (and
      (= (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00)) i@23@00)
      (img@25@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00))))
  :pattern ((Seq_index xs@0@00 i@23@00))
  :qid |quant-u-15|)))
(assert (forall ((i@23@00 Int)) (!
  (=>
    (and (<= 0 i@23@00) (< i@23@00 (Seq_length xs@0@00)))
    (not (= (Seq_index xs@0@00 i@23@00) $Ref.null)))
  :pattern ((Seq_index xs@0@00 i@23@00))
  :qid |f-permImpliesNonNull|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (forall ((k@21@00 Int) (i@22@00 Int)) (!
  (and
    (=>
      (>= k@21@00 0)
      (and
        (>= k@21@00 0)
        (=>
          (< k@21@00 (Seq_length xs@0@00))
          (and
            (< k@21@00 (Seq_length xs@0@00))
            (=>
              (>= i@22@00 0)
              (and
                (>= i@22@00 0)
                (or
                  (< i@22@00 (Seq_length xs@0@00))
                  (not (< i@22@00 (Seq_length xs@0@00))))))
            (or (>= i@22@00 0) (not (>= i@22@00 0)))))
        (or
          (< k@21@00 (Seq_length xs@0@00))
          (not (< k@21@00 (Seq_length xs@0@00))))))
    (or (>= k@21@00 0) (not (>= k@21@00 0)))
    (=>
      (and
        (>= k@21@00 0)
        (and
          (< k@21@00 (Seq_length xs@0@00))
          (and
            (>= i@22@00 0)
            (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00))))))
      (and
        (>= k@21@00 0)
        (< k@21@00 (Seq_length xs@0@00))
        (>= i@22@00 0)
        (< i@22@00 (Seq_length xs@0@00))
        (not (= k@21@00 i@22@00))))
    (or
      (not
        (and
          (>= k@21@00 0)
          (and
            (< k@21@00 (Seq_length xs@0@00))
            (and
              (>= i@22@00 0)
              (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00)))))))
      (and
        (>= k@21@00 0)
        (and
          (< k@21@00 (Seq_length xs@0@00))
          (and
            (>= i@22@00 0)
            (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00))))))))
  :pattern ((Seq_index xs@0@00 k@21@00) (Seq_index xs@0@00 i@22@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106-aux|)))
(assert (forall ((k@21@00 Int) (i@22@00 Int)) (!
  (=>
    (and
      (>= k@21@00 0)
      (and
        (< k@21@00 (Seq_length xs@0@00))
        (and
          (>= i@22@00 0)
          (and (< i@22@00 (Seq_length xs@0@00)) (not (= k@21@00 i@22@00))))))
    (not (= (Seq_index xs@0@00 k@21@00) (Seq_index xs@0@00 i@22@00))))
  :pattern ((Seq_index xs@0@00 k@21@00) (Seq_index xs@0@00 i@22@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|)))
(assert (forall ((i@23@00 Int)) (!
  (=>
    (and (<= 0 i@23@00) (< i@23@00 (Seq_length xs@0@00)))
    (or (<= 0 i@23@00) (not (<= 0 i@23@00))))
  :pattern ((Seq_index xs@0@00 i@23@00))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (j < 0 ? fun07(xs, j + 1) : (|xs| <= j ? fun07(xs, j - 1) : xs[j].f * xs[j].f))
; [eval] j < 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< j@1@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< j@1@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | j@1@00 < 0 | live]
; [else-branch: 6 | !(j@1@00 < 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | j@1@00 < 0]
(assert (< j@1@00 0))
; [eval] fun07(xs, j + 1)
; [eval] j + 1
(push) ; 4
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@27@00 Int)
(declare-const i@28@00 Int)
(push) ; 5
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 6
; [then-branch: 7 | !(k@27@00 >= 0) | live]
; [else-branch: 7 | k@27@00 >= 0 | live]
(push) ; 7
; [then-branch: 7 | !(k@27@00 >= 0)]
(assert (not (>= k@27@00 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | k@27@00 >= 0]
(assert (>= k@27@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 8
; [then-branch: 8 | !(k@27@00 < |xs@0@00|) | live]
; [else-branch: 8 | k@27@00 < |xs@0@00| | live]
(push) ; 9
; [then-branch: 8 | !(k@27@00 < |xs@0@00|)]
(assert (not (< k@27@00 (Seq_length xs@0@00))))
(pop) ; 9
(push) ; 9
; [else-branch: 8 | k@27@00 < |xs@0@00|]
(assert (< k@27@00 (Seq_length xs@0@00)))
; [eval] i >= 0
(push) ; 10
; [then-branch: 9 | !(i@28@00 >= 0) | live]
; [else-branch: 9 | i@28@00 >= 0 | live]
(push) ; 11
; [then-branch: 9 | !(i@28@00 >= 0)]
(assert (not (>= i@28@00 0)))
(pop) ; 11
(push) ; 11
; [else-branch: 9 | i@28@00 >= 0]
(assert (>= i@28@00 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 12
; [then-branch: 10 | !(i@28@00 < |xs@0@00|) | live]
; [else-branch: 10 | i@28@00 < |xs@0@00| | live]
(push) ; 13
; [then-branch: 10 | !(i@28@00 < |xs@0@00|)]
(assert (not (< i@28@00 (Seq_length xs@0@00))))
(pop) ; 13
(push) ; 13
; [else-branch: 10 | i@28@00 < |xs@0@00|]
(assert (< i@28@00 (Seq_length xs@0@00)))
; [eval] k != i
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (< i@28@00 (Seq_length xs@0@00)) (not (< i@28@00 (Seq_length xs@0@00)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@28@00 0)
  (and
    (>= i@28@00 0)
    (or (< i@28@00 (Seq_length xs@0@00)) (not (< i@28@00 (Seq_length xs@0@00)))))))
(assert (or (>= i@28@00 0) (not (>= i@28@00 0))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@27@00 (Seq_length xs@0@00))
  (and
    (< k@27@00 (Seq_length xs@0@00))
    (=>
      (>= i@28@00 0)
      (and
        (>= i@28@00 0)
        (or
          (< i@28@00 (Seq_length xs@0@00))
          (not (< i@28@00 (Seq_length xs@0@00))))))
    (or (>= i@28@00 0) (not (>= i@28@00 0))))))
(assert (or (< k@27@00 (Seq_length xs@0@00)) (not (< k@27@00 (Seq_length xs@0@00)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@27@00 0)
  (and
    (>= k@27@00 0)
    (=>
      (< k@27@00 (Seq_length xs@0@00))
      (and
        (< k@27@00 (Seq_length xs@0@00))
        (=>
          (>= i@28@00 0)
          (and
            (>= i@28@00 0)
            (or
              (< i@28@00 (Seq_length xs@0@00))
              (not (< i@28@00 (Seq_length xs@0@00))))))
        (or (>= i@28@00 0) (not (>= i@28@00 0)))))
    (or (< k@27@00 (Seq_length xs@0@00)) (not (< k@27@00 (Seq_length xs@0@00)))))))
(assert (or (>= k@27@00 0) (not (>= k@27@00 0))))
(push) ; 6
; [then-branch: 11 | k@27@00 >= 0 && k@27@00 < |xs@0@00| && i@28@00 >= 0 && i@28@00 < |xs@0@00| && k@27@00 != i@28@00 | live]
; [else-branch: 11 | !(k@27@00 >= 0 && k@27@00 < |xs@0@00| && i@28@00 >= 0 && i@28@00 < |xs@0@00| && k@27@00 != i@28@00) | live]
(push) ; 7
; [then-branch: 11 | k@27@00 >= 0 && k@27@00 < |xs@0@00| && i@28@00 >= 0 && i@28@00 < |xs@0@00| && k@27@00 != i@28@00]
(assert (and
  (>= k@27@00 0)
  (and
    (< k@27@00 (Seq_length xs@0@00))
    (and
      (>= i@28@00 0)
      (and (< i@28@00 (Seq_length xs@0@00)) (not (= k@27@00 i@28@00)))))))
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 7
(push) ; 7
; [else-branch: 11 | !(k@27@00 >= 0 && k@27@00 < |xs@0@00| && i@28@00 >= 0 && i@28@00 < |xs@0@00| && k@27@00 != i@28@00)]
(assert (not
  (and
    (>= k@27@00 0)
    (and
      (< k@27@00 (Seq_length xs@0@00))
      (and
        (>= i@28@00 0)
        (and (< i@28@00 (Seq_length xs@0@00)) (not (= k@27@00 i@28@00))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (>= k@27@00 0)
    (and
      (< k@27@00 (Seq_length xs@0@00))
      (and
        (>= i@28@00 0)
        (and (< i@28@00 (Seq_length xs@0@00)) (not (= k@27@00 i@28@00))))))
  (and
    (>= k@27@00 0)
    (< k@27@00 (Seq_length xs@0@00))
    (>= i@28@00 0)
    (< i@28@00 (Seq_length xs@0@00))
    (not (= k@27@00 i@28@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@27@00 0)
      (and
        (< k@27@00 (Seq_length xs@0@00))
        (and
          (>= i@28@00 0)
          (and (< i@28@00 (Seq_length xs@0@00)) (not (= k@27@00 i@28@00)))))))
  (and
    (>= k@27@00 0)
    (and
      (< k@27@00 (Seq_length xs@0@00))
      (and
        (>= i@28@00 0)
        (and (< i@28@00 (Seq_length xs@0@00)) (not (= k@27@00 i@28@00))))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((k@27@00 Int) (i@28@00 Int)) (!
  (=>
    (and
      (>= k@27@00 0)
      (and
        (< k@27@00 (Seq_length xs@0@00))
        (and
          (>= i@28@00 0)
          (and (< i@28@00 (Seq_length xs@0@00)) (not (= k@27@00 i@28@00))))))
    (not (= (Seq_index xs@0@00 k@27@00) (Seq_index xs@0@00 i@28@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@27@00 Int) (i@28@00 Int)) (!
  (=>
    (and
      (>= k@27@00 0)
      (and
        (< k@27@00 (Seq_length xs@0@00))
        (and
          (>= i@28@00 0)
          (and (< i@28@00 (Seq_length xs@0@00)) (not (= k@27@00 i@28@00))))))
    (not (= (Seq_index xs@0@00 k@27@00) (Seq_index xs@0@00 i@28@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|)))
(declare-const i@29@00 Int)
(push) ; 5
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 6
; [then-branch: 12 | !(0 <= i@29@00) | live]
; [else-branch: 12 | 0 <= i@29@00 | live]
(push) ; 7
; [then-branch: 12 | !(0 <= i@29@00)]
(assert (not (<= 0 i@29@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 12 | 0 <= i@29@00]
(assert (<= 0 i@29@00))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@29@00) (not (<= 0 i@29@00))))
(assert (and (<= 0 i@29@00) (< i@29@00 (Seq_length xs@0@00))))
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@29@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@30@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@31@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@29@00 Int)) (!
  (=>
    (and (<= 0 i@29@00) (< i@29@00 (Seq_length xs@0@00)))
    (or (<= 0 i@29@00) (not (<= 0 i@29@00))))
  :pattern ((Seq_index xs@0@00 i@29@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@29@00 Int) (i2@29@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@29@00) (< i1@29@00 (Seq_length xs@0@00)))
      (and (<= 0 i2@29@00) (< i2@29@00 (Seq_length xs@0@00)))
      (= (Seq_index xs@0@00 i1@29@00) (Seq_index xs@0@00 i2@29@00)))
    (= i1@29@00 i2@29@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@29@00 Int)) (!
  (=>
    (and (<= 0 i@29@00) (< i@29@00 (Seq_length xs@0@00)))
    (and
      (= (inv@30@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@29@00)) i@29@00)
      (img@31@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@29@00))))
  :pattern ((Seq_index xs@0@00 i@29@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ xs@0@00 j@1@00 r)
      (and
        (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@30@00 s@$ xs@0@00 j@1@00 r)) r))
  :pattern ((inv@30@00 s@$ xs@0@00 j@1@00 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@25@00 s@$ xs@0@00 j@1@00 r)
          (and
            (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
            (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (and
            (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
            (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
          (img@31@00 s@$ xs@0@00 j@1@00 r)
          (= r (Seq_index xs@0@00 (inv@30@00 s@$ xs@0@00 j@1@00 r))))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ xs@0@00 j@1@00 r)
              (and
                (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
                (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
      (img@31@00 s@$ xs@0@00 j@1@00 r)
      (= r (Seq_index xs@0@00 (inv@30@00 s@$ xs@0@00 j@1@00 r))))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (and
              (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
            (img@31@00 s@$ xs@0@00 j@1@00 r)
            (= r (Seq_index xs@0@00 (inv@30@00 s@$ xs@0@00 j@1@00 r))))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ xs@0@00 j@1@00 r)
                (and
                  (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
                  (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@32@00 ($Snap Seq<$Ref> Int) $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef0|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (sm@32@00 s@$ xs@0@00 j@1@00))) xs@0@00 (+
  j@1@00
  1)))
(pop) ; 4
; Joined path conditions
(assert (forall ((i@29@00 Int)) (!
  (=>
    (and (<= 0 i@29@00) (< i@29@00 (Seq_length xs@0@00)))
    (and
      (= (inv@30@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@29@00)) i@29@00)
      (img@31@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@29@00))))
  :pattern ((Seq_index xs@0@00 i@29@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ xs@0@00 j@1@00 r)
      (and
        (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@30@00 s@$ xs@0@00 j@1@00 r)) r))
  :pattern ((inv@30@00 s@$ xs@0@00 j@1@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef0|)))
(assert (and
  (forall ((k@27@00 Int) (i@28@00 Int)) (!
    (=>
      (and
        (>= k@27@00 0)
        (and
          (< k@27@00 (Seq_length xs@0@00))
          (and
            (>= i@28@00 0)
            (and (< i@28@00 (Seq_length xs@0@00)) (not (= k@27@00 i@28@00))))))
      (not (= (Seq_index xs@0@00 k@27@00) (Seq_index xs@0@00 i@28@00))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
  (forall ((i@29@00 Int)) (!
    (=>
      (and (<= 0 i@29@00) (< i@29@00 (Seq_length xs@0@00)))
      (or (<= 0 i@29@00) (not (<= 0 i@29@00))))
    :pattern ((Seq_index xs@0@00 i@29@00))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (sm@32@00 s@$ xs@0@00 j@1@00))) xs@0@00 (+
    j@1@00
    1))))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 6 | !(j@1@00 < 0)]
(assert (not (< j@1@00 0)))
; [eval] (|xs| <= j ? fun07(xs, j - 1) : xs[j].f * xs[j].f)
; [eval] |xs| <= j
; [eval] |xs|
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= (Seq_length xs@0@00) j@1@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= (Seq_length xs@0@00) j@1@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | |xs@0@00| <= j@1@00 | live]
; [else-branch: 13 | !(|xs@0@00| <= j@1@00) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | |xs@0@00| <= j@1@00]
(assert (<= (Seq_length xs@0@00) j@1@00))
; [eval] fun07(xs, j - 1)
; [eval] j - 1
(push) ; 6
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@33@00 Int)
(declare-const i@34@00 Int)
(push) ; 7
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 8
; [then-branch: 14 | !(k@33@00 >= 0) | live]
; [else-branch: 14 | k@33@00 >= 0 | live]
(push) ; 9
; [then-branch: 14 | !(k@33@00 >= 0)]
(assert (not (>= k@33@00 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 14 | k@33@00 >= 0]
(assert (>= k@33@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 15 | !(k@33@00 < |xs@0@00|) | live]
; [else-branch: 15 | k@33@00 < |xs@0@00| | live]
(push) ; 11
; [then-branch: 15 | !(k@33@00 < |xs@0@00|)]
(assert (not (< k@33@00 (Seq_length xs@0@00))))
(pop) ; 11
(push) ; 11
; [else-branch: 15 | k@33@00 < |xs@0@00|]
(assert (< k@33@00 (Seq_length xs@0@00)))
; [eval] i >= 0
(push) ; 12
; [then-branch: 16 | !(i@34@00 >= 0) | live]
; [else-branch: 16 | i@34@00 >= 0 | live]
(push) ; 13
; [then-branch: 16 | !(i@34@00 >= 0)]
(assert (not (>= i@34@00 0)))
(pop) ; 13
(push) ; 13
; [else-branch: 16 | i@34@00 >= 0]
(assert (>= i@34@00 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 14
; [then-branch: 17 | !(i@34@00 < |xs@0@00|) | live]
; [else-branch: 17 | i@34@00 < |xs@0@00| | live]
(push) ; 15
; [then-branch: 17 | !(i@34@00 < |xs@0@00|)]
(assert (not (< i@34@00 (Seq_length xs@0@00))))
(pop) ; 15
(push) ; 15
; [else-branch: 17 | i@34@00 < |xs@0@00|]
(assert (< i@34@00 (Seq_length xs@0@00)))
; [eval] k != i
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (< i@34@00 (Seq_length xs@0@00)) (not (< i@34@00 (Seq_length xs@0@00)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@34@00 0)
  (and
    (>= i@34@00 0)
    (or (< i@34@00 (Seq_length xs@0@00)) (not (< i@34@00 (Seq_length xs@0@00)))))))
(assert (or (>= i@34@00 0) (not (>= i@34@00 0))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@33@00 (Seq_length xs@0@00))
  (and
    (< k@33@00 (Seq_length xs@0@00))
    (=>
      (>= i@34@00 0)
      (and
        (>= i@34@00 0)
        (or
          (< i@34@00 (Seq_length xs@0@00))
          (not (< i@34@00 (Seq_length xs@0@00))))))
    (or (>= i@34@00 0) (not (>= i@34@00 0))))))
(assert (or (< k@33@00 (Seq_length xs@0@00)) (not (< k@33@00 (Seq_length xs@0@00)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@33@00 0)
  (and
    (>= k@33@00 0)
    (=>
      (< k@33@00 (Seq_length xs@0@00))
      (and
        (< k@33@00 (Seq_length xs@0@00))
        (=>
          (>= i@34@00 0)
          (and
            (>= i@34@00 0)
            (or
              (< i@34@00 (Seq_length xs@0@00))
              (not (< i@34@00 (Seq_length xs@0@00))))))
        (or (>= i@34@00 0) (not (>= i@34@00 0)))))
    (or (< k@33@00 (Seq_length xs@0@00)) (not (< k@33@00 (Seq_length xs@0@00)))))))
(assert (or (>= k@33@00 0) (not (>= k@33@00 0))))
(push) ; 8
; [then-branch: 18 | k@33@00 >= 0 && k@33@00 < |xs@0@00| && i@34@00 >= 0 && i@34@00 < |xs@0@00| && k@33@00 != i@34@00 | live]
; [else-branch: 18 | !(k@33@00 >= 0 && k@33@00 < |xs@0@00| && i@34@00 >= 0 && i@34@00 < |xs@0@00| && k@33@00 != i@34@00) | live]
(push) ; 9
; [then-branch: 18 | k@33@00 >= 0 && k@33@00 < |xs@0@00| && i@34@00 >= 0 && i@34@00 < |xs@0@00| && k@33@00 != i@34@00]
(assert (and
  (>= k@33@00 0)
  (and
    (< k@33@00 (Seq_length xs@0@00))
    (and
      (>= i@34@00 0)
      (and (< i@34@00 (Seq_length xs@0@00)) (not (= k@33@00 i@34@00)))))))
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 9
(push) ; 9
; [else-branch: 18 | !(k@33@00 >= 0 && k@33@00 < |xs@0@00| && i@34@00 >= 0 && i@34@00 < |xs@0@00| && k@33@00 != i@34@00)]
(assert (not
  (and
    (>= k@33@00 0)
    (and
      (< k@33@00 (Seq_length xs@0@00))
      (and
        (>= i@34@00 0)
        (and (< i@34@00 (Seq_length xs@0@00)) (not (= k@33@00 i@34@00))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (>= k@33@00 0)
    (and
      (< k@33@00 (Seq_length xs@0@00))
      (and
        (>= i@34@00 0)
        (and (< i@34@00 (Seq_length xs@0@00)) (not (= k@33@00 i@34@00))))))
  (and
    (>= k@33@00 0)
    (< k@33@00 (Seq_length xs@0@00))
    (>= i@34@00 0)
    (< i@34@00 (Seq_length xs@0@00))
    (not (= k@33@00 i@34@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@33@00 0)
      (and
        (< k@33@00 (Seq_length xs@0@00))
        (and
          (>= i@34@00 0)
          (and (< i@34@00 (Seq_length xs@0@00)) (not (= k@33@00 i@34@00)))))))
  (and
    (>= k@33@00 0)
    (and
      (< k@33@00 (Seq_length xs@0@00))
      (and
        (>= i@34@00 0)
        (and (< i@34@00 (Seq_length xs@0@00)) (not (= k@33@00 i@34@00))))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 7
(assert (not (forall ((k@33@00 Int) (i@34@00 Int)) (!
  (=>
    (and
      (>= k@33@00 0)
      (and
        (< k@33@00 (Seq_length xs@0@00))
        (and
          (>= i@34@00 0)
          (and (< i@34@00 (Seq_length xs@0@00)) (not (= k@33@00 i@34@00))))))
    (not (= (Seq_index xs@0@00 k@33@00) (Seq_index xs@0@00 i@34@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@33@00 Int) (i@34@00 Int)) (!
  (=>
    (and
      (>= k@33@00 0)
      (and
        (< k@33@00 (Seq_length xs@0@00))
        (and
          (>= i@34@00 0)
          (and (< i@34@00 (Seq_length xs@0@00)) (not (= k@33@00 i@34@00))))))
    (not (= (Seq_index xs@0@00 k@33@00) (Seq_index xs@0@00 i@34@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|)))
(declare-const i@35@00 Int)
(push) ; 7
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 8
; [then-branch: 19 | !(0 <= i@35@00) | live]
; [else-branch: 19 | 0 <= i@35@00 | live]
(push) ; 9
; [then-branch: 19 | !(0 <= i@35@00)]
(assert (not (<= 0 i@35@00)))
(pop) ; 9
(push) ; 9
; [else-branch: 19 | 0 <= i@35@00]
(assert (<= 0 i@35@00))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@35@00) (not (<= 0 i@35@00))))
(assert (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00))))
; [eval] xs[i]
(push) ; 8
(assert (not (>= i@35@00 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(declare-fun inv@36@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@37@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@35@00 Int)) (!
  (=>
    (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00)))
    (or (<= 0 i@35@00) (not (<= 0 i@35@00))))
  :pattern ((Seq_index xs@0@00 i@35@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((i1@35@00 Int) (i2@35@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@35@00) (< i1@35@00 (Seq_length xs@0@00)))
      (and (<= 0 i2@35@00) (< i2@35@00 (Seq_length xs@0@00)))
      (= (Seq_index xs@0@00 i1@35@00) (Seq_index xs@0@00 i2@35@00)))
    (= i1@35@00 i2@35@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@35@00 Int)) (!
  (=>
    (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00)))
    (and
      (= (inv@36@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00)) i@35@00)
      (img@37@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00))))
  :pattern ((Seq_index xs@0@00 i@35@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 j@1@00 r)
      (and
        (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@36@00 s@$ xs@0@00 j@1@00 r)) r))
  :pattern ((inv@36@00 s@$ xs@0@00 j@1@00 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@25@00 s@$ xs@0@00 j@1@00 r)
          (and
            (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
            (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (and
            (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
            (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
          (img@37@00 s@$ xs@0@00 j@1@00 r)
          (= r (Seq_index xs@0@00 (inv@36@00 s@$ xs@0@00 j@1@00 r))))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ xs@0@00 j@1@00 r)
              (and
                (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
                (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
      (img@37@00 s@$ xs@0@00 j@1@00 r)
      (= r (Seq_index xs@0@00 (inv@36@00 s@$ xs@0@00 j@1@00 r))))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (and
              (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
              (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00)))
            (img@37@00 s@$ xs@0@00 j@1@00 r)
            (= r (Seq_index xs@0@00 (inv@36@00 s@$ xs@0@00 j@1@00 r))))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ xs@0@00 j@1@00 r)
                (and
                  (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))
                  (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@38@00 ($Snap Seq<$Ref> Int) $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef2|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (sm@38@00 s@$ xs@0@00 j@1@00))) xs@0@00 (-
  j@1@00
  1)))
(pop) ; 6
; Joined path conditions
(assert (forall ((i@35@00 Int)) (!
  (=>
    (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00)))
    (and
      (= (inv@36@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00)) i@35@00)
      (img@37@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00))))
  :pattern ((Seq_index xs@0@00 i@35@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 j@1@00 r)
      (and
        (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@36@00 s@$ xs@0@00 j@1@00 r)) r))
  :pattern ((inv@36@00 s@$ xs@0@00 j@1@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef2|)))
(assert (and
  (forall ((k@33@00 Int) (i@34@00 Int)) (!
    (=>
      (and
        (>= k@33@00 0)
        (and
          (< k@33@00 (Seq_length xs@0@00))
          (and
            (>= i@34@00 0)
            (and (< i@34@00 (Seq_length xs@0@00)) (not (= k@33@00 i@34@00))))))
      (not (= (Seq_index xs@0@00 k@33@00) (Seq_index xs@0@00 i@34@00))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
  (forall ((i@35@00 Int)) (!
    (=>
      (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00)))
      (or (<= 0 i@35@00) (not (<= 0 i@35@00))))
    :pattern ((Seq_index xs@0@00 i@35@00))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (sm@38@00 s@$ xs@0@00 j@1@00))) xs@0@00 (-
    j@1@00
    1))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 13 | !(|xs@0@00| <= j@1@00)]
(assert (not (<= (Seq_length xs@0@00) j@1@00)))
; [eval] xs[j].f * xs[j].f
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@1@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@1@00 (Seq_length xs@0@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@25@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 j@1@00))
  (and
    (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 j@1@00)))
    (<
      (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 j@1@00))
      (Seq_length xs@0@00))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@1@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@1@00 (Seq_length xs@0@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@25@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 j@1@00))
  (and
    (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 j@1@00)))
    (<
      (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 j@1@00))
      (Seq_length xs@0@00))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((i@35@00 Int)) (!
  (=>
    (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00)))
    (and
      (= (inv@36@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00)) i@35@00)
      (img@37@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00))))
  :pattern ((Seq_index xs@0@00 i@35@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 j@1@00 r)
      (and
        (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@36@00 s@$ xs@0@00 j@1@00 r)) r))
  :pattern ((inv@36@00 s@$ xs@0@00 j@1@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef2|)))
(assert (=>
  (<= (Seq_length xs@0@00) j@1@00)
  (and
    (<= (Seq_length xs@0@00) j@1@00)
    (forall ((k@33@00 Int) (i@34@00 Int)) (!
      (=>
        (and
          (>= k@33@00 0)
          (and
            (< k@33@00 (Seq_length xs@0@00))
            (and
              (>= i@34@00 0)
              (and (< i@34@00 (Seq_length xs@0@00)) (not (= k@33@00 i@34@00))))))
        (not (= (Seq_index xs@0@00 k@33@00) (Seq_index xs@0@00 i@34@00))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
    (forall ((i@35@00 Int)) (!
      (=>
        (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00)))
        (or (<= 0 i@35@00) (not (<= 0 i@35@00))))
      :pattern ((Seq_index xs@0@00 i@35@00))
      :qid |f-aux|))
    (fun07%precondition ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@38@00 s@$ xs@0@00 j@1@00))) xs@0@00 (-
      j@1@00
      1)))))
; Joined path conditions
(assert (or (not (<= (Seq_length xs@0@00) j@1@00)) (<= (Seq_length xs@0@00) j@1@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (forall ((i@29@00 Int)) (!
  (=>
    (and (<= 0 i@29@00) (< i@29@00 (Seq_length xs@0@00)))
    (and
      (= (inv@30@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@29@00)) i@29@00)
      (img@31@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@29@00))))
  :pattern ((Seq_index xs@0@00 i@29@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ xs@0@00 j@1@00 r)
      (and
        (<= 0 (inv@30@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@30@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@30@00 s@$ xs@0@00 j@1@00 r)) r))
  :pattern ((inv@30@00 s@$ xs@0@00 j@1@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef0|)))
(assert (=>
  (< j@1@00 0)
  (and
    (< j@1@00 0)
    (forall ((k@27@00 Int) (i@28@00 Int)) (!
      (=>
        (and
          (>= k@27@00 0)
          (and
            (< k@27@00 (Seq_length xs@0@00))
            (and
              (>= i@28@00 0)
              (and (< i@28@00 (Seq_length xs@0@00)) (not (= k@27@00 i@28@00))))))
        (not (= (Seq_index xs@0@00 k@27@00) (Seq_index xs@0@00 i@28@00))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
    (forall ((i@29@00 Int)) (!
      (=>
        (and (<= 0 i@29@00) (< i@29@00 (Seq_length xs@0@00)))
        (or (<= 0 i@29@00) (not (<= 0 i@29@00))))
      :pattern ((Seq_index xs@0@00 i@29@00))
      :qid |f-aux|))
    (fun07%precondition ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@32@00 s@$ xs@0@00 j@1@00))) xs@0@00 (+
      j@1@00
      1)))))
; Joined path conditions
(assert (forall ((i@35@00 Int)) (!
  (=>
    (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00)))
    (and
      (= (inv@36@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00)) i@35@00)
      (img@37@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@35@00))))
  :pattern ((Seq_index xs@0@00 i@35@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 j@1@00 r)
      (and
        (<= 0 (inv@36@00 s@$ xs@0@00 j@1@00 r))
        (< (inv@36@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))))
    (= (Seq_index xs@0@00 (inv@36@00 s@$ xs@0@00 j@1@00 r)) r))
  :pattern ((inv@36@00 s@$ xs@0@00 j@1@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef2|)))
(assert (=>
  (not (< j@1@00 0))
  (and
    (not (< j@1@00 0))
    (=>
      (<= (Seq_length xs@0@00) j@1@00)
      (and
        (<= (Seq_length xs@0@00) j@1@00)
        (forall ((k@33@00 Int) (i@34@00 Int)) (!
          (=>
            (and
              (>= k@33@00 0)
              (and
                (< k@33@00 (Seq_length xs@0@00))
                (and
                  (>= i@34@00 0)
                  (and
                    (< i@34@00 (Seq_length xs@0@00))
                    (not (= k@33@00 i@34@00))))))
            (not (= (Seq_index xs@0@00 k@33@00) (Seq_index xs@0@00 i@34@00))))
          
          :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@168@12@168@106|))
        (forall ((i@35@00 Int)) (!
          (=>
            (and (<= 0 i@35@00) (< i@35@00 (Seq_length xs@0@00)))
            (or (<= 0 i@35@00) (not (<= 0 i@35@00))))
          :pattern ((Seq_index xs@0@00 i@35@00))
          :qid |f-aux|))
        (fun07%precondition ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (sm@38@00 s@$ xs@0@00 j@1@00))) xs@0@00 (-
          j@1@00
          1))))
    (or (not (<= (Seq_length xs@0@00) j@1@00)) (<= (Seq_length xs@0@00) j@1@00)))))
(assert (or (not (< j@1@00 0)) (< j@1@00 0)))
(assert (=
  result@2@00
  (ite
    (< j@1@00 0)
    (fun07 ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@32@00 s@$ xs@0@00 j@1@00))) xs@0@00 (+
      j@1@00
      1))
    (ite
      (<= (Seq_length xs@0@00) j@1@00)
      (fun07 ($Snap.combine
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
          j@1@00)))))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@2@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@2@00 0))
(pop) ; 1
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
; ---------- FUNCTION fun08----------
(declare-fun xs@3@00 () Seq<$Ref>)
(declare-fun i@4@00 () Int)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@39@00 Int)
(declare-const j@40@00 Int)
(push) ; 2
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 20 | !(k@39@00 >= 0) | live]
; [else-branch: 20 | k@39@00 >= 0 | live]
(push) ; 4
; [then-branch: 20 | !(k@39@00 >= 0)]
(assert (not (>= k@39@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 20 | k@39@00 >= 0]
(assert (>= k@39@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 21 | !(k@39@00 < |xs@3@00|) | live]
; [else-branch: 21 | k@39@00 < |xs@3@00| | live]
(push) ; 6
; [then-branch: 21 | !(k@39@00 < |xs@3@00|)]
(assert (not (< k@39@00 (Seq_length xs@3@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 21 | k@39@00 < |xs@3@00|]
(assert (< k@39@00 (Seq_length xs@3@00)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 22 | !(j@40@00 >= 0) | live]
; [else-branch: 22 | j@40@00 >= 0 | live]
(push) ; 8
; [then-branch: 22 | !(j@40@00 >= 0)]
(assert (not (>= j@40@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 22 | j@40@00 >= 0]
(assert (>= j@40@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 23 | !(j@40@00 < |xs@3@00|) | live]
; [else-branch: 23 | j@40@00 < |xs@3@00| | live]
(push) ; 10
; [then-branch: 23 | !(j@40@00 < |xs@3@00|)]
(assert (not (< j@40@00 (Seq_length xs@3@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 23 | j@40@00 < |xs@3@00|]
(assert (< j@40@00 (Seq_length xs@3@00)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@40@00 (Seq_length xs@3@00)) (not (< j@40@00 (Seq_length xs@3@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@40@00 0)
  (and
    (>= j@40@00 0)
    (or (< j@40@00 (Seq_length xs@3@00)) (not (< j@40@00 (Seq_length xs@3@00)))))))
(assert (or (>= j@40@00 0) (not (>= j@40@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@39@00 (Seq_length xs@3@00))
  (and
    (< k@39@00 (Seq_length xs@3@00))
    (=>
      (>= j@40@00 0)
      (and
        (>= j@40@00 0)
        (or
          (< j@40@00 (Seq_length xs@3@00))
          (not (< j@40@00 (Seq_length xs@3@00))))))
    (or (>= j@40@00 0) (not (>= j@40@00 0))))))
(assert (or (< k@39@00 (Seq_length xs@3@00)) (not (< k@39@00 (Seq_length xs@3@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@39@00 0)
  (and
    (>= k@39@00 0)
    (=>
      (< k@39@00 (Seq_length xs@3@00))
      (and
        (< k@39@00 (Seq_length xs@3@00))
        (=>
          (>= j@40@00 0)
          (and
            (>= j@40@00 0)
            (or
              (< j@40@00 (Seq_length xs@3@00))
              (not (< j@40@00 (Seq_length xs@3@00))))))
        (or (>= j@40@00 0) (not (>= j@40@00 0)))))
    (or (< k@39@00 (Seq_length xs@3@00)) (not (< k@39@00 (Seq_length xs@3@00)))))))
(assert (or (>= k@39@00 0) (not (>= k@39@00 0))))
(push) ; 3
; [then-branch: 24 | k@39@00 >= 0 && k@39@00 < |xs@3@00| && j@40@00 >= 0 && j@40@00 < |xs@3@00| && k@39@00 != j@40@00 | live]
; [else-branch: 24 | !(k@39@00 >= 0 && k@39@00 < |xs@3@00| && j@40@00 >= 0 && j@40@00 < |xs@3@00| && k@39@00 != j@40@00) | live]
(push) ; 4
; [then-branch: 24 | k@39@00 >= 0 && k@39@00 < |xs@3@00| && j@40@00 >= 0 && j@40@00 < |xs@3@00| && k@39@00 != j@40@00]
(assert (and
  (>= k@39@00 0)
  (and
    (< k@39@00 (Seq_length xs@3@00))
    (and
      (>= j@40@00 0)
      (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 4
(push) ; 4
; [else-branch: 24 | !(k@39@00 >= 0 && k@39@00 < |xs@3@00| && j@40@00 >= 0 && j@40@00 < |xs@3@00| && k@39@00 != j@40@00)]
(assert (not
  (and
    (>= k@39@00 0)
    (and
      (< k@39@00 (Seq_length xs@3@00))
      (and
        (>= j@40@00 0)
        (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@39@00 0)
    (and
      (< k@39@00 (Seq_length xs@3@00))
      (and
        (>= j@40@00 0)
        (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00))))))
  (and
    (>= k@39@00 0)
    (< k@39@00 (Seq_length xs@3@00))
    (>= j@40@00 0)
    (< j@40@00 (Seq_length xs@3@00))
    (not (= k@39@00 j@40@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@39@00 0)
      (and
        (< k@39@00 (Seq_length xs@3@00))
        (and
          (>= j@40@00 0)
          (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00)))))))
  (and
    (>= k@39@00 0)
    (and
      (< k@39@00 (Seq_length xs@3@00))
      (and
        (>= j@40@00 0)
        (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@39@00 Int) (j@40@00 Int)) (!
  (and
    (=>
      (>= k@39@00 0)
      (and
        (>= k@39@00 0)
        (=>
          (< k@39@00 (Seq_length xs@3@00))
          (and
            (< k@39@00 (Seq_length xs@3@00))
            (=>
              (>= j@40@00 0)
              (and
                (>= j@40@00 0)
                (or
                  (< j@40@00 (Seq_length xs@3@00))
                  (not (< j@40@00 (Seq_length xs@3@00))))))
            (or (>= j@40@00 0) (not (>= j@40@00 0)))))
        (or
          (< k@39@00 (Seq_length xs@3@00))
          (not (< k@39@00 (Seq_length xs@3@00))))))
    (or (>= k@39@00 0) (not (>= k@39@00 0)))
    (=>
      (and
        (>= k@39@00 0)
        (and
          (< k@39@00 (Seq_length xs@3@00))
          (and
            (>= j@40@00 0)
            (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00))))))
      (and
        (>= k@39@00 0)
        (< k@39@00 (Seq_length xs@3@00))
        (>= j@40@00 0)
        (< j@40@00 (Seq_length xs@3@00))
        (not (= k@39@00 j@40@00))))
    (or
      (not
        (and
          (>= k@39@00 0)
          (and
            (< k@39@00 (Seq_length xs@3@00))
            (and
              (>= j@40@00 0)
              (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00)))))))
      (and
        (>= k@39@00 0)
        (and
          (< k@39@00 (Seq_length xs@3@00))
          (and
            (>= j@40@00 0)
            (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00))))))))
  :pattern ((Seq_index xs@3@00 k@39@00) (Seq_index xs@3@00 j@40@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@178@12@178@106-aux|)))
(assert (forall ((k@39@00 Int) (j@40@00 Int)) (!
  (=>
    (and
      (>= k@39@00 0)
      (and
        (< k@39@00 (Seq_length xs@3@00))
        (and
          (>= j@40@00 0)
          (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00))))))
    (not (= (Seq_index xs@3@00 k@39@00) (Seq_index xs@3@00 j@40@00))))
  :pattern ((Seq_index xs@3@00 k@39@00) (Seq_index xs@3@00 j@40@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@178@12@178@106|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const j@41@00 Int)
(push) ; 2
; [eval] 0 <= j && j < |xs|
; [eval] 0 <= j
(push) ; 3
; [then-branch: 25 | !(0 <= j@41@00) | live]
; [else-branch: 25 | 0 <= j@41@00 | live]
(push) ; 4
; [then-branch: 25 | !(0 <= j@41@00)]
(assert (not (<= 0 j@41@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 25 | 0 <= j@41@00]
(assert (<= 0 j@41@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@41@00) (not (<= 0 j@41@00))))
(assert (and (<= 0 j@41@00) (< j@41@00 (Seq_length xs@3@00))))
; [eval] xs[j]
(push) ; 3
(assert (not (>= j@41@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@42@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@43@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@41@00 Int)) (!
  (=>
    (and (<= 0 j@41@00) (< j@41@00 (Seq_length xs@3@00)))
    (or (<= 0 j@41@00) (not (<= 0 j@41@00))))
  :pattern ((Seq_index xs@3@00 j@41@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@41@00 Int) (j2@41@00 Int)) (!
  (=>
    (and
      (and (<= 0 j1@41@00) (< j1@41@00 (Seq_length xs@3@00)))
      (and (<= 0 j2@41@00) (< j2@41@00 (Seq_length xs@3@00)))
      (= (Seq_index xs@3@00 j1@41@00) (Seq_index xs@3@00 j2@41@00)))
    (= j1@41@00 j2@41@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@41@00 Int)) (!
  (=>
    (and (<= 0 j@41@00) (< j@41@00 (Seq_length xs@3@00)))
    (and
      (= (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@41@00)) j@41@00)
      (img@43@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@41@00))))
  :pattern ((Seq_index xs@3@00 j@41@00))
  :qid |quant-u-29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@00 s@$ xs@3@00 i@4@00 r)
      (and
        (<= 0 (inv@42@00 s@$ xs@3@00 i@4@00 r))
        (< (inv@42@00 s@$ xs@3@00 i@4@00 r) (Seq_length xs@3@00))))
    (= (Seq_index xs@3@00 (inv@42@00 s@$ xs@3@00 i@4@00 r)) r))
  :pattern ((inv@42@00 s@$ xs@3@00 i@4@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@41@00 Int)) (!
  (=>
    (and (<= 0 j@41@00) (< j@41@00 (Seq_length xs@3@00)))
    (not (= (Seq_index xs@3@00 j@41@00) $Ref.null)))
  :pattern ((Seq_index xs@3@00 j@41@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@4@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] i < |xs|
; [eval] |xs|
(assert (< i@4@00 (Seq_length xs@3@00)))
(declare-const $t@44@00 $Snap)
(assert (= $t@44@00 $Snap.unit))
; [eval] result > xs[i].f
; [eval] xs[i]
(push) ; 2
(assert (not (>= i@4@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (and
  (img@43@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 i@4@00))
  (and
    (<= 0 (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 i@4@00)))
    (<
      (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 i@4@00))
      (Seq_length xs@3@00))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>
  result@5@00
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
    xs@3@00
    i@4@00))))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@00 s@$ xs@3@00 i@4@00 r)
      (and
        (<= 0 (inv@42@00 s@$ xs@3@00 i@4@00 r))
        (< (inv@42@00 s@$ xs@3@00 i@4@00 r) (Seq_length xs@3@00))))
    (= (Seq_index xs@3@00 (inv@42@00 s@$ xs@3@00 i@4@00 r)) r))
  :pattern ((inv@42@00 s@$ xs@3@00 i@4@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((j@41@00 Int)) (!
  (=>
    (and (<= 0 j@41@00) (< j@41@00 (Seq_length xs@3@00)))
    (and
      (= (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@41@00)) j@41@00)
      (img@43@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@41@00))))
  :pattern ((Seq_index xs@3@00 j@41@00))
  :qid |quant-u-29|)))
(assert (forall ((j@41@00 Int)) (!
  (=>
    (and (<= 0 j@41@00) (< j@41@00 (Seq_length xs@3@00)))
    (not (= (Seq_index xs@3@00 j@41@00) $Ref.null)))
  :pattern ((Seq_index xs@3@00 j@41@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= 0 i@4@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (< i@4@00 (Seq_length xs@3@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (forall ((k@39@00 Int) (j@40@00 Int)) (!
  (and
    (=>
      (>= k@39@00 0)
      (and
        (>= k@39@00 0)
        (=>
          (< k@39@00 (Seq_length xs@3@00))
          (and
            (< k@39@00 (Seq_length xs@3@00))
            (=>
              (>= j@40@00 0)
              (and
                (>= j@40@00 0)
                (or
                  (< j@40@00 (Seq_length xs@3@00))
                  (not (< j@40@00 (Seq_length xs@3@00))))))
            (or (>= j@40@00 0) (not (>= j@40@00 0)))))
        (or
          (< k@39@00 (Seq_length xs@3@00))
          (not (< k@39@00 (Seq_length xs@3@00))))))
    (or (>= k@39@00 0) (not (>= k@39@00 0)))
    (=>
      (and
        (>= k@39@00 0)
        (and
          (< k@39@00 (Seq_length xs@3@00))
          (and
            (>= j@40@00 0)
            (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00))))))
      (and
        (>= k@39@00 0)
        (< k@39@00 (Seq_length xs@3@00))
        (>= j@40@00 0)
        (< j@40@00 (Seq_length xs@3@00))
        (not (= k@39@00 j@40@00))))
    (or
      (not
        (and
          (>= k@39@00 0)
          (and
            (< k@39@00 (Seq_length xs@3@00))
            (and
              (>= j@40@00 0)
              (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00)))))))
      (and
        (>= k@39@00 0)
        (and
          (< k@39@00 (Seq_length xs@3@00))
          (and
            (>= j@40@00 0)
            (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00))))))))
  :pattern ((Seq_index xs@3@00 k@39@00) (Seq_index xs@3@00 j@40@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@178@12@178@106-aux|)))
(assert (forall ((k@39@00 Int) (j@40@00 Int)) (!
  (=>
    (and
      (>= k@39@00 0)
      (and
        (< k@39@00 (Seq_length xs@3@00))
        (and
          (>= j@40@00 0)
          (and (< j@40@00 (Seq_length xs@3@00)) (not (= k@39@00 j@40@00))))))
    (not (= (Seq_index xs@3@00 k@39@00) (Seq_index xs@3@00 j@40@00))))
  :pattern ((Seq_index xs@3@00 k@39@00) (Seq_index xs@3@00 j@40@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@178@12@178@106|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (forall ((j@41@00 Int)) (!
  (=>
    (and (<= 0 j@41@00) (< j@41@00 (Seq_length xs@3@00)))
    (or (<= 0 j@41@00) (not (<= 0 j@41@00))))
  :pattern ((Seq_index xs@3@00 j@41@00))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] xs[i].f + 1
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= i@4@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (and
  (img@43@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 i@4@00))
  (and
    (<= 0 (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 i@4@00)))
    (<
      (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 i@4@00))
      (Seq_length xs@3@00))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@5@00
  (+
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
      xs@3@00
      i@4@00))
    1)))
; [eval] result > xs[i].f
; [eval] xs[i]
(push) ; 2
(assert (not (>= i@4@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (and
  (img@43@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 i@4@00))
  (and
    (<= 0 (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 i@4@00)))
    (<
      (inv@42@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 i@4@00))
      (Seq_length xs@3@00))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (>
  result@5@00
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
    xs@3@00
    i@4@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>
  result@5@00
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
    xs@3@00
    i@4@00))))
(pop) ; 1
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
; ---------- FUNCTION fun04----------
(declare-fun x@6@00 () $Ref)
(declare-fun n@7@00 () Int)
(declare-fun i@8@00 () Int)
(declare-fun result@9@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] 0 < i
(assert (< 0 i@8@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] i < n
(assert (< i@8@00 n@7@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  (= (fun04%limited s@$ x@6@00 n@7@00 i@8@00) (fun04 s@$ x@6@00 n@7@00 i@8@00))
  :pattern ((fun04 s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  (fun04%stateless x@6@00 n@7@00 i@8@00)
  :pattern ((fun04%limited s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (< 0 i@8@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (< i@8@00 n@7@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(P01(x, n), write) in x.ss[i].f)
(set-option :timeout 0)
(push) ; 2
(assert (P01%trigger ($Snap.first s@$) x@6@00 n@7@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (not (= x@6@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] |x.ss| == n
; [eval] |x.ss|
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
  n@7@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@7@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@45@00 Int)
(declare-const j@46@00 Int)
(push) ; 3
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 26 | !(k@45@00 >= 0) | live]
; [else-branch: 26 | k@45@00 >= 0 | live]
(push) ; 5
; [then-branch: 26 | !(k@45@00 >= 0)]
(assert (not (>= k@45@00 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | k@45@00 >= 0]
(assert (>= k@45@00 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 6
; [then-branch: 27 | !(k@45@00 < |First:(First:(s@$))|) | live]
; [else-branch: 27 | k@45@00 < |First:(First:(s@$))| | live]
(push) ; 7
; [then-branch: 27 | !(k@45@00 < |First:(First:(s@$))|)]
(assert (not
  (<
    k@45@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
(pop) ; 7
(push) ; 7
; [else-branch: 27 | k@45@00 < |First:(First:(s@$))|]
(assert (<
  k@45@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 28 | !(j@46@00 >= 0) | live]
; [else-branch: 28 | j@46@00 >= 0 | live]
(push) ; 9
; [then-branch: 28 | !(j@46@00 >= 0)]
(assert (not (>= j@46@00 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 28 | j@46@00 >= 0]
(assert (>= j@46@00 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 10
; [then-branch: 29 | !(j@46@00 < |First:(First:(s@$))|) | live]
; [else-branch: 29 | j@46@00 < |First:(First:(s@$))| | live]
(push) ; 11
; [then-branch: 29 | !(j@46@00 < |First:(First:(s@$))|)]
(assert (not
  (<
    j@46@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
(pop) ; 11
(push) ; 11
; [else-branch: 29 | j@46@00 < |First:(First:(s@$))|]
(assert (<
  j@46@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@46@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
  (not
    (<
      j@46@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@46@00 0)
  (and
    (>= j@46@00 0)
    (or
      (<
        j@46@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      (not
        (<
          j@46@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))))))
(assert (or (>= j@46@00 0) (not (>= j@46@00 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    k@45@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
  (and
    (<
      k@45@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    (=>
      (>= j@46@00 0)
      (and
        (>= j@46@00 0)
        (or
          (<
            j@46@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (not
            (<
              j@46@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))))
    (or (>= j@46@00 0) (not (>= j@46@00 0))))))
(assert (or
  (<
    k@45@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
  (not
    (<
      k@45@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@45@00 0)
  (and
    (>= k@45@00 0)
    (=>
      (<
        k@45@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      (and
        (<
          k@45@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        (=>
          (>= j@46@00 0)
          (and
            (>= j@46@00 0)
            (or
              (<
                j@46@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              (not
                (<
                  j@46@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))))
        (or (>= j@46@00 0) (not (>= j@46@00 0)))))
    (or
      (<
        k@45@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      (not
        (<
          k@45@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))))))
(assert (or (>= k@45@00 0) (not (>= k@45@00 0))))
(push) ; 4
; [then-branch: 30 | k@45@00 >= 0 && k@45@00 < |First:(First:(s@$))| && j@46@00 >= 0 && j@46@00 < |First:(First:(s@$))| && k@45@00 != j@46@00 | live]
; [else-branch: 30 | !(k@45@00 >= 0 && k@45@00 < |First:(First:(s@$))| && j@46@00 >= 0 && j@46@00 < |First:(First:(s@$))| && k@45@00 != j@46@00) | live]
(push) ; 5
; [then-branch: 30 | k@45@00 >= 0 && k@45@00 < |First:(First:(s@$))| && j@46@00 >= 0 && j@46@00 < |First:(First:(s@$))| && k@45@00 != j@46@00]
(assert (and
  (>= k@45@00 0)
  (and
    (<
      k@45@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    (and
      (>= j@46@00 0)
      (and
        (<
          j@46@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        (not (= k@45@00 j@46@00)))))))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 5
(push) ; 5
; [else-branch: 30 | !(k@45@00 >= 0 && k@45@00 < |First:(First:(s@$))| && j@46@00 >= 0 && j@46@00 < |First:(First:(s@$))| && k@45@00 != j@46@00)]
(assert (not
  (and
    (>= k@45@00 0)
    (and
      (<
        k@45@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      (and
        (>= j@46@00 0)
        (and
          (<
            j@46@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (not (= k@45@00 j@46@00))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@45@00 0)
    (and
      (<
        k@45@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      (and
        (>= j@46@00 0)
        (and
          (<
            j@46@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (not (= k@45@00 j@46@00))))))
  (and
    (>= k@45@00 0)
    (<
      k@45@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    (>= j@46@00 0)
    (<
      j@46@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    (not (= k@45@00 j@46@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@45@00 0)
      (and
        (<
          k@45@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        (and
          (>= j@46@00 0)
          (and
            (<
              j@46@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            (not (= k@45@00 j@46@00)))))))
  (and
    (>= k@45@00 0)
    (and
      (<
        k@45@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      (and
        (>= j@46@00 0)
        (and
          (<
            j@46@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (not (= k@45@00 j@46@00))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@45@00 Int) (j@46@00 Int)) (!
  (and
    (=>
      (>= k@45@00 0)
      (and
        (>= k@45@00 0)
        (=>
          (<
            k@45@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (and
            (<
              k@45@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            (=>
              (>= j@46@00 0)
              (and
                (>= j@46@00 0)
                (or
                  (<
                    j@46@00
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                  (not
                    (<
                      j@46@00
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))))
            (or (>= j@46@00 0) (not (>= j@46@00 0)))))
        (or
          (<
            k@45@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (not
            (<
              k@45@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))))
    (or (>= k@45@00 0) (not (>= k@45@00 0)))
    (=>
      (and
        (>= k@45@00 0)
        (and
          (<
            k@45@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (and
            (>= j@46@00 0)
            (and
              (<
                j@46@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              (not (= k@45@00 j@46@00))))))
      (and
        (>= k@45@00 0)
        (<
          k@45@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        (>= j@46@00 0)
        (<
          j@46@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        (not (= k@45@00 j@46@00))))
    (or
      (not
        (and
          (>= k@45@00 0)
          (and
            (<
              k@45@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            (and
              (>= j@46@00 0)
              (and
                (<
                  j@46@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                (not (= k@45@00 j@46@00)))))))
      (and
        (>= k@45@00 0)
        (and
          (<
            k@45@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (and
            (>= j@46@00 0)
            (and
              (<
                j@46@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              (not (= k@45@00 j@46@00))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    k@45@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@46@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109-aux|)))
(assert (forall ((k@45@00 Int) (j@46@00 Int)) (!
  (=>
    (and
      (>= k@45@00 0)
      (and
        (<
          k@45@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        (and
          (>= j@46@00 0)
          (and
            (<
              j@46@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            (not (= k@45@00 j@46@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          k@45@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          j@46@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    k@45@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@46@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))
(declare-const j@47@00 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 31 | !(0 <= j@47@00) | live]
; [else-branch: 31 | 0 <= j@47@00 | live]
(push) ; 5
; [then-branch: 31 | !(0 <= j@47@00)]
(assert (not (<= 0 j@47@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 31 | 0 <= j@47@00]
(assert (<= 0 j@47@00))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@47@00) (not (<= 0 j@47@00))))
(assert (and (<= 0 j@47@00) (< j@47@00 3)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@47@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@47@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@48@00 ($Snap $Ref Int Int $Ref) Int)
(declare-fun img@49@00 ($Snap $Ref Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@47@00 Int)) (!
  (=>
    (and (<= 0 j@47@00) (< j@47@00 3))
    (or (<= 0 j@47@00) (not (<= 0 j@47@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@47@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@47@00 Int) (j2@47@00 Int)) (!
  (=>
    (and
      (and (<= 0 j1@47@00) (< j1@47@00 3))
      (and (<= 0 j2@47@00) (< j2@47@00 3))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          j1@47@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          j2@47@00)))
    (= j1@47@00 j2@47@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@47@00 Int)) (!
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
  :qid |quant-u-35|)))
(assert (forall ((r $Ref)) (!
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
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@47@00 Int)) (!
  (=>
    (and (<= 0 j@47@00) (< j@47@00 3))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          j@47@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@47@00))
  :qid |f-permImpliesNonNull|)))
(declare-const j@50@00 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 32 | !(3 <= j@50@00) | live]
; [else-branch: 32 | 3 <= j@50@00 | live]
(push) ; 5
; [then-branch: 32 | !(3 <= j@50@00)]
(assert (not (<= 3 j@50@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 32 | 3 <= j@50@00]
(assert (<= 3 j@50@00))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@50@00) (not (<= 3 j@50@00))))
(assert (and (<= 3 j@50@00) (< j@50@00 n@7@00)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@50@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@50@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@51@00 ($Snap $Ref Int Int $Ref) Int)
(declare-fun img@52@00 ($Snap $Ref Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@50@00 Int)) (!
  (=>
    (and (<= 3 j@50@00) (< j@50@00 n@7@00))
    (or (<= 3 j@50@00) (not (<= 3 j@50@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@50@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@50@00 Int) (j2@50@00 Int)) (!
  (=>
    (and
      (and (<= 3 j1@50@00) (< j1@50@00 n@7@00))
      (and (<= 3 j2@50@00) (< j2@50@00 n@7@00))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          j1@50@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          j2@50@00)))
    (= j1@50@00 j2@50@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@50@00 Int)) (!
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
  :qid |quant-u-37|)))
(assert (forall ((r $Ref)) (!
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
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@50@00 Int)) (!
  (=>
    (and (<= 3 j@50@00) (< j@50@00 n@7@00))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          j@50@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@50@00))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        j@50@00)
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        j@47@00))
    (=
      (and
        (img@52@00 s@$ x@6@00 n@7@00 i@8@00 r)
        (and
          (<= 3 (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r))
          (< (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r) n@7@00)))
      (and
        (img@49@00 s@$ x@6@00 n@7@00 i@8@00 r)
        (and
          (<= 0 (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r))
          (< (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r) 3)))))
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.ss[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@8@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  i@8@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@53@00 ($Snap $Ref Int Int) $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef5|)))
(declare-const pm@54@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@54@00  $FPM) r)
    (+
      (ite
        (and
          (img@49@00 s@$ x@6@00 n@7@00 i@8@00 r)
          (and
            (<= 0 (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r))
            (< (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@52@00 s@$ x@6@00 n@7@00 i@8@00 r)
          (and
            (<= 3 (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r))
            (< (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r) n@7@00)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@54@00  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(push) ; 3
(assert (not (<
  $Perm.No
  ($FVF.perm_f (as pm@54@00  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@8@00)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert (forall ((r $Ref)) (!
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
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@54@00  $FPM) r)
    (+
      (ite
        (and
          (img@49@00 s@$ x@6@00 n@7@00 i@8@00 r)
          (and
            (<= 0 (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r))
            (< (inv@48@00 s@$ x@6@00 n@7@00 i@8@00 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@52@00 s@$ x@6@00 n@7@00 i@8@00 r)
          (and
            (<= 3 (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r))
            (< (inv@51@00 s@$ x@6@00 n@7@00 i@8@00 r) n@7@00)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@54@00  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (and
  (P01%trigger ($Snap.first s@$) x@6@00 n@7@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (not (= x@6@00 $Ref.null))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.first s@$))) $Snap.unit)
  (=
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
    n@7@00)
  (=
    ($Snap.second ($Snap.second ($Snap.first s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
  (<= 3 n@7@00)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    $Snap.unit)
  (forall ((k@45@00 Int) (j@46@00 Int)) (!
    (and
      (=>
        (>= k@45@00 0)
        (and
          (>= k@45@00 0)
          (=>
            (<
              k@45@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            (and
              (<
                k@45@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              (=>
                (>= j@46@00 0)
                (and
                  (>= j@46@00 0)
                  (or
                    (<
                      j@46@00
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                    (not
                      (<
                        j@46@00
                        (Seq_length
                          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))))
              (or (>= j@46@00 0) (not (>= j@46@00 0)))))
          (or
            (<
              k@45@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            (not
              (<
                k@45@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))))
      (or (>= k@45@00 0) (not (>= k@45@00 0)))
      (=>
        (and
          (>= k@45@00 0)
          (and
            (<
              k@45@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            (and
              (>= j@46@00 0)
              (and
                (<
                  j@46@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                (not (= k@45@00 j@46@00))))))
        (and
          (>= k@45@00 0)
          (<
            k@45@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (>= j@46@00 0)
          (<
            j@46@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (not (= k@45@00 j@46@00))))
      (or
        (not
          (and
            (>= k@45@00 0)
            (and
              (<
                k@45@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              (and
                (>= j@46@00 0)
                (and
                  (<
                    j@46@00
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                  (not (= k@45@00 j@46@00)))))))
        (and
          (>= k@45@00 0)
          (and
            (<
              k@45@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            (and
              (>= j@46@00 0)
              (and
                (<
                  j@46@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                (not (= k@45@00 j@46@00))))))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      k@45@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@46@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109-aux|))
  (forall ((k@45@00 Int) (j@46@00 Int)) (!
    (=>
      (and
        (>= k@45@00 0)
        (and
          (<
            k@45@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (and
            (>= j@46@00 0)
            (and
              (<
                j@46@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              (not (= k@45@00 j@46@00))))))
      (not
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            k@45@00)
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            j@46@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      k@45@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@46@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109|))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
  (forall ((j@47@00 Int)) (!
    (=>
      (and (<= 0 j@47@00) (< j@47@00 3))
      (or (<= 0 j@47@00) (not (<= 0 j@47@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@47@00))
    :qid |f-aux|))))
(assert (and
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
  (forall ((j@47@00 Int)) (!
    (=>
      (and (<= 0 j@47@00) (< j@47@00 3))
      (not
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            j@47@00)
          $Ref.null)))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@47@00))
    :qid |f-permImpliesNonNull|))
  (forall ((j@50@00 Int)) (!
    (=>
      (and (<= 3 j@50@00) (< j@50@00 n@7@00))
      (or (<= 3 j@50@00) (not (<= 3 j@50@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@50@00))
    :qid |f-aux|))))
(assert (and
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
  (forall ((j@50@00 Int)) (!
    (=>
      (and (<= 3 j@50@00) (< j@50@00 n@7@00))
      (not
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            j@50@00)
          $Ref.null)))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@50@00))
    :qid |f-permImpliesNonNull|))))
(assert (=
  result@9@00
  ($FVF.lookup_f (sm@53@00 s@$ x@6@00 n@7@00 i@8@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@8@00))))
(pop) ; 1
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
; ---------- FUNCTION fun02----------
(declare-fun xs@10@00 () Seq<$Ref>)
(declare-fun result@11@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@55@00 Int)
(declare-const j@56@00 Int)
(push) ; 2
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 3
; [then-branch: 33 | !(i@55@00 >= 0) | live]
; [else-branch: 33 | i@55@00 >= 0 | live]
(push) ; 4
; [then-branch: 33 | !(i@55@00 >= 0)]
(assert (not (>= i@55@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 33 | i@55@00 >= 0]
(assert (>= i@55@00 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 34 | !(i@55@00 < |xs@10@00|) | live]
; [else-branch: 34 | i@55@00 < |xs@10@00| | live]
(push) ; 6
; [then-branch: 34 | !(i@55@00 < |xs@10@00|)]
(assert (not (< i@55@00 (Seq_length xs@10@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 34 | i@55@00 < |xs@10@00|]
(assert (< i@55@00 (Seq_length xs@10@00)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 35 | !(j@56@00 >= 0) | live]
; [else-branch: 35 | j@56@00 >= 0 | live]
(push) ; 8
; [then-branch: 35 | !(j@56@00 >= 0)]
(assert (not (>= j@56@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 35 | j@56@00 >= 0]
(assert (>= j@56@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 36 | !(j@56@00 < |xs@10@00|) | live]
; [else-branch: 36 | j@56@00 < |xs@10@00| | live]
(push) ; 10
; [then-branch: 36 | !(j@56@00 < |xs@10@00|)]
(assert (not (< j@56@00 (Seq_length xs@10@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 36 | j@56@00 < |xs@10@00|]
(assert (< j@56@00 (Seq_length xs@10@00)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@56@00 (Seq_length xs@10@00)) (not (< j@56@00 (Seq_length xs@10@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@56@00 0)
  (and
    (>= j@56@00 0)
    (or
      (< j@56@00 (Seq_length xs@10@00))
      (not (< j@56@00 (Seq_length xs@10@00)))))))
(assert (or (>= j@56@00 0) (not (>= j@56@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@55@00 (Seq_length xs@10@00))
  (and
    (< i@55@00 (Seq_length xs@10@00))
    (=>
      (>= j@56@00 0)
      (and
        (>= j@56@00 0)
        (or
          (< j@56@00 (Seq_length xs@10@00))
          (not (< j@56@00 (Seq_length xs@10@00))))))
    (or (>= j@56@00 0) (not (>= j@56@00 0))))))
(assert (or (< i@55@00 (Seq_length xs@10@00)) (not (< i@55@00 (Seq_length xs@10@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@55@00 0)
  (and
    (>= i@55@00 0)
    (=>
      (< i@55@00 (Seq_length xs@10@00))
      (and
        (< i@55@00 (Seq_length xs@10@00))
        (=>
          (>= j@56@00 0)
          (and
            (>= j@56@00 0)
            (or
              (< j@56@00 (Seq_length xs@10@00))
              (not (< j@56@00 (Seq_length xs@10@00))))))
        (or (>= j@56@00 0) (not (>= j@56@00 0)))))
    (or
      (< i@55@00 (Seq_length xs@10@00))
      (not (< i@55@00 (Seq_length xs@10@00)))))))
(assert (or (>= i@55@00 0) (not (>= i@55@00 0))))
(push) ; 3
; [then-branch: 37 | i@55@00 >= 0 && i@55@00 < |xs@10@00| && j@56@00 >= 0 && j@56@00 < |xs@10@00| && i@55@00 != j@56@00 | live]
; [else-branch: 37 | !(i@55@00 >= 0 && i@55@00 < |xs@10@00| && j@56@00 >= 0 && j@56@00 < |xs@10@00| && i@55@00 != j@56@00) | live]
(push) ; 4
; [then-branch: 37 | i@55@00 >= 0 && i@55@00 < |xs@10@00| && j@56@00 >= 0 && j@56@00 < |xs@10@00| && i@55@00 != j@56@00]
(assert (and
  (>= i@55@00 0)
  (and
    (< i@55@00 (Seq_length xs@10@00))
    (and
      (>= j@56@00 0)
      (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 4
(push) ; 4
; [else-branch: 37 | !(i@55@00 >= 0 && i@55@00 < |xs@10@00| && j@56@00 >= 0 && j@56@00 < |xs@10@00| && i@55@00 != j@56@00)]
(assert (not
  (and
    (>= i@55@00 0)
    (and
      (< i@55@00 (Seq_length xs@10@00))
      (and
        (>= j@56@00 0)
        (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= i@55@00 0)
    (and
      (< i@55@00 (Seq_length xs@10@00))
      (and
        (>= j@56@00 0)
        (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00))))))
  (and
    (>= i@55@00 0)
    (< i@55@00 (Seq_length xs@10@00))
    (>= j@56@00 0)
    (< j@56@00 (Seq_length xs@10@00))
    (not (= i@55@00 j@56@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@55@00 0)
      (and
        (< i@55@00 (Seq_length xs@10@00))
        (and
          (>= j@56@00 0)
          (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00)))))))
  (and
    (>= i@55@00 0)
    (and
      (< i@55@00 (Seq_length xs@10@00))
      (and
        (>= j@56@00 0)
        (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@55@00 Int) (j@56@00 Int)) (!
  (and
    (=>
      (>= i@55@00 0)
      (and
        (>= i@55@00 0)
        (=>
          (< i@55@00 (Seq_length xs@10@00))
          (and
            (< i@55@00 (Seq_length xs@10@00))
            (=>
              (>= j@56@00 0)
              (and
                (>= j@56@00 0)
                (or
                  (< j@56@00 (Seq_length xs@10@00))
                  (not (< j@56@00 (Seq_length xs@10@00))))))
            (or (>= j@56@00 0) (not (>= j@56@00 0)))))
        (or
          (< i@55@00 (Seq_length xs@10@00))
          (not (< i@55@00 (Seq_length xs@10@00))))))
    (or (>= i@55@00 0) (not (>= i@55@00 0)))
    (=>
      (and
        (>= i@55@00 0)
        (and
          (< i@55@00 (Seq_length xs@10@00))
          (and
            (>= j@56@00 0)
            (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00))))))
      (and
        (>= i@55@00 0)
        (< i@55@00 (Seq_length xs@10@00))
        (>= j@56@00 0)
        (< j@56@00 (Seq_length xs@10@00))
        (not (= i@55@00 j@56@00))))
    (or
      (not
        (and
          (>= i@55@00 0)
          (and
            (< i@55@00 (Seq_length xs@10@00))
            (and
              (>= j@56@00 0)
              (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00)))))))
      (and
        (>= i@55@00 0)
        (and
          (< i@55@00 (Seq_length xs@10@00))
          (and
            (>= j@56@00 0)
            (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00))))))))
  :pattern ((Seq_index xs@10@00 i@55@00) (Seq_index xs@10@00 j@56@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106-aux|)))
(assert (forall ((i@55@00 Int) (j@56@00 Int)) (!
  (=>
    (and
      (>= i@55@00 0)
      (and
        (< i@55@00 (Seq_length xs@10@00))
        (and
          (>= j@56@00 0)
          (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00))))))
    (not (= (Seq_index xs@10@00 i@55@00) (Seq_index xs@10@00 j@56@00))))
  :pattern ((Seq_index xs@10@00 i@55@00) (Seq_index xs@10@00 j@56@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const i@57@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 38 | !(0 <= i@57@00) | live]
; [else-branch: 38 | 0 <= i@57@00 | live]
(push) ; 4
; [then-branch: 38 | !(0 <= i@57@00)]
(assert (not (<= 0 i@57@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 38 | 0 <= i@57@00]
(assert (<= 0 i@57@00))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@57@00) (not (<= 0 i@57@00))))
(assert (and (<= 0 i@57@00) (< i@57@00 (Seq_length xs@10@00))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@57@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@58@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@59@00 ($Snap Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@57@00 Int)) (!
  (=>
    (and (<= 0 i@57@00) (< i@57@00 (Seq_length xs@10@00)))
    (or (<= 0 i@57@00) (not (<= 0 i@57@00))))
  :pattern ((Seq_index xs@10@00 i@57@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@57@00 Int) (i2@57@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@57@00) (< i1@57@00 (Seq_length xs@10@00)))
      (and (<= 0 i2@57@00) (< i2@57@00 (Seq_length xs@10@00)))
      (= (Seq_index xs@10@00 i1@57@00) (Seq_index xs@10@00 i2@57@00)))
    (= i1@57@00 i2@57@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@57@00 Int)) (!
  (=>
    (and (<= 0 i@57@00) (< i@57@00 (Seq_length xs@10@00)))
    (and
      (= (inv@58@00 s@$ xs@10@00 (Seq_index xs@10@00 i@57@00)) i@57@00)
      (img@59@00 s@$ xs@10@00 (Seq_index xs@10@00 i@57@00))))
  :pattern ((Seq_index xs@10@00 i@57@00))
  :qid |quant-u-42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@00 s@$ xs@10@00 r)
      (and
        (<= 0 (inv@58@00 s@$ xs@10@00 r))
        (< (inv@58@00 s@$ xs@10@00 r) (Seq_length xs@10@00))))
    (= (Seq_index xs@10@00 (inv@58@00 s@$ xs@10@00 r)) r))
  :pattern ((inv@58@00 s@$ xs@10@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@57@00 Int)) (!
  (=>
    (and (<= 0 i@57@00) (< i@57@00 (Seq_length xs@10@00)))
    (not (= (Seq_index xs@10@00 i@57@00) $Ref.null)))
  :pattern ((Seq_index xs@10@00 i@57@00))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@10@00) 3))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (= (fun02%limited s@$ xs@10@00) (fun02 s@$ xs@10@00))
  :pattern ((fun02 s@$ xs@10@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (fun02%stateless xs@10@00)
  :pattern ((fun02%limited s@$ xs@10@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@00 s@$ xs@10@00 r)
      (and
        (<= 0 (inv@58@00 s@$ xs@10@00 r))
        (< (inv@58@00 s@$ xs@10@00 r) (Seq_length xs@10@00))))
    (= (Seq_index xs@10@00 (inv@58@00 s@$ xs@10@00 r)) r))
  :pattern ((inv@58@00 s@$ xs@10@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@57@00 Int)) (!
  (=>
    (and (<= 0 i@57@00) (< i@57@00 (Seq_length xs@10@00)))
    (and
      (= (inv@58@00 s@$ xs@10@00 (Seq_index xs@10@00 i@57@00)) i@57@00)
      (img@59@00 s@$ xs@10@00 (Seq_index xs@10@00 i@57@00))))
  :pattern ((Seq_index xs@10@00 i@57@00))
  :qid |quant-u-42|)))
(assert (forall ((i@57@00 Int)) (!
  (=>
    (and (<= 0 i@57@00) (< i@57@00 (Seq_length xs@10@00)))
    (not (= (Seq_index xs@10@00 i@57@00) $Ref.null)))
  :pattern ((Seq_index xs@10@00 i@57@00))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (> (Seq_length xs@10@00) 3))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (forall ((i@55@00 Int) (j@56@00 Int)) (!
  (and
    (=>
      (>= i@55@00 0)
      (and
        (>= i@55@00 0)
        (=>
          (< i@55@00 (Seq_length xs@10@00))
          (and
            (< i@55@00 (Seq_length xs@10@00))
            (=>
              (>= j@56@00 0)
              (and
                (>= j@56@00 0)
                (or
                  (< j@56@00 (Seq_length xs@10@00))
                  (not (< j@56@00 (Seq_length xs@10@00))))))
            (or (>= j@56@00 0) (not (>= j@56@00 0)))))
        (or
          (< i@55@00 (Seq_length xs@10@00))
          (not (< i@55@00 (Seq_length xs@10@00))))))
    (or (>= i@55@00 0) (not (>= i@55@00 0)))
    (=>
      (and
        (>= i@55@00 0)
        (and
          (< i@55@00 (Seq_length xs@10@00))
          (and
            (>= j@56@00 0)
            (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00))))))
      (and
        (>= i@55@00 0)
        (< i@55@00 (Seq_length xs@10@00))
        (>= j@56@00 0)
        (< j@56@00 (Seq_length xs@10@00))
        (not (= i@55@00 j@56@00))))
    (or
      (not
        (and
          (>= i@55@00 0)
          (and
            (< i@55@00 (Seq_length xs@10@00))
            (and
              (>= j@56@00 0)
              (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00)))))))
      (and
        (>= i@55@00 0)
        (and
          (< i@55@00 (Seq_length xs@10@00))
          (and
            (>= j@56@00 0)
            (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00))))))))
  :pattern ((Seq_index xs@10@00 i@55@00) (Seq_index xs@10@00 j@56@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106-aux|)))
(assert (forall ((i@55@00 Int) (j@56@00 Int)) (!
  (=>
    (and
      (>= i@55@00 0)
      (and
        (< i@55@00 (Seq_length xs@10@00))
        (and
          (>= j@56@00 0)
          (and (< j@56@00 (Seq_length xs@10@00)) (not (= i@55@00 j@56@00))))))
    (not (= (Seq_index xs@10@00 i@55@00) (Seq_index xs@10@00 j@56@00))))
  :pattern ((Seq_index xs@10@00 i@55@00) (Seq_index xs@10@00 j@56@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@22@12@22@106|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (forall ((i@57@00 Int)) (!
  (=>
    (and (<= 0 i@57@00) (< i@57@00 (Seq_length xs@10@00)))
    (or (<= 0 i@57@00) (not (<= 0 i@57@00))))
  :pattern ((Seq_index xs@10@00 i@57@00))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] xs[0].f + xs[1].f
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 2
(assert (not (< 0 (Seq_length xs@10@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (and
  (img@59@00 s@$ xs@10@00 (Seq_index xs@10@00 0))
  (and
    (<= 0 (inv@58@00 s@$ xs@10@00 (Seq_index xs@10@00 0)))
    (< (inv@58@00 s@$ xs@10@00 (Seq_index xs@10@00 0)) (Seq_length xs@10@00))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] xs[1]
(push) ; 2
(assert (not (< 1 (Seq_length xs@10@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (and
  (img@59@00 s@$ xs@10@00 (Seq_index xs@10@00 1))
  (and
    (<= 0 (inv@58@00 s@$ xs@10@00 (Seq_index xs@10@00 1)))
    (< (inv@58@00 s@$ xs@10@00 (Seq_index xs@10@00 1)) (Seq_length xs@10@00))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@11@00
  (+
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
      xs@10@00
      0))
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
      xs@10@00
      1)))))
(pop) ; 1
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
; ---------- FUNCTION fun01----------
(declare-fun xs@12@00 () Seq<$Ref>)
(declare-fun result@13@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@60@00 Int)
(declare-const j@61@00 Int)
(push) ; 2
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 3
; [then-branch: 39 | !(i@60@00 >= 0) | live]
; [else-branch: 39 | i@60@00 >= 0 | live]
(push) ; 4
; [then-branch: 39 | !(i@60@00 >= 0)]
(assert (not (>= i@60@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 39 | i@60@00 >= 0]
(assert (>= i@60@00 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 40 | !(i@60@00 < |xs@12@00|) | live]
; [else-branch: 40 | i@60@00 < |xs@12@00| | live]
(push) ; 6
; [then-branch: 40 | !(i@60@00 < |xs@12@00|)]
(assert (not (< i@60@00 (Seq_length xs@12@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 40 | i@60@00 < |xs@12@00|]
(assert (< i@60@00 (Seq_length xs@12@00)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 41 | !(j@61@00 >= 0) | live]
; [else-branch: 41 | j@61@00 >= 0 | live]
(push) ; 8
; [then-branch: 41 | !(j@61@00 >= 0)]
(assert (not (>= j@61@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 41 | j@61@00 >= 0]
(assert (>= j@61@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 42 | !(j@61@00 < |xs@12@00|) | live]
; [else-branch: 42 | j@61@00 < |xs@12@00| | live]
(push) ; 10
; [then-branch: 42 | !(j@61@00 < |xs@12@00|)]
(assert (not (< j@61@00 (Seq_length xs@12@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 42 | j@61@00 < |xs@12@00|]
(assert (< j@61@00 (Seq_length xs@12@00)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@61@00 (Seq_length xs@12@00)) (not (< j@61@00 (Seq_length xs@12@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@61@00 0)
  (and
    (>= j@61@00 0)
    (or
      (< j@61@00 (Seq_length xs@12@00))
      (not (< j@61@00 (Seq_length xs@12@00)))))))
(assert (or (>= j@61@00 0) (not (>= j@61@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@60@00 (Seq_length xs@12@00))
  (and
    (< i@60@00 (Seq_length xs@12@00))
    (=>
      (>= j@61@00 0)
      (and
        (>= j@61@00 0)
        (or
          (< j@61@00 (Seq_length xs@12@00))
          (not (< j@61@00 (Seq_length xs@12@00))))))
    (or (>= j@61@00 0) (not (>= j@61@00 0))))))
(assert (or (< i@60@00 (Seq_length xs@12@00)) (not (< i@60@00 (Seq_length xs@12@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@60@00 0)
  (and
    (>= i@60@00 0)
    (=>
      (< i@60@00 (Seq_length xs@12@00))
      (and
        (< i@60@00 (Seq_length xs@12@00))
        (=>
          (>= j@61@00 0)
          (and
            (>= j@61@00 0)
            (or
              (< j@61@00 (Seq_length xs@12@00))
              (not (< j@61@00 (Seq_length xs@12@00))))))
        (or (>= j@61@00 0) (not (>= j@61@00 0)))))
    (or
      (< i@60@00 (Seq_length xs@12@00))
      (not (< i@60@00 (Seq_length xs@12@00)))))))
(assert (or (>= i@60@00 0) (not (>= i@60@00 0))))
(push) ; 3
; [then-branch: 43 | i@60@00 >= 0 && i@60@00 < |xs@12@00| && j@61@00 >= 0 && j@61@00 < |xs@12@00| && i@60@00 != j@61@00 | live]
; [else-branch: 43 | !(i@60@00 >= 0 && i@60@00 < |xs@12@00| && j@61@00 >= 0 && j@61@00 < |xs@12@00| && i@60@00 != j@61@00) | live]
(push) ; 4
; [then-branch: 43 | i@60@00 >= 0 && i@60@00 < |xs@12@00| && j@61@00 >= 0 && j@61@00 < |xs@12@00| && i@60@00 != j@61@00]
(assert (and
  (>= i@60@00 0)
  (and
    (< i@60@00 (Seq_length xs@12@00))
    (and
      (>= j@61@00 0)
      (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 4
(push) ; 4
; [else-branch: 43 | !(i@60@00 >= 0 && i@60@00 < |xs@12@00| && j@61@00 >= 0 && j@61@00 < |xs@12@00| && i@60@00 != j@61@00)]
(assert (not
  (and
    (>= i@60@00 0)
    (and
      (< i@60@00 (Seq_length xs@12@00))
      (and
        (>= j@61@00 0)
        (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= i@60@00 0)
    (and
      (< i@60@00 (Seq_length xs@12@00))
      (and
        (>= j@61@00 0)
        (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00))))))
  (and
    (>= i@60@00 0)
    (< i@60@00 (Seq_length xs@12@00))
    (>= j@61@00 0)
    (< j@61@00 (Seq_length xs@12@00))
    (not (= i@60@00 j@61@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@60@00 0)
      (and
        (< i@60@00 (Seq_length xs@12@00))
        (and
          (>= j@61@00 0)
          (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00)))))))
  (and
    (>= i@60@00 0)
    (and
      (< i@60@00 (Seq_length xs@12@00))
      (and
        (>= j@61@00 0)
        (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@60@00 Int) (j@61@00 Int)) (!
  (and
    (=>
      (>= i@60@00 0)
      (and
        (>= i@60@00 0)
        (=>
          (< i@60@00 (Seq_length xs@12@00))
          (and
            (< i@60@00 (Seq_length xs@12@00))
            (=>
              (>= j@61@00 0)
              (and
                (>= j@61@00 0)
                (or
                  (< j@61@00 (Seq_length xs@12@00))
                  (not (< j@61@00 (Seq_length xs@12@00))))))
            (or (>= j@61@00 0) (not (>= j@61@00 0)))))
        (or
          (< i@60@00 (Seq_length xs@12@00))
          (not (< i@60@00 (Seq_length xs@12@00))))))
    (or (>= i@60@00 0) (not (>= i@60@00 0)))
    (=>
      (and
        (>= i@60@00 0)
        (and
          (< i@60@00 (Seq_length xs@12@00))
          (and
            (>= j@61@00 0)
            (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00))))))
      (and
        (>= i@60@00 0)
        (< i@60@00 (Seq_length xs@12@00))
        (>= j@61@00 0)
        (< j@61@00 (Seq_length xs@12@00))
        (not (= i@60@00 j@61@00))))
    (or
      (not
        (and
          (>= i@60@00 0)
          (and
            (< i@60@00 (Seq_length xs@12@00))
            (and
              (>= j@61@00 0)
              (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00)))))))
      (and
        (>= i@60@00 0)
        (and
          (< i@60@00 (Seq_length xs@12@00))
          (and
            (>= j@61@00 0)
            (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00))))))))
  :pattern ((Seq_index xs@12@00 i@60@00) (Seq_index xs@12@00 j@61@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106-aux|)))
(assert (forall ((i@60@00 Int) (j@61@00 Int)) (!
  (=>
    (and
      (>= i@60@00 0)
      (and
        (< i@60@00 (Seq_length xs@12@00))
        (and
          (>= j@61@00 0)
          (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00))))))
    (not (= (Seq_index xs@12@00 i@60@00) (Seq_index xs@12@00 j@61@00))))
  :pattern ((Seq_index xs@12@00 i@60@00) (Seq_index xs@12@00 j@61@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const i@62@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 44 | !(0 <= i@62@00) | live]
; [else-branch: 44 | 0 <= i@62@00 | live]
(push) ; 4
; [then-branch: 44 | !(0 <= i@62@00)]
(assert (not (<= 0 i@62@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 44 | 0 <= i@62@00]
(assert (<= 0 i@62@00))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@62@00) (not (<= 0 i@62@00))))
(assert (and (<= 0 i@62@00) (< i@62@00 (Seq_length xs@12@00))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@62@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@63@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun img@64@00 ($Snap Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@62@00 Int)) (!
  (=>
    (and (<= 0 i@62@00) (< i@62@00 (Seq_length xs@12@00)))
    (or (<= 0 i@62@00) (not (<= 0 i@62@00))))
  :pattern ((Seq_index xs@12@00 i@62@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@62@00 Int) (i2@62@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@62@00) (< i1@62@00 (Seq_length xs@12@00)))
      (and (<= 0 i2@62@00) (< i2@62@00 (Seq_length xs@12@00)))
      (= (Seq_index xs@12@00 i1@62@00) (Seq_index xs@12@00 i2@62@00)))
    (= i1@62@00 i2@62@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@62@00 Int)) (!
  (=>
    (and (<= 0 i@62@00) (< i@62@00 (Seq_length xs@12@00)))
    (and
      (= (inv@63@00 s@$ xs@12@00 (Seq_index xs@12@00 i@62@00)) i@62@00)
      (img@64@00 s@$ xs@12@00 (Seq_index xs@12@00 i@62@00))))
  :pattern ((Seq_index xs@12@00 i@62@00))
  :qid |quant-u-46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@64@00 s@$ xs@12@00 r)
      (and
        (<= 0 (inv@63@00 s@$ xs@12@00 r))
        (< (inv@63@00 s@$ xs@12@00 r) (Seq_length xs@12@00))))
    (= (Seq_index xs@12@00 (inv@63@00 s@$ xs@12@00 r)) r))
  :pattern ((inv@63@00 s@$ xs@12@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@62@00 Int)) (!
  (=>
    (and (<= 0 i@62@00) (< i@62@00 (Seq_length xs@12@00)))
    (not (= (Seq_index xs@12@00 i@62@00) $Ref.null)))
  :pattern ((Seq_index xs@12@00 i@62@00))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@12@00) 3))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (= (fun01%limited s@$ xs@12@00) (fun01 s@$ xs@12@00))
  :pattern ((fun01 s@$ xs@12@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (fun01%stateless xs@12@00)
  :pattern ((fun01%limited s@$ xs@12@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@64@00 s@$ xs@12@00 r)
      (and
        (<= 0 (inv@63@00 s@$ xs@12@00 r))
        (< (inv@63@00 s@$ xs@12@00 r) (Seq_length xs@12@00))))
    (= (Seq_index xs@12@00 (inv@63@00 s@$ xs@12@00 r)) r))
  :pattern ((inv@63@00 s@$ xs@12@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@62@00 Int)) (!
  (=>
    (and (<= 0 i@62@00) (< i@62@00 (Seq_length xs@12@00)))
    (and
      (= (inv@63@00 s@$ xs@12@00 (Seq_index xs@12@00 i@62@00)) i@62@00)
      (img@64@00 s@$ xs@12@00 (Seq_index xs@12@00 i@62@00))))
  :pattern ((Seq_index xs@12@00 i@62@00))
  :qid |quant-u-46|)))
(assert (forall ((i@62@00 Int)) (!
  (=>
    (and (<= 0 i@62@00) (< i@62@00 (Seq_length xs@12@00)))
    (not (= (Seq_index xs@12@00 i@62@00) $Ref.null)))
  :pattern ((Seq_index xs@12@00 i@62@00))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (> (Seq_length xs@12@00) 3))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (forall ((i@60@00 Int) (j@61@00 Int)) (!
  (and
    (=>
      (>= i@60@00 0)
      (and
        (>= i@60@00 0)
        (=>
          (< i@60@00 (Seq_length xs@12@00))
          (and
            (< i@60@00 (Seq_length xs@12@00))
            (=>
              (>= j@61@00 0)
              (and
                (>= j@61@00 0)
                (or
                  (< j@61@00 (Seq_length xs@12@00))
                  (not (< j@61@00 (Seq_length xs@12@00))))))
            (or (>= j@61@00 0) (not (>= j@61@00 0)))))
        (or
          (< i@60@00 (Seq_length xs@12@00))
          (not (< i@60@00 (Seq_length xs@12@00))))))
    (or (>= i@60@00 0) (not (>= i@60@00 0)))
    (=>
      (and
        (>= i@60@00 0)
        (and
          (< i@60@00 (Seq_length xs@12@00))
          (and
            (>= j@61@00 0)
            (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00))))))
      (and
        (>= i@60@00 0)
        (< i@60@00 (Seq_length xs@12@00))
        (>= j@61@00 0)
        (< j@61@00 (Seq_length xs@12@00))
        (not (= i@60@00 j@61@00))))
    (or
      (not
        (and
          (>= i@60@00 0)
          (and
            (< i@60@00 (Seq_length xs@12@00))
            (and
              (>= j@61@00 0)
              (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00)))))))
      (and
        (>= i@60@00 0)
        (and
          (< i@60@00 (Seq_length xs@12@00))
          (and
            (>= j@61@00 0)
            (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00))))))))
  :pattern ((Seq_index xs@12@00 i@60@00) (Seq_index xs@12@00 j@61@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106-aux|)))
(assert (forall ((i@60@00 Int) (j@61@00 Int)) (!
  (=>
    (and
      (>= i@60@00 0)
      (and
        (< i@60@00 (Seq_length xs@12@00))
        (and
          (>= j@61@00 0)
          (and (< j@61@00 (Seq_length xs@12@00)) (not (= i@60@00 j@61@00))))))
    (not (= (Seq_index xs@12@00 i@60@00) (Seq_index xs@12@00 j@61@00))))
  :pattern ((Seq_index xs@12@00 i@60@00) (Seq_index xs@12@00 j@61@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@7@12@7@106|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (forall ((i@62@00 Int)) (!
  (=>
    (and (<= 0 i@62@00) (< i@62@00 (Seq_length xs@12@00)))
    (or (<= 0 i@62@00) (not (<= 0 i@62@00))))
  :pattern ((Seq_index xs@12@00 i@62@00))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 2
(assert (not (< 0 (Seq_length xs@12@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (and
  (img@64@00 s@$ xs@12@00 (Seq_index xs@12@00 0))
  (and
    (<= 0 (inv@63@00 s@$ xs@12@00 (Seq_index xs@12@00 0)))
    (< (inv@63@00 s@$ xs@12@00 (Seq_index xs@12@00 0)) (Seq_length xs@12@00))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@13@00
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) (Seq_index
    xs@12@00
    0))))
(pop) ; 1
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
; ---------- FUNCTION fun06----------
(declare-fun xs@14@00 () Seq<$Ref>)
(declare-fun n@15@00 () Int)
(declare-fun i@16@00 () Int)
(declare-fun result@17@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] 0 < i
(assert (< 0 i@16@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] i < n
(assert (< i@16@00 n@15@00))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (< 0 i@16@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (< i@16@00 n@15@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(P02(xs, n), write) in xs[i].f)
(set-option :timeout 0)
(push) ; 2
(assert (P02%trigger ($Snap.first s@$) xs@14@00 n@15@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (= ($Snap.first ($Snap.first s@$)) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@14@00) n@15@00))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@15@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@65@00 Int)
(declare-const j@66@00 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 45 | !(k@65@00 >= 0) | live]
; [else-branch: 45 | k@65@00 >= 0 | live]
(push) ; 5
; [then-branch: 45 | !(k@65@00 >= 0)]
(assert (not (>= k@65@00 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 45 | k@65@00 >= 0]
(assert (>= k@65@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 46 | !(k@65@00 < |xs@14@00|) | live]
; [else-branch: 46 | k@65@00 < |xs@14@00| | live]
(push) ; 7
; [then-branch: 46 | !(k@65@00 < |xs@14@00|)]
(assert (not (< k@65@00 (Seq_length xs@14@00))))
(pop) ; 7
(push) ; 7
; [else-branch: 46 | k@65@00 < |xs@14@00|]
(assert (< k@65@00 (Seq_length xs@14@00)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 47 | !(j@66@00 >= 0) | live]
; [else-branch: 47 | j@66@00 >= 0 | live]
(push) ; 9
; [then-branch: 47 | !(j@66@00 >= 0)]
(assert (not (>= j@66@00 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 47 | j@66@00 >= 0]
(assert (>= j@66@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 48 | !(j@66@00 < |xs@14@00|) | live]
; [else-branch: 48 | j@66@00 < |xs@14@00| | live]
(push) ; 11
; [then-branch: 48 | !(j@66@00 < |xs@14@00|)]
(assert (not (< j@66@00 (Seq_length xs@14@00))))
(pop) ; 11
(push) ; 11
; [else-branch: 48 | j@66@00 < |xs@14@00|]
(assert (< j@66@00 (Seq_length xs@14@00)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@66@00 (Seq_length xs@14@00)) (not (< j@66@00 (Seq_length xs@14@00)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@66@00 0)
  (and
    (>= j@66@00 0)
    (or
      (< j@66@00 (Seq_length xs@14@00))
      (not (< j@66@00 (Seq_length xs@14@00)))))))
(assert (or (>= j@66@00 0) (not (>= j@66@00 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@65@00 (Seq_length xs@14@00))
  (and
    (< k@65@00 (Seq_length xs@14@00))
    (=>
      (>= j@66@00 0)
      (and
        (>= j@66@00 0)
        (or
          (< j@66@00 (Seq_length xs@14@00))
          (not (< j@66@00 (Seq_length xs@14@00))))))
    (or (>= j@66@00 0) (not (>= j@66@00 0))))))
(assert (or (< k@65@00 (Seq_length xs@14@00)) (not (< k@65@00 (Seq_length xs@14@00)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@65@00 0)
  (and
    (>= k@65@00 0)
    (=>
      (< k@65@00 (Seq_length xs@14@00))
      (and
        (< k@65@00 (Seq_length xs@14@00))
        (=>
          (>= j@66@00 0)
          (and
            (>= j@66@00 0)
            (or
              (< j@66@00 (Seq_length xs@14@00))
              (not (< j@66@00 (Seq_length xs@14@00))))))
        (or (>= j@66@00 0) (not (>= j@66@00 0)))))
    (or
      (< k@65@00 (Seq_length xs@14@00))
      (not (< k@65@00 (Seq_length xs@14@00)))))))
(assert (or (>= k@65@00 0) (not (>= k@65@00 0))))
(push) ; 4
; [then-branch: 49 | k@65@00 >= 0 && k@65@00 < |xs@14@00| && j@66@00 >= 0 && j@66@00 < |xs@14@00| && k@65@00 != j@66@00 | live]
; [else-branch: 49 | !(k@65@00 >= 0 && k@65@00 < |xs@14@00| && j@66@00 >= 0 && j@66@00 < |xs@14@00| && k@65@00 != j@66@00) | live]
(push) ; 5
; [then-branch: 49 | k@65@00 >= 0 && k@65@00 < |xs@14@00| && j@66@00 >= 0 && j@66@00 < |xs@14@00| && k@65@00 != j@66@00]
(assert (and
  (>= k@65@00 0)
  (and
    (< k@65@00 (Seq_length xs@14@00))
    (and
      (>= j@66@00 0)
      (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 49 | !(k@65@00 >= 0 && k@65@00 < |xs@14@00| && j@66@00 >= 0 && j@66@00 < |xs@14@00| && k@65@00 != j@66@00)]
(assert (not
  (and
    (>= k@65@00 0)
    (and
      (< k@65@00 (Seq_length xs@14@00))
      (and
        (>= j@66@00 0)
        (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@65@00 0)
    (and
      (< k@65@00 (Seq_length xs@14@00))
      (and
        (>= j@66@00 0)
        (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00))))))
  (and
    (>= k@65@00 0)
    (< k@65@00 (Seq_length xs@14@00))
    (>= j@66@00 0)
    (< j@66@00 (Seq_length xs@14@00))
    (not (= k@65@00 j@66@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@65@00 0)
      (and
        (< k@65@00 (Seq_length xs@14@00))
        (and
          (>= j@66@00 0)
          (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00)))))))
  (and
    (>= k@65@00 0)
    (and
      (< k@65@00 (Seq_length xs@14@00))
      (and
        (>= j@66@00 0)
        (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@65@00 Int) (j@66@00 Int)) (!
  (and
    (=>
      (>= k@65@00 0)
      (and
        (>= k@65@00 0)
        (=>
          (< k@65@00 (Seq_length xs@14@00))
          (and
            (< k@65@00 (Seq_length xs@14@00))
            (=>
              (>= j@66@00 0)
              (and
                (>= j@66@00 0)
                (or
                  (< j@66@00 (Seq_length xs@14@00))
                  (not (< j@66@00 (Seq_length xs@14@00))))))
            (or (>= j@66@00 0) (not (>= j@66@00 0)))))
        (or
          (< k@65@00 (Seq_length xs@14@00))
          (not (< k@65@00 (Seq_length xs@14@00))))))
    (or (>= k@65@00 0) (not (>= k@65@00 0)))
    (=>
      (and
        (>= k@65@00 0)
        (and
          (< k@65@00 (Seq_length xs@14@00))
          (and
            (>= j@66@00 0)
            (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00))))))
      (and
        (>= k@65@00 0)
        (< k@65@00 (Seq_length xs@14@00))
        (>= j@66@00 0)
        (< j@66@00 (Seq_length xs@14@00))
        (not (= k@65@00 j@66@00))))
    (or
      (not
        (and
          (>= k@65@00 0)
          (and
            (< k@65@00 (Seq_length xs@14@00))
            (and
              (>= j@66@00 0)
              (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00)))))))
      (and
        (>= k@65@00 0)
        (and
          (< k@65@00 (Seq_length xs@14@00))
          (and
            (>= j@66@00 0)
            (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00))))))))
  :pattern ((Seq_index xs@14@00 k@65@00) (Seq_index xs@14@00 j@66@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(assert (forall ((k@65@00 Int) (j@66@00 Int)) (!
  (=>
    (and
      (>= k@65@00 0)
      (and
        (< k@65@00 (Seq_length xs@14@00))
        (and
          (>= j@66@00 0)
          (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00))))))
    (not (= (Seq_index xs@14@00 k@65@00) (Seq_index xs@14@00 j@66@00))))
  :pattern ((Seq_index xs@14@00 k@65@00) (Seq_index xs@14@00 j@66@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
(declare-const j@67@00 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 50 | !(0 <= j@67@00) | live]
; [else-branch: 50 | 0 <= j@67@00 | live]
(push) ; 5
; [then-branch: 50 | !(0 <= j@67@00)]
(assert (not (<= 0 j@67@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 50 | 0 <= j@67@00]
(assert (<= 0 j@67@00))
; [eval] j < 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@67@00) (not (<= 0 j@67@00))))
(assert (and (<= 0 j@67@00) (< j@67@00 3)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@67@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@67@00 (Seq_length xs@14@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@68@00 ($Snap Seq<$Ref> Int Int $Ref) Int)
(declare-fun img@69@00 ($Snap Seq<$Ref> Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@67@00 Int)) (!
  (=>
    (and (<= 0 j@67@00) (< j@67@00 3))
    (or (<= 0 j@67@00) (not (<= 0 j@67@00))))
  :pattern ((Seq_index xs@14@00 j@67@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@67@00 Int) (j2@67@00 Int)) (!
  (=>
    (and
      (and (<= 0 j1@67@00) (< j1@67@00 3))
      (and (<= 0 j2@67@00) (< j2@67@00 3))
      (= (Seq_index xs@14@00 j1@67@00) (Seq_index xs@14@00 j2@67@00)))
    (= j1@67@00 j2@67@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@67@00 Int)) (!
  (=>
    (and (<= 0 j@67@00) (< j@67@00 3))
    (and
      (=
        (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@67@00))
        j@67@00)
      (img@69@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@67@00))))
  :pattern ((Seq_index xs@14@00 j@67@00))
  :qid |quant-u-50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@69@00 s@$ xs@14@00 n@15@00 i@16@00 r)
      (and
        (<= 0 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
        (< (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r) 3)))
    (= (Seq_index xs@14@00 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r)) r))
  :pattern ((inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@67@00 Int)) (!
  (=>
    (and (<= 0 j@67@00) (< j@67@00 3))
    (not (= (Seq_index xs@14@00 j@67@00) $Ref.null)))
  :pattern ((Seq_index xs@14@00 j@67@00))
  :qid |f-permImpliesNonNull|)))
(declare-const j@70@00 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 51 | !(3 <= j@70@00) | live]
; [else-branch: 51 | 3 <= j@70@00 | live]
(push) ; 5
; [then-branch: 51 | !(3 <= j@70@00)]
(assert (not (<= 3 j@70@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 51 | 3 <= j@70@00]
(assert (<= 3 j@70@00))
; [eval] j < n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@70@00) (not (<= 3 j@70@00))))
(assert (and (<= 3 j@70@00) (< j@70@00 n@15@00)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@70@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@70@00 (Seq_length xs@14@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@71@00 ($Snap Seq<$Ref> Int Int $Ref) Int)
(declare-fun img@72@00 ($Snap Seq<$Ref> Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@70@00 Int)) (!
  (=>
    (and (<= 3 j@70@00) (< j@70@00 n@15@00))
    (or (<= 3 j@70@00) (not (<= 3 j@70@00))))
  :pattern ((Seq_index xs@14@00 j@70@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@70@00 Int) (j2@70@00 Int)) (!
  (=>
    (and
      (and (<= 3 j1@70@00) (< j1@70@00 n@15@00))
      (and (<= 3 j2@70@00) (< j2@70@00 n@15@00))
      (= (Seq_index xs@14@00 j1@70@00) (Seq_index xs@14@00 j2@70@00)))
    (= j1@70@00 j2@70@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@70@00 Int)) (!
  (=>
    (and (<= 3 j@70@00) (< j@70@00 n@15@00))
    (and
      (=
        (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@70@00))
        j@70@00)
      (img@72@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@70@00))))
  :pattern ((Seq_index xs@14@00 j@70@00))
  :qid |quant-u-52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@72@00 s@$ xs@14@00 n@15@00 i@16@00 r)
      (and
        (<= 3 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
        (< (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r) n@15@00)))
    (= (Seq_index xs@14@00 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r)) r))
  :pattern ((inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@70@00 Int)) (!
  (=>
    (and (<= 3 j@70@00) (< j@70@00 n@15@00))
    (not (= (Seq_index xs@14@00 j@70@00) $Ref.null)))
  :pattern ((Seq_index xs@14@00 j@70@00))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@14@00 j@70@00) (Seq_index xs@14@00 j@67@00))
    (=
      (and
        (img@72@00 s@$ xs@14@00 n@15@00 i@16@00 r)
        (and
          (<= 3 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
          (< (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r) n@15@00)))
      (and
        (img@69@00 s@$ xs@14@00 n@15@00 i@16@00 r)
        (and
          (<= 0 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
          (< (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r) 3)))))
  
  :qid |quant-u-53|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@16@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@16@00 (Seq_length xs@14@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@73@00 ($Snap Seq<$Ref> Int Int) $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef8|)))
(declare-const pm@74@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@74@00  $FPM) r)
    (+
      (ite
        (and
          (img@69@00 s@$ xs@14@00 n@15@00 i@16@00 r)
          (and
            (<= 0 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
            (< (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@72@00 s@$ xs@14@00 n@15@00 i@16@00 r)
          (and
            (<= 3 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
            (< (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r) n@15@00)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@74@00  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@74@00  $FPM) (Seq_index xs@14@00 i@16@00)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@69@00 s@$ xs@14@00 n@15@00 i@16@00 r)
      (and
        (<= 0 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
        (< (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r) 3)))
    (= (Seq_index xs@14@00 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r)) r))
  :pattern ((inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@72@00 s@$ xs@14@00 n@15@00 i@16@00 r)
      (and
        (<= 3 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
        (< (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r) n@15@00)))
    (= (Seq_index xs@14@00 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r)) r))
  :pattern ((inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@74@00  $FPM) r)
    (+
      (ite
        (and
          (img@69@00 s@$ xs@14@00 n@15@00 i@16@00 r)
          (and
            (<= 0 (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r))
            (< (inv@68@00 s@$ xs@14@00 n@15@00 i@16@00 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@72@00 s@$ xs@14@00 n@15@00 i@16@00 r)
          (and
            (<= 3 (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r))
            (< (inv@71@00 s@$ xs@14@00 n@15@00 i@16@00 r) n@15@00)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@74@00  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(assert (and
  (P02%trigger ($Snap.first s@$) xs@14@00 n@15@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (= ($Snap.first ($Snap.first s@$)) $Snap.unit)
  (= (Seq_length xs@14@00) n@15@00)
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.first s@$))) $Snap.unit)
  (<= 3 n@15@00)
  (=
    ($Snap.second ($Snap.second ($Snap.first s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
  (forall ((k@65@00 Int) (j@66@00 Int)) (!
    (and
      (=>
        (>= k@65@00 0)
        (and
          (>= k@65@00 0)
          (=>
            (< k@65@00 (Seq_length xs@14@00))
            (and
              (< k@65@00 (Seq_length xs@14@00))
              (=>
                (>= j@66@00 0)
                (and
                  (>= j@66@00 0)
                  (or
                    (< j@66@00 (Seq_length xs@14@00))
                    (not (< j@66@00 (Seq_length xs@14@00))))))
              (or (>= j@66@00 0) (not (>= j@66@00 0)))))
          (or
            (< k@65@00 (Seq_length xs@14@00))
            (not (< k@65@00 (Seq_length xs@14@00))))))
      (or (>= k@65@00 0) (not (>= k@65@00 0)))
      (=>
        (and
          (>= k@65@00 0)
          (and
            (< k@65@00 (Seq_length xs@14@00))
            (and
              (>= j@66@00 0)
              (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00))))))
        (and
          (>= k@65@00 0)
          (< k@65@00 (Seq_length xs@14@00))
          (>= j@66@00 0)
          (< j@66@00 (Seq_length xs@14@00))
          (not (= k@65@00 j@66@00))))
      (or
        (not
          (and
            (>= k@65@00 0)
            (and
              (< k@65@00 (Seq_length xs@14@00))
              (and
                (>= j@66@00 0)
                (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00)))))))
        (and
          (>= k@65@00 0)
          (and
            (< k@65@00 (Seq_length xs@14@00))
            (and
              (>= j@66@00 0)
              (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00))))))))
    :pattern ((Seq_index xs@14@00 k@65@00) (Seq_index xs@14@00 j@66@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|))
  (forall ((k@65@00 Int) (j@66@00 Int)) (!
    (=>
      (and
        (>= k@65@00 0)
        (and
          (< k@65@00 (Seq_length xs@14@00))
          (and
            (>= j@66@00 0)
            (and (< j@66@00 (Seq_length xs@14@00)) (not (= k@65@00 j@66@00))))))
      (not (= (Seq_index xs@14@00 k@65@00) (Seq_index xs@14@00 j@66@00))))
    :pattern ((Seq_index xs@14@00 k@65@00) (Seq_index xs@14@00 j@66@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
  (forall ((j@67@00 Int)) (!
    (=>
      (and (<= 0 j@67@00) (< j@67@00 3))
      (or (<= 0 j@67@00) (not (<= 0 j@67@00))))
    :pattern ((Seq_index xs@14@00 j@67@00))
    :qid |f-aux|))))
(assert (and
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
  (forall ((j@67@00 Int)) (!
    (=>
      (and (<= 0 j@67@00) (< j@67@00 3))
      (not (= (Seq_index xs@14@00 j@67@00) $Ref.null)))
    :pattern ((Seq_index xs@14@00 j@67@00))
    :qid |f-permImpliesNonNull|))
  (forall ((j@70@00 Int)) (!
    (=>
      (and (<= 3 j@70@00) (< j@70@00 n@15@00))
      (or (<= 3 j@70@00) (not (<= 3 j@70@00))))
    :pattern ((Seq_index xs@14@00 j@70@00))
    :qid |f-aux|))))
(assert (and
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
  (forall ((j@70@00 Int)) (!
    (=>
      (and (<= 3 j@70@00) (< j@70@00 n@15@00))
      (not (= (Seq_index xs@14@00 j@70@00) $Ref.null)))
    :pattern ((Seq_index xs@14@00 j@70@00))
    :qid |f-permImpliesNonNull|))))
(assert (=
  result@17@00
  ($FVF.lookup_f (sm@73@00 s@$ xs@14@00 n@15@00 i@16@00) (Seq_index
    xs@14@00
    i@16@00))))
(pop) ; 1
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
; ---------- FUNCTION fun03----------
(declare-fun xs@18@00 () Seq<$Ref>)
(declare-fun i@19@00 () Int)
(declare-fun result@20@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] |xs| > 6
; [eval] |xs|
(assert (> (Seq_length xs@18@00) 6))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@75@00 Int)
(declare-const j@76@00 Int)
(push) ; 2
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 52 | !(k@75@00 >= 0) | live]
; [else-branch: 52 | k@75@00 >= 0 | live]
(push) ; 4
; [then-branch: 52 | !(k@75@00 >= 0)]
(assert (not (>= k@75@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 52 | k@75@00 >= 0]
(assert (>= k@75@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 53 | !(k@75@00 < |xs@18@00|) | live]
; [else-branch: 53 | k@75@00 < |xs@18@00| | live]
(push) ; 6
; [then-branch: 53 | !(k@75@00 < |xs@18@00|)]
(assert (not (< k@75@00 (Seq_length xs@18@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 53 | k@75@00 < |xs@18@00|]
(assert (< k@75@00 (Seq_length xs@18@00)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 54 | !(j@76@00 >= 0) | live]
; [else-branch: 54 | j@76@00 >= 0 | live]
(push) ; 8
; [then-branch: 54 | !(j@76@00 >= 0)]
(assert (not (>= j@76@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 54 | j@76@00 >= 0]
(assert (>= j@76@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 55 | !(j@76@00 < |xs@18@00|) | live]
; [else-branch: 55 | j@76@00 < |xs@18@00| | live]
(push) ; 10
; [then-branch: 55 | !(j@76@00 < |xs@18@00|)]
(assert (not (< j@76@00 (Seq_length xs@18@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 55 | j@76@00 < |xs@18@00|]
(assert (< j@76@00 (Seq_length xs@18@00)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@76@00 (Seq_length xs@18@00)) (not (< j@76@00 (Seq_length xs@18@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@76@00 0)
  (and
    (>= j@76@00 0)
    (or
      (< j@76@00 (Seq_length xs@18@00))
      (not (< j@76@00 (Seq_length xs@18@00)))))))
(assert (or (>= j@76@00 0) (not (>= j@76@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@75@00 (Seq_length xs@18@00))
  (and
    (< k@75@00 (Seq_length xs@18@00))
    (=>
      (>= j@76@00 0)
      (and
        (>= j@76@00 0)
        (or
          (< j@76@00 (Seq_length xs@18@00))
          (not (< j@76@00 (Seq_length xs@18@00))))))
    (or (>= j@76@00 0) (not (>= j@76@00 0))))))
(assert (or (< k@75@00 (Seq_length xs@18@00)) (not (< k@75@00 (Seq_length xs@18@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@75@00 0)
  (and
    (>= k@75@00 0)
    (=>
      (< k@75@00 (Seq_length xs@18@00))
      (and
        (< k@75@00 (Seq_length xs@18@00))
        (=>
          (>= j@76@00 0)
          (and
            (>= j@76@00 0)
            (or
              (< j@76@00 (Seq_length xs@18@00))
              (not (< j@76@00 (Seq_length xs@18@00))))))
        (or (>= j@76@00 0) (not (>= j@76@00 0)))))
    (or
      (< k@75@00 (Seq_length xs@18@00))
      (not (< k@75@00 (Seq_length xs@18@00)))))))
(assert (or (>= k@75@00 0) (not (>= k@75@00 0))))
(push) ; 3
; [then-branch: 56 | k@75@00 >= 0 && k@75@00 < |xs@18@00| && j@76@00 >= 0 && j@76@00 < |xs@18@00| && k@75@00 != j@76@00 | live]
; [else-branch: 56 | !(k@75@00 >= 0 && k@75@00 < |xs@18@00| && j@76@00 >= 0 && j@76@00 < |xs@18@00| && k@75@00 != j@76@00) | live]
(push) ; 4
; [then-branch: 56 | k@75@00 >= 0 && k@75@00 < |xs@18@00| && j@76@00 >= 0 && j@76@00 < |xs@18@00| && k@75@00 != j@76@00]
(assert (and
  (>= k@75@00 0)
  (and
    (< k@75@00 (Seq_length xs@18@00))
    (and
      (>= j@76@00 0)
      (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 4
(push) ; 4
; [else-branch: 56 | !(k@75@00 >= 0 && k@75@00 < |xs@18@00| && j@76@00 >= 0 && j@76@00 < |xs@18@00| && k@75@00 != j@76@00)]
(assert (not
  (and
    (>= k@75@00 0)
    (and
      (< k@75@00 (Seq_length xs@18@00))
      (and
        (>= j@76@00 0)
        (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@75@00 0)
    (and
      (< k@75@00 (Seq_length xs@18@00))
      (and
        (>= j@76@00 0)
        (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00))))))
  (and
    (>= k@75@00 0)
    (< k@75@00 (Seq_length xs@18@00))
    (>= j@76@00 0)
    (< j@76@00 (Seq_length xs@18@00))
    (not (= k@75@00 j@76@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@75@00 0)
      (and
        (< k@75@00 (Seq_length xs@18@00))
        (and
          (>= j@76@00 0)
          (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00)))))))
  (and
    (>= k@75@00 0)
    (and
      (< k@75@00 (Seq_length xs@18@00))
      (and
        (>= j@76@00 0)
        (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@75@00 Int) (j@76@00 Int)) (!
  (and
    (=>
      (>= k@75@00 0)
      (and
        (>= k@75@00 0)
        (=>
          (< k@75@00 (Seq_length xs@18@00))
          (and
            (< k@75@00 (Seq_length xs@18@00))
            (=>
              (>= j@76@00 0)
              (and
                (>= j@76@00 0)
                (or
                  (< j@76@00 (Seq_length xs@18@00))
                  (not (< j@76@00 (Seq_length xs@18@00))))))
            (or (>= j@76@00 0) (not (>= j@76@00 0)))))
        (or
          (< k@75@00 (Seq_length xs@18@00))
          (not (< k@75@00 (Seq_length xs@18@00))))))
    (or (>= k@75@00 0) (not (>= k@75@00 0)))
    (=>
      (and
        (>= k@75@00 0)
        (and
          (< k@75@00 (Seq_length xs@18@00))
          (and
            (>= j@76@00 0)
            (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00))))))
      (and
        (>= k@75@00 0)
        (< k@75@00 (Seq_length xs@18@00))
        (>= j@76@00 0)
        (< j@76@00 (Seq_length xs@18@00))
        (not (= k@75@00 j@76@00))))
    (or
      (not
        (and
          (>= k@75@00 0)
          (and
            (< k@75@00 (Seq_length xs@18@00))
            (and
              (>= j@76@00 0)
              (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00)))))))
      (and
        (>= k@75@00 0)
        (and
          (< k@75@00 (Seq_length xs@18@00))
          (and
            (>= j@76@00 0)
            (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00))))))))
  :pattern ((Seq_index xs@18@00 k@75@00) (Seq_index xs@18@00 j@76@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106-aux|)))
(assert (forall ((k@75@00 Int) (j@76@00 Int)) (!
  (=>
    (and
      (>= k@75@00 0)
      (and
        (< k@75@00 (Seq_length xs@18@00))
        (and
          (>= j@76@00 0)
          (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00))))))
    (not (= (Seq_index xs@18@00 k@75@00) (Seq_index xs@18@00 j@76@00))))
  :pattern ((Seq_index xs@18@00 k@75@00) (Seq_index xs@18@00 j@76@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(declare-const j@77@00 Int)
(push) ; 2
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 3
; [then-branch: 57 | !(0 <= j@77@00) | live]
; [else-branch: 57 | 0 <= j@77@00 | live]
(push) ; 4
; [then-branch: 57 | !(0 <= j@77@00)]
(assert (not (<= 0 j@77@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 57 | 0 <= j@77@00]
(assert (<= 0 j@77@00))
; [eval] j < 3
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@77@00) (not (<= 0 j@77@00))))
(assert (and (<= 0 j@77@00) (< j@77@00 3)))
; [eval] xs[j]
(push) ; 3
(assert (not (>= j@77@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@77@00 (Seq_length xs@18@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@78@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@79@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@77@00 Int)) (!
  (=>
    (and (<= 0 j@77@00) (< j@77@00 3))
    (or (<= 0 j@77@00) (not (<= 0 j@77@00))))
  :pattern ((Seq_index xs@18@00 j@77@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@77@00 Int) (j2@77@00 Int)) (!
  (=>
    (and
      (and (<= 0 j1@77@00) (< j1@77@00 3))
      (and (<= 0 j2@77@00) (< j2@77@00 3))
      (= (Seq_index xs@18@00 j1@77@00) (Seq_index xs@18@00 j2@77@00)))
    (= j1@77@00 j2@77@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@77@00 Int)) (!
  (=>
    (and (<= 0 j@77@00) (< j@77@00 3))
    (and
      (= (inv@78@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@77@00)) j@77@00)
      (img@79@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@77@00))))
  :pattern ((Seq_index xs@18@00 j@77@00))
  :qid |quant-u-57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@79@00 s@$ xs@18@00 i@19@00 r)
      (and
        (<= 0 (inv@78@00 s@$ xs@18@00 i@19@00 r))
        (< (inv@78@00 s@$ xs@18@00 i@19@00 r) 3)))
    (= (Seq_index xs@18@00 (inv@78@00 s@$ xs@18@00 i@19@00 r)) r))
  :pattern ((inv@78@00 s@$ xs@18@00 i@19@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@77@00 Int)) (!
  (=>
    (and (<= 0 j@77@00) (< j@77@00 3))
    (not (= (Seq_index xs@18@00 j@77@00) $Ref.null)))
  :pattern ((Seq_index xs@18@00 j@77@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(declare-const j@80@00 Int)
(push) ; 2
; [eval] 3 <= j && j < |xs|
; [eval] 3 <= j
(push) ; 3
; [then-branch: 58 | !(3 <= j@80@00) | live]
; [else-branch: 58 | 3 <= j@80@00 | live]
(push) ; 4
; [then-branch: 58 | !(3 <= j@80@00)]
(assert (not (<= 3 j@80@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 58 | 3 <= j@80@00]
(assert (<= 3 j@80@00))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@80@00) (not (<= 3 j@80@00))))
(assert (and (<= 3 j@80@00) (< j@80@00 (Seq_length xs@18@00))))
; [eval] xs[j]
(push) ; 3
(assert (not (>= j@80@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@81@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun img@82@00 ($Snap Seq<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@80@00 Int)) (!
  (=>
    (and (<= 3 j@80@00) (< j@80@00 (Seq_length xs@18@00)))
    (or (<= 3 j@80@00) (not (<= 3 j@80@00))))
  :pattern ((Seq_index xs@18@00 j@80@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@80@00 Int) (j2@80@00 Int)) (!
  (=>
    (and
      (and (<= 3 j1@80@00) (< j1@80@00 (Seq_length xs@18@00)))
      (and (<= 3 j2@80@00) (< j2@80@00 (Seq_length xs@18@00)))
      (= (Seq_index xs@18@00 j1@80@00) (Seq_index xs@18@00 j2@80@00)))
    (= j1@80@00 j2@80@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@80@00 Int)) (!
  (=>
    (and (<= 3 j@80@00) (< j@80@00 (Seq_length xs@18@00)))
    (and
      (= (inv@81@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@80@00)) j@80@00)
      (img@82@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@80@00))))
  :pattern ((Seq_index xs@18@00 j@80@00))
  :qid |quant-u-59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@82@00 s@$ xs@18@00 i@19@00 r)
      (and
        (<= 3 (inv@81@00 s@$ xs@18@00 i@19@00 r))
        (< (inv@81@00 s@$ xs@18@00 i@19@00 r) (Seq_length xs@18@00))))
    (= (Seq_index xs@18@00 (inv@81@00 s@$ xs@18@00 i@19@00 r)) r))
  :pattern ((inv@81@00 s@$ xs@18@00 i@19@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@80@00 Int)) (!
  (=>
    (and (<= 3 j@80@00) (< j@80@00 (Seq_length xs@18@00)))
    (not (= (Seq_index xs@18@00 j@80@00) $Ref.null)))
  :pattern ((Seq_index xs@18@00 j@80@00))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@18@00 j@80@00) (Seq_index xs@18@00 j@77@00))
    (=
      (and
        (img@82@00 s@$ xs@18@00 i@19@00 r)
        (and
          (<= 3 (inv@81@00 s@$ xs@18@00 i@19@00 r))
          (< (inv@81@00 s@$ xs@18@00 i@19@00 r) (Seq_length xs@18@00))))
      (and
        (img@79@00 s@$ xs@18@00 i@19@00 r)
        (and
          (<= 0 (inv@78@00 s@$ xs@18@00 i@19@00 r))
          (< (inv@78@00 s@$ xs@18@00 i@19@00 r) 3)))))
  
  :qid |quant-u-60|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@19@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] i < |xs|
; [eval] |xs|
(assert (< i@19@00 (Seq_length xs@18@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  (= (fun03%limited s@$ xs@18@00 i@19@00) (fun03 s@$ xs@18@00 i@19@00))
  :pattern ((fun03 s@$ xs@18@00 i@19@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  (fun03%stateless xs@18@00 i@19@00)
  :pattern ((fun03%limited s@$ xs@18@00 i@19@00))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@82@00 s@$ xs@18@00 i@19@00 r)
      (and
        (<= 3 (inv@81@00 s@$ xs@18@00 i@19@00 r))
        (< (inv@81@00 s@$ xs@18@00 i@19@00 r) (Seq_length xs@18@00))))
    (= (Seq_index xs@18@00 (inv@81@00 s@$ xs@18@00 i@19@00 r)) r))
  :pattern ((inv@81@00 s@$ xs@18@00 i@19@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((j@80@00 Int)) (!
  (=>
    (and (<= 3 j@80@00) (< j@80@00 (Seq_length xs@18@00)))
    (and
      (= (inv@81@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@80@00)) j@80@00)
      (img@82@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@80@00))))
  :pattern ((Seq_index xs@18@00 j@80@00))
  :qid |quant-u-59|)))
(assert (forall ((j@80@00 Int)) (!
  (=>
    (and (<= 3 j@80@00) (< j@80@00 (Seq_length xs@18@00)))
    (not (= (Seq_index xs@18@00 j@80@00) $Ref.null)))
  :pattern ((Seq_index xs@18@00 j@80@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (<= 0 i@19@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (< i@19@00 (Seq_length xs@18@00)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@79@00 s@$ xs@18@00 i@19@00 r)
      (and
        (<= 0 (inv@78@00 s@$ xs@18@00 i@19@00 r))
        (< (inv@78@00 s@$ xs@18@00 i@19@00 r) 3)))
    (= (Seq_index xs@18@00 (inv@78@00 s@$ xs@18@00 i@19@00 r)) r))
  :pattern ((inv@78@00 s@$ xs@18@00 i@19@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((j@77@00 Int)) (!
  (=>
    (and (<= 0 j@77@00) (< j@77@00 3))
    (and
      (= (inv@78@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@77@00)) j@77@00)
      (img@79@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@77@00))))
  :pattern ((Seq_index xs@18@00 j@77@00))
  :qid |quant-u-57|)))
(assert (forall ((j@77@00 Int)) (!
  (=>
    (and (<= 0 j@77@00) (< j@77@00 3))
    (not (= (Seq_index xs@18@00 j@77@00) $Ref.null)))
  :pattern ((Seq_index xs@18@00 j@77@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (forall ((j@80@00 Int)) (!
  (=>
    (and (<= 3 j@80@00) (< j@80@00 (Seq_length xs@18@00)))
    (or (<= 3 j@80@00) (not (<= 3 j@80@00))))
  :pattern ((Seq_index xs@18@00 j@80@00))
  :qid |f-aux|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (> (Seq_length xs@18@00) 6))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (forall ((k@75@00 Int) (j@76@00 Int)) (!
  (and
    (=>
      (>= k@75@00 0)
      (and
        (>= k@75@00 0)
        (=>
          (< k@75@00 (Seq_length xs@18@00))
          (and
            (< k@75@00 (Seq_length xs@18@00))
            (=>
              (>= j@76@00 0)
              (and
                (>= j@76@00 0)
                (or
                  (< j@76@00 (Seq_length xs@18@00))
                  (not (< j@76@00 (Seq_length xs@18@00))))))
            (or (>= j@76@00 0) (not (>= j@76@00 0)))))
        (or
          (< k@75@00 (Seq_length xs@18@00))
          (not (< k@75@00 (Seq_length xs@18@00))))))
    (or (>= k@75@00 0) (not (>= k@75@00 0)))
    (=>
      (and
        (>= k@75@00 0)
        (and
          (< k@75@00 (Seq_length xs@18@00))
          (and
            (>= j@76@00 0)
            (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00))))))
      (and
        (>= k@75@00 0)
        (< k@75@00 (Seq_length xs@18@00))
        (>= j@76@00 0)
        (< j@76@00 (Seq_length xs@18@00))
        (not (= k@75@00 j@76@00))))
    (or
      (not
        (and
          (>= k@75@00 0)
          (and
            (< k@75@00 (Seq_length xs@18@00))
            (and
              (>= j@76@00 0)
              (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00)))))))
      (and
        (>= k@75@00 0)
        (and
          (< k@75@00 (Seq_length xs@18@00))
          (and
            (>= j@76@00 0)
            (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00))))))))
  :pattern ((Seq_index xs@18@00 k@75@00) (Seq_index xs@18@00 j@76@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106-aux|)))
(assert (forall ((k@75@00 Int) (j@76@00 Int)) (!
  (=>
    (and
      (>= k@75@00 0)
      (and
        (< k@75@00 (Seq_length xs@18@00))
        (and
          (>= j@76@00 0)
          (and (< j@76@00 (Seq_length xs@18@00)) (not (= k@75@00 j@76@00))))))
    (not (= (Seq_index xs@18@00 k@75@00) (Seq_index xs@18@00 j@76@00))))
  :pattern ((Seq_index xs@18@00 k@75@00) (Seq_index xs@18@00 j@76@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@46@12@46@106|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (forall ((j@77@00 Int)) (!
  (=>
    (and (<= 0 j@77@00) (< j@77@00 3))
    (or (<= 0 j@77@00) (not (<= 0 j@77@00))))
  :pattern ((Seq_index xs@18@00 j@77@00))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= i@19@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@83@00 ($Snap Seq<$Ref> Int) $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef11|)))
(declare-const pm@84@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@00  $FPM) r)
    (+
      (ite
        (and
          (img@79@00 s@$ xs@18@00 i@19@00 r)
          (and
            (<= 0 (inv@78@00 s@$ xs@18@00 i@19@00 r))
            (< (inv@78@00 s@$ xs@18@00 i@19@00 r) 3)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@82@00 s@$ xs@18@00 i@19@00 r)
          (and
            (<= 3 (inv@81@00 s@$ xs@18@00 i@19@00 r))
            (< (inv@81@00 s@$ xs@18@00 i@19@00 r) (Seq_length xs@18@00))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@00  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_f (as pm@84@00  $FPM) (Seq_index xs@18@00 i@19@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@20@00
  ($FVF.lookup_f (sm@83@00 s@$ xs@18@00 i@19@00) (Seq_index xs@18@00 i@19@00))))
(pop) ; 1
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
; ---------- P02 ----------
(declare-const xs@85@00 Seq<$Ref>)
(declare-const n@86@00 Int)
(push) ; 1
(declare-const $t@87@00 $Snap)
(assert (= $t@87@00 ($Snap.combine ($Snap.first $t@87@00) ($Snap.second $t@87@00))))
(assert (= ($Snap.first $t@87@00) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@85@00) n@86@00))
(assert (=
  ($Snap.second $t@87@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@87@00))
    ($Snap.second ($Snap.second $t@87@00)))))
(assert (= ($Snap.first ($Snap.second $t@87@00)) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@86@00))
(assert (=
  ($Snap.second ($Snap.second $t@87@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@87@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@87@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@87@00))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@88@00 Int)
(declare-const j@89@00 Int)
(push) ; 2
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 59 | !(k@88@00 >= 0) | live]
; [else-branch: 59 | k@88@00 >= 0 | live]
(push) ; 4
; [then-branch: 59 | !(k@88@00 >= 0)]
(assert (not (>= k@88@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 59 | k@88@00 >= 0]
(assert (>= k@88@00 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 60 | !(k@88@00 < |xs@85@00|) | live]
; [else-branch: 60 | k@88@00 < |xs@85@00| | live]
(push) ; 6
; [then-branch: 60 | !(k@88@00 < |xs@85@00|)]
(assert (not (< k@88@00 (Seq_length xs@85@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 60 | k@88@00 < |xs@85@00|]
(assert (< k@88@00 (Seq_length xs@85@00)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 61 | !(j@89@00 >= 0) | live]
; [else-branch: 61 | j@89@00 >= 0 | live]
(push) ; 8
; [then-branch: 61 | !(j@89@00 >= 0)]
(assert (not (>= j@89@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 61 | j@89@00 >= 0]
(assert (>= j@89@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 62 | !(j@89@00 < |xs@85@00|) | live]
; [else-branch: 62 | j@89@00 < |xs@85@00| | live]
(push) ; 10
; [then-branch: 62 | !(j@89@00 < |xs@85@00|)]
(assert (not (< j@89@00 (Seq_length xs@85@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 62 | j@89@00 < |xs@85@00|]
(assert (< j@89@00 (Seq_length xs@85@00)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@89@00 (Seq_length xs@85@00)) (not (< j@89@00 (Seq_length xs@85@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@89@00 0)
  (and
    (>= j@89@00 0)
    (or
      (< j@89@00 (Seq_length xs@85@00))
      (not (< j@89@00 (Seq_length xs@85@00)))))))
(assert (or (>= j@89@00 0) (not (>= j@89@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@88@00 (Seq_length xs@85@00))
  (and
    (< k@88@00 (Seq_length xs@85@00))
    (=>
      (>= j@89@00 0)
      (and
        (>= j@89@00 0)
        (or
          (< j@89@00 (Seq_length xs@85@00))
          (not (< j@89@00 (Seq_length xs@85@00))))))
    (or (>= j@89@00 0) (not (>= j@89@00 0))))))
(assert (or (< k@88@00 (Seq_length xs@85@00)) (not (< k@88@00 (Seq_length xs@85@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@88@00 0)
  (and
    (>= k@88@00 0)
    (=>
      (< k@88@00 (Seq_length xs@85@00))
      (and
        (< k@88@00 (Seq_length xs@85@00))
        (=>
          (>= j@89@00 0)
          (and
            (>= j@89@00 0)
            (or
              (< j@89@00 (Seq_length xs@85@00))
              (not (< j@89@00 (Seq_length xs@85@00))))))
        (or (>= j@89@00 0) (not (>= j@89@00 0)))))
    (or
      (< k@88@00 (Seq_length xs@85@00))
      (not (< k@88@00 (Seq_length xs@85@00)))))))
(assert (or (>= k@88@00 0) (not (>= k@88@00 0))))
(push) ; 3
; [then-branch: 63 | k@88@00 >= 0 && k@88@00 < |xs@85@00| && j@89@00 >= 0 && j@89@00 < |xs@85@00| && k@88@00 != j@89@00 | live]
; [else-branch: 63 | !(k@88@00 >= 0 && k@88@00 < |xs@85@00| && j@89@00 >= 0 && j@89@00 < |xs@85@00| && k@88@00 != j@89@00) | live]
(push) ; 4
; [then-branch: 63 | k@88@00 >= 0 && k@88@00 < |xs@85@00| && j@89@00 >= 0 && j@89@00 < |xs@85@00| && k@88@00 != j@89@00]
(assert (and
  (>= k@88@00 0)
  (and
    (< k@88@00 (Seq_length xs@85@00))
    (and
      (>= j@89@00 0)
      (and (< j@89@00 (Seq_length xs@85@00)) (not (= k@88@00 j@89@00)))))))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 4
(push) ; 4
; [else-branch: 63 | !(k@88@00 >= 0 && k@88@00 < |xs@85@00| && j@89@00 >= 0 && j@89@00 < |xs@85@00| && k@88@00 != j@89@00)]
(assert (not
  (and
    (>= k@88@00 0)
    (and
      (< k@88@00 (Seq_length xs@85@00))
      (and
        (>= j@89@00 0)
        (and (< j@89@00 (Seq_length xs@85@00)) (not (= k@88@00 j@89@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@88@00 0)
    (and
      (< k@88@00 (Seq_length xs@85@00))
      (and
        (>= j@89@00 0)
        (and (< j@89@00 (Seq_length xs@85@00)) (not (= k@88@00 j@89@00))))))
  (and
    (>= k@88@00 0)
    (< k@88@00 (Seq_length xs@85@00))
    (>= j@89@00 0)
    (< j@89@00 (Seq_length xs@85@00))
    (not (= k@88@00 j@89@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@88@00 0)
      (and
        (< k@88@00 (Seq_length xs@85@00))
        (and
          (>= j@89@00 0)
          (and (< j@89@00 (Seq_length xs@85@00)) (not (= k@88@00 j@89@00)))))))
  (and
    (>= k@88@00 0)
    (and
      (< k@88@00 (Seq_length xs@85@00))
      (and
        (>= j@89@00 0)
        (and (< j@89@00 (Seq_length xs@85@00)) (not (= k@88@00 j@89@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@88@00 Int) (j@89@00 Int)) (!
  (and
    (=>
      (>= k@88@00 0)
      (and
        (>= k@88@00 0)
        (=>
          (< k@88@00 (Seq_length xs@85@00))
          (and
            (< k@88@00 (Seq_length xs@85@00))
            (=>
              (>= j@89@00 0)
              (and
                (>= j@89@00 0)
                (or
                  (< j@89@00 (Seq_length xs@85@00))
                  (not (< j@89@00 (Seq_length xs@85@00))))))
            (or (>= j@89@00 0) (not (>= j@89@00 0)))))
        (or
          (< k@88@00 (Seq_length xs@85@00))
          (not (< k@88@00 (Seq_length xs@85@00))))))
    (or (>= k@88@00 0) (not (>= k@88@00 0)))
    (=>
      (and
        (>= k@88@00 0)
        (and
          (< k@88@00 (Seq_length xs@85@00))
          (and
            (>= j@89@00 0)
            (and (< j@89@00 (Seq_length xs@85@00)) (not (= k@88@00 j@89@00))))))
      (and
        (>= k@88@00 0)
        (< k@88@00 (Seq_length xs@85@00))
        (>= j@89@00 0)
        (< j@89@00 (Seq_length xs@85@00))
        (not (= k@88@00 j@89@00))))
    (or
      (not
        (and
          (>= k@88@00 0)
          (and
            (< k@88@00 (Seq_length xs@85@00))
            (and
              (>= j@89@00 0)
              (and (< j@89@00 (Seq_length xs@85@00)) (not (= k@88@00 j@89@00)))))))
      (and
        (>= k@88@00 0)
        (and
          (< k@88@00 (Seq_length xs@85@00))
          (and
            (>= j@89@00 0)
            (and (< j@89@00 (Seq_length xs@85@00)) (not (= k@88@00 j@89@00))))))))
  :pattern ((Seq_index xs@85@00 k@88@00) (Seq_index xs@85@00 j@89@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101-aux|)))
(assert (forall ((k@88@00 Int) (j@89@00 Int)) (!
  (=>
    (and
      (>= k@88@00 0)
      (and
        (< k@88@00 (Seq_length xs@85@00))
        (and
          (>= j@89@00 0)
          (and (< j@89@00 (Seq_length xs@85@00)) (not (= k@88@00 j@89@00))))))
    (not (= (Seq_index xs@85@00 k@88@00) (Seq_index xs@85@00 j@89@00))))
  :pattern ((Seq_index xs@85@00 k@88@00) (Seq_index xs@85@00 j@89@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@65@7@65@101|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@87@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@00)))))))
(declare-const j@90@00 Int)
(push) ; 2
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 3
; [then-branch: 64 | !(0 <= j@90@00) | live]
; [else-branch: 64 | 0 <= j@90@00 | live]
(push) ; 4
; [then-branch: 64 | !(0 <= j@90@00)]
(assert (not (<= 0 j@90@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 64 | 0 <= j@90@00]
(assert (<= 0 j@90@00))
; [eval] j < 3
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@90@00) (not (<= 0 j@90@00))))
(assert (and (<= 0 j@90@00) (< j@90@00 3)))
; [eval] xs[j]
(push) ; 3
(assert (not (>= j@90@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@90@00 (Seq_length xs@85@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@91@00 ($Ref) Int)
(declare-fun img@92@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@90@00 Int)) (!
  (=>
    (and (<= 0 j@90@00) (< j@90@00 3))
    (or (<= 0 j@90@00) (not (<= 0 j@90@00))))
  :pattern ((Seq_index xs@85@00 j@90@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@90@00 Int) (j2@90@00 Int)) (!
  (=>
    (and
      (and (<= 0 j1@90@00) (< j1@90@00 3))
      (and (<= 0 j2@90@00) (< j2@90@00 3))
      (= (Seq_index xs@85@00 j1@90@00) (Seq_index xs@85@00 j2@90@00)))
    (= j1@90@00 j2@90@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@90@00 Int)) (!
  (=>
    (and (<= 0 j@90@00) (< j@90@00 3))
    (and
      (= (inv@91@00 (Seq_index xs@85@00 j@90@00)) j@90@00)
      (img@92@00 (Seq_index xs@85@00 j@90@00))))
  :pattern ((Seq_index xs@85@00 j@90@00))
  :qid |quant-u-64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@92@00 r) (and (<= 0 (inv@91@00 r)) (< (inv@91@00 r) 3)))
    (= (Seq_index xs@85@00 (inv@91@00 r)) r))
  :pattern ((inv@91@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@90@00 Int)) (!
  (=>
    (and (<= 0 j@90@00) (< j@90@00 3))
    (not (= (Seq_index xs@85@00 j@90@00) $Ref.null)))
  :pattern ((Seq_index xs@85@00 j@90@00))
  :qid |f-permImpliesNonNull|)))
(declare-const j@93@00 Int)
(push) ; 2
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 3
; [then-branch: 65 | !(3 <= j@93@00) | live]
; [else-branch: 65 | 3 <= j@93@00 | live]
(push) ; 4
; [then-branch: 65 | !(3 <= j@93@00)]
(assert (not (<= 3 j@93@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 65 | 3 <= j@93@00]
(assert (<= 3 j@93@00))
; [eval] j < n
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@93@00) (not (<= 3 j@93@00))))
(assert (and (<= 3 j@93@00) (< j@93@00 n@86@00)))
; [eval] xs[j]
(push) ; 3
(assert (not (>= j@93@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@93@00 (Seq_length xs@85@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@94@00 ($Ref) Int)
(declare-fun img@95@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@93@00 Int)) (!
  (=>
    (and (<= 3 j@93@00) (< j@93@00 n@86@00))
    (or (<= 3 j@93@00) (not (<= 3 j@93@00))))
  :pattern ((Seq_index xs@85@00 j@93@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@93@00 Int) (j2@93@00 Int)) (!
  (=>
    (and
      (and (<= 3 j1@93@00) (< j1@93@00 n@86@00))
      (and (<= 3 j2@93@00) (< j2@93@00 n@86@00))
      (= (Seq_index xs@85@00 j1@93@00) (Seq_index xs@85@00 j2@93@00)))
    (= j1@93@00 j2@93@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@93@00 Int)) (!
  (=>
    (and (<= 3 j@93@00) (< j@93@00 n@86@00))
    (and
      (= (inv@94@00 (Seq_index xs@85@00 j@93@00)) j@93@00)
      (img@95@00 (Seq_index xs@85@00 j@93@00))))
  :pattern ((Seq_index xs@85@00 j@93@00))
  :qid |quant-u-66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@95@00 r) (and (<= 3 (inv@94@00 r)) (< (inv@94@00 r) n@86@00)))
    (= (Seq_index xs@85@00 (inv@94@00 r)) r))
  :pattern ((inv@94@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@93@00 Int)) (!
  (=>
    (and (<= 3 j@93@00) (< j@93@00 n@86@00))
    (not (= (Seq_index xs@85@00 j@93@00) $Ref.null)))
  :pattern ((Seq_index xs@85@00 j@93@00))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@85@00 j@93@00) (Seq_index xs@85@00 j@90@00))
    (=
      (and (img@95@00 r) (and (<= 3 (inv@94@00 r)) (< (inv@94@00 r) n@86@00)))
      (and (img@92@00 r) (and (<= 0 (inv@91@00 r)) (< (inv@91@00 r) 3)))))
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- P01 ----------
(declare-const x@96@00 $Ref)
(declare-const n@97@00 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@98@00 $Snap)
(assert (= $t@98@00 ($Snap.combine ($Snap.first $t@98@00) ($Snap.second $t@98@00))))
(assert (not (= x@96@00 $Ref.null)))
(assert (=
  ($Snap.second $t@98@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@98@00))
    ($Snap.second ($Snap.second $t@98@00)))))
(assert (= ($Snap.first ($Snap.second $t@98@00)) $Snap.unit))
; [eval] |x.ss| == n
; [eval] |x.ss|
(assert (= (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))) n@97@00))
(assert (=
  ($Snap.second ($Snap.second $t@98@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@98@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@98@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@98@00))) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@97@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@98@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@98@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@98@00))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@99@00 Int)
(declare-const j@100@00 Int)
(push) ; 2
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 66 | !(k@99@00 >= 0) | live]
; [else-branch: 66 | k@99@00 >= 0 | live]
(push) ; 4
; [then-branch: 66 | !(k@99@00 >= 0)]
(assert (not (>= k@99@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 66 | k@99@00 >= 0]
(assert (>= k@99@00 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 5
; [then-branch: 67 | !(k@99@00 < |First:($t@98@00)|) | live]
; [else-branch: 67 | k@99@00 < |First:($t@98@00)| | live]
(push) ; 6
; [then-branch: 67 | !(k@99@00 < |First:($t@98@00)|)]
(assert (not
  (<
    k@99@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))))
(pop) ; 6
(push) ; 6
; [else-branch: 67 | k@99@00 < |First:($t@98@00)|]
(assert (< k@99@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00)))))
; [eval] j >= 0
(push) ; 7
; [then-branch: 68 | !(j@100@00 >= 0) | live]
; [else-branch: 68 | j@100@00 >= 0 | live]
(push) ; 8
; [then-branch: 68 | !(j@100@00 >= 0)]
(assert (not (>= j@100@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 68 | j@100@00 >= 0]
(assert (>= j@100@00 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 9
; [then-branch: 69 | !(j@100@00 < |First:($t@98@00)|) | live]
; [else-branch: 69 | j@100@00 < |First:($t@98@00)| | live]
(push) ; 10
; [then-branch: 69 | !(j@100@00 < |First:($t@98@00)|)]
(assert (not
  (<
    j@100@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))))
(pop) ; 10
(push) ; 10
; [else-branch: 69 | j@100@00 < |First:($t@98@00)|]
(assert (< j@100@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00)))))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@100@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
  (not
    (<
      j@100@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00)))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@100@00 0)
  (and
    (>= j@100@00 0)
    (or
      (<
        j@100@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
      (not
        (<
          j@100@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00)))))))))
(assert (or (>= j@100@00 0) (not (>= j@100@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    k@99@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
  (and
    (<
      k@99@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
    (=>
      (>= j@100@00 0)
      (and
        (>= j@100@00 0)
        (or
          (<
            j@100@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
          (not
            (<
              j@100@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))))))
    (or (>= j@100@00 0) (not (>= j@100@00 0))))))
(assert (or
  (<
    k@99@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
  (not
    (<
      k@99@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00)))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@99@00 0)
  (and
    (>= k@99@00 0)
    (=>
      (<
        k@99@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
      (and
        (<
          k@99@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
        (=>
          (>= j@100@00 0)
          (and
            (>= j@100@00 0)
            (or
              (<
                j@100@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
              (not
                (<
                  j@100@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))))))
        (or (>= j@100@00 0) (not (>= j@100@00 0)))))
    (or
      (<
        k@99@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
      (not
        (<
          k@99@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00)))))))))
(assert (or (>= k@99@00 0) (not (>= k@99@00 0))))
(push) ; 3
; [then-branch: 70 | k@99@00 >= 0 && k@99@00 < |First:($t@98@00)| && j@100@00 >= 0 && j@100@00 < |First:($t@98@00)| && k@99@00 != j@100@00 | live]
; [else-branch: 70 | !(k@99@00 >= 0 && k@99@00 < |First:($t@98@00)| && j@100@00 >= 0 && j@100@00 < |First:($t@98@00)| && k@99@00 != j@100@00) | live]
(push) ; 4
; [then-branch: 70 | k@99@00 >= 0 && k@99@00 < |First:($t@98@00)| && j@100@00 >= 0 && j@100@00 < |First:($t@98@00)| && k@99@00 != j@100@00]
(assert (and
  (>= k@99@00 0)
  (and
    (<
      k@99@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
    (and
      (>= j@100@00 0)
      (and
        (<
          j@100@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
        (not (= k@99@00 j@100@00)))))))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 4
(push) ; 4
; [else-branch: 70 | !(k@99@00 >= 0 && k@99@00 < |First:($t@98@00)| && j@100@00 >= 0 && j@100@00 < |First:($t@98@00)| && k@99@00 != j@100@00)]
(assert (not
  (and
    (>= k@99@00 0)
    (and
      (<
        k@99@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
      (and
        (>= j@100@00 0)
        (and
          (<
            j@100@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
          (not (= k@99@00 j@100@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@99@00 0)
    (and
      (<
        k@99@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
      (and
        (>= j@100@00 0)
        (and
          (<
            j@100@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
          (not (= k@99@00 j@100@00))))))
  (and
    (>= k@99@00 0)
    (<
      k@99@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
    (>= j@100@00 0)
    (<
      j@100@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
    (not (= k@99@00 j@100@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@99@00 0)
      (and
        (<
          k@99@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
        (and
          (>= j@100@00 0)
          (and
            (<
              j@100@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
            (not (= k@99@00 j@100@00)))))))
  (and
    (>= k@99@00 0)
    (and
      (<
        k@99@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
      (and
        (>= j@100@00 0)
        (and
          (<
            j@100@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
          (not (= k@99@00 j@100@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@99@00 Int) (j@100@00 Int)) (!
  (and
    (=>
      (>= k@99@00 0)
      (and
        (>= k@99@00 0)
        (=>
          (<
            k@99@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
          (and
            (<
              k@99@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
            (=>
              (>= j@100@00 0)
              (and
                (>= j@100@00 0)
                (or
                  (<
                    j@100@00
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
                  (not
                    (<
                      j@100@00
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))))))
            (or (>= j@100@00 0) (not (>= j@100@00 0)))))
        (or
          (<
            k@99@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
          (not
            (<
              k@99@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))))))
    (or (>= k@99@00 0) (not (>= k@99@00 0)))
    (=>
      (and
        (>= k@99@00 0)
        (and
          (<
            k@99@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
          (and
            (>= j@100@00 0)
            (and
              (<
                j@100@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
              (not (= k@99@00 j@100@00))))))
      (and
        (>= k@99@00 0)
        (<
          k@99@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
        (>= j@100@00 0)
        (<
          j@100@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
        (not (= k@99@00 j@100@00))))
    (or
      (not
        (and
          (>= k@99@00 0)
          (and
            (<
              k@99@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
            (and
              (>= j@100@00 0)
              (and
                (<
                  j@100@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
                (not (= k@99@00 j@100@00)))))))
      (and
        (>= k@99@00 0)
        (and
          (<
            k@99@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
          (and
            (>= j@100@00 0)
            (and
              (<
                j@100@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
              (not (= k@99@00 j@100@00))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    k@99@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    j@100@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109-aux|)))
(assert (forall ((k@99@00 Int) (j@100@00 Int)) (!
  (=>
    (and
      (>= k@99@00 0)
      (and
        (<
          k@99@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
        (and
          (>= j@100@00 0)
          (and
            (<
              j@100@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))
            (not (= k@99@00 j@100@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          k@99@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          j@100@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    k@99@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    j@100@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions.vpr@132@7@132@109|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@98@00))))))))
(declare-const j@101@00 Int)
(push) ; 2
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 3
; [then-branch: 71 | !(0 <= j@101@00) | live]
; [else-branch: 71 | 0 <= j@101@00 | live]
(push) ; 4
; [then-branch: 71 | !(0 <= j@101@00)]
(assert (not (<= 0 j@101@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 71 | 0 <= j@101@00]
(assert (<= 0 j@101@00))
; [eval] j < 3
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@101@00) (not (<= 0 j@101@00))))
(assert (and (<= 0 j@101@00) (< j@101@00 3)))
; [eval] x.ss[j]
(push) ; 3
(assert (not (>= j@101@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@101@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@102@00 ($Ref) Int)
(declare-fun img@103@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@101@00 Int)) (!
  (=>
    (and (<= 0 j@101@00) (< j@101@00 3))
    (or (<= 0 j@101@00) (not (<= 0 j@101@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    j@101@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@101@00 Int) (j2@101@00 Int)) (!
  (=>
    (and
      (and (<= 0 j1@101@00) (< j1@101@00 3))
      (and (<= 0 j2@101@00) (< j2@101@00 3))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          j1@101@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          j2@101@00)))
    (= j1@101@00 j2@101@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@101@00 Int)) (!
  (=>
    (and (<= 0 j@101@00) (< j@101@00 3))
    (and
      (=
        (inv@102@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          j@101@00))
        j@101@00)
      (img@103@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
        j@101@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    j@101@00))
  :qid |quant-u-69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@00 r) (and (<= 0 (inv@102@00 r)) (< (inv@102@00 r) 3)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
        (inv@102@00 r))
      r))
  :pattern ((inv@102@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@101@00 Int)) (!
  (=>
    (and (<= 0 j@101@00) (< j@101@00 3))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          j@101@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    j@101@00))
  :qid |f-permImpliesNonNull|)))
(declare-const j@104@00 Int)
(push) ; 2
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 3
; [then-branch: 72 | !(3 <= j@104@00) | live]
; [else-branch: 72 | 3 <= j@104@00 | live]
(push) ; 4
; [then-branch: 72 | !(3 <= j@104@00)]
(assert (not (<= 3 j@104@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 72 | 3 <= j@104@00]
(assert (<= 3 j@104@00))
; [eval] j < n
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 3 j@104@00) (not (<= 3 j@104@00))))
(assert (and (<= 3 j@104@00) (< j@104@00 n@97@00)))
; [eval] x.ss[j]
(push) ; 3
(assert (not (>= j@104@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@104@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@105@00 ($Ref) Int)
(declare-fun img@106@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@104@00 Int)) (!
  (=>
    (and (<= 3 j@104@00) (< j@104@00 n@97@00))
    (or (<= 3 j@104@00) (not (<= 3 j@104@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    j@104@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@104@00 Int) (j2@104@00 Int)) (!
  (=>
    (and
      (and (<= 3 j1@104@00) (< j1@104@00 n@97@00))
      (and (<= 3 j2@104@00) (< j2@104@00 n@97@00))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          j1@104@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          j2@104@00)))
    (= j1@104@00 j2@104@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@104@00 Int)) (!
  (=>
    (and (<= 3 j@104@00) (< j@104@00 n@97@00))
    (and
      (=
        (inv@105@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          j@104@00))
        j@104@00)
      (img@106@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
        j@104@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    j@104@00))
  :qid |quant-u-71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@00 r) (and (<= 3 (inv@105@00 r)) (< (inv@105@00 r) n@97@00)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
        (inv@105@00 r))
      r))
  :pattern ((inv@105@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@104@00 Int)) (!
  (=>
    (and (<= 3 j@104@00) (< j@104@00 n@97@00))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
          j@104@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
    j@104@00))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
        j@104@00)
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@98@00))
        j@101@00))
    (=
      (and (img@106@00 r) (and (<= 3 (inv@105@00 r)) (< (inv@105@00 r) n@97@00)))
      (and (img@103@00 r) (and (<= 0 (inv@102@00 r)) (< (inv@102@00 r) 3)))))
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
