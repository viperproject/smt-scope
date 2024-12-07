(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0768.vpr
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
(declare-sort Seq<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort tree 0)
(declare-sort block 0)
(declare-sort WellFoundedOrder<Int> 0)
(declare-sort IntWellFoundedOrder 0)
(declare-sort pointer 0)
(declare-sort WellFoundedOrder<tree> 0)
(declare-sort treeWellFoundedOrder 0)
(declare-sort $FVF<ref> 0)
(declare-sort $FVF<x> 0)
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
(declare-fun $SortWrappers.treeTo$Snap (tree) $Snap)
(declare-fun $SortWrappers.$SnapTotree ($Snap) tree)
(assert (forall ((x tree)) (!
    (= x ($SortWrappers.$SnapTotree($SortWrappers.treeTo$Snap x)))
    :pattern (($SortWrappers.treeTo$Snap x))
    :qid |$Snap.$SnapTotreeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.treeTo$Snap($SortWrappers.$SnapTotree x)))
    :pattern (($SortWrappers.$SnapTotree x))
    :qid |$Snap.treeTo$SnapTotree|
    )))
(declare-fun $SortWrappers.blockTo$Snap (block) $Snap)
(declare-fun $SortWrappers.$SnapToblock ($Snap) block)
(assert (forall ((x block)) (!
    (= x ($SortWrappers.$SnapToblock($SortWrappers.blockTo$Snap x)))
    :pattern (($SortWrappers.blockTo$Snap x))
    :qid |$Snap.$SnapToblockTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.blockTo$Snap($SortWrappers.$SnapToblock x)))
    :pattern (($SortWrappers.$SnapToblock x))
    :qid |$Snap.blockTo$SnapToblock|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Int>To$Snap (WellFoundedOrder<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Int> ($Snap) WellFoundedOrder<Int>)
(assert (forall ((x WellFoundedOrder<Int>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Int>($SortWrappers.WellFoundedOrder<Int>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Int>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Int>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Int> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Int> x))
    :qid |$Snap.WellFoundedOrder<Int>To$SnapToWellFoundedOrder<Int>|
    )))
(declare-fun $SortWrappers.IntWellFoundedOrderTo$Snap (IntWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToIntWellFoundedOrder ($Snap) IntWellFoundedOrder)
(assert (forall ((x IntWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToIntWellFoundedOrder($SortWrappers.IntWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.IntWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToIntWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntWellFoundedOrderTo$Snap($SortWrappers.$SnapToIntWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToIntWellFoundedOrder x))
    :qid |$Snap.IntWellFoundedOrderTo$SnapToIntWellFoundedOrder|
    )))
(declare-fun $SortWrappers.pointerTo$Snap (pointer) $Snap)
(declare-fun $SortWrappers.$SnapTopointer ($Snap) pointer)
(assert (forall ((x pointer)) (!
    (= x ($SortWrappers.$SnapTopointer($SortWrappers.pointerTo$Snap x)))
    :pattern (($SortWrappers.pointerTo$Snap x))
    :qid |$Snap.$SnapTopointerTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.pointerTo$Snap($SortWrappers.$SnapTopointer x)))
    :pattern (($SortWrappers.$SnapTopointer x))
    :qid |$Snap.pointerTo$SnapTopointer|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<tree>To$Snap (WellFoundedOrder<tree>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<tree> ($Snap) WellFoundedOrder<tree>)
(assert (forall ((x WellFoundedOrder<tree>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<tree>($SortWrappers.WellFoundedOrder<tree>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<tree>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<tree>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<tree>To$Snap($SortWrappers.$SnapToWellFoundedOrder<tree> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<tree> x))
    :qid |$Snap.WellFoundedOrder<tree>To$SnapToWellFoundedOrder<tree>|
    )))
(declare-fun $SortWrappers.treeWellFoundedOrderTo$Snap (treeWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapTotreeWellFoundedOrder ($Snap) treeWellFoundedOrder)
(assert (forall ((x treeWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapTotreeWellFoundedOrder($SortWrappers.treeWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.treeWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapTotreeWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.treeWellFoundedOrderTo$Snap($SortWrappers.$SnapTotreeWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapTotreeWellFoundedOrder x))
    :qid |$Snap.treeWellFoundedOrderTo$SnapTotreeWellFoundedOrder|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<ref>To$Snap ($FVF<ref>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<ref> ($Snap) $FVF<ref>)
(assert (forall ((x $FVF<ref>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<ref>($SortWrappers.$FVF<ref>To$Snap x)))
    :pattern (($SortWrappers.$FVF<ref>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<ref>To$Snap($SortWrappers.$SnapTo$FVF<ref> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<ref> x))
    :qid |$Snap.$FVF<ref>To$SnapTo$FVF<ref>|
    )))
(declare-fun $SortWrappers.$FVF<x>To$Snap ($FVF<x>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<x> ($Snap) $FVF<x>)
(assert (forall ((x $FVF<x>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<x>($SortWrappers.$FVF<x>To$Snap x)))
    :pattern (($SortWrappers.$FVF<x>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<x>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<x>To$Snap($SortWrappers.$SnapTo$FVF<x> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<x> x))
    :qid |$Snap.$FVF<x>To$SnapTo$FVF<x>|
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
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_contains_trigger (Seq<Int> Int) Bool)
(declare-fun Seq_skolem (Seq<Int> Int) Int)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_skolem_diff (Seq<Int> Seq<Int>) Int)
(declare-fun Seq_range (Int Int) Seq<Int>)
(declare-fun decreasing<Bool> (tree tree) Bool)
(declare-fun bounded<Bool> (tree) Bool)
(declare-fun leaf<tree> (Int) tree)
(declare-fun node<tree> (tree tree) tree)
(declare-fun get_tree_value<Int> (tree) Int)
(declare-fun get_tree_left<tree> (tree) tree)
(declare-fun get_tree_right<tree> (tree) tree)
(declare-fun tree_tag<Int> (tree) Int)
(declare-fun decreasing<Bool> (Int Int) Bool)
(declare-fun bounded<Bool> (Int) Bool)
(declare-fun pointer_of<pointer> (block Int) pointer)
(declare-fun pointer_block<block> (pointer) block)
(declare-fun pointer_offset<Int> (pointer) Int)
(declare-fun block_length<Int> (block) Int)
(declare-fun loc<Ref> (block Int) $Ref)
(declare-fun loc_inv_1<block> ($Ref) block)
(declare-fun loc_inv_2<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [ref: Ref]
(declare-fun $FVF.domain_ref ($FVF<ref>) Set<$Ref>)
(declare-fun $FVF.lookup_ref ($FVF<ref> $Ref) $Ref)
(declare-fun $FVF.after_ref ($FVF<ref> $FVF<ref>) Bool)
(declare-fun $FVF.loc_ref ($Ref $Ref) Bool)
(declare-fun $FVF.perm_ref ($FPM $Ref) $Perm)
(declare-const $fvfTOP_ref $FVF<ref>)
; /field_value_functions_declarations.smt2 [x: Int]
(declare-fun $FVF.domain_x ($FVF<x>) Set<$Ref>)
(declare-fun $FVF.lookup_x ($FVF<x> $Ref) Int)
(declare-fun $FVF.after_x ($FVF<x> $FVF<x>) Bool)
(declare-fun $FVF.loc_x (Int $Ref) Bool)
(declare-fun $FVF.perm_x ($FPM $Ref) $Perm)
(declare-const $fvfTOP_x $FVF<x>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun id ($Snap Int) Int)
(declare-fun id%limited ($Snap Int) Int)
(declare-fun id%stateless (Int) Bool)
(declare-fun id%precondition ($Snap Int) Bool)
(declare-fun ptr_add ($Snap pointer Int) pointer)
(declare-fun ptr_add%limited ($Snap pointer Int) pointer)
(declare-fun ptr_add%stateless (pointer Int) Bool)
(declare-fun ptr_add%precondition ($Snap pointer Int) Bool)
(declare-fun ptr_deref ($Snap pointer) $Ref)
(declare-fun ptr_deref%limited ($Snap pointer) $Ref)
(declare-fun ptr_deref%stateless (pointer) Bool)
(declare-fun ptr_deref%precondition ($Snap pointer) Bool)
(declare-fun leafCount ($Snap tree) Int)
(declare-fun leafCount%limited ($Snap tree) Int)
(declare-fun leafCount%stateless (tree) Bool)
(declare-fun leafCount%precondition ($Snap tree) Bool)
(declare-fun inp_to_seq_2 ($Snap pointer Int) Seq<Int>)
(declare-fun inp_to_seq_2%limited ($Snap pointer Int) Seq<Int>)
(declare-fun inp_to_seq_2%stateless (pointer Int) Bool)
(declare-fun inp_to_seq_2%precondition ($Snap pointer Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
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
(assert (forall ((value Int)) (!
  (= value (get_tree_value<Int> (leaf<tree> value)))
  :pattern ((leaf<tree> value))
  )))
(assert (forall ((left tree) (right tree)) (!
  (= left (get_tree_left<tree> (node<tree> left right)))
  :pattern ((node<tree> left right))
  )))
(assert (forall ((left tree) (right tree)) (!
  (= right (get_tree_right<tree> (node<tree> left right)))
  :pattern ((node<tree> left right))
  )))
(assert (forall ((value Int)) (!
  (= (tree_tag<Int> (leaf<tree> value)) 0)
  :pattern ((leaf<tree> value))
  )))
(assert (forall ((left tree) (right tree)) (!
  (= (tree_tag<Int> (node<tree> left right)) 1)
  :pattern ((node<tree> left right))
  )))
(assert (forall ((t tree)) (!
  (or
    (= t (leaf<tree> (get_tree_value<Int> t)))
    (= t (node<tree> (get_tree_left<tree> t) (get_tree_right<tree> t))))
  :pattern ((tree_tag<Int> t))
  :pattern ((get_tree_left<tree> t))
  :pattern ((get_tree_right<tree> t))
  )))
(assert (forall ((int1 Int) (int2 Int)) (!
  (=> (< int1 int2) (decreasing<Bool> int1 int2))
  :pattern ((decreasing<Bool> int1 int2))
  :qid |prog.integer_ax_dec|)))
(assert (forall ((int1 Int)) (!
  (=> (>= int1 0) (bounded<Bool> int1))
  :pattern ((bounded<Bool> int1))
  :qid |prog.integer_ax_bound|)))
(assert true)
(assert (and
  (forall ((right_0 tree) (left tree)) (!
    (decreasing<Bool> right_0 (node<tree> left right_0))
    :pattern ((node<tree> left right_0))
    ))
  (forall ((left_0 tree) (right tree)) (!
    (decreasing<Bool> left_0 (node<tree> left_0 right))
    :pattern ((node<tree> left_0 right))
    ))))
(assert (forall ((v1 tree) (v2 tree) (v3 tree)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x tree)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((p pointer)) (!
  (and
    (>= (pointer_offset<Int> p) 0)
    (< (pointer_offset<Int> p) (block_length<Int> (pointer_block<block> p))))
  :pattern ((pointer_offset<Int> p))
  :pattern ((block_length<Int> (pointer_block<block> p)))
  )))
(assert (forall ((b block) (offset Int)) (!
  (and
    (= (pointer_block<block> (pointer_of<pointer> b offset)) b)
    (= (pointer_offset<Int> (pointer_of<pointer> b offset)) offset))
  :pattern ((pointer_block<block> (pointer_of<pointer> b offset)) (pointer_offset<Int> (pointer_of<pointer> b offset)))
  )))
(assert (forall ((b block)) (!
  (>= (block_length<Int> b) 0)
  :pattern ((block_length<Int> b))
  )))
(assert (forall ((b block) (i Int)) (!
  (and
    (= (loc_inv_1<block> (loc<Ref> b i)) b)
    (= (loc_inv_2<Int> (loc<Ref> b i)) i))
  :pattern ((loc<Ref> b i))
  )))
; /field_value_functions_axioms.smt2 [ref: Ref]
(assert (forall ((vs $FVF<ref>) (ws $FVF<ref>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_ref vs) ($FVF.domain_ref ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_ref vs))
            (= ($FVF.lookup_ref vs x) ($FVF.lookup_ref ws x)))
          :pattern (($FVF.lookup_ref vs x) ($FVF.lookup_ref ws x))
          :qid |qp.$FVF<ref>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<ref>To$Snap vs)
              ($SortWrappers.$FVF<ref>To$Snap ws)
              )
    :qid |qp.$FVF<ref>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_ref pm r))
    :pattern (($FVF.perm_ref pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_ref f r) true)
    :pattern (($FVF.loc_ref f r)))))
; /field_value_functions_axioms.smt2 [x: Int]
(assert (forall ((vs $FVF<x>) (ws $FVF<x>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_x vs) ($FVF.domain_x ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_x vs))
            (= ($FVF.lookup_x vs x) ($FVF.lookup_x ws x)))
          :pattern (($FVF.lookup_x vs x) ($FVF.lookup_x ws x))
          :qid |qp.$FVF<x>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<x>To$Snap vs)
              ($SortWrappers.$FVF<x>To$Snap ws)
              )
    :qid |qp.$FVF<x>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_x pm r))
    :pattern (($FVF.perm_x pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_x f r) true)
    :pattern (($FVF.loc_x f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION id----------
(declare-fun i@0@00 () Int)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (= (id%limited s@$ i@0@00) (id s@$ i@0@00))
  :pattern ((id s@$ i@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (id%stateless i@0@00)
  :pattern ((id%limited s@$ i@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@1@00 i@0@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (=> (id%precondition s@$ i@0@00) (= (id s@$ i@0@00) i@0@00))
  :pattern ((id s@$ i@0@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  true
  :pattern ((id s@$ i@0@00))
  :qid |quant-u-11|)))
; ---------- FUNCTION ptr_add----------
(declare-fun p@2@00 () pointer)
(declare-fun offset@3@00 () Int)
(declare-fun result@4@00 () pointer)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= pointer_offset(p) + offset
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
(assert (<= 0 (+ (pointer_offset<Int> p@2@00) offset@3@00)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] pointer_offset(p) + offset < block_length(pointer_block(p))
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
; [eval] block_length(pointer_block(p))
; [eval] pointer_block(p)
(assert (<
  (+ (pointer_offset<Int> p@2@00) offset@3@00)
  (block_length<Int> (pointer_block<block> p@2@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (p@2@00 pointer) (offset@3@00 Int)) (!
  (= (ptr_add%limited s@$ p@2@00 offset@3@00) (ptr_add s@$ p@2@00 offset@3@00))
  :pattern ((ptr_add s@$ p@2@00 offset@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (p@2@00 pointer) (offset@3@00 Int)) (!
  (ptr_add%stateless p@2@00 offset@3@00)
  :pattern ((ptr_add%limited s@$ p@2@00 offset@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 (+ (pointer_offset<Int> p@2@00) offset@3@00)))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (<
  (+ (pointer_offset<Int> p@2@00) offset@3@00)
  (block_length<Int> (pointer_block<block> p@2@00))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] pointer_of(pointer_block(p), pointer_offset(p) + offset)
; [eval] pointer_block(p)
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
(assert (=
  result@4@00
  (pointer_of<pointer> (pointer_block<block> p@2@00) (+
    (pointer_offset<Int> p@2@00)
    offset@3@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (p@2@00 pointer) (offset@3@00 Int)) (!
  (=>
    (ptr_add%precondition s@$ p@2@00 offset@3@00)
    (=
      (ptr_add s@$ p@2@00 offset@3@00)
      (pointer_of<pointer> (pointer_block<block> p@2@00) (+
        (pointer_offset<Int> p@2@00)
        offset@3@00))))
  :pattern ((ptr_add s@$ p@2@00 offset@3@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (p@2@00 pointer) (offset@3@00 Int)) (!
  true
  :pattern ((ptr_add s@$ p@2@00 offset@3@00))
  :qid |quant-u-13|)))
; ---------- FUNCTION ptr_deref----------
(declare-fun p@5@00 () pointer)
(declare-fun result@6@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (p@5@00 pointer)) (!
  (= (ptr_deref%limited s@$ p@5@00) (ptr_deref s@$ p@5@00))
  :pattern ((ptr_deref s@$ p@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (p@5@00 pointer)) (!
  (ptr_deref%stateless p@5@00)
  :pattern ((ptr_deref%limited s@$ p@5@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] loc(pointer_block(p), pointer_offset(p))
; [eval] pointer_block(p)
; [eval] pointer_offset(p)
(assert (=
  result@6@00
  (loc<Ref> (pointer_block<block> p@5@00) (pointer_offset<Int> p@5@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (p@5@00 pointer)) (!
  (=>
    (ptr_deref%precondition s@$ p@5@00)
    (=
      (ptr_deref s@$ p@5@00)
      (loc<Ref> (pointer_block<block> p@5@00) (pointer_offset<Int> p@5@00))))
  :pattern ((ptr_deref s@$ p@5@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (p@5@00 pointer)) (!
  true
  :pattern ((ptr_deref s@$ p@5@00))
  :qid |quant-u-15|)))
; ---------- FUNCTION leafCount----------
(declare-fun t@7@00 () tree)
(declare-fun result@8@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@7@00 tree)) (!
  (= (leafCount%limited s@$ t@7@00) (leafCount s@$ t@7@00))
  :pattern ((leafCount s@$ t@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (t@7@00 tree)) (!
  (leafCount%stateless t@7@00)
  :pattern ((leafCount%limited s@$ t@7@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] id((tree_tag(t) == 0 && tree_tag(t) == 0 ? 1 : leafCount(get_tree_left(t)) + leafCount(get_tree_right(t))))
; [eval] (tree_tag(t) == 0 && tree_tag(t) == 0 ? 1 : leafCount(get_tree_left(t)) + leafCount(get_tree_right(t)))
; [eval] tree_tag(t) == 0 && tree_tag(t) == 0
; [eval] tree_tag(t) == 0
; [eval] tree_tag(t)
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | tree_tag[Int](t@7@00) != 0 | live]
; [else-branch: 0 | tree_tag[Int](t@7@00) == 0 | live]
(push) ; 3
; [then-branch: 0 | tree_tag[Int](t@7@00) != 0]
(assert (not (= (tree_tag<Int> t@7@00) 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | tree_tag[Int](t@7@00) == 0]
(assert (= (tree_tag<Int> t@7@00) 0))
; [eval] tree_tag(t) == 0
; [eval] tree_tag(t)
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (= (tree_tag<Int> t@7@00) 0) (not (= (tree_tag<Int> t@7@00) 0))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (tree_tag<Int> t@7@00) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (tree_tag<Int> t@7@00) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | tree_tag[Int](t@7@00) == 0 | live]
; [else-branch: 1 | tree_tag[Int](t@7@00) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | tree_tag[Int](t@7@00) == 0]
(assert (= (tree_tag<Int> t@7@00) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | tree_tag[Int](t@7@00) != 0]
(assert (not (= (tree_tag<Int> t@7@00) 0)))
; [eval] leafCount(get_tree_left(t)) + leafCount(get_tree_right(t))
; [eval] leafCount(get_tree_left(t))
; [eval] get_tree_left(t)
(push) ; 4
(assert (leafCount%precondition $Snap.unit (get_tree_left<tree> t@7@00)))
(pop) ; 4
; Joined path conditions
(assert (leafCount%precondition $Snap.unit (get_tree_left<tree> t@7@00)))
; [eval] leafCount(get_tree_right(t))
; [eval] get_tree_right(t)
(push) ; 4
(assert (leafCount%precondition $Snap.unit (get_tree_right<tree> t@7@00)))
(pop) ; 4
; Joined path conditions
(assert (leafCount%precondition $Snap.unit (get_tree_right<tree> t@7@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (tree_tag<Int> t@7@00) 0))
  (and
    (not (= (tree_tag<Int> t@7@00) 0))
    (leafCount%precondition $Snap.unit (get_tree_left<tree> t@7@00))
    (leafCount%precondition $Snap.unit (get_tree_right<tree> t@7@00)))))
(assert (or (not (= (tree_tag<Int> t@7@00) 0)) (= (tree_tag<Int> t@7@00) 0)))
(push) ; 2
(assert (id%precondition $Snap.unit (ite
  (= (tree_tag<Int> t@7@00) 0)
  1
  (+
    (leafCount $Snap.unit (get_tree_left<tree> t@7@00))
    (leafCount $Snap.unit (get_tree_right<tree> t@7@00))))))
(pop) ; 2
; Joined path conditions
(assert (id%precondition $Snap.unit (ite
  (= (tree_tag<Int> t@7@00) 0)
  1
  (+
    (leafCount $Snap.unit (get_tree_left<tree> t@7@00))
    (leafCount $Snap.unit (get_tree_right<tree> t@7@00))))))
(assert (=
  result@8@00
  (id $Snap.unit (ite
    (= (tree_tag<Int> t@7@00) 0)
    1
    (+
      (leafCount $Snap.unit (get_tree_left<tree> t@7@00))
      (leafCount $Snap.unit (get_tree_right<tree> t@7@00)))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@7@00 tree)) (!
  (=>
    (leafCount%precondition s@$ t@7@00)
    (=
      (leafCount s@$ t@7@00)
      (id $Snap.unit (ite
        (= (tree_tag<Int> t@7@00) 0)
        1
        (+
          (leafCount%limited $Snap.unit (get_tree_left<tree> t@7@00))
          (leafCount%limited $Snap.unit (get_tree_right<tree> t@7@00)))))))
  :pattern ((leafCount s@$ t@7@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (t@7@00 tree)) (!
  (=>
    (leafCount%precondition s@$ t@7@00)
    (and
      (ite
        (= (tree_tag<Int> t@7@00) 0)
        true
        (and
          (leafCount%precondition $Snap.unit (get_tree_left<tree> t@7@00))
          (leafCount%precondition $Snap.unit (get_tree_right<tree> t@7@00))))
      (id%precondition $Snap.unit (ite
        (= (tree_tag<Int> t@7@00) 0)
        1
        (+
          (leafCount%limited $Snap.unit (get_tree_left<tree> t@7@00))
          (leafCount%limited $Snap.unit (get_tree_right<tree> t@7@00)))))))
  :pattern ((leafCount s@$ t@7@00))
  :qid |quant-u-17|)))
; ---------- FUNCTION inp_to_seq_2----------
(declare-fun inp@9@00 () pointer)
(declare-fun n@10@00 () Int)
(declare-fun result@11@00 () Seq<Int>)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] n <= block_length(pointer_block(inp)) - pointer_offset(inp)
; [eval] block_length(pointer_block(inp)) - pointer_offset(inp)
; [eval] block_length(pointer_block(inp))
; [eval] pointer_block(inp)
; [eval] pointer_offset(inp)
(assert (<=
  n@10@00
  (-
    (block_length<Int> (pointer_block<block> inp@9@00))
    (pointer_offset<Int> inp@9@00))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const i@12@00 Int)
(push) ; 2
; [eval] 0 <= i && i < n
; [eval] 0 <= i
(push) ; 3
; [then-branch: 2 | !(0 <= i@12@00) | live]
; [else-branch: 2 | 0 <= i@12@00 | live]
(push) ; 4
; [then-branch: 2 | !(0 <= i@12@00)]
(assert (not (<= 0 i@12@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | 0 <= i@12@00]
(assert (<= 0 i@12@00))
; [eval] i < n
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@12@00) (not (<= 0 i@12@00))))
(assert (and (<= 0 i@12@00) (< i@12@00 n@10@00)))
; [eval] ptr_deref(ptr_add(inp, i))
; [eval] ptr_add(inp, i)
(push) ; 3
; [eval] 0 <= pointer_offset(p) + offset
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
(push) ; 4
(assert (not (<= 0 (+ (pointer_offset<Int> inp@9@00) i@12@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ (pointer_offset<Int> inp@9@00) i@12@00)))
; [eval] pointer_offset(p) + offset < block_length(pointer_block(p))
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
; [eval] block_length(pointer_block(p))
; [eval] pointer_block(p)
(push) ; 4
(assert (not (<
  (+ (pointer_offset<Int> inp@9@00) i@12@00)
  (block_length<Int> (pointer_block<block> inp@9@00)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<
  (+ (pointer_offset<Int> inp@9@00) i@12@00)
  (block_length<Int> (pointer_block<block> inp@9@00))))
(assert (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00))
(pop) ; 3
; Joined path conditions
(assert (and
  (<= 0 (+ (pointer_offset<Int> inp@9@00) i@12@00))
  (<
    (+ (pointer_offset<Int> inp@9@00) i@12@00)
    (block_length<Int> (pointer_block<block> inp@9@00)))
  (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00)))
(push) ; 3
(assert (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00)))
(pop) ; 3
; Joined path conditions
(assert (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00)))
; [eval] 1 * write / 10
; [eval] 1 * write
(declare-fun sm@13@00 ($Snap pointer Int) $FVF<ref>)
; Definitional axioms for snapshot map values
; [eval] ptr_deref(ptr_add(inp, i))
; [eval] ptr_add(inp, i)
(push) ; 3
; [eval] 0 <= pointer_offset(p) + offset
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
; [eval] pointer_offset(p) + offset < block_length(pointer_block(p))
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
; [eval] block_length(pointer_block(p))
; [eval] pointer_block(p)
(pop) ; 3
; Joined path conditions
(push) ; 3
(pop) ; 3
; Joined path conditions
(pop) ; 2
(declare-fun inv@14@00 ($Snap pointer Int $Ref) Int)
(declare-fun img@15@00 ($Snap pointer Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 n@10@00))
    (and
      (or (<= 0 i@12@00) (not (<= 0 i@12@00)))
      (<= 0 (+ (pointer_offset<Int> inp@9@00) i@12@00))
      (<
        (+ (pointer_offset<Int> inp@9@00) i@12@00)
        (block_length<Int> (pointer_block<block> inp@9@00)))
      (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00)
      (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@12@00))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))))
  :qid |ref-aux|)))
; Check receiver injectivity
(assert (forall ((i1@12@00 Int) (i2@12@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@12@00) (< i1@12@00 n@10@00))
      (and (<= 0 i2@12@00) (< i2@12@00 n@10@00)))
    (and
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i1@12@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i1@12@00)))
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i2@12@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i2@12@00)))))
  
  :qid |ref-rcvrInj|)))
(push) ; 2
(assert (not (forall ((i1@12@00 Int) (i2@12@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@12@00) (< i1@12@00 n@10@00))
      (and (<= 0 i2@12@00) (< i2@12@00 n@10@00))
      (=
        (ptr_deref $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i1@12@00))
        (ptr_deref $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i2@12@00))))
    (= i1@12@00 i2@12@00))
  
  :qid |ref-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 n@10@00))
    (and
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@12@00)))
      (=>
        (=
          (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@12@00)))
          i@12@00)
        (and
          (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00)
          (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@12@00))))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (and
      (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 (inv@14@00 s@$ inp@9@00 n@10@00 r))
      (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 (inv@14@00 s@$ inp@9@00 n@10@00 r)))))
  :pattern ((inv@14@00 s@$ inp@9@00 n@10@00 r))
  :qid |ref-fctOfInv|)))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 n@10@00))
    (and
      (=
        (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@12@00)))
        i@12@00)
      (img@15@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@12@00)))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      (ptr_deref $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 (inv@14@00 s@$ inp@9@00 n@10@00 r)))
      r))
  :pattern ((inv@14@00 s@$ inp@9@00 n@10@00 r))
  :qid |ref-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 n@10@00))
    (not
      (=
        (ptr_deref $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00))
        $Ref.null)))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))))
  :qid |ref-permImpliesNonNull|)))
(declare-fun sm@16@00 ($Snap pointer Int) $FVF<ref>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
      ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
      (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00))
    ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r) r))
  :pattern ((inv@14@00 s@$ inp@9@00 n@10@00 r))
  :qid |quant-u-20|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { ptr_add(inp, i), ptr_deref(ptr_add(inp, j)) } { ptr_deref(ptr_add(inp, i)), ptr_add(inp, j) } { ptr_deref(ptr_add(inp, i)), ptr_deref(ptr_add(inp, j)) } 0 <= i && (i < n && (0 <= j && j < n)) ==> i != j ==> ptr_deref(ptr_add(inp, i)).ref != ptr_deref(ptr_add(inp, j)).ref)
(declare-const i@17@00 Int)
(declare-const j@18@00 Int)
(push) ; 2
; [eval] 0 <= i && (i < n && (0 <= j && j < n)) ==> i != j ==> ptr_deref(ptr_add(inp, i)).ref != ptr_deref(ptr_add(inp, j)).ref
; [eval] 0 <= i && (i < n && (0 <= j && j < n))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 3 | !(0 <= i@17@00) | live]
; [else-branch: 3 | 0 <= i@17@00 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= i@17@00)]
(assert (not (<= 0 i@17@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= i@17@00]
(assert (<= 0 i@17@00))
; [eval] i < n
(push) ; 5
; [then-branch: 4 | !(i@17@00 < n@10@00) | live]
; [else-branch: 4 | i@17@00 < n@10@00 | live]
(push) ; 6
; [then-branch: 4 | !(i@17@00 < n@10@00)]
(assert (not (< i@17@00 n@10@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | i@17@00 < n@10@00]
(assert (< i@17@00 n@10@00))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 5 | !(0 <= j@18@00) | live]
; [else-branch: 5 | 0 <= j@18@00 | live]
(push) ; 8
; [then-branch: 5 | !(0 <= j@18@00)]
(assert (not (<= 0 j@18@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 5 | 0 <= j@18@00]
(assert (<= 0 j@18@00))
; [eval] j < n
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@18@00) (not (<= 0 j@18@00))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@17@00 n@10@00)
  (and (< i@17@00 n@10@00) (or (<= 0 j@18@00) (not (<= 0 j@18@00))))))
(assert (or (< i@17@00 n@10@00) (not (< i@17@00 n@10@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@17@00)
  (and
    (<= 0 i@17@00)
    (=>
      (< i@17@00 n@10@00)
      (and (< i@17@00 n@10@00) (or (<= 0 j@18@00) (not (<= 0 j@18@00)))))
    (or (< i@17@00 n@10@00) (not (< i@17@00 n@10@00))))))
(assert (or (<= 0 i@17@00) (not (<= 0 i@17@00))))
(push) ; 3
; [then-branch: 6 | 0 <= i@17@00 && i@17@00 < n@10@00 && 0 <= j@18@00 && j@18@00 < n@10@00 | live]
; [else-branch: 6 | !(0 <= i@17@00 && i@17@00 < n@10@00 && 0 <= j@18@00 && j@18@00 < n@10@00) | live]
(push) ; 4
; [then-branch: 6 | 0 <= i@17@00 && i@17@00 < n@10@00 && 0 <= j@18@00 && j@18@00 < n@10@00]
(assert (and
  (<= 0 i@17@00)
  (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00)))))
; [eval] i != j ==> ptr_deref(ptr_add(inp, i)).ref != ptr_deref(ptr_add(inp, j)).ref
; [eval] i != j
(push) ; 5
; [then-branch: 7 | i@17@00 != j@18@00 | live]
; [else-branch: 7 | i@17@00 == j@18@00 | live]
(push) ; 6
; [then-branch: 7 | i@17@00 != j@18@00]
(assert (not (= i@17@00 j@18@00)))
; [eval] ptr_deref(ptr_add(inp, i)).ref != ptr_deref(ptr_add(inp, j)).ref
; [eval] ptr_deref(ptr_add(inp, i))
; [eval] ptr_add(inp, i)
(push) ; 7
; [eval] 0 <= pointer_offset(p) + offset
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
(push) ; 8
(assert (not (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00)))
; [eval] pointer_offset(p) + offset < block_length(pointer_block(p))
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
; [eval] block_length(pointer_block(p))
; [eval] pointer_block(p)
(push) ; 8
(assert (not (<
  (+ (pointer_offset<Int> inp@9@00) i@17@00)
  (block_length<Int> (pointer_block<block> inp@9@00)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<
  (+ (pointer_offset<Int> inp@9@00) i@17@00)
  (block_length<Int> (pointer_block<block> inp@9@00))))
(assert (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00))
(pop) ; 7
; Joined path conditions
(assert (and
  (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))
  (<
    (+ (pointer_offset<Int> inp@9@00) i@17@00)
    (block_length<Int> (pointer_block<block> inp@9@00)))
  (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)))
(push) ; 7
(assert (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)))
(pop) ; 7
; Joined path conditions
(assert (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@15@00 s@$ inp@9@00 n@10@00 r)
        (and
          (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
          (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
      (=
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
        ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
    :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
  $Snap.unit
  $Snap.unit) inp@9@00 i@17@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
  $Snap.unit
  $Snap.unit) inp@9@00 i@17@00))))
(push) ; 7
(assert (not (and
  (img@15@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@17@00)))
  (and
    (<=
      0
      (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@17@00))))
    (<
      (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@17@00)))
      n@10@00)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] ptr_deref(ptr_add(inp, j))
; [eval] ptr_add(inp, j)
(push) ; 7
; [eval] 0 <= pointer_offset(p) + offset
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
(push) ; 8
(assert (not (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00)))
; [eval] pointer_offset(p) + offset < block_length(pointer_block(p))
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
; [eval] block_length(pointer_block(p))
; [eval] pointer_block(p)
(push) ; 8
(assert (not (<
  (+ (pointer_offset<Int> inp@9@00) j@18@00)
  (block_length<Int> (pointer_block<block> inp@9@00)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<
  (+ (pointer_offset<Int> inp@9@00) j@18@00)
  (block_length<Int> (pointer_block<block> inp@9@00))))
(assert (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00))
(pop) ; 7
; Joined path conditions
(assert (and
  (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))
  (<
    (+ (pointer_offset<Int> inp@9@00) j@18@00)
    (block_length<Int> (pointer_block<block> inp@9@00)))
  (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)))
(push) ; 7
(assert (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)))
(pop) ; 7
; Joined path conditions
(assert (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@15@00 s@$ inp@9@00 n@10@00 r)
        (and
          (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
          (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
      (=
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
        ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
    :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
  $Snap.unit
  $Snap.unit) inp@9@00 j@18@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
  $Snap.unit
  $Snap.unit) inp@9@00 j@18@00))))
(push) ; 7
(assert (not (and
  (img@15@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00)))
  (and
    (<=
      0
      (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 j@18@00))))
    (<
      (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 j@18@00)))
      n@10@00)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 7 | i@17@00 == j@18@00]
(assert (= i@17@00 j@18@00))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
      ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (not (= i@17@00 j@18@00))
  (and
    (not (= i@17@00 j@18@00))
    (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))
    (<
      (+ (pointer_offset<Int> inp@9@00) i@17@00)
      (block_length<Int> (pointer_block<block> inp@9@00)))
    (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)
    (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
      $Snap.unit
      $Snap.unit) inp@9@00 i@17@00))
    ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
      $Snap.unit
      $Snap.unit) inp@9@00 i@17@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
      $Snap.unit
      $Snap.unit) inp@9@00 i@17@00)))
    (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))
    (<
      (+ (pointer_offset<Int> inp@9@00) j@18@00)
      (block_length<Int> (pointer_block<block> inp@9@00)))
    (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)
    (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
      $Snap.unit
      $Snap.unit) inp@9@00 j@18@00))
    ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
      $Snap.unit
      $Snap.unit) inp@9@00 j@18@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
      $Snap.unit
      $Snap.unit) inp@9@00 j@18@00))))))
; Joined path conditions
(assert (or (= i@17@00 j@18@00) (not (= i@17@00 j@18@00))))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(0 <= i@17@00 && i@17@00 < n@10@00 && 0 <= j@18@00 && j@18@00 < n@10@00)]
(assert (not
  (and
    (<= 0 i@17@00)
    (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
      ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and
    (<= 0 i@17@00)
    (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))
  (and
    (<= 0 i@17@00)
    (< i@17@00 n@10@00)
    (<= 0 j@18@00)
    (< j@18@00 n@10@00)
    (=>
      (not (= i@17@00 j@18@00))
      (and
        (not (= i@17@00 j@18@00))
        (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))
        (<
          (+ (pointer_offset<Int> inp@9@00) i@17@00)
          (block_length<Int> (pointer_block<block> inp@9@00)))
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@17@00))
        ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@17@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@17@00)))
        (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))
        (<
          (+ (pointer_offset<Int> inp@9@00) j@18@00)
          (block_length<Int> (pointer_block<block> inp@9@00)))
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 j@18@00))
        ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 j@18@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 j@18@00)))))
    (or (= i@17@00 j@18@00) (not (= i@17@00 j@18@00))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@17@00)
      (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00)))))
  (and
    (<= 0 i@17@00)
    (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
      ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (and
    (=>
      (<= 0 i@17@00)
      (and
        (<= 0 i@17@00)
        (=>
          (< i@17@00 n@10@00)
          (and (< i@17@00 n@10@00) (or (<= 0 j@18@00) (not (<= 0 j@18@00)))))
        (or (< i@17@00 n@10@00) (not (< i@17@00 n@10@00)))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))
      (and
        (<= 0 i@17@00)
        (< i@17@00 n@10@00)
        (<= 0 j@18@00)
        (< j@18@00 n@10@00)
        (=>
          (not (= i@17@00 j@18@00))
          (and
            (not (= i@17@00 j@18@00))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) i@17@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00)))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) j@18@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00)))))
        (or (= i@17@00 j@18@00) (not (= i@17@00 j@18@00)))))
    (or
      (not
        (and
          (<= 0 i@17@00)
          (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00)))))
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))))
  :pattern ((ptr_add%limited ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00) (ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0768.vpr@73@13@79@39-aux|)))
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (and
    (=>
      (<= 0 i@17@00)
      (and
        (<= 0 i@17@00)
        (=>
          (< i@17@00 n@10@00)
          (and (< i@17@00 n@10@00) (or (<= 0 j@18@00) (not (<= 0 j@18@00)))))
        (or (< i@17@00 n@10@00) (not (< i@17@00 n@10@00)))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))
      (and
        (<= 0 i@17@00)
        (< i@17@00 n@10@00)
        (<= 0 j@18@00)
        (< j@18@00 n@10@00)
        (=>
          (not (= i@17@00 j@18@00))
          (and
            (not (= i@17@00 j@18@00))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) i@17@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00)))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) j@18@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00)))))
        (or (= i@17@00 j@18@00) (not (= i@17@00 j@18@00)))))
    (or
      (not
        (and
          (<= 0 i@17@00)
          (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00)))))
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))))
  :pattern ((ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@17@00)) (ptr_add%limited ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0768.vpr@73@13@79@39-aux|)))
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (and
    (=>
      (<= 0 i@17@00)
      (and
        (<= 0 i@17@00)
        (=>
          (< i@17@00 n@10@00)
          (and (< i@17@00 n@10@00) (or (<= 0 j@18@00) (not (<= 0 j@18@00)))))
        (or (< i@17@00 n@10@00) (not (< i@17@00 n@10@00)))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))
      (and
        (<= 0 i@17@00)
        (< i@17@00 n@10@00)
        (<= 0 j@18@00)
        (< j@18@00 n@10@00)
        (=>
          (not (= i@17@00 j@18@00))
          (and
            (not (= i@17@00 j@18@00))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) i@17@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00)))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) j@18@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00)))))
        (or (= i@17@00 j@18@00) (not (= i@17@00 j@18@00)))))
    (or
      (not
        (and
          (<= 0 i@17@00)
          (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00)))))
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))))
  :pattern ((ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@17@00)) (ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0768.vpr@73@13@79@39-aux|)))
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))
      (not (= i@17@00 j@18@00)))
    (not
      (=
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@17@00)))
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 j@18@00))))))
  :pattern ((ptr_add%limited ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00) (ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00)))
  :pattern ((ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@17@00)) (ptr_add%limited ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00))
  :pattern ((ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@17@00)) (ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0768.vpr@73@13@79@39|)))
(declare-const i@19@00 Int)
(push) ; 2
; [eval] 0 <= i && i < n
; [eval] 0 <= i
(push) ; 3
; [then-branch: 8 | !(0 <= i@19@00) | live]
; [else-branch: 8 | 0 <= i@19@00 | live]
(push) ; 4
; [then-branch: 8 | !(0 <= i@19@00)]
(assert (not (<= 0 i@19@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | 0 <= i@19@00]
(assert (<= 0 i@19@00))
; [eval] i < n
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@19@00) (not (<= 0 i@19@00))))
(assert (and (<= 0 i@19@00) (< i@19@00 n@10@00)))
; [eval] ptr_deref(ptr_add(inp, i))
; [eval] ptr_add(inp, i)
(push) ; 3
; [eval] 0 <= pointer_offset(p) + offset
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
(push) ; 4
(assert (not (<= 0 (+ (pointer_offset<Int> inp@9@00) i@19@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ (pointer_offset<Int> inp@9@00) i@19@00)))
; [eval] pointer_offset(p) + offset < block_length(pointer_block(p))
; [eval] pointer_offset(p) + offset
; [eval] pointer_offset(p)
; [eval] block_length(pointer_block(p))
; [eval] pointer_block(p)
(push) ; 4
(assert (not (<
  (+ (pointer_offset<Int> inp@9@00) i@19@00)
  (block_length<Int> (pointer_block<block> inp@9@00)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<
  (+ (pointer_offset<Int> inp@9@00) i@19@00)
  (block_length<Int> (pointer_block<block> inp@9@00))))
(assert (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00))
(pop) ; 3
; Joined path conditions
(assert (and
  (<= 0 (+ (pointer_offset<Int> inp@9@00) i@19@00))
  (<
    (+ (pointer_offset<Int> inp@9@00) i@19@00)
    (block_length<Int> (pointer_block<block> inp@9@00)))
  (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00)))
(push) ; 3
(assert (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00)))
(pop) ; 3
; Joined path conditions
(assert (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@15@00 s@$ inp@9@00 n@10@00 r)
        (and
          (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
          (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
      (=
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
        ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
    :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
  $Snap.unit
  $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
  $Snap.unit
  $Snap.unit) inp@9@00 i@19@00))))
(push) ; 3
(assert (not (and
  (img@15@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))
  (and
    (<=
      0
      (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00))))
    (<
      (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00)))
      n@10@00)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] 1 * write / 10
; [eval] 1 * write
(declare-fun sm@20@00 ($Snap pointer Int) $FVF<x>)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@21@00 ($Snap pointer Int $Ref) Int)
(declare-fun img@22@00 ($Snap pointer Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
      ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 n@10@00))
    (and
      (or (<= 0 i@19@00) (not (<= 0 i@19@00)))
      (<= 0 (+ (pointer_offset<Int> inp@9@00) i@19@00))
      (<
        (+ (pointer_offset<Int> inp@9@00) i@19@00)
        (block_length<Int> (pointer_block<block> inp@9@00)))
      (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00)
      (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00))
      ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00)))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))))
  :qid |x-aux|)))
; Check receiver injectivity
(assert (forall ((i1@19@00 Int) (i2@19@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@19@00) (< i1@19@00 n@10@00))
      (and (<= 0 i2@19@00) (< i2@19@00 n@10@00)))
    (and
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i1@19@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i1@19@00)))
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i2@19@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i2@19@00)))))
  
  :qid |x-rcvrInj|)))
(push) ; 2
(assert (not (forall ((i1@19@00 Int) (i2@19@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@19@00) (< i1@19@00 n@10@00))
      (and (<= 0 i2@19@00) (< i2@19@00 n@10@00))
      (=
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i1@19@00)))
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i2@19@00)))))
    (= i1@19@00 i2@19@00))
  
  :qid |x-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 n@10@00))
    (and
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@19@00)))
      (=>
        (=
          (inv@21@00 s@$ inp@9@00 n@10@00 ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@19@00))))
          i@19@00)
        (and
          (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00)
          (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@19@00))))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@21@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@21@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (and
      (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 (inv@21@00 s@$ inp@9@00 n@10@00 r))
      (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 (inv@21@00 s@$ inp@9@00 n@10@00 r)))))
  :pattern ((inv@21@00 s@$ inp@9@00 n@10@00 r))
  :qid |x-fctOfInv|)))
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 n@10@00))
    (and
      (=
        (inv@21@00 s@$ inp@9@00 n@10@00 ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@19@00))))
        i@19@00)
      (img@22@00 s@$ inp@9@00 n@10@00 ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00))))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@21@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@21@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 (inv@21@00 s@$ inp@9@00 n@10@00 r))))
      r))
  :pattern ((inv@21@00 s@$ inp@9@00 n@10@00 r))
  :qid |x-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 n@10@00))
    (not
      (=
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@19@00)))
        $Ref.null)))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))))
  :qid |x-permImpliesNonNull|)))
(declare-fun sm@23@00 ($Snap pointer Int) $FVF<x>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@21@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@21@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_x (sm@23@00 s@$ inp@9@00 n@10@00) r)
      ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_x (sm@23@00 s@$ inp@9@00 n@10@00) r))
  :pattern (($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) r) r)
  :pattern (($FVF.lookup_x (sm@23@00 s@$ inp@9@00 n@10@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@21@00 s@$ inp@9@00 n@10@00 r))
      (< (inv@21@00 s@$ inp@9@00 n@10@00 r) n@10@00))
    ($FVF.loc_x ($FVF.lookup_x (sm@23@00 s@$ inp@9@00 n@10@00) r) r))
  :pattern ((inv@21@00 s@$ inp@9@00 n@10@00 r))
  :qid |quant-u-23|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (inp@9@00 pointer) (n@10@00 Int)) (!
  (=
    (inp_to_seq_2%limited s@$ inp@9@00 n@10@00)
    (inp_to_seq_2 s@$ inp@9@00 n@10@00))
  :pattern ((inp_to_seq_2 s@$ inp@9@00 n@10@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (inp@9@00 pointer) (n@10@00 Int)) (!
  (inp_to_seq_2%stateless inp@9@00 n@10@00)
  :pattern ((inp_to_seq_2%limited s@$ inp@9@00 n@10@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@21@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@21@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (and
      (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 (inv@21@00 s@$ inp@9@00 n@10@00 r))
      (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 (inv@21@00 s@$ inp@9@00 n@10@00 r)))))
  :pattern ((inv@21@00 s@$ inp@9@00 n@10@00 r))
  :qid |x-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@21@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@21@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 (inv@21@00 s@$ inp@9@00 n@10@00 r))))
      r))
  :pattern ((inv@21@00 s@$ inp@9@00 n@10@00 r))
  :qid |x-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@21@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@21@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_x (sm@23@00 s@$ inp@9@00 n@10@00) r)
      ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_x (sm@23@00 s@$ inp@9@00 n@10@00) r))
  :pattern (($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) r) r)
  :pattern (($FVF.lookup_x (sm@23@00 s@$ inp@9@00 n@10@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 n@10@00))
    (and
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@19@00)))
      (=>
        (=
          (inv@21@00 s@$ inp@9@00 n@10@00 ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@19@00))))
          i@19@00)
        (and
          (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00)
          (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@19@00))))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))))
  :qid |quant-u-22|)))
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 n@10@00))
    (and
      (=
        (inv@21@00 s@$ inp@9@00 n@10@00 ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@19@00))))
        i@19@00)
      (img@22@00 s@$ inp@9@00 n@10@00 ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00))))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))))
  :qid |quant-u-22|)))
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 n@10@00))
    (not
      (=
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@19@00)))
        $Ref.null)))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))))
  :qid |x-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@21@00 s@$ inp@9@00 n@10@00 r))
      (< (inv@21@00 s@$ inp@9@00 n@10@00 r) n@10@00))
    ($FVF.loc_x ($FVF.lookup_x (sm@23@00 s@$ inp@9@00 n@10@00) r) r))
  :pattern ((inv@21@00 s@$ inp@9@00 n@10@00 r))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (and
      (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 (inv@14@00 s@$ inp@9@00 n@10@00 r))
      (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 (inv@14@00 s@$ inp@9@00 n@10@00 r)))))
  :pattern ((inv@14@00 s@$ inp@9@00 n@10@00 r))
  :qid |ref-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      (ptr_deref $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 (inv@14@00 s@$ inp@9@00 n@10@00 r)))
      r))
  :pattern ((inv@14@00 s@$ inp@9@00 n@10@00 r))
  :qid |ref-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@00 s@$ inp@9@00 n@10@00 r)
      (and
        (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
        (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
    (=
      ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
      ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 n@10@00))
    (and
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@12@00)))
      (=>
        (=
          (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@12@00)))
          i@12@00)
        (and
          (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00)
          (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@12@00))))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))))
  :qid |quant-u-19|)))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 n@10@00))
    (and
      (=
        (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@12@00)))
        i@12@00)
      (img@15@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@12@00)))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))))
  :qid |quant-u-19|)))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 n@10@00))
    (not
      (=
        (ptr_deref $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00))
        $Ref.null)))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))))
  :qid |ref-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
      (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00))
    ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r) r))
  :pattern ((inv@14@00 s@$ inp@9@00 n@10@00 r))
  :qid |quant-u-20|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (and
    (=>
      (<= 0 i@17@00)
      (and
        (<= 0 i@17@00)
        (=>
          (< i@17@00 n@10@00)
          (and (< i@17@00 n@10@00) (or (<= 0 j@18@00) (not (<= 0 j@18@00)))))
        (or (< i@17@00 n@10@00) (not (< i@17@00 n@10@00)))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))
      (and
        (<= 0 i@17@00)
        (< i@17@00 n@10@00)
        (<= 0 j@18@00)
        (< j@18@00 n@10@00)
        (=>
          (not (= i@17@00 j@18@00))
          (and
            (not (= i@17@00 j@18@00))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) i@17@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00)))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) j@18@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00)))))
        (or (= i@17@00 j@18@00) (not (= i@17@00 j@18@00)))))
    (or
      (not
        (and
          (<= 0 i@17@00)
          (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00)))))
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))))
  :pattern ((ptr_add%limited ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00) (ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0768.vpr@73@13@79@39-aux|)))
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (and
    (=>
      (<= 0 i@17@00)
      (and
        (<= 0 i@17@00)
        (=>
          (< i@17@00 n@10@00)
          (and (< i@17@00 n@10@00) (or (<= 0 j@18@00) (not (<= 0 j@18@00)))))
        (or (< i@17@00 n@10@00) (not (< i@17@00 n@10@00)))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))
      (and
        (<= 0 i@17@00)
        (< i@17@00 n@10@00)
        (<= 0 j@18@00)
        (< j@18@00 n@10@00)
        (=>
          (not (= i@17@00 j@18@00))
          (and
            (not (= i@17@00 j@18@00))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) i@17@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00)))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) j@18@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00)))))
        (or (= i@17@00 j@18@00) (not (= i@17@00 j@18@00)))))
    (or
      (not
        (and
          (<= 0 i@17@00)
          (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00)))))
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))))
  :pattern ((ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@17@00)) (ptr_add%limited ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0768.vpr@73@13@79@39-aux|)))
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (and
    (=>
      (<= 0 i@17@00)
      (and
        (<= 0 i@17@00)
        (=>
          (< i@17@00 n@10@00)
          (and (< i@17@00 n@10@00) (or (<= 0 j@18@00) (not (<= 0 j@18@00)))))
        (or (< i@17@00 n@10@00) (not (< i@17@00 n@10@00)))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))
      (and
        (<= 0 i@17@00)
        (< i@17@00 n@10@00)
        (<= 0 j@18@00)
        (< j@18@00 n@10@00)
        (=>
          (not (= i@17@00 j@18@00))
          (and
            (not (= i@17@00 j@18@00))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) i@17@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) i@17@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@17@00)))
            (<= 0 (+ (pointer_offset<Int> inp@9@00) j@18@00))
            (<
              (+ (pointer_offset<Int> inp@9@00) j@18@00)
              (block_length<Int> (pointer_block<block> inp@9@00)))
            (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 j@18@00)
            (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))
            ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 j@18@00)))))
        (or (= i@17@00 j@18@00) (not (= i@17@00 j@18@00)))))
    (or
      (not
        (and
          (<= 0 i@17@00)
          (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00)))))
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))))
  :pattern ((ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@17@00)) (ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0768.vpr@73@13@79@39-aux|)))
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 n@10@00) (and (<= 0 j@18@00) (< j@18@00 n@10@00))))
      (not (= i@17@00 j@18@00)))
    (not
      (=
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i@17@00)))
        ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 j@18@00))))))
  :pattern ((ptr_add%limited ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@17@00) (ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00)))
  :pattern ((ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@17@00)) (ptr_add%limited ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00))
  :pattern ((ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@17@00)) (ptr_deref%limited $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 j@18@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0768.vpr@73@13@79@39|)))
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 n@10@00))
    (and
      (or (<= 0 i@19@00) (not (<= 0 i@19@00)))
      (<= 0 (+ (pointer_offset<Int> inp@9@00) i@19@00))
      (<
        (+ (pointer_offset<Int> inp@9@00) i@19@00)
        (block_length<Int> (pointer_block<block> inp@9@00)))
      (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@19@00)
      (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00))
      ($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00)))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00))) ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@19@00)))))
  :qid |x-aux|)))
(assert (forall ((i1@19@00 Int) (i2@19@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@19@00) (< i1@19@00 n@10@00))
      (and (<= 0 i2@19@00) (< i2@19@00 n@10@00)))
    (and
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i1@19@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i1@19@00)))
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i2@19@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i2@19@00)))))
  
  :qid |x-rcvrInj|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<=
  n@10@00
  (-
    (block_length<Int> (pointer_block<block> inp@9@00))
    (pointer_offset<Int> inp@9@00))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 n@10@00))
    (and
      (or (<= 0 i@12@00) (not (<= 0 i@12@00)))
      (<= 0 (+ (pointer_offset<Int> inp@9@00) i@12@00))
      (<
        (+ (pointer_offset<Int> inp@9@00) i@12@00)
        (block_length<Int> (pointer_block<block> inp@9@00)))
      (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i@12@00)
      (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@12@00))))
  :pattern (($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
    $Snap.unit
    $Snap.unit) inp@9@00 i@12@00))))
  :qid |ref-aux|)))
(assert (forall ((i1@12@00 Int) (i2@12@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@12@00) (< i1@12@00 n@10@00))
      (and (<= 0 i2@12@00) (< i2@12@00 n@10@00)))
    (and
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i1@12@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i1@12@00)))
      (and
        (ptr_add%precondition ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 i2@12@00)
        (ptr_deref%precondition $Snap.unit (ptr_add ($Snap.combine
          $Snap.unit
          $Snap.unit) inp@9@00 i2@12@00)))))
  
  :qid |ref-rcvrInj|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] Seq[Int]()
(assert (= result@11@00 (as Seq_empty  Seq<Int>)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (inp@9@00 pointer) (n@10@00 Int)) (!
  (and
    (forall ((i@12@00 Int)) (!
      (=>
        (and (<= 0 i@12@00) (< i@12@00 n@10@00))
        (and
          (=
            (inv@14@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@12@00)))
            i@12@00)
          (img@15@00 s@$ inp@9@00 n@10@00 (ptr_deref $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@12@00)))))
      :pattern (($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@12@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@12@00))))
      :qid |quant-u-19|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@15@00 s@$ inp@9@00 n@10@00 r)
          (and
            (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
            (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
        (=
          (ptr_deref $Snap.unit (ptr_add ($Snap.combine $Snap.unit $Snap.unit) inp@9@00 (inv@14@00 s@$ inp@9@00 n@10@00 r)))
          r))
      :pattern ((inv@14@00 s@$ inp@9@00 n@10@00 r))
      :qid |ref-fctOfInv|))
    (forall ((i@19@00 Int)) (!
      (=>
        (and (<= 0 i@19@00) (< i@19@00 n@10@00))
        (and
          (=
            (inv@21@00 s@$ inp@9@00 n@10@00 ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
              $Snap.unit
              $Snap.unit) inp@9@00 i@19@00))))
            i@19@00)
          (img@22@00 s@$ inp@9@00 n@10@00 ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 i@19@00))))))
      :pattern (($FVF.loc_ref ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00))) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00))) ($FVF.loc_x ($FVF.lookup_x ($SortWrappers.$SnapTo$FVF<x> ($Snap.second ($Snap.second ($Snap.second s@$)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00)))) ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
        $Snap.unit
        $Snap.unit) inp@9@00 i@19@00)))))
      :qid |quant-u-22|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@22@00 s@$ inp@9@00 n@10@00 r)
          (and
            (<= 0 (inv@21@00 s@$ inp@9@00 n@10@00 r))
            (< (inv@21@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
        (=
          ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) (ptr_deref $Snap.unit (ptr_add ($Snap.combine
            $Snap.unit
            $Snap.unit) inp@9@00 (inv@21@00 s@$ inp@9@00 n@10@00 r))))
          r))
      :pattern ((inv@21@00 s@$ inp@9@00 n@10@00 r))
      :qid |x-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_ref (sm@13@00 s@$ inp@9@00 n@10@00) r))
      :qid |qp.fvfResTrgDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@15@00 s@$ inp@9@00 n@10@00 r)
          (and
            (<= 0 (inv@14@00 s@$ inp@9@00 n@10@00 r))
            (< (inv@14@00 s@$ inp@9@00 n@10@00 r) n@10@00)))
        (=
          ($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r)
          ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
      :pattern (($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef1|))
    (forall ((r $Ref)) (!
      ($FVF.loc_ref ($FVF.lookup_ref ($SortWrappers.$SnapTo$FVF<ref> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_ref (sm@16@00 s@$ inp@9@00 n@10@00) r))
      :qid |qp.fvfResTrgDef2|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_x (sm@20@00 s@$ inp@9@00 n@10@00) r))
      :qid |qp.fvfResTrgDef3|))
    (=>
      (inp_to_seq_2%precondition s@$ inp@9@00 n@10@00)
      (= (inp_to_seq_2 s@$ inp@9@00 n@10@00) (as Seq_empty  Seq<Int>))))
  :pattern ((inp_to_seq_2 s@$ inp@9@00 n@10@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (inp@9@00 pointer) (n@10@00 Int)) (!
  true
  :pattern ((inp_to_seq_2 s@$ inp@9@00 n@10@00))
  :qid |quant-u-25|)))
