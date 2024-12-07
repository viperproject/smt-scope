(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:39:07
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/constructors_1.vpr
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
(declare-sort Set<Bool> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<List<Int>> 0)
(declare-sort Map<Int~_List<Int>> 0)
(declare-sort Map<Int~_Int> 0)
(declare-sort List<Int> 0)
(declare-sort List<Bool> 0)
(declare-sort List<Map<Int~Int>> 0)
(declare-sort List<List<Bool>> 0)
(declare-sort List<Seq<Int>> 0)
(declare-sort List<Set<Bool>> 0)
(declare-sort List<Map<Int~List<Int>>> 0)
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
(declare-fun $SortWrappers.Set<Bool>To$Snap (Set<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Bool> ($Snap) Set<Bool>)
(assert (forall ((x Set<Bool>)) (!
    (= x ($SortWrappers.$SnapToSet<Bool>($SortWrappers.Set<Bool>To$Snap x)))
    :pattern (($SortWrappers.Set<Bool>To$Snap x))
    :qid |$Snap.$SnapToSet<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Bool>To$Snap($SortWrappers.$SnapToSet<Bool> x)))
    :pattern (($SortWrappers.$SnapToSet<Bool> x))
    :qid |$Snap.Set<Bool>To$SnapToSet<Bool>|
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
(declare-fun $SortWrappers.Set<List<Int>>To$Snap (Set<List<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<List<Int>> ($Snap) Set<List<Int>>)
(assert (forall ((x Set<List<Int>>)) (!
    (= x ($SortWrappers.$SnapToSet<List<Int>>($SortWrappers.Set<List<Int>>To$Snap x)))
    :pattern (($SortWrappers.Set<List<Int>>To$Snap x))
    :qid |$Snap.$SnapToSet<List<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<List<Int>>To$Snap($SortWrappers.$SnapToSet<List<Int>> x)))
    :pattern (($SortWrappers.$SnapToSet<List<Int>> x))
    :qid |$Snap.Set<List<Int>>To$SnapToSet<List<Int>>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Map<Int~_List<Int>>To$Snap (Map<Int~_List<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_List<Int>> ($Snap) Map<Int~_List<Int>>)
(assert (forall ((x Map<Int~_List<Int>>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_List<Int>>($SortWrappers.Map<Int~_List<Int>>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_List<Int>>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_List<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_List<Int>>To$Snap($SortWrappers.$SnapToMap<Int~_List<Int>> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_List<Int>> x))
    :qid |$Snap.Map<Int~_List<Int>>To$SnapToMap<Int~_List<Int>>|
    )))
(declare-fun $SortWrappers.Map<Int~_Int>To$Snap (Map<Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_Int> ($Snap) Map<Int~_Int>)
(assert (forall ((x Map<Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_Int>($SortWrappers.Map<Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_Int>To$Snap($SortWrappers.$SnapToMap<Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_Int> x))
    :qid |$Snap.Map<Int~_Int>To$SnapToMap<Int~_Int>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.List<Int>To$Snap (List<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Int> ($Snap) List<Int>)
(assert (forall ((x List<Int>)) (!
    (= x ($SortWrappers.$SnapToList<Int>($SortWrappers.List<Int>To$Snap x)))
    :pattern (($SortWrappers.List<Int>To$Snap x))
    :qid |$Snap.$SnapToList<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Int>To$Snap($SortWrappers.$SnapToList<Int> x)))
    :pattern (($SortWrappers.$SnapToList<Int> x))
    :qid |$Snap.List<Int>To$SnapToList<Int>|
    )))
(declare-fun $SortWrappers.List<Bool>To$Snap (List<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Bool> ($Snap) List<Bool>)
(assert (forall ((x List<Bool>)) (!
    (= x ($SortWrappers.$SnapToList<Bool>($SortWrappers.List<Bool>To$Snap x)))
    :pattern (($SortWrappers.List<Bool>To$Snap x))
    :qid |$Snap.$SnapToList<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Bool>To$Snap($SortWrappers.$SnapToList<Bool> x)))
    :pattern (($SortWrappers.$SnapToList<Bool> x))
    :qid |$Snap.List<Bool>To$SnapToList<Bool>|
    )))
(declare-fun $SortWrappers.List<Map<Int~Int>>To$Snap (List<Map<Int~Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Map<Int~Int>> ($Snap) List<Map<Int~Int>>)
(assert (forall ((x List<Map<Int~Int>>)) (!
    (= x ($SortWrappers.$SnapToList<Map<Int~Int>>($SortWrappers.List<Map<Int~Int>>To$Snap x)))
    :pattern (($SortWrappers.List<Map<Int~Int>>To$Snap x))
    :qid |$Snap.$SnapToList<Map<Int~Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Map<Int~Int>>To$Snap($SortWrappers.$SnapToList<Map<Int~Int>> x)))
    :pattern (($SortWrappers.$SnapToList<Map<Int~Int>> x))
    :qid |$Snap.List<Map<Int~Int>>To$SnapToList<Map<Int~Int>>|
    )))
(declare-fun $SortWrappers.List<List<Bool>>To$Snap (List<List<Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToList<List<Bool>> ($Snap) List<List<Bool>>)
(assert (forall ((x List<List<Bool>>)) (!
    (= x ($SortWrappers.$SnapToList<List<Bool>>($SortWrappers.List<List<Bool>>To$Snap x)))
    :pattern (($SortWrappers.List<List<Bool>>To$Snap x))
    :qid |$Snap.$SnapToList<List<Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<List<Bool>>To$Snap($SortWrappers.$SnapToList<List<Bool>> x)))
    :pattern (($SortWrappers.$SnapToList<List<Bool>> x))
    :qid |$Snap.List<List<Bool>>To$SnapToList<List<Bool>>|
    )))
(declare-fun $SortWrappers.List<Seq<Int>>To$Snap (List<Seq<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Seq<Int>> ($Snap) List<Seq<Int>>)
(assert (forall ((x List<Seq<Int>>)) (!
    (= x ($SortWrappers.$SnapToList<Seq<Int>>($SortWrappers.List<Seq<Int>>To$Snap x)))
    :pattern (($SortWrappers.List<Seq<Int>>To$Snap x))
    :qid |$Snap.$SnapToList<Seq<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Seq<Int>>To$Snap($SortWrappers.$SnapToList<Seq<Int>> x)))
    :pattern (($SortWrappers.$SnapToList<Seq<Int>> x))
    :qid |$Snap.List<Seq<Int>>To$SnapToList<Seq<Int>>|
    )))
(declare-fun $SortWrappers.List<Set<Bool>>To$Snap (List<Set<Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Set<Bool>> ($Snap) List<Set<Bool>>)
(assert (forall ((x List<Set<Bool>>)) (!
    (= x ($SortWrappers.$SnapToList<Set<Bool>>($SortWrappers.List<Set<Bool>>To$Snap x)))
    :pattern (($SortWrappers.List<Set<Bool>>To$Snap x))
    :qid |$Snap.$SnapToList<Set<Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Set<Bool>>To$Snap($SortWrappers.$SnapToList<Set<Bool>> x)))
    :pattern (($SortWrappers.$SnapToList<Set<Bool>> x))
    :qid |$Snap.List<Set<Bool>>To$SnapToList<Set<Bool>>|
    )))
(declare-fun $SortWrappers.List<Map<Int~List<Int>>>To$Snap (List<Map<Int~List<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Map<Int~List<Int>>> ($Snap) List<Map<Int~List<Int>>>)
(assert (forall ((x List<Map<Int~List<Int>>>)) (!
    (= x ($SortWrappers.$SnapToList<Map<Int~List<Int>>>($SortWrappers.List<Map<Int~List<Int>>>To$Snap x)))
    :pattern (($SortWrappers.List<Map<Int~List<Int>>>To$Snap x))
    :qid |$Snap.$SnapToList<Map<Int~List<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Map<Int~List<Int>>>To$Snap($SortWrappers.$SnapToList<Map<Int~List<Int>>> x)))
    :pattern (($SortWrappers.$SnapToList<Map<Int~List<Int>>> x))
    :qid |$Snap.List<Map<Int~List<Int>>>To$SnapToList<Map<Int~List<Int>>>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Bool>) Int)
(declare-const Set_empty Set<Bool>)
(declare-fun Set_in (Bool Set<Bool>) Bool)
(declare-fun Set_singleton (Bool) Set<Bool>)
(declare-fun Set_unionone (Set<Bool> Bool) Set<Bool>)
(declare-fun Set_union (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_intersection (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_difference (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_subset (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_equal (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_skolem_diff (Set<Bool> Set<Bool>) Bool)
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
(declare-fun Set_card (Set<List<Int>>) Int)
(declare-const Set_empty Set<List<Int>>)
(declare-fun Set_in (List<Int> Set<List<Int>>) Bool)
(declare-fun Set_singleton (List<Int>) Set<List<Int>>)
(declare-fun Set_unionone (Set<List<Int>> List<Int>) Set<List<Int>>)
(declare-fun Set_union (Set<List<Int>> Set<List<Int>>) Set<List<Int>>)
(declare-fun Set_intersection (Set<List<Int>> Set<List<Int>>) Set<List<Int>>)
(declare-fun Set_difference (Set<List<Int>> Set<List<Int>>) Set<List<Int>>)
(declare-fun Set_subset (Set<List<Int>> Set<List<Int>>) Bool)
(declare-fun Set_equal (Set<List<Int>> Set<List<Int>>) Bool)
(declare-fun Set_skolem_diff (Set<List<Int>> Set<List<Int>>) List<Int>)
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
(declare-fun Map_apply (Map<Int~_List<Int>> Int) List<Int>)
(declare-fun Map_card (Map<Int~_List<Int>>) Int)
(declare-fun Map_disjoint (Map<Int~_List<Int>> Map<Int~_List<Int>>) Bool)
(declare-fun Map_domain (Map<Int~_List<Int>>) Set<Int>)
(declare-const Map_empty Map<Int~_List<Int>>)
(declare-fun Map_equal (Map<Int~_List<Int>> Map<Int~_List<Int>>) Bool)
(declare-fun Map_update (Map<Int~_List<Int>> Int List<Int>) Map<Int~_List<Int>>)
(declare-fun Map_values (Map<Int~_List<Int>>) Set<List<Int>>)
(declare-fun Map_range_domain_skolem (Map<Int~_List<Int>> List<Int>) Int)
(declare-fun Map_apply (Map<Int~_Int> Int) Int)
(declare-fun Map_card (Map<Int~_Int>) Int)
(declare-fun Map_disjoint (Map<Int~_Int> Map<Int~_Int>) Bool)
(declare-fun Map_domain (Map<Int~_Int>) Set<Int>)
(declare-const Map_empty Map<Int~_Int>)
(declare-fun Map_equal (Map<Int~_Int> Map<Int~_Int>) Bool)
(declare-fun Map_update (Map<Int~_Int> Int Int) Map<Int~_Int>)
(declare-fun Map_values (Map<Int~_Int>) Set<Int>)
(declare-fun Map_range_domain_skolem (Map<Int~_Int> Int) Int)
(declare-const Nil<List<Bool>> List<Bool>)
(declare-fun Cons<List<Bool>> (Bool List<Bool>) List<Bool>)
(declare-fun get_List_value<Bool> (List<Bool>) Bool)
(declare-fun get_List_tail<List<Bool>> (List<Bool>) List<Bool>)
(declare-fun List_tag<Int> (List<Bool>) Int)
(declare-const Nil<List<Int>> List<Int>)
(declare-fun Cons<List<Int>> (Int List<Int>) List<Int>)
(declare-fun get_List_value<Int> (List<Int>) Int)
(declare-fun get_List_tail<List<Int>> (List<Int>) List<Int>)
(declare-fun List_tag<Int> (List<Int>) Int)
(declare-const Nil<List<Seq<Int>>> List<Seq<Int>>)
(declare-fun Cons<List<Seq<Int>>> (Seq<Int> List<Seq<Int>>) List<Seq<Int>>)
(declare-fun get_List_value<Seq<Int>> (List<Seq<Int>>) Seq<Int>)
(declare-fun get_List_tail<List<Seq<Int>>> (List<Seq<Int>>) List<Seq<Int>>)
(declare-fun List_tag<Int> (List<Seq<Int>>) Int)
(declare-const Nil<List<Map<Int~Int>>> List<Map<Int~Int>>)
(declare-fun Cons<List<Map<Int~Int>>> (Map<Int~_Int> List<Map<Int~Int>>) List<Map<Int~Int>>)
(declare-fun get_List_value<Map<Int~Int>> (List<Map<Int~Int>>) Map<Int~_Int>)
(declare-fun get_List_tail<List<Map<Int~Int>>> (List<Map<Int~Int>>) List<Map<Int~Int>>)
(declare-fun List_tag<Int> (List<Map<Int~Int>>) Int)
(declare-const Nil<List<Map<Int~List<Int>>>> List<Map<Int~List<Int>>>)
(declare-fun Cons<List<Map<Int~List<Int>>>> (Map<Int~_List<Int>> List<Map<Int~List<Int>>>) List<Map<Int~List<Int>>>)
(declare-fun get_List_value<Map<Int~List<Int>>> (List<Map<Int~List<Int>>>) Map<Int~_List<Int>>)
(declare-fun get_List_tail<List<Map<Int~List<Int>>>> (List<Map<Int~List<Int>>>) List<Map<Int~List<Int>>>)
(declare-fun List_tag<Int> (List<Map<Int~List<Int>>>) Int)
(declare-const Nil<List<Set<Bool>>> List<Set<Bool>>)
(declare-fun Cons<List<Set<Bool>>> (Set<Bool> List<Set<Bool>>) List<Set<Bool>>)
(declare-fun get_List_value<Set<Bool>> (List<Set<Bool>>) Set<Bool>)
(declare-fun get_List_tail<List<Set<Bool>>> (List<Set<Bool>>) List<Set<Bool>>)
(declare-fun List_tag<Int> (List<Set<Bool>>) Int)
(declare-const Nil<List<List<Bool>>> List<List<Bool>>)
(declare-fun Cons<List<List<Bool>>> (List<Bool> List<List<Bool>>) List<List<Bool>>)
(declare-fun get_List_value<List<Bool>> (List<List<Bool>>) List<Bool>)
(declare-fun get_List_tail<List<List<Bool>>> (List<List<Bool>>) List<List<Bool>>)
(declare-fun List_tag<Int> (List<List<Bool>>) Int)
; Declaring symbols related to program functions (from program analysis)
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
(assert (forall ((s Set<Bool>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Bool)) (!
  (not (Set_in o (as Set_empty  Set<Bool>)))
  :pattern ((Set_in o (as Set_empty  Set<Bool>)))
  )))
(assert (forall ((s Set<Bool>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Bool>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Bool))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Bool)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Bool) (o Bool)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Bool)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Bool>) (x Bool) (o Bool)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Bool>) (x Bool) (y Bool)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (=
    (Set_subset a b)
    (forall ((o Bool)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((s Set<List<Int>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o List<Int>)) (!
  (not (Set_in o (as Set_empty  Set<List<Int>>)))
  :pattern ((Set_in o (as Set_empty  Set<List<Int>>)))
  )))
(assert (forall ((s Set<List<Int>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<List<Int>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x List<Int>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r List<Int>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r List<Int>) (o List<Int>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r List<Int>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<List<Int>>) (x List<Int>) (o List<Int>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<List<Int>>) (x List<Int>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<List<Int>>) (x List<Int>) (y List<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<List<Int>>) (x List<Int>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<List<Int>>) (x List<Int>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>) (o List<Int>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>) (y List<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>) (y List<Int>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>) (o List<Int>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>) (o List<Int>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>) (y List<Int>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>)) (!
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
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>)) (!
  (=
    (Set_subset a b)
    (forall ((o List<Int>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>)) (!
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
(assert (forall ((a Set<List<Int>>) (b Set<List<Int>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((m Map<Int~_List<Int>>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Int~_List<Int>>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_List<Int>>) (m2 Map<Int~_List<Int>>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Int~_List<Int>>) (m2 Map<Int~_List<Int>>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_List<Int>>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_List<Int>>))))
  )))
(assert (forall ((m Map<Int~_List<Int>>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_List<Int>>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_List<Int>>) (m2 Map<Int~_List<Int>>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Int~_List<Int>>) (m2 Map<Int~_List<Int>>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Int~_List<Int>>) (k1 Int) (k2 Int) (v List<Int>)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<Int~_List<Int>>) (k Int) (v List<Int>)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Int~_List<Int>>) (v List<Int>)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Int~_List<Int>>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Int~_List<Int>>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
(assert (forall ((m Map<Int~_Int>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Int~_Int>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_Int>))))
  )))
(assert (forall ((m Map<Int~_Int>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_Int>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Int~_Int>) (k1 Int) (k2 Int) (v Int)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<Int~_Int>) (k Int) (v Int)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Int~_Int>) (v Int)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Int~_Int>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Int~_Int>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
(assert (forall ((value Bool) (tail List<Bool>)) (!
  (= value (get_List_value<Bool> (Cons<List<Bool>> value tail)))
  :pattern ((Cons<List<Bool>> value tail))
  )))
(assert (forall ((value Bool) (tail List<Bool>)) (!
  (= tail (get_List_tail<List<Bool>> (Cons<List<Bool>> value tail)))
  :pattern ((Cons<List<Bool>> value tail))
  )))
(assert (= (List_tag<Int> (as Nil<List<Bool>>  List<Bool>)) 1))
(assert (forall ((value Bool) (tail List<Bool>)) (!
  (= (List_tag<Int> (Cons<List<Bool>> value tail)) 0)
  :pattern ((Cons<List<Bool>> value tail))
  )))
(assert (forall ((t List<Bool>)) (!
  (or
    (= t (as Nil<List<Bool>>  List<Bool>))
    (=
      t
      (Cons<List<Bool>> (get_List_value<Bool> t) (get_List_tail<List<Bool>> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_value<Bool> t))
  :pattern ((get_List_tail<List<Bool>> t))
  )))
(assert (forall ((value Int) (tail List<Int>)) (!
  (= value (get_List_value<Int> (Cons<List<Int>> value tail)))
  :pattern ((Cons<List<Int>> value tail))
  )))
(assert (forall ((value Int) (tail List<Int>)) (!
  (= tail (get_List_tail<List<Int>> (Cons<List<Int>> value tail)))
  :pattern ((Cons<List<Int>> value tail))
  )))
(assert (= (List_tag<Int> (as Nil<List<Int>>  List<Int>)) 1))
(assert (forall ((value Int) (tail List<Int>)) (!
  (= (List_tag<Int> (Cons<List<Int>> value tail)) 0)
  :pattern ((Cons<List<Int>> value tail))
  )))
(assert (forall ((t List<Int>)) (!
  (or
    (= t (as Nil<List<Int>>  List<Int>))
    (= t (Cons<List<Int>> (get_List_value<Int> t) (get_List_tail<List<Int>> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_value<Int> t))
  :pattern ((get_List_tail<List<Int>> t))
  )))
(assert (forall ((value Seq<Int>) (tail List<Seq<Int>>)) (!
  (Seq_equal value (get_List_value<Seq<Int>> (Cons<List<Seq<Int>>> value tail)))
  :pattern ((Cons<List<Seq<Int>>> value tail))
  )))
(assert (forall ((value Seq<Int>) (tail List<Seq<Int>>)) (!
  (= tail (get_List_tail<List<Seq<Int>>> (Cons<List<Seq<Int>>> value tail)))
  :pattern ((Cons<List<Seq<Int>>> value tail))
  )))
(assert (= (List_tag<Int> (as Nil<List<Seq<Int>>>  List<Seq<Int>>)) 1))
(assert (forall ((value Seq<Int>) (tail List<Seq<Int>>)) (!
  (= (List_tag<Int> (Cons<List<Seq<Int>>> value tail)) 0)
  :pattern ((Cons<List<Seq<Int>>> value tail))
  )))
(assert (forall ((t List<Seq<Int>>)) (!
  (or
    (= t (as Nil<List<Seq<Int>>>  List<Seq<Int>>))
    (=
      t
      (Cons<List<Seq<Int>>> (get_List_value<Seq<Int>> t) (get_List_tail<List<Seq<Int>>> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_value<Seq<Int>> t))
  :pattern ((get_List_tail<List<Seq<Int>>> t))
  )))
(assert (forall ((value Map<Int~_Int>) (tail List<Map<Int~Int>>)) (!
  (Map_equal value (get_List_value<Map<Int~Int>> (Cons<List<Map<Int~Int>>> value tail)))
  :pattern ((Cons<List<Map<Int~Int>>> value tail))
  )))
(assert (forall ((value Map<Int~_Int>) (tail List<Map<Int~Int>>)) (!
  (=
    tail
    (get_List_tail<List<Map<Int~Int>>> (Cons<List<Map<Int~Int>>> value tail)))
  :pattern ((Cons<List<Map<Int~Int>>> value tail))
  )))
(assert (= (List_tag<Int> (as Nil<List<Map<Int~Int>>>  List<Map<Int~Int>>)) 1))
(assert (forall ((value Map<Int~_Int>) (tail List<Map<Int~Int>>)) (!
  (= (List_tag<Int> (Cons<List<Map<Int~Int>>> value tail)) 0)
  :pattern ((Cons<List<Map<Int~Int>>> value tail))
  )))
(assert (forall ((t List<Map<Int~Int>>)) (!
  (or
    (= t (as Nil<List<Map<Int~Int>>>  List<Map<Int~Int>>))
    (=
      t
      (Cons<List<Map<Int~Int>>> (get_List_value<Map<Int~Int>> t) (get_List_tail<List<Map<Int~Int>>> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_value<Map<Int~Int>> t))
  :pattern ((get_List_tail<List<Map<Int~Int>>> t))
  )))
(assert (forall ((value Map<Int~_List<Int>>) (tail List<Map<Int~List<Int>>>)) (!
  (Map_equal value (get_List_value<Map<Int~List<Int>>> (Cons<List<Map<Int~List<Int>>>> value tail)))
  :pattern ((Cons<List<Map<Int~List<Int>>>> value tail))
  )))
(assert (forall ((value Map<Int~_List<Int>>) (tail List<Map<Int~List<Int>>>)) (!
  (=
    tail
    (get_List_tail<List<Map<Int~List<Int>>>> (Cons<List<Map<Int~List<Int>>>> value tail)))
  :pattern ((Cons<List<Map<Int~List<Int>>>> value tail))
  )))
(assert (=
  (List_tag<Int> (as Nil<List<Map<Int~List<Int>>>>  List<Map<Int~List<Int>>>))
  1))
(assert (forall ((value Map<Int~_List<Int>>) (tail List<Map<Int~List<Int>>>)) (!
  (= (List_tag<Int> (Cons<List<Map<Int~List<Int>>>> value tail)) 0)
  :pattern ((Cons<List<Map<Int~List<Int>>>> value tail))
  )))
(assert (forall ((t List<Map<Int~List<Int>>>)) (!
  (or
    (= t (as Nil<List<Map<Int~List<Int>>>>  List<Map<Int~List<Int>>>))
    (=
      t
      (Cons<List<Map<Int~List<Int>>>> (get_List_value<Map<Int~List<Int>>> t) (get_List_tail<List<Map<Int~List<Int>>>> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_value<Map<Int~List<Int>>> t))
  :pattern ((get_List_tail<List<Map<Int~List<Int>>>> t))
  )))
(assert (forall ((value Set<Bool>) (tail List<Set<Bool>>)) (!
  (Set_equal value (get_List_value<Set<Bool>> (Cons<List<Set<Bool>>> value tail)))
  :pattern ((Cons<List<Set<Bool>>> value tail))
  )))
(assert (forall ((value Set<Bool>) (tail List<Set<Bool>>)) (!
  (= tail (get_List_tail<List<Set<Bool>>> (Cons<List<Set<Bool>>> value tail)))
  :pattern ((Cons<List<Set<Bool>>> value tail))
  )))
(assert (= (List_tag<Int> (as Nil<List<Set<Bool>>>  List<Set<Bool>>)) 1))
(assert (forall ((value Set<Bool>) (tail List<Set<Bool>>)) (!
  (= (List_tag<Int> (Cons<List<Set<Bool>>> value tail)) 0)
  :pattern ((Cons<List<Set<Bool>>> value tail))
  )))
(assert (forall ((t List<Set<Bool>>)) (!
  (or
    (= t (as Nil<List<Set<Bool>>>  List<Set<Bool>>))
    (=
      t
      (Cons<List<Set<Bool>>> (get_List_value<Set<Bool>> t) (get_List_tail<List<Set<Bool>>> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_value<Set<Bool>> t))
  :pattern ((get_List_tail<List<Set<Bool>>> t))
  )))
(assert (forall ((value List<Bool>) (tail List<List<Bool>>)) (!
  (= value (get_List_value<List<Bool>> (Cons<List<List<Bool>>> value tail)))
  :pattern ((Cons<List<List<Bool>>> value tail))
  )))
(assert (forall ((value List<Bool>) (tail List<List<Bool>>)) (!
  (= tail (get_List_tail<List<List<Bool>>> (Cons<List<List<Bool>>> value tail)))
  :pattern ((Cons<List<List<Bool>>> value tail))
  )))
(assert (= (List_tag<Int> (as Nil<List<List<Bool>>>  List<List<Bool>>)) 1))
(assert (forall ((value List<Bool>) (tail List<List<Bool>>)) (!
  (= (List_tag<Int> (Cons<List<List<Bool>>> value tail)) 0)
  :pattern ((Cons<List<List<Bool>>> value tail))
  )))
(assert (forall ((t List<List<Bool>>)) (!
  (or
    (= t (as Nil<List<List<Bool>>>  List<List<Bool>>))
    (=
      t
      (Cons<List<List<Bool>>> (get_List_value<List<Bool>> t) (get_List_tail<List<List<Bool>>> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_value<List<Bool>> t))
  :pattern ((get_List_tail<List<List<Bool>>> t))
  )))
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
; ---------- constructors_1 ----------
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
; var list1: List[Int]
(declare-const list1@0@01 List<Int>)
; [exec]
; var list2: List[List[Bool]]
(declare-const list2@1@01 List<List<Bool>>)
; [exec]
; var list3: List[Seq[Int]]
(declare-const list3@2@01 List<Seq<Int>>)
; [exec]
; var list4: List[Set[Bool]]
(declare-const list4@3@01 List<Set<Bool>>)
; [exec]
; var list5: List[Map[Int,Int]]
(declare-const list5@4@01 List<Map<Int~Int>>)
; [exec]
; var m1: Map[Int,Int]
(declare-const m1@5@01 Map<Int~_Int>)
; [exec]
; var list6: List[Map[Int,List[Int]]]
(declare-const list6@6@01 List<Map<Int~List<Int>>>)
; [exec]
; var m2: Map[Int,List[Int]]
(declare-const m2@7@01 Map<Int~_List<Int>>)
; [exec]
; list1 := (Cons(1, (Cons(1, (Cons(1, (Cons(1, (Cons(1, (Cons(1, (Nil(): List[Int])): List[Int])): List[Int])): List[Int])): List[Int])): List[Int])): List[Int])
; [eval] (Cons(1, (Cons(1, (Cons(1, (Cons(1, (Cons(1, (Cons(1, (Nil(): List[Int])): List[Int])): List[Int])): List[Int])): List[Int])): List[Int])): List[Int])
; [eval] (Cons(1, (Cons(1, (Cons(1, (Cons(1, (Cons(1, (Nil(): List[Int])): List[Int])): List[Int])): List[Int])): List[Int])): List[Int])
; [eval] (Cons(1, (Cons(1, (Cons(1, (Cons(1, (Nil(): List[Int])): List[Int])): List[Int])): List[Int])): List[Int])
; [eval] (Cons(1, (Cons(1, (Cons(1, (Nil(): List[Int])): List[Int])): List[Int])): List[Int])
; [eval] (Cons(1, (Cons(1, (Nil(): List[Int])): List[Int])): List[Int])
; [eval] (Cons(1, (Nil(): List[Int])): List[Int])
; [eval] (Nil(): List[Int])
(declare-const list1@8@01 List<Int>)
(assert (=
  list1@8@01
  (Cons<List<Int>> 1 (Cons<List<Int>> 1 (Cons<List<Int>> 1 (Cons<List<Int>> 1 (Cons<List<Int>> 1 (Cons<List<Int>> 1 (as Nil<List<Int>>  List<Int>)))))))))
; [exec]
; list2 := (Cons((Cons(true, (Cons(true, (Cons(true, (Cons(true, (Cons(true, (Cons(true,
;   (Nil(): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool]),
;   (Nil(): List[List[Bool]])): List[List[Bool]])
; [eval] (Cons((Cons(true, (Cons(true, (Cons(true, (Cons(true, (Cons(true, (Cons(true, (Nil(): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool]), (Nil(): List[List[Bool]])): List[List[Bool]])
; [eval] (Cons(true, (Cons(true, (Cons(true, (Cons(true, (Cons(true, (Cons(true, (Nil(): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])
; [eval] (Cons(true, (Cons(true, (Cons(true, (Cons(true, (Cons(true, (Nil(): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])
; [eval] (Cons(true, (Cons(true, (Cons(true, (Cons(true, (Nil(): List[Bool])): List[Bool])): List[Bool])): List[Bool])): List[Bool])
; [eval] (Cons(true, (Cons(true, (Cons(true, (Nil(): List[Bool])): List[Bool])): List[Bool])): List[Bool])
; [eval] (Cons(true, (Cons(true, (Nil(): List[Bool])): List[Bool])): List[Bool])
; [eval] (Cons(true, (Nil(): List[Bool])): List[Bool])
; [eval] (Nil(): List[Bool])
; [eval] (Nil(): List[List[Bool]])
(declare-const list2@9@01 List<List<Bool>>)
(assert (=
  list2@9@01
  (Cons<List<List<Bool>>> (Cons<List<Bool>> true (Cons<List<Bool>> true (Cons<List<Bool>> true (Cons<List<Bool>> true (Cons<List<Bool>> true (Cons<List<Bool>> true (as Nil<List<Bool>>  List<Bool>))))))) (as Nil<List<List<Bool>>>  List<List<Bool>>))))
; [exec]
; list3 := (Cons(Seq(1, 2, 3), (Nil(): List[Seq[Int]])): List[Seq[Int]])
; [eval] (Cons(Seq(1, 2, 3), (Nil(): List[Seq[Int]])): List[Seq[Int]])
; [eval] Seq(1, 2, 3)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append (Seq_singleton 1) (Seq_singleton 2))
      (Seq_singleton 3)))
  3))
; [eval] (Nil(): List[Seq[Int]])
(declare-const list3@10@01 List<Seq<Int>>)
(assert (=
  list3@10@01
  (Cons<List<Seq<Int>>> (Seq_append
    (Seq_append (Seq_singleton 1) (Seq_singleton 2))
    (Seq_singleton 3)) (as Nil<List<Seq<Int>>>  List<Seq<Int>>))))
; [exec]
; list4 := (Cons(Set(true, false), (Nil(): List[Set[Bool]])): List[Set[Bool]])
; [eval] (Cons(Set(true, false), (Nil(): List[Set[Bool]])): List[Set[Bool]])
; [eval] Set(true, false)
; [eval] (Nil(): List[Set[Bool]])
(declare-const list4@11@01 List<Set<Bool>>)
(assert (=
  list4@11@01
  (Cons<List<Set<Bool>>> (Set_unionone (Set_singleton true) false) (as Nil<List<Set<Bool>>>  List<Set<Bool>>))))
; [exec]
; m1 := m1[1 := 1]
; [eval] m1[1 := 1]
(declare-const m1@12@01 Map<Int~_Int>)
(assert (= m1@12@01 (Map_update m1@5@01 1 1)))
; [exec]
; list5 := (Cons(m1, (Nil(): List[Map[Int,Int]])): List[Map[Int,Int]])
; [eval] (Cons(m1, (Nil(): List[Map[Int,Int]])): List[Map[Int,Int]])
; [eval] (Nil(): List[Map[Int,Int]])
(declare-const list5@13@01 List<Map<Int~Int>>)
(assert (=
  list5@13@01
  (Cons<List<Map<Int~Int>>> m1@12@01 (as Nil<List<Map<Int~Int>>>  List<Map<Int~Int>>))))
; [exec]
; m2 := m2[1 :=
;   (Cons(1, (Cons(2, (Nil(): List[Int])): List[Int])): List[Int])]
; [eval] m2[1 := (Cons(1, (Cons(2, (Nil(): List[Int])): List[Int])): List[Int])]
; [eval] (Cons(1, (Cons(2, (Nil(): List[Int])): List[Int])): List[Int])
; [eval] (Cons(2, (Nil(): List[Int])): List[Int])
; [eval] (Nil(): List[Int])
(declare-const m2@14@01 Map<Int~_List<Int>>)
(assert (=
  m2@14@01
  (Map_update m2@7@01 1 (Cons<List<Int>> 1 (Cons<List<Int>> 2 (as Nil<List<Int>>  List<Int>))))))
; [exec]
; list6 := (Cons(m2, (Cons(m2, (Nil(): List[Map[Int,List[Int]]])): List[Map[Int,List[Int]]])): List[Map[Int,List[Int]]])
; [eval] (Cons(m2, (Cons(m2, (Nil(): List[Map[Int,List[Int]]])): List[Map[Int,List[Int]]])): List[Map[Int,List[Int]]])
; [eval] (Cons(m2, (Nil(): List[Map[Int,List[Int]]])): List[Map[Int,List[Int]]])
; [eval] (Nil(): List[Map[Int,List[Int]]])
(declare-const list6@15@01 List<Map<Int~List<Int>>>)
(assert (=
  list6@15@01
  (Cons<List<Map<Int~List<Int>>>> m2@14@01 (Cons<List<Map<Int~List<Int>>>> m2@14@01 (as Nil<List<Map<Int~List<Int>>>>  List<Map<Int~List<Int>>>)))))
(pop) ; 2
(pop) ; 1
