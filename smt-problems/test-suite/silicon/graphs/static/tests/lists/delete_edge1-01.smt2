(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:13:33
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr
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
(declare-fun acyclic_graph<Bool> (Set<Edge>) Bool)
(declare-fun unshared_graph<Bool> (Set<Edge>) Bool)
(declare-fun func_graph<Bool> (Set<Edge>) Bool)
(declare-fun edge<Bool> (Set<Edge> $Ref $Ref) Bool)
(declare-fun edge_<Bool> (Set<Edge> $Ref $Ref) Bool)
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
; ---------- FUNCTION $$----------
(declare-fun refs@0@00 () Set<$Ref>)
(declare-fun result@1@00 () Set<Edge>)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const n@5@00 $Ref)
(push) ; 2
; [eval] (n in refs)
(assert (Set_in n@5@00 refs@0@00))
(declare-fun sm@6@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@7@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@8@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@5@00 $Ref) (n2@5@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@5@00 refs@0@00)
      (Set_in n2@5@00 refs@0@00)
      (= n1@5@00 n2@5@00))
    (= n1@5@00 n2@5@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@5@00 $Ref)) (!
  (=>
    (Set_in n@5@00 refs@0@00)
    (and
      (= (inv@7@00 s@$ refs@0@00 n@5@00) n@5@00)
      (img@8@00 s@$ refs@0@00 n@5@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) n@5@00) n@5@00))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@00 s@$ refs@0@00 r)
      (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
    (= (inv@7@00 s@$ refs@0@00 r) r))
  :pattern ((inv@7@00 s@$ refs@0@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@5@00 $Ref)) (!
  (=> (Set_in n@5@00 refs@0@00) (not (= n@5@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) n@5@00) n@5@00))
  :qid |next-permImpliesNonNull|)))
(declare-fun sm@9@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@00 s@$ refs@0@00 r)
      (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
  :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
  :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r) r))
  :pattern ((inv@7@00 s@$ refs@0@00 r))
  :qid |quant-u-6|)))
(declare-const $t@10@00 $Snap)
(assert (= $t@10@00 ($Snap.combine ($Snap.first $t@10@00) ($Snap.second $t@10@00))))
(assert (= ($Snap.first $t@10@00) $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { create_edge(p, s) } ((p in refs) && ((s in refs) && p.next == s)) == (create_edge(p, s) in result))
(declare-const p@11@00 $Ref)
(declare-const s@12@00 $Ref)
(push) ; 2
; [eval] ((p in refs) && ((s in refs) && p.next == s)) == (create_edge(p, s) in result)
; [eval] (p in refs) && ((s in refs) && p.next == s)
; [eval] (p in refs)
(push) ; 3
; [then-branch: 0 | !(p@11@00 in refs@0@00) | live]
; [else-branch: 0 | p@11@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 0 | !(p@11@00 in refs@0@00)]
(assert (not (Set_in p@11@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | p@11@00 in refs@0@00]
(assert (Set_in p@11@00 refs@0@00))
; [eval] (s in refs)
(push) ; 5
; [then-branch: 1 | !(s@12@00 in refs@0@00) | live]
; [else-branch: 1 | s@12@00 in refs@0@00 | live]
(push) ; 6
; [then-branch: 1 | !(s@12@00 in refs@0@00)]
(assert (not (Set_in s@12@00 refs@0@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | s@12@00 in refs@0@00]
(assert (Set_in s@12@00 refs@0@00))
; [eval] p.next == s
(assert (and
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
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) p@11@00) p@11@00))
(push) ; 7
(assert (not (and
  (img@8@00 s@$ refs@0@00 p@11@00)
  (Set_in (inv@7@00 s@$ refs@0@00 p@11@00) refs@0@00))))
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
    (and
      (img@8@00 s@$ refs@0@00 r)
      (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
  :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
  :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (Set_in s@12@00 refs@0@00)
  (and
    (Set_in s@12@00 refs@0@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) p@11@00) p@11@00))))
(assert (or (Set_in s@12@00 refs@0@00) (not (Set_in s@12@00 refs@0@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@00 s@$ refs@0@00 r)
      (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
  :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
  :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (Set_in p@11@00 refs@0@00)
  (and
    (Set_in p@11@00 refs@0@00)
    (=>
      (Set_in s@12@00 refs@0@00)
      (and
        (Set_in s@12@00 refs@0@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) p@11@00) p@11@00)))
    (or (Set_in s@12@00 refs@0@00) (not (Set_in s@12@00 refs@0@00))))))
(assert (or (Set_in p@11@00 refs@0@00) (not (Set_in p@11@00 refs@0@00))))
; [eval] (create_edge(p, s) in result)
; [eval] create_edge(p, s)
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@00 s@$ refs@0@00 r)
      (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
  :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
  :pattern (($FVF.lookup_next (sm@9@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@11@00 $Ref) (s@12@00 $Ref)) (!
  (and
    (=>
      (Set_in p@11@00 refs@0@00)
      (and
        (Set_in p@11@00 refs@0@00)
        (=>
          (Set_in s@12@00 refs@0@00)
          (and
            (Set_in s@12@00 refs@0@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) p@11@00) p@11@00)))
        (or (Set_in s@12@00 refs@0@00) (not (Set_in s@12@00 refs@0@00)))))
    (or (Set_in p@11@00 refs@0@00) (not (Set_in p@11@00 refs@0@00))))
  :pattern ((create_edge<Edge> p@11@00 s@12@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@188@13@192@44-aux|)))
(assert (forall ((p@11@00 $Ref) (s@12@00 $Ref)) (!
  (=
    (and
      (Set_in p@11@00 refs@0@00)
      (and
        (Set_in s@12@00 refs@0@00)
        (= ($FVF.lookup_next (sm@9@00 s@$ refs@0@00) p@11@00) s@12@00)))
    (Set_in (create_edge<Edge> p@11@00 s@12@00) result@1@00))
  :pattern ((create_edge<Edge> p@11@00 s@12@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@188@13@192@44|)))
(assert (=
  ($Snap.second $t@10@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@00))
    ($Snap.second ($Snap.second $t@10@00)))))
(assert (= ($Snap.first ($Snap.second $t@10@00)) $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { (p in refs), (s in refs), exists_path(result, p, s) } (p in refs) && exists_path(result, p, s) ==> (s in refs))
(declare-const p@13@00 $Ref)
(declare-const s@14@00 $Ref)
(push) ; 2
; [eval] (p in refs) && exists_path(result, p, s) ==> (s in refs)
; [eval] (p in refs) && exists_path(result, p, s)
; [eval] (p in refs)
(push) ; 3
; [then-branch: 2 | !(p@13@00 in refs@0@00) | live]
; [else-branch: 2 | p@13@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 2 | !(p@13@00 in refs@0@00)]
(assert (not (Set_in p@13@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | p@13@00 in refs@0@00]
(assert (Set_in p@13@00 refs@0@00))
; [eval] exists_path(result, p, s)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in p@13@00 refs@0@00) (not (Set_in p@13@00 refs@0@00))))
(push) ; 3
; [then-branch: 3 | p@13@00 in refs@0@00 && exists_path[Bool](result@1@00, p@13@00, s@14@00) | live]
; [else-branch: 3 | !(p@13@00 in refs@0@00 && exists_path[Bool](result@1@00, p@13@00, s@14@00)) | live]
(push) ; 4
; [then-branch: 3 | p@13@00 in refs@0@00 && exists_path[Bool](result@1@00, p@13@00, s@14@00)]
(assert (and (Set_in p@13@00 refs@0@00) (exists_path<Bool> result@1@00 p@13@00 s@14@00)))
; [eval] (s in refs)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(p@13@00 in refs@0@00 && exists_path[Bool](result@1@00, p@13@00, s@14@00))]
(assert (not
  (and
    (Set_in p@13@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@13@00 s@14@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in p@13@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@13@00 s@14@00)))
  (and
    (Set_in p@13@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@13@00 s@14@00))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@13@00 $Ref) (s@14@00 $Ref)) (!
  (and
    (or (Set_in p@13@00 refs@0@00) (not (Set_in p@13@00 refs@0@00)))
    (or
      (not
        (and
          (Set_in p@13@00 refs@0@00)
          (exists_path<Bool> result@1@00 p@13@00 s@14@00)))
      (and
        (Set_in p@13@00 refs@0@00)
        (exists_path<Bool> result@1@00 p@13@00 s@14@00))))
  :pattern ((Set_in p@13@00 refs@0@00) (Set_in s@14@00 refs@0@00) (exists_path<Bool> result@1@00 p@13@00 s@14@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@195@13@197@63-aux|)))
(assert (forall ((p@13@00 $Ref) (s@14@00 $Ref)) (!
  (=>
    (and
      (Set_in p@13@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@13@00 s@14@00))
    (Set_in s@14@00 refs@0@00))
  :pattern ((Set_in p@13@00 refs@0@00) (Set_in s@14@00 refs@0@00) (exists_path<Bool> result@1@00 p@13@00 s@14@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@195@13@197@63|)))
(assert (= ($Snap.second ($Snap.second $t@10@00)) $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { (p in refs), (s in refs), exists_path(result, p, s) } (s in refs) && exists_path(result, p, s) ==> (p in refs))
(declare-const p@15@00 $Ref)
(declare-const s@16@00 $Ref)
(push) ; 2
; [eval] (s in refs) && exists_path(result, p, s) ==> (p in refs)
; [eval] (s in refs) && exists_path(result, p, s)
; [eval] (s in refs)
(push) ; 3
; [then-branch: 4 | !(s@16@00 in refs@0@00) | live]
; [else-branch: 4 | s@16@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 4 | !(s@16@00 in refs@0@00)]
(assert (not (Set_in s@16@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | s@16@00 in refs@0@00]
(assert (Set_in s@16@00 refs@0@00))
; [eval] exists_path(result, p, s)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s@16@00 refs@0@00) (not (Set_in s@16@00 refs@0@00))))
(push) ; 3
; [then-branch: 5 | s@16@00 in refs@0@00 && exists_path[Bool](result@1@00, p@15@00, s@16@00) | live]
; [else-branch: 5 | !(s@16@00 in refs@0@00 && exists_path[Bool](result@1@00, p@15@00, s@16@00)) | live]
(push) ; 4
; [then-branch: 5 | s@16@00 in refs@0@00 && exists_path[Bool](result@1@00, p@15@00, s@16@00)]
(assert (and (Set_in s@16@00 refs@0@00) (exists_path<Bool> result@1@00 p@15@00 s@16@00)))
; [eval] (p in refs)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(s@16@00 in refs@0@00 && exists_path[Bool](result@1@00, p@15@00, s@16@00))]
(assert (not
  (and
    (Set_in s@16@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@15@00 s@16@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s@16@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@15@00 s@16@00)))
  (and
    (Set_in s@16@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@15@00 s@16@00))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@15@00 $Ref) (s@16@00 $Ref)) (!
  (and
    (or (Set_in s@16@00 refs@0@00) (not (Set_in s@16@00 refs@0@00)))
    (or
      (not
        (and
          (Set_in s@16@00 refs@0@00)
          (exists_path<Bool> result@1@00 p@15@00 s@16@00)))
      (and
        (Set_in s@16@00 refs@0@00)
        (exists_path<Bool> result@1@00 p@15@00 s@16@00))))
  :pattern ((Set_in p@15@00 refs@0@00) (Set_in s@16@00 refs@0@00) (exists_path<Bool> result@1@00 p@15@00 s@16@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@198@13@200@63-aux|)))
(assert (forall ((p@15@00 $Ref) (s@16@00 $Ref)) (!
  (=>
    (and
      (Set_in s@16@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@15@00 s@16@00))
    (Set_in p@15@00 refs@0@00))
  :pattern ((Set_in p@15@00 refs@0@00) (Set_in s@16@00 refs@0@00) (exists_path<Bool> result@1@00 p@15@00 s@16@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@198@13@200@63|)))
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
; ---------- FUNCTION apply_TCFraming----------
(declare-fun g0@2@00 () Set<$Ref>)
(declare-fun g1@3@00 () Set<$Ref>)
(declare-fun result@4@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const n@17@00 $Ref)
(push) ; 2
; [eval] (n in g0)
(assert (Set_in n@17@00 g0@2@00))
(declare-fun sm@18@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@19@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@20@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@17@00 $Ref) (n2@17@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@17@00 g0@2@00)
      (Set_in n2@17@00 g0@2@00)
      (= n1@17@00 n2@17@00))
    (= n1@17@00 n2@17@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@17@00 $Ref)) (!
  (=>
    (Set_in n@17@00 g0@2@00)
    (and
      (= (inv@19@00 s@$ g0@2@00 g1@3@00 n@17@00) n@17@00)
      (img@20@00 s@$ g0@2@00 g1@3@00 n@17@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) n@17@00) n@17@00))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@19@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@19@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@17@00 $Ref)) (!
  (=> (Set_in n@17@00 g0@2@00) (not (= n@17@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) n@17@00) n@17@00))
  :qid |next-permImpliesNonNull|)))
(declare-fun sm@21@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@21@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@21@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
  :pattern (($FVF.lookup_next (sm@21@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@21@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@19@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-13|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const n@22@00 $Ref)
(push) ; 2
; [eval] (n in g1)
(assert (Set_in n@22@00 g1@3@00))
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@23@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@24@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@22@00 $Ref) (n2@22@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@22@00 g1@3@00)
      (Set_in n2@22@00 g1@3@00)
      (= n1@22@00 n2@22@00))
    (= n1@22@00 n2@22@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@22@00 $Ref)) (!
  (=>
    (Set_in n@22@00 g1@3@00)
    (and
      (= (inv@23@00 s@$ g0@2@00 g1@3@00 n@22@00) n@22@00)
      (img@24@00 s@$ g0@2@00 g1@3@00 n@22@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@22@00) n@22@00))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@23@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@23@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@22@00 $Ref)) (!
  (=> (Set_in n@22@00 g1@3@00) (not (= n@22@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@22@00) n@22@00))
  :qid |next-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= n@22@00 n@17@00)
    (=
      (and
        (img@24@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
      (and
        (img@20@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))))
  
  :qid |quant-u-16|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@25@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@23@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-17|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] (g1 intersection g0) == Set[Ref]()
; [eval] (g1 intersection g0)
; [eval] Set[Ref]()
(assert (Set_equal (Set_intersection g1@3@00 g0@2@00) (as Set_empty  Set<$Ref>)))
(declare-const $t@26@00 $Snap)
(assert (= $t@26@00 ($Snap.combine ($Snap.first $t@26@00) ($Snap.second $t@26@00))))
(assert (= ($Snap.first $t@26@00) $Snap.unit))
; [eval] (g0 union g1) == (g1 union g0)
; [eval] (g0 union g1)
; [eval] (g1 union g0)
(assert (Set_equal (Set_union g0@2@00 g1@3@00) (Set_union g1@3@00 g0@2@00)))
(assert (=
  ($Snap.second $t@26@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@00))
    ($Snap.second ($Snap.second $t@26@00)))))
(assert (= ($Snap.first ($Snap.second $t@26@00)) $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g0), u, v) } { exists_path($$((g0 union g1)), u, v) } (u in g0) && ((v in g0) && exists_path($$(g0), u, v)) ==> exists_path($$((g0 union g1)), u, v))
(declare-const u@27@00 $Ref)
(declare-const v@28@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (u in g0) && ((v in g0) && exists_path($$(g0), u, v)) ==> exists_path($$((g0 union g1)), u, v)
; [eval] (u in g0) && ((v in g0) && exists_path($$(g0), u, v))
; [eval] (u in g0)
(push) ; 3
; [then-branch: 6 | !(u@27@00 in g0@2@00) | live]
; [else-branch: 6 | u@27@00 in g0@2@00 | live]
(push) ; 4
; [then-branch: 6 | !(u@27@00 in g0@2@00)]
(assert (not (Set_in u@27@00 g0@2@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | u@27@00 in g0@2@00]
(assert (Set_in u@27@00 g0@2@00))
; [eval] (v in g0)
(push) ; 5
; [then-branch: 7 | !(v@28@00 in g0@2@00) | live]
; [else-branch: 7 | v@28@00 in g0@2@00 | live]
(push) ; 6
; [then-branch: 7 | !(v@28@00 in g0@2@00)]
(assert (not (Set_in v@28@00 g0@2@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | v@28@00 in g0@2@00]
(assert (Set_in v@28@00 g0@2@00))
; [eval] exists_path($$(g0), u, v)
; [eval] $$(g0)
(push) ; 7
(declare-const n@29@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@29@00 g0@2@00))
(pop) ; 8
(declare-fun inv@30@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@31@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@29@00 $Ref) (n2@29@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@29@00 g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) n1@29@00) n1@29@00))
      (and
        (Set_in n2@29@00 g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) n2@29@00) n2@29@00))
      (= n1@29@00 n2@29@00))
    (= n1@29@00 n2@29@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@29@00 $Ref)) (!
  (=>
    (Set_in n@29@00 g0@2@00)
    (and
      (= (inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00) n@29@00)
      (img@31@00 s@$ g0@2@00 g1@3@00 n@29@00)))
  :pattern ((Set_in n@29@00 g0@2@00))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :pattern ((img@31@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@30@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-19|)))
; Precomputing data for removing quantified permissions
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
        (and
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@31@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@30@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@31@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@30@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-22|))))
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
    (and
      (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@31@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@30@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@31@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@30@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@32@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef12|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((n@29@00 $Ref)) (!
  (=>
    (Set_in n@29@00 g0@2@00)
    (and
      (= (inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00) n@29@00)
      (img@31@00 s@$ g0@2@00 g1@3@00 n@29@00)))
  :pattern ((Set_in n@29@00 g0@2@00))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :pattern ((img@31@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@30@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-19|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((n@29@00 $Ref)) (!
  (=>
    (Set_in n@29@00 g0@2@00)
    (and
      (= (inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00) n@29@00)
      (img@31@00 s@$ g0@2@00 g1@3@00 n@29@00)))
  :pattern ((Set_in n@29@00 g0@2@00))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :pattern ((img@31@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@30@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (=>
  (Set_in v@28@00 g0@2@00)
  (and
    (Set_in v@28@00 g0@2@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-19|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00))))
(assert (or (Set_in v@28@00 g0@2@00) (not (Set_in v@28@00 g0@2@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((n@29@00 $Ref)) (!
  (=>
    (Set_in n@29@00 g0@2@00)
    (and
      (= (inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00) n@29@00)
      (img@31@00 s@$ g0@2@00 g1@3@00 n@29@00)))
  :pattern ((Set_in n@29@00 g0@2@00))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :pattern ((img@31@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@30@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (=>
  (Set_in u@27@00 g0@2@00)
  (and
    (Set_in u@27@00 g0@2@00)
    (=>
      (Set_in v@28@00 g0@2@00)
      (and
        (Set_in v@28@00 g0@2@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-19|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
    (or (Set_in v@28@00 g0@2@00) (not (Set_in v@28@00 g0@2@00))))))
(assert (or (Set_in u@27@00 g0@2@00) (not (Set_in u@27@00 g0@2@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | u@27@00 in g0@2@00 && v@28@00 in g0@2@00 && exists_path[Bool]($$(sm@32@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@27@00, v@28@00) | live]
; [else-branch: 8 | !(u@27@00 in g0@2@00 && v@28@00 in g0@2@00 && exists_path[Bool]($$(sm@32@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@27@00, v@28@00)) | live]
(push) ; 4
; [then-branch: 8 | u@27@00 in g0@2@00 && v@28@00 in g0@2@00 && exists_path[Bool]($$(sm@32@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@27@00, v@28@00)]
(assert (and
  (Set_in u@27@00 g0@2@00)
  (and
    (Set_in v@28@00 g0@2@00)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00))))
; [eval] exists_path($$((g0 union g1)), u, v)
; [eval] $$((g0 union g1))
; [eval] (g0 union g1)
(push) ; 5
(declare-const n@33@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@33@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 6
(declare-fun inv@34@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@35@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@36@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef15|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@33@00 $Ref) (n2@33@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@33@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) n1@33@00) n1@33@00))
      (and
        (Set_in n2@33@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) n2@33@00) n2@33@00))
      (= n1@33@00 n2@33@00))
    (= n1@33@00 n2@33@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@33@00 $Ref)) (!
  (=>
    (Set_in n@33@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00) n@33@00)
      (img@35@00 s@$ g0@2@00 g1@3@00 n@33@00)))
  :pattern ((Set_in n@33@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00))
  :pattern ((img@35@00 s@$ g0@2@00 g1@3@00 n@33@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@34@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-25|)))
; Precomputing data for removing quantified permissions
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
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@35@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-27|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@35@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-28|))))
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
    (and
      (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@35@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@35@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@24@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@35@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@24@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@35@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@20@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@35@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@35@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-31|))))
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
    (and
      (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@35@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@35@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@35@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@24@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@35@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@34@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@20@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@37@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef19|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@37@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef18|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((n@33@00 $Ref)) (!
  (=>
    (Set_in n@33@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00) n@33@00)
      (img@35@00 s@$ g0@2@00 g1@3@00 n@33@00)))
  :pattern ((Set_in n@33@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00))
  :pattern ((img@35@00 s@$ g0@2@00 g1@3@00 n@33@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@34@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef19|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@37@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_next ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-25|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 8 | !(u@27@00 in g0@2@00 && v@28@00 in g0@2@00 && exists_path[Bool]($$(sm@32@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@27@00, v@28@00))]
(assert (not
  (and
    (Set_in u@27@00 g0@2@00)
    (and
      (Set_in v@28@00 g0@2@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((n@33@00 $Ref)) (!
  (=>
    (Set_in n@33@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00) n@33@00)
      (img@35@00 s@$ g0@2@00 g1@3@00 n@33@00)))
  :pattern ((Set_in n@33@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00))
  :pattern ((img@35@00 s@$ g0@2@00 g1@3@00 n@33@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@34@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef19|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@37@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (=>
  (and
    (Set_in u@27@00 g0@2@00)
    (and
      (Set_in v@28@00 g0@2@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)))
  (and
    (Set_in u@27@00 g0@2@00)
    (Set_in v@28@00 g0@2@00)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-25|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@27@00 g0@2@00)
      (and
        (Set_in v@28@00 g0@2@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00))))
  (and
    (Set_in u@27@00 g0@2@00)
    (and
      (Set_in v@28@00 g0@2@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@29@00 $Ref)) (!
  (=>
    (Set_in n@29@00 g0@2@00)
    (and
      (= (inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00) n@29@00)
      (img@31@00 s@$ g0@2@00 g1@3@00 n@29@00)))
  :pattern ((Set_in n@29@00 g0@2@00))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :pattern ((img@31@00 s@$ g0@2@00 g1@3@00 n@29@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@30@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@32@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((n@33@00 $Ref)) (!
  (=>
    (Set_in n@33@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00) n@33@00)
      (img@35@00 s@$ g0@2@00 g1@3@00 n@33@00)))
  :pattern ((Set_in n@33@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 n@33@00))
  :pattern ((img@35@00 s@$ g0@2@00 g1@3@00 n@33@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@34@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef19|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@37@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@27@00 $Ref) (v@28@00 $Ref)) (!
  (and
    (=>
      (Set_in u@27@00 g0@2@00)
      (and
        (Set_in u@27@00 g0@2@00)
        (=>
          (Set_in v@28@00 g0@2@00)
          (and
            (Set_in v@28@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-19|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@28@00 g0@2@00) (not (Set_in v@28@00 g0@2@00)))))
    (or (Set_in u@27@00 g0@2@00) (not (Set_in u@27@00 g0@2@00)))
    (=>
      (and
        (Set_in u@27@00 g0@2@00)
        (and
          (Set_in v@28@00 g0@2@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)))
      (and
        (Set_in u@27@00 g0@2@00)
        (Set_in v@28@00 g0@2@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-25|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@27@00 g0@2@00)
          (and
            (Set_in v@28@00 g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00))))
      (and
        (Set_in u@27@00 g0@2@00)
        (and
          (Set_in v@28@00 g0@2@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@240@13@240@182-aux|)))
(assert (forall ((u@27@00 $Ref) (v@28@00 $Ref)) (!
  (and
    (=>
      (Set_in u@27@00 g0@2@00)
      (and
        (Set_in u@27@00 g0@2@00)
        (=>
          (Set_in v@28@00 g0@2@00)
          (and
            (Set_in v@28@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@30@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@25@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@30@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-19|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@28@00 g0@2@00) (not (Set_in v@28@00 g0@2@00)))))
    (or (Set_in u@27@00 g0@2@00) (not (Set_in u@27@00 g0@2@00)))
    (=>
      (and
        (Set_in u@27@00 g0@2@00)
        (and
          (Set_in v@28@00 g0@2@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)))
      (and
        (Set_in u@27@00 g0@2@00)
        (Set_in v@28@00 g0@2@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@34@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@36@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@34@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-25|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@27@00 g0@2@00)
          (and
            (Set_in v@28@00 g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00))))
      (and
        (Set_in u@27@00 g0@2@00)
        (and
          (Set_in v@28@00 g0@2@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@27@00 v@28@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@240@13@240@182-aux|)))
(assert (forall ((u@27@00 $Ref) (v@28@00 $Ref)) (!
  (=>
    (and
      (Set_in u@27@00 g0@2@00)
      (and
        (Set_in v@28@00 g0@2@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00)))
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@27@00 v@28@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@32@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@27@00 v@28@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@37@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@27@00 v@28@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@240@13@240@182|)))
(assert (=
  ($Snap.second ($Snap.second $t@26@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@26@00))) $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g1), u, v) } { exists_path($$((g1 union g0)), u, v) } (u in g1) && ((v in g1) && exists_path($$(g1), u, v)) ==> exists_path($$((g1 union g0)), u, v))
(declare-const u@38@00 $Ref)
(declare-const v@39@00 $Ref)
(push) ; 2
; [eval] (u in g1) && ((v in g1) && exists_path($$(g1), u, v)) ==> exists_path($$((g1 union g0)), u, v)
; [eval] (u in g1) && ((v in g1) && exists_path($$(g1), u, v))
; [eval] (u in g1)
(push) ; 3
; [then-branch: 9 | !(u@38@00 in g1@3@00) | live]
; [else-branch: 9 | u@38@00 in g1@3@00 | live]
(push) ; 4
; [then-branch: 9 | !(u@38@00 in g1@3@00)]
(assert (not (Set_in u@38@00 g1@3@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | u@38@00 in g1@3@00]
(assert (Set_in u@38@00 g1@3@00))
; [eval] (v in g1)
(push) ; 5
; [then-branch: 10 | !(v@39@00 in g1@3@00) | live]
; [else-branch: 10 | v@39@00 in g1@3@00 | live]
(push) ; 6
; [then-branch: 10 | !(v@39@00 in g1@3@00)]
(assert (not (Set_in v@39@00 g1@3@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | v@39@00 in g1@3@00]
(assert (Set_in v@39@00 g1@3@00))
; [eval] exists_path($$(g1), u, v)
; [eval] $$(g1)
(push) ; 7
(declare-const n@40@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@40@00 g1@3@00))
(pop) ; 8
(declare-fun inv@41@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@42@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@43@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@40@00 $Ref) (n2@40@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@40@00 g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) n1@40@00) n1@40@00))
      (and
        (Set_in n2@40@00 g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) n2@40@00) n2@40@00))
      (= n1@40@00 n2@40@00))
    (= n1@40@00 n2@40@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@40@00 $Ref)) (!
  (=>
    (Set_in n@40@00 g1@3@00)
    (and
      (= (inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00) n@40@00)
      (img@42@00 s@$ g0@2@00 g1@3@00 n@40@00)))
  :pattern ((Set_in n@40@00 g1@3@00))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :pattern ((img@42@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@41@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-34|)))
; Precomputing data for removing quantified permissions
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
        (and
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@42@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@42@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@42@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@42@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@24@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@42@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@24@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                (img@42@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@20@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@42@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@42@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-40|))))
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
    (and
      (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@42@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@42@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@42@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@24@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                  (img@42@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@41@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@20@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@44@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef26|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((n@40@00 $Ref)) (!
  (=>
    (Set_in n@40@00 g1@3@00)
    (and
      (= (inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00) n@40@00)
      (img@42@00 s@$ g0@2@00 g1@3@00 n@40@00)))
  :pattern ((Set_in n@40@00 g1@3@00))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :pattern ((img@42@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@41@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-34|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((n@40@00 $Ref)) (!
  (=>
    (Set_in n@40@00 g1@3@00)
    (and
      (= (inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00) n@40@00)
      (img@42@00 s@$ g0@2@00 g1@3@00 n@40@00)))
  :pattern ((Set_in n@40@00 g1@3@00))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :pattern ((img@42@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@41@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert (=>
  (Set_in v@39@00 g1@3@00)
  (and
    (Set_in v@39@00 g1@3@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-34|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00))))
(assert (or (Set_in v@39@00 g1@3@00) (not (Set_in v@39@00 g1@3@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((n@40@00 $Ref)) (!
  (=>
    (Set_in n@40@00 g1@3@00)
    (and
      (= (inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00) n@40@00)
      (img@42@00 s@$ g0@2@00 g1@3@00 n@40@00)))
  :pattern ((Set_in n@40@00 g1@3@00))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :pattern ((img@42@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@41@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert (=>
  (Set_in u@38@00 g1@3@00)
  (and
    (Set_in u@38@00 g1@3@00)
    (=>
      (Set_in v@39@00 g1@3@00)
      (and
        (Set_in v@39@00 g1@3@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-34|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
    (or (Set_in v@39@00 g1@3@00) (not (Set_in v@39@00 g1@3@00))))))
(assert (or (Set_in u@38@00 g1@3@00) (not (Set_in u@38@00 g1@3@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | u@38@00 in g1@3@00 && v@39@00 in g1@3@00 && exists_path[Bool]($$(sm@44@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@38@00, v@39@00) | live]
; [else-branch: 11 | !(u@38@00 in g1@3@00 && v@39@00 in g1@3@00 && exists_path[Bool]($$(sm@44@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@38@00, v@39@00)) | live]
(push) ; 4
; [then-branch: 11 | u@38@00 in g1@3@00 && v@39@00 in g1@3@00 && exists_path[Bool]($$(sm@44@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@38@00, v@39@00)]
(assert (and
  (Set_in u@38@00 g1@3@00)
  (and
    (Set_in v@39@00 g1@3@00)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00))))
; [eval] exists_path($$((g1 union g0)), u, v)
; [eval] $$((g1 union g0))
; [eval] (g1 union g0)
(push) ; 5
(declare-const n@45@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@45@00 (Set_union g1@3@00 g0@2@00)))
(pop) ; 6
(declare-fun inv@46@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@47@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@48@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef29|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@45@00 $Ref) (n2@45@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@45@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) n1@45@00) n1@45@00))
      (and
        (Set_in n2@45@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) n2@45@00) n2@45@00))
      (= n1@45@00 n2@45@00))
    (= n1@45@00 n2@45@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@45@00 $Ref)) (!
  (=>
    (Set_in n@45@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
  :pattern ((Set_in n@45@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-43|)))
; Precomputing data for removing quantified permissions
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
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@47@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@47@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-46|))))
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
    (and
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@47@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@24@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@47@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@24@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                (img@47@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@20@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@47@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@47@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-49|))))
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
    (and
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@47@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@47@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@24@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                  (img@47@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@20@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@49@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef33|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@49@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef32|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((n@45@00 $Ref)) (!
  (=>
    (Set_in n@45@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
  :pattern ((Set_in n@45@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@49@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      ($FVF.loc_next ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-43|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(u@38@00 in g1@3@00 && v@39@00 in g1@3@00 && exists_path[Bool]($$(sm@44@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@38@00, v@39@00))]
(assert (not
  (and
    (Set_in u@38@00 g1@3@00)
    (and
      (Set_in v@39@00 g1@3@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((n@45@00 $Ref)) (!
  (=>
    (Set_in n@45@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
  :pattern ((Set_in n@45@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@49@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (=>
  (and
    (Set_in u@38@00 g1@3@00)
    (and
      (Set_in v@39@00 g1@3@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)))
  (and
    (Set_in u@38@00 g1@3@00)
    (Set_in v@39@00 g1@3@00)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-43|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@38@00 g1@3@00)
      (and
        (Set_in v@39@00 g1@3@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00))))
  (and
    (Set_in u@38@00 g1@3@00)
    (and
      (Set_in v@39@00 g1@3@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((n@40@00 $Ref)) (!
  (=>
    (Set_in n@40@00 g1@3@00)
    (and
      (= (inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00) n@40@00)
      (img@42@00 s@$ g0@2@00 g1@3@00 n@40@00)))
  :pattern ((Set_in n@40@00 g1@3@00))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :pattern ((img@42@00 s@$ g0@2@00 g1@3@00 n@40@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@41@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((n@45@00 $Ref)) (!
  (=>
    (Set_in n@45@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
  :pattern ((Set_in n@45@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@49@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef32|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@38@00 $Ref) (v@39@00 $Ref)) (!
  (and
    (=>
      (Set_in u@38@00 g1@3@00)
      (and
        (Set_in u@38@00 g1@3@00)
        (=>
          (Set_in v@39@00 g1@3@00)
          (and
            (Set_in v@39@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-34|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@39@00 g1@3@00) (not (Set_in v@39@00 g1@3@00)))))
    (or (Set_in u@38@00 g1@3@00) (not (Set_in u@38@00 g1@3@00)))
    (=>
      (and
        (Set_in u@38@00 g1@3@00)
        (and
          (Set_in v@39@00 g1@3@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)))
      (and
        (Set_in u@38@00 g1@3@00)
        (Set_in v@39@00 g1@3@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-43|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@38@00 g1@3@00)
          (and
            (Set_in v@39@00 g1@3@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00))))
      (and
        (Set_in u@38@00 g1@3@00)
        (and
          (Set_in v@39@00 g1@3@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@241@13@241@182-aux|)))
(assert (forall ((u@38@00 $Ref) (v@39@00 $Ref)) (!
  (and
    (=>
      (Set_in u@38@00 g1@3@00)
      (and
        (Set_in u@38@00 g1@3@00)
        (=>
          (Set_in v@39@00 g1@3@00)
          (and
            (Set_in v@39@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@41@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@43@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@41@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-34|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@39@00 g1@3@00) (not (Set_in v@39@00 g1@3@00)))))
    (or (Set_in u@38@00 g1@3@00) (not (Set_in u@38@00 g1@3@00)))
    (=>
      (and
        (Set_in u@38@00 g1@3@00)
        (and
          (Set_in v@39@00 g1@3@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)))
      (and
        (Set_in u@38@00 g1@3@00)
        (Set_in v@39@00 g1@3@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@48@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-43|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@38@00 g1@3@00)
          (and
            (Set_in v@39@00 g1@3@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00))))
      (and
        (Set_in u@38@00 g1@3@00)
        (and
          (Set_in v@39@00 g1@3@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@38@00 v@39@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@241@13@241@182-aux|)))
(assert (forall ((u@38@00 $Ref) (v@39@00 $Ref)) (!
  (=>
    (and
      (Set_in u@38@00 g1@3@00)
      (and
        (Set_in v@39@00 g1@3@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00)))
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@38@00 v@39@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@44@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@38@00 v@39@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@49@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@38@00 v@39@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@241@13@241@182|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@26@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@00))))
  $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g0), u, v) } { exists_path($$((g0 union g1)), u, v) } (u in g0) && ((v in g0) && !exists_path($$(g0), u, v)) ==> !exists_path($$((g0 union g1)), u, v))
(declare-const u@50@00 $Ref)
(declare-const v@51@00 $Ref)
(push) ; 2
; [eval] (u in g0) && ((v in g0) && !exists_path($$(g0), u, v)) ==> !exists_path($$((g0 union g1)), u, v)
; [eval] (u in g0) && ((v in g0) && !exists_path($$(g0), u, v))
; [eval] (u in g0)
(push) ; 3
; [then-branch: 12 | !(u@50@00 in g0@2@00) | live]
; [else-branch: 12 | u@50@00 in g0@2@00 | live]
(push) ; 4
; [then-branch: 12 | !(u@50@00 in g0@2@00)]
(assert (not (Set_in u@50@00 g0@2@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | u@50@00 in g0@2@00]
(assert (Set_in u@50@00 g0@2@00))
; [eval] (v in g0)
(push) ; 5
; [then-branch: 13 | !(v@51@00 in g0@2@00) | live]
; [else-branch: 13 | v@51@00 in g0@2@00 | live]
(push) ; 6
; [then-branch: 13 | !(v@51@00 in g0@2@00)]
(assert (not (Set_in v@51@00 g0@2@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | v@51@00 in g0@2@00]
(assert (Set_in v@51@00 g0@2@00))
; [eval] !exists_path($$(g0), u, v)
; [eval] exists_path($$(g0), u, v)
; [eval] $$(g0)
(push) ; 7
(declare-const n@52@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@52@00 g0@2@00))
(pop) ; 8
(declare-fun inv@53@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@54@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@55@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@52@00 $Ref) (n2@52@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@52@00 g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) n1@52@00) n1@52@00))
      (and
        (Set_in n2@52@00 g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) n2@52@00) n2@52@00))
      (= n1@52@00 n2@52@00))
    (= n1@52@00 n2@52@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@52@00 $Ref)) (!
  (=>
    (Set_in n@52@00 g0@2@00)
    (and
      (= (inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00) n@52@00)
      (img@54@00 s@$ g0@2@00 g1@3@00 n@52@00)))
  :pattern ((Set_in n@52@00 g0@2@00))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :pattern ((img@54@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@53@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-52|)))
; Precomputing data for removing quantified permissions
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
        (and
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@54@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@53@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-54|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@54@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@53@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-55|))))
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
    (and
      (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@54@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@53@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@54@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@53@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@56@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef40|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@52@00 $Ref)) (!
  (=>
    (Set_in n@52@00 g0@2@00)
    (and
      (= (inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00) n@52@00)
      (img@54@00 s@$ g0@2@00 g1@3@00 n@52@00)))
  :pattern ((Set_in n@52@00 g0@2@00))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :pattern ((img@54@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@53@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-52|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@52@00 $Ref)) (!
  (=>
    (Set_in n@52@00 g0@2@00)
    (and
      (= (inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00) n@52@00)
      (img@54@00 s@$ g0@2@00 g1@3@00 n@52@00)))
  :pattern ((Set_in n@52@00 g0@2@00))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :pattern ((img@54@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@53@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (=>
  (Set_in v@51@00 g0@2@00)
  (and
    (Set_in v@51@00 g0@2@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-52|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00))))
(assert (or (Set_in v@51@00 g0@2@00) (not (Set_in v@51@00 g0@2@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@52@00 $Ref)) (!
  (=>
    (Set_in n@52@00 g0@2@00)
    (and
      (= (inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00) n@52@00)
      (img@54@00 s@$ g0@2@00 g1@3@00 n@52@00)))
  :pattern ((Set_in n@52@00 g0@2@00))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :pattern ((img@54@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@53@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (=>
  (Set_in u@50@00 g0@2@00)
  (and
    (Set_in u@50@00 g0@2@00)
    (=>
      (Set_in v@51@00 g0@2@00)
      (and
        (Set_in v@51@00 g0@2@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-52|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
    (or (Set_in v@51@00 g0@2@00) (not (Set_in v@51@00 g0@2@00))))))
(assert (or (Set_in u@50@00 g0@2@00) (not (Set_in u@50@00 g0@2@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | u@50@00 in g0@2@00 && v@51@00 in g0@2@00 && !(exists_path[Bool]($$(sm@56@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@50@00, v@51@00)) | live]
; [else-branch: 14 | !(u@50@00 in g0@2@00 && v@51@00 in g0@2@00 && !(exists_path[Bool]($$(sm@56@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@50@00, v@51@00))) | live]
(push) ; 4
; [then-branch: 14 | u@50@00 in g0@2@00 && v@51@00 in g0@2@00 && !(exists_path[Bool]($$(sm@56@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@50@00, v@51@00))]
(assert (and
  (Set_in u@50@00 g0@2@00)
  (and
    (Set_in v@51@00 g0@2@00)
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00)))))
; [eval] !exists_path($$((g0 union g1)), u, v)
; [eval] exists_path($$((g0 union g1)), u, v)
; [eval] $$((g0 union g1))
; [eval] (g0 union g1)
(push) ; 5
(declare-const n@57@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@57@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 6
(declare-fun inv@58@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@59@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@60@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef43|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@57@00 $Ref) (n2@57@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@57@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) n1@57@00) n1@57@00))
      (and
        (Set_in n2@57@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) n2@57@00) n2@57@00))
      (= n1@57@00 n2@57@00))
    (= n1@57@00 n2@57@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@57@00 $Ref)) (!
  (=>
    (Set_in n@57@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00) n@57@00)
      (img@59@00 s@$ g0@2@00 g1@3@00 n@57@00)))
  :pattern ((Set_in n@57@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00))
  :pattern ((img@59@00 s@$ g0@2@00 g1@3@00 n@57@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@58@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-58|)))
; Precomputing data for removing quantified permissions
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
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@59@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-60|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@59@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-61|))))
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
    (and
      (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@59@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@59@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-62|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@24@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@59@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@24@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@59@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@20@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-63|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@59@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@59@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-64|))))
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
    (and
      (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@59@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@59@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@59@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@24@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@59@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@58@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@20@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@61@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef47|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@61@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef46|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@57@00 $Ref)) (!
  (=>
    (Set_in n@57@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00) n@57@00)
      (img@59@00 s@$ g0@2@00 g1@3@00 n@57@00)))
  :pattern ((Set_in n@57@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00))
  :pattern ((img@59@00 s@$ g0@2@00 g1@3@00 n@57@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@58@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@61@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_next ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-58|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 14 | !(u@50@00 in g0@2@00 && v@51@00 in g0@2@00 && !(exists_path[Bool]($$(sm@56@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@50@00, v@51@00)))]
(assert (not
  (and
    (Set_in u@50@00 g0@2@00)
    (and
      (Set_in v@51@00 g0@2@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@57@00 $Ref)) (!
  (=>
    (Set_in n@57@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00) n@57@00)
      (img@59@00 s@$ g0@2@00 g1@3@00 n@57@00)))
  :pattern ((Set_in n@57@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00))
  :pattern ((img@59@00 s@$ g0@2@00 g1@3@00 n@57@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@58@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@61@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (=>
  (and
    (Set_in u@50@00 g0@2@00)
    (and
      (Set_in v@51@00 g0@2@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))))
  (and
    (Set_in u@50@00 g0@2@00)
    (Set_in v@51@00 g0@2@00)
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-58|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@50@00 g0@2@00)
      (and
        (Set_in v@51@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00)))))
  (and
    (Set_in u@50@00 g0@2@00)
    (and
      (Set_in v@51@00 g0@2@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@52@00 $Ref)) (!
  (=>
    (Set_in n@52@00 g0@2@00)
    (and
      (= (inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00) n@52@00)
      (img@54@00 s@$ g0@2@00 g1@3@00 n@52@00)))
  :pattern ((Set_in n@52@00 g0@2@00))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :pattern ((img@54@00 s@$ g0@2@00 g1@3@00 n@52@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@53@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@57@00 $Ref)) (!
  (=>
    (Set_in n@57@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00) n@57@00)
      (img@59@00 s@$ g0@2@00 g1@3@00 n@57@00)))
  :pattern ((Set_in n@57@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 n@57@00))
  :pattern ((img@59@00 s@$ g0@2@00 g1@3@00 n@57@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@58@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@61@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef46|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@50@00 $Ref) (v@51@00 $Ref)) (!
  (and
    (=>
      (Set_in u@50@00 g0@2@00)
      (and
        (Set_in u@50@00 g0@2@00)
        (=>
          (Set_in v@51@00 g0@2@00)
          (and
            (Set_in v@51@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-52|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@51@00 g0@2@00) (not (Set_in v@51@00 g0@2@00)))))
    (or (Set_in u@50@00 g0@2@00) (not (Set_in u@50@00 g0@2@00)))
    (=>
      (and
        (Set_in u@50@00 g0@2@00)
        (and
          (Set_in v@51@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))))
      (and
        (Set_in u@50@00 g0@2@00)
        (Set_in v@51@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-58|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@50@00 g0@2@00)
          (and
            (Set_in v@51@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00)))))
      (and
        (Set_in u@50@00 g0@2@00)
        (and
          (Set_in v@51@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@242@13@242@184-aux|)))
(assert (forall ((u@50@00 $Ref) (v@51@00 $Ref)) (!
  (and
    (=>
      (Set_in u@50@00 g0@2@00)
      (and
        (Set_in u@50@00 g0@2@00)
        (=>
          (Set_in v@51@00 g0@2@00)
          (and
            (Set_in v@51@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@53@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@55@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@53@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-52|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@51@00 g0@2@00) (not (Set_in v@51@00 g0@2@00)))))
    (or (Set_in u@50@00 g0@2@00) (not (Set_in u@50@00 g0@2@00)))
    (=>
      (and
        (Set_in u@50@00 g0@2@00)
        (and
          (Set_in v@51@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))))
      (and
        (Set_in u@50@00 g0@2@00)
        (Set_in v@51@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@58@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@60@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@58@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-58|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@50@00 g0@2@00)
          (and
            (Set_in v@51@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00)))))
      (and
        (Set_in u@50@00 g0@2@00)
        (and
          (Set_in v@51@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@50@00 v@51@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@242@13@242@184-aux|)))
(assert (forall ((u@50@00 $Ref) (v@51@00 $Ref)) (!
  (=>
    (and
      (Set_in u@50@00 g0@2@00)
      (and
        (Set_in v@51@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))))
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@50@00 v@51@00)))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@56@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@50@00 v@51@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@61@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@50@00 v@51@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@242@13@242@184|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@00))))
  $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g1), u, v) } { exists_path($$((g0 union g1)), u, v) } (u in g1) && ((v in g1) && !exists_path($$(g1), u, v)) ==> !exists_path($$((g1 union g0)), u, v))
(declare-const u@62@00 $Ref)
(declare-const v@63@00 $Ref)
(push) ; 2
; [eval] (u in g1) && ((v in g1) && !exists_path($$(g1), u, v)) ==> !exists_path($$((g1 union g0)), u, v)
; [eval] (u in g1) && ((v in g1) && !exists_path($$(g1), u, v))
; [eval] (u in g1)
(push) ; 3
; [then-branch: 15 | !(u@62@00 in g1@3@00) | live]
; [else-branch: 15 | u@62@00 in g1@3@00 | live]
(push) ; 4
; [then-branch: 15 | !(u@62@00 in g1@3@00)]
(assert (not (Set_in u@62@00 g1@3@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | u@62@00 in g1@3@00]
(assert (Set_in u@62@00 g1@3@00))
; [eval] (v in g1)
(push) ; 5
; [then-branch: 16 | !(v@63@00 in g1@3@00) | live]
; [else-branch: 16 | v@63@00 in g1@3@00 | live]
(push) ; 6
; [then-branch: 16 | !(v@63@00 in g1@3@00)]
(assert (not (Set_in v@63@00 g1@3@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | v@63@00 in g1@3@00]
(assert (Set_in v@63@00 g1@3@00))
; [eval] !exists_path($$(g1), u, v)
; [eval] exists_path($$(g1), u, v)
; [eval] $$(g1)
(push) ; 7
(declare-const n@64@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@64@00 g1@3@00))
(pop) ; 8
(declare-fun inv@65@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@66@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@67@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@64@00 $Ref) (n2@64@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@64@00 g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) n1@64@00) n1@64@00))
      (and
        (Set_in n2@64@00 g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) n2@64@00) n2@64@00))
      (= n1@64@00 n2@64@00))
    (= n1@64@00 n2@64@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@64@00 $Ref)) (!
  (=>
    (Set_in n@64@00 g1@3@00)
    (and
      (= (inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00) n@64@00)
      (img@66@00 s@$ g0@2@00 g1@3@00 n@64@00)))
  :pattern ((Set_in n@64@00 g1@3@00))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :pattern ((img@66@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@65@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-67|)))
; Precomputing data for removing quantified permissions
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
        (and
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@66@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-69|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@66@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-70|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@66@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@66@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@24@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@66@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@24@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                (img@66@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@20@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@66@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@66@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-73|))))
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
    (and
      (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@66@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@66@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@66@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@24@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                  (img@66@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@65@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@20@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@68@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef54|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@64@00 $Ref)) (!
  (=>
    (Set_in n@64@00 g1@3@00)
    (and
      (= (inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00) n@64@00)
      (img@66@00 s@$ g0@2@00 g1@3@00 n@64@00)))
  :pattern ((Set_in n@64@00 g1@3@00))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :pattern ((img@66@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@65@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef54|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-67|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@64@00 $Ref)) (!
  (=>
    (Set_in n@64@00 g1@3@00)
    (and
      (= (inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00) n@64@00)
      (img@66@00 s@$ g0@2@00 g1@3@00 n@64@00)))
  :pattern ((Set_in n@64@00 g1@3@00))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :pattern ((img@66@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@65@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef54|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (=>
  (Set_in v@63@00 g1@3@00)
  (and
    (Set_in v@63@00 g1@3@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-67|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00))))
(assert (or (Set_in v@63@00 g1@3@00) (not (Set_in v@63@00 g1@3@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@64@00 $Ref)) (!
  (=>
    (Set_in n@64@00 g1@3@00)
    (and
      (= (inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00) n@64@00)
      (img@66@00 s@$ g0@2@00 g1@3@00 n@64@00)))
  :pattern ((Set_in n@64@00 g1@3@00))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :pattern ((img@66@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@65@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef54|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (=>
  (Set_in u@62@00 g1@3@00)
  (and
    (Set_in u@62@00 g1@3@00)
    (=>
      (Set_in v@63@00 g1@3@00)
      (and
        (Set_in v@63@00 g1@3@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-67|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
    (or (Set_in v@63@00 g1@3@00) (not (Set_in v@63@00 g1@3@00))))))
(assert (or (Set_in u@62@00 g1@3@00) (not (Set_in u@62@00 g1@3@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | u@62@00 in g1@3@00 && v@63@00 in g1@3@00 && !(exists_path[Bool]($$(sm@68@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@62@00, v@63@00)) | live]
; [else-branch: 17 | !(u@62@00 in g1@3@00 && v@63@00 in g1@3@00 && !(exists_path[Bool]($$(sm@68@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@62@00, v@63@00))) | live]
(push) ; 4
; [then-branch: 17 | u@62@00 in g1@3@00 && v@63@00 in g1@3@00 && !(exists_path[Bool]($$(sm@68@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@62@00, v@63@00))]
(assert (and
  (Set_in u@62@00 g1@3@00)
  (and
    (Set_in v@63@00 g1@3@00)
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00)))))
; [eval] !exists_path($$((g1 union g0)), u, v)
; [eval] exists_path($$((g1 union g0)), u, v)
; [eval] $$((g1 union g0))
; [eval] (g1 union g0)
(push) ; 5
(declare-const n@69@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@69@00 (Set_union g1@3@00 g0@2@00)))
(pop) ; 6
(declare-fun inv@70@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@71@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@72@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef57|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@69@00 $Ref) (n2@69@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@69@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) n1@69@00) n1@69@00))
      (and
        (Set_in n2@69@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) n2@69@00) n2@69@00))
      (= n1@69@00 n2@69@00))
    (= n1@69@00 n2@69@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@69@00 $Ref)) (!
  (=>
    (Set_in n@69@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00) n@69@00)
      (img@71@00 s@$ g0@2@00 g1@3@00 n@69@00)))
  :pattern ((Set_in n@69@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00))
  :pattern ((img@71@00 s@$ g0@2@00 g1@3@00 n@69@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@70@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-76|)))
; Precomputing data for removing quantified permissions
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
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@71@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-78|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@71@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-79|))))
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
    (and
      (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@71@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@71@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-80|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@24@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@71@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@24@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                (img@71@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@20@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-81|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@71@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@71@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-82|))))
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
    (and
      (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@71@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@71@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@71@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@24@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                  (img@71@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@70@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@20@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-83|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@73@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef61|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@73@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef60|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (forall ((n@69@00 $Ref)) (!
  (=>
    (Set_in n@69@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00) n@69@00)
      (img@71@00 s@$ g0@2@00 g1@3@00 n@69@00)))
  :pattern ((Set_in n@69@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00))
  :pattern ((img@71@00 s@$ g0@2@00 g1@3@00 n@69@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@70@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@73@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      ($FVF.loc_next ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-76|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 17 | !(u@62@00 in g1@3@00 && v@63@00 in g1@3@00 && !(exists_path[Bool]($$(sm@68@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@62@00, v@63@00)))]
(assert (not
  (and
    (Set_in u@62@00 g1@3@00)
    (and
      (Set_in v@63@00 g1@3@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (forall ((n@69@00 $Ref)) (!
  (=>
    (Set_in n@69@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00) n@69@00)
      (img@71@00 s@$ g0@2@00 g1@3@00 n@69@00)))
  :pattern ((Set_in n@69@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00))
  :pattern ((img@71@00 s@$ g0@2@00 g1@3@00 n@69@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@70@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@73@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (=>
  (and
    (Set_in u@62@00 g1@3@00)
    (and
      (Set_in v@63@00 g1@3@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))))
  (and
    (Set_in u@62@00 g1@3@00)
    (Set_in v@63@00 g1@3@00)
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-76|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@62@00 g1@3@00)
      (and
        (Set_in v@63@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00)))))
  (and
    (Set_in u@62@00 g1@3@00)
    (and
      (Set_in v@63@00 g1@3@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))))))
; [eval] exists_path($$((g0 union g1)), u, v)
; [eval] $$((g0 union g1))
; [eval] (g0 union g1)
(push) ; 3
(declare-const n@74@00 $Ref)
(push) ; 4
; [eval] (n in refs)
(assert (Set_in n@74@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 4
(declare-fun inv@75@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@76@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@77@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef64|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n1@74@00 $Ref) (n2@74@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@74@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) n1@74@00) n1@74@00))
      (and
        (Set_in n2@74@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) n2@74@00) n2@74@00))
      (= n1@74@00 n2@74@00))
    (= n1@74@00 n2@74@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@74@00 $Ref)) (!
  (=>
    (Set_in n@74@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@75@00 s@$ g0@2@00 g1@3@00 n@74@00) n@74@00)
      (img@76@00 s@$ g0@2@00 g1@3@00 n@74@00)))
  :pattern ((Set_in n@74@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 n@74@00))
  :pattern ((img@76@00 s@$ g0@2@00 g1@3@00 n@74@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@76@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@75@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-85|)))
; Precomputing data for removing quantified permissions
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
          (img@20@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@76@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@20@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@20@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-88|))))
(check-sat)
; unknown
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
      (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@76@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@76@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@20@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@24@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@76@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@24@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@76@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@20@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@24@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@76@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
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
      (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@76@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@76@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@20@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@76@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@24@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@76@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@75@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@20@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-92|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@78@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef68|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@20@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@24@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef67|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@78@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (forall ((n@74@00 $Ref)) (!
  (=>
    (Set_in n@74@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@75@00 s@$ g0@2@00 g1@3@00 n@74@00) n@74@00)
      (img@76@00 s@$ g0@2@00 g1@3@00 n@74@00)))
  :pattern ((Set_in n@74@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 n@74@00))
  :pattern ((img@76@00 s@$ g0@2@00 g1@3@00 n@74@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@76@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@75@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@20@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@24@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef67|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_next ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-85|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@78@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (forall ((n@74@00 $Ref)) (!
  (=>
    (Set_in n@74@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@75@00 s@$ g0@2@00 g1@3@00 n@74@00) n@74@00)
      (img@76@00 s@$ g0@2@00 g1@3@00 n@74@00)))
  :pattern ((Set_in n@74@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 n@74@00))
  :pattern ((img@76@00 s@$ g0@2@00 g1@3@00 n@74@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@76@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@75@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@20@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@24@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-85|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@78@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@64@00 $Ref)) (!
  (=>
    (Set_in n@64@00 g1@3@00)
    (and
      (= (inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00) n@64@00)
      (img@66@00 s@$ g0@2@00 g1@3@00 n@64@00)))
  :pattern ((Set_in n@64@00 g1@3@00))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :pattern ((img@66@00 s@$ g0@2@00 g1@3@00 n@64@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@65@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef54|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (forall ((n@69@00 $Ref)) (!
  (=>
    (Set_in n@69@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00) n@69@00)
      (img@71@00 s@$ g0@2@00 g1@3@00 n@69@00)))
  :pattern ((Set_in n@69@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 n@69@00))
  :pattern ((img@71@00 s@$ g0@2@00 g1@3@00 n@69@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@70@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@73@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (forall ((n@74@00 $Ref)) (!
  (=>
    (Set_in n@74@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@75@00 s@$ g0@2@00 g1@3@00 n@74@00) n@74@00)
      (img@76@00 s@$ g0@2@00 g1@3@00 n@74@00)))
  :pattern ((Set_in n@74@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 n@74@00))
  :pattern ((img@76@00 s@$ g0@2@00 g1@3@00 n@74@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@76@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@75@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@78@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@20@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@19@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@76@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@24@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@23@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@78@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@75@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@77@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@75@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-85|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@78@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@62@00 $Ref) (v@63@00 $Ref)) (!
  (and
    (=>
      (Set_in u@62@00 g1@3@00)
      (and
        (Set_in u@62@00 g1@3@00)
        (=>
          (Set_in v@63@00 g1@3@00)
          (and
            (Set_in v@63@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-67|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@63@00 g1@3@00) (not (Set_in v@63@00 g1@3@00)))))
    (or (Set_in u@62@00 g1@3@00) (not (Set_in u@62@00 g1@3@00)))
    (=>
      (and
        (Set_in u@62@00 g1@3@00)
        (and
          (Set_in v@63@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))))
      (and
        (Set_in u@62@00 g1@3@00)
        (Set_in v@63@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-76|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@62@00 g1@3@00)
          (and
            (Set_in v@63@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00)))))
      (and
        (Set_in u@62@00 g1@3@00)
        (and
          (Set_in v@63@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@243@13@243@184-aux|)))
(assert (forall ((u@62@00 $Ref) (v@63@00 $Ref)) (!
  (and
    (=>
      (Set_in u@62@00 g1@3@00)
      (and
        (Set_in u@62@00 g1@3@00)
        (=>
          (Set_in v@63@00 g1@3@00)
          (and
            (Set_in v@63@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@65@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@67@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@65@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-67|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@63@00 g1@3@00) (not (Set_in v@63@00 g1@3@00)))))
    (or (Set_in u@62@00 g1@3@00) (not (Set_in u@62@00 g1@3@00)))
    (=>
      (and
        (Set_in u@62@00 g1@3@00)
        (and
          (Set_in v@63@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))))
      (and
        (Set_in u@62@00 g1@3@00)
        (Set_in v@63@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@70@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@72@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@70@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-76|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@62@00 g1@3@00)
          (and
            (Set_in v@63@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00)))))
      (and
        (Set_in u@62@00 g1@3@00)
        (and
          (Set_in v@63@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@78@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@62@00 v@63@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@243@13@243@184-aux|)))
(assert (forall ((u@62@00 $Ref) (v@63@00 $Ref)) (!
  (=>
    (and
      (Set_in u@62@00 g1@3@00)
      (and
        (Set_in v@63@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))))
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@73@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@62@00 v@63@00)))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@68@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@62@00 v@63@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@78@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@62@00 v@63@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/delete_edge1.vpr@243@13@243@184|)))
(pop) ; 1
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
  :qid |quant-u-93|)))
; WARNING: (8738,11): 'if' cannot be used in patterns.
; WARNING: (8738,11): 'if' cannot be used in patterns.
; WARNING: (8738,11): 'and' cannot be used in patterns.
; WARNING: (8738,11): 'and' cannot be used in patterns.
; WARNING: (8738,11): 'if' cannot be used in patterns.
; WARNING: (8775,11): 'if' cannot be used in patterns.
; WARNING: (8775,11): 'if' cannot be used in patterns.
; WARNING: (8775,11): 'and' cannot be used in patterns.
; WARNING: (8775,11): 'and' cannot be used in patterns.
; WARNING: (8775,11): 'if' cannot be used in patterns.
; WARNING: (8814,11): 'if' cannot be used in patterns.
; WARNING: (8814,11): 'if' cannot be used in patterns.
; WARNING: (8814,11): 'and' cannot be used in patterns.
; WARNING: (8814,11): 'and' cannot be used in patterns.
; WARNING: (8814,11): 'if' cannot be used in patterns.
; WARNING: (8853,11): 'if' cannot be used in patterns.
; WARNING: (8853,11): 'if' cannot be used in patterns.
; WARNING: (8853,11): 'and' cannot be used in patterns.
; WARNING: (8853,11): 'and' cannot be used in patterns.
; WARNING: (8853,11): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (let ((result@4@00 (apply_TCFraming%limited s@$ g0@2@00 g1@3@00))) true)
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-94|)))
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
  :qid |quant-u-95|)))
; WARNING: (8913,7): 'if' cannot be used in patterns.
; WARNING: (8913,7): 'if' cannot be used in patterns.
; WARNING: (8913,7): 'and' cannot be used in patterns.
; WARNING: (8913,7): 'and' cannot be used in patterns.
; WARNING: (8913,7): 'if' cannot be used in patterns.
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
  :qid |quant-u-96|)))
; WARNING: (8969,7): 'if' cannot be used in patterns.
; WARNING: (8969,7): 'if' cannot be used in patterns.
; WARNING: (8969,7): 'and' cannot be used in patterns.
; WARNING: (8969,7): 'and' cannot be used in patterns.
; WARNING: (8969,7): 'if' cannot be used in patterns.
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
  :qid |quant-u-97|)))
; WARNING: (9026,7): 'if' cannot be used in patterns.
; WARNING: (9026,7): 'if' cannot be used in patterns.
; WARNING: (9026,7): 'and' cannot be used in patterns.
; WARNING: (9026,7): 'and' cannot be used in patterns.
; WARNING: (9026,7): 'if' cannot be used in patterns.
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
  :qid |quant-u-98|)))
; WARNING: (9083,7): 'if' cannot be used in patterns.
; WARNING: (9083,7): 'if' cannot be used in patterns.
; WARNING: (9083,7): 'and' cannot be used in patterns.
; WARNING: (9083,7): 'and' cannot be used in patterns.
; WARNING: (9083,7): 'if' cannot be used in patterns.
