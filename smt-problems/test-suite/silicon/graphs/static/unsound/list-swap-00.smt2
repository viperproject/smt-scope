(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:15:10
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<Edge> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Edge 0)
(declare-sort TrClo 0)
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
(declare-fun $SortWrappers.Set<Edge>To$Snap (Set<Edge>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Edge> ($Snap) Set<Edge>)
(assert (forall ((x Set<Edge>)) (!
    (= x ($SortWrappers.$SnapToSet<Edge>($SortWrappers.Set<Edge>To$Snap x)))
    :pattern (($SortWrappers.Set<Edge>To$Snap x))
    :qid |$Snap.$SnapToSet<Edge>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Edge>To$Snap($SortWrappers.$SnapToSet<Edge> x)))
    :pattern (($SortWrappers.$SnapToSet<Edge> x))
    :qid |$Snap.Set<Edge>To$SnapToSet<Edge>|
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
(declare-fun $SortWrappers.EdgeTo$Snap (Edge) $Snap)
(declare-fun $SortWrappers.$SnapToEdge ($Snap) Edge)
(assert (forall ((x Edge)) (!
    (= x ($SortWrappers.$SnapToEdge($SortWrappers.EdgeTo$Snap x)))
    :pattern (($SortWrappers.EdgeTo$Snap x))
    :qid |$Snap.$SnapToEdgeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.EdgeTo$Snap($SortWrappers.$SnapToEdge x)))
    :pattern (($SortWrappers.$SnapToEdge x))
    :qid |$Snap.EdgeTo$SnapToEdge|
    )))
(declare-fun $SortWrappers.TrCloTo$Snap (TrClo) $Snap)
(declare-fun $SortWrappers.$SnapToTrClo ($Snap) TrClo)
(assert (forall ((x TrClo)) (!
    (= x ($SortWrappers.$SnapToTrClo($SortWrappers.TrCloTo$Snap x)))
    :pattern (($SortWrappers.TrCloTo$Snap x))
    :qid |$Snap.$SnapToTrCloTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.TrCloTo$Snap($SortWrappers.$SnapToTrClo x)))
    :pattern (($SortWrappers.$SnapToTrClo x))
    :qid |$Snap.TrCloTo$SnapToTrClo|
    )))
; Declaring additional sort wrappers
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
(declare-fun Set_card (Set<Edge>) Int)
(declare-const Set_empty Set<Edge>)
(declare-fun Set_in (Edge Set<Edge>) Bool)
(declare-fun Set_singleton (Edge) Set<Edge>)
(declare-fun Set_unionone (Set<Edge> Edge) Set<Edge>)
(declare-fun Set_union (Set<Edge> Set<Edge>) Set<Edge>)
(declare-fun Set_intersection (Set<Edge> Set<Edge>) Set<Edge>)
(declare-fun Set_difference (Set<Edge> Set<Edge>) Set<Edge>)
(declare-fun Set_subset (Set<Edge> Set<Edge>) Bool)
(declare-fun Set_equal (Set<Edge> Set<Edge>) Bool)
(declare-fun Set_skolem_diff (Set<Edge> Set<Edge>) Edge)
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
(declare-fun edge_pred<Ref> (Edge) $Ref)
(declare-fun edge_succ<Ref> (Edge) $Ref)
(declare-fun create_edge<Edge> ($Ref $Ref) Edge)
(declare-fun create_edge_<Edge> ($Ref $Ref) Edge)
(declare-fun exists_path<Bool> (Set<Edge> $Ref $Ref) Bool)
(declare-fun exists_path_<Bool> (Set<Edge> $Ref $Ref) Bool)
(declare-fun exists_spath<Bool> (Set<Edge> Set<$Ref> $Ref) Bool)
(declare-fun apply_noExit<Bool> (Set<Edge> Set<$Ref> Set<$Ref>) Bool)
(declare-fun inst_uReach<Set<Ref>> (Set<Edge> $Ref) Set<$Ref>)
(declare-fun inst_uReach_rev<Set<Ref>> (Set<Edge> $Ref) Set<$Ref>)
(declare-fun acyclic_graph<Bool> (Set<Edge>) Bool)
(declare-fun unshared_graph<Bool> (Set<Edge>) Bool)
(declare-fun func_graph<Bool> (Set<Edge>) Bool)
(declare-fun edge<Bool> (Set<Edge> $Ref $Ref) Bool)
(declare-fun edge_<Bool> (Set<Edge> $Ref $Ref) Bool)
(declare-fun succs<Set<Ref>> (Set<Edge> $Ref) Set<$Ref>)
; /field_value_functions_declarations.smt2 [next: Ref]
(declare-fun $FVF.domain_next ($FVF<next>) Set<$Ref>)
(declare-fun $FVF.lookup_next ($FVF<next> $Ref) $Ref)
(declare-fun $FVF.after_next ($FVF<next> $FVF<next>) Bool)
(declare-fun $FVF.loc_next ($Ref $Ref) Bool)
(declare-fun $FVF.perm_next ($FPM $Ref) $Perm)
(declare-const $fvfTOP_next $FVF<next>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun $$ ($Snap Set<$Ref>) Set<Edge>)
(declare-fun $$%limited ($Snap Set<$Ref>) Set<Edge>)
(declare-fun $$%stateless (Set<$Ref>) Bool)
(declare-fun $$%precondition ($Snap Set<$Ref>) Bool)
(declare-fun apply_TCFraming ($Snap Set<$Ref> Set<$Ref>) Bool)
(declare-fun apply_TCFraming%limited ($Snap Set<$Ref> Set<$Ref>) Bool)
(declare-fun apply_TCFraming%stateless (Set<$Ref> Set<$Ref>) Bool)
(declare-fun apply_TCFraming%precondition ($Snap Set<$Ref> Set<$Ref>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((s Set<Edge>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Edge)) (!
  (not (Set_in o (as Set_empty  Set<Edge>)))
  :pattern ((Set_in o (as Set_empty  Set<Edge>)))
  )))
(assert (forall ((s Set<Edge>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Edge>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Edge))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Edge)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Edge) (o Edge)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Edge)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Edge>) (x Edge) (o Edge)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Edge>) (x Edge)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Edge>) (x Edge) (y Edge)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Edge>) (x Edge)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Edge>) (x Edge)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>) (o Edge)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>) (y Edge)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>) (y Edge)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>) (o Edge)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>) (o Edge)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>) (y Edge)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>)) (!
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
(assert (forall ((a Set<Edge>) (b Set<Edge>)) (!
  (=
    (Set_subset a b)
    (forall ((o Edge)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Edge>) (b Set<Edge>)) (!
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
(assert (forall ((a Set<Edge>) (b Set<Edge>)) (!
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
(assert (forall ((p $Ref) (s $Ref)) (!
  (and
    (= (edge_pred<Ref> (create_edge<Edge> p s)) p)
    (= (edge_succ<Ref> (create_edge<Edge> p s)) s))
  :pattern ((create_edge<Edge> p s))
  :qid |prog.edge_injectivity|)))
(assert (forall ((EG Set<Edge>) (pred $Ref) (succ $Ref)) (!
  (= (Set_in succ (succs<Set<Ref>> EG pred)) (edge_<Bool> EG pred succ))
  :pattern ((Set_in succ (succs<Set<Ref>> EG pred)))
  :qid |prog.ax_Succs|)))
(assert (forall ((EG Set<Edge>) (p $Ref) (s $Ref)) (!
  (= (edge<Bool> EG p s) (edge_<Bool> EG p s))
  :pattern ((edge<Bool> EG p s))
  :qid |prog.ax_EdgeSynonim|)))
(assert (forall ((EG Set<Edge>) (p $Ref) (s $Ref)) (!
  (= (edge_<Bool> EG p s) (Set_in (create_edge<Edge> p s) EG))
  :pattern ((Set_in (create_edge<Edge> p s) EG))
  :pattern ((edge<Bool> EG p s))
  :qid |prog.ax_Edge|)))
(assert (forall ((EG Set<Edge>) (U Set<$Ref>) (M Set<$Ref>)) (!
  (=>
    (and
      (apply_noExit<Bool> EG U M)
      (forall ((u $Ref) (v $Ref)) (!
        (=>
          (and (Set_in u M) (and (Set_in v U) (not (Set_in v M))))
          (not (edge<Bool> EG u v)))
        :pattern ((edge<Bool> EG u v))
        :pattern ((Set_in u M) (Set_in v M))
        )))
    (forall ((u $Ref) (v $Ref)) (!
      (=>
        (and (Set_in u M) (and (Set_in v U) (not (Set_in v M))))
        (not (exists_path<Bool> EG u v)))
      :pattern ((exists_path<Bool> EG u v))
      :pattern ((Set_in u M) (Set_in v M))
      )))
  :pattern ((apply_noExit<Bool> EG U M))
  :qid |prog.ax_NoExit|)))
(assert (forall ((EG Set<Edge>) (x $Ref) (v $Ref)) (!
  (= (Set_in v (inst_uReach<Set<Ref>> EG x)) (exists_path<Bool> EG x v))
  :pattern ((Set_in v (inst_uReach<Set<Ref>> EG x)))
  :pattern ((exists_path<Bool> EG x v))
  :qid |prog.ax_instantiation_uReach|)))
(assert (forall ((EG Set<Edge>) (u $Ref) (y $Ref)) (!
  (= (Set_in u (inst_uReach_rev<Set<Ref>> EG y)) (exists_path<Bool> EG u y))
  :pattern ((Set_in u (inst_uReach_rev<Set<Ref>> EG y)))
  :pattern ((exists_path<Bool> EG u y))
  :qid |prog.ax_instantiation_uReach_rev|)))
(assert (forall ((EG Set<Edge>) (start $Ref) (end $Ref)) (!
  (= (exists_path<Bool> EG start end) (exists_path_<Bool> EG start end))
  :pattern ((exists_path<Bool> EG start end))
  :qid |prog.ax_Alias|)))
(assert (forall ((EG Set<Edge>) (start $Ref) (end $Ref)) (!
  (=
    (exists_path_<Bool> EG start end)
    (or
      (= start end)
      (exists ((w $Ref)) (!
        (and (edge<Bool> EG start w) (exists_path_<Bool> EG w end))
        :pattern ((edge<Bool> EG start w))
        :pattern ((exists_path_<Bool> EG w end))
        ))))
  :pattern ((exists_path<Bool> EG start end))
  :pattern ((edge<Bool> EG start end))
  :qid |prog.ax_ExistsPath|)))
(assert (forall ((EG Set<Edge>) (u $Ref) (v $Ref) (w $Ref)) (!
  (=>
    (and (exists_path_<Bool> EG u w) (exists_path_<Bool> EG w v))
    (exists_path_<Bool> EG u v))
  :pattern ((exists_path<Bool> EG u w) (exists_path<Bool> EG w v))
  :qid |prog.ax_ExistsPathTrans|)))
(assert (forall ((EG Set<Edge>)) (!
  (=
    (acyclic_graph<Bool> EG)
    (forall ((v1 $Ref) (v2 $Ref)) (!
      (or (not (edge<Bool> EG v1 v2)) (not (exists_path<Bool> EG v2 v1)))
      :pattern ((edge<Bool> EG v1 v2))
      :pattern ((exists_path<Bool> EG v2 v1))
      )))
  :pattern ((acyclic_graph<Bool> EG))
  :qid |prog.ax_AcyclicGraph|)))
(assert (forall ((EG Set<Edge>)) (!
  (=
    (unshared_graph<Bool> EG)
    (forall ((v1 $Ref) (v2 $Ref) (v $Ref)) (!
      (=> (and (edge<Bool> EG v1 v) (edge<Bool> EG v2 v)) (= v1 v2))
      :pattern ((edge<Bool> EG v1 v) (edge<Bool> EG v2 v))
      )))
  :pattern ((unshared_graph<Bool> EG))
  :qid |prog.ax_UnsharedGraph|)))
(assert (forall ((EG Set<Edge>)) (!
  (=
    (func_graph<Bool> EG)
    (forall ((v1 $Ref) (v2 $Ref) (v $Ref)) (!
      (=> (and (edge<Bool> EG v v1) (edge<Bool> EG v v2)) (= v1 v2))
      :pattern ((edge<Bool> EG v v1) (edge<Bool> EG v v2))
      )))
  :pattern ((func_graph<Bool> EG))
  :qid |prog.ax_FuncGraph|)))
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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@7@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@8@00 ($Snap Set<$Ref> $Ref) Bool)
(declare-fun sm@6@00 ($Snap Set<$Ref>) $FVF<next>)
(declare-fun sm@9@00 ($Snap Set<$Ref>) $FVF<next>)
(declare-fun inv@19@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@20@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun inv@23@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@24@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun inv@30@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@31@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun inv@34@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@35@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun inv@41@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@42@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun inv@46@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@47@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun inv@53@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@54@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun inv@58@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@59@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun inv@65@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@66@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun inv@70@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@71@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
(declare-fun sm@18@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(declare-fun sm@21@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(declare-fun sm@32@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(declare-fun sm@37@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(declare-fun sm@44@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(declare-fun sm@49@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(declare-fun sm@56@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(declare-fun sm@61@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(declare-fun sm@68@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(declare-fun sm@73@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (= ($$%limited s@$ refs@0@00) ($$ s@$ refs@0@00))
  :pattern (($$ s@$ refs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  ($$%stateless refs@0@00)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) (and
    (forall ((n@5@00 $Ref)) (!
      (=>
        (Set_in n@5@00 refs@0@00)
        (and
          (= (inv@7@00 s@$ refs@0@00 n@5@00) n@5@00)
          (img@8@00 s@$ refs@0@00 n@5@00)))
      :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) n@5@00) n@5@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@8@00 s@$ refs@0@00 r)
          (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
        (= (inv@7@00 s@$ refs@0@00 r) r))
      :pattern ((inv@7@00 s@$ refs@0@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@6@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@8@00 s@$ refs@0@00 r)
          (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
        (=
          ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
      :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
      :qid |qp.fvfValDef1|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
      :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef2|))
    (=>
      ($$%precondition s@$ refs@0@00)
      (and
        (forall ((p $Ref) (s $Ref)) (!
          (=
            (and
              (Set_in p refs@0@00)
              (and
                (Set_in s refs@0@00)
                (= ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) p) s)))
            (Set_in (create_edge<Edge> p s) result@1@00))
          :pattern ((create_edge<Edge> p s))
          ))
        (forall ((p $Ref) (s $Ref)) (!
          (=>
            (and (Set_in p refs@0@00) (exists_path<Bool> result@1@00 p s))
            (Set_in s refs@0@00))
          :pattern ((Set_in p refs@0@00) (Set_in s refs@0@00) (exists_path<Bool> result@1@00 p s))
          ))
        (forall ((p $Ref) (s $Ref)) (!
          (=>
            (and (Set_in s refs@0@00) (exists_path<Bool> result@1@00 p s))
            (Set_in p refs@0@00))
          :pattern ((Set_in p refs@0@00) (Set_in s refs@0@00) (exists_path<Bool> result@1@00 p s))
          ))))))
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (=
    (apply_TCFraming%limited s@$ g0@2@00 g1@3@00)
    (apply_TCFraming s@$ g0@2@00 g1@3@00))
  :pattern ((apply_TCFraming s@$ g0@2@00 g1@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (apply_TCFraming%stateless g0@2@00 g1@3@00)
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (let ((result@4@00 (apply_TCFraming%limited s@$ g0@2@00 g1@3@00))) (and
    (forall ((n@17@00 $Ref)) (!
      (=>
        (Set_in n@17@00 g0@2@00)
        (and
          (= (inv@19@00 s@$ g0@2@00 g1@3@00 n@17@00) n@17@00)
          (img@20@00 s@$ g0@2@00 g1@3@00 n@17@00)))
      :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) n@17@00) n@17@00))
      :qid |quant-u-12|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@19@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@19@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@22@00 $Ref)) (!
      (=>
        (Set_in n@22@00 g1@3@00)
        (and
          (= (inv@23@00 s@$ g0@2@00 g1@3@00 n@22@00) n@22@00)
          (img@24@00 s@$ g0@2@00 g1@3@00 n@22@00)))
      :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@22@00) n@22@00))
      :qid |quant-u-15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@24@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@23@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@23@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@29@00 $Ref)) (!
      (=>
        (Set_in n@29@00 g0@2@00)
        (and
          (= (inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00) n@29@00)
          (img@31@00 s@$ g0@2@00 g1@3@00 n@29@00)))
      :pattern ((Set_in n@29@00 g0@2@00))
      :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00))
      :pattern ((img@31@00 s@$ g0@2@00 g1@3@00 n@29@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@31@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@30@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@33@00 $Ref)) (!
      (=>
        (Set_in n@33@00 (Set_union g0@2@00 g1@3@00))
        (and
          (= (inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00) n@33@00)
          (img@35@00 s@$ g0@2@00 g1@3@00 n@33@00)))
      :pattern ((Set_in n@33@00 (Set_union g0@2@00 g1@3@00)))
      :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00))
      :pattern ((img@35@00 s@$ g0@2@00 g1@3@00 n@33@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@35@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
        (= (inv@34@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@40@00 $Ref)) (!
      (=>
        (Set_in n@40@00 g1@3@00)
        (and
          (= (inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00) n@40@00)
          (img@42@00 s@$ g0@2@00 g1@3@00 n@40@00)))
      :pattern ((Set_in n@40@00 g1@3@00))
      :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00))
      :pattern ((img@42@00 s@$ g0@2@00 g1@3@00 n@40@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@42@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@41@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@45@00 $Ref)) (!
      (=>
        (Set_in n@45@00 (Set_union g1@3@00 g0@2@00))
        (and
          (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
          (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
      :pattern ((Set_in n@45@00 (Set_union g1@3@00 g0@2@00)))
      :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
      :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@47@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
        (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@52@00 $Ref)) (!
      (=>
        (Set_in n@52@00 g0@2@00)
        (and
          (= (inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00) n@52@00)
          (img@54@00 s@$ g0@2@00 g1@3@00 n@52@00)))
      :pattern ((Set_in n@52@00 g0@2@00))
      :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00))
      :pattern ((img@54@00 s@$ g0@2@00 g1@3@00 n@52@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@54@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@53@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@57@00 $Ref)) (!
      (=>
        (Set_in n@57@00 (Set_union g0@2@00 g1@3@00))
        (and
          (= (inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00) n@57@00)
          (img@59@00 s@$ g0@2@00 g1@3@00 n@57@00)))
      :pattern ((Set_in n@57@00 (Set_union g0@2@00 g1@3@00)))
      :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00))
      :pattern ((img@59@00 s@$ g0@2@00 g1@3@00 n@57@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@59@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
        (= (inv@58@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@64@00 $Ref)) (!
      (=>
        (Set_in n@64@00 g1@3@00)
        (and
          (= (inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00) n@64@00)
          (img@66@00 s@$ g0@2@00 g1@3@00 n@64@00)))
      :pattern ((Set_in n@64@00 g1@3@00))
      :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00))
      :pattern ((img@66@00 s@$ g0@2@00 g1@3@00 n@64@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@66@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@65@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@69@00 $Ref)) (!
      (=>
        (Set_in n@69@00 (Set_union g1@3@00 g0@2@00))
        (and
          (= (inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00) n@69@00)
          (img@71@00 s@$ g0@2@00 g1@3@00 n@69@00)))
      :pattern ((Set_in n@69@00 (Set_union g1@3@00 g0@2@00)))
      :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00))
      :pattern ((img@71@00 s@$ g0@2@00 g1@3@00 n@69@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@71@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
        (= (inv@70@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@18@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (=
          ($FVF.lookup_next (sm@21@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@21@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
      :pattern (($FVF.lookup_next (sm@21@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef5|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@32@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@31@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@31@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@32@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@32@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef12|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@31@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef9|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@31@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef10|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef11|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@37@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@35@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@35@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@37@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@37@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef19|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@35@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@37@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@37@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef16|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@35@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@37@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@37@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef17|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@37@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef18|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@44@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@42@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@42@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@44@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@44@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef26|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@42@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef23|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@42@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef24|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef25|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@49@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@47@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@47@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@49@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@49@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef33|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@47@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@49@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@49@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef30|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@47@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@49@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@49@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef31|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@49@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef32|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@56@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@54@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@54@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@56@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@56@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef40|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@54@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef37|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@54@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef38|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef39|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@61@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@59@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@59@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@61@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@61@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef47|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@59@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@61@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@61@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef44|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@59@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@61@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@61@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef45|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@61@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef46|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@68@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@66@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@66@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@68@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@68@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef54|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@66@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef51|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@66@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef52|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef53|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@73@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@71@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@71@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@73@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@73@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef61|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@71@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@73@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@73@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef58|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@71@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@73@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@73@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef59|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@73@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef60|))
    (=>
      (apply_TCFraming%precondition s@$ g0@2@00 g1@3@00)
      (and
        (Set_equal (Set_union g0@2@00 g1@3@00) (Set_union g1@3@00 g0@2@00))
        (forall ((u $Ref) (v $Ref)) (!
          (=>
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ (ite
                  (Set_in v g0@2@00)
                  (ite
                    (Set_in u g0@2@00)
                    ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
                  ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
            (exists_path<Bool> ($$ (ite
              (and
                (Set_in u g0@2@00)
                (and
                  (Set_in v g0@2@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
          ))
        (forall ((u $Ref) (v $Ref)) (!
          (=>
            (and
              (Set_in u g1@3@00)
              (and
                (Set_in v g1@3@00)
                (exists_path<Bool> ($$ (ite
                  (Set_in v g1@3@00)
                  (ite
                    (Set_in u g1@3@00)
                    ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
                  ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
            (exists_path<Bool> ($$ (ite
              (and
                (Set_in u g1@3@00)
                (and
                  (Set_in v g1@3@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g1@3@00)
              (and
                (Set_in v g1@3@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
          ))
        (forall ((u $Ref) (v $Ref)) (!
          (=>
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (not
                  (exists_path<Bool> ($$ (ite
                    (Set_in v g0@2@00)
                    (ite
                      (Set_in u g0@2@00)
                      ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
                    ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))))
            (not
              (exists_path<Bool> ($$ (ite
                (and
                  (Set_in u g0@2@00)
                  (and
                    (Set_in v g0@2@00)
                    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
                ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v)))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
          ))
        (forall ((u $Ref) (v $Ref)) (!
          (=>
            (and
              (Set_in u g1@3@00)
              (and
                (Set_in v g1@3@00)
                (not
                  (exists_path<Bool> ($$ (ite
                    (Set_in v g1@3@00)
                    (ite
                      (Set_in u g1@3@00)
                      ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
                    ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))))
            (not
              (exists_path<Bool> ($$ (ite
                (and
                  (Set_in u g1@3@00)
                  (and
                    (Set_in v g1@3@00)
                    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
                ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v)))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
          ))))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-79|)))
; WARNING: (1520,11): 'if' cannot be used in patterns.
; WARNING: (1520,11): 'if' cannot be used in patterns.
; WARNING: (1520,11): 'and' cannot be used in patterns.
; WARNING: (1520,11): 'and' cannot be used in patterns.
; WARNING: (1520,11): 'if' cannot be used in patterns.
; WARNING: (1557,11): 'if' cannot be used in patterns.
; WARNING: (1557,11): 'if' cannot be used in patterns.
; WARNING: (1557,11): 'and' cannot be used in patterns.
; WARNING: (1557,11): 'and' cannot be used in patterns.
; WARNING: (1557,11): 'if' cannot be used in patterns.
; WARNING: (1596,11): 'if' cannot be used in patterns.
; WARNING: (1596,11): 'if' cannot be used in patterns.
; WARNING: (1596,11): 'and' cannot be used in patterns.
; WARNING: (1596,11): 'and' cannot be used in patterns.
; WARNING: (1596,11): 'if' cannot be used in patterns.
; WARNING: (1635,11): 'if' cannot be used in patterns.
; WARNING: (1635,11): 'if' cannot be used in patterns.
; WARNING: (1635,11): 'and' cannot be used in patterns.
; WARNING: (1635,11): 'and' cannot be used in patterns.
; WARNING: (1635,11): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (let ((result@4@00 (apply_TCFraming%limited s@$ g0@2@00 g1@3@00))) true)
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-80|)))
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (let ((result@4@00 (apply_TCFraming%limited s@$ g0@2@00 g1@3@00))) (=>
    (apply_TCFraming%precondition s@$ g0@2@00 g1@3@00)
    (forall ((u $Ref) (v $Ref)) (!
      (and
        (=>
          (and (Set_in u g0@2@00) (Set_in v g0@2@00))
          ($$%precondition (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00))
        (=>
          (and
            (Set_in u g0@2@00)
            (and
              (Set_in v g0@2@00)
              (exists_path<Bool> ($$ (ite
                (Set_in v g0@2@00)
                (ite
                  (Set_in u g0@2@00)
                  ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
                ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
          (and
            (=>
              (and (Set_in u g0@2@00) (Set_in v g0@2@00))
              ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00))
            ($$%precondition (ite
              (and
                (Set_in u g0@2@00)
                (and
                  (Set_in v g0@2@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g0@2@00)
        (ite
          (Set_in u g0@2@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-81|)))
; WARNING: (1695,7): 'if' cannot be used in patterns.
; WARNING: (1695,7): 'if' cannot be used in patterns.
; WARNING: (1695,7): 'and' cannot be used in patterns.
; WARNING: (1695,7): 'and' cannot be used in patterns.
; WARNING: (1695,7): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (let ((result@4@00 (apply_TCFraming%limited s@$ g0@2@00 g1@3@00))) (=>
    (apply_TCFraming%precondition s@$ g0@2@00 g1@3@00)
    (forall ((u $Ref) (v $Ref)) (!
      (and
        (=>
          (and (Set_in u g1@3@00) (Set_in v g1@3@00))
          ($$%precondition (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00))
        (=>
          (and
            (Set_in u g1@3@00)
            (and
              (Set_in v g1@3@00)
              (exists_path<Bool> ($$ (ite
                (Set_in v g1@3@00)
                (ite
                  (Set_in u g1@3@00)
                  ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
                ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
          (and
            (=>
              (and (Set_in u g1@3@00) (Set_in v g1@3@00))
              ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00))
            ($$%precondition (ite
              (and
                (Set_in u g1@3@00)
                (and
                  (Set_in v g1@3@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g1@3@00)
        (ite
          (Set_in u g1@3@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g1@3@00)
          (and
            (Set_in v g1@3@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-82|)))
; WARNING: (1751,7): 'if' cannot be used in patterns.
; WARNING: (1751,7): 'if' cannot be used in patterns.
; WARNING: (1751,7): 'and' cannot be used in patterns.
; WARNING: (1751,7): 'and' cannot be used in patterns.
; WARNING: (1751,7): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (let ((result@4@00 (apply_TCFraming%limited s@$ g0@2@00 g1@3@00))) (=>
    (apply_TCFraming%precondition s@$ g0@2@00 g1@3@00)
    (forall ((u $Ref) (v $Ref)) (!
      (and
        (=>
          (and (Set_in u g0@2@00) (Set_in v g0@2@00))
          ($$%precondition (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00))
        (=>
          (and
            (Set_in u g0@2@00)
            (and
              (Set_in v g0@2@00)
              (not
                (exists_path<Bool> ($$ (ite
                  (Set_in v g0@2@00)
                  (ite
                    (Set_in u g0@2@00)
                    ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
                  ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))))
          (and
            (=>
              (and (Set_in u g0@2@00) (Set_in v g0@2@00))
              ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00))
            ($$%precondition (ite
              (and
                (Set_in u g0@2@00)
                (and
                  (Set_in v g0@2@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g0@2@00)
        (ite
          (Set_in u g0@2@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-83|)))
; WARNING: (1808,7): 'if' cannot be used in patterns.
; WARNING: (1808,7): 'if' cannot be used in patterns.
; WARNING: (1808,7): 'and' cannot be used in patterns.
; WARNING: (1808,7): 'and' cannot be used in patterns.
; WARNING: (1808,7): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (let ((result@4@00 (apply_TCFraming%limited s@$ g0@2@00 g1@3@00))) (=>
    (apply_TCFraming%precondition s@$ g0@2@00 g1@3@00)
    (forall ((u $Ref) (v $Ref)) (!
      (and
        (=>
          (and (Set_in u g1@3@00) (Set_in v g1@3@00))
          ($$%precondition (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00))
        (=>
          (and
            (Set_in u g1@3@00)
            (and
              (Set_in v g1@3@00)
              (not
                (exists_path<Bool> ($$ (ite
                  (Set_in v g1@3@00)
                  (ite
                    (Set_in u g1@3@00)
                    ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
                  ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))))
          (and
            (=>
              (and (Set_in u g1@3@00) (Set_in v g1@3@00))
              ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00))
            ($$%precondition (ite
              (and
                (Set_in u g1@3@00)
                (and
                  (Set_in v g1@3@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g1@3@00)
        (ite
          (Set_in u g1@3@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-84|)))
; WARNING: (1865,7): 'if' cannot be used in patterns.
; WARNING: (1865,7): 'if' cannot be used in patterns.
; WARNING: (1865,7): 'and' cannot be used in patterns.
; WARNING: (1865,7): 'and' cannot be used in patterns.
; WARNING: (1865,7): 'if' cannot be used in patterns.
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- link ----------
(declare-const g@0@01 Set<$Ref>)
(declare-const x@1@01 $Ref)
(declare-const y@2@01 $Ref)
(declare-const g@3@01 Set<$Ref>)
(declare-const x@4@01 $Ref)
(declare-const y@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] (x in g)
(assert (Set_in x@4@01 g@3@01))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] y != null ==> (y in g)
; [eval] y != null
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@5@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= y@5@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | y@5@01 != Null | live]
; [else-branch: 0 | y@5@01 == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | y@5@01 != Null]
(assert (not (= y@5@01 $Ref.null)))
; [eval] (y in g)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | y@5@01 == Null]
(assert (= y@5@01 $Ref.null))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (= y@5@01 $Ref.null) (not (= y@5@01 $Ref.null))))
(assert (=> (not (= y@5@01 $Ref.null)) (Set_in y@5@01 g@3@01)))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (not (Set_in $Ref.null g@3@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) $Snap.unit))
; [eval] (x in g)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))
(declare-const sm@7@01 $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (as sm@7@01  $FVF<next>) x@4@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))
(assert (not (= x@4@01 $Ref.null)))
(declare-const sm@8@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@8@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@8@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
  :pattern (($FVF.lookup_next (as sm@8@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@8@01  $FVF<next>) x@4@01) x@4@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))))
(declare-const n@9@01 $Ref)
(push) ; 2
; [eval] (n in g) && n != x
; [eval] (n in g)
(push) ; 3
; [then-branch: 1 | !(n@9@01 in g@3@01) | live]
; [else-branch: 1 | n@9@01 in g@3@01 | live]
(push) ; 4
; [then-branch: 1 | !(n@9@01 in g@3@01)]
(assert (not (Set_in n@9@01 g@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | n@9@01 in g@3@01]
(assert (Set_in n@9@01 g@3@01))
; [eval] n != x
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in n@9@01 g@3@01) (not (Set_in n@9@01 g@3@01))))
(assert (and (Set_in n@9@01 g@3@01) (not (= n@9@01 x@4@01))))
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n@9@01 $Ref)) (!
  (=>
    (and (Set_in n@9@01 g@3@01) (not (= n@9@01 x@4@01)))
    (or (Set_in n@9@01 g@3@01) (not (Set_in n@9@01 g@3@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) n@9@01) n@9@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@9@01 $Ref) (n2@9@01 $Ref)) (!
  (=>
    (and
      (and (Set_in n1@9@01 g@3@01) (not (= n1@9@01 x@4@01)))
      (and (Set_in n2@9@01 g@3@01) (not (= n2@9@01 x@4@01)))
      (= n1@9@01 n2@9@01))
    (= n1@9@01 n2@9@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@9@01 $Ref)) (!
  (=>
    (and (Set_in n@9@01 g@3@01) (not (= n@9@01 x@4@01)))
    (and (= (inv@10@01 n@9@01) n@9@01) (img@11@01 n@9@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) n@9@01) n@9@01))
  :qid |quant-u-86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@9@01 $Ref)) (!
  (=>
    (and (Set_in n@9@01 g@3@01) (not (= n@9@01 x@4@01)))
    (not (= n@9@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) n@9@01) n@9@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@12@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
  :pattern ((inv@10@01 r))
  :qid |quant-u-87|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
  $Snap.unit))
; [eval] (forall n$0: Ref :: { (n$0.next in g) } { (n$0 in g), n$0.next } (n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@13@01 $Ref)
(push) ; 2
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 3
; [then-branch: 2 | !(n$0@13@01 in g@3@01) | live]
; [else-branch: 2 | n$0@13@01 in g@3@01 | live]
(push) ; 4
; [then-branch: 2 | !(n$0@13@01 in g@3@01)]
(assert (not (Set_in n$0@13@01 g@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | n$0@13@01 in g@3@01]
(assert (Set_in n$0@13@01 g@3@01))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@4@01)
      (=
        ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
      (=
        ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
    :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
    :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef4|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (ite (= n$0@13@01 x@4@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@11@01 n$0@13@01)
        (and
          (Set_in (inv@10@01 n$0@13@01) g@3@01)
          (not (= (inv@10@01 n$0@13@01) x@4@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (=>
  (Set_in n$0@13@01 g@3@01)
  (and
    (Set_in n$0@13@01 g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01))))
(assert (or (Set_in n$0@13@01 g@3@01) (not (Set_in n$0@13@01 g@3@01))))
(push) ; 3
; [then-branch: 3 | n$0@13@01 in g@3@01 && Lookup(next, sm@12@01, n$0@13@01) != Null | live]
; [else-branch: 3 | !(n$0@13@01 in g@3@01 && Lookup(next, sm@12@01, n$0@13@01) != Null) | live]
(push) ; 4
; [then-branch: 3 | n$0@13@01 in g@3@01 && Lookup(next, sm@12@01, n$0@13@01) != Null]
(assert (and
  (Set_in n$0@13@01 g@3@01)
  (not (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null))))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@4@01)
      (=
        ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
      (=
        ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
    :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
    :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef4|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (ite (= n$0@13@01 x@4@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@11@01 n$0@13@01)
        (and
          (Set_in (inv@10@01 n$0@13@01) g@3@01)
          (not (= (inv@10@01 n$0@13@01) x@4@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(n$0@13@01 in g@3@01 && Lookup(next, sm@12@01, n$0@13@01) != Null)]
(assert (not
  (and
    (Set_in n$0@13@01 g@3@01)
    (not (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (=>
  (and
    (Set_in n$0@13@01 g@3@01)
    (not (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null)))
  (and
    (Set_in n$0@13@01 g@3@01)
    (not (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@13@01 g@3@01)
      (not (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null))))
  (and
    (Set_in n$0@13@01 g@3@01)
    (not (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$0@13@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@13@01 g@3@01)
      (and
        (Set_in n$0@13@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01)))
    (or (Set_in n$0@13@01 g@3@01) (not (Set_in n$0@13@01 g@3@01)))
    (=>
      (and
        (Set_in n$0@13@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null)))
      (and
        (Set_in n$0@13@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01)))
    (or
      (not
        (and
          (Set_in n$0@13@01 g@3@01)
          (not
            (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null))))
      (and
        (Set_in n$0@13@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) g@3@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@265@14@265@34-aux|)))
(assert (forall ((n$0@13@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@13@01 g@3@01)
      (and
        (Set_in n$0@13@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01)))
    (or (Set_in n$0@13@01 g@3@01) (not (Set_in n$0@13@01 g@3@01)))
    (=>
      (and
        (Set_in n$0@13@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null)))
      (and
        (Set_in n$0@13@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01)))
    (or
      (not
        (and
          (Set_in n$0@13@01 g@3@01)
          (not
            (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null))))
      (and
        (Set_in n$0@13@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null)))))
  :pattern ((Set_in n$0@13@01 g@3@01) ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@265@14@265@34-aux|)))
(assert (forall ((n$0@13@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@13@01 g@3@01)
      (not (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) g@3@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) g@3@01))
  :pattern ((Set_in n$0@13@01 g@3@01) ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n$0@13@01) n$0@13@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@265@14@265@34|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
  $Snap.unit))
; [eval] x.next == null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@4@01)
      (=
        ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
      (=
        ($FVF.lookup_next (as sm@12@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
    :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
    :pattern (($FVF.lookup_next (as sm@12@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef4|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) x@4@01) x@4@01))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and
        (img@11@01 x@4@01)
        (and
          (Set_in (inv@10@01 x@4@01) g@3@01)
          (not (= (inv@10@01 x@4@01) x@4@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_next (as sm@12@01  $FVF<next>) x@4@01) $Ref.null))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(assert (= ($Snap.first ($Snap.second $t@14@01)) $Snap.unit))
; [eval] (x in g)
(assert (=
  ($Snap.second ($Snap.second $t@14@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
(declare-const sm@15@01 $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (as sm@15@01  $FVF<next>) x@4@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
(declare-const sm@16@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@16@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@16@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
  :pattern (($FVF.lookup_next (as sm@16@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef6|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@16@01  $FVF<next>) x@4@01) x@4@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@14@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))
(declare-const n$1@17@01 $Ref)
(push) ; 3
; [eval] (n$1 in g) && n$1 != x
; [eval] (n$1 in g)
(push) ; 4
; [then-branch: 4 | !(n$1@17@01 in g@3@01) | live]
; [else-branch: 4 | n$1@17@01 in g@3@01 | live]
(push) ; 5
; [then-branch: 4 | !(n$1@17@01 in g@3@01)]
(assert (not (Set_in n$1@17@01 g@3@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | n$1@17@01 in g@3@01]
(assert (Set_in n$1@17@01 g@3@01))
; [eval] n$1 != x
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in n$1@17@01 g@3@01) (not (Set_in n$1@17@01 g@3@01))))
(assert (and (Set_in n$1@17@01 g@3@01) (not (= n$1@17@01 x@4@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@18@01 ($Ref) $Ref)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n$1@17@01 $Ref)) (!
  (=>
    (and (Set_in n$1@17@01 g@3@01) (not (= n$1@17@01 x@4@01)))
    (or (Set_in n$1@17@01 g@3@01) (not (Set_in n$1@17@01 g@3@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) n$1@17@01) n$1@17@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n$11@17@01 $Ref) (n$12@17@01 $Ref)) (!
  (=>
    (and
      (and (Set_in n$11@17@01 g@3@01) (not (= n$11@17@01 x@4@01)))
      (and (Set_in n$12@17@01 g@3@01) (not (= n$12@17@01 x@4@01)))
      (= n$11@17@01 n$12@17@01))
    (= n$11@17@01 n$12@17@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$1@17@01 $Ref)) (!
  (=>
    (and (Set_in n$1@17@01 g@3@01) (not (= n$1@17@01 x@4@01)))
    (and (= (inv@18@01 n$1@17@01) n$1@17@01) (img@19@01 n$1@17@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) n$1@17@01) n$1@17@01))
  :qid |quant-u-89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
    (= (inv@18@01 r) r))
  :pattern ((inv@18@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n$1@17@01 $Ref)) (!
  (=>
    (and (Set_in n$1@17@01 g@3@01) (not (= n$1@17@01 x@4@01)))
    (not (= n$1@17@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) n$1@17@01) n$1@17@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@20@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
  :pattern ((inv@18@01 r))
  :qid |quant-u-90|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
  $Snap.unit))
; [eval] (forall n$2: Ref :: { (n$2.next in g) } { (n$2 in g), n$2.next } (n$2 in g) && n$2.next != null ==> (n$2.next in g))
(declare-const n$2@21@01 $Ref)
(push) ; 3
; [eval] (n$2 in g) && n$2.next != null ==> (n$2.next in g)
; [eval] (n$2 in g) && n$2.next != null
; [eval] (n$2 in g)
(push) ; 4
; [then-branch: 5 | !(n$2@21@01 in g@3@01) | live]
; [else-branch: 5 | n$2@21@01 in g@3@01 | live]
(push) ; 5
; [then-branch: 5 | !(n$2@21@01 in g@3@01)]
(assert (not (Set_in n$2@21@01 g@3@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | n$2@21@01 in g@3@01]
(assert (Set_in n$2@21@01 g@3@01))
; [eval] n$2.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@4@01)
      (=
        ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
      (=
        ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
    :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
    :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef9|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite (= n$2@21@01 x@4@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@19@01 n$2@21@01)
        (and
          (Set_in (inv@18@01 n$2@21@01) g@3@01)
          (not (= (inv@18@01 n$2@21@01) x@4@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert (=>
  (Set_in n$2@21@01 g@3@01)
  (and
    (Set_in n$2@21@01 g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01))))
(assert (or (Set_in n$2@21@01 g@3@01) (not (Set_in n$2@21@01 g@3@01))))
(push) ; 4
; [then-branch: 6 | n$2@21@01 in g@3@01 && Lookup(next, sm@20@01, n$2@21@01) != Null | live]
; [else-branch: 6 | !(n$2@21@01 in g@3@01 && Lookup(next, sm@20@01, n$2@21@01) != Null) | live]
(push) ; 5
; [then-branch: 6 | n$2@21@01 in g@3@01 && Lookup(next, sm@20@01, n$2@21@01) != Null]
(assert (and
  (Set_in n$2@21@01 g@3@01)
  (not (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null))))
; [eval] (n$2.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@4@01)
      (=
        ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
      (=
        ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
    :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
    :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef9|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite (= n$2@21@01 x@4@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@19@01 n$2@21@01)
        (and
          (Set_in (inv@18@01 n$2@21@01) g@3@01)
          (not (= (inv@18@01 n$2@21@01) x@4@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(n$2@21@01 in g@3@01 && Lookup(next, sm@20@01, n$2@21@01) != Null)]
(assert (not
  (and
    (Set_in n$2@21@01 g@3@01)
    (not (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert (=>
  (and
    (Set_in n$2@21@01 g@3@01)
    (not (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null)))
  (and
    (Set_in n$2@21@01 g@3@01)
    (not (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$2@21@01 g@3@01)
      (not (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null))))
  (and
    (Set_in n$2@21@01 g@3@01)
    (not (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef9|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$2@21@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@21@01 g@3@01)
      (and
        (Set_in n$2@21@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01)))
    (or (Set_in n$2@21@01 g@3@01) (not (Set_in n$2@21@01 g@3@01)))
    (=>
      (and
        (Set_in n$2@21@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null)))
      (and
        (Set_in n$2@21@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01)))
    (or
      (not
        (and
          (Set_in n$2@21@01 g@3@01)
          (not
            (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null))))
      (and
        (Set_in n$2@21@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) g@3@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@267@13@267@33-aux|)))
(assert (forall ((n$2@21@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@21@01 g@3@01)
      (and
        (Set_in n$2@21@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01)))
    (or (Set_in n$2@21@01 g@3@01) (not (Set_in n$2@21@01 g@3@01)))
    (=>
      (and
        (Set_in n$2@21@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null)))
      (and
        (Set_in n$2@21@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01)))
    (or
      (not
        (and
          (Set_in n$2@21@01 g@3@01)
          (not
            (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null))))
      (and
        (Set_in n$2@21@01 g@3@01)
        (not
          (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null)))))
  :pattern ((Set_in n$2@21@01 g@3@01) ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@267@13@267@33-aux|)))
(assert (forall ((n$2@21@01 $Ref)) (!
  (=>
    (and
      (Set_in n$2@21@01 g@3@01)
      (not (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) g@3@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) g@3@01))
  :pattern ((Set_in n$2@21@01 g@3@01) ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n$2@21@01) n$2@21@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@267@13@267@33|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  $Snap.unit))
; [eval] x.next == y
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@4@01)
      (=
        ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
      (=
        ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
    :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
    :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef9|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) x@4@01) x@4@01))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and
        (img@19@01 x@4@01)
        (and
          (Set_in (inv@18@01 x@4@01) g@3@01)
          (not (= (inv@18@01 x@4@01) x@4@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_next (as sm@20@01  $FVF<next>) x@4@01) y@5@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))
  $Snap.unit))
; [eval] y == null ==> $$(g) == old($$(g))
; [eval] y == null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= y@5@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@5@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | y@5@01 == Null | live]
; [else-branch: 7 | y@5@01 != Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | y@5@01 == Null]
(assert (= y@5@01 $Ref.null))
; [eval] $$(g) == old($$(g))
; [eval] $$(g)
(push) ; 5
(declare-const n@22@01 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@22@01 g@3@01))
(pop) ; 6
(declare-fun inv@23@01 ($Ref) $Ref)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@22@01 $Ref) (n2@22@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@22@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n1@22@01) n1@22@01))
      (and
        (Set_in n2@22@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n2@22@01) n2@22@01))
      (= n1@22@01 n2@22@01))
    (= n1@22@01 n2@22@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@22@01 $Ref)) (!
  (=>
    (Set_in n@22@01 g@3@01)
    (and (= (inv@23@01 n@22@01) n@22@01) (img@24@01 n@22@01)))
  :pattern ((Set_in n@22@01 g@3@01))
  :pattern ((inv@23@01 n@22@01))
  :pattern ((img@24@01 n@22@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@24@01 r) (Set_in (inv@23@01 r) g@3@01)) (= (inv@23@01 r) r))
  :pattern ((inv@23@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@23@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
  :pattern ((inv@23@01 r))
  :qid |quant-u-92|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@25@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r) (= r (inv@23@01 r)))
    ($Perm.min
      (ite
        (and
          (img@19@01 r)
          (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r) (= r (inv@23@01 r)))
    ($Perm.min
      (ite (= r x@4@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@25@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@19@01 r)
          (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@25@01 r))
    $Perm.No)
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r) (= r (inv@23@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@25@01 r)) $Perm.No))
  
  :qid |quant-u-95|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@26@01 x@4@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@26@01 r) $Perm.No)
  
  :qid |quant-u-97|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r) (= r (inv@23@01 r)))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@25@01 r)) (pTaken@26@01 r))
      $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@27@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@27@01  $FVF<next>)))
      (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r)))
    (=>
      (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r))
      (Set_in r ($FVF.domain_next (as sm@27@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@27@01  $FVF<next>))))
  :qid |qp.fvfDomDef13|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@27@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@27@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@27@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@27@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@27@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@27@01  $FVF<next>)) g@3@01))
(pop) ; 5
; Joined path conditions
(assert (forall ((n@22@01 $Ref)) (!
  (=>
    (Set_in n@22@01 g@3@01)
    (and (= (inv@23@01 n@22@01) n@22@01) (img@24@01 n@22@01)))
  :pattern ((Set_in n@22@01 g@3@01))
  :pattern ((inv@23@01 n@22@01))
  :pattern ((img@24@01 n@22@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@24@01 r) (Set_in (inv@23@01 r) g@3@01)) (= (inv@23@01 r) r))
  :pattern ((inv@23@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@27@01  $FVF<next>)))
      (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r)))
    (=>
      (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r))
      (Set_in r ($FVF.domain_next (as sm@27@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@27@01  $FVF<next>))))
  :qid |qp.fvfDomDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@27@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@27@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@27@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@27@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@27@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@23@01 r) g@3@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
    :pattern ((inv@23@01 r))
    :qid |quant-u-92|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@27@01  $FVF<next>)) g@3@01)))
; [eval] old($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 5
(declare-const n@28@01 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@28@01 g@3@01))
(pop) ; 6
(declare-fun inv@29@01 ($Ref) $Ref)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@28@01 $Ref) (n2@28@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@28@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n1@28@01) n1@28@01))
      (and
        (Set_in n2@28@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n2@28@01) n2@28@01))
      (= n1@28@01 n2@28@01))
    (= n1@28@01 n2@28@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@28@01 $Ref)) (!
  (=>
    (Set_in n@28@01 g@3@01)
    (and (= (inv@29@01 n@28@01) n@28@01) (img@30@01 n@28@01)))
  :pattern ((Set_in n@28@01 g@3@01))
  :pattern ((inv@29@01 n@28@01))
  :pattern ((img@30@01 n@28@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@30@01 r) (Set_in (inv@29@01 r) g@3@01)) (= (inv@29@01 r) r))
  :pattern ((inv@29@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@29@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
  :pattern ((inv@29@01 r))
  :qid |quant-u-100|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r) (= r (inv@29@01 r)))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@32@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r) (= r (inv@29@01 r)))
    ($Perm.min
      (ite (= r x@4@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@31@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@31@01 r))
    $Perm.No)
  
  :qid |quant-u-102|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r) (= r (inv@29@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@31@01 r)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@32@01 x@4@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@32@01 r) $Perm.No)
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r) (= r (inv@29@01 r)))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@31@01 r)) (pTaken@32@01 r))
      $Perm.No))
  
  :qid |quant-u-106|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@33@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@33@01  $FVF<next>)))
      (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r)))
    (=>
      (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r))
      (Set_in r ($FVF.domain_next (as sm@33@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@33@01  $FVF<next>))))
  :qid |qp.fvfDomDef17|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef16|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@33@01  $FVF<next>)) g@3@01))
(pop) ; 5
; Joined path conditions
(assert (forall ((n@28@01 $Ref)) (!
  (=>
    (Set_in n@28@01 g@3@01)
    (and (= (inv@29@01 n@28@01) n@28@01) (img@30@01 n@28@01)))
  :pattern ((Set_in n@28@01 g@3@01))
  :pattern ((inv@29@01 n@28@01))
  :pattern ((img@30@01 n@28@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@30@01 r) (Set_in (inv@29@01 r) g@3@01)) (= (inv@29@01 r) r))
  :pattern ((inv@29@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@33@01  $FVF<next>)))
      (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r)))
    (=>
      (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r))
      (Set_in r ($FVF.domain_next (as sm@33@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@33@01  $FVF<next>))))
  :qid |qp.fvfDomDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef16|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@29@01 r) g@3@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
    :pattern ((inv@29@01 r))
    :qid |quant-u-100|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@33@01  $FVF<next>)) g@3@01)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 7 | y@5@01 != Null]
(assert (not (= y@5@01 $Ref.null)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((n@22@01 $Ref)) (!
  (=>
    (Set_in n@22@01 g@3@01)
    (and (= (inv@23@01 n@22@01) n@22@01) (img@24@01 n@22@01)))
  :pattern ((Set_in n@22@01 g@3@01))
  :pattern ((inv@23@01 n@22@01))
  :pattern ((img@24@01 n@22@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@24@01 r) (Set_in (inv@23@01 r) g@3@01)) (= (inv@23@01 r) r))
  :pattern ((inv@23@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@27@01  $FVF<next>)))
      (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r)))
    (=>
      (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r))
      (Set_in r ($FVF.domain_next (as sm@27@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@27@01  $FVF<next>))))
  :qid |qp.fvfDomDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@27@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@27@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@23@01 r) g@3@01) (img@24@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@27@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@27@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@27@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (forall ((n@28@01 $Ref)) (!
  (=>
    (Set_in n@28@01 g@3@01)
    (and (= (inv@29@01 n@28@01) n@28@01) (img@30@01 n@28@01)))
  :pattern ((Set_in n@28@01 g@3@01))
  :pattern ((inv@29@01 n@28@01))
  :pattern ((img@30@01 n@28@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@30@01 r) (Set_in (inv@29@01 r) g@3@01)) (= (inv@29@01 r) r))
  :pattern ((inv@29@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@33@01  $FVF<next>)))
      (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r)))
    (=>
      (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r))
      (Set_in r ($FVF.domain_next (as sm@33@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@33@01  $FVF<next>))))
  :qid |qp.fvfDomDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@29@01 r) g@3@01) (img@30@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef16|)))
(assert (=>
  (= y@5@01 $Ref.null)
  (and
    (= y@5@01 $Ref.null)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@23@01 r) g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
      :pattern ((inv@23@01 r))
      :qid |quant-u-92|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@27@01  $FVF<next>)) g@3@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@29@01 r) g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
      :pattern ((inv@29@01 r))
      :qid |quant-u-100|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@33@01  $FVF<next>)) g@3@01))))
; Joined path conditions
(assert (or (not (= y@5@01 $Ref.null)) (= y@5@01 $Ref.null)))
(assert (=>
  (= y@5@01 $Ref.null)
  (Set_equal ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@27@01  $FVF<next>)) g@3@01) ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@33@01  $FVF<next>)) g@3@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
  $Snap.unit))
; [eval] y != null ==> (forall v1: Ref, v2: Ref :: { edge(old($$(g)), v1, v2) } edge($$(g), v1, v2) == (edge(old($$(g)), v1, v2) || v1 == x && v2 == y))
; [eval] y != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@5@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= y@5@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | y@5@01 != Null | live]
; [else-branch: 8 | y@5@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | y@5@01 != Null]
(assert (not (= y@5@01 $Ref.null)))
; [eval] (forall v1: Ref, v2: Ref :: { edge(old($$(g)), v1, v2) } edge($$(g), v1, v2) == (edge(old($$(g)), v1, v2) || v1 == x && v2 == y))
(declare-const v1@34@01 $Ref)
(declare-const v2@35@01 $Ref)
(push) ; 5
; [eval] edge($$(g), v1, v2) == (edge(old($$(g)), v1, v2) || v1 == x && v2 == y)
; [eval] edge($$(g), v1, v2)
; [eval] $$(g)
(push) ; 6
(declare-const n@36@01 $Ref)
(push) ; 7
; [eval] (n in refs)
(assert (Set_in n@36@01 g@3@01))
(pop) ; 7
(declare-fun inv@37@01 ($Ref) $Ref)
(declare-fun img@38@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@36@01 $Ref) (n2@36@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@36@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n1@36@01) n1@36@01))
      (and
        (Set_in n2@36@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n2@36@01) n2@36@01))
      (= n1@36@01 n2@36@01))
    (= n1@36@01 n2@36@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@36@01 $Ref)) (!
  (=>
    (Set_in n@36@01 g@3@01)
    (and (= (inv@37@01 n@36@01) n@36@01) (img@38@01 n@36@01)))
  :pattern ((Set_in n@36@01 g@3@01))
  :pattern ((inv@37@01 n@36@01))
  :pattern ((img@38@01 n@36@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@38@01 r) (Set_in (inv@37@01 r) g@3@01)) (= (inv@37@01 r) r))
  :pattern ((inv@37@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@37@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
  :pattern ((inv@37@01 r))
  :qid |quant-u-108|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@39@01 ((r $Ref) (v1@34@01 $Ref) (v2@35@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r) (= r (inv@37@01 r)))
    ($Perm.min
      (ite
        (and
          (img@19@01 r)
          (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@40@01 ((r $Ref) (v1@34@01 $Ref) (v2@35@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r) (= r (inv@37@01 r)))
    ($Perm.min
      (ite (= r x@4@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@39@01 r v1@34@01 v2@35@01)))
    $Perm.No))
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
          (img@19@01 r)
          (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@39@01 r v1@34@01 v2@35@01))
    $Perm.No)
  
  :qid |quant-u-110|))))
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
    (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r) (= r (inv@37@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@39@01 r v1@34@01 v2@35@01))
      $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@40@01 x@4@01 v1@34@01 v2@35@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@40@01 r v1@34@01 v2@35@01) $Perm.No)
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r) (= r (inv@37@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@39@01 r v1@34@01 v2@35@01))
        (pTaken@40@01 r v1@34@01 v2@35@01))
      $Perm.No))
  
  :qid |quant-u-114|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@41@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>)))
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r)))
    (=>
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r))
      (Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>))))
  :qid |qp.fvfDomDef21|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@41@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@41@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef20|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@41@01  $FVF<next>)) g@3@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@36@01 $Ref)) (!
  (=>
    (Set_in n@36@01 g@3@01)
    (and (= (inv@37@01 n@36@01) n@36@01) (img@38@01 n@36@01)))
  :pattern ((Set_in n@36@01 g@3@01))
  :pattern ((inv@37@01 n@36@01))
  :pattern ((img@38@01 n@36@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@38@01 r) (Set_in (inv@37@01 r) g@3@01)) (= (inv@37@01 r) r))
  :pattern ((inv@37@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>)))
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r)))
    (=>
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r))
      (Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@41@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@41@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@37@01 r) g@3@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
    :pattern ((inv@37@01 r))
    :qid |quant-u-108|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@41@01  $FVF<next>)) g@3@01)))
; [eval] edge(old($$(g)), v1, v2) || v1 == x && v2 == y
; [eval] edge(old($$(g)), v1, v2)
; [eval] old($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 6
(declare-const n@42@01 $Ref)
(push) ; 7
; [eval] (n in refs)
(assert (Set_in n@42@01 g@3@01))
(pop) ; 7
(declare-fun inv@43@01 ($Ref) $Ref)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@42@01 $Ref) (n2@42@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@42@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n1@42@01) n1@42@01))
      (and
        (Set_in n2@42@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n2@42@01) n2@42@01))
      (= n1@42@01 n2@42@01))
    (= n1@42@01 n2@42@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@42@01 $Ref)) (!
  (=>
    (Set_in n@42@01 g@3@01)
    (and (= (inv@43@01 n@42@01) n@42@01) (img@44@01 n@42@01)))
  :pattern ((Set_in n@42@01 g@3@01))
  :pattern ((inv@43@01 n@42@01))
  :pattern ((img@44@01 n@42@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@44@01 r) (Set_in (inv@43@01 r) g@3@01)) (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@43@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
  :pattern ((inv@43@01 r))
  :qid |quant-u-116|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref) (v1@34@01 $Ref) (v2@35@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r) (= r (inv@43@01 r)))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@46@01 ((r $Ref) (v1@34@01 $Ref) (v2@35@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r) (= r (inv@43@01 r)))
    ($Perm.min
      (ite (= r x@4@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@45@01 r v1@34@01 v2@35@01)))
    $Perm.No))
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
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@45@01 r v1@34@01 v2@35@01))
    $Perm.No)
  
  :qid |quant-u-118|))))
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
    (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r) (= r (inv@43@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@45@01 r v1@34@01 v2@35@01))
      $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@46@01 x@4@01 v1@34@01 v2@35@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@46@01 r v1@34@01 v2@35@01) $Perm.No)
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r) (= r (inv@43@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@45@01 r v1@34@01 v2@35@01))
        (pTaken@46@01 r v1@34@01 v2@35@01))
      $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@47@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>)))
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r)))
    (=>
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r))
      (Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>))))
  :qid |qp.fvfDomDef25|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@42@01 $Ref)) (!
  (=>
    (Set_in n@42@01 g@3@01)
    (and (= (inv@43@01 n@42@01) n@42@01) (img@44@01 n@42@01)))
  :pattern ((Set_in n@42@01 g@3@01))
  :pattern ((inv@43@01 n@42@01))
  :pattern ((img@44@01 n@42@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@44@01 r) (Set_in (inv@43@01 r) g@3@01)) (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>)))
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r)))
    (=>
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r))
      (Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>))))
  :qid |qp.fvfDomDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@43@01 r) g@3@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
    :pattern ((inv@43@01 r))
    :qid |quant-u-116|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01)))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 9 | edge[Bool]($$(sm@47@01, g@3@01), v1@34@01, v2@35@01) | live]
; [else-branch: 9 | !(edge[Bool]($$(sm@47@01, g@3@01), v1@34@01, v2@35@01)) | live]
(push) ; 7
; [then-branch: 9 | edge[Bool]($$(sm@47@01, g@3@01), v1@34@01, v2@35@01)]
(assert (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
(pop) ; 7
(push) ; 7
; [else-branch: 9 | !(edge[Bool]($$(sm@47@01, g@3@01), v1@34@01, v2@35@01))]
(assert (not
  (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01)))
; [eval] v1 == x && v2 == y
; [eval] v1 == x
(push) ; 8
; [then-branch: 10 | v1@34@01 != x@4@01 | live]
; [else-branch: 10 | v1@34@01 == x@4@01 | live]
(push) ; 9
; [then-branch: 10 | v1@34@01 != x@4@01]
(assert (not (= v1@34@01 x@4@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 10 | v1@34@01 == x@4@01]
(assert (= v1@34@01 x@4@01))
; [eval] v2 == y
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (= v1@34@01 x@4@01) (not (= v1@34@01 x@4@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
  (and
    (not
      (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
    (or (= v1@34@01 x@4@01) (not (= v1@34@01 x@4@01))))))
(assert (or
  (not
    (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
  (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@36@01 $Ref)) (!
  (=>
    (Set_in n@36@01 g@3@01)
    (and (= (inv@37@01 n@36@01) n@36@01) (img@38@01 n@36@01)))
  :pattern ((Set_in n@36@01 g@3@01))
  :pattern ((inv@37@01 n@36@01))
  :pattern ((img@38@01 n@36@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@38@01 r) (Set_in (inv@37@01 r) g@3@01)) (= (inv@37@01 r) r))
  :pattern ((inv@37@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>)))
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r)))
    (=>
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r))
      (Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@41@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@41@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (forall ((n@42@01 $Ref)) (!
  (=>
    (Set_in n@42@01 g@3@01)
    (and (= (inv@43@01 n@42@01) n@42@01) (img@44@01 n@42@01)))
  :pattern ((Set_in n@42@01 g@3@01))
  :pattern ((inv@43@01 n@42@01))
  :pattern ((img@44@01 n@42@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@44@01 r) (Set_in (inv@43@01 r) g@3@01)) (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>)))
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r)))
    (=>
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r))
      (Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>))))
  :qid |qp.fvfDomDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@37@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
  :pattern ((inv@37@01 r))
  :qid |quant-u-108|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@41@01  $FVF<next>)) g@3@01))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@43@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
  :pattern ((inv@43@01 r))
  :qid |quant-u-116|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v1@34@01 $Ref) (v2@35@01 $Ref)) (!
  (and
    (=>
      (not
        (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
      (and
        (not
          (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
        (or (= v1@34@01 x@4@01) (not (= v1@34@01 x@4@01)))))
    (or
      (not
        (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
      (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01)))
  :pattern ((edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@270@27@272@78-aux|)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | y@5@01 == Null]
(assert (= y@5@01 $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((n@36@01 $Ref)) (!
  (=>
    (Set_in n@36@01 g@3@01)
    (and (= (inv@37@01 n@36@01) n@36@01) (img@38@01 n@36@01)))
  :pattern ((Set_in n@36@01 g@3@01))
  :pattern ((inv@37@01 n@36@01))
  :pattern ((img@38@01 n@36@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@38@01 r) (Set_in (inv@37@01 r) g@3@01)) (= (inv@37@01 r) r))
  :pattern ((inv@37@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>)))
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r)))
    (=>
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r))
      (Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@41@01  $FVF<next>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@41@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@37@01 r) g@3@01) (img@38@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@41@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (forall ((n@42@01 $Ref)) (!
  (=>
    (Set_in n@42@01 g@3@01)
    (and (= (inv@43@01 n@42@01) n@42@01) (img@44@01 n@42@01)))
  :pattern ((Set_in n@42@01 g@3@01))
  :pattern ((inv@43@01 n@42@01))
  :pattern ((img@44@01 n@42@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@44@01 r) (Set_in (inv@43@01 r) g@3@01)) (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>)))
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r)))
    (=>
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r))
      (Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@47@01  $FVF<next>))))
  :qid |qp.fvfDomDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@43@01 r) g@3@01) (img@44@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (=>
  (not (= y@5@01 $Ref.null))
  (and
    (not (= y@5@01 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@37@01 r) g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
      :pattern ((inv@37@01 r))
      :qid |quant-u-108|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@41@01  $FVF<next>)) g@3@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@43@01 r) g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
      :pattern ((inv@43@01 r))
      :qid |quant-u-116|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01)
    (forall ((v1@34@01 $Ref) (v2@35@01 $Ref)) (!
      (and
        (=>
          (not
            (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
          (and
            (not
              (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
            (or (= v1@34@01 x@4@01) (not (= v1@34@01 x@4@01)))))
        (or
          (not
            (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
          (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01)))
      :pattern ((edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
      :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@270@27@272@78-aux|)))))
; Joined path conditions
(assert (=>
  (not (= y@5@01 $Ref.null))
  (forall ((v1@34@01 $Ref) (v2@35@01 $Ref)) (!
    (=
      (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@41@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01)
      (or
        (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01)
        (and (= v1@34@01 x@4@01) (= v2@35@01 y@5@01))))
    :pattern ((edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@47@01  $FVF<next>)) g@3@01) v1@34@01 v2@35@01))
    :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@270@27@272@78|))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
  $Snap.unit))
; [eval] y != null ==> (forall v1: Ref, v2: Ref :: { exists_path($$(g), v1, v2) } v1 != v2 ==> exists_path($$(g), v1, v2) == (exists_path(old($$(g)), v1, v2) || exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), y, v2)))
; [eval] y != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@5@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= y@5@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; [then-branch: 11 | y@5@01 != Null | live]
; [else-branch: 11 | y@5@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | y@5@01 != Null]
(assert (not (= y@5@01 $Ref.null)))
; [eval] (forall v1: Ref, v2: Ref :: { exists_path($$(g), v1, v2) } v1 != v2 ==> exists_path($$(g), v1, v2) == (exists_path(old($$(g)), v1, v2) || exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), y, v2)))
(declare-const v1@48@01 $Ref)
(declare-const v2@49@01 $Ref)
(push) ; 5
; [eval] v1 != v2 ==> exists_path($$(g), v1, v2) == (exists_path(old($$(g)), v1, v2) || exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), y, v2))
; [eval] v1 != v2
(push) ; 6
; [then-branch: 12 | v1@48@01 != v2@49@01 | live]
; [else-branch: 12 | v1@48@01 == v2@49@01 | live]
(push) ; 7
; [then-branch: 12 | v1@48@01 != v2@49@01]
(assert (not (= v1@48@01 v2@49@01)))
; [eval] exists_path($$(g), v1, v2) == (exists_path(old($$(g)), v1, v2) || exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), y, v2))
; [eval] exists_path($$(g), v1, v2)
; [eval] $$(g)
(push) ; 8
(declare-const n@50@01 $Ref)
(push) ; 9
; [eval] (n in refs)
(assert (Set_in n@50@01 g@3@01))
(pop) ; 9
(declare-fun inv@51@01 ($Ref) $Ref)
(declare-fun img@52@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 9
(assert (not (forall ((n1@50@01 $Ref) (n2@50@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@50@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n1@50@01) n1@50@01))
      (and
        (Set_in n2@50@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n2@50@01) n2@50@01))
      (= n1@50@01 n2@50@01))
    (= n1@50@01 n2@50@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@50@01 $Ref)) (!
  (=>
    (Set_in n@50@01 g@3@01)
    (and (= (inv@51@01 n@50@01) n@50@01) (img@52@01 n@50@01)))
  :pattern ((Set_in n@50@01 g@3@01))
  :pattern ((inv@51@01 n@50@01))
  :pattern ((img@52@01 n@50@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@52@01 r) (Set_in (inv@51@01 r) g@3@01)) (= (inv@51@01 r) r))
  :pattern ((inv@51@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@51@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
  :pattern ((inv@51@01 r))
  :qid |quant-u-124|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@53@01 ((r $Ref) (v1@48@01 $Ref) (v2@49@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r) (= r (inv@51@01 r)))
    ($Perm.min
      (ite
        (and
          (img@19@01 r)
          (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@54@01 ((r $Ref) (v1@48@01 $Ref) (v2@49@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r) (= r (inv@51@01 r)))
    ($Perm.min
      (ite (= r x@4@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@53@01 r v1@48@01 v2@49@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@19@01 r)
          (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@53@01 r v1@48@01 v2@49@01))
    $Perm.No)
  
  :qid |quant-u-126|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r) (= r (inv@51@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@53@01 r v1@48@01 v2@49@01))
      $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@54@01 x@4@01 v1@48@01 v2@49@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@54@01 r v1@48@01 v2@49@01) $Perm.No)
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r) (= r (inv@51@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@53@01 r v1@48@01 v2@49@01))
        (pTaken@54@01 r v1@48@01 v2@49@01))
      $Perm.No))
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@55@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)))
    (=>
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>))))
  :qid |qp.fvfDomDef29|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef28|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@55@01  $FVF<next>)) g@3@01))
(pop) ; 8
; Joined path conditions
(assert (forall ((n@50@01 $Ref)) (!
  (=>
    (Set_in n@50@01 g@3@01)
    (and (= (inv@51@01 n@50@01) n@50@01) (img@52@01 n@50@01)))
  :pattern ((Set_in n@50@01 g@3@01))
  :pattern ((inv@51@01 n@50@01))
  :pattern ((img@52@01 n@50@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@52@01 r) (Set_in (inv@51@01 r) g@3@01)) (= (inv@51@01 r) r))
  :pattern ((inv@51@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)))
    (=>
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>))))
  :qid |qp.fvfDomDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef28|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@51@01 r) g@3@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
    :pattern ((inv@51@01 r))
    :qid |quant-u-124|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@55@01  $FVF<next>)) g@3@01)))
; [eval] exists_path(old($$(g)), v1, v2) || exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), y, v2)
; [eval] exists_path(old($$(g)), v1, v2)
; [eval] old($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 8
(declare-const n@56@01 $Ref)
(push) ; 9
; [eval] (n in refs)
(assert (Set_in n@56@01 g@3@01))
(pop) ; 9
(declare-fun inv@57@01 ($Ref) $Ref)
(declare-fun img@58@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 9
(assert (not (forall ((n1@56@01 $Ref) (n2@56@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@56@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n1@56@01) n1@56@01))
      (and
        (Set_in n2@56@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) n2@56@01) n2@56@01))
      (= n1@56@01 n2@56@01))
    (= n1@56@01 n2@56@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@56@01 $Ref)) (!
  (=>
    (Set_in n@56@01 g@3@01)
    (and (= (inv@57@01 n@56@01) n@56@01) (img@58@01 n@56@01)))
  :pattern ((Set_in n@56@01 g@3@01))
  :pattern ((inv@57@01 n@56@01))
  :pattern ((img@58@01 n@56@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@58@01 r) (Set_in (inv@57@01 r) g@3@01)) (= (inv@57@01 r) r))
  :pattern ((inv@57@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@57@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
  :pattern ((inv@57@01 r))
  :qid |quant-u-132|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@59@01 ((r $Ref) (v1@48@01 $Ref) (v2@49@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r) (= r (inv@57@01 r)))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@60@01 ((r $Ref) (v1@48@01 $Ref) (v2@49@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r) (= r (inv@57@01 r)))
    ($Perm.min
      (ite (= r x@4@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@59@01 r v1@48@01 v2@49@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@59@01 r v1@48@01 v2@49@01))
    $Perm.No)
  
  :qid |quant-u-134|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r) (= r (inv@57@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@59@01 r v1@48@01 v2@49@01))
      $Perm.No))
  
  :qid |quant-u-135|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@60@01 x@4@01 v1@48@01 v2@49@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@60@01 r v1@48@01 v2@49@01) $Perm.No)
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r) (= r (inv@57@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@59@01 r v1@48@01 v2@49@01))
        (pTaken@60@01 r v1@48@01 v2@49@01))
      $Perm.No))
  
  :qid |quant-u-138|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@61@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)))
    (=>
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>))))
  :qid |qp.fvfDomDef33|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01))
(pop) ; 8
; Joined path conditions
(assert (forall ((n@56@01 $Ref)) (!
  (=>
    (Set_in n@56@01 g@3@01)
    (and (= (inv@57@01 n@56@01) n@56@01) (img@58@01 n@56@01)))
  :pattern ((Set_in n@56@01 g@3@01))
  :pattern ((inv@57@01 n@56@01))
  :pattern ((img@58@01 n@56@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@58@01 r) (Set_in (inv@57@01 r) g@3@01)) (= (inv@57@01 r) r))
  :pattern ((inv@57@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)))
    (=>
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@57@01 r) g@3@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
    :pattern ((inv@57@01 r))
    :qid |quant-u-132|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01)))
(set-option :timeout 0)
(push) ; 8
; [then-branch: 13 | exists_path[Bool]($$(sm@61@01, g@3@01), v1@48@01, v2@49@01) | live]
; [else-branch: 13 | !(exists_path[Bool]($$(sm@61@01, g@3@01), v1@48@01, v2@49@01)) | live]
(push) ; 9
; [then-branch: 13 | exists_path[Bool]($$(sm@61@01, g@3@01), v1@48@01, v2@49@01)]
(assert (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
(pop) ; 9
(push) ; 9
; [else-branch: 13 | !(exists_path[Bool]($$(sm@61@01, g@3@01), v1@48@01, v2@49@01))]
(assert (not
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01)))
; [eval] exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), y, v2)
; [eval] exists_path(old($$(g)), v1, x)
; [eval] old($$(g))
; [eval] $$(g)
(push) ; 10
(declare-const n@62@01 $Ref)
(push) ; 11
; [eval] (n in refs)
(assert (Set_in n@62@01 g@3@01))
(pop) ; 11
(declare-fun inv@63@01 ($Ref) $Ref)
(declare-fun img@64@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@65@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef36|)))
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((n1@62@01 $Ref) (n2@62@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@62@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@65@01  $FVF<next>) n1@62@01) n1@62@01))
      (and
        (Set_in n2@62@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@65@01  $FVF<next>) n2@62@01) n2@62@01))
      (= n1@62@01 n2@62@01))
    (= n1@62@01 n2@62@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@62@01 $Ref)) (!
  (=>
    (Set_in n@62@01 g@3@01)
    (and (= (inv@63@01 n@62@01) n@62@01) (img@64@01 n@62@01)))
  :pattern ((Set_in n@62@01 g@3@01))
  :pattern ((inv@63@01 n@62@01))
  :pattern ((img@64@01 n@62@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@64@01 r) (Set_in (inv@63@01 r) g@3@01)) (= (inv@63@01 r) r))
  :pattern ((inv@63@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@63@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@65@01  $FVF<next>) r) r))
  :pattern ((inv@63@01 r))
  :qid |quant-u-140|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@66@01 ((r $Ref) (v1@48@01 $Ref) (v2@49@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r) (= r (inv@63@01 r)))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@67@01 ((r $Ref) (v1@48@01 $Ref) (v2@49@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r) (= r (inv@63@01 r)))
    ($Perm.min
      (ite (= r x@4@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@66@01 r v1@48@01 v2@49@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@66@01 r v1@48@01 v2@49@01))
    $Perm.No)
  
  :qid |quant-u-142|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r) (= r (inv@63@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@66@01 r v1@48@01 v2@49@01))
      $Perm.No))
  
  :qid |quant-u-143|))))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@67@01 x@4@01 v1@48@01 v2@49@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@67@01 r v1@48@01 v2@49@01) $Perm.No)
  
  :qid |quant-u-145|))))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r) (= r (inv@63@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@66@01 r v1@48@01 v2@49@01))
        (pTaken@67@01 r v1@48@01 v2@49@01))
      $Perm.No))
  
  :qid |quant-u-146|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@68@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)))
    (=>
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>))))
  :qid |qp.fvfDomDef40|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01))
(pop) ; 10
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@62@01 $Ref)) (!
  (=>
    (Set_in n@62@01 g@3@01)
    (and (= (inv@63@01 n@62@01) n@62@01) (img@64@01 n@62@01)))
  :pattern ((Set_in n@62@01 g@3@01))
  :pattern ((inv@63@01 n@62@01))
  :pattern ((img@64@01 n@62@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@64@01 r) (Set_in (inv@63@01 r) g@3@01)) (= (inv@63@01 r) r))
  :pattern ((inv@63@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)))
    (=>
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@63@01 r) g@3@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@65@01  $FVF<next>) r) r))
    :pattern ((inv@63@01 r))
    :qid |quant-u-140|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01)))
(set-option :timeout 0)
(push) ; 10
; [then-branch: 14 | !(exists_path[Bool]($$(sm@68@01, g@3@01), v1@48@01, x@4@01)) | live]
; [else-branch: 14 | exists_path[Bool]($$(sm@68@01, g@3@01), v1@48@01, x@4@01) | live]
(push) ; 11
; [then-branch: 14 | !(exists_path[Bool]($$(sm@68@01, g@3@01), v1@48@01, x@4@01))]
(assert (not
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 14 | exists_path[Bool]($$(sm@68@01, g@3@01), v1@48@01, x@4@01)]
(assert (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01))
; [eval] exists_path(old($$(g)), y, v2)
; [eval] old($$(g))
; [eval] $$(g)
(push) ; 12
(declare-const n@69@01 $Ref)
(push) ; 13
; [eval] (n in refs)
(assert (Set_in n@69@01 g@3@01))
(pop) ; 13
(declare-fun inv@70@01 ($Ref) $Ref)
(declare-fun img@71@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@72@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef43|)))
; Check receiver injectivity
(push) ; 13
(assert (not (forall ((n1@69@01 $Ref) (n2@69@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@69@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@72@01  $FVF<next>) n1@69@01) n1@69@01))
      (and
        (Set_in n2@69@01 g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@72@01  $FVF<next>) n2@69@01) n2@69@01))
      (= n1@69@01 n2@69@01))
    (= n1@69@01 n2@69@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@69@01 $Ref)) (!
  (=>
    (Set_in n@69@01 g@3@01)
    (and (= (inv@70@01 n@69@01) n@69@01) (img@71@01 n@69@01)))
  :pattern ((Set_in n@69@01 g@3@01))
  :pattern ((inv@70@01 n@69@01))
  :pattern ((img@71@01 n@69@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@71@01 r) (Set_in (inv@70@01 r) g@3@01)) (= (inv@70@01 r) r))
  :pattern ((inv@70@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@70@01 r) g@3@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@72@01  $FVF<next>) r) r))
  :pattern ((inv@70@01 r))
  :qid |quant-u-148|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@73@01 ((r $Ref) (v1@48@01 $Ref) (v2@49@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r) (= r (inv@70@01 r)))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@74@01 ((r $Ref) (v1@48@01 $Ref) (v2@49@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r) (= r (inv@70@01 r)))
    ($Perm.min
      (ite (= r x@4@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@73@01 r v1@48@01 v2@49@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@73@01 r v1@48@01 v2@49@01))
    $Perm.No)
  
  :qid |quant-u-150|))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r) (= r (inv@70@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@73@01 r v1@48@01 v2@49@01))
      $Perm.No))
  
  :qid |quant-u-151|))))
(check-sat)
; unknown
(pop) ; 13
; 0,03s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@74@01 x@4@01 v1@48@01 v2@49@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0,05s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@74@01 r v1@48@01 v2@49@01) $Perm.No)
  
  :qid |quant-u-153|))))
(check-sat)
; unknown
(pop) ; 13
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r) (= r (inv@70@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@73@01 r v1@48@01 v2@49@01))
        (pTaken@74@01 r v1@48@01 v2@49@01))
      $Perm.No))
  
  :qid |quant-u-154|))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@75@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)))
    (=>
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>))))
  :qid |qp.fvfDomDef47|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef46|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@75@01  $FVF<next>)) g@3@01))
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@69@01 $Ref)) (!
  (=>
    (Set_in n@69@01 g@3@01)
    (and (= (inv@70@01 n@69@01) n@69@01) (img@71@01 n@69@01)))
  :pattern ((Set_in n@69@01 g@3@01))
  :pattern ((inv@70@01 n@69@01))
  :pattern ((img@71@01 n@69@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@71@01 r) (Set_in (inv@70@01 r) g@3@01)) (= (inv@70@01 r) r))
  :pattern ((inv@70@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)))
    (=>
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@70@01 r) g@3@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@72@01  $FVF<next>) r) r))
    :pattern ((inv@70@01 r))
    :qid |quant-u-148|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@75@01  $FVF<next>)) g@3@01)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@69@01 $Ref)) (!
  (=>
    (Set_in n@69@01 g@3@01)
    (and (= (inv@70@01 n@69@01) n@69@01) (img@71@01 n@69@01)))
  :pattern ((Set_in n@69@01 g@3@01))
  :pattern ((inv@70@01 n@69@01))
  :pattern ((img@71@01 n@69@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@71@01 r) (Set_in (inv@70@01 r) g@3@01)) (= (inv@70@01 r) r))
  :pattern ((inv@70@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)))
    (=>
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (=>
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
  (and
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@70@01 r) g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@72@01  $FVF<next>) r) r))
      :pattern ((inv@70@01 r))
      :qid |quant-u-148|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@75@01  $FVF<next>)) g@3@01))))
(assert (or
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
  (not
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@62@01 $Ref)) (!
  (=>
    (Set_in n@62@01 g@3@01)
    (and (= (inv@63@01 n@62@01) n@62@01) (img@64@01 n@62@01)))
  :pattern ((Set_in n@62@01 g@3@01))
  :pattern ((inv@63@01 n@62@01))
  :pattern ((img@64@01 n@62@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@64@01 r) (Set_in (inv@63@01 r) g@3@01)) (= (inv@63@01 r) r))
  :pattern ((inv@63@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)))
    (=>
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@69@01 $Ref)) (!
  (=>
    (Set_in n@69@01 g@3@01)
    (and (= (inv@70@01 n@69@01) n@69@01) (img@71@01 n@69@01)))
  :pattern ((Set_in n@69@01 g@3@01))
  :pattern ((inv@70@01 n@69@01))
  :pattern ((img@71@01 n@69@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@71@01 r) (Set_in (inv@70@01 r) g@3@01)) (= (inv@70@01 r) r))
  :pattern ((inv@70@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)))
    (=>
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (=>
  (not
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
  (and
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@63@01 r) g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@65@01  $FVF<next>) r) r))
      :pattern ((inv@63@01 r))
      :qid |quant-u-140|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01)
    (=>
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
      (and
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@70@01 r) g@3@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@72@01  $FVF<next>) r) r))
          :pattern ((inv@70@01 r))
          :qid |quant-u-148|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@75@01  $FVF<next>)) g@3@01)))
    (or
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01))))))
(assert (or
  (not
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01)))
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 12 | v1@48@01 == v2@49@01]
(assert (= v1@48@01 v2@49@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((n@50@01 $Ref)) (!
  (=>
    (Set_in n@50@01 g@3@01)
    (and (= (inv@51@01 n@50@01) n@50@01) (img@52@01 n@50@01)))
  :pattern ((Set_in n@50@01 g@3@01))
  :pattern ((inv@51@01 n@50@01))
  :pattern ((img@52@01 n@50@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@52@01 r) (Set_in (inv@51@01 r) g@3@01)) (= (inv@51@01 r) r))
  :pattern ((inv@51@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)))
    (=>
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>))))
  :qid |qp.fvfDomDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef28|)))
(assert (forall ((n@56@01 $Ref)) (!
  (=>
    (Set_in n@56@01 g@3@01)
    (and (= (inv@57@01 n@56@01) n@56@01) (img@58@01 n@56@01)))
  :pattern ((Set_in n@56@01 g@3@01))
  :pattern ((inv@57@01 n@56@01))
  :pattern ((img@58@01 n@56@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@58@01 r) (Set_in (inv@57@01 r) g@3@01)) (= (inv@57@01 r) r))
  :pattern ((inv@57@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)))
    (=>
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@62@01 $Ref)) (!
  (=>
    (Set_in n@62@01 g@3@01)
    (and (= (inv@63@01 n@62@01) n@62@01) (img@64@01 n@62@01)))
  :pattern ((Set_in n@62@01 g@3@01))
  :pattern ((inv@63@01 n@62@01))
  :pattern ((img@64@01 n@62@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@64@01 r) (Set_in (inv@63@01 r) g@3@01)) (= (inv@63@01 r) r))
  :pattern ((inv@63@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)))
    (=>
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@69@01 $Ref)) (!
  (=>
    (Set_in n@69@01 g@3@01)
    (and (= (inv@70@01 n@69@01) n@69@01) (img@71@01 n@69@01)))
  :pattern ((Set_in n@69@01 g@3@01))
  :pattern ((inv@70@01 n@69@01))
  :pattern ((img@71@01 n@69@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@71@01 r) (Set_in (inv@70@01 r) g@3@01)) (= (inv@70@01 r) r))
  :pattern ((inv@70@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)))
    (=>
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (=>
  (not (= v1@48@01 v2@49@01))
  (and
    (not (= v1@48@01 v2@49@01))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@51@01 r) g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
      :pattern ((inv@51@01 r))
      :qid |quant-u-124|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@55@01  $FVF<next>)) g@3@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@57@01 r) g@3@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
      :pattern ((inv@57@01 r))
      :qid |quant-u-132|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01)
    (=>
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
      (and
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@63@01 r) g@3@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@65@01  $FVF<next>) r) r))
          :pattern ((inv@63@01 r))
          :qid |quant-u-140|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01)
        (=>
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
          (and
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@70@01 r) g@3@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@72@01  $FVF<next>) r) r))
              :pattern ((inv@70@01 r))
              :qid |quant-u-148|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@75@01  $FVF<next>)) g@3@01)))
        (or
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)))))
    (or
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01)))))
; Joined path conditions
(assert (or (= v1@48@01 v2@49@01) (not (= v1@48@01 v2@49@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@50@01 $Ref)) (!
  (=>
    (Set_in n@50@01 g@3@01)
    (and (= (inv@51@01 n@50@01) n@50@01) (img@52@01 n@50@01)))
  :pattern ((Set_in n@50@01 g@3@01))
  :pattern ((inv@51@01 n@50@01))
  :pattern ((img@52@01 n@50@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@52@01 r) (Set_in (inv@51@01 r) g@3@01)) (= (inv@51@01 r) r))
  :pattern ((inv@51@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)))
    (=>
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>))))
  :qid |qp.fvfDomDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef28|)))
(assert (forall ((n@56@01 $Ref)) (!
  (=>
    (Set_in n@56@01 g@3@01)
    (and (= (inv@57@01 n@56@01) n@56@01) (img@58@01 n@56@01)))
  :pattern ((Set_in n@56@01 g@3@01))
  :pattern ((inv@57@01 n@56@01))
  :pattern ((img@58@01 n@56@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@58@01 r) (Set_in (inv@57@01 r) g@3@01)) (= (inv@57@01 r) r))
  :pattern ((inv@57@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)))
    (=>
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@62@01 $Ref)) (!
  (=>
    (Set_in n@62@01 g@3@01)
    (and (= (inv@63@01 n@62@01) n@62@01) (img@64@01 n@62@01)))
  :pattern ((Set_in n@62@01 g@3@01))
  :pattern ((inv@63@01 n@62@01))
  :pattern ((img@64@01 n@62@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@64@01 r) (Set_in (inv@63@01 r) g@3@01)) (= (inv@63@01 r) r))
  :pattern ((inv@63@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)))
    (=>
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@69@01 $Ref)) (!
  (=>
    (Set_in n@69@01 g@3@01)
    (and (= (inv@70@01 n@69@01) n@69@01) (img@71@01 n@69@01)))
  :pattern ((Set_in n@69@01 g@3@01))
  :pattern ((inv@70@01 n@69@01))
  :pattern ((img@71@01 n@69@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@71@01 r) (Set_in (inv@70@01 r) g@3@01)) (= (inv@70@01 r) r))
  :pattern ((inv@70@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)))
    (=>
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef46|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v1@48@01 $Ref) (v2@49@01 $Ref)) (!
  (and
    (=>
      (not (= v1@48@01 v2@49@01))
      (and
        (not (= v1@48@01 v2@49@01))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@51@01 r) g@3@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
          :pattern ((inv@51@01 r))
          :qid |quant-u-124|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@55@01  $FVF<next>)) g@3@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@57@01 r) g@3@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
          :pattern ((inv@57@01 r))
          :qid |quant-u-132|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01)
        (=>
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
          (and
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@63@01 r) g@3@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@65@01  $FVF<next>) r) r))
              :pattern ((inv@63@01 r))
              :qid |quant-u-140|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01)
            (=>
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
              (and
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
                (forall ((r $Ref)) (!
                  (=>
                    (Set_in (inv@70@01 r) g@3@01)
                    ($FVF.loc_next ($FVF.lookup_next (as sm@72@01  $FVF<next>) r) r))
                  :pattern ((inv@70@01 r))
                  :qid |quant-u-148|))
                ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@75@01  $FVF<next>)) g@3@01)))
            (or
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
              (not
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)))))
        (or
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))))
    (or (= v1@48@01 v2@49@01) (not (= v1@48@01 v2@49@01))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@55@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@273@28@277@117-aux|)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | y@5@01 == Null]
(assert (= y@5@01 $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((n@50@01 $Ref)) (!
  (=>
    (Set_in n@50@01 g@3@01)
    (and (= (inv@51@01 n@50@01) n@50@01) (img@52@01 n@50@01)))
  :pattern ((Set_in n@50@01 g@3@01))
  :pattern ((inv@51@01 n@50@01))
  :pattern ((img@52@01 n@50@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@52@01 r) (Set_in (inv@51@01 r) g@3@01)) (= (inv@51@01 r) r))
  :pattern ((inv@51@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)))
    (=>
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@55@01  $FVF<next>))))
  :qid |qp.fvfDomDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@51@01 r) g@3@01) (img@52@01 r))
      (and
        (img@19@01 r)
        (and (Set_in (inv@18@01 r) g@3@01) (not (= (inv@18@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@55@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@15@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@55@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef28|)))
(assert (forall ((n@56@01 $Ref)) (!
  (=>
    (Set_in n@56@01 g@3@01)
    (and (= (inv@57@01 n@56@01) n@56@01) (img@58@01 n@56@01)))
  :pattern ((Set_in n@56@01 g@3@01))
  :pattern ((inv@57@01 n@56@01))
  :pattern ((img@58@01 n@56@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@58@01 r) (Set_in (inv@57@01 r) g@3@01)) (= (inv@57@01 r) r))
  :pattern ((inv@57@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)))
    (=>
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@61@01  $FVF<next>))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@57@01 r) g@3@01) (img@58@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@61@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@61@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@65@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@65@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@62@01 $Ref)) (!
  (=>
    (Set_in n@62@01 g@3@01)
    (and (= (inv@63@01 n@62@01) n@62@01) (img@64@01 n@62@01)))
  :pattern ((Set_in n@62@01 g@3@01))
  :pattern ((inv@63@01 n@62@01))
  :pattern ((img@64@01 n@62@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@64@01 r) (Set_in (inv@63@01 r) g@3@01)) (= (inv@63@01 r) r))
  :pattern ((inv@63@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)))
    (=>
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@68@01  $FVF<next>))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@63@01 r) g@3@01) (img@64@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@4@01)
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01))))
    (=
      ($FVF.lookup_next (as sm@72@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@72@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@69@01 $Ref)) (!
  (=>
    (Set_in n@69@01 g@3@01)
    (and (= (inv@70@01 n@69@01) n@69@01) (img@71@01 n@69@01)))
  :pattern ((Set_in n@69@01 g@3@01))
  :pattern ((inv@70@01 n@69@01))
  :pattern ((img@71@01 n@69@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@71@01 r) (Set_in (inv@70@01 r) g@3@01)) (= (inv@70@01 r) r))
  :pattern ((inv@70@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)))
    (=>
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@75@01  $FVF<next>))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r)) (= r x@4@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@70@01 r) g@3@01) (img@71@01 r))
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) g@3@01) (not (= (inv@10@01 r) x@4@01)))))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))) r) r))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (=>
  (not (= y@5@01 $Ref.null))
  (and
    (not (= y@5@01 $Ref.null))
    (forall ((v1@48@01 $Ref) (v2@49@01 $Ref)) (!
      (and
        (=>
          (not (= v1@48@01 v2@49@01))
          (and
            (not (= v1@48@01 v2@49@01))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@51@01 r) g@3@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) r) r))
              :pattern ((inv@51@01 r))
              :qid |quant-u-124|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@55@01  $FVF<next>)) g@3@01)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@57@01 r) g@3@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@12@01  $FVF<next>) r) r))
              :pattern ((inv@57@01 r))
              :qid |quant-u-132|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01)
            (=>
              (not
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
              (and
                (not
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
                (forall ((r $Ref)) (!
                  (=>
                    (Set_in (inv@63@01 r) g@3@01)
                    ($FVF.loc_next ($FVF.lookup_next (as sm@65@01  $FVF<next>) r) r))
                  :pattern ((inv@63@01 r))
                  :qid |quant-u-140|))
                ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01)
                (=>
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
                  (and
                    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
                    (forall ((r $Ref)) (!
                      (=>
                        (Set_in (inv@70@01 r) g@3@01)
                        ($FVF.loc_next ($FVF.lookup_next (as sm@72@01  $FVF<next>) r) r))
                      :pattern ((inv@70@01 r))
                      :qid |quant-u-148|))
                    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@75@01  $FVF<next>)) g@3@01)))
                (or
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
                  (not
                    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)))))
            (or
              (not
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))))
        (or (= v1@48@01 v2@49@01) (not (= v1@48@01 v2@49@01))))
      :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@55@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
      :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@273@28@277@117-aux|)))))
; Joined path conditions
(assert (=>
  (not (= y@5@01 $Ref.null))
  (forall ((v1@48@01 $Ref) (v2@49@01 $Ref)) (!
    (=>
      (not (= v1@48@01 v2@49@01))
      (=
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@55@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01)
        (or
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@61@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01)
          (and
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@68@01  $FVF<next>)) g@3@01) v1@48@01 x@4@01)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@75@01  $FVF<next>)) g@3@01) y@5@01 v2@49@01)))))
    :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@55@01  $FVF<next>)) g@3@01) v1@48@01 v2@49@01))
    :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@273@28@277@117|))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- unlink ----------
(declare-const g@76@01 Set<$Ref>)
(declare-const x@77@01 $Ref)
(declare-const g@78@01 Set<$Ref>)
(declare-const x@79@01 $Ref)
(push) ; 1
(declare-const $t@80@01 $Snap)
(assert (= $t@80@01 ($Snap.combine ($Snap.first $t@80@01) ($Snap.second $t@80@01))))
(assert (= ($Snap.first $t@80@01) $Snap.unit))
; [eval] (x in g)
(assert (Set_in x@79@01 g@78@01))
(assert (=
  ($Snap.second $t@80@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@80@01))
    ($Snap.second ($Snap.second $t@80@01)))))
(assert (= ($Snap.first ($Snap.second $t@80@01)) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (not (Set_in $Ref.null g@78@01)))
(assert (=
  ($Snap.second ($Snap.second $t@80@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@80@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@80@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@80@01))) $Snap.unit))
; [eval] (x in g)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@80@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@80@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))))
(declare-const sm@81@01 $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (as sm@81@01  $FVF<next>) x@79@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))))
(assert (not (= x@79@01 $Ref.null)))
(declare-const sm@82@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@82@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@82@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
  :pattern (($FVF.lookup_next (as sm@82@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef49|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@82@01  $FVF<next>) x@79@01) x@79@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01))))))))
(declare-const n@83@01 $Ref)
(push) ; 2
; [eval] (n in g) && n != x
; [eval] (n in g)
(push) ; 3
; [then-branch: 15 | !(n@83@01 in g@78@01) | live]
; [else-branch: 15 | n@83@01 in g@78@01 | live]
(push) ; 4
; [then-branch: 15 | !(n@83@01 in g@78@01)]
(assert (not (Set_in n@83@01 g@78@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | n@83@01 in g@78@01]
(assert (Set_in n@83@01 g@78@01))
; [eval] n != x
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in n@83@01 g@78@01) (not (Set_in n@83@01 g@78@01))))
(assert (and (Set_in n@83@01 g@78@01) (not (= n@83@01 x@79@01))))
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@84@01 ($Ref) $Ref)
(declare-fun img@85@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n@83@01 $Ref)) (!
  (=>
    (and (Set_in n@83@01 g@78@01) (not (= n@83@01 x@79@01)))
    (or (Set_in n@83@01 g@78@01) (not (Set_in n@83@01 g@78@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) n@83@01) n@83@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@83@01 $Ref) (n2@83@01 $Ref)) (!
  (=>
    (and
      (and (Set_in n1@83@01 g@78@01) (not (= n1@83@01 x@79@01)))
      (and (Set_in n2@83@01 g@78@01) (not (= n2@83@01 x@79@01)))
      (= n1@83@01 n2@83@01))
    (= n1@83@01 n2@83@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@83@01 $Ref)) (!
  (=>
    (and (Set_in n@83@01 g@78@01) (not (= n@83@01 x@79@01)))
    (and (= (inv@84@01 n@83@01) n@83@01) (img@85@01 n@83@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) n@83@01) n@83@01))
  :qid |quant-u-156|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (= (inv@84@01 r) r))
  :pattern ((inv@84@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@83@01 $Ref)) (!
  (=>
    (and (Set_in n@83@01 g@78@01) (not (= n@83@01 x@79@01)))
    (not (= n@83@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) n@83@01) n@83@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@86@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
  :pattern ((inv@84@01 r))
  :qid |quant-u-157|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))
  $Snap.unit))
; [eval] (forall n$0: Ref :: { (n$0.next in g) } { (n$0 in g), n$0.next } (n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@87@01 $Ref)
(push) ; 2
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 3
; [then-branch: 16 | !(n$0@87@01 in g@78@01) | live]
; [else-branch: 16 | n$0@87@01 in g@78@01 | live]
(push) ; 4
; [then-branch: 16 | !(n$0@87@01 in g@78@01)]
(assert (not (Set_in n$0@87@01 g@78@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | n$0@87@01 in g@78@01]
(assert (Set_in n$0@87@01 g@78@01))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@79@01)
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
    :qid |qp.fvfValDef50|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
    :qid |qp.fvfValDef51|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef52|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (ite (= n$0@87@01 x@79@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@85@01 n$0@87@01)
        (and
          (Set_in (inv@84@01 n$0@87@01) g@78@01)
          (not (= (inv@84@01 n$0@87@01) x@79@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (=>
  (Set_in n$0@87@01 g@78@01)
  (and
    (Set_in n$0@87@01 g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01))))
(assert (or (Set_in n$0@87@01 g@78@01) (not (Set_in n$0@87@01 g@78@01))))
(push) ; 3
; [then-branch: 17 | n$0@87@01 in g@78@01 && Lookup(next, sm@86@01, n$0@87@01) != Null | live]
; [else-branch: 17 | !(n$0@87@01 in g@78@01 && Lookup(next, sm@86@01, n$0@87@01) != Null) | live]
(push) ; 4
; [then-branch: 17 | n$0@87@01 in g@78@01 && Lookup(next, sm@86@01, n$0@87@01) != Null]
(assert (and
  (Set_in n$0@87@01 g@78@01)
  (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null))))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@79@01)
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
    :qid |qp.fvfValDef50|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
    :qid |qp.fvfValDef51|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef52|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (ite (= n$0@87@01 x@79@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@85@01 n$0@87@01)
        (and
          (Set_in (inv@84@01 n$0@87@01) g@78@01)
          (not (= (inv@84@01 n$0@87@01) x@79@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 17 | !(n$0@87@01 in g@78@01 && Lookup(next, sm@86@01, n$0@87@01) != Null)]
(assert (not
  (and
    (Set_in n$0@87@01 g@78@01)
    (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (=>
  (and
    (Set_in n$0@87@01 g@78@01)
    (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null)))
  (and
    (Set_in n$0@87@01 g@78@01)
    (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@87@01 g@78@01)
      (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null))))
  (and
    (Set_in n$0@87@01 g@78@01)
    (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef52|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$0@87@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@87@01 g@78@01)
      (and
        (Set_in n$0@87@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01)))
    (or (Set_in n$0@87@01 g@78@01) (not (Set_in n$0@87@01 g@78@01)))
    (=>
      (and
        (Set_in n$0@87@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null)))
      (and
        (Set_in n$0@87@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01)))
    (or
      (not
        (and
          (Set_in n$0@87@01 g@78@01)
          (not
            (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null))))
      (and
        (Set_in n$0@87@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) g@78@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@281@14@281@34-aux|)))
(assert (forall ((n$0@87@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@87@01 g@78@01)
      (and
        (Set_in n$0@87@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01)))
    (or (Set_in n$0@87@01 g@78@01) (not (Set_in n$0@87@01 g@78@01)))
    (=>
      (and
        (Set_in n$0@87@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null)))
      (and
        (Set_in n$0@87@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01)))
    (or
      (not
        (and
          (Set_in n$0@87@01 g@78@01)
          (not
            (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null))))
      (and
        (Set_in n$0@87@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null)))))
  :pattern ((Set_in n$0@87@01 g@78@01) ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@281@14@281@34-aux|)))
(assert (forall ((n$0@87@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@87@01 g@78@01)
      (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) g@78@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) g@78@01))
  :pattern ((Set_in n$0@87@01 g@78@01) ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n$0@87@01) n$0@87@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@281@14@281@34|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@88@01 $Snap)
(assert (= $t@88@01 ($Snap.combine ($Snap.first $t@88@01) ($Snap.second $t@88@01))))
(assert (= ($Snap.first $t@88@01) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (=
  ($Snap.second $t@88@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@88@01))
    ($Snap.second ($Snap.second $t@88@01)))))
(assert (= ($Snap.first ($Snap.second $t@88@01)) $Snap.unit))
; [eval] (x in g)
(assert (=
  ($Snap.second ($Snap.second $t@88@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@88@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))
(declare-const sm@89@01 $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (as sm@89@01  $FVF<next>) x@79@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@88@01))))))
(declare-const sm@90@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@90@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@90@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
  :pattern (($FVF.lookup_next (as sm@90@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef54|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@90@01  $FVF<next>) x@79@01) x@79@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@88@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))))
(declare-const n$1@91@01 $Ref)
(push) ; 3
; [eval] (n$1 in g) && n$1 != x
; [eval] (n$1 in g)
(push) ; 4
; [then-branch: 18 | !(n$1@91@01 in g@78@01) | live]
; [else-branch: 18 | n$1@91@01 in g@78@01 | live]
(push) ; 5
; [then-branch: 18 | !(n$1@91@01 in g@78@01)]
(assert (not (Set_in n$1@91@01 g@78@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | n$1@91@01 in g@78@01]
(assert (Set_in n$1@91@01 g@78@01))
; [eval] n$1 != x
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in n$1@91@01 g@78@01) (not (Set_in n$1@91@01 g@78@01))))
(assert (and (Set_in n$1@91@01 g@78@01) (not (= n$1@91@01 x@79@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@92@01 ($Ref) $Ref)
(declare-fun img@93@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n$1@91@01 $Ref)) (!
  (=>
    (and (Set_in n$1@91@01 g@78@01) (not (= n$1@91@01 x@79@01)))
    (or (Set_in n$1@91@01 g@78@01) (not (Set_in n$1@91@01 g@78@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) n$1@91@01) n$1@91@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n$11@91@01 $Ref) (n$12@91@01 $Ref)) (!
  (=>
    (and
      (and (Set_in n$11@91@01 g@78@01) (not (= n$11@91@01 x@79@01)))
      (and (Set_in n$12@91@01 g@78@01) (not (= n$12@91@01 x@79@01)))
      (= n$11@91@01 n$12@91@01))
    (= n$11@91@01 n$12@91@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$1@91@01 $Ref)) (!
  (=>
    (and (Set_in n$1@91@01 g@78@01) (not (= n$1@91@01 x@79@01)))
    (and (= (inv@92@01 n$1@91@01) n$1@91@01) (img@93@01 n$1@91@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) n$1@91@01) n$1@91@01))
  :qid |quant-u-159|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
    (= (inv@92@01 r) r))
  :pattern ((inv@92@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n$1@91@01 $Ref)) (!
  (=>
    (and (Set_in n$1@91@01 g@78@01) (not (= n$1@91@01 x@79@01)))
    (not (= n$1@91@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) n$1@91@01) n$1@91@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@94@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
  :pattern ((inv@92@01 r))
  :qid |quant-u-160|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))
  $Snap.unit))
; [eval] (forall n$2: Ref :: { (n$2.next in g) } { (n$2 in g), n$2.next } (n$2 in g) && n$2.next != null ==> (n$2.next in g))
(declare-const n$2@95@01 $Ref)
(push) ; 3
; [eval] (n$2 in g) && n$2.next != null ==> (n$2.next in g)
; [eval] (n$2 in g) && n$2.next != null
; [eval] (n$2 in g)
(push) ; 4
; [then-branch: 19 | !(n$2@95@01 in g@78@01) | live]
; [else-branch: 19 | n$2@95@01 in g@78@01 | live]
(push) ; 5
; [then-branch: 19 | !(n$2@95@01 in g@78@01)]
(assert (not (Set_in n$2@95@01 g@78@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | n$2@95@01 in g@78@01]
(assert (Set_in n$2@95@01 g@78@01))
; [eval] n$2.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@79@01)
      (=
        ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
    :qid |qp.fvfValDef55|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
      (=
        ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
    :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
    :qid |qp.fvfValDef56|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
    :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef57|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite (= n$2@95@01 x@79@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@93@01 n$2@95@01)
        (and
          (Set_in (inv@92@01 n$2@95@01) g@78@01)
          (not (= (inv@92@01 n$2@95@01) x@79@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (=>
  (Set_in n$2@95@01 g@78@01)
  (and
    (Set_in n$2@95@01 g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01))))
(assert (or (Set_in n$2@95@01 g@78@01) (not (Set_in n$2@95@01 g@78@01))))
(push) ; 4
; [then-branch: 20 | n$2@95@01 in g@78@01 && Lookup(next, sm@94@01, n$2@95@01) != Null | live]
; [else-branch: 20 | !(n$2@95@01 in g@78@01 && Lookup(next, sm@94@01, n$2@95@01) != Null) | live]
(push) ; 5
; [then-branch: 20 | n$2@95@01 in g@78@01 && Lookup(next, sm@94@01, n$2@95@01) != Null]
(assert (and
  (Set_in n$2@95@01 g@78@01)
  (not (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null))))
; [eval] (n$2.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@79@01)
      (=
        ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
    :qid |qp.fvfValDef55|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
      (=
        ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
    :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
    :qid |qp.fvfValDef56|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
    :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef57|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite (= n$2@95@01 x@79@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@93@01 n$2@95@01)
        (and
          (Set_in (inv@92@01 n$2@95@01) g@78@01)
          (not (= (inv@92@01 n$2@95@01) x@79@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(n$2@95@01 in g@78@01 && Lookup(next, sm@94@01, n$2@95@01) != Null)]
(assert (not
  (and
    (Set_in n$2@95@01 g@78@01)
    (not (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (=>
  (and
    (Set_in n$2@95@01 g@78@01)
    (not (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null)))
  (and
    (Set_in n$2@95@01 g@78@01)
    (not (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$2@95@01 g@78@01)
      (not (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null))))
  (and
    (Set_in n$2@95@01 g@78@01)
    (not (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef57|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$2@95@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@95@01 g@78@01)
      (and
        (Set_in n$2@95@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01)))
    (or (Set_in n$2@95@01 g@78@01) (not (Set_in n$2@95@01 g@78@01)))
    (=>
      (and
        (Set_in n$2@95@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null)))
      (and
        (Set_in n$2@95@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01)))
    (or
      (not
        (and
          (Set_in n$2@95@01 g@78@01)
          (not
            (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null))))
      (and
        (Set_in n$2@95@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) g@78@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@282@13@282@33-aux|)))
(assert (forall ((n$2@95@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@95@01 g@78@01)
      (and
        (Set_in n$2@95@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01)))
    (or (Set_in n$2@95@01 g@78@01) (not (Set_in n$2@95@01 g@78@01)))
    (=>
      (and
        (Set_in n$2@95@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null)))
      (and
        (Set_in n$2@95@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01)))
    (or
      (not
        (and
          (Set_in n$2@95@01 g@78@01)
          (not
            (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null))))
      (and
        (Set_in n$2@95@01 g@78@01)
        (not
          (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null)))))
  :pattern ((Set_in n$2@95@01 g@78@01) ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@282@13@282@33-aux|)))
(assert (forall ((n$2@95@01 $Ref)) (!
  (=>
    (and
      (Set_in n$2@95@01 g@78@01)
      (not (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) g@78@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) g@78@01))
  :pattern ((Set_in n$2@95@01 g@78@01) ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n$2@95@01) n$2@95@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@282@13@282@33|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))
  $Snap.unit))
; [eval] x.next == null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@79@01)
      (=
        ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
    :qid |qp.fvfValDef55|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
      (=
        ($FVF.lookup_next (as sm@94@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
    :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
    :qid |qp.fvfValDef56|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
    :pattern (($FVF.lookup_next (as sm@94@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef57|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) x@79@01) x@79@01))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and
        (img@93@01 x@79@01)
        (and
          (Set_in (inv@92@01 x@79@01) g@78@01)
          (not (= (inv@92@01 x@79@01) x@79@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_next (as sm@94@01  $FVF<next>) x@79@01) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))))
  $Snap.unit))
; [eval] old(x.next) == null ==> $$(g) == old($$(g))
; [eval] old(x.next) == null
; [eval] old(x.next)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@79@01)
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
    :qid |qp.fvfValDef50|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
    :qid |qp.fvfValDef51|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef52|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) x@79@01))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and
        (img@85@01 x@79@01)
        (and
          (Set_in (inv@84@01 x@79@01) g@78@01)
          (not (= (inv@84@01 x@79@01) x@79@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | Lookup(next, sm@86@01, x@79@01) == Null | live]
; [else-branch: 21 | Lookup(next, sm@86@01, x@79@01) != Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | Lookup(next, sm@86@01, x@79@01) == Null]
(assert (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
; [eval] $$(g) == old($$(g))
; [eval] $$(g)
(push) ; 5
(declare-const n@96@01 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@96@01 g@78@01))
(pop) ; 6
(declare-fun inv@97@01 ($Ref) $Ref)
(declare-fun img@98@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@96@01 $Ref) (n2@96@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@96@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n1@96@01) n1@96@01))
      (and
        (Set_in n2@96@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n2@96@01) n2@96@01))
      (= n1@96@01 n2@96@01))
    (= n1@96@01 n2@96@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@96@01 $Ref)) (!
  (=>
    (Set_in n@96@01 g@78@01)
    (and (= (inv@97@01 n@96@01) n@96@01) (img@98@01 n@96@01)))
  :pattern ((Set_in n@96@01 g@78@01))
  :pattern ((inv@97@01 n@96@01))
  :pattern ((img@98@01 n@96@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@98@01 r) (Set_in (inv@97@01 r) g@78@01)) (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@97@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
  :pattern ((inv@97@01 r))
  :qid |quant-u-162|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@99@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r) (= r (inv@97@01 r)))
    ($Perm.min
      (ite
        (and
          (img@93@01 r)
          (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@100@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r) (= r (inv@97@01 r)))
    ($Perm.min
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@99@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@93@01 r)
          (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@99@01 r))
    $Perm.No)
  
  :qid |quant-u-164|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r) (= r (inv@97@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@99@01 r)) $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@100@01 x@79@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@100@01 r) $Perm.No)
  
  :qid |quant-u-167|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r) (= r (inv@97@01 r)))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@99@01 r)) (pTaken@100@01 r))
      $Perm.No))
  
  :qid |quant-u-168|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@101@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@101@01  $FVF<next>)))
      (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r)))
    (=>
      (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r))
      (Set_in r ($FVF.domain_next (as sm@101@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@101@01  $FVF<next>))))
  :qid |qp.fvfDomDef61|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@101@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@101@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@101@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@101@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@101@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@101@01  $FVF<next>)) g@78@01))
(pop) ; 5
; Joined path conditions
(assert (forall ((n@96@01 $Ref)) (!
  (=>
    (Set_in n@96@01 g@78@01)
    (and (= (inv@97@01 n@96@01) n@96@01) (img@98@01 n@96@01)))
  :pattern ((Set_in n@96@01 g@78@01))
  :pattern ((inv@97@01 n@96@01))
  :pattern ((img@98@01 n@96@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@98@01 r) (Set_in (inv@97@01 r) g@78@01)) (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@101@01  $FVF<next>)))
      (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r)))
    (=>
      (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r))
      (Set_in r ($FVF.domain_next (as sm@101@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@101@01  $FVF<next>))))
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@101@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@101@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@101@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@101@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@101@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@97@01 r) g@78@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
    :pattern ((inv@97@01 r))
    :qid |quant-u-162|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@101@01  $FVF<next>)) g@78@01)))
; [eval] old($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 5
(declare-const n@102@01 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@102@01 g@78@01))
(pop) ; 6
(declare-fun inv@103@01 ($Ref) $Ref)
(declare-fun img@104@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@102@01 $Ref) (n2@102@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@102@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n1@102@01) n1@102@01))
      (and
        (Set_in n2@102@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n2@102@01) n2@102@01))
      (= n1@102@01 n2@102@01))
    (= n1@102@01 n2@102@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@102@01 $Ref)) (!
  (=>
    (Set_in n@102@01 g@78@01)
    (and (= (inv@103@01 n@102@01) n@102@01) (img@104@01 n@102@01)))
  :pattern ((Set_in n@102@01 g@78@01))
  :pattern ((inv@103@01 n@102@01))
  :pattern ((img@104@01 n@102@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@104@01 r) (Set_in (inv@103@01 r) g@78@01)) (= (inv@103@01 r) r))
  :pattern ((inv@103@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@103@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
  :pattern ((inv@103@01 r))
  :qid |quant-u-170|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r) (= r (inv@103@01 r)))
    ($Perm.min
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@106@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r) (= r (inv@103@01 r)))
    ($Perm.min
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@105@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@105@01 r))
    $Perm.No)
  
  :qid |quant-u-172|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r) (= r (inv@103@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@105@01 r)) $Perm.No))
  
  :qid |quant-u-173|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@106@01 x@79@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@106@01 r) $Perm.No)
  
  :qid |quant-u-175|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r) (= r (inv@103@01 r)))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@105@01 r)) (pTaken@106@01 r))
      $Perm.No))
  
  :qid |quant-u-176|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@107@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@107@01  $FVF<next>)))
      (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r)))
    (=>
      (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r))
      (Set_in r ($FVF.domain_next (as sm@107@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@107@01  $FVF<next>))))
  :qid |qp.fvfDomDef65|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@107@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@107@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@107@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@107@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@107@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef64|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@107@01  $FVF<next>)) g@78@01))
(pop) ; 5
; Joined path conditions
(assert (forall ((n@102@01 $Ref)) (!
  (=>
    (Set_in n@102@01 g@78@01)
    (and (= (inv@103@01 n@102@01) n@102@01) (img@104@01 n@102@01)))
  :pattern ((Set_in n@102@01 g@78@01))
  :pattern ((inv@103@01 n@102@01))
  :pattern ((img@104@01 n@102@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@104@01 r) (Set_in (inv@103@01 r) g@78@01)) (= (inv@103@01 r) r))
  :pattern ((inv@103@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@107@01  $FVF<next>)))
      (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r)))
    (=>
      (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r))
      (Set_in r ($FVF.domain_next (as sm@107@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@107@01  $FVF<next>))))
  :qid |qp.fvfDomDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@107@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@107@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@107@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@107@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@107@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@103@01 r) g@78@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
    :pattern ((inv@103@01 r))
    :qid |quant-u-170|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@107@01  $FVF<next>)) g@78@01)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 21 | Lookup(next, sm@86@01, x@79@01) != Null]
(assert (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((n@96@01 $Ref)) (!
  (=>
    (Set_in n@96@01 g@78@01)
    (and (= (inv@97@01 n@96@01) n@96@01) (img@98@01 n@96@01)))
  :pattern ((Set_in n@96@01 g@78@01))
  :pattern ((inv@97@01 n@96@01))
  :pattern ((img@98@01 n@96@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@98@01 r) (Set_in (inv@97@01 r) g@78@01)) (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@101@01  $FVF<next>)))
      (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r)))
    (=>
      (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r))
      (Set_in r ($FVF.domain_next (as sm@101@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@101@01  $FVF<next>))))
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@101@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@101@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@97@01 r) g@78@01) (img@98@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@101@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@101@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@101@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (forall ((n@102@01 $Ref)) (!
  (=>
    (Set_in n@102@01 g@78@01)
    (and (= (inv@103@01 n@102@01) n@102@01) (img@104@01 n@102@01)))
  :pattern ((Set_in n@102@01 g@78@01))
  :pattern ((inv@103@01 n@102@01))
  :pattern ((img@104@01 n@102@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@104@01 r) (Set_in (inv@103@01 r) g@78@01)) (= (inv@103@01 r) r))
  :pattern ((inv@103@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@107@01  $FVF<next>)))
      (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r)))
    (=>
      (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r))
      (Set_in r ($FVF.domain_next (as sm@107@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@107@01  $FVF<next>))))
  :qid |qp.fvfDomDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@107@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@107@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) g@78@01) (img@104@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@107@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@107@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@107@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (=>
  (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)
  (and
    (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@97@01 r) g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
      :pattern ((inv@97@01 r))
      :qid |quant-u-162|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@101@01  $FVF<next>)) g@78@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@103@01 r) g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
      :pattern ((inv@103@01 r))
      :qid |quant-u-170|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@107@01  $FVF<next>)) g@78@01))))
; Joined path conditions
(assert (or
  (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
  (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)))
(assert (=>
  (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)
  (Set_equal ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@101@01  $FVF<next>)) g@78@01) ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@107@01  $FVF<next>)) g@78@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))))
  $Snap.unit))
; [eval] old(x.next) != null ==> (forall v1: Ref, v2: Ref :: { edge($$(g), v1, v2) } edge($$(g), v1, v2) == (edge(old($$(g)), v1, v2) && !(v1 == x && v2 == old(x.next))))
; [eval] old(x.next) != null
; [eval] old(x.next)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@79@01)
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
    :qid |qp.fvfValDef50|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
    :qid |qp.fvfValDef51|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef52|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and
        (img@85@01 x@79@01)
        (and
          (Set_in (inv@84@01 x@79@01) g@78@01)
          (not (= (inv@84@01 x@79@01) x@79@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; [then-branch: 22 | Lookup(next, sm@86@01, x@79@01) != Null | live]
; [else-branch: 22 | Lookup(next, sm@86@01, x@79@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | Lookup(next, sm@86@01, x@79@01) != Null]
(assert (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)))
; [eval] (forall v1: Ref, v2: Ref :: { edge($$(g), v1, v2) } edge($$(g), v1, v2) == (edge(old($$(g)), v1, v2) && !(v1 == x && v2 == old(x.next))))
(declare-const v1@108@01 $Ref)
(declare-const v2@109@01 $Ref)
(push) ; 5
; [eval] edge($$(g), v1, v2) == (edge(old($$(g)), v1, v2) && !(v1 == x && v2 == old(x.next)))
; [eval] edge($$(g), v1, v2)
; [eval] $$(g)
(push) ; 6
(declare-const n@110@01 $Ref)
(push) ; 7
; [eval] (n in refs)
(assert (Set_in n@110@01 g@78@01))
(pop) ; 7
(declare-fun inv@111@01 ($Ref) $Ref)
(declare-fun img@112@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@110@01 $Ref) (n2@110@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@110@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n1@110@01) n1@110@01))
      (and
        (Set_in n2@110@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n2@110@01) n2@110@01))
      (= n1@110@01 n2@110@01))
    (= n1@110@01 n2@110@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@110@01 $Ref)) (!
  (=>
    (Set_in n@110@01 g@78@01)
    (and (= (inv@111@01 n@110@01) n@110@01) (img@112@01 n@110@01)))
  :pattern ((Set_in n@110@01 g@78@01))
  :pattern ((inv@111@01 n@110@01))
  :pattern ((img@112@01 n@110@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@112@01 r) (Set_in (inv@111@01 r) g@78@01)) (= (inv@111@01 r) r))
  :pattern ((inv@111@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@111@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
  :pattern ((inv@111@01 r))
  :qid |quant-u-178|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@113@01 ((r $Ref) (v1@108@01 $Ref) (v2@109@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r) (= r (inv@111@01 r)))
    ($Perm.min
      (ite
        (and
          (img@93@01 r)
          (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@114@01 ((r $Ref) (v1@108@01 $Ref) (v2@109@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r) (= r (inv@111@01 r)))
    ($Perm.min
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@113@01 r v1@108@01 v2@109@01)))
    $Perm.No))
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
          (img@93@01 r)
          (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@113@01 r v1@108@01 v2@109@01))
    $Perm.No)
  
  :qid |quant-u-180|))))
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
    (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r) (= r (inv@111@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@113@01 r v1@108@01 v2@109@01))
      $Perm.No))
  
  :qid |quant-u-181|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@114@01 x@79@01 v1@108@01 v2@109@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,02s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@114@01 r v1@108@01 v2@109@01) $Perm.No)
  
  :qid |quant-u-183|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r) (= r (inv@111@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@113@01 r v1@108@01 v2@109@01))
        (pTaken@114@01 r v1@108@01 v2@109@01))
      $Perm.No))
  
  :qid |quant-u-184|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@115@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>)))
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r)))
    (=>
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r))
      (Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>))))
  :qid |qp.fvfDomDef69|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef68|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@115@01  $FVF<next>)) g@78@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@110@01 $Ref)) (!
  (=>
    (Set_in n@110@01 g@78@01)
    (and (= (inv@111@01 n@110@01) n@110@01) (img@112@01 n@110@01)))
  :pattern ((Set_in n@110@01 g@78@01))
  :pattern ((inv@111@01 n@110@01))
  :pattern ((img@112@01 n@110@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@112@01 r) (Set_in (inv@111@01 r) g@78@01)) (= (inv@111@01 r) r))
  :pattern ((inv@111@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>)))
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r)))
    (=>
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r))
      (Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>))))
  :qid |qp.fvfDomDef69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef68|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@111@01 r) g@78@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
    :pattern ((inv@111@01 r))
    :qid |quant-u-178|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@115@01  $FVF<next>)) g@78@01)))
; [eval] edge(old($$(g)), v1, v2) && !(v1 == x && v2 == old(x.next))
; [eval] edge(old($$(g)), v1, v2)
; [eval] old($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 6
(declare-const n@116@01 $Ref)
(push) ; 7
; [eval] (n in refs)
(assert (Set_in n@116@01 g@78@01))
(pop) ; 7
(declare-fun inv@117@01 ($Ref) $Ref)
(declare-fun img@118@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@116@01 $Ref) (n2@116@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@116@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n1@116@01) n1@116@01))
      (and
        (Set_in n2@116@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n2@116@01) n2@116@01))
      (= n1@116@01 n2@116@01))
    (= n1@116@01 n2@116@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@116@01 $Ref)) (!
  (=>
    (Set_in n@116@01 g@78@01)
    (and (= (inv@117@01 n@116@01) n@116@01) (img@118@01 n@116@01)))
  :pattern ((Set_in n@116@01 g@78@01))
  :pattern ((inv@117@01 n@116@01))
  :pattern ((img@118@01 n@116@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@118@01 r) (Set_in (inv@117@01 r) g@78@01)) (= (inv@117@01 r) r))
  :pattern ((inv@117@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@117@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
  :pattern ((inv@117@01 r))
  :qid |quant-u-186|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@119@01 ((r $Ref) (v1@108@01 $Ref) (v2@109@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r) (= r (inv@117@01 r)))
    ($Perm.min
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@120@01 ((r $Ref) (v1@108@01 $Ref) (v2@109@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r) (= r (inv@117@01 r)))
    ($Perm.min
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@119@01 r v1@108@01 v2@109@01)))
    $Perm.No))
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
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@119@01 r v1@108@01 v2@109@01))
    $Perm.No)
  
  :qid |quant-u-188|))))
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
    (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r) (= r (inv@117@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@119@01 r v1@108@01 v2@109@01))
      $Perm.No))
  
  :qid |quant-u-189|))))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@120@01 x@79@01 v1@108@01 v2@109@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@120@01 r v1@108@01 v2@109@01) $Perm.No)
  
  :qid |quant-u-191|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r) (= r (inv@117@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@119@01 r v1@108@01 v2@109@01))
        (pTaken@120@01 r v1@108@01 v2@109@01))
      $Perm.No))
  
  :qid |quant-u-192|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@121@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>)))
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r)))
    (=>
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r))
      (Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>))))
  :qid |qp.fvfDomDef73|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@121@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@121@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef72|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@116@01 $Ref)) (!
  (=>
    (Set_in n@116@01 g@78@01)
    (and (= (inv@117@01 n@116@01) n@116@01) (img@118@01 n@116@01)))
  :pattern ((Set_in n@116@01 g@78@01))
  :pattern ((inv@117@01 n@116@01))
  :pattern ((img@118@01 n@116@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@118@01 r) (Set_in (inv@117@01 r) g@78@01)) (= (inv@117@01 r) r))
  :pattern ((inv@117@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>)))
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r)))
    (=>
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r))
      (Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>))))
  :qid |qp.fvfDomDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@121@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@121@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef72|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@117@01 r) g@78@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
    :pattern ((inv@117@01 r))
    :qid |quant-u-186|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01)))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 23 | !(edge[Bool]($$(sm@121@01, g@78@01), v1@108@01, v2@109@01)) | live]
; [else-branch: 23 | edge[Bool]($$(sm@121@01, g@78@01), v1@108@01, v2@109@01) | live]
(push) ; 7
; [then-branch: 23 | !(edge[Bool]($$(sm@121@01, g@78@01), v1@108@01, v2@109@01))]
(assert (not
  (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 23 | edge[Bool]($$(sm@121@01, g@78@01), v1@108@01, v2@109@01)]
(assert (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01))
; [eval] !(v1 == x && v2 == old(x.next))
; [eval] v1 == x && v2 == old(x.next)
; [eval] v1 == x
(push) ; 8
; [then-branch: 24 | v1@108@01 != x@79@01 | live]
; [else-branch: 24 | v1@108@01 == x@79@01 | live]
(push) ; 9
; [then-branch: 24 | v1@108@01 != x@79@01]
(assert (not (= v1@108@01 x@79@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 24 | v1@108@01 == x@79@01]
(assert (= v1@108@01 x@79@01))
; [eval] v2 == old(x.next)
; [eval] old(x.next)
(declare-const sm@122@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef76|)))
(declare-const pm@123@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@123@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resTrgDef78|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) x@79@01) x@79@01))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_next (as pm@123@01  $FPM) x@79@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@123@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resTrgDef78|)))
(assert (=>
  (= v1@108@01 x@79@01)
  (and
    (= v1@108@01 x@79@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) x@79@01) x@79@01))))
(assert (or (= v1@108@01 x@79@01) (not (= v1@108@01 x@79@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@123@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resTrgDef78|)))
(assert (=>
  (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
  (and
    (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
    (=>
      (= v1@108@01 x@79@01)
      (and
        (= v1@108@01 x@79@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) x@79@01) x@79@01)))
    (or (= v1@108@01 x@79@01) (not (= v1@108@01 x@79@01))))))
(assert (or
  (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
  (not
    (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@110@01 $Ref)) (!
  (=>
    (Set_in n@110@01 g@78@01)
    (and (= (inv@111@01 n@110@01) n@110@01) (img@112@01 n@110@01)))
  :pattern ((Set_in n@110@01 g@78@01))
  :pattern ((inv@111@01 n@110@01))
  :pattern ((img@112@01 n@110@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@112@01 r) (Set_in (inv@111@01 r) g@78@01)) (= (inv@111@01 r) r))
  :pattern ((inv@111@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>)))
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r)))
    (=>
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r))
      (Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>))))
  :qid |qp.fvfDomDef69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef68|)))
(assert (forall ((n@116@01 $Ref)) (!
  (=>
    (Set_in n@116@01 g@78@01)
    (and (= (inv@117@01 n@116@01) n@116@01) (img@118@01 n@116@01)))
  :pattern ((Set_in n@116@01 g@78@01))
  :pattern ((inv@117@01 n@116@01))
  :pattern ((img@118@01 n@116@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@118@01 r) (Set_in (inv@117@01 r) g@78@01)) (= (inv@117@01 r) r))
  :pattern ((inv@117@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>)))
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r)))
    (=>
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r))
      (Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>))))
  :qid |qp.fvfDomDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@121@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@121@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@123@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resTrgDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@111@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
  :pattern ((inv@111@01 r))
  :qid |quant-u-178|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@115@01  $FVF<next>)) g@78@01))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@117@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
  :pattern ((inv@117@01 r))
  :qid |quant-u-186|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v1@108@01 $Ref) (v2@109@01 $Ref)) (!
  (and
    (=>
      (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
      (and
        (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
        (=>
          (= v1@108@01 x@79@01)
          (and
            (= v1@108@01 x@79@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) x@79@01) x@79@01)))
        (or (= v1@108@01 x@79@01) (not (= v1@108@01 x@79@01)))))
    (or
      (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
      (not
        (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01))))
  :pattern ((edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@115@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@285@37@287@89-aux|)))
(pop) ; 4
(push) ; 4
; [else-branch: 22 | Lookup(next, sm@86@01, x@79@01) == Null]
(assert (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((n@110@01 $Ref)) (!
  (=>
    (Set_in n@110@01 g@78@01)
    (and (= (inv@111@01 n@110@01) n@110@01) (img@112@01 n@110@01)))
  :pattern ((Set_in n@110@01 g@78@01))
  :pattern ((inv@111@01 n@110@01))
  :pattern ((img@112@01 n@110@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@112@01 r) (Set_in (inv@111@01 r) g@78@01)) (= (inv@111@01 r) r))
  :pattern ((inv@111@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>)))
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r)))
    (=>
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r))
      (Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@115@01  $FVF<next>))))
  :qid |qp.fvfDomDef69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@111@01 r) g@78@01) (img@112@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef68|)))
(assert (forall ((n@116@01 $Ref)) (!
  (=>
    (Set_in n@116@01 g@78@01)
    (and (= (inv@117@01 n@116@01) n@116@01) (img@118@01 n@116@01)))
  :pattern ((Set_in n@116@01 g@78@01))
  :pattern ((inv@117@01 n@116@01))
  :pattern ((img@118@01 n@116@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@118@01 r) (Set_in (inv@117@01 r) g@78@01)) (= (inv@117@01 r) r))
  :pattern ((inv@117@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>)))
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r)))
    (=>
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r))
      (Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@121@01  $FVF<next>))))
  :qid |qp.fvfDomDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@121@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@117@01 r) g@78@01) (img@118@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@121@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@121@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@122@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@122@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@123@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@123@01  $FPM) r))
  :qid |qp.resTrgDef78|)))
(assert (=>
  (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
  (and
    (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@111@01 r) g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
      :pattern ((inv@111@01 r))
      :qid |quant-u-178|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@115@01  $FVF<next>)) g@78@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@117@01 r) g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
      :pattern ((inv@117@01 r))
      :qid |quant-u-186|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01)
    (forall ((v1@108@01 $Ref) (v2@109@01 $Ref)) (!
      (and
        (=>
          (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
          (and
            (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
            (=>
              (= v1@108@01 x@79@01)
              (and
                (= v1@108@01 x@79@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@122@01  $FVF<next>) x@79@01) x@79@01)))
            (or (= v1@108@01 x@79@01) (not (= v1@108@01 x@79@01)))))
        (or
          (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
          (not
            (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01))))
      :pattern ((edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@115@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01))
      :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@285@37@287@89-aux|)))))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)
  (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))))
(assert (=>
  (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
  (forall ((v1@108@01 $Ref) (v2@109@01 $Ref)) (!
    (=
      (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@115@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
      (and
        (edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@121@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01)
        (not
          (and
            (= v1@108@01 x@79@01)
            (= v2@109@01 ($FVF.lookup_next (as sm@122@01  $FVF<next>) x@79@01))))))
    :pattern ((edge<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@115@01  $FVF<next>)) g@78@01) v1@108@01 v2@109@01))
    :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@285@37@287@89|))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))))
  $Snap.unit))
; [eval] old(x.next) != null ==> (forall v1: Ref, v2: Ref :: { exists_path($$(g), v1, v2) } v1 != v2 ==> exists_path($$(g), v1, v2) == (exists_path(old($$(g)), v1, v2) && !(exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), old(x.next), v2))))
; [eval] old(x.next) != null
; [eval] old(x.next)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@79@01)
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
    :qid |qp.fvfValDef50|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
      (=
        ($FVF.lookup_next (as sm@86@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
    :qid |qp.fvfValDef51|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
    :pattern (($FVF.lookup_next (as sm@86@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef52|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and
        (img@85@01 x@79@01)
        (and
          (Set_in (inv@84@01 x@79@01) g@78@01)
          (not (= (inv@84@01 x@79@01) x@79@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; [then-branch: 25 | Lookup(next, sm@86@01, x@79@01) != Null | live]
; [else-branch: 25 | Lookup(next, sm@86@01, x@79@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | Lookup(next, sm@86@01, x@79@01) != Null]
(assert (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null)))
; [eval] (forall v1: Ref, v2: Ref :: { exists_path($$(g), v1, v2) } v1 != v2 ==> exists_path($$(g), v1, v2) == (exists_path(old($$(g)), v1, v2) && !(exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), old(x.next), v2))))
(declare-const v1@124@01 $Ref)
(declare-const v2@125@01 $Ref)
(push) ; 5
; [eval] v1 != v2 ==> exists_path($$(g), v1, v2) == (exists_path(old($$(g)), v1, v2) && !(exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), old(x.next), v2)))
; [eval] v1 != v2
(push) ; 6
; [then-branch: 26 | v1@124@01 != v2@125@01 | live]
; [else-branch: 26 | v1@124@01 == v2@125@01 | live]
(push) ; 7
; [then-branch: 26 | v1@124@01 != v2@125@01]
(assert (not (= v1@124@01 v2@125@01)))
; [eval] exists_path($$(g), v1, v2) == (exists_path(old($$(g)), v1, v2) && !(exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), old(x.next), v2)))
; [eval] exists_path($$(g), v1, v2)
; [eval] $$(g)
(push) ; 8
(declare-const n@126@01 $Ref)
(push) ; 9
; [eval] (n in refs)
(assert (Set_in n@126@01 g@78@01))
(pop) ; 9
(declare-fun inv@127@01 ($Ref) $Ref)
(declare-fun img@128@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 9
(assert (not (forall ((n1@126@01 $Ref) (n2@126@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@126@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n1@126@01) n1@126@01))
      (and
        (Set_in n2@126@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) n2@126@01) n2@126@01))
      (= n1@126@01 n2@126@01))
    (= n1@126@01 n2@126@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@126@01 $Ref)) (!
  (=>
    (Set_in n@126@01 g@78@01)
    (and (= (inv@127@01 n@126@01) n@126@01) (img@128@01 n@126@01)))
  :pattern ((Set_in n@126@01 g@78@01))
  :pattern ((inv@127@01 n@126@01))
  :pattern ((img@128@01 n@126@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@128@01 r) (Set_in (inv@127@01 r) g@78@01)) (= (inv@127@01 r) r))
  :pattern ((inv@127@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@127@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
  :pattern ((inv@127@01 r))
  :qid |quant-u-194|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@129@01 ((r $Ref) (v1@124@01 $Ref) (v2@125@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r) (= r (inv@127@01 r)))
    ($Perm.min
      (ite
        (and
          (img@93@01 r)
          (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@130@01 ((r $Ref) (v1@124@01 $Ref) (v2@125@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r) (= r (inv@127@01 r)))
    ($Perm.min
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@129@01 r v1@124@01 v2@125@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@93@01 r)
          (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@129@01 r v1@124@01 v2@125@01))
    $Perm.No)
  
  :qid |quant-u-196|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r) (= r (inv@127@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@129@01 r v1@124@01 v2@125@01))
      $Perm.No))
  
  :qid |quant-u-197|))))
(check-sat)
; unknown
(pop) ; 9
; 0,50s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@130@01 x@79@01 v1@124@01 v2@125@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@130@01 r v1@124@01 v2@125@01) $Perm.No)
  
  :qid |quant-u-199|))))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r) (= r (inv@127@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@129@01 r v1@124@01 v2@125@01))
        (pTaken@130@01 r v1@124@01 v2@125@01))
      $Perm.No))
  
  :qid |quant-u-200|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@131@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)))
    (=>
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>))))
  :qid |qp.fvfDomDef82|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef81|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@131@01  $FVF<next>)) g@78@01))
(pop) ; 8
; Joined path conditions
(assert (forall ((n@126@01 $Ref)) (!
  (=>
    (Set_in n@126@01 g@78@01)
    (and (= (inv@127@01 n@126@01) n@126@01) (img@128@01 n@126@01)))
  :pattern ((Set_in n@126@01 g@78@01))
  :pattern ((inv@127@01 n@126@01))
  :pattern ((img@128@01 n@126@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@128@01 r) (Set_in (inv@127@01 r) g@78@01)) (= (inv@127@01 r) r))
  :pattern ((inv@127@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)))
    (=>
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>))))
  :qid |qp.fvfDomDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef81|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@127@01 r) g@78@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
    :pattern ((inv@127@01 r))
    :qid |quant-u-194|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@131@01  $FVF<next>)) g@78@01)))
; [eval] exists_path(old($$(g)), v1, v2) && !(exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), old(x.next), v2))
; [eval] exists_path(old($$(g)), v1, v2)
; [eval] old($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 8
(declare-const n@132@01 $Ref)
(push) ; 9
; [eval] (n in refs)
(assert (Set_in n@132@01 g@78@01))
(pop) ; 9
(declare-fun inv@133@01 ($Ref) $Ref)
(declare-fun img@134@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 9
(assert (not (forall ((n1@132@01 $Ref) (n2@132@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@132@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n1@132@01) n1@132@01))
      (and
        (Set_in n2@132@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) n2@132@01) n2@132@01))
      (= n1@132@01 n2@132@01))
    (= n1@132@01 n2@132@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@132@01 $Ref)) (!
  (=>
    (Set_in n@132@01 g@78@01)
    (and (= (inv@133@01 n@132@01) n@132@01) (img@134@01 n@132@01)))
  :pattern ((Set_in n@132@01 g@78@01))
  :pattern ((inv@133@01 n@132@01))
  :pattern ((img@134@01 n@132@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@134@01 r) (Set_in (inv@133@01 r) g@78@01)) (= (inv@133@01 r) r))
  :pattern ((inv@133@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@133@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
  :pattern ((inv@133@01 r))
  :qid |quant-u-202|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@135@01 ((r $Ref) (v1@124@01 $Ref) (v2@125@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r) (= r (inv@133@01 r)))
    ($Perm.min
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@136@01 ((r $Ref) (v1@124@01 $Ref) (v2@125@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r) (= r (inv@133@01 r)))
    ($Perm.min
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@135@01 r v1@124@01 v2@125@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@135@01 r v1@124@01 v2@125@01))
    $Perm.No)
  
  :qid |quant-u-204|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r) (= r (inv@133@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@135@01 r v1@124@01 v2@125@01))
      $Perm.No))
  
  :qid |quant-u-205|))))
(check-sat)
; unknown
(pop) ; 9
; 0,50s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@136@01 x@79@01 v1@124@01 v2@125@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@136@01 r v1@124@01 v2@125@01) $Perm.No)
  
  :qid |quant-u-207|))))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r) (= r (inv@133@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@135@01 r v1@124@01 v2@125@01))
        (pTaken@136@01 r v1@124@01 v2@125@01))
      $Perm.No))
  
  :qid |quant-u-208|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@137@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)))
    (=>
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>))))
  :qid |qp.fvfDomDef86|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef85|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01))
(pop) ; 8
; Joined path conditions
(assert (forall ((n@132@01 $Ref)) (!
  (=>
    (Set_in n@132@01 g@78@01)
    (and (= (inv@133@01 n@132@01) n@132@01) (img@134@01 n@132@01)))
  :pattern ((Set_in n@132@01 g@78@01))
  :pattern ((inv@133@01 n@132@01))
  :pattern ((img@134@01 n@132@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@134@01 r) (Set_in (inv@133@01 r) g@78@01)) (= (inv@133@01 r) r))
  :pattern ((inv@133@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)))
    (=>
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>))))
  :qid |qp.fvfDomDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef85|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@133@01 r) g@78@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
    :pattern ((inv@133@01 r))
    :qid |quant-u-202|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01)))
(set-option :timeout 0)
(push) ; 8
; [then-branch: 27 | !(exists_path[Bool]($$(sm@137@01, g@78@01), v1@124@01, v2@125@01)) | live]
; [else-branch: 27 | exists_path[Bool]($$(sm@137@01, g@78@01), v1@124@01, v2@125@01) | live]
(push) ; 9
; [then-branch: 27 | !(exists_path[Bool]($$(sm@137@01, g@78@01), v1@124@01, v2@125@01))]
(assert (not
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 27 | exists_path[Bool]($$(sm@137@01, g@78@01), v1@124@01, v2@125@01)]
(assert (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01))
; [eval] !(exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), old(x.next), v2))
; [eval] exists_path(old($$(g)), v1, x) && exists_path(old($$(g)), old(x.next), v2)
; [eval] exists_path(old($$(g)), v1, x)
; [eval] old($$(g))
; [eval] $$(g)
(push) ; 10
(declare-const n@138@01 $Ref)
(push) ; 11
; [eval] (n in refs)
(assert (Set_in n@138@01 g@78@01))
(pop) ; 11
(declare-fun inv@139@01 ($Ref) $Ref)
(declare-fun img@140@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@141@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef89|)))
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((n1@138@01 $Ref) (n2@138@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@138@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@141@01  $FVF<next>) n1@138@01) n1@138@01))
      (and
        (Set_in n2@138@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@141@01  $FVF<next>) n2@138@01) n2@138@01))
      (= n1@138@01 n2@138@01))
    (= n1@138@01 n2@138@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@138@01 $Ref)) (!
  (=>
    (Set_in n@138@01 g@78@01)
    (and (= (inv@139@01 n@138@01) n@138@01) (img@140@01 n@138@01)))
  :pattern ((Set_in n@138@01 g@78@01))
  :pattern ((inv@139@01 n@138@01))
  :pattern ((img@140@01 n@138@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@140@01 r) (Set_in (inv@139@01 r) g@78@01)) (= (inv@139@01 r) r))
  :pattern ((inv@139@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@139@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@141@01  $FVF<next>) r) r))
  :pattern ((inv@139@01 r))
  :qid |quant-u-210|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@142@01 ((r $Ref) (v1@124@01 $Ref) (v2@125@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r) (= r (inv@139@01 r)))
    ($Perm.min
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@143@01 ((r $Ref) (v1@124@01 $Ref) (v2@125@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r) (= r (inv@139@01 r)))
    ($Perm.min
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@142@01 r v1@124@01 v2@125@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@142@01 r v1@124@01 v2@125@01))
    $Perm.No)
  
  :qid |quant-u-212|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r) (= r (inv@139@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@142@01 r v1@124@01 v2@125@01))
      $Perm.No))
  
  :qid |quant-u-213|))))
(check-sat)
; unknown
(pop) ; 11
; 0,50s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@143@01 x@79@01 v1@124@01 v2@125@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@143@01 r v1@124@01 v2@125@01) $Perm.No)
  
  :qid |quant-u-215|))))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r) (= r (inv@139@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@142@01 r v1@124@01 v2@125@01))
        (pTaken@143@01 r v1@124@01 v2@125@01))
      $Perm.No))
  
  :qid |quant-u-216|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@144@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)))
    (=>
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>))))
  :qid |qp.fvfDomDef93|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01))
(pop) ; 10
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef89|)))
(assert (forall ((n@138@01 $Ref)) (!
  (=>
    (Set_in n@138@01 g@78@01)
    (and (= (inv@139@01 n@138@01) n@138@01) (img@140@01 n@138@01)))
  :pattern ((Set_in n@138@01 g@78@01))
  :pattern ((inv@139@01 n@138@01))
  :pattern ((img@140@01 n@138@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@140@01 r) (Set_in (inv@139@01 r) g@78@01)) (= (inv@139@01 r) r))
  :pattern ((inv@139@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)))
    (=>
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>))))
  :qid |qp.fvfDomDef93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@139@01 r) g@78@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@141@01  $FVF<next>) r) r))
    :pattern ((inv@139@01 r))
    :qid |quant-u-210|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01)))
(set-option :timeout 0)
(push) ; 10
; [then-branch: 28 | !(exists_path[Bool]($$(sm@144@01, g@78@01), v1@124@01, x@79@01)) | live]
; [else-branch: 28 | exists_path[Bool]($$(sm@144@01, g@78@01), v1@124@01, x@79@01) | live]
(push) ; 11
; [then-branch: 28 | !(exists_path[Bool]($$(sm@144@01, g@78@01), v1@124@01, x@79@01))]
(assert (not
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 28 | exists_path[Bool]($$(sm@144@01, g@78@01), v1@124@01, x@79@01)]
(assert (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01))
; [eval] exists_path(old($$(g)), old(x.next), v2)
; [eval] old($$(g))
; [eval] $$(g)
(push) ; 12
(declare-const n@145@01 $Ref)
(push) ; 13
; [eval] (n in refs)
(assert (Set_in n@145@01 g@78@01))
(pop) ; 13
(declare-fun inv@146@01 ($Ref) $Ref)
(declare-fun img@147@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@148@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef96|)))
; Check receiver injectivity
(push) ; 13
(assert (not (forall ((n1@145@01 $Ref) (n2@145@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@145@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) n1@145@01) n1@145@01))
      (and
        (Set_in n2@145@01 g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) n2@145@01) n2@145@01))
      (= n1@145@01 n2@145@01))
    (= n1@145@01 n2@145@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@78@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@78@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@78@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@146@01 r) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
  :pattern ((inv@146@01 r))
  :qid |quant-u-218|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@149@01 ((r $Ref) (v1@124@01 $Ref) (v2@125@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r) (= r (inv@146@01 r)))
    ($Perm.min
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@150@01 ((r $Ref) (v1@124@01 $Ref) (v2@125@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r) (= r (inv@146@01 r)))
    ($Perm.min
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@149@01 r v1@124@01 v2@125@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@149@01 r v1@124@01 v2@125@01))
    $Perm.No)
  
  :qid |quant-u-220|))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r) (= r (inv@146@01 r)))
    (=
      (- (/ (to_real 1) (to_real 2)) (pTaken@149@01 r v1@124@01 v2@125@01))
      $Perm.No))
  
  :qid |quant-u-221|))))
(check-sat)
; unknown
(pop) ; 13
; 0,50s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@150@01 x@79@01 v1@124@01 v2@125@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@150@01 r v1@124@01 v2@125@01) $Perm.No)
  
  :qid |quant-u-223|))))
(check-sat)
; unknown
(pop) ; 13
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r) (= r (inv@146@01 r)))
    (=
      (-
        (- (/ (to_real 1) (to_real 2)) (pTaken@149@01 r v1@124@01 v2@125@01))
        (pTaken@150@01 r v1@124@01 v2@125@01))
      $Perm.No))
  
  :qid |quant-u-224|))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@151@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>))))
  :qid |qp.fvfDomDef100|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef99|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@151@01  $FVF<next>)) g@78@01))
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef96|)))
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@78@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@78@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@78@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>))))
  :qid |qp.fvfDomDef100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef99|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@146@01 r) g@78@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
    :pattern ((inv@146@01 r))
    :qid |quant-u-218|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@151@01  $FVF<next>)) g@78@01)))
; [eval] old(x.next)
(declare-const sm@152@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef101|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(declare-const pm@153@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef104|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resTrgDef105|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) x@79@01) x@79@01))
(set-option :timeout 0)
(push) ; 12
(assert (not (< $Perm.No ($FVF.perm_next (as pm@153@01  $FPM) x@79@01))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef96|)))
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@78@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@78@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@78@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>))))
  :qid |qp.fvfDomDef100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef101|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef104|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resTrgDef105|)))
(assert (=>
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
  (and
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@146@01 r) g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
      :pattern ((inv@146@01 r))
      :qid |quant-u-218|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@151@01  $FVF<next>)) g@78@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) x@79@01) x@79@01))))
(assert (or
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
  (not
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef89|)))
(assert (forall ((n@138@01 $Ref)) (!
  (=>
    (Set_in n@138@01 g@78@01)
    (and (= (inv@139@01 n@138@01) n@138@01) (img@140@01 n@138@01)))
  :pattern ((Set_in n@138@01 g@78@01))
  :pattern ((inv@139@01 n@138@01))
  :pattern ((img@140@01 n@138@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@140@01 r) (Set_in (inv@139@01 r) g@78@01)) (= (inv@139@01 r) r))
  :pattern ((inv@139@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)))
    (=>
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>))))
  :qid |qp.fvfDomDef93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef96|)))
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@78@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@78@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@78@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>))))
  :qid |qp.fvfDomDef100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef101|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef104|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resTrgDef105|)))
(assert (=>
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
  (and
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@139@01 r) g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@141@01  $FVF<next>) r) r))
      :pattern ((inv@139@01 r))
      :qid |quant-u-210|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01)
    (=>
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
      (and
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@146@01 r) g@78@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
          :pattern ((inv@146@01 r))
          :qid |quant-u-218|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@151@01  $FVF<next>)) g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) x@79@01) x@79@01)))
    (or
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01))))))
(assert (or
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
  (not
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 26 | v1@124@01 == v2@125@01]
(assert (= v1@124@01 v2@125@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((n@126@01 $Ref)) (!
  (=>
    (Set_in n@126@01 g@78@01)
    (and (= (inv@127@01 n@126@01) n@126@01) (img@128@01 n@126@01)))
  :pattern ((Set_in n@126@01 g@78@01))
  :pattern ((inv@127@01 n@126@01))
  :pattern ((img@128@01 n@126@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@128@01 r) (Set_in (inv@127@01 r) g@78@01)) (= (inv@127@01 r) r))
  :pattern ((inv@127@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)))
    (=>
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>))))
  :qid |qp.fvfDomDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef81|)))
(assert (forall ((n@132@01 $Ref)) (!
  (=>
    (Set_in n@132@01 g@78@01)
    (and (= (inv@133@01 n@132@01) n@132@01) (img@134@01 n@132@01)))
  :pattern ((Set_in n@132@01 g@78@01))
  :pattern ((inv@133@01 n@132@01))
  :pattern ((img@134@01 n@132@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@134@01 r) (Set_in (inv@133@01 r) g@78@01)) (= (inv@133@01 r) r))
  :pattern ((inv@133@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)))
    (=>
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>))))
  :qid |qp.fvfDomDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef89|)))
(assert (forall ((n@138@01 $Ref)) (!
  (=>
    (Set_in n@138@01 g@78@01)
    (and (= (inv@139@01 n@138@01) n@138@01) (img@140@01 n@138@01)))
  :pattern ((Set_in n@138@01 g@78@01))
  :pattern ((inv@139@01 n@138@01))
  :pattern ((img@140@01 n@138@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@140@01 r) (Set_in (inv@139@01 r) g@78@01)) (= (inv@139@01 r) r))
  :pattern ((inv@139@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)))
    (=>
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>))))
  :qid |qp.fvfDomDef93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef96|)))
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@78@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@78@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@78@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>))))
  :qid |qp.fvfDomDef100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef101|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef104|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resTrgDef105|)))
(assert (=>
  (not (= v1@124@01 v2@125@01))
  (and
    (not (= v1@124@01 v2@125@01))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@127@01 r) g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
      :pattern ((inv@127@01 r))
      :qid |quant-u-194|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@131@01  $FVF<next>)) g@78@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@133@01 r) g@78@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
      :pattern ((inv@133@01 r))
      :qid |quant-u-202|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01)
    (=>
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
      (and
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@139@01 r) g@78@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@141@01  $FVF<next>) r) r))
          :pattern ((inv@139@01 r))
          :qid |quant-u-210|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01)
        (=>
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
          (and
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@146@01 r) g@78@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
              :pattern ((inv@146@01 r))
              :qid |quant-u-218|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@151@01  $FVF<next>)) g@78@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) x@79@01) x@79@01)))
        (or
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)))))
    (or
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01))))))
; Joined path conditions
(assert (or (= v1@124@01 v2@125@01) (not (= v1@124@01 v2@125@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@126@01 $Ref)) (!
  (=>
    (Set_in n@126@01 g@78@01)
    (and (= (inv@127@01 n@126@01) n@126@01) (img@128@01 n@126@01)))
  :pattern ((Set_in n@126@01 g@78@01))
  :pattern ((inv@127@01 n@126@01))
  :pattern ((img@128@01 n@126@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@128@01 r) (Set_in (inv@127@01 r) g@78@01)) (= (inv@127@01 r) r))
  :pattern ((inv@127@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)))
    (=>
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>))))
  :qid |qp.fvfDomDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef81|)))
(assert (forall ((n@132@01 $Ref)) (!
  (=>
    (Set_in n@132@01 g@78@01)
    (and (= (inv@133@01 n@132@01) n@132@01) (img@134@01 n@132@01)))
  :pattern ((Set_in n@132@01 g@78@01))
  :pattern ((inv@133@01 n@132@01))
  :pattern ((img@134@01 n@132@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@134@01 r) (Set_in (inv@133@01 r) g@78@01)) (= (inv@133@01 r) r))
  :pattern ((inv@133@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)))
    (=>
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>))))
  :qid |qp.fvfDomDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef89|)))
(assert (forall ((n@138@01 $Ref)) (!
  (=>
    (Set_in n@138@01 g@78@01)
    (and (= (inv@139@01 n@138@01) n@138@01) (img@140@01 n@138@01)))
  :pattern ((Set_in n@138@01 g@78@01))
  :pattern ((inv@139@01 n@138@01))
  :pattern ((img@140@01 n@138@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@140@01 r) (Set_in (inv@139@01 r) g@78@01)) (= (inv@139@01 r) r))
  :pattern ((inv@139@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)))
    (=>
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>))))
  :qid |qp.fvfDomDef93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef96|)))
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@78@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@78@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@78@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>))))
  :qid |qp.fvfDomDef100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef101|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef104|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resTrgDef105|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v1@124@01 $Ref) (v2@125@01 $Ref)) (!
  (and
    (=>
      (not (= v1@124@01 v2@125@01))
      (and
        (not (= v1@124@01 v2@125@01))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@127@01 r) g@78@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
          :pattern ((inv@127@01 r))
          :qid |quant-u-194|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@131@01  $FVF<next>)) g@78@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@133@01 r) g@78@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
          :pattern ((inv@133@01 r))
          :qid |quant-u-202|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01)
        (=>
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
          (and
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@139@01 r) g@78@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@141@01  $FVF<next>) r) r))
              :pattern ((inv@139@01 r))
              :qid |quant-u-210|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01)
            (=>
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
              (and
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
                (forall ((r $Ref)) (!
                  (=>
                    (Set_in (inv@146@01 r) g@78@01)
                    ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
                  :pattern ((inv@146@01 r))
                  :qid |quant-u-218|))
                ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@151@01  $FVF<next>)) g@78@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) x@79@01) x@79@01)))
            (or
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
              (not
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)))))
        (or
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)))))
    (or (= v1@124@01 v2@125@01) (not (= v1@124@01 v2@125@01))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@131@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@288@38@292@128-aux|)))
(pop) ; 4
(push) ; 4
; [else-branch: 25 | Lookup(next, sm@86@01, x@79@01) == Null]
(assert (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((n@126@01 $Ref)) (!
  (=>
    (Set_in n@126@01 g@78@01)
    (and (= (inv@127@01 n@126@01) n@126@01) (img@128@01 n@126@01)))
  :pattern ((Set_in n@126@01 g@78@01))
  :pattern ((inv@127@01 n@126@01))
  :pattern ((img@128@01 n@126@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@128@01 r) (Set_in (inv@127@01 r) g@78@01)) (= (inv@127@01 r) r))
  :pattern ((inv@127@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)))
    (=>
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@131@01  $FVF<next>))))
  :qid |qp.fvfDomDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@127@01 r) g@78@01) (img@128@01 r))
      (and
        (img@93@01 r)
        (and (Set_in (inv@92@01 r) g@78@01) (not (= (inv@92@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@131@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@89@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))) r) r))
  :pattern (($FVF.lookup_next (as sm@131@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef81|)))
(assert (forall ((n@132@01 $Ref)) (!
  (=>
    (Set_in n@132@01 g@78@01)
    (and (= (inv@133@01 n@132@01) n@132@01) (img@134@01 n@132@01)))
  :pattern ((Set_in n@132@01 g@78@01))
  :pattern ((inv@133@01 n@132@01))
  :pattern ((img@134@01 n@132@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@134@01 r) (Set_in (inv@133@01 r) g@78@01)) (= (inv@133@01 r) r))
  :pattern ((inv@133@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)))
    (=>
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@137@01  $FVF<next>))))
  :qid |qp.fvfDomDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@133@01 r) g@78@01) (img@134@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@137@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@137@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef89|)))
(assert (forall ((n@138@01 $Ref)) (!
  (=>
    (Set_in n@138@01 g@78@01)
    (and (= (inv@139@01 n@138@01) n@138@01) (img@140@01 n@138@01)))
  :pattern ((Set_in n@138@01 g@78@01))
  :pattern ((inv@139@01 n@138@01))
  :pattern ((img@140@01 n@138@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@140@01 r) (Set_in (inv@139@01 r) g@78@01)) (= (inv@139@01 r) r))
  :pattern ((inv@139@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)))
    (=>
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@144@01  $FVF<next>))))
  :qid |qp.fvfDomDef93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@139@01 r) g@78@01) (img@140@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@144@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@144@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef96|)))
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@78@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@78@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@78@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@151@01  $FVF<next>))))
  :qid |qp.fvfDomDef100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r)) (= r x@79@01))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@78@01) (img@147@01 r))
      (and
        (img@85@01 r)
        (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01)))))
    (=
      ($FVF.lookup_next (as sm@151@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@151@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@79@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfValDef101|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (+
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@85@01 r)
          (and (Set_in (inv@84@01 r) g@78@01) (not (= (inv@84@01 r) x@79@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef104|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@80@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resTrgDef105|)))
(assert (=>
  (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
  (and
    (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
    (forall ((v1@124@01 $Ref) (v2@125@01 $Ref)) (!
      (and
        (=>
          (not (= v1@124@01 v2@125@01))
          (and
            (not (= v1@124@01 v2@125@01))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@127@01 r) g@78@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@94@01  $FVF<next>) r) r))
              :pattern ((inv@127@01 r))
              :qid |quant-u-194|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@131@01  $FVF<next>)) g@78@01)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@133@01 r) g@78@01)
                ($FVF.loc_next ($FVF.lookup_next (as sm@86@01  $FVF<next>) r) r))
              :pattern ((inv@133@01 r))
              :qid |quant-u-202|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01)
            (=>
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
              (and
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
                (forall ((r $Ref)) (!
                  (=>
                    (Set_in (inv@139@01 r) g@78@01)
                    ($FVF.loc_next ($FVF.lookup_next (as sm@141@01  $FVF<next>) r) r))
                  :pattern ((inv@139@01 r))
                  :qid |quant-u-210|))
                ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01)
                (=>
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
                  (and
                    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
                    (forall ((r $Ref)) (!
                      (=>
                        (Set_in (inv@146@01 r) g@78@01)
                        ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
                      :pattern ((inv@146@01 r))
                      :qid |quant-u-218|))
                    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@151@01  $FVF<next>)) g@78@01)
                    ($FVF.loc_next ($FVF.lookup_next (as sm@152@01  $FVF<next>) x@79@01) x@79@01)))
                (or
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
                  (not
                    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)))))
            (or
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
              (not
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)))))
        (or (= v1@124@01 v2@125@01) (not (= v1@124@01 v2@125@01))))
      :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@131@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01))
      :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@288@38@292@128-aux|)))))
; Joined path conditions
(assert (=>
  (not (= ($FVF.lookup_next (as sm@86@01  $FVF<next>) x@79@01) $Ref.null))
  (forall ((v1@124@01 $Ref) (v2@125@01 $Ref)) (!
    (=>
      (not (= v1@124@01 v2@125@01))
      (=
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@131@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
        (and
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@137@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01)
          (not
            (and
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@144@01  $FVF<next>)) g@78@01) v1@124@01 x@79@01)
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@151@01  $FVF<next>)) g@78@01) ($FVF.lookup_next (as sm@152@01  $FVF<next>) x@79@01) v2@125@01))))))
    :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@131@01  $FVF<next>)) g@78@01) v1@124@01 v2@125@01))
    :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@288@38@292@128|))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- swap ----------
(declare-const g@154@01 Set<$Ref>)
(declare-const x@155@01 $Ref)
(declare-const i@156@01 Int)
(declare-const j@157@01 Int)
(declare-const g@158@01 Set<$Ref>)
(declare-const x@159@01 $Ref)
(declare-const i@160@01 Int)
(declare-const j@161@01 Int)
(push) ; 1
(declare-const $t@162@01 $Snap)
(assert (= $t@162@01 ($Snap.combine ($Snap.first $t@162@01) ($Snap.second $t@162@01))))
(assert (= ($Snap.first $t@162@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@160@01))
(assert (=
  ($Snap.second $t@162@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@162@01))
    ($Snap.second ($Snap.second $t@162@01)))))
(assert (= ($Snap.first ($Snap.second $t@162@01)) $Snap.unit))
; [eval] i < j
(assert (< i@160@01 j@161@01))
(assert (=
  ($Snap.second ($Snap.second $t@162@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@162@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@162@01))) $Snap.unit))
; [eval] (x in g)
(assert (Set_in x@159@01 g@158@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@162@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@162@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@162@01))))
  $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (not (Set_in $Ref.null g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))))
(declare-const n@163@01 $Ref)
(push) ; 2
; [eval] (n in g)
(assert (Set_in n@163@01 g@158@01))
(declare-const sm@164@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@165@01 ($Ref) $Ref)
(declare-fun img@166@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@163@01 $Ref) (n2@163@01 $Ref)) (!
  (=>
    (and
      (Set_in n1@163@01 g@158@01)
      (Set_in n2@163@01 g@158@01)
      (= n1@163@01 n2@163@01))
    (= n1@163@01 n2@163@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@163@01 $Ref)) (!
  (=>
    (Set_in n@163@01 g@158@01)
    (and (= (inv@165@01 n@163@01) n@163@01) (img@166@01 n@163@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) n@163@01) n@163@01))
  :qid |quant-u-226|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)) (= (inv@165@01 r) r))
  :pattern ((inv@165@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@163@01 $Ref)) (!
  (=> (Set_in n@163@01 g@158@01) (not (= n@163@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) n@163@01) n@163@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@167@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@167@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef108|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@165@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) r) r))
  :pattern ((inv@165@01 r))
  :qid |quant-u-227|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))
  $Snap.unit))
; [eval] (forall n$0: Ref :: { (n$0.next in g) } { (n$0 in g), n$0.next } (n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@168@01 $Ref)
(push) ; 2
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 3
; [then-branch: 29 | !(n$0@168@01 in g@158@01) | live]
; [else-branch: 29 | n$0@168@01 in g@158@01 | live]
(push) ; 4
; [then-branch: 29 | !(n$0@168@01 in g@158@01)]
(assert (not (Set_in n$0@168@01 g@158@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 29 | n$0@168@01 in g@158@01]
(assert (Set_in n$0@168@01 g@158@01))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@167@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
    :qid |qp.fvfValDef107|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
    :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef108|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01))
(push) ; 5
(assert (not (and (img@166@01 n$0@168@01) (Set_in (inv@165@01 n$0@168@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@167@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef108|)))
(assert (=>
  (Set_in n$0@168@01 g@158@01)
  (and
    (Set_in n$0@168@01 g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01))))
(assert (or (Set_in n$0@168@01 g@158@01) (not (Set_in n$0@168@01 g@158@01))))
(push) ; 3
; [then-branch: 30 | n$0@168@01 in g@158@01 && Lookup(next, sm@167@01, n$0@168@01) != Null | live]
; [else-branch: 30 | !(n$0@168@01 in g@158@01 && Lookup(next, sm@167@01, n$0@168@01) != Null) | live]
(push) ; 4
; [then-branch: 30 | n$0@168@01 in g@158@01 && Lookup(next, sm@167@01, n$0@168@01) != Null]
(assert (and
  (Set_in n$0@168@01 g@158@01)
  (not (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null))))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@167@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
    :qid |qp.fvfValDef107|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
    :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef108|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01))
(push) ; 5
(assert (not (and (img@166@01 n$0@168@01) (Set_in (inv@165@01 n$0@168@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 30 | !(n$0@168@01 in g@158@01 && Lookup(next, sm@167@01, n$0@168@01) != Null)]
(assert (not
  (and
    (Set_in n$0@168@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@167@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef108|)))
(assert (=>
  (and
    (Set_in n$0@168@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null)))
  (and
    (Set_in n$0@168@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@168@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null))))
  (and
    (Set_in n$0@168@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@167@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef108|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$0@168@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@168@01 g@158@01)
      (and
        (Set_in n$0@168@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01)))
    (or (Set_in n$0@168@01 g@158@01) (not (Set_in n$0@168@01 g@158@01)))
    (=>
      (and
        (Set_in n$0@168@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null)))
      (and
        (Set_in n$0@168@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01)))
    (or
      (not
        (and
          (Set_in n$0@168@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01)
              $Ref.null))))
      (and
        (Set_in n$0@168@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) g@158@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@301@14@301@22-aux|)))
(assert (forall ((n$0@168@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@168@01 g@158@01)
      (and
        (Set_in n$0@168@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01)))
    (or (Set_in n$0@168@01 g@158@01) (not (Set_in n$0@168@01 g@158@01)))
    (=>
      (and
        (Set_in n$0@168@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null)))
      (and
        (Set_in n$0@168@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01)))
    (or
      (not
        (and
          (Set_in n$0@168@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01)
              $Ref.null))))
      (and
        (Set_in n$0@168@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null)))))
  :pattern ((Set_in n$0@168@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@301@14@301@22-aux|)))
(assert (forall ((n$0@168@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@168@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) g@158@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) g@158@01))
  :pattern ((Set_in n$0@168@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n$0@168@01) n$0@168@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@301@14@301@22|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))
  $Snap.unit))
; [eval] acyclic_graph($$(g))
; [eval] $$(g)
(push) ; 2
(declare-const n@169@01 $Ref)
(push) ; 3
; [eval] (n in refs)
(assert (Set_in n@169@01 g@158@01))
(pop) ; 3
(declare-fun inv@170@01 ($Ref) $Ref)
(declare-fun img@171@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@169@01 $Ref) (n2@169@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@169@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n1@169@01) n1@169@01))
      (and
        (Set_in n2@169@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) n2@169@01) n2@169@01))
      (= n1@169@01 n2@169@01))
    (= n1@169@01 n2@169@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@169@01 $Ref)) (!
  (=>
    (Set_in n@169@01 g@158@01)
    (and (= (inv@170@01 n@169@01) n@169@01) (img@171@01 n@169@01)))
  :pattern ((Set_in n@169@01 g@158@01))
  :pattern ((inv@170@01 n@169@01))
  :pattern ((img@171@01 n@169@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@171@01 r) (Set_in (inv@170@01 r) g@158@01)) (= (inv@170@01 r) r))
  :pattern ((inv@170@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@170@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) r) r))
  :pattern ((inv@170@01 r))
  :qid |quant-u-229|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@172@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@170@01 r) g@158@01) (img@171@01 r) (= r (inv@170@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@172@01 r))
    $Perm.No)
  
  :qid |quant-u-231|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@172@01 r) $Perm.No)
  
  :qid |quant-u-232|))))
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
    (and (Set_in (inv@170@01 r) g@158@01) (img@171@01 r) (= r (inv@170@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@172@01 r)) $Perm.No))
  
  :qid |quant-u-233|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@173@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@173@01  $FVF<next>)))
      (and (Set_in (inv@170@01 r) g@158@01) (img@171@01 r)))
    (=>
      (and (Set_in (inv@170@01 r) g@158@01) (img@171@01 r))
      (Set_in r ($FVF.domain_next (as sm@173@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@173@01  $FVF<next>))))
  :qid |qp.fvfDomDef111|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@170@01 r) g@158@01) (img@171@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@173@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@173@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef109|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@173@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef110|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@173@01  $FVF<next>)) g@158@01))
(pop) ; 2
; Joined path conditions
(assert (forall ((n@169@01 $Ref)) (!
  (=>
    (Set_in n@169@01 g@158@01)
    (and (= (inv@170@01 n@169@01) n@169@01) (img@171@01 n@169@01)))
  :pattern ((Set_in n@169@01 g@158@01))
  :pattern ((inv@170@01 n@169@01))
  :pattern ((img@171@01 n@169@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@171@01 r) (Set_in (inv@170@01 r) g@158@01)) (= (inv@170@01 r) r))
  :pattern ((inv@170@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@173@01  $FVF<next>)))
      (and (Set_in (inv@170@01 r) g@158@01) (img@171@01 r)))
    (=>
      (and (Set_in (inv@170@01 r) g@158@01) (img@171@01 r))
      (Set_in r ($FVF.domain_next (as sm@173@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@173@01  $FVF<next>))))
  :qid |qp.fvfDomDef111|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@170@01 r) g@158@01) (img@171@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@173@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@173@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef109|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@173@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef110|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@170@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@167@01  $FVF<next>) r) r))
    :pattern ((inv@170@01 r))
    :qid |quant-u-229|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@173@01  $FVF<next>)) g@158@01)))
(assert (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@173@01  $FVF<next>)) g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))))
  $Snap.unit))
; [eval] func_graph($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 2
(declare-const n@174@01 $Ref)
(push) ; 3
; [eval] (n in refs)
(assert (Set_in n@174@01 g@158@01))
(pop) ; 3
(declare-fun inv@175@01 ($Ref) $Ref)
(declare-fun img@176@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@177@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@177@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef112|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef113|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@174@01 $Ref) (n2@174@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@174@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@177@01  $FVF<next>) n1@174@01) n1@174@01))
      (and
        (Set_in n2@174@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@177@01  $FVF<next>) n2@174@01) n2@174@01))
      (= n1@174@01 n2@174@01))
    (= n1@174@01 n2@174@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@174@01 $Ref)) (!
  (=>
    (Set_in n@174@01 g@158@01)
    (and (= (inv@175@01 n@174@01) n@174@01) (img@176@01 n@174@01)))
  :pattern ((Set_in n@174@01 g@158@01))
  :pattern ((inv@175@01 n@174@01))
  :pattern ((img@176@01 n@174@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@176@01 r) (Set_in (inv@175@01 r) g@158@01)) (= (inv@175@01 r) r))
  :pattern ((inv@175@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@175@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@177@01  $FVF<next>) r) r))
  :pattern ((inv@175@01 r))
  :qid |quant-u-235|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@178@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@175@01 r) g@158@01) (img@176@01 r) (= r (inv@175@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@178@01 r))
    $Perm.No)
  
  :qid |quant-u-237|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@178@01 r) $Perm.No)
  
  :qid |quant-u-238|))))
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
    (and (Set_in (inv@175@01 r) g@158@01) (img@176@01 r) (= r (inv@175@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@178@01 r)) $Perm.No))
  
  :qid |quant-u-239|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@179@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@179@01  $FVF<next>)))
      (and (Set_in (inv@175@01 r) g@158@01) (img@176@01 r)))
    (=>
      (and (Set_in (inv@175@01 r) g@158@01) (img@176@01 r))
      (Set_in r ($FVF.domain_next (as sm@179@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@179@01  $FVF<next>))))
  :qid |qp.fvfDomDef116|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@175@01 r) g@158@01) (img@176@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@179@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef114|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef115|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@179@01  $FVF<next>)) g@158@01))
(pop) ; 2
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@177@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef112|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef113|)))
(assert (forall ((n@174@01 $Ref)) (!
  (=>
    (Set_in n@174@01 g@158@01)
    (and (= (inv@175@01 n@174@01) n@174@01) (img@176@01 n@174@01)))
  :pattern ((Set_in n@174@01 g@158@01))
  :pattern ((inv@175@01 n@174@01))
  :pattern ((img@176@01 n@174@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@176@01 r) (Set_in (inv@175@01 r) g@158@01)) (= (inv@175@01 r) r))
  :pattern ((inv@175@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@179@01  $FVF<next>)))
      (and (Set_in (inv@175@01 r) g@158@01) (img@176@01 r)))
    (=>
      (and (Set_in (inv@175@01 r) g@158@01) (img@176@01 r))
      (Set_in r ($FVF.domain_next (as sm@179@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@179@01  $FVF<next>))))
  :qid |qp.fvfDomDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@175@01 r) g@158@01) (img@176@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@179@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef114|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef115|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@175@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@177@01  $FVF<next>) r) r))
    :pattern ((inv@175@01 r))
    :qid |quant-u-235|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@179@01  $FVF<next>)) g@158@01)))
(assert (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@179@01  $FVF<next>)) g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))))
  $Snap.unit))
; [eval] unshared_graph($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 2
(declare-const n@180@01 $Ref)
(push) ; 3
; [eval] (n in refs)
(assert (Set_in n@180@01 g@158@01))
(pop) ; 3
(declare-fun inv@181@01 ($Ref) $Ref)
(declare-fun img@182@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@183@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@183@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@183@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@183@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef118|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@180@01 $Ref) (n2@180@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@180@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@183@01  $FVF<next>) n1@180@01) n1@180@01))
      (and
        (Set_in n2@180@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@183@01  $FVF<next>) n2@180@01) n2@180@01))
      (= n1@180@01 n2@180@01))
    (= n1@180@01 n2@180@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@180@01 $Ref)) (!
  (=>
    (Set_in n@180@01 g@158@01)
    (and (= (inv@181@01 n@180@01) n@180@01) (img@182@01 n@180@01)))
  :pattern ((Set_in n@180@01 g@158@01))
  :pattern ((inv@181@01 n@180@01))
  :pattern ((img@182@01 n@180@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@182@01 r) (Set_in (inv@181@01 r) g@158@01)) (= (inv@181@01 r) r))
  :pattern ((inv@181@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@181@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@183@01  $FVF<next>) r) r))
  :pattern ((inv@181@01 r))
  :qid |quant-u-241|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@184@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@181@01 r) g@158@01) (img@182@01 r) (= r (inv@181@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@184@01 r))
    $Perm.No)
  
  :qid |quant-u-243|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@184@01 r) $Perm.No)
  
  :qid |quant-u-244|))))
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
    (and (Set_in (inv@181@01 r) g@158@01) (img@182@01 r) (= r (inv@181@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@184@01 r)) $Perm.No))
  
  :qid |quant-u-245|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@185@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@185@01  $FVF<next>)))
      (and (Set_in (inv@181@01 r) g@158@01) (img@182@01 r)))
    (=>
      (and (Set_in (inv@181@01 r) g@158@01) (img@182@01 r))
      (Set_in r ($FVF.domain_next (as sm@185@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@185@01  $FVF<next>))))
  :qid |qp.fvfDomDef121|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@181@01 r) g@158@01) (img@182@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@185@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@185@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@185@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef120|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@185@01  $FVF<next>)) g@158@01))
(pop) ; 2
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@183@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@183@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@183@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef118|)))
(assert (forall ((n@180@01 $Ref)) (!
  (=>
    (Set_in n@180@01 g@158@01)
    (and (= (inv@181@01 n@180@01) n@180@01) (img@182@01 n@180@01)))
  :pattern ((Set_in n@180@01 g@158@01))
  :pattern ((inv@181@01 n@180@01))
  :pattern ((img@182@01 n@180@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@182@01 r) (Set_in (inv@181@01 r) g@158@01)) (= (inv@181@01 r) r))
  :pattern ((inv@181@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@185@01  $FVF<next>)))
      (and (Set_in (inv@181@01 r) g@158@01) (img@182@01 r)))
    (=>
      (and (Set_in (inv@181@01 r) g@158@01) (img@182@01 r))
      (Set_in r ($FVF.domain_next (as sm@185@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@185@01  $FVF<next>))))
  :qid |qp.fvfDomDef121|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@181@01 r) g@158@01) (img@182@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@185@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@185@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@185@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef120|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@181@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@183@01  $FVF<next>) r) r))
    :pattern ((inv@181@01 r))
    :qid |quant-u-241|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@185@01  $FVF<next>)) g@158@01)))
(assert (unshared_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@185@01  $FVF<next>)) g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))))))
  $Snap.unit))
; [eval] (forall n$1: Ref :: { exists_path($$(g), x, n$1) } (n$1 in g) ==> exists_path($$(g), x, n$1))
(declare-const n$1@186@01 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (n$1 in g) ==> exists_path($$(g), x, n$1)
; [eval] (n$1 in g)
(push) ; 3
; [then-branch: 31 | n$1@186@01 in g@158@01 | live]
; [else-branch: 31 | !(n$1@186@01 in g@158@01) | live]
(push) ; 4
; [then-branch: 31 | n$1@186@01 in g@158@01]
(assert (Set_in n$1@186@01 g@158@01))
; [eval] exists_path($$(g), x, n$1)
; [eval] $$(g)
(push) ; 5
(declare-const n@187@01 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@187@01 g@158@01))
(pop) ; 6
(declare-fun inv@188@01 ($Ref) $Ref)
(declare-fun img@189@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@190@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@190@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@190@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@190@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef123|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@187@01 $Ref) (n2@187@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@187@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@190@01  $FVF<next>) n1@187@01) n1@187@01))
      (and
        (Set_in n2@187@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@190@01  $FVF<next>) n2@187@01) n2@187@01))
      (= n1@187@01 n2@187@01))
    (= n1@187@01 n2@187@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@187@01 $Ref)) (!
  (=>
    (Set_in n@187@01 g@158@01)
    (and (= (inv@188@01 n@187@01) n@187@01) (img@189@01 n@187@01)))
  :pattern ((Set_in n@187@01 g@158@01))
  :pattern ((inv@188@01 n@187@01))
  :pattern ((img@189@01 n@187@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@189@01 r) (Set_in (inv@188@01 r) g@158@01)) (= (inv@188@01 r) r))
  :pattern ((inv@188@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@188@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@190@01  $FVF<next>) r) r))
  :pattern ((inv@188@01 r))
  :qid |quant-u-247|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@191@01 ((r $Ref) (n$1@186@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r) (= r (inv@188@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@191@01 r n$1@186@01))
    $Perm.No)
  
  :qid |quant-u-249|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@191@01 r n$1@186@01) $Perm.No)
  
  :qid |quant-u-250|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r) (= r (inv@188@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@191@01 r n$1@186@01)) $Perm.No))
  
  :qid |quant-u-251|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@192@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>)))
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r)))
    (=>
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r))
      (Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>))))
  :qid |qp.fvfDomDef126|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@192@01  $FVF<next>)) g@158@01))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@190@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@190@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@190@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef123|)))
(assert (forall ((n@187@01 $Ref)) (!
  (=>
    (Set_in n@187@01 g@158@01)
    (and (= (inv@188@01 n@187@01) n@187@01) (img@189@01 n@187@01)))
  :pattern ((Set_in n@187@01 g@158@01))
  :pattern ((inv@188@01 n@187@01))
  :pattern ((img@189@01 n@187@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@189@01 r) (Set_in (inv@188@01 r) g@158@01)) (= (inv@188@01 r) r))
  :pattern ((inv@188@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>)))
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r)))
    (=>
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r))
      (Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>))))
  :qid |qp.fvfDomDef126|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@188@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@190@01  $FVF<next>) r) r))
    :pattern ((inv@188@01 r))
    :qid |quant-u-247|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@192@01  $FVF<next>)) g@158@01)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 31 | !(n$1@186@01 in g@158@01)]
(assert (not (Set_in n$1@186@01 g@158@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@190@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@190@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@190@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef123|)))
(assert (forall ((n@187@01 $Ref)) (!
  (=>
    (Set_in n@187@01 g@158@01)
    (and (= (inv@188@01 n@187@01) n@187@01) (img@189@01 n@187@01)))
  :pattern ((Set_in n@187@01 g@158@01))
  :pattern ((inv@188@01 n@187@01))
  :pattern ((img@189@01 n@187@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@189@01 r) (Set_in (inv@188@01 r) g@158@01)) (= (inv@188@01 r) r))
  :pattern ((inv@188@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>)))
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r)))
    (=>
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r))
      (Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>))))
  :qid |qp.fvfDomDef126|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (=>
  (Set_in n$1@186@01 g@158@01)
  (and
    (Set_in n$1@186@01 g@158@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@188@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@190@01  $FVF<next>) r) r))
      :pattern ((inv@188@01 r))
      :qid |quant-u-247|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@192@01  $FVF<next>)) g@158@01))))
; Joined path conditions
(assert (or (not (Set_in n$1@186@01 g@158@01)) (Set_in n$1@186@01 g@158@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@190@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@190@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@190@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef123|)))
(assert (forall ((n@187@01 $Ref)) (!
  (=>
    (Set_in n@187@01 g@158@01)
    (and (= (inv@188@01 n@187@01) n@187@01) (img@189@01 n@187@01)))
  :pattern ((Set_in n@187@01 g@158@01))
  :pattern ((inv@188@01 n@187@01))
  :pattern ((img@189@01 n@187@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@189@01 r) (Set_in (inv@188@01 r) g@158@01)) (= (inv@188@01 r) r))
  :pattern ((inv@188@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>)))
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r)))
    (=>
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r))
      (Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@192@01  $FVF<next>))))
  :qid |qp.fvfDomDef126|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@188@01 r) g@158@01) (img@189@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef125|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$1@186@01 $Ref)) (!
  (and
    (=>
      (Set_in n$1@186@01 g@158@01)
      (and
        (Set_in n$1@186@01 g@158@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@188@01 r) g@158@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@190@01  $FVF<next>) r) r))
          :pattern ((inv@188@01 r))
          :qid |quant-u-247|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@192@01  $FVF<next>)) g@158@01)))
    (or (not (Set_in n$1@186@01 g@158@01)) (Set_in n$1@186@01 g@158@01)))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@192@01  $FVF<next>)) g@158@01) x@159@01 n$1@186@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@305@14@305@33-aux|)))
(assert (forall ((n$1@186@01 $Ref)) (!
  (=>
    (Set_in n$1@186@01 g@158@01)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@192@01  $FVF<next>)) g@158@01) x@159@01 n$1@186@01))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@192@01  $FVF<next>)) g@158@01) x@159@01 n$1@186@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@305@14@305@33|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var count: Int
(declare-const count@193@01 Int)
; [exec]
; var prev_node: Ref
(declare-const prev_node@194@01 $Ref)
; [exec]
; var node: Ref
(declare-const node@195@01 $Ref)
; [exec]
; var prev_i: Ref
(declare-const prev_i@196@01 $Ref)
; [exec]
; var node_i: Ref
(declare-const node_i@197@01 $Ref)
; [exec]
; count := 0
; [exec]
; prev_node := x
; [exec]
; node := x.next
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) x@159@01) x@159@01))
(push) ; 3
(assert (not (and (img@166@01 x@159@01) (Set_in (inv@165@01 x@159@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const node@198@01 $Ref)
(assert (=
  node@198@01
  ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) x@159@01)))
; [exec]
; prev_i := null
; [exec]
; node_i := null
(declare-const node_i@199@01 $Ref)
(declare-const prev_i@200@01 $Ref)
(declare-const node_j@201@01 $Ref)
(declare-const prev_j@202@01 $Ref)
(declare-const exit@203@01 $Ref)
(declare-const prev_node@204@01 $Ref)
(declare-const node@205@01 $Ref)
(declare-const count@206@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@207@01 $Snap)
(assert (= $t@207@01 ($Snap.combine ($Snap.first $t@207@01) ($Snap.second $t@207@01))))
(assert (= ($Snap.first $t@207@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@207@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@207@01))
    ($Snap.second ($Snap.second $t@207@01)))))
(assert (= ($Snap.first ($Snap.second $t@207@01)) $Snap.unit))
; [eval] i < j
(assert (=
  ($Snap.second ($Snap.second $t@207@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@207@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@207@01))) $Snap.unit))
; [eval] 0 <= count
(assert (<= 0 count@206@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@207@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@207@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@207@01))))
  $Snap.unit))
; [eval] (x in g)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))
  $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))
(declare-const n$2@208@01 $Ref)
(push) ; 4
; [eval] (n$2 in g)
(assert (Set_in n$2@208@01 g@158@01))
(declare-const sm@209@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 4
(declare-fun inv@210@01 ($Ref) $Ref)
(declare-fun img@211@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n$21@208@01 $Ref) (n$22@208@01 $Ref)) (!
  (=>
    (and
      (Set_in n$21@208@01 g@158@01)
      (Set_in n$22@208@01 g@158@01)
      (= n$21@208@01 n$22@208@01))
    (= n$21@208@01 n$22@208@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$2@208@01 $Ref)) (!
  (=>
    (Set_in n$2@208@01 g@158@01)
    (and (= (inv@210@01 n$2@208@01) n$2@208@01) (img@211@01 n$2@208@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) n$2@208@01) n$2@208@01))
  :qid |quant-u-253|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)) (= (inv@210@01 r) r))
  :pattern ((inv@210@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n$2@208@01 $Ref)) (!
  (=> (Set_in n$2@208@01 g@158@01) (not (= n$2@208@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) n$2@208@01) n$2@208@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@212@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@210@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
  :pattern ((inv@210@01 r))
  :qid |quant-u-254|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))
  $Snap.unit))
; [eval] (forall n$3: Ref :: { (n$3.next in g) } { (n$3 in g), n$3.next } (n$3 in g) && n$3.next != null ==> (n$3.next in g))
(declare-const n$3@213@01 $Ref)
(push) ; 4
; [eval] (n$3 in g) && n$3.next != null ==> (n$3.next in g)
; [eval] (n$3 in g) && n$3.next != null
; [eval] (n$3 in g)
(push) ; 5
; [then-branch: 32 | !(n$3@213@01 in g@158@01) | live]
; [else-branch: 32 | n$3@213@01 in g@158@01 | live]
(push) ; 6
; [then-branch: 32 | !(n$3@213@01 in g@158@01)]
(assert (not (Set_in n$3@213@01 g@158@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 32 | n$3@213@01 in g@158@01]
(assert (Set_in n$3@213@01 g@158@01))
; [eval] n$3.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
    :qid |qp.fvfValDef128|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef129|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01))
(push) ; 7
(assert (not (and (img@211@01 n$3@213@01) (Set_in (inv@210@01 n$3@213@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (=>
  (Set_in n$3@213@01 g@158@01)
  (and
    (Set_in n$3@213@01 g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01))))
(assert (or (Set_in n$3@213@01 g@158@01) (not (Set_in n$3@213@01 g@158@01))))
(push) ; 5
; [then-branch: 33 | n$3@213@01 in g@158@01 && Lookup(next, sm@212@01, n$3@213@01) != Null | live]
; [else-branch: 33 | !(n$3@213@01 in g@158@01 && Lookup(next, sm@212@01, n$3@213@01) != Null) | live]
(push) ; 6
; [then-branch: 33 | n$3@213@01 in g@158@01 && Lookup(next, sm@212@01, n$3@213@01) != Null]
(assert (and
  (Set_in n$3@213@01 g@158@01)
  (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null))))
; [eval] (n$3.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
    :qid |qp.fvfValDef128|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef129|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01))
(push) ; 7
(assert (not (and (img@211@01 n$3@213@01) (Set_in (inv@210@01 n$3@213@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 33 | !(n$3@213@01 in g@158@01 && Lookup(next, sm@212@01, n$3@213@01) != Null)]
(assert (not
  (and
    (Set_in n$3@213@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (=>
  (and
    (Set_in n$3@213@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))
  (and
    (Set_in n$3@213@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$3@213@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null))))
  (and
    (Set_in n$3@213@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef129|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$3@213@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@213@01 g@158@01)
      (and
        (Set_in n$3@213@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01)))
    (or (Set_in n$3@213@01 g@158@01) (not (Set_in n$3@213@01 g@158@01)))
    (=>
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01)))
    (or
      (not
        (and
          (Set_in n$3@213@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01)
              $Ref.null))))
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) g@158@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27-aux|)))
(assert (forall ((n$3@213@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@213@01 g@158@01)
      (and
        (Set_in n$3@213@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01)))
    (or (Set_in n$3@213@01 g@158@01) (not (Set_in n$3@213@01 g@158@01)))
    (=>
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01)))
    (or
      (not
        (and
          (Set_in n$3@213@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01)
              $Ref.null))))
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))))
  :pattern ((Set_in n$3@213@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27-aux|)))
(assert (forall ((n$3@213@01 $Ref)) (!
  (=>
    (and
      (Set_in n$3@213@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) g@158@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) g@158@01))
  :pattern ((Set_in n$3@213@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))
  $Snap.unit))
; [eval] node != null ==> (node in g)
; [eval] node != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= node@205@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= node@205@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | node@205@01 != Null | live]
; [else-branch: 34 | node@205@01 == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 34 | node@205@01 != Null]
(assert (not (= node@205@01 $Ref.null)))
; [eval] (node in g)
(pop) ; 5
(push) ; 5
; [else-branch: 34 | node@205@01 == Null]
(assert (= node@205@01 $Ref.null))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= node@205@01 $Ref.null) (not (= node@205@01 $Ref.null))))
(assert (=> (not (= node@205@01 $Ref.null)) (Set_in node@205@01 g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))
  $Snap.unit))
; [eval] count <= j ==> (prev_node in g)
; [eval] count <= j
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= count@206@01 j@161@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= count@206@01 j@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | count@206@01 <= j@161@01 | live]
; [else-branch: 35 | !(count@206@01 <= j@161@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 35 | count@206@01 <= j@161@01]
(assert (<= count@206@01 j@161@01))
; [eval] (prev_node in g)
(pop) ; 5
(push) ; 5
; [else-branch: 35 | !(count@206@01 <= j@161@01)]
(assert (not (<= count@206@01 j@161@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= count@206@01 j@161@01)) (<= count@206@01 j@161@01)))
(assert (=> (<= count@206@01 j@161@01) (Set_in prev_node@204@01 g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))
  $Snap.unit))
; [eval] i < count ==> (node_i in g) && (prev_i in g)
; [eval] i < count
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@160@01 count@206@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@160@01 count@206@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | i@160@01 < count@206@01 | live]
; [else-branch: 36 | !(i@160@01 < count@206@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 36 | i@160@01 < count@206@01]
(assert (< i@160@01 count@206@01))
; [eval] (node_i in g) && (prev_i in g)
; [eval] (node_i in g)
(push) ; 6
; [then-branch: 37 | !(node_i@199@01 in g@158@01) | live]
; [else-branch: 37 | node_i@199@01 in g@158@01 | live]
(push) ; 7
; [then-branch: 37 | !(node_i@199@01 in g@158@01)]
(assert (not (Set_in node_i@199@01 g@158@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 37 | node_i@199@01 in g@158@01]
(assert (Set_in node_i@199@01 g@158@01))
; [eval] (prev_i in g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in node_i@199@01 g@158@01) (not (Set_in node_i@199@01 g@158@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | !(i@160@01 < count@206@01)]
(assert (not (< i@160@01 count@206@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (< i@160@01 count@206@01)
  (and
    (< i@160@01 count@206@01)
    (or (Set_in node_i@199@01 g@158@01) (not (Set_in node_i@199@01 g@158@01))))))
; Joined path conditions
(assert (or (not (< i@160@01 count@206@01)) (< i@160@01 count@206@01)))
(assert (=>
  (< i@160@01 count@206@01)
  (and (Set_in node_i@199@01 g@158@01) (Set_in prev_i@200@01 g@158@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))
  $Snap.unit))
; [eval] count <= j ==> prev_node.next == node
; [eval] count <= j
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= count@206@01 j@161@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= count@206@01 j@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | count@206@01 <= j@161@01 | live]
; [else-branch: 38 | !(count@206@01 <= j@161@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | count@206@01 <= j@161@01]
(assert (<= count@206@01 j@161@01))
; [eval] prev_node.next == node
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
    :qid |qp.fvfValDef128|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef129|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) prev_node@204@01) prev_node@204@01))
(push) ; 6
(assert (not (and
  (img@211@01 prev_node@204@01)
  (Set_in (inv@210@01 prev_node@204@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 38 | !(count@206@01 <= j@161@01)]
(assert (not (<= count@206@01 j@161@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (=>
  (<= count@206@01 j@161@01)
  (and
    (<= count@206@01 j@161@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) prev_node@204@01) prev_node@204@01))))
; Joined path conditions
(assert (=>
  (<= count@206@01 j@161@01)
  (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) prev_node@204@01) node@205@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))
  $Snap.unit))
; [eval] acyclic_graph($$(g))
; [eval] $$(g)
(push) ; 4
(declare-const n@214@01 $Ref)
(push) ; 5
; [eval] (n in refs)
(assert (Set_in n@214@01 g@158@01))
(pop) ; 5
(declare-fun inv@215@01 ($Ref) $Ref)
(declare-fun img@216@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@214@01 $Ref) (n2@214@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@214@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n1@214@01) n1@214@01))
      (and
        (Set_in n2@214@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n2@214@01) n2@214@01))
      (= n1@214@01 n2@214@01))
    (= n1@214@01 n2@214@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@214@01 $Ref)) (!
  (=>
    (Set_in n@214@01 g@158@01)
    (and (= (inv@215@01 n@214@01) n@214@01) (img@216@01 n@214@01)))
  :pattern ((Set_in n@214@01 g@158@01))
  :pattern ((inv@215@01 n@214@01))
  :pattern ((img@216@01 n@214@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@216@01 r) (Set_in (inv@215@01 r) g@158@01)) (= (inv@215@01 r) r))
  :pattern ((inv@215@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@215@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
  :pattern ((inv@215@01 r))
  :qid |quant-u-256|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@217@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r) (= r (inv@215@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@217@01 r))
    $Perm.No)
  
  :qid |quant-u-258|))))
(check-sat)
; unknown
(pop) ; 5
; 0,51s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@217@01 r) $Perm.No)
  
  :qid |quant-u-259|))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r) (= r (inv@215@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@217@01 r)) $Perm.No))
  
  :qid |quant-u-260|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@218@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@218@01  $FVF<next>)))
      (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r)))
    (=>
      (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r))
      (Set_in r ($FVF.domain_next (as sm@218@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@218@01  $FVF<next>))))
  :qid |qp.fvfDomDef132|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@218@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@218@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@218@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef131|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@218@01  $FVF<next>)) g@158@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((n@214@01 $Ref)) (!
  (=>
    (Set_in n@214@01 g@158@01)
    (and (= (inv@215@01 n@214@01) n@214@01) (img@216@01 n@214@01)))
  :pattern ((Set_in n@214@01 g@158@01))
  :pattern ((inv@215@01 n@214@01))
  :pattern ((img@216@01 n@214@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@216@01 r) (Set_in (inv@215@01 r) g@158@01)) (= (inv@215@01 r) r))
  :pattern ((inv@215@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@218@01  $FVF<next>)))
      (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r)))
    (=>
      (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r))
      (Set_in r ($FVF.domain_next (as sm@218@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@218@01  $FVF<next>))))
  :qid |qp.fvfDomDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@218@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@218@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@218@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef131|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@215@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
    :pattern ((inv@215@01 r))
    :qid |quant-u-256|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@218@01  $FVF<next>)) g@158@01)))
(assert (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@218@01  $FVF<next>)) g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))
  $Snap.unit))
; [eval] func_graph($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 4
(declare-const n@219@01 $Ref)
(push) ; 5
; [eval] (n in refs)
(assert (Set_in n@219@01 g@158@01))
(pop) ; 5
(declare-fun inv@220@01 ($Ref) $Ref)
(declare-fun img@221@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@222@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@219@01 $Ref) (n2@219@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@219@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) n1@219@01) n1@219@01))
      (and
        (Set_in n2@219@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) n2@219@01) n2@219@01))
      (= n1@219@01 n2@219@01))
    (= n1@219@01 n2@219@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@219@01 $Ref)) (!
  (=>
    (Set_in n@219@01 g@158@01)
    (and (= (inv@220@01 n@219@01) n@219@01) (img@221@01 n@219@01)))
  :pattern ((Set_in n@219@01 g@158@01))
  :pattern ((inv@220@01 n@219@01))
  :pattern ((img@221@01 n@219@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@221@01 r) (Set_in (inv@220@01 r) g@158@01)) (= (inv@220@01 r) r))
  :pattern ((inv@220@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@220@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) r) r))
  :pattern ((inv@220@01 r))
  :qid |quant-u-262|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@223@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r) (= r (inv@220@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@223@01 r))
    $Perm.No)
  
  :qid |quant-u-264|))))
(check-sat)
; unknown
(pop) ; 5
; 0,51s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@223@01 r) $Perm.No)
  
  :qid |quant-u-265|))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r) (= r (inv@220@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@223@01 r)) $Perm.No))
  
  :qid |quant-u-266|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@224@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@224@01  $FVF<next>)))
      (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r)))
    (=>
      (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r))
      (Set_in r ($FVF.domain_next (as sm@224@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@224@01  $FVF<next>))))
  :qid |qp.fvfDomDef137|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@224@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@224@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef135|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@224@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef136|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@224@01  $FVF<next>)) g@158@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
(assert (forall ((n@219@01 $Ref)) (!
  (=>
    (Set_in n@219@01 g@158@01)
    (and (= (inv@220@01 n@219@01) n@219@01) (img@221@01 n@219@01)))
  :pattern ((Set_in n@219@01 g@158@01))
  :pattern ((inv@220@01 n@219@01))
  :pattern ((img@221@01 n@219@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@221@01 r) (Set_in (inv@220@01 r) g@158@01)) (= (inv@220@01 r) r))
  :pattern ((inv@220@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@224@01  $FVF<next>)))
      (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r)))
    (=>
      (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r))
      (Set_in r ($FVF.domain_next (as sm@224@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@224@01  $FVF<next>))))
  :qid |qp.fvfDomDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@224@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@224@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef135|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@224@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef136|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@220@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) r) r))
    :pattern ((inv@220@01 r))
    :qid |quant-u-262|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@224@01  $FVF<next>)) g@158@01)))
(assert (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@224@01  $FVF<next>)) g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))
  $Snap.unit))
; [eval] unshared_graph($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 4
(declare-const n@225@01 $Ref)
(push) ; 5
; [eval] (n in refs)
(assert (Set_in n@225@01 g@158@01))
(pop) ; 5
(declare-fun inv@226@01 ($Ref) $Ref)
(declare-fun img@227@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@228@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@228@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@228@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@228@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef139|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@225@01 $Ref) (n2@225@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@225@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@228@01  $FVF<next>) n1@225@01) n1@225@01))
      (and
        (Set_in n2@225@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@228@01  $FVF<next>) n2@225@01) n2@225@01))
      (= n1@225@01 n2@225@01))
    (= n1@225@01 n2@225@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@225@01 $Ref)) (!
  (=>
    (Set_in n@225@01 g@158@01)
    (and (= (inv@226@01 n@225@01) n@225@01) (img@227@01 n@225@01)))
  :pattern ((Set_in n@225@01 g@158@01))
  :pattern ((inv@226@01 n@225@01))
  :pattern ((img@227@01 n@225@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@227@01 r) (Set_in (inv@226@01 r) g@158@01)) (= (inv@226@01 r) r))
  :pattern ((inv@226@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@226@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@228@01  $FVF<next>) r) r))
  :pattern ((inv@226@01 r))
  :qid |quant-u-268|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@229@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r) (= r (inv@226@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@229@01 r))
    $Perm.No)
  
  :qid |quant-u-270|))))
(check-sat)
; unknown
(pop) ; 5
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@229@01 r) $Perm.No)
  
  :qid |quant-u-271|))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r) (= r (inv@226@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@229@01 r)) $Perm.No))
  
  :qid |quant-u-272|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@230@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@230@01  $FVF<next>)))
      (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r)))
    (=>
      (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r))
      (Set_in r ($FVF.domain_next (as sm@230@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@230@01  $FVF<next>))))
  :qid |qp.fvfDomDef142|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@230@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@230@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef140|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@230@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef141|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@230@01  $FVF<next>)) g@158@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@228@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@228@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@228@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef139|)))
(assert (forall ((n@225@01 $Ref)) (!
  (=>
    (Set_in n@225@01 g@158@01)
    (and (= (inv@226@01 n@225@01) n@225@01) (img@227@01 n@225@01)))
  :pattern ((Set_in n@225@01 g@158@01))
  :pattern ((inv@226@01 n@225@01))
  :pattern ((img@227@01 n@225@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@227@01 r) (Set_in (inv@226@01 r) g@158@01)) (= (inv@226@01 r) r))
  :pattern ((inv@226@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@230@01  $FVF<next>)))
      (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r)))
    (=>
      (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r))
      (Set_in r ($FVF.domain_next (as sm@230@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@230@01  $FVF<next>))))
  :qid |qp.fvfDomDef142|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@230@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@230@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef140|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@230@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef141|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@226@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@228@01  $FVF<next>) r) r))
    :pattern ((inv@226@01 r))
    :qid |quant-u-268|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@230@01  $FVF<next>)) g@158@01)))
(assert (unshared_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@230@01  $FVF<next>)) g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))
  $Snap.unit))
; [eval] (forall n$4: Ref :: { exists_path($$(g), x, n$4) } (n$4 in g) ==> exists_path($$(g), x, n$4))
(declare-const n$4@231@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (n$4 in g) ==> exists_path($$(g), x, n$4)
; [eval] (n$4 in g)
(push) ; 5
; [then-branch: 39 | n$4@231@01 in g@158@01 | live]
; [else-branch: 39 | !(n$4@231@01 in g@158@01) | live]
(push) ; 6
; [then-branch: 39 | n$4@231@01 in g@158@01]
(assert (Set_in n$4@231@01 g@158@01))
; [eval] exists_path($$(g), x, n$4)
; [eval] $$(g)
(push) ; 7
(declare-const n@232@01 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@232@01 g@158@01))
(pop) ; 8
(declare-fun inv@233@01 ($Ref) $Ref)
(declare-fun img@234@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@235@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@235@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef143|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef144|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@232@01 $Ref) (n2@232@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@232@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@235@01  $FVF<next>) n1@232@01) n1@232@01))
      (and
        (Set_in n2@232@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@235@01  $FVF<next>) n2@232@01) n2@232@01))
      (= n1@232@01 n2@232@01))
    (= n1@232@01 n2@232@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@232@01 $Ref)) (!
  (=>
    (Set_in n@232@01 g@158@01)
    (and (= (inv@233@01 n@232@01) n@232@01) (img@234@01 n@232@01)))
  :pattern ((Set_in n@232@01 g@158@01))
  :pattern ((inv@233@01 n@232@01))
  :pattern ((img@234@01 n@232@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@234@01 r) (Set_in (inv@233@01 r) g@158@01)) (= (inv@233@01 r) r))
  :pattern ((inv@233@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@233@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@235@01  $FVF<next>) r) r))
  :pattern ((inv@233@01 r))
  :qid |quant-u-274|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@236@01 ((r $Ref) (n$4@231@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r) (= r (inv@233@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@236@01 r n$4@231@01))
    $Perm.No)
  
  :qid |quant-u-276|))))
(check-sat)
; unknown
(pop) ; 8
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@236@01 r n$4@231@01) $Perm.No)
  
  :qid |quant-u-277|))))
(check-sat)
; unknown
(pop) ; 8
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r) (= r (inv@233@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@236@01 r n$4@231@01)) $Perm.No))
  
  :qid |quant-u-278|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@237@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r)))
    (=>
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>))))
  :qid |qp.fvfDomDef147|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@237@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef145|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef146|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@235@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef143|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef144|)))
(assert (forall ((n@232@01 $Ref)) (!
  (=>
    (Set_in n@232@01 g@158@01)
    (and (= (inv@233@01 n@232@01) n@232@01) (img@234@01 n@232@01)))
  :pattern ((Set_in n@232@01 g@158@01))
  :pattern ((inv@233@01 n@232@01))
  :pattern ((img@234@01 n@232@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@234@01 r) (Set_in (inv@233@01 r) g@158@01)) (= (inv@233@01 r) r))
  :pattern ((inv@233@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r)))
    (=>
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>))))
  :qid |qp.fvfDomDef147|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@237@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef145|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef146|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@233@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@235@01  $FVF<next>) r) r))
    :pattern ((inv@233@01 r))
    :qid |quant-u-274|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 39 | !(n$4@231@01 in g@158@01)]
(assert (not (Set_in n$4@231@01 g@158@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@235@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef143|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef144|)))
(assert (forall ((n@232@01 $Ref)) (!
  (=>
    (Set_in n@232@01 g@158@01)
    (and (= (inv@233@01 n@232@01) n@232@01) (img@234@01 n@232@01)))
  :pattern ((Set_in n@232@01 g@158@01))
  :pattern ((inv@233@01 n@232@01))
  :pattern ((img@234@01 n@232@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@234@01 r) (Set_in (inv@233@01 r) g@158@01)) (= (inv@233@01 r) r))
  :pattern ((inv@233@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r)))
    (=>
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>))))
  :qid |qp.fvfDomDef147|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@237@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef145|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef146|)))
(assert (=>
  (Set_in n$4@231@01 g@158@01)
  (and
    (Set_in n$4@231@01 g@158@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@233@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@235@01  $FVF<next>) r) r))
      :pattern ((inv@233@01 r))
      :qid |quant-u-274|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01))))
; Joined path conditions
(assert (or (not (Set_in n$4@231@01 g@158@01)) (Set_in n$4@231@01 g@158@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@235@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef143|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef144|)))
(assert (forall ((n@232@01 $Ref)) (!
  (=>
    (Set_in n@232@01 g@158@01)
    (and (= (inv@233@01 n@232@01) n@232@01) (img@234@01 n@232@01)))
  :pattern ((Set_in n@232@01 g@158@01))
  :pattern ((inv@233@01 n@232@01))
  :pattern ((img@234@01 n@232@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@234@01 r) (Set_in (inv@233@01 r) g@158@01)) (= (inv@233@01 r) r))
  :pattern ((inv@233@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r)))
    (=>
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>))))
  :qid |qp.fvfDomDef147|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@237@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef145|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef146|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$4@231@01 $Ref)) (!
  (and
    (=>
      (Set_in n$4@231@01 g@158@01)
      (and
        (Set_in n$4@231@01 g@158@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@233@01 r) g@158@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@235@01  $FVF<next>) r) r))
          :pattern ((inv@233@01 r))
          :qid |quant-u-274|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01)))
    (or (not (Set_in n$4@231@01 g@158@01)) (Set_in n$4@231@01 g@158@01)))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01) x@159@01 n$4@231@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38-aux|)))
(assert (forall ((n$4@231@01 $Ref)) (!
  (=>
    (Set_in n$4@231@01 g@158@01)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01) x@159@01 n$4@231@01))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01) x@159@01 n$4@231@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))
  $Snap.unit))
; [eval] node_i != null ==> exists_path($$(g), prev_i, node_i)
; [eval] node_i != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= node_i@199@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,02s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= node_i@199@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; [then-branch: 40 | node_i@199@01 != Null | live]
; [else-branch: 40 | node_i@199@01 == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 40 | node_i@199@01 != Null]
(assert (not (= node_i@199@01 $Ref.null)))
; [eval] exists_path($$(g), prev_i, node_i)
; [eval] $$(g)
(push) ; 6
(declare-const n@238@01 $Ref)
(push) ; 7
; [eval] (n in refs)
(assert (Set_in n@238@01 g@158@01))
(pop) ; 7
(declare-fun inv@239@01 ($Ref) $Ref)
(declare-fun img@240@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@241@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@241@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef148|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef149|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@238@01 $Ref) (n2@238@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@238@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@241@01  $FVF<next>) n1@238@01) n1@238@01))
      (and
        (Set_in n2@238@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@241@01  $FVF<next>) n2@238@01) n2@238@01))
      (= n1@238@01 n2@238@01))
    (= n1@238@01 n2@238@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@238@01 $Ref)) (!
  (=>
    (Set_in n@238@01 g@158@01)
    (and (= (inv@239@01 n@238@01) n@238@01) (img@240@01 n@238@01)))
  :pattern ((Set_in n@238@01 g@158@01))
  :pattern ((inv@239@01 n@238@01))
  :pattern ((img@240@01 n@238@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@240@01 r) (Set_in (inv@239@01 r) g@158@01)) (= (inv@239@01 r) r))
  :pattern ((inv@239@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@239@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@241@01  $FVF<next>) r) r))
  :pattern ((inv@239@01 r))
  :qid |quant-u-280|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@242@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r) (= r (inv@239@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@242@01 r))
    $Perm.No)
  
  :qid |quant-u-282|))))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@242@01 r) $Perm.No)
  
  :qid |quant-u-283|))))
(check-sat)
; unknown
(pop) ; 7
; 0,02s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r) (= r (inv@239@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@242@01 r)) $Perm.No))
  
  :qid |quant-u-284|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@243@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>)))
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r)))
    (=>
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r))
      (Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>))))
  :qid |qp.fvfDomDef152|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@243@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@243@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef150|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@243@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef151|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@243@01  $FVF<next>)) g@158@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@241@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef148|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef149|)))
(assert (forall ((n@238@01 $Ref)) (!
  (=>
    (Set_in n@238@01 g@158@01)
    (and (= (inv@239@01 n@238@01) n@238@01) (img@240@01 n@238@01)))
  :pattern ((Set_in n@238@01 g@158@01))
  :pattern ((inv@239@01 n@238@01))
  :pattern ((img@240@01 n@238@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@240@01 r) (Set_in (inv@239@01 r) g@158@01)) (= (inv@239@01 r) r))
  :pattern ((inv@239@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>)))
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r)))
    (=>
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r))
      (Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>))))
  :qid |qp.fvfDomDef152|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@243@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@243@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef150|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@243@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef151|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@239@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@241@01  $FVF<next>) r) r))
    :pattern ((inv@239@01 r))
    :qid |quant-u-280|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@243@01  $FVF<next>)) g@158@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 40 | node_i@199@01 == Null]
(assert (= node_i@199@01 $Ref.null))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@241@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef148|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef149|)))
(assert (forall ((n@238@01 $Ref)) (!
  (=>
    (Set_in n@238@01 g@158@01)
    (and (= (inv@239@01 n@238@01) n@238@01) (img@240@01 n@238@01)))
  :pattern ((Set_in n@238@01 g@158@01))
  :pattern ((inv@239@01 n@238@01))
  :pattern ((img@240@01 n@238@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@240@01 r) (Set_in (inv@239@01 r) g@158@01)) (= (inv@239@01 r) r))
  :pattern ((inv@239@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>)))
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r)))
    (=>
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r))
      (Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>))))
  :qid |qp.fvfDomDef152|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@243@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@243@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef150|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@243@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef151|)))
(assert (=>
  (not (= node_i@199@01 $Ref.null))
  (and
    (not (= node_i@199@01 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@239@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@241@01  $FVF<next>) r) r))
      :pattern ((inv@239@01 r))
      :qid |quant-u-280|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@243@01  $FVF<next>)) g@158@01))))
; Joined path conditions
(assert (or (= node_i@199@01 $Ref.null) (not (= node_i@199@01 $Ref.null))))
(assert (=>
  (not (= node_i@199@01 $Ref.null))
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@243@01  $FVF<next>)) g@158@01) prev_i@200@01 node_i@199@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))
  $Snap.unit))
; [eval] node_i != null ==> exists_path($$(g), node_i, prev_node)
; [eval] node_i != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= node_i@199@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= node_i@199@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; [then-branch: 41 | node_i@199@01 != Null | live]
; [else-branch: 41 | node_i@199@01 == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 41 | node_i@199@01 != Null]
(assert (not (= node_i@199@01 $Ref.null)))
; [eval] exists_path($$(g), node_i, prev_node)
; [eval] $$(g)
(push) ; 6
(declare-const n@244@01 $Ref)
(push) ; 7
; [eval] (n in refs)
(assert (Set_in n@244@01 g@158@01))
(pop) ; 7
(declare-fun inv@245@01 ($Ref) $Ref)
(declare-fun img@246@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@247@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@247@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@247@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef153|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@247@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef154|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@244@01 $Ref) (n2@244@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@244@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@247@01  $FVF<next>) n1@244@01) n1@244@01))
      (and
        (Set_in n2@244@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@247@01  $FVF<next>) n2@244@01) n2@244@01))
      (= n1@244@01 n2@244@01))
    (= n1@244@01 n2@244@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@244@01 $Ref)) (!
  (=>
    (Set_in n@244@01 g@158@01)
    (and (= (inv@245@01 n@244@01) n@244@01) (img@246@01 n@244@01)))
  :pattern ((Set_in n@244@01 g@158@01))
  :pattern ((inv@245@01 n@244@01))
  :pattern ((img@246@01 n@244@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@246@01 r) (Set_in (inv@245@01 r) g@158@01)) (= (inv@245@01 r) r))
  :pattern ((inv@245@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@245@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@247@01  $FVF<next>) r) r))
  :pattern ((inv@245@01 r))
  :qid |quant-u-286|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@248@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r) (= r (inv@245@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@248@01 r))
    $Perm.No)
  
  :qid |quant-u-288|))))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@248@01 r) $Perm.No)
  
  :qid |quant-u-289|))))
(check-sat)
; unknown
(pop) ; 7
; 0,02s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r) (= r (inv@245@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@248@01 r)) $Perm.No))
  
  :qid |quant-u-290|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@249@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>)))
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r)))
    (=>
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r))
      (Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>))))
  :qid |qp.fvfDomDef157|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@249@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef155|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef156|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@249@01  $FVF<next>)) g@158@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@247@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@247@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef153|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@247@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef154|)))
(assert (forall ((n@244@01 $Ref)) (!
  (=>
    (Set_in n@244@01 g@158@01)
    (and (= (inv@245@01 n@244@01) n@244@01) (img@246@01 n@244@01)))
  :pattern ((Set_in n@244@01 g@158@01))
  :pattern ((inv@245@01 n@244@01))
  :pattern ((img@246@01 n@244@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@246@01 r) (Set_in (inv@245@01 r) g@158@01)) (= (inv@245@01 r) r))
  :pattern ((inv@245@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>)))
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r)))
    (=>
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r))
      (Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>))))
  :qid |qp.fvfDomDef157|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@249@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef155|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef156|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@245@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@247@01  $FVF<next>) r) r))
    :pattern ((inv@245@01 r))
    :qid |quant-u-286|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@249@01  $FVF<next>)) g@158@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 41 | node_i@199@01 == Null]
(assert (= node_i@199@01 $Ref.null))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@247@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@247@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef153|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@247@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef154|)))
(assert (forall ((n@244@01 $Ref)) (!
  (=>
    (Set_in n@244@01 g@158@01)
    (and (= (inv@245@01 n@244@01) n@244@01) (img@246@01 n@244@01)))
  :pattern ((Set_in n@244@01 g@158@01))
  :pattern ((inv@245@01 n@244@01))
  :pattern ((img@246@01 n@244@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@246@01 r) (Set_in (inv@245@01 r) g@158@01)) (= (inv@245@01 r) r))
  :pattern ((inv@245@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>)))
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r)))
    (=>
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r))
      (Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>))))
  :qid |qp.fvfDomDef157|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@249@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef155|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef156|)))
(assert (=>
  (not (= node_i@199@01 $Ref.null))
  (and
    (not (= node_i@199@01 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@245@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@247@01  $FVF<next>) r) r))
      :pattern ((inv@245@01 r))
      :qid |quant-u-286|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@249@01  $FVF<next>)) g@158@01))))
; Joined path conditions
(assert (=>
  (not (= node_i@199@01 $Ref.null))
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@249@01  $FVF<next>)) g@158@01) node_i@199@01 prev_node@204@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))
  $Snap.unit))
; [eval] node != null ==> exists_path($$(g), prev_node, node)
; [eval] node != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= node@205@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,02s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= node@205@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; [then-branch: 42 | node@205@01 != Null | live]
; [else-branch: 42 | node@205@01 == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 42 | node@205@01 != Null]
(assert (not (= node@205@01 $Ref.null)))
; [eval] exists_path($$(g), prev_node, node)
; [eval] $$(g)
(push) ; 6
(declare-const n@250@01 $Ref)
(push) ; 7
; [eval] (n in refs)
(assert (Set_in n@250@01 g@158@01))
(pop) ; 7
(declare-fun inv@251@01 ($Ref) $Ref)
(declare-fun img@252@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@253@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@253@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@253@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef158|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@253@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef159|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@250@01 $Ref) (n2@250@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@250@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@253@01  $FVF<next>) n1@250@01) n1@250@01))
      (and
        (Set_in n2@250@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@253@01  $FVF<next>) n2@250@01) n2@250@01))
      (= n1@250@01 n2@250@01))
    (= n1@250@01 n2@250@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@250@01 $Ref)) (!
  (=>
    (Set_in n@250@01 g@158@01)
    (and (= (inv@251@01 n@250@01) n@250@01) (img@252@01 n@250@01)))
  :pattern ((Set_in n@250@01 g@158@01))
  :pattern ((inv@251@01 n@250@01))
  :pattern ((img@252@01 n@250@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@252@01 r) (Set_in (inv@251@01 r) g@158@01)) (= (inv@251@01 r) r))
  :pattern ((inv@251@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@251@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@253@01  $FVF<next>) r) r))
  :pattern ((inv@251@01 r))
  :qid |quant-u-292|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@254@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r) (= r (inv@251@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@254@01 r))
    $Perm.No)
  
  :qid |quant-u-294|))))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@254@01 r) $Perm.No)
  
  :qid |quant-u-295|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r) (= r (inv@251@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@254@01 r)) $Perm.No))
  
  :qid |quant-u-296|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@255@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>)))
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r)))
    (=>
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r))
      (Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>))))
  :qid |qp.fvfDomDef162|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@255@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@255@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef160|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@255@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef161|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@255@01  $FVF<next>)) g@158@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@253@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@253@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef158|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@253@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef159|)))
(assert (forall ((n@250@01 $Ref)) (!
  (=>
    (Set_in n@250@01 g@158@01)
    (and (= (inv@251@01 n@250@01) n@250@01) (img@252@01 n@250@01)))
  :pattern ((Set_in n@250@01 g@158@01))
  :pattern ((inv@251@01 n@250@01))
  :pattern ((img@252@01 n@250@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@252@01 r) (Set_in (inv@251@01 r) g@158@01)) (= (inv@251@01 r) r))
  :pattern ((inv@251@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>)))
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r)))
    (=>
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r))
      (Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>))))
  :qid |qp.fvfDomDef162|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@255@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@255@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef160|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@255@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef161|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@251@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@253@01  $FVF<next>) r) r))
    :pattern ((inv@251@01 r))
    :qid |quant-u-292|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@255@01  $FVF<next>)) g@158@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 42 | node@205@01 == Null]
(assert (= node@205@01 $Ref.null))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@253@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@253@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef158|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@253@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef159|)))
(assert (forall ((n@250@01 $Ref)) (!
  (=>
    (Set_in n@250@01 g@158@01)
    (and (= (inv@251@01 n@250@01) n@250@01) (img@252@01 n@250@01)))
  :pattern ((Set_in n@250@01 g@158@01))
  :pattern ((inv@251@01 n@250@01))
  :pattern ((img@252@01 n@250@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@252@01 r) (Set_in (inv@251@01 r) g@158@01)) (= (inv@251@01 r) r))
  :pattern ((inv@251@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>)))
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r)))
    (=>
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r))
      (Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>))))
  :qid |qp.fvfDomDef162|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@255@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@255@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef160|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@255@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef161|)))
(assert (=>
  (not (= node@205@01 $Ref.null))
  (and
    (not (= node@205@01 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@251@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@253@01  $FVF<next>) r) r))
      :pattern ((inv@251@01 r))
      :qid |quant-u-292|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@255@01  $FVF<next>)) g@158@01))))
; Joined path conditions
(assert (=>
  (not (= node@205@01 $Ref.null))
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@255@01  $FVF<next>)) g@158@01) prev_node@204@01 node@205@01)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] i < j
; [eval] 0 <= count
; [eval] (x in g)
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n$2@256@01 $Ref)
(push) ; 4
; [eval] (n$2 in g)
(assert (Set_in n$2@256@01 g@158@01))
(declare-const sm@257@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@257@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@257@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef163|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@257@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef164|)))
(pop) ; 4
(declare-fun inv@258@01 ($Ref) $Ref)
(declare-fun img@259@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@257@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@257@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef163|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@257@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef164|)))
; Nested auxiliary terms: non-globals
(declare-const sm@260@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@260@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef165|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef166|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n$21@256@01 $Ref) (n$22@256@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n$21@256@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$21@256@01) n$21@256@01))
      (and
        (Set_in n$22@256@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$22@256@01) n$22@256@01))
      (= n$21@256@01 n$22@256@01))
    (= n$21@256@01 n$22@256@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$2@256@01 $Ref)) (!
  (=>
    (Set_in n$2@256@01 g@158@01)
    (and (= (inv@258@01 n$2@256@01) n$2@256@01) (img@259@01 n$2@256@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@257@01  $FVF<next>) n$2@256@01) n$2@256@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@259@01 r) (Set_in (inv@258@01 r) g@158@01)) (= (inv@258@01 r) r))
  :pattern ((inv@258@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@258@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) r) r))
  :pattern ((inv@258@01 r))
  :qid |quant-u-298|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@261@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@258@01 r) g@158@01) (img@259@01 r) (= r (inv@258@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
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
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@261@01 r))
    $Perm.No)
  
  :qid |quant-u-300|))))
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
    (and (Set_in (inv@258@01 r) g@158@01) (img@259@01 r) (= r (inv@258@01 r)))
    (= (- $Perm.Write (pTaken@261@01 r)) $Perm.No))
  
  :qid |quant-u-301|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall n$3: Ref :: { (n$3.next in g) } { (n$3 in g), n$3.next } (n$3 in g) && n$3.next != null ==> (n$3.next in g))
(declare-const n$3@262@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (n$3 in g) && n$3.next != null ==> (n$3.next in g)
; [eval] (n$3 in g) && n$3.next != null
; [eval] (n$3 in g)
(push) ; 5
; [then-branch: 43 | !(n$3@262@01 in g@158@01) | live]
; [else-branch: 43 | n$3@262@01 in g@158@01 | live]
(push) ; 6
; [then-branch: 43 | !(n$3@262@01 in g@158@01)]
(assert (not (Set_in n$3@262@01 g@158@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 43 | n$3@262@01 in g@158@01]
(assert (Set_in n$3@262@01 g@158@01))
; [eval] n$3.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@260@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
    :qid |qp.fvfValDef165|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
    :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef166|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01))
(push) ; 7
(assert (not (and (img@166@01 n$3@262@01) (Set_in (inv@165@01 n$3@262@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@260@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef165|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef166|)))
(assert (=>
  (Set_in n$3@262@01 g@158@01)
  (and
    (Set_in n$3@262@01 g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01))))
(assert (or (Set_in n$3@262@01 g@158@01) (not (Set_in n$3@262@01 g@158@01))))
(push) ; 5
; [then-branch: 44 | n$3@262@01 in g@158@01 && Lookup(next, sm@260@01, n$3@262@01) != Null | live]
; [else-branch: 44 | !(n$3@262@01 in g@158@01 && Lookup(next, sm@260@01, n$3@262@01) != Null) | live]
(push) ; 6
; [then-branch: 44 | n$3@262@01 in g@158@01 && Lookup(next, sm@260@01, n$3@262@01) != Null]
(assert (and
  (Set_in n$3@262@01 g@158@01)
  (not (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null))))
; [eval] (n$3.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@260@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
    :qid |qp.fvfValDef165|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
    :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef166|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01))
(push) ; 7
(assert (not (and (img@166@01 n$3@262@01) (Set_in (inv@165@01 n$3@262@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 44 | !(n$3@262@01 in g@158@01 && Lookup(next, sm@260@01, n$3@262@01) != Null)]
(assert (not
  (and
    (Set_in n$3@262@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@260@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef165|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef166|)))
(assert (=>
  (and
    (Set_in n$3@262@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null)))
  (and
    (Set_in n$3@262@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$3@262@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null))))
  (and
    (Set_in n$3@262@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@260@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef165|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef166|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$3@262@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@262@01 g@158@01)
      (and
        (Set_in n$3@262@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01)))
    (or (Set_in n$3@262@01 g@158@01) (not (Set_in n$3@262@01 g@158@01)))
    (=>
      (and
        (Set_in n$3@262@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null)))
      (and
        (Set_in n$3@262@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01)))
    (or
      (not
        (and
          (Set_in n$3@262@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01)
              $Ref.null))))
      (and
        (Set_in n$3@262@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) g@158@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27-aux|)))
(assert (forall ((n$3@262@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@262@01 g@158@01)
      (and
        (Set_in n$3@262@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01)))
    (or (Set_in n$3@262@01 g@158@01) (not (Set_in n$3@262@01 g@158@01)))
    (=>
      (and
        (Set_in n$3@262@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null)))
      (and
        (Set_in n$3@262@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01)))
    (or
      (not
        (and
          (Set_in n$3@262@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01)
              $Ref.null))))
      (and
        (Set_in n$3@262@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null)))))
  :pattern ((Set_in n$3@262@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27-aux|)))
(push) ; 4
(assert (not (forall ((n$3@262@01 $Ref)) (!
  (=>
    (and
      (Set_in n$3@262@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) g@158@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) g@158@01))
  :pattern ((Set_in n$3@262@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$3@262@01 $Ref)) (!
  (=>
    (and
      (Set_in n$3@262@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) g@158@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) g@158@01))
  :pattern ((Set_in n$3@262@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n$3@262@01) n$3@262@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27|)))
; [eval] node != null ==> (node in g)
; [eval] node != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= node@198@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= node@198@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | node@198@01 != Null | live]
; [else-branch: 45 | node@198@01 == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 45 | node@198@01 != Null]
(assert (not (= node@198@01 $Ref.null)))
; [eval] (node in g)
(pop) ; 5
(push) ; 5
; [else-branch: 45 | node@198@01 == Null]
(assert (= node@198@01 $Ref.null))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= node@198@01 $Ref.null) (not (= node@198@01 $Ref.null))))
(push) ; 4
(assert (not (=> (not (= node@198@01 $Ref.null)) (Set_in node@198@01 g@158@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (not (= node@198@01 $Ref.null)) (Set_in node@198@01 g@158@01)))
; [eval] count <= j ==> (prev_node in g)
; [eval] count <= j
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= 0 j@161@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= 0 j@161@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | 0 <= j@161@01 | live]
; [else-branch: 46 | !(0 <= j@161@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 46 | 0 <= j@161@01]
(assert (<= 0 j@161@01))
; [eval] (prev_node in g)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (<= 0 j@161@01))
(push) ; 4
(assert (not (=> (<= 0 j@161@01) (Set_in x@159@01 g@158@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (<= 0 j@161@01) (Set_in x@159@01 g@158@01)))
; [eval] i < count ==> (node_i in g) && (prev_i in g)
; [eval] i < count
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@160@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | i@160@01 < 0 | dead]
; [else-branch: 47 | !(i@160@01 < 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 47 | !(i@160@01 < 0)]
(assert (not (< i@160@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (< i@160@01 0)))
; [eval] count <= j ==> prev_node.next == node
; [eval] count <= j
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= 0 j@161@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | 0 <= j@161@01 | live]
; [else-branch: 48 | !(0 <= j@161@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 48 | 0 <= j@161@01]
; [eval] prev_node.next == node
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@260@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
    :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
    :qid |qp.fvfValDef165|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
    :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef166|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) x@159@01) x@159@01))
(push) ; 6
(assert (not (and (img@166@01 x@159@01) (Set_in (inv@165@01 x@159@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@260@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef165|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@260@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef166|)))
(assert (=>
  (<= 0 j@161@01)
  ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) x@159@01) x@159@01)))
(push) ; 4
(assert (not (=>
  (<= 0 j@161@01)
  (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) x@159@01) node@198@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= 0 j@161@01)
  (= ($FVF.lookup_next (as sm@260@01  $FVF<next>) x@159@01) node@198@01)))
; [eval] acyclic_graph($$(g))
; [eval] $$(g)
(push) ; 4
(declare-const n@263@01 $Ref)
(push) ; 5
; [eval] (n in refs)
(assert (Set_in n@263@01 g@158@01))
(pop) ; 5
(declare-fun inv@264@01 ($Ref) $Ref)
(declare-fun img@265@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@263@01 $Ref) (n2@263@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@263@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n1@263@01) n1@263@01))
      (and
        (Set_in n2@263@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) n2@263@01) n2@263@01))
      (= n1@263@01 n2@263@01))
    (= n1@263@01 n2@263@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@263@01 $Ref)) (!
  (=>
    (Set_in n@263@01 g@158@01)
    (and (= (inv@264@01 n@263@01) n@263@01) (img@265@01 n@263@01)))
  :pattern ((Set_in n@263@01 g@158@01))
  :pattern ((inv@264@01 n@263@01))
  :pattern ((img@265@01 n@263@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@265@01 r) (Set_in (inv@264@01 r) g@158@01)) (= (inv@264@01 r) r))
  :pattern ((inv@264@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@264@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) r) r))
  :pattern ((inv@264@01 r))
  :qid |quant-u-303|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@266@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@264@01 r) g@158@01) (img@265@01 r) (= r (inv@264@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@266@01 r))
    $Perm.No)
  
  :qid |quant-u-305|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@266@01 r) $Perm.No)
  
  :qid |quant-u-306|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@264@01 r) g@158@01) (img@265@01 r) (= r (inv@264@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@266@01 r)) $Perm.No))
  
  :qid |quant-u-307|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@267@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@267@01  $FVF<next>)))
      (and (Set_in (inv@264@01 r) g@158@01) (img@265@01 r)))
    (=>
      (and (Set_in (inv@264@01 r) g@158@01) (img@265@01 r))
      (Set_in r ($FVF.domain_next (as sm@267@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@267@01  $FVF<next>))))
  :qid |qp.fvfDomDef169|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@264@01 r) g@158@01) (img@265@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@267@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@267@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef167|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@267@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef168|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@267@01  $FVF<next>)) g@158@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((n@263@01 $Ref)) (!
  (=>
    (Set_in n@263@01 g@158@01)
    (and (= (inv@264@01 n@263@01) n@263@01) (img@265@01 n@263@01)))
  :pattern ((Set_in n@263@01 g@158@01))
  :pattern ((inv@264@01 n@263@01))
  :pattern ((img@265@01 n@263@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@265@01 r) (Set_in (inv@264@01 r) g@158@01)) (= (inv@264@01 r) r))
  :pattern ((inv@264@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@267@01  $FVF<next>)))
      (and (Set_in (inv@264@01 r) g@158@01) (img@265@01 r)))
    (=>
      (and (Set_in (inv@264@01 r) g@158@01) (img@265@01 r))
      (Set_in r ($FVF.domain_next (as sm@267@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@267@01  $FVF<next>))))
  :qid |qp.fvfDomDef169|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@264@01 r) g@158@01) (img@265@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@267@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@267@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef167|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@267@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef168|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@264@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@260@01  $FVF<next>) r) r))
    :pattern ((inv@264@01 r))
    :qid |quant-u-303|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@267@01  $FVF<next>)) g@158@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@267@01  $FVF<next>)) g@158@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@267@01  $FVF<next>)) g@158@01)))
; [eval] func_graph($$(g))
; [eval] $$(g)
(push) ; 4
(declare-const n@268@01 $Ref)
(push) ; 5
; [eval] (n in refs)
(assert (Set_in n@268@01 g@158@01))
(pop) ; 5
(declare-fun inv@269@01 ($Ref) $Ref)
(declare-fun img@270@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@271@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@271@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@271@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef170|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@271@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef171|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@268@01 $Ref) (n2@268@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@268@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@271@01  $FVF<next>) n1@268@01) n1@268@01))
      (and
        (Set_in n2@268@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@271@01  $FVF<next>) n2@268@01) n2@268@01))
      (= n1@268@01 n2@268@01))
    (= n1@268@01 n2@268@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@268@01 $Ref)) (!
  (=>
    (Set_in n@268@01 g@158@01)
    (and (= (inv@269@01 n@268@01) n@268@01) (img@270@01 n@268@01)))
  :pattern ((Set_in n@268@01 g@158@01))
  :pattern ((inv@269@01 n@268@01))
  :pattern ((img@270@01 n@268@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@270@01 r) (Set_in (inv@269@01 r) g@158@01)) (= (inv@269@01 r) r))
  :pattern ((inv@269@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@269@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@271@01  $FVF<next>) r) r))
  :pattern ((inv@269@01 r))
  :qid |quant-u-309|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@272@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@269@01 r) g@158@01) (img@270@01 r) (= r (inv@269@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@272@01 r))
    $Perm.No)
  
  :qid |quant-u-311|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@272@01 r) $Perm.No)
  
  :qid |quant-u-312|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@269@01 r) g@158@01) (img@270@01 r) (= r (inv@269@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@272@01 r)) $Perm.No))
  
  :qid |quant-u-313|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@273@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@273@01  $FVF<next>)))
      (and (Set_in (inv@269@01 r) g@158@01) (img@270@01 r)))
    (=>
      (and (Set_in (inv@269@01 r) g@158@01) (img@270@01 r))
      (Set_in r ($FVF.domain_next (as sm@273@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@273@01  $FVF<next>))))
  :qid |qp.fvfDomDef174|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@269@01 r) g@158@01) (img@270@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@273@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@273@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef172|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@273@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef173|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@273@01  $FVF<next>)) g@158@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@271@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@271@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef170|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@271@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef171|)))
(assert (forall ((n@268@01 $Ref)) (!
  (=>
    (Set_in n@268@01 g@158@01)
    (and (= (inv@269@01 n@268@01) n@268@01) (img@270@01 n@268@01)))
  :pattern ((Set_in n@268@01 g@158@01))
  :pattern ((inv@269@01 n@268@01))
  :pattern ((img@270@01 n@268@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@270@01 r) (Set_in (inv@269@01 r) g@158@01)) (= (inv@269@01 r) r))
  :pattern ((inv@269@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@273@01  $FVF<next>)))
      (and (Set_in (inv@269@01 r) g@158@01) (img@270@01 r)))
    (=>
      (and (Set_in (inv@269@01 r) g@158@01) (img@270@01 r))
      (Set_in r ($FVF.domain_next (as sm@273@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@273@01  $FVF<next>))))
  :qid |qp.fvfDomDef174|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@269@01 r) g@158@01) (img@270@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@273@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@273@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef172|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@273@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef173|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@269@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@271@01  $FVF<next>) r) r))
    :pattern ((inv@269@01 r))
    :qid |quant-u-309|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@273@01  $FVF<next>)) g@158@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@273@01  $FVF<next>)) g@158@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@273@01  $FVF<next>)) g@158@01)))
; [eval] unshared_graph($$(g))
; [eval] $$(g)
(push) ; 4
(declare-const n@274@01 $Ref)
(push) ; 5
; [eval] (n in refs)
(assert (Set_in n@274@01 g@158@01))
(pop) ; 5
(declare-fun inv@275@01 ($Ref) $Ref)
(declare-fun img@276@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@277@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@277@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@277@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef175|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@277@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef176|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@274@01 $Ref) (n2@274@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@274@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@277@01  $FVF<next>) n1@274@01) n1@274@01))
      (and
        (Set_in n2@274@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@277@01  $FVF<next>) n2@274@01) n2@274@01))
      (= n1@274@01 n2@274@01))
    (= n1@274@01 n2@274@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@274@01 $Ref)) (!
  (=>
    (Set_in n@274@01 g@158@01)
    (and (= (inv@275@01 n@274@01) n@274@01) (img@276@01 n@274@01)))
  :pattern ((Set_in n@274@01 g@158@01))
  :pattern ((inv@275@01 n@274@01))
  :pattern ((img@276@01 n@274@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@276@01 r) (Set_in (inv@275@01 r) g@158@01)) (= (inv@275@01 r) r))
  :pattern ((inv@275@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@275@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@277@01  $FVF<next>) r) r))
  :pattern ((inv@275@01 r))
  :qid |quant-u-315|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@278@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@275@01 r) g@158@01) (img@276@01 r) (= r (inv@275@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@278@01 r))
    $Perm.No)
  
  :qid |quant-u-317|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@278@01 r) $Perm.No)
  
  :qid |quant-u-318|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@275@01 r) g@158@01) (img@276@01 r) (= r (inv@275@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@278@01 r)) $Perm.No))
  
  :qid |quant-u-319|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@279@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@279@01  $FVF<next>)))
      (and (Set_in (inv@275@01 r) g@158@01) (img@276@01 r)))
    (=>
      (and (Set_in (inv@275@01 r) g@158@01) (img@276@01 r))
      (Set_in r ($FVF.domain_next (as sm@279@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@279@01  $FVF<next>))))
  :qid |qp.fvfDomDef179|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@275@01 r) g@158@01) (img@276@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@279@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@279@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef177|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@279@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef178|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@279@01  $FVF<next>)) g@158@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@277@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@277@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef175|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@277@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef176|)))
(assert (forall ((n@274@01 $Ref)) (!
  (=>
    (Set_in n@274@01 g@158@01)
    (and (= (inv@275@01 n@274@01) n@274@01) (img@276@01 n@274@01)))
  :pattern ((Set_in n@274@01 g@158@01))
  :pattern ((inv@275@01 n@274@01))
  :pattern ((img@276@01 n@274@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@276@01 r) (Set_in (inv@275@01 r) g@158@01)) (= (inv@275@01 r) r))
  :pattern ((inv@275@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@279@01  $FVF<next>)))
      (and (Set_in (inv@275@01 r) g@158@01) (img@276@01 r)))
    (=>
      (and (Set_in (inv@275@01 r) g@158@01) (img@276@01 r))
      (Set_in r ($FVF.domain_next (as sm@279@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@279@01  $FVF<next>))))
  :qid |qp.fvfDomDef179|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@275@01 r) g@158@01) (img@276@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@279@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@279@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef177|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@279@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef178|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@275@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@277@01  $FVF<next>) r) r))
    :pattern ((inv@275@01 r))
    :qid |quant-u-315|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@279@01  $FVF<next>)) g@158@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (unshared_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@279@01  $FVF<next>)) g@158@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(assert (unshared_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@279@01  $FVF<next>)) g@158@01)))
; [eval] (forall n$4: Ref :: { exists_path($$(g), x, n$4) } (n$4 in g) ==> exists_path($$(g), x, n$4))
(declare-const n$4@280@01 $Ref)
(push) ; 4
; [eval] (n$4 in g) ==> exists_path($$(g), x, n$4)
; [eval] (n$4 in g)
(push) ; 5
; [then-branch: 49 | n$4@280@01 in g@158@01 | live]
; [else-branch: 49 | !(n$4@280@01 in g@158@01) | live]
(push) ; 6
; [then-branch: 49 | n$4@280@01 in g@158@01]
(assert (Set_in n$4@280@01 g@158@01))
; [eval] exists_path($$(g), x, n$4)
; [eval] $$(g)
(push) ; 7
(declare-const n@281@01 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@281@01 g@158@01))
(pop) ; 8
(declare-fun inv@282@01 ($Ref) $Ref)
(declare-fun img@283@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@284@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@284@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@284@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef180|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@284@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef181|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@281@01 $Ref) (n2@281@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@281@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@284@01  $FVF<next>) n1@281@01) n1@281@01))
      (and
        (Set_in n2@281@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@284@01  $FVF<next>) n2@281@01) n2@281@01))
      (= n1@281@01 n2@281@01))
    (= n1@281@01 n2@281@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@281@01 $Ref)) (!
  (=>
    (Set_in n@281@01 g@158@01)
    (and (= (inv@282@01 n@281@01) n@281@01) (img@283@01 n@281@01)))
  :pattern ((Set_in n@281@01 g@158@01))
  :pattern ((inv@282@01 n@281@01))
  :pattern ((img@283@01 n@281@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@283@01 r) (Set_in (inv@282@01 r) g@158@01)) (= (inv@282@01 r) r))
  :pattern ((inv@282@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@282@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@284@01  $FVF<next>) r) r))
  :pattern ((inv@282@01 r))
  :qid |quant-u-321|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@285@01 ((r $Ref) (n$4@280@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r) (= r (inv@282@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@285@01 r n$4@280@01))
    $Perm.No)
  
  :qid |quant-u-323|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@285@01 r n$4@280@01) $Perm.No)
  
  :qid |quant-u-324|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r) (= r (inv@282@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@285@01 r n$4@280@01)) $Perm.No))
  
  :qid |quant-u-325|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@286@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>)))
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r)))
    (=>
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r))
      (Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>))))
  :qid |qp.fvfDomDef184|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@286@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef182|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef183|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@284@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@284@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef180|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@284@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef181|)))
(assert (forall ((n@281@01 $Ref)) (!
  (=>
    (Set_in n@281@01 g@158@01)
    (and (= (inv@282@01 n@281@01) n@281@01) (img@283@01 n@281@01)))
  :pattern ((Set_in n@281@01 g@158@01))
  :pattern ((inv@282@01 n@281@01))
  :pattern ((img@283@01 n@281@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@283@01 r) (Set_in (inv@282@01 r) g@158@01)) (= (inv@282@01 r) r))
  :pattern ((inv@282@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>)))
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r)))
    (=>
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r))
      (Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>))))
  :qid |qp.fvfDomDef184|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@286@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef182|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef183|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@282@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@284@01  $FVF<next>) r) r))
    :pattern ((inv@282@01 r))
    :qid |quant-u-321|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 49 | !(n$4@280@01 in g@158@01)]
(assert (not (Set_in n$4@280@01 g@158@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@284@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@284@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef180|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@284@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef181|)))
(assert (forall ((n@281@01 $Ref)) (!
  (=>
    (Set_in n@281@01 g@158@01)
    (and (= (inv@282@01 n@281@01) n@281@01) (img@283@01 n@281@01)))
  :pattern ((Set_in n@281@01 g@158@01))
  :pattern ((inv@282@01 n@281@01))
  :pattern ((img@283@01 n@281@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@283@01 r) (Set_in (inv@282@01 r) g@158@01)) (= (inv@282@01 r) r))
  :pattern ((inv@282@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>)))
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r)))
    (=>
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r))
      (Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>))))
  :qid |qp.fvfDomDef184|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@286@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef182|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef183|)))
(assert (=>
  (Set_in n$4@280@01 g@158@01)
  (and
    (Set_in n$4@280@01 g@158@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@282@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@284@01  $FVF<next>) r) r))
      :pattern ((inv@282@01 r))
      :qid |quant-u-321|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01))))
; Joined path conditions
(assert (or (not (Set_in n$4@280@01 g@158@01)) (Set_in n$4@280@01 g@158@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@284@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@284@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef180|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@284@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef181|)))
(assert (forall ((n@281@01 $Ref)) (!
  (=>
    (Set_in n@281@01 g@158@01)
    (and (= (inv@282@01 n@281@01) n@281@01) (img@283@01 n@281@01)))
  :pattern ((Set_in n@281@01 g@158@01))
  :pattern ((inv@282@01 n@281@01))
  :pattern ((img@283@01 n@281@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@283@01 r) (Set_in (inv@282@01 r) g@158@01)) (= (inv@282@01 r) r))
  :pattern ((inv@282@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>)))
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r)))
    (=>
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r))
      (Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@286@01  $FVF<next>))))
  :qid |qp.fvfDomDef184|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@282@01 r) g@158@01) (img@283@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@286@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef182|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef183|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$4@280@01 $Ref)) (!
  (and
    (=>
      (Set_in n$4@280@01 g@158@01)
      (and
        (Set_in n$4@280@01 g@158@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@282@01 r) g@158@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@284@01  $FVF<next>) r) r))
          :pattern ((inv@282@01 r))
          :qid |quant-u-321|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01)))
    (or (not (Set_in n$4@280@01 g@158@01)) (Set_in n$4@280@01 g@158@01)))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01) x@159@01 n$4@280@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38-aux|)))
(assert (forall ((n$4@280@01 $Ref)) (!
  (=>
    (Set_in n$4@280@01 g@158@01)
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01) x@159@01 n$4@280@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38_precondition|)))
(push) ; 4
(assert (not (forall ((n$4@280@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in n$4@280@01 g@158@01)
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01))
      (Set_in n$4@280@01 g@158@01))
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01) x@159@01 n$4@280@01))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01) x@159@01 n$4@280@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38|))))
(check-sat)
; unsat
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(assert (forall ((n$4@280@01 $Ref)) (!
  (=>
    (Set_in n$4@280@01 g@158@01)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01) x@159@01 n$4@280@01))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@286@01  $FVF<next>)) g@158@01) x@159@01 n$4@280@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38|)))
; [eval] node_i != null ==> exists_path($$(g), prev_i, node_i)
; [eval] node_i != null
(push) ; 4
; [then-branch: 50 | False | dead]
; [else-branch: 50 | True | live]
(push) ; 5
; [else-branch: 50 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] node_i != null ==> exists_path($$(g), node_i, prev_node)
; [eval] node_i != null
(push) ; 4
; [then-branch: 51 | False | dead]
; [else-branch: 51 | True | live]
(push) ; 5
; [else-branch: 51 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] node != null ==> exists_path($$(g), prev_node, node)
; [eval] node != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= node@198@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= node@198@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; [then-branch: 52 | node@198@01 != Null | live]
; [else-branch: 52 | node@198@01 == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 52 | node@198@01 != Null]
(assert (not (= node@198@01 $Ref.null)))
; [eval] exists_path($$(g), prev_node, node)
; [eval] $$(g)
(push) ; 6
(declare-const n@287@01 $Ref)
(push) ; 7
; [eval] (n in refs)
(assert (Set_in n@287@01 g@158@01))
(pop) ; 7
(declare-fun inv@288@01 ($Ref) $Ref)
(declare-fun img@289@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@290@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@290@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@290@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef185|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@290@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef186|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@287@01 $Ref) (n2@287@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@287@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@290@01  $FVF<next>) n1@287@01) n1@287@01))
      (and
        (Set_in n2@287@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@290@01  $FVF<next>) n2@287@01) n2@287@01))
      (= n1@287@01 n2@287@01))
    (= n1@287@01 n2@287@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@287@01 $Ref)) (!
  (=>
    (Set_in n@287@01 g@158@01)
    (and (= (inv@288@01 n@287@01) n@287@01) (img@289@01 n@287@01)))
  :pattern ((Set_in n@287@01 g@158@01))
  :pattern ((inv@288@01 n@287@01))
  :pattern ((img@289@01 n@287@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@289@01 r) (Set_in (inv@288@01 r) g@158@01)) (= (inv@288@01 r) r))
  :pattern ((inv@288@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@288@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@290@01  $FVF<next>) r) r))
  :pattern ((inv@288@01 r))
  :qid |quant-u-327|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@291@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r) (= r (inv@288@01 r)))
    ($Perm.min
      (ite
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
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
        (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@291@01 r))
    $Perm.No)
  
  :qid |quant-u-329|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@291@01 r) $Perm.No)
  
  :qid |quant-u-330|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r) (= r (inv@288@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@291@01 r)) $Perm.No))
  
  :qid |quant-u-331|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@292@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@292@01  $FVF<next>)))
      (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r)))
    (=>
      (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r))
      (Set_in r ($FVF.domain_next (as sm@292@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@292@01  $FVF<next>))))
  :qid |qp.fvfDomDef189|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@292@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@292@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef187|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@292@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef188|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@292@01  $FVF<next>)) g@158@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@290@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@290@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef185|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@290@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef186|)))
(assert (forall ((n@287@01 $Ref)) (!
  (=>
    (Set_in n@287@01 g@158@01)
    (and (= (inv@288@01 n@287@01) n@287@01) (img@289@01 n@287@01)))
  :pattern ((Set_in n@287@01 g@158@01))
  :pattern ((inv@288@01 n@287@01))
  :pattern ((img@289@01 n@287@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@289@01 r) (Set_in (inv@288@01 r) g@158@01)) (= (inv@288@01 r) r))
  :pattern ((inv@288@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@292@01  $FVF<next>)))
      (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r)))
    (=>
      (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r))
      (Set_in r ($FVF.domain_next (as sm@292@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@292@01  $FVF<next>))))
  :qid |qp.fvfDomDef189|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@292@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@292@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef187|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@292@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef188|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@288@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@290@01  $FVF<next>) r) r))
    :pattern ((inv@288@01 r))
    :qid |quant-u-327|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@292@01  $FVF<next>)) g@158@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 52 | node@198@01 == Null]
(assert (= node@198@01 $Ref.null))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@290@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@290@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef185|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@290@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef186|)))
(assert (forall ((n@287@01 $Ref)) (!
  (=>
    (Set_in n@287@01 g@158@01)
    (and (= (inv@288@01 n@287@01) n@287@01) (img@289@01 n@287@01)))
  :pattern ((Set_in n@287@01 g@158@01))
  :pattern ((inv@288@01 n@287@01))
  :pattern ((img@289@01 n@287@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@289@01 r) (Set_in (inv@288@01 r) g@158@01)) (= (inv@288@01 r) r))
  :pattern ((inv@288@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@292@01  $FVF<next>)))
      (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r)))
    (=>
      (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r))
      (Set_in r ($FVF.domain_next (as sm@292@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@292@01  $FVF<next>))))
  :qid |qp.fvfDomDef189|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@288@01 r) g@158@01) (img@289@01 r))
      (and (img@166@01 r) (Set_in (inv@165@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@292@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@292@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r))
  :qid |qp.fvfValDef187|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@162@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@292@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef188|)))
(assert (=>
  (not (= node@198@01 $Ref.null))
  (and
    (not (= node@198@01 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@288@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@290@01  $FVF<next>) r) r))
      :pattern ((inv@288@01 r))
      :qid |quant-u-327|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@292@01  $FVF<next>)) g@158@01))))
; Joined path conditions
(push) ; 4
(assert (not (=>
  (not (= node@198@01 $Ref.null))
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@292@01  $FVF<next>)) g@158@01) x@159@01 node@198@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(assert (=>
  (not (= node@198@01 $Ref.null))
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@292@01  $FVF<next>)) g@158@01) x@159@01 node@198@01)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=> (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)) (= (inv@210@01 r) r))
  :pattern ((inv@210@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (forall ((n@214@01 $Ref)) (!
  (=>
    (Set_in n@214@01 g@158@01)
    (and (= (inv@215@01 n@214@01) n@214@01) (img@216@01 n@214@01)))
  :pattern ((Set_in n@214@01 g@158@01))
  :pattern ((inv@215@01 n@214@01))
  :pattern ((img@216@01 n@214@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@216@01 r) (Set_in (inv@215@01 r) g@158@01)) (= (inv@215@01 r) r))
  :pattern ((inv@215@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@218@01  $FVF<next>)))
      (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r)))
    (=>
      (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r))
      (Set_in r ($FVF.domain_next (as sm@218@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@218@01  $FVF<next>))))
  :qid |qp.fvfDomDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@215@01 r) g@158@01) (img@216@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@218@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@218@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@218@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef131|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
(assert (forall ((n@219@01 $Ref)) (!
  (=>
    (Set_in n@219@01 g@158@01)
    (and (= (inv@220@01 n@219@01) n@219@01) (img@221@01 n@219@01)))
  :pattern ((Set_in n@219@01 g@158@01))
  :pattern ((inv@220@01 n@219@01))
  :pattern ((img@221@01 n@219@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@221@01 r) (Set_in (inv@220@01 r) g@158@01)) (= (inv@220@01 r) r))
  :pattern ((inv@220@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@224@01  $FVF<next>)))
      (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r)))
    (=>
      (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r))
      (Set_in r ($FVF.domain_next (as sm@224@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@224@01  $FVF<next>))))
  :qid |qp.fvfDomDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@220@01 r) g@158@01) (img@221@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@224@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@224@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef135|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@224@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef136|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@228@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@228@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@228@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef139|)))
(assert (forall ((n@225@01 $Ref)) (!
  (=>
    (Set_in n@225@01 g@158@01)
    (and (= (inv@226@01 n@225@01) n@225@01) (img@227@01 n@225@01)))
  :pattern ((Set_in n@225@01 g@158@01))
  :pattern ((inv@226@01 n@225@01))
  :pattern ((img@227@01 n@225@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@227@01 r) (Set_in (inv@226@01 r) g@158@01)) (= (inv@226@01 r) r))
  :pattern ((inv@226@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@230@01  $FVF<next>)))
      (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r)))
    (=>
      (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r))
      (Set_in r ($FVF.domain_next (as sm@230@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@230@01  $FVF<next>))))
  :qid |qp.fvfDomDef142|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@226@01 r) g@158@01) (img@227@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@230@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@230@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef140|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@230@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef141|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@235@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef143|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@235@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef144|)))
(assert (forall ((n@232@01 $Ref)) (!
  (=>
    (Set_in n@232@01 g@158@01)
    (and (= (inv@233@01 n@232@01) n@232@01) (img@234@01 n@232@01)))
  :pattern ((Set_in n@232@01 g@158@01))
  :pattern ((inv@233@01 n@232@01))
  :pattern ((img@234@01 n@232@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@234@01 r) (Set_in (inv@233@01 r) g@158@01)) (= (inv@233@01 r) r))
  :pattern ((inv@233@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r)))
    (=>
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@237@01  $FVF<next>))))
  :qid |qp.fvfDomDef147|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@233@01 r) g@158@01) (img@234@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@237@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef145|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@237@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef146|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@241@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef148|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef149|)))
(assert (forall ((n@238@01 $Ref)) (!
  (=>
    (Set_in n@238@01 g@158@01)
    (and (= (inv@239@01 n@238@01) n@238@01) (img@240@01 n@238@01)))
  :pattern ((Set_in n@238@01 g@158@01))
  :pattern ((inv@239@01 n@238@01))
  :pattern ((img@240@01 n@238@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@240@01 r) (Set_in (inv@239@01 r) g@158@01)) (= (inv@239@01 r) r))
  :pattern ((inv@239@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>)))
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r)))
    (=>
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r))
      (Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@243@01  $FVF<next>))))
  :qid |qp.fvfDomDef152|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@239@01 r) g@158@01) (img@240@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@243@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@243@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef150|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@243@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef151|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@247@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@247@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef153|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@247@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef154|)))
(assert (forall ((n@244@01 $Ref)) (!
  (=>
    (Set_in n@244@01 g@158@01)
    (and (= (inv@245@01 n@244@01) n@244@01) (img@246@01 n@244@01)))
  :pattern ((Set_in n@244@01 g@158@01))
  :pattern ((inv@245@01 n@244@01))
  :pattern ((img@246@01 n@244@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@246@01 r) (Set_in (inv@245@01 r) g@158@01)) (= (inv@245@01 r) r))
  :pattern ((inv@245@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>)))
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r)))
    (=>
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r))
      (Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@249@01  $FVF<next>))))
  :qid |qp.fvfDomDef157|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@245@01 r) g@158@01) (img@246@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@249@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef155|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef156|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@253@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@253@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef158|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@253@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef159|)))
(assert (forall ((n@250@01 $Ref)) (!
  (=>
    (Set_in n@250@01 g@158@01)
    (and (= (inv@251@01 n@250@01) n@250@01) (img@252@01 n@250@01)))
  :pattern ((Set_in n@250@01 g@158@01))
  :pattern ((inv@251@01 n@250@01))
  :pattern ((img@252@01 n@250@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@252@01 r) (Set_in (inv@251@01 r) g@158@01)) (= (inv@251@01 r) r))
  :pattern ((inv@251@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>)))
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r)))
    (=>
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r))
      (Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@255@01  $FVF<next>))))
  :qid |qp.fvfDomDef162|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@251@01 r) g@158@01) (img@252@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@255@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@255@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef160|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@255@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef161|)))
(assert (forall ((n$2@208@01 $Ref)) (!
  (=>
    (Set_in n$2@208@01 g@158@01)
    (and (= (inv@210@01 n$2@208@01) n$2@208@01) (img@211@01 n$2@208@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) n$2@208@01) n$2@208@01))
  :qid |quant-u-253|)))
(assert (forall ((n$2@208@01 $Ref)) (!
  (=> (Set_in n$2@208@01 g@158@01) (not (= n$2@208@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) n$2@208@01) n$2@208@01))
  :qid |next-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@210@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
  :pattern ((inv@210@01 r))
  :qid |quant-u-254|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))
  $Snap.unit))
(assert (forall ((n$3@213@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@213@01 g@158@01)
      (and
        (Set_in n$3@213@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01)))
    (or (Set_in n$3@213@01 g@158@01) (not (Set_in n$3@213@01 g@158@01)))
    (=>
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01)))
    (or
      (not
        (and
          (Set_in n$3@213@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01)
              $Ref.null))))
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) g@158@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27-aux|)))
(assert (forall ((n$3@213@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@213@01 g@158@01)
      (and
        (Set_in n$3@213@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01)))
    (or (Set_in n$3@213@01 g@158@01) (not (Set_in n$3@213@01 g@158@01)))
    (=>
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01)))
    (or
      (not
        (and
          (Set_in n$3@213@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01)
              $Ref.null))))
      (and
        (Set_in n$3@213@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))))
  :pattern ((Set_in n$3@213@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27-aux|)))
(assert (forall ((n$3@213@01 $Ref)) (!
  (=>
    (and
      (Set_in n$3@213@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) g@158@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) g@158@01))
  :pattern ((Set_in n$3@213@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$3@213@01) n$3@213@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))
  $Snap.unit))
(assert (or (= node@205@01 $Ref.null) (not (= node@205@01 $Ref.null))))
(assert (=> (not (= node@205@01 $Ref.null)) (Set_in node@205@01 g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))
  $Snap.unit))
(assert (or (not (<= count@206@01 j@161@01)) (<= count@206@01 j@161@01)))
(assert (=> (<= count@206@01 j@161@01) (Set_in prev_node@204@01 g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))
  $Snap.unit))
(assert (=>
  (< i@160@01 count@206@01)
  (and
    (< i@160@01 count@206@01)
    (or (Set_in node_i@199@01 g@158@01) (not (Set_in node_i@199@01 g@158@01))))))
(assert (or (not (< i@160@01 count@206@01)) (< i@160@01 count@206@01)))
(assert (=>
  (< i@160@01 count@206@01)
  (and (Set_in node_i@199@01 g@158@01) (Set_in prev_i@200@01 g@158@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))
  $Snap.unit))
(assert (=>
  (<= count@206@01 j@161@01)
  (and
    (<= count@206@01 j@161@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) prev_node@204@01) prev_node@204@01))))
(assert (=>
  (<= count@206@01 j@161@01)
  (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) prev_node@204@01) node@205@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))
  $Snap.unit))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@215@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
  :pattern ((inv@215@01 r))
  :qid |quant-u-256|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@218@01  $FVF<next>)) g@158@01))
(assert (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@218@01  $FVF<next>)) g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))
  $Snap.unit))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@220@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) r) r))
  :pattern ((inv@220@01 r))
  :qid |quant-u-262|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@224@01  $FVF<next>)) g@158@01))
(assert (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@224@01  $FVF<next>)) g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))
  $Snap.unit))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@226@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@228@01  $FVF<next>) r) r))
  :pattern ((inv@226@01 r))
  :qid |quant-u-268|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@230@01  $FVF<next>)) g@158@01))
(assert (unshared_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@230@01  $FVF<next>)) g@158@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))
  $Snap.unit))
(assert (forall ((n$4@231@01 $Ref)) (!
  (and
    (=>
      (Set_in n$4@231@01 g@158@01)
      (and
        (Set_in n$4@231@01 g@158@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@233@01 r) g@158@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@235@01  $FVF<next>) r) r))
          :pattern ((inv@233@01 r))
          :qid |quant-u-274|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01)))
    (or (not (Set_in n$4@231@01 g@158@01)) (Set_in n$4@231@01 g@158@01)))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01) x@159@01 n$4@231@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38-aux|)))
(assert (forall ((n$4@231@01 $Ref)) (!
  (=>
    (Set_in n$4@231@01 g@158@01)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01) x@159@01 n$4@231@01))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@237@01  $FVF<next>)) g@158@01) x@159@01 n$4@231@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))
  $Snap.unit))
(assert (=>
  (not (= node_i@199@01 $Ref.null))
  (and
    (not (= node_i@199@01 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@239@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@241@01  $FVF<next>) r) r))
      :pattern ((inv@239@01 r))
      :qid |quant-u-280|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@243@01  $FVF<next>)) g@158@01))))
(assert (or (= node_i@199@01 $Ref.null) (not (= node_i@199@01 $Ref.null))))
(assert (=>
  (not (= node_i@199@01 $Ref.null))
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@243@01  $FVF<next>)) g@158@01) prev_i@200@01 node_i@199@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))
  $Snap.unit))
(assert (=>
  (not (= node_i@199@01 $Ref.null))
  (and
    (not (= node_i@199@01 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@245@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@247@01  $FVF<next>) r) r))
      :pattern ((inv@245@01 r))
      :qid |quant-u-286|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@249@01  $FVF<next>)) g@158@01))))
(assert (=>
  (not (= node_i@199@01 $Ref.null))
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@249@01  $FVF<next>)) g@158@01) node_i@199@01 prev_node@204@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))))))))))
  $Snap.unit))
(assert (=>
  (not (= node@205@01 $Ref.null))
  (and
    (not (= node@205@01 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@251@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@253@01  $FVF<next>) r) r))
      :pattern ((inv@251@01 r))
      :qid |quant-u-292|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@255@01  $FVF<next>)) g@158@01))))
(assert (=>
  (not (= node@205@01 $Ref.null))
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@255@01  $FVF<next>)) g@158@01) prev_node@204@01 node@205@01)))
(assert (= $t@207@01 ($Snap.combine ($Snap.first $t@207@01) ($Snap.second $t@207@01))))
(assert (= ($Snap.first $t@207@01) $Snap.unit))
(assert (=
  ($Snap.second $t@207@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@207@01))
    ($Snap.second ($Snap.second $t@207@01)))))
(assert (= ($Snap.first ($Snap.second $t@207@01)) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second $t@207@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@207@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@207@01))) $Snap.unit))
(assert (<= 0 count@206@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@207@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@207@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@207@01))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01)))))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] node != null && count <= j
; [eval] node != null
(push) ; 6
; [then-branch: 53 | node@205@01 == Null | live]
; [else-branch: 53 | node@205@01 != Null | live]
(push) ; 7
; [then-branch: 53 | node@205@01 == Null]
(assert (= node@205@01 $Ref.null))
(pop) ; 7
(push) ; 7
; [else-branch: 53 | node@205@01 != Null]
(assert (not (= node@205@01 $Ref.null)))
; [eval] count <= j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= node@205@01 $Ref.null)) (= node@205@01 $Ref.null)))
(pop) ; 5
(push) ; 5
; [eval] !(node != null && count <= j)
; [eval] node != null && count <= j
; [eval] node != null
(push) ; 6
; [then-branch: 54 | node@205@01 == Null | live]
; [else-branch: 54 | node@205@01 != Null | live]
(push) ; 7
; [then-branch: 54 | node@205@01 == Null]
(assert (= node@205@01 $Ref.null))
(pop) ; 7
(push) ; 7
; [else-branch: 54 | node@205@01 != Null]
(assert (not (= node@205@01 $Ref.null)))
; [eval] count <= j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= node@205@01 $Ref.null)) (= node@205@01 $Ref.null)))
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] node != null && count <= j
; [eval] node != null
(push) ; 5
; [then-branch: 55 | node@205@01 == Null | live]
; [else-branch: 55 | node@205@01 != Null | live]
(push) ; 6
; [then-branch: 55 | node@205@01 == Null]
(assert (= node@205@01 $Ref.null))
(pop) ; 6
(push) ; 6
; [else-branch: 55 | node@205@01 != Null]
(assert (not (= node@205@01 $Ref.null)))
; [eval] count <= j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= node@205@01 $Ref.null)) (= node@205@01 $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not (= node@205@01 $Ref.null)) (<= count@206@01 j@161@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not (= node@205@01 $Ref.null)) (<= count@206@01 j@161@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
; [then-branch: 56 | node@205@01 != Null && count@206@01 <= j@161@01 | live]
; [else-branch: 56 | !(node@205@01 != Null && count@206@01 <= j@161@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 56 | node@205@01 != Null && count@206@01 <= j@161@01]
(assert (and (not (= node@205@01 $Ref.null)) (<= count@206@01 j@161@01)))
; [eval] count == i
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= count@206@01 i@160@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= count@206@01 i@160@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
; [then-branch: 57 | count@206@01 == i@160@01 | live]
; [else-branch: 57 | count@206@01 != i@160@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 57 | count@206@01 == i@160@01]
(assert (= count@206@01 i@160@01))
; [exec]
; node_i := node
; [exec]
; prev_i := prev_node
; [eval] count == j
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= count@206@01 j@161@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | count@206@01 == j@161@01 | dead]
; [else-branch: 58 | count@206@01 != j@161@01 | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 58 | count@206@01 != j@161@01]
(assert (not (= count@206@01 j@161@01)))
(pop) ; 7
; [eval] !(count == j)
; [eval] count == j
(push) ; 7
(set-option :timeout 10)
(assert (not (= count@206@01 j@161@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= count@206@01 j@161@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 59 | count@206@01 != j@161@01 | live]
; [else-branch: 59 | count@206@01 == j@161@01 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 59 | count@206@01 != j@161@01]
(assert (not (= count@206@01 j@161@01)))
; [exec]
; prev_node := node
; [exec]
; node := node.next
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) node@205@01) node@205@01))
(push) ; 8
(assert (not (and (img@211@01 node@205@01) (Set_in (inv@210@01 node@205@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(declare-const node@293@01 $Ref)
(assert (=
  node@293@01
  ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) node@205@01)))
; [exec]
; count := count + 1
; [eval] count + 1
(declare-const count@294@01 Int)
(assert (= count@294@01 (+ count@206@01 1)))
; [exec]
; assert node != null ==>
;   exists_path($$(g), node, node) && exists_path($$(g), prev_node, node)
; [eval] node != null ==> exists_path($$(g), node, node) && exists_path($$(g), prev_node, node)
; [eval] node != null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= node@293@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= node@293@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; [then-branch: 60 | node@293@01 != Null | live]
; [else-branch: 60 | node@293@01 == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 60 | node@293@01 != Null]
(assert (not (= node@293@01 $Ref.null)))
; [eval] exists_path($$(g), node, node) && exists_path($$(g), prev_node, node)
; [eval] exists_path($$(g), node, node)
; [eval] $$(g)
(push) ; 10
(declare-const n@295@01 $Ref)
(push) ; 11
; [eval] (n in refs)
(assert (Set_in n@295@01 g@158@01))
(pop) ; 11
(declare-fun inv@296@01 ($Ref) $Ref)
(declare-fun img@297@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@298@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@298@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@298@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef190|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@298@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef191|)))
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((n1@295@01 $Ref) (n2@295@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@295@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@298@01  $FVF<next>) n1@295@01) n1@295@01))
      (and
        (Set_in n2@295@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@298@01  $FVF<next>) n2@295@01) n2@295@01))
      (= n1@295@01 n2@295@01))
    (= n1@295@01 n2@295@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@295@01 $Ref)) (!
  (=>
    (Set_in n@295@01 g@158@01)
    (and (= (inv@296@01 n@295@01) n@295@01) (img@297@01 n@295@01)))
  :pattern ((Set_in n@295@01 g@158@01))
  :pattern ((inv@296@01 n@295@01))
  :pattern ((img@297@01 n@295@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@297@01 r) (Set_in (inv@296@01 r) g@158@01)) (= (inv@296@01 r) r))
  :pattern ((inv@296@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@296@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@298@01  $FVF<next>) r) r))
  :pattern ((inv@296@01 r))
  :qid |quant-u-333|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@299@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r) (= r (inv@296@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@299@01 r))
    $Perm.No)
  
  :qid |quant-u-335|))))
(check-sat)
; unknown
(pop) ; 11
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@299@01 r) $Perm.No)
  
  :qid |quant-u-336|))))
(check-sat)
; unknown
(pop) ; 11
; 0,02s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r) (= r (inv@296@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@299@01 r)) $Perm.No))
  
  :qid |quant-u-337|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@300@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@300@01  $FVF<next>)))
      (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r)))
    (=>
      (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r))
      (Set_in r ($FVF.domain_next (as sm@300@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@300@01  $FVF<next>))))
  :qid |qp.fvfDomDef194|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@300@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@300@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef192|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@300@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef193|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01))
(pop) ; 10
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@298@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@298@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef190|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@298@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef191|)))
(assert (forall ((n@295@01 $Ref)) (!
  (=>
    (Set_in n@295@01 g@158@01)
    (and (= (inv@296@01 n@295@01) n@295@01) (img@297@01 n@295@01)))
  :pattern ((Set_in n@295@01 g@158@01))
  :pattern ((inv@296@01 n@295@01))
  :pattern ((img@297@01 n@295@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@297@01 r) (Set_in (inv@296@01 r) g@158@01)) (= (inv@296@01 r) r))
  :pattern ((inv@296@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@300@01  $FVF<next>)))
      (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r)))
    (=>
      (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r))
      (Set_in r ($FVF.domain_next (as sm@300@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@300@01  $FVF<next>))))
  :qid |qp.fvfDomDef194|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@300@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@300@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef192|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@300@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef193|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@296@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@298@01  $FVF<next>) r) r))
    :pattern ((inv@296@01 r))
    :qid |quant-u-333|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01)))
(set-option :timeout 0)
(push) ; 10
; [then-branch: 61 | !(exists_path[Bool]($$(sm@300@01, g@158@01), node@293@01, node@293@01)) | live]
; [else-branch: 61 | exists_path[Bool]($$(sm@300@01, g@158@01), node@293@01, node@293@01) | live]
(push) ; 11
; [then-branch: 61 | !(exists_path[Bool]($$(sm@300@01, g@158@01), node@293@01, node@293@01))]
(assert (not
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 61 | exists_path[Bool]($$(sm@300@01, g@158@01), node@293@01, node@293@01)]
(assert (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01))
; [eval] exists_path($$(g), prev_node, node)
; [eval] $$(g)
(push) ; 12
(declare-const n@301@01 $Ref)
(push) ; 13
; [eval] (n in refs)
(assert (Set_in n@301@01 g@158@01))
(pop) ; 13
(declare-fun inv@302@01 ($Ref) $Ref)
(declare-fun img@303@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@304@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@304@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@304@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef195|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@304@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef196|)))
; Check receiver injectivity
(push) ; 13
(assert (not (forall ((n1@301@01 $Ref) (n2@301@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@301@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@304@01  $FVF<next>) n1@301@01) n1@301@01))
      (and
        (Set_in n2@301@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@304@01  $FVF<next>) n2@301@01) n2@301@01))
      (= n1@301@01 n2@301@01))
    (= n1@301@01 n2@301@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@301@01 $Ref)) (!
  (=>
    (Set_in n@301@01 g@158@01)
    (and (= (inv@302@01 n@301@01) n@301@01) (img@303@01 n@301@01)))
  :pattern ((Set_in n@301@01 g@158@01))
  :pattern ((inv@302@01 n@301@01))
  :pattern ((img@303@01 n@301@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@303@01 r) (Set_in (inv@302@01 r) g@158@01)) (= (inv@302@01 r) r))
  :pattern ((inv@302@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@302@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@304@01  $FVF<next>) r) r))
  :pattern ((inv@302@01 r))
  :qid |quant-u-339|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@305@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r) (= r (inv@302@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@305@01 r))
    $Perm.No)
  
  :qid |quant-u-341|))))
(check-sat)
; unknown
(pop) ; 13
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@305@01 r) $Perm.No)
  
  :qid |quant-u-342|))))
(check-sat)
; unknown
(pop) ; 13
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r) (= r (inv@302@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@305@01 r)) $Perm.No))
  
  :qid |quant-u-343|))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@306@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>)))
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r)))
    (=>
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r))
      (Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>))))
  :qid |qp.fvfDomDef199|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@306@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@306@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef197|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@306@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef198|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@306@01  $FVF<next>)) g@158@01))
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@304@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@304@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef195|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@304@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef196|)))
(assert (forall ((n@301@01 $Ref)) (!
  (=>
    (Set_in n@301@01 g@158@01)
    (and (= (inv@302@01 n@301@01) n@301@01) (img@303@01 n@301@01)))
  :pattern ((Set_in n@301@01 g@158@01))
  :pattern ((inv@302@01 n@301@01))
  :pattern ((img@303@01 n@301@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@303@01 r) (Set_in (inv@302@01 r) g@158@01)) (= (inv@302@01 r) r))
  :pattern ((inv@302@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>)))
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r)))
    (=>
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r))
      (Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>))))
  :qid |qp.fvfDomDef199|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@306@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@306@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef197|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@306@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef198|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@302@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@304@01  $FVF<next>) r) r))
    :pattern ((inv@302@01 r))
    :qid |quant-u-339|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@306@01  $FVF<next>)) g@158@01)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@304@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@304@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef195|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@304@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef196|)))
(assert (forall ((n@301@01 $Ref)) (!
  (=>
    (Set_in n@301@01 g@158@01)
    (and (= (inv@302@01 n@301@01) n@301@01) (img@303@01 n@301@01)))
  :pattern ((Set_in n@301@01 g@158@01))
  :pattern ((inv@302@01 n@301@01))
  :pattern ((img@303@01 n@301@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@303@01 r) (Set_in (inv@302@01 r) g@158@01)) (= (inv@302@01 r) r))
  :pattern ((inv@302@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>)))
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r)))
    (=>
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r))
      (Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>))))
  :qid |qp.fvfDomDef199|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@306@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@306@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef197|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@306@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef198|)))
(assert (=>
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01)
  (and
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@302@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@304@01  $FVF<next>) r) r))
      :pattern ((inv@302@01 r))
      :qid |quant-u-339|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@306@01  $FVF<next>)) g@158@01))))
(assert (or
  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01)
  (not
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01))))
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 60 | node@293@01 == Null]
(assert (= node@293@01 $Ref.null))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@298@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@298@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef190|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@298@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef191|)))
(assert (forall ((n@295@01 $Ref)) (!
  (=>
    (Set_in n@295@01 g@158@01)
    (and (= (inv@296@01 n@295@01) n@295@01) (img@297@01 n@295@01)))
  :pattern ((Set_in n@295@01 g@158@01))
  :pattern ((inv@296@01 n@295@01))
  :pattern ((img@297@01 n@295@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@297@01 r) (Set_in (inv@296@01 r) g@158@01)) (= (inv@296@01 r) r))
  :pattern ((inv@296@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@300@01  $FVF<next>)))
      (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r)))
    (=>
      (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r))
      (Set_in r ($FVF.domain_next (as sm@300@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@300@01  $FVF<next>))))
  :qid |qp.fvfDomDef194|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@296@01 r) g@158@01) (img@297@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@300@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@300@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef192|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@300@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef193|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@304@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@304@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef195|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@304@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef196|)))
(assert (forall ((n@301@01 $Ref)) (!
  (=>
    (Set_in n@301@01 g@158@01)
    (and (= (inv@302@01 n@301@01) n@301@01) (img@303@01 n@301@01)))
  :pattern ((Set_in n@301@01 g@158@01))
  :pattern ((inv@302@01 n@301@01))
  :pattern ((img@303@01 n@301@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@303@01 r) (Set_in (inv@302@01 r) g@158@01)) (= (inv@302@01 r) r))
  :pattern ((inv@302@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>)))
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r)))
    (=>
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r))
      (Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@306@01  $FVF<next>))))
  :qid |qp.fvfDomDef199|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@302@01 r) g@158@01) (img@303@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@306@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@306@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef197|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@306@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef198|)))
(assert (=>
  (not (= node@293@01 $Ref.null))
  (and
    (not (= node@293@01 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@296@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@298@01  $FVF<next>) r) r))
      :pattern ((inv@296@01 r))
      :qid |quant-u-333|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01)
    (=>
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01)
      (and
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@302@01 r) g@158@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@304@01  $FVF<next>) r) r))
          :pattern ((inv@302@01 r))
          :qid |quant-u-339|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@306@01  $FVF<next>)) g@158@01)))
    (or
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01))))))
; Joined path conditions
(assert (or (= node@293@01 $Ref.null) (not (= node@293@01 $Ref.null))))
(push) ; 8
(assert (not (=>
  (not (= node@293@01 $Ref.null))
  (and
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@306@01  $FVF<next>)) g@158@01) node@205@01 node@293@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,07s
; (get-info :all-statistics)
(assert (=>
  (not (= node@293@01 $Ref.null))
  (and
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@300@01  $FVF<next>)) g@158@01) node@293@01 node@293@01)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@306@01  $FVF<next>)) g@158@01) node@205@01 node@293@01))))
; Loop head block: Re-establish invariant
; [eval] 0 <= i
; [eval] i < j
; [eval] 0 <= count
(push) ; 8
(assert (not (<= 0 count@294@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 count@294@01))
; [eval] (x in g)
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n$2@307@01 $Ref)
(push) ; 8
; [eval] (n$2 in g)
(assert (Set_in n$2@307@01 g@158@01))
(declare-const sm@308@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@308@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@308@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef200|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@308@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef201|)))
(pop) ; 8
(declare-fun inv@309@01 ($Ref) $Ref)
(declare-fun img@310@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@308@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@308@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef200|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@308@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef201|)))
; Nested auxiliary terms: non-globals
(declare-const sm@311@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@311@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef202|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef203|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n$21@307@01 $Ref) (n$22@307@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n$21@307@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$21@307@01) n$21@307@01))
      (and
        (Set_in n$22@307@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$22@307@01) n$22@307@01))
      (= n$21@307@01 n$22@307@01))
    (= n$21@307@01 n$22@307@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$2@307@01 $Ref)) (!
  (=>
    (Set_in n$2@307@01 g@158@01)
    (and (= (inv@309@01 n$2@307@01) n$2@307@01) (img@310@01 n$2@307@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@308@01  $FVF<next>) n$2@307@01) n$2@307@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@310@01 r) (Set_in (inv@309@01 r) g@158@01)) (= (inv@309@01 r) r))
  :pattern ((inv@309@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@309@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) r) r))
  :pattern ((inv@309@01 r))
  :qid |quant-u-345|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@312@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@309@01 r) g@158@01) (img@310@01 r) (= r (inv@309@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
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
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@312@01 r))
    $Perm.No)
  
  :qid |quant-u-347|))))
(check-sat)
; unsat
(pop) ; 8
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@309@01 r) g@158@01) (img@310@01 r) (= r (inv@309@01 r)))
    (= (- $Perm.Write (pTaken@312@01 r)) $Perm.No))
  
  :qid |quant-u-348|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall n$3: Ref :: { (n$3.next in g) } { (n$3 in g), n$3.next } (n$3 in g) && n$3.next != null ==> (n$3.next in g))
(declare-const n$3@313@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (n$3 in g) && n$3.next != null ==> (n$3.next in g)
; [eval] (n$3 in g) && n$3.next != null
; [eval] (n$3 in g)
(push) ; 9
; [then-branch: 62 | !(n$3@313@01 in g@158@01) | live]
; [else-branch: 62 | n$3@313@01 in g@158@01 | live]
(push) ; 10
; [then-branch: 62 | !(n$3@313@01 in g@158@01)]
(assert (not (Set_in n$3@313@01 g@158@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 62 | n$3@313@01 in g@158@01]
(assert (Set_in n$3@313@01 g@158@01))
; [eval] n$3.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@311@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
    :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
    :qid |qp.fvfValDef202|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
    :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef203|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01))
(push) ; 11
(assert (not (and (img@211@01 n$3@313@01) (Set_in (inv@210@01 n$3@313@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@311@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef202|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef203|)))
(assert (=>
  (Set_in n$3@313@01 g@158@01)
  (and
    (Set_in n$3@313@01 g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01))))
(assert (or (Set_in n$3@313@01 g@158@01) (not (Set_in n$3@313@01 g@158@01))))
(push) ; 9
; [then-branch: 63 | n$3@313@01 in g@158@01 && Lookup(next, sm@311@01, n$3@313@01) != Null | live]
; [else-branch: 63 | !(n$3@313@01 in g@158@01 && Lookup(next, sm@311@01, n$3@313@01) != Null) | live]
(push) ; 10
; [then-branch: 63 | n$3@313@01 in g@158@01 && Lookup(next, sm@311@01, n$3@313@01) != Null]
(assert (and
  (Set_in n$3@313@01 g@158@01)
  (not (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null))))
; [eval] (n$3.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@311@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
    :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
    :qid |qp.fvfValDef202|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
    :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef203|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01))
(push) ; 11
(assert (not (and (img@211@01 n$3@313@01) (Set_in (inv@210@01 n$3@313@01) g@158@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 63 | !(n$3@313@01 in g@158@01 && Lookup(next, sm@311@01, n$3@313@01) != Null)]
(assert (not
  (and
    (Set_in n$3@313@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@311@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef202|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef203|)))
(assert (=>
  (and
    (Set_in n$3@313@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null)))
  (and
    (Set_in n$3@313@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$3@313@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null))))
  (and
    (Set_in n$3@313@01 g@158@01)
    (not (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@311@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef202|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef203|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$3@313@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@313@01 g@158@01)
      (and
        (Set_in n$3@313@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01)))
    (or (Set_in n$3@313@01 g@158@01) (not (Set_in n$3@313@01 g@158@01)))
    (=>
      (and
        (Set_in n$3@313@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null)))
      (and
        (Set_in n$3@313@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01)))
    (or
      (not
        (and
          (Set_in n$3@313@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01)
              $Ref.null))))
      (and
        (Set_in n$3@313@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) g@158@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27-aux|)))
(assert (forall ((n$3@313@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@313@01 g@158@01)
      (and
        (Set_in n$3@313@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01)))
    (or (Set_in n$3@313@01 g@158@01) (not (Set_in n$3@313@01 g@158@01)))
    (=>
      (and
        (Set_in n$3@313@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null)))
      (and
        (Set_in n$3@313@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01)))
    (or
      (not
        (and
          (Set_in n$3@313@01 g@158@01)
          (not
            (=
              ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01)
              $Ref.null))))
      (and
        (Set_in n$3@313@01 g@158@01)
        (not
          (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null)))))
  :pattern ((Set_in n$3@313@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27-aux|)))
(push) ; 8
(assert (not (forall ((n$3@313@01 $Ref)) (!
  (=>
    (and
      (Set_in n$3@313@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) g@158@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) g@158@01))
  :pattern ((Set_in n$3@313@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$3@313@01 $Ref)) (!
  (=>
    (and
      (Set_in n$3@313@01 g@158@01)
      (not
        (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) g@158@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) g@158@01))
  :pattern ((Set_in n$3@313@01 g@158@01) ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n$3@313@01) n$3@313@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@324@19@324@27|)))
; [eval] node != null ==> (node in g)
; [eval] node != null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= node@293@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= node@293@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; [then-branch: 64 | node@293@01 != Null | live]
; [else-branch: 64 | node@293@01 == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 64 | node@293@01 != Null]
(assert (not (= node@293@01 $Ref.null)))
; [eval] (node in g)
(pop) ; 9
(push) ; 9
; [else-branch: 64 | node@293@01 == Null]
(assert (= node@293@01 $Ref.null))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(push) ; 8
(assert (not (=> (not (= node@293@01 $Ref.null)) (Set_in node@293@01 g@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=> (not (= node@293@01 $Ref.null)) (Set_in node@293@01 g@158@01)))
; [eval] count <= j ==> (prev_node in g)
; [eval] count <= j
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (<= count@294@01 j@161@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<= count@294@01 j@161@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 65 | count@294@01 <= j@161@01 | live]
; [else-branch: 65 | !(count@294@01 <= j@161@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 65 | count@294@01 <= j@161@01]
(assert (<= count@294@01 j@161@01))
; [eval] (prev_node in g)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (<= count@294@01 j@161@01))
(push) ; 8
(assert (not (=> (<= count@294@01 j@161@01) (Set_in node@205@01 g@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=> (<= count@294@01 j@161@01) (Set_in node@205@01 g@158@01)))
; [eval] i < count ==> (node_i in g) && (prev_i in g)
; [eval] i < count
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (< i@160@01 count@294@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,02s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< i@160@01 count@294@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 66 | i@160@01 < count@294@01 | live]
; [else-branch: 66 | !(i@160@01 < count@294@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 66 | i@160@01 < count@294@01]
(assert (< i@160@01 count@294@01))
; [eval] (node_i in g) && (prev_i in g)
; [eval] (node_i in g)
(push) ; 10
; [then-branch: 67 | !(node@205@01 in g@158@01) | live]
; [else-branch: 67 | node@205@01 in g@158@01 | live]
(push) ; 11
; [then-branch: 67 | !(node@205@01 in g@158@01)]
(assert (not (Set_in node@205@01 g@158@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 67 | node@205@01 in g@158@01]
(assert (Set_in node@205@01 g@158@01))
; [eval] (prev_i in g)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (Set_in node@205@01 g@158@01) (not (Set_in node@205@01 g@158@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (< i@160@01 count@294@01)
  (and
    (< i@160@01 count@294@01)
    (or (Set_in node@205@01 g@158@01) (not (Set_in node@205@01 g@158@01))))))
(assert (< i@160@01 count@294@01))
(push) ; 8
(assert (not (=>
  (< i@160@01 count@294@01)
  (and (Set_in node@205@01 g@158@01) (Set_in prev_node@204@01 g@158@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< i@160@01 count@294@01)
  (and (Set_in node@205@01 g@158@01) (Set_in prev_node@204@01 g@158@01))))
; [eval] count <= j ==> prev_node.next == node
; [eval] count <= j
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (<= count@294@01 j@161@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; [then-branch: 68 | count@294@01 <= j@161@01 | live]
; [else-branch: 68 | !(count@294@01 <= j@161@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 68 | count@294@01 <= j@161@01]
; [eval] prev_node.next == node
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
      (=
        ($FVF.lookup_next (as sm@311@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
    :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
    :qid |qp.fvfValDef202|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
    :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef203|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) node@205@01) node@205@01))
(push) ; 10
(assert (not (and (img@211@01 node@205@01) (Set_in (inv@210@01 node@205@01) g@158@01))))
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
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@311@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef202|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@311@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef203|)))
(assert (=>
  (<= count@294@01 j@161@01)
  ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) node@205@01) node@205@01)))
(push) ; 8
(assert (not (=>
  (<= count@294@01 j@161@01)
  (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) node@205@01) node@293@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= count@294@01 j@161@01)
  (= ($FVF.lookup_next (as sm@311@01  $FVF<next>) node@205@01) node@293@01)))
; [eval] acyclic_graph($$(g))
; [eval] $$(g)
(push) ; 8
(declare-const n@314@01 $Ref)
(push) ; 9
; [eval] (n in refs)
(assert (Set_in n@314@01 g@158@01))
(pop) ; 9
(declare-fun inv@315@01 ($Ref) $Ref)
(declare-fun img@316@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 9
(assert (not (forall ((n1@314@01 $Ref) (n2@314@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@314@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n1@314@01) n1@314@01))
      (and
        (Set_in n2@314@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) n2@314@01) n2@314@01))
      (= n1@314@01 n2@314@01))
    (= n1@314@01 n2@314@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@314@01 $Ref)) (!
  (=>
    (Set_in n@314@01 g@158@01)
    (and (= (inv@315@01 n@314@01) n@314@01) (img@316@01 n@314@01)))
  :pattern ((Set_in n@314@01 g@158@01))
  :pattern ((inv@315@01 n@314@01))
  :pattern ((img@316@01 n@314@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@316@01 r) (Set_in (inv@315@01 r) g@158@01)) (= (inv@315@01 r) r))
  :pattern ((inv@315@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@315@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) r) r))
  :pattern ((inv@315@01 r))
  :qid |quant-u-350|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@317@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@315@01 r) g@158@01) (img@316@01 r) (= r (inv@315@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@317@01 r))
    $Perm.No)
  
  :qid |quant-u-352|))))
(check-sat)
; unknown
(pop) ; 9
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@317@01 r) $Perm.No)
  
  :qid |quant-u-353|))))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@315@01 r) g@158@01) (img@316@01 r) (= r (inv@315@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@317@01 r)) $Perm.No))
  
  :qid |quant-u-354|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@318@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@318@01  $FVF<next>)))
      (and (Set_in (inv@315@01 r) g@158@01) (img@316@01 r)))
    (=>
      (and (Set_in (inv@315@01 r) g@158@01) (img@316@01 r))
      (Set_in r ($FVF.domain_next (as sm@318@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@318@01  $FVF<next>))))
  :qid |qp.fvfDomDef206|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@315@01 r) g@158@01) (img@316@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@318@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@318@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef204|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@318@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef205|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@318@01  $FVF<next>)) g@158@01))
(pop) ; 8
; Joined path conditions
(assert (forall ((n@314@01 $Ref)) (!
  (=>
    (Set_in n@314@01 g@158@01)
    (and (= (inv@315@01 n@314@01) n@314@01) (img@316@01 n@314@01)))
  :pattern ((Set_in n@314@01 g@158@01))
  :pattern ((inv@315@01 n@314@01))
  :pattern ((img@316@01 n@314@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@316@01 r) (Set_in (inv@315@01 r) g@158@01)) (= (inv@315@01 r) r))
  :pattern ((inv@315@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@318@01  $FVF<next>)))
      (and (Set_in (inv@315@01 r) g@158@01) (img@316@01 r)))
    (=>
      (and (Set_in (inv@315@01 r) g@158@01) (img@316@01 r))
      (Set_in r ($FVF.domain_next (as sm@318@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@318@01  $FVF<next>))))
  :qid |qp.fvfDomDef206|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@315@01 r) g@158@01) (img@316@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@318@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@318@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef204|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@318@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef205|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@315@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@311@01  $FVF<next>) r) r))
    :pattern ((inv@315@01 r))
    :qid |quant-u-350|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@318@01  $FVF<next>)) g@158@01)))
(set-option :timeout 0)
(push) ; 8
(assert (not (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@318@01  $FVF<next>)) g@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,05s
; (get-info :all-statistics)
(assert (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@318@01  $FVF<next>)) g@158@01)))
; [eval] func_graph($$(g))
; [eval] $$(g)
(push) ; 8
(declare-const n@319@01 $Ref)
(push) ; 9
; [eval] (n in refs)
(assert (Set_in n@319@01 g@158@01))
(pop) ; 9
(declare-fun inv@320@01 ($Ref) $Ref)
(declare-fun img@321@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@322@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@322@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@322@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef207|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@322@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef208|)))
; Check receiver injectivity
(push) ; 9
(assert (not (forall ((n1@319@01 $Ref) (n2@319@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@319@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@322@01  $FVF<next>) n1@319@01) n1@319@01))
      (and
        (Set_in n2@319@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@322@01  $FVF<next>) n2@319@01) n2@319@01))
      (= n1@319@01 n2@319@01))
    (= n1@319@01 n2@319@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@319@01 $Ref)) (!
  (=>
    (Set_in n@319@01 g@158@01)
    (and (= (inv@320@01 n@319@01) n@319@01) (img@321@01 n@319@01)))
  :pattern ((Set_in n@319@01 g@158@01))
  :pattern ((inv@320@01 n@319@01))
  :pattern ((img@321@01 n@319@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@321@01 r) (Set_in (inv@320@01 r) g@158@01)) (= (inv@320@01 r) r))
  :pattern ((inv@320@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@320@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@322@01  $FVF<next>) r) r))
  :pattern ((inv@320@01 r))
  :qid |quant-u-356|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@323@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@320@01 r) g@158@01) (img@321@01 r) (= r (inv@320@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@323@01 r))
    $Perm.No)
  
  :qid |quant-u-358|))))
(check-sat)
; unknown
(pop) ; 9
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@323@01 r) $Perm.No)
  
  :qid |quant-u-359|))))
(check-sat)
; unknown
(pop) ; 9
; 0,02s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@320@01 r) g@158@01) (img@321@01 r) (= r (inv@320@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@323@01 r)) $Perm.No))
  
  :qid |quant-u-360|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@324@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@324@01  $FVF<next>)))
      (and (Set_in (inv@320@01 r) g@158@01) (img@321@01 r)))
    (=>
      (and (Set_in (inv@320@01 r) g@158@01) (img@321@01 r))
      (Set_in r ($FVF.domain_next (as sm@324@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@324@01  $FVF<next>))))
  :qid |qp.fvfDomDef211|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@320@01 r) g@158@01) (img@321@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@324@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@324@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef209|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@324@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef210|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@324@01  $FVF<next>)) g@158@01))
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@322@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@322@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef207|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@322@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef208|)))
(assert (forall ((n@319@01 $Ref)) (!
  (=>
    (Set_in n@319@01 g@158@01)
    (and (= (inv@320@01 n@319@01) n@319@01) (img@321@01 n@319@01)))
  :pattern ((Set_in n@319@01 g@158@01))
  :pattern ((inv@320@01 n@319@01))
  :pattern ((img@321@01 n@319@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@321@01 r) (Set_in (inv@320@01 r) g@158@01)) (= (inv@320@01 r) r))
  :pattern ((inv@320@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@324@01  $FVF<next>)))
      (and (Set_in (inv@320@01 r) g@158@01) (img@321@01 r)))
    (=>
      (and (Set_in (inv@320@01 r) g@158@01) (img@321@01 r))
      (Set_in r ($FVF.domain_next (as sm@324@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@324@01  $FVF<next>))))
  :qid |qp.fvfDomDef211|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@320@01 r) g@158@01) (img@321@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@324@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@324@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef209|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@324@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef210|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@320@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@322@01  $FVF<next>) r) r))
    :pattern ((inv@320@01 r))
    :qid |quant-u-356|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@324@01  $FVF<next>)) g@158@01)))
(set-option :timeout 0)
(push) ; 8
(assert (not (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@324@01  $FVF<next>)) g@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@324@01  $FVF<next>)) g@158@01)))
; [eval] unshared_graph($$(g))
; [eval] $$(g)
(push) ; 8
(declare-const n@325@01 $Ref)
(push) ; 9
; [eval] (n in refs)
(assert (Set_in n@325@01 g@158@01))
(pop) ; 9
(declare-fun inv@326@01 ($Ref) $Ref)
(declare-fun img@327@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@328@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@328@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@328@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef212|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@328@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef213|)))
; Check receiver injectivity
(push) ; 9
(assert (not (forall ((n1@325@01 $Ref) (n2@325@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@325@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@328@01  $FVF<next>) n1@325@01) n1@325@01))
      (and
        (Set_in n2@325@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@328@01  $FVF<next>) n2@325@01) n2@325@01))
      (= n1@325@01 n2@325@01))
    (= n1@325@01 n2@325@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@325@01 $Ref)) (!
  (=>
    (Set_in n@325@01 g@158@01)
    (and (= (inv@326@01 n@325@01) n@325@01) (img@327@01 n@325@01)))
  :pattern ((Set_in n@325@01 g@158@01))
  :pattern ((inv@326@01 n@325@01))
  :pattern ((img@327@01 n@325@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@327@01 r) (Set_in (inv@326@01 r) g@158@01)) (= (inv@326@01 r) r))
  :pattern ((inv@326@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@326@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@328@01  $FVF<next>) r) r))
  :pattern ((inv@326@01 r))
  :qid |quant-u-362|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@329@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@326@01 r) g@158@01) (img@327@01 r) (= r (inv@326@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@329@01 r))
    $Perm.No)
  
  :qid |quant-u-364|))))
(check-sat)
; unknown
(pop) ; 9
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@329@01 r) $Perm.No)
  
  :qid |quant-u-365|))))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@326@01 r) g@158@01) (img@327@01 r) (= r (inv@326@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@329@01 r)) $Perm.No))
  
  :qid |quant-u-366|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@330@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@330@01  $FVF<next>)))
      (and (Set_in (inv@326@01 r) g@158@01) (img@327@01 r)))
    (=>
      (and (Set_in (inv@326@01 r) g@158@01) (img@327@01 r))
      (Set_in r ($FVF.domain_next (as sm@330@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@330@01  $FVF<next>))))
  :qid |qp.fvfDomDef216|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@326@01 r) g@158@01) (img@327@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@330@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@330@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef214|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@330@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef215|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@330@01  $FVF<next>)) g@158@01))
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@328@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@328@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef212|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@328@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef213|)))
(assert (forall ((n@325@01 $Ref)) (!
  (=>
    (Set_in n@325@01 g@158@01)
    (and (= (inv@326@01 n@325@01) n@325@01) (img@327@01 n@325@01)))
  :pattern ((Set_in n@325@01 g@158@01))
  :pattern ((inv@326@01 n@325@01))
  :pattern ((img@327@01 n@325@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@327@01 r) (Set_in (inv@326@01 r) g@158@01)) (= (inv@326@01 r) r))
  :pattern ((inv@326@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@330@01  $FVF<next>)))
      (and (Set_in (inv@326@01 r) g@158@01) (img@327@01 r)))
    (=>
      (and (Set_in (inv@326@01 r) g@158@01) (img@327@01 r))
      (Set_in r ($FVF.domain_next (as sm@330@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@330@01  $FVF<next>))))
  :qid |qp.fvfDomDef216|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@326@01 r) g@158@01) (img@327@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@330@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@330@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef214|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@330@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef215|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@326@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@328@01  $FVF<next>) r) r))
    :pattern ((inv@326@01 r))
    :qid |quant-u-362|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@330@01  $FVF<next>)) g@158@01)))
(set-option :timeout 0)
(push) ; 8
(assert (not (unshared_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@330@01  $FVF<next>)) g@158@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,11s
; (get-info :all-statistics)
(assert (unshared_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@330@01  $FVF<next>)) g@158@01)))
; [eval] (forall n$4: Ref :: { exists_path($$(g), x, n$4) } (n$4 in g) ==> exists_path($$(g), x, n$4))
(declare-const n$4@331@01 $Ref)
(push) ; 8
; [eval] (n$4 in g) ==> exists_path($$(g), x, n$4)
; [eval] (n$4 in g)
(push) ; 9
; [then-branch: 69 | n$4@331@01 in g@158@01 | live]
; [else-branch: 69 | !(n$4@331@01 in g@158@01) | live]
(push) ; 10
; [then-branch: 69 | n$4@331@01 in g@158@01]
(assert (Set_in n$4@331@01 g@158@01))
; [eval] exists_path($$(g), x, n$4)
; [eval] $$(g)
(push) ; 11
(declare-const n@332@01 $Ref)
(push) ; 12
; [eval] (n in refs)
(assert (Set_in n@332@01 g@158@01))
(pop) ; 12
(declare-fun inv@333@01 ($Ref) $Ref)
(declare-fun img@334@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@335@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@335@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@335@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef217|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@335@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef218|)))
; Check receiver injectivity
(push) ; 12
(assert (not (forall ((n1@332@01 $Ref) (n2@332@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@332@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@335@01  $FVF<next>) n1@332@01) n1@332@01))
      (and
        (Set_in n2@332@01 g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@335@01  $FVF<next>) n2@332@01) n2@332@01))
      (= n1@332@01 n2@332@01))
    (= n1@332@01 n2@332@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@332@01 $Ref)) (!
  (=>
    (Set_in n@332@01 g@158@01)
    (and (= (inv@333@01 n@332@01) n@332@01) (img@334@01 n@332@01)))
  :pattern ((Set_in n@332@01 g@158@01))
  :pattern ((inv@333@01 n@332@01))
  :pattern ((img@334@01 n@332@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@334@01 r) (Set_in (inv@333@01 r) g@158@01)) (= (inv@333@01 r) r))
  :pattern ((inv@333@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@333@01 r) g@158@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@335@01  $FVF<next>) r) r))
  :pattern ((inv@333@01 r))
  :qid |quant-u-368|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@336@01 ((r $Ref) (n$4@331@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r) (= r (inv@333@01 r)))
    ($Perm.min
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
        $Perm.Write
        $Perm.No)
      (pTaken@336@01 r n$4@331@01))
    $Perm.No)
  
  :qid |quant-u-370|))))
(check-sat)
; unknown
(pop) ; 12
; 0,51s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@336@01 r n$4@331@01) $Perm.No)
  
  :qid |quant-u-371|))))
(check-sat)
; unknown
(pop) ; 12
; 0,02s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r) (= r (inv@333@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@336@01 r n$4@331@01)) $Perm.No))
  
  :qid |quant-u-372|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@337@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>)))
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r)))
    (=>
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r))
      (Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>))))
  :qid |qp.fvfDomDef221|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@337@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@337@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef219|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@337@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef220|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01))
(pop) ; 11
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@335@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@335@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef217|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@335@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef218|)))
(assert (forall ((n@332@01 $Ref)) (!
  (=>
    (Set_in n@332@01 g@158@01)
    (and (= (inv@333@01 n@332@01) n@332@01) (img@334@01 n@332@01)))
  :pattern ((Set_in n@332@01 g@158@01))
  :pattern ((inv@333@01 n@332@01))
  :pattern ((img@334@01 n@332@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@334@01 r) (Set_in (inv@333@01 r) g@158@01)) (= (inv@333@01 r) r))
  :pattern ((inv@333@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>)))
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r)))
    (=>
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r))
      (Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>))))
  :qid |qp.fvfDomDef221|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@337@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@337@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef219|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@337@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef220|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@333@01 r) g@158@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@335@01  $FVF<next>) r) r))
    :pattern ((inv@333@01 r))
    :qid |quant-u-368|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 69 | !(n$4@331@01 in g@158@01)]
(assert (not (Set_in n$4@331@01 g@158@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@335@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@335@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef217|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@335@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef218|)))
(assert (forall ((n@332@01 $Ref)) (!
  (=>
    (Set_in n@332@01 g@158@01)
    (and (= (inv@333@01 n@332@01) n@332@01) (img@334@01 n@332@01)))
  :pattern ((Set_in n@332@01 g@158@01))
  :pattern ((inv@333@01 n@332@01))
  :pattern ((img@334@01 n@332@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@334@01 r) (Set_in (inv@333@01 r) g@158@01)) (= (inv@333@01 r) r))
  :pattern ((inv@333@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>)))
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r)))
    (=>
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r))
      (Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>))))
  :qid |qp.fvfDomDef221|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@337@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@337@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef219|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@337@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef220|)))
(assert (=>
  (Set_in n$4@331@01 g@158@01)
  (and
    (Set_in n$4@331@01 g@158@01)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@333@01 r) g@158@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@335@01  $FVF<next>) r) r))
      :pattern ((inv@333@01 r))
      :qid |quant-u-368|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01))))
; Joined path conditions
(assert (or (not (Set_in n$4@331@01 g@158@01)) (Set_in n$4@331@01 g@158@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01))
    (=
      ($FVF.lookup_next (as sm@335@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@335@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef217|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@335@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef218|)))
(assert (forall ((n@332@01 $Ref)) (!
  (=>
    (Set_in n@332@01 g@158@01)
    (and (= (inv@333@01 n@332@01) n@332@01) (img@334@01 n@332@01)))
  :pattern ((Set_in n@332@01 g@158@01))
  :pattern ((inv@333@01 n@332@01))
  :pattern ((img@334@01 n@332@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@334@01 r) (Set_in (inv@333@01 r) g@158@01)) (= (inv@333@01 r) r))
  :pattern ((inv@333@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>)))
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r)))
    (=>
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r))
      (Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@337@01  $FVF<next>))))
  :qid |qp.fvfDomDef221|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@333@01 r) g@158@01) (img@334@01 r))
      (and (img@211@01 r) (Set_in (inv@210@01 r) g@158@01)))
    (=
      ($FVF.lookup_next (as sm@337@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r)))
  :pattern (($FVF.lookup_next (as sm@337@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r))
  :qid |qp.fvfValDef219|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))) r) r)
  :pattern (($FVF.lookup_next (as sm@337@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef220|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$4@331@01 $Ref)) (!
  (and
    (=>
      (Set_in n$4@331@01 g@158@01)
      (and
        (Set_in n$4@331@01 g@158@01)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@333@01 r) g@158@01)
            ($FVF.loc_next ($FVF.lookup_next (as sm@335@01  $FVF<next>) r) r))
          :pattern ((inv@333@01 r))
          :qid |quant-u-368|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01)))
    (or (not (Set_in n$4@331@01 g@158@01)) (Set_in n$4@331@01 g@158@01)))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01) x@159@01 n$4@331@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38-aux|)))
(assert (forall ((n$4@331@01 $Ref)) (!
  (=>
    (Set_in n$4@331@01 g@158@01)
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01) x@159@01 n$4@331@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38_precondition|)))
(push) ; 8
(assert (not (forall ((n$4@331@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in n$4@331@01 g@158@01)
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01))
      (Set_in n$4@331@01 g@158@01))
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01) x@159@01 n$4@331@01))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (as sm@337@01  $FVF<next>)) g@158@01) x@159@01 n$4@331@01))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/unsound/list-swap.vpr@338@19@338@38|))))
(check-sat)
