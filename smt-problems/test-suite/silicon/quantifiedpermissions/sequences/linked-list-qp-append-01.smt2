(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:19:18
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr
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
(declare-sort Set<Seq<$Ref>> 0)
(declare-sort Set<Seq<Int>> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<nodes> 0)
(declare-sort $FVF<val> 0)
(declare-sort $FVF<next> 0)
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
(declare-fun $SortWrappers.Set<Seq<Int>>To$Snap (Set<Seq<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<Int>> ($Snap) Set<Seq<Int>>)
(assert (forall ((x Set<Seq<Int>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<Int>>($SortWrappers.Set<Seq<Int>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<Int>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<Int>>To$Snap($SortWrappers.$SnapToSet<Seq<Int>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<Int>> x))
    :qid |$Snap.Set<Seq<Int>>To$SnapToSet<Seq<Int>>|
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
(declare-fun $SortWrappers.$FVF<nodes>To$Snap ($FVF<nodes>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<nodes> ($Snap) $FVF<nodes>)
(assert (forall ((x $FVF<nodes>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<nodes>($SortWrappers.$FVF<nodes>To$Snap x)))
    :pattern (($SortWrappers.$FVF<nodes>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<nodes>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<nodes>To$Snap($SortWrappers.$SnapTo$FVF<nodes> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<nodes> x))
    :qid |$Snap.$FVF<nodes>To$SnapTo$FVF<nodes>|
    )))
(declare-fun $SortWrappers.$FVF<val>To$Snap ($FVF<val>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val> ($Snap) $FVF<val>)
(assert (forall ((x $FVF<val>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val>($SortWrappers.$FVF<val>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val>To$Snap($SortWrappers.$SnapTo$FVF<val> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val> x))
    :qid |$Snap.$FVF<val>To$SnapTo$FVF<val>|
    )))
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
(declare-fun Set_card (Set<Seq<Int>>) Int)
(declare-const Set_empty Set<Seq<Int>>)
(declare-fun Set_in (Seq<Int> Set<Seq<Int>>) Bool)
(declare-fun Set_singleton (Seq<Int>) Set<Seq<Int>>)
(declare-fun Set_unionone (Set<Seq<Int>> Seq<Int>) Set<Seq<Int>>)
(declare-fun Set_union (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Set_intersection (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Set_difference (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Set_subset (Set<Seq<Int>> Set<Seq<Int>>) Bool)
(declare-fun Set_equal (Set<Seq<Int>> Set<Seq<Int>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<Int>> Set<Seq<Int>>) Seq<Int>)
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
; /field_value_functions_declarations.smt2 [nodes: Seq[Ref]]
(declare-fun $FVF.domain_nodes ($FVF<nodes>) Set<$Ref>)
(declare-fun $FVF.lookup_nodes ($FVF<nodes> $Ref) Seq<$Ref>)
(declare-fun $FVF.after_nodes ($FVF<nodes> $FVF<nodes>) Bool)
(declare-fun $FVF.loc_nodes (Seq<$Ref> $Ref) Bool)
(declare-fun $FVF.perm_nodes ($FPM $Ref) $Perm)
(declare-const $fvfTOP_nodes $FVF<nodes>)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; /field_value_functions_declarations.smt2 [next: Ref]
(declare-fun $FVF.domain_next ($FVF<next>) Set<$Ref>)
(declare-fun $FVF.lookup_next ($FVF<next> $Ref) $Ref)
(declare-fun $FVF.after_next ($FVF<next> $FVF<next>) Bool)
(declare-fun $FVF.loc_next ($Ref $Ref) Bool)
(declare-fun $FVF.perm_next ($FPM $Ref) $Perm)
(declare-const $fvfTOP_next $FVF<next>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
(declare-fun itemAt ($Snap $Ref Int) Int)
(declare-fun itemAt%limited ($Snap $Ref Int) Int)
(declare-fun itemAt%stateless ($Ref Int) Bool)
(declare-fun itemAt%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun List%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s Set<Seq<Int>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<Int>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<Int>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<Int>>)))
  )))
(assert (forall ((s Set<Seq<Int>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<Int>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<Int>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<Int>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<Int>) (o Seq<Int>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<Int>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>) (o Seq<Int>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>) (y Seq<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (o Seq<Int>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (y Seq<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (y Seq<Int>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (o Seq<Int>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (o Seq<Int>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (y Seq<Int>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
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
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<Int>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
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
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
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
; /field_value_functions_axioms.smt2 [nodes: Seq[Ref]]
(assert (forall ((vs $FVF<nodes>) (ws $FVF<nodes>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_nodes vs) ($FVF.domain_nodes ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_nodes vs))
            (= ($FVF.lookup_nodes vs x) ($FVF.lookup_nodes ws x)))
          :pattern (($FVF.lookup_nodes vs x) ($FVF.lookup_nodes ws x))
          :qid |qp.$FVF<nodes>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<nodes>To$Snap vs)
              ($SortWrappers.$FVF<nodes>To$Snap ws)
              )
    :qid |qp.$FVF<nodes>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_nodes pm r))
    :pattern (($FVF.perm_nodes pm r)))))
(assert (forall ((r $Ref) (f Seq<$Ref>)) (!
    (= ($FVF.loc_nodes f r) true)
    :pattern (($FVF.loc_nodes f r)))))
; /field_value_functions_axioms.smt2 [val: Int]
(assert (forall ((vs $FVF<val>) (ws $FVF<val>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val vs) ($FVF.domain_val ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val vs))
            (= ($FVF.lookup_val vs x) ($FVF.lookup_val ws x)))
          :pattern (($FVF.lookup_val vs x) ($FVF.lookup_val ws x))
          :qid |qp.$FVF<val>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val>To$Snap vs)
              ($SortWrappers.$FVF<val>To$Snap ws)
              )
    :qid |qp.$FVF<val>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val pm r))
    :pattern (($FVF.perm_val pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
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
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION length----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (length%limited s@$ this@0@00) (length s@$ this@0@00))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (length%stateless this@0@00)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(List(this), write) in |this.nodes|)
(set-option :timeout 0)
(push) ; 2
(assert (List%trigger s@$ this@0@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|this.nodes|)), (j in [0..|this.nodes|)) } { (i in [0..|this.nodes|)), this.nodes[j] } { (j in [0..|this.nodes|)), this.nodes[i] } { this.nodes[i], this.nodes[j] } (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j])
(declare-const i@5@00 Int)
(declare-const j@6@00 Int)
(push) ; 3
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j]
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j)
; [eval] (i in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 4
; [then-branch: 0 | !(i@5@00 in [0..|First:(s@$)|]) | live]
; [else-branch: 0 | i@5@00 in [0..|First:(s@$)|] | live]
(push) ; 5
; [then-branch: 0 | !(i@5@00 in [0..|First:(s@$)|])]
(assert (not
  (Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i@5@00 in [0..|First:(s@$)|]]
(assert (Seq_contains
  (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
  i@5@00))
; [eval] (j in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 6
; [then-branch: 1 | !(j@6@00 in [0..|First:(s@$)|]) | live]
; [else-branch: 1 | j@6@00 in [0..|First:(s@$)|] | live]
(push) ; 7
; [then-branch: 1 | !(j@6@00 in [0..|First:(s@$)|])]
(assert (not
  (Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | j@6@00 in [0..|First:(s@$)|]]
(assert (Seq_contains
  (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
  j@6@00))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00)
  (not
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00)
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00)
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        j@6@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00))))))
(assert (or
  (Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00)
  (not
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00))))
(push) ; 4
; [then-branch: 2 | i@5@00 in [0..|First:(s@$)|] && j@6@00 in [0..|First:(s@$)|] && i@5@00 != j@6@00 | live]
; [else-branch: 2 | !(i@5@00 in [0..|First:(s@$)|] && j@6@00 in [0..|First:(s@$)|] && i@5@00 != j@6@00) | live]
(push) ; 5
; [then-branch: 2 | i@5@00 in [0..|First:(s@$)|] && j@6@00 in [0..|First:(s@$)|] && i@5@00 != j@6@00]
(assert (and
  (Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00)
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00)
    (not (= i@5@00 j@6@00)))))
; [eval] this.nodes[i] != this.nodes[j]
; [eval] this.nodes[i]
(push) ; 6
(assert (not (>= i@5@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@5@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] this.nodes[j]
(push) ; 6
(assert (not (>= j@6@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@6@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(i@5@00 in [0..|First:(s@$)|] && j@6@00 in [0..|First:(s@$)|] && i@5@00 != j@6@00)]
(assert (not
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00)
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        j@6@00)
      (not (= i@5@00 j@6@00))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00)
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        j@6@00)
      (not (= i@5@00 j@6@00))))
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00)
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00)
    (not (= i@5@00 j@6@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00)
        (not (= i@5@00 j@6@00)))))
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00)
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        j@6@00)
      (not (= i@5@00 j@6@00))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@5@00 Int) (j@6@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00)
        (not (= i@5@00 j@6@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))))
  :pattern ((Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@5@00 Int) (j@6@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00)
        (not (= i@5@00 j@6@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@5@00 Int) (j@6@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00)
        (not (= i@5@00 j@6@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))))
  :pattern ((Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) j@6@00))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) j@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@5@00 Int) (j@6@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00)
        (not (= i@5@00 j@6@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) j@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@5@00 Int) (j@6@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00)
        (not (= i@5@00 j@6@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))))
  :pattern ((Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@5@00))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@5@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@5@00 Int) (j@6@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00)
        (not (= i@5@00 j@6@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@5@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@5@00 Int) (j@6@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00)
        (not (= i@5@00 j@6@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))))
  :pattern ((Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@5@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    j@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@5@00 Int) (j@6@00 Int)) (!
  (=>
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        i@5@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          j@6@00)
        (not (= i@5@00 j@6@00))))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@5@00)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) j@6@00))))
  :pattern ((Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00))
  :pattern ((Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) j@6@00))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    i@5@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) j@6@00))
  :pattern ((Seq_contains
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@5@00))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    j@6@00) (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@5@00))
  :pattern ((Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@5@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    j@6@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(declare-const i@7@00 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 3 | !(0 <= i@7@00) | live]
; [else-branch: 3 | 0 <= i@7@00 | live]
(push) ; 5
; [then-branch: 3 | !(0 <= i@7@00)]
(assert (not (<= 0 i@7@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | 0 <= i@7@00]
(assert (<= 0 i@7@00))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@7@00) (not (<= 0 i@7@00))))
(assert (and
  (<= 0 i@7@00)
  (< i@7@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@7@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@8@00 ($Snap $Ref $Ref) Int)
(declare-fun img@9@00 ($Snap $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@7@00 Int)) (!
  (=>
    (and
      (<= 0 i@7@00)
      (< i@7@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
    (or (<= 0 i@7@00) (not (<= 0 i@7@00))))
  :pattern ((Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@7@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@7@00 Int) (i2@7@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@7@00)
        (<
          i1@7@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (and
        (<= 0 i2@7@00)
        (<
          i2@7@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i1@7@00)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i2@7@00)))
    (= i1@7@00 i2@7@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@7@00 Int)) (!
  (=>
    (and
      (<= 0 i@7@00)
      (< i@7@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
    (and
      (=
        (inv@8@00 s@$ this@0@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          i@7@00))
        i@7@00)
      (img@9@00 s@$ this@0@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@7@00))))
  :pattern ((Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@7@00))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@8@00 s@$ this@0@00 r))
        (<
          (inv@8@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        (inv@8@00 s@$ this@0@00 r))
      r))
  :pattern ((inv@8@00 s@$ this@0@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@7@00 Int)) (!
  (=>
    (and
      (<= 0 i@7@00)
      (< i@7@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@7@00)
        $Ref.null)))
  :pattern ((Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@7@00))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(declare-const i@10@00 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 4 | !(0 <= i@10@00) | live]
; [else-branch: 4 | 0 <= i@10@00 | live]
(push) ; 5
; [then-branch: 4 | !(0 <= i@10@00)]
(assert (not (<= 0 i@10@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | 0 <= i@10@00]
(assert (<= 0 i@10@00))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@10@00) (not (<= 0 i@10@00))))
(assert (and
  (<= 0 i@10@00)
  (< i@10@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@10@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@11@00 ($Snap $Ref $Ref) Int)
(declare-fun img@12@00 ($Snap $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and
      (<= 0 i@10@00)
      (< i@10@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
    (or (<= 0 i@10@00) (not (<= 0 i@10@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    i@10@00))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@10@00 Int) (i2@10@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@10@00)
        (<
          i1@10@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (and
        (<= 0 i2@10@00)
        (<
          i2@10@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i1@10@00)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i2@10@00)))
    (= i1@10@00 i2@10@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and
      (<= 0 i@10@00)
      (< i@10@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
    (and
      (=
        (inv@11@00 s@$ this@0@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          i@10@00))
        i@10@00)
      (img@12@00 s@$ this@0@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@10@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    i@10@00))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@11@00 s@$ this@0@00 r))
        (<
          (inv@11@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        (inv@11@00 s@$ this@0@00 r))
      r))
  :pattern ((inv@11@00 s@$ this@0@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@10@00 Int)) (!
  (=>
    (and
      (<= 0 i@10@00)
      (< i@10@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@10@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    i@10@00))
  :qid |next-permImpliesNonNull|)))
(declare-fun sm@13@00 ($Snap $Ref) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@11@00 s@$ this@0@00 r))
        (<
          (inv@11@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@11@00 s@$ this@0@00 r))
      (<
        (inv@11@00 s@$ this@0@00 r)
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
    ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r) r))
  :pattern ((inv@11@00 s@$ this@0@00 r))
  :qid |quant-u-8|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] (forall i: Int :: { this.nodes[i].next } 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null))
(declare-const i@14@00 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | !(0 <= i@14@00) | live]
; [else-branch: 5 | 0 <= i@14@00 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= i@14@00)]
(assert (not (<= 0 i@14@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= i@14@00]
(assert (<= 0 i@14@00))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@14@00) (not (<= 0 i@14@00))))
(push) ; 4
; [then-branch: 6 | 0 <= i@14@00 && i@14@00 < |First:(s@$)| | live]
; [else-branch: 6 | !(0 <= i@14@00 && i@14@00 < |First:(s@$)|) | live]
(push) ; 5
; [then-branch: 6 | 0 <= i@14@00 && i@14@00 < |First:(s@$)|]
(assert (and
  (<= 0 i@14@00)
  (< i@14@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
; [eval] (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] (this.nodes[i] in this.nodes)
; [eval] this.nodes[i]
(push) ; 6
(assert (not (>= i@14@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 7 | !(First:(s@$)[i@14@00] in First:(s@$)) | live]
; [else-branch: 7 | First:(s@$)[i@14@00] in First:(s@$) | live]
(push) ; 7
; [then-branch: 7 | !(First:(s@$)[i@14@00] in First:(s@$))]
(assert (not
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00))))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | First:(s@$)[i@14@00] in First:(s@$)]
(assert (Seq_contains
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00)))
; [eval] (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] i < |this.nodes| - 1
; [eval] |this.nodes| - 1
; [eval] |this.nodes|
(push) ; 8
; [then-branch: 8 | i@14@00 < |First:(s@$)| - 1 | live]
; [else-branch: 8 | !(i@14@00 < |First:(s@$)| - 1) | live]
(push) ; 9
; [then-branch: 8 | i@14@00 < |First:(s@$)| - 1]
(assert (< i@14@00 (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1)))
; [eval] this.nodes[i].next == this.nodes[i + 1]
; [eval] this.nodes[i]
(push) ; 10
(assert (not (>= i@14@00 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@00 s@$ this@0@00 r)
        (and
          (<= 0 (inv@11@00 s@$ this@0@00 r))
          (<
            (inv@11@00 s@$ this@0@00 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
      (=
        ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
    :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
  i@14@00)) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
  i@14@00)))
(push) ; 10
(assert (not (and
  (img@12@00 s@$ this@0@00 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    i@14@00))
  (and
    (<=
      0
      (inv@11@00 s@$ this@0@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@14@00)))
    (<
      (inv@11@00 s@$ this@0@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@14@00))
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] this.nodes[i + 1]
; [eval] i + 1
(push) ; 10
(assert (not (>= (+ i@14@00 1) 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< (+ i@14@00 1) (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 8 | !(i@14@00 < |First:(s@$)| - 1)]
(assert (not
  (<
    i@14@00
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))))
; [eval] this.nodes[i].next == null
; [eval] this.nodes[i]
(push) ; 10
(assert (not (>= i@14@00 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@00 s@$ this@0@00 r)
        (and
          (<= 0 (inv@11@00 s@$ this@0@00 r))
          (<
            (inv@11@00 s@$ this@0@00 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
      (=
        ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
    :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
  i@14@00)) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
  i@14@00)))
(push) ; 10
(assert (not (and
  (img@12@00 s@$ this@0@00 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    i@14@00))
  (and
    (<=
      0
      (inv@11@00 s@$ this@0@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@14@00)))
    (<
      (inv@11@00 s@$ this@0@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@14@00))
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@11@00 s@$ this@0@00 r))
        (<
          (inv@11@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (=>
  (<
    i@14@00
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))
  (and
    (<
      i@14@00
      (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))
    ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@14@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@14@00)))))
; Joined path conditions
(assert (=>
  (not
    (<
      i@14@00
      (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1)))
  (and
    (not
      (<
        i@14@00
        (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1)))
    ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@14@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@14@00)))))
(assert (or
  (not
    (<
      i@14@00
      (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1)))
  (<
    i@14@00
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@11@00 s@$ this@0@00 r))
        (<
          (inv@11@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (=>
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00))
  (and
    (Seq_contains
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00))
    (=>
      (<
        i@14@00
        (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))
      (and
        (<
          i@14@00
          (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))
        ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          i@14@00)) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          i@14@00))))
    (=>
      (not
        (<
          i@14@00
          (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1)))
      (and
        (not
          (<
            i@14@00
            (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1)))
        ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          i@14@00)) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          i@14@00))))
    (or
      (not
        (<
          i@14@00
          (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1)))
      (<
        i@14@00
        (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))))))
(assert (or
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00))
  (not
    (Seq_contains
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00)))))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(0 <= i@14@00 && i@14@00 < |First:(s@$)|)]
(assert (not
  (and
    (<= 0 i@14@00)
    (< i@14@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@11@00 s@$ this@0@00 r))
        (<
          (inv@11@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (=>
  (and
    (<= 0 i@14@00)
    (< i@14@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
  (and
    (<= 0 i@14@00)
    (< i@14@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
    (=>
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00))
      (and
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00))
        (=>
          (<
            i@14@00
            (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))
          (and
            (<
              i@14@00
              (-
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                1))
            ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@14@00)) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@14@00))))
        (=>
          (not
            (<
              i@14@00
              (-
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                1)))
          (and
            (not
              (<
                i@14@00
                (-
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                  1)))
            ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@14@00)) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@14@00))))
        (or
          (not
            (<
              i@14@00
              (-
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                1)))
          (<
            i@14@00
            (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1)))))
    (or
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00))
      (not
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@14@00)
      (< i@14@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
  (and
    (<= 0 i@14@00)
    (< i@14@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@11@00 s@$ this@0@00 r))
        (<
          (inv@11@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :qid |qp.fvfResTrgDef1|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@14@00 Int)) (!
  (and
    (or (<= 0 i@14@00) (not (<= 0 i@14@00)))
    (=>
      (and
        (<= 0 i@14@00)
        (<
          i@14@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (and
        (<= 0 i@14@00)
        (<
          i@14@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
        (=>
          (Seq_contains
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@14@00))
          (and
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                i@14@00))
            (=>
              (<
                i@14@00
                (-
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                  1))
              (and
                (<
                  i@14@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                    1))
                ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                  i@14@00)) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                  i@14@00))))
            (=>
              (not
                (<
                  i@14@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                    1)))
              (and
                (not
                  (<
                    i@14@00
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                      1)))
                ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                  i@14@00)) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                  i@14@00))))
            (or
              (not
                (<
                  i@14@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                    1)))
              (<
                i@14@00
                (-
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                  1)))))
        (or
          (Seq_contains
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@14@00))
          (not
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                i@14@00))))))
    (or
      (not
        (and
          (<= 0 i@14@00)
          (<
            i@14@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
      (and
        (<= 0 i@14@00)
        (<
          i@14@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    i@14@00)) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    i@14@00)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4-aux|)))
(assert (forall ((i@14@00 Int)) (!
  (=>
    (and
      (<= 0 i@14@00)
      (< i@14@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
    (and
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00))
      (ite
        (<
          i@14@00
          (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))
        (=
          ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            i@14@00))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            (+ i@14@00 1)))
        (=
          ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            i@14@00))
          $Ref.null))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    i@14@00)) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
    i@14@00)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4|)))
; [eval] |this.nodes|
(pop) ; 2
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@8@00 s@$ this@0@00 r))
        (<
          (inv@8@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        (inv@8@00 s@$ this@0@00 r))
      r))
  :pattern ((inv@8@00 s@$ this@0@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@11@00 s@$ this@0@00 r))
        (<
          (inv@11@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        (inv@11@00 s@$ this@0@00 r))
      r))
  :pattern ((inv@11@00 s@$ this@0@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ this@0@00 r)
      (and
        (<= 0 (inv@11@00 s@$ this@0@00 r))
        (<
          (inv@11@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
    (=
      ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
  :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (and
  (List%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@0@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (= ($Snap.first ($Snap.second s@$)) $Snap.unit)
  (forall ((i@5@00 Int) (j@6@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              i@5@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)
              (not (= i@5@00 j@6@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@5@00 Int) (j@6@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              i@5@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)
              (not (= i@5@00 j@6@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@5@00 Int) (j@6@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              i@5@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)
              (not (= i@5@00 j@6@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      j@6@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      j@6@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@5@00 Int) (j@6@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              i@5@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)
              (not (= i@5@00 j@6@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      j@6@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@5@00 Int) (j@6@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              i@5@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)
              (not (= i@5@00 j@6@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@5@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@5@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@5@00 Int) (j@6@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              i@5@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)
              (not (= i@5@00 j@6@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@5@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@5@00 Int) (j@6@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              i@5@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
                j@6@00)
              (not (= i@5@00 j@6@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            i@5@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
              j@6@00)
            (not (= i@5@00 j@6@00))))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      j@6@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@5@00 Int) (j@6@00 Int)) (!
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          i@5@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
            j@6@00)
          (not (= i@5@00 j@6@00))))
      (not
        (=
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@5@00)
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) j@6@00))))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      j@6@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      i@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      j@6@00))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@5@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
      j@6@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@5@00))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      j@6@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126|))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (forall ((i@7@00 Int)) (!
    (=>
      (and
        (<= 0 i@7@00)
        (<
          i@7@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (or (<= 0 i@7@00) (not (<= 0 i@7@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@7@00))
    :qid |val-aux|))))
(assert (and
  (forall ((i@7@00 Int)) (!
    (=>
      (and
        (<= 0 i@7@00)
        (<
          i@7@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (and
        (=
          (inv@8@00 s@$ this@0@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            i@7@00))
          i@7@00)
        (img@9@00 s@$ this@0@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          i@7@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@7@00))
    :qid |quant-u-5|))
  (forall ((i@7@00 Int)) (!
    (=>
      (and
        (<= 0 i@7@00)
        (<
          i@7@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (not
        (=
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@7@00)
          $Ref.null)))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@7@00))
    :qid |val-permImpliesNonNull|))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (forall ((i@10@00 Int)) (!
    (=>
      (and
        (<= 0 i@10@00)
        (<
          i@10@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (or (<= 0 i@10@00) (not (<= 0 i@10@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@10@00))
    :qid |next-aux|))))
(assert (and
  (forall ((i@10@00 Int)) (!
    (=>
      (and
        (<= 0 i@10@00)
        (<
          i@10@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (and
        (=
          (inv@11@00 s@$ this@0@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            i@10@00))
          i@10@00)
        (img@12@00 s@$ this@0@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          i@10@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@10@00))
    :qid |quant-u-7|))
  (forall ((i@10@00 Int)) (!
    (=>
      (and
        (<= 0 i@10@00)
        (<
          i@10@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (not
        (=
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@10@00)
          $Ref.null)))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@10@00))
    :qid |next-permImpliesNonNull|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (<= 0 (inv@11@00 s@$ this@0@00 r))
        (<
          (inv@11@00 s@$ this@0@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r) r))
    :pattern ((inv@11@00 s@$ this@0@00 r))
    :qid |quant-u-8|))
  (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (forall ((i@14@00 Int)) (!
    (and
      (or (<= 0 i@14@00) (not (<= 0 i@14@00)))
      (=>
        (and
          (<= 0 i@14@00)
          (<
            i@14@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
        (and
          (<= 0 i@14@00)
          (<
            i@14@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          (=>
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                i@14@00))
            (and
              (Seq_contains
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                  i@14@00))
              (=>
                (<
                  i@14@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                    1))
                (and
                  (<
                    i@14@00
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                      1))
                  ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                    i@14@00)) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                    i@14@00))))
              (=>
                (not
                  (<
                    i@14@00
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                      1)))
                (and
                  (not
                    (<
                      i@14@00
                      (-
                        (Seq_length
                          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                        1)))
                  ($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                    i@14@00)) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                    i@14@00))))
              (or
                (not
                  (<
                    i@14@00
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                      1)))
                (<
                  i@14@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))
                    1)))))
          (or
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                i@14@00))
            (not
              (Seq_contains
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
                  i@14@00))))))
      (or
        (not
          (and
            (<= 0 i@14@00)
            (<
              i@14@00
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
        (and
          (<= 0 i@14@00)
          (<
            i@14@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))))
    :pattern (($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@14@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@14@00)))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4-aux|))
  (forall ((i@14@00 Int)) (!
    (=>
      (and
        (<= 0 i@14@00)
        (<
          i@14@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
      (and
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)) i@14@00))
        (ite
          (<
            i@14@00
            (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))) 1))
          (=
            ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@14@00))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              (+ i@14@00 1)))
          (=
            ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@14@00))
            $Ref.null))))
    :pattern (($FVF.loc_next ($FVF.lookup_next (sm@13@00 s@$ this@0@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@14@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
      i@14@00)))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4|))))
(assert (= result@1@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    (forall ((i@7@00 Int)) (!
      (=>
        (and
          (<= 0 i@7@00)
          (<
            i@7@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
        (and
          (=
            (inv@8@00 s@$ this@0@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@7@00))
            i@7@00)
          (img@9@00 s@$ this@0@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            i@7@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@7@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@9@00 s@$ this@0@00 r)
          (and
            (<= 0 (inv@8@00 s@$ this@0@00 r))
            (<
              (inv@8@00 s@$ this@0@00 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            (inv@8@00 s@$ this@0@00 r))
          r))
      :pattern ((inv@8@00 s@$ this@0@00 r))
      :qid |val-fctOfInv|))
    (forall ((i@10@00 Int)) (!
      (=>
        (and
          (<= 0 i@10@00)
          (<
            i@10@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$)))))
        (and
          (=
            (inv@11@00 s@$ this@0@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
              i@10@00))
            i@10@00)
          (img@12@00 s@$ this@0@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            i@10@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@10@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@12@00 s@$ this@0@00 r)
          (and
            (<= 0 (inv@11@00 s@$ this@0@00 r))
            (<
              (inv@11@00 s@$ this@0@00 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            (inv@11@00 s@$ this@0@00 r))
          r))
      :pattern ((inv@11@00 s@$ this@0@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@12@00 s@$ this@0@00 r)
          (and
            (<= 0 (inv@11@00 s@$ this@0@00 r))
            (<
              (inv@11@00 s@$ this@0@00 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
        (=
          ($FVF.lookup_next (sm@13@00 s@$ this@0@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
      :pattern (($FVF.lookup_next (sm@13@00 s@$ this@0@00) r))
      :qid |qp.fvfResTrgDef1|))
    (=>
      (length%precondition s@$ this@0@00)
      (=
        (length s@$ this@0@00)
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-10|)))
; ---------- FUNCTION itemAt----------
(declare-fun this@2@00 () $Ref)
(declare-fun index@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] 0 <= index
(assert (<= 0 index@3@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 2
(assert (length%precondition ($Snap.first s@$) this@2@00))
(pop) ; 2
; Joined path conditions
(assert (length%precondition ($Snap.first s@$) this@2@00))
(assert (< index@3@00 (length ($Snap.first s@$) this@2@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  (= (itemAt%limited s@$ this@2@00 index@3@00) (itemAt s@$ this@2@00 index@3@00))
  :pattern ((itemAt s@$ this@2@00 index@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  (itemAt%stateless this@2@00 index@3@00)
  :pattern ((itemAt%limited s@$ this@2@00 index@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= 0 index@3@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (length%precondition ($Snap.first s@$) this@2@00))
(assert (< index@3@00 (length ($Snap.first s@$) this@2@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(List(this), write) in this.nodes[index].val)
(set-option :timeout 0)
(push) ; 2
(assert (List%trigger ($Snap.first s@$) this@2@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (not (= this@2@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|this.nodes|)), (j in [0..|this.nodes|)) } { (i in [0..|this.nodes|)), this.nodes[j] } { (j in [0..|this.nodes|)), this.nodes[i] } { this.nodes[i], this.nodes[j] } (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j])
(declare-const i@15@00 Int)
(declare-const j@16@00 Int)
(push) ; 3
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j]
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j)
; [eval] (i in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 4
; [then-branch: 9 | !(i@15@00 in [0..|First:(First:(s@$))|]) | live]
; [else-branch: 9 | i@15@00 in [0..|First:(First:(s@$))|] | live]
(push) ; 5
; [then-branch: 9 | !(i@15@00 in [0..|First:(First:(s@$))|])]
(assert (not
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | i@15@00 in [0..|First:(First:(s@$))|]]
(assert (Seq_contains
  (Seq_range
    0
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
  i@15@00))
; [eval] (j in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 6
; [then-branch: 10 | !(j@16@00 in [0..|First:(First:(s@$))|]) | live]
; [else-branch: 10 | j@16@00 in [0..|First:(First:(s@$))|] | live]
(push) ; 7
; [then-branch: 10 | !(j@16@00 in [0..|First:(First:(s@$))|])]
(assert (not
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | j@16@00 in [0..|First:(First:(s@$))|]]
(assert (Seq_contains
  (Seq_range
    0
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
  j@16@00))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00)
  (not
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00)
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00)
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        j@16@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00))))))
(assert (or
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00)
  (not
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00))))
(push) ; 4
; [then-branch: 11 | i@15@00 in [0..|First:(First:(s@$))|] && j@16@00 in [0..|First:(First:(s@$))|] && i@15@00 != j@16@00 | live]
; [else-branch: 11 | !(i@15@00 in [0..|First:(First:(s@$))|] && j@16@00 in [0..|First:(First:(s@$))|] && i@15@00 != j@16@00) | live]
(push) ; 5
; [then-branch: 11 | i@15@00 in [0..|First:(First:(s@$))|] && j@16@00 in [0..|First:(First:(s@$))|] && i@15@00 != j@16@00]
(assert (and
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00)
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00)
    (not (= i@15@00 j@16@00)))))
; [eval] this.nodes[i] != this.nodes[j]
; [eval] this.nodes[i]
(push) ; 6
(assert (not (>= i@15@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  i@15@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] this.nodes[j]
(push) ; 6
(assert (not (>= j@16@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  j@16@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(i@15@00 in [0..|First:(First:(s@$))|] && j@16@00 in [0..|First:(First:(s@$))|] && i@15@00 != j@16@00)]
(assert (not
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00)
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        j@16@00)
      (not (= i@15@00 j@16@00))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00)
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        j@16@00)
      (not (= i@15@00 j@16@00))))
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00)
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00)
    (not (= i@15@00 j@16@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00)
        (not (= i@15@00 j@16@00)))))
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00)
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        j@16@00)
      (not (= i@15@00 j@16@00))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00)
        (not (= i@15@00 j@16@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00)
        (not (= i@15@00 j@16@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00)
        (not (= i@15@00 j@16@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@16@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00)
        (not (= i@15@00 j@16@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00)
        (not (= i@15@00 j@16@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@15@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@15@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00)
        (not (= i@15@00 j@16@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@15@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00)
        (not (= i@15@00 j@16@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@15@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (=>
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        i@15@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          j@16@00)
        (not (= i@15@00 j@16@00))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@15@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          j@16@00))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@16@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    i@15@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@16@00))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@15@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    j@16@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@15@00))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@15@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(declare-const i@17@00 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 12 | !(0 <= i@17@00) | live]
; [else-branch: 12 | 0 <= i@17@00 | live]
(push) ; 5
; [then-branch: 12 | !(0 <= i@17@00)]
(assert (not (<= 0 i@17@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | 0 <= i@17@00]
(assert (<= 0 i@17@00))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@17@00) (not (<= 0 i@17@00))))
(assert (and
  (<= 0 i@17@00)
  (<
    i@17@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@17@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@18@00 ($Snap $Ref Int $Ref) Int)
(declare-fun img@19@00 ($Snap $Ref Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@17@00 Int)) (!
  (=>
    (and
      (<= 0 i@17@00)
      (<
        i@17@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@17@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@17@00 Int) (i2@17@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@17@00)
        (<
          i1@17@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (and
        (<= 0 i2@17@00)
        (<
          i2@17@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i1@17@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i2@17@00)))
    (= i1@17@00 i2@17@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@17@00 Int)) (!
  (=>
    (and
      (<= 0 i@17@00)
      (<
        i@17@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
    (and
      (=
        (inv@18@00 s@$ this@2@00 index@3@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@17@00))
        i@17@00)
      (img@19@00 s@$ this@2@00 index@3@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@17@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@17@00))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@18@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@18@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        (inv@18@00 s@$ this@2@00 index@3@00 r))
      r))
  :pattern ((inv@18@00 s@$ this@2@00 index@3@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@17@00 Int)) (!
  (=>
    (and
      (<= 0 i@17@00)
      (<
        i@17@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@17@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@17@00))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
(declare-const i@20@00 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 13 | !(0 <= i@20@00) | live]
; [else-branch: 13 | 0 <= i@20@00 | live]
(push) ; 5
; [then-branch: 13 | !(0 <= i@20@00)]
(assert (not (<= 0 i@20@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | 0 <= i@20@00]
(assert (<= 0 i@20@00))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@20@00) (not (<= 0 i@20@00))))
(assert (and
  (<= 0 i@20@00)
  (<
    i@20@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@20@00 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@21@00 ($Snap $Ref Int $Ref) Int)
(declare-fun img@22@00 ($Snap $Ref Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@20@00 Int)) (!
  (=>
    (and
      (<= 0 i@20@00)
      (<
        i@20@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
    (or (<= 0 i@20@00) (not (<= 0 i@20@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@20@00))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@20@00 Int) (i2@20@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@20@00)
        (<
          i1@20@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (and
        (<= 0 i2@20@00)
        (<
          i2@20@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i1@20@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i2@20@00)))
    (= i1@20@00 i2@20@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@20@00 Int)) (!
  (=>
    (and
      (<= 0 i@20@00)
      (<
        i@20@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
    (and
      (=
        (inv@21@00 s@$ this@2@00 index@3@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@20@00))
        i@20@00)
      (img@22@00 s@$ this@2@00 index@3@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@20@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@20@00))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@21@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        (inv@21@00 s@$ this@2@00 index@3@00 r))
      r))
  :pattern ((inv@21@00 s@$ this@2@00 index@3@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@20@00 Int)) (!
  (=>
    (and
      (<= 0 i@20@00)
      (<
        i@20@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@20@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@20@00))
  :qid |next-permImpliesNonNull|)))
(declare-fun sm@23@00 ($Snap $Ref Int) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@21@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
      (<
        (inv@21@00 s@$ this@2@00 index@3@00 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
    ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r) r))
  :pattern ((inv@21@00 s@$ this@2@00 index@3@00 r))
  :qid |quant-u-15|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
  $Snap.unit))
; [eval] (forall i: Int :: { this.nodes[i].next } 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null))
(declare-const i@24@00 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 14 | !(0 <= i@24@00) | live]
; [else-branch: 14 | 0 <= i@24@00 | live]
(push) ; 5
; [then-branch: 14 | !(0 <= i@24@00)]
(assert (not (<= 0 i@24@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | 0 <= i@24@00]
(assert (<= 0 i@24@00))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@24@00) (not (<= 0 i@24@00))))
(push) ; 4
; [then-branch: 15 | 0 <= i@24@00 && i@24@00 < |First:(First:(s@$))| | live]
; [else-branch: 15 | !(0 <= i@24@00 && i@24@00 < |First:(First:(s@$))|) | live]
(push) ; 5
; [then-branch: 15 | 0 <= i@24@00 && i@24@00 < |First:(First:(s@$))|]
(assert (and
  (<= 0 i@24@00)
  (<
    i@24@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
; [eval] (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] (this.nodes[i] in this.nodes)
; [eval] this.nodes[i]
(push) ; 6
(assert (not (>= i@24@00 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 16 | !(First:(First:(s@$))[i@24@00] in First:(First:(s@$))) | live]
; [else-branch: 16 | First:(First:(s@$))[i@24@00] in First:(First:(s@$)) | live]
(push) ; 7
; [then-branch: 16 | !(First:(First:(s@$))[i@24@00] in First:(First:(s@$)))]
(assert (not
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00))))
(pop) ; 7
(push) ; 7
; [else-branch: 16 | First:(First:(s@$))[i@24@00] in First:(First:(s@$))]
(assert (Seq_contains
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
  (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@24@00)))
; [eval] (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] i < |this.nodes| - 1
; [eval] |this.nodes| - 1
; [eval] |this.nodes|
(push) ; 8
; [then-branch: 17 | i@24@00 < |First:(First:(s@$))| - 1 | live]
; [else-branch: 17 | !(i@24@00 < |First:(First:(s@$))| - 1) | live]
(push) ; 9
; [then-branch: 17 | i@24@00 < |First:(First:(s@$))| - 1]
(assert (<
  i@24@00
  (-
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
    1)))
; [eval] this.nodes[i].next == this.nodes[i + 1]
; [eval] this.nodes[i]
(push) ; 10
(assert (not (>= i@24@00 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@22@00 s@$ this@2@00 index@3@00 r)
        (and
          (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
          (<
            (inv@21@00 s@$ this@2@00 index@3@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
      (=
        ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
    :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
    :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
  i@24@00)) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
  i@24@00)))
(push) ; 10
(assert (not (and
  (img@22@00 s@$ this@2@00 index@3@00 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@24@00))
  (and
    (<=
      0
      (inv@21@00 s@$ this@2@00 index@3@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@24@00)))
    (<
      (inv@21@00 s@$ this@2@00 index@3@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@24@00))
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] this.nodes[i + 1]
; [eval] i + 1
(push) ; 10
(assert (not (>= (+ i@24@00 1) 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (<
  (+ i@24@00 1)
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 17 | !(i@24@00 < |First:(First:(s@$))| - 1)]
(assert (not
  (<
    i@24@00
    (-
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
      1))))
; [eval] this.nodes[i].next == null
; [eval] this.nodes[i]
(push) ; 10
(assert (not (>= i@24@00 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@22@00 s@$ this@2@00 index@3@00 r)
        (and
          (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
          (<
            (inv@21@00 s@$ this@2@00 index@3@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
      (=
        ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
    :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
    :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
  i@24@00)) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
  i@24@00)))
(push) ; 10
(assert (not (and
  (img@22@00 s@$ this@2@00 index@3@00 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@24@00))
  (and
    (<=
      0
      (inv@21@00 s@$ this@2@00 index@3@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@24@00)))
    (<
      (inv@21@00 s@$ this@2@00 index@3@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@24@00))
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@21@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (=>
  (<
    i@24@00
    (-
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
      1))
  (and
    (<
      i@24@00
      (-
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
        1))
    ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00)))))
; Joined path conditions
(assert (=>
  (not
    (<
      i@24@00
      (-
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
        1)))
  (and
    (not
      (<
        i@24@00
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
          1)))
    ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00)))))
(assert (or
  (not
    (<
      i@24@00
      (-
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
        1)))
  (<
    i@24@00
    (-
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
      1))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@21@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (=>
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00))
  (and
    (Seq_contains
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@24@00))
    (=>
      (<
        i@24@00
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
          1))
      (and
        (<
          i@24@00
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
            1))
        ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@24@00)) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@24@00))))
    (=>
      (not
        (<
          i@24@00
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
            1)))
      (and
        (not
          (<
            i@24@00
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
              1)))
        ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@24@00)) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@24@00))))
    (or
      (not
        (<
          i@24@00
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
            1)))
      (<
        i@24@00
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
          1))))))
(assert (or
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00))
  (not
    (Seq_contains
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@24@00)))))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(0 <= i@24@00 && i@24@00 < |First:(First:(s@$))|)]
(assert (not
  (and
    (<= 0 i@24@00)
    (<
      i@24@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@21@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (=>
  (and
    (<= 0 i@24@00)
    (<
      i@24@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
  (and
    (<= 0 i@24@00)
    (<
      i@24@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
    (=>
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@24@00))
      (and
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@24@00))
        (=>
          (<
            i@24@00
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
              1))
          (and
            (<
              i@24@00
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                1))
            ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@24@00)) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@24@00))))
        (=>
          (not
            (<
              i@24@00
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                1)))
          (and
            (not
              (<
                i@24@00
                (-
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                  1)))
            ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@24@00)) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@24@00))))
        (or
          (not
            (<
              i@24@00
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                1)))
          (<
            i@24@00
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
              1)))))
    (or
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@24@00))
      (not
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@24@00)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@24@00)
      (<
        i@24@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
  (and
    (<= 0 i@24@00)
    (<
      i@24@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@21@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :qid |qp.fvfResTrgDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@24@00 Int)) (!
  (and
    (or (<= 0 i@24@00) (not (<= 0 i@24@00)))
    (=>
      (and
        (<= 0 i@24@00)
        (<
          i@24@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (and
        (<= 0 i@24@00)
        (<
          i@24@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
        (=>
          (Seq_contains
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@24@00))
          (and
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                i@24@00))
            (=>
              (<
                i@24@00
                (-
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                  1))
              (and
                (<
                  i@24@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                    1))
                ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                  i@24@00)) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                  i@24@00))))
            (=>
              (not
                (<
                  i@24@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                    1)))
              (and
                (not
                  (<
                    i@24@00
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                      1)))
                ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                  i@24@00)) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                  i@24@00))))
            (or
              (not
                (<
                  i@24@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                    1)))
              (<
                i@24@00
                (-
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                  1)))))
        (or
          (Seq_contains
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@24@00))
          (not
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                i@24@00))))))
    (or
      (not
        (and
          (<= 0 i@24@00)
          (<
            i@24@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
      (and
        (<= 0 i@24@00)
        (<
          i@24@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@24@00)) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@24@00)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4-aux|)))
(assert (forall ((i@24@00 Int)) (!
  (=>
    (and
      (<= 0 i@24@00)
      (<
        i@24@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
    (and
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@24@00))
      (ite
        (<
          i@24@00
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
            1))
        (=
          ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@24@00))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (+ i@24@00 1)))
        (=
          ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@24@00))
          $Ref.null))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@24@00)) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    i@24@00)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4|)))
; [eval] this.nodes[index]
(push) ; 3
(assert (not (>= index@3@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  index@3@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@19@00 s@$ this@2@00 index@3@00 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    index@3@00))
  (and
    (<=
      0
      (inv@18@00 s@$ this@2@00 index@3@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        index@3@00)))
    (<
      (inv@18@00 s@$ this@2@00 index@3@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        index@3@00))
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))))
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
      (img@19@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@18@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@18@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        (inv@18@00 s@$ this@2@00 index@3@00 r))
      r))
  :pattern ((inv@18@00 s@$ this@2@00 index@3@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@21@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        (inv@21@00 s@$ this@2@00 index@3@00 r))
      r))
  :pattern ((inv@21@00 s@$ this@2@00 index@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ this@2@00 index@3@00 r)
      (and
        (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@21@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
    (=
      ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
  :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (and
  (List%trigger ($Snap.first s@$) this@2@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (not (= this@2@00 $Ref.null))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.first s@$))) $Snap.unit)
  (forall ((i@15@00 Int) (j@16@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              i@15@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)
              (not (= i@15@00 j@16@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@15@00 Int) (j@16@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              i@15@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)
              (not (= i@15@00 j@16@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@15@00 Int) (j@16@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              i@15@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)
              (not (= i@15@00 j@16@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@16@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@16@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@15@00 Int) (j@16@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              i@15@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)
              (not (= i@15@00 j@16@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@16@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@15@00 Int) (j@16@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              i@15@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)
              (not (= i@15@00 j@16@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@15@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@15@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@15@00 Int) (j@16@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              i@15@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)
              (not (= i@15@00 j@16@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@15@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@15@00 Int) (j@16@00 Int)) (!
    (and
      (=>
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (or
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)))))
      (or
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (not
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)))
      (=>
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (or
        (not
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              i@15@00)
            (and
              (Seq_contains
                (Seq_range
                  0
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
                j@16@00)
              (not (= i@15@00 j@16@00)))))
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            i@15@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
              j@16@00)
            (not (= i@15@00 j@16@00))))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@15@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@16@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|))
  (forall ((i@15@00 Int) (j@16@00 Int)) (!
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          i@15@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
            j@16@00)
          (not (= i@15@00 j@16@00))))
      (not
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@15@00)
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            j@16@00))))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@16@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      i@15@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@16@00))
    :pattern ((Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@15@00))
    :pattern ((Seq_contains_trigger
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
      j@16@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@15@00))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@15@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      j@16@00))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126|))
  (=
    ($Snap.second ($Snap.second ($Snap.first s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
  (forall ((i@17@00 Int)) (!
    (=>
      (and
        (<= 0 i@17@00)
        (<
          i@17@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (or (<= 0 i@17@00) (not (<= 0 i@17@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@17@00))
    :qid |val-aux|))))
(assert (and
  (forall ((i@17@00 Int)) (!
    (=>
      (and
        (<= 0 i@17@00)
        (<
          i@17@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (and
        (=
          (inv@18@00 s@$ this@2@00 index@3@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@17@00))
          i@17@00)
        (img@19@00 s@$ this@2@00 index@3@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@17@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@17@00))
    :qid |quant-u-12|))
  (forall ((i@17@00 Int)) (!
    (=>
      (and
        (<= 0 i@17@00)
        (<
          i@17@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (not
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@17@00)
          $Ref.null)))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@17@00))
    :qid |val-permImpliesNonNull|))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
  (forall ((i@20@00 Int)) (!
    (=>
      (and
        (<= 0 i@20@00)
        (<
          i@20@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (or (<= 0 i@20@00) (not (<= 0 i@20@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@20@00))
    :qid |next-aux|))))
(assert (and
  (forall ((i@20@00 Int)) (!
    (=>
      (and
        (<= 0 i@20@00)
        (<
          i@20@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (and
        (=
          (inv@21@00 s@$ this@2@00 index@3@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@20@00))
          i@20@00)
        (img@22@00 s@$ this@2@00 index@3@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@20@00))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@20@00))
    :qid |quant-u-14|))
  (forall ((i@20@00 Int)) (!
    (=>
      (and
        (<= 0 i@20@00)
        (<
          i@20@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (not
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@20@00)
          $Ref.null)))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@20@00))
    :qid |next-permImpliesNonNull|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
        (<
          (inv@21@00 s@$ this@2@00 index@3@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r) r))
    :pattern ((inv@21@00 s@$ this@2@00 index@3@00 r))
    :qid |quant-u-15|))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    $Snap.unit)
  (forall ((i@24@00 Int)) (!
    (and
      (or (<= 0 i@24@00) (not (<= 0 i@24@00)))
      (=>
        (and
          (<= 0 i@24@00)
          (<
            i@24@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
        (and
          (<= 0 i@24@00)
          (<
            i@24@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (=>
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                i@24@00))
            (and
              (Seq_contains
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                  i@24@00))
              (=>
                (<
                  i@24@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                    1))
                (and
                  (<
                    i@24@00
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                      1))
                  ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                    i@24@00)) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                    i@24@00))))
              (=>
                (not
                  (<
                    i@24@00
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                      1)))
                (and
                  (not
                    (<
                      i@24@00
                      (-
                        (Seq_length
                          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                        1)))
                  ($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                    i@24@00)) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                    i@24@00))))
              (or
                (not
                  (<
                    i@24@00
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                      1)))
                (<
                  i@24@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
                    1)))))
          (or
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                i@24@00))
            (not
              (Seq_contains
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
                  i@24@00))))))
      (or
        (not
          (and
            (<= 0 i@24@00)
            (<
              i@24@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
        (and
          (<= 0 i@24@00)
          (<
            i@24@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))))
    :pattern (($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00)))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4-aux|))
  (forall ((i@24@00 Int)) (!
    (=>
      (and
        (<= 0 i@24@00)
        (<
          i@24@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
      (and
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@24@00))
        (ite
          (<
            i@24@00
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))
              1))
          (=
            ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@24@00))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              (+ i@24@00 1)))
          (=
            ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@24@00))
            $Ref.null))))
    :pattern (($FVF.loc_next ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
      i@24@00)))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4|))))
(assert (=
  result@4@00
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
    index@3@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  (and
    (forall ((i@17@00 Int)) (!
      (=>
        (and
          (<= 0 i@17@00)
          (<
            i@17@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
        (and
          (=
            (inv@18@00 s@$ this@2@00 index@3@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@17@00))
            i@17@00)
          (img@19@00 s@$ this@2@00 index@3@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@17@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@17@00))
      :qid |quant-u-12|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@19@00 s@$ this@2@00 index@3@00 r)
          (and
            (<= 0 (inv@18@00 s@$ this@2@00 index@3@00 r))
            (<
              (inv@18@00 s@$ this@2@00 index@3@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (inv@18@00 s@$ this@2@00 index@3@00 r))
          r))
      :pattern ((inv@18@00 s@$ this@2@00 index@3@00 r))
      :qid |val-fctOfInv|))
    (forall ((i@20@00 Int)) (!
      (=>
        (and
          (<= 0 i@20@00)
          (<
            i@20@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$))))))
        (and
          (=
            (inv@21@00 s@$ this@2@00 index@3@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
              i@20@00))
            i@20@00)
          (img@22@00 s@$ this@2@00 index@3@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@20@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@20@00))
      :qid |quant-u-14|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@22@00 s@$ this@2@00 index@3@00 r)
          (and
            (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
            (<
              (inv@21@00 s@$ this@2@00 index@3@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (inv@21@00 s@$ this@2@00 index@3@00 r))
          r))
      :pattern ((inv@21@00 s@$ this@2@00 index@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@22@00 s@$ this@2@00 index@3@00 r)
          (and
            (<= 0 (inv@21@00 s@$ this@2@00 index@3@00 r))
            (<
              (inv@21@00 s@$ this@2@00 index@3@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))))
        (=
          ($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
      :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
      :qid |qp.fvfValDef2|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
      :pattern (($FVF.lookup_next (sm@23@00 s@$ this@2@00 index@3@00) r))
      :qid |qp.fvfResTrgDef3|))
    (=>
      (itemAt%precondition s@$ this@2@00 index@3@00)
      (=
        (itemAt s@$ this@2@00 index@3@00)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          index@3@00)))))
  :pattern ((itemAt s@$ this@2@00 index@3@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  true
  :pattern ((itemAt s@$ this@2@00 index@3@00))
  :qid |quant-u-17|)))
; ---------- List ----------
(declare-const this@25@00 $Ref)
(push) ; 1
(declare-const $t@26@00 $Snap)
(assert (= $t@26@00 ($Snap.combine ($Snap.first $t@26@00) ($Snap.second $t@26@00))))
(assert (not (= this@25@00 $Ref.null)))
(assert (=
  ($Snap.second $t@26@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@00))
    ($Snap.second ($Snap.second $t@26@00)))))
(assert (= ($Snap.first ($Snap.second $t@26@00)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|this.nodes|)), (j in [0..|this.nodes|)) } { (i in [0..|this.nodes|)), this.nodes[j] } { (j in [0..|this.nodes|)), this.nodes[i] } { this.nodes[i], this.nodes[j] } (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j])
(declare-const i@27@00 Int)
(declare-const j@28@00 Int)
(push) ; 2
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j]
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j)
; [eval] (i in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 3
; [then-branch: 18 | !(i@27@00 in [0..|First:($t@26@00)|]) | live]
; [else-branch: 18 | i@27@00 in [0..|First:($t@26@00)|] | live]
(push) ; 4
; [then-branch: 18 | !(i@27@00 in [0..|First:($t@26@00)|])]
(assert (not
  (Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 18 | i@27@00 in [0..|First:($t@26@00)|]]
(assert (Seq_contains
  (Seq_range
    0
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
  i@27@00))
; [eval] (j in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 5
; [then-branch: 19 | !(j@28@00 in [0..|First:($t@26@00)|]) | live]
; [else-branch: 19 | j@28@00 in [0..|First:($t@26@00)|] | live]
(push) ; 6
; [then-branch: 19 | !(j@28@00 in [0..|First:($t@26@00)|])]
(assert (not
  (Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 19 | j@28@00 in [0..|First:($t@26@00)|]]
(assert (Seq_contains
  (Seq_range
    0
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
  j@28@00))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00)
  (not
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
      j@28@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00)
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
      i@27@00)
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        j@28@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00))))))
(assert (or
  (Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00)
  (not
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
      i@27@00))))
(push) ; 3
; [then-branch: 20 | i@27@00 in [0..|First:($t@26@00)|] && j@28@00 in [0..|First:($t@26@00)|] && i@27@00 != j@28@00 | live]
; [else-branch: 20 | !(i@27@00 in [0..|First:($t@26@00)|] && j@28@00 in [0..|First:($t@26@00)|] && i@27@00 != j@28@00) | live]
(push) ; 4
; [then-branch: 20 | i@27@00 in [0..|First:($t@26@00)|] && j@28@00 in [0..|First:($t@26@00)|] && i@27@00 != j@28@00]
(assert (and
  (Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00)
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
      j@28@00)
    (not (= i@27@00 j@28@00)))))
; [eval] this.nodes[i] != this.nodes[j]
; [eval] this.nodes[i]
(push) ; 5
(assert (not (>= i@27@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@27@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this.nodes[j]
(push) ; 5
(assert (not (>= j@28@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@28@00 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 20 | !(i@27@00 in [0..|First:($t@26@00)|] && j@28@00 in [0..|First:($t@26@00)|] && i@27@00 != j@28@00)]
(assert (not
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
      i@27@00)
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        j@28@00)
      (not (= i@27@00 j@28@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
      i@27@00)
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        j@28@00)
      (not (= i@27@00 j@28@00))))
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
      i@27@00)
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
      j@28@00)
    (not (= i@27@00 j@28@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00)
        (not (= i@27@00 j@28@00)))))
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
      i@27@00)
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        j@28@00)
      (not (= i@27@00 j@28@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@27@00 Int) (j@28@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00)
        (not (= i@27@00 j@28@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            i@27@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)
            (not (= i@27@00 j@28@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@27@00 Int) (j@28@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00)
        (not (= i@27@00 j@28@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            i@27@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)
            (not (= i@27@00 j@28@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@27@00 Int) (j@28@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00)
        (not (= i@27@00 j@28@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            i@27@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)
            (not (= i@27@00 j@28@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    j@28@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    j@28@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@27@00 Int) (j@28@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00)
        (not (= i@27@00 j@28@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            i@27@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)
            (not (= i@27@00 j@28@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    j@28@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@27@00 Int) (j@28@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00)
        (not (= i@27@00 j@28@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            i@27@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)
            (not (= i@27@00 j@28@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@27@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@27@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@27@00 Int) (j@28@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00)
        (not (= i@27@00 j@28@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            i@27@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)
            (not (= i@27@00 j@28@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@27@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@27@00 Int) (j@28@00 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (or
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)))))
    (or
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)))
    (=>
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00)
        (not (= i@27@00 j@28@00))))
    (or
      (not
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            i@27@00)
          (and
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
              j@28@00)
            (not (= i@27@00 j@28@00)))))
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          i@27@00)
        (and
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
            j@28@00)
          (not (= i@27@00 j@28@00))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@27@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    j@28@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126-aux|)))
(assert (forall ((i@27@00 Int) (j@28@00 Int)) (!
  (=>
    (and
      (Seq_contains
        (Seq_range
          0
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        i@27@00)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
          j@28@00)
        (not (= i@27@00 j@28@00))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@27@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          j@28@00))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    j@28@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    i@27@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    j@28@00))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@27@00))
  :pattern ((Seq_contains_trigger
    (Seq_range
      0
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    j@28@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@27@00))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@27@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    j@28@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@16@8@16@126|)))
(assert (=
  ($Snap.second ($Snap.second $t@26@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@00))))))
(declare-const i@29@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 21 | !(0 <= i@29@00) | live]
; [else-branch: 21 | 0 <= i@29@00 | live]
(push) ; 4
; [then-branch: 21 | !(0 <= i@29@00)]
(assert (not (<= 0 i@29@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 21 | 0 <= i@29@00]
(assert (<= 0 i@29@00))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@29@00) (not (<= 0 i@29@00))))
(assert (and
  (<= 0 i@29@00)
  (<
    i@29@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
; [eval] this.nodes[i]
(push) ; 3
(assert (not (>= i@29@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@30@00 ($Ref) Int)
(declare-fun img@31@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@29@00 Int)) (!
  (=>
    (and
      (<= 0 i@29@00)
      (<
        i@29@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
    (or (<= 0 i@29@00) (not (<= 0 i@29@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@29@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@29@00 Int) (i2@29@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@29@00)
        (<
          i1@29@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
      (and
        (<= 0 i2@29@00)
        (<
          i2@29@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i1@29@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i2@29@00)))
    (= i1@29@00 i2@29@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@29@00 Int)) (!
  (=>
    (and
      (<= 0 i@29@00)
      (<
        i@29@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
    (and
      (=
        (inv@30@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@29@00))
        i@29@00)
      (img@31@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        i@29@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@29@00))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 r)
      (and
        (<= 0 (inv@30@00 r))
        (<
          (inv@30@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        (inv@30@00 r))
      r))
  :pattern ((inv@30@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@29@00 Int)) (!
  (=>
    (and
      (<= 0 i@29@00)
      (<
        i@29@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@29@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@29@00))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@26@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@00)))))))
(declare-const i@32@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 22 | !(0 <= i@32@00) | live]
; [else-branch: 22 | 0 <= i@32@00 | live]
(push) ; 4
; [then-branch: 22 | !(0 <= i@32@00)]
(assert (not (<= 0 i@32@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 22 | 0 <= i@32@00]
(assert (<= 0 i@32@00))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@32@00) (not (<= 0 i@32@00))))
(assert (and
  (<= 0 i@32@00)
  (<
    i@32@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
; [eval] this.nodes[i]
(push) ; 3
(assert (not (>= i@32@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@33@00 ($Ref) Int)
(declare-fun img@34@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@32@00 Int)) (!
  (=>
    (and
      (<= 0 i@32@00)
      (<
        i@32@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
    (or (<= 0 i@32@00) (not (<= 0 i@32@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@32@00))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@32@00 Int) (i2@32@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@32@00)
        (<
          i1@32@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
      (and
        (<= 0 i2@32@00)
        (<
          i2@32@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i1@32@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i2@32@00)))
    (= i1@32@00 i2@32@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@32@00 Int)) (!
  (=>
    (and
      (<= 0 i@32@00)
      (<
        i@32@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
    (and
      (=
        (inv@33@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@32@00))
        i@32@00)
      (img@34@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        i@32@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@32@00))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 r)
      (and
        (<= 0 (inv@33@00 r))
        (<
          (inv@33@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        (inv@33@00 r))
      r))
  :pattern ((inv@33@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@32@00 Int)) (!
  (=>
    (and
      (<= 0 i@32@00)
      (<
        i@32@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@32@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@32@00))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@35@00 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 r)
      (and
        (<= 0 (inv@33@00 r))
        (<
          (inv@33@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
    (=
      ($FVF.lookup_next (as sm@35@00  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r)))
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r) r)
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@33@00 r))
      (<
        (inv@33@00 r)
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
    ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) r) r))
  :pattern ((inv@33@00 r))
  :qid |quant-u-22|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@00))))
  $Snap.unit))
; [eval] (forall i: Int :: { this.nodes[i].next } 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null))
(declare-const i@36@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 23 | !(0 <= i@36@00) | live]
; [else-branch: 23 | 0 <= i@36@00 | live]
(push) ; 4
; [then-branch: 23 | !(0 <= i@36@00)]
(assert (not (<= 0 i@36@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 23 | 0 <= i@36@00]
(assert (<= 0 i@36@00))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@36@00) (not (<= 0 i@36@00))))
(push) ; 3
; [then-branch: 24 | 0 <= i@36@00 && i@36@00 < |First:($t@26@00)| | live]
; [else-branch: 24 | !(0 <= i@36@00 && i@36@00 < |First:($t@26@00)|) | live]
(push) ; 4
; [then-branch: 24 | 0 <= i@36@00 && i@36@00 < |First:($t@26@00)|]
(assert (and
  (<= 0 i@36@00)
  (<
    i@36@00
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
; [eval] (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] (this.nodes[i] in this.nodes)
; [eval] this.nodes[i]
(push) ; 5
(assert (not (>= i@36@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 25 | !(First:($t@26@00)[i@36@00] in First:($t@26@00)) | live]
; [else-branch: 25 | First:($t@26@00)[i@36@00] in First:($t@26@00) | live]
(push) ; 6
; [then-branch: 25 | !(First:($t@26@00)[i@36@00] in First:($t@26@00))]
(assert (not
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)) i@36@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 25 | First:($t@26@00)[i@36@00] in First:($t@26@00)]
(assert (Seq_contains
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)) i@36@00)))
; [eval] (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] i < |this.nodes| - 1
; [eval] |this.nodes| - 1
; [eval] |this.nodes|
(push) ; 7
; [then-branch: 26 | i@36@00 < |First:($t@26@00)| - 1 | live]
; [else-branch: 26 | !(i@36@00 < |First:($t@26@00)| - 1) | live]
(push) ; 8
; [then-branch: 26 | i@36@00 < |First:($t@26@00)| - 1]
(assert (<
  i@36@00
  (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))) 1)))
; [eval] this.nodes[i].next == this.nodes[i + 1]
; [eval] this.nodes[i]
(push) ; 9
(assert (not (>= i@36@00 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@34@00 r)
        (and
          (<= 0 (inv@33@00 r))
          (<
            (inv@33@00 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
      (=
        ($FVF.lookup_next (as sm@35@00  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r)))
    :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r) r)
    :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
  i@36@00)) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
  i@36@00)))
(push) ; 9
(assert (not (and
  (img@34@00 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@36@00))
  (and
    (<=
      0
      (inv@33@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        i@36@00)))
    (<
      (inv@33@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        i@36@00))
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.nodes[i + 1]
; [eval] i + 1
(push) ; 9
(assert (not (>= (+ i@36@00 1) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (<
  (+ i@36@00 1)
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 26 | !(i@36@00 < |First:($t@26@00)| - 1)]
(assert (not
  (<
    i@36@00
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))) 1))))
; [eval] this.nodes[i].next == null
; [eval] this.nodes[i]
(push) ; 9
(assert (not (>= i@36@00 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@34@00 r)
        (and
          (<= 0 (inv@33@00 r))
          (<
            (inv@33@00 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
      (=
        ($FVF.lookup_next (as sm@35@00  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r)))
    :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r) r)
    :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
  i@36@00)) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
  i@36@00)))
(push) ; 9
(assert (not (and
  (img@34@00 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@36@00))
  (and
    (<=
      0
      (inv@33@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        i@36@00)))
    (<
      (inv@33@00 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        i@36@00))
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 r)
      (and
        (<= 0 (inv@33@00 r))
        (<
          (inv@33@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
    (=
      ($FVF.lookup_next (as sm@35@00  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r)))
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r) r)
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (<
    i@36@00
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))) 1))
  (and
    (<
      i@36@00
      (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))) 1))
    ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
      i@36@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
      i@36@00)))))
; Joined path conditions
(assert (=>
  (not
    (<
      i@36@00
      (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))) 1)))
  (and
    (not
      (<
        i@36@00
        (-
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
          1)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
      i@36@00)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
      i@36@00)))))
(assert (or
  (not
    (<
      i@36@00
      (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))) 1)))
  (<
    i@36@00
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))) 1))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 r)
      (and
        (<= 0 (inv@33@00 r))
        (<
          (inv@33@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
    (=
      ($FVF.lookup_next (as sm@35@00  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r)))
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r) r)
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)) i@36@00))
  (and
    (Seq_contains
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)) i@36@00))
    (=>
      (<
        i@36@00
        (-
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
          1))
      (and
        (<
          i@36@00
          (-
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
            1))
        ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@36@00)) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@36@00))))
    (=>
      (not
        (<
          i@36@00
          (-
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
            1)))
      (and
        (not
          (<
            i@36@00
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
              1)))
        ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@36@00)) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@36@00))))
    (or
      (not
        (<
          i@36@00
          (-
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
            1)))
      (<
        i@36@00
        (-
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
          1))))))
(assert (or
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)) i@36@00))
  (not
    (Seq_contains
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)) i@36@00)))))
(pop) ; 4
(push) ; 4
; [else-branch: 24 | !(0 <= i@36@00 && i@36@00 < |First:($t@26@00)|)]
(assert (not
  (and
    (<= 0 i@36@00)
    (<
      i@36@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 r)
      (and
        (<= 0 (inv@33@00 r))
        (<
          (inv@33@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
    (=
      ($FVF.lookup_next (as sm@35@00  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r)))
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r) r)
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (and
    (<= 0 i@36@00)
    (<
      i@36@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
  (and
    (<= 0 i@36@00)
    (<
      i@36@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
    (=>
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@36@00))
      (and
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
            i@36@00))
        (=>
          (<
            i@36@00
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
              1))
          (and
            (<
              i@36@00
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                1))
            ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
              i@36@00)) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
              i@36@00))))
        (=>
          (not
            (<
              i@36@00
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                1)))
          (and
            (not
              (<
                i@36@00
                (-
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                  1)))
            ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
              i@36@00)) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
              i@36@00))))
        (or
          (not
            (<
              i@36@00
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                1)))
          (<
            i@36@00
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
              1)))))
    (or
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@36@00))
      (not
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
            i@36@00)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@36@00)
      (<
        i@36@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
  (and
    (<= 0 i@36@00)
    (<
      i@36@00
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 r)
      (and
        (<= 0 (inv@33@00 r))
        (<
          (inv@33@00 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
    (=
      ($FVF.lookup_next (as sm@35@00  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r)))
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))) r) r)
  :pattern (($FVF.lookup_next (as sm@35@00  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@36@00 Int)) (!
  (and
    (or (<= 0 i@36@00) (not (<= 0 i@36@00)))
    (=>
      (and
        (<= 0 i@36@00)
        (<
          i@36@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
      (and
        (<= 0 i@36@00)
        (<
          i@36@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))
        (=>
          (Seq_contains
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
              i@36@00))
          (and
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
                i@36@00))
            (=>
              (<
                i@36@00
                (-
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                  1))
              (and
                (<
                  i@36@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                    1))
                ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
                  i@36@00)) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
                  i@36@00))))
            (=>
              (not
                (<
                  i@36@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                    1)))
              (and
                (not
                  (<
                    i@36@00
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                      1)))
                ($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
                  i@36@00)) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
                  i@36@00))))
            (or
              (not
                (<
                  i@36@00
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                    1)))
              (<
                i@36@00
                (-
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
                  1)))))
        (or
          (Seq_contains
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
              i@36@00))
          (not
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
                i@36@00))))))
    (or
      (not
        (and
          (<= 0 i@36@00)
          (<
            i@36@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))))))
      (and
        (<= 0 i@36@00)
        (<
          i@36@00
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@36@00)) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@36@00)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4-aux|)))
(assert (forall ((i@36@00 Int)) (!
  (=>
    (and
      (<= 0 i@36@00)
      (<
        i@36@00
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))))
    (and
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
          i@36@00))
      (ite
        (<
          i@36@00
          (-
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00)))
            1))
        (=
          ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
            i@36@00))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
            (+ i@36@00 1)))
        (=
          ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
            i@36@00))
          $Ref.null))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@35@00  $FVF<next>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@36@00)) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@26@00))
    i@36@00)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/linked-list-qp-append.vpr@19@7@21@4|)))
(pop) ; 1
