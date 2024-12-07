(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:10:51
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/graphs/static/examples/graph_mark.vpr
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
(declare-sort $FVF<car> 0)
(declare-sort $FVF<cdr> 0)
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
(declare-fun $SortWrappers.$FVF<car>To$Snap ($FVF<car>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<car> ($Snap) $FVF<car>)
(assert (forall ((x $FVF<car>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<car>($SortWrappers.$FVF<car>To$Snap x)))
    :pattern (($SortWrappers.$FVF<car>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<car>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<car>To$Snap($SortWrappers.$SnapTo$FVF<car> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<car> x))
    :qid |$Snap.$FVF<car>To$SnapTo$FVF<car>|
    )))
(declare-fun $SortWrappers.$FVF<cdr>To$Snap ($FVF<cdr>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<cdr> ($Snap) $FVF<cdr>)
(assert (forall ((x $FVF<cdr>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<cdr>($SortWrappers.$FVF<cdr>To$Snap x)))
    :pattern (($SortWrappers.$FVF<cdr>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<cdr>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<cdr>To$Snap($SortWrappers.$SnapTo$FVF<cdr> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<cdr> x))
    :qid |$Snap.$FVF<cdr>To$SnapTo$FVF<cdr>|
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
(declare-fun exists_path<Bool> (Set<Edge> $Ref $Ref) Bool)
(declare-fun exists_path_<Bool> (Set<Edge> $Ref $Ref) Bool)
(declare-fun exists_spath<Bool> (Set<Edge> Set<$Ref> $Ref) Bool)
(declare-fun is_on_path<Bool> (Set<Edge> $Ref $Ref $Ref) Bool)
(declare-fun apply_IND<Bool> (Set<Edge> Set<$Ref> Set<$Ref>) Bool)
(declare-fun apply_noExit<Bool> (Set<Edge> Set<$Ref> Set<$Ref>) Bool)
(declare-fun apply_goOut<Bool> (Set<Edge> Set<$Ref> Set<$Ref> Set<$Ref>) Bool)
(declare-fun apply_newStart<Bool> (Set<$Ref> Set<$Ref> Set<Edge> Set<Edge>) Bool)
(declare-fun inst_uReach<Set<Ref>> (Set<Edge> $Ref) Set<$Ref>)
(declare-fun acyclic_graph<Bool> (Set<Edge>) Bool)
(declare-fun unshared_graph<Bool> (Set<Edge>) Bool)
(declare-fun func_graph<Bool> (Set<Edge>) Bool)
(declare-fun edge_pred<Ref> (Edge) $Ref)
(declare-fun edge_succ<Ref> (Edge) $Ref)
(declare-fun create_edge<Edge> ($Ref $Ref) Edge)
; /field_value_functions_declarations.smt2 [car: Ref]
(declare-fun $FVF.domain_car ($FVF<car>) Set<$Ref>)
(declare-fun $FVF.lookup_car ($FVF<car> $Ref) $Ref)
(declare-fun $FVF.after_car ($FVF<car> $FVF<car>) Bool)
(declare-fun $FVF.loc_car ($Ref $Ref) Bool)
(declare-fun $FVF.perm_car ($FPM $Ref) $Perm)
(declare-const $fvfTOP_car $FVF<car>)
; /field_value_functions_declarations.smt2 [cdr: Ref]
(declare-fun $FVF.domain_cdr ($FVF<cdr>) Set<$Ref>)
(declare-fun $FVF.lookup_cdr ($FVF<cdr> $Ref) $Ref)
(declare-fun $FVF.after_cdr ($FVF<cdr> $FVF<cdr>) Bool)
(declare-fun $FVF.loc_cdr ($Ref $Ref) Bool)
(declare-fun $FVF.perm_cdr ($FPM $Ref) $Perm)
(declare-const $fvfTOP_cdr $FVF<cdr>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun $$ ($Snap Set<$Ref>) Set<Edge>)
(declare-fun $$%limited ($Snap Set<$Ref>) Set<Edge>)
(declare-fun $$%stateless (Set<$Ref>) Bool)
(declare-fun $$%precondition ($Snap Set<$Ref>) Bool)
(declare-fun get ($Snap Set<$Ref>) $Ref)
(declare-fun get%limited ($Snap Set<$Ref>) $Ref)
(declare-fun get%stateless (Set<$Ref>) Bool)
(declare-fun get%precondition ($Snap Set<$Ref>) Bool)
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
(assert (forall ((EG Set<Edge>) (U Set<$Ref>) (M Set<$Ref>)) (!
  (=>
    (and
      (apply_noExit<Bool> EG U M)
      (forall ((u $Ref) (v $Ref)) (!
        (=>
          (and (Set_in u M) (and (Set_in v U) (not (Set_in v M))))
          (not (Set_in (create_edge<Edge> u v) EG)))
        :pattern ((Set_in (create_edge<Edge> u v) EG))
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
(assert (forall ((EG Set<Edge>) (start $Ref) (end $Ref)) (!
  (= (exists_path<Bool> EG start end) (exists_path_<Bool> EG start end))
  :pattern ((exists_path<Bool> EG start end))
  :qid |prog.ax_Alias|)))
(assert (forall ((EG Set<Edge>) (start $Ref) (mid $Ref) (end $Ref)) (!
  (=
    (is_on_path<Bool> EG start mid end)
    (and
      (Set_in (create_edge<Edge> start mid) EG)
      (exists_path_<Bool> EG mid end)))
  :pattern ((is_on_path<Bool> EG start mid end))
  :pattern ((Set_in (create_edge<Edge> start mid) EG) (exists_path_<Bool> EG mid end))
  :qid |prog.ax_IsOnPath|)))
(assert (forall ((EG Set<Edge>) (start $Ref) (end $Ref)) (!
  (=
    (exists_path_<Bool> EG start end)
    (or
      (= start end)
      (exists ((w $Ref)) (!
        (and
          (Set_in (create_edge<Edge> start w) EG)
          (exists_path_<Bool> EG w end))
        :pattern ((Set_in (create_edge<Edge> start w) EG))
        :pattern ((exists_path_<Bool> EG w end))
        ))))
  :pattern ((exists_path<Bool> EG start end))
  :pattern ((Set_in (create_edge<Edge> start end) EG))
  :qid |prog.ax_ExistsPath|)))
(assert (forall ((EG Set<Edge>) (u $Ref) (v $Ref) (w $Ref)) (!
  (=>
    (and (exists_path_<Bool> EG u w) (exists_path_<Bool> EG w v))
    (exists_path_<Bool> EG u v))
  :pattern ((exists_path<Bool> EG u w) (exists_path<Bool> EG w v))
  :qid |prog.ax_ExistsPathTrans|)))
(assert (forall ((EG Set<Edge>) (from Set<$Ref>) (to $Ref)) (!
  (=
    (exists_spath<Bool> EG from to)
    (exists ((f $Ref)) (!
      (and (Set_in f from) (exists_path<Bool> EG f to))
      :pattern ((Set_in f from))
      :pattern ((exists_path<Bool> EG f to))
      )))
  :pattern ((exists_spath<Bool> EG from to))
  :qid |prog.ax_ExistsSetPath|)))
(assert (forall ((p $Ref) (s $Ref)) (!
  (and
    (= (edge_pred<Ref> (create_edge<Edge> p s)) p)
    (= (edge_succ<Ref> (create_edge<Edge> p s)) s))
  :pattern ((create_edge<Edge> p s))
  :qid |prog.edge_injectivity|)))
; /field_value_functions_axioms.smt2 [car: Ref]
(assert (forall ((vs $FVF<car>) (ws $FVF<car>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_car vs) ($FVF.domain_car ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_car vs))
            (= ($FVF.lookup_car vs x) ($FVF.lookup_car ws x)))
          :pattern (($FVF.lookup_car vs x) ($FVF.lookup_car ws x))
          :qid |qp.$FVF<car>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<car>To$Snap vs)
              ($SortWrappers.$FVF<car>To$Snap ws)
              )
    :qid |qp.$FVF<car>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_car pm r))
    :pattern (($FVF.perm_car pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_car f r) true)
    :pattern (($FVF.loc_car f r)))))
; /field_value_functions_axioms.smt2 [cdr: Ref]
(assert (forall ((vs $FVF<cdr>) (ws $FVF<cdr>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_cdr vs) ($FVF.domain_cdr ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_cdr vs))
            (= ($FVF.lookup_cdr vs x) ($FVF.lookup_cdr ws x)))
          :pattern (($FVF.lookup_cdr vs x) ($FVF.lookup_cdr ws x))
          :qid |qp.$FVF<cdr>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<cdr>To$Snap vs)
              ($SortWrappers.$FVF<cdr>To$Snap ws)
              )
    :qid |qp.$FVF<cdr>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_cdr pm r))
    :pattern (($FVF.perm_cdr pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_cdr f r) true)
    :pattern (($FVF.loc_cdr f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION $$----------
(declare-fun refs@0@00 () Set<$Ref>)
(declare-fun result@1@00 () Set<Edge>)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const n@4@00 $Ref)
(push) ; 2
; [eval] (n in refs)
(assert (Set_in n@4@00 refs@0@00))
(declare-fun sm@5@00 ($Snap Set<$Ref>) $FVF<car>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@6@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@7@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@4@00 $Ref) (n2@4@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@4@00 refs@0@00)
      (Set_in n2@4@00 refs@0@00)
      (= n1@4@00 n2@4@00))
    (= n1@4@00 n2@4@00))
  
  :qid |car-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@4@00 $Ref)) (!
  (=>
    (Set_in n@4@00 refs@0@00)
    (and
      (= (inv@6@00 s@$ refs@0@00 n@4@00) n@4@00)
      (img@7@00 s@$ refs@0@00 n@4@00)))
  :pattern (($FVF.loc_car ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) n@4@00) n@4@00))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@00 s@$ refs@0@00 r)
      (Set_in (inv@6@00 s@$ refs@0@00 r) refs@0@00))
    (= (inv@6@00 s@$ refs@0@00 r) r))
  :pattern ((inv@6@00 s@$ refs@0@00 r))
  :qid |car-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@4@00 $Ref)) (!
  (=> (Set_in n@4@00 refs@0@00) (not (= n@4@00 $Ref.null)))
  :pattern (($FVF.loc_car ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) n@4@00) n@4@00))
  :qid |car-permImpliesNonNull|)))
(declare-fun sm@8@00 ($Snap Set<$Ref>) $FVF<car>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@00 s@$ refs@0@00 r)
      (Set_in (inv@6@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r)
      ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_car ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@6@00 s@$ refs@0@00 r) refs@0@00)
    ($FVF.loc_car ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r) r))
  :pattern ((inv@6@00 s@$ refs@0@00 r))
  :qid |quant-u-6|)))
(declare-const n$0@9@00 $Ref)
(push) ; 2
; [eval] (n$0 in refs)
(assert (Set_in n$0@9@00 refs@0@00))
(declare-fun sm@10@00 ($Snap Set<$Ref>) $FVF<cdr>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@11@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@12@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n$01@9@00 $Ref) (n$02@9@00 $Ref)) (!
  (=>
    (and
      (Set_in n$01@9@00 refs@0@00)
      (Set_in n$02@9@00 refs@0@00)
      (= n$01@9@00 n$02@9@00))
    (= n$01@9@00 n$02@9@00))
  
  :qid |cdr-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$0@9@00 $Ref)) (!
  (=>
    (Set_in n$0@9@00 refs@0@00)
    (and
      (= (inv@11@00 s@$ refs@0@00 n$0@9@00) n$0@9@00)
      (img@12@00 s@$ refs@0@00 n$0@9@00)))
  :pattern (($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) n$0@9@00) n$0@9@00))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ refs@0@00 r)
      (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00))
    (= (inv@11@00 s@$ refs@0@00 r) r))
  :pattern ((inv@11@00 s@$ refs@0@00 r))
  :qid |cdr-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n$0@9@00 $Ref)) (!
  (=> (Set_in n$0@9@00 refs@0@00) (not (= n$0@9@00 $Ref.null)))
  :pattern (($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) n$0@9@00) n$0@9@00))
  :qid |cdr-permImpliesNonNull|)))
(declare-fun sm@13@00 ($Snap Set<$Ref>) $FVF<cdr>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ refs@0@00 r)
      (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r)
      ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00)
    ($FVF.loc_cdr ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r) r))
  :pattern ((inv@11@00 s@$ refs@0@00 r))
  :qid |quant-u-9|)))
(declare-const $t@14@00 $Snap)
(assert (= $t@14@00 $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { (create_edge(p, s) in result) } ((p in refs) && ((s in refs) && (p.car == s || p.cdr == s))) == (create_edge(p, s) in result))
(declare-const p@15@00 $Ref)
(declare-const s@16@00 $Ref)
(push) ; 2
; [eval] ((p in refs) && ((s in refs) && (p.car == s || p.cdr == s))) == (create_edge(p, s) in result)
; [eval] (p in refs) && ((s in refs) && (p.car == s || p.cdr == s))
; [eval] (p in refs)
(push) ; 3
; [then-branch: 0 | !(p@15@00 in refs@0@00) | live]
; [else-branch: 0 | p@15@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 0 | !(p@15@00 in refs@0@00)]
(assert (not (Set_in p@15@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | p@15@00 in refs@0@00]
(assert (Set_in p@15@00 refs@0@00))
; [eval] (s in refs)
(push) ; 5
; [then-branch: 1 | !(s@16@00 in refs@0@00) | live]
; [else-branch: 1 | s@16@00 in refs@0@00 | live]
(push) ; 6
; [then-branch: 1 | !(s@16@00 in refs@0@00)]
(assert (not (Set_in s@16@00 refs@0@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | s@16@00 in refs@0@00]
(assert (Set_in s@16@00 refs@0@00))
; [eval] p.car == s || p.cdr == s
; [eval] p.car == s
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@7@00 s@$ refs@0@00 r)
        (Set_in (inv@6@00 s@$ refs@0@00 r) refs@0@00))
      (=
        ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r)
        ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
    :pattern (($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_car ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_car ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) p@15@00))
(push) ; 7
(assert (not (and
  (img@7@00 s@$ refs@0@00 p@15@00)
  (Set_in (inv@6@00 s@$ refs@0@00 p@15@00) refs@0@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 2 | Lookup(car, sm@8@00(s@$, refs@0@00), p@15@00) == s@16@00 | live]
; [else-branch: 2 | Lookup(car, sm@8@00(s@$, refs@0@00), p@15@00) != s@16@00 | live]
(push) ; 8
; [then-branch: 2 | Lookup(car, sm@8@00(s@$, refs@0@00), p@15@00) == s@16@00]
(assert (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | Lookup(car, sm@8@00(s@$, refs@0@00), p@15@00) != s@16@00]
(assert (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00)))
; [eval] p.cdr == s
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@00 s@$ refs@0@00 r)
        (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00))
      (=
        ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r)
        ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
    :pattern (($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_cdr ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) p@15@00) p@15@00))
(push) ; 9
(assert (not (and
  (img@12@00 s@$ refs@0@00 p@15@00)
  (Set_in (inv@11@00 s@$ refs@0@00 p@15@00) refs@0@00))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ refs@0@00 r)
      (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r)
      ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
  (and
    (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
    ($FVF.loc_cdr ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) p@15@00) p@15@00))))
(assert (or
  (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
  (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@00 s@$ refs@0@00 r)
      (Set_in (inv@6@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r)
      ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_car ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ refs@0@00 r)
      (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r)
      ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (Set_in s@16@00 refs@0@00)
  (and
    (Set_in s@16@00 refs@0@00)
    ($FVF.loc_car ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) p@15@00)
    (=>
      (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
      (and
        (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
        ($FVF.loc_cdr ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) p@15@00) p@15@00)))
    (or
      (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
      (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00)))))
(assert (or (Set_in s@16@00 refs@0@00) (not (Set_in s@16@00 refs@0@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@00 s@$ refs@0@00 r)
      (Set_in (inv@6@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r)
      ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_car ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ refs@0@00 r)
      (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r)
      ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (Set_in p@15@00 refs@0@00)
  (and
    (Set_in p@15@00 refs@0@00)
    (=>
      (Set_in s@16@00 refs@0@00)
      (and
        (Set_in s@16@00 refs@0@00)
        ($FVF.loc_car ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) p@15@00)
        (=>
          (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
          (and
            (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
            ($FVF.loc_cdr ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) p@15@00) p@15@00)))
        (or
          (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
          (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))))
    (or (Set_in s@16@00 refs@0@00) (not (Set_in s@16@00 refs@0@00))))))
(assert (or (Set_in p@15@00 refs@0@00) (not (Set_in p@15@00 refs@0@00))))
; [eval] (create_edge(p, s) in result)
; [eval] create_edge(p, s)
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@00 s@$ refs@0@00 r)
      (Set_in (inv@6@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r)
      ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_car ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ refs@0@00 r)
      (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r)
      ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@15@00 $Ref) (s@16@00 $Ref)) (!
  (and
    (=>
      (Set_in p@15@00 refs@0@00)
      (and
        (Set_in p@15@00 refs@0@00)
        (=>
          (Set_in s@16@00 refs@0@00)
          (and
            (Set_in s@16@00 refs@0@00)
            ($FVF.loc_car ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) p@15@00)
            (=>
              (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
              (and
                (not
                  (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
                ($FVF.loc_cdr ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) p@15@00) p@15@00)))
            (or
              (not (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))
              (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00))))
        (or (Set_in s@16@00 refs@0@00) (not (Set_in s@16@00 refs@0@00)))))
    (or (Set_in p@15@00 refs@0@00) (not (Set_in p@15@00 refs@0@00))))
  :pattern ((Set_in (create_edge<Edge> p@15@00 s@16@00) result@1@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/examples/graph_mark.vpr@159@13@163@34-aux|)))
(assert (forall ((p@15@00 $Ref) (s@16@00 $Ref)) (!
  (=
    (and
      (Set_in p@15@00 refs@0@00)
      (and
        (Set_in s@16@00 refs@0@00)
        (or
          (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p@15@00) s@16@00)
          (= ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) p@15@00) s@16@00))))
    (Set_in (create_edge<Edge> p@15@00 s@16@00) result@1@00))
  :pattern ((Set_in (create_edge<Edge> p@15@00 s@16@00) result@1@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/examples/graph_mark.vpr@159@13@163@34|)))
(pop) ; 1
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
    (forall ((n@4@00 $Ref)) (!
      (=>
        (Set_in n@4@00 refs@0@00)
        (and
          (= (inv@6@00 s@$ refs@0@00 n@4@00) n@4@00)
          (img@7@00 s@$ refs@0@00 n@4@00)))
      :pattern (($FVF.loc_car ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) n@4@00) n@4@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@7@00 s@$ refs@0@00 r)
          (Set_in (inv@6@00 s@$ refs@0@00 r) refs@0@00))
        (= (inv@6@00 s@$ refs@0@00 r) r))
      :pattern ((inv@6@00 s@$ refs@0@00 r))
      :qid |car-fctOfInv|))
    (forall ((n$0@9@00 $Ref)) (!
      (=>
        (Set_in n$0@9@00 refs@0@00)
        (and
          (= (inv@11@00 s@$ refs@0@00 n$0@9@00) n$0@9@00)
          (img@12@00 s@$ refs@0@00 n$0@9@00)))
      :pattern (($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) n$0@9@00) n$0@9@00))
      :qid |quant-u-8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@12@00 s@$ refs@0@00 r)
          (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00))
        (= (inv@11@00 s@$ refs@0@00 r) r))
      :pattern ((inv@11@00 s@$ refs@0@00 r))
      :qid |cdr-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_car (sm@5@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef0|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_cdr (sm@10@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@7@00 s@$ refs@0@00 r)
          (Set_in (inv@6@00 s@$ refs@0@00 r) refs@0@00))
        (=
          ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r)
          ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
      :pattern (($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef1|))
    (forall ((r $Ref)) (!
      ($FVF.loc_car ($FVF.lookup_car ($SortWrappers.$SnapTo$FVF<car> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_car (sm@8@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@12@00 s@$ refs@0@00 r)
          (Set_in (inv@11@00 s@$ refs@0@00 r) refs@0@00))
        (=
          ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r)
          ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
      :pattern (($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_cdr ($FVF.lookup_cdr ($SortWrappers.$SnapTo$FVF<cdr> ($Snap.second ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef5|))
    (=>
      ($$%precondition s@$ refs@0@00)
      (forall ((p $Ref) (s $Ref)) (!
        (=
          (and
            (Set_in p refs@0@00)
            (and
              (Set_in s refs@0@00)
              (or
                (= ($FVF.lookup_car (sm@8@00 s@$ refs@0@00) p) s)
                (= ($FVF.lookup_cdr (sm@13@00 s@$ refs@0@00) p) s))))
          (Set_in (create_edge<Edge> p s) result@1@00))
        :pattern ((Set_in (create_edge<Edge> p s) result@1@00))
        )))))
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-11|)))
; ---------- FUNCTION get----------
(declare-fun s@2@00 () Set<$Ref>)
(declare-fun result@3@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] |s| > 0
; [eval] |s|
(assert (> (Set_card s@2@00) 0))
(declare-const $t@17@00 $Snap)
(assert (= $t@17@00 $Snap.unit))
; [eval] (result in s)
(assert (Set_in result@3@00 s@2@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@2@00 Set<$Ref>)) (!
  (= (get%limited s@$ s@2@00) (get s@$ s@2@00))
  :pattern ((get s@$ s@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (s@2@00 Set<$Ref>)) (!
  (get%stateless s@2@00)
  :pattern ((get%limited s@$ s@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (s@2@00 Set<$Ref>)) (!
  (let ((result@3@00 (get%limited s@$ s@2@00))) (=>
    (get%precondition s@$ s@2@00)
    (Set_in result@3@00 s@2@00)))
  :pattern ((get%limited s@$ s@2@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (s@2@00 Set<$Ref>)) (!
  (let ((result@3@00 (get%limited s@$ s@2@00))) true)
  :pattern ((get%limited s@$ s@2@00))
  :qid |quant-u-13|)))
